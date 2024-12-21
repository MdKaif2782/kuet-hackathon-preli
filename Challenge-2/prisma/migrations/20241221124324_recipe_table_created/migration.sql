-- CreateTable
CREATE TABLE "Recipe" (
    "recipe_id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "ingredients" TEXT NOT NULL,
    "cuisine" TEXT NOT NULL,
    "taste" TEXT NOT NULL,
    "prep_time" INTEGER NOT NULL,
    "reviews" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Recipe_pkey" PRIMARY KEY ("recipe_id")
);
