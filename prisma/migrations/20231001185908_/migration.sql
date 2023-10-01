/*
  Warnings:

  - You are about to drop the column `BB1` on the `draftPlanning` table. All the data in the column will be lost.
  - You are about to drop the column `BB2` on the `draftPlanning` table. All the data in the column will be lost.
  - You are about to drop the column `BB3` on the `draftPlanning` table. All the data in the column will be lost.
  - You are about to drop the column `BB4` on the `draftPlanning` table. All the data in the column will be lost.
  - You are about to drop the column `BB5` on the `draftPlanning` table. All the data in the column will be lost.
  - You are about to drop the column `BP1` on the `draftPlanning` table. All the data in the column will be lost.
  - You are about to drop the column `BP2` on the `draftPlanning` table. All the data in the column will be lost.
  - You are about to drop the column `BP3` on the `draftPlanning` table. All the data in the column will be lost.
  - You are about to drop the column `BP4` on the `draftPlanning` table. All the data in the column will be lost.
  - You are about to drop the column `BP5` on the `draftPlanning` table. All the data in the column will be lost.
  - You are about to drop the column `RB1` on the `draftPlanning` table. All the data in the column will be lost.
  - You are about to drop the column `RB2` on the `draftPlanning` table. All the data in the column will be lost.
  - You are about to drop the column `RB3` on the `draftPlanning` table. All the data in the column will be lost.
  - You are about to drop the column `RB4` on the `draftPlanning` table. All the data in the column will be lost.
  - You are about to drop the column `RB5` on the `draftPlanning` table. All the data in the column will be lost.
  - You are about to drop the column `RP1` on the `draftPlanning` table. All the data in the column will be lost.
  - You are about to drop the column `RP2` on the `draftPlanning` table. All the data in the column will be lost.
  - You are about to drop the column `RP3` on the `draftPlanning` table. All the data in the column will be lost.
  - You are about to drop the column `RP4` on the `draftPlanning` table. All the data in the column will be lost.
  - You are about to drop the column `RP5` on the `draftPlanning` table. All the data in the column will be lost.
  - Added the required column `bb1` to the `draftPlanning` table without a default value. This is not possible if the table is not empty.
  - Added the required column `bb2` to the `draftPlanning` table without a default value. This is not possible if the table is not empty.
  - Added the required column `bb3` to the `draftPlanning` table without a default value. This is not possible if the table is not empty.
  - Added the required column `bb4` to the `draftPlanning` table without a default value. This is not possible if the table is not empty.
  - Added the required column `bb5` to the `draftPlanning` table without a default value. This is not possible if the table is not empty.
  - Added the required column `bp1` to the `draftPlanning` table without a default value. This is not possible if the table is not empty.
  - Added the required column `bp2` to the `draftPlanning` table without a default value. This is not possible if the table is not empty.
  - Added the required column `bp3` to the `draftPlanning` table without a default value. This is not possible if the table is not empty.
  - Added the required column `bp4` to the `draftPlanning` table without a default value. This is not possible if the table is not empty.
  - Added the required column `bp5` to the `draftPlanning` table without a default value. This is not possible if the table is not empty.
  - Added the required column `rb1` to the `draftPlanning` table without a default value. This is not possible if the table is not empty.
  - Added the required column `rb2` to the `draftPlanning` table without a default value. This is not possible if the table is not empty.
  - Added the required column `rb3` to the `draftPlanning` table without a default value. This is not possible if the table is not empty.
  - Added the required column `rb4` to the `draftPlanning` table without a default value. This is not possible if the table is not empty.
  - Added the required column `rb5` to the `draftPlanning` table without a default value. This is not possible if the table is not empty.
  - Added the required column `rp1` to the `draftPlanning` table without a default value. This is not possible if the table is not empty.
  - Added the required column `rp2` to the `draftPlanning` table without a default value. This is not possible if the table is not empty.
  - Added the required column `rp3` to the `draftPlanning` table without a default value. This is not possible if the table is not empty.
  - Added the required column `rp4` to the `draftPlanning` table without a default value. This is not possible if the table is not empty.
  - Added the required column `rp5` to the `draftPlanning` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "draftPlanning" DROP COLUMN "BB1",
DROP COLUMN "BB2",
DROP COLUMN "BB3",
DROP COLUMN "BB4",
DROP COLUMN "BB5",
DROP COLUMN "BP1",
DROP COLUMN "BP2",
DROP COLUMN "BP3",
DROP COLUMN "BP4",
DROP COLUMN "BP5",
DROP COLUMN "RB1",
DROP COLUMN "RB2",
DROP COLUMN "RB3",
DROP COLUMN "RB4",
DROP COLUMN "RB5",
DROP COLUMN "RP1",
DROP COLUMN "RP2",
DROP COLUMN "RP3",
DROP COLUMN "RP4",
DROP COLUMN "RP5",
ADD COLUMN     "bb1" INTEGER NOT NULL,
ADD COLUMN     "bb2" INTEGER NOT NULL,
ADD COLUMN     "bb3" INTEGER NOT NULL,
ADD COLUMN     "bb4" INTEGER NOT NULL,
ADD COLUMN     "bb5" INTEGER NOT NULL,
ADD COLUMN     "bp1" INTEGER NOT NULL,
ADD COLUMN     "bp2" INTEGER NOT NULL,
ADD COLUMN     "bp3" INTEGER NOT NULL,
ADD COLUMN     "bp4" INTEGER NOT NULL,
ADD COLUMN     "bp5" INTEGER NOT NULL,
ADD COLUMN     "rb1" INTEGER NOT NULL,
ADD COLUMN     "rb2" INTEGER NOT NULL,
ADD COLUMN     "rb3" INTEGER NOT NULL,
ADD COLUMN     "rb4" INTEGER NOT NULL,
ADD COLUMN     "rb5" INTEGER NOT NULL,
ADD COLUMN     "rp1" INTEGER NOT NULL,
ADD COLUMN     "rp2" INTEGER NOT NULL,
ADD COLUMN     "rp3" INTEGER NOT NULL,
ADD COLUMN     "rp4" INTEGER NOT NULL,
ADD COLUMN     "rp5" INTEGER NOT NULL;
