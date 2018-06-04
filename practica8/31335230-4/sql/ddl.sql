
CREATE TABLE Casa (
  Id_casa            number(10) NOT NULL UNIQUE, 
  Id_Propiedad       number(10) NOT NULL UNIQUE, 
  Id_Direccion       number(10) NOT NULL UNIQUE, 
  Tamaño_habitable   float(10), 
  Niveles            number(10), 
  Tamano_total       float(10), 
  Fecha_Construccion date, 
  num_habitantes     number(10), 
  PRIMARY KEY (Id_casa, 
  Id_Propiedad, 
  Id_Direccion));
  
  CREATE TABLE Terreno (
  Id_Terreno        number(10) NOT NULL UNIQUE,
  Id_Propiedad      number(10) NOT NULL UNIQUE,
  Id_direccion      number(10) NOT NULL UNIQUE,
  Construido        number(1),
  Fecha_de_Registro date,
  PRIMARY KEY (Id_Terreno,
  Id_Propiedad,
  Id_direccion));
CREATE TABLE Departamento (
  Num_Departamento number(10) NOT NULL UNIQUE,
  Id_Propiedad     number(10) NOT NULL UNIQUE,
  Id_direccion     number(10) NOT NULL UNIQUE,
  Id_edificio      number(10) NOT NULL UNIQUE,
  Nivel_Edificio   number(10),
  Tiene_balcon     number(1),
  Tiene_areaLAvado number(1),
  num_habitantes   number(10),
  PRIMARY KEY (Num_Departamento,
  Id_Propiedad,
  Id_direccion,
  Id_edificio));
CREATE TABLE Propietario (
  Id_Propietario   number(10) NOT NULL UNIQUE,
  CURP             char(255) NOT NULL UNIQUE,
  Nombre           char(255),
  Paterno          char(255),
  Materno          char(255),
  Edad             number(10),
  Fecha_nacimiento number(10),
  PRIMARY KEY (Id_Propietario,
  CURP));
CREATE TABLE Vendedor (
  Id_Vendedor    number(10) NOT NULL UNIQUE,
  Id_Propietario number(10) NOT NULL UNIQUE,
  CURP           char(255) NOT NULL UNIQUE,
  RFC            char(255),
  PRIMARY KEY (Id_Vendedor,
  Id_Propietario,
  CURP));
CREATE TABLE Seguro_TenerSeguro (
  SeguroNum_Poliza                 number(10) NOT NULL,
  Id_TenerSeguro number(10) NOT NULL,
  PRIMARY KEY (SeguroNum_Poliza,
  Id_TenerSeguro));
CREATE TABLE Comprar (
  Id_Propiedad   number(10) NOT NULL UNIQUE,
  Id_Propietario number(10) NOT NULL UNIQUE,
  CURP           char(255) NOT NULL UNIQUE,
  Id_direccion   number(10) NOT NULL UNIQUE,
  Fecha_venta    date,
  Precio_venta   number(10),
  PRIMARY KEY (Id_Propiedad,
  Id_Propietario,
  CURP,
  Id_direccion));
CREATE TABLE Edificio (
  Id_edificio        number(10) NOT NULL,
  Num_departamentos  number(10),
  Num_Pisos          number(10),
  Tiene_elevador     number(1),
  Fecha_construccion date,
  PRIMARY KEY (Id_edificio));
CREATE TABLE Tipo_servicio (
  Id_servicio     number(10) NOT NULL UNIQUE,
  Id_edificio     number(10) NOT NULL UNIQUE,
  Nombre_servicio char(255),
  Descripcion     char(255),
  PRIMARY KEY (Id_servicio,
  Id_edificio));
CREATE TABLE Compra (
  Id_compra            number(10) NOT NULL UNIQUE,
  Id_Propiedad         number(10) NOT NULL UNIQUE,
  Id_Propietario       number(10) NOT NULL UNIQUE,
  CURP                 char(255) NOT NULL UNIQUE,
  Id_direccion         number(10) NOT NULL UNIQUE,
  Antiguedad_Propiedad number(10),
  PRIMARY KEY (Id_compra,
  Id_Propiedad,
  Id_Propietario,
  CURP,
  Id_direccion));
