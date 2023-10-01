/*
  Warnings:

  - A unique constraint covering the columns `[shortCode]` on the table `team` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[name]` on the table `team` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "team_shortCode_key" ON "team"("shortCode");

-- CreateIndex
CREATE UNIQUE INDEX "team_name_key" ON "team"("name");
