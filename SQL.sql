DROP DATABASE IF EXISTS melsalu_db;

CREATE DATABASE melsalu_db;

USE melsalu_db;

/* TABLE AFILIADO   */ 
CREATE TABLE IF NOT EXISTS afiliados(
	id_afiliado INT NOT NULL UNIQUE AUTO_INCREMENT,
    DNI INT NOT NULL UNIQUE ,
    primary_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email_address VARCHAR(50) UNIQUE,
    phone_number VARCHAR(50),
    created_at TIMESTAMP NOT NULL DEFAULT (NOW()),
    PRIMARY KEY(id_afiliado)
);

/* TABLE GRUPO FAMILIAR */
CREATE TABLE IF NOT EXISTS grupoFamiliar(
	id_grupoFamiliar INT NOT NULL,
    id_titular INT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT (NOW()),
    PRIMARY KEY(id_grupoFamiliar),
    FOREIGN KEY(id_titular) REFERENCES afiliados(id_afiliado)
);

/* TABLE GRUPO FAMILIAR - TABLE AFILIADO  */
CREATE TABLE IF NOT EXISTS afiliado_grupoFamiliar(
	uid INT NOT NULL AUTO_INCREMENT,
    id_grupoFamiliar INT  NOT NULL,
    id_afiliado INT NOT NULL,
    PRIMARY KEY(uid),
    FOREIGN KEY(id_grupoFamiliar) REFERENCES grupoFamiliar(id_grupoFamiliar),
    FOREIGN KEY(id_afiliado) REFERENCES afiliados(id_afiliado)
); 

/* TABLE HISTORIAL MEDICO */
CREATE TABLE IF NOT EXISTS historial_medico(
	id_historial INT NOT NULL,
    id_afiliado INT NOT NULL,
    id_grupoFamiliar INT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT (NOW()),
    PRIMARY KEY(id_historial),
    FOREIGN KEY(id_afilido) REFERENCES afiliados(id_afiliado),
    FOREIGN KEY (id_grupoFamiliar) REFERENCES grupoFamiliar(id_grupoFamiliar)
);

CREATE TABLE IF NOT EXISTS historial_descripcion(
	uid INT NOT NULL AUTO_INCREMENT,
	id_historial INT NOT NULL,
    descripcion VARCHAR(500) NOT NULL,
    PRIMARY KEY(id_historial),
    FOREIGN KEY(id_historial) REFERENCES historial_medico(id_historial)
);

/* TABLE PAGOS_FACTURAS*/
CREATE TABLE IF NOT EXISTS pagos_facturas(
	id_pagoFactura INT NOT NULL,
    id_grupoFamiliar INT NOT NULL,
    stauts_factura  VARCHAR(50) NOT NULL DEFAULT("pendiente")
);

/* TABLE PAGOS_FACTURAS - DESCRIPCION */



