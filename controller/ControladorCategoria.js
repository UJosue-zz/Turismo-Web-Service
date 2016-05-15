/**
 * Created by HP240 on 15/05/2016.
 */
module.exports=function(modelo){
    return {
        listar:function(peticion,respuesta){
            modelo.categoria.findAll().then(function(data){
                respuesta.json(data);
            });
        },
        crear:function(peticion,respuesta){
            modelo.sequelize.query("CALL crear_Categoria('"+peticion.body.nombre+"','"+peticion.body.nota+"');")
                .then(function(){
                    respuesta.send({"mensaje":"Registro insertado correctamente","status":"200"});
                }).error(function(err){
                respuesta.send({"mensaje":"Error "+err,"status":"500"});
            });
        },
        eliminar:function (peticion,respuesta) {
            modelo.categoria.destroy({
                where:{
                    id_Categoria: peticion.params.id
                }
            }).then(function(){
                respuesta.json({"mensaje":"Categoria eliminada"});
            }).error(function(){
                throw err;
            });
        },
        editar:function (peticion,respuesta) {
            modelo.sequelize.query("CALL editar_Categoria('"+peticion.body.nombre+"','"+peticion.body.nota+"','"+peticion.params.id+"');")
                .then(function () {
                    respuesta.send({"mensaje":"Categoria editada correctamente","status":"200"});
                }).error(function (err) {
                respuesta.send({"mensaje":"Error "+err,"status":"500"});
            });
        },
        listarId:function (peticion,respuesta) {
            modelo.categoria.findById(peticion.params.id).then(function (data) {
                respuesta.json(data);
            });
        }
    }
}