CREATE TABLE Vender (
  Id_Vendedor    number(10) NOT NULL UNIQUE,
  Id_Propietario number(10) NOT NULL UNIQUE,
  CURP           char(255) NOT NULL UNIQUE,
  Id_Propiedad   number(10) NOT NULL UNIQUE,
  Id_direccion   number(10) NOT NULL UNIQUE,
  comision       number(10),
  PRIMARY KEY (Id_Vendedor,
  Id_Propietario,
  CURP,
  Id_Propiedad,
  Id_direccion));
CREATE TABLE Seguro (
  Num_Poliza   number(10) NOT NULL,
  Id_Propiedad number(10) NOT NULL,
  Id_Direccion number(10) NOT NULL,
  Cobertura    number(10),
  Monto_seguro number(10),
  PRIMARY KEY (Num_Poliza,
  Id_Propiedad,
  Id_Direccion));

CREATE TABLE Aseguradora (
  Id_empresa     number(10) NOT NULL UNIQUE,
  Num_Poliza     number(10) NOT NULL UNIQUE,
  Id_Propiedad   number(10) NOT NULL UNIQUE,
  Id_Direccion   number(10) NOT NULL UNIQUE,
  Nombre_empresa char(255),
  PRIMARY KEY (Id_empresa,
  Num_Poliza,
  Id_Propiedad,
  Id_Direccion));
CREATE TABLE Serivcio (
  Id_servicio    number(10) NOT NULL UNIQUE,
  Id_Propiedad   number(10) NOT NULL UNIQUE,
  Id_direccion   number(10) NOT NULL UNIQUE,
  Monto_servicio number(10), 
  Descripcion    char(255),
  PRIMARY KEY (Id_servicio,
  Id_Propiedad,
  Id_direccion));
CREATE TABLE Direccion (
  Id_Direccion number(10) NOT NULL UNIQUE,
  id_Distrito  number(10) NOT NULL UNIQUE,
  id_Colonia   number(10) NOT NULL UNIQUE,
  Numero       number(10),
  calle        char(255),
  PRIMARY KEY (Id_Direccion,
  id_Distrito,
  id_Colonia));
CREATE TABLE Pertenecer (
  Id_Colonia   number(10) NOT NULL UNIQUE,
  id_distrito  number(10) NOT NULL UNIQUE,
  id_municipio number(10) NOT NULL UNIQUE,
  Id_Direccion number(10) NOT NULL UNIQUE,
  PRIMARY KEY (Id_Colonia,
  id_distrito,
  id_municipio,
  Id_Direccion));
CREATE TABLE Colonia (
  Id_Colonia     number(10) NOT NULL UNIQUE,
  id_distrito    number(10) NOT NULL UNIQUE,
  id_municipio   number(10) NOT NULL UNIQUE,
  Num_habitantes number(10),
  Nombre_colonia number(10),
  PRIMARY KEY (Id_Colonia,
  id_distrito,
  id_municipio));
CREATE TABLE Tienda (
  Id_tienda     number(10) NOT NULL,
  Id_Colonia    number(10) NOT NULL,
  Nombre_tienda char(255),
  Descripcion   char(255),
  PRIMARY KEY (Id_tienda,
  Id_Colonia));
CREATE TABLE Transporte (
  Id_transporte     number(10) NOT NULL,
  Id_Colonia        number(10) NOT NULL,
  Nombre_transporte char(255),
  Descripcion       char(255),
  PRIMARY KEY (Id_transporte,
  Id_Colonia));
CREATE TABLE Pertenecer_Mun_Distr (
  Id_Distrito  number(10) NOT NULL,
  Id_municipio number(10) NOT NULL,
  Id_Colonia   number(10) NOT NULL,
  PRIMARY KEY (Id_Distrito,
  Id_municipio,
  Id_Colonia));
CREATE TABLE Distrito (
  Id_Distrito     number(10) NOT NULL,
  Nombre_distrito char(255),
  PRIMARY KEY (Id_Distrito));
CREATE TABLE Pertenecer_estado (
  Id_estado    number(10) NOT NULL,
  Id_Distrito  number(10) NOT NULL,
  Id_municipio number(10) NOT NULL,
  PRIMARY KEY (Id_estado,
  Id_Distrito,
  Id_municipio));
