DELIMITER $$

CREATE
    PROCEDURE `db_turismo`.`crear_Sitio`(IN _nombre VARCHAR(255), IN _latitud DOUBLE, IN _longitud DOUBLE, IN _direccion VARCHAR(255), IN _correo VARCHAR(255), IN _informacion VARCHAR(255), IN _categoria INT)
    BEGIN
	INSERT INTO Sitio (nombre, latitud, longitud, direccion, correo, informacion, id_Categoria) VALUES (_nombre, _latitud, _longitud, _direccion, _correo, _informacion, _categoria);
    END$$

DELIMITER ;