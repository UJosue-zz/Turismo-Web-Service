DELIMITER $$

CREATE
    PROCEDURE `db_turismo`.`crear_Sitio`(IN _nombre VARCHAR(255), IN _latitud DOUBLE, IN _longitud DOUBLE, IN _informacion VARCHAR(255), IN _categoria INT)
    BEGIN
	INSERT INTO Sitio (nombre, latitud, longitud, informacion, id_Categoria) VALUES (_nombre, _latitud, _longitud, _informacion, _categoria);
    END$$

DELIMITER ;