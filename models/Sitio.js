/**
 * Created by HP240 on 15/05/2016.
 */
module.exports = function(sequelize, DataTypes) {
    return sequelize.define('sitio', {
        id_Sitio: {
            type: DataTypes.INTEGER(10),
            allowNull: false,
            primaryKey: true,
            autoIncrement: true
        },
        nombre: {
            type: DataTypes.STRING,
            allowNull: true
        },
        latitud: {
            type: DataTypes.DOUBLE,
            allowNull: true
        },
        longitud: {
            type: DataTypes.DOUBLE,
            allowNull: true
        },
        direccion: {
            type: DataTypes.STRING,
            allowNull: true
        },
        correo: {
            type: DataTypes.STRING,
            allowNull: true
        },
        informacion: {
            type: DataTypes.STRING,
            allowNull: true
        },
        id_Departamento:{
            type: DataTypes.INTEGER(10),
            allowNull: false,
            references: {
                model: 'departamento',
                key: 'id_Departamento'
            }
        },
        id_Categoria: {
            type: DataTypes.INTEGER(10),
            allowNull: false,
            references: {
                model: 'categoria',
                key: 'id_Categoria'
            }
        }
    }, {
        tableName: 'sitio',
        timestamps:false
    });
};