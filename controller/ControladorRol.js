/**
 * Created by HP240 on 15/05/2016.
 */
module.exports=function(modelo){
    return {
        listar:function(req,res){
            modelo.rol.findAll().then(function(data){
                res.json(data);
            });
        },
        crear:function(peticion,respuesta){
            modelo.sequelize.query("CALL crear_Rol('"+peticion.body.nombre+"','"+peticion.body.nota+"');")
                .then(function(){
                    respuesta.send({"mensaje":"Registro insertado correctamente","status":"200"});
                }).error(function(err){
                respuesta.send({"mensaje":"Error "+err,"status":"500"});
            });
        },
        eliminar:function (peticion,respuesta) {
            modelo.rol.destroy({
                where:{
                    id_Rol: peticion.params.id
                }
            }).then(function(){
                respuesta.json({"mensaje":"Rol eliminado"});
            }).error(function(){
                throw err;
            });
        },
        editar:function (peticion,respuesta) {
            modelo.sequelize.query("CALL editar_Rol('"+peticion.body.nombre+"','"+peticion.body.nota+"','"+peticion.params.id+"');")
                .then(function () {
                    respuesta.send({"mensaje":"Rol editado correctamente","status":"200"});
                }).error(function (err) {
                respuesta.send({"mensaje":"Error "+err,"status":"500"});
            });
        },
        listarId:function (peticion,respuesta) {
            modelo.rol.findById(peticion.params.id).then(function (data) {
                respuesta.json(data);
            });
        }
    }
}