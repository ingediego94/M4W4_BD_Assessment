const express = require('express');
const bodyParser = require('body-parser');
const db = require('./db');
const { uploadCSVBack } = require('./helpers');
const cors = require('cors'); 
const multer = require('multer');
const upload = multer({ dest: 'uploads/' }); // Temp folder for uploads


const app = express();

// Middleware to enable CORS
app.use(cors()); 

app.use(bodyParser.json());



// Endpoint to insert new clients:
app.post('/clients', (req, res) => {
    const { name, lastname_1, lastname_2, identification_numb, address, phone, email } = req.body;

    const sql = `
        INSERT INTO clients (name, lastname_1, lastname_2, identification_numb, address, phone, email)
        VALUES (?, ?, ?, ?, ?, ?, ?)
    `;

    db.query(sql, [name, lastname_1, lastname_2, identification_numb, address, phone, email], (err, result) => {
        if (err) {
            console.error('Error to insert client(s):', err);
            return res.status(500).json({ error: 'Error inserting client(s).' });
        }
        res.status(201).json({ message: 'Client(s) inserted successfully', id: result.insertId });
    });
});


// Endpoint to upload CSV and insert events in bulk:

app.post('/uploadCSV', upload.single('csv'), (req, res) => {
    if (!req.file) {
        return res.status(400).json({ result: 'No file uploaded' });
    }
    const filePath = req.file.path;
    uploadCSVBack(filePath, (err) => {
        if (err) {
            console.error(err);
            return res.status(500).json({ result: 'Error processing CSV' });
        }
        res.json({ result: 'Database updated' });
    });
});



// Endpoint to get all clients:
app.get('/getClients', (req, res) => {
    const sql = `
        SELECT * 
        FROM clients
        `;

    db.query(sql, (err, results) => {
        if (err) {
            console.error('Error to obtain clients:', err);
            return res.status(500).json({ error: 'Error to get clients' });
        }


        res.json(results);
    });
});



// Endpoint to delete client:
app.delete('/clients/:id', (req, res) => {
    const { id } = req.params;
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


// Endpoint to update client:
app.put('/clients/:id', (req, res) => {
    const { id } = req.params;
    const { name, lastname_1, lastname_2, identification_numb, address, phone, email } = req.body;
    const sql = `
        UPDATE clients
        SET name = ?, lastname_1 = ?, lastname_2 = ?, identification_numb = ?, address = ?, phone = ?, email = ?
        WHERE id_client = ?
    `;                                                                                  // MISSING : ,id
    db.query(sql, [name, lastname_1, lastname_2, identification_numb, address, phone, email, id], (err, result) => {
        if (err) {
            console.error('Error updating client:', err);
            return res.status(500).json({ error: 'Error updating client.' });
        }
        res.json({ message: 'Client updated successfully' });
    });
});

// Message to indicate the server is running
app.listen(3000, () => {
    console.log('Server running on http://localhost:3000');
});
