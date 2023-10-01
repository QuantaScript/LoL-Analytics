/*
  Warnings:

  - A unique constraint covering the columns `[topId]` on the table `team` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[jungleId]` on the table `team` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[midId]` on the table `team` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[botId]` on the table `team` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[supportId]` on the table `team` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `botId` to the `team` table without a default value. This is not possible if the table is not empty.
  - Added the required column `jungleId` to the `team` table without a default value. This is not possible if the table is not empty.
  - Added the required column `midId` to the `team` table without a default value. This is not possible if the table is not empty.
  - Added the required column `supportId` to the `team` table without a default value. This is not possible if the table is not empty.
  - Added the required column `topId` to the `team` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "team" ADD COLUMN     "botId" TEXT NOT NULL,
ADD COLUMN     "jungleId" TEXT NOT NULL,
ADD COLUMN     "midId" TEXT NOT NULL,
ADD COLUMN     "supportId" TEXT NOT NULL,
ADD COLUMN     "topId" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "team_topId_key" ON "team"("topId");

-- CreateIndex
CREATE UNIQUE INDEX "team_jungleId_key" ON "team"("jungleId");

-- CreateIndex
CREATE UNIQUE INDEX "team_midId_key" ON "team"("midId");

-- CreateIndex
CREATE UNIQUE INDEX "team_botId_key" ON "team"("botId");

-- CreateIndex
CREATE UNIQUE INDEX "team_supportId_key" ON "team"("supportId");

-- AddForeignKey
ALTER TABLE "team" ADD CONSTRAINT "team_topId_fkey" FOREIGN KEY ("topId") REFERENCES "player"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "team" ADD CONSTRAINT "team_jungleId_fkey" FOREIGN KEY ("jungleId") REFERENCES "player"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "team" ADD CONSTRAINT "team_midId_fkey" FOREIGN KEY ("midId") REFERENCES "player"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "team" ADD CONSTRAINT "team_botId_fkey" FOREIGN KEY ("botId") REFERENCES "player"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "team" ADD CONSTRAINT "team_supportId_fkey" FOREIGN KEY ("supportId") REFERENCES "player"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
