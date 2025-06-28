fetch('http://localhost:5555/adopters')
  .then(res => res.json())
  .then(data => {
    console.log('Adopters:', data);
    const container = document.querySelector('#adopters');
    container.innerHTML = '';

    data.forEach(adopter => {
      const tr = document.createElement('tr');
      tr.innerHTML = `
      <td>${adopter.name}</td>
      <td>${adopter.email}</td>
      <td>${adopter.phoneNumber}</td>
      <td>${adopter.animalsInHome}</td>
      <td>${adopter.approval}</td>
    `;

    container.appendChild(tr);
  });
})
  .catch(err => console.error('Error fetching adopters:', err));

fetch('http://localhost:5555/pets')
  .then(res => res.json())
  .then(data => {
    console.log('Pets:', data);
    const container = document.querySelector('#pets');
    container.innerHTML = '';

    data.forEach(pet => {
      const tr = document.createElement('tr');
      tr.innerHTML = `
        <td>${pet.name}</td>
        <td>${pet.species}</td>
        <td>${pet.breed}</td>
        <td>${pet.age}</td>
        <td>${pet.medicalHistory}</td>
      `;
      container.appendChild(tr);
    });
  })
  .catch(err => console.error('Error fetching pets:', err));


fetch('http://localhost:5555/shelters')
  .then(res => res.json())
  .then(data => {
    console.log('Shelters:', data);
    const container = document.querySelector('#shelters');
    container.innerHTML = '';

    data.forEach(shelter => {
      const tr = document.createElement('tr');
      tr.innerHTML = `
        <td>${shelter.name}</td>
        <td>${shelter.address}</td>
        <td>${shelter.phoneNumber}</td>
        <td>${shelter.capacity}</td>
        <td>${shelter.website}</td>
      `;
      container.appendChild(tr);
    });
  })
  .catch(err => console.error('Error fetching shelters:', err));