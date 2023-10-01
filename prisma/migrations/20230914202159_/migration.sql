/*
  Warnings:

  - A unique constraint covering the columns `[id]` on the table `team` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateTable
CREATE TABLE "player" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "player_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "player_id_key" ON "player"("id");

-- CreateIndex
CREATE UNIQUE INDEX "team_id_key" ON "team"("id");
