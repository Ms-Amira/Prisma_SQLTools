# Prisma_SQLTools

🐾 Pet Adoption Platform

A simple pet adoption app using Prisma, Faker, SQLite, and Node.js to model shelters, pets, and adopters.
🚀 Getting Started

1️⃣ Clone the repository

git clone https://github.com/Ms-Amira/pet-adoption-app.git
cd pet-adoption-app

2️⃣ Set up the frontend

From the project root, create the frontend:

npm create vite@latest frontend -- --template vanilla

Then install frontend dependencies:

cd frontend
npm install

3️⃣ Set up the backend

In the backend folder (create it if needed):

mkdir backend
cd backend
npm init -y

Install backend dependencies:

npm install prisma@6.7.0
npm i @faker-js/faker --save-dev

4️⃣ Initialize Prisma

From inside backend:

npx prisma init

This will create a prisma/schema.prisma and a .env file.

Update your .env with:

DATABASE_URL="file:test.sqlite"

5️⃣ Migrate the database

Still in the backend folder:

npx prisma migrate dev --name init

This creates the SQLite database and applies your models.

6️⃣ Seed the database

To generate random data using Faker:

npx prisma db seed

If you want to reset and re-run the seed from scratch:

npx prisma migrate reset

and answer Y when prompted to re-seed.

🗃️ Model Relationships

There are three main models:

✅ Adopter

    can adopt multiple pets

    holds contact details and approval status

✅ Pet

    belongs to one adopter (optional)

    belongs to one shelter (optional)

✅ Shelter

    houses multiple pets

    has address, phone, and capacity details

Relationships overview:

    A Pet can belong to an Adopter and a Shelter.

    A Shelter has many Pets.

    An Adopter can adopt many Pets.

🌱 Generating New Data

If you want to refresh your database with fresh random data:

npx prisma migrate reset

or directly run:

npx prisma db seed

🖥️ Running the Servers

Backend server

In the backend directory:

npm run dev

(you can use something like nodemon if you wish)
Frontend server

In the frontend directory:

npm run dev

This will launch your vanilla Vite app.
🤝 Contributing

To get running from scratch:

✅ Clone the repo
✅ Install dependencies
✅ Create .env
✅ Migrate + seed the database
✅ Start both servers

✨ Animated Border Gradient Glow

This project features a custom animated gradient glow inspired by Animated Border Gradient Glow from FreeFrontend.