CREATE TABLE Estado (
  Id_estado     number(10) NOT NULL,
  Nombre_Estado char(255),
  PRIMARY KEY (Id_estado));
CREATE TABLE Propiedad (
  Id_Propiedad         number(10) NOT NULL UNIQUE,
  Id_Direccion         number(10) NOT NULL UNIQUE,
  Antigüedad           char(255),
  Tamaño               float(10),
  Num_baños            number(10),
  Num_estacionamientos number(10),
  Valor_Catastral      float(10),
  Vendido              number(1) ,
  Num_habitaciones     number(10),
  Tipo_Propiedad       number(10),
  PRIMARY KEY (Id_Propiedad,
  Id_Direccion));
CREATE TABLE Municipio (
  Id_municipio     number(10) NOT NULL,
  Nombre_Municipio char(255),
  PRIMARY KEY (Id_municipio));
  
  
ALTER TABLE Vendedor ADD CONSTRAINT FKVendedor_Propietario FOREIGN KEY (Id_Propietario, CURP) REFERENCES Propietario (Id_Propietario, CURP);
ALTER TABLE Comprar ADD CONSTRAINT FKComprar_Propietario FOREIGN KEY (Id_Propietario, CURP) REFERENCES Propietario (Id_Propietario, CURP);
ALTER TABLE Departamento ADD CONSTRAINT FKDepartamento_Edificio FOREIGN KEY (Id_edificio) REFERENCES Edificio (Id_edificio);
ALTER TABLE Tipo_servicio ADD CONSTRAINT FKTipo_servicio_Edificio FOREIGN KEY (Id_edificio) REFERENCES Edificio (Id_edificio);
ALTER TABLE Compra ADD CONSTRAINT FKCompra_Comprar FOREIGN KEY (Id_Propiedad, Id_Propietario, CURP, Id_direccion) REFERENCES Comprar (Id_Propiedad, Id_Propietario, CURP, Id_direccion);
ALTER TABLE Vender ADD CONSTRAINT FKVender_Vendedor FOREIGN KEY (Id_Vendedor, Id_Propietario, CURP) REFERENCES Vendedor (Id_Vendedor, Id_Propietario, CURP);
ALTER TABLE Aseguradora ADD CONSTRAINT FKAsegurador_Seguro FOREIGN KEY (Num_Poliza, Id_Propiedad, Id_Direccion) REFERENCES Seguro (Num_Poliza, Id_Propiedad, Id_Direccion);
ALTER TABLE Seguro ADD CONSTRAINT FKSeguro_Propiedad FOREIGN KEY (Id_Propiedad, Id_Direccion) REFERENCES Propiedad (Id_Propiedad, Id_Direccion);
ALTER TABLE Serivcio ADD CONSTRAINT FKServicio_Propiedad FOREIGN KEY (Id_Propiedad, Id_direccion) REFERENCES Propiedad (Id_Propiedad, Id_Direccion);
ALTER TABLE Comprar ADD CONSTRAINT FKComprar_Propiedad FOREIGN KEY (Id_Propiedad, Id_direccion) REFERENCES Propiedad (Id_Propiedad, Id_Direccion);
ALTER TABLE Casa ADD CONSTRAINT FKCasa_Propiedad FOREIGN KEY (Id_Propiedad, Id_Direccion) REFERENCES Propiedad (Id_Propiedad, Id_Direccion);
ALTER TABLE Terreno ADD CONSTRAINT FKTerreno_Propiedad FOREIGN KEY (Id_Propiedad, Id_direccion) REFERENCES Propiedad (Id_Propiedad, Id_Direccion);
ALTER TABLE Departamento ADD CONSTRAINT FKDepartamento_Propiedad FOREIGN KEY (Id_Propiedad, Id_direccion) REFERENCES Propiedad (Id_Propiedad, Id_Direccion);
ALTER TABLE Vender ADD CONSTRAINT FKVender_Propiedad FOREIGN KEY (Id_Propiedad, Id_direccion) REFERENCES Propiedad (Id_Propiedad, Id_Direccion);
ALTER TABLE Pertenecer_estado ADD CONSTRAINT FKPertenecer_Estado FOREIGN KEY (Id_estado) REFERENCES Estado (Id_estado);
ALTER TABLE Transporte ADD CONSTRAINT FKTransporte_Colonia FOREIGN KEY (Id_Colonia) REFERENCES Colonia (Id_Colonia);
ALTER TABLE Pertenecer_estado ADD CONSTRAINT FKPertenecer_Distrito FOREIGN KEY (Id_Distrito) REFERENCES Distrito (Id_Distrito);
ALTER TABLE Pertenecer_estado ADD CONSTRAINT FKPertenecer_Municipio FOREIGN KEY (Id_municipio) REFERENCES Municipio (Id_municipio);
ALTER TABLE Pertenecer_Mun_Distr ADD CONSTRAINT FKPertenecer_Distrito FOREIGN KEY (Id_Distrito) REFERENCES Distrito (Id_Distrito);
ALTER TABLE Pertenecer_Mun_Distr ADD CONSTRAINT FKPertenecer_Municipio FOREIGN KEY (Id_municipio) REFERENCES Municipio (Id_municipio);
ALTER TABLE Pertenecer_Mun_Distr ADD CONSTRAINT FKPertenecer_Colonia FOREIGN KEY (Id_Colonia) REFERENCES Colonia (Id_Colonia);
ALTER TABLE Tienda ADD CONSTRAINT FKTienda_Colonia FOREIGN KEY (Id_Colonia) REFERENCES Colonia (Id_Colonia);
ALTER TABLE Pertenecer ADD CONSTRAINT FKPertenecer_Colonia FOREIGN KEY (Id_Colonia, id_distrito, id_municipio) REFERENCES Colonia (Id_Colonia, id_distrito, id_municipio);
ALTER TABLE Pertenecer ADD CONSTRAINT FKPertenecer_Direccion FOREIGN KEY (Id_Direccion) REFERENCES Direccion (Id_Direccion);
ALTER TABLE Propiedad ADD CONSTRAINT FKPropiedad_Direccion FOREIGN KEY (Id_Direccion) REFERENCES Direccion (Id_Direccion);

