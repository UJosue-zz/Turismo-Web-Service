/**
 * Created by informatica on 19/05/2016.
 */
module.exports = function (modelo) {
    return{
        listar:function(peticion,respuesta){
            modelo.foto.findAll().then(function(data){
                respuesta.json(data);
            });
        },
        crear: function(peticion,respuesta) {
            modelo.sequelize.query("CALL crear_Foto('"+peticion.body.foto+"','"+peticion.body.sitio+"');")
                .then(function(){
                    respuesta.send({"mensaje":"Registro insertado correctamente","status":"200"});
                }).error(function(err){
                respuesta.send({"mensaje":"Error "+err,"status":"500"});
            });
        },
        eliminar:function (peticion,respuesta) {
            modelo.foto.destroy({
                where:{
                    id_Historial: peticion.params.id
                }
            }).then(function(){
                respuesta.json({"mensaje":"foto eliminado"});
            }).error(function(){
                throw err;
            });
        },
        editar:function (peticion,respuesta) {
            modelo.sequelize.query("CALL editar_Historial('"+peticion.body.foto+"','"+peticion.body.sitio+"','"+peticion.params.id+"');")
                .then(function () {
                    respuesta.send({"mensaje":"foto editado correctamente","status":"200"});
                }).error(function (err) {
                respuesta.send({"mensaje":"Error "+err,"status":"500"});
            });
        },
        listarId:function (peticion,respuesta) {
            modelo.foto.findById(peticion.params.id).then(function (data) {
                respuesta.json(data);
            });
        }
    }
}