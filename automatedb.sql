-- MySQL dump 10.13  Distrib 8.0.19, for macos10.15 (x86_64)
--
-- Host: localhost    Database: automatedb
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Machine`
--

DROP TABLE IF EXISTS `Machine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Machine` (
  `numeroSerie` varchar(15) NOT NULL,
  `type` int DEFAULT NULL,
  `adresseInstallation` varchar(100) DEFAULT NULL,
  `emplacement` varchar(20) DEFAULT NULL,
  `latitude` varchar(20) DEFAULT NULL,
  `longitude` varchar(20) DEFAULT NULL,
  `module` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`numeroSerie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Machine`
--

LOCK TABLES `Machine` WRITE;
/*!40000 ALTER TABLE `Machine` DISABLE KEYS */;
INSERT INTO `Machine` VALUES ('1FYVH2',1,'21 avenue jaures','Gare','49,4587E','34,5578N','T1'),('22G2JH',3,'21 boulevard periph','Terre-plein central','12,33133N','97,3212S','T2'),('3V22HK',2,'7 rue du ciel','Terre','49,45221','34,552222','T2'),('8YYV21',2,'2 rue de la tour','Rez-de-chaussee','45,45268S','87,26827N','T2'),('CHG34',2,'21 rue de paris','Magasin','45,45792N','34,55282S','T1'),('GJV332',2,'2 rue de dakar','Veranda','45,777322S','57,225621W','T2'),('GZZ712',2,'99 rue du londres','Big Ben','22,33321N','17,323311W','T2'),('HVZ622',1,'42 washington rue','Gare','12,3313W','57,2782N','T2'),('HZ622',3,'66 time square','Esplanade','22,32233N','76,67822W','T1'),('JGZ212',1,'21 avenue jaures','Ecole','49,4522N','12,98322W','T1');
/*!40000 ALTER TABLE `Machine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rapport`
--

DROP TABLE IF EXISTS `Rapport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Rapport` (
  `idRapport` int NOT NULL AUTO_INCREMENT,
  `numeroSerie` varchar(25) DEFAULT NULL,
  `dateRapport` date DEFAULT NULL,
  `enService` tinyint(1) DEFAULT NULL,
  `chiffreAffaires` double DEFAULT NULL,
  `etatActuel` varchar(25) DEFAULT NULL,
  `temperature` double DEFAULT NULL,
  `monnayeur` varchar(25) DEFAULT NULL,
  `cartesMagnetiques` varchar(25) DEFAULT NULL,
  `cartesSansContact` varchar(25) DEFAULT NULL,
  `erreurs` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idRapport`),
  KEY `mr` (`numeroSerie`),
  CONSTRAINT `mr` FOREIGN KEY (`numeroSerie`) REFERENCES `Machine` (`numeroSerie`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rapport`
--

LOCK TABLES `Rapport` WRITE;
/*!40000 ALTER TABLE `Rapport` DISABLE KEYS */;
INSERT INTO `Rapport` VALUES (1,'GJV332','2020-02-23',1,300.61,'attention',12,'vide','normal','erreur','Cartes sans contact'),(3,'CHG34','2020-02-23',0,210.6,'alarme',2,'vide','normal','erreur','Cartes � puce'),(5,'JGZ212','2020-02-23',0,110.6,'erreur',7,'normal','normal','normal','aucune'),(8,'22G2JH','2020-02-23',1,96.6,'ok',16,'normal','erreur','normal','cartes a puce'),(10,'HVZ622','2020-02-23',0,232.6,'ok',11,'vide','erreur','erreur','cartes sans contact, carte a puce'),(12,'GZZ712','2020-02-23',1,202.6,'attention',3,'plein','erreur','normal','aucune'),(14,'HZ622','2020-02-23',1,422.6,'ok',3,'normal','normal','erreur','cartes sans contact'),(16,'8YYV21','2020-02-23',1,313.21,'erreur',12,'normal','normal','erreur','cartes a puce'),(18,'1FYVH2','2020-02-23',0,113.21,'ok',7,'normal','normal','normal','aucune'),(20,'3V22HK','2020-02-23',1,313.21,'alarme',12,'normal','erreur','erreur','carte a puce, carte sans contact');
/*!40000 ALTER TABLE `Rapport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Note`
--

DROP TABLE IF EXISTS `Note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Note` (
  `idNote` int NOT NULL AUTO_INCREMENT,
  `numeroSerie` varchar(25) DEFAULT NULL,
  `dateIntervention` date DEFAULT NULL,
  `contenu` varchar(255) DEFAULT NULL,
  `auteur` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idNote`),
  KEY `mn` (`numeroSerie`),
  CONSTRAINT `mn` FOREIGN KEY (`numeroSerie`) REFERENCES `Machine` (`numeroSerie`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Note`
--

LOCK TABLES `Note` WRITE;
/*!40000 ALTER TABLE `Note` DISABLE KEYS */;
INSERT INTO `Note` VALUES (24,'1FYVH2','0018-08-13','bon etat','Jane Doe'),(25,'1FYVH2','0017-08-12','mauvais etat','Opta Jean'),(26,'1FYVH2','0011-08-13','probleme au niveau du ventilateur','Tech Doe');
/*!40000 ALTER TABLE `Note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Article`
--

DROP TABLE IF EXISTS `Article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Article` (
  `num` int NOT NULL AUTO_INCREMENT,
  `idRapport` int DEFAULT NULL,
  `nom` varchar(25) DEFAULT NULL,
  `prix` double DEFAULT NULL,
  `qstock` int DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `ra` (`idRapport`),
  CONSTRAINT `ra` FOREIGN KEY (`idRapport`) REFERENCES `Rapport` (`idRapport`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Article`
--

LOCK TABLES `Article` WRITE;
/*!40000 ALTER TABLE `Article` DISABLE KEYS */;
INSERT INTO `Article` VALUES (1,1,'lait',1.5,12),(2,1,'cafe',2.5,6),(3,1,'the',1.99,9),(7,3,'lait',1.5,2),(8,3,'chocolat',2.5,6),(9,3,'the',1.99,1),(13,5,'biere',1.5,2),(14,5,'coca-cola',2.5,6),(15,5,'ice tea',1.99,11),(22,8,'pain au chocolat',1.5,20),(23,8,'croissant',2.5,6),(24,8,'cookie',1.99,2),(28,10,'magnum',1.5,3),(29,10,'fuze tea',2.5,1),(30,10,'oasis',1.99,2),(31,10,'orangina',2.5,6),(32,10,'lipton',1.99,2),(38,12,'coffee',1.5,3),(39,12,'tea',2.5,1),(40,12,'hot chocolate',1.99,2),(41,12,'kinkeliba',2.5,3),(46,14,'pain raisin',1.5,10),(47,14,'madeleine',1.5,11),(48,14,'croissant amande',2.99,9),(52,16,'cafe',1.5,10),(53,16,'the',1.5,1),(54,16,'expresso',2.99,2),(58,18,'glace',1.5,5),(59,18,'mars',1.5,1),(60,18,'beer',2.99,2),(64,20,'cafe',1.5,13),(65,20,'lait chaud',1.5,11),(66,20,'the',2.99,12),(67,20,'mate',1.5,15),(68,20,'cafe touba',2.99,20);
/*!40000 ALTER TABLE `Article` ENABLE KEYS */;
UNLOCK TABLES;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-26  0:35:18
