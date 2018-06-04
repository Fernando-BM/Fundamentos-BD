Alemán Baza Dante - 313081848
Bernal Martínez Fernando - 313352304

Práctica 6 - Fundamentos de Bases de Datos 2018-2


Pasos Docker con sqlplus y sqldeveloper:

	1.- Iniciar
		sudo docker start sath-89
		sudo docker exec -it sath-89 /bin/bash
		cd $ORACLE_HOME
		bin/sqlplus / as sysdba
	2.- En SQLPLUS crear TABLESPACE
		CREATE TABLESPACE name datafile 'name.dbf' size 80M;
		CREATE USER usuario IDENTIFIED BY contrasenia DEFAULT TABLESPACE name;
		ALTER USER "usuario"DEFAULT TABLESPACE "name"TEMPORARY TABLESPACE "TEMP" ACCOUNT UNLOCK;
		ALTER USER usuario QUOTA UNLIMITED ON name;
	3.- Abrir sql developer
		Crear una nueva conexión con el usuario y contrasenia
		abrir la conexión y nos vamos al icono de la carpeta, seleccionar archivo DDL.sql
		cuando nos muestre el script dar click en el icono 'ejecutar script' y seleccionar la conexión.

Pasos Oracle nativo con terminal.
	
	1.- Ejecutar SQLPLUS
	2. loggearse a SQL PLUS
	3. connect sath-89
	3. @<Ubicaci'on del archivo>/DDL.sql
