var express = require("express");
var router = express.Router();

var votoController = require("../controllers/votoController");

router.put("/votarGenero", function (req, res) {
    // função a ser chamada quando acessar /voto/cadastrar
    votoController.votarGenero(req, res);
});

router.put("/votarFoto", function (req, res) {
    // função a ser chamada quando acessar /voto/cadastrar
    votoController.votarFoto(req, res);
});

module.exports = router;