------------------------------------------RESTRICCIONES------------------------------------------------------
ALTER TABLE Propiedad
add constraint CK_Propiedad_Positiva
CHECK (Antigüedad>=0 and Tamaño>=0 and Num_baños>=0 and Num_estacionamientos>=0 and Valor_Catastral>=0 and Num_habitaciones>=0);

ALTER TABLE Casa
add constraint CK_Casa_Positiva
CHECK (Tamaño_habitable>=0 and Niveles>=0 and Tamano_total>=0);
---Trigger fecha menor o igual a la fechad el systema------

ALTER TABLE Departamento
add constraint CK_Departamento_Positiva
CHECK(Nivel_Edificio>=0);

----Triger calcular la edad----

----Meter un Trigger para la propiedad donde la edad sea mayor a 18-----

ALTER TABLE Comprar
add constraint CK_Comprar_Positiva
CHECK(Precio_venta >0);

ALTER TABLE Edificio
add constraint CK_Edificio_Positiva
CHECK(Num_departamentos>0 and Num_Pisos >=0);
------Trigger donde la fecha sea menor a la fecha del sistema-----

ALTER TABLE Compra
add constraint CK_Compra_Positiva
CHECK(Antiguedad_Propiedad>=0);

ALTER TABLE Vender
add constraint CK_Vender_Positiva
CHECK(comision>0);

ALTER TABLE Seguro
add constraint CK_Seguro_Positiva
CHECK(Monto_seguro >=0);

ALTER TABLE Serivcio
add constraint CK_Servicio_Positiva
CHECK(Monto_servicio>=0);


