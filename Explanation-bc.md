## Backend:

### helpers.js

```

// Importa el módulo 'fs' para trabajar con el sistema de archivos (lectura, escritura, etc.)
const fs = require('fs');

// Importa el módulo 'csv-parser' para leer y convertir archivos CSV en objetos JavaScript
const csv = require('csv-parser');

// Importa la conexión a la base de datos desde el archivo 'db.js'
const connection = require('./db');

// Define la función 'uploadCSVBack' que recibe la ruta del archivo CSV y una función de callback
const uploadCSVBack = (filePath, callback) => {
    // Arreglo para almacenar temporalmente las filas leídas del archivo CSV
    const rows = [];  

    // Crea un flujo de lectura del archivo en la ruta especificada
    fs.createReadStream(filePath)
        // Pasa el flujo al parser CSV, limpiando espacios y convirtiendo los encabezados a minúsculas
        .pipe(csv({
            mapHeaders: ({ header }) => header.trim().toLowerCase() // Elimina espacios y convierte a minúsculas
        }))
        // Evento que se ejecuta cada vez que se lee una fila del CSV
        .on('data', (row) => {
            rows.push(row); // Guarda cada fila en el arreglo 'rows'
        })
        // Evento que se ejecuta cuando se termina de leer todo el archivo CSV
        .on('end', () => {
            // Si no se leyó ninguna fila, ejecuta el callback y sale
            if (rows.length === 0) return callback && callback();

            // Detecta el tipo de CSV por los nombres de las columnas y elige cómo insertarlo en la base de datos

            // Caso 1: Archivo de clientes
            if ('name' in rows[0] && 'lastname_1' in rows[0] && 'lastname_2' in rows[0] && 'identification_numb' in rows[0] && 'address' in rows[0] && 'phone' in rows[0] && 'email' in rows[0]) {
                let pending = rows.length; // Contador de inserciones pendientes
                rows.forEach(client => {
                    const query = `INSERT INTO clients(name, lastname_1, lastname_2, identification_numb, address, phone, email) VALUES(?,?,?,?,?,?,?)`;
                    const values = [
                        client.name,
                        client.lastname_1,
                        client.lastname_2,
                        Number(client.identification_numb), // Se asegura que sea número
                        client.address,
                        client.phone,
                        client.email
                    ];
                    connection.query(query, values, (err) => {
                        pending--; // Disminuye el contador cada vez que se completa una inserción
                        if (err) console.error("Error to insert clients", err);
                        if (pending === 0 && callback) callback(); // Llama al callback cuando todas las inserciones hayan terminado
                    });
                });

            // Caso 2: Archivo de estados
            } else if ('status' in rows[0] ) {
                let pending = rows.length;
                rows.forEach(status => {
                    const query = `INSERT INTO status(status) VALUES(?)`;
                    const values = [
                        status.status
                    ];
                    connection.query(query, values, (err) => {
                        pending--;
                        if (err) console.error("Error to insert 'status'", err);
                        if (pending === 0 && callback) callback();
                    });
                });

            // Caso 3: Archivo de plataformas
            } else if ('platform' in rows[0] ) {
                let pending = rows.length;
                rows.forEach(platform => {
                    const query = `INSERT INTO platforms (platform) VALUES(?)`;
                    const values = [
                        platform.platform
                    ];
                    connection.query(query, values, (err) => {
                        pending--;
                        if (err) console.error("Error to insert platforms", err);
                        if (pending === 0 && callback) callback();
                    });
                });

            // Caso 4: Archivo de facturas
            } else if ('bill_number' in rows[0] && 'period_year' in rows[0] && 'period_month' in rows[0] && 'amount_bill' in rows[0] && 'paid_amount' in rows[0] && 'id_client' in rows[0]) {
                let pending = rows.length; 
                rows.forEach(bill => {
                    const query = `INSERT INTO bills (bill_number, period_year, period_month, amount_bill, paid_amount, id_client) VALUES(?, ?, ?, ?, ?, ?)`;
                    const values = [
                        bill.bill_number,
                        Number(bill.period_year),
                        Number(bill.period_month),
                        Number(bill.amount_bill),
                        Number(bill.paid_amount),
                        Number(bill.id_client)
                    ];
                    connection.query(query, values, (err) => {
                        pending--;
                        if (err) console.error("Error to insert bills", err);
                        if (pending === 0 && callback) callback();
                    });
                });

            // Caso 5: Archivo de transacciones
            } else if ('transaction_id' in rows[0] && 'trans_date_hour' in rows[0] && 'amount_transaction' in rows[0] && 'id_trans_status' in rows[0] && 'transaction_type' in rows[0] && 'id_platform' in rows[0] && 'id_bill' in rows[0]) {
                let pending = rows.length;
                rows.forEach(transaction => {
                    const query = `INSERT INTO transactions (transaction_id, trans_date_hour, amount_transaction, id_trans_status, transaction_type, id_platform, id_bill) VALUES(?, ?, ?, ?, ?, ?, ?)`;
                    const values = [
                        transaction.transaction_id,
                        transaction.trans_date_hour,
                        Number(transaction.amount_transaction),
                        Number(transaction.id_trans_status),
                        transaction.transaction_type,
                        Number(transaction.id_platform),
                        Number(transaction.id_bill)
                    ];
                    connection.query(query, values, (err) => {
                        pending--;
                        if (err) console.error("Error to insert transaction", err);
                        if (pending === 0 && callback) callback();
                    });
                });

            // Caso 6: Formato de CSV no reconocido
            } else {
                if (callback) callback(new Error('Unknown CSV format'));
            }
        })
        // Evento que captura cualquier error durante la lectura o el parseo del CSV
        .on('error', (err) => {
            if (callback) callback(err);
        });
};

// Exporta la función para que pueda ser utilizada en otros archivos
module.exports = { uploadCSVBack };

```


