---------------------------------------------------CREACION DE TABLAS-----------------------------------------------------------

CREATE TABLE Propiedad (
    Id_Propiedad number(10) NOT NULL,
    Id_Direccion number(10) NOT NULL,
    Antigüedad char(255),
    Tamaño float(10),
    Num_baños number(10),
    Num_estacionamientos number(10),
    Valor_Catastral float(10),
    Vendido number(1),
    Num_habitaciones number(10),
    PRIMARY KEY (Id_Propiedad, Id_Direccion)
);
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


CREATE TABLE Casa (
    Id_casa number(10) NOT NULL UNIQUE,
    Id_direccion number(10) NOT NULL,
    Id_Propiedad number(10) NOT NULL,
    Tamaño_habitable float(10),
    Niveles number(10),

    Tamano_total float(10),
    Fecha_Construccion date,
    PRIMARY KEY (Id_casa, Id_direccion, Id_Propiedad)
);

COMMENT ON TABLE Casa IS 'Tabla donde esta modelado una casa';
COMMENT ON COLUMN Casa.Id_casa IS 'LLave de tipo number para identificar casa';
COMMENT ON COLUMN Casa.Id_direccion IS 'LLave de tipo number para identificar casa';
COMMENT ON COLUMN Casa.Id_Propiedad IS 'Atributo de tipo number que indica cuantos anios tiene la casa costruida';
COMMENT ON COLUMN Casa.Tamaño_habitable IS 'Atributo de tipo float que indica el area total de la casa';
COMMENT ON COLUMN Casa.Niveles IS 'Atributo de tipo number que indica el numero total de niveles en la casa';
COMMENT ON COLUMN Casa.Tamano_total IS 'Atributo de tipo float que indica el tamanio total de la casa';
COMMENT ON COLUMN Casa.Fecha_Construccion IS 'Atributo de tipo date que el dia de construccion de la casa';


CREATE TABLE Terreno (
    Id_Terreno number(10) NOT NULL,
    Id_Propiedad number(10) NOT NULL,
    Id_direccion number(10) NOT NULL,
    Construido number(1,0),
    Fecha_de_Registro date,
    PRIMARY KEY (Id_Terreno, Id_Propiedad, Id_direccion)
);

COMMENT ON TABLE Terreno IS 'Tabla donde esta modelado una Terreno';
COMMENT ON COLUMN Terreno.Id_Terreno IS 'LLave de tipo number para identificar Terreno';
COMMENT ON COLUMN Terreno.Id_Propiedad IS 'LLave de tipo number para identificar Terreno';
COMMENT ON COLUMN Terreno.Id_direccion IS 'LLave de tipo number  para identificar Terreno';
COMMENT ON COLUMN Terreno.Construido IS 'Atributo de tipo number  que indica el area construida del Terreno';
COMMENT ON COLUMN Terreno.Fecha_de_Registro IS 'Atributo de tipo date que indica el dia que se registro el Terreno';

CREATE TABLE Departamento (
    Num_Departamento number(10) NOT NULL,
    Id_Propiedad number(10) NOT NULL,
    Id_direccion number(10) NOT NULL,
    Id_edificio number(10) NOT NULL,
    Nivel_Edificio number(10),
    Tiene_balcon number(1,0),
    Tiene_areaLavado number(1,0),
    PRIMARY KEY (Num_Departamento, Id_Propiedad, Id_direccion, Id_edificio)
);

COMMENT ON TABLE Departamento IS 'Tabla donde esta modelado una Departamento';
COMMENT ON COLUMN Departamento.Num_Departamento IS 'LLave de tipo number para identificar Departamento';
COMMENT ON COLUMN Departamento.Id_direccion IS 'LLave de tipo number para identificar Departamento';
COMMENT ON COLUMN Departamento.Id_edificio IS 'LLave de tipo number para identificar Departamento';
COMMENT ON COLUMN Departamento.NIvel_Edificio IS 'Atributo de tipo number que indica en que nivel del edificio esta ubicado el  Departamento';
COMMENT ON COLUMN Departamento.Tiene_balcon IS 'Atributo de tipo number que indica si el Departamento tiene balcon';
COMMENT ON COLUMN Departamento.Tiene_areaLavado IS 'Atributo de tipo number que indica si el Departamento tiene balcon';


