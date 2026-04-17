const express = require("express");
const router  = express.Router();
const { verifyToken, isAdmin } = require("../middlewares/auth.middleware");
const productService = require("../services/product.service");
// ❌ ya no necesitas pool aquí

/**
 * 🔍 GET /api/productos/search?q=
 * 👉 Buscar por código, nombre o proveedor
 */
router.get("/search", verifyToken, async (req, res) => {
  try {
    const { q } = req.query;
    const productos = await productService.search(q || "");
    res.json(productos);
  } catch (error) {
    console.error("❌ Error buscando productos:", error);
    res.status(500).json({ message: "Error en búsqueda" });
  }
});

/**
 * 🔍 GET /api/productos/codigo/:codigo
 * 👉 Buscar producto por código exacto (para entradas de almacén)
 */
router.get("/codigo/:codigo", verifyToken, async (req, res) => {
  try {
    const producto = await productService.getByCodigo(req.params.codigo);

    if (!producto) {
      return res.status(404).json({ message: "Producto no encontrado" });
    }

    res.json(producto);

  } catch (error) {
    console.error("❌ Error buscando por código:", error);
    res.status(500).json({ message: "Error buscando producto" });
  }
});

/**
 * 📦 GET /api/productos
 * 👉 Obtener todos los productos
 */
router.get("/", verifyToken, async (req, res) => {
  try {
    const productos = await productService.getAll();
    res.json(productos);
  } catch (error) {
    console.error("❌ Error obteniendo productos:", error);
    res.status(500).json({ message: "Error obteniendo productos" });
  }
});

/**
 * 🔍 GET /api/productos/:id
 * 👉 Obtener producto por ID
 */
router.get("/:id", verifyToken, async (req, res) => {
  try {
    const producto = await productService.getById(req.params.id);
    if (!producto) {
      return res.status(404).json({ message: "Producto no encontrado" });
    }
    res.json(producto);
  } catch (error) {
    console.error("❌ Error obteniendo producto:", error);
    res.status(500).json({ message: "Error obteniendo producto" });
  }
});

/**
 * ➕ POST /api/productos
 * 👉 Crear producto — solo ADMIN
 */
router.post("/", verifyToken, isAdmin, async (req, res) => {
  try {
    const { codigo, nombre } = req.body;
    if (!codigo || !nombre) {
      return res.status(400).json({ message: "Código y nombre son obligatorios" });
    }
    const nuevoProducto = await productService.create(req.body);
    res.status(201).json(nuevoProducto);
  } catch (error) {
    console.error("❌ Error creando producto:", error);
    if (error.code === "ER_DUP_ENTRY") {
      return res.status(400).json({ message: "El código del producto ya existe" });
    }
    res.status(500).json({ message: "Error creando producto" });
  }
});

/**
 * ✏️ PUT /api/productos/:id
 * 👉 Actualizar producto — solo ADMIN
 */
router.put("/:id", verifyToken, isAdmin, async (req, res) => {
  try {
    const actualizado = await productService.update(req.params.id, req.body);
    res.json(actualizado);
  } catch (error) {
    console.error("❌ Error actualizando producto:", error);
    res.status(500).json({ message: "Error actualizando producto" });
  }
});

/**
 * ❌ DELETE /api/productos/:id
 * 👉 Eliminar producto — solo ADMIN
 */
router.delete("/:id", verifyToken, isAdmin, async (req, res) => {
  try {
    await productService.remove(req.params.id);
    res.json({ message: "Producto eliminado correctamente" });
  } catch (error) {
    console.error("❌ Error eliminando producto:", error);
    res.status(500).json({ message: "Error eliminando producto" });
  }
});

module.exports = router;
