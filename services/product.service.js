
const getAll = async () => {
  const [rows] = await pool.query("SELECT * FROM productos");
  return rows;
};

// services/product.service.js

// 🔹 Conexión a la base de datos
const pool = require("../config/db");

// =====================
// 📦 SERVICIOS DE PRODUCTOS
// =====================

/**
 * 🔍 Obtener producto por código
 */

const getByCodigo = async (codigo) => {
  const [rows] = await pool.query(
    "SELECT * FROM productos WHERE codigo = ?",
    [codigo]
  );

  return rows[0];
};


/**
 * 🔍 Buscar productos (FUNCIÓN PRINCIPAL)
 * 👉 Busca por código, nombre o proveedor
 */
const search = async (q) => {

  // 🔥 Evitar traer todo si está vacío
  if (!q) return [];

  const query = `
    SELECT 
      id,
      codigo,
      nombre,
      unidad_medida,
      proveedor,
      stock,
      precio,
      (stock * precio) AS total
    FROM productos
    WHERE codigo LIKE ?
       OR nombre LIKE ?
       OR proveedor LIKE ?
  `;

  const params = [`%${q}%`, `%${q}%`, `%${q}%`];

  const [rows] = await pool.query(query, params);

  return rows;
};


/**
 * 🔍 Obtener producto por ID
 */
const getById = async (id) => {
  const [rows] = await pool.query(
    "SELECT * FROM productos WHERE id = ?",
    [id]
  );
  return rows[0];
};


/**
 * ➕ Crear producto
 * 👉 Ahora incluye código único, UM y proveedor
 */
const create = async (data) => {

  const {
    codigo,
    nombre,
    precio,
    stock,
    unidad_medida,
    proveedor
  } = data;

  const [result] = await pool.query(
    `INSERT INTO productos 
    (codigo, nombre, precio, stock, unidad_medida, proveedor, creado_en) 
    VALUES (?, ?, ?, ?, ?, ?, NOW())`,
    [codigo, nombre, precio, stock, unidad_medida, proveedor]
  );

  return {
    id: result.insertId,
    codigo,
    nombre,
    precio,
    stock,
    unidad_medida,
    proveedor,
  };
};


/**
 * ✏️ Actualizar producto
 */
const update = async (id, data) => {

  const {
    nombre,
    precio,
    stock,
    unidad_medida,
    proveedor
  } = data;

  await pool.query(
    `UPDATE productos 
     SET nombre = ?, precio = ?, stock = ?, unidad_medida = ?, proveedor = ?
     WHERE id = ?`,
    [nombre, precio, stock, unidad_medida, proveedor, id]
  );

  return getById(id);
};


/**
 * ❌ Eliminar producto
 */
const remove = async (id) => {
  await pool.query("DELETE FROM productos WHERE id = ?", [id]);
};


// 🔹 Exportar
module.exports = {
  getAll,
  getById,
  getByCodigo,
  create,
  update,
  remove,
  search // 👈 🔥 IMPORTANTE
};