CREATE TABLE Propietario (
    Id_Propietario number(10) NOT NULL,
    CURP char(255) NOT NULL,
    Nombre char(255) NOT NULL,
    Paterno char(255) NOT NULL,
    Materno char(255) NOT NULL,
    Fecha_nacimiento date,
    PRIMARY KEY (Id_Propietario, CURP));
 
COMMENT ON TABLE Propietario IS 'Tabla donde esta modelado un Propietario';
COMMENT ON COLUMN Propietario.Id_Propietario IS 'LLave de tipo number para identificar Propietario';
COMMENT ON COLUMN Propietario.Curp IS 'Atributo de tipo char que indica la CURP del Propietario';
COMMENT ON COLUMN Propietario.Nombre IS 'Atributo de tipo char que indica el nombre del Propietario';
COMMENT ON COLUMN Propietario.Paterno IS 'Atributo de tipo char que indica el apellido paterno del Propietario';
COMMENT ON COLUMN Propietario.Materno IS 'Atributo de tipo char que indica el apellido materno del Propietario';
COMMENT ON COLUMN Propietario.Fecha_nacimiento IS 'Atributo de tipo date que indica el dia de nacimiento del Propietario';    


CREATE TABLE Vendedor (
    Id_Vendedor number(10) NOT NULL,
    Id_Propietario number(10) NOT NULL,
    CURP char(255) NOT NULL,
    RFC char(255) NOT NULL,
    PRIMARY KEY (Id_Vendedor, Id_Propietario, CURP)
);

COMMENT ON TABLE Vendedor IS 'Tabla donde esta modelado una Vendedor';
COMMENT ON COLUMN Vendedor.Id_Vendedor IS 'LLave de tipo number para identificar Vendedor';
COMMENT ON COLUMN Vendedor.Id_Propietario IS 'LLave de tipo number para identificar Vendedor';
COMMENT ON COLUMN Vendedor.CURP IS 'Atributo de tipo char que indica la CURP del Vendedor';
COMMENT ON COLUMN Vendedor.RFC IS 'Atributo de tipo char que indica el RFC del Vendedor';


CREATE TABLE Seguro_TSeguro (
    SeguroNum_Poliza number(10) NOT NULL,
    TSeguroPropiedadId_Propiedad number(10) NOT NULL,
    PRIMARY KEY (SeguroNum_Poliza, TSeguroPropiedadId_Propiedad)
);

COMMENT ON TABLE Seguro_TSeguro IS 'Tabla donde esta modelado una Seguro_TSeguro';
COMMENT ON COLUMN Seguro_TSeguro.SeguroNum_Poliza IS 'LLave de tipo number para identificar Seguro_TSeguro';
COMMENT ON COLUMN Seguro_TSeguro.TSeguroPropiedadId_Propiedad IS 'LLave de tipo number para identificar Seguro_TSeguro';


CREATE TABLE Comprar (
    Id_Propiedad number(10) NOT NULL,
    Id_Propietario number(10) NOT NULL,
    CURP char(255) NOT NULL,
    PropiedadId_direccion number(10) NOT NULL,
    Fecha_venta date,
    Precio_venta number(10),
    PRIMARY KEY (Id_Propiedad, Id_Propietario, CURP, PropiedadId_direccion)
);

COMMENT ON TABLE Comprar IS 'Tabla donde esta modelado una Comprar';
COMMENT ON COLUMN Comprar.Id_Propiedad IS 'LLave de tipo number para identificar Comprar';
COMMENT ON COLUMN Comprar.Id_Propietario IS 'LLave de tipo number para identificar Comprar';
COMMENT ON COLUMN Comprar.CURP IS 'Atributo de tipo char que que indica la CURP del Propietario que Compro la propiedad';
COMMENT ON COLUMN Comprar.PropiedadId_direccion  IS 'LLave de tipo number para identificar Comprar';
COMMENT ON COLUMN Comprar.Fecha_venta IS 'Atributo de tipo date que indica el dia de la Compra';
COMMENT ON COLUMN Comprar.Precio_venta IS 'Atributo de tipo number que indica el precio de la propiedad cuando fue Comprada';


CREATE TABLE Edificio (
    Id_edificio number(10) NOT NULL,
    Num_departamentos number(10),
    Num_Pisos number(10),
    Tiene_elevador number(1,0),
    Fecha_construccion date,
    PRIMARY KEY (Id_edificio)
);

