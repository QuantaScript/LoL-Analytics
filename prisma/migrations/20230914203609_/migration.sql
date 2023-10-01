/*
  Warnings:

  - Added the required column `role` to the `player` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "player" ADD COLUMN     "role" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "team" ADD COLUMN     "playerId" TEXT;

-- AddForeignKey
ALTER TABLE "team" ADD CONSTRAINT "team_playerId_fkey" FOREIGN KEY ("playerId") REFERENCES "player"("id") ON DELETE SET NULL ON UPDATE CASCADE;
