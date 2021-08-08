-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 08, 2021 at 01:27 PM
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

-- --------------------------------------------------------

--
-- Table structure for table `igra`
--

CREATE TABLE `igra` (
  `igrica_idigrica` int(11) NOT NULL,
  `igrac_idigrac` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Dumping data for table `igraonica`
--

INSERT INTO `igraonica` (`reg_broj`, `broj_ispostave`, `naziv`, `adresa`, `vlasnik`, `telefon`, `mjesto_ptt`) VALUES
(151528092, 1, 'Game city ', 'Dučićeva BB', 'Aina Ičelić', '063/494-228', 73301),
(169182940, 1, 'Frendly fire', 'Crnjelovo BB', 'Ivan Petrović', '066 / 215-097', 76300),
(176485870, 2, 'Caffe cyber', 'Palih Boraca BB', 'Ana Momčilović', '066 / 111-438', 73240),
(205700778, 1, 'Game caffe 007', 'Rajlovačka 4', 'Dimitrije Lazić', '063/210-467', 71123),
(264616476, 2, 'All star ', 'Drinska BB', 'Filip Pavić', '066/222-244', 75420),
(352334133, 2, 'Matrix', 'Lamovita BB', 'Stefan Kosjerina', '066/771-096', 79101),
(352772045, 1, 'EsspressoLab', 'Vladimira Gačinovića BB', 'Dragan Milovanović', '065/236-791', 76300),
(388246784, 1, 'Dex', 'Moštanice BB', 'Dejan Petrović', '065 / 503-112', 75420),
(473920565, 1, 'Meeting point', '9. Januar 1 Dobrinja', 'Jovan Stević', '065/323-803', 71123),
(580000563, 1, 'Matrix', 'Orašje BB', 'Stefan Kosjerina', '066/771-096', 74101),
(585988724, 1, 'Kaffa', 'Karađorđeva BB', 'Milica Bojić', '065/237-795', 75400),
(597169265, 2, 'EsspressoLab', 'Bulevar Vojvode Stepe Stepanovića 161', 'Dragan Milovanović', '065/236-791', 78101),
(602268103, 1, 'Metropolis', 'Ugljevička Obrijež BB', 'Miomir Šarac', '066/772-447', 76330),
(616537866, 2, 'L side', 'Nikole Tešanovića 5 Dobrinja', 'Miroslav Stamenković', '065 / 970-650', 71123),
(649949451, 1, 'Mreža', 'Karakaj BB', 'Jovan Milošević', '065 / 838-347', 75400),
(776870164, 1, 'Anarchy', 'Popovo Polje BB', 'Goran Vidaković', '065 / 333-995', 76300),
(897063916, 1, 'All star ', 'Donje Police BB', 'Filip Pavić', '066/222-244', 89101),
(907399502, 1, 'L side', 'Dubovo BB', 'Miroslav Stamenković', '065 / 970-650', 73240),
(971027170, 3, 'All star ', 'Vuka Stefanovića Karadžića S2', 'Filip Pavić', '066/222-244', 75446),
(976984843, 1, 'Caffe cyber', 'Kapetana Leke 1', 'Mirjana Obradović', '065 / 661-098', 76330);

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

-- --------------------------------------------------------

--
-- Table structure for table `instalirano`
--

CREATE TABLE `instalirano` (
  `racunar_broj_racunara` int(11) NOT NULL,
  `igrica_idigrica` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

-- --------------------------------------------------------

--
-- Table structure for table `mjesto`
--

CREATE TABLE `mjesto` (
  `ptt` int(11) NOT NULL,
  `naziv` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mjesto`
--

INSERT INTO `mjesto` (`ptt`, `naziv`) VALUES
(70206, 'Jezero'),
(70260, 'Mrkonjić Grad'),
(70270, 'Šipovo'),
(70273, 'Kupres'),
(71123, 'Istočno Sarajevo'),
(71126, 'Istočno Novo Sarajevo'),
(71144, 'Istočni Stari Grad'),
(71216, 'Istočna Ilidža'),
(71220, 'Trnovo'),
(71230, 'Kalinovik'),
(71350, 'Sokolac'),
(71360, 'Han Pijesak'),
(71420, 'Pale'),
(73110, 'Novo Goražde'),
(73220, 'Rogatica'),
(73240, 'Višegrad'),
(73260, 'Rudo'),
(73280, 'Čajniče'),
(73301, 'Foča'),
(74101, 'Doboj'),
(74208, 'Stanari'),
(74270, 'Teslić'),
(74317, 'Petrovo'),
(74400, 'Derventa'),
(74450, 'Brod'),
(74470, 'Vukosavlje'),
(74480, 'Modriča'),
(75240, 'Lopare'),
(75400, 'Zvornik'),
(75406, 'Osmaci'),
(75420, 'Bratunac'),
(75430, 'Srebrenica'),
(75440, 'Vlasenica'),
(75446, 'Milići'),
(75450, 'Šekovići'),
(76101, 'Brčko'),
(76230, 'Šamac'),
(76256, 'Pelagićevo'),
(76273, 'Donji Žabar'),
(76300, 'Bijeljina'),
(76330, 'Ugljevik'),
(78101, 'Banjaluka'),
(78220, 'Kotor Varoš'),
(78230, 'Kneževo'),
(78240, 'Čelinac'),
(78250, 'Laktaši'),
(78400, 'Gradiška'),
(78420, 'Srbac'),
(78430, 'Prnjavor'),
(79101, 'Prijedor'),
(79220, 'Novi Grad'),
(79224, 'Kostajnica'),
(79227, 'Krupa na Uni'),
(79240, 'Kozarska Dubica'),
(79263, 'Oštra Luka'),
(79288, 'Ribnik'),
(79290, 'Petrovac'),
(79291, 'Istočni Drvar'),
(88280, 'Nevesinje'),
(88363, 'Berkovići'),
(88380, 'Ljubinje'),
(89101, 'Trebinje'),
(89230, 'Bileća'),
(89240, 'Gacko');

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
-- Dumping data for table `racunar`
--

INSERT INTO `racunar` (`broj_racunara`, `mrezno_ime`, `igraonica_reg_broj`) VALUES
(623, 'AllStar_8', 897063916),
(1523, 'Metropolis_9', 602268103),
(2703, 'Anarchy_4', 776870164),
(2986, 'Mreža_4', 649949451),
(3375, 'MeetingPoint_7', 473920565),
(3935, 'Anarchy_3', 776870164),
(4944, 'Kaffa_6', 585988724),
(5733, 'Metropolis_8', 602268103),
(6312, 'FrendlyFire_4', 169182940),
(6728, 'EsspressoLab_4', 597169265),
(7056, 'Mreža_10', 649949451),
(7314, 'EsspressoLab_7', 597169265),
(7922, 'AllStar_4', 897063916),
(8301, 'AllStar_9', 897063916),
(10239, 'LSide_2', 907399502),
(11393, 'AllStar_5', 971027170),
(12458, 'EsspressoLab_2', 597169265),
(12558, 'Mreža_1', 649949451),
(14521, 'LSide_8', 907399502),
(14682, 'CaffeCyber_7', 976984843),
(15593, 'CaffeCyber_3', 976984843),
(15615, 'CaffeCyber_10', 176485870),
(15630, 'Matrix_9', 352334133),
(16466, 'MeetingPoint_10', 473920565),
(16632, 'Mreža_7', 649949451),
(17053, 'AllStar_3', 897063916),
(17143, 'GameCity_3', 151528092),
(17976, 'AllStar_1 ', 264616476),
(18665, 'Dex_9', 388246784),
(18996, 'GameCity_9', 151528092),
(19157, 'GameCaffe007_9', 205700778),
(20665, 'Kaffa_9', 585988724),
(20982, 'AllStar_4', 264616476),
(21709, 'MeetingPoint_3', 473920565),
(21753, 'GameCity_10', 151528092),
(22581, 'Anarchy_10', 776870164),
(22674, 'EsspressoLab_5', 352772045),
(22852, 'AllStar_9', 971027170),
(22958, 'Matrix_6', 580000563),
(23347, 'EsspressoLab_8', 597169265),
(23489, 'LSide_2', 616537866),
(24223, 'CaffeCyber_7', 176485870),
(24660, 'AllStar_4', 971027170),
(25316, 'CaffeCyber_1', 976984843),
(25409, 'CaffeCyber_10', 976984843),
(25504, 'CaffeCyber_8', 176485870),
(25959, 'Anarchy_8', 776870164),
(26177, 'Kaffa_10', 585988724),
(26767, 'EsspressoLab_7', 352772045),
(27286, 'Anarchy_7', 776870164),
(28085, 'AllStar_1 ', 897063916),
(28593, 'GameCaffe007_3', 205700778),
(30559, 'Dex_1', 388246784),
(30650, 'EsspressoLab_5', 597169265),
(30876, 'GameCaffe007_1', 205700778),
(31651, 'Mreža_9', 649949451),
(32484, 'Anarchy_5', 776870164),
(32492, 'Dex_10', 388246784),
(32872, 'CaffeCyber_1', 176485870),
(33210, 'MeetingPoint_1', 473920565),
(33975, 'LSide_9', 616537866),
(34207, 'AllStar_7', 897063916),
(34616, 'EsspressoLab_8', 352772045),
(34925, 'AllStar_9', 264616476),
(35317, 'Metropolis_6', 602268103),
(35688, 'LSide_5', 616537866),
(35812, 'EsspressoLab_6', 352772045),
(35979, 'FrendlyFire_6', 169182940),
(37046, 'CaffeCyber_2', 976984843),
(37080, 'GameCaffe007_7', 205700778),
(37646, 'Metropolis_10', 602268103),
(37694, 'EsspressoLab_6', 597169265),
(38312, 'Metropolis_5', 602268103),
(38807, 'Mreža_5', 649949451),
(40290, 'Matrix_1', 352334133),
(40326, 'Matrix_10', 580000563),
(40526, 'Matrix_8', 580000563),
(40670, 'CaffeCyber_4', 176485870),
(41459, 'GameCaffe007_8', 205700778),
(41463, 'CaffeCyber_3', 176485870),
(42243, 'CaffeCyber_6', 176485870),
(42382, 'LSide_1', 616537866),
(42399, 'Kaffa_8', 585988724),
(42596, 'FrendlyFire_9', 169182940),
(42721, 'LSide_3', 616537866),
(44971, 'FrendlyFire_5', 169182940),
(46175, 'GameCity_1 ', 151528092),
(46273, 'AllStar_2', 971027170),
(46350, 'FrendlyFire_7', 169182940),
(46513, 'Matrix_4', 580000563),
(46622, 'GameCity_5', 151528092),
(46657, 'Matrix_5', 580000563),
(47320, 'Mreža_3', 649949451),
(47586, 'LSide_7', 907399502),
(48303, 'FrendlyFire_2', 169182940),
(48460, 'EsspressoLab_3', 352772045),
(48767, 'GameCaffe007_6', 205700778),
(48805, 'EsspressoLab_10', 352772045),
(49973, 'GameCity_7', 151528092),
(50657, 'AllStar_6', 264616476),
(50687, 'Anarchy_9', 776870164),
(51498, 'EsspressoLab_9', 352772045),
(51955, 'AllStar_7', 264616476),
(52351, 'EsspressoLab_9', 597169265),
(52370, 'EsspressoLab_1', 597169265),
(52512, 'AllStar_3', 971027170),
(52527, 'CaffeCyber_8', 976984843),
(52887, 'LSide_10', 907399502),
(52975, 'CaffeCyber_9', 176485870),
(54932, 'CaffeCyber_5', 976984843),
(55899, 'FrendlyFire_8', 169182940),
(56034, 'Matrix_9', 580000563),
(58116, 'LSide_6', 907399502),
(58673, 'MeetingPoint_6', 473920565),
(59355, 'CaffeCyber_9', 976984843),
(60312, 'Metropolis_4', 602268103),
(60547, 'EsspressoLab_3', 597169265),
(60629, 'Anarchy_6', 776870164),
(60959, 'FrendlyFire_10', 169182940),
(61108, 'AllStar_2', 264616476),
(61733, 'GameCity_2', 151528092),
(63348, 'Matrix_4', 352334133),
(63545, 'AllStar_5', 897063916),
(63670, 'MeetingPoint_9', 473920565),
(63790, 'Dex_3', 388246784),
(63999, 'Metropolis_7', 602268103),
(64575, 'FrendlyFire_3', 169182940),
(65614, 'MeetingPoint_2', 473920565),
(65863, 'LSide_9', 907399502),
(66365, 'Anarchy_2', 776870164),
(67233, 'MeetingPoint_5', 473920565),
(67591, 'CaffeCyber_4', 976984843),
(67661, 'GameCity_6', 151528092),
(67766, 'Dex_4', 388246784),
(68309, 'Kaffa_7', 585988724),
(68627, 'Kaffa_1', 585988724),
(69265, 'Dex_5', 388246784),
(69808, 'GameCity_8', 151528092),
(71159, 'Matrix_5', 352334133),
(71366, 'EsspressoLab_1', 352772045),
(72596, 'LSide_1', 907399502),
(72689, 'AllStar_10', 264616476),
(73959, 'CaffeCyber_2', 176485870),
(74760, 'LSide_4', 616537866),
(75258, 'Kaffa_5', 585988724),
(75287, 'LSide_8', 616537866),
(75324, 'Dex_2', 388246784),
(76626, 'Anarchy_1', 776870164),
(77350, 'Mreža_2', 649949451),
(77534, 'EsspressoLab_10', 597169265),
(77780, 'Dex_6', 388246784),
(77893, 'Matrix_3', 580000563),
(78046, 'AllStar_8', 971027170),
(79150, 'AllStar_3', 264616476),
(79898, 'GameCaffe007_5', 205700778),
(80761, 'AllStar_10', 971027170),
(80862, 'Matrix_7', 580000563),
(81873, 'LSide_10', 616537866),
(83107, 'Matrix_2', 580000563),
(83348, 'LSide_5', 907399502),
(84062, 'AllStar_2', 897063916),
(84475, 'Matrix_7', 352334133),
(84598, 'Matrix_1', 580000563),
(84781, 'LSide_7', 616537866),
(84809, 'Matrix_3', 352334133),
(85417, 'Mreža_6', 649949451),
(86038, 'Dex_7', 388246784),
(86211, 'AllStar_5', 264616476),
(86728, 'GameCaffe007_2', 205700778),
(86904, 'GameCity_4', 151528092),
(87348, 'AllStar_7', 971027170),
(87431, 'Matrix_10', 352334133),
(87863, 'EsspressoLab_2', 352772045),
(88497, 'EsspressoLab_4', 352772045),
(89099, 'CaffeCyber_5', 176485870),
(89415, 'CaffeCyber_6', 976984843),
(92426, 'Matrix_8', 352334133),
(92624, 'Dex_8', 388246784),
(92652, 'GameCaffe007_4', 205700778),
(93195, 'Metropolis_3', 602268103),
(93207, 'Kaffa_2', 585988724),
(93515, 'LSide_3', 907399502),
(93624, 'Metropolis_1', 602268103),
(94783, 'GameCaffe007_10', 205700778),
(95566, 'AllStar_6', 971027170),
(95711, 'Metropolis_2', 602268103),
(95832, 'AllStar_10', 897063916),
(95889, 'LSide_6', 616537866),
(96030, 'Kaffa_3', 585988724),
(96426, 'Matrix_6', 352334133),
(96880, 'Mreža_8', 649949451),
(96950, 'FrendlyFire_1', 169182940),
(97088, 'AllStar_6', 897063916),
(97113, 'Kaffa_4', 585988724),
(97132, 'MeetingPoint_8', 473920565),
(97520, 'LSide_4', 907399502),
(97823, 'AllStar_8', 264616476),
(98605, 'MeetingPoint_4', 473920565),
(99345, 'AllStar_1 ', 971027170),
(99694, 'Matrix_2', 352334133);

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
  `igraonica` int(11) NOT NULL,
  `mjesto_ptt` int(11) NOT NULL,
  `igraonica_reg_broj` int(11) NOT NULL,
  `administrator` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Indexes for dumped tables
--

--
-- Indexes for table `igra`
--
ALTER TABLE `igra`
  ADD PRIMARY KEY (`igrica_idigrica`,`igrac_idigrac`),
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
  ADD PRIMARY KEY (`racunar_broj_racunara`,`igrica_idigrica`),
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
  ADD CONSTRAINT `fk_igrica_has_igrac_igrac1` FOREIGN KEY (`igrac_idigrac`) REFERENCES `igrac` (`idigrac`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_igrica_has_igrac_igrica1` FOREIGN KEY (`igrica_idigrica`) REFERENCES `igrica` (`idigrica`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `igraonica`
--
ALTER TABLE `igraonica`
  ADD CONSTRAINT `fk_igraonica_mjesto_ptt` FOREIGN KEY (`mjesto_ptt`) REFERENCES `mjesto` (`ptt`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `instalirano`
--
ALTER TABLE `instalirano`
  ADD CONSTRAINT `fk_racunar_has_igrica_igrica1` FOREIGN KEY (`igrica_idigrica`) REFERENCES `igrica` (`idigrica`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_racunar_has_igrica_racunar1` FOREIGN KEY (`racunar_broj_racunara`) REFERENCES `racunar` (`broj_racunara`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `komponenta`
--
ALTER TABLE `komponenta`
  ADD CONSTRAINT `fk_komponenta_racunar_idracunara` FOREIGN KEY (`racunar_idracunara`) REFERENCES `racunar` (`broj_racunara`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `racun`
--
ALTER TABLE `racun`
  ADD CONSTRAINT `fk_racun_igrac_idigraca` FOREIGN KEY (`igrac_idigrac`) REFERENCES `igrac` (`idigrac`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_racun_radnik_idradnika` FOREIGN KEY (`radnik_idradnika`) REFERENCES `radnik` (`jmbg`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_racun_usluga_idusluge` FOREIGN KEY (`usluga_idusluge`) REFERENCES `usluga` (`idusluga`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `racunar`
--
ALTER TABLE `racunar`
  ADD CONSTRAINT `fk_racunar_igraonica_reg_broj` FOREIGN KEY (`igraonica_reg_broj`) REFERENCES `igraonica` (`reg_broj`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `radnik`
--
ALTER TABLE `radnik`
  ADD CONSTRAINT `fk_radnik_igraonica_reg_broj` FOREIGN KEY (`igraonica_reg_broj`) REFERENCES `igraonica` (`reg_broj`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_radnik_mjesto_ptt` FOREIGN KEY (`mjesto_ptt`) REFERENCES `mjesto` (`ptt`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
