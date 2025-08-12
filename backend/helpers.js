const fs = require('fs');
const csv = require('csv-parser');
const connection = require('./db');

const uploadCSVBack = (filePath, callback) => {
    const rows = [];
    fs.createReadStream(filePath)
        .pipe(csv())
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
                        client.identification_numb,
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