var votoModel = require("../models/votoModel");

function votarGenero(req, res) {
    var genero = req.body.votoServer;
    var idUsuario = req.body.idUsuarioServer;

    if (genero == undefined) {
        res.status(400).send("Seu voto está undefined!");
    }

    votoModel.votarGenero(genero, idUsuario).then(function(resposta){
        res.status(200).send("Genêro votado!");
    })
}

function votarFoto(req, res) {
    var foto = req.body.votoServer;
    var idUsuario = req.body.idUsuarioServer;

    if (foto == undefined) {
        res.status(400).send("Seu voto está undefined!");
    }

    votoModel.votarFoto(foto, idUsuario).then(function(resposta){
        res.status(200).send("Foto votada!");
    })
}

module.exports = {
    votarGenero,
    votarFoto
}