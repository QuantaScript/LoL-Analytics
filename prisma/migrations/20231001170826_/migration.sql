/*
  Warnings:

  - Added the required column `BB1` to the `draftPlanning` table without a default value. This is not possible if the table is not empty.
  - Added the required column `BB2` to the `draftPlanning` table without a default value. This is not possible if the table is not empty.
  - Added the required column `BB3` to the `draftPlanning` table without a default value. This is not possible if the table is not empty.
  - Added the required column `BB4` to the `draftPlanning` table without a default value. This is not possible if the table is not empty.
  - Added the required column `BB5` to the `draftPlanning` table without a default value. This is not possible if the table is not empty.
  - Added the required column `BP1` to the `draftPlanning` table without a default value. This is not possible if the table is not empty.
  - Added the required column `BP2` to the `draftPlanning` table without a default value. This is not possible if the table is not empty.
  - Added the required column `BP3` to the `draftPlanning` table without a default value. This is not possible if the table is not empty.
  - Added the required column `BP4` to the `draftPlanning` table without a default value. This is not possible if the table is not empty.
  - Added the required column `BP5` to the `draftPlanning` table without a default value. This is not possible if the table is not empty.
  - Added the required column `RB1` to the `draftPlanning` table without a default value. This is not possible if the table is not empty.
  - Added the required column `RB2` to the `draftPlanning` table without a default value. This is not possible if the table is not empty.
  - Added the required column `RB3` to the `draftPlanning` table without a default value. This is not possible if the table is not empty.
  - Added the required column `RB4` to the `draftPlanning` table without a default value. This is not possible if the table is not empty.
  - Added the required column `RB5` to the `draftPlanning` table without a default value. This is not possible if the table is not empty.
  - Added the required column `RP1` to the `draftPlanning` table without a default value. This is not possible if the table is not empty.
  - Added the required column `RP2` to the `draftPlanning` table without a default value. This is not possible if the table is not empty.
  - Added the required column `RP3` to the `draftPlanning` table without a default value. This is not possible if the table is not empty.
  - Added the required column `RP4` to the `draftPlanning` table without a default value. This is not possible if the table is not empty.
  - Added the required column `RP5` to the `draftPlanning` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "draftPlanning" ADD COLUMN     "BB1" INTEGER NOT NULL,
ADD COLUMN     "BB2" INTEGER NOT NULL,
ADD COLUMN     "BB3" INTEGER NOT NULL,
ADD COLUMN     "BB4" INTEGER NOT NULL,
ADD COLUMN     "BB5" INTEGER NOT NULL,
ADD COLUMN     "BP1" INTEGER NOT NULL,
ADD COLUMN     "BP2" INTEGER NOT NULL,
ADD COLUMN     "BP3" INTEGER NOT NULL,
ADD COLUMN     "BP4" INTEGER NOT NULL,
ADD COLUMN     "BP5" INTEGER NOT NULL,
ADD COLUMN     "RB1" INTEGER NOT NULL,
ADD COLUMN     "RB2" INTEGER NOT NULL,
ADD COLUMN     "RB3" INTEGER NOT NULL,
ADD COLUMN     "RB4" INTEGER NOT NULL,
ADD COLUMN     "RB5" INTEGER NOT NULL,
ADD COLUMN     "RP1" INTEGER NOT NULL,
ADD COLUMN     "RP2" INTEGER NOT NULL,
ADD COLUMN     "RP3" INTEGER NOT NULL,
ADD COLUMN     "RP4" INTEGER NOT NULL,
ADD COLUMN     "RP5" INTEGER NOT NULL;
