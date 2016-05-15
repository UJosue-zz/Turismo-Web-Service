/**
 * Created by HP240 on 15/05/2016.
 */
var ruta=require('express').Router();
module.exports=(function(modelo){
    var rol=require('../controller/ControladorRol.js')(modelo);
    var departamento=require('../controller/ControladorDepartamento.js')(modelo);
    var categoria=require('../controller/ControladorCategoria.js')(modelo);

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

    /*
     Rutas para Departamento
     */
    ruta.get('/departamento', departamento.listar);
    ruta.post('/departamento', departamento.crear);
    ruta.delete('/departamento/:id', departamento.eliminar);
    ruta.put('/departamento/:id',departamento.editar);
    ruta.get('/departamento/:id',departamento.listarId);

    /*
     Rutas para Categoria
     */
    ruta.get('/categoria', categoria.listar);
    ruta.post('/categoria', categoria.crear);
    ruta.delete('/categoria/:id', categoria.eliminar);
    ruta.put('/categoria/:id',categoria.editar);
    ruta.get('/categoria/:id',categoria.listarId);

    return ruta;
});