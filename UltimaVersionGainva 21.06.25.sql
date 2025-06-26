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


-- Volcando estructura de base de datos para bd_gainva
CREATE DATABASE IF NOT EXISTS `bd_gainva` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bd_gainva`;

-- Volcando estructura para tabla bd_gainva.almacen
CREATE TABLE IF NOT EXISTS `almacen` (
  `idAlmacen` int unsigned NOT NULL AUTO_INCREMENT,
  `zona` enum('PRINCIPAL','SECUNDARIO') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `idInsumo` int unsigned NOT NULL DEFAULT '0',
  `fecha_guardado` date NOT NULL,
  `cant_stock` int NOT NULL,
  `lote` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `fechaVencimiento` date DEFAULT NULL,
  `updated_at` varchar(50) DEFAULT NULL,
  `created_at` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idAlmacen`),
  KEY `idInsumo` (`idInsumo`),
  CONSTRAINT `idInsumo` FOREIGN KEY (`idAlmacen`) REFERENCES `insumos` (`idInsumo`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla bd_gainva.almacen: ~13 rows (aproximadamente)
INSERT INTO `almacen` (`idAlmacen`, `zona`, `idInsumo`, `fecha_guardado`, `cant_stock`, `lote`, `fechaVencimiento`, `updated_at`, `created_at`) VALUES
	(14, 'PRINCIPAL', 5, '2025-05-01', 10, '2211313', NULL, '2025-05-29 07:05:42', '2025-05-29 02:29:07'),
	(15, 'PRINCIPAL', 5, '2025-05-01', 14, '2211313-6', NULL, '2025-05-30 04:25:43', '2025-05-29 03:50:52'),
	(16, 'PRINCIPAL', 6, '2025-05-01', 986, '2131223b231', NULL, '2025-05-31 04:44:23', '2025-05-29 05:29:36'),
	(17, 'PRINCIPAL', 9, '2025-05-01', 0, '123132', NULL, '2025-05-30 14:50:55', '2025-05-30 14:49:14'),
	(18, 'PRINCIPAL', 9, '2025-05-01', 0, NULL, NULL, '2025-05-30 14:51:29', '2025-05-30 14:51:10'),
	(19, 'PRINCIPAL', 8, '2025-05-01', 551, NULL, NULL, '2025-05-31 05:39:25', '2025-05-31 04:57:55'),
	(20, 'PRINCIPAL', 8, '2025-06-01', 540, NULL, NULL, '2025-06-10 00:56:33', '2025-06-01 19:50:17'),
	(21, 'PRINCIPAL', 9, '2025-06-01', 0, '123132', NULL, '2025-06-01 19:50:21', '2025-06-01 19:50:21'),
	(22, 'PRINCIPAL', 9, '2025-06-01', 0, NULL, NULL, '2025-06-01 19:50:21', '2025-06-01 19:50:21'),
	(23, 'PRINCIPAL', 5, '2025-06-01', 10, '2211313', NULL, '2025-06-21 04:49:24', '2025-06-01 19:51:17'),
	(24, 'PRINCIPAL', 5, '2025-06-01', 489, '2211313-6', NULL, '2025-06-21 04:49:47', '2025-06-01 19:51:17'),
	(25, 'PRINCIPAL', 6, '2025-06-01', 976, '2131223b231', NULL, '2025-06-10 02:44:23', '2025-06-01 19:51:26'),
	(26, 'SECUNDARIO', 5, '2025-06-01', 1194, '211231221', NULL, '2025-06-01 19:59:30', '2025-06-01 19:59:07'),
	(27, 'PRINCIPAL', 5, '2025-06-01', 496, '2010212', NULL, '2025-06-21 04:50:02', '2025-06-10 00:53:54'),
	(28, 'PRINCIPAL', 5, '2025-06-01', 13, 'f012-123456', NULL, '2025-06-21 04:50:55', '2025-06-21 04:50:43');

-- Volcando estructura para tabla bd_gainva.control_cebado
CREATE TABLE IF NOT EXISTS `control_cebado` (
  `idControl` int NOT NULL AUTO_INCREMENT,
  `actualFecha` date DEFAULT NULL,
  `siguienteFecha` date DEFAULT NULL,
  `lote1` varchar(50) DEFAULT NULL,
  `cant1` int DEFAULT NULL,
  `lote2` varchar(50) DEFAULT NULL,
  `cant2` int DEFAULT NULL,
  `lote3` varchar(50) DEFAULT NULL,
  `cant3` int DEFAULT NULL,
  `lote4` varchar(50) DEFAULT NULL,
  `cant4` int DEFAULT NULL,
  `status` enum('Y','N','D') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `fk_insumos` int unsigned DEFAULT NULL,
  PRIMARY KEY (`idControl`),
  KEY `fk_insumos` (`fk_insumos`),
  CONSTRAINT `fk_insumos` FOREIGN KEY (`fk_insumos`) REFERENCES `insumos` (`idInsumo`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla bd_gainva.control_cebado: ~28 rows (aproximadamente)
INSERT INTO `control_cebado` (`idControl`, `actualFecha`, `siguienteFecha`, `lote1`, `cant1`, `lote2`, `cant2`, `lote3`, `cant3`, `lote4`, `cant4`, `status`, `updated_at`, `created_at`, `fk_insumos`) VALUES
	(1, '2025-06-11', '2025-06-12', '2010212', 5, NULL, NULL, NULL, NULL, NULL, NULL, 'N', '2025-06-11', '2025-06-11', 5),
	(3, '2025-06-20', '2025-06-21', NULL, NULL, '2211313-6', 7, NULL, NULL, NULL, NULL, 'N', '2025-06-20', '2025-06-20', 5),
	(4, '2025-06-20', '2025-06-21', NULL, NULL, '2211313-6', 4, NULL, NULL, NULL, NULL, 'N', '2025-06-20', '2025-06-20', 5),
	(5, '2025-06-20', '2025-06-21', NULL, NULL, '2010212', 5, NULL, NULL, NULL, NULL, 'N', '2025-06-20', '2025-06-20', 5),
	(6, '2025-06-20', '2025-06-21', NULL, NULL, '2211313-6', 1, NULL, NULL, NULL, NULL, 'N', '2025-06-20', '2025-06-20', 5),
	(7, '2025-06-21', '2025-06-23', NULL, NULL, '2010212', 1, NULL, NULL, NULL, NULL, 'N', '2025-06-21', '2025-06-21', 5),
	(8, '2025-06-21', '2025-06-23', NULL, NULL, '2211313-6', 1, NULL, NULL, NULL, NULL, 'N', '2025-06-21', '2025-06-21', 5),
	(9, '2025-06-21', '2025-06-23', NULL, NULL, '2010212', 1, NULL, NULL, NULL, NULL, 'N', '2025-06-21', '2025-06-21', 5),
	(10, '2025-06-21', '2025-06-23', NULL, NULL, '2211313-6', 1, NULL, NULL, NULL, NULL, 'N', '2025-06-21', '2025-06-21', 5),
	(11, '2025-06-21', '2025-06-23', NULL, NULL, '2010212', 1, NULL, NULL, NULL, NULL, 'N', '2025-06-21', '2025-06-21', 5),
	(12, '2025-06-21', '2025-06-23', NULL, NULL, '2211313-6', 1, NULL, NULL, NULL, NULL, 'N', '2025-06-21', '2025-06-21', 5),
	(13, '2025-06-21', '2025-06-23', NULL, NULL, '2010212', 1, NULL, NULL, NULL, NULL, 'N', '2025-06-21', '2025-06-21', 5),
	(14, '2025-06-21', '2025-06-23', NULL, NULL, '2211313-6', 1, NULL, NULL, NULL, NULL, 'N', '2025-06-21', '2025-06-21', 5),
	(15, '2025-06-21', '2025-06-23', NULL, NULL, '2010212', 1, NULL, NULL, NULL, NULL, 'N', '2025-06-21', '2025-06-21', 5),
	(16, '2025-06-21', '2025-06-23', NULL, NULL, '2211313-6', 1, NULL, NULL, NULL, NULL, 'N', '2025-06-21', '2025-06-21', 5),
	(17, '2025-06-21', '2025-06-23', NULL, NULL, '2010212', 1, NULL, NULL, NULL, NULL, 'N', '2025-06-21', '2025-06-21', 5),
	(18, '2025-06-21', '2025-06-23', NULL, NULL, '2211313-6', 1, NULL, NULL, NULL, NULL, 'N', '2025-06-21', '2025-06-21', 5),
	(19, '2025-06-21', '2025-06-23', NULL, NULL, '2010212', 1, NULL, NULL, NULL, NULL, 'N', '2025-06-21', '2025-06-21', 5),
	(20, '2025-06-21', '2025-06-23', NULL, NULL, '2211313-6', 1, NULL, NULL, NULL, NULL, 'N', '2025-06-21', '2025-06-21', 5),
	(21, '2025-06-21', '2025-06-23', NULL, NULL, '2010212', 1, NULL, NULL, NULL, NULL, 'N', '2025-06-21', '2025-06-21', 5),
	(22, '2025-06-21', '2025-06-23', NULL, NULL, '2211313-6', 1, NULL, NULL, NULL, NULL, 'N', '2025-06-21', '2025-06-21', 5),
	(23, '2025-06-21', '2025-06-23', NULL, NULL, '2010212', 1, NULL, NULL, NULL, NULL, 'N', '2025-06-21', '2025-06-21', 5),
	(24, '2025-06-21', '2025-06-23', NULL, NULL, '2211313-6', 1, NULL, NULL, NULL, NULL, 'N', '2025-06-21', '2025-06-21', 5),
	(25, '2025-06-21', '2025-06-23', NULL, NULL, '2010212', 1, NULL, NULL, NULL, NULL, 'N', '2025-06-21', '2025-06-21', 5),
	(26, '2025-06-21', '2025-06-23', NULL, NULL, '2211313-6', 1, NULL, NULL, NULL, NULL, 'N', '2025-06-21', '2025-06-21', 5),
	(27, '2025-06-21', '2025-06-23', '2010212', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'N', '2025-06-21', '2025-06-21', 5),
	(39, '2025-06-21', '2025-06-23', NULL, NULL, NULL, NULL, '2211313', 1, NULL, NULL, 'N', '2025-06-21', '2025-06-21', 5),
	(40, '2025-06-21', '2025-06-23', NULL, NULL, '2211313-6', 1, NULL, NULL, NULL, NULL, 'N', '2025-06-21', '2025-06-21', 5),
	(41, '2025-06-21', '2025-06-23', '2010212', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'N', '2025-06-21', '2025-06-21', 5),
	(42, '2025-06-21', '2025-06-23', NULL, NULL, NULL, NULL, NULL, NULL, 'f012-123456', 2, 'N', '2025-06-21', '2025-06-21', 5);

-- Volcando estructura para tabla bd_gainva.failed_jobs
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

-- Volcando datos para la tabla bd_gainva.failed_jobs: ~0 rows (aproximadamente)

-- Volcando estructura para tabla bd_gainva.insumos
CREATE TABLE IF NOT EXISTS `insumos` (
  `idInsumo` int unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) DEFAULT NULL,
  `descripcion` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `idKarness` int unsigned NOT NULL,
  `control_cebado` enum('Y','N') DEFAULT NULL,
  `control_emergencia` enum('Y','N') DEFAULT NULL,
  `almacenPrincipal` enum('Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `almacenSegundo` enum('Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  PRIMARY KEY (`idInsumo`),
  KEY `FKidKarness` (`idKarness`),
  CONSTRAINT `FKidKarness` FOREIGN KEY (`idKarness`) REFERENCES `karness` (`idKarness`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla bd_gainva.insumos: ~79 rows (aproximadamente)
INSERT INTO `insumos` (`idInsumo`, `Nombre`, `descripcion`, `idKarness`, `control_cebado`, `control_emergencia`, `almacenPrincipal`, `almacenSegundo`, `updated_at`, `created_at`) VALUES
	(1, 'Acido - A Galonera 4L', NULL, 1, 'N', 'N', 'N', 'Y', NULL, NULL),
	(2, 'ACIDO - B BICARBONATO  4L', NULL, 1, 'N', 'N', 'N', 'Y', NULL, NULL),
	(3, 'ACIDO - DIAFLEX', NULL, 1, 'N', 'N', 'N', 'Y', NULL, NULL),
	(4, 'BIG GAG', NULL, 1, 'N', 'N', 'N', 'Y', NULL, NULL),
	(5, 'SET DE LINEA', NULL, 1, 'Y', 'Y', 'Y', 'Y', NULL, NULL),
	(6, 'FILTRO 1.8', NULL, 1, 'Y', 'Y', 'Y', 'Y', NULL, NULL),
	(7, 'FILTRO 2.2', NULL, 1, 'Y', 'N', 'Y', 'Y', NULL, NULL),
	(8, 'EQUIPO DE VENOCLISIS', NULL, 1, 'N', 'N', 'Y', 'N', NULL, NULL),
	(9, 'FISTULA N°15', NULL, 1, 'N', 'N', 'Y', 'N', NULL, NULL),
	(10, 'FISTULA N°16', NULL, 1, 'N', 'N', 'Y', 'Y', NULL, NULL),
	(11, 'FISTULA N°17', NULL, 1, 'N', 'N', 'Y', 'N', NULL, NULL),
	(12, 'JERINGA 1CC', NULL, 1, 'N', 'N', 'Y', 'N', NULL, NULL),
	(13, 'JERINGA 3CC', NULL, 1, 'N', 'N', 'Y', 'N', NULL, NULL),
	(14, 'JERINGA 5CC', NULL, 1, 'N', 'N', 'Y', 'N', NULL, NULL),
	(15, 'JERINGA 10 CC', NULL, 1, 'N', 'N', 'Y', 'N', NULL, NULL),
	(16, 'JERINGA 20CC', NULL, 1, 'N', 'N', 'Y', 'N', NULL, NULL),
	(17, 'HEPARINA 1000', NULL, 1, 'N', 'N', 'Y', 'N', NULL, NULL),
	(18, 'HEPARINA 5000', NULL, 1, 'N', 'N', 'Y', 'N', NULL, NULL),
	(19, 'CLORURO 0.9 1- LITRO', NULL, 1, 'N', 'N', 'Y', 'N', NULL, NULL),
	(20, 'MASCARRILLA - SIMPLE', NULL, 1, 'N', 'N', 'Y', 'N', NULL, NULL),
	(21, 'GORRO', NULL, 1, 'N', 'N', 'Y', 'N', NULL, NULL),
	(22, 'GUANTES "S"', NULL, 1, 'N', 'N', 'Y', 'Y', NULL, NULL),
	(23, 'GUANTES "M"', NULL, 1, 'N', 'N', 'Y', 'N', NULL, NULL),
	(24, 'GUANTES 7 1 1/2', NULL, 1, 'N', 'N', 'Y', 'Y', NULL, NULL),
	(25, 'TEGGADER', NULL, 1, 'N', 'N', 'Y', 'N', NULL, NULL),
	(26, 'MICROPORE', NULL, 1, 'N', 'N', 'Y', 'N', NULL, NULL),
	(27, 'TRANSPORE', NULL, 1, 'N', 'N', 'Y', 'N', NULL, NULL),
	(28, 'BOLSA 10*15', NULL, 1, 'N', 'N', 'Y', 'N', NULL, NULL),
	(29, 'BOLSA 8*12', NULL, 1, 'N', 'N', 'Y', 'N', NULL, NULL),
	(30, 'BOLSA 14*20', NULL, 1, 'N', 'N', 'Y', 'N', NULL, NULL),
	(31, 'PAÑOS DE MAQUINA', NULL, 1, 'N', 'N', 'Y', 'N', NULL, NULL),
	(32, 'CLORURO 100 ML', NULL, 2, 'N', 'N', 'Y', 'Y', NULL, NULL),
	(33, 'PAPEL CREPADO', NULL, 2, 'N', 'N', 'Y', 'N', NULL, NULL),
	(34, 'PAPEL TOALLA Ó INTERFOLEADO', NULL, 2, 'N', 'N', 'Y', 'N', NULL, NULL),
	(35, 'GASA', NULL, 2, 'N', 'N', 'Y', 'N', NULL, NULL),
	(36, 'ALGODÓN HIDROFILICO', NULL, 2, 'N', 'N', 'Y', 'N', NULL, NULL),
	(37, 'ALCOHOL 1LITRO', NULL, 2, 'N', 'N', 'N', 'Y', NULL, NULL),
	(38, 'ALCOHOL EN GEL 70X500 ML', NULL, 2, 'N', 'N', 'Y', 'N', NULL, NULL),
	(39, 'HISTORIA CLINICA', NULL, 2, 'N', 'N', 'Y', 'N', NULL, NULL),
	(40, 'CLOREXIHIDINA Ó HIBICLEN 2%', NULL, 2, 'N', 'N', 'Y', 'N', NULL, NULL),
	(41, 'CLOREXIHIDINA Ó HIBICLEN 4%', NULL, 2, 'N', 'N', 'Y', 'N', NULL, NULL),
	(42, 'CAJA PUNZO CORTANTE', NULL, 2, 'N', 'N', 'Y', 'N', NULL, NULL),
	(43, 'CAJA PUNZO CORTANTE AMARILLO', NULL, 2, 'N', 'N', 'Y', 'N', NULL, NULL),
	(44, 'BENCINA', NULL, 2, 'N', 'N', 'Y', 'N', NULL, NULL),
	(45, 'MANDILES', NULL, 2, 'N', 'N', 'Y', 'N', NULL, NULL),
	(46, 'PAPEL BOND', NULL, 2, 'N', 'N', 'Y', 'N', NULL, NULL),
	(47, 'FILTRO DE CARBON', NULL, 2, 'N', 'N', 'Y', 'N', NULL, NULL),
	(48, 'FILTRO DE DIAFASE', NULL, 2, 'N', 'N', 'Y', 'N', NULL, NULL),
	(49, 'FILTRO 0.45', NULL, 2, 'N', 'N', 'Y', 'N', NULL, NULL),
	(50, 'FILTRO 0.02', NULL, 2, 'N', 'N', 'Y', 'N', NULL, NULL),
	(51, 'FILTRO MICRO N°5', NULL, 2, 'N', 'N', 'Y', 'N', NULL, NULL),
	(52, 'FILTRO DE SEDIMENTO -EMERGENCIA', NULL, 2, 'N', 'N', 'Y', 'N', NULL, NULL),
	(53, 'FILTRO CARTUCHO', NULL, 2, 'N', 'N', 'Y', 'N', NULL, NULL),
	(54, 'CINTA TESTIGO', NULL, 2, 'N', 'N', 'Y', 'N', NULL, NULL),
	(55, 'TEST DE BOWIE', NULL, 2, 'N', 'N', 'Y', 'N', '2025-06-02', NULL),
	(56, 'AGUJA N°18', NULL, 3, 'N', 'N', 'Y', 'N', NULL, NULL),
	(57, 'AGUJA N°21', NULL, 3, 'N', 'N', 'Y', 'N', NULL, NULL),
	(58, 'AGUJA N°25', NULL, 3, 'N', 'N', 'Y', 'N', NULL, NULL),
	(59, 'ABOCAT N°20', NULL, 3, 'N', 'N', 'Y', 'N', NULL, NULL),
	(60, 'ABOCAT N°18', NULL, 3, 'N', 'N', 'Y', 'N', NULL, NULL),
	(61, 'LLAVE DE TRIPLE VIA', NULL, 3, 'N', 'N', 'Y', 'N', NULL, NULL),
	(62, 'EPINEFRINA 1MG/ML', NULL, 3, 'N', 'N', 'Y', 'N', NULL, NULL),
	(63, 'BICARBONATO DE SODIO 8.4%', NULL, 3, 'N', 'N', 'Y', 'N', NULL, NULL),
	(64, 'PROTAMINA', NULL, 3, 'N', 'N', 'Y', 'N', NULL, NULL),
	(65, 'GLUCONATO DE CALCIO 10%', NULL, 3, 'N', 'N', 'Y', 'N', NULL, NULL),
	(66, 'DEXTROSA AL 33%', NULL, 3, 'N', 'N', 'Y', 'N', NULL, NULL),
	(67, 'DICLOFENACO 75MG/3ML', NULL, 3, 'N', 'N', 'Y', 'N', NULL, NULL),
	(68, 'DIMENHIDRINATO 50MG/5ML', NULL, 3, 'N', 'N', 'Y', 'N', NULL, NULL),
	(69, 'CLORFENAMINA', NULL, 3, 'N', 'N', 'Y', 'N', NULL, NULL),
	(70, 'HIOSCINA 20MG /ESCOPOLAMINA', NULL, 3, 'N', 'N', 'Y', 'N', NULL, NULL),
	(71, 'CAPTOPRIL TAB.', NULL, 3, 'N', 'N', 'Y', 'N', NULL, NULL),
	(72, 'PARACETAMOL 500 MG', NULL, 3, 'N', 'N', 'Y', 'N', NULL, NULL),
	(73, 'LOSARTAN POTASICO 50 MG X 100 TAB', NULL, 3, 'N', 'N', 'Y', 'N', NULL, NULL),
	(74, 'METAMIZOL X 1GR.AMP', NULL, 3, 'N', 'N', 'Y', 'N', NULL, NULL),
	(75, 'NIFEDIPINO DE 10 MG', NULL, 3, 'N', 'N', 'Y', 'N', NULL, NULL),
	(76, 'DEXAMETASONA 4MG AMP.', NULL, 3, 'N', 'N', 'Y', 'N', NULL, NULL),
	(77, 'DIAZEPAM 10 MG/2ML', NULL, 3, 'N', 'N', 'Y', 'N', NULL, NULL),
	(78, 'ACCU-CHEK', NULL, 3, 'N', 'N', 'Y', 'N', NULL, NULL),
	(79, 'HIDROCORTISONA SUCCINATO 250MG X 10 VIAL-PHARMAGEN', NULL, 3, 'N', 'N', 'Y', 'N', NULL, NULL);

-- Volcando estructura para tabla bd_gainva.karness
CREATE TABLE IF NOT EXISTS `karness` (
  `idKarness` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`idKarness`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla bd_gainva.karness: ~4 rows (aproximadamente)
INSERT INTO `karness` (`idKarness`, `nombre`) VALUES
	(1, 'ALTO'),
	(3, 'BAJO'),
	(2, 'MEDIO'),
	(4, 'OTRO');

-- Volcando estructura para tabla bd_gainva.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla bd_gainva.migrations: ~6 rows (aproximadamente)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(5, '2025_02_02_131917_create_permission_tables', 1),
	(6, '2025_02_02_235942_add_apellido_to_users_table', 2);

-- Volcando estructura para tabla bd_gainva.model_has_permissions
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla bd_gainva.model_has_permissions: ~0 rows (aproximadamente)

-- Volcando estructura para tabla bd_gainva.model_has_roles
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla bd_gainva.model_has_roles: ~2 rows (aproximadamente)
INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
	(1, 'App\\Models\\User', 2),
	(2, 'App\\Models\\User', 6);

-- Volcando estructura para tabla bd_gainva.movimiento_almacen
CREATE TABLE IF NOT EXISTS `movimiento_almacen` (
  `idMovimiento` int NOT NULL AUTO_INCREMENT,
  `fk_insumos` int unsigned NOT NULL,
  `fecha` date NOT NULL,
  `tipo_movimiento` enum('salida','entrada') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cant_movida` int NOT NULL,
  `stock` int DEFAULT NULL,
  `factu_o_boleta` varchar(50) DEFAULT NULL,
  `observacion` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `lote` varchar(50) DEFAULT NULL,
  `proveedor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `updated_at` varchar(50) DEFAULT NULL,
  `created_at` varchar(50) DEFAULT NULL,
  `almacen` enum('PRINCIPAL','SECUNDARIO') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`idMovimiento`),
  KEY `FKidInsumos` (`fk_insumos`),
  CONSTRAINT `FKidInsumos` FOREIGN KEY (`fk_insumos`) REFERENCES `insumos` (`idInsumo`)
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla bd_gainva.movimiento_almacen: ~68 rows (aproximadamente)
INSERT INTO `movimiento_almacen` (`idMovimiento`, `fk_insumos`, `fecha`, `tipo_movimiento`, `cant_movida`, `stock`, `factu_o_boleta`, `observacion`, `lote`, `proveedor`, `updated_at`, `created_at`, `almacen`) VALUES
	(58, 5, '2025-05-29', 'entrada', 3, NULL, NULL, '12313', '2211313', '121332', '2025-05-29 02:16:44', '2025-05-29 02:16:44', 'PRINCIPAL'),
	(65, 5, '2025-05-29', 'entrada', 3, NULL, NULL, '12313123dsdfsadf', '2211313', 'daadfadfadf', '2025-05-29 02:29:07', '2025-05-29 02:29:07', 'PRINCIPAL'),
	(66, 5, '2025-05-29', 'entrada', 3, NULL, NULL, '12313d', '2211313', '1231e', '2025-05-29 02:30:23', '2025-05-29 02:30:23', 'PRINCIPAL'),
	(67, 5, '2025-05-29', 'entrada', 5, NULL, NULL, '123123', '2211313', '123123', '2025-05-29 03:42:42', '2025-05-29 03:42:42', 'PRINCIPAL'),
	(68, 5, '2025-05-29', 'entrada', 3, NULL, NULL, 'eds', '2211313-6', 'ddsdsd', '2025-05-29 03:50:52', '2025-05-29 03:50:52', 'PRINCIPAL'),
	(70, 5, '2025-05-29', 'salida', 6, NULL, NULL, '12313', '2211313', NULL, '2025-05-29 05:26:40', '2025-05-29 05:26:40', 'PRINCIPAL'),
	(71, 5, '2025-05-29', 'salida', 5, NULL, NULL, '123213', '2211313', NULL, '2025-05-29 05:26:40', '2025-05-29 05:26:40', 'PRINCIPAL'),
	(72, 5, '2025-05-29', 'entrada', 5, NULL, NULL, '123123123', '2211313', '123123123', '2025-05-29 05:27:06', '2025-05-29 05:27:06', 'PRINCIPAL'),
	(73, 6, '2025-05-29', 'entrada', 1000, NULL, NULL, 'Entrada de filtros', '2131223b231', 'FRESENIUS', '2025-05-30 15:20:57', '2025-05-29 05:29:36', 'PRINCIPAL'),
	(74, 6, '2025-05-29', 'salida', 5, NULL, NULL, '123', '2131223b231', NULL, '2025-05-29 05:30:05', '2025-05-29 05:30:05', 'PRINCIPAL'),
	(75, 5, '2025-05-29', 'entrada', 5, NULL, NULL, '123123', '2211313', '123123', '2025-05-29 07:05:42', '2025-05-29 07:05:42', 'PRINCIPAL'),
	(76, 5, '2025-05-29', 'entrada', 5, NULL, NULL, '123123', '2211313-6', '123123', '2025-05-29 07:05:53', '2025-05-29 07:05:53', 'PRINCIPAL'),
	(77, 5, '2025-05-29', 'entrada', 5, NULL, NULL, '123123', '2211313-6', '123123', '2025-05-29 07:06:16', '2025-05-29 07:06:16', 'PRINCIPAL'),
	(78, 5, '2025-05-29', 'entrada', 5, NULL, '123123', '123123', '2211313-6', '123123', '2025-05-31 05:38:34', '2025-05-29 07:06:29', 'PRINCIPAL'),
	(82, 5, '2025-05-30', 'salida', 4, NULL, NULL, '123', '2211313-6', NULL, '2025-05-30 04:25:43', '2025-05-30 04:25:43', 'PRINCIPAL'),
	(84, 9, '2025-05-30', 'entrada', 5, NULL, NULL, '1231313', NULL, '12312323', '2025-05-30 14:51:10', '2025-05-30 14:51:10', 'PRINCIPAL'),
	(85, 9, '2025-05-30', 'salida', 5, NULL, NULL, '123', NULL, NULL, '2025-05-30 14:51:29', '2025-05-30 14:51:29', 'PRINCIPAL'),
	(86, 6, '2025-05-30', 'salida', 5, NULL, NULL, '123', '2131223b231', NULL, '2025-05-30 15:22:00', '2025-05-30 15:22:00', 'PRINCIPAL'),
	(90, 6, '2025-05-30', 'salida', 2, NULL, NULL, '31/05/2025 (I-II-III)', '2131223b231', NULL, '2025-05-31 04:43:45', '2025-05-31 04:43:45', 'PRINCIPAL'),
	(91, 6, '2025-05-31', 'salida', 2, NULL, NULL, '02/06/2025 (I-II-III)', '2131223b231', NULL, '2025-05-31 04:44:23', '2025-05-31 04:44:23', 'PRINCIPAL'),
	(92, 8, '2025-05-31', 'entrada', 550, NULL, NULL, 'ENTRADA DE INSUMOS', NULL, 'MEDICAD', '2025-05-31 04:57:55', '2025-05-31 04:57:55', 'PRINCIPAL'),
	(93, 8, '2025-05-31', 'salida', 3, NULL, NULL, '02/06/2025 (I-II-III)', NULL, NULL, '2025-05-31 04:58:10', '2025-05-31 04:58:10', 'PRINCIPAL'),
	(94, 8, '2025-05-31', 'entrada', 4, NULL, 'F001-12132', 'ENTRADA DE INSUMOS', NULL, 'MEDICAD', '2025-05-31 05:39:25', '2025-05-31 05:39:25', 'PRINCIPAL'),
	(95, 6, '2025-06-01', 'salida', 3, NULL, NULL, '02/06/2025 (I-II-III)', '2131223b231', NULL, '2025-06-01 19:51:40', '2025-06-01 19:51:40', 'PRINCIPAL'),
	(96, 5, '2025-06-01', 'salida', 4, NULL, NULL, '02/06/2025 (I-II-III)', '2211313', NULL, '2025-06-01 19:51:55', '2025-06-01 19:51:55', 'PRINCIPAL'),
	(97, 8, '2025-06-01', 'salida', 6, NULL, NULL, '02/06/2025 (I-II-III)', NULL, NULL, '2025-06-01 19:52:13', '2025-06-01 19:52:13', 'PRINCIPAL'),
	(99, 5, '2025-06-01', 'entrada', 1200, NULL, 'f011-12312', 'ENTRADA DE INSUMOS', '211231221', 'MEDICAD', '2025-06-01 19:59:07', '2025-06-01 19:59:07', 'SECUNDARIO'),
	(100, 5, '2025-06-01', 'salida', 6, NULL, NULL, '02/06/2025 (I-II-III)', '211231221', NULL, '2025-06-01 19:59:30', '2025-06-01 19:59:30', 'SECUNDARIO'),
	(101, 5, '2025-06-10', 'entrada', 123, NULL, 'F001-12132', 'ENTRADA DE INSUMOS', '2010212', 'MEDICAD', '2025-06-10 00:53:54', '2025-06-10 00:53:54', 'PRINCIPAL'),
	(105, 8, '2025-06-10', 'salida', 5, NULL, NULL, '11/06/2025 (I-II-III)', NULL, NULL, '2025-06-10 00:56:33', '2025-06-10 00:56:33', 'PRINCIPAL'),
	(108, 5, '2025-06-10', 'salida', 5, NULL, NULL, '11/06/2025 (I-II-III)', '2010212', NULL, '2025-06-10 00:59:48', '2025-06-10 00:59:48', 'PRINCIPAL'),
	(109, 6, '2025-06-10', 'salida', 7, NULL, NULL, '11/06/2025 (I-II-III)', '2131223b231', NULL, '2025-06-10 02:44:23', '2025-06-10 02:44:23', 'PRINCIPAL'),
	(110, 5, '2025-06-11', 'entrada', 400, NULL, '123123', 'ENTRADA DE INSUMOS', '2010212', 'Maximo', '2025-06-11 01:52:55', '2025-06-11 01:52:55', 'PRINCIPAL'),
	(112, 5, '2025-06-11', 'salida', 5, NULL, NULL, '12/06/2025 (I-II-III)', '2010212', NULL, '2025-06-11 01:59:07', '2025-06-11 01:59:07', 'PRINCIPAL'),
	(113, 5, '2025-06-20', 'salida', 6, NULL, NULL, '21/06/2025 (I-II-III)', '2211313', NULL, '2025-06-20 19:46:34', '2025-06-20 19:46:34', 'PRINCIPAL'),
	(118, 5, '2025-06-20', 'salida', 7, NULL, NULL, '21/06/2025 (I-II-III)', '2211313-6', NULL, '2025-06-20 20:49:05', '2025-06-20 20:49:05', 'PRINCIPAL'),
	(119, 5, '2025-06-20', 'salida', 4, NULL, NULL, '21/06/2025 (I-II-III)', '2211313-6', NULL, '2025-06-20 23:50:37', '2025-06-20 23:50:37', 'PRINCIPAL'),
	(120, 5, '2025-06-20', 'salida', 5, NULL, NULL, '21/06/2025 (I-II-III)', '2010212', NULL, '2025-06-20 23:50:56', '2025-06-20 23:50:56', 'PRINCIPAL'),
	(121, 5, '2025-06-20', 'salida', 1, NULL, NULL, '21/06/2025 (I-II-III)', '2211313-6', NULL, '2025-06-20 23:52:05', '2025-06-20 23:52:05', 'PRINCIPAL'),
	(122, 5, '2025-06-21', 'salida', 1, NULL, NULL, '23/06/2025 (I-II-III)', '2010212', NULL, '2025-06-21 00:09:11', '2025-06-21 00:09:11', 'PRINCIPAL'),
	(123, 5, '2025-06-21', 'salida', 1, NULL, NULL, '23/06/2025 (I-II-III)', '2211313-6', NULL, '2025-06-21 00:12:44', '2025-06-21 00:12:44', 'PRINCIPAL'),
	(124, 5, '2025-06-21', 'salida', 1, NULL, NULL, '23/06/2025 (I-II-III)', '2010212', NULL, '2025-06-21 00:14:08', '2025-06-21 00:14:08', 'PRINCIPAL'),
	(126, 5, '2025-06-21', 'salida', 1, NULL, NULL, '23/06/2025 (I-II-III)', '2211313-6', NULL, '2025-06-21 00:20:59', '2025-06-21 00:20:59', 'PRINCIPAL'),
	(127, 5, '2025-06-21', 'salida', 1, NULL, NULL, '23/06/2025 (I-II-III)', '2010212', NULL, '2025-06-21 00:30:39', '2025-06-21 00:30:39', 'PRINCIPAL'),
	(128, 5, '2025-06-21', 'entrada', 500, NULL, '123123', 'ENTRADA DE INSUMOS', '2211313-6', 'MEDICAD', '2025-06-21 00:33:18', '2025-06-21 00:33:18', 'PRINCIPAL'),
	(129, 5, '2025-06-21', 'salida', 1, NULL, NULL, '23/06/2025 (I-II-III)', '2211313-6', NULL, '2025-06-21 00:33:29', '2025-06-21 00:33:29', 'PRINCIPAL'),
	(130, 5, '2025-06-21', 'salida', 1, NULL, NULL, '23/06/2025 (I-II-III)', '2010212', NULL, '2025-06-21 00:51:02', '2025-06-21 00:51:02', 'PRINCIPAL'),
	(131, 5, '2025-06-21', 'salida', 1, NULL, NULL, '23/06/2025 (I-II-III)', '2211313-6', NULL, '2025-06-21 00:54:32', '2025-06-21 00:54:32', 'PRINCIPAL'),
	(132, 5, '2025-06-21', 'salida', 1, NULL, NULL, '23/06/2025 (I-II-III)', '2010212', NULL, '2025-06-21 00:57:48', '2025-06-21 00:57:48', 'PRINCIPAL'),
	(133, 5, '2025-06-21', 'salida', 1, NULL, NULL, '23/06/2025 (I-II-III)', '2211313-6', NULL, '2025-06-21 01:02:07', '2025-06-21 01:02:07', 'PRINCIPAL'),
	(134, 5, '2025-06-21', 'salida', 1, NULL, NULL, '23/06/2025 (I-II-III)', '2010212', NULL, '2025-06-21 01:06:00', '2025-06-21 01:06:00', 'PRINCIPAL'),
	(135, 5, '2025-06-21', 'entrada', 15, NULL, '123123', 'ENTRADA DE INSUMOS', '2211313', 'MEDICAD', '2025-06-21 01:07:21', '2025-06-21 01:07:21', 'PRINCIPAL'),
	(136, 5, '2025-06-21', 'salida', 1, NULL, NULL, '23/06/2025 (I-II-III)', '2211313-6', NULL, '2025-06-21 01:08:57', '2025-06-21 01:08:57', 'PRINCIPAL'),
	(137, 5, '2025-06-21', 'salida', 1, NULL, NULL, '23/06/2025 (I-II-III)', '2010212', NULL, '2025-06-21 01:15:18', '2025-06-21 01:15:18', 'PRINCIPAL'),
	(138, 5, '2025-06-21', 'salida', 1, NULL, NULL, '23/06/2025 (I-II-III)', '2211313-6', NULL, '2025-06-21 01:35:12', '2025-06-21 01:35:12', 'PRINCIPAL'),
	(139, 5, '2025-06-21', 'salida', 1, NULL, NULL, '23/06/2025 (I-II-III)', '2010212', NULL, '2025-06-21 01:43:43', '2025-06-21 01:43:43', 'PRINCIPAL'),
	(140, 5, '2025-06-21', 'salida', 1, NULL, NULL, '23/06/2025 (I-II-III)', '2211313-6', NULL, '2025-06-21 01:53:39', '2025-06-21 01:53:39', 'PRINCIPAL'),
	(141, 5, '2025-06-21', 'salida', 1, NULL, NULL, '23/06/2025 (I-II-III)', '2010212', NULL, '2025-06-21 01:56:02', '2025-06-21 01:56:02', 'PRINCIPAL'),
	(142, 5, '2025-06-21', 'salida', 1, NULL, NULL, '23/06/2025 (I-II-III)', '2211313-6', NULL, '2025-06-21 01:58:53', '2025-06-21 01:58:53', 'PRINCIPAL'),
	(143, 5, '2025-06-21', 'salida', 1, NULL, NULL, '23/06/2025 (I-II-III)', '2010212', NULL, '2025-06-21 02:01:10', '2025-06-21 02:01:10', 'PRINCIPAL'),
	(144, 5, '2025-06-21', 'salida', 1, NULL, NULL, '23/06/2025 (I-II-III)', '2211313-6', NULL, '2025-06-21 02:01:40', '2025-06-21 02:01:40', 'PRINCIPAL'),
	(145, 5, '2025-06-21', 'salida', 1, NULL, NULL, '23/06/2025 (I-II-III)', '2010212', NULL, '2025-06-21 02:02:39', '2025-06-21 02:02:39', 'PRINCIPAL'),
	(147, 5, '2025-06-21', 'salida', 1, NULL, NULL, '23/06/2025 (I-II-III)', '2211313-6', NULL, '2025-06-21 02:14:27', '2025-06-21 02:14:27', 'PRINCIPAL'),
	(148, 5, '2025-06-21', 'salida', 1, NULL, NULL, '23/06/2025 (I-II-III)', '2211313', NULL, '2025-06-21 02:17:19', '2025-06-21 02:17:19', 'PRINCIPAL'),
	(149, 5, '2025-06-21', 'salida', 1, NULL, NULL, '23/06/2025 (I-II-III)', '2211313', NULL, '2025-06-21 02:24:25', '2025-06-21 02:24:25', 'PRINCIPAL'),
	(151, 5, '2025-06-21', 'salida', 1, NULL, NULL, '23/06/2025 (I-II-III)', '2211313', NULL, '2025-06-21 02:51:18', '2025-06-21 02:51:18', 'PRINCIPAL'),
	(157, 5, '2025-06-21', 'salida', 1, NULL, NULL, '23/06/2025 (I-II-III)', '2211313', NULL, '2025-06-21 04:46:35', '2025-06-21 04:46:35', 'PRINCIPAL'),
	(158, 5, '2025-06-21', 'salida', 1, NULL, NULL, '23/06/2025 (I-II-III)', '2211313', NULL, '2025-06-21 04:49:24', '2025-06-21 04:49:24', 'PRINCIPAL'),
	(159, 5, '2025-06-21', 'salida', 1, NULL, NULL, '23/06/2025 (I-II-III)', '2211313-6', NULL, '2025-06-21 04:49:47', '2025-06-21 04:49:47', 'PRINCIPAL'),
	(160, 5, '2025-06-21', 'salida', 1, NULL, NULL, '23/06/2025 (I-II-III)', '2010212', NULL, '2025-06-21 04:50:02', '2025-06-21 04:50:02', 'PRINCIPAL'),
	(161, 5, '2025-06-21', 'entrada', 15, NULL, 'fv-1234', 'ENTRADA DE INSUMOS', 'f012-123456', 'MEDICAD', '2025-06-21 04:50:43', '2025-06-21 04:50:43', 'PRINCIPAL'),
	(162, 5, '2025-06-21', 'salida', 2, NULL, NULL, '23/06/2025 (I-II-III)', 'f012-123456', NULL, '2025-06-21 04:50:54', '2025-06-21 04:50:54', 'PRINCIPAL');

-- Volcando estructura para tabla bd_gainva.pacientes
CREATE TABLE IF NOT EXISTS `pacientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Nombre` int NOT NULL DEFAULT '0',
  `Apellido` int NOT NULL DEFAULT '0',
  `DNI` int NOT NULL DEFAULT '0',
  `Telefono` int NOT NULL DEFAULT '0',
  `Direccion` int NOT NULL DEFAULT '0',
  `Control` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla bd_gainva.pacientes: ~0 rows (aproximadamente)

-- Volcando estructura para tabla bd_gainva.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla bd_gainva.password_reset_tokens: ~0 rows (aproximadamente)

-- Volcando estructura para tabla bd_gainva.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla bd_gainva.permissions: ~23 rows (aproximadamente)
INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, 'users.index', 'web', '2025-02-04 04:40:36', '2025-02-04 04:40:36'),
	(2, 'users.create', 'web', '2025-02-04 04:40:36', '2025-02-04 04:40:36'),
	(3, 'users.edit', 'web', '2025-02-04 04:40:36', '2025-02-04 04:40:36'),
	(4, 'users.delete', 'web', '2025-02-04 04:40:36', '2025-02-04 04:40:36'),
	(5, 'almacen.index', 'web', '2025-06-02 17:50:10', '2025-06-02 17:50:11'),
	(6, 'almacen.create', 'web', '2025-06-02 17:50:22', '2025-06-02 17:50:23'),
	(7, 'almacen.edit', 'web', '2025-06-02 17:50:37', '2025-06-02 17:50:38'),
	(8, 'almacen.delete', 'web', '2025-06-02 17:50:49', '2025-06-02 17:50:50'),
	(9, 'control_cebado.index', 'web', '2025-06-02 17:51:30', '2025-06-02 17:51:30'),
	(10, 'control_cebado.create', 'web', '2025-06-02 17:51:45', '2025-06-02 17:51:46'),
	(11, 'control_cebado.edit', 'web', '2025-06-02 17:51:56', '2025-06-02 17:51:57'),
	(12, 'control_cebado.delete', 'web', '2025-06-02 17:52:02', '2025-06-02 17:52:03'),
	(13, 'inventario.index', 'web', '2025-06-02 17:52:46', '2025-06-02 17:52:47'),
	(14, 'inventario.create', 'web', '2025-06-02 17:53:00', '2025-06-02 17:53:03'),
	(15, 'inventario.edit', 'web', '2025-06-02 17:53:15', '2025-06-02 17:53:16'),
	(16, 'inventario.delete', 'web', '2025-06-02 17:53:39', '2025-06-02 17:53:40'),
	(17, 'permisos.index', 'web', '2025-06-02 17:54:54', '2025-06-02 17:54:55'),
	(18, 'permisos.create', 'web', '2025-06-02 17:55:14', '2025-06-02 17:55:15'),
	(19, 'permisos.edit', 'web', '2025-06-02 17:55:24', '2025-06-02 17:55:25'),
	(20, 'permisos.delete', 'web', '2025-06-02 17:55:36', '2025-06-02 17:55:37'),
	(21, 'role.index', 'web', '2025-06-02 17:55:55', '2025-06-02 17:55:56'),
	(22, 'role.create', 'web', '2025-06-02 17:56:07', '2025-06-02 17:56:08'),
	(23, 'role.edit', 'web', '2025-06-02 17:56:19', '2025-06-02 17:56:19'),
	(24, 'role.delete', 'web', '2025-06-02 17:56:31', '2025-06-02 17:56:31');

-- Volcando estructura para tabla bd_gainva.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla bd_gainva.personal_access_tokens: ~0 rows (aproximadamente)

-- Volcando estructura para tabla bd_gainva.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla bd_gainva.roles: ~2 rows (aproximadamente)
INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, 'Admin', 'web', '2025-02-03 07:58:40', '2025-02-03 07:58:40'),
	(2, 'Almacen', 'web', '2025-02-03 07:58:40', '2025-02-03 07:58:40'),
	(3, 'Tecnico', 'web', '2025-02-03 07:58:40', '2025-02-03 07:58:40');

-- Volcando estructura para tabla bd_gainva.role_has_permissions
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla bd_gainva.role_has_permissions: ~34 rows (aproximadamente)
INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 1),
	(6, 1),
	(7, 1),
	(8, 1),
	(9, 1),
	(10, 1),
	(11, 1),
	(12, 1),
	(13, 1),
	(14, 1),
	(15, 1),
	(16, 1),
	(17, 1),
	(18, 1),
	(19, 1),
	(20, 1),
	(21, 1),
	(22, 1),
	(23, 1),
	(24, 1),
	(5, 2),
	(6, 2),
	(7, 2),
	(8, 2),
	(9, 2),
	(10, 2),
	(11, 2),
	(12, 2),
	(13, 2),
	(14, 2),
	(15, 2),
	(16, 2);

-- Volcando estructura para tabla bd_gainva.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `dni` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `dni` (`dni`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla bd_gainva.users: ~2 rows (aproximadamente)
INSERT INTO `users` (`id`, `name`, `last_name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `dni`) VALUES
	(2, 'Administrador', 'admin2', 'admin2@gmail.com', NULL, '$2y$12$93KIJShWfVshdPvH50AxiOBeOapWpOlISuFXCMSznBqf4iLiDMkvy', NULL, '2025-02-03 05:35:33', '2025-05-29 12:01:20', NULL),
	(6, 'Juan', 'Perez', '2323@gmail.com', NULL, '$2y$12$1uGKlz7.mhy1VoDctXgiquFV1KvUqJ36j/RgObThAvlUpRhgWaFgG', NULL, '2025-05-06 19:23:23', '2025-06-02 22:58:51', NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
