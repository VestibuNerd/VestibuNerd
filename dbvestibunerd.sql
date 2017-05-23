CREATE DATABASE  IF NOT EXISTS `dbvestibunerd` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `dbvestibunerd`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: dbvestibunerd
-- ------------------------------------------------------
-- Server version	5.7.10-log

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
-- Table structure for table `tblcartao`
--

DROP TABLE IF EXISTS `tblcartao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblcartao` (
  `idCartao` int(11) NOT NULL AUTO_INCREMENT,
  `numero` varchar(45) NOT NULL,
  `codSeguranca` varchar(3) NOT NULL,
  `dtValidade` varchar(7) NOT NULL,
  PRIMARY KEY (`idCartao`),
  UNIQUE KEY `numero_UNIQUE` (`numero`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcartao`
--

LOCK TABLES `tblcartao` WRITE;
/*!40000 ALTER TABLE `tblcartao` DISABLE KEYS */;
INSERT INTO `tblcartao` VALUES (1,'12345678910','123','03/2019');
/*!40000 ALTER TABLE `tblcartao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbllivro`
--

DROP TABLE IF EXISTS `tbllivro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbllivro` (
  `idLivro` smallint(6) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `fotoCapa` varchar(55) NOT NULL,
  `sinopse` text NOT NULL,
  PRIMARY KEY (`idLivro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbllivro`
--

LOCK TABLES `tbllivro` WRITE;
/*!40000 ALTER TABLE `tbllivro` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbllivro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbllivrovestibulando`
--

DROP TABLE IF EXISTS `tbllivrovestibulando`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbllivrovestibulando` (
  `idLivroUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `idLivro` smallint(6) NOT NULL,
  `idVestibulando` int(11) NOT NULL,
  PRIMARY KEY (`idLivroUsuario`),
  KEY `fk_idLivroVestibulando_idx` (`idLivro`),
  KEY `fk_idVestibulandoLivro_idx` (`idVestibulando`),
  CONSTRAINT `fk_idLivroVestibulando` FOREIGN KEY (`idLivro`) REFERENCES `tbllivro` (`idLivro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_idVestibulandoLivro` FOREIGN KEY (`idVestibulando`) REFERENCES `tblvestibulando` (`idVestibulando`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbllivrovestibulando`
--

LOCK TABLES `tbllivrovestibulando` WRITE;
/*!40000 ALTER TABLE `tbllivrovestibulando` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbllivrovestibulando` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbllivrovestibular`
--

DROP TABLE IF EXISTS `tbllivrovestibular`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbllivrovestibular` (
  `idLivroVestibular` int(11) NOT NULL,
  `idLivro` smallint(6) NOT NULL,
  `idVestibular` int(11) NOT NULL,
  PRIMARY KEY (`idLivroVestibular`),
  KEY `fk_idLivroVestibular_idx` (`idLivro`),
  KEY `fk_idVestibularLivro_idx` (`idVestibular`),
  CONSTRAINT `fk_idLivroVestibular` FOREIGN KEY (`idLivro`) REFERENCES `tbllivro` (`idLivro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_idVestibularLivro` FOREIGN KEY (`idVestibular`) REFERENCES `vestibular` (`idVestibular`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbllivrovestibular`
--

LOCK TABLES `tbllivrovestibular` WRITE;
/*!40000 ALTER TABLE `tbllivrovestibular` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbllivrovestibular` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblperguntas`
--

DROP TABLE IF EXISTS `tblperguntas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblperguntas` (
  `idPergunta` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(80) NOT NULL,
  `reposta` text NOT NULL,
  PRIMARY KEY (`idPergunta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblperguntas`
--

LOCK TABLES `tblperguntas` WRITE;
/*!40000 ALTER TABLE `tblperguntas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblperguntas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsobre`
--

DROP TABLE IF EXISTS `tblsobre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblsobre` (
  `idtblSobre` int(11) NOT NULL AUTO_INCREMENT,
  `bioEmpresa` text NOT NULL,
  `fotoEmpresa` varchar(45) NOT NULL,
  PRIMARY KEY (`idtblSobre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsobre`
--

LOCK TABLES `tblsobre` WRITE;
/*!40000 ALTER TABLE `tblsobre` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblsobre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblvestibulando`
--

DROP TABLE IF EXISTS `tblvestibulando`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblvestibulando` (
  `idVestibulando` int(11) NOT NULL AUTO_INCREMENT,
  `idCartao` int(11) NOT NULL,
  `apelido` varchar(45) NOT NULL,
  `nome` varchar(80) NOT NULL,
  `email` varchar(50) NOT NULL,
  `senha` varchar(20) NOT NULL,
  `celular` varchar(15) NOT NULL,
  PRIMARY KEY (`idVestibulando`),
  UNIQUE KEY `apelidoVestibulando_UNIQUE` (`apelido`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_idCartaoUsuario_idx` (`idCartao`),
  CONSTRAINT `fk_idCartaoUsuario` FOREIGN KEY (`idCartao`) REFERENCES `tblcartao` (`idCartao`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblvestibulando`
--

LOCK TABLES `tblvestibulando` WRITE;
/*!40000 ALTER TABLE `tblvestibulando` DISABLE KEYS */;
INSERT INTO `tblvestibulando` VALUES (1,1,'glsantos','Gabriel Lima','gabriel._.lima@hotmail.com','123','11979611772');
/*!40000 ALTER TABLE `tblvestibulando` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vestibular`
--

DROP TABLE IF EXISTS `vestibular`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vestibular` (
  `idVestibular` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `dtProva` varchar(15) NOT NULL,
  PRIMARY KEY (`idVestibular`),
  UNIQUE KEY `nome_UNIQUE` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vestibular`
--

LOCK TABLES `vestibular` WRITE;
/*!40000 ALTER TABLE `vestibular` DISABLE KEYS */;
/*!40000 ALTER TABLE `vestibular` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'dbvestibunerd'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-23 13:43:59