COMMENT ON TABLE Edificio IS 'Tabla donde esta modelado una Edificio';
COMMENT ON COLUMN Edificio.Id_Edificio IS 'LLave de tipo number para identificar Edificio';
COMMENT ON COLUMN Edificio.Num_departamentos IS 'Atributo de tipo number que indica el numero de departamentos en el Edificio';
COMMENT ON COLUMN Edificio.Num_Pisos IS 'Atributo de tipo number que indica el numero de pisos en el Edificio';
COMMENT ON COLUMN Edificio.Tiene_elevador IS 'Atributo de tipo number que indica si hay elevador en el Edificio';
COMMENT ON COLUMN Edificio.Fecha_Construccion IS 'Atributo de tipo date que indica el dia de construccion del Edificio';


CREATE TABLE Tipo_servicio (
    Id_servicio number(10) NOT NULL,
    EdificioId_edificio number(10) NOT NULL,
    Nombre_servicio char(255),
    Descripcion char(255),
    PRIMARY KEY (Id_servicio, EdificioId_edificio)
);

COMMENT ON TABLE Tipo_servicio IS 'Tabla donde esta modelado una Tipo_servicio';
COMMENT ON COLUMN Tipo_servicio.Id_servicio IS 'LLave de tipo number para identificar Tipo_servicio';
COMMENT ON COLUMN Tipo_servicio.EdificioId_edificio IS 'LLave de tipo number para identificar Tipo_servicio';
COMMENT ON COLUMN Tipo_servicio.Nombre_servicio IS 'Atributo de tipo char que indica cuantos anios tiene la Tipo_servicio de costruida';
COMMENT ON COLUMN Tipo_servicio.Descripcion IS 'Atributo de tipo char que indica el area total de la Tipo_servicio';

CREATE TABLE Compra (
    Id_compra number(10) NOT NULL,
    Id_Propiedad number(10) NOT NULL,
    Id_Propietario number(10) NOT NULL,
    CURP char(255) NOT NULL,
    Id_direccion number(10) NOT NULL,
    Antiguedad_Propiedad number(10),
    PRIMARY KEY (Id_compra, Id_Propiedad, Id_Propietario, CURP, Id_direccion)
);

COMMENT ON TABLE Compra IS 'Tabla donde esta modelado una Compra';
COMMENT ON COLUMN Compra.Id_compra IS 'LLave de tipo number para identificar Compra';
COMMENT ON COLUMN Compra.Id_Propiedad IS 'LLave de tipo number para identificar Compra';
COMMENT ON COLUMN Compra.Id_Propietario IS 'LLave de tipo number para identificar  Compra ';
COMMENT ON COLUMN Compra.CURP IS 'Atributo de tipo char para identificar que propietario hizo la Compra';
COMMENT ON COLUMN Compra.Id_direccion IS 'LLave de tipo number para identificar  Compra';
COMMENT ON COLUMN Compra.Antiguedad_Propiedad IS 'Atributo de tipo number que indica el numero total de lugar para estacionarse en la Compra';


CREATE TABLE Vender (
    Id_Vendedor number(10) NOT NULL,
    Id_Propietario number(10) NOT NULL,
    CURP char(255) NOT NULL,
    Id_Propiedad number(10) NOT NULL,
    Id_Direccion number(10) NOT NULL,
    comision number(10),
    PRIMARY KEY (Id_Vendedor, Id_Propietario, CURP, Id_Propiedad, Id_Direccion)
);

COMMENT ON TABLE Vender IS 'Tabla donde esta modelado una Vender';
COMMENT ON COLUMN Vender.Id_Vendedor IS 'LLave de tipo number para identificar Vender';
COMMENT ON COLUMN VENDER.ID_PROPIETARIO IS 'LLave de tipo number para identificar Vender';
COMMENT ON COLUMN Vender.CURP IS 'Atributo de tipo char para identificar Vender ';
COMMENT ON COLUMN VENDER.ID_PROPIEDAD IS 'LLave de tipo number para identificar Vender';
COMMENT ON COLUMN Vender.ID_DIRECCION IS 'LLave de tipo number para identificar Vender';
COMMENT ON COLUMN Vender.COMISION IS 'Atributo de tipo number que indica el numero total d';

CREATE TABLE Seguro (
    Num_Poliza number(10) NOT NULL,
    Id_Propiedad number(10) NOT NULL,
    Id_Direccion number(10) NOT NULL,
    Cobertura char(255),
    Monto_seguro number(10),
    PRIMARY KEY (Num_Poliza, Id_Propiedad, Id_Direccion)
);

