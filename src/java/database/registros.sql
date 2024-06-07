CREATE DATABASE IF NOT EXISTS registros;
USE registros;
CREATE TABLE IF NOT EXISTS usuario_seq (seq_value BIGINT(20) UNSIGNED NOT NULL);
INSERT INTO usuario_seq (seq_value)
VALUES (100000000);
CREATE TABLE IF NOT EXISTS usuario (
  ITEM_AI INT(11) NOT NULL AUTO_INCREMENT,
  USU_ID BIGINT(20) UNSIGNED NOT NULL,
  USU_COD CHAR(8) NOT NULL,
  USU VARCHAR(12) NOT NULL,
  USU_PASS VARCHAR(24) NOT NULL,
  USU_NOMBRES VARCHAR(50) NOT NULL,
  USU_APELLIDOS VARCHAR(50) NOT NULL,
  USU_EMAIL VARCHAR(50) NOT NULL,
  USU_PERMISOS ENUM('Administrador', 'UsuarioNormal') NOT NULL,
  USU_ESTADO TINYINT(1) NOT NULL DEFAULT 0,
  USU_ENLINEA TINYINT(1) NOT NULL DEFAULT 0,
  USU_N_INGRESOS INT(11) NOT NULL DEFAULT 0,
  FEC_CREACION DATE NOT NULL,
  FEC_MODIFICACION DATE NOT NULL,
  FEC_ELIMINACION DATE DEFAULT NULL,
  FEC_ULT_ACCESSO DATE DEFAULT NULL,
  CREADO_POR CHAR(8) NOT NULL,
  MODIFICADO_POR CHAR(8) NOT NULL,
  ELIMINADO_POR CHAR(8) DEFAULT NULL,
  HORA_CREACION TIME NOT NULL,
  HORA_MODIFICACION TIME NOT NULL,
  HORA_ELIMINACION TIME DEFAULT NULL,
  HORA_ULT_ACCESO TIME DEFAULT NULL,
  PRIMARY KEY (ITEM_AI),
  UNIQUE KEY (USU_EMAIL)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

DELIMITER //

CREATE TRIGGER before_insert_usuario
BEFORE INSERT ON usuario
FOR EACH ROW
BEGIN
  DECLARE new_id BIGINT(20);
  
  UPDATE usuario_seq SET seq_value = LAST_INSERT_ID(seq_value + 1);
  SET new_id = LAST_INSERT_ID();

  SET NEW.USU_ID = new_id;
END //

DELIMITER ;

USE registros;
INSERT INTO usuario (
    USU_COD,
    USU,
    USU_PASS,
    USU_NOMBRES,
    USU_APELLIDOS,
    USU_EMAIL,
    USU_PERMISOS,
    USU_ESTADO,
    USU_ENLINEA,
    USU_N_INGRESOS,
    FEC_CREACION,
    FEC_MODIFICACION,
    FEC_ELIMINACION,
    FEC_ULT_ACCESSO,
    CREADO_POR,
    MODIFICADO_POR,
    ELIMINADO_POR,
    HORA_CREACION,
    HORA_MODIFICACION,
    HORA_ELIMINACION,
    HORA_ULT_ACCESO
  )
VALUES (
    'USR00001',
    'johndoe',
    'password123',
    'John',
    'Doe',
    'johndoe@example.com',
    'Administrador',
    1,
    0,
    5,
    '2023-05-30',
    '2023-05-30',
    '2023-06-01',
    '2023-06-02',
    'admin',
    'admin',
    'admin',
    '12:00:00',
    '12:30:00',
    '13:00:00',
    '13:30:00'
  ),
  (
    'USR00002',
    'janedoe',
    'password456',
    'Jane',
    'Doe',
    'janedoe@example.com',
    'UsuarioNormal',
    1,
    1,
    3,
    '2023-05-31',
    '2023-05-31',
    '2023-06-02',
    '2023-06-03',
    'admin',
    'admin',
    'admin',
    '08:00:00',
    '08:30:00',
    '09:00:00',
    '09:30:00'
  ),
  (
    'USR00003',
    'jamesbond',
    'password789',
    'James',
    'Bond',
    'jamesbond@example.com',
    'Administrador',
    2,
    0,
    10,
    '2023-06-01',
    '2023-06-01',
    '2023-06-03',
    '2023-06-04',
    'admin',
    'admin',
    'admin',
    '09:00:00',
    '09:30:00',
    '10:00:00',
    '10:30:00'
  );
SELECT *
FROM usuario;