/**
 * Created by HP240 on 16/05/2016.
 */
module.exports = function(sequelize, DataTypes) {
    return sequelize.define('historial', {
        id_Historial: {
            type: DataTypes.INTEGER(10),
            allowNull: false,
            primaryKey: true,
            autoIncrement: true
        },
        id_Usuario:{
            type: DataTypes.INTEGER(10),
            allowNull: false,
            references: {
                model: 'usuario',
                key: 'id_Usuario'
            }
        },
        id_Sitio: {
            type: DataTypes.INTEGER(10),
            allowNull: false,
            references: {
                model: 'sitio',
                key: 'id_Sitio'
            }
        }
    }, {
        tableName: 'historial',
        timestamps:false
    });
};