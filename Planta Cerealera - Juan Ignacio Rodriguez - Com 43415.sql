CREATE SCHEMA SIS_NEGOCIO;
USE SIS_NEGOCIO;
-- TABLA PRODUCTORES
CREATE TABLE IF NOT EXISTS SIS_NEGOCIO.PRODUCTOR
(
ID_PRODUCTOR INT NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY
, NOMBRE_PRODUCTOR VARCHAR (50) NOT NULL
, CUIT_PRODUCTOR VARCHAR (20) NOT NULL
, ID_CAMPO INT NOT NULL
);

CREATE TABLE IF NOT EXISTS SIS_NEGOCIO.CAMPO
(
ID_CAMPO INT NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY
, DESCRIPCION_CAMPO VARCHAR (20) NULL
, HECTAREAS_CAMPO INT NOT NULL
, UBICACIÓN_CAMPO VARCHAR (50) NOT NULL
);

CREATE TABLE IF NOT EXISTS SIS_NEGOCIO.ESPECIE
(
ID_ESPECIE INT NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY
, DESCRIPCION_ESPECIE VARCHAR (20) NULL
, VARIEDAD_ESPECIE VARCHAR (20) NULL
);

CREATE TABLE IF NOT EXISTS SIS_NEGOCIO.COSECHA
(
ID_COSECHA INT NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY
, DESCRIPCION_COSECHA VARCHAR (20) NULL
, FECHA_INICIO_COSECHA DATE NOT NULL
, FECHA_FIN_COSECHA DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS SIS_NEGOCIO.EJERCICIO_FISCAL
(
ID_EJERCICIO INT NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY
, DESCRIPCION_EJERCICIO VARCHAR (20) NULL
, FECHA_INICIO_EJERCICIO DATE NOT NULL
, FECHA_FIN_EJERCICIO DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS SIS_NEGOCIO.CONTRATO
(
ID_CONTRATO INT NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY
, ID_EJERCICIO INT NOT NULL
, ID_COSECHA INT NOT NULL
, ID_ESPECIE INT NOT NULL
, ID_PRODUCTOR INT NOT NULL
, ID_CODIGO_CONTRATO INT NOT NULL
, NUMERO_CONTRATO INT NOT NULL
, PRECIO_KG_CONTRATO INT NOT NULL
, KG_CONTRATO INT NOT NULL
);

CREATE TABLE IF NOT EXISTS SIS_NEGOCIO.CODIGO_CONTRATO
(
ID_CODIGO_CONTRATO INT NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY
, DESCRIPCION_CODIGO_CONTRATO VARCHAR (20) NOT NULL
);

CREATE TABLE IF NOT EXISTS SIS_NEGOCIO.SILO
(
ID_SILO INT NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY
, CAPACIDAD_SILO INT NOT NULL
, DESCRIPCION_SILO VARCHAR (20)  NULL
, STOCK_SILO  INT NOT NULL
);

CREATE TABLE IF NOT EXISTS SIS_NEGOCIO.TARIFA
(
ID_TARIFA INT NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY
, VALOR_TARIFA INT NOT NULL
, DESCRIPCION_TARIFA VARCHAR (20)  NOT NULL
);

CREATE TABLE IF NOT EXISTS SIS_NEGOCIO.BALANZA
(
ID_BALANZA INT NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY
, ID_TARIFA INT NOT NULL
, ID_SILO  INT NOT NULL
);

CREATE TABLE IF NOT EXISTS SIS_NEGOCIO.PLANTA
(
ID_PLANTA INT NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY
, DESCRIPCION_PLANTA VARCHAR (20) NULL
, ID_BALANZA INT NOT NULL
, ID_CONTRATO INT NOT NULL
, PROCESADO_PLANTA  INT NOT NULL
, STOCK_PLANTA INT NOT NULL
, DESCARTE_PLANTA INT NOT NULL
);


 ALTER TABLE SIS_NEGOCIO.PRODUCTOR ADD CONSTRAINT ID_CAMPO FOREIGN KEY ID_CAMPO (ID_CAMPO)
    REFERENCES SIS_NEGOCIO.CAMPO (ID_CAMPO);
    
ALTER TABLE SIS_NEGOCIO.CONTRATO ADD CONSTRAINT ID_EJERCICIO FOREIGN KEY ID_EJERCICIO (ID_EJERCICIO)
    REFERENCES SIS_NEGOCIO.EJERCICIO_FISCAL (ID_EJERCICIO);
    
ALTER TABLE SIS_NEGOCIO.CONTRATO ADD CONSTRAINT ID_COSECHA FOREIGN KEY ID_COSECHA (ID_COSECHA)
    REFERENCES SIS_NEGOCIO.COSECHA (ID_COSECHA);
    
ALTER TABLE SIS_NEGOCIO.CONTRATO ADD CONSTRAINT ID_ESPECIE FOREIGN KEY ID_ESPECIE (ID_ESPECIE)
    REFERENCES SIS_NEGOCIO.ESPECIE (ID_ESPECIE);
    
ALTER TABLE SIS_NEGOCIO.CONTRATO ADD CONSTRAINT ID_PRODUCTOR FOREIGN KEY ID_PRODUCTOR (ID_PRODUCTOR)
    REFERENCES SIS_NEGOCIO.PRODUCTOR (ID_PRODUCTOR);
    
ALTER TABLE SIS_NEGOCIO.CONTRATO ADD CONSTRAINT ID_CODIGO_CONTRATO FOREIGN KEY ID_CODIGO_CONTRATO (ID_CODIGO_CONTRATO)
    REFERENCES SIS_NEGOCIO.CODIGO_CONTRATO (ID_CODIGO_CONTRATO);

ALTER TABLE SIS_NEGOCIO.BALANZA ADD CONSTRAINT ID_TARIFA FOREIGN KEY ID_TARIFA (ID_TARIFA)
    REFERENCES SIS_NEGOCIO.TARIFA (ID_TARIFA);
    
ALTER TABLE SIS_NEGOCIO.BALANZA ADD CONSTRAINT ID_SILO FOREIGN KEY ID_SILO (ID_SILO)
    REFERENCES SIS_NEGOCIO.SILO (ID_SILO);
    
ALTER TABLE SIS_NEGOCIO.PLANTA ADD CONSTRAINT ID_BALANZA FOREIGN KEY ID_BALANZA (ID_BALANZA)
    REFERENCES SIS_NEGOCIO.BALANZA (ID_BALANZA);
    
 ALTER TABLE SIS_NEGOCIO.PLANTA ADD CONSTRAINT ID_CONTRATO FOREIGN KEY ID_CONTRATO (ID_CONTRATO)
    REFERENCES SIS_NEGOCIO.CONTRATO (ID_CONTRATO);
    
