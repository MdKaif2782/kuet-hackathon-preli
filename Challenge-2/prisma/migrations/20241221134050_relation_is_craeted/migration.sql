/*
  Warnings:

  - You are about to drop the column `created_at` on the `Recipe` table. All the data in the column will be lost.
  - You are about to drop the column `cuisine` on the `Recipe` table. All the data in the column will be lost.
  - You are about to drop the column `prep_time` on the `Recipe` table. All the data in the column will be lost.
  - You are about to drop the column `reviews` on the `Recipe` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Recipe" DROP COLUMN "created_at",
DROP COLUMN "cuisine",
DROP COLUMN "prep_time",
DROP COLUMN "reviews";
