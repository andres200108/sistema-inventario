// 🔹 Carga las variables de entorno desde el archivo .env
require('dotenv').config();

// 🔹 Importa la librería mysql2 con soporte para promesas (async/await)
const mysql = require('mysql2/promise');

// 🔹 Crea un pool de conexiones a la base de datos
// Un pool permite reutilizar conexiones y mejora el rendimiento
const pool = mysql.createPool({

  // 🔹 Dirección del servidor de base de datos (IP o dominio)
  host: process.env.DB_HOST,

  // 🔹 Usuario de la base de datos
  user: process.env.DB_USER,

  // 🔹 Contraseña del usuario
  password: process.env.DB_PASSWORD,

  // 🔹 Nombre de la base de datos a usar
  database: process.env.DB_NAME,

  // 🔹 Puerto de conexión (por defecto MySQL usa 3306)
  port: process.env.DB_PORT || 3306

});

// 🔹 Exporta el pool para usarlo en otros archivos (services, controllers, etc.)
module.exports = pool;

