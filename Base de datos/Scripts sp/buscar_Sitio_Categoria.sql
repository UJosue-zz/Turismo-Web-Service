DELIMITER $$

CREATE
    PROCEDURE `db_turismo`.`buscar_Sitio_Categoria`(IN _categoria INT)
    BEGIN
	SELECT Sitio.`id_Sitio`, Sitio.`nombre` FROM Sitio WHERE Sitio.`id_Categoria` = _categoria;
    END$$

DELIMITER ;