COMMENT ON TABLE SEGURO IS 'Tabla donde esta modelado una SEGURO';
COMMENT ON COLUMN SEGURO.Num_Poliza IS 'LLave de tipo number para identificar SEGURO';
COMMENT ON COLUMN SEGURO.Id_direccion IS 'LLave de tipo number para identificar SEGURO';
COMMENT ON COLUMN SEGURO.Id_propiedad IS 'LLave de tipo number para identificar SEGURO';
COMMENT ON COLUMN SEGURO.Cobertura IS 'Atributo de tipo char que indica el area total de la SEGURO';
COMMENT ON COLUMN SEGURO.Monto_seguro IS 'Atributo de tipo number que indica el numero total de baños en la SEGURO';

CREATE TABLE Aseguradora (
    Id_empresa number(10) NOT NULL,
    Num_Poliza number(10) NOT NULL,
    Id_Propiedad number(10) NOT NULL,
    Id_Direccion number(10) NOT NULL,
    Nombre_empresa char(255),
    PRIMARY KEY (Id_empresa, Num_Poliza, Id_Propiedad, Id_Direccion)
);

COMMENT ON TABLE Aseguradora IS 'Tabla donde esta modelado una Aseguradora';
COMMENT ON COLUMN Aseguradora.Id_empresa IS 'LLave de tipo number para identificar Aseguradora';
COMMENT ON COLUMN Aseguradora.Id_direccion IS 'LLave de tipo number para identificar Aseguradora';
COMMENT ON COLUMN Aseguradora.Num_Poliza IS 'Atributo de tipo number que indica cuantos anios tiene la Aseguradora de costruida';
COMMENT ON COLUMN Aseguradora.Id_Propiedad IS 'Atributo de tipo number que indica el area total de la Aseguradora';
COMMENT ON COLUMN Aseguradora.Nombre_empresa IS 'Atributo de tipo char que indica el numero total de baños en la Aseguradora';


CREATE TABLE Servicio (
    Id_servicio number(10) NOT NULL,
    Id_Propiedad number(10) NOT NULL,
    Id_Direccion number(10) NOT NULL,
    Monto_servicio number(10),
    Descripcion char(255),
    PRIMARY KEY (Id_servicio, Id_Propiedad, Id_Direccion)
);

COMMENT ON TABLE servicio IS 'Tabla donde esta modelado una servicio';
COMMENT ON COLUMN servicio.Id_servicio IS 'LLave de tipo number para identificar servicio';
COMMENT ON COLUMN servicio.Id_direccion IS 'LLave de tipo number para identificar servicio';
COMMENT ON COLUMN servicio.Id_propiedad IS 'Atributo de tipo number que indica cuantos anios tiene la servicio de costruida';
COMMENT ON COLUMN servicio.Monto_servicio IS 'Atributo de tipo number que indica el area total de la servicio';
COMMENT ON COLUMN servicio.Descripcion IS 'Atributo de tipo char que indica el numero total de baños en la servicio';


CREATE TABLE Tener_direccion (
    Id_Propiedad number(10) NOT NULL,
    Id_Direccion number(10) NOT NULL,
    PRIMARY KEY (Id_Propiedad, Id_Direccion)
);

COMMENT ON TABLE Tener_direccion IS 'Tabla donde esta modelado una Tener_direccion';
COMMENT ON COLUMN Tener_direccion.Id_Propiedad IS 'LLave de tipo number para identificar Tener_direccion';
COMMENT ON COLUMN Tener_direccion.Id_direccion IS 'LLave de tipo number para identificar Tener_direccion';

CREATE TABLE Direccion (
    Id_Propiedad number(10) NOT NULL,
    Id_Direccion number(10) NOT NULL,
    Numero number(10),
    calle char(255),
    PRIMARY KEY (Id_Propiedad, Id_Direccion)
);


COMMENT ON TABLE direccion IS 'Tabla donde esta modelado una direccion';
COMMENT ON COLUMN direccion.Id_direccion IS 'LLave de tipo number para identificar direccion';
COMMENT ON COLUMN direccion.Id_propiedad IS 'Atributo de tipo number que indica cuantos anios tiene la direccion de costruida';
COMMENT ON COLUMN direccion.numero IS 'Atributo de tipo number que indica el area total de la direccion';
COMMENT ON COLUMN direccion.calle IS 'Atributo de tipo char que indica el area total de la direccion';


