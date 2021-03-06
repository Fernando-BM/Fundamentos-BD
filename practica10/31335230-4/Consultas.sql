-----Consulta #1----
SELECT NOMBRE FROM ARTISTA NATURAL INNER JOIN 
(SELECT TRIM(CURP) AS CURP ,NOMBREINT,FUNCION FROM PERTENECE) 
NATURAL INNER JOIN INTERPRETE
WHERE PAIS NOT LIKE 'México';


---Consulta #2----
SELECT TITULO 
FROM CANCION
WHERE DURACION >= '05:00' ORDER BY 1 DESC;


---Consulta #3-- 
SELECT NOMBREC, LUGARORIGEN, NUMFANS, NOMBREINT
FROM (SELECT NOMBRE NOMBREC, LUGARORIGEN, NUMFANS, NOMBREINT FROM CLUB) NATURAL INNER JOIN ARTISTA NATURAL INNER JOIN 
(SELECT TRIM(CURP) AS CURP ,NOMBREINT,FUNCION FROM PERTENECE) NATURAL INNER JOIN INTERPRETE
WHERE PAIS LIKE 'M%'
ORDER BY NOMBREC;

---Consulta #4----
SELECT TITULO,ALBUM 
FROM DISCO NATURAL INNER JOIN DISQUERA NATURAL INNER JOIN ESTA NATURAL INNER JOIN CANCION
WHERE TITULO = ALBUM;

---Consulta #5----
SELECT '(' || S.NOMBRE || ',' || B.NOMBRE || ')' tupla
FROM(
SELECT * FROM ARTISTA NATURAL INNER JOIN 
(SELECT TRIM(CURP) AS CURP ,NOMBREINT,FUNCION FROM PERTENECE) 
NATURAL INNER JOIN INTERPRETE
WHERE PAIS like 'Espa%'
AND FUNCION='Voz') S ,

(SELECT * FROM ARTISTA NATURAL INNER JOIN 
(SELECT TRIM(CURP) AS CURP ,NOMBREINT,FUNCION FROM PERTENECE) 
NATURAL INNER JOIN INTERPRETE
WHERE PAIS like 'Espa%'
AND FUNCION='Guitarra') B;

---Consulta #6----
SELECT  TITULO,DURACION
FROM CANCION
WHERE cancion.duracion=(select max(cancion.duracion) from cancion);

---Consulta #7----
SELECT NOMBRE, PAIS, NUMFANS
FROM (SELECT NOMBRE NOMBREC, LUGARORIGEN, NUMFANS, NOMBREINT FROM CLUB) NATURAL INNER JOIN ARTISTA NATURAL INNER JOIN 
(SELECT TRIM(CURP) AS CURP ,NOMBREINT,FUNCION FROM PERTENECE) NATURAL INNER JOIN INTERPRETE
WHERE NUMFANS >500 and PAIS like 'Ing%';

---Consulta #8----

---INDICANDO_----

SELECT *
FROM
(
 SELECT ROW_NUMBER() OVER (ORDER BY NUMFANS) AS Orden, Nombre
 FROM CLUB
) T1
WHERE Orden = 10

----PRUEBA--
SELECT NOMBRE
FROM CLUB
ORDER BY(NUMFANS);

--Consulta #9----

---TABLA DE TODOS LOS GRUPOS---
SELECT *
FROM ARTISTA NATURAL INNER JOIN PERTENECE;

---TABLA DE LOS GRUPOS CON CANTIDAD DE INTEGRANTES---
SELECT COUNT(NOMBRE) AS CANTIDADINT,NOMBREINT
FROM( SELECT *
FROM ARTISTA NATURAL INNER JOIN PERTENECE)
GROUP BY NOMBREINT;

---TABLA DE LOS GRUPOS CON CANTIDAD DE INTEGRANTES MAYOR A 2---
SELECT NOMBREINT,CANTIDADINT
FROM(
SELECT COUNT(NOMBRE) AS CANTIDADINT,NOMBREINT
FROM( SELECT *
FROM ARTISTA NATURAL INNER JOIN PERTENECE)
GROUP BY NOMBREINT)
WHERE CANTIDADINT>2;


--ARTISTA CON FUNCION de BAJO----
SELECT *
FROM ARTISTA NATURAL INNER JOIN PERTENECE
WHERE FUNCION like 'Baj%';

