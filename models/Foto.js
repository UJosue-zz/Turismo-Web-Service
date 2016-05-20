/**
 * Created by informatica on 19/05/2016.
 */
module.exports = function (sequelize, DataTypes) {
    return sequelize.define('foto',{
            id_Foto: {
                type: DataTypes.INTEGER(10),
                allowNull: false,
                primaryKey: true,
                autoIncrement: true
            },
            foto:{
                type: DataTypes.BLOB,
                allowNull: false,
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
            tableName: 'foto',
            timestamps: false
        }
    );
}