-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : sam. 11 juin 2022 à 18:54
-- Version du serveur : 10.4.19-MariaDB
-- Version de PHP : 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gs_notes_database`
--

-- --------------------------------------------------------

--
-- Structure de la table `cadreadministrateur`
--

CREATE TABLE `cadreadministrateur` (
  `grade` varchar(255) DEFAULT NULL,
  `idCardreAdmin` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `cadreadministrateur`
--

INSERT INTO `cadreadministrateur` (`grade`, `idCardreAdmin`) VALUES
('Admin Grade', 8),
('Admin 2eme grade', 12);

-- --------------------------------------------------------

--
-- Structure de la table `compte`
--

CREATE TABLE `compte` (
  `idCompte` bigint(20) NOT NULL,
  `accepteDemandeAutorisationAbsence` bit(1) NOT NULL,
  `accountNonExpired` bit(1) NOT NULL,
  `accountNonLocked` bit(1) NOT NULL,
  `afficheEmail` bit(1) NOT NULL,
  `affichePhoto` bit(1) NOT NULL,
  `credentialsNonExpired` bit(1) NOT NULL,
  `disconnectAccount` bit(1) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `login` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `idUtilisateur` bigint(20) DEFAULT NULL,
  `idRole` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `compte`
--

INSERT INTO `compte` (`idCompte`, `accepteDemandeAutorisationAbsence`, `accountNonExpired`, `accountNonLocked`, `afficheEmail`, `affichePhoto`, `credentialsNonExpired`, `disconnectAccount`, `enabled`, `login`, `password`, `idUtilisateur`, `idRole`) VALUES
(8, b'0', b'1', b'1', b'0', b'0', b'1', b'0', b'1', 'admin', '{bcrypt}$2a$10$vsjRwUSUi2B/jlw4ATXEN.B2IIcVY8ourImFZnWcW1tLz3G6mLfpe', 8, 1),
(9, b'0', b'1', b'1', b'0', b'0', b'1', b'0', b'1', 'prof', '{bcrypt}$2a$10$vsjRwUSUi2B/jlw4ATXEN.B2IIcVY8ourImFZnWcW1tLz3G6mLfpe', 9, 2),
(12, b'0', b'1', b'1', b'0', b'0', b'1', b'0', b'1', 'student', '{bcrypt}$2a$10$vsjRwUSUi2B/jlw4ATXEN.B2IIcVY8ourImFZnWcW1tLz3G6mLfpe', 11, 4),
(13, b'0', b'1', b'1', b'0', b'0', b'1', b'0', b'1', 'cadre_admin', '{bcrypt}$2a$10$vsjRwUSUi2B/jlw4ATXEN.B2IIcVY8ourImFZnWcW1tLz3G6mLfpe', 11, 3),
(14, b'0', b'1', b'1', b'0', b'0', b'1', b'0', b'1', 'biblio', '{bcrypt}$2a$10$vsjRwUSUi2B/jlw4ATXEN.B2IIcVY8ourImFZnWcW1tLz3G6mLfpe', 12, 5);

-- --------------------------------------------------------

--
-- Structure de la table `element`
--

CREATE TABLE `element` (
  `idMatiere` bigint(20) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `currentCoefficient` double NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `idModule` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `element`
--

INSERT INTO `element` (`idMatiere`, `code`, `currentCoefficient`, `nom`, `idModule`) VALUES
(7, '7', 0.4, 'Urbanisme', 19),
(8, '8', 0.6, 'Topographie', 19),
(9, '9', 0.5, 'Dessin', 18),
(10, '10', 0.5, 'Architecture', 18);

-- --------------------------------------------------------

--
-- Structure de la table `enseignant`
--

CREATE TABLE `enseignant` (
  `specialite` varchar(255) DEFAULT NULL,
  `idEnseighant` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `enseignant`
--

INSERT INTO `enseignant` (`specialite`, `idEnseighant`) VALUES
('math', 10);

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

CREATE TABLE `etudiant` (
  `cne` varchar(255) DEFAULT NULL,
  `dateNaissance` datetime(6) DEFAULT NULL,
  `idEtudiant` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `etudiant`
--

INSERT INTO `etudiant` (`cne`, `dateNaissance`, `idEtudiant`) VALUES
('R140076844', '1994-08-19 00:00:00.000000', 9),
('R14008596', '1995-07-25 00:00:00.000000', 11),
('R140076843', '2000-07-28 00:00:00.000000', 13),
('R140076844', '2000-07-28 00:00:00.000000', 14),
('R140076845', '2000-07-28 00:00:00.000000', 15),
('R140076846', '2000-07-28 00:00:00.000000', 16),
('R140076847', '2000-07-28 00:00:00.000000', 17),
('R140076848', '2000-07-28 00:00:00.000000', 18),
('R140076849', '2000-07-28 00:00:00.000000', 19),
('R140076850', '2000-07-28 00:00:00.000000', 20),
('R140076851', '2000-07-28 00:00:00.000000', 21),
('R140076852', '2000-07-28 00:00:00.000000', 22),
('R140076853', '2000-07-28 00:00:00.000000', 23),
('R140076854', '2000-07-28 00:00:00.000000', 24),
('R140076855', '2000-07-28 00:00:00.000000', 25),
('R140076856', '2000-07-28 00:00:00.000000', 26),
('R140076857', '2000-07-28 00:00:00.000000', 27),
('R140076858', '2000-07-28 00:00:00.000000', 28),
('R140076859', '2000-07-28 00:00:00.000000', 29),
('R140076860', '2000-07-28 00:00:00.000000', 30),
('R140076861', '2000-07-28 00:00:00.000000', 31),
('R140076862', '2000-07-28 00:00:00.000000', 32),
('R140076863', '2000-07-28 00:00:00.000000', 33),
('R140076864', '2000-07-28 00:00:00.000000', 34),
('R140076865', '2000-07-28 00:00:00.000000', 35),
('R140076866', '2000-07-28 00:00:00.000000', 36),
('R140076867', '2000-07-28 00:00:00.000000', 37),
('R140076868', '2000-07-28 00:00:00.000000', 38),
('R140076869', '2000-07-28 00:00:00.000000', 39),
('R140076870', '2000-07-28 00:00:00.000000', 40),
('R140076871', '2000-07-28 00:00:00.000000', 41),
('R140076872', '2000-07-28 00:00:00.000000', 42),
('R140076873', '2000-07-28 00:00:00.000000', 43),
('R140076874', '2000-07-28 00:00:00.000000', 44),
('R140076875', '2000-07-28 00:00:00.000000', 45),
('R140076876', '2000-07-28 00:00:00.000000', 46),
('R140076877', '2000-07-28 00:00:00.000000', 47),
('R140076878', '2000-07-28 00:00:00.000000', 48),
('R140076879', '2000-07-28 00:00:00.000000', 49),
('R140076880', '2000-07-28 00:00:00.000000', 50),
('R140076881', '2000-07-28 00:00:00.000000', 51),
('R140076882', '2000-07-28 00:00:00.000000', 52),
('R140076883', '2000-07-28 00:00:00.000000', 53),
('R140076884', '2000-07-28 00:00:00.000000', 54),
('R140076885', '2000-07-28 00:00:00.000000', 55),
('R140076886', '2000-07-28 00:00:00.000000', 56),
('R140076887', '2000-07-28 00:00:00.000000', 57),
('R140076888', '2000-07-28 00:00:00.000000', 58),
('R140076889', '2000-07-28 00:00:00.000000', 59),
('R140076890', '2000-07-28 00:00:00.000000', 60),
('R140076891', '2000-07-28 00:00:00.000000', 61),
('R140076892', '2000-07-28 00:00:00.000000', 62),
('R140076893', '2000-07-28 00:00:00.000000', 63),
('R140076894', '2000-07-28 00:00:00.000000', 64),
('R140076895', '2000-07-28 00:00:00.000000', 65),
('R140076896', '2000-07-28 00:00:00.000000', 66),
('R140076897', '2000-07-28 00:00:00.000000', 67),
('R140076898', '2000-07-28 00:00:00.000000', 68),
('R140076899', '2000-07-28 00:00:00.000000', 69),
('R140076900', '2000-07-28 00:00:00.000000', 70),
('R140076901', '2000-07-28 00:00:00.000000', 71),
('R140076902', '2000-07-28 00:00:00.000000', 72),
('R140076903', '2000-07-28 00:00:00.000000', 73),
('R140076904', '2000-07-28 00:00:00.000000', 74),
('R140076905', '2000-07-28 00:00:00.000000', 75),
('R140076906', '2000-07-28 00:00:00.000000', 76);

-- --------------------------------------------------------

--
-- Structure de la table `filiere`
--

CREATE TABLE `filiere` (
  `idFiliere` bigint(20) NOT NULL,
  `anneeFinaccreditation` int(11) NOT NULL,
  `anneeaccreditation` int(11) NOT NULL,
  `codeFiliere` varchar(255) DEFAULT NULL,
  `titreFiliere` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `filiere`
--

INSERT INTO `filiere` (`idFiliere`, `anneeFinaccreditation`, `anneeaccreditation`, `codeFiliere`, `titreFiliere`) VALUES
(1, 2008, 2050, 'CP', 'Cycle Prepartoire'),
(2, 2008, 2050, 'GI', 'Genie Informatique'),
(3, 2008, 2050, 'GC', 'Genie Civil');

-- --------------------------------------------------------

--
-- Structure de la table `formule`
--

CREATE TABLE `formule` (
  `id` int(11) NOT NULL,
  `nom` varchar(30) DEFAULT NULL,
  `expression` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `inscriptionannuelle`
--

CREATE TABLE `inscriptionannuelle` (
  `idInscription` bigint(20) NOT NULL,
  `annee` int(11) NOT NULL,
  `etat` int(11) NOT NULL,
  `mention` varchar(255) DEFAULT NULL,
  `plusInfos` varchar(255) DEFAULT NULL,
  `rang` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `validation` varchar(255) DEFAULT NULL,
  `idEtudiant` bigint(20) DEFAULT NULL,
  `idNiveau` bigint(20) DEFAULT NULL,
  `moy` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `inscriptionannuelle`
--

INSERT INTO `inscriptionannuelle` (`idInscription`, `annee`, `etat`, `mention`, `plusInfos`, `rang`, `type`, `validation`, `idEtudiant`, `idNiveau`, `moy`) VALUES
(1, 2021, 0, NULL, NULL, 3, NULL, NULL, 13, 4, 15.25),
(2, 2021, 0, NULL, NULL, 6, NULL, NULL, 14, 4, 14.09),
(3, 2021, 0, NULL, NULL, 4, NULL, NULL, 15, 4, 15.06),
(4, 2021, 0, NULL, NULL, 5, NULL, NULL, 16, 4, 14.5),
(5, 2021, 0, NULL, NULL, 1, NULL, NULL, 17, 4, 16.33),
(6, 2021, 0, NULL, NULL, 2, NULL, NULL, 18, 4, 15.49),
(7, 2021, 0, NULL, NULL, 0, NULL, NULL, 19, 4, 0),
(8, 2021, 0, NULL, NULL, 0, NULL, NULL, 20, 4, 0),
(9, 2021, 0, NULL, NULL, 0, NULL, NULL, 21, 4, 0),
(10, 2021, 0, NULL, NULL, 0, NULL, NULL, 22, 4, 0),
(11, 2021, 0, NULL, NULL, 0, NULL, NULL, 23, 4, 0),
(12, 2021, 0, NULL, NULL, 0, NULL, NULL, 24, 4, 0),
(13, 2021, 0, NULL, NULL, 0, NULL, NULL, 25, 4, 0),
(14, 2021, 0, NULL, NULL, 0, NULL, NULL, 26, 4, 0),
(15, 2021, 0, NULL, NULL, 0, NULL, NULL, 27, 4, 0),
(16, 2021, 0, NULL, NULL, 0, NULL, NULL, 28, 4, 0),
(17, 2021, 0, NULL, NULL, 0, NULL, NULL, 29, 4, 0),
(18, 2021, 0, NULL, NULL, 0, NULL, NULL, 30, 4, 0),
(19, 2021, 0, NULL, NULL, 0, NULL, NULL, 31, 4, 0),
(20, 2021, 0, NULL, NULL, 0, NULL, NULL, 32, 4, 0),
(21, 2021, 0, NULL, NULL, 0, NULL, NULL, 33, 4, 0),
(22, 2021, 0, NULL, NULL, 0, NULL, NULL, 34, 4, 0),
(23, 2021, 0, NULL, NULL, 0, NULL, NULL, 35, 4, 0),
(24, 2021, 0, NULL, NULL, 0, NULL, NULL, 36, 4, 0),
(25, 2021, 0, NULL, NULL, 0, NULL, NULL, 37, 4, 0),
(26, 2021, 0, NULL, NULL, 0, NULL, NULL, 38, 4, 0),
(27, 2021, 0, NULL, NULL, 0, NULL, NULL, 39, 4, 0),
(28, 2021, 0, NULL, NULL, 0, NULL, NULL, 40, 4, 0),
(29, 2021, 0, NULL, NULL, 0, NULL, NULL, 41, 4, 0),
(30, 2021, 0, NULL, NULL, 0, NULL, NULL, 42, 4, 0),
(31, 2021, 0, NULL, NULL, 0, NULL, NULL, 43, 4, 0),
(32, 2021, 0, NULL, NULL, 0, NULL, NULL, 44, 4, 0),
(33, 2021, 0, NULL, NULL, 0, NULL, NULL, 45, 4, 0),
(34, 2021, 0, NULL, NULL, 0, NULL, NULL, 46, 4, 0),
(35, 2021, 0, NULL, NULL, 0, NULL, NULL, 47, 4, 0),
(36, 2021, 0, NULL, NULL, 0, NULL, NULL, 48, 4, 0),
(37, 2021, 0, NULL, NULL, 0, NULL, NULL, 49, 4, 0),
(38, 2021, 0, NULL, NULL, 0, NULL, NULL, 50, 4, 0),
(39, 2021, 0, NULL, NULL, 0, NULL, NULL, 51, 4, 0),
(40, 2021, 0, NULL, NULL, 0, NULL, NULL, 52, 4, 0),
(41, 2021, 0, NULL, NULL, 0, NULL, NULL, 53, 4, 0),
(42, 2021, 0, NULL, NULL, 0, NULL, NULL, 54, 4, 0),
(43, 2021, 0, NULL, NULL, 0, NULL, NULL, 55, 4, 0),
(44, 2021, 0, NULL, NULL, 0, NULL, NULL, 56, 4, 0),
(45, 2021, 0, NULL, NULL, 0, NULL, NULL, 57, 4, 0),
(46, 2021, 0, NULL, NULL, 0, NULL, NULL, 58, 4, 0),
(47, 2021, 0, NULL, NULL, 0, NULL, NULL, 59, 4, 0),
(48, 2021, 0, NULL, NULL, 0, NULL, NULL, 60, 4, 0),
(49, 2021, 0, NULL, NULL, 0, NULL, NULL, 61, 4, 0),
(50, 2021, 0, NULL, NULL, 0, NULL, NULL, 62, 4, 0),
(51, 2021, 0, NULL, NULL, 0, NULL, NULL, 63, 4, 0),
(52, 2021, 0, NULL, NULL, 0, NULL, NULL, 64, 4, 0),
(53, 2021, 0, NULL, NULL, 0, NULL, NULL, 65, 4, 0),
(54, 2021, 0, NULL, NULL, 0, NULL, NULL, 66, 4, 0),
(55, 2021, 0, NULL, NULL, 0, NULL, NULL, 67, 4, 0),
(56, 2021, 0, NULL, NULL, 0, NULL, NULL, 68, 4, 0),
(57, 2021, 0, NULL, NULL, 0, NULL, NULL, 69, 4, 0),
(58, 2021, 0, NULL, NULL, 0, NULL, NULL, 70, 4, 0),
(59, 2021, 0, NULL, NULL, 0, NULL, NULL, 71, 4, 0),
(60, 2021, 0, NULL, NULL, 0, NULL, NULL, 72, 4, 0),
(61, 2021, 0, NULL, NULL, 0, NULL, NULL, 73, 4, 0),
(62, 2021, 0, NULL, NULL, 0, NULL, NULL, 74, 4, 0),
(63, 2021, 0, NULL, NULL, 0, NULL, NULL, 75, 4, 0),
(64, 2021, 0, NULL, NULL, 0, NULL, NULL, 76, 4, 0);

-- --------------------------------------------------------

--
-- Structure de la table `inscriptionmatiere`
--

CREATE TABLE `inscriptionmatiere` (
  `idInscriptionMatiere` bigint(20) NOT NULL,
  `coefficient` double NOT NULL,
  `noteFinale` double NOT NULL,
  `noteSN` double NOT NULL,
  `noteSR` double NOT NULL,
  `plusInfos` varchar(255) DEFAULT NULL,
  `validation` varchar(255) DEFAULT NULL,
  `idInscription` bigint(20) DEFAULT NULL,
  `idMatiere` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `inscriptionmodule`
--

CREATE TABLE `inscriptionmodule` (
  `idInscriptionModule` bigint(20) NOT NULL,
  `noteFinale` double NOT NULL,
  `noteSN` double NOT NULL,
  `noteSR` double NOT NULL,
  `plusInfos` varchar(255) DEFAULT NULL,
  `validation` varchar(255) DEFAULT NULL,
  `idInscription` bigint(20) DEFAULT NULL,
  `idModule` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `inscriptionmodule`
--

INSERT INTO `inscriptionmodule` (`idInscriptionModule`, `noteFinale`, `noteSN`, `noteSR`, `plusInfos`, `validation`, `idInscription`, `idModule`) VALUES
(1, 19, 19, 0, '-', 'v', 1, 1),
(2, 14, 14, 0, '-', 'v', 2, 1),
(3, 15, 15, 0, '-', 'v', 3, 1),
(4, 12, 10, 18, '-', 'v', 4, 1),
(5, 11, 10, 12, '-', 'nv', 5, 1),
(6, 13, 13, 0, '-', 'v', 6, 1),
(11, 10, 10, 10, '-', 'nv', 2, 2),
(12, 16, 16, 0, '-', 'v', 3, 2),
(13, 18, 18, 0, '-', 'v', 4, 2),
(14, 14, 14, 0, '-', 'v', 5, 2),
(15, 13, 13, 0, '-', 'v', 6, 2),
(16, 15, 15, 0, '-', 'v', 1, 2),
(17, 14, 15, 0, '-', 'v', 1, 3),
(18, 14, 15, 0, '-', 'v', 1, 3),
(19, 14, 15, 0, '-', 'v', 1, 3),
(20, 14, 15, 0, '-', 'v', 1, 3),
(21, 15, 15, 0, '-', 'v', 1, 3),
(22, 18, 18, 0, '-', 'v', 2, 3),
(23, 14, 14, 0, '-', 'v', 3, 3),
(24, 16, 16, 0, '-', 'v', 4, 3),
(25, 19, 19, 0, '-', 'v', 5, 3),
(26, 15, 15, 0, '-', 'v', 6, 3),
(27, 18, 18, 0, '-', 'v', 1, 4),
(28, 13, 13, 0, '-', 'v', 2, 4),
(29, 13, 13, 0, '-', 'v', 3, 4),
(30, 13, 13, 0, '-', 'v', 4, 4),
(31, 18, 18, 0, '-', 'v', 5, 4),
(32, 19, 19, 0, '-', 'v', 6, 4),
(33, 15, 15, 0, '-', 'v', 1, 5),
(34, 19, 19, 0, '-', 'v', 2, 5),
(35, 16, 16, 0, '-', 'v', 3, 5),
(36, 13, 13, 0, '-', 'v', 4, 5),
(37, 16, 16, 0, '-', 'v', 5, 5),
(38, 17, 17, 0, '-', 'v', 6, 5),
(39, 16, 16, 0, '-', 'v', 1, 6),
(40, 17, 17, 0, '-', 'v', 2, 6),
(41, 18, 18, 0, '-', 'v', 3, 6),
(42, 13, 13, 0, '-', 'v', 4, 6),
(43, 17, 17, 0, '-', 'v', 5, 6),
(44, 13, 13, 0, '-', 'v', 6, 6),
(45, 15, 15, 0, '-', 'v', 1, 7),
(46, 13, 13, 0, '-', 'v', 2, 7),
(47, 12, 12, 0, '-', 'v', 3, 7),
(48, 10, 10, 0, '-', 'v', 4, 7),
(49, 15, 15, 0, '-', 'v', 5, 7),
(50, 16, 16, 0, '-', 'v', 6, 7),
(51, 14, 14, 0, '-', 'v', 1, 8),
(52, 14, 14, 0, '-', 'v', 2, 8),
(53, 10, 10, 0, '-', 'v', 3, 8),
(54, 18, 18, 0, '-', 'v', 4, 8),
(55, 19, 19, 0, '-', 'v', 5, 8),
(56, 10, 10, 0, '-', 'v', 6, 8),
(58, 11, 11, 0, '-', 'v', 2, 9),
(59, 17, 17, 0, '-', 'v', 3, 9),
(60, 14, 14, 0, '-', 'v', 4, 9),
(61, 17, 17, 0, '-', 'v', 5, 9),
(62, 12, 12, 0, '-', 'v', 6, 9),
(64, 17, 17, 0, '-', 'v', 2, 10),
(65, 17, 17, 0, '-', 'v', 3, 10),
(66, 14, 14, 0, '-', 'v', 4, 10),
(67, 19, 19, 0, '-', 'v', 5, 10),
(68, 15, 15, 0, '-', 'v', 6, 10),
(70, 12, 12, 0, '-', 'v', 2, 11),
(71, 17, 17, 0, '-', 'v', 3, 11),
(72, 10, 10, 0, '-', 'v', 4, 11),
(73, 10, 10, 0, '-', 'v', 5, 11),
(74, 19, 19, 0, '-', 'v', 6, 11),
(76, 13, 13, 0, '-', 'v', 2, 12),
(77, 18, 18, 0, '-', 'v', 3, 12),
(78, 14, 14, 0, '-', 'v', 4, 12),
(79, 14, 14, 0, '-', 'v', 5, 12),
(80, 18, 18, 0, '-', 'v', 6, 12);

-- --------------------------------------------------------

--
-- Structure de la table `module`
--

CREATE TABLE `module` (
  `idModule` bigint(20) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `titre` varchar(255) DEFAULT NULL,
  `idNiveau` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `module`
--

INSERT INTO `module` (`idModule`, `code`, `titre`, `idNiveau`) VALUES
(1, '1', 'JEE & .NET', 4),
(2, '2', 'Python pour les sciences de données', 4),
(3, '3', 'Langues & Communication', 4),
(4, '4', 'Linux et programmation système', 4),
(5, '5', 'Administration Base Données', 4),
(6, '6', 'Administration réseaux et systèmes', 4),
(7, '7', 'Entreprenariat 2', 4),
(8, '8', 'Machine Learning ', 4),
(9, '9', 'Crypto-systèmes & Sécurité', 4),
(10, '10', 'Web 2 : Applications Modernes', 4),
(11, '11', 'Gestion de projet & Génie logiciel', 4),
(12, '12', 'Programmation Java', 4),
(13, '13', 'Mathématique pour l\'ingénieur', 6),
(14, '14', 'Programmation événementielle', 6),
(15, '15', 'Mécanique des Fluides', 6),
(16, '16', 'Langues et Communication 1', 6),
(17, '17', 'Matériaux de Construction', 6),
(18, '18', 'Dessin, architecture', 6),
(19, '19', 'Urbanisme, Topologie', 6),
(20, '20', 'Résistance des Matériaux 1', 6),
(21, '21', 'Probabilité Statiques', 6),
(22, '22', 'Langues et Communication 2', 6),
(23, '23', 'Comptabilité', 6),
(24, '24', 'Equation de la physique', 6),
(25, '25', 'Logistique et Transport', 6),
(26, '26', 'Géotechnique 1', 6),
(27, '27', 'Béton Armé 1', 6),
(28, '28', 'Résistance de Matériaux 2', 6);

-- --------------------------------------------------------

--
-- Structure de la table `niveau`
--

CREATE TABLE `niveau` (
  `idNiveau` bigint(20) NOT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `titre` varchar(255) DEFAULT NULL,
  `idFiliere` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `niveau`
--

INSERT INTO `niveau` (`idNiveau`, `alias`, `titre`, `idFiliere`) VALUES
(1, 'CP1', 'Premiere Annee Cycle Preparatoire', 1),
(2, 'CP2', 'Deuxieme Annee Cycle Preparatoire', 1),
(3, 'GI1', 'Genie Informatique 1', 2),
(4, 'GI2', 'Genie Informatique 2', 2),
(6, 'GC1', 'Genie Civil 1', 3),
(7, 'GC2', 'Genie Civil 2', 3);

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE `role` (
  `idRole` bigint(20) NOT NULL,
  `nomRole` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`idRole`, `nomRole`) VALUES
(1, 'ROLE_ADMIN'),
(2, 'ROLE_PROF'),
(3, 'ROLE_CADRE_ADMIN'),
(4, 'ROLE_STUDENT'),
(5, 'ROLE_BIBLIO');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `idUtilisateur` bigint(20) NOT NULL,
  `cin` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `nomArabe` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `prenomArabe` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`idUtilisateur`, `cin`, `email`, `nom`, `nomArabe`, `photo`, `prenom`, `prenomArabe`, `telephone`) VALUES
(8, 'BB100200', 'Dahhaj.oumayma@gmail.com', 'DAHHAJ', 'DAHHAJ', NULL, 'OUMAYMA', 'OUMAYMA', '0697955185'),
(9, 'BB100201', 'med1@med.com', 'BOUDAA', 'med', NULL, 'Mohamed', 'med', '060000001'),
(10, 'BB100203', 'dqsdsqd', 'dqdqsd', 'dqsdqdqsd', NULL, 'dsqd', 'dqdqd', '060000002'),
(11, 'BB100202', 'dsqdqs', 'dsqd', 'dsqdqsd', NULL, 'aaa', 'dqsdqsd', '060000003'),
(12, 'BB100204', 'karama@karam.fr', 'KARAM', 'KARAM', NULL, 'KARAM', 'KARAM', '0666666666'),
(13, 'BB000900', 'agouzzal.ghizlane@gmail.com', 'AGOUZZAL', 'AGOUZZAL', NULL, 'GHIZLANE', 'GHIZLANE', '0610203040'),
(14, 'BB000901', 'ait bamoh.hamza@gmail.com', 'AIT BAMOH', 'AIT BAMOH', NULL, 'HAMZA', 'HAMZA', '0610203041'),
(15, 'BB000902', 'ait louhou.mohamed@gmail.com', 'AIT LOUHOU', 'AIT LOUHOU', NULL, 'MOHAMED', 'MOHAMED', '0610203042'),
(16, 'BB000903', 'ajbilou.mohammed@gmail.com', 'AJBILOU', 'AJBILOU', NULL, 'MOHAMMED', 'MOHAMMED', '0610203043'),
(17, 'BB000904', 'allali.ayoub@gmail.com', 'ALLALI', 'ALLALI', NULL, 'AYOUB', 'AYOUB', '0610203044'),
(18, 'BB000905', 'amakssoum.amar@gmail.com', 'AMAKSSOUM', 'AMAKSSOUM', NULL, 'AMAR', 'AMAR', '0610203045'),
(19, 'BB000906', 'ansari.rajae@gmail.com', 'ANSARI', 'ANSARI', NULL, 'RAJAE', 'RAJAE', '0610203046'),
(20, 'BB000907', 'antara.walid@gmail.com', 'ANTARA', 'ANTARA', NULL, 'WALID', 'WALID', '0610203047'),
(21, 'BB000908', 'ayadi.mohamed@gmail.com', 'AYADI', 'AYADI', NULL, 'MOHAMED', 'MOHAMED', '0610203048'),
(22, 'BB000909', 'azahriou.fatima@gmail.com', 'AZAHRIOU', 'AZAHRIOU', NULL, 'FATIMA', 'FATIMA', '0610203049'),
(23, 'BB000910', 'azouaoui.merieme@gmail.com', 'AZOUAOUI', 'AZOUAOUI', NULL, 'MERIEME', 'MERIEME', '0610203050'),
(24, 'BB000911', 'belaoud.abdelhalim@gmail.com', 'BELAOUD', 'BELAOUD', NULL, 'ABDELHALIM', 'ABDELHALIM', '0610203051'),
(25, 'BB000912', 'bouzelmat.rania@gmail.com', 'BOUZELMAT', 'BOUZELMAT', NULL, 'RANIA', 'RANIA', '0610203052'),
(26, 'BB000913', 'chababi.ayoub@gmail.com', 'CHABABI', 'CHABABI', NULL, 'AYOUB', 'AYOUB', '0610203053'),
(27, 'BB000914', 'charroud.omaima@gmail.com', 'CHARROUD', 'CHARROUD', NULL, 'OMAIMA', 'OMAIMA', '0610203054'),
(28, 'BB000915', 'chrit.soukaina@gmail.com', 'CHRIT', 'CHRIT', NULL, 'SOUKAINA', 'SOUKAINA', '0610203055'),
(29, 'BB000916', 'dhj.oumayma@gmail.com', 'bikitarne', 'Bikitarne', NULL, 'ELmehdi', 'El mehdi', '0610203056'),
(30, 'BB000917', 'dahou.soukayna@gmail.com', 'DAHOU', 'DAHOU', NULL, 'SOUKAYNA', 'SOUKAYNA', '0610203057'),
(31, 'BB000918', 'eddarraji.omaima@gmail.com', 'EDDARRAJI', 'EDDARRAJI', NULL, 'OMAIMA', 'OMAIMA', '0610203058'),
(32, 'BB000919', 'ei ouadi.ikram@gmail.com', 'EI OUADI', 'EI OUADI', NULL, 'IKRAM', 'IKRAM', '0610203059'),
(33, 'BB000920', 'el bakouri.kaoutar@gmail.com', 'EL BAKOURI', 'EL BAKOURI', NULL, 'KAOUTAR', 'KAOUTAR', '0610203060'),
(34, 'BB000921', 'el haddadi.ayoub@gmail.com', 'EL HADDADI', 'EL HADDADI', NULL, 'AYOUB', 'AYOUB', '0610203061'),
(35, 'BB000922', 'el idrissi.ayoub@gmail.com', 'EL IDRISSI', 'EL IDRISSI', NULL, 'AYOUB', 'AYOUB', '0610203062'),
(36, 'BB000923', 'el jaimi.fatima@gmail.com', 'EL JAIMI', 'EL JAIMI', NULL, 'FATIMA', 'FATIMA', '0610203063'),
(37, 'BB000924', 'el kaiche.hamza@gmail.com', 'EL KAICHE', 'EL KAICHE', NULL, 'HAMZA', 'HAMZA', '0610203064'),
(38, 'BB000925', 'el-hassany.achraf@gmail.com', 'EL-HASSANY', 'EL-HASSANY', NULL, 'ACHRAF', 'ACHRAF', '0610203065'),
(39, 'BB000926', 'elbairi.assia@gmail.com', 'ELBAIRI', 'ELBAIRI', NULL, 'ASSIA', 'ASSIA', '0610203066'),
(40, 'BB000927', 'ennoukra.abdelghani@gmail.com', 'ENNOUKRA', 'ENNOUKRA', NULL, 'ABDELGHANI', 'ABDELGHANI', '0610203067'),
(41, 'BB000928', 'essaiydy.zakariae@gmail.com', 'ESSAIYDY', 'ESSAIYDY', NULL, 'ZAKARIAE', 'ZAKARIAE', '0610203068'),
(42, 'BB000929', 'et-touizi.fatima ezzahra@gmail.com', 'ET-TOUIZI', 'ET-TOUIZI', NULL, 'FATIMA EZZAHRA', 'FATIMA EZZAHRA', '0610203069'),
(43, 'BB000930', 'ez-zahri.dounia@gmail.com', 'EZ-ZAHRI', 'EZ-ZAHRI', NULL, 'DOUNIA', 'DOUNIA', '0610203070'),
(44, 'BB000931', 'fdil.souad@gmail.com', 'FDIL', 'FDIL', NULL, 'SOUAD', 'SOUAD', '0610203071'),
(45, 'BB000932', 'felioune.wissal@gmail.com', 'FELIOUNE', 'FELIOUNE', NULL, 'WISSAL', 'WISSAL', '0610203072'),
(46, 'BB000933', 'fhal.youssef@gmail.com', 'FHAL', 'FHAL', NULL, 'YOUSSEF', 'YOUSSEF', '0610203073'),
(47, 'BB000934', 'gallab.imane@gmail.com', 'GALLAB', 'GALLAB', NULL, 'IMANE', 'IMANE', '0610203074'),
(48, 'BB000935', 'halimi.iliass@gmail.com', 'HALIMI', 'HALIMI', NULL, 'ILIASS', 'ILIASS', '0610203075'),
(49, 'BB000936', 'hamdaoui.fatima ezzahra@gmail.com', 'HAMDAOUI', 'HAMDAOUI', NULL, 'FATIMA EZZAHRA', 'FATIMA EZZAHRA', '0610203076'),
(50, 'BB000937', 'hamdat.fatine@gmail.com', 'HAMDAT', 'HAMDAT', NULL, 'FATINE', 'FATINE', '0610203077'),
(51, 'BB000938', 'jaddou.houda@gmail.com', 'JADDOU', 'JADDOU', NULL, 'HOUDA', 'HOUDA', '0610203078'),
(52, 'BB000939', 'jaouad.mostafa@gmail.com', 'JAOUAD', 'JAOUAD', NULL, 'MOSTAFA', 'MOSTAFA', '0610203079'),
(53, 'BB000940', 'kavege.kodjo godwin leger@gmail.com', 'KAVEGE', 'KAVEGE', NULL, 'KODJO GODWIN LEGER', 'KODJO GODWIN LEGER', '0610203080'),
(54, 'BB000941', 'kharbouche.widad@gmail.com', 'KHARBOUCHE', 'KHARBOUCHE', NULL, 'WIDAD', 'WIDAD', '0610203081'),
(55, 'BB000942', 'laboudi.oumaima@gmail.com', 'LABOUDI', 'LABOUDI', NULL, 'OUMAIMA', 'OUMAIMA', '0610203082'),
(56, 'BB000943', 'lahyane.mohamed@gmail.com', 'LAHYANE', 'LAHYANE', NULL, 'MOHAMED', 'MOHAMED', '0610203083'),
(57, 'BB000944', 'lamine.abdelmajid@gmail.com', 'LAMINE', 'LAMINE', NULL, 'ABDELMAJID', 'ABDELMAJID', '0610203084'),
(58, 'BB000945', 'loukili.hicham@gmail.com', 'LOUKILI', 'LOUKILI', NULL, 'HICHAM', 'HICHAM', '0610203085'),
(59, 'BB000946', 'mardi.fatima@gmail.com', 'MARDI', 'MARDI', NULL, 'FATIMA', 'FATIMA', '0610203086'),
(60, 'BB000947', 'mhanni.fatima- zahra@gmail.com', 'MHANNI', 'MHANNI', NULL, 'FATIMA- ZAHRA', 'FATIMA- ZAHRA', '0610203087'),
(61, 'BB000948', 'moina hadidja.mohamed chakir@gmail.com', 'MOINA HADIDJA', 'MOINA HADIDJA', NULL, 'MOHAMED CHAKIR', 'MOHAMED CHAKIR', '0610203088'),
(62, 'BB000949', 'naim.hajar@gmail.com', 'NAIM', 'NAIM', NULL, 'HAJAR', 'HAJAR', '0610203089'),
(63, 'BB000950', 'nassih.amal@gmail.com', 'NASSIH', 'NASSIH', NULL, 'AMAL', 'AMAL', '0610203090'),
(64, 'BB000951', 'ouafik.maryam@gmail.com', 'OUAFIK', 'OUAFIK', NULL, 'MARYAM', 'MARYAM', '0610203091'),
(65, 'BB000952', 'ouharrouch.amine@gmail.com', 'OUHARROUCH', 'OUHARROUCH', NULL, 'AMINE', 'AMINE', '0610203092'),
(66, 'BB000953', 'oumellahni.nabil@gmail.com', 'OUMELLAHNI', 'OUMELLAHNI', NULL, 'NABIL', 'NABIL', '0610203093'),
(67, 'BB000954', 'ounir.ikram@gmail.com', 'OUNIR', 'OUNIR', NULL, 'IKRAM', 'IKRAM', '0610203094'),
(68, 'BB000955', 'outnoumar.samia@gmail.com', 'OUTNOUMAR', 'OUTNOUMAR', NULL, 'SAMIA', 'SAMIA', '0610203095'),
(69, 'BB000956', 'ouzizi.ghizlane@gmail.com', 'OUZIZI', 'OUZIZI', NULL, 'GHIZLANE', 'GHIZLANE', '0610203096'),
(70, 'BB000957', 'rachid.maryam@gmail.com', 'RACHID', 'RACHID', NULL, 'MARYAM', 'MARYAM', '0610203097'),
(71, 'BB000958', 'sghir.hajar@gmail.com', 'SGHIR', 'SGHIR', NULL, 'HAJAR', 'HAJAR', '0610203098'),
(72, 'BB000959', 'smaidi.reda@gmail.com', 'SMAIDI', 'SMAIDI', NULL, 'REDA', 'REDA', '0610203099'),
(73, 'BB000960', 'terrab.yousra@gmail.com', 'TERRAB', 'TERRAB', NULL, 'YOUSRA', 'YOUSRA', '0610203100'),
(74, 'BB000961', 'tetereou.aboudourazakou@gmail.com', 'TETEREOU', 'TETEREOU', NULL, 'ABOUDOURAZAKOU', 'ABOUDOURAZAKOU', '0610203101'),
(75, 'BB000962', 'yacoubi.hanane@gmail.com', 'YACOUBI', 'YACOUBI', NULL, 'HANANE', 'HANANE', '0610203102'),
(76, 'BB000963', 'zouhri.el mehdi@gmail.com', 'ZOUHRI', 'ZOUHRI', NULL, 'EL MEHDI', 'EL MEHDI', '0610203103');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `cadreadministrateur`
--
ALTER TABLE `cadreadministrateur`
  ADD PRIMARY KEY (`idCardreAdmin`);

--
-- Index pour la table `compte`
--
ALTER TABLE `compte`
  ADD PRIMARY KEY (`idCompte`),
  ADD KEY `FK4me3b7yms83bsk757qlkk5icm` (`idUtilisateur`),
  ADD KEY `FK6rqvo0g5sv97xlbrragf5rwn3` (`idRole`);

--
-- Index pour la table `element`
--
ALTER TABLE `element`
  ADD PRIMARY KEY (`idMatiere`),
  ADD KEY `FKpy7uud3qt1x365dnkff4f41l8` (`idModule`);

--
-- Index pour la table `enseignant`
--
ALTER TABLE `enseignant`
  ADD PRIMARY KEY (`idEnseighant`);

--
-- Index pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD PRIMARY KEY (`idEtudiant`);

--
-- Index pour la table `filiere`
--
ALTER TABLE `filiere`
  ADD PRIMARY KEY (`idFiliere`);

--
-- Index pour la table `formule`
--
ALTER TABLE `formule`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nom` (`nom`),
  ADD UNIQUE KEY `expression` (`expression`);

