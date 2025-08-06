-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: org_artigos
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `artigo_colecao`
--

DROP TABLE IF EXISTS `artigo_colecao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artigo_colecao` (
  `id_artigo` int NOT NULL,
  `id_colecao` int NOT NULL,
  PRIMARY KEY (`id_artigo`,`id_colecao`),
  KEY `id_colecao` (`id_colecao`),
  CONSTRAINT `artigo_colecao_ibfk_1` FOREIGN KEY (`id_artigo`) REFERENCES `artigos` (`id_artigo`) ON DELETE CASCADE,
  CONSTRAINT `artigo_colecao_ibfk_2` FOREIGN KEY (`id_colecao`) REFERENCES `colecoes` (`id_colecao`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artigo_colecao`
--

LOCK TABLES `artigo_colecao` WRITE;
/*!40000 ALTER TABLE `artigo_colecao` DISABLE KEYS */;
/*!40000 ALTER TABLE `artigo_colecao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artigo_keyword`
--

DROP TABLE IF EXISTS `artigo_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artigo_keyword` (
  `id_artigo` int NOT NULL,
  `id_keyword` int NOT NULL,
  PRIMARY KEY (`id_artigo`,`id_keyword`),
  KEY `id_keyword` (`id_keyword`),
  CONSTRAINT `artigo_keyword_ibfk_1` FOREIGN KEY (`id_artigo`) REFERENCES `artigos` (`id_artigo`) ON DELETE CASCADE,
  CONSTRAINT `artigo_keyword_ibfk_2` FOREIGN KEY (`id_keyword`) REFERENCES `keywords` (`id_keyword`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artigo_keyword`
--

LOCK TABLES `artigo_keyword` WRITE;
/*!40000 ALTER TABLE `artigo_keyword` DISABLE KEYS */;
/*!40000 ALTER TABLE `artigo_keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artigos`
--

DROP TABLE IF EXISTS `artigos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artigos` (
  `id_artigo` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(500) NOT NULL,
  `resumo` text,
  `num_paginas` int DEFAULT NULL,
  `ano_publicacao` int DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_artigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artigos`
--

LOCK TABLES `artigos` WRITE;
/*!40000 ALTER TABLE `artigos` DISABLE KEYS */;
/*!40000 ALTER TABLE `artigos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autores`
--

DROP TABLE IF EXISTS `autores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autores` (
  `id_autor` int NOT NULL AUTO_INCREMENT,
  `nome_completo` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `afiliacao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_autor`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autores`
--

LOCK TABLES `autores` WRITE;
/*!40000 ALTER TABLE `autores` DISABLE KEYS */;
/*!40000 ALTER TABLE `autores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autoria`
--

DROP TABLE IF EXISTS `autoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autoria` (
  `id_artigo` int NOT NULL,
  `id_autor` int NOT NULL,
  `ordem_autor` int DEFAULT NULL,
  PRIMARY KEY (`id_artigo`,`id_autor`),
  KEY `id_autor` (`id_autor`),
  CONSTRAINT `autoria_ibfk_1` FOREIGN KEY (`id_artigo`) REFERENCES `artigos` (`id_artigo`) ON DELETE CASCADE,
  CONSTRAINT `autoria_ibfk_2` FOREIGN KEY (`id_autor`) REFERENCES `autores` (`id_autor`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autoria`
--

LOCK TABLES `autoria` WRITE;
/*!40000 ALTER TABLE `autoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `autoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citacoes`
--

DROP TABLE IF EXISTS `citacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `citacoes` (
  `id_citacao` int NOT NULL AUTO_INCREMENT,
  `id_artigo_citador` int DEFAULT NULL,
  `id_artigo_citado` int DEFAULT NULL,
  `texto_da_citacao` text,
  PRIMARY KEY (`id_citacao`),
  KEY `id_artigo_citador` (`id_artigo_citador`),
  KEY `id_artigo_citado` (`id_artigo_citado`),
  CONSTRAINT `citacoes_ibfk_1` FOREIGN KEY (`id_artigo_citador`) REFERENCES `artigos` (`id_artigo`) ON DELETE CASCADE,
  CONSTRAINT `citacoes_ibfk_2` FOREIGN KEY (`id_artigo_citado`) REFERENCES `artigos` (`id_artigo`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citacoes`
--

LOCK TABLES `citacoes` WRITE;
/*!40000 ALTER TABLE `citacoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `citacoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colecoes`
--

DROP TABLE IF EXISTS `colecoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `colecoes` (
  `id_colecao` int NOT NULL AUTO_INCREMENT,
  `nome_colecao` varchar(255) NOT NULL,
  `descricao` text,
  PRIMARY KEY (`id_colecao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colecoes`
--

LOCK TABLES `colecoes` WRITE;
/*!40000 ALTER TABLE `colecoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `colecoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keywords`
--

DROP TABLE IF EXISTS `keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keywords` (
  `id_keyword` int NOT NULL AUTO_INCREMENT,
  `palavra_chave` varchar(100) NOT NULL,
  PRIMARY KEY (`id_keyword`),
  UNIQUE KEY `palavra_chave` (`palavra_chave`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keywords`
--

LOCK TABLES `keywords` WRITE;
/*!40000 ALTER TABLE `keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `keywords` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-06 14:55:14
