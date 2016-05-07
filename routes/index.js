/**
 * Created by informatica on 06/05/2016.
 */
var ruta = require('express').Router();
module.exports = (function (app) {
    var departamento = require('../controllers/DepartamentoController')(app);
    /*
    Rutas para los departamentos
     */
    ruta.get('/departamento', departamento.list);
    ruta.post('/departamento', departamento.add);
    ruta.put('/departamento', departamento.edit);
    ruta.delete('/departamento', departamento.delete);
    ruta.get('/departamento', departamento.porId);

    return ruta;
})