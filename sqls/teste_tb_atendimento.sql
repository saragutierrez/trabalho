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
-- Table structure for table `tb_atendimento`
--

DROP TABLE IF EXISTS `tb_atendimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_atendimento` (
  `id_atendimento` int(11) NOT NULL AUTO_INCREMENT,
  `dt_hr_atendimento` timestamp NULL DEFAULT NULL,
  `dsc_atendimento` varchar(255) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `res_atendimento` varchar(255) DEFAULT NULL,
  `id_produto` int(11) DEFAULT NULL,
  `id_tipo_atendimento` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_atendimento`),
  KEY `id_cliente_idx` (`id_cliente`),
  KEY `id_usuario_idx` (`id_usuario`),
  KEY `id_produto_idx` (`id_produto`),
  KEY `id_tipo_atendiemento_idx` (`id_tipo_atendimento`),
  CONSTRAINT `id_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `tb_cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_produto` FOREIGN KEY (`id_produto`) REFERENCES `tb_produto` (`id_produto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_tipo_atendiemento` FOREIGN KEY (`id_tipo_atendimento`) REFERENCES `tb_tipoAt` (`id_tipo_atendimento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_atendimento`
--

LOCK TABLES `tb_atendimento` WRITE;
/*!40000 ALTER TABLE `tb_atendimento` DISABLE KEYS */;
INSERT INTO `tb_atendimento` VALUES (2,'2018-02-01 22:05:12','aaa',2,5,'S',2,2),(3,'2018-02-01 22:05:12','Não gostei do produto',2,5,'N',3,3),(4,'2018-02-01 22:05:12','ss',2,5,'S',1,4),(8,'2018-02-01 22:05:12','bla',1,6,'S',1,1),(9,'2018-11-07 19:00:08','Meu cabelo nao ficou macio',1,6,'N',2,2);
/*!40000 ALTER TABLE `tb_atendimento` ENABLE KEYS */;
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
