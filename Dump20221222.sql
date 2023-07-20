-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: mascotappspring
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `autor`
--

DROP TABLE IF EXISTS `autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autor` (
  `id` varchar(255) NOT NULL,
  `alta` bit(1) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `foto_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_hrxnpr6qgsqoctag1ckjq2dcs` (`nombre`),
  KEY `FKlwd2qu1uvhqb1wj1rk59ahquc` (`foto_id`),
  CONSTRAINT `FKlwd2qu1uvhqb1wj1rk59ahquc` FOREIGN KEY (`foto_id`) REFERENCES `foto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `editorial`
--

DROP TABLE IF EXISTS `editorial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `editorial` (
  `id` varchar(255) NOT NULL,
  `alta` bit(1) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_eapnhl7c4en8ug7jfqahnyn8f` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `foto`
--

DROP TABLE IF EXISTS `foto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `foto` (
  `id` varchar(255) NOT NULL,
  `contenido` longblob,
  `mime` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `libro`
--

DROP TABLE IF EXISTS `libro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libro` (
  `id` varchar(255) NOT NULL,
  `alta` bit(1) DEFAULT NULL,
  `ejemplares_prestados` int DEFAULT NULL,
  `ejemplares_restantes` int DEFAULT NULL,
  `ejemplares_totales` int DEFAULT NULL,
  `isbn` bigint DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `autor_id` varchar(255) DEFAULT NULL,
  `editorial_id` varchar(255) DEFAULT NULL,
  `foto_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ehuya6b4bxgkc4ru5wcf5njgr` (`isbn`),
  KEY `FKe1ss87ymon6qj17bhr6jfh0c4` (`autor_id`),
  KEY `FK79q7g2604hcmfdxw6ek3jt4el` (`editorial_id`),
  KEY `FK9odp6c22s87v285oi3iw7wmx3` (`foto_id`),
  CONSTRAINT `FK79q7g2604hcmfdxw6ek3jt4el` FOREIGN KEY (`editorial_id`) REFERENCES `editorial` (`id`),
  CONSTRAINT `FK9odp6c22s87v285oi3iw7wmx3` FOREIGN KEY (`foto_id`) REFERENCES `foto` (`id`),
  CONSTRAINT `FKe1ss87ymon6qj17bhr6jfh0c4` FOREIGN KEY (`autor_id`) REFERENCES `autor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mascota`
--

DROP TABLE IF EXISTS `mascota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mascota` (
  `id` varchar(255) NOT NULL,
  `alta_mascota` bit(1) DEFAULT NULL,
  `apodo` varchar(255) DEFAULT NULL,
  `col` varchar(255) DEFAULT NULL,
  `energía` int NOT NULL,
  `especie` varchar(255) DEFAULT NULL,
  `fecha_alta` datetime DEFAULT NULL,
  `fecha_nacimiento` datetime DEFAULT NULL,
  `fecha_ultima_modificacion` datetime DEFAULT NULL,
  `gen` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `usuario_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKo76id5o9j6vtffestw0tkrrtt` (`usuario_id`),
  CONSTRAINT `FKo76id5o9j6vtffestw0tkrrtt` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orden`
--

DROP TABLE IF EXISTS `orden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden` (
  `id` varchar(255) NOT NULL,
  `alta` bit(1) NOT NULL,
  `fecha_devolucion` datetime DEFAULT NULL,
  `usuario_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3ixgmc0l9isf02alg7255pp5m` (`usuario_id`),
  CONSTRAINT `FK3ixgmc0l9isf02alg7255pp5m` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `par`
--

DROP TABLE IF EXISTS `par`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `par` (
  `id` varchar(255) NOT NULL,
  `alta` bit(1) DEFAULT NULL,
  `fecha_alta` datetime DEFAULT NULL,
  `fecha_match` datetime DEFAULT NULL,
  `matched` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_78r74g8b233004itdkjpjoh7e` (`alta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `par_mascota`
--

DROP TABLE IF EXISTS `par_mascota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `par_mascota` (
  `par_id` varchar(255) NOT NULL,
  `mascota_id` varchar(255) NOT NULL,
  KEY `FKjra7ynrp5sp4srlemv39u4tl6` (`mascota_id`),
  KEY `FKdabttylp0rs9tkhiv7cffh6if` (`par_id`),
  CONSTRAINT `FKdabttylp0rs9tkhiv7cffh6if` FOREIGN KEY (`par_id`) REFERENCES `par` (`id`),
  CONSTRAINT `FKjra7ynrp5sp4srlemv39u4tl6` FOREIGN KEY (`mascota_id`) REFERENCES `mascota` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prestamo`
--

DROP TABLE IF EXISTS `prestamo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prestamo` (
  `id` varchar(255) NOT NULL,
  `alta` bit(1) DEFAULT NULL,
  `fecha_alta` datetime DEFAULT NULL,
  `fecha_baja` datetime DEFAULT NULL,
  `fecha_devolucion` datetime DEFAULT NULL,
  `fecha_solicitud` datetime DEFAULT NULL,
  `libro_id` varchar(255) DEFAULT NULL,
  `orden_id` varchar(255) DEFAULT NULL,
  `usuario_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKk7uwwn2ov4su2plcn1jh4dbi0` (`libro_id`),
  KEY `FKk4xk36jeprdfqioetq0l0k7mu` (`orden_id`),
  KEY `FKqxhq6d4w6fuv27c7j3af28wdu` (`usuario_id`),
  CONSTRAINT `FKk4xk36jeprdfqioetq0l0k7mu` FOREIGN KEY (`orden_id`) REFERENCES `orden` (`id`),
  CONSTRAINT `FKk7uwwn2ov4su2plcn1jh4dbi0` FOREIGN KEY (`libro_id`) REFERENCES `libro` (`id`),
  CONSTRAINT `FKqxhq6d4w6fuv27c7j3af28wdu` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id` varchar(255) NOT NULL,
  `alta` bit(1) DEFAULT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `dni` varchar(255) DEFAULT NULL,
  `fecha_nacimiento` datetime DEFAULT NULL,
  `fecha_penalidad` datetime DEFAULT NULL,
  `genero` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `penalidad` bit(1) DEFAULT NULL,
  `rol` varchar(255) DEFAULT NULL,
  `solicitud_baja` bit(1) DEFAULT NULL,
  `foto_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ics8o4kc1rvjcm04kqcj4mr9b` (`mail`),
  KEY `FKfwvsqymdg4nmop6xhb9b1p3oc` (`foto_id`),
  CONSTRAINT `FKfwvsqymdg4nmop6xhb9b1p3oc` FOREIGN KEY (`foto_id`) REFERENCES `foto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-22  9:15:34
