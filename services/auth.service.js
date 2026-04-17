// 🔹 Importar modelo de usuario
const userModel = require('../models/user.model');

// 🔹 Librerías de seguridad
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');

// 🔹 Usar variable de entorno (.env)
const SECRET = process.env.JWT_SECRET || "secreto_dev";

/**
 * 👤 REGISTRO DE USUARIO
 * 
 * 👉 Crea un nuevo usuario en la base de datos
 */
exports.register = async ({ name, email, password, role }) => {

  // 🔹 Validación básica
  if (!name || !email || !password) {
    throw new Error("Todos los campos son obligatorios");
  }

  // 🔹 Verificar si ya existe el usuario
  const existing = await userModel.findByEmail(email);
  if (existing) {
    throw new Error("El usuario ya existe");
  }

  // 🔹 Encriptar contraseña
  const hashedPassword = await bcrypt.hash(password, 10);

  // 🔹 Crear usuario
  const user = await userModel.create({
    name,
    email,
    password: hashedPassword,
    role: role || "user"
  });

  // 🔹 Retornar usuario sin contraseña
  return {
    id: user.id,
    name: user.name,
    email: user.email,
    role: user.role
  };
};


/**
 * 🔐 LOGIN DE USUARIO
 * 
 * 👉 Valida credenciales y genera token JWT
 */
exports.login = async (email, password) => {

  // 🔹 Validación básica
  if (!email || !password) {
    throw new Error("Email y contraseña requeridos");
  }

  // 🔹 Buscar usuario
  const user = await userModel.findByEmail(email);

  // 🔹 Mensaje genérico por seguridad
  if (!user) {
    throw new Error("Credenciales incorrectas");
  }

  // 🔹 Comparar contraseña encriptada
  const valid = await bcrypt.compare(password, user.password);

  if (!valid) {
    throw new Error("Credenciales incorrectas");
  }

  // 🔹 Generar token JWT
  const token = jwt.sign(
    {
      id: user.id,
      email: user.email,
      role: user.role
    },
    SECRET,
    {
      expiresIn: "1h"
    }
  );

  // 🔹 Retornar token + usuario seguro
  return {
    token,
    user: {
      id: user.id,
      name: user.name,
      email: user.email,
      role: user.role
    }
  };
};

