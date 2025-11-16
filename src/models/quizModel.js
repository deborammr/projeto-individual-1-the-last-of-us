var database = require("../database/config");

function publicar(idUsuario, acertos, erros, pontuacao) {
    console.log(
        "ACESSEI O AVISO MODEL \n\n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n" +
        "\t\t >> verifique suas credenciais de acesso ao banco\n" +
        "\t\t >> e se o servidor de seu BD está rodando corretamente.\n\n" +
        "function publicar(): ",
        { idUsuario, acertos, erros, pontuacao }
    );

    var instrucaoSql = `
        INSERT INTO tentativa (fkUsuario, acertos, erros, pontuacao, dtHrTent)
        VALUES (${idUsuario}, ${acertos}, ${erros}, ${pontuacao}, NOW());
    `;

    return database.executar(instrucaoSql);
}


module.exports = {
    publicar
}
