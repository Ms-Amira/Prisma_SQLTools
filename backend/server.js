const express = require('express')
const cors = require("cors");
const { PrismaClient } = require('@prisma/client');

const prisma = new PrismaClient();
const app = express();

app.use(cors());
app.use(express.json());

app.get('/adopters', async (req, res) => {
  try {
    const data = await prisma.adopter.findMany();
    res.json(data);
  } catch (error) {
    res.status(500).json({ error: 'Internal server error' });
  }
});

app.get('/pets', async (req, res) => {
  try {
    const pets = await prisma.pet.findMany();
    res.json(pets);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch pets' });
  }
});

app.get('/shelters', async (req, res) => {
  try {
    const shelters = await prisma.shelter.findMany();
    res.json(shelters);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch shelters' });
  }
});

app.listen(5555, () => {
  console.log("server listening on port 5555")
});
