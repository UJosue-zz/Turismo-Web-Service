DELIMITER $$

CREATE
    PROCEDURE `db_turismo`.`buscar_Sitio_Cercano`()
    BEGIN
	SELECT Sitio.`id_Sitio`, Categoria.`nombre`,  Sitio.`latitud`, Sitio.`longitud`, Sitio.`nombre` 
		FROM Sitio INNER JOIN Categoria ON Sitio.`id_Categoria` = Categoria.`id_Categoria`;
    END$$

DELIMITER ;