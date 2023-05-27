const database = require("../database/config");

function salvar(perfil) {
  const instrucao = `
    INSERT INTO perfil (fkUsuario, nome, bio, ftPerfil) VALUES (${perfil.idUsuario}, '${perfil.nome}', '${perfil.bio}', '${perfil.imagem}')`;

  return database.executar(instrucao)
    .then(resultado => {
      console.log('Perfil salvo com sucesso!');
      // Outras ações após a inserção do perfil
    })
    .catch(erro => {
      console.error('Erro ao salvar o perfil:', erro);
      // Tratar o erro adequadamente
    });
}

function buscarPerfilPeloId(id) {
  const instrucao = `select * from perfil where idPerfil = ${id}`;

  return database.executar(instrucao);
}

module.exports = { salvar, buscarPerfilPeloId }