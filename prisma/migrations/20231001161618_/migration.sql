-- CreateTable
CREATE TABLE "draftPlanning" (
    "draftid" TEXT NOT NULL,
    "opponentid" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "draftPlanning_pkey" PRIMARY KEY ("draftid")
);

-- CreateIndex
CREATE UNIQUE INDEX "draftPlanning_draftid_key" ON "draftPlanning"("draftid");

-- AddForeignKey
ALTER TABLE "draftPlanning" ADD CONSTRAINT "draftPlanning_opponentid_fkey" FOREIGN KEY ("opponentid") REFERENCES "team"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
