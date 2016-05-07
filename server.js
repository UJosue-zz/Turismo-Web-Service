/**
 * Created by informatica on 06/05/2016.
 */
(function () {
    var express = require('express');
    var bodyParser = require('body-parser');
    var morgan = require('morgan');
    var mysql = require('mysql');
    var Sequelize = require('sequelize');

    var sequelize = new Sequelize('db_turismo', 'root', '', {
        host: 'localhost',
        dialect: 'mysql',
        pool: {
            max: 20,
            min: 0
        }
    });

    /*
        Declaracion de los modelos
     */
    /*var Rol = sequelize.define('rol', {
        id_rol : { type: sequelize.INTEGER, primaryKey: true, autoIncrement: true},
        nombre : { type: sequelize.STRING, allowNull : true},
        nota: {type: sequelize.STRING, allowNull : true}
    });

    var Categoria = sequelize.define('categoria', {
        id_Categoria : { type: sequelize.INTEGER, primaryKey: true, autoIncrement: true},
        nombre : { type: sequelize.STRING, allowNull : true},
        nota: {type: sequelize.STRING, allowNull : true}
    });*/

    var Departamento = sequelize.define('departamento', {
        id_Departamento : { type: Sequelize.INTEGER, primaryKey: true, autoIncrement: true},
        nombre : { type: Sequelize.STRING, allowNull : true},
        nota: {type: Sequelize.STRING, allowNull : true}
    })

    /*var Sitio = sequelize.define('sitio',{
        id_Sitio : { type: sequelize.INTEGER, primaryKey: true, autoIncrement: true},
        nombre : { type: sequelize.STRING, allowNull : true},
        latitud: {type: sequelize.DOUBLE, allowNull: true},
        longitud: {type: sequelize.DOUBLE, allowNull: true},
        informacion: {type: sequelize.STRING, allowNull : true},
        id_Categoria: { type: sequelize.INTEGER, references:{
            model: Categoria,
            key: 'id_Categoria'
        }},
        id_Departamento: { type: sequelize.INTEGER, references:{
            model: Departamento,
            key: 'id_Departamento'
        }}
    });

    Sitio.hasMany(Departamento, {foreignKey: 'id_Departamento'});

    var Usuario = sequelize.define('usuario', {
        id_Usuario: { type: sequelize.INTEGER, primaryKey: true, autoIncrement: true},
        nombre: { type: sequelize.STRING, allowNull: true},
        nacionalidad: {type: sequelize.STRING, allowNull: true},
        correo: {type: sequelize.STRING, allowNull: true},
        nick: {type: sequelize.STRING, allowNull: true},
        contrasena: {type: sequelize.STRING, allowNull: true},
        id_Rol: {type: sequelize.INTEGER, references:{
            model: Rol,
            key: 'id_Rol'
        }},
        id_Sitio: { type: sequelize.INTEGER, references:{
            model: Sitio,
            key: 'id_Sitio'
        }}
    });

    var Comentario = sequelize.define('comentario', {
        id_Comentario : { type: sequelize.INTEGER, primaryKey: true, autoIncrement: true},
        nombre : { type: sequelize.STRING, allowNull : true},
        nota: {type: sequelize.STRING, allowNull : true}
    });

    var Foto = sequelize.define('foto', {
        id_Foto: {type: sequelize.INTEGER, primaryKey: true, autoIncrement: true},
        foto: {type: sequelize.LONG_BLOB, allowNull : true},
        id_Sitio: {type: sequelize.INTEGER, references:{
            model: Sitio,
            key: 'id_Sitio'
        }}
    });

    var Historial = sequelize.define('historial', {
        id_Historial: {type: sequelize.INTEGER, primaryKey: true, autoIncrement: true},
        id_Sitio: {type: sequelize.INTEGER, references:{
            model: Sitio,
            key: 'id_Sitio'
        }},
        id_Usuario: {type: sequelize.INTEGER, references:{
            model: Usuario,
            key: 'id_Usuario'
        }}
    })*/
    /*
        Configuración del servidor
     */

    sequelize.sync({ force: false});
    var puerto=3000;
    var conf=require('./config');
    var app = express();
    app.use(bodyParser.urlencoded({
        extended: true
    }));
    app.use(bodyParser.json());
    app.use('/api/v1', require('./routes')(app));
    app.use(morgan('dev'));
    app.set('departamento', Departamento);
    app.listen(puerto, function () {
        console.log("Servidor iniciado en el puerto: " + puerto);
        console.log("Debug del server: ");
    })
})();