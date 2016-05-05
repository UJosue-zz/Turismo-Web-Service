DELIMITER $$

CREATE
    PROCEDURE `db_turismo`.`editar_Sitio`(IN _nombre VARCHAR(255), IN _latitud DOUBLE, IN _longitud DOUBLE, IN _informacion VARCHAR(255), IN _categoria INT, IN _sitio INT)
    BEGIN
	UPDATE Sitio SET Sitio.`nombre` = _nombre, Sitio.`latitud` = _latitud, Sitio.`longitud` = _longitud, Sitio.`informacion` = _informacion, Sitio.`id_Categoria` = _categoria
	 WHERE Sitio.`id_Sitio` = _sitio;
    END$$

DELIMITER ;