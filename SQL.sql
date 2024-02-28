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
    created_at TIMESTAMP NOT NULL DEFAULT (NOW())
);

/* TABLE GRUPO FAMILIAR */
CREATE TABLE IF NOT EXISTS grupoFamiliar(
	id_grupoFamiliar INT NOT NULL,
    id_titular INT NOT NULL,
    id_conyuge INT,
    created_at TIMESTAMP NOT NULL DEFAULT (NOW()),
);

/* TABLE GRUPO FAMILIAR - TABLE AFILIADO  */
CREATE TABLE IF NOT EXISTS afiliado_grupoFamiliar(
	id_grupoFamiliar INT  NOT NULL,
    id_afiliado INT NOT NULL 
); 

/* TABLE HISTORIAL MEDICO */
CREATE TABLE IF NOT EXISTS historial_medico(
	id_historial INT NOT NULL,
    id_afiliado INT NOT NULL,
    id_grupoFamiliar INT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT (NOW()),
);

/* TABLE PAGOS_FACTURAS*/
CREATE TABLE IF NOT EXISTS pagos_facturas(
	id_pagoFactura INT NOT NULL,
    id_grupoFamiliar INT NOT NULL,
    stauts_factura  VARCHAR(50) NOT NULL DEFAULT("pendiente")
);

/* TABLE PAGOS_FACTURAS - DESCRIPCION */



