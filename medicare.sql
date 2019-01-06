-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 20 Ara 2018, 17:27:07
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
  `approved` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `asked_for`
--

CREATE TABLE `asked_for` (
  `patient_ID` int(11) NOT NULL,
  `test_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `comments`
--

CREATE TABLE `comments` (
  `comment_ID` int(11) NOT NULL,
  `text` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `contain`
--

CREATE TABLE `contain` (
  `pharmacy_ID` int(11) NOT NULL,
  `drug_ID` int(11) NOT NULL,
  `stock` int(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `department`
--

CREATE TABLE `department` (
  `department_ID` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `budget` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `disease`
--

CREATE TABLE `disease` (
  `disease_ID` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `exists`
--

CREATE TABLE `exists` (
  `department_ID` int(11) NOT NULL,
  `hospital_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `has_app_patient`
--

CREATE TABLE `has_app_patient` (
  `patient_ID` int(11) NOT NULL,
  `appointment_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `has_doc_hospital`
--

CREATE TABLE `has_doc_hospital` (
  `doctor_ID` int(11) NOT NULL,
  `hospital_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `has_pres_drugs`
--

CREATE TABLE `has_pres_drugs` (
  `prescription_ID` int(11) NOT NULL,
  `drug_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `has_treat_pres`
--

CREATE TABLE `has_treat_pres` (
  `prescription_ID` int(11) NOT NULL,
  `treatment_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `patient`
--

CREATE TABLE `patient` (
  `patient_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `performed_by`
--

CREATE TABLE `performed_by` (
  `doctor_ID` int(11) NOT NULL,
  `test_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `performs`
--

CREATE TABLE `performs` (
  `doctor_ID` int(11) NOT NULL,
  `treatment_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `prescription`
--

CREATE TABLE `prescription` (
  `prescription_ID` int(11) NOT NULL,
  `text` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `registered`
--

CREATE TABLE `registered` (
  `doctor_ID` int(11) NOT NULL,
  `department_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `take`
--

CREATE TABLE `take` (
  `prescription_ID` int(11) NOT NULL,
  `patient_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `test`
--

CREATE TABLE `test` (
  `test_ID` int(11) NOT NULL,
  `test_date` date DEFAULT NULL,
  `result` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `treatment`
--

CREATE TABLE `treatment` (
  `treatment_ID` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `write_comment`
--

CREATE TABLE `write_comment` (
  `patient_ID` int(11) NOT NULL,
  `comment_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `written_to`
--

CREATE TABLE `written_to` (
  `hospital_ID` int(11) NOT NULL,
  `comment_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`appointment_ID`);

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
  MODIFY `appointment_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `department`
--
ALTER TABLE `department`
  MODIFY `department_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `disease`
--
ALTER TABLE `disease`
  MODIFY `disease_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `drugs`
--
ALTER TABLE `drugs`
  MODIFY `drugs_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `hospital`
--
ALTER TABLE `hospital`
  MODIFY `hospital_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `person`
--
ALTER TABLE `person`
  MODIFY `person_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `pharmacy`
--
ALTER TABLE `pharmacy`
  MODIFY `pharmacy_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `prescription`
--
ALTER TABLE `prescription`
  MODIFY `prescription_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `test`
--
ALTER TABLE `test`
  MODIFY `test_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `treatment`
--
ALTER TABLE `treatment`
  MODIFY `treatment_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

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
