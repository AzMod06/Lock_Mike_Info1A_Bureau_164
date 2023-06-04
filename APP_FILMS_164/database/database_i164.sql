DROP DATABASE IF EXISTS database_i164;

CREATE DATABASE IF NOT EXISTS database_i164;

USE database_i164;

-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           8.0.30 - MySQL Community Server - GPL
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour database_i164
CREATE DATABASE IF NOT EXISTS `database_i164` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `database_i164`;

-- Listage de la structure de table database_i164. t_bureau
CREATE TABLE IF NOT EXISTS `t_bureau` (
  `id_bureau` int NOT NULL AUTO_INCREMENT,
  `Salle_bureau` varchar(50) NOT NULL DEFAULT '0',
  `Num_bureau` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_bureau`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Listage des données de la table database_i164.t_bureau : ~4 rows (environ)
INSERT INTO `t_bureau` (`id_bureau`, `Salle_bureau`, `Num_bureau`) VALUES
	(1, 'TROIS', 'UN'),
	(2, 'TROIS', 'DEUX'),
	(3, 'TROIS', 'TROIS'),
	(4, 'TROIS', 'QUATRE');

-- Listage de la structure de table database_i164. t_personne
CREATE TABLE IF NOT EXISTS `t_personne` (
  `id_pers` int NOT NULL AUTO_INCREMENT,
  `Prenom_pers` varchar(50) NOT NULL,
  `Nom_pers` varchar(50) NOT NULL,
  `Alias_pers` varchar(50) NOT NULL,
  PRIMARY KEY (`id_pers`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Listage des données de la table database_i164.t_personne : ~1 rows (environ)
INSERT INTO `t_personne` (`id_pers`, `Prenom_pers`, `Nom_pers`, `Alias_pers`) VALUES
	(1, 'Mike', 'Lock', 'LOC');

-- Listage de la structure de table database_i164. t_reservation
CREATE TABLE IF NOT EXISTS `t_reservation` (
  `id_reservation` int NOT NULL AUTO_INCREMENT,
  `date_reservation` date NOT NULL,
  `heure_reservation` time DEFAULT '00:00:00',
  `nom_reservation` varchar(50) DEFAULT '0',
  PRIMARY KEY (`id_reservation`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Listage des données de la table database_i164.t_reservation : ~1 rows (environ)
INSERT INTO `t_reservation` (`id_reservation`, `date_reservation`, `heure_reservation`, `nom_reservation`) VALUES
	(1, '2023-10-10', '00:00:00', 'loc');


-- Listage de la structure de table database_i164. t_res_pers
CREATE TABLE IF NOT EXISTS `t_res_pers` (
  `id_res_pers` int NOT NULL AUTO_INCREMENT,
  `fk_personne` int DEFAULT NULL,
  `fk_reservation` int DEFAULT NULL,
  PRIMARY KEY (`id_res_pers`),
  KEY `fk1_res_avoir_pers` (`fk_reservation`),
  KEY `fk_pers_avoir_res` (`fk_personne`),
  CONSTRAINT `fk1_res_avoir_pers` FOREIGN KEY (`fk_reservation`) REFERENCES `t_reservation` (`id_reservation`),
  CONSTRAINT `fk_pers_avoir_res` FOREIGN KEY (`fk_personne`) REFERENCES `t_personne` (`id_pers`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table database_i164.t_res_pers : ~0 rows (environ)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
