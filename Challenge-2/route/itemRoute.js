import { itemget, itemPost, itemPut } from "../controller/itemControlller.js";
import express from "express";

const itemRouter = express.Router();
itemRouter.put("/:id", itemPut);
itemRouter.get("/", itemget);
itemRouter.post("/", itemPost);

export default itemRouter;
