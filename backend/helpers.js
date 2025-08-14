const fs = require('fs');
const csv = require('csv-parser');
const connection = require('./db');

const uploadCSVBack = (filePath, callback) => {
    const rows = [];  
    fs.createReadStream(filePath)
        //.pipe(csv())
        .pipe(csv({
            mapHeaders: ({ header }) => header.trim().toLowerCase()     // To delete spaces and convert to lowsercase
        }))
        .on('data', (row) => {
            rows.push(row);
        })
        .on('end', () => {
            if (rows.length === 0) return callback && callback();

            // Detect type by columns
            if ('name' in rows[0] && 'lastname_1' in rows[0] && 'lastname_2' in rows[0] && 'identification_numb' in rows[0] && 'address' in rows[0] && 'phone' in rows[0] && 'email' in rows[0]) {
                // Insert clients
                let pending = rows.length;
                rows.forEach(client => {
                    const query = `INSERT INTO clients(name, lastname_1, lastname_2, identification_numb, address, phone, email) VALUES(?,?,?,?,?,?,?)`;
                    const values = [
                        client.name,
                        client.lastname_1,
                        client.lastname_2,
                        Number(client.identification_numb),
                        client.address,
                        client.phone,
                        client.email
                    ];
                    connection.query(query, values, (err) => {
                        pending--;
                        if (err) console.error("Error to insert clients", err);
                        if (pending === 0 && callback) callback();
                    });
                });
            } else if ('status' in rows[0] ) {
                // Insert status
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
            } else if ('platform' in rows[0] ) {
                // Insert platforms
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
            } else if ('bill_number' in rows[0] && 'period_year' in rows[0] && 'period_month' in rows[0] && 'amount_bill' in rows[0] && 'paid_amount' in rows[0] && 'id_client' in rows[0]) {
                // Insert bills
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
            } else if ('transaction_id' in rows[0] && 'trans_date_hour' in rows[0] && 'amount_transaction' in rows[0] && 'id_trans_status' in rows[0] && 'transaction_type' in rows[0] && 'id_platform' in rows[0] && 'id_bill' in rows[0]) {
                // Insert transactions
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
            } else {
                // Unknown format
                if (callback) callback(new Error('Unknown CSV format'));
            }
        })
        .on('error', (err) => {
            if (callback) callback(err);
        });
};

module.exports = { uploadCSVBack };