### index.js

1. Importación de módulos

```
const express = require('express'); // Framework para crear el servidor y manejar rutas HTTP
const bodyParser = require('body-parser'); // Middleware para parsear el cuerpo de las solicitudes en formato JSON
const db = require('./db'); // Conexión a la base de datos MySQL (archivo propio)
const { uploadCSVBack } = require('./helpers'); // Función para procesar y cargar CSV a la BD
const cors = require('cors'); // Middleware para permitir solicitudes desde otros dominios (CORS)
const multer = require('multer'); // Middleware para manejo de archivos subidos
const upload = multer({ dest: 'uploads/' }); // Configuración: guarda los archivos temporalmente en "uploads/"
```

2. Inicialización del servidor:
```
const app = express(); // Crea la aplicación Express
```

3. Middlewares globales:
```
app.use(cors()); // Permite que otros dominios puedan consumir tu API
app.use(bodyParser.json()); // Convierte el cuerpo de las solicitudes con JSON en objetos JS
```

4. Endpoint para insertar un cliente:
```
app.post('/clients', (req, res) => { // Ruta POST para crear un cliente
    const { name, lastname_1, lastname_2, identification_numb, address, phone, email } = req.body; // Extrae datos del body

    const sql = `
        INSERT INTO clients (name, lastname_1, lastname_2, identification_numb, address, phone, email)
        VALUES (?, ?, ?, ?, ?, ?, ?)
    `; // Consulta parametrizada para evitar SQL Injection

    db.query(sql, [name, lastname_1, lastname_2, identification_numb, address, phone, email], (err, result) => {
        if (err) { // Manejo de error
            console.error('Error to insert client(s):', err);
            return res.status(500).json({ error: 'Error inserting client(s).' });
        }
        res.status(201).json({ message: 'Client(s) inserted successfully', id: result.insertId }); // Respuesta con el ID insertado
    });
});
```

5. Endpoint para subir un CSV y procesarlo:
```
app.post('/uploadCSV', upload.single('csv'), (req, res) => { // Subida de archivo CSV
    if (!req.file) { // Si no se envió archivo
        return res.status(400).json({ result: 'No file uploaded' });
    }
    const filePath = req.file.path; // Ruta temporal del archivo
    uploadCSVBack(filePath, (err) => { // Llama a la función que procesa el CSV
        if (err) { // Manejo de error
            console.error(err);
            return res.status(500).json({ result: 'Error processing CSV' });
        }
        res.json({ result: 'Database updated' }); // Éxito
    });
});
```

