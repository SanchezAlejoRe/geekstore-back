const express = require('express');
const app = express();
const cors = require('cors');
const routes = require('./routes.js'); // o la ruta correcta a tu archivo de rutas

// Middleware para analizar el cuerpo de las solicitudes en formato JSON
app.use(express.json());
app.use(cors());

// Usar las rutas definidas en el archivo routes.js
app.use('/api/products', routes); // Aquí he añadido "/api" antes de "/products" como ejemplo, pero puedes ajustarlo según tu preferencia

// Puerto en el que el servidor escuchará
const PORT = 3001;

// Iniciar el servidor
app.listen(PORT, () => {
  console.log(`Servidor escuchando en el puerto ${PORT}`);
});
