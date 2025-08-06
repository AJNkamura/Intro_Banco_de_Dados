-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema org_artigos
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema org_artigos
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `org_artigos` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `org_artigos` ;

-- -----------------------------------------------------
-- Table `org_artigos`.`artigos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `org_artigos`.`artigos` (
  `id_artigo` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(500) NOT NULL,
  `resumo` TEXT NULL DEFAULT NULL,
  `num_paginas` INT NULL DEFAULT NULL,
  `ano_publicacao` INT NULL DEFAULT NULL,
  `tipo` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`id_artigo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `org_artigos`.`colecoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `org_artigos`.`colecoes` (
  `id_colecao` INT NOT NULL AUTO_INCREMENT,
  `nome_colecao` VARCHAR(255) NOT NULL,
  `descricao` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id_colecao`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `org_artigos`.`artigo_colecao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `org_artigos`.`artigo_colecao` (
  `id_artigo` INT NOT NULL,
  `id_colecao` INT NOT NULL,
  PRIMARY KEY (`id_artigo`, `id_colecao`),
  INDEX `id_colecao` (`id_colecao` ASC) VISIBLE,
  CONSTRAINT `artigo_colecao_ibfk_1`
    FOREIGN KEY (`id_artigo`)
    REFERENCES `org_artigos`.`artigos` (`id_artigo`)
    ON DELETE CASCADE,
  CONSTRAINT `artigo_colecao_ibfk_2`
    FOREIGN KEY (`id_colecao`)
    REFERENCES `org_artigos`.`colecoes` (`id_colecao`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `org_artigos`.`keywords`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `org_artigos`.`keywords` (
  `id_keyword` INT NOT NULL AUTO_INCREMENT,
  `palavra_chave` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_keyword`),
  UNIQUE INDEX `palavra_chave` (`palavra_chave` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `org_artigos`.`artigo_keyword`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `org_artigos`.`artigo_keyword` (
  `id_artigo` INT NOT NULL,
  `id_keyword` INT NOT NULL,
  PRIMARY KEY (`id_artigo`, `id_keyword`),
  INDEX `id_keyword` (`id_keyword` ASC) VISIBLE,
  CONSTRAINT `artigo_keyword_ibfk_1`
    FOREIGN KEY (`id_artigo`)
    REFERENCES `org_artigos`.`artigos` (`id_artigo`)
    ON DELETE CASCADE,
  CONSTRAINT `artigo_keyword_ibfk_2`
    FOREIGN KEY (`id_keyword`)
    REFERENCES `org_artigos`.`keywords` (`id_keyword`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `org_artigos`.`autores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `org_artigos`.`autores` (
  `id_autor` INT NOT NULL AUTO_INCREMENT,
  `nome_completo` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `afiliacao` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_autor`),
  UNIQUE INDEX `email` (`email` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `org_artigos`.`autoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `org_artigos`.`autoria` (
  `id_artigo` INT NOT NULL,
  `id_autor` INT NOT NULL,
  `ordem_autor` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id_artigo`, `id_autor`),
  INDEX `id_autor` (`id_autor` ASC) VISIBLE,
  CONSTRAINT `autoria_ibfk_1`
    FOREIGN KEY (`id_artigo`)
    REFERENCES `org_artigos`.`artigos` (`id_artigo`)
    ON DELETE CASCADE,
  CONSTRAINT `autoria_ibfk_2`
    FOREIGN KEY (`id_autor`)
    REFERENCES `org_artigos`.`autores` (`id_autor`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `org_artigos`.`citacoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `org_artigos`.`citacoes` (
  `id_citacao` INT NOT NULL AUTO_INCREMENT,
  `id_artigo_citador` INT NULL DEFAULT NULL,
  `id_artigo_citado` INT NULL DEFAULT NULL,
  `texto_da_citacao` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id_citacao`),
  INDEX `id_artigo_citador` (`id_artigo_citador` ASC) VISIBLE,
  INDEX `id_artigo_citado` (`id_artigo_citado` ASC) VISIBLE,
  CONSTRAINT `citacoes_ibfk_1`
    FOREIGN KEY (`id_artigo_citador`)
    REFERENCES `org_artigos`.`artigos` (`id_artigo`)
    ON DELETE CASCADE,
  CONSTRAINT `citacoes_ibfk_2`
    FOREIGN KEY (`id_artigo_citado`)
    REFERENCES `org_artigos`.`artigos` (`id_artigo`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
