DELIMITER $$

CREATE
    
    PROCEDURE `db_turismo`.`Login`(IN _nick VARCHAR(255), IN _contrasena VARCHAR(255))

    BEGIN
	SELECT * FROM Usuario WHERE Usuario.`nick` = _nick AND Usuario.`contrasena` = _contrasena;
    END$$

DELIMITER ;