DELIMITER $$

CREATE
    PROCEDURE `db_turismo`.`eliminar_Sitio`(IN _sitio INT)
    BEGIN
	DELETE FROM Sitio WHERE sitio.`id_Sitio` = _sitio;
    END$$

DELIMITER ;