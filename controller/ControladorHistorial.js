/**
 * Created by informatica on 19/05/2016.
 */
/**
 * Created by HP240 on 15/05/2016.
 */
    module.exports = function (modelo) {
        return{
            listar:function(peticion,respuesta){
                modelo.historial.findAll().then(function(data){
                    respuesta.json(data);
                });
            },
            crear: function(peticion,respuesta) {
                modelo.sequelize.query("CALL crear_Historial('"+peticion.body.usuario+"','"+peticion.body.sitio+"');")
                    .then(function(){
                        respuesta.send({"mensaje":"Registro insertado correctamente","status":"200"});
                    }).error(function(err){
                    respuesta.send({"mensaje":"Error "+err,"status":"500"});
                });
            },
            eliminar:function (peticion,respuesta) {
                modelo.historial.destroy({
                    where:{
                        id_Historial: peticion.params.id
                    }
                }).then(function(){
                    respuesta.json({"mensaje":"Historial eliminado"});
                }).error(function(){
                    throw err;
                });
            },
            editar:function (peticion,respuesta) {
                modelo.sequelize.query("CALL editar_Historial('"+peticion.body.usuario+"','"+peticion.body.sitio+"','"+peticion.params.id+"');")
                    .then(function () {
                        respuesta.send({"mensaje":"Historial editado correctamente","status":"200"});
                    }).error(function (err) {
                    respuesta.send({"mensaje":"Error "+err,"status":"500"});
                });
            },
            listarId:function (peticion,respuesta) {
                modelo.historial.findById(peticion.params.id).then(function (data) {
                    respuesta.json(data);
                });
            }
        }
    }