CREATE TABLE Pertenecer (
    Id_Propiedad number(10) NOT NULL,
    Id_Direccion number(10) NOT NULL,
    PRIMARY KEY (Id_Propiedad, Id_Direccion)
);

COMMENT ON TABLE pertenecer IS 'Tabla donde esta modelado una pertenecer';
COMMENT ON COLUMN pertenecer.Id_Propiedad IS 'LLave de tipo number para identificar pertenecer';
COMMENT ON COLUMN pertenecer.Id_Direccion IS 'Atributo de tipo number que indica cuantos anios tiene la pertenecer de costruida';

CREATE TABLE Colonia (
    Id_Colonia number(10) NOT NULL,
    Id_Propiedad number(10) NOT NULL,
    Id_Direccion number(10) NOT NULL,
    Num_habitantes number(10),
    Nombre_colonia char(255),
    PRIMARY KEY (Id_Colonia, Id_Propiedad, Id_Direccion)
);

COMMENT ON TABLE colonia IS 'Tabla donde esta modelado una colonia';
COMMENT ON COLUMN colonia.Id_colonia IS 'LLave de tipo number para identificar colonia';
COMMENT ON COLUMN colonia.Id_Propiedad IS 'Atributo de tipo number que indica cuantos anios tiene la colonia de costruida';
COMMENT ON COLUMN colonia.Id_Direccion IS 'Atributo de tipo number que indica el area total de la colonia';
COMMENT ON COLUMN colonia.Num_habitantes IS 'Atributo de tipo number que indica el numero total de baños en la colonia';
COMMENT ON COLUMN colonia.Nombre_colonia IS 'Atributo de tipo char que indica el numero total de lugar para estacionarse en la colonia';


CREATE TABLE Tienda (
    Id_tienda number(10) NOT NULL,
    Id_Colonia number(10) NOT NULL,
    ColoniaPertenecerId_Direccion number(10) NOT NULL,
    ColoniaPertenecerId_Propiedad number(10) NOT NULL,
    Nombre_tienda char(255),
    Descripcion char(255),
    PRIMARY KEY (Id_tienda, Id_Colonia, ColoniaPertenecerId_Direccion, ColoniaPertenecerId_Propiedad)
);

COMMENT ON TABLE tienda IS 'Tabla donde esta modelado una tienda';
COMMENT ON COLUMN tienda.Id_tienda IS 'LLave de tipo number para identificar tienda';
COMMENT ON COLUMN tienda.Id_Colonia IS 'Atributo de tipo number que indica cuantos anios tiene la tienda de costruida';
COMMENT ON COLUMN tienda.ColoniaPertenecerId_Direccion IS 'Atributo de tipo number que indica el area total de la tienda';
COMMENT ON COLUMN tienda.ColoniaPertenecerId_Propiedad  IS 'Atributo de tipo number que indica el numero total de baños en la tienda';
COMMENT ON COLUMN tienda.Nombre_tienda IS 'Atributo de tipo char que indica el numero total de lugar para estacionarse en la tienda';
COMMENT ON COLUMN tienda.Descripcion IS 'Atributo de tipo char que indica el valor catastral de la tienda';



CREATE TABLE Transporte (
    Id_transporte number(10) NOT NULL,
    Id_Colonia number(10) NOT NULL,
    ColoniaPertenecerId_Direccion number(10) NOT NULL,
    ColoniaPertenecerId_Propiedad number(10) NOT NULL,
    Nombre_transporte char(255),
    Descripcion char(255),
    PRIMARY KEY (Id_transporte, Id_Colonia, ColoniaPertenecerId_Direccion, ColoniaPertenecerId_Propiedad)
);

COMMENT ON TABLE transporte IS 'Tabla donde esta modelado una transporte';
COMMENT ON COLUMN transporte.Id_transporte IS 'LLave de tipo number para identificar transporte';
COMMENT ON COLUMN transporte.Id_Colonia IS 'Atributo de tipo number que indica cuantos anios tiene la transporte de costruida';
COMMENT ON COLUMN transporte.ColoniaPertenecerId_Direccion IS 'Atributo de tipo number que indica el area total de la transporte';
COMMENT ON COLUMN transporte.ColoniaPertenecerId_Propiedad IS 'Atributo de tipo number que indica el numero total de baños en la transporte';
COMMENT ON COLUMN transporte.Nombre_transporte IS 'Atributo de tipo char que indica el numero total de lugar para estacionarse en la transporte';
COMMENT ON COLUMN transporte.Descripcion IS 'Atributo de tipo char que indica el valor catastral de la transporte';