--
-- Index pour la table `inscriptionannuelle`
--
ALTER TABLE `inscriptionannuelle`
  ADD PRIMARY KEY (`idInscription`),
  ADD KEY `FKge2xwqtfeqnojw9no8og6vbqn` (`idEtudiant`),
  ADD KEY `FK9lrdmhkam481adiwotdpqo8w` (`idNiveau`);

--
-- Index pour la table `inscriptionmatiere`
--
ALTER TABLE `inscriptionmatiere`
  ADD PRIMARY KEY (`idInscriptionMatiere`),
  ADD KEY `FK6om7ooil7qy2ipbtocv7hqrwo` (`idMatiere`),
  ADD KEY `noteSN` (`noteSN`),
  ADD KEY `FKdrefbosgrrf561bghbosk681q` (`idInscription`);

--
-- Index pour la table `inscriptionmodule`
--
ALTER TABLE `inscriptionmodule`
  ADD PRIMARY KEY (`idInscriptionModule`),
  ADD KEY `FK2rp4wu9gg4s1yvbannj858m3c` (`idInscription`),
  ADD KEY `FKsfog581rh033dgomu0u7xywgd` (`idModule`);

--
-- Index pour la table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`idModule`),
  ADD KEY `FK2kgd6okkiatvq3do7akj1cm2k` (`idNiveau`);

