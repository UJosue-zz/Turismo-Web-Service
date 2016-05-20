/**
 * Created by informatica on 19/05/2016.
 */
module.exports = function (sequelize, DataTypes) {
    return sequelize.define('comentario',{
            id_Comentario: {
                type: DataTypes.INTEGER(10),
                allowNull: false,
                primaryKey: true,
                autoIncrement: true
            },
        comentario:{
        type: DataTypes.STRING,
            allowNull: true
    },
    valoracion:{
        type: DataTypes.INTEGER(2),
            allowNull: true
    },
            id_Usuario:{
                type: DataTypes.INTEGER,
                allowNull: false,
                references:{
                    model: 'usuario',
                    key: 'id_Usuario'
                }
            },
            id_Sitio: {
                type: DataTypes.INTEGER,
                allowNull: false,
                references: {
                    model: 'sitio',
                    key: 'id_Sitio'
                }
            }
        },{
            tableName: 'comentario',
            timestamps: false
        }
    );
}