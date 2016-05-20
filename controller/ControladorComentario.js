/**
 * Created by informatica on 19/05/2016.
 */
module.exports = function (modelo) {
    return{
        listar:function(peticion,respuesta){
            modelo.comentario.findAll().then(function(data){
                respuesta.json(data);
            });
        },
        crear: function(peticion,respuesta) {
            modelo.sequelize.query("CALL crear_Comentario('"+peticion.body.comentario+"','"+peticion.body.valoracion+"','"+peticion.body.usuario+"','"+peticion.body.sitio+"');")
                .then(function(){
                    respuesta.send({"mensaje":"Registro insertado correctamente","status":"200"});
                }).error(function(err){
                respuesta.send({"mensaje":"Error "+err,"status":"500"});
            });
        },
        eliminar:function (peticion,respuesta) {
            modelo.comentario.destroy({
                where:{
                    id_Comentario: peticion.params.id
                }
            }).then(function(){
                respuesta.json({"mensaje":"Comentario eliminado"});
            }).error(function(){
                throw err;
            });
        },
        editar:function (peticion,respuesta) {
            modelo.sequelize.query("CALL editar_Comentario('"+peticion.body.comentario+"','"+peticion.body.valoracion+"','"+peticion.body.usuario+"','"+peticion.body.sitio+"','"+peticion.params.id+"');")
                .then(function () {
                    respuesta.send({"mensaje":"Comentario editado correctamente","status":"200"});
                }).error(function (err) {
                respuesta.send({"mensaje":"Error "+err,"status":"500"});
            });
        },
        listarId:function (peticion,respuesta) {
            modelo.comentario.findById(peticion.params.id).then(function (data) {
                respuesta.json(data);
            });
        }
    }
}