--
-- Index pour la table `niveau`
--
ALTER TABLE `niveau`
  ADD PRIMARY KEY (`idNiveau`),
  ADD KEY `FK9qvkxk4ayqkjopclmlgoel8d9` (`idFiliere`);

--
-- Index pour la table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`idRole`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`idUtilisateur`),
  ADD UNIQUE KEY `UK_s4m395xkorrxtrdbuk1upglup` (`cin`),
  ADD UNIQUE KEY `UK_35ysk0sh9ruwixrld3nc0weut` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `compte`
--
ALTER TABLE `compte`
  MODIFY `idCompte` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `element`
--
ALTER TABLE `element`
  MODIFY `idMatiere` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `filiere`
--
ALTER TABLE `filiere`
  MODIFY `idFiliere` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `inscriptionannuelle`
--
ALTER TABLE `inscriptionannuelle`
  MODIFY `idInscription` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT pour la table `inscriptionmatiere`
--
ALTER TABLE `inscriptionmatiere`
  MODIFY `idInscriptionMatiere` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `inscriptionmodule`
--
ALTER TABLE `inscriptionmodule`
  MODIFY `idInscriptionModule` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT pour la table `module`
--
ALTER TABLE `module`
  MODIFY `idModule` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT pour la table `niveau`
--
ALTER TABLE `niveau`
  MODIFY `idNiveau` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `role`
