-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.1.31-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win32
-- HeidiSQL Versión:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para bd_noticias
CREATE DATABASE IF NOT EXISTS `bd_noticias` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `bd_noticias`;

-- Volcando estructura para tabla bd_noticias.noticias
CREATE TABLE IF NOT EXISTS `noticias` (
  `cod_noticia` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` text,
  `contenido` text,
  PRIMARY KEY (`cod_noticia`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bd_noticias.noticias: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `noticias` DISABLE KEYS */;
INSERT INTO `noticias` (`cod_noticia`, `titulo`, `contenido`) VALUES
	(1, 'El fantástico Subnautica fecha su lanzamiento en PS4 y Xbox One', 'El estudio independiente Unknown Worlds Entertainment ha anunciado que su fantástico Subnautica, una aventura de supervivencia que nos lleva a las profundidades marinas, estrenará su versión final en Xbox One y PS4 el próximo 4 de diciembre, contando además con una versión en físico que estará disponible el día 7 del mismo mes.'),
	(2, 'Jump Force presenta en imágenes a Shishio Makoto y Himura Kenshin', 'Días atrás se confirmó el nombre de varios nuevos luchadores para Jump Force, el esperado videojuego de peleas de Bandai Namco que reúne a héroes y villanos de sagas tan conocidas como Dragon Ball, Naruto o One Piece entre muchas otras, y hoy la compañía japonesa ha presentado las primeras imágenes de algunos de ellos. En concreto podemos ver a Himura Kenshin y Shishio Makoto, protagonistas del clásico manga Rurouni Kenshin, de Nobuhiro Watsuki.'),
	(3, 'Así de espectacular se ve la dimensión Xen de Black Mesa', 'Para conmemorar el 20 aniversario de Half Life, el equipo responsable de su esperadísimo remake ha presentado al fin un tráiler de Black Mesa donde podemos ver la dimensión Xen, último escenario en el viaje de Gordon Freeman. No solo eso. Los autores del videojuego han confirmado que este último episodio estará disponible en el segundo cuarto de 2019, sin aportar una fecha más concreta.'),
	(4, 'La actualización Visions para No Man\'s Sky llega mañana', 'Tras la filtración de la nueva actualización Visions para No Man\'s Sky, Hello Games la ha confirmado.\r\n\r\nY lo mejor de todo es que llega mañana mismo, 22 de noviembre, a PC, Xbox One y PS4.\r\n\r\nCon esta nueva actualización, Hello Games pretende añadir más variedad al juego, y la mayoría de añadidos van dirigidos a aumentar la diversidad ofrecida. Como explica el estudio, se incluirán cinco nuevos biomas planetarios, nueva fauna y flora (alguna bastante extraña), unos colores más vivos gracias a una mejora en la paleta de colores y cielos y atmósferas mejoradas.'),
	(5, 'Killer 7 ya está disponible en Steam', 'Killer 7 ha llegado a Steam de la mano de NIS America. <br/><br/>\r\n\r\nEl lanzamiento, que se anunció en mayo de este año, permite volver a jugar a este extravagante shooter on-rails en tercera persona diseñado por Suda51 tras años descatalogado. <br/><br/>\r\n\r\nEn su momento formó parte de los Capcom 5, cinco títulos de la compañía japonesa que iban a ser exclusivos de Gamecube. Los otros cuatro títulos eran Resident Evil 4, Viewtiful Joe, P.N.03 (el único que permaneció exclusivo) y el cancelado Dead Phoenix. <br/> <br/>\r\n\r\nEl port funciona a 16:9, cuenta con texturas en alta resolución y corre a 60 frames por segundo excepto en la animación de recarga que va a 30; según comenta NIS America poner esta animación a 60 fps creaba artefactos en la imagen. \r\n<br/><br/>\r\n\r\nKiller 7 tendrá un descuento del 10% hasta el jueves.'),
	(7, 'Shadowbringers es la próxima expansión de Final Fantasy XIV', 'Square Enix ha anunciado que Shadowbringers es el nombre de la próxima expansión de Final Fantasy XIV.\r\n<br/><br/>\r\n\r\nEn Shadowbringers se añadirá una nueva raza y nuevos trabajos, un sistema de "confianza" que permitirá que algunos NPC nos acompañen en los combates, un New Game + para revisitar misiones antiguas y la posibilidad de visitar otros servidores siempre que estén alojados en el mismo centro de datos. Sabremos más de esta expansión en febrero durante el Fan Festival de París.\r\n<br/><br/>\r\n\r\nEn este contenido el Guerrero de la Luz se convertirá en el Guerrero de la Oscuridad; los motivos se detallarán en la actualización 4.5, que llegará antes de la expansión.\r\n<br/><br/>\r\n\r\nEsta actualización permitirá también jugar como mago azul. Para poder desbloquear este trabajo hará falta tener A Realm Reborn, haber superado la campaña 2.0 y alcanzar el nivel 50 como Discípulo de Guerra o Magia.\r\n<br/><br/>\r\n\r\nFinal Fantasy XIV: Shadowbringers saldrá a principios de verano de 2019.');
/*!40000 ALTER TABLE `noticias` ENABLE KEYS */;

-- Volcando estructura para tabla bd_noticias.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `rol` varchar(50) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellidos` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bd_noticias.usuarios: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`username`, `password`, `rol`, `nombre`, `apellidos`) VALUES
	('amañas', '12345', 'USER', 'Arkaitz', 'Mañas'),
	('ezuazo', '12345', 'ADMIN', 'Endika', 'Zuazo Txintxurreta'),
	('icampo', '12345', 'USER', 'Iñigo', 'Campo'),
	('ihernandez', '12345', 'USER', 'Iñigo', 'Hernandez'),
	('izuazo', '12345', 'USER', 'Iñigo', 'Zuazo'),
	('mfernandez', '12345', 'USER', 'Mikel', 'Fernandez');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
