import prisma from "../db.js";

import "dotenv/config";

export const itemget = async (req, res) => {
  const Data = await prisma.ingredients.findMany({});
  res.status(200).json(Data);
};
export const itemPost = async (req, res) => {
  const { name } = req.body;

  try {
    const Data = await prisma.ingredients.create({
      data: {
        name: JSON.stringify(name),
      },
    });
    res.status(200).json(Data);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Failed to post Ingridients" });
  }
};
export const itemPut = async (req, res) => {
  const { name } = req.body;

  try {
    const Data = await prisma.ingredients.update({
      where: {
        Ingredients_id: parseInt(req.params.id),
      },
      data: {
        name: JSON.stringify(name),
      },
    });
    res.status(200).json(Data);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Failed to Put Ingridients" });
  }
};
