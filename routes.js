// routes.js
const express = require('express');
const router = express.Router();
const mysql = require('mysql');
const fs = require('fs');

const dbConfig = {
  host: 'localhost',
  user: 'root',
  password:'44129684',
  database: 'newschema',
};

const connection = mysql.createConnection(dbConfig);

connection.connect((err) => {
  if (err) {
    console.error('Error de conexión a la base de datos:', err.message);
  } else {
    console.log('Conexión exitosa a la base de datos MySQL');
    createTableIfNotExists();
    loadDataFromJson();
  }
});

function createTableIfNotExists() {
  const createTableQuery = `
    CREATE TABLE IF NOT EXISTS product_table (
      product_id INT AUTO_INCREMENT PRIMARY KEY,
      product_name VARCHAR(100) NOT NULL,
      product_price VARCHAR(50) NOT NULL,
      product_description VARCHAR(200) NOT NULL,
      id_categoria INT NOT NULL,
      product_stock INT NOT NULL
    )
  `;
  connection.query(createTableQuery, (err) => {
    if (err) {
      console.error('Error al crear la tabla:', err.message);
    }
  });
}

function loadDataFromJson() {
  const dbJsonPath = './db.json';
  const dbJson = JSON.parse(fs.readFileSync(dbJsonPath, 'utf8'));

  dbJson.products.forEach(product => {
    const maxDescriptionLength = 200;
    const truncatedDescription = product.about.substring(0, maxDescriptionLength);
    const product_stock = product.product_stock || 0;
    const id_categoria = product.id_categoria || 0;

    const insertQuery = 'INSERT INTO product_table (product_name, product_price, product_description, id_categoria, product_stock) VALUES (?, ?, ?, ?, ?)';
    connection.query(insertQuery, [product.nombre, product.price, truncatedDescription, id_categoria, product_stock], (err) => {
      if (err) {
        console.error('Error al insertar datos en la base de datos:', err.message);
      }
    });
  });
}

router.get('/', (req, res) => {
  const selectAllQuery = 'SELECT * FROM product_table';
  connection.query(selectAllQuery, (err, rows) => {
    if (err) {
      res.status(500).json({ error: err.message });
    } else {
      res.json(rows);
    }
  });
});

router.get('/:id', (req, res) => {
  const selectByIdQuery = 'SELECT * FROM product_table WHERE product_id = ?';
  connection.query(selectByIdQuery, [req.params.id], (err, rows) => {
    if (err) {
      res.status(500).json({ error: err.message });
    } else {
      res.json(rows[0]);
    }
  });
});


router.post('/', (req, res) => {
  const { product_name, product_price, product_description, id_categoria, product_stock } = req.body;

  // Validación de datos
  if (!product_name || !product_price || !product_description || !id_categoria || !product_stock) {
    return res.status(400).json({ error: 'Todos los campos son obligatorios.' });
  }

  const insertQuery = 'INSERT INTO product_table (product_name, product_price, product_description, id_categoria, product_stock) VALUES (?, ?, ?, ?, ?)';
  connection.query(insertQuery, [product_name, product_price, product_description, id_categoria, product_stock], (err, result) => {
    if (err) {
      console.error('Error al insertar datos en la base de datos:', err.message);
      return res.status(500).json({ error: 'Error al insertar datos en la base de datos.' });
    } else {
      res.send('Product added!');
    }
  });
});


router.put('/:id', (req, res) => {
  const { product_name, product_price, product_description, id_categoria, product_stock } = req.body;
  const updateQuery = 'UPDATE product_table SET product_name = ?, product_price = ?, product_description = ?, id_categoria = ?, product_stock = ? WHERE product_id = ?';
  connection.query(updateQuery, [product_name, product_price, product_description, id_categoria, product_stock, req.params.id], (err, result) => {
    if (err) {
      res.status(500).json({ error: err.message });
    } else {
      res.send('Product updated!');
    }
  });
});

router.delete('/:id', (req, res) => {
  const deleteQuery = 'DELETE FROM product_table WHERE product_id = ?';
  connection.query(deleteQuery, [req.params.id], (err, result) => {
    if (err) {
      res.status(500).json({ error: err.message });
    } else {
      res.send('Product excluded!');
    }
  });
});

module.exports = router;
