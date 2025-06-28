const { PrismaClient } = require('../generated/prisma');
const { faker } = require('@faker-js/faker');

const prisma = new PrismaClient();

async function main() {

  await prisma.adopter.deleteMany();


  const adopters = [];
  for (let i = 0; i < 5; i++) {
    const adopter = await prisma.adopter.create({
      data: {
        name: faker.person.fullName(),
        email: faker.internet.email(),
        phoneNumber: faker.phone.number(),
        animalsInHome: faker.helpers.rangeToNumber({ min: 0, max: 10 }),
        approval: faker.helpers.arrayElement(['PENDING', 'APPROVED', 'REJECTED'])
      },
    });
    adopters.push(adopter);
    console.log(`Created adopter: ${adopter.name}`);
  }

    const pets = [];
  for (let i = 0; i < 5; i++) {
    const species = faker.helpers.arrayElement(['Cat', 'Dog']);
    const pet = await prisma.pet.create({
      data: {
        name: faker.animal.petName(),
        species,
        breed: species === 'Dog' ? faker.animal.dog() : faker.animal.cat(),
        age: faker.helpers.rangeToNumber({ min: 0, max: 20 }),
        medicalHistory: faker.lorem.words({ min: 1, max: 3 })
      },
    });
    pets.push(pet);
    console.log(`Created pet: ${pet.name}`);
  }

    const shelters = [];
  for (let i = 0; i < 5; i++) {
    const shelter = await prisma.shelter.create({
      data: {
        name: faker.company.name(),
        address: `${faker.location.streetAddress()}, ${faker.location.city()}, ${faker.location.state()}`,
        phoneNumber: faker.phone.number(),
        capacity: faker.helpers.rangeToNumber({ min: 0, max: 100 }),
        website: faker.internet.domainName()
      },
    });
    shelters.push(shelter);
    console.log(`Created shelter: ${shelter.name}`);
  }

}

main()
  .then(async () => {
    await prisma.$disconnect();
  })
  .catch(async (e) => {
    console.error(e);
    await prisma.$disconnect();
    process.exit(1);
  });
