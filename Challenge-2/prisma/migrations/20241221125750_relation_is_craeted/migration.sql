/*
  Warnings:

  - The primary key for the `Ingredients` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `Ingredients_id` on the `Ingredients` table. All the data in the column will be lost.
  - You are about to drop the column `ingredients` on the `Recipe` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Ingredients" DROP CONSTRAINT "Ingredients_pkey",
DROP COLUMN "Ingredients_id",
ADD COLUMN     "ingredients_id" SERIAL NOT NULL,
ADD CONSTRAINT "Ingredients_pkey" PRIMARY KEY ("ingredients_id");

-- AlterTable
ALTER TABLE "Recipe" DROP COLUMN "ingredients";

-- CreateTable
CREATE TABLE "RecipeIngredients" (
    "recipe_id" INTEGER NOT NULL,
    "ingredients_id" INTEGER NOT NULL,

    CONSTRAINT "RecipeIngredients_pkey" PRIMARY KEY ("recipe_id","ingredients_id")
);

-- AddForeignKey
ALTER TABLE "RecipeIngredients" ADD CONSTRAINT "RecipeIngredients_recipe_id_fkey" FOREIGN KEY ("recipe_id") REFERENCES "Recipe"("recipe_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RecipeIngredients" ADD CONSTRAINT "RecipeIngredients_ingredients_id_fkey" FOREIGN KEY ("ingredients_id") REFERENCES "Ingredients"("ingredients_id") ON DELETE RESTRICT ON UPDATE CASCADE;
