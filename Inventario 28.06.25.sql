-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.30 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para sis_inventario
CREATE DATABASE IF NOT EXISTS `sis_inventario` /*!40100 DEFAULT CHARACTER SET latin1 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sis_inventario`;

-- Volcando estructura para tabla sis_inventario.cache
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla sis_inventario.cache: ~0 rows (aproximadamente)

-- Volcando estructura para tabla sis_inventario.cache_locks
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla sis_inventario.cache_locks: ~0 rows (aproximadamente)

-- Volcando estructura para tabla sis_inventario.categorias
CREATE TABLE IF NOT EXISTS `categorias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `categoria` text CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- Volcando datos para la tabla sis_inventario.categorias: ~6 rows (aproximadamente)
INSERT INTO `categorias` (`id`, `categoria`, `fecha`) VALUES
	(1, 'Equipos Electromecánicos', '2017-12-21 20:53:29'),
	(2, 'Taladros', '2017-12-21 20:53:29'),
	(3, 'Andamios', '2017-12-21 20:53:29'),
	(4, 'Generadores de energía', '2017-12-21 20:53:29'),
	(5, 'Equipos para construcción', '2017-12-21 20:53:29'),
	(6, 'Martillos mecánicos', '2017-12-21 23:06:40');

-- Volcando estructura para tabla sis_inventario.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` text CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `documento` int NOT NULL,
  `email` text CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `telefono` text CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `direccion` text CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `compras` int NOT NULL,
  `ultima_compra` datetime NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- Volcando datos para la tabla sis_inventario.clientes: ~10 rows (aproximadamente)
INSERT INTO `clientes` (`id`, `nombre`, `documento`, `email`, `telefono`, `direccion`, `fecha_nacimiento`, `compras`, `ultima_compra`, `fecha`) VALUES
	(3, 'Juan Villegas', 2147483647, 'juan@hotmail.com', '(300) 341-2345', 'Calle 23 # 45 - 56', '1980-11-02', 29, '2025-06-28 22:41:29', '2025-06-29 03:41:29'),
	(4, 'Pedro Pérez', 2147483647, 'pedro@gmail.com', '(399) 876-5432', 'Calle 34 N33 -56', '1970-08-07', 17, '2025-06-28 22:42:19', '2025-06-29 03:42:19'),
	(5, 'Miguel Murillo', 325235235, 'miguel@hotmail.com', '(254) 545-3446', 'calle 34 # 34 - 23', '1976-03-04', 47, '2025-06-28 22:50:02', '2025-06-29 03:50:02'),
	(6, 'Margarita Londoño', 34565432, 'margarita@hotmail.com', '(344) 345-6678', 'Calle 45 # 34 - 56', '1976-11-30', 19, '2019-05-25 01:10:41', '2019-05-25 06:10:41'),
	(7, 'Julian Ramirez', 786786545, 'julian@hotmail.com', '(675) 674-5453', 'Carrera 45 # 54 - 56', '1980-04-05', 18, '2025-06-28 23:13:05', '2025-06-29 04:13:05'),
	(8, 'Stella Jaramillo', 65756735, 'stella@gmail.com', '(435) 346-3463', 'Carrera 34 # 45- 56', '1956-06-05', 9, '2017-12-26 17:25:55', '2017-12-26 22:25:55'),
	(9, 'Eduardo López', 2147483647, 'eduardo@gmail.com', '(534) 634-6565', 'Carrera 67 # 45sur', '1978-03-04', 19, '2025-06-28 23:11:54', '2025-06-29 04:11:54'),
	(10, 'Ximena Restrepo', 436346346, 'ximena@gmail.com', '(543) 463-4634', 'calle 45 # 23 - 45', '1956-03-04', 18, '2017-12-26 17:25:08', '2017-12-26 22:25:08'),
	(11, 'David Guzman', 43634643, 'david@hotmail.com', '(354) 574-5634', 'carrera 45 # 45 ', '1967-05-04', 10, '2017-12-26 17:24:50', '2017-12-26 22:24:50'),
	(12, 'Gonzalo Pérez', 436346346, 'gonzalo@yahoo.com', '(235) 346-3464', 'Carrera 34 # 56 - 34', '1967-08-09', 25, '2025-06-28 23:12:26', '2025-06-29 04:12:26'),
	(13, 'AGENERAL', 0, '--@--.com', '000.000.000', '-', '1980-01-01', 61, '2025-06-28 22:23:15', '2025-06-29 03:23:16');

-- Volcando estructura para tabla sis_inventario.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla sis_inventario.failed_jobs: ~0 rows (aproximadamente)

-- Volcando estructura para tabla sis_inventario.inventario
CREATE TABLE IF NOT EXISTS `inventario` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `idProducto` int NOT NULL,
  `idVenta` int DEFAULT NULL,
  `cant_movimiento` int NOT NULL,
  `tipo_movimiento` enum('salida','entrada') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `fecha` date NOT NULL,
  `factura_or_boleta` varchar(50) DEFAULT NULL,
  `observacion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKProducto` (`idProducto`),
  KEY `FKVenta` (`idVenta`),
  CONSTRAINT `FKProducto` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`id`),
  CONSTRAINT `FKVenta` FOREIGN KEY (`idVenta`) REFERENCES `ventas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla sis_inventario.inventario: ~65 rows (aproximadamente)
INSERT INTO `inventario` (`id`, `idProducto`, `idVenta`, `cant_movimiento`, `tipo_movimiento`, `fecha`, `factura_or_boleta`, `observacion`) VALUES
	(20, 60, NULL, 100, 'entrada', '2025-06-28', 'f001', 'ENTRADA DE PRODUCTOS'),
	(21, 59, NULL, 100, 'entrada', '2025-06-28', 'f001', 'ENTRADA DE PRODUCTOS'),
	(22, 58, NULL, 100, 'entrada', '2025-06-28', 'f001', 'ENTRADA DE PRODUCTOS'),
	(23, 57, NULL, 100, 'entrada', '2025-06-28', 'f001', 'ENTRADA DE PRODUCTOS'),
	(24, 56, NULL, 100, 'entrada', '2025-06-28', 'f001', 'ENTRADA DE PRODUCTOS'),
	(25, 1, NULL, 100, 'entrada', '2025-06-28', 'f001', 'ENTRADA DE PRODUCTOS'),
	(26, 2, NULL, 100, 'entrada', '2025-06-28', 'f001', 'ENTRADA DE PRODUCTOS'),
	(27, 3, NULL, 100, 'entrada', '2025-06-28', 'f001', 'ENTRADA DE PRODUCTOS'),
	(28, 4, NULL, 100, 'entrada', '2025-06-28', 'f001', 'ENTRADA DE PRODUCTOS'),
	(29, 5, NULL, 100, 'entrada', '2025-06-28', 'f001', 'ENTRADA DE PRODUCTOS'),
	(30, 6, NULL, 100, 'entrada', '2025-06-28', 'f001', 'ENTRADA DE PRODUCTOS'),
	(31, 7, NULL, 100, 'entrada', '2025-06-28', 'f001', 'ENTRADA DE PRODUCTOS'),
	(32, 8, NULL, 100, 'entrada', '2025-06-28', 'f001', 'ENTRADA DE PRODUCTOS'),
	(33, 9, NULL, 100, 'entrada', '2025-06-28', 'f001', 'ENTRADA DE PRODUCTOS'),
	(34, 10, NULL, 100, 'entrada', '2025-06-28', 'f001', 'ENTRADA DE PRODUCTOS'),
	(35, 11, NULL, 100, 'entrada', '2025-06-28', 'f001', 'ENTRADA DE PRODUCTOS'),
	(36, 12, NULL, 100, 'entrada', '2025-06-28', 'f001', 'ENTRADA DE PRODUCTOS'),
	(37, 13, NULL, 100, 'entrada', '2025-06-28', 'f001', 'ENTRADA DE PRODUCTOS'),
	(38, 14, NULL, 100, 'entrada', '2025-06-28', 'f001', 'ENTRADA DE PRODUCTOS'),
	(39, 15, NULL, 100, 'entrada', '2025-06-28', 'f001', 'ENTRADA DE PRODUCTOS'),
	(40, 16, NULL, 100, 'entrada', '2025-06-28', 'f001', 'ENTRADA DE PRODUCTOS'),
	(41, 17, NULL, 100, 'entrada', '2025-06-28', 'f001', 'ENTRADA DE PRODUCTOS'),
	(42, 18, NULL, 100, 'entrada', '2025-06-28', 'f001', 'ENTRADA DE PRODUCTOS'),
	(43, 19, NULL, 100, 'entrada', '2025-06-28', 'f001', 'ENTRADA DE PRODUCTOS'),
	(44, 20, NULL, 100, 'entrada', '2025-06-28', 'f001', 'ENTRADA DE PRODUCTOS'),
	(45, 21, NULL, 100, 'entrada', '2025-06-28', 'f001', 'ENTRADA DE PRODUCTOS'),
	(46, 22, NULL, 100, 'entrada', '2025-06-28', 'f001', 'ENTRADA DE PRODUCTOS'),
	(47, 23, NULL, 100, 'entrada', '2025-06-28', 'f001', 'ENTRADA DE PRODUCTOS'),
	(48, 24, NULL, 100, 'entrada', '2025-06-28', 'f001', 'ENTRADA DE PRODUCTOS'),
	(49, 25, NULL, 100, 'entrada', '2025-06-28', 'f001', 'ENTRADA DE PRODUCTOS'),
	(50, 26, NULL, 100, 'entrada', '2025-06-28', 'f001', 'ENTRADA DE PRODUCTOS'),
	(51, 27, NULL, 100, 'entrada', '2025-06-28', 'f001', 'ENTRADA DE PRODUCTOS'),
	(52, 28, NULL, 100, 'entrada', '2025-06-28', 'f001', 'ENTRADA DE PRODUCTOS'),
	(53, 29, NULL, 100, 'entrada', '2025-06-28', 'f001', 'ENTRADA DE PRODUCTOS'),
	(54, 30, NULL, 100, 'entrada', '2025-06-28', 'f001', 'ENTRADA DE PRODUCTOS'),
	(55, 31, NULL, 100, 'entrada', '2025-06-28', 'f001', 'ENTRADA DE PRODUCTOS'),
	(56, 32, NULL, 100, 'entrada', '2025-06-28', 'f001', 'ENTRADA DE PRODUCTOS'),
	(57, 33, NULL, 100, 'entrada', '2025-06-28', 'f001', 'ENTRADA DE PRODUCTOS'),
	(58, 34, NULL, 100, 'entrada', '2025-06-28', 'f001', 'ENTRADA DE PRODUCTOS'),
	(59, 35, NULL, 100, 'entrada', '2025-06-28', 'f001', 'ENTRADA DE PRODUCTOS'),
	(60, 36, NULL, 100, 'entrada', '2025-06-28', 'f001', 'ENTRADA DE PRODUCTOS'),
	(61, 37, NULL, 100, 'entrada', '2025-06-28', 'f001', 'ENTRADA DE PRODUCTOS'),
	(62, 38, NULL, 100, 'entrada', '2025-06-28', 'f001', 'ENTRADA DE PRODUCTOS'),
	(63, 39, NULL, 100, 'entrada', '2025-06-28', 'f001', 'ENTRADA DE PRODUCTOS'),
	(64, 40, NULL, 100, 'entrada', '2025-06-28', 'f001', 'ENTRADA DE PRODUCTOS'),
	(65, 41, NULL, 100, 'entrada', '2025-06-28', 'f001', 'ENTRADA DE PRODUCTOS'),
	(66, 42, NULL, 100, 'entrada', '2025-06-28', 'f001', 'ENTRADA DE PRODUCTOS'),
	(67, 43, NULL, 100, 'entrada', '2025-06-28', 'f001', 'ENTRADA DE PRODUCTOS'),
	(68, 44, NULL, 100, 'entrada', '2025-06-28', 'f001', 'ENTRADA DE PRODUCTOS'),
	(69, 45, NULL, 100, 'entrada', '2025-06-28', 'f001', 'ENTRADA DE PRODUCTOS'),
	(70, 46, NULL, 100, 'entrada', '2025-06-28', 'f001', 'ENTRADA DE PRODUCTOS'),
	(71, 47, NULL, 100, 'entrada', '2025-06-28', 'f001', 'ENTRADA DE PRODUCTOS'),
	(72, 48, NULL, 100, 'entrada', '2025-06-28', 'f001', 'ENTRADA DE PRODUCTOS'),
	(73, 49, NULL, 100, 'entrada', '2025-06-28', 'f001', 'ENTRADA DE PRODUCTOS'),
	(74, 50, NULL, 100, 'entrada', '2025-06-28', 'f001', 'ENTRADA DE PRODUCTOS'),
	(75, 51, NULL, 100, 'entrada', '2025-06-28', 'f001', 'ENTRADA DE PRODUCTOS'),
	(76, 52, NULL, 100, 'entrada', '2025-06-28', 'f001', 'ENTRADA DE PRODUCTOS'),
	(77, 53, NULL, 100, 'entrada', '2025-06-28', 'f001', 'ENTRADA DE PRODUCTOS'),
	(78, 54, NULL, 100, 'entrada', '2025-06-28', 'f001', 'ENTRADA DE PRODUCTOS'),
	(79, 55, NULL, 100, 'entrada', '2025-06-28', 'f001', 'ENTRADA DE PRODUCTOS'),
	(80, 60, 108, 3, 'salida', '2025-06-28', NULL, 'VENTA N° 10001'),
	(81, 59, 109, 1, 'salida', '2025-06-28', NULL, 'VENTA N° 10002'),
	(82, 58, 111, 1, 'salida', '2025-06-28', NULL, 'VENTA N° 10003'),
	(83, 57, 111, 1, 'salida', '2025-06-28', NULL, 'VENTA N° 10003'),
	(84, 56, 111, 1, 'salida', '2025-06-28', NULL, 'VENTA N° 10003'),
	(85, 60, 114, 1, 'salida', '2025-06-28', NULL, 'VENTA N° 10004'),
	(86, 59, 114, 1, 'salida', '2025-06-28', NULL, 'VENTA N° 10004'),
	(87, 59, 116, 1, 'salida', '2025-06-28', NULL, 'VENTA N° 10005'),
	(88, 55, 117, 1, 'salida', '2025-06-28', NULL, 'VENTA N° 10006'),
	(89, 54, 117, 1, 'salida', '2025-06-28', NULL, 'VENTA N° 10006');

-- Volcando estructura para tabla sis_inventario.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla sis_inventario.jobs: ~0 rows (aproximadamente)

-- Volcando estructura para tabla sis_inventario.job_batches
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla sis_inventario.job_batches: ~0 rows (aproximadamente)

-- Volcando estructura para tabla sis_inventario.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla sis_inventario.migrations: ~0 rows (aproximadamente)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '0001_01_01_000000_create_users_table', 1),
	(2, '0001_01_01_000001_create_cache_table', 1),
	(3, '0001_01_01_000002_create_jobs_table', 1);

-- Volcando estructura para tabla sis_inventario.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla sis_inventario.password_reset_tokens: ~0 rows (aproximadamente)

-- Volcando estructura para tabla sis_inventario.productos
CREATE TABLE IF NOT EXISTS `productos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_categoria` int NOT NULL,
  `codigo` text CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `imagen` text CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `stock` int NOT NULL,
  `precio_compra` float NOT NULL,
  `precio_venta` float NOT NULL,
  `ventas` int NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- Volcando datos para la tabla sis_inventario.productos: ~60 rows (aproximadamente)
INSERT INTO `productos` (`id`, `id_categoria`, `codigo`, `descripcion`, `imagen`, `stock`, `precio_compra`, `precio_venta`, `ventas`, `fecha`) VALUES
	(1, 1, '101', 'Aspiradora Industrial ', 'vistas/img/productos/101/105.png', 100, 1000, 1200, 2, '2025-06-29 03:40:45'),
	(2, 1, '102', 'Plato Flotante para Allanadora', 'vistas/img/productos/102/940.jpg', 100, 4500, 6300, 3, '2025-06-29 03:40:45'),
	(3, 1, '103', 'Compresor de Aire para pintura', 'vistas/img/productos/103/763.jpg', 100, 3000, 4200, 12, '2025-06-29 03:40:45'),
	(4, 1, '104', 'Cortadora de Adobe sin Disco ', 'vistas/img/productos/104/957.jpg', 100, 4000, 5600, 4, '2025-06-29 03:40:45'),
	(5, 1, '105', 'Cortadora de Piso sin Disco ', 'vistas/img/productos/105/630.jpg', 100, 1540, 2156, 7, '2025-06-29 03:40:45'),
	(6, 1, '106', 'Disco Punta Diamante ', 'vistas/img/productos/106/635.jpg', 100, 1100, 1540, 5, '2025-06-29 03:40:45'),
	(7, 1, '107', 'Extractor de Aire ', 'vistas/img/productos/107/848.jpg', 100, 1540, 2156, 8, '2025-06-29 03:40:45'),
	(8, 1, '108', 'Guadañadora ', 'vistas/img/productos/108/163.jpg', 100, 1540, 2156, 7, '2025-06-29 03:40:45'),
	(9, 1, '109', 'Hidrolavadora Eléctrica ', 'vistas/img/productos/109/769.jpg', 100, 2600, 3640, 5, '2025-06-29 03:40:45'),
	(10, 1, '110', 'Hidrolavadora Gasolina', 'vistas/img/productos/110/582.jpg', 100, 2210, 3094, 2, '2025-06-29 03:40:45'),
	(11, 1, '111', 'Motobomba a Gasolina', 'vistas/img/productos/default/anonymous.png', 100, 2860, 4004, 0, '2025-06-29 03:40:45'),
	(12, 1, '112', 'Motobomba El?ctrica', 'vistas/img/productos/default/anonymous.png', 100, 2400, 3360, 0, '2025-06-29 03:40:45'),
	(13, 1, '113', 'Sierra Circular ', 'vistas/img/productos/default/anonymous.png', 100, 1100, 1540, 0, '2025-06-29 03:40:45'),
	(14, 1, '114', 'Disco de tugsteno para Sierra circular', 'vistas/img/productos/default/anonymous.png', 100, 4500, 6300, 0, '2025-06-29 03:40:45'),
	(15, 1, '115', 'Soldador Electrico ', 'vistas/img/productos/default/anonymous.png', 100, 1980, 2772, 0, '2025-06-29 03:40:45'),
	(16, 1, '116', 'Careta para Soldador', 'vistas/img/productos/default/anonymous.png', 100, 4200, 5880, 0, '2025-06-29 03:40:45'),
	(17, 1, '117', 'Torre de iluminacion ', 'vistas/img/productos/default/anonymous.png', 100, 1800, 2520, 0, '2025-06-29 03:40:45'),
	(18, 2, '201', 'Martillo Demoledor de Piso 110V', 'vistas/img/productos/default/anonymous.png', 100, 5600, 7840, 0, '2025-06-29 03:40:45'),
	(19, 2, '202', 'Muela o cincel martillo demoledor piso', 'vistas/img/productos/default/anonymous.png', 100, 9600, 13440, 0, '2025-06-29 03:40:45'),
	(20, 2, '203', 'Taladro Demoledor de muro 110V', 'vistas/img/productos/default/anonymous.png', 100, 3850, 5390, 0, '2025-06-29 03:40:45'),
	(21, 2, '204', 'Muela o cincel martillo demoledor muro', 'vistas/img/productos/default/anonymous.png', 100, 9600, 13440, 0, '2025-06-29 03:40:45'),
	(22, 2, '205', 'Taladro Percutor de 1/2 Madera y Metal', 'vistas/img/productos/default/anonymous.png', 100, 8000, 11200, 0, '2025-06-29 03:40:45'),
	(23, 2, '206', 'Taladro Percutor SDS Plus 110V', 'vistas/img/productos/default/anonymous.png', 100, 3900, 5460, 0, '2025-06-29 03:40:45'),
	(24, 2, '207', 'Taladro Percutor SDS Max 110V (Mineria)', 'vistas/img/productos/default/anonymous.png', 100, 4600, 6440, 0, '2025-06-29 03:40:45'),
	(25, 3, '301', 'Andamio colgante', 'vistas/img/productos/default/anonymous.png', 100, 1440, 2016, 0, '2025-06-29 03:40:45'),
	(26, 3, '302', 'Distanciador andamio colgante', 'vistas/img/productos/default/anonymous.png', 100, 1600, 2240, 0, '2025-06-29 03:40:45'),
	(27, 3, '303', 'Marco andamio modular ', 'vistas/img/productos/default/anonymous.png', 100, 900, 1260, 0, '2025-06-29 03:40:45'),
	(28, 3, '304', 'Marco andamio tijera', 'vistas/img/productos/default/anonymous.png', 100, 100, 140, 0, '2025-06-29 03:40:45'),
	(29, 3, '305', 'Tijera para andamio', 'vistas/img/productos/default/anonymous.png', 100, 162, 226, 0, '2025-06-29 03:40:45'),
	(30, 3, '306', 'Escalera interna para andamio', 'vistas/img/productos/default/anonymous.png', 100, 270, 378, 2, '2025-06-29 03:40:45'),
	(31, 3, '307', 'Pasamanos de seguridad', 'vistas/img/productos/default/anonymous.png', 100, 75, 105, 0, '2025-06-29 03:40:45'),
	(32, 3, '308', 'Rueda giratoria para andamio', 'vistas/img/productos/default/anonymous.png', 100, 168, 235, 0, '2025-06-29 03:40:45'),
	(33, 3, '309', 'Arnes de seguridad', 'vistas/img/productos/default/anonymous.png', 100, 1750, 2450, 0, '2025-06-29 03:40:45'),
	(34, 3, '310', 'Eslinga para arnes', 'vistas/img/productos/default/anonymous.png', 100, 175, 245, 0, '2025-06-29 03:40:45'),
	(35, 3, '311', 'Plataforma Met?lica', 'vistas/img/productos/default/anonymous.png', 100, 420, 588, 1, '2025-06-29 03:40:45'),
	(36, 4, '401', 'Planta Electrica Diesel 6 Kva', 'vistas/img/productos/default/anonymous.png', 100, 3500, 4900, 1, '2025-06-29 03:40:45'),
	(37, 4, '402', 'Planta Electrica Diesel 10 Kva', 'vistas/img/productos/default/anonymous.png', 100, 3550, 4970, 0, '2025-06-29 03:40:45'),
	(38, 4, '403', 'Planta Electrica Diesel 20 Kva', 'vistas/img/productos/default/anonymous.png', 100, 3600, 5040, 1, '2025-06-29 03:40:45'),
	(39, 4, '404', 'Planta Electrica Diesel 30 Kva', 'vistas/img/productos/default/anonymous.png', 100, 3650, 5110, 0, '2025-06-29 03:40:45'),
	(40, 4, '405', 'Planta Electrica Diesel 60 Kva', 'vistas/img/productos/default/anonymous.png', 100, 3700, 5180, 1, '2025-06-29 03:40:45'),
	(41, 4, '406', 'Planta Electrica Diesel 75 Kva', 'vistas/img/productos/default/anonymous.png', 100, 3750, 5250, 0, '2025-06-29 03:40:45'),
	(42, 4, '407', 'Planta Electrica Diesel 100 Kva', 'vistas/img/productos/default/anonymous.png', 100, 3800, 5320, 0, '2025-06-29 03:40:45'),
	(43, 4, '408', 'Planta Electrica Diesel 120 Kva', 'vistas/img/productos/default/anonymous.png', 100, 3850, 5390, 8, '2025-06-29 03:40:45'),
	(44, 5, '501', 'Escalera de Tijera Aluminio ', 'vistas/img/productos/default/anonymous.png', 100, 350, 490, 0, '2025-06-29 03:40:45'),
	(45, 5, '502', 'Extension Electrica ', 'vistas/img/productos/default/anonymous.png', 100, 370, 518, 2, '2025-06-29 03:40:45'),
	(46, 5, '503', 'Gato tensor', 'vistas/img/productos/default/anonymous.png', 100, 380, 532, 2, '2025-06-29 03:40:45'),
	(47, 5, '504', 'Lamina Cubre Brecha ', 'vistas/img/productos/default/anonymous.png', 100, 380, 532, 0, '2025-06-29 03:40:45'),
	(48, 5, '505', 'Llave de Tubo', 'vistas/img/productos/default/anonymous.png', 100, 480, 672, 0, '2025-06-29 03:40:45'),
	(49, 5, '506', 'Manila por Metro', 'vistas/img/productos/default/anonymous.png', 100, 600, 840, 0, '2025-06-29 03:40:45'),
	(50, 5, '507', 'Polea 2 canales', 'vistas/img/productos/default/anonymous.png', 100, 900, 1260, 11, '2025-06-29 03:40:45'),
	(51, 5, '508', 'Tensor', 'vistas/img/productos/508/500.jpg', 100, 100, 140, 13, '2025-06-29 03:40:45'),
	(52, 5, '509', 'Bascula ', 'vistas/img/productos/509/878.jpg', 100, 130, 182, 8, '2025-06-29 03:40:45'),
	(53, 5, '510', 'Bomba Hidrostatica', 'vistas/img/productos/510/870.jpg', 100, 770, 1078, 12, '2025-06-29 03:40:45'),
	(54, 5, '511', 'Chapeta', 'vistas/img/productos/511/239.jpg', 99, 660, 924, 6, '2025-06-29 04:13:05'),
	(55, 5, '512', 'Cilindro muestra de concreto', 'vistas/img/productos/512/266.jpg', 99, 400, 560, 6, '2025-06-29 04:13:05'),
	(56, 5, '513', 'Cizalla de Palanca', 'vistas/img/productos/513/445.jpg', 99, 450, 630, 21, '2025-06-29 03:50:02'),
	(57, 5, '514', 'Cizalla de Tijera', 'vistas/img/productos/514/249.jpg', 99, 580, 812, 40, '2025-06-29 03:50:02'),
	(58, 5, '515', 'Coche llanta neumatica', 'vistas/img/productos/515/174.jpg', 99, 420, 588, 10, '2025-06-29 03:50:02'),
	(59, 5, '516', 'Cono slump', 'vistas/img/productos/516/228.jpg', 97, 140, 196, 16, '2025-06-29 04:12:26'),
	(60, 5, '517', 'Cortadora de Baldosin', 'vistas/img/productos/517/746.jpg', 96, 930, 1302, 38, '2025-06-29 04:11:54');

-- Volcando estructura para tabla sis_inventario.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla sis_inventario.sessions: ~4 rows (aproximadamente)
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('G1CHBsjjaNkap77zKOhbDrhTPfKOmbmPJxucATqF', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQlpXV0hQOVNERFdTSHBiOU9TNlpGb0psdURGdEt4UmRzV01RakNxVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745361432),
	('LaGjkZj64s7TNxODsy7KrvBkmGu3QtDLxkAizTVy', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVUZJYVFlZ092dmRuZzVvTW4xVXdvUk1jaExVNFBlT2VsZFpTaHMzdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745161034),
	('LulI4lelD1pbbaRrCWvoJ80xGcrYRxyk6Tm7qKmN', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOWF4UGdjSDAxeHJibjJ1cE9PT0VXQllkWXB3NW1ieURvWjdjeTNBMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1750376308),
	('Uu2mVCns1R9iEQSF2YzdBhAu7Ibe6LdUvTKfoEPM', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaXg4cDRURDNqOGdybTB0RHZQZGc4dGdtNUxIS0tYYTJFZ28zMWlaZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745174744);

-- Volcando estructura para tabla sis_inventario.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla sis_inventario.users: ~0 rows (aproximadamente)

-- Volcando estructura para tabla sis_inventario.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` text CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `usuario` text CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `password` text CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `perfil` text CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `foto` text CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `estado` int NOT NULL,
  `ultimo_login` datetime NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- Volcando datos para la tabla sis_inventario.usuarios: ~4 rows (aproximadamente)
INSERT INTO `usuarios` (`id`, `nombre`, `usuario`, `password`, `perfil`, `foto`, `estado`, `ultimo_login`, `fecha`) VALUES
	(1, 'Administrador', 'admin', '$2a$07$asxx54ahjppf45sd87a5auXBm1Vr2M1NV5t/zNQtGHGpS5fFirrbG', 'Administrador', 'vistas/img/usuarios/admin/191.jpg', 1, '2025-06-28 21:43:37', '2025-06-29 02:43:37'),
	(57, 'Juan Fernando Urrego', 'juan', '$2a$07$asxx54ahjppf45sd87a5auwRi.z6UsW7kVIpm0CUEuCpmsvT2sG6O', 'Vendedor', 'vistas/img/usuarios/juan/461.jpg', 1, '2018-02-06 16:58:50', '2019-06-20 20:28:19'),
	(59, 'Ana Gonzalez', 'ana', '$2a$07$asxx54ahjppf45sd87a5auLd2AxYsA/2BbmGKNk2kMChC3oj7V0Ca', 'Vendedor', 'vistas/img/usuarios/ana/260.png', 1, '2025-06-26 17:22:26', '2025-06-26 22:22:26');

-- Volcando estructura para tabla sis_inventario.ventas
CREATE TABLE IF NOT EXISTS `ventas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `codigo` int NOT NULL,
  `id_cliente` int NOT NULL,
  `id_vendedor` int NOT NULL,
  `productos` text CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `impuesto` float NOT NULL,
  `neto` float NOT NULL,
  `delivery_costo` int DEFAULT '0',
  `total` float NOT NULL,
  `metodo_pago` text CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `delivery` text CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- Volcando datos para la tabla sis_inventario.ventas: ~4 rows (aproximadamente)
INSERT INTO `ventas` (`id`, `codigo`, `id_cliente`, `id_vendedor`, `productos`, `impuesto`, `neto`, `delivery_costo`, `total`, `metodo_pago`, `fecha`, `delivery`) VALUES
	(108, 10001, 3, 1, '[{"id":"60","descripcion":"Cortadora de Baldosin","cantidad":"3","stock":"97","precio":"1302","total":"3906"}]', 0, 3906, 0, 3906, 'Efectivo', '2025-06-29 03:41:29', ''),
	(109, 10002, 4, 1, '[{"id":"59","descripcion":"Cono slump","cantidad":"1","stock":"99","precio":"196","total":"196"}]', 0, 196, 0, 196, 'Efectivo', '2025-06-29 03:42:19', ''),
	(111, 10003, 5, 1, '[{"id":"58","descripcion":"Coche llanta neumatica","cantidad":"1","stock":"99","precio":"588","total":"588"},{"id":"57","descripcion":"Cizalla de Tijera","cantidad":"1","stock":"99","precio":"812","total":"812"},{"id":"56","descripcion":"Cizalla de Palanca","cantidad":"1","stock":"99","precio":"630","total":"630"}]', 0, 2030, 0, 2030, 'Efectivo', '2025-06-29 03:49:37', ''),
	(114, 10004, 9, 1, '[{"id":"60","descripcion":"Cortadora de Baldosin","cantidad":"1","stock":"96","precio":"1302","total":"1302"},{"id":"59","descripcion":"Cono slump","cantidad":"1","stock":"98","precio":"196","total":"196"}]', 0, 1498, 0, 1498, 'Efectivo', '2025-06-29 03:51:47', ''),
	(116, 10005, 12, 1, '[{"id":"59","descripcion":"Cono slump","cantidad":"1","stock":"97","precio":"196","total":"196"}]', 0, 196, 0, 196, 'Efectivo', '2025-06-29 04:12:26', ''),
	(117, 10006, 7, 1, '[{"id":"55","descripcion":"Cilindro muestra de concreto","cantidad":"1","stock":"99","precio":"560","total":"560"},{"id":"54","descripcion":"Chapeta","cantidad":"1","stock":"99","precio":"924","total":"924"}]', 0, 1484, 0, 1484, 'Efectivo', '2025-06-29 04:13:06', '');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
