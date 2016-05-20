/**
 * Created by HP240 on 16/05/2016.
 */
module.exports = function (sequelize, DataTypes) {
    return sequelize.define('usuario', {
        id_Usuario: {
            type: DataTypes.INTEGER(10),
            allowNull: false,
            primaryKey: true,
            autoIncrement: true
        },
        nombre: {
            type: DataTypes.STRING,
            allowNull: true
        },
        nacionalidad: {
            type: DataTypes.STRING,
            allowNull: true
        },
        correo: {
            type: DataTypes.STRING,
            allowNull: true
        },
        nick: {
            type: DataTypes.STRING,
            allowNull: true
        },
        contrasena: {
            type: DataTypes.STRING,
            allowNull: true
        },
        foto: {
            type: DataTypes.BLOB,
            allowNull: true
        },
        id_Rol: {
            type: DataTypes.INTEGER(10),
            allowNull: false,
            references: {
                model: 'rol',
                key: 'id_Rol'
            }
        },
        id_Sitio: {
            type: DataTypes.INTEGER(10),
            allowNull: true,
            references: {
                model: 'sitio',
                key: 'id_Sitio'
            }
        }
    }, {
        tableName: 'usuario',
        timestamps: false
    });
};