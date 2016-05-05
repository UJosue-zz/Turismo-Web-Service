DELIMITER $$

CREATE
    PROCEDURE `db_turismo`.`buscar_Sitio_Nombre`(IN _nombre VARCHAR(255))
    BEGIN
	SET @consulta = CONCAT("SELECT sitio.`id_Sitio`, sitio.`nombre` FROM Sitio WHERE sitio.`nombre` LIKE '%",_nombre,"%' ORDER BY Sitio.`nombre` ASC");
	PREPARE ejecutar FROM @consulta;
	EXECUTE ejecutar;
    END$$

DELIMITER ;