-------------------------------COMENTARIOS------------------------------
COMMENT ON TABLE Propiedad IS 'Tabla donde esta modelado propiedad';
COMMENT ON COLUMN Propiedad.Id_Propiedad IS 'LLave de tipo number para identificar propiedad';
COMMENT ON COLUMN Propiedad.Id_Direccion IS 'LLave de tipo number para identificar propiedad';
COMMENT ON COLUMN Propiedad.Antigüedad IS 'Atributo de tipo char que indica cuantos anios tiene la propiedad de costruida';
COMMENT ON COLUMN Propiedad.Tamaño IS 'Atributo de tipo float que indica el area total de la propiedad';
COMMENT ON COLUMN Propiedad.Num_baños IS 'Atributo de tipo number que indica el numero total de baños en la propiedad';
COMMENT ON COLUMN Propiedad.Num_estacionamientos IS 'Atributo de tipo number que indica el numero total de lugar para estacionarse en la propiedad';
COMMENT ON COLUMN Propiedad.Valor_Catastral IS 'Atributo de tipo float que indica el valor catastral de la propiedad';
COMMENT ON COLUMN Propiedad.Vendido IS 'Atributo de tipo float que indica si la propiedad fue vendida';
COMMENT ON COLUMN Propiedad.Num_habitaciones  IS 'Atributo de tipo number que indica el numero de habitaciones en la propiedad en la propiedad';

COMMENT ON TABLE Casa IS 'Tabla donde esta modelado una casa';
COMMENT ON COLUMN Casa.Id_casa IS 'LLave de tipo number para identificar casa';
COMMENT ON COLUMN Casa.Id_direccion IS 'LLave de tipo number para identificar casa';
COMMENT ON COLUMN Casa.Id_Propiedad IS 'Atributo de tipo number que indica cuantos anios tiene la casa costruida';
COMMENT ON COLUMN Casa.Tamaño_habitable IS 'Atributo de tipo float que indica el area total de la casa';
COMMENT ON COLUMN Casa.Niveles IS 'Atributo de tipo number que indica el numero total de niveles en la casa';
COMMENT ON COLUMN Casa.Tamano_total IS 'Atributo de tipo float que indica el tamanio total de la casa';
COMMENT ON COLUMN Casa.Fecha_Construccion IS 'Atributo de tipo date que el dia de construccion de la casa';


COMMENT ON TABLE Terreno IS 'Tabla donde esta modelado una Terreno';
COMMENT ON COLUMN Terreno.Id_Terreno IS 'LLave de tipo number para identificar Terreno';
COMMENT ON COLUMN Terreno.Id_Propiedad IS 'LLave de tipo number para identificar Terreno';
COMMENT ON COLUMN Terreno.Id_direccion IS 'LLave de tipo number  para identificar Terreno';
COMMENT ON COLUMN Terreno.Construido IS 'Atributo de tipo number  que indica el area construida del Terreno';
COMMENT ON COLUMN Terreno.Fecha_de_Registro IS 'Atributo de tipo date que indica el dia que se registro el Terreno';


COMMENT ON TABLE Departamento IS 'Tabla donde esta modelado una Departamento';
COMMENT ON COLUMN Departamento.Num_Departamento IS 'LLave de tipo number para identificar Departamento';
COMMENT ON COLUMN Departamento.Id_direccion IS 'LLave de tipo number para identificar Departamento';
COMMENT ON COLUMN Departamento.Id_edificio IS 'LLave de tipo number para identificar Departamento';
COMMENT ON COLUMN Departamento.NIvel_Edificio IS 'Atributo de tipo number que indica en que nivel del edificio esta ubicado el  Departamento';
COMMENT ON COLUMN Departamento.Tiene_balcon IS 'Atributo de tipo number que indica si el Departamento tiene balcon';
COMMENT ON COLUMN Departamento.Tiene_areaLavado IS 'Atributo de tipo number que indica si el Departamento tiene balcon';


COMMENT ON TABLE Propietario IS 'Tabla donde esta modelado un Propietario';
COMMENT ON COLUMN Propietario.Id_Propietario IS 'LLave de tipo number para identificar Propietario';
COMMENT ON COLUMN Propietario.Curp IS 'Atributo de tipo char que indica la CURP del Propietario';
COMMENT ON COLUMN Propietario.Nombre IS 'Atributo de tipo char que indica el nombre del Propietario';
COMMENT ON COLUMN Propietario.Paterno IS 'Atributo de tipo char que indica el apellido paterno del Propietario';
COMMENT ON COLUMN Propietario.Materno IS 'Atributo de tipo char que indica el apellido materno del Propietario';
COMMENT ON COLUMN Propietario.Fecha_nacimiento IS 'Atributo de tipo date que indica el dia de nacimiento del Propietario';

