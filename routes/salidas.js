const express = require("express");
const router = express.Router();

const { verifyToken } = require("../middlewares/auth.middleware");
const salidaService = require("../services/salida.service");

/**
 * 📤 Registrar salida
 */
router.post("/", verifyToken, async (req, res) => {
  try {

    const { codigo, cantidad } = req.body;

    if (!codigo || !cantidad) {
      return res.status(400).json({
        message: "Código y cantidad son obligatorios"
      });
    }

    const nuevaSalida = await salidaService.create(req.body);

    res.status(201).json(nuevaSalida);

  } catch (error) {
    console.error("❌ Error registrando salida:", error.message);
    res.status(400).json({ message: error.message });
  }
});

module.exports = router;
