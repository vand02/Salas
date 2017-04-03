-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 03-04-2017 a las 02:52:09
-- Versión del servidor: 5.7.17-log
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mydb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignatura`
--

CREATE TABLE `asignatura` (
  `id` varchar(45) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `tipo_curso` varchar(45) DEFAULT NULL,
  `carrera_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `asignatura`
--

INSERT INTO `asignatura` (`id`, `nombre`, `tipo_curso`, `carrera_id`) VALUES
('0', 'mecanica', 'plan comun', 2),
('1', 'optimizacion', 'plan comun', 2),
('3', 'calculo diferencial', 'plan comun ', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

CREATE TABLE `carrera` (
  `id` int(11) NOT NULL,
  `codigo` varchar(45) DEFAULT NULL,
  `carrera` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `carrera`
--

INSERT INTO `carrera` (`id`, `codigo`, `carrera`) VALUES
(0, '48294836', 'ingenieria civil industrial'),
(2, '312327', 'ingenieria civil civil'),
(3, '3289321', 'ingenieria comercial'),
(4, '938127', 'ingenieria en minas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `session_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `ip_address` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `user_agent` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `last_activity` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `user_data` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `ci_sessions`
--

INSERT INTO `ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('17591ce06c8d19eadd78e78ce79621ad', '0.0.0.0', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko', 1491157215, ''),
('252b4247333285b30951ac5ec781b5a5', '0.0.0.0', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebK', 1491155565, ''),
('b1849983c022fa90a0748e3737c6d737', '0.0.0.0', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebK', 1491153243, ''),
('cef40a8e829ffc90aa238124e7645f8d', '0.0.0.0', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebK', 1491153240, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario`
--

CREATE TABLE `horario` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `asignatura_id` varchar(45) DEFAULT NULL,
  `seccion_id` varchar(45) NOT NULL,
  `dia` varchar(45) DEFAULT NULL,
  `hora` varchar(45) DEFAULT NULL,
  `sala` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `horario`
--

INSERT INTO `horario` (`id`, `usuario_id`, `asignatura_id`, `seccion_id`, `dia`, `hora`, `sala`, `estado`) VALUES
(6, 1, '0', 'b01', 'martes', '16:00-17:20', 'a404', 'activo'),
(7, 1, '3', '0', 'jueves', '12:30-13:50', 'a408', 'activo'),
(8, 1, '3', '0', 'martes', '08:00-09:20', 'a404', 'activo'),
(9, 0, '0', '0', 'martes', '22:00-00:30', 'a502', 'activo'),
(10, 1, '0', 'b01', 'domingo', '09:30-11:00', 'a401', 'activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `informacion`
--

CREATE TABLE `informacion` (
  `id` int(11) NOT NULL,
  `fecha` varchar(45) DEFAULT NULL,
  `hora` varchar(45) DEFAULT NULL,
  `informacion` varchar(45) DEFAULT NULL,
  `seccion_id` varchar(45) DEFAULT NULL,
  `profesor_id` varchar(45) DEFAULT NULL,
  `usuario_id` int(11) NOT NULL,
  `asignatura_id` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `informacion`
--

INSERT INTO `informacion` (`id`, `fecha`, `hora`, `informacion`, `seccion_id`, `profesor_id`, `usuario_id`, `asignatura_id`) VALUES
(7, '131116', '1200', 'Manana deben traer calculadora', 'b06', '18234523', 1, '1'),
(8, '22/12/2016', '12:00', 'Tarea para mañana', 'b01', '423423', 1, '1'),
(9, '101116', '1100', 'solemne 2 mañana', 'b09', '100348453', 1, '1'),
(10, '15/12/2016', '13:00', 'control mañana', 'b07', '100348453', 0, '3'),
(11, '13/4/2017', '11:00', 'dasdn', 'b01', NULL, 1, '1'),
(12, '13/4/2017', '11:00', 'dasdn', 'b01', NULL, 1, '1'),
(17, '8/4/2017', '12:00', 'dsds', 'b01', '52464238', 1, 'j8j8');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesor`
--

CREATE TABLE `profesor` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `profesor`
--

INSERT INTO `profesor` (`id`, `nombre`) VALUES
(423423, 'Rodrigo Soto'),
(52464238, 'Carlos Tapia'),
(100348453, 'Claudio Aballay'),
(182345423, 'Miguel Truffa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seccion`
--

CREATE TABLE `seccion` (
  `id` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `asignatura_id` varchar(50) NOT NULL,
  `profesor_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `seccion`
--

INSERT INTO `seccion` (`id`, `nombre`, `asignatura_id`, `profesor_id`) VALUES
('b01', 'b01', '0', '52464238'),
('b02', 'b02', '3', ''),
('b04', 'b04', '3', ''),
('b05', 'b05', '1', ''),
('b07', 'b07', '3', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suspencion`
--

CREATE TABLE `suspencion` (
  `id` varchar(45) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `asignatura_id` int(11) NOT NULL,
  `dia` varchar(45) NOT NULL,
  `hora` varchar(45) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `fecha` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `suspencion`
--

INSERT INTO `suspencion` (`id`, `usuario_id`, `asignatura_id`, `dia`, `hora`, `estado`, `fecha`) VALUES
('1', 1, 0, 'martes', '16:00-17:20', 'activo', '12/02/2017'),
('2', 1, 3, 'jueves', '12:30-13:50', 'activo', '11/02/2017'),
('3', 1, 3, 'martes', '08:00-09:20', 'activo', '10/02/2017'),
('4', 0, 0, 'martes', '22:00-00:30', 'activo', '09/02/2017'),
('5', 1, 1, 'martes', '09:30-11:00', 'activo', '08/02/2017');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  `facultad` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `tipo_usuario` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `usuario`, `facultad`, `password`, `tipo_usuario`) VALUES
(0, 'carloscc', 'carlosesconbars', 'ingenieria', '1234', 'profesor'),
(1, 'juan contreras', 'jc', 'ingenieria', '123', 'profesor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `_socialize_config`
--

CREATE TABLE `_socialize_config` (
  `config_id` int(9) UNSIGNED NOT NULL,
  `config_key` varchar(50) NOT NULL,
  `config_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `_socialize_config`
--

INSERT INTO `_socialize_config` (`config_id`, `config_key`, `config_value`) VALUES
(1, 'migration_current', '3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `_socialize_users`
--

CREATE TABLE `_socialize_users` (
  `user_id` int(9) UNSIGNED NOT NULL,
  `password` varchar(40) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `_socialize_users_networks`
--

CREATE TABLE `_socialize_users_networks` (
  `id` int(9) UNSIGNED NOT NULL,
  `user_id` int(9) UNSIGNED NOT NULL,
  `network_user_id` varchar(150) NOT NULL,
  `network` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD PRIMARY KEY (`id`,`carrera_id`),
  ADD KEY `fk_asignatura_carrera1_idx` (`carrera_id`);

--
-- Indices de la tabla `carrera`
--
ALTER TABLE `carrera`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indices de la tabla `horario`
--
ALTER TABLE `horario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_usuario_has_asignatura_asignatura1_idx` (`asignatura_id`),
  ADD KEY `fk_usuario_has_asignatura_usuario_idx` (`usuario_id`);

--
-- Indices de la tabla `informacion`
--
ALTER TABLE `informacion`
  ADD PRIMARY KEY (`id`,`usuario_id`,`asignatura_id`),
  ADD KEY `fk_informacion_usuario1_idx` (`usuario_id`),
  ADD KEY `fk_informacion_asignatura1_idx` (`asignatura_id`);

--
-- Indices de la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `seccion`
--
ALTER TABLE `seccion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `asignatura_id` (`asignatura_id`),
  ADD KEY `profesor_id` (`profesor_id`);

--
-- Indices de la tabla `suspencion`
--
ALTER TABLE `suspencion`
  ADD PRIMARY KEY (`id`(11)),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `asignatura_id` (`asignatura_id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `_socialize_config`
--
ALTER TABLE `_socialize_config`
  ADD PRIMARY KEY (`config_id`);

--
-- Indices de la tabla `_socialize_users`
--
ALTER TABLE `_socialize_users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indices de la tabla `_socialize_users_networks`
--
ALTER TABLE `_socialize_users_networks`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `horario`
--
ALTER TABLE `horario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `informacion`
--
ALTER TABLE `informacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT de la tabla `_socialize_config`
--
ALTER TABLE `_socialize_config`
  MODIFY `config_id` int(9) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `_socialize_users`
--
ALTER TABLE `_socialize_users`
  MODIFY `user_id` int(9) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `_socialize_users_networks`
--
ALTER TABLE `_socialize_users_networks`
  MODIFY `id` int(9) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD CONSTRAINT `fk_asignatura_carrera1` FOREIGN KEY (`carrera_id`) REFERENCES `carrera` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `horario`
--
ALTER TABLE `horario`
  ADD CONSTRAINT `fk_usuario_has_asignatura_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `informacion`
--
ALTER TABLE `informacion`
  ADD CONSTRAINT `fk_informacion_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

DELIMITER $$
--
-- Eventos
--
CREATE DEFINER=`root`@`localhost` EVENT `actualiza_estado2` ON SCHEDULE EVERY 1 DAY STARTS '2017-02-12 11:15:00' ON COMPLETION NOT PRESERVE ENABLE DO update horario
set estado = 'activo'
where
1$$

CREATE DEFINER=`root`@`localhost` EVENT `actualiza_estado` ON SCHEDULE EVERY 1 DAY STARTS '2017-02-12 00:00:01' ON COMPLETION NOT PRESERVE ENABLE DO update horario
set estado = 'activo'
where
1$$

DELIMITER ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