CREATE TABLE Pertenecer_Mun_Distr (
    Id_Colonia number(10) NOT NULL,
    Id_Propiedad number(10) NOT NULL,
    Id_Direccion number(10) NOT NULL,
    PRIMARY KEY (Id_Colonia, Id_Propiedad, Id_Direccion)
);

COMMENT ON TABLE Pertenecer_Mun_Distr IS 'Tabla donde esta modelado una Pertenecer_Mun_Distr';
COMMENT ON COLUMN Pertenecer_Mun_Distr.Id_Colonia IS 'LLave de tipo number para identificar Pertenecer_Mun_Distr';
COMMENT ON COLUMN Pertenecer_Mun_Distr.Id_Propiedad IS 'Atributo de tipo number que indica cuantos anios tiene la Pertenecer_Mun_Distr de costruida';
COMMENT ON COLUMN Pertenecer_Mun_Distr.Id_Direccion IS 'Atributo de tipo number que indica el area total de la Pertenecer_Mun_Distr';


CREATE TABLE Municipio (
    Id_municipio number(10) NOT NULL,
    Id_Colonia number(10) NOT NULL,
    Id_Propiedad number(10) NOT NULL,
    Id_Direccion number(10) NOT NULL,
    Nombre_Municipio char(255),
    PRIMARY KEY (Id_municipio, Id_Colonia, Id_Propiedad, Id_Direccion)
);

COMMENT ON TABLE municipio IS 'Tabla donde esta modelado una municipio';
COMMENT ON COLUMN municipio.Id_municipio IS 'LLave de tipo number para identificar municipio';
COMMENT ON COLUMN municipio.Id_colonia IS 'Atributo de tipo number que indica cuantos anios tiene la municipio de costruida';
COMMENT ON COLUMN municipio.Id_Propiedad IS 'Atributo de tipo number que indica el area total de la municipio';
COMMENT ON COLUMN municipio.Id_Direccion IS 'Atributo de tipo number que indica el numero total de baños en la municipio';
COMMENT ON COLUMN municipio.Nombre_Municipio IS 'Atributo de tipo char que indica el numero total de lugar para estacionarse en la municipio';




CREATE TABLE Distrito (
    Id_Distrito number(10) NOT NULL,
    Id_Colonia number(10) NOT NULL,
    Id_Propiedad number(10) NOT NULL,
    Id_Direccion number(10) NOT NULL,
    Nombre_distrito char(255),
    PRIMARY KEY (Id_Distrito, Id_Colonia, Id_Propiedad, Id_Direccion)
);


COMMENT ON TABLE distrito IS 'Tabla donde esta modelado una distrito';
COMMENT ON COLUMN distrito.Id_distrito IS 'LLave de tipo number para identificar distrito';
COMMENT ON COLUMN distrito.Id_colonia IS 'Atributo de tipo number que indica cuantos anios tiene la distrito de costruida';
COMMENT ON COLUMN distrito.Id_propiedad IS 'Atributo de tipo number que indica el area total de la distrito';
COMMENT ON COLUMN distrito.Id_Direccion IS 'Atributo de tipo number que indica el numero total de baños en la distrito';
COMMENT ON COLUMN distrito.Nombre_distrito IS 'Atributo de tipo char que indica el numero total de lugar para estacionarse en la distrito';

CREATE TABLE Pertenecer_estado (
    Id_Distrito number(10) NOT NULL,
    Id_Colonia number(10) NOT NULL,
    Id_Propiedad number(10) NOT NULL,
    Id_Direccion number(10) NOT NULL,
    Id_municipio number(10) NOT NULL,
    MunicipioId_Colonia number(10) NOT NULL,
    MunicipioId_Propiedad number(10) NOT NULL,
    MunicipioId_Direccion number(10) NOT NULL,
    EstadoId_estado number(10) NOT NULL,
    PRIMARY KEY (Id_Distrito, Id_Colonia, Id_Propiedad, Id_Direccion,
                 Id_municipio, MunicipioId_Colonia, MunicipioId_Propiedad, MunicipioId_Direccion)
);