COMMENT ON TABLE Vendedor IS 'Tabla donde esta modelado una Vendedor';
COMMENT ON COLUMN Vendedor.Id_Vendedor IS 'LLave de tipo number para identificar Vendedor';
COMMENT ON COLUMN Vendedor.Id_Propietario IS 'LLave de tipo number para identificar Vendedor';
COMMENT ON COLUMN Vendedor.CURP IS 'Atributo de tipo char que indica la CURP del Vendedor';
COMMENT ON COLUMN Vendedor.RFC IS 'Atributo de tipo char que indica el RFC del Vendedor';

COMMENT ON TABLE Seguro_TenerSeguro IS 'Tabla donde esta modelado una Seguro_TSeguro';
COMMENT ON COLUMN Seguro_TenerSeguro.SeguroNum_Poliza IS 'LLave de tipo number para identificar Seguro_TSeguro';
COMMENT ON COLUMN Seguro_TenerSeguro.id_TenerSeguro IS 'LLave de tipo number para identificar Seguro_TSeguro';

COMMENT ON TABLE Comprar IS 'Tabla donde esta modelado una Comprar';
COMMENT ON COLUMN Comprar.Id_Propiedad IS 'LLave de tipo number para identificar Comprar';
COMMENT ON COLUMN Comprar.Id_Propietario IS 'LLave de tipo number para identificar Comprar';
COMMENT ON COLUMN Comprar.CURP IS 'Atributo de tipo char que que indica la CURP del Propietario que Compro la propiedad';
COMMENT ON COLUMN Comprar.Id_direccion  IS 'LLave de tipo number para identificar Comprar';
COMMENT ON COLUMN Comprar.Fecha_venta IS 'Atributo de tipo date que indica el dia de la Compra';
COMMENT ON COLUMN Comprar.Precio_venta IS 'Atributo de tipo number que indica el precio de la propiedad cuando fue Comprada';

COMMENT ON TABLE Edificio IS 'Tabla donde esta modelado una Edificio';
COMMENT ON COLUMN Edificio.Id_Edificio IS 'LLave de tipo number para identificar Edificio';
COMMENT ON COLUMN Edificio.Num_departamentos IS 'Atributo de tipo number que indica el numero de departamentos en el Edificio';
COMMENT ON COLUMN Edificio.Num_Pisos IS 'Atributo de tipo number que indica el numero de pisos en el Edificio';
COMMENT ON COLUMN Edificio.Tiene_elevador IS 'Atributo de tipo number que indica si hay elevador en el Edificio';
COMMENT ON COLUMN Edificio.Fecha_Construccion IS 'Atributo de tipo date que indica el dia de construccion del Edificio';

COMMENT ON TABLE Tipo_servicio IS 'Tabla donde esta modelado una Tipo_servicio';
COMMENT ON COLUMN Tipo_servicio.Id_servicio IS 'LLave de tipo number para identificar Tipo_servicio';
COMMENT ON COLUMN Tipo_servicio.Id_edificio IS 'LLave de tipo number para identificar Tipo_servicio';
COMMENT ON COLUMN Tipo_servicio.Nombre_servicio IS 'Atributo de tipo char que indica cuantos anios tiene la Tipo_servicio de costruida';
COMMENT ON COLUMN Tipo_servicio.Descripcion IS 'Atributo de tipo char que indica el area total de la Tipo_servicio';


COMMENT ON TABLE Compra IS 'Tabla donde esta modelado una Compra';
COMMENT ON COLUMN Compra.Id_compra IS 'LLave de tipo number para identificar Compra';
COMMENT ON COLUMN Compra.Id_Propiedad IS 'LLave de tipo number para identificar Compra';
COMMENT ON COLUMN Compra.Id_Propietario IS 'LLave de tipo number para identificar  Compra ';
COMMENT ON COLUMN Compra.CURP IS 'Atributo de tipo char para identificar que propietario hizo la Compra';
COMMENT ON COLUMN Compra.Id_direccion IS 'LLave de tipo number para identificar  Compra';
COMMENT ON COLUMN Compra.Antiguedad_Propiedad IS 'Atributo de tipo number que indica el numero total de lugar para estacionarse en la Compra';


