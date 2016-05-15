DELIMITER $$

CREATE
    PROCEDURE `db_turismo`.`editar_Rol`(IN _nombre VARCHAR(255), IN _nota VARCHAR(255), IN _id INT)
    BEGIN
	UPDATE Rol SET Rol.`nombre` = _nombre, Rol.`nota` = _nota WHERE Rol.`id_Rol` = _id;
    END$$

DELIMITER ;