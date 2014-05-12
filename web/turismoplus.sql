-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 12-05-2014 a las 06:14:20
-- Versión del servidor: 5.5.37-0ubuntu0.14.04.1
-- Versión de PHP: 5.5.9-1ubuntu4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `turismoplus`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Autobus`
--

CREATE TABLE IF NOT EXISTS `Autobus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion_es` longtext COLLATE utf8_unicode_ci NOT NULL,
  `descripcion_en` longtext COLLATE utf8_unicode_ci NOT NULL,
  `descripcion_fr` longtext COLLATE utf8_unicode_ci NOT NULL,
  `detalles_es` longtext COLLATE utf8_unicode_ci NOT NULL,
  `detalles_en` longtext COLLATE utf8_unicode_ci NOT NULL,
  `detalles_fr` longtext COLLATE utf8_unicode_ci NOT NULL,
  `imagen` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `Autobus`
--

INSERT INTO `Autobus` (`id`, `nombre`, `descripcion_es`, `descripcion_en`, `descripcion_fr`, `detalles_es`, `detalles_en`, `detalles_fr`, `imagen`, `position`, `isActive`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'IRIZAR NUEVO CENTURY', '<p>descripcion en espa&ntilde;ol</p>', '<p>descripcion en ingles</p>', '<p>descripcion en frances</p>', '<ul>\r\n<li>detalle uno</li>\r\n<li>detalle dos</li>\r\n<li>detalle tres</li>\r\n<li>detalle cuatro</li>\r\n</ul>', '<ul>\r\n<li>detalle uno</li>\r\n<li>detalle dos</li>\r\n<li>detalle tres</li>\r\n<li>detalle cuatro</li>\r\n</ul>', '<ul>\r\n<li>detalle uno</li>\r\n<li>detalle dos</li>\r\n<li>detalle tres</li>\r\n<li>detalle cuatro</li>\r\n</ul>', '82b1bb4110349df127628065bad865ec8a46b874.png', 1, 1, 'irizar-nuevo-century', '2014-05-11 07:01:16', '2014-05-11 07:21:06'),
(2, 'SCANIA IRIZAR PB', '<p>descripcion en espa&ntilde;ol</p>', '<p>descripcion en ingles</p>', '<p>descripcion en frances</p>', '<ul>\r\n<li>detalle uno</li>\r\n<li>detalle dos</li>\r\n<li>detalle tres</li>\r\n<li>detalle cuatro</li>\r\n</ul>', '<ul>\r\n<li>detalle uno</li>\r\n<li>detalle dos</li>\r\n<li>detalle tres</li>\r\n<li>detalle cuatro</li>\r\n</ul>', '<ul>\r\n<li>detalle uno</li>\r\n<li>detalle dos</li>\r\n<li>detalle tres</li>\r\n<li>detalle cuatro</li>\r\n</ul>', 'cc69a4a4056f26d10153646ebff12c77965d13fe.png', 2, 1, 'scania-irizar-pb', '2014-05-11 21:53:17', '2014-05-11 21:53:51'),
(3, 'IRIZAR MAN CENTURY', '<p>Perfecto para disfrutar un gran viaje, seguro y c&oacute;modo con la ventaja de contar con gran espacio y vista.</p>', '<p>Perfect for enjoying a great journey, safe and comfortable with the advantage of great space and views.</p>', '<p>Id&eacute;al pour profiter d''un grand voyage, en toute s&eacute;curit&eacute; et &agrave; l''aise avec l''avantage d''une grande espace et les vues.</p>', '<ul>\r\n<li>1 o 2 puertas de acceso</li>\r\n<li>47 o 50 plazas, asientos reclinables</li>\r\n<li>Aire acondicionado</li>\r\n<li>Auto-servicio de caf&eacute; y t&eacute;</li>\r\n<li>Cinturones de seguridad</li>\r\n<li>Monitores con video y DVD</li>\r\n<li>Micr&oacute;fono para gu&iacute;a</li>\r\n<li>M&uacute;sica ambiental</li>\r\n<li>Totalmente panor&aacute;mico</li>\r\n<li>Sanitario</li>\r\n<li>Seguro de viajero cobertura amplia</li>\r\n</ul>', '<ul>\r\n<li>1 o 2 puertas de acceso</li>\r\n<li>47 o 50 plazas, asientos reclinables</li>\r\n<li>Aire acondicionado</li>\r\n<li>Auto-servicio de caf&eacute; y t&eacute;</li>\r\n<li>Cinturones de seguridad</li>\r\n<li>Monitores con video y DVD</li>\r\n<li>Micr&oacute;fono para gu&iacute;a</li>\r\n<li>M&uacute;sica ambiental</li>\r\n<li>Totalmente panor&aacute;mico</li>\r\n<li>Sanitario</li>\r\n<li>Seguro de viajero cobertura amplia</li>\r\n</ul>', '<ul>\r\n<li>1 o 2 puertas de acceso</li>\r\n<li>47 o 50 plazas, asientos reclinables</li>\r\n<li>Aire acondicionado</li>\r\n<li>Auto-servicio de caf&eacute; y t&eacute;</li>\r\n<li>Cinturones de seguridad</li>\r\n<li>Monitores con video y DVD</li>\r\n<li>Micr&oacute;fono para gu&iacute;a</li>\r\n<li>M&uacute;sica ambiental</li>\r\n<li>Totalmente panor&aacute;mico</li>\r\n<li>Sanitario</li>\r\n<li>Seguro de viajero cobertura amplia</li>\r\n</ul>', '724aa5f493dff2122f46ad0f4b5e9ec3f4f0aec1.png', 3, 1, 'irizar-man-century', '2014-05-11 21:58:52', '2014-05-11 21:59:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autobus_galeria`
--