COMMENT ON TABLE Vender IS 'Tabla donde esta modelado una Vender';
COMMENT ON COLUMN Vender.Id_Vendedor IS 'LLave de tipo number para identificar Vender';
COMMENT ON COLUMN VENDER.ID_PROPIETARIO IS 'LLave de tipo number para identificar Vender';
COMMENT ON COLUMN Vender.CURP IS 'Atributo de tipo char para identificar Vender ';
COMMENT ON COLUMN VENDER.ID_PROPIEDAD IS 'LLave de tipo number para identificar Vender';
COMMENT ON COLUMN Vender.ID_DIRECCION IS 'LLave de tipo number para identificar Vender';
COMMENT ON COLUMN Vender.COMISION IS 'Atributo de tipo number que indica el numero total d';


COMMENT ON TABLE SEGURO IS 'Tabla donde esta modelado una SEGURO';
COMMENT ON COLUMN SEGURO.Num_Poliza IS 'LLave de tipo number para identificar SEGURO';
COMMENT ON COLUMN SEGURO.Id_direccion IS 'LLave de tipo number para identificar SEGURO';
COMMENT ON COLUMN SEGURO.Id_propiedad IS 'LLave de tipo number para identificar SEGURO';
COMMENT ON COLUMN SEGURO.Cobertura IS 'Atributo de tipo char que indica el area total de la SEGURO';
COMMENT ON COLUMN SEGURO.Monto_seguro IS 'Atributo de tipo number que indica el numero total de baños en la SEGURO';


COMMENT ON TABLE Aseguradora IS 'Tabla donde esta modelado una Aseguradora';
COMMENT ON COLUMN Aseguradora.Id_empresa IS 'LLave de tipo number para identificar Aseguradora';
COMMENT ON COLUMN Aseguradora.Id_direccion IS 'LLave de tipo number para identificar Aseguradora';
COMMENT ON COLUMN Aseguradora.Num_Poliza IS 'Atributo de tipo number que indica cuantos anios tiene la Aseguradora de costruida';
COMMENT ON COLUMN Aseguradora.Id_Propiedad IS 'Atributo de tipo number que indica el area total de la Aseguradora';
COMMENT ON COLUMN Aseguradora.Nombre_empresa IS 'Atributo de tipo char que indica el numero total de baños en la Aseguradora';


COMMENT ON TABLE serivcio IS 'Tabla donde esta modelado una servicio';
COMMENT ON COLUMN serivcio.Id_servicio IS 'LLave de tipo number para identificar servicio';
COMMENT ON COLUMN serivcio.Id_direccion IS 'LLave de tipo number para identificar servicio';
COMMENT ON COLUMN serivcio.Id_propiedad IS 'Atributo de tipo number que indica cuantos anios tiene la servicio de costruida';
COMMENT ON COLUMN serivcio.Monto_servicio IS 'Atributo de tipo number que indica el area total de la servicio';
COMMENT ON COLUMN serivcio.Descripcion IS 'Atributo de tipo char que indica el numero total de baños en la servicio';



COMMENT ON TABLE direccion IS 'Tabla donde esta modelado una direccion';
COMMENT ON COLUMN direccion.Id_direccion IS 'LLave de tipo number para identificar direccion';
COMMENT ON COLUMN direccion.numero IS 'Atributo de tipo number que indica el area total de la direccion';
COMMENT ON COLUMN direccion.calle IS 'Atributo de tipo char que indica el area total de la direccion';

COMMENT ON TABLE pertenecer IS 'Tabla donde esta modelado una pertenecer';
COMMENT ON COLUMN pertenecer.Id_Direccion IS 'Atributo de tipo number que indica cuantos anios tiene la pertenecer de costruida';


COMMENT ON TABLE colonia IS 'Tabla donde esta modelado una colonia';
COMMENT ON COLUMN colonia.Id_Colonia IS 'LLave de tipo number para identificar colonia';
COMMENT ON COLUMN colonia.Id_Distrito IS 'Atributo de tipo number que indica el area total de la colonia';
COMMENT ON COLUMN colonia.Num_habitantes IS 'Atributo de tipo number que indica el numero total de baños en la colonia';
COMMENT ON COLUMN colonia.Nombre_colonia IS 'Atributo de tipo char que indica el numero total de lugar para estacionarse en la colonia';


