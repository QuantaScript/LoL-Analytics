/*
  Warnings:

  - You are about to drop the column `botId` on the `team` table. All the data in the column will be lost.
  - You are about to drop the column `jungleId` on the `team` table. All the data in the column will be lost.
  - You are about to drop the column `midId` on the `team` table. All the data in the column will be lost.
  - You are about to drop the column `supportId` on the `team` table. All the data in the column will be lost.
  - You are about to drop the column `topId` on the `team` table. All the data in the column will be lost.
  - Added the required column `botid` to the `team` table without a default value. This is not possible if the table is not empty.
  - Added the required column `jungleid` to the `team` table without a default value. This is not possible if the table is not empty.
  - Added the required column `midid` to the `team` table without a default value. This is not possible if the table is not empty.
  - Added the required column `supportid` to the `team` table without a default value. This is not possible if the table is not empty.
  - Added the required column `topid` to the `team` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "team" DROP CONSTRAINT "team_botId_fkey";

-- DropForeignKey
ALTER TABLE "team" DROP CONSTRAINT "team_jungleId_fkey";

-- DropForeignKey
ALTER TABLE "team" DROP CONSTRAINT "team_midId_fkey";

-- DropForeignKey
ALTER TABLE "team" DROP CONSTRAINT "team_supportId_fkey";

-- DropForeignKey
ALTER TABLE "team" DROP CONSTRAINT "team_topId_fkey";

-- AlterTable
ALTER TABLE "team" DROP COLUMN "botId",
DROP COLUMN "jungleId",
DROP COLUMN "midId",
DROP COLUMN "supportId",
DROP COLUMN "topId",
ADD COLUMN     "botid" TEXT NOT NULL,
ADD COLUMN     "jungleid" TEXT NOT NULL,
ADD COLUMN     "midid" TEXT NOT NULL,
ADD COLUMN     "supportid" TEXT NOT NULL,
ADD COLUMN     "topid" TEXT NOT NULL;

-- AddForeignKey
ALTER TABLE "team" ADD CONSTRAINT "team_topid_fkey" FOREIGN KEY ("topid") REFERENCES "player"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "team" ADD CONSTRAINT "team_jungleid_fkey" FOREIGN KEY ("jungleid") REFERENCES "player"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "team" ADD CONSTRAINT "team_midid_fkey" FOREIGN KEY ("midid") REFERENCES "player"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "team" ADD CONSTRAINT "team_botid_fkey" FOREIGN KEY ("botid") REFERENCES "player"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "team" ADD CONSTRAINT "team_supportid_fkey" FOREIGN KEY ("supportid") REFERENCES "player"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
