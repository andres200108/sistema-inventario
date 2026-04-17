const db = require('../config/db');

// 🔍 Buscar usuario por email (login)
exports.findByEmail = async (email) => {
  const [rows] = await db.query(
    "SELECT * FROM users WHERE email = ?",
    [email]
  );
  return rows[0];
};

// ➕ Crear usuario
exports.create = async ({ name, email, password, role }) => {
  const [result] = await db.query(
    `INSERT INTO users (name, email, password, role)
     VALUES (?, ?, ?, ?)`,
    [name, email, password, role]
  );

  return {
    id: result.insertId,
    name,
    email,
    role
  };
};

// 📋 Obtener todos los usuarios
exports.getAll = async () => {
  const [rows] = await db.query("SELECT id, name, email, role FROM users");
  return rows;
};

