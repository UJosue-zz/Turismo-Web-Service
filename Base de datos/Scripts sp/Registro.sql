DELIMITER $$

CREATE
    PROCEDURE `db_turismo`.`Registro`(IN _nombre VARCHAR(255), IN _nacionalidad VARCHAR(255), IN _correo VARCHAR(255), IN _nick VARCHAR(255), IN _contrasena VARCHAR(255), IN _Rol INT)
    BEGIN
	INSERT INTO usuario (nombre, nacionalidad, correo, nick, contrasena, id_Rol) VALUES (_nombre, _nacionalidad, _correo, _nick, _contrasena, _Rol);
    END$$

DELIMITER ;