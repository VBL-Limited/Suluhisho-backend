-- MySQL dump 10.13  Distrib 5.5.8, for Win32 (x86)
--
-- Host: localhost    Database: altech_rh
-- ------------------------------------------------------
-- Server version	5.5.8-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `aptitudephysique`
--

DROP TABLE IF EXISTS `aptitudephysique`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aptitudephysique` (
  `aptitudePhysiqueID` int(10) NOT NULL AUTO_INCREMENT,
  `employeID` int(10) NOT NULL,
  `nomMedecin` varchar(50) NOT NULL,
  `hopital` varchar(50) NOT NULL,
  `dateAptitude` date NOT NULL,
  PRIMARY KEY (`aptitudePhysiqueID`),
  KEY `employeToAptitude` (`employeID`),
  CONSTRAINT `employeToAptitude` FOREIGN KEY (`employeID`) REFERENCES `employe` (`employeID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aptitudephysique`
--

LOCK TABLES `aptitudephysique` WRITE;
/*!40000 ALTER TABLE `aptitudephysique` DISABLE KEYS */;
INSERT INTO `aptitudephysique` VALUES (1,13,'Deo MUKANDIRWA','HEAL AFRICA','2020-06-22'),(2,15,'Nsendele Michou','HEAL AFRICA','2020-08-12'),(3,16,'KAZADI MWEPU','Saint Martin Luther King','2019-10-04');
/*!40000 ALTER TABLE `aptitudephysique` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avance`
--

