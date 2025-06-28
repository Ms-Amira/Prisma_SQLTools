/*
  Warnings:

  - You are about to alter the column `animalsInHome` on the `Adopter` table. The data in that column could be lost. The data in that column will be cast from `String` to `Int`.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Adopter" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "phoneNumber" TEXT NOT NULL,
    "animalsInHome" INTEGER NOT NULL,
    "approval" TEXT NOT NULL
);
INSERT INTO "new_Adopter" ("animalsInHome", "approval", "email", "id", "name", "phoneNumber") SELECT "animalsInHome", "approval", "email", "id", "name", "phoneNumber" FROM "Adopter";
DROP TABLE "Adopter";
ALTER TABLE "new_Adopter" RENAME TO "Adopter";
CREATE UNIQUE INDEX "Adopter_email_key" ON "Adopter"("email");
CREATE UNIQUE INDEX "Adopter_phoneNumber_key" ON "Adopter"("phoneNumber");
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
