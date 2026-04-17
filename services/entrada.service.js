const pool = require("../config/db");

/**
 * ➕ Registrar entrada
 */
const create = async (data) => {

  const {
    codigo,
    cantidad,
    numero_remision
  } = data;

  // 🔍 Buscar producto existente
  const [productoRows] = await pool.query(
    "SELECT * FROM productos WHERE codigo = ?",
    [codigo]
  );

  if (productoRows.length === 0) {
    throw new Error("Producto no existe");
  }

  const producto = productoRows[0];

  // 📥 Insertar entrada
  const [result] = await pool.query(
    `INSERT INTO entradas 
    (producto_id, codigo, nombre, proveedor, cantidad, precio, numero_remision)
    VALUES (?, ?, ?, ?, ?, ?, ?)`,
    [
      producto.id,
      producto.codigo,
      producto.nombre,
      producto.proveedor,
      cantidad,
      producto.precio,
      numero_remision
    ]
  );

  // 📦 Actualizar stock
  await pool.query(
    "UPDATE productos SET stock = stock + ? WHERE id = ?",
    [cantidad, producto.id]
  );

  return {
    id: result.insertId,
    ...data
  };
};

module.exports = {
  create
};

