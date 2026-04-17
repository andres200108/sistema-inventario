const db = require('../config/db');

exports.getAll = async () => {
  const [rows] = await db.query('SELECT * FROM productos');
  return rows;
};

exports.create = async (product) => {
  const { nombre, precio, stock } = product;

  const [result] = await db.query(
    'INSERT INTO productos (nombre, precio, stock) VALUES (?, ?, ?)',
    [nombre, precio, stock]
  );

  return {
    id: result.insertId,
    nombre,
    precio,
    stock
  };
};
