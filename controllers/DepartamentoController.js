/**
 * Created by informatica on 06/05/2016.
 */
module.exports = function (app) {
    return{
        add:function (req, res) {
            var Departamento = app.get('departamento');
            Departamento.create({
                nombre: req.body.nombre,
                descripcion: req.body.descripcion
            }).then(function (departamento) {
                res.json(departamento);
            });
        },
        list:function (req, res) {
            var Departamento = app.get('departamento');
            Departamento.findAll().then(function (departamentos) {
                res.json(departamentos);
            });
        },
        edit:function (req, res) {
            var Departamento = app.get('departamento');
            Departamento.find(req.body.id_Departamento).then(function (departamento) {
                if(departamento){
                    departamento.updateAttributes({
                        nombre: req.body.nombre,
                        descripcion: req.body.descripcion
                    }).then(function (departamento) {
                        res.json(departamento);
                    });
                } else {
                    res.status(404).send({ message: "departamento no encontrado"});
                }
            })
        },
        delete:function (req, res) {
            var Departamento = app.get('departamento');
            Departamento.destroy({
                where:{
                    id_Departamento: req.body.id_Departamento
                }
            }).then(function (departamento) {
                res.json(departamento);
            });
        },
        porId:function (req, res) {
            var Departamento = app.get('departamento');
            Departamento.find(req.body.id_Departamento).then(function (departamento) {
                if(departamento){
                    res.json(departamento);
                } else {
                    res.status(404).send({ message: "departamento no encontrado"});
                }
            })
        },
        buscarSitio:function (req, res) {
            var Departamento = app.get('departamento');
            var Sitio = app.get('sitio');
            Departamento.find({where:{
                id_Departamento : req.params.id
            , include:{Sitio}}}.then(function (departamento) {
                res.json(departamento);
            }))
        }
    }
}