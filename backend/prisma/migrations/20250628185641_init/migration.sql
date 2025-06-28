-- CreateTable
CREATE TABLE "Adopter" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "phoneNumber" INTEGER NOT NULL,
    "animalsInHome" TEXT NOT NULL,
    "approval" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Pet" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "species" TEXT NOT NULL,
    "breed" TEXT NOT NULL,
    "age" INTEGER NOT NULL,
    "medicalHistory" TEXT NOT NULL,
    "adopterId" INTEGER,
    "shelterId" INTEGER,
    CONSTRAINT "Pet_adopterId_fkey" FOREIGN KEY ("adopterId") REFERENCES "Adopter" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Pet_shelterId_fkey" FOREIGN KEY ("shelterId") REFERENCES "Shelter" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Shelter" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "phoneNumber" INTEGER NOT NULL,
    "capacity" INTEGER NOT NULL,
    "website" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Adopter_email_key" ON "Adopter"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Adopter_phoneNumber_key" ON "Adopter"("phoneNumber");
