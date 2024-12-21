-- CreateTable
CREATE TABLE "Ingredients" (
    "Ingredients_id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "quantity" TEXT NOT NULL,
    "expiry_date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Ingredients_pkey" PRIMARY KEY ("Ingredients_id")
);
