var database = require("../database/config");

function buscarUltimasMedidas(idUsuario, limite_linhas) {

    var instrucaoSql = `                      
                        SELECT
                            acertos,
                            erros,
                            pontuacao,
                            DATE_FORMAT(dtHrTent, '%d/%m/%y %H:%i:%s') AS dtHrTent
                        FROM tentativa
                        JOIN usuario ON usuario.idUsuario = tentativa.fkUsuario
                        WHERE fkUsuario = ${idUsuario}
                        ORDER BY dtHrTent DESC LIMIT ${limite_linhas};`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarMedidasEmTempoReal(idUsuario) {

    var instrucaoSql = `SELECT
                            acertos,
                            erros,
                            pontuacao,
                            DATE_FORMAT(dtHrTent, '%d/%m/%y %H:%i:%s') AS dtHrTent
                        FROM tentativa
                        JOIN usuario ON usuario.idUsuario = tentativa.fkUsuario
                        WHERE fkUsuario = ${idUsuario}
                        ORDER BY dtHrTent DESC LIMIT 1`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarMediasUsuario(idUsuario) {

    var instrucaoSql = `SELECT
                            AVG(acertos) AS mediaAcertos,
                            AVG(erros) AS mediaErros,
                            AVG(pontuacao) AS mediaPontuacao
                        FROM tentativa
                        WHERE fkUsuario = ${idUsuario};`

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarMediasGerais(){

    var instrucaoSql = `SELECT
                            AVG(acertos) AS mediaAcertos,
                            AVG(erros) AS mediaErros,
                            AVG(pontuacao) AS mediaPontuacao
                        FROM tentativa;`

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal,
    buscarMediasUsuario,
    buscarMediasGerais
}