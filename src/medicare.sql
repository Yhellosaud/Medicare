-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 03 Oca 2019, 04:02:03
-- Sunucu sürümü: 10.1.37-MariaDB
-- PHP Sürümü: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `medicare`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `appointment`
--

CREATE TABLE `appointment` (
  `appointment_ID` int(11) NOT NULL,
  `app_date` date DEFAULT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `completed` tinyint(1) DEFAULT NULL,
  `cancelled` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `appointment`
--

INSERT INTO `appointment` (`appointment_ID`, `app_date`, `approved`, `completed`, `cancelled`) VALUES
(5001, '2019-01-02', 1, 1, 0),
(5002, '2019-01-03', 1, 0, 0),
(5003, '2019-01-04', 0, 0, 0),
(5004, '2019-01-05', 0, 0, 0),
(5005, '2019-01-06', 1, 0, 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `app_disease`
--

CREATE TABLE `app_disease` (
  `appointment_ID` int(11) NOT NULL,
  `disease_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `app_disease`
--

INSERT INTO `app_disease` (`appointment_ID`, `disease_ID`) VALUES
(5001, 4001),
(5002, 4002),
(5003, 4003),
(5004, 4004),
(5005, 4005);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `app_pres`
--

CREATE TABLE `app_pres` (
  `appointment_ID` int(11) NOT NULL,
  `prescribtion_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `app_pres`
--

INSERT INTO `app_pres` (`appointment_ID`, `prescribtion_ID`) VALUES
(5001, 9001),
(5002, 9002),
(5003, 9003);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `app_test`
--

CREATE TABLE `app_test` (
  `appointment_ID` int(11) NOT NULL,
  `test_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `app_test`
--

INSERT INTO `app_test` (`appointment_ID`, `test_ID`) VALUES
(5001, 1101),
(5002, 1102),
(5003, 1104);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `app_treat`
--

CREATE TABLE `app_treat` (
  `appointment_ID` int(11) NOT NULL,
  `treatment_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `app_treat`
--

INSERT INTO `app_treat` (`appointment_ID`, `treatment_ID`) VALUES
(5001, 1201),
(5002, 1205),
(5003, 1203);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `asked_for`
--

CREATE TABLE `asked_for` (
  `patient_ID` int(11) NOT NULL,
  `test_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `asked_for`
--

INSERT INTO `asked_for` (`patient_ID`, `test_ID`) VALUES
(1001, 1101),
(1002, 1102),
(1003, 1104);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `comments`
--

CREATE TABLE `comments` (
  `comment_ID` int(11) NOT NULL,
  `text` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `comments`
--

INSERT INTO `comments` (`comment_ID`, `text`) VALUES
(1301, 'Very good Staff'),
(1302, 'Poor interest!!'),
(1303, 'Thanks Doctor OZ!!'),
(1304, 'this hospital has talented doctors'),
(1305, 'Hospital is at a very bad location, so hard to reach!');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `contain`
--

CREATE TABLE `contain` (
  `pharmacy_ID` int(11) NOT NULL,
  `drug_ID` int(11) NOT NULL,
  `stock` int(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `contain`
--

INSERT INTO `contain` (`pharmacy_ID`, `drug_ID`, `stock`) VALUES
(8001, 7001, 1000),
(8002, 7002, 500),
(8003, 7003, 750),
(8004, 7004, 800),
(8005, 7005, 400);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `department`
--

CREATE TABLE `department` (
  `department_ID` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `budget` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `department`
--

INSERT INTO `department` (`department_ID`, `name`, `budget`) VALUES
(6001, 'Neurosurgery', 200000),
(6002, 'Pediatric', 160000),
(6003, 'orthopedics', 110000);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `disease`
--

CREATE TABLE `disease` (
  `disease_ID` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `disease`
--

INSERT INTO `disease` (`disease_ID`, `name`) VALUES
(4001, 'Allergy'),
(4002, 'Obesity'),
(4003, 'Celebral Hemorrhage'),
(4004, 'Cold'),
(4005, 'Herniated Disc');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `doctor`
--

CREATE TABLE `doctor` (
  `doctor_ID` int(11) NOT NULL,
  `office` varchar(45) DEFAULT NULL,
  `specialization` varchar(45) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `doctor`
--

INSERT INTO `doctor` (`doctor_ID`, `office`, `specialization`, `title`, `address`) VALUES
(2001, '1', 'surgeon', 'Doc.', 'Atatürk Hos.'),
(2002, '2', 'pediatrist', 'Doc.', 'Memorial'),
(2003, '3', 'neurologist', 'Doc.', 'Guven Hos.'),
(2004, '4', 'dietitian', 'Doc.', 'Ankara'),
(2005, '5', 'pediatrist', 'Doc.', 'Ankara');

-- --------------------------------------------------------

--
-- Görünüm yapısı durumu `doc_app`
-- (Asıl görünüm için aşağıya bakın)
--
CREATE TABLE `doc_app` (
`appointment_ID` int(11)
);

-- --------------------------------------------------------

--
-- Görünüm yapısı durumu `doc_hos`
-- (Asıl görünüm için aşağıya bakın)
--
CREATE TABLE `doc_hos` (
`doctor_ID` int(11)
);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `drugs`
--

CREATE TABLE `drugs` (
  `drugs_ID` int(11) NOT NULL,
  `drug_name` varchar(45) DEFAULT NULL,
  `itemNumber` int(11) DEFAULT NULL,
  `drug_size` int(11) DEFAULT NULL,
  `size_left()` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `drugs`
--

INSERT INTO `drugs` (`drugs_ID`, `drug_name`, `itemNumber`, `drug_size`, `size_left()`) VALUES
(7001, 'Nurofen', NULL, NULL, NULL),
(7002, 'Majezik', NULL, NULL, NULL),
(7003, 'Rolan', NULL, NULL, NULL),
(7004, 'Augmentin', NULL, NULL, NULL),
(7005, 'Cough Syrup', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `exists`
--

CREATE TABLE `exists` (
  `department_ID` int(11) NOT NULL,
  `hospital_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `exists`
--

INSERT INTO `exists` (`department_ID`, `hospital_ID`) VALUES
(6001, 3001),
(6002, 3001),
(6003, 3001),
(6002, 3002),
(6001, 3002),
(6003, 3003),
(6002, 3003);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `has_app_doc`
--

CREATE TABLE `has_app_doc` (
  `doctor_ID` int(11) NOT NULL,
  `appointment_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `has_app_doc`
--

INSERT INTO `has_app_doc` (`doctor_ID`, `appointment_ID`) VALUES
(2001, 5001),
(2002, 5002),
(2003, 5003),
(2004, 5004),
(2005, 5005);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `has_app_patient`
--

CREATE TABLE `has_app_patient` (
  `patient_ID` int(11) NOT NULL,
  `appointment_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `has_app_patient`
--

INSERT INTO `has_app_patient` (`patient_ID`, `appointment_ID`) VALUES
(1001, 5001),
(1002, 5002),
(1003, 5003),
(1001, 5004),
(1003, 5005);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `has_doc_hospital`
--

CREATE TABLE `has_doc_hospital` (
  `doctor_ID` int(11) NOT NULL,
  `hospital_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `has_doc_hospital`
--

INSERT INTO `has_doc_hospital` (`doctor_ID`, `hospital_ID`) VALUES
(2001, 3001),
(2002, 3002),
(2003, 3003),
(2004, 3002),
(2005, 3003);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `has_pres_drugs`
--

CREATE TABLE `has_pres_drugs` (
  `prescription_ID` int(11) NOT NULL,
  `drug_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `has_pres_drugs`
--

INSERT INTO `has_pres_drugs` (`prescription_ID`, `drug_ID`) VALUES
(9001, 7004),
(9002, 7002),
(9003, 7001);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `has_treat_pres`
--

CREATE TABLE `has_treat_pres` (
  `prescription_ID` int(11) NOT NULL,
  `treatment_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `has_treat_pres`
--

INSERT INTO `has_treat_pres` (`prescription_ID`, `treatment_ID`) VALUES
(9001, 1201),
(9002, 1205),
(9003, 1203);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `hospital`
--

CREATE TABLE `hospital` (
  `hospital_ID` int(11) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `rating` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `phone-num` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `hospital`
--

INSERT INTO `hospital` (`hospital_ID`, `password`, `name`, `rating`, `address`, `phone-num`) VALUES
(3001, '123', 'Ataturk Hos.', NULL, 'Ankara', 12345),
(3002, '123', 'Memorial', NULL, 'Ankara', 123456),
(3003, '123', 'Guven Hos.', NULL, 'Cankaya', 1234);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `patient`
--

CREATE TABLE `patient` (
  `patient_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `patient`
--

INSERT INTO `patient` (`patient_ID`) VALUES
(1001),
(1002),
(1003),
(1004),
(1005);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `performed_by`
--

CREATE TABLE `performed_by` (
  `doctor_ID` int(11) NOT NULL,
  `test_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `performed_by`
--

INSERT INTO `performed_by` (`doctor_ID`, `test_ID`) VALUES
(2001, 1101),
(2001, 1102),
(2002, 1103),
(2002, 1104),
(2003, 1105);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `performs`
--

CREATE TABLE `performs` (
  `doctor_ID` int(11) NOT NULL,
  `treatment_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `performs`
--

INSERT INTO `performs` (`doctor_ID`, `treatment_ID`) VALUES
(2001, 1201),
(2002, 1203),
(2003, 1202);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `person`
--

CREATE TABLE `person` (
  `person_ID` int(11) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `middle_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `phone-num` int(11) DEFAULT NULL,
  `e-mail` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `person`
--

INSERT INTO `person` (`person_ID`, `password`, `first_name`, `middle_name`, `last_name`, `phone-num`, `e-mail`) VALUES
(1001, '123', 'alp', 'eren', 'kaya', 0, 'asd'),
(1002, '123', 'ahmet', 'sari', 'güney', 1, 'asd@gmail.com'),
(1003, '123', 'arda', 'kir', 'ay', 2, 'dsa@gmail.com'),
(1004, '123', 'Begum', NULL, 'Baskin', 1231212, 'begum.baskin@gmail.com'),
(1005, '123', 'Defne', NULL, 'Güven', 3213212, 'defne.güven@gmail.com'),
(2001, '123', 'mehmet', NULL, 'oz', 3, 'mehmet.oz@gmail.com'),
(2002, '123', 'filiz', NULL, 'akin', 4, 'filiz.akin@gmail.com'),
(2003, '123', 'muhammed', NULL, 'ali', 5, 'muhammed.ali@gmail.com'),
(2004, '123', 'Tevfik', 'Tolunay', 'Tutulmaz', 1234567, 'tolunay.tutulmaz@gmail.com'),
(2005, '123', 'Zeynep', NULL, 'Tutulmaz', 9876543, 'zeynep.tutulmaz@gmail.com');

-- --------------------------------------------------------

--
-- Görünüm yapısı durumu `per_app`
-- (Asıl görünüm için aşağıya bakın)
--
CREATE TABLE `per_app` (
`patient_ID` int(11)
);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `pharmacy`
--

CREATE TABLE `pharmacy` (
  `pharmacy_ID` int(11) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone-num` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `pharmacy`
--

INSERT INTO `pharmacy` (`pharmacy_ID`, `password`, `name`, `address`, `phone-num`) VALUES
(8001, '123', 'Buket Eczanesi', 'Kizilirmak Mahallesi, Kizilirmak Mh. Pk:06520 Çankaya/ankara, 1443. Cd., 06510 Çankaya/Ankara', 2200208),
(8002, '123', 'Güner Eczanesi', 'Emek Mh. 21. Sk. No:40 Pk:06500 Çankaya/ankara', 2236565),
(8003, '123', 'Eczane Soydan', 'Ovecler Mahallesi, Yukari Oveçler Mh. Muhtarligi, 06460 Cankaya/Ankara', 4812627),
(8004, '123', 'Lacin Eczanesi', 'Yukari Bahcelievler Mahallesi, Wilhelm Thomsen Cd. No:163, 06490 Cankaya/Ankara', 2128521),
(8005, '123', 'Ulku Eczanesi', 'Kocatepe Mahallesi, Mesrutiyet Cd. 23/C, 06420 Cankaya/Ankara', 4188929);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `prescription`
--

CREATE TABLE `prescription` (
  `prescription_ID` int(11) NOT NULL,
  `text` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `prescription`
--

INSERT INTO `prescription` (`prescription_ID`, `text`) VALUES
(9001, 'He is very sick!'),
(9002, 'dsa'),
(9003, 'asd'),
(9004, NULL),
(9005, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `registered`
--

CREATE TABLE `registered` (
  `doctor_ID` int(11) NOT NULL,
  `department_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `registered`
--

INSERT INTO `registered` (`doctor_ID`, `department_ID`) VALUES
(2001, 6003),
(2002, 6002),
(2003, 6001);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `take`
--

CREATE TABLE `take` (
  `prescription_ID` int(11) NOT NULL,
  `patient_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `take`
--

INSERT INTO `take` (`prescription_ID`, `patient_ID`) VALUES
(9001, 1001),
(9002, 1002),
(9003, 1003);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `test`
--

CREATE TABLE `test` (
  `test_ID` int(11) NOT NULL,
  `test_date` date DEFAULT NULL,
  `result` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `test`
--

INSERT INTO `test` (`test_ID`, `test_date`, `result`) VALUES
(1101, '2019-01-03', 'Positive!'),
(1102, '2019-01-04', 'Negative!'),
(1103, '2019-01-05', 'No Ingeriant Founded!'),
(1104, '2019-01-02', 'Virus Founded!'),
(1105, '2019-01-07', 'Postprandial Blood Sugar');

-- --------------------------------------------------------

--
-- Görünüm yapısı durumu `test_app`
-- (Asıl görünüm için aşağıya bakın)
--
CREATE TABLE `test_app` (
`test_ID` int(11)
);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `treatment`
--

CREATE TABLE `treatment` (
  `treatment_ID` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `treatment`
--

INSERT INTO `treatment` (`treatment_ID`, `name`) VALUES
(1201, 'Medication'),
(1202, 'Physical Therapy'),
(1203, 'Surgery'),
(1204, 'vaccine'),
(1205, 'diet');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `write_comment`
--

CREATE TABLE `write_comment` (
  `patient_ID` int(11) NOT NULL,
  `comment_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `write_comment`
--

INSERT INTO `write_comment` (`patient_ID`, `comment_ID`) VALUES
(1001, 1301),
(1001, 1302),
(1002, 1303),
(1002, 1304),
(1003, 1305);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `written_to`
--

CREATE TABLE `written_to` (
  `hospital_ID` int(11) NOT NULL,
  `comment_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `written_to`
--

INSERT INTO `written_to` (`hospital_ID`, `comment_ID`) VALUES
(3001, 1303),
(3001, 1301),
(3002, 1302),
(3002, 1305),
(3003, 1305);

-- --------------------------------------------------------

--
-- Görünüm yapısı `doc_app`
--
DROP TABLE IF EXISTS `doc_app`;

CREATE ALGORITHM=UNDEFINED DEFINER=`user`@`%` SQL SECURITY DEFINER VIEW `doc_app`  AS  select `has_app_doc`.`appointment_ID` AS `appointment_ID` from `has_app_doc` where (`has_app_doc`.`doctor_ID` = '2002') ;

-- --------------------------------------------------------

--
-- Görünüm yapısı `doc_hos`
--
DROP TABLE IF EXISTS `doc_hos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`user`@`%` SQL SECURITY DEFINER VIEW `doc_hos`  AS  select `has_doc_hospital`.`doctor_ID` AS `doctor_ID` from `has_doc_hospital` where (`has_doc_hospital`.`hospital_ID` = '3001') ;

-- --------------------------------------------------------

--
-- Görünüm yapısı `per_app`
--
DROP TABLE IF EXISTS `per_app`;

CREATE ALGORITHM=UNDEFINED DEFINER=`user`@`%` SQL SECURITY DEFINER VIEW `per_app`  AS  select `has_app_patient`.`patient_ID` AS `patient_ID` from `has_app_patient` where (`has_app_patient`.`appointment_ID` = '5002') ;

-- --------------------------------------------------------

--
-- Görünüm yapısı `test_app`
--
DROP TABLE IF EXISTS `test_app`;

CREATE ALGORITHM=UNDEFINED DEFINER=`user`@`%` SQL SECURITY DEFINER VIEW `test_app`  AS  select `app_test`.`test_ID` AS `test_ID` from `app_test` where (`app_test`.`appointment_ID` = '5002') ;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`appointment_ID`);

--
-- Tablo için indeksler `app_disease`
--
ALTER TABLE `app_disease`
  ADD KEY `appointment_ID` (`appointment_ID`),
  ADD KEY `disease_ID` (`disease_ID`);

--
-- Tablo için indeksler `app_pres`
--
ALTER TABLE `app_pres`
  ADD KEY `appointment_ID` (`appointment_ID`),
  ADD KEY `prescribtion_ID` (`prescribtion_ID`);

--
-- Tablo için indeksler `app_test`
--
ALTER TABLE `app_test`
  ADD KEY `test_ID` (`test_ID`),
  ADD KEY `appointment_ID` (`appointment_ID`);

--
-- Tablo için indeksler `app_treat`
--
ALTER TABLE `app_treat`
  ADD KEY `appointment_ID` (`appointment_ID`),
  ADD KEY `treatment_ID` (`treatment_ID`);

--
-- Tablo için indeksler `asked_for`
--
ALTER TABLE `asked_for`
  ADD KEY `patient_ID` (`patient_ID`),
  ADD KEY `test_ID` (`test_ID`);

--
-- Tablo için indeksler `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_ID`);

--
-- Tablo için indeksler `contain`
--
ALTER TABLE `contain`
  ADD KEY `pharmacy_ID` (`pharmacy_ID`),
  ADD KEY `drug_ID` (`drug_ID`);

--
-- Tablo için indeksler `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`department_ID`);

--
-- Tablo için indeksler `disease`
--
ALTER TABLE `disease`
  ADD PRIMARY KEY (`disease_ID`);

--
-- Tablo için indeksler `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`doctor_ID`);

--
-- Tablo için indeksler `drugs`
--
ALTER TABLE `drugs`
  ADD PRIMARY KEY (`drugs_ID`);

--
-- Tablo için indeksler `exists`
--
ALTER TABLE `exists`
  ADD KEY `department_ID` (`department_ID`),
  ADD KEY `hospital_ID` (`hospital_ID`);

--
-- Tablo için indeksler `has_app_doc`
--
ALTER TABLE `has_app_doc`
  ADD KEY `doctor_ID` (`doctor_ID`),
  ADD KEY `appointment_ID` (`appointment_ID`);

--
-- Tablo için indeksler `has_app_patient`
--
ALTER TABLE `has_app_patient`
  ADD KEY `patient_ID` (`patient_ID`),
  ADD KEY `appointment_ID` (`appointment_ID`);

--
-- Tablo için indeksler `has_doc_hospital`
--
ALTER TABLE `has_doc_hospital`
  ADD KEY `doctor_ID` (`doctor_ID`),
  ADD KEY `hospital_ID` (`hospital_ID`);

--
-- Tablo için indeksler `has_pres_drugs`
--
ALTER TABLE `has_pres_drugs`
  ADD KEY `prescription_ID` (`prescription_ID`),
  ADD KEY `drug_ID` (`drug_ID`);

--
-- Tablo için indeksler `has_treat_pres`
--
ALTER TABLE `has_treat_pres`
  ADD KEY `prescription_ID` (`prescription_ID`),
  ADD KEY `treatment_ID` (`treatment_ID`);

--
-- Tablo için indeksler `hospital`
--
ALTER TABLE `hospital`
  ADD PRIMARY KEY (`hospital_ID`);

--
-- Tablo için indeksler `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patient_ID`);

--
-- Tablo için indeksler `performed_by`
--
ALTER TABLE `performed_by`
  ADD KEY `doctor_ID` (`doctor_ID`),
  ADD KEY `test_ID` (`test_ID`);

--
-- Tablo için indeksler `performs`
--
ALTER TABLE `performs`
  ADD KEY `doctor_ID` (`doctor_ID`),
  ADD KEY `treatment_ID` (`treatment_ID`);

--
-- Tablo için indeksler `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`person_ID`);

--
-- Tablo için indeksler `pharmacy`
--
ALTER TABLE `pharmacy`
  ADD PRIMARY KEY (`pharmacy_ID`);

--
-- Tablo için indeksler `prescription`
--
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`prescription_ID`);

--
-- Tablo için indeksler `registered`
--
ALTER TABLE `registered`
  ADD KEY `doctor_ID` (`doctor_ID`),
  ADD KEY `department_ID` (`department_ID`);

--
-- Tablo için indeksler `take`
--
ALTER TABLE `take`
  ADD UNIQUE KEY `prescription_ID` (`prescription_ID`),
  ADD UNIQUE KEY `patient_ID` (`patient_ID`);

--
-- Tablo için indeksler `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`test_ID`);

--
-- Tablo için indeksler `treatment`
--
ALTER TABLE `treatment`
  ADD PRIMARY KEY (`treatment_ID`);

--
-- Tablo için indeksler `write_comment`
--
ALTER TABLE `write_comment`
  ADD KEY `patient_ID` (`patient_ID`),
  ADD KEY `comment_ID` (`comment_ID`);

--
-- Tablo için indeksler `written_to`
--
ALTER TABLE `written_to`
  ADD KEY `hospital_ID` (`hospital_ID`),
  ADD KEY `comment_ID` (`comment_ID`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `appointment`
--
ALTER TABLE `appointment`
  MODIFY `appointment_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5006;

--
-- Tablo için AUTO_INCREMENT değeri `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1306;

--
-- Tablo için AUTO_INCREMENT değeri `department`
--
ALTER TABLE `department`
  MODIFY `department_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6004;

--
-- Tablo için AUTO_INCREMENT değeri `disease`
--
ALTER TABLE `disease`
  MODIFY `disease_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4006;

--
-- Tablo için AUTO_INCREMENT değeri `drugs`
--
ALTER TABLE `drugs`
  MODIFY `drugs_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7006;

--
-- Tablo için AUTO_INCREMENT değeri `hospital`
--
ALTER TABLE `hospital`
  MODIFY `hospital_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3004;

--
-- Tablo için AUTO_INCREMENT değeri `pharmacy`
--
ALTER TABLE `pharmacy`
  MODIFY `pharmacy_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8006;

--
-- Tablo için AUTO_INCREMENT değeri `prescription`
--
ALTER TABLE `prescription`
  MODIFY `prescription_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9006;

--
-- Tablo için AUTO_INCREMENT değeri `test`
--
ALTER TABLE `test`
  MODIFY `test_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1106;

--
-- Tablo için AUTO_INCREMENT değeri `treatment`
--
ALTER TABLE `treatment`
  MODIFY `treatment_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1206;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `app_disease`
--
ALTER TABLE `app_disease`
  ADD CONSTRAINT `app_disease_ibfk_1` FOREIGN KEY (`appointment_ID`) REFERENCES `appointment` (`appointment_ID`),
  ADD CONSTRAINT `app_disease_ibfk_2` FOREIGN KEY (`disease_ID`) REFERENCES `disease` (`disease_ID`);

--
-- Tablo kısıtlamaları `app_pres`
--
ALTER TABLE `app_pres`
  ADD CONSTRAINT `app_pres_ibfk_1` FOREIGN KEY (`prescribtion_ID`) REFERENCES `prescription` (`prescription_ID`),
  ADD CONSTRAINT `app_pres_ibfk_2` FOREIGN KEY (`appointment_ID`) REFERENCES `appointment` (`appointment_ID`);

--
-- Tablo kısıtlamaları `app_test`
--
ALTER TABLE `app_test`
  ADD CONSTRAINT `app_test_ibfk_1` FOREIGN KEY (`appointment_ID`) REFERENCES `appointment` (`appointment_ID`),
  ADD CONSTRAINT `app_test_ibfk_2` FOREIGN KEY (`test_ID`) REFERENCES `test` (`test_ID`);

--
-- Tablo kısıtlamaları `app_treat`
--
ALTER TABLE `app_treat`
  ADD CONSTRAINT `app_treat_ibfk_1` FOREIGN KEY (`treatment_ID`) REFERENCES `treatment` (`treatment_ID`),
  ADD CONSTRAINT `app_treat_ibfk_2` FOREIGN KEY (`appointment_ID`) REFERENCES `appointment` (`appointment_ID`);

--
-- Tablo kısıtlamaları `asked_for`
--
ALTER TABLE `asked_for`
  ADD CONSTRAINT `asked_for_ibfk_1` FOREIGN KEY (`test_ID`) REFERENCES `test` (`test_ID`),
  ADD CONSTRAINT `asked_for_ibfk_2` FOREIGN KEY (`patient_ID`) REFERENCES `patient` (`patient_ID`);

--
-- Tablo kısıtlamaları `contain`
--
ALTER TABLE `contain`
  ADD CONSTRAINT `contain_ibfk_1` FOREIGN KEY (`pharmacy_ID`) REFERENCES `pharmacy` (`pharmacy_ID`),
  ADD CONSTRAINT `contain_ibfk_2` FOREIGN KEY (`drug_ID`) REFERENCES `drugs` (`drugs_ID`);

--
-- Tablo kısıtlamaları `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`doctor_ID`) REFERENCES `person` (`person_ID`);

--
-- Tablo kısıtlamaları `exists`
--
ALTER TABLE `exists`
  ADD CONSTRAINT `exists_ibfk_1` FOREIGN KEY (`hospital_ID`) REFERENCES `hospital` (`hospital_ID`),
  ADD CONSTRAINT `exists_ibfk_2` FOREIGN KEY (`department_ID`) REFERENCES `department` (`department_ID`);

--
-- Tablo kısıtlamaları `has_app_doc`
--
ALTER TABLE `has_app_doc`
  ADD CONSTRAINT `has_app_doc_ibfk_1` FOREIGN KEY (`doctor_ID`) REFERENCES `doctor` (`doctor_ID`),
  ADD CONSTRAINT `has_app_doc_ibfk_2` FOREIGN KEY (`appointment_ID`) REFERENCES `appointment` (`appointment_ID`);

--
-- Tablo kısıtlamaları `has_app_patient`
--
ALTER TABLE `has_app_patient`
  ADD CONSTRAINT `has_app_patient_ibfk_1` FOREIGN KEY (`patient_ID`) REFERENCES `patient` (`patient_ID`),
  ADD CONSTRAINT `has_app_patient_ibfk_2` FOREIGN KEY (`appointment_ID`) REFERENCES `appointment` (`appointment_ID`);

--
-- Tablo kısıtlamaları `has_doc_hospital`
--
ALTER TABLE `has_doc_hospital`
  ADD CONSTRAINT `has_doc_hospital_ibfk_1` FOREIGN KEY (`doctor_ID`) REFERENCES `doctor` (`doctor_ID`),
  ADD CONSTRAINT `has_doc_hospital_ibfk_2` FOREIGN KEY (`hospital_ID`) REFERENCES `hospital` (`hospital_ID`);

--
-- Tablo kısıtlamaları `has_pres_drugs`
--
ALTER TABLE `has_pres_drugs`
  ADD CONSTRAINT `has_pres_drugs_ibfk_1` FOREIGN KEY (`drug_ID`) REFERENCES `drugs` (`drugs_ID`),
  ADD CONSTRAINT `has_pres_drugs_ibfk_2` FOREIGN KEY (`prescription_ID`) REFERENCES `prescription` (`prescription_ID`);

--
-- Tablo kısıtlamaları `has_treat_pres`
--
ALTER TABLE `has_treat_pres`
  ADD CONSTRAINT `has_treat_pres_ibfk_1` FOREIGN KEY (`prescription_ID`) REFERENCES `prescription` (`prescription_ID`),
  ADD CONSTRAINT `has_treat_pres_ibfk_2` FOREIGN KEY (`treatment_ID`) REFERENCES `treatment` (`treatment_ID`);

--
-- Tablo kısıtlamaları `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`patient_ID`) REFERENCES `person` (`person_ID`);

--
-- Tablo kısıtlamaları `performed_by`
--
ALTER TABLE `performed_by`
  ADD CONSTRAINT `performed_by_ibfk_1` FOREIGN KEY (`doctor_ID`) REFERENCES `doctor` (`doctor_ID`),
  ADD CONSTRAINT `performed_by_ibfk_2` FOREIGN KEY (`test_ID`) REFERENCES `test` (`test_ID`);

--
-- Tablo kısıtlamaları `performs`
--
ALTER TABLE `performs`
  ADD CONSTRAINT `performs_ibfk_1` FOREIGN KEY (`doctor_ID`) REFERENCES `doctor` (`doctor_ID`),
  ADD CONSTRAINT `performs_ibfk_2` FOREIGN KEY (`treatment_ID`) REFERENCES `treatment` (`treatment_ID`);

--
-- Tablo kısıtlamaları `registered`
--
ALTER TABLE `registered`
  ADD CONSTRAINT `registered_ibfk_1` FOREIGN KEY (`doctor_ID`) REFERENCES `doctor` (`doctor_ID`),
  ADD CONSTRAINT `registered_ibfk_2` FOREIGN KEY (`department_ID`) REFERENCES `department` (`department_ID`);

--
-- Tablo kısıtlamaları `take`
--
ALTER TABLE `take`
  ADD CONSTRAINT `take_ibfk_1` FOREIGN KEY (`prescription_ID`) REFERENCES `prescription` (`prescription_ID`),
  ADD CONSTRAINT `take_ibfk_2` FOREIGN KEY (`patient_ID`) REFERENCES `patient` (`patient_ID`);

--
-- Tablo kısıtlamaları `write_comment`
--
ALTER TABLE `write_comment`
  ADD CONSTRAINT `write_comment_ibfk_1` FOREIGN KEY (`patient_ID`) REFERENCES `patient` (`patient_ID`),
  ADD CONSTRAINT `write_comment_ibfk_2` FOREIGN KEY (`comment_ID`) REFERENCES `comments` (`comment_ID`);

--
-- Tablo kısıtlamaları `written_to`
--
ALTER TABLE `written_to`
  ADD CONSTRAINT `written_to_ibfk_1` FOREIGN KEY (`hospital_ID`) REFERENCES `hospital` (`hospital_ID`),
  ADD CONSTRAINT `written_to_ibfk_2` FOREIGN KEY (`comment_ID`) REFERENCES `comments` (`comment_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
