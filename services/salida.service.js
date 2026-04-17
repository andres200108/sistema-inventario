const pool = require("../config/db");

/**
 * 📤 Registrar salida
 */
const create = async (data) => {

  const { codigo, cantidad, motivo } = data;

  // 🔍 Buscar producto
  const [rows] = await pool.query(
    "SELECT * FROM productos WHERE codigo = ?",
    [codigo]
  );

  if (rows.length === 0) {
    throw new Error("Producto no existe");
  }

  const producto = rows[0];

  // ❌ Validar stock
  if (producto.stock < cantidad) {
    throw new Error("Stock insuficiente");
  }

  // 📤 Registrar salida
  const [result] = await pool.query(
    `INSERT INTO salidas
    (producto_id, codigo, nombre, proveedor, cantidad, precio, motivo)
    VALUES (?, ?, ?, ?, ?, ?, ?)`,
    [
      producto.id,
      producto.codigo,
      producto.nombre,
      producto.proveedor,
      cantidad,
      producto.precio,
      motivo || "Salida manual"
    ]
  );

  // 📉 Descontar stock
  await pool.query(
    "UPDATE productos SET stock = stock - ? WHERE id = ?",
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
