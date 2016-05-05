DELIMITER $$

CREATE
    PROCEDURE `db_turismo`.`listar_Rol`()
    BEGIN
	SELECT * FROM Rol;
    END$$

DELIMITER ;