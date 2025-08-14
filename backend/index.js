const express = require('express');         // Framework to create server and manage http routes
const bodyParser = require('body-parser');      // Midddleware to parse request bodies en JSON format.
const db = require('./db');                 // Connection to DB
const { uploadCSVBack } = require('./helpers');     // Function to process and upload csv to BD
const cors = require('cors');               // Middleware to allow resquest from others domains.
const multer = require('multer');           // Middleware to admin uploaded files.
const upload = multer({ dest: 'uploads/' }); // Temp folder for uploads


const app = express();                      // It creates an Express app

// Middleware to enable CORS
app.use(cors());                            // Allows that other domains can consume your API

app.use(bodyParser.json());                 // It converts requests bodies with JSON to JS object.



// Endpoint to insert new clients:
app.post('/clients', (req, res) => {        // Endpoint to create a clients
    const { name, lastname_1, lastname_2, identification_numb, address, phone, email } = req.body;      // Extract data from body
    // Parametrized query in SQL:
    const sql = `
        INSERT INTO clients (name, lastname_1, lastname_2, identification_numb, address, phone, email)
        VALUES (?, ?, ?, ?, ?, ?, ?)
    `;

    db.query(sql, [name, lastname_1, lastname_2, identification_numb, address, phone, email], (err, result) => {
        if (err) {
            console.error('Error to insert client(s):', err);
            return res.status(500).json({ error: 'Error inserting client(s).' });
        }
        res.status(201).json({ message: 'Client(s) inserted successfully', id: result.insertId });    // Response with ID
    });
});


// Endpoint to upload CSV and insert events in bulk:

app.post('/uploadCSV', upload.single('csv'), (req, res) => {        // Upload of csv file
    // option if csv file wasn't sended.
    if (!req.file) {
        return res.status(400).json({ result: 'No file uploaded' });
    }
    const filePath = req.file.path;     // Temp route to the file
    uploadCSVBack(filePath, (err) => {      // Calls the function that process .csv
        if (err) {
            console.error(err);
            return res.status(500).json({ result: 'Error processing CSV' });
        }
        res.json({ result: 'Database updated' });   // Success
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
    const { id } = req.params;      // obtains ID from url
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
    const { id } = req.params;      // ID on url
    const { name, lastname_1, lastname_2, identification_numb, address, phone, email } = req.body;      // Bodies data
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


 // -------------------------------------------------------------------------------
// ADVANCED QUERIES 
// Each of the next endpoints is a query that retrives data through Postman.

// Endpoint to get total amount transfered per status:
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


// Endpoint to obtain general Nequi report:
app.get('/getNequiReport', (req, res) => {
    const sql = `
        SELECT 
            t.transaction_id, t.trans_date_hour, t.amount_transaction, t.transaction_type, 
            p.platform, 
            b.bill_number, b.period_year, b.period_month,
            b.amount_bill, b.paid_amount,
            CONCAT(c.name, ' ', c.lastname_1, ' ', c.lastname_2) AS "Full Name Client", c.email AS "Client Email"
        FROM transactions AS t
        JOIN platforms AS p
            ON t.id_platform = p.id_platform
        JOIN bills AS b
            ON t.id_bill = b.id_bill
        JOIN clients AS c
            ON b.id_client = c.id_client
        WHERE p.platform = 'Nequi'
        ORDER BY b.period_year, b.period_month, t.amount_transaction DESC;
        `;

    db.query(sql, (err, results) => {
        if (err) {
            console.error('Error to obtain general Nequi report:', err);
            return res.status(500).json({ error: 'Error to get general Nequi report.' });
        }


        res.json(results);
    });
});