COMMENT ON TABLE tienda IS 'Tabla donde esta modelado una tienda';
COMMENT ON COLUMN tienda.Id_tienda IS 'LLave de tipo number para identificar tienda';
COMMENT ON COLUMN tienda.Id_Colonia IS 'Atributo de tipo number que indica cuantos anios tiene la tienda de costruida';
COMMENT ON COLUMN tienda.Nombre_tienda IS 'Atributo de tipo char que indica el numero total de lugar para estacionarse en la tienda';
COMMENT ON COLUMN tienda.Descripcion IS 'Atributo de tipo char que indica el valor catastral de la tienda';


COMMENT ON TABLE transporte IS 'Tabla donde esta modelado una transporte';
COMMENT ON COLUMN transporte.Id_transporte IS 'LLave de tipo number para identificar transporte';
COMMENT ON COLUMN transporte.Id_Colonia IS 'Atributo de tipo number que indica cuantos anios tiene la transporte de costruida';
COMMENT ON COLUMN transporte.Nombre_transporte IS 'Atributo de tipo char que indica el numero total de lugar para estacionarse en la transporte';
COMMENT ON COLUMN transporte.Descripcion IS 'Atributo de tipo char que indica el valor catastral de la transporte';

COMMENT ON TABLE Pertenecer_Mun_Distr IS 'Tabla donde esta modelado una Pertenecer_Mun_Distr';
COMMENT ON COLUMN Pertenecer_Mun_Distr.Id_Distrito IS 'LLave de tipo number para identificar Pertenecer_Mun_Distr';
COMMENT ON COLUMN Pertenecer_Mun_Distr.Id_municipio IS 'Atributo de tipo number que indica cuantos anios tiene la Pertenecer_Mun_Distr de costruida';
COMMENT ON COLUMN Pertenecer_Mun_Distr.Id_colonia IS 'Atributo de tipo number que indica el area total de la Pertenecer_Mun_Distr';


COMMENT ON TABLE municipio IS 'Tabla donde esta modelado una municipio';
COMMENT ON COLUMN municipio.Id_municipio IS 'LLave de tipo number para identificar municipio';
COMMENT ON COLUMN municipio.Nombre_Municipio IS 'Atributo de tipo char que indica el numero total de lugar para estacionarse en la municipio';


COMMENT ON TABLE distrito IS 'Tabla donde esta modelado una distrito';
COMMENT ON COLUMN distrito.Id_distrito IS 'LLave de tipo number para identificar distrito';
COMMENT ON COLUMN distrito.Nombre_distrito IS 'Atributo de tipo char que indica el numero total de lugar para estacionarse en la distrito';


COMMENT ON TABLE Pertenecer_estado IS 'Tabla donde esta modelado una Pertenecer_estado';
COMMENT ON COLUMN Pertenecer_estado.Id_Distrito IS 'LLave de tipo number para identificar Pertenecer_estado';
COMMENT ON COLUMN Pertenecer_estado.Id_Municipio IS 'Atributo de tipo number que indica cuantos anios tiene la Pertenecer_estado de costruida';
COMMENT ON COLUMN Pertenecer_estado.Id_estado IS 'Atributo de tipo number que indica el numero total de baños en la Pertenecer_estado';

COMMENT ON TABLE estado IS 'Tabla donde esta modelado una estado';
COMMENT ON COLUMN estado.Id_estado IS 'LLave de tipo number para identificar estado';
COMMENT ON COLUMN estado.Nombre_Estado IS 'Atributo de tipo char que indica cuantos anios tiene la estado de costruida';


TABLE_NAME,COLUMN_NAME,DATA_TYPE,DATA_LENGTH,DATA_PRECISION,NULLABLE,COLUMN_ID,CHAR_LENGTH,QUALIFIED_COL_NAME,COMMENTS
SELECT TABLE_NAME,COLUMN_NAME,DATA_TYPE,DATA_LENGTH,DATA_PRECISION,NULLABLE,COLUMN_ID,CHAR_LENGTH,QUALIFIED_COL_NAME,COMMENTS  FROM USER_TAB_COLS NATURAL INNER JOIN USER_COL_COMMENTS ORDER BY TABLE_NAME;
