/**
 * Created by HP240 on 15/05/2016.
 */
(function () {
    //Librerías para el webservice
    var express = require('express');
    var bodyParser=require('body-parser');
    var morgan=require('morgan');
    var mysql=require('mysql');
    var puerto=3000;
    var config = require('./config');
    var modelo = require('./models')

    //Configuración del web service
    //Declarar app como servidor
    var app=express();
    //Configuración
    app.use(bodyParser.urlencoded({
        extended:false
    }));
    app.use(bodyParser.json());
    app.use(morgan('dev'));
    app.use('/api/v1',require('./rutas')(modelo));

    modelo.sequelize.sync().then(function(){
        app.listen(puerto,function(){
            console.log("Servidor iniciado en el puerto: "+puerto);
        });
    });
})();