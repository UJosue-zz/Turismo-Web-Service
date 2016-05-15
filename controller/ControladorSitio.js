/**
 * Created by HP240 on 15/05/2016.
 */
module.exports=function(modelo){
    return {
        listar:function(peticion,respuesta){
            modelo.sitio.findAll().then(function(data){
                respuesta.json(data);
            });
        },
        crear:function(peticion,respuesta){
            modelo.sequelize.query("CALL crear_Sitio('"+peticion.body.nombre+"','"+peticion.body.latitud+"','"+peticion.body.longitud
                +"','"+peticion.body.direccion+"','"+peticion.body.correo+"','"+peticion.body.informacion+"','"+peticion.body.departamento
                +"','"+peticion.body.categoria+"');")
                .then(function(){
                    respuesta.send({"mensaje":"Registro insertado correctamente","status":"200"});
                }).error(function(err){
                respuesta.send({"mensaje":"Error "+err,"status":"500"});
            });
        },
        eliminar:function (peticion,respuesta) {
            modelo.rol.destroy({
                where:{
                    id_Sitio: peticion.params.id
                }
            }).then(function(){
                respuesta.json({"mensaje":"Sitio eliminado"});
            }).error(function(){
                throw err;
            });
        },
        editar:function (peticion,respuesta) {
            modelo.sequelize.query("CALL editar_Sitio('"+peticion.body.nombre+"','"+peticion.body.latitud+"','"+peticion.body.longitud
                +"','"+peticion.body.direccion+"','"+peticion.body.correo+"','"+peticion.body.informacion+"','"+peticion.body.departamento
                +"','"+peticion.body.categoria+"','"+peticion.body.sitio+"');") 
                .then(function () {
                    respuesta.send({"mensaje":"Sitio editado correctamente","status":"200"});
                }).error(function (err) {
                respuesta.send({"mensaje":"Error "+err,"status":"500"});
            });
        },
        listarId:function (peticion,respuesta) {
            modelo.sitio.findById(peticion.params.id).then(function (data) {
                respuesta.json(data);
            });
        },
        listarNombre:function (peticion,respuesta) {
            modelo.sequelize.query("CALL buscar_Sitio_Nombre('"+peticion.params.nombre+"');")
                .then(function (data) {
                respuesta.json(data);
            })
        },
        listarCategoria:function (peticion,respuesta) {
            modelo.sequelize.query("CALL buscar_Sitio_Categoria('"+peticion.params.categoria+"');")
                .then(function (data) {
                    respuesta.json(data);
                })
        }
    }
}