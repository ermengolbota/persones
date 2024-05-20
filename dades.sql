-- Dades
-- Adminer 4.8.1 MySQL 8.0.32 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;
DROP DATABASE IF EXISTS `persones`;
CREATE DATABASE `persones` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `persones`;

DROP TABLE IF EXISTS `noms`;
CREATE TABLE `noms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `noms` (`id`, `nom`) VALUES
(1,	'Anna'),
(2,	'Bernat'),
(3,	'Carme'),
(4,	'Albert'),
(5,	'Cristina');
