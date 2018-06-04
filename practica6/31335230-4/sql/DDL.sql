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

CREATE TABLE Terreno (
    Id_Terreno number(10) NOT NULL,
    Id_Propiedad number(10) NOT NULL,
    Id_direccion number(10) NOT NULL,
    Construido number(1,0),
    Fecha_de_Registro date,
    PRIMARY KEY (Id_Terreno, Id_Propiedad, Id_direccion)
);

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

CREATE TABLE Propietario (
    Id_Propietario number(10) NOT NULL,
    CURP char(255) NOT NULL,
    Nombre char(255) NOT NULL,
    Paterno char(255) NOT NULL,
    Materno char(255) NOT NULL,
    Fecha_nacimiento date,
    PRIMARY KEY (Id_Propietario, CURP));

CREATE TABLE Vendedor (
    Id_Vendedor number(10) NOT NULL,
    Id_Propietario number(10) NOT NULL,
    CURP char(255) NOT NULL,
    RFC char(255) NOT NULL,
    PRIMARY KEY (Id_Vendedor, Id_Propietario, CURP)
);

CREATE TABLE Seguro_TSeguro (
    SeguroNum_Poliza number(10) NOT NULL,
    TSeguroPropiedadId_Propiedad number(10) NOT NULL,
    PRIMARY KEY (SeguroNum_Poliza, TSeguroPropiedadId_Propiedad)
);

CREATE TABLE Comprar (
    Id_Propiedad number(10) NOT NULL,
    Id_Propietario number(10) NOT NULL,
    CURP char(255) NOT NULL,
    PropiedadId_direccion number(10) NOT NULL,
    Fecha_venta date,
    Precio_venta number(10),
    PRIMARY KEY (Id_Propiedad, Id_Propietario, CURP, PropiedadId_direccion)
);

CREATE TABLE Edificio (
    Id_edificio number(10) NOT NULL,
    Num_departamentos number(10),
    Num_Pisos number(10),
    Tiene_elevador number(1,0),
    Fecha_construccion date,
    PRIMARY KEY (Id_edificio)
);

CREATE TABLE Tipo_servicio (
    Id_servicio number(10) NOT NULL,
    EdificioId_edificio number(10) NOT NULL,
    Nombre_servicio char(255),
    Descripcion char(255),
    PRIMARY KEY (Id_servicio, EdificioId_edificio)
);

CREATE TABLE Compra (
    Id_compra number(10) NOT NULL,
    Id_Propiedad number(10) NOT NULL,
    Id_Propietario number(10) NOT NULL,
    CURP char(255) NOT NULL,
    Id_direccion number(10) NOT NULL,
    Antiguedad_Propiedad number(10),
    PRIMARY KEY (Id_compra, Id_Propiedad, Id_Propietario, CURP, Id_direccion)
);

CREATE TABLE Vender (
    Id_Vendedor number(10) NOT NULL,
    Id_Propietario number(10) NOT NULL,
    CURP char(255) NOT NULL,
    Id_Propiedad number(10) NOT NULL,
    Id_Direccion number(10) NOT NULL,
    comision number(10),
    PRIMARY KEY (Id_Vendedor, Id_Propietario, CURP, Id_Propiedad, Id_Direccion)
);

CREATE TABLE Seguro (
    Num_Poliza number(10) NOT NULL,
    Id_Propiedad number(10) NOT NULL,
    Id_Direccion number(10) NOT NULL,
    Cobertura char(255),
    Monto_seguro number(10),
    PRIMARY KEY (Num_Poliza, Id_Propiedad, Id_Direccion)
);


CREATE TABLE Aseguradora (
    Id_empresa number(10) NOT NULL,
    Num_Poliza number(10) NOT NULL,
    Id_Propiedad number(10) NOT NULL,
    Id_Direccion number(10) NOT NULL,
    Nombre_empresa char(255),
    PRIMARY KEY (Id_empresa, Num_Poliza, Id_Propiedad, Id_Direccion)
);

CREATE TABLE Servicio (
    Id_servicio number(10) NOT NULL,
    Id_Propiedad number(10) NOT NULL,
    Id_Direccion number(10) NOT NULL,
    Monto_servicio number(10),
    Descripcion char(255),
    PRIMARY KEY (Id_servicio, Id_Propiedad, Id_Direccion)
);

CREATE TABLE Tener_direccion (
    Id_Propiedad number(10) NOT NULL,
    Id_Direccion number(10) NOT NULL,
    PRIMARY KEY (Id_Propiedad, Id_Direccion)
);

CREATE TABLE Direccion (
    Id_Propiedad number(10) NOT NULL,
    Id_Direccion number(10) NOT NULL,
    Numero number(10),
    calle char(255),
    PRIMARY KEY (Id_Propiedad, Id_Direccion)
);

CREATE TABLE Pertenecer (
    Id_Propiedad number(10) NOT NULL,
    Id_Direccion number(10) NOT NULL,
    PRIMARY KEY (Id_Propiedad, Id_Direccion)
);

CREATE TABLE Colonia (
    Id_Colonia number(10) NOT NULL,
    Id_Propiedad number(10) NOT NULL,
    Id_Direccion number(10) NOT NULL,
    Num_habitantes number(10),
    Nombre_colonia char(255),
    PRIMARY KEY (Id_Colonia, Id_Propiedad, Id_Direccion)
);

CREATE TABLE Tienda (
    Id_tienda number(10) NOT NULL,
    Id_Colonia number(10) NOT NULL,
    ColoniaPertenecerId_Direccion number(10) NOT NULL,
    ColoniaPertenecerId_Propiedad number(10) NOT NULL,
    Nombre_tienda char(255),
    Descripcion char(255),
    PRIMARY KEY (Id_tienda, Id_Colonia, ColoniaPertenecerId_Direccion, ColoniaPertenecerId_Propiedad)
);

CREATE TABLE Transporte (
    Id_transporte number(10) NOT NULL,
    Id_Colonia number(10) NOT NULL,
    ColoniaPertenecerId_Direccion number(10) NOT NULL,
    ColoniaPertenecerId_Propiedad number(10) NOT NULL,
    Nombre_transporte char(255),
    Descripcion char(255),
    PRIMARY KEY (Id_transporte, Id_Colonia, ColoniaPertenecerId_Direccion, ColoniaPertenecerId_Propiedad)
);

CREATE TABLE Pertenecer_Mun_Distr (
    Id_Colonia number(10) NOT NULL,
    Id_Propiedad number(10) NOT NULL,
    Id_Direccion number(10) NOT NULL,
    PRIMARY KEY (Id_Colonia, Id_Propiedad, Id_Direccion)
);

CREATE TABLE Municipio (
    Id_municipio number(10) NOT NULL,
    Id_Colonia number(10) NOT NULL,
    Id_Propiedad number(10) NOT NULL,
    Id_Direccion number(10) NOT NULL,
    Nombre_Municipio char(255),
    PRIMARY KEY (Id_municipio, Id_Colonia, Id_Propiedad, Id_Direccion)
);

CREATE TABLE Distrito (
    Id_Distrito number(10) NOT NULL,
    Id_Colonia number(10) NOT NULL,
    Id_Propiedad number(10) NOT NULL,
    Id_Direccion number(10) NOT NULL,
    Nombre_distrito char(255),
    PRIMARY KEY (Id_Distrito, Id_Colonia, Id_Propiedad, Id_Direccion)
);

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

CREATE TABLE Estado (
    Id_estado number(10) NOT NULL,
    Nombre_Estado char(255),
    PRIMARY KEY (Id_estado)
);

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
