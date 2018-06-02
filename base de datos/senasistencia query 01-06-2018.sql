--Query Base de datos SENASISTENCIA 22/05/2018
	USE master
	CREATE DATABASE senasistencia
	USE senasistencia
	

	--Tabla fuerte
	CREATE TABLE programa_formacion(
	ID_Programa BIGINT PRIMARY KEY NOT NULL IDENTITY(1,1),
	Nombre_Programa VARCHAR(100) NOT NULL,
	Estado_Programa BIT NOT NULL, 
	FechaDeCreacion_Programa DATE NOT NULL,
	FechaDeInactivacion_Programa DATE
	                               )
	--Tabla fuerte
	CREATE TABLE tipo_de_documento(
	ID_TipoDeDocumento BIGINT PRIMARY KEY NOT NULL IDENTITY(1,1),
	Nombre_TipoDeDocumento VARCHAR(30) NOT NULL,
	Estado_TipoDeDocumento BIT NOT NULL,
	FechaDeCreacion_TipoDeDocumento DATE NOT NULL,
	FechaDeInactivacion_TipoDeDocumento DATE
	                             )
	--Tabla fuerte
	CREATE TABLE rol(
	ID_Rol BIGINT PRIMARY KEY NOT NULL IDENTITY(1,1),
	Tipo_Rol VARCHAR(30) NOT NULL,
	Estado_Rol BIT NOT NULL,
	FechaDeCreacion_Rol DATE NOT NULL,
	FechaDeInactivacion_Rol DATE
	                 )
	--Tabla fuerte
	CREATE TABLE perfil(
	ID_Perfil BIGINT  PRIMARY KEY NOT NULL IDENTITY(1,1),
	Tipo_Perfil VARCHAR(40) NOT NULL,
	Estado_Perfil BIT NOT NULL, 
	FechaDeCreacion_Perfil DATE NOT NULL,
	FechaDeInactivacion_Perfil DATE
	                   )
					   
	--Tabla fuerte
	CREATE TABLE excusa(
	ID_Excusa BIGINT PRIMARY KEY NOT NULL IDENTITY(1,1),
	FechaInicio_Excusa DATE NOT NULL,
	FechaFin_Excusa DATE NOT NULL,
	Comentario_Excusa VARCHAR(600) NOT NULL,
	Url_Excusa VARCHAR(500)
	            )
	

	CREATE TABLE notificacion(
	ID_Notificacion INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	Asunto_Notificacion VARCHAR(100) NOT NULL,
	Mensaje_Notificacion VARCHAR(3000) NOT NULL
	)
	

	--Tabla debil
	CREATE TABLE cliente(
	FK_TipoDeDocumento BIGINT FOREIGN KEY REFERENCES tipo_de_documento(ID_TipoDeDocumento),
	Documento_Cliente BIGINT PRIMARY KEY NOT NULL,
	PrimerNombre_Cliente VARCHAR(60) NOT NULL,
	SegundoNombre_Cliente VARCHAR(60),
	PrimerApellido_Cliente VARCHAR(60) NOT NULL,
	SegundoApellido_Cliente VARCHAR(60),
	Correo_Cliente VARCHAR(60) NOT NULL,
	Telefono_Cliente VARCHAR(10),
	FK_Perfil BIGINT FOREIGN KEY REFERENCES perfil(ID_Perfil),
	Estado_Cliente BIT NOT NULL,
	FechaDeCreacion_Cliente DATE NOT NULL,
	FechaDeInactivacion_Cliente DATE
	)
	

	--Tabla debil
	CREATE TABLE ficha(
	ID_Ficha BIGINT PRIMARY KEY NOT NULL IDENTITY(1,1),
	FK_Programa BIGINT FOREIGN KEY REFERENCES programa_formacion (ID_Programa),
	Num_Ficha VARCHAR(20) NOT NULL,
	Grupo_Ficha INT NOT NULL,
	Jornada_Ficha VARCHAR (20) NOT NULL,
	Trimestre_Ficha INT NOT NULL,
	Estado_Ficha BIT NOT NULL,
	FechaDeCreacion_Ficha DATE NOT NULL,
	FechaDeInactivacion_Ficha DATE 
	                  )
	

	--Tabla debil
	CREATE TABLE aprendiz(
	FK_TipoDeDocumento BIGINT FOREIGN KEY REFERENCES tipo_de_documento(ID_TipoDeDocumento),
	Documento_Aprendiz BIGINT PRIMARY KEY NOT NULL,
	PrimerNombre_Aprendiz VARCHAR(60) NOT NULL,
	SegundoNombre_Aprendiz VARCHAR(60),
	PrimerApellido_Aprendiz VARCHAR(60) NOT NULL,
	SegundoApellido_Aprendiz VARCHAR(60),
	Correo_Aprendiz VARCHAR(60) NOT NULL,
	Telefono_Aprendiz VARCHAR(10),
	FK_Ficha BIGINT FOREIGN KEY REFERENCES ficha(ID_Ficha),
	Estado_Aprendiz BIT NOT NULL,
	FechaDeCreacion_Aprendiz DATE NOT NULL,
	FechaDeInactivacion_Aprendiz DATE
	)
	--Tabla debil
	CREATE TABLE usuario(
	ID_Usuario BIGINT PRIMARY KEY NOT NULL IDENTITY(1,1),
	FK_DocCliente BIGINT FOREIGN KEY REFERENCES cliente(Documento_Cliente),
	Password_Usuario VARCHAR(100) NOT NULL,
	Estado_Usuario BIT NOT NULL,
	FechaDeCreacion_Usuario  DATE NOT NULL,
	FechaDeInactivacion_Usuario DATE
	                   )
	

	--Tabla debil
	CREATE TABLE asistencia(
	ID_Asistencia BIGINT PRIMARY KEY NOT NULL IDENTITY(1,1),
	FK_DocAprendiz BIGINT FOREIGN KEY REFERENCES aprendiz(Documento_Aprendiz),
	Estado_Asistencia BIT NOT NULL,
	Fecha_Asistencia DATE NOT NULL 
	                       )
	

	--Tabla debil
	CREATE TABLE registro_notificacion (
	ID_Registro BIGINT PRIMARY KEY NOT NULL IDENTITY (1,1),
	Fecha_Registro DATE NOT NULL,
	FK_DocAprendiz BIGINT FOREIGN KEY REFERENCES aprendiz(Documento_Aprendiz),
	FK_Asistencia BIGINT FOREIGN KEY REFERENCES asistencia(ID_Asistencia),
	FK_DocCliente BIGINT FOREIGN KEY REFERENCES cliente(Documento_Cliente),
	FK_Notificacion INT FOREIGN KEY REFERENCES notificacion(ID_Notificacion)
	)
	

	--Tablas intermedias de las relaciones muchos a muchos
	

	--Relacion entre la tabla cliente y Ficha
	CREATE TABLE cliente_ficha(
	FK_DocCliente BIGINT FOREIGN KEY REFERENCES cliente(Documento_Cliente),
	FK_Ficha BIGINT FOREIGN KEY REFERENCES ficha(ID_Ficha)
	)
	--Relacion entre la tabla Cliente y Rol
	CREATE TABLE cliente_rol(
	FK_DocCliente BIGINT FOREIGN KEY REFERENCES cliente(Documento_Cliente),
	FK_Rol BIGINT FOREIGN KEY REFERENCES rol(ID_Rol)
	)
	--Relacion entre la tabla Excusa y asistencia
	CREATE TABLE excusa_asistencia(
	FK_Excusa BIGINT FOREIGN KEY REFERENCES excusa(ID_Excusa),
	FK_Asistencia BIGINT FOREIGN KEY REFERENCES asistencia(ID_Asistencia)
	)

    INSERT INTO programa_formacion(Nombre_Programa,Estado_Programa,FechaDeCreacion_Programa)
    VALUES ('Mantenimiento de Motocicletas',1,'2018-04-29')
    INSERT INTO programa_formacion(Nombre_Programa,Estado_Programa,FechaDeCreacion_Programa)
    VALUES ('Apoyo Administrativo en Salud',1,'2018-04-29')
    INSERT INTO programa_formacion(Nombre_Programa,Estado_Programa,FechaDeCreacion_Programa)
    VALUES ('Asistencia Administrativa',1,'2018-04-29')
    INSERT INTO programa_formacion(Nombre_Programa,Estado_Programa,FechaDeCreacion_Programa)
    VALUES ('Asistencia en Organización de Archivos',1,'2018-04-29')
    INSERT INTO programa_formacion(Nombre_Programa,Estado_Programa,FechaDeCreacion_Programa)
    VALUES ('Inspección y Ensayos con Procesos no Destructivos',1,'2018-04-29')
    INSERT INTO programa_formacion(Nombre_Programa,Estado_Programa,FechaDeCreacion_Programa)
    VALUES ('Instalación de Infraestructura para Redes Móviles',1,'2018-04-29')
    INSERT INTO programa_formacion(Nombre_Programa,Estado_Programa,FechaDeCreacion_Programa)
    VALUES ('Instalación de Redes de Computadores',1,'2018-04-29')
    INSERT INTO programa_formacion(Nombre_Programa,Estado_Programa,FechaDeCreacion_Programa)
    VALUES ('Instalaciones de Redes Híbridas de Fibra Optica y Coaxial',1,'2018-04-29')
    INSERT INTO programa_formacion(Nombre_Programa,Estado_Programa,FechaDeCreacion_Programa)
    VALUES ('Diseño e Integración de Multimedia',1,'2018-04-29')
    INSERT INTO programa_formacion(Nombre_Programa,Estado_Programa,FechaDeCreacion_Programa)
    VALUES ('Mantenimiento de Equipos Electrónicos de Consumo Masivo en A',1,'2018-04-29')
    

	
	
	INSERT INTO tipo_de_documento(Nombre_TipoDeDocumento,Estado_TipoDeDocumento,FechaDeCreacion_TipoDeDocumento)
    VALUES ('Cedula de Ciudadania',1,'2018-04-29')
    INSERT INTO tipo_de_documento(Nombre_TipoDeDocumento,Estado_TipoDeDocumento,FechaDeCreacion_TipoDeDocumento)
    VALUES ('Tarjeta de Identidad',1,'2018-04-29')
    INSERT INTO tipo_de_documento(Nombre_TipoDeDocumento,Estado_TipoDeDocumento,FechaDeCreacion_TipoDeDocumento)
    VALUES ('Cedula de Extranjería',1,'2018-04-29')

    
	
	INSERT INTO rol(Tipo_Rol,Estado_Rol,FechaDeCreacion_Rol)
    VALUES ('Psicologo',1,'2018-05-05')
    INSERT INTO rol(Tipo_Rol,Estado_Rol,FechaDeCreacion_Rol)
    VALUES ('Coordinador',1,'2018-05-05')
    INSERT INTO rol(Tipo_Rol,Estado_Rol,FechaDeCreacion_Rol)
    VALUES ('Instructor',1,'2018-05-05')

	
	
	INSERT INTO perfil(Tipo_Perfil,Estado_Perfil,FechaDeCreacion_Perfil)
    VALUES ('Administrador',1,'2018-04-29')
    INSERT INTO perfil(Tipo_Perfil,Estado_Perfil,FechaDeCreacion_Perfil)
    VALUES ('Usuario',1,'2018-04-29')



	INSERT INTO excusa(FechaInicio_Excusa,FechaFin_Excusa,Comentario_Excusa,URL_Excusa)
    VALUES ('2018-05-03','2018-05-31','aprendiz fallo por excusa medica', '')
    INSERT INTO excusa(FechaInicio_Excusa,FechaFin_Excusa,Comentario_Excusa,URL_Excusa)
    VALUES ('2018-03-04','2018-05-31','aprendiz tiene 3 dias de incapacidad', '')
    INSERT INTO excusa(FechaInicio_Excusa,FechaFin_Excusa,Comentario_Excusa,URL_Excusa)
    VALUES ('2018-03-05','2018-05-31','aprendiz  justifica 1 de sus 2 fallas', '')
    INSERT INTO excusa(FechaInicio_Excusa,FechaFin_Excusa,Comentario_Excusa,URL_Excusa)
    VALUES ('2018-03-06','2018-05-31','aprendiz no cuenta con mas fallas', '')
    INSERT INTO excusa(FechaInicio_Excusa,FechaFin_Excusa,Comentario_Excusa,URL_Excusa)
    VALUES ('2018-03-07','2018-05-31','aprendiz justifica 2 de sus 3 fallas', '')
    INSERT INTO excusa(FechaInicio_Excusa,FechaFin_Excusa,Comentario_Excusa,URL_Excusa)
    VALUES ('2018-03-08','2018-05-31','aprendiz no justifica fallas', '')



	
    INSERT INTO notificacion(Asunto_Notificacion,Mensaje_Notificacion)
    VALUES ('Desercion','Notificación por inasistencia sin previo aviso; por tanto se espera que el aprendiz facilite formato de excusa lo mas pronto posible. NOTA: la tercer inasistencia sera causal de inhabilidad en el sistema; de no presentarse ninguna excusa el aprendiz sera remitido a comité con formato de deserción del programa de formación.')



	INSERT INTO cliente(FK_TipoDeDocumento,Documento_Cliente,PrimerNombre_Cliente,SegundoNombre_Cliente,PrimerApellido_Cliente,SegundoApellido_Cliente,FK_Perfil,Correo_Cliente,Telefono_Cliente,Estado_Cliente,FechaDeCreacion_Cliente)
    VALUES (1,1578425455,'Carlos','Julio','Camargo','Cuellar',2,'carlosc12@hotmail.com','3157854254',1,'2018-05-04')
    INSERT INTO cliente(FK_TipoDeDocumento,Documento_Cliente,PrimerNombre_Cliente,SegundoNombre_Cliente,PrimerApellido_Cliente,SegundoApellido_Cliente,FK_Perfil,Correo_Cliente,Telefono_Cliente,Estado_Cliente,FechaDeCreacion_Cliente)
    VALUES (2,54875425,'Luisa','Maria','Pulido','Garzon',1,'lmpulido548@outlook.com','3115489754',1,'2018-05-04')
    INSERT INTO cliente(FK_TipoDeDocumento,Documento_Cliente,PrimerNombre_Cliente,SegundoNombre_Cliente,PrimerApellido_Cliente,SegundoApellido_Cliente,FK_Perfil,Correo_Cliente,Telefono_Cliente,Estado_Cliente,FechaDeCreacion_Cliente)
    VALUES (3,768745122,'Ivan','David','Mora','Morales',2,'ivanmm@hotmail.com','3178897897',1,'2018-05-04')
    INSERT INTO cliente(FK_TipoDeDocumento,Documento_Cliente,PrimerNombre_Cliente,SegundoNombre_Cliente,PrimerApellido_Cliente,SegundoApellido_Cliente,FK_Perfil,Correo_Cliente,Telefono_Cliente,Estado_Cliente,FechaDeCreacion_Cliente)
    VALUES (1,15598745,'Jeam','Carolina','Rodriguez','Roa',1,'jrodriguez@gmail.com','3225487910',1,'2018-05-04')
    INSERT INTO cliente(FK_TipoDeDocumento,Documento_Cliente,PrimerNombre_Cliente,SegundoNombre_Cliente,PrimerApellido_Cliente,SegundoApellido_Cliente,FK_Perfil,Correo_Cliente,Telefono_Cliente,Estado_Cliente,FechaDeCreacion_Cliente)
    VALUES (1,45785425,'Lina','','Valderrama','Tovar',2,'ltovar2@hotmail.com','3001548750',1,'2018-05-04')
    INSERT INTO cliente(FK_TipoDeDocumento,Documento_Cliente,PrimerNombre_Cliente,SegundoNombre_Cliente,PrimerApellido_Cliente,SegundoApellido_Cliente,FK_Perfil,Correo_Cliente,Telefono_Cliente,Estado_Cliente,FechaDeCreacion_Cliente)
    VALUES (3,8954787542,'Diana','Marcela','Trujillo','Perdomo',2,'Dmarcela89@gmail.com','3012548790',1,'2018-05-04')
    INSERT INTO cliente(FK_TipoDeDocumento,Documento_Cliente,PrimerNombre_Cliente,SegundoNombre_Cliente,PrimerApellido_Cliente,SegundoApellido_Cliente,FK_Perfil,Correo_Cliente,Telefono_Cliente,Estado_Cliente,FechaDeCreacion_Cliente)
    VALUES (2,187548755,'Luis','Felipe','Rojas','Amezquita',2,'luisf61@hotmail.com','3502124488',1,'2018-05-04')


	
	INSERT INTO ficha(FK_Programa,Num_Ficha,Grupo_Ficha,Jornada_Ficha,Trimestre_Ficha,Estado_Ficha,FechaDeCreacion_Ficha)
    VALUES (8,'1193334',1,'Diurna',7,1,'2018-04-29')
    INSERT INTO ficha(FK_Programa,Num_Ficha,Grupo_Ficha,Jornada_Ficha,Trimestre_Ficha,Estado_Ficha,FechaDeCreacion_Ficha)
    VALUES (1,'1193335',2,'Nocturna',2,1,'2018-04-29')
    INSERT INTO ficha(FK_Programa,Num_Ficha,Grupo_Ficha,Jornada_Ficha,Trimestre_Ficha,Estado_Ficha,FechaDeCreacion_Ficha)
    VALUES (4,'1193336',3,'Madrugada',4,1,'2018-04-29')
    INSERT INTO ficha(FK_Programa,Num_Ficha,Grupo_Ficha,Jornada_Ficha,Trimestre_Ficha,Estado_Ficha,FechaDeCreacion_Ficha)
    VALUES (7,'1193337',4,'Fines de Semana',3,1,'2018-04-29')
    INSERT INTO ficha(FK_Programa,Num_Ficha,Grupo_Ficha,Jornada_Ficha,Trimestre_Ficha,Estado_Ficha,FechaDeCreacion_Ficha)
    VALUES (9,'1193338',1,'Nocturna',10,1,'2018-04-29')
    INSERT INTO ficha(FK_Programa,Num_Ficha,Grupo_Ficha,Jornada_Ficha,Trimestre_Ficha,Estado_Ficha,FechaDeCreacion_Ficha)
    VALUES (10,'1184442',3,'Diurna',8,1,'2018-04-29')
    INSERT INTO ficha(FK_Programa,Num_Ficha,Grupo_Ficha,Jornada_Ficha,Trimestre_Ficha,Estado_Ficha,FechaDeCreacion_Ficha)
    VALUES (3,'1184443',2,'Fines de Semana',6,1,'2018-04-29')
    INSERT INTO ficha(FK_Programa,Num_Ficha,Grupo_Ficha,Jornada_Ficha,Trimestre_Ficha,Estado_Ficha,FechaDeCreacion_Ficha)
    VALUES (6,'1184444',1,'Diurna',5,1,'2018-04-29')
    INSERT INTO ficha(FK_Programa,Num_Ficha,Grupo_Ficha,Jornada_Ficha,Trimestre_Ficha,Estado_Ficha,FechaDeCreacion_Ficha)
    VALUES (1,'1184445',4,'Nocturna',2,1,'2018-04-29')
    INSERT INTO ficha(FK_Programa,Num_Ficha,Grupo_Ficha,Jornada_Ficha,Trimestre_Ficha,Estado_Ficha,FechaDeCreacion_Ficha)
    VALUES (2,'1184446',2,'Diurna',1,1,'2018-04-29')



    INSERT INTO aprendiz(FK_TipoDeDocumento,Documento_Aprendiz,PrimerNombre_Aprendiz,SegundoNombre_Aprendiz,PrimerApellido_Aprendiz,SegundoApellido_Aprendiz,Correo_Aprendiz,Telefono_Aprendiz,FK_Ficha,Estado_Aprendiz,FechaDeCreacion_Aprendiz)
    VALUES (1,80807041,'Luis','Antonio','Forero','Torres','laforero1@misena.edu.co','3187809716',1,1,'2018-04-29')
    INSERT INTO aprendiz(FK_TipoDeDocumento,Documento_Aprendiz,PrimerNombre_Aprendiz,SegundoNombre_Aprendiz,PrimerApellido_Aprendiz,SegundoApellido_Aprendiz,Correo_Aprendiz,Telefono_Aprendiz,FK_Ficha,Estado_Aprendiz,FechaDeCreacion_Aprendiz)
    VALUES (2,104001261,'Alma','Marcela','Silva','','almarsilva@misena.edu.co','3112843650',2,1,'2018-04-29')
    INSERT INTO aprendiz(FK_TipoDeDocumento,Documento_Aprendiz,PrimerNombre_Aprendiz,SegundoNombre_Aprendiz,PrimerApellido_Aprendiz,SegundoApellido_Aprendiz,Correo_Aprendiz,Telefono_Aprendiz,FK_Ficha,Estado_Aprendiz,FechaDeCreacion_Aprendiz)
    VALUES (3,79966296,'Robert','Smith','Duque','Morales','rsmithd7@misena.edu.co','3014002169',3,1,'2018-04-29')
    INSERT INTO aprendiz(FK_TipoDeDocumento,Documento_Aprendiz,PrimerNombre_Aprendiz,SegundoNombre_Aprendiz,PrimerApellido_Aprendiz,SegundoApellido_Aprendiz,Correo_Aprendiz,Telefono_Aprendiz,FK_Ficha,Estado_Aprendiz,FechaDeCreacion_Aprendiz)
    VALUES (3,52809251,'Johanna','Milena','Jamaica','Rojas','jmjamaica@misena.edu.co','3214049197',4,1,'2018-04-29')
    INSERT INTO aprendiz(FK_TipoDeDocumento,Documento_Aprendiz,PrimerNombre_Aprendiz,SegundoNombre_Aprendiz,PrimerApellido_Aprendiz,SegundoApellido_Aprendiz,Correo_Aprendiz,Telefono_Aprendiz,FK_Ficha,Estado_Aprendiz,FechaDeCreacion_Aprendiz)
    VALUES (2,1019120468,'Nataly','Stefania','Medina','Poveda','stefa142396@gmail.com','3134595081',2,1,'2018-04-29')
    INSERT INTO aprendiz(FK_TipoDeDocumento,Documento_Aprendiz,PrimerNombre_Aprendiz,SegundoNombre_Aprendiz,PrimerApellido_Aprendiz,SegundoApellido_Aprendiz,Correo_Aprendiz,Telefono_Aprendiz,FK_Ficha,Estado_Aprendiz,FechaDeCreacion_Aprendiz)
    VALUES (1,1020800497,'Tatiana','','Paez','','ltpaez7@misena.edu.co','3224385002',1,1,'2018-04-29')
    INSERT INTO aprendiz(FK_TipoDeDocumento,Documento_Aprendiz,PrimerNombre_Aprendiz,SegundoNombre_Aprendiz,PrimerApellido_Aprendiz,SegundoApellido_Aprendiz,Correo_Aprendiz,Telefono_Aprendiz,FK_Ficha,Estado_Aprendiz,FechaDeCreacion_Aprendiz)
    VALUES (2,80740814,'Harold','Andres','Pietro','Fernandez','haprieto41@misena.edu.co','3212141572',3,1,'2018-04-29')
    INSERT INTO aprendiz(FK_TipoDeDocumento,Documento_Aprendiz,PrimerNombre_Aprendiz,SegundoNombre_Aprendiz,PrimerApellido_Aprendiz,SegundoApellido_Aprendiz,Correo_Aprendiz,Telefono_Aprendiz,FK_Ficha,Estado_Aprendiz,FechaDeCreacion_Aprendiz)
    VALUES (1,1073160640,'Orlando','','Echeverry','Velez','oecheverry0@misena.edu.co','3143326357',1,1,'2018-04-29')
    INSERT INTO aprendiz(FK_TipoDeDocumento,Documento_Aprendiz,PrimerNombre_Aprendiz,SegundoNombre_Aprendiz,PrimerApellido_Aprendiz,SegundoApellido_Aprendiz,Correo_Aprendiz,Telefono_Aprendiz,FK_Ficha,Estado_Aprendiz,FechaDeCreacion_Aprendiz)
    VALUES (1,1018502967,'Deivis','Andres','Naranjo','Perez','danaranjo06@misena.edu.co','3103009547',2,1,'2018-04-29')
    INSERT INTO	aprendiz(FK_TipoDeDocumento,Documento_Aprendiz,PrimerNombre_Aprendiz,SegundoNombre_Aprendiz,PrimerApellido_Aprendiz,SegundoApellido_Aprendiz,Correo_Aprendiz,Telefono_Aprendiz,FK_Ficha,Estado_Aprendiz,FechaDeCreacion_Aprendiz)
    VALUES (2,1457824552,'David','Stiwen','Rugeles','','dsrugeles5@misena.edu.co','3157254152',3,1,'2018-04-29')
    INSERT INTO aprendiz(FK_TipoDeDocumento,Documento_Aprendiz,PrimerNombre_Aprendiz,SegundoNombre_Aprendiz,PrimerApellido_Aprendiz,SegundoApellido_Aprendiz,Correo_Aprendiz,Telefono_Aprendiz,FK_Ficha,Estado_Aprendiz,FechaDeCreacion_Aprendiz)
    VALUES (1,1024587455,'Deisy','Johanna','Forero','','djforero08@misena.edu.co','3215487985',4,1,'2018-04-29')



	INSERT INTO usuario(FK_DocCliente,Password_Usuario,Estado_Usuario,FechaDeCreacion_Usuario)
    VALUES (1578425455,'5454548',1,'2018-05-04')
    INSERT INTO usuario(FK_DocCliente,Password_Usuario,Estado_Usuario,FechaDeCreacion_Usuario)
    VALUES (54875425,'fgsdf4',1,'2018-05-04')
    INSERT INTO usuario(FK_DocCliente,Password_Usuario,Estado_Usuario,FechaDeCreacion_Usuario)
    VALUES (768745122,'sd548',1,'2018-05-04')
    INSERT INTO usuario(FK_DocCliente,Password_Usuario,Estado_Usuario,FechaDeCreacion_Usuario)
    VALUES (15598745, '5464',1,'2018-05-04')
    INSERT INTO usuario(FK_DocCliente,Password_Usuario,Estado_Usuario,FechaDeCreacion_Usuario)
    VALUES (45785425,'lk89547',1,'2018-05-04')
    INSERT INTO usuario(FK_DocCliente,Password_Usuario,Estado_Usuario,FechaDeCreacion_Usuario)
    VALUES (8954787542,'587loi5',1,'2018-05-04')
    INSERT INTO usuario(FK_DocCliente,Password_Usuario,Estado_Usuario,FechaDeCreacion_Usuario)
    VALUES (187548755,'per4587j',1,'2018-05-04')

 
	
	INSERT INTO asistencia(FK_DocAprendiz,Estado_Asistencia,Fecha_Asistencia)
    VALUES (1024587455,1,'2018-05-03')
    INSERT INTO asistencia(FK_DocAprendiz, Estado_Asistencia,Fecha_Asistencia)
    VALUES (1018502967,0,'2018-05-04')
    INSERT INTO asistencia(FK_DocAprendiz, Estado_Asistencia,Fecha_Asistencia)
    VALUES (52809251,1,'2018-05-07')
    INSERT INTO asistencia(FK_DocAprendiz, Estado_Asistencia,Fecha_Asistencia)
    VALUES (80740814,1,'2018-05-08')
    INSERT INTO asistencia(FK_DocAprendiz,Estado_Asistencia,Fecha_Asistencia)
    VALUES (79966296,1,'2018-05-09')
    INSERT INTO asistencia(FK_DocAprendiz,Estado_Asistencia,Fecha_Asistencia)
    VALUES (1073160640,0,'2018-05-10')
    INSERT INTO asistencia(FK_DocAprendiz,Estado_Asistencia,Fecha_Asistencia)
    VALUES (1024587455,0,'2018-05-11')
    INSERT INTO asistencia(FK_DocAprendiz,Estado_Asistencia,Fecha_Asistencia)
    VALUES (1019120468,1,'2018-05-14')
    INSERT INTO asistencia(FK_DocAprendiz,Estado_Asistencia,Fecha_Asistencia)
    VALUES (80807041,1,'2018-05-15')

	select * from registro_notificacion

	INSERT INTO registro_notificacion(Fecha_Registro,FK_DocAprendiz,FK_Asistencia,FK_DocCliente,FK_Notificacion)
	VALUES ('01-06-2018',1024587455,1,1578425455,1)
	INSERT INTO registro_notificacion(Fecha_Registro,FK_DocAprendiz,FK_Asistencia,FK_DocCliente,FK_Notificacion)
	VALUES ('01-06-2018',1018502967,2,54875425,1)
	INSERT INTO registro_notificacion(Fecha_Registro,FK_DocAprendiz,FK_Asistencia,FK_DocCliente,FK_Notificacion)
	VALUES ('01-06-2018',52809251,3,768745122,1)
	INSERT INTO registro_notificacion(Fecha_Registro,FK_DocAprendiz,FK_Asistencia,FK_DocCliente,FK_Notificacion)
	VALUES ('01-06-2018',80740814,4,15598745,1)
	
	--DBCC CHECKIDENt(excusa,RESEED,0) recetea indice de una tabla
	 
	INSERT INTO cliente_ficha(FK_DocCliente,FK_Ficha)
	VALUES(1578425455,1) 


	

	INSERT INTO cliente_rol(FK_DocCliente,FK_Rol)
	VALUES (1578425455,1)



	INSERT INTO excusa_asistencia(FK_Excusa,FK_Asistencia)
	VALUES (1,1)


	