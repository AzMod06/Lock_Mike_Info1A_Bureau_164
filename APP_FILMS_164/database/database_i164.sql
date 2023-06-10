DROP DATABASE IF EXISTS database_i164;

CREATE DATABASE IF NOT EXISTS database_i164;

USE lock_mike_info1a_bureau_164;

-- --------------------------------------------------------
-- Hôte:                         localhost
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


-- Listage de la structure de la base pour lock_mike_info1a_bureau_164
CREATE DATABASE IF NOT EXISTS `lock_mike_info1a_bureau_164` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `lock_mike_info1a_bureau_164`;

-- Listage de la structure de table lock_mike_info1a_bureau_164. t_bureau
CREATE TABLE IF NOT EXISTS `t_bureau` (
  `id_bureau` int NOT NULL AUTO_INCREMENT,
  `Salle_bureau` varchar(50) NOT NULL DEFAULT '0',
  `Num_bureau` int DEFAULT NULL,
  PRIMARY KEY (`id_bureau`),
  UNIQUE KEY `Num_bureau` (`Num_bureau`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- Listage des données de la table lock_mike_info1a_bureau_164.t_bureau : ~12 rows (environ)
INSERT INTO `t_bureau` (`id_bureau`, `Salle_bureau`, `Num_bureau`) VALUES
	(1, 'genève', 1),
	(2, 'genève', 2),
	(3, 'genève', 3),
	(4, 'genève', 4),
	(9, 'jura', 9),
	(11, 'paris', 14),
	(14, 'dubai', 24),
	(15, 'dubai', 23),
	(16, 'dubai', 22),
	(17, 'jura', 5),
	(19, 'jura', 10),
	(20, 'jura', 18);

-- Listage de la structure de table lock_mike_info1a_bureau_164. t_personne
CREATE TABLE IF NOT EXISTS `t_personne` (
  `id_pers` int NOT NULL AUTO_INCREMENT,
  `Prenom_pers` varchar(50) NOT NULL,
  `Nom_pers` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `Alias_pers` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id_pers`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Listage des données de la table lock_mike_info1a_bureau_164.t_personne : ~8 rows (environ)
INSERT INTO `t_personne` (`id_pers`, `Prenom_pers`, `Nom_pers`, `Alias_pers`) VALUES
	(1, 'Mike', 'Lock', 'LOC'),
	(2, 'Arthur', 'épédé', 'AEP'),
	(3, 'Patrik', 'Lacroix', 'PAL'),
	(4, 'Marlo', 'Delapraz', 'MDE'),
	(6, 'Piero', NULL, NULL),
	(9, 'Arthur', NULL, NULL),
	(10, 'Marcos', NULL, NULL);

-- Listage de la structure de table lock_mike_info1a_bureau_164. t_reservation
CREATE TABLE IF NOT EXISTS `t_reservation` (
  `id_reservation` int NOT NULL AUTO_INCREMENT,
  `fk_bureau` int DEFAULT NULL,
  `fk_personne` int NOT NULL,
  `date_reserv` date DEFAULT NULL,
  `heure_reserv` time DEFAULT NULL,
  `fk_num_bureau` int DEFAULT NULL,
  PRIMARY KEY (`id_reservation`) USING BTREE,
  KEY `FK_t_reservaton_t_bureau` (`fk_bureau`),
  KEY `FK_t_reservaton_t_bureauX` (`fk_num_bureau`),
  KEY `FK_t_reservaton_t_personne` (`fk_personne`),
  CONSTRAINT `FK_t_reservaton_t_bureau` FOREIGN KEY (`fk_bureau`) REFERENCES `t_bureau` (`id_bureau`),
  CONSTRAINT `FK_t_reservaton_t_bureauX` FOREIGN KEY (`fk_num_bureau`) REFERENCES `t_bureau` (`Num_bureau`),
  CONSTRAINT `FK_t_reservaton_t_personne` FOREIGN KEY (`fk_personne`) REFERENCES `t_personne` (`id_pers`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table lock_mike_info1a_bureau_164.t_reservation : ~2 rows (environ)
INSERT INTO `t_reservation` (`id_reservation`, `fk_bureau`, `fk_personne`, `date_reserv`, `heure_reserv`, `fk_num_bureau`) VALUES
	(1, 1, 4, '2023-06-04', '17:44:15', 4),
	(2, 3, 2, '2023-06-04', '17:44:30', 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
