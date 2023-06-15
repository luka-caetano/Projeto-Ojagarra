var dashboardModel = require("../models/dashboardModel");

function buscarUltimosVotos(req, res) {

    const limite_linhas = 3;

    var idUsuario = req.params.idUsuario;

    console.log(`Recuperando os ultimos votos`);

    medidaModel.buscarUltimosVotos(idUsuario, limite_linhas)
    .then(
        function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(
        function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar os ultimos votos.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

module.exports = {
    buscarUltimosVotos
}