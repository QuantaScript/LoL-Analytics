/*
  Warnings:

  - You are about to drop the `Draft` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "Draft";

-- CreateTable
CREATE TABLE "team" (
    "id" INTEGER NOT NULL,
    "shortCode" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "team_pkey" PRIMARY KEY ("id")
);