COMMENT ON TABLE Pertenecer_estado IS 'Tabla donde esta modelado una Pertenecer_estado';
COMMENT ON COLUMN Pertenecer_estado.Id_Distrito IS 'LLave de tipo number para identificar Pertenecer_estado';
COMMENT ON COLUMN Pertenecer_estado.Id_Colonia IS 'Atributo de tipo number que indica cuantos anios tiene la Pertenecer_estado de costruida';
COMMENT ON COLUMN Pertenecer_estado.Id_Propiedad IS 'Atributo de tipo number que indica el area total de la Pertenecer_estado';
COMMENT ON COLUMN Pertenecer_estado.Id_Direccion IS 'Atributo de tipo number que indica el numero total de baños en la Pertenecer_estado';
COMMENT ON COLUMN Pertenecer_estado.Id_municipio IS 'Atributo de tipo number que indica el numero total de lugar para estacionarse en la Pertenecer_estado';
COMMENT ON COLUMN Pertenecer_estado.MunicipioId_Colonia IS 'Atributo de tipo number que indica el numero total de lugar para estacionarse en la Pertenecer_estado';
COMMENT ON COLUMN Pertenecer_estado.MunicipioId_Propiedad IS 'Atributo de tipo number que indica el numero total de lugar para estacionarse en la Pertenecer_estado';
COMMENT ON COLUMN Pertenecer_estado.MunicipioId_Direccion IS 'Atributo de tipo number que indica el numero total de lugar para estacionarse en la Pertenecer_estado';
COMMENT ON COLUMN Pertenecer_estado.EstadoId_estado IS 'Atributo de tipo number que indica el valor catastral de la Pertenecer_estado';

CREATE TABLE Estado (
    Id_estado number(10) NOT NULL,
    Nombre_Estado char(255),
    PRIMARY KEY (Id_estado)
);


COMMENT ON TABLE estado IS 'Tabla donde esta modelado una estado';
COMMENT ON COLUMN estado.Id_estado IS 'LLave de tipo number para identificar estado';
COMMENT ON COLUMN estado.Nombre_Estado IS 'Atributo de tipo char que indica cuantos anios tiene la estado de costruida';

---------------------------------------------------CREACION DE LLAVES FORANEAS-----------------------------------------------------------
ALTER TABLE Vendedor ADD CONSTRAINT FK_Vendedor_Propietario FOREIGN KEY (Id_Propietario, CURP) REFERENCES Propietario (Id_Propietario, CURP);

ALTER TABLE Comprar ADD CONSTRAINT FK_Comprador_Propiedad FOREIGN KEY (Id_Propiedad, PropiedadId_direccion) REFERENCES Propiedad (Id_Propiedad, Id_Direccion);

ALTER TABLE Comprar ADD CONSTRAINT FK_Comprar_Propietario FOREIGN KEY (Id_Propietario, CURP) REFERENCES Propietario (Id_Propietario, CURP);

ALTER TABLE Departamento ADD CONSTRAINT FK_Departamento_Edificio FOREIGN KEY (Id_edificio) REFERENCES Edificio (Id_edificio);

ALTER TABLE Casa ADD CONSTRAINT FK_Casa_Propiedad FOREIGN KEY (Id_Propiedad, Id_direccion) REFERENCES Propiedad (Id_Propiedad, Id_Direccion);

ALTER TABLE Terreno ADD CONSTRAINT FK_Terreno_Propiedad FOREIGN KEY (Id_Propiedad, Id_direccion) REFERENCES Propiedad (Id_Propiedad, Id_Direccion);

ALTER TABLE Departamento ADD CONSTRAINT FK_Departamento_Propiedad FOREIGN KEY (Id_Propiedad, Id_direccion) REFERENCES Propiedad (Id_Propiedad, Id_Direccion);

ALTER TABLE Tipo_servicio ADD CONSTRAINT FK_Tipo_servicio_Edificio FOREIGN KEY (EdificioId_edificio) REFERENCES Edificio (Id_edificio);

ALTER TABLE Compra ADD CONSTRAINT FK_Compra_Comprar FOREIGN KEY (Id_Propiedad, Id_Propietario, CURP, Id_direccion) REFERENCES Comprar (Id_Propiedad, Id_Propietario, CURP, PropiedadId_direccion);

ALTER TABLE Vender ADD CONSTRAINT FK_Vender_Vendedor FOREIGN KEY (Id_Vendedor, Id_Propietario, CURP) REFERENCES Vendedor (Id_Vendedor, Id_Propietario, CURP);

ALTER TABLE Vender ADD CONSTRAINT FK_Vender_Propiedad FOREIGN KEY (Id_Propiedad, Id_Direccion) REFERENCES Propiedad (Id_Propiedad, Id_Direccion);

