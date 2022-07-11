-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jan 13, 2022 at 02:35 PM
-- Server version: 5.7.32
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bibliotheque`
--

-- --------------------------------------------------------

--
-- Table structure for table `Auteurs`
--

CREATE TABLE `Auteurs` (
  `id_auteur` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `id_pays` int(11) NOT NULL,
  `prenom` varchar(45) NOT NULL,
  `date_naissance` date NOT NULL,
  `biographie` text NOT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Cotisations`
--

CREATE TABLE `Cotisations` (
  `id_cotisation` int(11) NOT NULL,
  `montant` float NOT NULL,
  `id_inscrit` int(11) NOT NULL,
  `date_cotisation` date NOT NULL,
  `date_paiement` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Emprunts`
--

CREATE TABLE `Emprunts` (
  `id_emprunt` int(11) NOT NULL,
  `date_emprunt` date NOT NULL,
  `id_livre` int(11) NOT NULL,
  `id_inscrit` int(11) NOT NULL,
  `date_retour` date NOT NULL,
  `livre_rendu` binary(1) NOT NULL,
  `date_livre_rendu` date NOT NULL,
  `renouvellement` binary(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Inscrits`
--

CREATE TABLE `Inscrits` (
  `id_inscrit` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `prenom` varchar(45) NOT NULL,
  `adresse` text NOT NULL,
  `telephone` varchar(12) NOT NULL,
  `mail` varchar(45) NOT NULL,
  `cotisation_a_jour` binary(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Livres`
--

CREATE TABLE `Livres` (
  `id_livre` int(11) NOT NULL,
  `titre` varchar(45) NOT NULL,
  `id_type` int(11) NOT NULL,
  `annee_parution` int(11) NOT NULL,
  `resume` longtext NOT NULL,
  `cote` varchar(8) NOT NULL,
  `nb_exemplaire` int(11) NOT NULL,
  `reference` varchar(45) NOT NULL,
  `exemplaires_dispo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Livres_Auteurs`
--

CREATE TABLE `Livres_Auteurs` (
  `id_auteur` int(11) NOT NULL,
  `id_livre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Pays`
--

CREATE TABLE `Pays` (
  `id_pays` int(11) NOT NULL,
  `pays` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Types`
--

CREATE TABLE `Types` (
  `id_type` int(11) NOT NULL,
  -- exemple dewey longeur max : 944.081 6
  `dewey` varchar(9) DEFAULT NULL
  `type` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Auteurs`
--
ALTER TABLE `Auteurs`
  ADD PRIMARY KEY (`id_auteur`),
  ADD KEY `FK_34` (`id_pays`);

--
-- Indexes for table `Cotisations`
--
ALTER TABLE `Cotisations`
  ADD PRIMARY KEY (`id_cotisation`),
  ADD KEY `FK_72` (`id_inscrit`);

--
-- Indexes for table `Emprunts`
--
ALTER TABLE `Emprunts`
  ADD PRIMARY KEY (`id_emprunt`),
  ADD KEY `FK_61` (`id_inscrit`),
  ADD KEY `FK_64` (`id_livre`);

--
-- Indexes for table `Inscrits`
--
ALTER TABLE `Inscrits`
  ADD PRIMARY KEY (`id_inscrit`);

--
-- Indexes for table `Livres`
--
ALTER TABLE `Livres`
  ADD PRIMARY KEY (`id_livre`),
  ADD UNIQUE KEY `reference` (`reference`),
  ADD KEY `FK_21` (`id_type`);

--
-- Indexes for table `Livres_Auteurs`
--
ALTER TABLE `Livres_Auteurs`
  ADD KEY `FK_39` (`id_auteur`),
  ADD KEY `FK_42` (`id_livre`);

--
-- Indexes for table `Pays`
--
ALTER TABLE `Pays`
  ADD PRIMARY KEY (`id_pays`);

--
-- Indexes for table `Types`
--
ALTER TABLE `Types`
  ADD PRIMARY KEY (`id_type`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Auteurs`
--
ALTER TABLE `Auteurs`
  MODIFY `id_auteur` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Cotisations`
--
ALTER TABLE `Cotisations`
  MODIFY `id_cotisation` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Emprunts`
--
ALTER TABLE `Emprunts`
  MODIFY `id_emprunt` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Livres`
--
ALTER TABLE `Livres`
  MODIFY `id_livre` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Pays`
--
ALTER TABLE `Pays`
  MODIFY `id_pays` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Types`
--
ALTER TABLE `Types`
  MODIFY `id_type` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Auteurs`
--
ALTER TABLE `Auteurs`
  ADD CONSTRAINT `FK_32` FOREIGN KEY (`id_pays`) REFERENCES `Pays` (`id_pays`);

--
-- Constraints for table `Cotisations`
--
ALTER TABLE `Cotisations`
  ADD CONSTRAINT `FK_70` FOREIGN KEY (`id_inscrit`) REFERENCES `Inscrits` (`id_inscrit`);

--
-- Constraints for table `Emprunts`
--
ALTER TABLE `Emprunts`
  ADD CONSTRAINT `FK_59` FOREIGN KEY (`id_inscrit`) REFERENCES `Inscrits` (`id_inscrit`),
  ADD CONSTRAINT `FK_62` FOREIGN KEY (`id_livre`) REFERENCES `Livres` (`id_livre`);

--
-- Constraints for table `Livres`
--
ALTER TABLE `Livres`
  ADD CONSTRAINT `FK_19` FOREIGN KEY (`id_type`) REFERENCES `Types` (`id_type`);

--
-- Constraints for table `Livres_Auteurs`
--
ALTER TABLE `Livres_Auteurs`
  ADD CONSTRAINT `FK_37` FOREIGN KEY (`id_auteur`) REFERENCES `Auteurs` (`id_auteur`),
  ADD CONSTRAINT `FK_40` FOREIGN KEY (`id_livre`) REFERENCES `Livres` (`id_livre`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
