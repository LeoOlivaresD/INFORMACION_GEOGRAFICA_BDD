--CREACION DE TABLAS SUGERIDAS EN MODELO RELACIONAL
CREATE TABLE REGION (
id_region NUMBER NOT NULL PRIMARY KEY,
nombre_region VARCHAR2 (50) not null
);
CREATE TABLE CIUDAD (
id_ciudad number primary key not null,
nombre_ciudad varchar2(50) not null,
region_id number not null, -- CRECION DE COULUMNA QUE APUNTARA COMO LLAVE FORANEA A LA TABLA REGION
CONSTRAINT FK_region FOREIGN KEY (region_id) REFERENCES REGION (id_region) -- VINCULACION DE LA LLAVE FORNEA POR MEDIO DE LA COLUMNA CREADA ANTERIORMEENTE
);

CREATE TABLE COMUNA (
codigo_comuna number not null primary key,
nombre_comuna varchar2(50) not null,
ciudad_id number  not null,
CONSTRAINT FK_ciudad FOREIGN KEY (ciudad_id) REFERENCES CIUDAD (id_ciudad)
);

create TABLE EMPLEADO(
id_E NUMBER PRIMARY KEY NOT NULL,
rut_E VARCHAR2 (10) NOT NULL,
nombre VARCHAR2(50) NOT NULL,
telefono NUMBER,
sueldo NUMBER,
comuna_codigo number not null,
CONSTRAINT FK_comuna_codigo FOREIGN KEY (comuna_codigo) REFERENCES COMUNA (codigo_comuna)
);

--INSERCION DE DATOS PARA CADA TABLA

--LASTIMA QUE ORACLE NO PERMITA INSERTAR DE ESTA FORMA, PERO LO DEJO PARA RECORAR QUE ES VALIDO EN WORKBENCH
--insert into region (id_region , nombre_region) values 
--(1, 'VALPARAISO'),
--(2, 'METROPOLINA'),
--(3, 'COQUIMBO');
--INSERCION DE DATOS PARA REGIONES
insert into region (id_region, nombre_region) values (1, 'valparaiso');
insert into region (id_region, nombre_region) values (2, 'metropolina');
insert into region (id_region, nombre_region) values (3, 'coquimbo');

--COMPRUEBO DATOS INSERTADOS
select * FROM region;

--INSERSION DE DATOS PARA CIUDADES
insert into ciudad (id_ciudad, nombre_ciudad, region_id) values (1,'quilpue',1);
insert into ciudad (id_ciudad, nombre_ciudad, region_id) values (2,'villa alemana', 1);
insert into ciudad (id_ciudad, nombre_ciudad, region_id) values (3, 'santiago', 2);
insert into ciudad (id_ciudad, nombre_ciudad, region_id) values (4,'La Serena' , 3);

SELECT * FROM ciudad;

--INSERCION DE DATOS PARA COMUNA
insert into comuna(codigo_comuna, nombre_comuna,ciudad_id) values (1,'BELLOTO', 1);
insert into comuna(codigo_comuna, nombre_comuna,ciudad_id) values (2,'talagante',2);
insert into comuna(codigo_comuna, nombre_comuna,ciudad_id) values (3,'Peña Blanca',1);

SELECT * FROM comuna;

--INSERCION DE DATOS PARA EMPLEADO

insert into empleado(id_e, rut_e, nombre, telefono, sueldo, comuna_codigo) values(1,'18123345-3', 'marcelo', 989898967, 510000, 3);
insert into empleado(id_e, rut_e, nombre, telefono, sueldo, comuna_codigo) values(2, '9567987-2', 'maria', 978563412, 650000, 1);
insert into empleado(id_e, rut_e, nombre, telefono, sueldo, comuna_codigo) values(3, '11122123-3', 'oscar', 989674534, 480000,2);

select * from empleado;

--CONSULTAS SIMPLES PROPUESTAS EN LA ACTIVIDAD

SELECT * FROM EMPLEADO WHERE sueldo > 500000; --busco todos los empledos que ganen mas de $500.000
SELECT * FROM CIUDAD WHERE region_id = 1; -- decidí reemplzar la consulta dos donde proponia buscar por empresas del modela por esta, la razon es por que no estaba incluida en el modelo
SELECT * FROM ciudad where nombre_ciudad = 'santiago'; --Busco tal como dice en el word, todas las ciudades iguales a santiago
