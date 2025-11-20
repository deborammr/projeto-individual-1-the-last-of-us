var express = require("express");
var router = express.Router();

var medidaController = require("../controllers/medidaController");

router.get("/ultimas/:idUsuario", function (req, res) {
    medidaController.buscarUltimasMedidas(req, res);
});

router.get("/tempo-real/:idUsuario", function (req, res) {
    medidaController.buscarMedidasEmTempoReal(req, res);
})

router.get("/medias/:idUsuario", function (req, res) {
    medidaController.buscarMediasUsuario(req, res);
})

router.get("/mediasGerais", function (req, res) {
    medidaController.buscarMediasGerais(req, res);
})

module.exports = router;