6. Obtener todos los clientes:
```
app.get('/getClients', (req, res) => { // Ruta GET para traer todos los clientes
    const sql = `
        SELECT * 
        FROM clients
        `;

    db.query(sql, (err, results) => {
        if (err) {
            console.error('Error to obtain clients:', err);
            return res.status(500).json({ error: 'Error to get clients' });
        }
        res.json(results); // Devuelve la lista de clientes
    });
});
```

7. Eliminar cliente por ID:
```
app.delete('/clients/:id', (req, res) => { // Ruta DELETE con parámetro en URL
    const { id } = req.params; // Obtiene ID de la URL
    const sql = `
        DELETE FROM clients 
        WHERE id_client = ?
        `;
    db.query(sql, [id], (err, result) => {
        if (err) {
            console.error('Error deleting client:', err);
            return res.status(500).json({ error: 'Error deleting client.' });
        }
        res.json({ message: 'Client deleted successfully' });
    });
});
```

8. Actualizar cliente:
```
app.put('/clients/:id', (req, res) => { // Ruta PUT para actualizar
    const { id } = req.params; // ID en la URL
    const { name, lastname_1, lastname_2, identification_numb, address, phone, email } = req.body; // Datos del body

    const sql = `
        UPDATE clients
        SET name = ?, lastname_1 = ?, lastname_2 = ?, identification_numb = ?, address = ?, phone = ?, email = ?
        WHERE id_client = ?
    `; // Consulta de actualización

    db.query(sql, [name, lastname_1, lastname_2, identification_numb, address, phone, email, id], (err, result) => {
        if (err) {
            console.error('Error updating client:', err);
            return res.status(500).json({ error: 'Error updating client.' });
        }
        res.json({ message: 'Client updated successfully' });
    });
});
```


9. Iniciar servidor
```
app.listen(3000, () => { // Levanta el servidor en el puerto 3000
    console.log('Server running on http://localhost:3000');
});


10. Consultas avanzadas
Total por estado

app.get('/getTotalPerStatus', (req, res) => {
    const sql = `
        SELECT 
            s.status AS "Trans. Status", 
            COUNT(*) AS "Trans. Amount",
            SUM(t.amount_transaction) AS "Total Amount"
        FROM transactions AS t
        JOIN status AS s
        ON t.id_trans_status = s.id_status
        GROUP BY s.status
        `;
    db.query(sql, (err, results) => {
        if (err) {
            console.error('Error to obtain total per status:', err);
            return res.status(500).json({ error: 'Error to get total per status' });
        }
        res.json(results);
    });
});
```


## Frontend
### main.js

```
// Obtiene el elemento HTML con el id 'events-table' (la tabla donde se mostrarán los clientes)
const table = document.getElementById('events-table');

// Obtiene el elemento con el id 'button-csv' (botón para subir archivo CSV)
const button = document.getElementById('button-csv');

// --------------------------------------------------------------
// Obtiene cada campo del formulario por su id (inputs de datos del cliente)
const name = document.getElementById('name');
const lastname_1 = document.getElementById('lastname_1');
const lastname_2 = document.getElementById('lastname_2');
const identification_numb = document.getElementById('identification_numb');
const address = document.getElementById('address');
const phone = document.getElementById('phone');
const email = document.getElementById('email');
// --------------------------------------------------------------

// Función para obtener y mostrar la lista de clientes desde el servidor
function getClients(){
    // Hace una petición HTTP GET al backend para traer los clientes
    fetch('http://localhost:3000/getClients')
    .then(res => res.json()) // Convierte la respuesta en JSON
    .then(data => {
        table.innerHTML = ''; // Limpia la tabla antes de llenarla
        // Recorre cada registro recibido
        data.forEach(rec => {
            // Agrega una nueva fila por cada cliente, con botones para editar y eliminar
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
                <td class="text-center">
                    <a class="btnEdit btn btn-info">Edit</a> 
                    <a class="btnDelete btn btn-danger">Delete</a>
                </td>
            </tr>
            `;
        });
    });
}

// Llama la función al cargar la página para mostrar los clientes
getClients();

// --------------------------------------------------------------
// Inicializa el modal de Bootstrap con el id 'modalArticulo'
const modalArticulo = new bootstrap.Modal(document.getElementById('modalArticulo'));

