-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-06-2018 a las 02:10:42
-- Versión del servidor: 10.1.32-MariaDB
-- Versión de PHP: 7.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `senasistencia`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aprendiz`
--

CREATE TABLE `aprendiz` (
  `FK_TipoDeDocumento` bigint(16) NOT NULL COMMENT 'Este ID corresponde al campo ID_TipoDeDocumento de la tabla Tipo de documento',
  `Documento_Aprendiz` bigint(16) NOT NULL COMMENT 'Numero de documento del APRENDIZ.',
  `PrimerNombre_Aprendiz` varchar(60) NOT NULL COMMENT 'Primer nombre del APRENDIZ.',
  `SegundoNombre_Aprendiz` varchar(60) DEFAULT NULL COMMENT 'Segundo nombre del APRENDIZ.',
  `PrimerApellido_Aprendiz` varchar(60) NOT NULL COMMENT 'Primer apellido del APRENDIZ.',
  `SegundoApellido_Aprendiz` varchar(60) DEFAULT NULL COMMENT 'Segundo apellido del APRENDIZ.',
  `Correo_Aprendiz` varchar(60) NOT NULL COMMENT 'Correo del APRENDIZ.',
  `Telefono_Aprendiz` varchar(10) DEFAULT NULL COMMENT 'Numero telefonico del aprendiz.',
  `FK_Ficha` bigint(16) NOT NULL COMMENT 'Este ID corresponde al campo ID_FICHA de la tabla FICHA.',
  `Estado_Aprendiz` tinyint(1) NOT NULL COMMENT 'Indica si el registro esta Activo o Inactivo.',
  `FechaDeCreacion_Aprendiz` date NOT NULL COMMENT 'Fecha de Creacion del APRENDIZ en el sistema.',
  `FechaDeInactivacion_Aprendiz` date DEFAULT NULL COMMENT 'Fecha de Inactivacion del APRENDIZ en el sistema.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencia`
--

