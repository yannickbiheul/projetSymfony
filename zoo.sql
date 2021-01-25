-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : Dim 24 jan. 2021 à 10:27
-- Version du serveur :  10.4.14-MariaDB
-- Version de PHP : 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `zoo`
--

-- --------------------------------------------------------

--
-- Structure de la table `animal`
--

CREATE TABLE `animal` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `famille` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `poids` int(11) DEFAULT NULL,
  `espece_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `animal`
--

INSERT INTO `animal` (`id`, `nom`, `color`, `famille`, `poids`, `espece_id`) VALUES
(1, 'Taureau', 'black', 'mamif', 30, 1),
(2, 'Thon', 'gris', 'mamif2', 15, 2);

-- --------------------------------------------------------

--
-- Structure de la table `continent`
--

CREATE TABLE `continent` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `continent`
--

INSERT INTO `continent` (`id`, `libelle`) VALUES
(1, 'Europe'),
(2, 'Afrique'),
(3, 'Oceanie');

-- --------------------------------------------------------

--
-- Structure de la table `continent_animal`
--

CREATE TABLE `continent_animal` (
  `continent_id` int(11) NOT NULL,
  `animal_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `continent_animal`
--

INSERT INTO `continent_animal` (`continent_id`, `animal_id`) VALUES
(1, 1),
(2, 2),
(3, 1);

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20210120095833', '2021-01-20 11:04:39', 37),
('DoctrineMigrations\\Version20210121083414', '2021-01-21 09:34:40', 78),
('DoctrineMigrations\\Version20210121125112', '2021-01-21 14:29:23', 128),
('DoctrineMigrations\\Version20210122092309', '2021-01-22 10:23:32', 184);

-- --------------------------------------------------------

--
-- Structure de la table `espece`
--

CREATE TABLE `espece` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `espece`
--

INSERT INTO `espece` (`id`, `libelle`, `description`) VALUES
(1, 'mammifere', 'nourrit avec du lait'),
(2, 'poisson', 'nourrit avec du plancton');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `animal`
--
ALTER TABLE `animal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_6AAB231F2D191E7A` (`espece_id`);

--
-- Index pour la table `continent`
--
ALTER TABLE `continent`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `continent_animal`
--
ALTER TABLE `continent_animal`
  ADD PRIMARY KEY (`continent_id`,`animal_id`),
  ADD KEY `IDX_E557C2C8921F4C77` (`continent_id`),
  ADD KEY `IDX_E557C2C88E962C16` (`animal_id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `espece`
--
ALTER TABLE `espece`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `animal`
--
ALTER TABLE `animal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `continent`
--
ALTER TABLE `continent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `espece`
--
ALTER TABLE `espece`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `animal`
--
ALTER TABLE `animal`
  ADD CONSTRAINT `FK_6AAB231F2D191E7A` FOREIGN KEY (`espece_id`) REFERENCES `espece` (`id`);

--
-- Contraintes pour la table `continent_animal`
--
ALTER TABLE `continent_animal`
  ADD CONSTRAINT `FK_E557C2C88E962C16` FOREIGN KEY (`animal_id`) REFERENCES `animal` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_E557C2C8921F4C77` FOREIGN KEY (`continent_id`) REFERENCES `continent` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
