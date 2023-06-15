var avisoModel = require("../models/avisoModel");
var path = require("path");
var multer = require('multer');
var upload = multer({dest: './public/assets/buckets/'});
var fs = require('fs');

function testar(req, res) {
    console.log("ENTRAMOS NO avisoController");
    res.send("ENTRAMOS NO AVISO CONTROLLER");
}

function listarFeed(req, res) {
    var idUsuario = req.params.idUsuario;

    avisoModel.listarFeed(idUsuario)
        .then(resultado => {
            res.json(resultado);
        }).catch(err => {
            res.status(500).send(err);
        });
}

function publicar(req, res) {
    const ftPost = req.file.filename;

    const idUsuario = req.body.idUsuario

    const { titulo, descricao } = req.body

    const post = { titulo, descricao, ftPost, idUsuario }

    avisoModel.publicar(post)
        .then(
            function (resultado) {
                res.json(resultado);
            }
        ).catch(
            function (erro) {
                console.log(erro);
                console.log("Houve um erro ao realizar postagem: ", erro.sqlMessage);
                res.status(500).json(erro.sqlMessage);
            }
        );
}







function listarPorUsuario(req, res) {
    var idUsuario = req.params.idUsuario;

    avisoModel.listarPorUsuario(idUsuario)
        .then(
            function (resultado) {
                if (resultado.length > 0) {
                    res.status(200).json(resultado);
                } else {
                    res.status(204).send("Nenhum resultado encontrado!");
                }
            }
        )
        .catch(
            function (erro) {
                console.log(erro);
                console.log(
                    "Houve um erro ao buscar os avisos: ",
                    erro.sqlMessage
                );
                res.status(500).json(erro.sqlMessage);
            }
        );
}

function pesquisarDescricao(req, res) {
    var descricao = req.params.descricao;

    avisoModel.pesquisarDescricao(descricao)
        .then(
            function (resultado) {
                if (resultado.length > 0) {
                    res.status(200).json(resultado);
                } else {
                    res.status(204).send("Nenhum resultado encontrado!");
                }
            }
        ).catch(
            function (erro) {
                console.log(erro);
                console.log("Houve um erro ao buscar os avisos: ", erro.sqlMessage);
                res.status(500).json(erro.sqlMessage);
            }
        );
}



function editar(req, res) {
    var novaDescricao = req.body.descricao;
    var idAviso = req.params.idAviso;

    avisoModel.editar(novaDescricao, idAviso)
        .then(
            function (resultado) {
                res.json(resultado);
            }
        )
        .catch(
            function (erro) {
                console.log(erro);
                console.log("Houve um erro ao realizar o post: ", erro.sqlMessage);
                res.status(500).json(erro.sqlMessage);
            }
        );

}

function deletar(req, res) {
    var idAviso = req.params.idAviso;

    avisoModel.deletar(idAviso)
        .then(
            function (resultado) {
                res.json(resultado);
            }
        )
        .catch(
            function (erro) {
                console.log(erro);
                console.log("Houve um erro ao deletar o post: ", erro.sqlMessage);
                res.status(500).json(erro.sqlMessage);
            }
        );
}

module.exports = {
    testar,
    listarFeed,
    listarPorUsuario,
    pesquisarDescricao,
    publicar,
    editar,
    deletar
}