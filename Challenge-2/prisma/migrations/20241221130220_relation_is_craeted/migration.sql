/*
  Warnings:

  - The primary key for the `Ingredients` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `ingredients_id` on the `Ingredients` table. All the data in the column will be lost.
  - You are about to drop the `RecipeIngredients` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `ingredients` to the `Recipe` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "RecipeIngredients" DROP CONSTRAINT "RecipeIngredients_ingredients_id_fkey";

-- DropForeignKey
ALTER TABLE "RecipeIngredients" DROP CONSTRAINT "RecipeIngredients_recipe_id_fkey";

-- AlterTable
ALTER TABLE "Ingredients" DROP CONSTRAINT "Ingredients_pkey",
DROP COLUMN "ingredients_id",
ADD COLUMN     "Ingredients_id" SERIAL NOT NULL,
ADD CONSTRAINT "Ingredients_pkey" PRIMARY KEY ("Ingredients_id");

-- AlterTable
ALTER TABLE "Recipe" ADD COLUMN     "ingredients" TEXT NOT NULL;

-- DropTable
DROP TABLE "RecipeIngredients";
