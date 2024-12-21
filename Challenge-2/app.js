import express from "express";
import "dotenv/config";
import { GoogleGenerativeAI } from "@google/generative-ai";
import cors from "cors";
import itemRouter from "./route/itemRoute.js";
import recipeRouter from "./route/recipeRoute.js";
import prisma from "./db.js";
import fs from "fs";
const app = express();
app.use(cors());
const PORT = process.env.PORT;

app.use(express.json());
app.get("/", (req, res) => {
  return res.send("hello");
});
app.use("/api/item", itemRouter);
app.use("/api/recipe", recipeRouter);

const genAI = new GoogleGenerativeAI(process.env.GENAI_API_KEY);
const model = genAI.getGenerativeModel({ model: "gemini-1.5-flash" });

app.post("/generate", async (req, res) => {
  const { preference } = req.body;

  if (!preference) {
    return res.status(400).json({ error: "Preference is required" });
  }

  try {
    const ingredients = await prisma.ingredients.findMany();
    const ingredientList = ingredients.map((i) => i.name).join(", ");

    const recipesText = fs.readFileSync("my_fav_recipes.txt", "utf-8");

    const prompt = `
    User preference: ${preference}
    Ingredients available: ${ingredientList}
    Recipes stored: ${recipesText}
    Please recommend a recipe based on the user's preference and available ingredients.
    Provide the response in 1 line in the following format:
    recipe: <recipe_name>, missing ingredients: <ingredient_1>, <ingredient_2>, <ingredient_3>
    If no ingredients are missing, just return the recipe name with no "missing ingredients" part.
  `;

    const result = await model.generateContent(prompt);

    let cleanedResponse = result.response
      .text()
      .replace(/[\n\r]+/g, " ")
      .trim();

    return res.status(200).json({ response: cleanedResponse });
  } catch (error) {
    console.error("Error generating content:", error);
    return res.status(500).json({ error: "Failed to generate content" });
  }
});

app.listen(PORT, () => {
  console.log(`app is listening on Port ${PORT}`);
});
