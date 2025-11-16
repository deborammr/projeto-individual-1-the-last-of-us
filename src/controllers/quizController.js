var quizModel = require("../models/quizModel");

function publicar(req, res) {

    var acertos = req.body.acertos;
    var erros = req.body.erros;
    var pontuacao = req.body.pontuacao;
    var idUsuario = req.params.idUsuario;

    if (acertos == undefined) {
        res.status(400).send("Acertos está indefinido!");
    } else if (erros == undefined) {
        res.status(400).send("Erros está indefinido!");
    } else if (pontuacao == undefined) {
        res.status(400).send("Pontuação está indefinido!");
    } else if (idUsuario == undefined) {
        res.status(403).send("O id do usuário está indefinido!");
    } else {
        quizModel.publicar(idUsuario, acertos, erros, pontuacao)
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
}



module.exports = {
    publicar
}