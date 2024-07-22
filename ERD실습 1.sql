-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema University
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema University
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `University` DEFAULT CHARACTER SET utf8 ;
USE `University` ;

-- -----------------------------------------------------
-- Table `University`.`Departments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `University`.`Departments` (
  `depNo` INT NOT NULL,
  `depName` VARCHAR(20) NOT NULL,
  `depTel` CHAR(14) NOT NULL,
  PRIMARY KEY (`depNo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `University`.`Professors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `University`.`Professors` (
  `proNo` CHAR(6) NOT NULL,
  `depNo` INT NOT NULL,
  `proName` VARCHAR(20) NOT NULL,
  `proJumin` CHAR(14) NOT NULL,
  `proHp` CHAR(13) NOT NULL,
  `proEmail` VARCHAR(45) NOT NULL,
  `proAddr` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`proNo`),
  UNIQUE INDEX `proJumin_UNIQUE` (`proJumin` ASC) VISIBLE,
  UNIQUE INDEX `proHp_UNIQUE` (`proHp` ASC) VISIBLE,
  INDEX `fk_Professors_Departments1_idx` (`depNo` ASC) VISIBLE,
  CONSTRAINT `fk_Professors_Departments1`
    FOREIGN KEY (`depNo`)
    REFERENCES `University`.`Departments` (`depNo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `University`.`Students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `University`.`Students` (
  `stdNo` CHAR(8) NOT NULL,
  `proName` CHAR(6) NOT NULL,
  `depNo` INT NOT NULL,
  `stdName` VARCHAR(20) NULL,
  `stdJumin` CHAR(14) NOT NULL,
  `stdHP` CHAR(13) NOT NULL,
  `stdEmail` VARCHAR(45) NULL,
  `stdAddr` VARCHAR(100) NULL,
  PRIMARY KEY (`stdNo`),
  UNIQUE INDEX `stdAddr_UNIQUE` (`stdAddr` ASC) VISIBLE,
  UNIQUE INDEX `stdJumin_UNIQUE` (`stdJumin` ASC) VISIBLE,
  UNIQUE INDEX `stdHP_UNIQUE` (`stdHP` ASC) VISIBLE,
  INDEX `fk_Students_Professors_idx` (`proName` ASC) VISIBLE,
  INDEX `fk_Students_Departments1_idx` (`depNo` ASC) VISIBLE,
  CONSTRAINT `fk_Students_Professors`
    FOREIGN KEY (`proName`)
    REFERENCES `University`.`Professors` (`proNo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Students_Departments1`
    FOREIGN KEY (`depNo`)
    REFERENCES `University`.`Departments` (`depNo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `University`.`Lecture`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `University`.`Lecture` (
  `lecNo` CHAR(6) NOT NULL,
  `proNo` CHAR(6) NOT NULL,
  `lecName` VARCHAR(45) NOT NULL,
  `lecCredit` TINYINT NOT NULL,
  `lecTime` TINYINT NOT NULL,
  `lecClass` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`lecNo`, `proNo`),
  INDEX `fk_Lecture_Professors1_idx` (`proNo` ASC) VISIBLE,
  CONSTRAINT `fk_Lecture_Professors1`
    FOREIGN KEY (`proNo`)
    REFERENCES `University`.`Professors` (`proNo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `University`.`Register`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `University`.`Register` (
  `stdNo` CHAR(8) NOT NULL,
  `lecNo` CHAR(6) NOT NULL,
  `proNo` CHAR(6) NOT NULL,
  `regAttenScore` TINYINT NULL,
  `regMidScore` TINYINT NULL,
  `regFinalScore` TINYINT NULL,
  `regEtcScore` TINYINT NULL,
  `regTotal` TINYINT NULL,
  `regGrade` CHAR(1) NULL,
  INDEX `fk_Register_Students1_idx` (`stdNo` ASC) VISIBLE,
  INDEX `fk_Register_Lecture1_idx` (`lecNo` ASC, `proNo` ASC) VISIBLE,
  PRIMARY KEY (`stdNo`, `lecNo`, `proNo`),
  CONSTRAINT `fk_Register_Students1`
    FOREIGN KEY (`stdNo`)
    REFERENCES `University`.`Students` (`stdNo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Register_Lecture1`
    FOREIGN KEY (`lecNo`)
    REFERENCES `University`.`Lecture` (`lecNo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
