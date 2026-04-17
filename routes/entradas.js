const express = require("express");
const router = express.Router();

const { verifyToken } = require("../middlewares/auth.middleware");
const entradaService = require("../services/entrada.service");

/**
 * 📥 Registrar entrada
 */
router.post("/", verifyToken, async (req, res) => {
  try {

    const { codigo, cantidad, numero_remision } = req.body;

    if (!codigo || !cantidad) {
      return res.status(400).json({
        message: "Código y cantidad son obligatorios"
      });
    }

    const nuevaEntrada = await entradaService.create(req.body);

    res.status(201).json(nuevaEntrada);

  } catch (error) {
    console.error("❌ Error registrando entrada:", error);
    res.status(400).json({ message: error.message });
  }
});

module.exports = router;
