SELECT * FROM Usuario WHERE Usuario.`nick` ='admin' && Usuario.`contrasena` = '123'
CALL Login('cliente', '123');

INSERT INTO usuario (nombre, nacionalidad, correo, nick, contrasena, id_Rol) VALUES ('prueba', 'noruego', 'p@p.com', 'prueba', '123', 1);
INSERT INTO rol (nombre, nota) CALL crear_Rol ('rolprueba', 'rol de prueba')
DELETE FROM Rol WHERE Rol.`id_Rol` = 4
UPDATE Rol SET Rol.`nombre` = 'PruebaEditar', Rol.`nota` = '' WHERE Rol.`id_Rol` = 3
SELECT sitio.`id_Sitio`, sitio.`nombre` FROM Sitio WHERE sitio.`nombre` LIKE '%a%' ORDER BY Sitio.`nombre` ASC
CALL buscar_Sitio_Categoria('4');
SELECT Sitio.`id_Sitio`, Categoria.`nombre`,  Sitio.`latitud`, Sitio.`longitud`, Sitio.`nombre` FROM Sitio INNER JOIN Categoria ON Sitio.`id_Categoria` = Categoria.`id_Categoria`
INSERT INTO Sitio (nombre, latitud, longitud, informacion, id_Categoria) VALUES ('pr', 213, 132, 'spr', 1)
CALL crear_Sitio('fds', 124, 312, 'sdf', 3)
DELETE FROM Sitio WHERE sitio.`id_Sitio` = 4
CALL eliminar_Sitio(3)
UPDATE Sitio SET Sitio.`nombre` = 'a', Sitio.`latitud` = 234, Sitio.`longitud` = 234, Sitio.`informacion` = 'afd', Sitio.`id_Categoria` = 2 WHERE Sitio.`id_Sitio` = 2
CALL editar_Sitio('Estadio nacional', 12.3, 312.3, 'Estadio nacional de guatemala', 4, 2)