--
ALTER TABLE `role`
  MODIFY `idRole` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `cadreadministrateur`
--
ALTER TABLE `cadreadministrateur`
  ADD CONSTRAINT `FKq2jdlid8esk1jlagny4qhrh2k` FOREIGN KEY (`idCardreAdmin`) REFERENCES `utilisateur` (`idUtilisateur`);

--
-- Contraintes pour la table `compte`
--
ALTER TABLE `compte`
  ADD CONSTRAINT `FK4me3b7yms83bsk757qlkk5icm` FOREIGN KEY (`idUtilisateur`) REFERENCES `utilisateur` (`idUtilisateur`),
  ADD CONSTRAINT `FK6rqvo0g5sv97xlbrragf5rwn3` FOREIGN KEY (`idRole`) REFERENCES `role` (`idRole`);

--
-- Contraintes pour la table `element`
--
ALTER TABLE `element`
  ADD CONSTRAINT `FKpy7uud3qt1x365dnkff4f41l8` FOREIGN KEY (`idModule`) REFERENCES `module` (`idModule`);

--
-- Contraintes pour la table `enseignant`
--
ALTER TABLE `enseignant`
  ADD CONSTRAINT `FKk26kuxt8qhs6nqv41b2hiyqwb` FOREIGN KEY (`idEnseighant`) REFERENCES `utilisateur` (`idUtilisateur`);

