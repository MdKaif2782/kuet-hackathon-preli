import { recipeGet, recipePost } from "../controller/recipeController.js";
import express from "express";

const recipeRouter = express.Router();

recipeRouter.get("/", recipeGet);
recipeRouter.post("/", recipePost);

export default recipeRouter;
