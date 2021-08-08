-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema igraonica
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema igraonica
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `igraonica` DEFAULT CHARACTER SET utf8 ;
USE `igraonica` ;

-- -----------------------------------------------------
-- Table `igraonica`.`igrac`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `igraonica`.`igrac` (
  `idigrac` INT(11) NOT NULL,
  `ime` VARCHAR(45) NOT NULL,
  `prezime` VARCHAR(45) NOT NULL,
  `redovnost` ENUM('Dnevni posjetilac', 'Sedmični posjetilac', 'Mjesečni posjetilac', 'Rijetko') NOT NULL,
  PRIMARY KEY (`idigrac`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `igraonica`.`igrica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `igraonica`.`igrica` (
  `idigrica` INT(11) NOT NULL,
  `naziv` VARCHAR(100) NOT NULL,
  `slika` VARCHAR(200) NOT NULL,
  `vrsta` VARCHAR(45) NOT NULL,
  `igrivost` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idigrica`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `igraonica`.`igra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `igraonica`.`igra` (
  `igrica_idigrica` INT(11) NOT NULL,
  `igrac_idigrac` INT(11) NOT NULL,
  PRIMARY KEY (`igrica_idigrica`, `igrac_idigrac`),
  INDEX `fk_igrica_has_igrac_igrac1_idx` (`igrac_idigrac` ASC),
  INDEX `fk_igrica_has_igrac_igrica1_idx` (`igrica_idigrica` ASC),
  CONSTRAINT `fk_igrica_has_igrac_igrac1`
    FOREIGN KEY (`igrac_idigrac`)
    REFERENCES `igraonica`.`igrac` (`idigrac`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_igrica_has_igrac_igrica1`
    FOREIGN KEY (`igrica_idigrica`)
    REFERENCES `igraonica`.`igrica` (`idigrica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `igraonica`.`mjesto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `igraonica`.`mjesto` (
  `ptt` INT(11) NOT NULL,
  `naziv` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`ptt`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `igraonica`.`igraonica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `igraonica`.`igraonica` (
  `reg_broj` INT(11) NOT NULL,
  `broj_ispostave` INT(11) NOT NULL,
  `naziv` VARCHAR(45) NOT NULL,
  `adresa` VARCHAR(100) NOT NULL,
  `vlasnik` VARCHAR(45) NOT NULL,
  `telefon` VARCHAR(45) NOT NULL,
  `mjesto_ptt` INT(11) NOT NULL,
  PRIMARY KEY (`reg_broj`),
  INDEX `fk_igraonica_mjesto_ptt_idx` (`mjesto_ptt` ASC),
  CONSTRAINT `fk_igraonica_mjesto_ptt`
    FOREIGN KEY (`mjesto_ptt`)
    REFERENCES `igraonica`.`mjesto` (`ptt`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `igraonica`.`racunar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `igraonica`.`racunar` (
  `broj_racunara` INT(11) NOT NULL,
  `mrezno_ime` VARCHAR(45) NOT NULL,
  `igraonica_reg_broj` INT(11) NOT NULL,
  PRIMARY KEY (`broj_racunara`),
  INDEX `fk_racunar_igraonica_reg_broj_idx` (`igraonica_reg_broj` ASC),
  CONSTRAINT `fk_racunar_igraonica_reg_broj`
    FOREIGN KEY (`igraonica_reg_broj`)
    REFERENCES `igraonica`.`igraonica` (`reg_broj`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `igraonica`.`instalirano`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `igraonica`.`instalirano` (
  `racunar_broj_racunara` INT(11) NOT NULL,
  `igrica_idigrica` INT(11) NOT NULL,
  PRIMARY KEY (`racunar_broj_racunara`, `igrica_idigrica`),
  INDEX `fk_racunar_has_igrica_igrica1_idx` (`igrica_idigrica` ASC),
  INDEX `fk_racunar_has_igrica_racunar1_idx` (`racunar_broj_racunara` ASC),
  CONSTRAINT `fk_racunar_has_igrica_igrica1`
    FOREIGN KEY (`igrica_idigrica`)
    REFERENCES `igraonica`.`igrica` (`idigrica`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_racunar_has_igrica_racunar1`
    FOREIGN KEY (`racunar_broj_racunara`)
    REFERENCES `igraonica`.`racunar` (`broj_racunara`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `igraonica`.`komponenta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `igraonica`.`komponenta` (
  `idkomponenta` INT(11) NOT NULL,
  `ime_proizvodjaca` VARCHAR(45) NOT NULL,
  `tip_komponente` ENUM('Grafička kartica', 'Monitor', 'RAM', 'Hard disk', 'DVD-ROM', 'Matična ploča', 'Procesor') NOT NULL,
  `ime` VARCHAR(45) NULL DEFAULT NULL,
  `kolicina_memorije` VARCHAR(45) NULL DEFAULT NULL,
  `dimenzija` VARCHAR(45) NULL DEFAULT NULL,
  `tip` VARCHAR(45) NULL DEFAULT NULL,
  `kapacitet` VARCHAR(45) NULL DEFAULT NULL,
  `brzina_obrtaja` VARCHAR(45) NULL DEFAULT NULL,
  `brzina` VARCHAR(45) NULL DEFAULT NULL,
  `cipset` VARCHAR(45) NULL DEFAULT NULL,
  `frekvencija` VARCHAR(45) NULL DEFAULT NULL,
  `broj_jezgara` VARCHAR(45) NULL DEFAULT NULL,
  `racunar_idracunara` INT(11) NOT NULL,
  PRIMARY KEY (`idkomponenta`),
  INDEX `fk_komponenta_racunar_idracunara_idx` (`racunar_idracunara` ASC),
  CONSTRAINT `fk_komponenta_racunar_idracunara`
    FOREIGN KEY (`racunar_idracunara`)
    REFERENCES `igraonica`.`racunar` (`broj_racunara`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `igraonica`.`radnik`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `igraonica`.`radnik` (
  `jmbg` VARCHAR(13) NOT NULL,
  `ime` VARCHAR(45) NOT NULL,
  `prezime` VARCHAR(45) NOT NULL,
  `dat_zaposlenja` DATE NOT NULL,
  `plata` DOUBLE NOT NULL,
  `igraonica` INT(11) NOT NULL,
  `mjesto_ptt` INT(11) NOT NULL,
  `igraonica_reg_broj` INT(11) NOT NULL,
  `administrator` TINYINT NULL,
  PRIMARY KEY (`jmbg`),
  INDEX `fk_radnik_mjesto_ptt_idx` (`mjesto_ptt` ASC),
  INDEX `fk_radnik_igraonica_reg_broj_idx` (`igraonica_reg_broj` ASC),
  CONSTRAINT `fk_radnik_igraonica_reg_broj`
    FOREIGN KEY (`igraonica_reg_broj`)
    REFERENCES `igraonica`.`igraonica` (`reg_broj`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_radnik_mjesto_ptt`
    FOREIGN KEY (`mjesto_ptt`)
    REFERENCES `igraonica`.`mjesto` (`ptt`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `igraonica`.`usluga`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `igraonica`.`usluga` (
  `idusluga` INT(11) NOT NULL,
  `vrsta` VARCHAR(45) NOT NULL,
  `cijena_po_satu` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idusluga`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `igraonica`.`racun`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `igraonica`.`racun` (
  `idracun` INT(11) NOT NULL,
  `usluga_idusluge` INT(11) NOT NULL,
  `radnik_idradnika` VARCHAR(13) NOT NULL,
  `igrac_idigrac` INT(11) NOT NULL,
  `ukupno_sati` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
  `ukupna_cijena` DOUBLE NOT NULL,
  PRIMARY KEY (`idracun`),
  INDEX `fk_racun_usluga_idusluge_idx` (`usluga_idusluge` ASC),
  INDEX `fk_racun_radnik_idradnika_idx` (`radnik_idradnika` ASC),
  INDEX `fk_racun_igrac_idigraca_idx` (`igrac_idigrac` ASC),
  CONSTRAINT `fk_racun_igrac_idigraca`
    FOREIGN KEY (`igrac_idigrac`)
    REFERENCES `igraonica`.`igrac` (`idigrac`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_racun_radnik_idradnika`
    FOREIGN KEY (`radnik_idradnika`)
    REFERENCES `igraonica`.`radnik` (`jmbg`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_racun_usluga_idusluge`
    FOREIGN KEY (`usluga_idusluge`)
    REFERENCES `igraonica`.`usluga` (`idusluga`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
