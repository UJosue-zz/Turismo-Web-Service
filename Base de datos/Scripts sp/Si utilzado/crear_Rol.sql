DELIMITER $$

CREATE
    PROCEDURE `db_turismo`.`crear_Rol`(IN _nombre VARCHAR(255), IN _nota VARCHAR(255))
    BEGIN
	INSERT INTO rol (nombre, nota) VALUES (_nombre, _nota);
    END$$

DELIMITER ;