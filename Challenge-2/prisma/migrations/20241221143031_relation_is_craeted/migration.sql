/*
  Warnings:

  - Added the required column `cuisine` to the `Recipe` table without a default value. This is not possible if the table is not empty.
  - Added the required column `prep_time` to the `Recipe` table without a default value. This is not possible if the table is not empty.
  - Added the required column `reviews` to the `Recipe` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Recipe" ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "cuisine" TEXT NOT NULL,
ADD COLUMN     "prep_time" INTEGER NOT NULL,
ADD COLUMN     "reviews" INTEGER NOT NULL;