CREATE TABLE `asistencia` (
  `ID_Asistencia` bigint(16) NOT NULL COMMENT 'Este ID se genera cada vez que se ingresa un registro nuevo referente a los datos del ASISTENCIA.',
  `FK_DocAprendiz` bigint(16) NOT NULL COMMENT 'Numero de documento del APRENDIZ.',
  `Estado_Asistencia` tinyint(1) NOT NULL COMMENT 'Registro de la asistencia del aprendiz ((1-Asistio),(0-falla) o (2-excusa)',
  `Fecha_Asistencia` date NOT NULL COMMENT 'Fecha del registro de la asistencia'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `FK_TipoDeDocumento` bigint(16) NOT NULL COMMENT 'Este ID corresponde al campo ID_TipoDeDocumento de la tabla tipo de documento.',
  `Documento_Cliente` bigint(16) NOT NULL COMMENT 'Numero de documento del CLIENTE.',
  `PrimerNombre_Cliente` varchar(60) NOT NULL COMMENT 'Primer nombre del CLIENTE.',
  `SegundoNombre_Cliente` varchar(60) DEFAULT NULL COMMENT 'Segundo nombre del CLIENTE.',
  `PrimerApellido_Cliente` varchar(60) NOT NULL COMMENT 'Primer apellido del CLIENTE.',
  `SegundoApellido_Cliente` varchar(60) DEFAULT NULL COMMENT 'Segundo apellido del CLIENTE.',
  `Correo_Cliente` varchar(60) NOT NULL COMMENT 'Correo del CLIENTE.',
  `Telefono_Cliente` varchar(10) DEFAULT NULL COMMENT 'Numero de telefono del CLIENTE.',
  `FK_Perfil` bigint(16) NOT NULL COMMENT 'Este ID corresponde al campo ID_Perfil de la tabla perfil',
  `Estado_Cliente` tinyint(1) NOT NULL COMMENT 'Indica si el registro esta Activo o Inactivo.',
  `FechaDeCreacion_Cliente` date NOT NULL COMMENT 'Fecha de creacion del cliente en el sistema.',
  `FechaDeInactivacion_Cliente` date DEFAULT NULL COMMENT 'Fecha de la inactivacion del CLIENTE.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente_ficha`
--

CREATE TABLE `cliente_ficha` (
  `FK_DocCliente` bigint(16) NOT NULL COMMENT 'Numero de documento del CLIENTE.',
  `FK_Ficha` bigint(16) NOT NULL COMMENT 'Este ID corresponde al campo ID_Ficha de la tabla FICHA.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente_rol`
--

CREATE TABLE `cliente_rol` (
  `FK_DocCliente` bigint(16) NOT NULL COMMENT 'Numero de documento del CLIENTE.',
  `FK_Rol` bigint(16) NOT NULL COMMENT 'Este ID corresponde al ID_Rol de la tabla ROL.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `excusa`
--

CREATE TABLE `excusa` (
  `ID_Excusa` bigint(16) NOT NULL COMMENT 'Este ID se genera cada vez que se ingresa un registro nuevo referente a los datos del EXCUSA.',
  `FechaInicio_Excusa` date NOT NULL COMMENT 'Fecha en la cual inicia la EXCUSA.',
  `FechaFin_Excusa` date NOT NULL COMMENT 'Fecha fin de la excusa',
  `Comentario_Excusa` varchar(600) NOT NULL COMMENT 'Comentarios al respecto sobre la excusa.',
  `Url_Excusa` varchar(500) DEFAULT NULL COMMENT 'Ruta del servidor donde se va a guardar el archivo o los archivos de la excusa.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `excusa_asistencia`
--

CREATE TABLE `excusa_asistencia` (
  `FK_Excusa` bigint(16) NOT NULL COMMENT 'Este ID corresponde al campo ID_Excusa de la tabla EXCUSA.',
  `FK_Asistencia` bigint(16) NOT NULL COMMENT 'Este ID corresponde al campo ID_Asistencia de la tabla ASISTENCIA.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ficha`
--

CREATE TABLE `ficha` (
  `ID_Ficha` bigint(16) NOT NULL COMMENT 'Este ID se genera cada vez que se ingresa un registro nuevo referente a los datos de la FICHA.',
  `FK_Programa` bigint(10) NOT NULL COMMENT 'Este ID corresponde al campo ID_PROGRAMA de la tabla Programa_Formacion.',
  `Num_Ficha` varchar(20) NOT NULL COMMENT 'Numero con el cual se identifica la FICHA.',
  `Grupo_Ficha` int(11) NOT NULL COMMENT 'Este campo se realiza con el fin de mostrar el numero de grupo al cual pertenece la ficha.',
  `Jornada_Ficha` varchar(15) NOT NULL COMMENT 'Este campo se realiza con el fin de mostrar la jornada a la cual pertenece la ficha.',
  `Trimestre_Ficha` int(11) NOT NULL COMMENT 'Este campo se realiza con el fin de mostrar el trimestre en el cual se encuentra la ficha.',
  `Estado_Ficha` tinyint(1) NOT NULL COMMENT 'Indica si el registro esta Activo o Inactivo.',
  `FechaDeCreacion_Ficha` date NOT NULL COMMENT 'Fecha de Creacion de la FICHA en el sistema.',
  `FechaDeInactivacion_Ficha` date DEFAULT NULL COMMENT 'Fecha de Inactivacion de la FICHA en el sistema.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificacion`
--

CREATE TABLE `notificacion` (
  `ID_Notificacion` int(11) NOT NULL COMMENT 'Este ID se genera cada vez que se ingresa un registro nuevo referente a los datos de la notificacion.\n',
  `Asunto_Notificacion` varchar(100) NOT NULL COMMENT 'Este campo contendra el ASUNTO que llevara la notificacion.',
  `Mensaje_Notificacion` varchar(3000) NOT NULL COMMENT 'Este campo contendra el CUERPO DEL MENSAJE de la notificacion.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil`
--

CREATE TABLE `perfil` (
  `ID_Perfil` bigint(16) NOT NULL COMMENT 'Este ID se genera cada vez que se ingresa un registro nuevo referente a los datos del CARGO.',
  `Tipo_Perfil` varchar(40) NOT NULL COMMENT 'Cargo que ejerce.',
  `Estado_Perfil` tinyint(1) NOT NULL COMMENT 'Indica si el registro esta Activo o Inactivo.',
  `FechaDeCreacion_Perfil` date NOT NULL COMMENT 'Fecha de la Creacion del Perfil en el sistema',
  `FechaDeInactivacion_Perfil` date DEFAULT NULL COMMENT 'Fecha de Inactivacion del Perfil en el sistema'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programa_formacion`
--

CREATE TABLE `programa_formacion` (
  `ID_Programa` bigint(10) NOT NULL COMMENT 'Este ID se genera cada vez que se ingresa un registro nuevo referente a los datos del PROGRAMA DE FORMACION.',
  `Nombre_Programa` varchar(100) NOT NULL COMMENT 'Nombre del PROGRAMA DE FORMACION.',
  `Estado_Programa` tinyint(1) NOT NULL COMMENT 'Indica si el registro esta Activo o Inactivo.',
  `FechaDeCreacion_Programa` date NOT NULL COMMENT 'Fecha de creacion del Programa de formacion en el sistema\n',
  `FechaDeInactivacion_Programa` date DEFAULT NULL COMMENT 'Fecha de inactivacion del Programa de formacion en el sistema'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_notificacion`
--

CREATE TABLE `registro_notificacion` (
  `ID_Registro` bigint(16) NOT NULL COMMENT 'Este ID se genera cada vez que se ingresa un registro nuevo referente a los datos de la NOTIFICACION.',
  `Fecha_Registro` date NOT NULL COMMENT 'Este campo contendra la FECHA DE ENVIO de la notificacion.',
  `FK_DocAprendiz` bigint(16) NOT NULL,
  `FK_Asistencia` bigint(16) NOT NULL COMMENT 'Este ID corresponde al campo ID_Asistencia de la tabla ASISTENCIA .',
  `FK_DocCliente` bigint(16) NOT NULL COMMENT 'Numero de documento del CLIENTE.',
  `FK_Notificacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `ID_Rol` bigint(16) NOT NULL COMMENT 'Este ID se genera cada vez que se ingresa un registro nuevo referente a los datos del PERFIL.',
  `Tipo_Rol` varchar(30) NOT NULL COMMENT 'ROL para asignacion de permisos en el SOFTWARE.(administrador y usuario).',
  `Estado_Rol` tinyint(1) NOT NULL COMMENT ' Indica si el registro esta Activo o Inactivo.',
  `FechaDeCreacion_Rol` date NOT NULL COMMENT 'Fecha de creacion del Rol en el sistema',
  `FechaDeInactivacion_Rol` date DEFAULT NULL COMMENT 'Fecha de inactivacion del Rol en el sistema'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_de_documento`
--

CREATE TABLE `tipo_de_documento` (
  `ID_TipoDeDocumento` bigint(16) NOT NULL COMMENT 'Este ID se genera cada vez que se ingresa un registro nuevo referente a los datos del TIPO DEL DOCUMENTO.',
  `Nombre_TipoDeDocumento` varchar(50) NOT NULL COMMENT 'Nombre del Tipo de documento (Cedula de ciudadania,Targeta de identidad o cedula extranjera)',
  `Estado_TipoDeDocumento` tinyint(1) NOT NULL COMMENT 'Indica si el registro esta Activo o Inactivo.',
  `FechaDeCreacion_TipoDeDocumento` date NOT NULL COMMENT 'Fecha de creacion del TIPO DE DOCUMENTO.',
  `FechaDeInactivacion_TipoDeDocumento` date DEFAULT NULL COMMENT 'Fecha de la inactivacion del TIPO DE DOCUMENTO.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `ID_Usuario` bigint(16) NOT NULL COMMENT 'Este ID se genera cada vez que se ingresa un registro nuevo referente a los datos del USUARIO.\n',
  `FK_DocCliente` bigint(16) NOT NULL COMMENT 'Documento del CLIENTE.',
  `Password_Hash` varchar(100) NOT NULL COMMENT 'Password que se asigna a la persona al momento del registro.',
  `Estado_Usuario` tinyint(1) NOT NULL COMMENT 'Indica si el registro esta Activo o Inactivo.',
  `FechaDeCreacion_Usuario` date NOT NULL COMMENT 'Fecha de creacion del Usuario en el sistema',
  `FechaDeInactivacion_Usuario` date DEFAULT NULL COMMENT 'Fecha de inactivacion del Usuario en el sistema'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aprendiz`
--
ALTER TABLE `aprendiz`
  ADD PRIMARY KEY (`Documento_Aprendiz`),
  ADD KEY `fk_aprendiz_tipo_de_documento1_idx` (`FK_TipoDeDocumento`),
  ADD KEY `fk_aprendiz_ficha1_idx` (`FK_Ficha`);

--
-- Indices de la tabla `asistencia`
--
ALTER TABLE `asistencia`
  ADD PRIMARY KEY (`ID_Asistencia`),
  ADD KEY `fk_asistencia_aprendiz1_idx` (`FK_DocAprendiz`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`Documento_Cliente`),
  ADD KEY `fk_cliente_tipo_de_documento1_idx` (`FK_TipoDeDocumento`),
  ADD KEY `fk_cliente_perfil1_idx` (`FK_Perfil`);

--
-- Indices de la tabla `cliente_ficha`
--
ALTER TABLE `cliente_ficha`
  ADD KEY `fk_cliente_has_ficha_ficha1_idx` (`FK_Ficha`),
  ADD KEY `fk_cliente_has_ficha_cliente1_idx` (`FK_DocCliente`);

--
-- Indices de la tabla `cliente_rol`
--
ALTER TABLE `cliente_rol`
  ADD KEY `fk_cliente_has_rol_rol1_idx` (`FK_Rol`),
  ADD KEY `fk_cliente_has_rol_cliente1_idx` (`FK_DocCliente`);

--
-- Indices de la tabla `excusa`
--
ALTER TABLE `excusa`
  ADD PRIMARY KEY (`ID_Excusa`);

--
-- Indices de la tabla `excusa_asistencia`
--
ALTER TABLE `excusa_asistencia`
  ADD KEY `fk_excusa_has_asistencia_asistencia1_idx` (`FK_Asistencia`),
  ADD KEY `fk_excusa_has_asistencia_excusa1_idx` (`FK_Excusa`);

--
-- Indices de la tabla `ficha`
--
ALTER TABLE `ficha`
  ADD PRIMARY KEY (`ID_Ficha`),
  ADD KEY `fk_ficha_programa_formacion1_idx` (`FK_Programa`);

--
-- Indices de la tabla `notificacion`
--
ALTER TABLE `notificacion`
  ADD PRIMARY KEY (`ID_Notificacion`);

--
-- Indices de la tabla `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`ID_Perfil`);

--
-- Indices de la tabla `programa_formacion`
--
ALTER TABLE `programa_formacion`
  ADD PRIMARY KEY (`ID_Programa`);

--
-- Indices de la tabla `registro_notificacion`
--
ALTER TABLE `registro_notificacion`
  ADD PRIMARY KEY (`ID_Registro`),
  ADD KEY `fk_notificacion_asistencia1_idx` (`FK_Asistencia`),
  ADD KEY `fk_registro_notificacion_cliente1_idx` (`FK_DocCliente`),
  ADD KEY `fk_registro_notificacion_notificacion1_idx` (`FK_Notificacion`),
  ADD KEY `fk_registro_notificacion_aprendiz1_idx` (`FK_DocAprendiz`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`ID_Rol`);

--
-- Indices de la tabla `tipo_de_documento`
--
ALTER TABLE `tipo_de_documento`
  ADD PRIMARY KEY (`ID_TipoDeDocumento`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID_Usuario`),
  ADD KEY `fk_usuarios_cliente1_idx` (`FK_DocCliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asistencia`
--
ALTER TABLE `asistencia`
  MODIFY `ID_Asistencia` bigint(16) NOT NULL AUTO_INCREMENT COMMENT 'Este ID se genera cada vez que se ingresa un registro nuevo referente a los datos del ASISTENCIA.', AUTO_INCREMENT=0;

--
-- AUTO_INCREMENT de la tabla `excusa`
--
ALTER TABLE `excusa`
  MODIFY `ID_Excusa` bigint(16) NOT NULL AUTO_INCREMENT COMMENT 'Este ID se genera cada vez que se ingresa un registro nuevo referente a los datos del EXCUSA.', AUTO_INCREMENT=0;

--
-- AUTO_INCREMENT de la tabla `ficha`
--
ALTER TABLE `ficha`
  MODIFY `ID_Ficha` bigint(16) NOT NULL AUTO_INCREMENT COMMENT 'Este ID se genera cada vez que se ingresa un registro nuevo referente a los datos de la FICHA.', AUTO_INCREMENT=0;

--
-- AUTO_INCREMENT de la tabla `notificacion`
--
ALTER TABLE `notificacion`
  MODIFY `ID_Notificacion` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Este ID se genera cada vez que se ingresa un registro nuevo referente a los datos de la notificacion.',AUTO_INCREMENT=0;

--
-- AUTO_INCREMENT de la tabla `perfil`
--
ALTER TABLE `perfil`
  MODIFY `ID_Perfil` bigint(16) NOT NULL AUTO_INCREMENT COMMENT 'Este ID se genera cada vez que se ingresa un registro nuevo referente a los datos del PERFIL.', AUTO_INCREMENT=0;

--
-- AUTO_INCREMENT de la tabla `programa_formacion`
--
ALTER TABLE `programa_formacion`
  MODIFY `ID_Programa` bigint(10) NOT NULL AUTO_INCREMENT COMMENT 'Este ID se genera cada vez que se ingresa un registro nuevo referente a los datos del PROGRAMA DE FORMACION.', AUTO_INCREMENT=0;

--
-- AUTO_INCREMENT de la tabla `registro_notificacion`
--
ALTER TABLE `registro_notificacion`
  MODIFY `ID_Registro` bigint(16) NOT NULL AUTO_INCREMENT COMMENT 'Este ID se genera cada vez que se ingresa un registro nuevo referente a los datos de la NOTIFICACION.', AUTO_INCREMENT=0;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `ID_Rol` bigint(16) NOT NULL AUTO_INCREMENT COMMENT 'Este ID se genera cada vez que se ingresa un registro nuevo referente a los datos del ROL.', AUTO_INCREMENT=0;

--
-- AUTO_INCREMENT de la tabla `tipo_de_documento`
--
ALTER TABLE `tipo_de_documento`
  MODIFY `ID_TipoDeDocumento` bigint(16) NOT NULL AUTO_INCREMENT COMMENT 'Este ID se genera cada vez que se ingresa un registro nuevo referente a los datos del TIPO DEL DOCUMENTO.', AUTO_INCREMENT=0;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `ID_Usuario` bigint(16) NOT NULL AUTO_INCREMENT COMMENT 'Este ID se genera cada vez que se ingresa un registro nuevo referente a los datos del USUARIO.', AUTO_INCREMENT=0;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `aprendiz`
--
ALTER TABLE `aprendiz`
  ADD CONSTRAINT `fk_aprendiz_ficha1` FOREIGN KEY (`FK_Ficha`) REFERENCES `ficha` (`ID_Ficha`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_aprendiz_tipo_de_documento1` FOREIGN KEY (`FK_TipoDeDocumento`) REFERENCES `tipo_de_documento` (`ID_TipoDeDocumento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `asistencia`
--
ALTER TABLE `asistencia`
  ADD CONSTRAINT `fk_asistencia_aprendiz1` FOREIGN KEY (`FK_DocAprendiz`) REFERENCES `aprendiz` (`Documento_Aprendiz`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `fk_cliente_perfil1` FOREIGN KEY (`FK_Perfil`) REFERENCES `perfil` (`ID_Perfil`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cliente_tipo_de_documento1` FOREIGN KEY (`FK_TipoDeDocumento`) REFERENCES `tipo_de_documento` (`ID_TipoDeDocumento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cliente_ficha`
--
ALTER TABLE `cliente_ficha`
  ADD CONSTRAINT `fk_cliente_has_ficha_cliente1` FOREIGN KEY (`FK_DocCliente`) REFERENCES `cliente` (`Documento_Cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cliente_has_ficha_ficha1` FOREIGN KEY (`FK_Ficha`) REFERENCES `ficha` (`ID_Ficha`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cliente_rol`
--
ALTER TABLE `cliente_rol`
  ADD CONSTRAINT `fk_cliente_has_rol_cliente1` FOREIGN KEY (`FK_DocCliente`) REFERENCES `cliente` (`Documento_Cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cliente_has_rol_rol1` FOREIGN KEY (`FK_Rol`) REFERENCES `rol` (`ID_Rol`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `excusa_asistencia`
--
ALTER TABLE `excusa_asistencia`
  ADD CONSTRAINT `fk_excusa_has_asistencia_asistencia1` FOREIGN KEY (`FK_Asistencia`) REFERENCES `asistencia` (`ID_Asistencia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_excusa_has_asistencia_excusa1` FOREIGN KEY (`FK_Excusa`) REFERENCES `excusa` (`ID_Excusa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ficha`
--
ALTER TABLE `ficha`
  ADD CONSTRAINT `fk_ficha_programa_formacion1` FOREIGN KEY (`FK_Programa`) REFERENCES `programa_formacion` (`ID_Programa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `registro_notificacion`
--
ALTER TABLE `registro_notificacion`
  ADD CONSTRAINT `fk_notificacion_asistencia1` FOREIGN KEY (`FK_Asistencia`) REFERENCES `asistencia` (`ID_Asistencia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_registro_notificacion_aprendiz1` FOREIGN KEY (`FK_DocAprendiz`) REFERENCES `aprendiz` (`Documento_Aprendiz`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_registro_notificacion_cliente1` FOREIGN KEY (`FK_DocCliente`) REFERENCES `cliente` (`Documento_Cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_registro_notificacion_notificacion1` FOREIGN KEY (`FK_Notificacion`) REFERENCES `notificacion` (`ID_Notificacion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuarios_cliente1` FOREIGN KEY (`FK_DocCliente`) REFERENCES `cliente` (`Documento_Cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;




    INSERT INTO programa_formacion(Nombre_Programa,Estado_Programa,FechaDeCreacion_Programa)
    VALUES ('Mantenimiento de Motocicletas',1,'2018-04-29');
    INSERT INTO programa_formacion(Nombre_Programa,Estado_Programa,FechaDeCreacion_Programa)
    VALUES ('Apoyo Administrativo en Salud',1,'2018-04-29');
    INSERT INTO programa_formacion(Nombre_Programa,Estado_Programa,FechaDeCreacion_Programa)
    VALUES ('Asistencia Administrativa',1,'2018-04-29');
    INSERT INTO programa_formacion(Nombre_Programa,Estado_Programa,FechaDeCreacion_Programa)
    VALUES ('Asistencia en Organizacion de Archivos',1,'2018-04-29');
    INSERT INTO programa_formacion(Nombre_Programa,Estado_Programa,FechaDeCreacion_Programa)
    VALUES ('Inspeccion y Ensayos con Procesos no Destructivos',1,'2018-04-29');
    INSERT INTO programa_formacion(Nombre_Programa,Estado_Programa,FechaDeCreacion_Programa)
    VALUES ('Instalacion de Infraestructura para Redes Moviles',1,'2018-04-29');
    INSERT INTO programa_formacion(Nombre_Programa,Estado_Programa,FechaDeCreacion_Programa)
    VALUES ('Instalacion de Redes de Computadores',1,'2018-04-29');
    INSERT INTO programa_formacion(Nombre_Programa,Estado_Programa,FechaDeCreacion_Programa)
    VALUES ('Instalaciones de Redes Hibridas de Fibra Optica y Coaxial',1,'2018-04-29');
    INSERT INTO programa_formacion(Nombre_Programa,Estado_Programa,FechaDeCreacion_Programa)
    VALUES ('Diseño e Integracion de Multimedia',1,'2018-04-29');
    INSERT INTO programa_formacion(Nombre_Programa,Estado_Programa,FechaDeCreacion_Programa)
    VALUES ('Mantenimiento de Equipos Electronicos de Consumo Masivo en A',1,'2018-04-29');
    

	
	INSERT INTO tipo_de_documento(Nombre_TipoDeDocumento,Estado_TipoDeDocumento,FechaDeCreacion_TipoDeDocumento)
    VALUES ('Cedula de Ciudadania',1,'2018-04-29');
    INSERT INTO tipo_de_documento(Nombre_TipoDeDocumento,Estado_TipoDeDocumento,FechaDeCreacion_TipoDeDocumento)
    VALUES ('Tarjeta de Identidad',1,'2018-04-29');
    INSERT INTO tipo_de_documento(Nombre_TipoDeDocumento,Estado_TipoDeDocumento,FechaDeCreacion_TipoDeDocumento)
    VALUES ('Cedula de Extranjeria',1,'2018-04-29');


	
	INSERT INTO rol(Tipo_Rol,Estado_Rol,FechaDeCreacion_Rol)
    VALUES ('Psicologo',1,'2018-05-05');
    INSERT INTO rol(Tipo_Rol,Estado_Rol,FechaDeCreacion_Rol)
    VALUES ('Coordinador',1,'2018-05-05');
    INSERT INTO rol(Tipo_Rol,Estado_Rol,FechaDeCreacion_Rol)
    VALUES ('Instructor',1,'2018-05-05');

	
	
	INSERT INTO perfil(Tipo_Perfil,Estado_Perfil,FechaDeCreacion_Perfil)
    VALUES ('Administrador',1,'2018-04-29');
    INSERT INTO perfil(Tipo_Perfil,Estado_Perfil,FechaDeCreacion_Perfil)
    VALUES ('Usuario',1,'2018-04-29');



	INSERT INTO excusa(FechaInicio_Excusa,FechaFin_Excusa,Comentario_Excusa,URL_Excusa)
    VALUES ('2018-05-03','2018-05-31','aprendiz fallo por excusa medica', '');
    INSERT INTO excusa(FechaInicio_Excusa,FechaFin_Excusa,Comentario_Excusa,URL_Excusa)
    VALUES ('2018-03-04','2018-05-31','aprendiz tiene 3 dias de incapacidad', '');
    INSERT INTO excusa(FechaInicio_Excusa,FechaFin_Excusa,Comentario_Excusa,URL_Excusa)
    VALUES ('2018-03-05','2018-05-31','aprendiz  justifica 1 de sus 2 fallas', '');
    INSERT INTO excusa(FechaInicio_Excusa,FechaFin_Excusa,Comentario_Excusa,URL_Excusa)
    VALUES ('2018-03-06','2018-05-31','aprendiz no cuenta con mas fallas', '');
    INSERT INTO excusa(FechaInicio_Excusa,FechaFin_Excusa,Comentario_Excusa,URL_Excusa)
    VALUES ('2018-03-07','2018-05-31','aprendiz justifica 2 de sus 3 fallas', '');
    INSERT INTO excusa(FechaInicio_Excusa,FechaFin_Excusa,Comentario_Excusa,URL_Excusa)
    VALUES ('2018-03-08','2018-05-31','aprendiz no justifica fallas', '');



	
    INSERT INTO notificacion(Asunto_Notificacion,Mensaje_Notificacion)
    VALUES ('Desercion','Notificacion por inasistencia sin previo aviso; por tanto se espera que el aprendiz facilite formato de excusa lo mas pronto posible. NOTA: la tercer inasistencia sera causal de inhabilidad en el sistema; de no presentarse ninguna excusa el aprendiz sera remitido a comite con formato de desercion del programa de formacion.');



	INSERT INTO cliente(FK_TipoDeDocumento,Documento_Cliente,PrimerNombre_Cliente,SegundoNombre_Cliente,PrimerApellido_Cliente,SegundoApellido_Cliente,FK_Perfil,Correo_Cliente,Telefono_Cliente,Estado_Cliente,FechaDeCreacion_Cliente)
    VALUES (1,1578425455,'Carlos','Julio','Camargo','Cuellar',2,'carlosc12@hotmail.com','3157854254',1,'2018-05-04');
    INSERT INTO cliente(FK_TipoDeDocumento,Documento_Cliente,PrimerNombre_Cliente,SegundoNombre_Cliente,PrimerApellido_Cliente,SegundoApellido_Cliente,FK_Perfil,Correo_Cliente,Telefono_Cliente,Estado_Cliente,FechaDeCreacion_Cliente)
    VALUES (2,54875425,'Luisa','Maria','Pulido','Garzon',1,'lmpulido548@outlook.com','3115489754',1,'2018-05-04');
    INSERT INTO cliente(FK_TipoDeDocumento,Documento_Cliente,PrimerNombre_Cliente,SegundoNombre_Cliente,PrimerApellido_Cliente,SegundoApellido_Cliente,FK_Perfil,Correo_Cliente,Telefono_Cliente,Estado_Cliente,FechaDeCreacion_Cliente)
    VALUES (3,768745122,'Ivan','David','Mora','Morales',2,'ivanmm@hotmail.com','3178897897',1,'2018-05-04');
    INSERT INTO cliente(FK_TipoDeDocumento,Documento_Cliente,PrimerNombre_Cliente,SegundoNombre_Cliente,PrimerApellido_Cliente,SegundoApellido_Cliente,FK_Perfil,Correo_Cliente,Telefono_Cliente,Estado_Cliente,FechaDeCreacion_Cliente)
    VALUES (1,15598745,'Jeam','Carolina','Rodriguez','Roa',1,'jrodriguez@gmail.com','3225487910',1,'2018-05-04');
    INSERT INTO cliente(FK_TipoDeDocumento,Documento_Cliente,PrimerNombre_Cliente,SegundoNombre_Cliente,PrimerApellido_Cliente,SegundoApellido_Cliente,FK_Perfil,Correo_Cliente,Telefono_Cliente,Estado_Cliente,FechaDeCreacion_Cliente)
    VALUES (1,45785425,'Lina','','Valderrama','Tovar',2,'ltovar2@hotmail.com','3001548750',1,'2018-05-04');
    INSERT INTO cliente(FK_TipoDeDocumento,Documento_Cliente,PrimerNombre_Cliente,SegundoNombre_Cliente,PrimerApellido_Cliente,SegundoApellido_Cliente,FK_Perfil,Correo_Cliente,Telefono_Cliente,Estado_Cliente,FechaDeCreacion_Cliente)
    VALUES (3,8954787542,'Diana','Marcela','Trujillo','Perdomo',2,'Dmarcela89@gmail.com','3012548790',1,'2018-05-04');
    INSERT INTO cliente(FK_TipoDeDocumento,Documento_Cliente,PrimerNombre_Cliente,SegundoNombre_Cliente,PrimerApellido_Cliente,SegundoApellido_Cliente,FK_Perfil,Correo_Cliente,Telefono_Cliente,Estado_Cliente,FechaDeCreacion_Cliente)
    VALUES (2,187548755,'Luis','Felipe','Rojas','Amezquita',2,'luisf61@hotmail.com','3502124488',1,'2018-05-04');


	
	INSERT INTO ficha(FK_Programa,Num_Ficha,Grupo_Ficha,Jornada_Ficha,Trimestre_Ficha,Estado_Ficha,FechaDeCreacion_Ficha)
    VALUES (8,'1193334',1,'Diurna',7,1,'2018-04-29');
    INSERT INTO ficha(FK_Programa,Num_Ficha,Grupo_Ficha,Jornada_Ficha,Trimestre_Ficha,Estado_Ficha,FechaDeCreacion_Ficha)
    VALUES (1,'1193335',2,'Nocturna',2,1,'2018-04-29');
    INSERT INTO ficha(FK_Programa,Num_Ficha,Grupo_Ficha,Jornada_Ficha,Trimestre_Ficha,Estado_Ficha,FechaDeCreacion_Ficha)
    VALUES (4,'1193336',3,'Madrugada',4,1,'2018-04-29');
    INSERT INTO ficha(FK_Programa,Num_Ficha,Grupo_Ficha,Jornada_Ficha,Trimestre_Ficha,Estado_Ficha,FechaDeCreacion_Ficha)
    VALUES (7,'1193337',4,'Fines de Semana',3,1,'2018-04-29');
    INSERT INTO ficha(FK_Programa,Num_Ficha,Grupo_Ficha,Jornada_Ficha,Trimestre_Ficha,Estado_Ficha,FechaDeCreacion_Ficha)
    VALUES (9,'1193338',1,'Nocturna',10,1,'2018-04-29');
    INSERT INTO ficha(FK_Programa,Num_Ficha,Grupo_Ficha,Jornada_Ficha,Trimestre_Ficha,Estado_Ficha,FechaDeCreacion_Ficha)
    VALUES (10,'1184442',3,'Diurna',8,1,'2018-04-29');
    INSERT INTO ficha(FK_Programa,Num_Ficha,Grupo_Ficha,Jornada_Ficha,Trimestre_Ficha,Estado_Ficha,FechaDeCreacion_Ficha)
    VALUES (3,'1184443',2,'Fines de Semana',6,1,'2018-04-29');
    INSERT INTO ficha(FK_Programa,Num_Ficha,Grupo_Ficha,Jornada_Ficha,Trimestre_Ficha,Estado_Ficha,FechaDeCreacion_Ficha)
    VALUES (6,'1184444',1,'Diurna',5,1,'2018-04-29');
    INSERT INTO ficha(FK_Programa,Num_Ficha,Grupo_Ficha,Jornada_Ficha,Trimestre_Ficha,Estado_Ficha,FechaDeCreacion_Ficha)
    VALUES (1,'1184445',4,'Nocturna',2,1,'2018-04-29');
    INSERT INTO ficha(FK_Programa,Num_Ficha,Grupo_Ficha,Jornada_Ficha,Trimestre_Ficha,Estado_Ficha,FechaDeCreacion_Ficha)
    VALUES (2,'1184446',2,'Diurna',1,1,'2018-04-29');



    INSERT INTO aprendiz(FK_TipoDeDocumento,Documento_Aprendiz,PrimerNombre_Aprendiz,SegundoNombre_Aprendiz,PrimerApellido_Aprendiz,SegundoApellido_Aprendiz,Correo_Aprendiz,Telefono_Aprendiz,FK_Ficha,Estado_Aprendiz,FechaDeCreacion_Aprendiz)
    VALUES (1,80807041,'Luis','Antonio','Forero','Torres','laforero1@misena.edu.co','3187809716',1,1,'2018-04-29');
    INSERT INTO aprendiz(FK_TipoDeDocumento,Documento_Aprendiz,PrimerNombre_Aprendiz,SegundoNombre_Aprendiz,PrimerApellido_Aprendiz,SegundoApellido_Aprendiz,Correo_Aprendiz,Telefono_Aprendiz,FK_Ficha,Estado_Aprendiz,FechaDeCreacion_Aprendiz)
    VALUES (2,104001261,'Alma','Marcela','Silva','','almarsilva@misena.edu.co','3112843650',2,1,'2018-04-29');
    INSERT INTO aprendiz(FK_TipoDeDocumento,Documento_Aprendiz,PrimerNombre_Aprendiz,SegundoNombre_Aprendiz,PrimerApellido_Aprendiz,SegundoApellido_Aprendiz,Correo_Aprendiz,Telefono_Aprendiz,FK_Ficha,Estado_Aprendiz,FechaDeCreacion_Aprendiz)
    VALUES (3,79966296,'Robert','Smith','Duque','Morales','rsmithd7@misena.edu.co','3014002169',3,1,'2018-04-29');
    INSERT INTO aprendiz(FK_TipoDeDocumento,Documento_Aprendiz,PrimerNombre_Aprendiz,SegundoNombre_Aprendiz,PrimerApellido_Aprendiz,SegundoApellido_Aprendiz,Correo_Aprendiz,Telefono_Aprendiz,FK_Ficha,Estado_Aprendiz,FechaDeCreacion_Aprendiz)
    VALUES (3,52809251,'Johanna','Milena','Jamaica','Rojas','jmjamaica@misena.edu.co','3214049197',4,1,'2018-04-29');
    INSERT INTO aprendiz(FK_TipoDeDocumento,Documento_Aprendiz,PrimerNombre_Aprendiz,SegundoNombre_Aprendiz,PrimerApellido_Aprendiz,SegundoApellido_Aprendiz,Correo_Aprendiz,Telefono_Aprendiz,FK_Ficha,Estado_Aprendiz,FechaDeCreacion_Aprendiz)
    VALUES (2,1019120468,'Nataly','Stefania','Medina','Poveda','stefa142396@gmail.com','3134595081',2,1,'2018-04-29');
    INSERT INTO aprendiz(FK_TipoDeDocumento,Documento_Aprendiz,PrimerNombre_Aprendiz,SegundoNombre_Aprendiz,PrimerApellido_Aprendiz,SegundoApellido_Aprendiz,Correo_Aprendiz,Telefono_Aprendiz,FK_Ficha,Estado_Aprendiz,FechaDeCreacion_Aprendiz)
    VALUES (1,1020800497,'Tatiana','','Paez','','ltpaez7@misena.edu.co','3224385002',1,1,'2018-04-29');
    INSERT INTO aprendiz(FK_TipoDeDocumento,Documento_Aprendiz,PrimerNombre_Aprendiz,SegundoNombre_Aprendiz,PrimerApellido_Aprendiz,SegundoApellido_Aprendiz,Correo_Aprendiz,Telefono_Aprendiz,FK_Ficha,Estado_Aprendiz,FechaDeCreacion_Aprendiz)
    VALUES (2,80740814,'Harold','Andres','Pietro','Fernandez','haprieto41@misena.edu.co','3212141572',3,1,'2018-04-29');
    INSERT INTO aprendiz(FK_TipoDeDocumento,Documento_Aprendiz,PrimerNombre_Aprendiz,SegundoNombre_Aprendiz,PrimerApellido_Aprendiz,SegundoApellido_Aprendiz,Correo_Aprendiz,Telefono_Aprendiz,FK_Ficha,Estado_Aprendiz,FechaDeCreacion_Aprendiz)
    VALUES (1,1073160640,'Orlando','','Echeverry','Velez','oecheverry0@misena.edu.co','3143326357',1,1,'2018-04-29');
    INSERT INTO aprendiz(FK_TipoDeDocumento,Documento_Aprendiz,PrimerNombre_Aprendiz,SegundoNombre_Aprendiz,PrimerApellido_Aprendiz,SegundoApellido_Aprendiz,Correo_Aprendiz,Telefono_Aprendiz,FK_Ficha,Estado_Aprendiz,FechaDeCreacion_Aprendiz)
    VALUES (1,1018502967,'Deivis','Andres','Naranjo','Perez','danaranjo06@misena.edu.co','3103009547',2,1,'2018-04-29');
    INSERT INTO	aprendiz(FK_TipoDeDocumento,Documento_Aprendiz,PrimerNombre_Aprendiz,SegundoNombre_Aprendiz,PrimerApellido_Aprendiz,SegundoApellido_Aprendiz,Correo_Aprendiz,Telefono_Aprendiz,FK_Ficha,Estado_Aprendiz,FechaDeCreacion_Aprendiz)
    VALUES (2,1457824552,'David','Stiwen','Rugeles','','dsrugeles5@misena.edu.co','3157254152',3,1,'2018-04-29');
    INSERT INTO aprendiz(FK_TipoDeDocumento,Documento_Aprendiz,PrimerNombre_Aprendiz,SegundoNombre_Aprendiz,PrimerApellido_Aprendiz,SegundoApellido_Aprendiz,Correo_Aprendiz,Telefono_Aprendiz,FK_Ficha,Estado_Aprendiz,FechaDeCreacion_Aprendiz)
    VALUES (1,1024587455,'Deisy','Johanna','Forero','','djforero08@misena.edu.co','3215487985',4,1,'2018-04-29');



	INSERT INTO usuario(FK_DocCliente,Password_Hash,Estado_Usuario,FechaDeCreacion_Usuario)
    VALUES (1578425455,'5454548',1,'2018-05-04');
    INSERT INTO usuario(FK_DocCliente,Password_Hash,Estado_Usuario,FechaDeCreacion_Usuario)
    VALUES (54875425,'fgsdf4',1,'2018-05-04');
    INSERT INTO usuario(FK_DocCliente,Password_Hash,Estado_Usuario,FechaDeCreacion_Usuario)
    VALUES (768745122,'sd548',1,'2018-05-04');
    INSERT INTO usuario(FK_DocCliente,Password_Hash,Estado_Usuario,FechaDeCreacion_Usuario)
    VALUES (15598745, '5464',1,'2018-05-04');
    INSERT INTO usuario(FK_DocCliente,Password_Hash,Estado_Usuario,FechaDeCreacion_Usuario)
    VALUES (45785425,'lk89547',1,'2018-05-04');
    INSERT INTO usuario(FK_DocCliente,Password_Hash,Estado_Usuario,FechaDeCreacion_Usuario)
    VALUES (8954787542,'587loi5',1,'2018-05-04');
    INSERT INTO usuario(FK_DocCliente,Password_Hash,Estado_Usuario,FechaDeCreacion_Usuario)
    VALUES (187548755,'per4587j',1,'2018-05-04');

 
	
	INSERT INTO asistencia(FK_DocAprendiz,Estado_Asistencia,Fecha_Asistencia)
    VALUES (1024587455,1,'2018-05-03');
    INSERT INTO asistencia(FK_DocAprendiz, Estado_Asistencia,Fecha_Asistencia)
    VALUES (1018502967,0,'2018-05-04');
    INSERT INTO asistencia(FK_DocAprendiz, Estado_Asistencia,Fecha_Asistencia)
    VALUES (52809251,1,'2018-05-07');
    INSERT INTO asistencia(FK_DocAprendiz, Estado_Asistencia,Fecha_Asistencia)
    VALUES (80740814,1,'2018-05-08');
    INSERT INTO asistencia(FK_DocAprendiz,Estado_Asistencia,Fecha_Asistencia)
    VALUES (79966296,1,'2018-05-09');
    INSERT INTO asistencia(FK_DocAprendiz,Estado_Asistencia,Fecha_Asistencia)
    VALUES (1073160640,0,'2018-05-10');
    INSERT INTO asistencia(FK_DocAprendiz,Estado_Asistencia,Fecha_Asistencia)
    VALUES (1024587455,0,'2018-05-11');
    INSERT INTO asistencia(FK_DocAprendiz,Estado_Asistencia,Fecha_Asistencia)
    VALUES (1019120468,1,'2018-05-14');
    INSERT INTO asistencia(FK_DocAprendiz,Estado_Asistencia,Fecha_Asistencia)
    VALUES (80807041,1,'2018-05-15');



	INSERT INTO registro_notificacion(Fecha_Registro,FK_DocAprendiz,FK_Asistencia,FK_DocCliente,FK_Notificacion)
	VALUES ('2018-06-01',1024587455,1,1578425455,1);
	INSERT INTO registro_notificacion(Fecha_Registro,FK_DocAprendiz,FK_Asistencia,FK_DocCliente,FK_Notificacion)
	VALUES ('2018-06-01',1018502967,2,54875425,1);
	INSERT INTO registro_notificacion(Fecha_Registro,FK_DocAprendiz,FK_Asistencia,FK_DocCliente,FK_Notificacion)
	VALUES ('2018-06-01',52809251,3,768745122,1);
	INSERT INTO registro_notificacion(Fecha_Registro,FK_DocAprendiz,FK_Asistencia,FK_DocCliente,FK_Notificacion)
	VALUES ('2018-06-01',80740814,4,15598745,1);
	
	
	 
	INSERT INTO cliente_ficha(FK_DocCliente,FK_Ficha)
	VALUES(1578425455,1);


	

	INSERT INTO cliente_rol(FK_DocCliente,FK_Rol)
	VALUES (1578425455,1);



	INSERT INTO excusa_asistencia(FK_Excusa,FK_Asistencia)
	VALUES (1,1);