DROP TABLE IF EXISTS `avance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avance` (
  `avanceID` int(10) NOT NULL AUTO_INCREMENT,
  `contratID` int(10) NOT NULL,
  `motif` text,
  `montant` double DEFAULT NULL,
  `dateAvance` date NOT NULL,
  PRIMARY KEY (`avanceID`),
  KEY `contratToAvance` (`contratID`),
  CONSTRAINT `contratToAvance` FOREIGN KEY (`contratID`) REFERENCES `contrat` (`contratID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avance`
--

LOCK TABLES `avance` WRITE;
/*!40000 ALTER TABLE `avance` DISABLE KEYS */;
INSERT INTO `avance` VALUES (1,2,NULL,50,'2020-08-16'),(2,6,NULL,120,'2020-08-18'),(3,9,NULL,50,'2020-08-25'),(4,10,NULL,20,'2020-08-25'),(5,15,NULL,40,'2020-08-30'),(6,15,NULL,20,'2020-09-09');
/*!40000 ALTER TABLE `avance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avantage`
--

DROP TABLE IF EXISTS `avantage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avantage` (
  `avantageID` int(10) NOT NULL AUTO_INCREMENT,
  `nomAvantage` varchar(70) NOT NULL,
  PRIMARY KEY (`avantageID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avantage`
--

LOCK TABLES `avantage` WRITE;
/*!40000 ALTER TABLE `avantage` DISABLE KEYS */;
INSERT INTO `avantage` VALUES (1,'Transport'),(2,'Logement'),(3,'Soins de santé'),(4,'Allocation familiale');
/*!40000 ALTER TABLE `avantage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avantagefonction`
--

DROP TABLE IF EXISTS `avantagefonction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avantagefonction` (
  `avantageID` int(10) NOT NULL,
  `fonctionID` int(10) NOT NULL,
  `montant` double NOT NULL,
  PRIMARY KEY (`avantageID`,`fonctionID`),
  KEY `fonctionToavantage` (`fonctionID`),
  CONSTRAINT `avantageToFonction` FOREIGN KEY (`avantageID`) REFERENCES `avantage` (`avantageID`),
  CONSTRAINT `fonctionToavantage` FOREIGN KEY (`fonctionID`) REFERENCES `fonction` (`fonctionID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avantagefonction`
--

LOCK TABLES `avantagefonction` WRITE;
/*!40000 ALTER TABLE `avantagefonction` DISABLE KEYS */;
INSERT INTO `avantagefonction` VALUES (1,6,80),(1,7,40);
/*!40000 ALTER TABLE `avantagefonction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banque`
--

DROP TABLE IF EXISTS `banque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banque` (
  `banqueID` int(10) NOT NULL AUTO_INCREMENT,
  `nomBanque` varchar(40) NOT NULL,
  `adresse` text,
  `telephone` varchar(20) NOT NULL,
  PRIMARY KEY (`banqueID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banque`
--

LOCK TABLES `banque` WRITE;
/*!40000 ALTER TABLE `banque` DISABLE KEYS */;
INSERT INTO `banque` VALUES (1,'Trust Marshall Bank(TMB)','Rond poind Cikudu','09234512789'),(2,'Ecobank','N°48 Av du lac, Katindo, Goma','0982341234'),(3,'PAIDEK','Katindo','09234512789'),(4,'KCB Bank','Bujumbura','71803505');
/*!40000 ALTER TABLE `banque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bonus`
--

DROP TABLE IF EXISTS `bonus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bonus` (
  `bonusID` int(10) NOT NULL AUTO_INCREMENT,
  `contratID` int(10) NOT NULL,
  `categorie` int(1) NOT NULL,
  `motif` text,
  `montant` double DEFAULT NULL,
  `cree` date NOT NULL,
  `mois` int(2) DEFAULT NULL,
  `annee` year(4) DEFAULT NULL,
  PRIMARY KEY (`bonusID`),
  KEY `contratToBonus` (`contratID`),
  CONSTRAINT `contratToBonus` FOREIGN KEY (`contratID`) REFERENCES `contrat` (`contratID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bonus`
--

LOCK TABLES `bonus` WRITE;
/*!40000 ALTER TABLE `bonus` DISABLE KEYS */;
INSERT INTO `bonus` VALUES (1,8,1,'Employé(e) du mois',30,'2020-08-24',NULL,NULL),(2,9,1,'Employé(e) du mois',67,'2020-08-24',9,2019),(3,9,2,'Motivation',15,'2020-08-24',9,2019),(4,10,1,'Commission',50,'2020-08-25',8,2020),(5,6,1,'Commission',15,'2020-08-25',8,2020),(6,1,2,'Commission',50,'2020-09-09',6,2020),(7,5,2,'Commission',30,'2020-09-09',6,2020);
/*!40000 ALTER TABLE `bonus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comptebancaire`
--

DROP TABLE IF EXISTS `comptebancaire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comptebancaire` (
  `compteBancaireID` int(10) NOT NULL AUTO_INCREMENT,
  `employeID` int(10) NOT NULL,
  `banqueID` int(10) NOT NULL,
  `numero` varchar(50) NOT NULL,
  PRIMARY KEY (`compteBancaireID`),
  KEY `employeToCompte` (`employeID`),
  KEY `banqueToCompte` (`banqueID`),
  CONSTRAINT `banqueToCompte` FOREIGN KEY (`banqueID`) REFERENCES `banque` (`banqueID`),
  CONSTRAINT `employeToCompte` FOREIGN KEY (`employeID`) REFERENCES `employe` (`employeID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comptebancaire`
--

LOCK TABLES `comptebancaire` WRITE;
/*!40000 ALTER TABLE `comptebancaire` DISABLE KEYS */;
INSERT INTO `comptebancaire` VALUES (1,3,1,'32465656125365'),(2,4,2,'32402656125365'),(3,5,1,'384735947675658'),(4,6,1,'4375347865437547'),(5,7,2,'3253454645676'),(6,8,2,'45T454654656'),(7,9,1,'34953454366465'),(8,10,1,'75547567547'),(9,11,2,'4354354646'),(10,12,1,'3425453466'),(11,13,3,'3453753475755'),(12,14,1,'3453753475733'),(13,15,2,'2434254545555'),(14,16,1,'34757575757'),(15,17,2,'34583454376'),(16,18,1,'34583454376333');
/*!40000 ALTER TABLE `comptebancaire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuration`
--

DROP TABLE IF EXISTS `configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuration` (
  `configurationID` int(10) NOT NULL AUTO_INCREMENT,
  `nomEntreprise` varchar(40) NOT NULL,
  `smig` double NOT NULL,
  `taux` double NOT NULL,
  PRIMARY KEY (`configurationID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuration`
--

LOCK TABLES `configuration` WRITE;
/*!40000 ALTER TABLE `configuration` DISABLE KEYS */;
INSERT INTO `configuration` VALUES (1,'Altech',130,1700);
/*!40000 ALTER TABLE `configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conge`
--

DROP TABLE IF EXISTS `conge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conge` (
  `congeID` int(10) NOT NULL AUTO_INCREMENT,
  `contratID` int(10) NOT NULL,
  `typeConge` int(1) NOT NULL,
  `dateDebut` date NOT NULL,
  `dateFinI` date DEFAULT NULL,
  `dateFinR` date DEFAULT NULL,
  `nombreJours` int(2) DEFAULT NULL,
  `cree` date DEFAULT NULL,
  PRIMARY KEY (`congeID`),
  KEY `contratToConge` (`contratID`),
  CONSTRAINT `contratToConge` FOREIGN KEY (`contratID`) REFERENCES `contrat` (`contratID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conge`
--

LOCK TABLES `conge` WRITE;
/*!40000 ALTER TABLE `conge` DISABLE KEYS */;
INSERT INTO `conge` VALUES (1,8,1,'2020-08-24',NULL,NULL,7,'2020-08-24'),(2,6,3,'2020-08-25','2020-08-28',NULL,3,'2020-08-24');
/*!40000 ALTER TABLE `conge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contrat`
--

DROP TABLE IF EXISTS `contrat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contrat` (
  `contratID` int(10) NOT NULL AUTO_INCREMENT,
  `employeID` int(10) NOT NULL,
  `fonctionID` int(10) NOT NULL,
  `lieuID` int(10) NOT NULL,
  `dateSignature` date NOT NULL,
  `duree` int(10) DEFAULT NULL,
  `dateFin` date DEFAULT NULL,
  `typeContrat` int(1) DEFAULT NULL,
  `salaireBase` double DEFAULT NULL,
  `ipr` double DEFAULT NULL,
  `transport` double DEFAULT NULL,
  `categorie` int(1) DEFAULT NULL,
  `nbreEnfant` int(1) DEFAULT '0',
  PRIMARY KEY (`contratID`),
  KEY `fonctionToContrat` (`fonctionID`),
  KEY `employeToContrat` (`employeID`),
  KEY `lieuToContrat` (`lieuID`),
  CONSTRAINT `employeToContrat` FOREIGN KEY (`employeID`) REFERENCES `employe` (`employeID`),
  CONSTRAINT `fonctionToContrat` FOREIGN KEY (`fonctionID`) REFERENCES `fonction` (`fonctionID`),
  CONSTRAINT `lieuToContrat` FOREIGN KEY (`lieuID`) REFERENCES `lieuservice` (`lieuID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contrat`
--

LOCK TABLES `contrat` WRITE;
/*!40000 ALTER TABLE `contrat` DISABLE KEYS */;
INSERT INTO `contrat` VALUES (1,3,4,2,'2020-04-14',18,'2021-10-14',1,500,110,5000,2,3),(2,4,5,3,'2015-02-02',24,'2017-02-02',2,2200,90,20000,0,0),(3,1,1,3,'2020-08-17',NULL,NULL,0,500,60,20,2,0),(4,2,1,5,'2020-08-17',NULL,NULL,0,400,50,15,2,0),(5,5,6,6,'0000-00-00',12,'2021-09-08',0,350,70,1000,3,0),(6,6,3,2,'2019-08-01',0,'1970-01-01',2,400,70,10000,0,0),(7,7,6,1,'0000-00-00',0,'1970-01-01',2,350,34,1000,4,0),(8,8,3,6,'0000-00-00',24,'2022-09-08',1,400,76,30,0,0),(9,9,2,8,'0000-00-00',12,'2021-09-08',0,400,27,1000,4,0),(10,10,3,2,'2020-07-14',12,'2021-07-14',0,400,22,3000,3,0),(12,12,1,6,'2019-10-24',24,'2021-10-24',1,500,22.5,5000,2,0),(13,13,2,4,'2020-08-26',0,'1970-01-01',1,400,NULL,1000,0,0),(14,14,3,6,'2020-08-26',12,'2021-08-26',2,400,NULL,10000,1,0),(15,15,6,3,'2020-08-26',24,'2022-08-26',2,350,NULL,3000,5,0),(16,16,4,6,'2020-10-06',12,'2020-02-01',1,500,NULL,6500,0,0),(17,17,7,2,'2020-12-02',6,'2021-05-01',3,300,NULL,4000,NULL,0),(18,18,7,1,'2020-11-01',6,'2021-05-01',3,200,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `contrat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dette`
--

DROP TABLE IF EXISTS `dette`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dette` (
  `detteID` int(10) NOT NULL AUTO_INCREMENT,
  `contratID` int(10) NOT NULL,
  `description` text,
  `montant` double DEFAULT NULL,
  `dateDate` date NOT NULL,
  PRIMARY KEY (`detteID`),
  KEY `contratToDette` (`contratID`),
  CONSTRAINT `contratToDette` FOREIGN KEY (`contratID`) REFERENCES `contrat` (`contratID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dette`
--

LOCK TABLES `dette` WRITE;
/*!40000 ALTER TABLE `dette` DISABLE KEYS */;
INSERT INTO `dette` VALUES (1,2,'Achat panneau',300,'2020-08-16'),(2,1,'Torche avec panneau',20,'2020-08-16'),(3,9,'Télévision',110,'2020-08-25'),(4,5,'aCHAT KIT',10,'2020-08-25'),(5,15,'Achat kit',50,'2020-08-30'),(6,15,'Achat kit',26,'2020-09-09'),(7,9,'Achat kit',39,'2020-09-09');
/*!40000 ALTER TABLE `dette` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents` (
  `documentID` int(10) NOT NULL AUTO_INCREMENT,
  `employeID` int(10) NOT NULL,
  `fichier` text NOT NULL,
  PRIMARY KEY (`documentID`),
  KEY `employeToDocument` (`employeID`),
  CONSTRAINT `employeToDocument` FOREIGN KEY (`employeID`) REFERENCES `employe` (`employeID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` VALUES (1,4,'IMG_9323.PNG'),(2,3,'attestation_de_reussite_girbaud.png'),(3,3,'attestation_de_reussite_G3.jpeg'),(4,5,'english_learning_certificat.pdf'),(5,5,'diplome_d_Etat.pdf'),(6,6,'970972_694272567256073_1029728985_n.jpg'),(7,6,'9b656fbb462c4773b1534dcc8358302e.jpg'),(8,8,'p11_undp_Page-9.jpg'),(9,8,'p11_undp_Page-10.jpg'),(10,8,'p11_undp_Page-7.jpg'),(11,8,'p11_undp_Page-8.jpg'),(12,10,'p11_undp_Page-3.jpg'),(13,10,'p11_undp_Page-4.jpg'),(14,10,'p11_undp_Page-5.jpg'),(15,11,'p11_undp_Page-1.jpg'),(16,11,'p11_undp_Page-2.jpg'),(17,12,'p11_undp_Page-4.jpg'),(18,12,'p11_undp_Page-5.jpg'),(19,12,'p11_undp_Page-3.jpg'),(20,13,'Diplome.jpg'),(21,15,'Affiche A3.jpg');
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dossier`
--

DROP TABLE IF EXISTS `dossier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dossier` (
  `typeDocumentID` int(10) NOT NULL,
  `employeID` int(10) NOT NULL,
  `fichier` varchar(200) NOT NULL,
  `dateDepot` date NOT NULL,
  PRIMARY KEY (`employeID`,`typeDocumentID`),
  KEY `typeDocumentToDossier` (`typeDocumentID`),
  CONSTRAINT `employeToDossier` FOREIGN KEY (`employeID`) REFERENCES `employe` (`employeID`),
  CONSTRAINT `typeDocumentToDossier` FOREIGN KEY (`typeDocumentID`) REFERENCES `typedocument` (`typeDocumentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dossier`
--

LOCK TABLES `dossier` WRITE;
/*!40000 ALTER TABLE `dossier` DISABLE KEYS */;
/*!40000 ALTER TABLE `dossier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employe`
--

DROP TABLE IF EXISTS `employe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employe` (
  `employeID` int(10) NOT NULL AUTO_INCREMENT,
  `nom` varchar(40) NOT NULL,
  `postnom` varchar(40) NOT NULL,
  `prenom` varchar(40) NOT NULL,
  `dateNaissance` date NOT NULL,
  `adresse` text,
  `sexe` enum('H','F') DEFAULT NULL,
  `etatCivil` varchar(40) DEFAULT NULL,
  `tel` varchar(15) DEFAULT NULL,
  `nationalite` varchar(40) DEFAULT NULL,
  `codeAgent` varchar(40) NOT NULL,
  `cni` varchar(20) NOT NULL,
  `photo` varchar(150) DEFAULT NULL,
  `cnss` varchar(22) NOT NULL,
  `nbreEnfant` int(2) DEFAULT NULL,
  `lieuNaissance` varchar(50) DEFAULT NULL,
  `dateEngagement` date DEFAULT NULL,
  PRIMARY KEY (`employeID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employe`
--

LOCK TABLES `employe` WRITE;
/*!40000 ALTER TABLE `employe` DISABLE KEYS */;
INSERT INTO `employe` VALUES (1,'Nuamosi','Diakaban','Girbaud','1988-12-18','Goma, Nord-Kivu','H','Marié','0970536724','Congolaise','374654QQ','EGFG348348','1597677709.png','',NULL,NULL,NULL),(2,'Ruhindwa','Rwanyumba','Crispin','1986-03-04','Katindo','H','Célibataire','0993456123','Congolaise','295410','1264.969','1597677829.png','',NULL,NULL,NULL),(3,'Musole','Nelly','Aline','1992-10-19','Rond poind Cikudu','F','Marié(e)','0993456123','Congolaise','492712','346534','1597676343.png','546748646546',NULL,'','2020-04-14'),(4,'Nungidi','Diakabana','Ily','2020-02-13','N°48 Av du lac, Katindo, Goma','F','Célibataire','0993416123','','734003/2020','3632HG','1599738538.png','3485485SSS',NULL,'','2015-02-02'),(5,'Sonsa','Yobi','Moïse','1998-05-11','Rond poind Cikudu','','','0921232345','Congolaise','719423/2020','32454HF','1597681625.png','384585',NULL,'','0000-00-00'),(6,'BELAMIE','ROSALIE','MWEPU','1988-04-13','Rond poind Cikudu','','','0994132965','Congolaise','905716/2020','347347','1597760244.png','4385438AZ',NULL,'','2019-08-01'),(7,'Kufuemisa','Diluwa','Sephora','1995-03-12','N°48 Av du lac, Katindo, Goma','','','0993456129','Congolaise','762332/2020','23743DDF','1598193487.png','547567AZZ',NULL,'','0000-00-00'),(8,'Musoro','Cubaka','Aubin','1989-03-29','N°48 Av du lac, Katindo, Goma','','','0921345234','Congolaise','815204/2020','454646','1598193443.png','45735AZZ',NULL,'','0000-00-00'),(9,'Axella','Shimwe','Tatiana','1990-06-10','Rond poind Cikudu','','','0923412345','Congolaise','640242/2020','485454','1598262211.png','3454364',NULL,'','0000-00-00'),(10,'SADI','BARAKA','BERNARD','1992-02-06','Rond poind Cikudu','','','0997323243','Congolaise','715614/2020','8845845349','1598361345.png','485854',NULL,'','2020-07-14'),(11,'KOMBI','WASINGYA','THANKS','2000-09-11','N°48 Av du lac, Katindo, Goma','','','092345432','Congolaise','805125/2020','RDGHG4R54','1598365614.png','54654765',NULL,'','2020-09-09'),(12,'BAGUMA','OMBENI','Alain','1990-07-12','Rond poind Cikudu','','','0993456129','Congolaise','290729/2020','325345345','1598365778.png','5685654864554',NULL,'','2019-10-24'),(13,'Kabongo','Amina','Exaucée','2000-03-26','Katindo','','','0923412345','Congolaise','534941/2020','32483','1598442472.png','85468565868778',NULL,'','2020-08-26'),(14,'Diakabana','Kabongo','Daniel','1995-04-23','Rond poind Cikudu','','','0923412341','Congolaise','125745/2020','32483QQ','1598442403.png','85468565868234',NULL,'','2020-08-26'),(15,'Lokemba','Mayele','Charlie','1989-06-04','N°48 Av du lac, Katindo, Goma','','','0991345123','','468956/2020','234235','1598625034.png','2929292911QS',NULL,'','2020-08-26'),(16,'ISSA','IBENGA','Issa','1986-04-11','Lubmubashi','H','Marié(e)','0987563412','Congolaise','950707/2020','347765767','default.jpg','47575757547',NULL,'Lubumbashi','2019-02-01'),(17,'Kashara','Balumisa','Blaise','1987-09-24','Katindo av du lac N°51','H','Célibataire','0813452334','Congolaise','213952/2020','5485854845','default.jpg','546657',NULL,'Bukavu','2020-11-01'),(18,'Mazimpaka','Byamungu','Arsène','1987-09-13','Rond poind Cikudu','','','0813451334','','130455/2020','5485854845AA','default.jpg','54AA6657',NULL,'','2020-11-01');
/*!40000 ALTER TABLE `employe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fonction`
--

DROP TABLE IF EXISTS `fonction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fonction` (
  `fonctionID` int(10) NOT NULL AUTO_INCREMENT,
  `nomFonction` varchar(70) NOT NULL,
  `salaireBase` double DEFAULT NULL,
  `fraisTransport` double DEFAULT NULL,
  `categorieAgent` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`fonctionID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fonction`
--

LOCK TABLES `fonction` WRITE;
/*!40000 ALTER TABLE `fonction` DISABLE KEYS */;
INSERT INTO `fonction` VALUES (1,'Administrative & Finance  Assistant.\n',500,NULL,NULL),(2,'Finance Assistant - CashBook',400,NULL,NULL),(3,'Customer support Assistant',400,NULL,NULL),(4,'Zonal Products & Logistics Manager',500,6500,'Agent de maitrise classe 2'),(5,'Zonal Sales Manager',2200,NULL,NULL),(6,'Logistics & Products Manage',350,NULL,NULL),(7,'Loan assistant',200,4000,'Travailleur qualifié');
/*!40000 ALTER TABLE `fonction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `heuressup`
--

DROP TABLE IF EXISTS `heuressup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `heuressup` (
  `heuresSupID` int(10) NOT NULL AUTO_INCREMENT,
  `contratID` int(10) NOT NULL,
  `nombreHeures` int(2) NOT NULL,
  `cree` date NOT NULL,
  PRIMARY KEY (`heuresSupID`),
  KEY `contratToHeures` (`contratID`),
  CONSTRAINT `contratToHeures` FOREIGN KEY (`contratID`) REFERENCES `contrat` (`contratID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `heuressup`
--

LOCK TABLES `heuressup` WRITE;
/*!40000 ALTER TABLE `heuressup` DISABLE KEYS */;
INSERT INTO `heuressup` VALUES (1,5,0,'2020-07-11');
/*!40000 ALTER TABLE `heuressup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lieuservice`
--

DROP TABLE IF EXISTS `lieuservice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lieuservice` (
  `lieuID` int(10) NOT NULL AUTO_INCREMENT,
  `nomLieu` varchar(70) NOT NULL,
  `adreseBureau` varchar(70) NOT NULL,
  `telBureau` varchar(20) NOT NULL,
  PRIMARY KEY (`lieuID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lieuservice`
--

LOCK TABLES `lieuservice` WRITE;
/*!40000 ALTER TABLE `lieuservice` DISABLE KEYS */;
INSERT INTO `lieuservice` VALUES (1,'Bukavu','Labotte','0997536725'),(2,'Goma','Katindo','0992114541'),(3,'Kinshasa','Ngaliema','08123456789'),(4,'Kisangani','Place de la paix','0972926743'),(5,'Bujumbura','Kibenga','08515537155'),(6,'Lumbubashi','Coin des sages','08515537155'),(7,'Mbuji Mayi','Rond point coideaux','0992034541'),(8,'Kalemie','Dave','0987234561'),(9,'Congo Central','Avenue du fleuve','0983451234');
/*!40000 ALTER TABLE `lieuservice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membrefamille`
--

DROP TABLE IF EXISTS `membrefamille`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `membrefamille` (
  `membreFamilleID` int(10) NOT NULL AUTO_INCREMENT,
  `employeID` int(10) NOT NULL,
  `noms` varchar(50) NOT NULL,
  `lieuNaissance` varchar(50) NOT NULL,
  `dateNaissance` date NOT NULL,
  `parente` int(1) NOT NULL,
  PRIMARY KEY (`membreFamilleID`),
  KEY `employeToMembreFamille` (`employeID`),
  CONSTRAINT `employeToMembreFamille` FOREIGN KEY (`employeID`) REFERENCES `employe` (`employeID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membrefamille`
--

LOCK TABLES `membrefamille` WRITE;
/*!40000 ALTER TABLE `membrefamille` DISABLE KEYS */;
INSERT INTO `membrefamille` VALUES (1,13,'Aristote Lupunga','Kinshasa','2015-04-05',1),(2,13,'Génereuse Ruteyi','Uvira','2018-08-11',1),(3,12,'Blaise Kinyalolo','Bukavu','2017-02-10',1),(4,12,'Larissa Bahati','Bukavu','0206-03-23',1),(5,14,'Alice Badisungu','Goma','2001-03-18',2),(6,14,'Tresor Bahati','Kinshasa','2019-07-12',1),(7,15,'Aristote Tshimwanga','Goma','2015-07-15',1),(8,15,'Jojo Kakuse','Kinshasa','2017-07-15',1),(9,16,'Mufalme IBENGA','Lubumbashi','2008-03-12',1),(10,16,'Miriam MUSAU BUKOPO','Lubumbashi','1988-03-12',2),(11,16,'Sifa Béatrice','Goma','2018-03-12',1);
/*!40000 ALTER TABLE `membrefamille` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paie`
--

DROP TABLE IF EXISTS `paie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paie` (
  `paieID` int(10) NOT NULL AUTO_INCREMENT,
  `contratID` int(10) NOT NULL,
  `datePaie` date NOT NULL,
  `mois` int(2) NOT NULL,
  `annee` year(4) NOT NULL,
  `ecart` double DEFAULT NULL,
  `ipr` double DEFAULT NULL,
  `salaireBase` double DEFAULT NULL,
  `salaireBrut` double DEFAULT NULL,
  `salaireNet` double DEFAULT NULL,
  `salaireNetImposable` double DEFAULT NULL,
  `qpo` double DEFAULT NULL,
  `logement` double DEFAULT NULL,
  `qpp` double DEFAULT NULL,
  `transport` double DEFAULT NULL,
  `joursPrestes` int(2) DEFAULT NULL,
  `baseDGI` double DEFAULT NULL,
  `qppRisq` double DEFAULT NULL,
  `qppFam` double DEFAULT NULL,
  `allocationFam` double DEFAULT NULL,
  `nbreEnfant` int(2) DEFAULT NULL,
  `bonus` double DEFAULT NULL,
  `montantDu` double DEFAULT NULL,
  `dettes` double DEFAULT NULL,
  `avances` double DEFAULT NULL,
  `netApaye` double DEFAULT NULL,
  `inpp` double DEFAULT NULL,
  `onem` double DEFAULT NULL,
  `ir` double DEFAULT NULL,
  `taux` double DEFAULT NULL,
  PRIMARY KEY (`paieID`),
  KEY `contratToPaie` (`contratID`),
  CONSTRAINT `contratToPaie` FOREIGN KEY (`contratID`) REFERENCES `contrat` (`contratID`)
) ENGINE=InnoDB AUTO_INCREMENT=1028 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paie`
--

LOCK TABLES `paie` WRITE;
/*!40000 ALTER TABLE `paie` DISABLE KEYS */;
INSERT INTO `paie` VALUES (656,1,'2020-08-25',9,2019,NULL,110,1564.5,2274.5,2200,1490,74.5,660,74.5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(657,2,'2020-08-25',9,2019,NULL,90,556.5,826.5,800,530,26.5,240,26.5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(658,3,'2020-08-25',9,2019,NULL,60,346.5,516.5,500,330,16.5,150,16.5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(659,4,'2020-08-25',9,2019,NULL,50,278.25,413.25,400,265,13.25,120,13.25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(660,5,'2020-08-25',9,2019,NULL,70,488.25,723.25,700,465,23.25,210,23.25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(661,6,'2020-08-25',9,2019,NULL,70,488.25,723.25,700,465,23.25,210,23.25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(662,7,'2020-08-25',9,2019,NULL,34,171.15,258.15,250,163,8.15,75,8.15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(663,8,'2020-08-25',9,2019,NULL,76,512.4,764.4,740,488,24.4,222,24.4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(664,9,'2020-08-25',9,2019,NULL,27,205.8,309.8,300,196,9.8,90,9.8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(899,1,'2020-09-08',1,2020,NULL,75948.738,367.5,517.5,500,350,17.5,150,17.5,0,NULL,332.5,5.25,22.75,10050,0,0,0,20,0,10547.5,10.5,0.7,0,2010),(900,1,'2020-09-08',13,2019,NULL,0,30.625,43.125,41.666666666667,29.166666666667,1.4583333333333,12.5,1.4583333333333,0,NULL,27.708333333333,0.4375,1.8958333333333,10050,0,0,0,20,0,10073.125,0.875,0.058333333333333,0,2010),(901,2,'2020-09-08',13,2019,NULL,12457.863,134.75,189.75,183.33333333333,128.33333333333,6.4166666666667,55,6.4166666666667,0,NULL,121.91666666667,1.925,8.3416666666667,10050,0,0,0,300,50,9889.75,3.85,0.25666666666667,32.083333333333,2010),(902,3,'2020-09-08',13,2019,NULL,0,30.625,43.125,41.666666666667,29.166666666667,1.4583333333333,12.5,1.4583333333333,0,NULL,27.708333333333,0.4375,1.8958333333333,10050,0,0,0,0,0,10093.125,0.875,0.058333333333333,0,2010),(903,4,'2020-09-08',13,2019,NULL,0,24.5,34.5,33.333333333333,23.333333333333,1.1666666666667,10,1.1666666666667,0,NULL,22.166666666667,0.35,1.5166666666667,10050,0,0,0,0,0,10084.5,0.7,0.046666666666667,0,2010),(904,5,'2020-09-08',13,2019,NULL,0,21.4375,30.1875,29.166666666667,20.416666666667,1.0208333333333,8.75,1.0208333333333,0,NULL,19.395833333333,0.30625,1.3270833333333,10050,0,0,0,10,0,10070.1875,0.6125,0.040833333333333,0,2010),(905,6,'2020-09-08',13,2019,NULL,0,24.5,34.5,33.333333333333,23.333333333333,1.1666666666667,10,1.1666666666667,0,NULL,22.166666666667,0.35,1.5166666666667,10050,0,0,0,0,120,9964.5,0.7,0.046666666666667,0,2010),(906,7,'2020-09-08',13,2019,NULL,0,21.4375,30.1875,29.166666666667,20.416666666667,1.0208333333333,8.75,1.0208333333333,0,NULL,19.395833333333,0.30625,1.3270833333333,10050,0,0,0,0,0,10080.1875,0.6125,0.040833333333333,0,2010),(907,8,'2020-09-08',13,2019,NULL,0,24.5,34.5,33.333333333333,23.333333333333,1.1666666666667,10,1.1666666666667,0,NULL,22.166666666667,0.35,1.5166666666667,10050,0,0,0,0,0,10084.5,0.7,0.046666666666667,0,2010),(908,9,'2020-09-08',13,2019,NULL,0,24.5,34.5,33.333333333333,23.333333333333,1.1666666666667,10,1.1666666666667,0,NULL,22.166666666667,0.35,1.5166666666667,10050,0,0,0,110,50,9924.5,0.7,0.046666666666667,0,2010),(909,10,'2020-09-08',13,2019,NULL,0,0,0,0,0,0,0,0,0,NULL,0,0,0,10050,0,0,0,0,20,10030,0,0,0,2010),(910,12,'2020-09-08',13,2019,NULL,0,0,0,0,0,0,0,0,0,NULL,0,0,0,10050,2,0,0,0,0,10050,0,0,0,2010),(911,13,'2020-09-08',13,2019,NULL,0,0,0,0,0,0,0,0,0,NULL,0,0,0,10050,2,0,0,0,0,10050,0,0,0,2010),(912,14,'2020-09-08',13,2019,NULL,0,0,0,0,0,0,0,0,0,NULL,0,0,0,10050,1,0,0,0,0,10050,0,0,0,2010),(913,15,'2020-09-08',13,2019,NULL,0,0,0,0,0,0,0,0,0,NULL,0,0,0,10050,2,0,0,50,40,9960,0,0,0,2010),(914,1,'2020-09-08',2,2020,NULL,75948.738,367.5,517.5,500,350,17.5,150,17.5,0,NULL,332.5,5.25,22.75,10050,0,0,0,20,0,10547.5,10.5,0.7,0,2010),(915,2,'2020-09-08',2,2020,NULL,587888.966,1617,2277,2200,1540,77,660,77,0,NULL,1463,23.1,100.1,10050,0,0,0,300,50,11977,46.2,3.08,385,2010),(916,3,'2020-09-08',2,2020,NULL,75948.738,367.5,517.5,500,350,17.5,150,17.5,0,NULL,332.5,5.25,22.75,10050,0,0,0,0,0,10567.5,10.5,0.7,0,2010),(917,4,'2020-09-08',2,2020,NULL,55898.988,294,414,400,280,14,120,14,0,NULL,266,4.2,18.2,10050,0,0,0,0,0,10464,8.4,0.56,0,2010),(918,5,'2020-09-08',2,2020,NULL,45874.113,257.25,362.25,350,245,12.25,105,12.25,0,NULL,232.75,3.675,15.925,10050,0,0,0,10,0,10402.25,7.35,0.49,0,2010),(919,6,'2020-09-08',2,2020,NULL,55898.988,294,414,400,280,14,120,14,0,NULL,266,4.2,18.2,10050,0,0,0,0,120,10344,8.4,0.56,0,2010),(920,7,'2020-09-08',2,2020,NULL,45874.113,257.25,362.25,350,245,12.25,105,12.25,0,NULL,232.75,3.675,15.925,10050,0,0,0,0,0,10412.25,7.35,0.49,0,2010),(921,8,'2020-09-08',2,2020,NULL,55834.863,293.76492537313,413.98880597015,400,279.77611940299,13.988805970149,120,13.988805970149,0.22388059701493,15,265.78731343284,4.1966417910448,18.185447761194,10050,0,0,169.47976463835,0,0,10463.98880597,8.3932835820896,0.55955223880597,0,2010),(922,9,'2020-09-08',2,2020,NULL,55898.988,294,414,400,280,14,120,14,0,NULL,266,4.2,18.2,10050,0,0,0,110,50,10304,8.4,0.56,0,2010),(923,10,'2020-09-08',2,2020,NULL,55898.988,294,414,400,280,14,120,14,0,NULL,266,4.2,18.2,10050,0,0,0,0,20,10444,8.4,0.56,0,2010),(924,12,'2020-09-08',2,2020,NULL,75948.738,367.5,517.5,500,350,17.5,150,17.5,0,NULL,332.5,5.25,22.75,10050,2,0,0,0,0,10567.5,10.5,0.7,0,2010),(925,13,'2020-09-08',2,2020,NULL,55898.988,294,414,400,280,14,120,14,0,NULL,266,4.2,18.2,10050,2,0,0,0,0,10464,8.4,0.56,0,2010),(926,14,'2020-09-08',2,2020,NULL,55898.988,294,414,400,280,14,120,14,0,NULL,266,4.2,18.2,10050,1,0,0,0,0,10464,8.4,0.56,0,2010),(927,15,'2020-09-08',2,2020,NULL,45874.113,257.25,362.25,350,245,12.25,105,12.25,0,NULL,232.75,3.675,15.925,10050,2,0,0,50,40,10322.25,7.35,0.49,0,2010),(928,1,'2020-09-09',3,2020,NULL,75948.738,367.5,517.5,500,350,17.5,150,17.5,0,NULL,332.5,5.25,22.75,0,0,0,0,20,0,497.5,10.5,0.7,0,2010),(929,2,'2020-09-09',3,2020,NULL,587888.966,1617,2277,2200,1540,77,660,77,0,NULL,1463,23.1,100.1,0,0,0,0,300,50,1927,46.2,3.08,385,2010),(930,3,'2020-09-09',3,2020,NULL,75948.738,367.5,517.5,500,350,17.5,150,17.5,0,NULL,332.5,5.25,22.75,0,0,0,0,0,0,517.5,10.5,0.7,0,2010),(931,4,'2020-09-09',3,2020,NULL,55898.988,294,414,400,280,14,120,14,0,NULL,266,4.2,18.2,0,0,0,0,0,0,414,8.4,0.56,0,2010),(932,5,'2020-09-09',3,2020,NULL,45874.113,257.25,362.25,350,245,12.25,105,12.25,0,NULL,232.75,3.675,15.925,0,0,0,0,10,0,352.25,7.35,0.49,0,2010),(933,6,'2020-09-09',3,2020,NULL,55898.988,294,414,400,280,14,120,14,0,NULL,266,4.2,18.2,0,0,0,0,0,120,294,8.4,0.56,0,2010),(934,7,'2020-09-09',3,2020,NULL,45874.113,257.25,362.25,350,245,12.25,105,12.25,0,NULL,232.75,3.675,15.925,0,0,0,0,0,0,362.25,7.35,0.49,0,2010),(935,8,'2020-09-09',3,2020,NULL,55898.988,294,414,400,280,14,120,14,0,NULL,266,4.2,18.2,0,0,0,0,0,0,414,8.4,0.56,0,2010),(936,9,'2020-09-09',3,2020,NULL,55898.988,294,414,400,280,14,120,14,0,NULL,266,4.2,18.2,0,0,0,0,110,50,254,8.4,0.56,0,2010),(937,10,'2020-09-09',3,2020,NULL,55898.988,294,414,400,280,14,120,14,0,NULL,266,4.2,18.2,0,0,0,0,0,20,394,8.4,0.56,0,2010),(938,12,'2020-09-09',3,2020,NULL,75948.738,367.5,517.5,500,350,17.5,150,17.5,0,NULL,332.5,5.25,22.75,20100,2,0,0,0,0,20617.5,10.5,0.7,0,2010),(939,13,'2020-09-09',3,2020,NULL,55898.988,294,414,400,280,14,120,14,0,NULL,266,4.2,18.2,20100,2,0,0,0,0,20514,8.4,0.56,0,2010),(940,14,'2020-09-09',3,2020,NULL,55898.988,294,414,400,280,14,120,14,0,NULL,266,4.2,18.2,10050,1,0,0,0,0,10464,8.4,0.56,0,2010),(941,15,'2020-09-09',3,2020,NULL,45874.113,257.25,362.25,350,245,12.25,105,12.25,0,NULL,232.75,3.675,15.925,20100,2,0,0,50,40,20372.25,7.35,0.49,0,2010),(942,1,'2020-09-09',4,2020,NULL,58136.238,302.20149253731,514.39054726368,500,287.81094527363,14.390547263682,150,14.390547263682,62.189054726368,25,273.42039800995,4.3171641791045,18.707711442786,0,0,0,290.57835820896,20,0,494.39054726368,8.634328358209,0.57562189054726,0,2010),(943,2,'2020-09-09',4,2020,NULL,439688.966,1345.3582089552,2264.0646766169,2200,1281.2935323383,64.064676616915,660,64.064676616915,258.70646766169,26,1217.2288557214,19.219402985075,83.28407960199,0,0,0,1345.3582089552,300,50,1914.0646766169,38.438805970149,2.5625870646766,320.32338308458,2010),(944,3,'2020-09-09',4,2020,NULL,75948.738,367.5,517.5,500,350,17.5,150,17.5,0,NULL,332.5,5.25,22.75,0,0,0,0,0,0,517.5,10.5,0.7,0,2010),(945,4,'2020-09-09',4,2020,NULL,55898.988,294,414,400,280,14,120,14,0,NULL,266,4.2,18.2,0,0,0,0,0,0,414,8.4,0.56,0,2010),(946,5,'2020-09-09',4,2020,NULL,44449.113,252.02611940299,362.00124378109,350,240.02487562189,12.001243781095,105,12.001243781095,4.9751243781095,10,228.0236318408,3.6003731343284,15.601616915423,0,0,0,96.933122847302,10,0,352.00124378109,7.2007462686567,0.48004975124378,0,2010),(947,6,'2020-09-09',4,2020,NULL,18848.988,158.17910447761,407.53233830846,400,150.64676616915,7.5323383084577,120,7.5323383084577,129.35323383085,26,143.1144278607,2.2597014925373,9.792039800995,0,0,0,158.17910447761,0,120,287.53233830846,4.5194029850746,0.30129353233831,0,2010),(948,7,'2020-09-09',4,2020,NULL,42881.613,246.27985074627,361.7276119403,350,234.55223880597,11.727611940299,105,11.727611940299,10.44776119403,21,222.82462686567,3.5182835820896,15.245895522388,0,0,0,198.91834098737,0,0,361.7276119403,7.0365671641791,0.46910447761194,0,2010),(949,8,'2020-09-09',4,2020,NULL,55843.413,293.79626865672,413.99029850746,400,279.80597014925,13.990298507463,120,13.990298507463,0.19402985074627,13,265.81567164179,4.1970895522388,18.187388059701,0,0,0,146.89813432836,0,0,413.99029850746,8.3941791044776,0.55961194029851,0,2010),(950,9,'2020-09-09',4,2020,NULL,53476.488,285.11940298507,413.57711442786,400,271.54228855721,13.577114427861,120,13.577114427861,8.4577114427861,17,257.96517412935,4.0731343283582,17.650248756219,0,0,0,186.4242250287,110,50,253.57711442786,8.1462686567164,0.54308457711443,0,2010),(951,10,'2020-09-09',4,2020,NULL,49486.488,270.49253731343,412.88059701493,400,257.61194029851,12.880597014925,120,12.880597014925,22.388059701493,15,244.73134328358,3.8641791044776,16.744776119403,0,0,0,156.0533869116,0,20,392.88059701493,7.7283582089552,0.51522388059701,0,2010),(952,12,'2020-09-09',4,2020,NULL,75948.738,367.5,517.5,500,350,17.5,150,17.5,0,NULL,332.5,5.25,22.75,20100,2,0,0,0,0,20617.5,10.5,0.7,0,2010),(953,13,'2020-09-09',4,2020,NULL,52621.488,281.98507462687,413.42786069652,400,268.55721393035,13.427860696517,120,13.427860696517,11.442786069652,23,255.12935323383,4.0283582089552,17.456218905473,20100,2,0,249.44833524684,0,0,20513.427860697,8.0567164179104,0.5371144278607,0,2010),(954,14,'2020-09-09',4,2020,NULL,24548.988,179.07462686567,408.52736318408,400,170.54726368159,8.5273631840796,120,8.5273631840796,109.45273631841,22,162.01990049751,2.5582089552239,11.085572139303,10050,1,0,151.52468427095,0,0,10458.527363184,5.1164179104478,0.34109452736318,0,2010),(955,15,'2020-09-09',4,2020,NULL,36896.613,224.33955223881,360.6828358209,350,213.65671641791,10.682835820896,105,10.682835820896,31.34328358209,21,202.97388059701,3.2048507462687,13.887686567164,20100,2,0,181.19733065442,50,40,20370.682835821,6.4097014925373,0.42731343283582,0,2010),(956,1,'2020-09-09',5,2020,NULL,75948.738,367.5,517.5,500,350,17.5,150,17.5,0,NULL,332.5,5.25,22.75,0,0,0,0,20,0,497.5,10.5,0.7,0,2010),(957,2,'2020-09-09',5,2020,NULL,587888.966,1617,2277,2200,1540,77,660,77,0,NULL,1463,23.1,100.1,0,0,0,0,300,50,1927,46.2,3.08,385,2010),(958,3,'2020-09-09',5,2020,NULL,75948.738,367.5,517.5,500,350,17.5,150,17.5,0,NULL,332.5,5.25,22.75,0,0,0,0,0,0,517.5,10.5,0.7,0,2010),(959,4,'2020-09-09',5,2020,NULL,55898.988,294,414,400,280,14,120,14,0,NULL,266,4.2,18.2,0,0,0,0,0,0,414,8.4,0.56,0,2010),(960,5,'2020-09-09',5,2020,NULL,45874.113,257.25,362.25,350,245,12.25,105,12.25,0,NULL,232.75,3.675,15.925,0,0,0,0,10,0,352.25,7.35,0.49,0,2010),(961,6,'2020-09-09',5,2020,NULL,55898.988,294,414,400,280,14,120,14,0,NULL,266,4.2,18.2,0,0,0,0,0,120,294,8.4,0.56,0,2010),(962,7,'2020-09-09',5,2020,NULL,45874.113,257.25,362.25,350,245,12.25,105,12.25,0,NULL,232.75,3.675,15.925,0,0,0,0,0,0,362.25,7.35,0.49,0,2010),(963,8,'2020-09-09',5,2020,NULL,55898.988,294,414,400,280,14,120,14,0,NULL,266,4.2,18.2,0,0,0,0,0,0,414,8.4,0.56,0,2010),(964,9,'2020-09-09',5,2020,NULL,55898.988,294,414,400,280,14,120,14,0,NULL,266,4.2,18.2,0,0,0,0,110,50,254,8.4,0.56,0,2010),(965,10,'2020-09-09',5,2020,NULL,55898.988,294,414,400,280,14,120,14,0,NULL,266,4.2,18.2,0,0,0,0,0,20,394,8.4,0.56,0,2010),(966,12,'2020-09-09',5,2020,NULL,75948.738,367.5,517.5,500,350,17.5,150,17.5,0,NULL,332.5,5.25,22.75,20100,2,0,0,0,0,20617.5,10.5,0.7,0,2010),(967,13,'2020-09-09',5,2020,NULL,55898.988,294,414,400,280,14,120,14,0,NULL,266,4.2,18.2,20100,2,0,0,0,0,20514,8.4,0.56,0,2010),(968,14,'2020-09-09',5,2020,NULL,55898.988,294,414,400,280,14,120,14,0,NULL,266,4.2,18.2,10050,1,0,0,0,0,10464,8.4,0.56,0,2010),(969,15,'2020-09-09',5,2020,NULL,45874.113,257.25,362.25,350,245,12.25,105,12.25,0,NULL,232.75,3.675,15.925,20100,2,0,0,50,40,20372.25,7.35,0.49,0,2010),(970,1,'2020-09-09',6,2020,NULL,57423.738,299.58955223881,514.26616915423,500,285.32338308458,14.266169154229,150,14.266169154229,64.676616915423,26,271.05721393035,4.2798507462687,18.546019900498,0,0,0,299.58955223881,20,0,494.26616915423,8.5597014925373,0.57064676616915,0,2010),(971,2,'2020-09-09',6,2020,NULL,439688.966,1345.3582089552,2264.0646766169,2200,1281.2935323383,64.064676616915,660,64.064676616915,258.70646766169,26,1217.2288557214,19.219402985075,83.28407960199,0,0,0,1345.3582089552,300,50,1914.0646766169,38.438805970149,2.5625870646766,320.32338308458,2010),(972,3,'2020-09-09',6,2020,NULL,75900.288,367.3223880597,517.49154228856,500,349.83084577114,17.491542288557,150,17.491542288557,0.16915422885572,17,332.33930348259,5.2474626865672,22.739004975124,0,0,0,240.17233065442,0,0,517.49154228856,10.494925373134,0.69966169154229,0,2010),(973,4,'2020-09-09',6,2020,NULL,55873.338,293.90597014925,413.99552238806,400,279.91044776119,13.99552238806,120,13.99552238806,0.08955223880597,12,265.91492537313,4.1986567164179,18.194179104478,0,0,0,135.64890929966,0,0,413.99552238806,8.3973134328358,0.55982089552239,0,2010),(974,5,'2020-09-09',6,2020,NULL,42169.113,243.66791044776,361.60323383085,350,232.06467661692,11.603233830846,105,11.603233830846,12.935323383085,26,220.46144278607,3.4809701492537,15.0842039801,0,0,0,243.66791044776,10,0,351.60323383085,6.9619402985075,0.46412935323383,0,2010),(975,6,'2020-09-09',6,2020,NULL,24548.988,179.07462686567,408.52736318408,400,170.54726368159,8.5273631840796,120,8.5273631840796,109.45273631841,22,162.01990049751,2.5582089552239,11.085572139303,0,0,0,151.52468427095,0,120,288.52736318408,5.1164179104478,0.34109452736318,0,2010),(976,7,'2020-09-09',6,2020,NULL,42169.113,243.66791044776,361.60323383085,350,232.06467661692,11.603233830846,105,11.603233830846,12.935323383085,26,220.46144278607,3.4809701492537,15.0842039801,0,0,0,243.66791044776,0,0,361.60323383085,6.9619402985075,0.46412935323383,0,2010),(977,8,'2020-09-09',6,2020,NULL,55813.488,293.68656716418,413.98507462687,400,279.70149253731,13.985074626866,120,13.985074626866,0.29850746268657,20,265.71641791045,4.1955223880597,18.180597014925,0,0,0,225.91274397245,0,0,413.98507462687,8.3910447761194,0.55940298507463,0,2010),(978,9,'2020-09-09',6,2020,NULL,52193.988,280.41791044776,413.35323383085,400,267.06467661692,13.353233830846,120,13.353233830846,12.935323383085,26,253.71144278607,4.0059701492537,17.3592039801,0,0,0,280.41791044776,149,50,214.35323383085,8.0119402985075,0.53412935323383,0,2010),(979,10,'2020-09-09',6,2020,NULL,46066.488,257.9552238806,412.28358208955,400,245.67164179104,12.283582089552,120,12.283582089552,34.328358208955,23,233.38805970149,3.6850746268657,15.968656716418,0,0,0,228.19115958668,0,20,392.28358208955,7.3701492537313,0.49134328358209,0,2010),(980,12,'2020-09-09',6,2020,NULL,65261.238,328.32089552239,515.63432835821,500,312.68656716418,15.634328358209,150,15.634328358209,37.313432835821,15,297.05223880597,4.6902985074627,20.324626865672,20100,2,0,189.41590126292,0,0,20615.634328358,9.3805970149254,0.62537313432836,0,2010),(981,13,'2020-09-09',6,2020,NULL,52193.988,280.41791044776,413.35323383085,400,267.06467661692,13.353233830846,120,13.353233830846,12.935323383085,26,253.71144278607,4.0059701492537,17.3592039801,20100,2,0,280.41791044776,0,0,20513.353233831,8.0119402985075,0.53412935323383,0,2010),(982,14,'2020-09-09',6,2020,NULL,21698.988,168.62686567164,408.02985074627,400,160.59701492537,8.0298507462687,120,8.0298507462687,119.40298507463,24,152.5671641791,2.4089552238806,10.438805970149,10050,1,0,155.65556831228,0,0,10458.029850746,4.8179104477612,0.32119402985075,0,2010),(983,15,'2020-09-09',6,2020,NULL,34759.113,216.50373134328,360.30970149254,350,206.19402985075,10.309701492537,105,10.309701492537,38.805970149254,26,195.88432835821,3.0929104477612,13.402611940299,20100,2,0,216.50373134328,76,60,20324.309701493,6.1858208955224,0.41238805970149,0,2010),(984,1,'2020-09-25',9,2020,NULL,76447.488,367.5,517.5,500,350,17.5,150,17.5,0,NULL,332.5,5.25,22.75,0,0,0,0,20,0,497.5,10.5,0.7,0,2020),(985,2,'2020-09-25',9,2020,NULL,592277.966,1617,2277,2200,1540,77,660,77,0,NULL,1463,23.1,100.1,0,0,0,0,300,50,1927,46.2,3.08,385,2020),(986,3,'2020-09-25',9,2020,NULL,76447.488,367.5,517.5,500,350,17.5,150,17.5,0,NULL,332.5,5.25,22.75,0,0,0,0,0,0,517.5,10.5,0.7,0,2020),(987,4,'2020-09-25',9,2020,NULL,56297.988,294,414,400,280,14,120,14,0,NULL,266,4.2,18.2,0,0,0,0,0,0,414,8.4,0.56,0,2020),(988,5,'2020-09-25',9,2020,NULL,46223.238,257.25,362.25,350,245,12.25,105,12.25,0,NULL,232.75,3.675,15.925,0,0,0,0,10,0,352.25,7.35,0.49,0,2020),(989,6,'2020-09-25',9,2020,NULL,56297.988,294,414,400,280,14,120,14,0,NULL,266,4.2,18.2,0,0,0,0,0,120,294,8.4,0.56,0,2020),(990,7,'2020-09-25',9,2020,NULL,46223.238,257.25,362.25,350,245,12.25,105,12.25,0,NULL,232.75,3.675,15.925,0,0,0,0,0,0,362.25,7.35,0.49,0,2020),(991,8,'2020-09-25',9,2020,NULL,56297.988,294,414,400,280,14,120,14,0,NULL,266,4.2,18.2,0,0,0,0,0,0,414,8.4,0.56,0,2020),(992,9,'2020-09-25',9,2020,NULL,56297.988,294,414,400,280,14,120,14,0,NULL,266,4.2,18.2,0,0,0,0,149,50,215,8.4,0.56,0,2020),(993,10,'2020-09-25',9,2020,NULL,56297.988,294,414,400,280,14,120,14,0,NULL,266,4.2,18.2,0,0,0,0,0,20,394,8.4,0.56,0,2020),(994,12,'2020-09-25',9,2020,NULL,76447.488,367.5,517.5,500,350,17.5,150,17.5,0,NULL,332.5,5.25,22.75,20200,2,0,0,0,0,20717.5,10.5,0.7,0,2020),(995,13,'2020-09-25',9,2020,NULL,56297.988,294,414,400,280,14,120,14,0,NULL,266,4.2,18.2,20200,2,0,0,0,0,20614,8.4,0.56,0,2020),(996,14,'2020-09-25',9,2020,NULL,56297.988,294,414,400,280,14,120,14,0,NULL,266,4.2,18.2,10100,1,0,0,0,0,10514,8.4,0.56,0,2020),(997,15,'2020-09-25',9,2020,NULL,46223.238,257.25,362.25,350,245,12.25,105,12.25,0,NULL,232.75,3.675,15.925,20200,2,0,0,76,60,20426.25,7.35,0.49,61.25,2020),(1013,1,'2020-10-06',8,2020,NULL,60487.488,367.5,517.5,500,350,17.5,150,17.5,0,NULL,332.5,5.25,22.75,0,0,0,0,20,0,497.5,10.5,0.7,0,1700),(1014,2,'2020-10-06',8,2020,NULL,451829.966,1617,2277,2200,1540,77,660,77,0,NULL,1463,23.1,100.1,0,0,0,0,300,50,1927,46.2,3.08,385,1700),(1015,3,'2020-10-06',8,2020,NULL,60487.488,367.5,517.5,500,350,17.5,150,17.5,0,NULL,332.5,5.25,22.75,0,0,0,0,0,0,517.5,10.5,0.7,0,1700),(1016,4,'2020-10-06',8,2020,NULL,43529.988,294,414,400,280,14,120,14,0,NULL,266,4.2,18.2,0,0,0,0,0,0,414,8.4,0.56,0,1700),(1017,5,'2020-10-06',8,2020,NULL,35051.238,257.25,362.25,350,245,12.25,105,12.25,0,NULL,232.75,3.675,15.925,0,0,0,0,10,0,352.25,7.35,0.49,0,1700),(1018,6,'2020-10-06',8,2020,NULL,15029.988,170.47058823529,408.11764705882,400,162.35294117647,8.1176470588235,120,8.1176470588235,117.64705882353,20,154.23529411765,2.4352941176471,10.552941176471,0,0,0,131.13122171946,0,120,288.11764705882,4.8705882352941,0.32470588235294,0,1700),(1019,7,'2020-10-06',8,2020,NULL,35051.238,257.25,362.25,350,245,12.25,105,12.25,0,NULL,232.75,3.675,15.925,0,0,0,0,0,0,362.25,7.35,0.49,0,1700),(1020,8,'2020-10-06',8,2020,NULL,43529.988,294,414,400,280,14,120,14,0,NULL,266,4.2,18.2,0,0,0,0,0,0,414,8.4,0.56,0,1700),(1021,9,'2020-10-06',8,2020,NULL,43529.988,294,414,400,280,14,120,14,0,NULL,266,4.2,18.2,0,0,0,0,149,50,215,8.4,0.56,0,1700),(1022,10,'2020-10-06',8,2020,NULL,33697.488,251.38235294118,411.97058823529,400,239.41176470588,11.970588235294,120,11.970588235294,40.588235294118,23,227.44117647059,3.5911764705882,15.561764705882,0,0,0,222.37669683258,0,20,391.97058823529,7.1823529411765,0.47882352941176,0,1700),(1023,12,'2020-10-06',8,2020,NULL,60487.488,367.5,517.5,500,350,17.5,150,17.5,0,NULL,332.5,5.25,22.75,17000,2,0,0,0,0,17517.5,10.5,0.7,0,1700),(1024,13,'2020-10-06',8,2020,NULL,43529.988,294,414,400,280,14,120,14,0,NULL,266,4.2,18.2,17000,2,0,0,0,0,17414,8.4,0.56,0,1700),(1025,14,'2020-10-06',8,2020,NULL,43529.988,294,414,400,280,14,120,14,0,NULL,266,4.2,18.2,8500,1,0,0,0,0,8914,8.4,0.56,0,1700),(1026,15,'2020-10-06',8,2020,NULL,35051.238,257.25,362.25,350,245,12.25,105,12.25,0,NULL,232.75,3.675,15.925,17000,2,0,0,76,60,17226.25,7.35,0.49,61.25,1700),(1027,16,'2020-10-06',8,2020,NULL,36404.988,263.11764705882,512.52941176471,500,250.58823529412,12.529411764706,150,12.529411764706,99.411764705882,26,238.05882352941,3.7588235294118,16.288235294118,17000,2,0,263.11764705882,0,0,17512.529411765,7.5176470588235,0.50117647058824,0,1700);
/*!40000 ALTER TABLE `paie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestation`
--

DROP TABLE IF EXISTS `prestation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prestation` (
  `prestationID` int(10) NOT NULL AUTO_INCREMENT,
  `contratID` int(10) NOT NULL,
  `mois` int(1) NOT NULL,
  `nombreJours` int(2) NOT NULL,
  `annee` year(4) DEFAULT NULL,
  `dates` date DEFAULT NULL,
  PRIMARY KEY (`prestationID`),
  KEY `contratToPrestation` (`contratID`),
  CONSTRAINT `contratToPrestation` FOREIGN KEY (`contratID`) REFERENCES `contrat` (`contratID`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestation`
--

LOCK TABLES `prestation` WRITE;
/*!40000 ALTER TABLE `prestation` DISABLE KEYS */;
INSERT INTO `prestation` VALUES (1,8,1,22,2020,'2020-08-23'),(2,8,2,15,2020,'2020-08-24'),(3,9,7,20,2019,'2020-08-24'),(4,8,7,23,2019,'2020-08-24'),(5,7,7,26,2019,'2020-08-24'),(6,6,7,15,2019,'2020-08-24'),(7,5,7,10,2019,'2020-08-24'),(8,4,7,18,2019,'2020-08-24'),(9,3,7,17,2019,'2020-08-24'),(10,2,7,26,2019,'2020-08-24'),(11,1,7,25,2019,'2020-08-24'),(12,1,9,25,2019,'2020-08-24'),(13,2,9,26,2019,'2020-08-24'),(14,3,9,17,2019,'2020-08-24'),(15,4,9,19,2019,'2020-08-24'),(16,5,9,10,2019,'2020-08-24'),(17,6,9,26,2019,'2020-08-24'),(18,7,9,23,2019,'2020-08-24'),(19,8,9,21,2019,'2020-08-24'),(20,9,9,24,2019,'2020-08-24'),(21,10,8,23,2020,'2020-08-25'),(22,6,8,20,2020,'2020-08-25'),(23,15,4,21,2020,'2020-09-08'),(24,14,4,22,2020,'2020-09-08'),(25,13,4,23,2020,'2020-09-08'),(26,10,4,15,2020,'2020-09-08'),(27,9,4,17,2020,'2020-09-08'),(28,8,4,13,2020,'2020-09-08'),(29,7,4,21,2020,'2020-09-08'),(30,6,4,26,2020,'2020-09-08'),(31,5,4,10,2020,'2020-09-08'),(32,2,4,26,2020,'2020-09-08'),(33,1,4,25,2020,'2020-09-08'),(34,15,6,26,2020,'2020-09-09'),(35,14,6,24,2020,'2020-09-09'),(36,13,6,26,2020,'2020-09-09'),(37,12,6,15,2020,'2020-09-09'),(38,10,6,23,2020,'2020-09-09'),(39,9,6,26,2020,'2020-09-09'),(40,8,6,20,2020,'2020-09-09'),(41,7,6,26,2020,'2020-09-09'),(42,6,6,22,2020,'2020-09-09'),(43,5,6,26,2020,'2020-09-09'),(44,4,6,12,2020,'2020-09-09'),(45,3,6,17,2020,'2020-09-09'),(46,2,6,26,2020,'2020-09-09'),(47,1,6,26,2020,'2020-09-09'),(48,16,8,26,2020,'2020-10-06');
/*!40000 ALTER TABLE `prestation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `retenue`
--

DROP TABLE IF EXISTS `retenue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `retenue` (
  `retenueID` int(10) NOT NULL AUTO_INCREMENT,
  `designation` varchar(100) NOT NULL,
  `pourcentage` double DEFAULT NULL,
  PRIMARY KEY (`retenueID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `retenue`
--

LOCK TABLES `retenue` WRITE;
/*!40000 ALTER TABLE `retenue` DISABLE KEYS */;
INSERT INTO `retenue` VALUES (1,'QPO',5),(2,'QPP',5),(3,'QPP/FAM',6.5),(4,'QPP/Risque',1.5);
/*!40000 ALTER TABLE `retenue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `retenuepaie`
--

DROP TABLE IF EXISTS `retenuepaie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `retenuepaie` (
  `paieID` int(10) NOT NULL,
  `retenueID` int(10) NOT NULL,
  `montant` double DEFAULT NULL,
  PRIMARY KEY (`paieID`,`retenueID`),
  KEY `retenueToRetenupaie` (`retenueID`),
  CONSTRAINT `paieToRetenupaie` FOREIGN KEY (`paieID`) REFERENCES `paie` (`paieID`),
  CONSTRAINT `retenueToRetenupaie` FOREIGN KEY (`retenueID`) REFERENCES `retenue` (`retenueID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `retenuepaie`
--

LOCK TABLES `retenuepaie` WRITE;
/*!40000 ALTER TABLE `retenuepaie` DISABLE KEYS */;
/*!40000 ALTER TABLE `retenuepaie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typedocument`
--

DROP TABLE IF EXISTS `typedocument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `typedocument` (
  `typeDocumentID` int(10) NOT NULL AUTO_INCREMENT,
  `nomDocument` varchar(40) NOT NULL,
  PRIMARY KEY (`typeDocumentID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typedocument`
--

LOCK TABLES `typedocument` WRITE;
/*!40000 ALTER TABLE `typedocument` DISABLE KEYS */;
INSERT INTO `typedocument` VALUES (1,'Ciriculum Vitae'),(2,'Lettre de motivation'),(3,'Pièce d\'identité');
/*!40000 ALTER TABLE `typedocument` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utilisateur` (
  `utilisateurID` int(10) NOT NULL AUTO_INCREMENT,
  `employeID` int(10) NOT NULL,
  `pseudo` varchar(40) NOT NULL,
  `pass` varchar(40) NOT NULL,
  `niveau` int(1) NOT NULL,
  `dateCreation` date NOT NULL,
  PRIMARY KEY (`utilisateurID`),
  KEY `employeToUtilisateur` (`employeID`),
  CONSTRAINT `employeToUtilisateur` FOREIGN KEY (`employeID`) REFERENCES `employe` (`employeID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateur`
--

LOCK TABLES `utilisateur` WRITE;
/*!40000 ALTER TABLE `utilisateur` DISABLE KEYS */;
INSERT INTO `utilisateur` VALUES (1,1,'Diak','g992034541',1,'2020-08-10'),(2,6,'Belamie','12345',1,'2020-09-02'),(3,14,'Harmo','54321',2,'2020-09-02'),(4,4,'Ily','diakabana',1,'2020-09-12');
/*!40000 ALTER TABLE `utilisateur` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-03 13:57:27