ALTER TABLE Seguro ADD CONSTRAINT FK_Seguro_Propiedad FOREIGN KEY (Id_Propiedad, Id_Direccion) REFERENCES Propiedad (Id_Propiedad, Id_Direccion);

ALTER TABLE Aseguradora ADD CONSTRAINT FK_Aseguradora_Seguro FOREIGN KEY (Num_Poliza, Id_Propiedad, Id_Direccion) REFERENCES Seguro (Num_Poliza, Id_Propiedad, Id_Direccion);

ALTER TABLE Servicio ADD CONSTRAINT FK_Servicio_Propiedad FOREIGN KEY (Id_Propiedad, Id_Direccion) REFERENCES Propiedad (Id_Propiedad, Id_Direccion);

ALTER TABLE Tener_direccion ADD CONSTRAINT FK_Tener_direccion_Propiedad FOREIGN KEY (Id_Propiedad, Id_Direccion) REFERENCES Propiedad (Id_Propiedad, Id_Direccion);

ALTER TABLE Direccion ADD CONSTRAINT FK_Direccion_Tener_direccion FOREIGN KEY (Id_Propiedad, Id_Direccion) REFERENCES Tener_direccion (Id_Propiedad, Id_Direccion);

ALTER TABLE Pertenecer ADD CONSTRAINT FK_Pertenecer_Direccion FOREIGN KEY (Id_Propiedad, Id_Direccion) REFERENCES Direccion (Id_Propiedad, Id_Direccion);

ALTER TABLE Colonia ADD CONSTRAINT FK_Colonia_Pertenecer FOREIGN KEY (Id_Propiedad, Id_Direccion) REFERENCES Pertenecer (Id_Propiedad, Id_Direccion);

ALTER TABLE Tienda ADD CONSTRAINT FK_Tienda_Colonia FOREIGN KEY (Id_Colonia, ColoniaPertenecerId_Propiedad, ColoniaPertenecerId_Direccion) REFERENCES Colonia (Id_Colonia, Id_Propiedad, Id_Direccion);

ALTER TABLE Transporte ADD CONSTRAINT FK_Transporte_Colonia FOREIGN KEY (Id_Colonia, ColoniaPertenecerId_Propiedad, ColoniaPertenecerId_Direccion) REFERENCES Colonia (Id_Colonia, Id_Propiedad, Id_Direccion);

ALTER TABLE Pertenecer_Mun_Distr ADD CONSTRAINT FK_Pertenecer_MDC FOREIGN KEY (Id_Colonia, Id_Propiedad, Id_Direccion) REFERENCES Colonia (Id_Colonia, Id_Propiedad, Id_Direccion);

ALTER TABLE Distrito ADD CONSTRAINT FK_Pertenecer_MDA FOREIGN KEY (Id_Colonia, Id_Propiedad, Id_Direccion) REFERENCES Pertenecer_Mun_Distr (Id_Colonia, Id_Propiedad, Id_Direccion);

ALTER TABLE Municipio ADD CONSTRAINT FK_Pertenecer_MD FOREIGN KEY (Id_Colonia, Id_Propiedad, Id_Direccion) REFERENCES Pertenecer_Mun_Distr (Id_Colonia, Id_Propiedad, Id_Direccion);

ALTER TABLE Pertenecer_estado ADD CONSTRAINT FK_Pertenecer_estado_Distrito FOREIGN KEY (Id_Distrito, Id_Colonia, Id_Propiedad, Id_Direccion) REFERENCES Distrito (Id_Distrito, Id_Colonia, Id_Propiedad, Id_Direccion);

ALTER TABLE Pertenecer_estado ADD CONSTRAINT FK_Pertenecer_estado_Municipio FOREIGN KEY (Id_municipio, MunicipioId_Colonia, MunicipioId_Propiedad, MunicipioId_Direccion) REFERENCES Municipio (Id_municipio, Id_Colonia, Id_Propiedad, Id_Direccion);

ALTER TABLE Pertenecer_estado ADD CONSTRAINT FK_Pertenecer_estado_Estado FOREIGN KEY (EstadoId_estado) REFERENCES Estado (Id_estado);
-------------------------------------------------------------------Restricciones--------------------------------------------------------------------------------------------------------------------------------------------------------------------------

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

ALTER TABLE Servicio
add constraint CK_Servicio_Positiva
CHECK(Monto_servicio>=0);






