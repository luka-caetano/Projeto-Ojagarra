var database = require("../database/config")

function votarGenero(genero, idUsuario) {
    var instrucao = `
        UPDATE perfil SET fkGenero = ${genero} WHERE idPerfil = ${idUsuario};
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function votarFoto(foto, idUsuario) {
    var instrucao = `
        UPDATE perfil SET fkFoto = ${foto} WHERE idPerfil = ${idUsuario};
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

module.exports = {
    votarGenero,
    votarFoto
};