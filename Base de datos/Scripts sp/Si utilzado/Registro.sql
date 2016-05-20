DELIMITER $$

CREATE
    PROCEDURE `db_turismo`.`Registro`(IN _nombre VARCHAR(255), IN _nacionalidad VARCHAR(255), IN _correo VARCHAR(255), IN _nick VARCHAR(255), IN _contrasena VARCHAR(255), IN _foto BLOB, IN _Rol INT, IN _sitio INT)
    BEGIN
	INSERT INTO usuario (nombre, nacionalidad, correo, nick, contrasena, foto, id_Rol, id_Sitio) VALUES (_nombre, _nacionalidad, _correo, _nick, _contrasena, _foto, _Rol, _sitio);
    END$$

DELIMITER ;