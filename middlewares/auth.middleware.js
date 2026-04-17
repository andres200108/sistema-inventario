// 🔹 Importar jsonwebtoken
const jwt = require("jsonwebtoken");

// 🔹 Usar secreto desde .env (MUY IMPORTANTE)
const SECRET = process.env.JWT_SECRET || "secreto_dev";

/**
 * 🔐 Middleware: Verificar Token JWT
 *
 * 👉 Protege rutas privadas
 * 👉 Extrae y valida el token enviado en headers
 */
exports.verifyToken = (req, res, next) => {
  try {
    // 🔹 Obtener header Authorization
    const authHeader = req.headers["authorization"];

    // 🔹 Validar existencia del header
    if (!authHeader) {
      return res.status(401).json({
        message: "Token requerido",
      });
    }

    // 🔹 Validar formato Bearer TOKEN
    if (!authHeader.startsWith("Bearer ")) {
      return res.status(400).json({
        message: "Formato de token inválido",
      });
    }

    // 🔹 Extraer token
    const token = authHeader.split(" ")[1];

    // 🔹 Verificar token
    const decoded = jwt.verify(token, SECRET);

    // 🔹 Guardar datos del usuario en request
    req.user = decoded; // { id, email, rol }

    next();
  } catch (error) {
    console.error("❌ Error en verifyToken:", error.message);

    return res.status(403).json({
      message: "Token inválido o expirado",
    });
  }
};

/**
 * 👑 Middleware: Solo ADMIN
 *
 * 👉 Permite acceso solo a usuarios con rol "admin"
 */
exports.isAdmin = (req, res, next) => {
  if (!req.user || req.user.rol !== "admin") {  // 👈 rol, no role
    return res.status(403).json({
      message: "Acceso solo para administradores",
    });
  }
  next();
};

exports.hasRole = (roles) => {
  return (req, res, next) => {
    if (!req.user || !roles.includes(req.user.rol)) {  // 👈 rol, no role
      return res.status(403).json({
        message: "No tienes permisos",
      });
    }
    next();
  };
};
