-- OM 2021.02.17
-- FICHIER MYSQL POUR FAIRE FONCTIONNER LES EXEMPLES
-- DE REQUETES MYSQL
-- Database: database_i164

-- Destruction de la BD si elle existe.
-- Pour être certain d'avoir la dernière version des données

DROP DATABASE IF EXISTS database_i164;

-- Création d'un nouvelle base de donnée

CREATE DATABASE IF NOT EXISTS database_i164;

-- Utilisation de cette base de donnée

USE database_i164;
-- --------------------------------------------------------
-- Hôte :                        localhost
-- Version du serveur:           5.1.72-community - MySQL Community Server (GPL)
-- SE du serveur:                Win32
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Export de la structure de la base pour database_i164
CREATE DATABASE IF NOT EXISTS `database_i164` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `database_i164`;

-- Export de la structure de la table database_i164. t_bureau
CREATE TABLE IF NOT EXISTS `t_bureau` (
  `id_bureau` int(11) NOT NULL AUTO_INCREMENT,
  `Salle_bureau` varchar(50) NOT NULL DEFAULT '0',
  `Num_bureau` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_bureau`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Export de données de la table database_i164.t_bureau : ~4 rows (environ)
/*!40000 ALTER TABLE `t_bureau` DISABLE KEYS */;
INSERT INTO `t_bureau` (`id_bureau`, `Salle_bureau`, `Num_bureau`) VALUES
	(1, 'TROIS', 'UN'),
	(2, 'TROIS', 'DEUX'),
	(3, 'TROIS', 'TROIS'),
	(4, 'TROIS', 'QUATRE');
/*!40000 ALTER TABLE `t_bureau` ENABLE KEYS */;

-- Export de la structure de la table database_i164. t_mail
CREATE TABLE IF NOT EXISTS `t_mail` (
  `id_mail` int(11) NOT NULL AUTO_INCREMENT,
  `nom_mail` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_mail`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Export de données de la table database_i164.t_mail : ~2 rows (environ)
/*!40000 ALTER TABLE `t_mail` DISABLE KEYS */;
INSERT INTO `t_mail` (`id_mail`, `nom_mail`) VALUES
	(1, 'mike.lock@o-i.ch'),
	(2, 'patrik.dupont@o-i.ch');
/*!40000 ALTER TABLE `t_mail` ENABLE KEYS */;

-- Export de la structure de la table database_i164. t_personne
CREATE TABLE IF NOT EXISTS `t_personne` (
  `id_pers` int(11) NOT NULL AUTO_INCREMENT,
  `Prenom_pers` varchar(50) NOT NULL,
  `Nom_pers` varchar(50) NOT NULL,
  `Alias_pers` varchar(50) NOT NULL,
  PRIMARY KEY (`id_pers`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Export de données de la table database_i164.t_personne : ~1 rows (environ)
/*!40000 ALTER TABLE `t_personne` DISABLE KEYS */;
INSERT INTO `t_personne` (`id_pers`, `Prenom_pers`, `Nom_pers`, `Alias_pers`) VALUES
	(1, 'Mike', 'Lock', 'LOC');
/*!40000 ALTER TABLE `t_personne` ENABLE KEYS */;

-- Export de la structure de la table database_i164. t_reservation
CREATE TABLE IF NOT EXISTS `t_reservation` (
  `id_reservation` int(11) NOT NULL AUTO_INCREMENT,
  `date_reservation` date NOT NULL,
  `heure_reservation` time DEFAULT '00:00:00',
  `nom_reservation` varchar(50) DEFAULT '0',
  PRIMARY KEY (`id_reservation`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Export de données de la table database_i164.t_reservation : ~1 rows (environ)
/*!40000 ALTER TABLE `t_reservation` DISABLE KEYS */;
INSERT INTO `t_reservation` (`id_reservation`, `date_reservation`, `heure_reservation`, `nom_reservation`) VALUES
	(1, '2023-10-10', '00:00:00', 'loc');
/*!40000 ALTER TABLE `t_reservation` ENABLE KEYS */;

-- Export de la structure de la table database_i164. t_res_pers
CREATE TABLE IF NOT EXISTS `t_res_pers` (
  `id_res_pers` int(11) NOT NULL AUTO_INCREMENT,
  `fk_personne` int(11) DEFAULT NULL,
  `fk_reservation` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_res_pers`),
  KEY `fk1_res_avoir_pers` (`fk_reservation`),
  KEY `fk_pers_avoir_res` (`fk_personne`),
  CONSTRAINT `fk1_res_avoir_pers` FOREIGN KEY (`fk_reservation`) REFERENCES `t_reservation` (`id_reservation`),
  CONSTRAINT `fk_pers_avoir_res` FOREIGN KEY (`fk_personne`) REFERENCES `t_personne` (`id_pers`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Export de données de la table database_i164.t_res_pers : ~0 rows (environ)
/*!40000 ALTER TABLE `t_res_pers` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_res_pers` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
