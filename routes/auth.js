// ─────────────────────────────────────────────────────────────────────────────
// MÓDULO: Autenticación
// RUTA BASE: /api/auth
// DESCRIPCIÓN: Maneja el inicio y cierre de sesión de los usuarios del SGI.
//              Usa JWT para generar tokens y bcrypt para verificar contraseñas.
// ─────────────────────────────────────────────────────────────────────────────

const express = require("express");
const router  = express.Router();
const jwt     = require("jsonwebtoken");
const bcrypt  = require("bcrypt");
const pool    = require("../config/db");

// Secreto para firmar el token JWT — se lee desde .env
// Si no existe la variable, usa "secreto_dev" solo en desarrollo
const JWT_SECRET = process.env.JWT_SECRET || "secreto_dev";


// ─────────────────────────────────────────────────────────────────────────────
// POST /api/auth/login
//
// DESCRIPCIÓN: Autentica a un usuario con email y contraseña.
//              Si las credenciales son válidas, devuelve un token JWT
//              y los datos básicos del usuario.
//
// BODY (JSON):
//   - email    {string} — correo del usuario
//   - password {string} — contraseña en texto plano
//
// RESPUESTAS:
//   200 — Login exitoso → { token, usuario }
//   400 — Faltan campos obligatorios
//   401 — Credenciales incorrectas (email no existe o password inválido)
//   403 — Cuenta desactivada
//   500 — Error interno del servidor
// ─────────────────────────────────────────────────────────────────────────────
router.post("/login", async (req, res) => {
  try {
    const { email, password } = req.body;

    // 1. Validar que se enviaron los dos campos requeridos
    if (!email || !password) {
      return res.status(400).json({ message: "Email y contraseña requeridos" });
    }

    // 2. Buscar el usuario en la BD por email
    //    Solo se traen los campos necesarios (nunca SELECT *)
    const [rows] = await pool.query(
      "SELECT id, nombre, email, password_hash, rol, activo FROM usuario WHERE email = ?",
      [email]
    );

    // 3. Si no existe ningún usuario con ese email, rechazar
    //    Se usa el mismo mensaje que password incorrecta para no
    //    revelar si el email está registrado o no (seguridad)
    if (rows.length === 0) {
      return res.status(401).json({ message: "Credenciales incorrectas" });
    }

    const user = rows[0];

    // 4. Verificar que la cuenta esté activa
    //    Un admin puede desactivar usuarios sin eliminarlos (RF-08)
    if (!user.activo) {
      return res.status(403).json({ message: "Cuenta desactivada. Contacta al administrador." });
    }

    // 5. Comparar la contraseña ingresada con el hash almacenado en BD
    //    bcrypt.compare() retorna true si coinciden, false si no
    //    Nunca se almacena la contraseña en texto plano (RNF-04)
    const passwordValida = await bcrypt.compare(password, user.password_hash);

    if (!passwordValida) {
      return res.status(401).json({ message: "Credenciales incorrectas" });
    }

    // 6. Generar el token JWT con los datos del usuario
    //    El payload incluye id, nombre, email y rol para que
    //    el middleware de autenticación pueda verificar permisos
    //    sin consultar la BD en cada petición
    const token = jwt.sign(
      {
        id:     user.id,
        nombre: user.nombre,
        email:  user.email,
        rol:    user.rol,    // 'admin' | 'auxiliar'
      },
      JWT_SECRET,
      { expiresIn: "8h" }   // El token expira en 8 horas (RNF-05)
    );

    // 7. Responder con el token y los datos básicos del usuario
    //    El frontend guarda el token en localStorage para
    //    incluirlo en las peticiones siguientes
    res.json({
      token,
      usuario: {
        id:     user.id,
        nombre: user.nombre,
        email:  user.email,
        rol:    user.rol,
      },
    });

  } catch (error) {
    // Error inesperado — se loguea en servidor pero no se expone al cliente
    console.error("❌ Error en login:", error);
    res.status(500).json({ message: "Error en login" });
  }
});


// Exportar el router para usarlo en app.js
module.exports = router;
