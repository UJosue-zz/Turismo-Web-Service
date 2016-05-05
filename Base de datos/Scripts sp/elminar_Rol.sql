DELIMITER $$

CREATE
    PROCEDURE `db_turismo`.`eliminar_Rol`(IN _rol INT)
    BEGIN
	DELETE FROM Rol WHERE Rol.`id_Rol` = _rol;
    END$$

DELIMITER ;