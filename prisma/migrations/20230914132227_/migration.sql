/*
  Warnings:

  - You are about to drop the column `shortCode` on the `team` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[code]` on the table `team` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `code` to the `team` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX "team_shortCode_key";

-- AlterTable
ALTER TABLE "team" DROP COLUMN "shortCode",
ADD COLUMN     "code" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "team_code_key" ON "team"("code");
