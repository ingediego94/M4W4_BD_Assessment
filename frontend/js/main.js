const table = document.getElementById('events-table');
const button = document.getElementById('button-csv');
// -----------------------------------------------
const name = document.getElementById('name');
const lastname_1 = document.getElementById('lastname_1');
const lastname_2 = document.getElementById('lastname_2');
const identification_numb = document.getElementById('identification_numb');
const address = document.getElementById('address');
const phone = document.getElementById('phone');
const email = document.getElementById('email');
//------------------------------------------------

// Function to fetch and display clients
function getClients(){
    fetch('http://localhost:3000/getClients')
    .then(res => res.json())
    .then(data => {
        table.innerHTML = '';
        data.forEach(rec => {
            table.innerHTML += `
            <tr>
                <td>${rec.id_client}</td>
                <td>${rec.name}</td>
                <td>${rec.lastname_1}</td>
                <td>${rec.lastname_2}</td>
                <td>${rec.identification_numb}</td>
                <td>${rec.address}</td>
                <td>${rec.phone}</td>
                <td>${rec.email}</td>
                <td class="text-center"><a class="btnEdit btn btn-info">Edit</a> <a class="btnDelete btn btn-danger">Delete</a></td>
            </tr>
            `;
        });
    });
}


getClients();


// -------------------------------------------------------
// Modal
const modalArticulo = new bootstrap.Modal(document.getElementById('modalArticulo'));

btnAdd.addEventListener('click', ()=>{
    name.value = '';
    lastname_1.value = '';         // cleaning every field
    lastname_2.value = '';
    identification_numb.value = '';
    address.value = '';
    phone.value = '';
    email.value = '';
    opcion = 'crear';
    modalArticulo.show();
});

// Form to new data

const eventForm = document.getElementById('event-form');



// -----------------------------------------------------
let opcion = 'crear';
let editClientId = null;

// Delegating events for Edit and Delete
table.addEventListener('click', function(e) {
    
    if (e.target.classList.contains('btnEdit')) {
        // Get the row and data
        const row = e.target.closest('tr');
        editClientId = row.children[0].textContent;
        name.value = row.children[1].textContent;
        lastname_1.value = row.children[2].textContent;
        lastname_2.value = row.children[3].textContent;
        identification_numb.value = row.children[4].textContent;
        address.value = row.children[5].textContent;
        phone.value = row.children[6].textContent;
        email.value = row.children[7].textContent;
        opcion = 'editar';
        modalArticulo.show();
    }

    if (e.target.classList.contains('btnDelete')) {
        const row = e.target.closest('tr');
        const id = row.children[0].textContent;
        alertify.confirm('Delete Event', 'Are you sure you want to delete this client?',
            function() {
                fetch(`http://localhost:3000/clients/${id}`, {
                    method: 'DELETE'
                })
                .then(res => res.json())
                .then(data => {
                    alertify.success('Client deleted!');
                    getClients();
                })
                .catch(() => alertify.error('Server error'));
            },
            function() {
                // Cancelled
            });
    }
});


// Modify the form submit to support edit
eventForm.addEventListener('submit', function(e) {
    e.preventDefault();

    // Validations
    if (!name.value || !lastname_1.value || !lastname_2.value || !identification_numb.value || !address.value || !phone.value || !email.value) {
        alertify.error('All fields are required');
        return;
    } else if (identification_numb.value <= 0) {
        alertify.error('Capacity must be a positive number');
        return;
    }
 

    const clientData = {
        name: name.value,
        lastname_1: lastname_1.value,
        lastname_2: lastname_2.value,
        identification_numb: identification_numb.value,
        address: address.value,
        phone: phone.value,
        email: email.value
    };

    if (opcion === 'crear') {
        fetch('http://localhost:3000/clients', {
            method: 'POST',
            headers: {'Content-Type': 'application/json'},
            body: JSON.stringify(clientData)
        })
        .then(res => res.json())
        .then(data => {
            if (data.error) {
                alertify.error('Error creating client');
            } else {
                alertify.success('Event created!');
                modalArticulo.hide();
                getClients();
            }
        })
        .catch(() => alertify.error('Server error'));
    } else if (opcion === 'editar') {
        fetch(`http://localhost:3000/clients/${editClientId}`, {
            method: 'PUT',
            headers: {'Content-Type': 'application/json'},
            body: JSON.stringify(clientData)
        })
        .then(res => res.json())
        .then(data => {
            if (data.error) {
                alertify.error('Error updating client');
            } else {
                alertify.success('Client updated!');
                modalArticulo.hide();
                getClients();
            }
        })
        .catch(() => alertify.error('Server error'));
    }
});

// Upload CSV functionality
const csvInput = document.getElementById('csv-input');
const buttonCSV = document.getElementById('button-csv');

buttonCSV.addEventListener('click', () => {
    csvInput.click();
});

csvInput.addEventListener('change', function() {
    const file = csvInput.files[0];
    if (!file) return;

    const formData = new FormData();
    formData.append('csv', file);

    fetch('http://localhost:3000/uploadCSV', {
        method: 'POST',
        body: formData
    })
    .then(res => res.json())
    .then(data => {
        alertify.success(data.result || 'CSV uploaded!');
        getClients();
    })
    .catch(() => alertify.error('Error uploading CSV'));
});