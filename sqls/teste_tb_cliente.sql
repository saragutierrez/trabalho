-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: localhost    Database: teste
-- ------------------------------------------------------
-- Server version	5.7.23-0ubuntu0.16.04.1

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
-- Table structure for table `tb_cliente`
--

DROP TABLE IF EXISTS `tb_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_cliente` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `cpf_cliente` char(11) NOT NULL,
  `nome_cliente` varchar(45) DEFAULT NULL,
  `email_cliente` varchar(45) NOT NULL,
  `data_cliente` date DEFAULT NULL,
  `nr_cliente` int(11) DEFAULT NULL,
  `rua_cliente` varchar(45) DEFAULT NULL,
  `cep_cliente` char(11) DEFAULT NULL,
  `id_cidade` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `email_cliente_UNIQUE` (`email_cliente`),
  UNIQUE KEY `cpf_cliente_UNIQUE` (`cpf_cliente`),
  KEY `id_cidade_idx` (`id_cidade`),
  CONSTRAINT `id_cidade` FOREIGN KEY (`id_cidade`) REFERENCES `tb_cidade` (`id_cidade`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cliente`
--

LOCK TABLES `tb_cliente` WRITE;
/*!40000 ALTER TABLE `tb_cliente` DISABLE KEYS */;
INSERT INTO `tb_cliente` VALUES (5,'36883244980','Razer','r@zer.com','1900-04-02',777,'rua a','123-456',1),(6,'70848161947','Ana','ana@ana','1900-04-02',234,'ruaA','78897-789',2),(8,'87822366904','Pedro ','pedro@pe','1900-04-02',12345,'ruacli','12-356',3),(12,'45005656987','Joaquim','jo@quim@jo','1900-05-12',4,'rua','444',2),(15,'35840913901','Joao','joao','1998-01-25',54,'46','53545',2),(25,'66570893920','Paulo','paulo@paulo','2018-10-05',123,'a','2-345',2),(26,'18393859956','Tiago','ti@go','2018-10-26',323,'weqe','24234-232',4),(27,'65665896942','Mateus','m@teus','2018-11-01',555,'a','2-345',2),(28,'58050967905','Simao','sim@o','2018-11-11',54,'russ','87459888',2),(29,'34220745971','Tadeu','t@deu','2018-04-12',45,'ruinha','45214888',2);
/*!40000 ALTER TABLE `tb_cliente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-07 23:30:23