---CURP DEL ARTISTA QUE TOCAN EL Bajo CON EL NUMERO DE GRUPOS CON EL QUE TRABAJA-----
SELECT COUNT(NOMBREINT) AS CANTIDAD,CURP
FROM (SELECT *
FROM ARTISTA NATURAL INNER JOIN PERTENECE
WHERE FUNCION like 'Baj%')
GROUP BY CURP;

--CURP DEL ARTISTA QUE TOCAN EL Bajo CON UNICO GRUPO----
SELECT CURP
FROM(SELECT COUNT(NOMBREINT) AS CANTIDAD,CURP
FROM (SELECT *
FROM ARTISTA NATURAL INNER JOIN PERTENECE
WHERE FUNCION like 'Baj%')
GROUP BY CURP)
WHERE CANTIDAD=1;

-----LA CONSULTA COMPLETA *----
SELECT NOMBRE
FROM((SELECT NOMBREINT,CANTIDADINT
FROM(
SELECT COUNT(NOMBRE) AS CANTIDADINT,NOMBREINT
FROM( SELECT *
FROM ARTISTA NATURAL INNER JOIN PERTENECE)
GROUP BY NOMBREINT)
WHERE CANTIDADINT>2) NATURAL INNER JOIN PERTENECE NATURAL INNER JOIN ARTISTA NATURAL INNER JOIN
(SELECT CURP
FROM(SELECT COUNT(NOMBREINT) AS CANTIDAD,CURP
FROM (SELECT *
FROM ARTISTA NATURAL INNER JOIN PERTENECE
WHERE FUNCION like 'Baj%')
GROUP BY CURP)
WHERE CANTIDAD=1));

---Consulta #10----
----CONTAR CANCIONES DE CADA COMPOSITOR-----
SELECT COUNT(TITULO) AS CantidadTi,CURPC
FROM COMPOSITOR NATURAL INNER JOIN CANCION
GROUP BY CURPC;
--OBTENER AL COMPOSITOR CON MAS CANCIONES---
SELECT  CURPC,CANTIDADTI
FROM (SELECT COUNT(TITULO) AS CantidadTi,CURPC
FROM COMPOSITOR NATURAL INNER JOIN CANCION
GROUP BY CURPC)
WHERE CANTIDADTI=(select max(CANTIDADTI) from (SELECT COUNT(TITULO) AS CantidadTi,CURPC
FROM COMPOSITOR NATURAL INNER JOIN CANCION
GROUP BY CURPC));
----OBTENER EL TITULO DE CADA CANCION
SELECT NOMBREC,TITULO
FROM((SELECT  CURPC,CANTIDADTI
FROM (SELECT COUNT(TITULO) AS CantidadTi,CURPC
FROM COMPOSITOR NATURAL INNER JOIN CANCION
GROUP BY CURPC)
WHERE CANTIDADTI=(select max(CANTIDADTI) from (SELECT COUNT(TITULO) AS CantidadTi,CURPC
FROM COMPOSITOR NATURAL INNER JOIN CANCION
GROUP BY CURPC)))NATURAL INNER JOIN CANCION NATURAL INNER JOIN COMPOSITOR);

----Consulta #11-corregir----
---EXTRAER ANIO DE UN STRING----

select SUBSTR(fechaL,0,4) AS ANIO, ALBUM 
FROM DISCO;


---CONTAR CUANTOS ALBUM POR A;O---
SELECT COUNT(ALBUM) AS CantidadALB,ANIO
FROM (select SUBSTR(fechaL,0,4) AS ANIO, ALBUM 
FROM DISCO)
GROUP BY ANIO
ORDER BY ANIO;

---CALCULAR EL MAXIMO DE LOS ANIOS----
SELECT  ANIO,CANTIDADaLB
FROM (SELECT COUNT(ALBUM) AS CantidadALB,ANIO
FROM (select SUBSTR(fechaL,0,4) AS ANIO, ALBUM 
FROM DISCO)
GROUP BY ANIO
ORDER BY ANIO)
WHERE CANTIDADaLB=(select max(CANTIDADaLB) from (SELECT COUNT(ALBUM) AS CantidadALB,ANIO
FROM (select SUBSTR(fechaL,0,4) AS ANIO, ALBUM 
FROM DISCO)
GROUP BY ANIO
ORDER BY ANIO));