// Cuando se hace clic en "Agregar", limpia el formulario y abre el modal
btnAdd.addEventListener('click', ()=>{
    name.value = '';
    lastname_1.value = '';         // Limpia cada campo del formulario
    lastname_2.value = '';
    identification_numb.value = '';
    address.value = '';
    phone.value = '';
    email.value = '';
    opcion = 'crear'; // Establece que la acción será crear un nuevo cliente
    modalArticulo.show(); // Muestra el modal
});

// Obtiene el formulario por su id
const eventForm = document.getElementById('event-form');

// --------------------------------------------------------------
// Variable para saber si estamos creando o editando
let opcion = 'crear';
// Variable para guardar el id del cliente que se está editando
let editClientId = null;

// Delegación de eventos: escucha clics en la tabla para detectar Edit o Delete
table.addEventListener('click', function(e) {
    
    // Si se hace clic en el botón Editar
    if (e.target.classList.contains('btnEdit')) {
        const row = e.target.closest('tr'); // Obtiene la fila
        // Guarda el id del cliente y llena el formulario con sus datos
        editClientId = row.children[0].textContent;
        name.value = row.children[1].textContent;
        lastname_1.value = row.children[2].textContent;
        lastname_2.value = row.children[3].textContent;
        identification_numb.value = row.children[4].textContent;
        address.value = row.children[5].textContent;
        phone.value = row.children[6].textContent;
        email.value = row.children[7].textContent;
        opcion = 'editar'; // Cambia la acción a editar
        modalArticulo.show(); // Muestra el modal
    }

    // Si se hace clic en el botón Eliminar
    if (e.target.classList.contains('btnDelete')) {
        const row = e.target.closest('tr'); // Obtiene la fila
        const id = row.children[0].textContent; // Obtiene el id del cliente
        // Muestra confirmación antes de eliminar
        alertify.confirm('Delete Event', 'Are you sure you want to delete this client?',
            function() {
                // Si confirma, hace la petición DELETE al servidor
                fetch(`http://localhost:3000/clients/${id}`, {
                    method: 'DELETE'
                })
                .then(res => res.json())
                .then(data => {
                    alertify.success('Client deleted!'); // Mensaje de éxito
                    getClients(); // Refresca la lista
                })
                .catch(() => alertify.error('Server error'));
            },
            function() {
                // Si cancela, no hace nada
            });
    }
});

// --------------------------------------------------------------
// Maneja el envío del formulario
eventForm.addEventListener('submit', function(e) {
    e.preventDefault(); // Evita que se recargue la página

    // Validaciones: todos los campos deben estar llenos
    if (!name.value || !lastname_1.value || !lastname_2.value || !identification_numb.value || !address.value || !phone.value || !email.value) {
        alertify.error('All fields are required');
        return;
    } else if (identification_numb.value <= 0) { // Validación de número positivo
        alertify.error('Capacity must be a positive number');
        return;
    }
 
    // Objeto con los datos del cliente
    const clientData = {
        name: name.value,
        lastname_1: lastname_1.value,
        lastname_2: lastname_2.value,
        identification_numb: identification_numb.value,
        address: address.value,
        phone: phone.value,
        email: email.value
    };

    // Si estamos creando un nuevo cliente
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
                modalArticulo.hide(); // Cierra el modal
                getClients(); // Refresca lista
            }
        })
        .catch(() => alertify.error('Server error'));

    // Si estamos editando un cliente
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

// --------------------------------------------------------------
// Funcionalidad para subir un archivo CSV
const csvInput = document.getElementById('csv-input');
const buttonCSV = document.getElementById('button-csv');

// Cuando se hace clic en el botón, simula un clic en el input file
buttonCSV.addEventListener('click', () => {
    csvInput.click();
});

// Cuando se selecciona un archivo
csvInput.addEventListener('change', function() {
    const file = csvInput.files[0]; // Obtiene el archivo
    if (!file) return; // Si no hay archivo, sale

    // Prepara el archivo para enviarlo al servidor
    const formData = new FormData();
    formData.append('csv', file);

    // Envía el archivo al backend
    fetch('http://localhost:3000/uploadCSV', {
        method: 'POST',
        body: formData
    })
    .then(res => res.json())
    .then(data => {
        alertify.success(data.result || 'CSV uploaded!'); // Mensaje de éxito
        getClients(); // Refresca la tabla
    })
    .catch(() => alertify.error('Error uploading CSV'));
});
```