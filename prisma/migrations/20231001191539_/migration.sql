/*
  Warnings:

  - You are about to drop the `draftPlanning` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "draftPlanning" DROP CONSTRAINT "draftPlanning_opponentid_fkey";

-- DropTable
DROP TABLE "draftPlanning";

-- CreateTable
CREATE TABLE "draftplanning" (
    "draftid" TEXT NOT NULL,
    "opponentid" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "bb1" TEXT NOT NULL,
    "bb2" TEXT NOT NULL,
    "bb3" TEXT NOT NULL,
    "bb4" TEXT NOT NULL,
    "bb5" TEXT NOT NULL,
    "rb1" TEXT NOT NULL,
    "rb2" TEXT NOT NULL,
    "rb3" TEXT NOT NULL,
    "rb4" TEXT NOT NULL,
    "rb5" TEXT NOT NULL,
    "bp1" TEXT NOT NULL,
    "bp2" TEXT NOT NULL,
    "bp3" TEXT NOT NULL,
    "bp4" TEXT NOT NULL,
    "bp5" TEXT NOT NULL,
    "rp1" TEXT NOT NULL,
    "rp2" TEXT NOT NULL,
    "rp3" TEXT NOT NULL,
    "rp4" TEXT NOT NULL,
    "rp5" TEXT NOT NULL,

    CONSTRAINT "draftplanning_pkey" PRIMARY KEY ("draftid")
);

-- CreateIndex
CREATE UNIQUE INDEX "draftplanning_draftid_key" ON "draftplanning"("draftid");

-- AddForeignKey
ALTER TABLE "draftplanning" ADD CONSTRAINT "draftplanning_opponentid_fkey" FOREIGN KEY ("opponentid") REFERENCES "team"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
