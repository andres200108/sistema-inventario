// 🔹 Cargar variables de entorno (SIEMPRE al inicio)
require('dotenv').config();

// 🔹 Importar dependencias
const express = require('express');
const cors    = require('cors');

// 🔹 Crear aplicación Express
const app = express();

// 🔹 Middlewares
app.use(cors());
app.use(express.json());

// 🔹 Importar conexión a la BD
const pool = require('./config/db');

// 🔹 Importar rutas
const authRoutes     = require("./routes/auth");
const productosRoutes = require("./routes/productos");
const entradasRoutes  = require("./routes/entradas");
const salidasRoutes   = require("./routes/salidas");

// 🔹 Usar rutas
app.use("/api/auth",      authRoutes);
app.use("/api/productos", productosRoutes);
app.use("/api/entradas",  entradasRoutes);
app.use("/api/salidas",   salidasRoutes);

// 🔹 Prueba de conexión a la BD
(async () => {
  try {
    await pool.query("SELECT 1");
    console.log("✅ Conectado a MariaDB correctamente");
  } catch (error) {
    console.error("❌ Error conectando a MariaDB:", error.message);
  }
})();

// 🔹 Ruta base
app.get("/", (req, res) => {
  res.json({ mensaje: "Backend Inventario funcionando 🚀" });
});

// 🔹 Puerto desde .env
const PORT = process.env.PORT || 4001;

// 🔹 Levantar servidor
app.listen(PORT, '0.0.0.0', () => {
  console.log(`Servidor corriendo en puerto ${PORT}`);
});
