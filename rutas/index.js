/**
 * Created by HP240 on 15/05/2016.
 */
var ruta=require('express').Router();
module.exports=(function(modelo){
    var rol=require('../controller/ControladorRol.js')(modelo);

    ruta.get('/',function(peticion,respuesta){
        respuesta.send("Servicio iniciado");
    });

    /*
     Rutas para Rol
     */
    ruta.post('/rol',rol.crear);
    ruta.get('/rol',rol.listar);
    ruta.delete('/rol/:id', rol.eliminar);
    ruta.put('/rol/:id',rol.editar);
    ruta.get('/rol/:id',rol.listarId);


    return ruta;
});