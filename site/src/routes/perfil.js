const express = require('express');
const router = express.Router();
const upload = require('../config/configUpload'); // ARQUIVO COM A COFIGURAÇÃO DO UPLOAD
const perfilController = require('../controllers/perfilController');

router.get("", (req, res) => {
  res.render("index")
});

// upload.single('foto') vai buscar no json alguma propriedade chamada foto 
router.post('/cadastro', upload.single('foto'), (req, res) => {
  perfilController.salvar(req, res);
});

router.get('/:idUsuario', upload.single('foto'), (req, res) => {
  perfilController.buscarPerfilPeloId(req, res);
});

module.exports = router;