--
-- Contraintes pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD CONSTRAINT `FKkku0boly4both705vo0fri81c` FOREIGN KEY (`idEtudiant`) REFERENCES `utilisateur` (`idUtilisateur`);

--
-- Contraintes pour la table `inscriptionannuelle`
--
ALTER TABLE `inscriptionannuelle`
  ADD CONSTRAINT `FK9lrdmhkam481adiwotdpqo8w` FOREIGN KEY (`idNiveau`) REFERENCES `niveau` (`idNiveau`),
  ADD CONSTRAINT `FKge2xwqtfeqnojw9no8og6vbqn` FOREIGN KEY (`idEtudiant`) REFERENCES `etudiant` (`idEtudiant`);

--
-- Contraintes pour la table `inscriptionmatiere`
--
ALTER TABLE `inscriptionmatiere`
  ADD CONSTRAINT `FK6om7ooil7qy2ipbtocv7hqrwo` FOREIGN KEY (`idMatiere`) REFERENCES `element` (`idMatiere`),
  ADD CONSTRAINT `FKdrefbosgrrf561bghbosk681q` FOREIGN KEY (`idInscription`) REFERENCES `inscriptionmodule` (`idInscriptionModule`);

--
-- Contraintes pour la table `inscriptionmodule`
--
ALTER TABLE `inscriptionmodule`
  ADD CONSTRAINT `FK2rp4wu9gg4s1yvbannj858m3c` FOREIGN KEY (`idInscription`) REFERENCES `inscriptionannuelle` (`idInscription`),
  ADD CONSTRAINT `FKsfog581rh033dgomu0u7xywgd` FOREIGN KEY (`idModule`) REFERENCES `module` (`idModule`);

--
-- Contraintes pour la table `module`
--
ALTER TABLE `module`
  ADD CONSTRAINT `FK2kgd6okkiatvq3do7akj1cm2k` FOREIGN KEY (`idNiveau`) REFERENCES `niveau` (`idNiveau`);

--
-- Contraintes pour la table `niveau`
--
ALTER TABLE `niveau`
  ADD CONSTRAINT `FK9qvkxk4ayqkjopclmlgoel8d9` FOREIGN KEY (`idFiliere`) REFERENCES `filiere` (`idFiliere`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
