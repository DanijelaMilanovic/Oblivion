-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 09, 2021 at 01:37 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `igraonica`
--
CREATE DATABASE IF NOT EXISTS `igraonica` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `igraonica`;

-- --------------------------------------------------------

--
-- Table structure for table `igra`
--

CREATE TABLE `igra` (
  `igrica_idigrica` int(11) NOT NULL,
  `igrac_idigrac` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONSHIPS FOR TABLE `igra`:
--   `igrac_idigrac`
--       `igrac` -> `idigrac`
--   `igrica_idigrica`
--       `igrica` -> `idigrica`
--

-- --------------------------------------------------------

--
-- Table structure for table `igrac`
--

CREATE TABLE `igrac` (
  `idigrac` int(11) NOT NULL,
  `ime` varchar(45) NOT NULL,
  `prezime` varchar(45) NOT NULL,
  `redovnost` enum('Dnevni posjetilac','Sedmični posjetilac','Mjesečni posjetilac','Rijetko') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONSHIPS FOR TABLE `igrac`:
--

-- --------------------------------------------------------

--
-- Table structure for table `igraonica`
--

CREATE TABLE `igraonica` (
  `reg_broj` int(11) NOT NULL,
  `broj_ispostave` int(11) NOT NULL,
  `naziv` varchar(45) NOT NULL,
  `adresa` varchar(100) NOT NULL,
  `vlasnik` varchar(45) NOT NULL,
  `telefon` varchar(45) NOT NULL,
  `mjesto_ptt` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONSHIPS FOR TABLE `igraonica`:
--   `mjesto_ptt`
--       `mjesto` -> `ptt`
--

-- --------------------------------------------------------

--
-- Table structure for table `igrica`
--

CREATE TABLE `igrica` (
  `idigrica` int(11) NOT NULL,
  `naziv` varchar(100) NOT NULL,
  `slika` varchar(200) NOT NULL,
  `vrsta` varchar(45) NOT NULL,
  `igrivost` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONSHIPS FOR TABLE `igrica`:
--

-- --------------------------------------------------------

--
-- Table structure for table `instalirano`
--

CREATE TABLE `instalirano` (
  `racunar_broj_racunara` int(11) NOT NULL,
  `igrica_idigrica` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONSHIPS FOR TABLE `instalirano`:
--   `igrica_idigrica`
--       `igrica` -> `idigrica`
--   `racunar_broj_racunara`
--       `racunar` -> `broj_racunara`
--

-- --------------------------------------------------------

--
-- Table structure for table `komponenta`
--

CREATE TABLE `komponenta` (
  `idkomponenta` int(11) NOT NULL,
  `ime_proizvodjaca` varchar(45) NOT NULL,
  `tip_komponente` enum('Grafička kartica','Monitor','RAM','Hard disk','DVD-ROM','Matična ploča','Procesor') NOT NULL,
  `ime` varchar(45) DEFAULT NULL,
  `kolicina_memorije` varchar(45) DEFAULT NULL,
  `dimenzija` varchar(45) DEFAULT NULL,
  `tip` varchar(45) DEFAULT NULL,
  `kapacitet` varchar(45) DEFAULT NULL,
  `brzina_obrtaja` varchar(45) DEFAULT NULL,
  `brzina` varchar(45) DEFAULT NULL,
  `cipset` varchar(45) DEFAULT NULL,
  `frekvencija` varchar(45) DEFAULT NULL,
  `broj_jezgara` varchar(45) DEFAULT NULL,
  `racunar_idracunara` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONSHIPS FOR TABLE `komponenta`:
--   `racunar_idracunara`
--       `racunar` -> `broj_racunara`
--

-- --------------------------------------------------------

--
-- Table structure for table `mjesto`
--

CREATE TABLE `mjesto` (
  `ptt` int(11) NOT NULL,
  `naziv` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONSHIPS FOR TABLE `mjesto`:
--

-- --------------------------------------------------------

--
-- Table structure for table `racun`
--

CREATE TABLE `racun` (
  `idracun` int(11) NOT NULL,
  `usluga_idusluge` int(11) NOT NULL,
  `radnik_idradnika` varchar(13) NOT NULL,
  `igrac_idigrac` int(11) NOT NULL,
  `ukupno_sati` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ukupna_cijena` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONSHIPS FOR TABLE `racun`:
--   `igrac_idigrac`
--       `igrac` -> `idigrac`
--   `radnik_idradnika`
--       `radnik` -> `jmbg`
--   `usluga_idusluge`
--       `usluga` -> `idusluga`
--

-- --------------------------------------------------------

--
-- Table structure for table `racunar`
--

CREATE TABLE `racunar` (
  `broj_racunara` int(11) NOT NULL,
  `mrezno_ime` varchar(45) NOT NULL,
  `igraonica_reg_broj` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONSHIPS FOR TABLE `racunar`:
--   `igraonica_reg_broj`
--       `igraonica` -> `reg_broj`
--

-- --------------------------------------------------------

--
-- Table structure for table `radnik`
--

CREATE TABLE `radnik` (
  `jmbg` varchar(13) NOT NULL,
  `ime` varchar(45) NOT NULL,
  `prezime` varchar(45) NOT NULL,
  `dat_zaposlenja` date NOT NULL,
  `plata` double NOT NULL,
  `mjesto_ptt` int(11) NOT NULL,
  `igraonica_reg_broj` int(11) NOT NULL,
  `administrator` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONSHIPS FOR TABLE `radnik`:
--   `igraonica_reg_broj`
--       `igraonica` -> `reg_broj`
--   `mjesto_ptt`
--       `mjesto` -> `ptt`
--

-- --------------------------------------------------------

--
-- Table structure for table `usluga`
--

CREATE TABLE `usluga` (
  `idusluga` int(11) NOT NULL,
  `vrsta` varchar(45) NOT NULL,
  `cijena_po_satu` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONSHIPS FOR TABLE `usluga`:
--

--
-- Indexes for dumped tables
--

--
-- Indexes for table `igra`
--
ALTER TABLE `igra`
  ADD KEY `fk_igrica_has_igrac_igrac1_idx` (`igrac_idigrac`),
  ADD KEY `fk_igrica_has_igrac_igrica1_idx` (`igrica_idigrica`);

--
-- Indexes for table `igrac`
--
ALTER TABLE `igrac`
  ADD PRIMARY KEY (`idigrac`);

--
-- Indexes for table `igraonica`
--
ALTER TABLE `igraonica`
  ADD PRIMARY KEY (`reg_broj`),
  ADD KEY `fk_igraonica_mjesto_ptt_idx` (`mjesto_ptt`);

--
-- Indexes for table `igrica`
--
ALTER TABLE `igrica`
  ADD PRIMARY KEY (`idigrica`);

--
-- Indexes for table `instalirano`
--
ALTER TABLE `instalirano`
  ADD KEY `fk_racunar_has_igrica_igrica1_idx` (`igrica_idigrica`),
  ADD KEY `fk_racunar_has_igrica_racunar1_idx` (`racunar_broj_racunara`);

--
-- Indexes for table `komponenta`
--
ALTER TABLE `komponenta`
  ADD PRIMARY KEY (`idkomponenta`),
  ADD KEY `fk_komponenta_racunar_idracunara_idx` (`racunar_idracunara`);

--
-- Indexes for table `mjesto`
--
ALTER TABLE `mjesto`
  ADD PRIMARY KEY (`ptt`);

--
-- Indexes for table `racun`
--
ALTER TABLE `racun`
  ADD PRIMARY KEY (`idracun`),
  ADD KEY `fk_racun_usluga_idusluge_idx` (`usluga_idusluge`),
  ADD KEY `fk_racun_radnik_idradnika_idx` (`radnik_idradnika`),
  ADD KEY `fk_racun_igrac_idigraca_idx` (`igrac_idigrac`);

--
-- Indexes for table `racunar`
--
ALTER TABLE `racunar`
  ADD PRIMARY KEY (`broj_racunara`),
  ADD KEY `fk_racunar_igraonica_reg_broj_idx` (`igraonica_reg_broj`);

--
-- Indexes for table `radnik`
--
ALTER TABLE `radnik`
  ADD PRIMARY KEY (`jmbg`),
  ADD KEY `fk_radnik_mjesto_ptt_idx` (`mjesto_ptt`),
  ADD KEY `fk_radnik_igraonica_reg_broj_idx` (`igraonica_reg_broj`);

--
-- Indexes for table `usluga`
--
ALTER TABLE `usluga`
  ADD PRIMARY KEY (`idusluga`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `igra`
--
ALTER TABLE `igra`
  ADD CONSTRAINT `fk_igrica_has_igrac_igrac1` FOREIGN KEY (`igrac_idigrac`) REFERENCES `igrac` (`idigrac`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_igrica_has_igrac_igrica1` FOREIGN KEY (`igrica_idigrica`) REFERENCES `igrica` (`idigrica`) ON UPDATE CASCADE;

--
-- Constraints for table `igraonica`
--
ALTER TABLE `igraonica`
  ADD CONSTRAINT `fk_igraonica_mjesto_ptt` FOREIGN KEY (`mjesto_ptt`) REFERENCES `mjesto` (`ptt`) ON UPDATE CASCADE;

--
-- Constraints for table `instalirano`
--
ALTER TABLE `instalirano`
  ADD CONSTRAINT `fk_racunar_has_igrica_igrica1` FOREIGN KEY (`igrica_idigrica`) REFERENCES `igrica` (`idigrica`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_racunar_has_igrica_racunar1` FOREIGN KEY (`racunar_broj_racunara`) REFERENCES `racunar` (`broj_racunara`) ON UPDATE CASCADE;

--
-- Constraints for table `komponenta`
--
ALTER TABLE `komponenta`
  ADD CONSTRAINT `fk_komponenta_racunar_idracunara` FOREIGN KEY (`racunar_idracunara`) REFERENCES `racunar` (`broj_racunara`) ON UPDATE CASCADE;

--
-- Constraints for table `racun`
--
ALTER TABLE `racun`
  ADD CONSTRAINT `fk_racun_igrac_idigraca` FOREIGN KEY (`igrac_idigrac`) REFERENCES `igrac` (`idigrac`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_racun_radnik_idradnika` FOREIGN KEY (`radnik_idradnika`) REFERENCES `radnik` (`jmbg`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_racun_usluga_idusluge` FOREIGN KEY (`usluga_idusluge`) REFERENCES `usluga` (`idusluga`) ON UPDATE CASCADE;

--
-- Constraints for table `racunar`
--
ALTER TABLE `racunar`
  ADD CONSTRAINT `fk_racunar_igraonica_reg_broj` FOREIGN KEY (`igraonica_reg_broj`) REFERENCES `igraonica` (`reg_broj`) ON UPDATE CASCADE;

--
-- Constraints for table `radnik`
--
ALTER TABLE `radnik`
  ADD CONSTRAINT `fk_radnik_igraonica_reg_broj` FOREIGN KEY (`igraonica_reg_broj`) REFERENCES `igraonica` (`reg_broj`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_radnik_mjesto_ptt` FOREIGN KEY (`mjesto_ptt`) REFERENCES `mjesto` (`ptt`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
