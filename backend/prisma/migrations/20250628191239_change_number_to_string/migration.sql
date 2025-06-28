-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Adopter" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "phoneNumber" TEXT NOT NULL,
    "animalsInHome" TEXT NOT NULL,
    "approval" TEXT NOT NULL
);
INSERT INTO "new_Adopter" ("animalsInHome", "approval", "email", "id", "name", "phoneNumber") SELECT "animalsInHome", "approval", "email", "id", "name", "phoneNumber" FROM "Adopter";
DROP TABLE "Adopter";
ALTER TABLE "new_Adopter" RENAME TO "Adopter";
CREATE UNIQUE INDEX "Adopter_email_key" ON "Adopter"("email");
CREATE UNIQUE INDEX "Adopter_phoneNumber_key" ON "Adopter"("phoneNumber");
CREATE TABLE "new_Shelter" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "phoneNumber" TEXT NOT NULL,
    "capacity" INTEGER NOT NULL,
    "website" TEXT NOT NULL
);
INSERT INTO "new_Shelter" ("address", "capacity", "id", "name", "phoneNumber", "website") SELECT "address", "capacity", "id", "name", "phoneNumber", "website" FROM "Shelter";
DROP TABLE "Shelter";
ALTER TABLE "new_Shelter" RENAME TO "Shelter";
CREATE UNIQUE INDEX "Shelter_phoneNumber_key" ON "Shelter"("phoneNumber");
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
