/*
  Warnings:

  - You are about to drop the column `playerId` on the `team` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "team" DROP CONSTRAINT "team_playerId_fkey";

-- AlterTable
ALTER TABLE "team" DROP COLUMN "playerId";