CREATE TABLE IF NOT EXISTS `autobus_galeria` (
  `autobus_id` int(11) NOT NULL,
  `galeria_id` int(11) NOT NULL,
  PRIMARY KEY (`autobus_id`,`galeria_id`),
  KEY `IDX_3BDDD407A6FBF07A` (`autobus_id`),
  KEY `IDX_3BDDD407D31019C` (`galeria_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `autobus_galeria`
--

INSERT INTO `autobus_galeria` (`autobus_id`, `galeria_id`) VALUES
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(2, 15),
(2, 16),
(2, 17),
(2, 18),
(2, 19),
(2, 20),
(2, 21),
(2, 22),
(3, 23),
(3, 24),
(3, 25),
(3, 26),
(3, 27),
(3, 28),
(3, 29),
(3, 30),
(3, 31);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CategoriaPublicacion`
--

CREATE TABLE IF NOT EXISTS `CategoriaPublicacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `slug` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `CategoriaPublicacion`
--

INSERT INTO `CategoriaPublicacion` (`id`, `nombre`, `position`, `is_active`, `slug`) VALUES
(1, 'Destinos', 1, 1, 'destinos'),
(2, 'Eventos', 2, 1, 'eventos'),
(3, 'Tours', 3, 1, 'tours');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuraciones`
--

CREATE TABLE IF NOT EXISTS `configuraciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `configuracion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tipo_archivo` int(11) NOT NULL,
  `texto` longtext COLLATE utf8_unicode_ci,
  `is_active` tinyint(1) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `configuraciones`
--

INSERT INTO `configuraciones` (`id`, `configuracion`, `tipo_archivo`, `texto`, `is_active`, `slug`) VALUES
(1, 'email', 4, 'richpolis@gmail.com', 1, 'email');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Experiencias`
--

CREATE TABLE IF NOT EXISTS `Experiencias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contenido_es` longtext COLLATE utf8_unicode_ci NOT NULL,
  `contenido_en` longtext COLLATE utf8_unicode_ci NOT NULL,
  `contenido_fr` longtext COLLATE utf8_unicode_ci NOT NULL,
  `autor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  `createdAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `Experiencias`
--

INSERT INTO `Experiencias` (`id`, `contenido_es`, `contenido_en`, `contenido_fr`, `autor`, `position`, `isActive`, `createdAt`) VALUES
(1, '<p>contenido en espa&ntilde;ol</p>', '<p>contenido en ingles</p>', '<p>contenido en frances</p>', 'Autor de la experiencia 1', 1, 1, '2014-05-08 23:40:18'),
(2, '<p>contenido en espa&ntilde;ol</p>', '<p>contenido en ingles</p>', '<p>contenido en frances</p>', 'Autor de la experiencia 2', 2, 1, '2014-05-08 23:41:50'),
(3, '<p>contenido en espa&ntilde;ol</p>', '<p>contenido en ingles</p>', '<p>contenido en frances</p>', 'Autor de la experiencia 3', 3, 1, '2014-05-08 23:42:23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Galeria`
--

CREATE TABLE IF NOT EXISTS `Galeria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumbnail` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `archivo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tipo_archivo` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=37 ;

--
-- Volcado de datos para la tabla `Galeria`
--

INSERT INTO `Galeria` (`id`, `titulo`, `descripcion`, `thumbnail`, `archivo`, `tipo_archivo`, `position`, `is_active`) VALUES
(1, 'Cocodrilo grande', NULL, '10bad64f2ea31b1107bdb875df89427648ba42ea.jpg', '10bad64f2ea31b1107bdb875df89427648ba42ea.jpg', 1, 3, 1),
(3, 'Vuela alto', 'mas alto', 'ec2058a47bad8cdbe9a6bc15b68f3bfd515af263.jpg', 'ec2058a47bad8cdbe9a6bc15b68f3bfd515af263.jpg', 1, 2, 1),
(5, '9cf78383ebb7a249dd3865e8e168a5ace4c2dd81', NULL, '4256b7d30eeb2be0e517285785215128cfc9cfba.jpg', '4256b7d30eeb2be0e517285785215128cfc9cfba.jpg', 1, 5, 1),
(6, '548625_443824662318728_444538647_n (1)', NULL, '9e658508c2ee000b3d10b7ed5a6ed1c7d9f27edf.jpg', '9e658508c2ee000b3d10b7ed5a6ed1c7d9f27edf.jpg', 1, 6, 1),
(7, '544518_443824755652052_1634057174_n (1)', NULL, '3772a923131365485a246507744acddf5ee1da9e.jpg', '3772a923131365485a246507744acddf5ee1da9e.jpg', 1, 7, 1),
(8, '553698_443824488985412_197599002_n (1)', NULL, '4fb3bc9bca854e3e7f25c308214c5fdeda216c37.jpg', '4fb3bc9bca854e3e7f25c308214c5fdeda216c37.jpg', 1, 8, 1),
(9, '548625_443824662318728_444538647_n', NULL, 'f57dd96eb4df4c8ce3085cd491af6f0e36a85230.jpg', 'f57dd96eb4df4c8ce3085cd491af6f0e36a85230.jpg', 1, 9, 1),
(10, '522055_443824715652056_1582348917_n', NULL, '339cc17f2c70538c348987e165fbf797314b5f6b.jpg', '339cc17f2c70538c348987e165fbf797314b5f6b.jpg', 1, 10, 1),
(11, '544518_443824755652052_1634057174_n', NULL, '709c1cbd61040065952e85c6c9c96162b394f7e2.jpg', '709c1cbd61040065952e85c6c9c96162b394f7e2.jpg', 1, 11, 1),
(12, '553698_443824488985412_197599002_n', NULL, 'a50a2d4fea5a1afd58f58c997b5b20543581d06e.jpg', 'a50a2d4fea5a1afd58f58c997b5b20543581d06e.jpg', 1, 12, 1),
(13, 'logo', NULL, '68a8ea61c06ea13df2f2a38a9e710eeea1a65904.jpg', '68a8ea61c06ea13df2f2a38a9e710eeea1a65904.jpg', 1, 13, 1),
(14, 'logo', 'irizar', 'e89fb5650b159bae3606c075c31046dbbf186b31.jpg', 'e89fb5650b159bae3606c075c31046dbbf186b31.jpg', 1, 14, 1),
(15, '560106_423856557648872_678617721_n (1)', NULL, '99b9c65a6ef818fa277b403a0861617a7364aaa3.jpg', '99b9c65a6ef818fa277b403a0861617a7364aaa3.jpg', 1, 15, 1),
(16, '579786_423855787648949_445798203_n', NULL, 'caf3e4a2743de386fa61d773d3afac04734671f8.jpg', 'caf3e4a2743de386fa61d773d3afac04734671f8.jpg', 1, 16, 1),
(17, '545022_423855520982309_1863337478_n', NULL, '09a180ad9db4dcb702f6510514afcbe11001111b.jpg', '09a180ad9db4dcb702f6510514afcbe11001111b.jpg', 1, 17, 1),
(18, '582274_423854767649051_313162610_n', NULL, 'e94bc07c5479ed67ed3020b4b7137a7fb25d7f9e.jpg', 'e94bc07c5479ed67ed3020b4b7137a7fb25d7f9e.jpg', 1, 18, 1),
(19, '536696_423855110982350_1766264647_n', NULL, '163cbb49162f3b726106556f5322cc7176ee6733.jpg', '163cbb49162f3b726106556f5322cc7176ee6733.jpg', 1, 19, 1),
(20, '560106_423856557648872_678617721_n', NULL, '314b67567f07e3ae6d28a2a593ce55c7ea28a002.jpg', '314b67567f07e3ae6d28a2a593ce55c7ea28a002.jpg', 1, 20, 1),
(21, 'logo', 'scania_logo', 'bc829c268cedbad9a872ed070bbc4ab2880f0263.jpg', 'bc829c268cedbad9a872ed070bbc4ab2880f0263.jpg', 1, 21, 1),
(22, 'logo', 'irizar', 'fc1f7868ec3e0e382cc64a460418bd7edf47a1ac.jpg', 'fc1f7868ec3e0e382cc64a460418bd7edf47a1ac.jpg', 1, 22, 1),
(23, '165921_443801625654365_496432101_n', NULL, '025063675b3ac17c4a63f832dc21f320b92cbc6e.jpg', '025063675b3ac17c4a63f832dc21f320b92cbc6e.jpg', 1, 23, 1),
(24, '295468_443801648987696_1404621921_n', NULL, '01ad464af63eaebdc18ecf70ec5cbc6f977288df.jpg', '01ad464af63eaebdc18ecf70ec5cbc6f977288df.jpg', 1, 24, 1),
(25, '553808_443801568987704_848719728_n', NULL, 'e017044bf923ea79efe3630d440453fb317f14f3.jpg', 'e017044bf923ea79efe3630d440453fb317f14f3.jpg', 1, 25, 1),
(26, '534349_424569357577592_76741691_n', NULL, '98f96e0986091e0f491ec9d07b2ccd993496ad7d.jpg', '98f96e0986091e0f491ec9d07b2ccd993496ad7d.jpg', 1, 26, 1),
(27, '392547_424569640910897_1327011989_n', NULL, 'bbaf6578b50cff1a3aa5fc1ab1fc2d23faaad747.jpg', 'bbaf6578b50cff1a3aa5fc1ab1fc2d23faaad747.jpg', 1, 27, 1),
(28, '599932_443801952320999_86196437_n', NULL, '5b365b0fee9eab2229ded0147cc5627e5ba8495f.jpg', '5b365b0fee9eab2229ded0147cc5627e5ba8495f.jpg', 1, 28, 1),
(29, 'bus', NULL, '5a2348b6d31560531e41120e21a7b55ade65ec22.jpg', '5a2348b6d31560531e41120e21a7b55ade65ec22.jpg', 1, 29, 1),
(30, 'logo', 'scania_logo', '4af042ea5c40041be6e0052ce1b295fab370801e.jpg', '4af042ea5c40041be6e0052ce1b295fab370801e.jpg', 1, 30, 1),
(31, 'logo', 'irizar', 'cc3ccde43fee16a209104482ad5e88e22f17ee12.jpg', 'cc3ccde43fee16a209104482ad5e88e22f17ee12.jpg', 1, 31, 1),
(32, '4ae5b0878adf8d8d1baa91ed8fd2a3c4b189b15d', NULL, '48638420b1042ddfb989e34214eb9eb8b87dd4c3.jpg', '48638420b1042ddfb989e34214eb9eb8b87dd4c3.jpg', 1, 3, 1),
(33, '1fb9b1f8b770b453b7265a3f635573e55bf22f48', NULL, '378109a85752dfa61c7adc2250a1f45c6a4b28ce.jpg', '378109a85752dfa61c7adc2250a1f45c6a4b28ce.jpg', 1, 4, 1),
(34, '3d235a4b191a14efb7cae74f2b1f1e3d00e62dc3', NULL, 'c92d87e108a142c4bc5b8d0b2571c07907b32ec1.jpg', 'c92d87e108a142c4bc5b8d0b2571c07907b32ec1.jpg', 1, 2, 1),
(35, '0ff147ad350dc4dcbc02d402aa1365a077f04a08', NULL, '7fe0bb156476068d14229847a1a43e0e1b43af82.jpg', '7fe0bb156476068d14229847a1a43e0e1b43af82.jpg', 1, 1, 1),
(36, '2014 MG 3 Preview', '', 'http://i1.ytimg.com/vi/Lh-LsfoZfik/hqdefault.jpg', 'http://www.youtube.com/watch?v=Lh-LsfoZfik', 3, 32, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logos_galeria`
--

CREATE TABLE IF NOT EXISTS `logos_galeria` (
  `autobus_id` int(11) NOT NULL,
  `galeria_id` int(11) NOT NULL,
  PRIMARY KEY (`autobus_id`,`galeria_id`),
  KEY `IDX_D9AC1A95A6FBF07A` (`autobus_id`),
  KEY `IDX_D9AC1A95D31019C` (`galeria_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Pagina`
--

CREATE TABLE IF NOT EXISTS `Pagina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pagina` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `imagen` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contenido_es` longtext COLLATE utf8_unicode_ci,
  `contenido_en` longtext COLLATE utf8_unicode_ci,
  `contenido_fr` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `Pagina`
--

INSERT INTO `Pagina` (`id`, `pagina`, `imagen`, `contenido_es`, `contenido_en`, `contenido_fr`) VALUES
(1, 'Nosotros', 'cc9fb8256023b61b0a76772e394afe75b0b7c1c0.png', '<h3>HISTORIA</h3>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est, delectus, facere, ullam, quos alias provident reiciendis itaque ea id commodi necessitatibus officiis repudiandae aspernatur! Maiores, repellendus adipisci nisi accusamus placeat.</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Adipisci, necessitatibus inventore similique voluptatibus fugit corrupti dolores doloremque! Pariatur, perferendis, debitis, beatae dicta rerum mollitia magnam voluptatem consectetur accusantium voluptatum placeat.</p>\r\n<ul class="mision-vision-valores">\r\n<li class="mision"><img src="http://placehold.it/100x100&amp;text=Mision" alt="" />\r\n<h3>NUESTRA MISION</h3>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Asperiores, tenetur, officia possimus amet exercitationem laboriosam eaque iste itaque fugiat porro voluptas voluptate quas qui debitis necessitatibus vel placeat. Enim, nostrum.</p>\r\n</li>\r\n<li class="vision"><img src="http://placehold.it/100x100&amp;text=Vision" alt="" />\r\n<h3>NUESTRA VISION</h3>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Asperiores, tenetur, officia possimus amet exercitationem laboriosam eaque iste itaque fugiat porro voluptas voluptate quas qui debitis necessitatibus vel placeat. Enim, nostrum.</p>\r\n</li>\r\n<li class="valores"><img class="redonda" src="http://placehold.it/100x100&amp;text=Valores" alt="" />\r\n<h3>VALORES</h3>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Asperiores, tenetur, officia possimus amet exercitationem laboriosam eaque iste itaque fugiat porro voluptas voluptate quas qui debitis necessitatibus vel placeat. Enim, nostrum.</p>\r\n</li>\r\n</ul>\r\n<h3 class="azul">&iquest;PORQUE NOSOTROS?</h3>\r\n<ul class="vinetas-azules">\r\n<li>Lorem ipsum dolor sit amet, consectetur adipisicing elit. At, dolor assumenda nihil nemo repellendus quae amet. Ex, optio, ducimus pariatur sit voluptatibus inventore labore repellat est voluptatem quam recusandae fugiat.</li>\r\n<li>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quae, sequi nihil doloremque soluta eveniet iusto aliquid iure natus iste sit? Quam, temporibus quae ab esse nisi ratione exercitationem neque voluptatibus!</li>\r\n<li>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugiat, incidunt, maiores dolores culpa facilis qui et dicta aliquam quis inventore earum voluptas accusantium ducimus. Est, impedit sequi recusandae natus cumque!</li>\r\n</ul>\r\n<h3>ALIANZAS ESTRATEGICAS</h3>\r\n<ul class="vinetas-azules">\r\n<li>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iure temporibus assumenda fugit eaque asperiores rem et error qui repudiandae mollitia! Assumenda, culpa, quasi? Blanditiis, veritatis similique vero nobis provident aut.</li>\r\n<li>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reprehenderit, enim fugit officiis vitae aliquam ea fuga cumque nam eveniet illum voluptatum repudiandae ullam blanditiis iusto perferendis illo itaque cupiditate. Voluptatem?</li>\r\n<li>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vitae, dolorem, atque, reprehenderit, est asperiores a nesciunt odio at doloribus sapiente sint ipsam vel provident dolorum magni debitis doloremque illo voluptatem.</li>\r\n</ul>', '<h3>HISTORY</h3>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est, delectus, facere, ullam, quos alias provident reiciendis itaque ea id commodi necessitatibus officiis repudiandae aspernatur! Maiores, repellendus adipisci nisi accusamus placeat.</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Adipisci, necessitatibus inventore similique voluptatibus fugit corrupti dolores doloremque! Pariatur, perferendis, debitis, beatae dicta rerum mollitia magnam voluptatem consectetur accusantium voluptatum placeat.</p>\r\n<ul class="mision-vision-valores">\r\n<li class="mision"><img src="http://placehold.it/100x100&amp;text=Mision" alt="" />\r\n<h3>NUESTRA MISION</h3>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Asperiores, tenetur, officia possimus amet exercitationem laboriosam eaque iste itaque fugiat porro voluptas voluptate quas qui debitis necessitatibus vel placeat. Enim, nostrum.</p>\r\n</li>\r\n<li class="vision"><img src="http://placehold.it/100x100&amp;text=Vision" alt="" />\r\n<h3>NUESTRA VISION</h3>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Asperiores, tenetur, officia possimus amet exercitationem laboriosam eaque iste itaque fugiat porro voluptas voluptate quas qui debitis necessitatibus vel placeat. Enim, nostrum.</p>\r\n</li>\r\n<li class="valores"><img class="redonda" src="http://placehold.it/100x100&amp;text=Valores" alt="" />\r\n<h3>VALORES</h3>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Asperiores, tenetur, officia possimus amet exercitationem laboriosam eaque iste itaque fugiat porro voluptas voluptate quas qui debitis necessitatibus vel placeat. Enim, nostrum.</p>\r\n</li>\r\n</ul>\r\n<h3 class="azul">&iquest;PORQUE NOSOTROS?</h3>\r\n<ul class="vinetas-azules">\r\n<li>Lorem ipsum dolor sit amet, consectetur adipisicing elit. At, dolor assumenda nihil nemo repellendus quae amet. Ex, optio, ducimus pariatur sit voluptatibus inventore labore repellat est voluptatem quam recusandae fugiat.</li>\r\n<li>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quae, sequi nihil doloremque soluta eveniet iusto aliquid iure natus iste sit? Quam, temporibus quae ab esse nisi ratione exercitationem neque voluptatibus!</li>\r\n<li>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugiat, incidunt, maiores dolores culpa facilis qui et dicta aliquam quis inventore earum voluptas accusantium ducimus. Est, impedit sequi recusandae natus cumque!</li>\r\n</ul>\r\n<h3>ALIANZAS ESTRATEGICAS</h3>\r\n<ul class="vinetas-azules">\r\n<li>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iure temporibus assumenda fugit eaque asperiores rem et error qui repudiandae mollitia! Assumenda, culpa, quasi? Blanditiis, veritatis similique vero nobis provident aut.</li>\r\n<li>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reprehenderit, enim fugit officiis vitae aliquam ea fuga cumque nam eveniet illum voluptatum repudiandae ullam blanditiis iusto perferendis illo itaque cupiditate. Voluptatem?</li>\r\n<li>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vitae, dolorem, atque, reprehenderit, est asperiores a nesciunt odio at doloribus sapiente sint ipsam vel provident dolorum magni debitis doloremque illo voluptatem.</li>\r\n</ul>', '<h3>HISTOIRE EN FRANCES</h3>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est, delectus, facere, ullam, quos alias provident reiciendis itaque ea id commodi necessitatibus officiis repudiandae aspernatur! Maiores, repellendus adipisci nisi accusamus placeat.</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Adipisci, necessitatibus inventore similique voluptatibus fugit corrupti dolores doloremque! Pariatur, perferendis, debitis, beatae dicta rerum mollitia magnam voluptatem consectetur accusantium voluptatum placeat.</p>\r\n<ul class="mision-vision-valores">\r\n<li class="mision"><img src="http://placehold.it/100x100&amp;text=Mision" alt="" />\r\n<h3>NUESTRA MISION</h3>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Asperiores, tenetur, officia possimus amet exercitationem laboriosam eaque iste itaque fugiat porro voluptas voluptate quas qui debitis necessitatibus vel placeat. Enim, nostrum.</p>\r\n</li>\r\n<li class="vision"><img src="http://placehold.it/100x100&amp;text=Vision" alt="" />\r\n<h3>NUESTRA VISION</h3>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Asperiores, tenetur, officia possimus amet exercitationem laboriosam eaque iste itaque fugiat porro voluptas voluptate quas qui debitis necessitatibus vel placeat. Enim, nostrum.</p>\r\n</li>\r\n<li class="valores"><img class="redonda" src="http://placehold.it/100x100&amp;text=Valores" alt="" />\r\n<h3>VALORES</h3>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Asperiores, tenetur, officia possimus amet exercitationem laboriosam eaque iste itaque fugiat porro voluptas voluptate quas qui debitis necessitatibus vel placeat. Enim, nostrum.</p>\r\n</li>\r\n</ul>\r\n<h3 class="azul">&iquest;PORQUE NOSOTROS?</h3>\r\n<ul class="vinetas-azules">\r\n<li>Lorem ipsum dolor sit amet, consectetur adipisicing elit. At, dolor assumenda nihil nemo repellendus quae amet. Ex, optio, ducimus pariatur sit voluptatibus inventore labore repellat est voluptatem quam recusandae fugiat.</li>\r\n<li>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quae, sequi nihil doloremque soluta eveniet iusto aliquid iure natus iste sit? Quam, temporibus quae ab esse nisi ratione exercitationem neque voluptatibus!</li>\r\n<li>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugiat, incidunt, maiores dolores culpa facilis qui et dicta aliquam quis inventore earum voluptas accusantium ducimus. Est, impedit sequi recusandae natus cumque!</li>\r\n</ul>\r\n<h3>ALIANZAS ESTRATEGICAS</h3>\r\n<ul class="vinetas-azules">\r\n<li>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iure temporibus assumenda fugit eaque asperiores rem et error qui repudiandae mollitia! Assumenda, culpa, quasi? Blanditiis, veritatis similique vero nobis provident aut.</li>\r\n<li>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reprehenderit, enim fugit officiis vitae aliquam ea fuga cumque nam eveniet illum voluptatum repudiandae ullam blanditiis iusto perferendis illo itaque cupiditate. Voluptatem?</li>\r\n<li>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vitae, dolorem, atque, reprehenderit, est asperiores a nesciunt odio at doloribus sapiente sint ipsam vel provident dolorum magni debitis doloremque illo voluptatem.</li>\r\n</ul>'),
(2, 'Inicio', NULL, '<p>Sin contenido</p>', '<p>Sin contenido</p>', '<p>Sin contenido</p>'),
(3, 'servicios', '5759097d88b799f614a5a3c3ea427345cfdb3da7.jpeg', '<h3>TIPO DE LOGISTICA</h3>\r\n<div class="logistica">\r\n<h4>Viaje Sencillo:</h4>\r\n<p>Transporte desde el punto de origen al destino final del viaje.</p>\r\n</div>\r\n<div class="logistica">\r\n<h4>Viaje Redondo:</h4>\r\n<p>Transporte de ida y vuelta desde el mismo lugar de origen.</p>\r\n</div>\r\n<div class="logistica">\r\n<h4>Viaje Completo:</h4>\r\n<p>Transporte de ida y vuelta, mas la compa&ntilde;ia del autob&uacute;s durante el viaje para la movilidad en el destino.</p>\r\n</div>\r\n<div class="logistica">\r\n<h4>Por hora o por d&iacute;a:</h4>\r\n<p>Renta de autob&uacute;s por un pediodo de tiempo espec&iacute;fico.</p>\r\n</div>\r\n<h3>MOTIVO DEL VIAJE</h3>\r\n<ul>\r\n<li>Circuitos Tur&iacute;sticos</li>\r\n<li>Congresos y convenciones</li>\r\n<li>Eventos Sociales</li>\r\n<li>Planeaci&oacute;n de Viajes</li>\r\n<li>Transportaci&oacute;n Empresarial</li>\r\n<li>Translados</li>\r\n<li>Viajes familiares y recreativos</li>\r\n<li>Viajes Escolares</li>\r\n<li>Viajes Receptivos (Nacionales y Extranjeros)</li>\r\n</ul>', '<p>TYPE OF LOGISTICS</p>\r\n<p>One Way: <br />Transport from point of origin to final destination.</p>\r\n<p>Round Trip: <br />Transportation from and to the same place of origin.</p>\r\n<p>Full Travel: <br />Transportation round trip, but the bus company during the journey to the destination mobility.</p>\r\n<p>Per hour or per day: <br />Rent bus for pediodo specific time.</p>\r\n<p>REASON FOR TRAVEL</p>\r\n<p>Tourist Circuits <br />Conferences and conventions <br />Social events <br />Travel Planning <br />Business transportation <br />Transfers <br />Family and Recreational Trips <br />School trips <br />Incoming Travel (Domestic and Foreign)</p>', '<p>TYPE DE LA LOGISTIQUE</p>\r\n<p>One Way: <br />Transports du point d''origine jusqu''&agrave; la destination finale.</p>\r\n<p>Round Trip: <br />Transport de et vers le m&ecirc;me lieu d''origine.</p>\r\n<p>Voyage complet: <br />Transport aller-retour, mais la compagnie de bus pendant le voyage &agrave; la mobilit&eacute; de destination.</p>\r\n<p>Par heure ou par jour: <br />Louer bus pour le temps sp&eacute;cifique de pediodo.</p>\r\n<p>RAISON DE VOYAGE</p>\r\n<p>Circuits touristiques <br />Conf&eacute;rences et conventions <br />Activit&eacute;s sociales <br />Planification de Voyage <br />Transport d''affaires <br />transferts <br />Famille et loisirs Voyages <br />Voyages scolaires <br />Entrant Voyage (nationaux et &eacute;trangers)</p>');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagina_galeria`
--

CREATE TABLE IF NOT EXISTS `pagina_galeria` (
  `pagina_id` int(11) NOT NULL,
  `galeria_id` int(11) NOT NULL,
  PRIMARY KEY (`pagina_id`,`galeria_id`),
  KEY `IDX_93AEAADA57991ECF` (`pagina_id`),
  KEY `IDX_93AEAADAD31019C` (`galeria_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `pagina_galeria`
--

INSERT INTO `pagina_galeria` (`pagina_id`, `galeria_id`) VALUES
(2, 1),
(2, 3),
(2, 5),
(3, 32),
(3, 33),
(3, 34),
(3, 35),
(3, 36);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Publicacion`
--

CREATE TABLE IF NOT EXISTS `Publicacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) DEFAULT NULL,
  `categoria_publicacion_id` int(11) DEFAULT NULL,
  `titulo_es` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion_es` longtext COLLATE utf8_unicode_ci NOT NULL,
  `paquete_es` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `titulo_en` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion_en` longtext COLLATE utf8_unicode_ci NOT NULL,
  `paquete_en` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `titulo_fr` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion_fr` longtext COLLATE utf8_unicode_ci NOT NULL,
  `paquete_fr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `precio_es` decimal(10,2) NOT NULL,
  `precio_en` decimal(10,2) NOT NULL,
  `precio_fr` decimal(10,2) NOT NULL,
  `position` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `in_carrusel` tinyint(1) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `imagen` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E46E8788DB38439E` (`usuario_id`),
  KEY `IDX_E46E8788D8F09E0F` (`categoria_publicacion_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `Publicacion`
--

INSERT INTO `Publicacion` (`id`, `usuario_id`, `categoria_publicacion_id`, `titulo_es`, `descripcion_es`, `paquete_es`, `titulo_en`, `descripcion_en`, `paquete_en`, `titulo_fr`, `descripcion_fr`, `paquete_fr`, `precio_es`, `precio_en`, `precio_fr`, `position`, `is_active`, `in_carrusel`, `slug`, `created_at`, `updated_at`, `imagen`) VALUES
(1, 1, 1, 'acapulco', '<p>descripcion en espa&ntilde;ol</p>', NULL, 'acapulco', '<p>descripcion en ingles</p>', NULL, 'acapulco', '<p>descripcion en frances</p>', NULL, 0.00, 0.00, 0.00, 1, 1, 1, 'acapulco', '2014-05-10 08:42:23', '2014-05-10 08:43:50', '33690b6ad811d0b849b58fd91b90dd19a6c5bd4c.jpeg'),
(2, 1, 2, 'un evento', '<p>en espa&ntilde;ol</p>', NULL, 'one event', '<p>un evento en ingles</p>', NULL, 'un événement en français', '<p>descripcion en frances</p>', NULL, 0.00, 0.00, 0.00, 2, 1, 1, 'un-evento', '2014-05-10 09:01:20', '2014-05-10 09:01:20', '52e3975249d790a7bebc36c2dd646f476ec91df0.jpeg'),
(3, 1, 3, 'Viaje a las grutas ....', '<p>Descripcion en espa&ntilde;ol</p>', 'Dos personas, todo pagado.', 'Travel caves ....', '<p>Description in English</p>', 'Two people, all paid.', 'Voyage des grottes ....', '<p>La description en fran&ccedil;ais</p>', 'Deux personnes, tous payés.', 12000.00, 1000.00, 667.00, 3, 1, 1, 'viaje-a-las-grutas', '2014-05-10 09:15:08', '2014-05-10 09:15:08', '58dc4445ae5e06292c66f47b290ed4a0d58a619a.jpeg'),
(4, 1, 3, 'PLAYAS CERTIFICADAS, OAXACA', '<p>descripcion en espa&ntilde;ol</p>', NULL, 'CERTIFIED BEACH, OAXACA', '<p>descripcion en ingles</p>', NULL, 'Beach certifié, OAXACA', '<p>descripcion en frances</p>', NULL, 0.00, 0.00, 0.00, 4, 1, 1, 'playas-certificadas-oaxaca', '2014-05-11 22:32:23', '2014-05-11 22:32:23', '5ad4d954e9e1625b9dbfb6ed8dbfe73adeab40ce.jpeg'),
(5, 1, 1, 'Chihuahua', '<p>Descrpicion en espa&ntilde;ol</p>', NULL, 'Chihuahua', '<p>Descripcion en ingles</p>', NULL, 'Chihuahua', '<p>Descripcion en frances</p>', NULL, 0.00, 0.00, 0.00, 5, 1, 1, 'chihuahua', '2014-05-11 22:33:28', '2014-05-11 22:33:28', '1ee4467bb3c0e9dd6067882ee58968820ff2699e.jpeg'),
(6, 1, 1, 'Chiapas', '<p>Descripcion en espa&ntilde;ol</p>', NULL, 'Chiapas', '<p>Descripcion en ingles</p>', NULL, 'Chiapas', '<p>Descripcion en frances</p>', NULL, 0.00, 0.00, 0.00, 6, 1, 1, 'chiapas', '2014-05-11 22:34:49', '2014-05-11 22:34:49', '886c64c4aaa09cd8299a867eb9b58599ad03dd16.jpeg'),
(7, 1, 1, 'Monterrey', '<p>Descripcion en espa&ntilde;ol</p>', NULL, 'Monterrey', '<p>Descripcion en ingles</p>', NULL, 'Monterrey', '<p>Descripcion en frances</p>', NULL, 0.00, 0.00, 0.00, 7, 1, 1, 'monterrey', '2014-05-11 22:36:43', '2014-05-11 22:36:43', '86ae1f3ee5b6802cd38535799aa89a00651f1785.jpeg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publicacion_galeria`
--

CREATE TABLE IF NOT EXISTS `publicacion_galeria` (
  `publicacion_id` int(11) NOT NULL,
  `galeria_id` int(11) NOT NULL,
  PRIMARY KEY (`publicacion_id`,`galeria_id`),
  KEY `IDX_E91903C69ACBB5E7` (`publicacion_id`),
  KEY `IDX_E91903C6D31019C` (`galeria_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `UsuarioNewsletter`
--

CREATE TABLE IF NOT EXISTS `UsuarioNewsletter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `UsuarioNewsletter`
--

INSERT INTO `UsuarioNewsletter` (`id`, `email`, `nombre`, `is_active`, `created_at`) VALUES
(1, 'richpolis@gmail.com', 'Ricardo Alcantara Gomez', 1, '2014-05-10 10:12:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `twitter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `grupo` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `imagen` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `username`, `password`, `email`, `salt`, `nombre`, `twitter`, `facebook`, `grupo`, `imagen`, `created_at`, `updated_at`) VALUES
(1, 'richpolis', 'hYJoq7UfJQBr+T/iepEAzNBdru6+y/RtdHr+3AyqI2maWoCHDRbU7zuG6pohYB5mKDW9i0lCCYqTcAdEgSC+SA==', 'richpolis@gmail.com', '1njh9aj2gsbowogoc0s48ko0kggs84w', 'Ricardo Alcantara Gomez', 'Richpolis', 'RICHPOLIS', '3', NULL, '2014-05-05 17:23:24', '2014-05-05 17:23:24'),
(2, 'Admin', '', 'admin@turismoplusmg.com', 'hum17m7mym0wc8c0k4gc8kk0gs4w8wk', 'Administrador general', NULL, NULL, '2', NULL, '2014-05-05 17:23:24', '2014-05-10 23:19:12'),
(3, 'Usuario1', '', 'usuario1@turismoplusmg.com', 'nxybmdh8g7k8cg88w0ssw80gwokog40', 'Usuario 1', NULL, NULL, '1', NULL, '2014-05-05 17:23:24', '2014-05-10 23:20:03');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `autobus_galeria`
--
ALTER TABLE `autobus_galeria`
  ADD CONSTRAINT `FK_3BDDD407A6FBF07A` FOREIGN KEY (`autobus_id`) REFERENCES `Autobus` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_3BDDD407D31019C` FOREIGN KEY (`galeria_id`) REFERENCES `Galeria` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `logos_galeria`
--
ALTER TABLE `logos_galeria`
  ADD CONSTRAINT `FK_D9AC1A95A6FBF07A` FOREIGN KEY (`autobus_id`) REFERENCES `Autobus` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_D9AC1A95D31019C` FOREIGN KEY (`galeria_id`) REFERENCES `Galeria` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `pagina_galeria`
--
ALTER TABLE `pagina_galeria`
  ADD CONSTRAINT `FK_93AEAADA57991ECF` FOREIGN KEY (`pagina_id`) REFERENCES `Pagina` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_93AEAADAD31019C` FOREIGN KEY (`galeria_id`) REFERENCES `Galeria` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `Publicacion`
--
ALTER TABLE `Publicacion`
  ADD CONSTRAINT `FK_E46E8788D8F09E0F` FOREIGN KEY (`categoria_publicacion_id`) REFERENCES `CategoriaPublicacion` (`id`),
  ADD CONSTRAINT `FK_E46E8788DB38439E` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `publicacion_galeria`
--
ALTER TABLE `publicacion_galeria`
  ADD CONSTRAINT `FK_E91903C69ACBB5E7` FOREIGN KEY (`publicacion_id`) REFERENCES `Publicacion` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_E91903C6D31019C` FOREIGN KEY (`galeria_id`) REFERENCES `Galeria` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
