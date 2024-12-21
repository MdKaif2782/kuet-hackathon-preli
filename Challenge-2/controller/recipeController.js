import prisma from "../db.js";
import fs from "fs";
import "dotenv/config";
export const recipeGet = async (req, res) => {
  const Data = await prisma.recipe.findMany({});
  res.status(200).json(Data);
};
export const recipePost = async (req, res) => {
  const { name, ingredients, cuisine, taste, prep_time, reviews } = req.body;

  try {
    const recipe = await prisma.recipe.create({
      data: {
        name,
        ingredients: JSON.stringify(ingredients),
        cuisine,
        taste,
        prep_time,
        reviews,
      },
    });

    // Append recipe to local file
    const recipeText = `Name: ${name}, Ingredients: ${ingredients}, Cuisine: ${cuisine}, Taste: ${taste}, PrepTime: ${prep_time}, Reviews: ${reviews}\n`;
    fs.appendFileSync("my_fav_recipes.txt", recipeText);

    res.status(201).json(recipe);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Failed to add recipe" });
  }
};
