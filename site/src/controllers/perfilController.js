const perfilModel = require('../models/perfilModel');


function salvar(req, res) {
  const imagem = req.file.filename;

  const idUsuario = req.body.idUsuario

  const {nome, bio } = req.body

  const perfil = { nome, bio, imagem, idUsuario}

  console.log(perfil);
  
  perfilModel.salvar(perfil)
  .then(resultado => {
    console.log(resultado);
    res.status(201).send("Perfil criado com sucesso");
  }).catch(err => {
    res.status(500).send(err);
  });
}

function buscarPerfilPeloId(req, res) {
  console.log(req.params.id);
  perfilModel.buscarPerfilPeloId(req.params.id)
  .then(resultado => {
    res.json(resultado);
  }).catch(err => {
    res.status(500).send(err);
  });
}

module.exports = { salvar, buscarPerfilPeloId }