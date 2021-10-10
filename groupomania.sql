-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : Dim 10 oct. 2021 à 14:09
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `groupomania`
--

-- --------------------------------------------------------

--
-- Structure de la table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `postid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `postid` (`postid`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `comments`
--

INSERT INTO `comments` (`id`, `userid`, `text`, `postid`) VALUES
(47, 32, 'Oh oui, c\'est dans les premières saisons de Friends non ?', 65),
(48, 33, 'Oui Julia, il me semble bien !', 65),
(49, 33, 'Ahah oui, elle est au top !', 66),
(50, 34, 'Ah oui ! C\'est The Office non ?', 66);

-- --------------------------------------------------------

--
-- Structure de la table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(500) NOT NULL,
  `userid` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_post_users` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `posts`
--

INSERT INTO `posts` (`id`, `text`, `userid`, `image`) VALUES
(65, 'Ahah, réplique culte de Joey !', 31, 'http://localhost:3000/images/39d4c5e5b23963bb452e357eb32162a0.gif1633866693560.gif'),
(66, 'J\'aime beaucoup cette série également !', 32, 'http://localhost:3000/images/giphy_(2).gif1633866785636.gif'),
(67, 'Pour continuer dans les séries, vous connaissez Brooklyn 99 ?', 34, 'http://localhost:3000/images/giphy_(1).gif1633866948628.gif');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `role` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `avatar`, `role`) VALUES
(31, 'Admin', 'admin@gmail.com', '$2b$10$d1tZX2nEmNGT2AQcR6kwDeMTjtN/khuIrN4zoAzP7tZ/nWW3ux3LS', 'http://localhost:3000/images/avataaars_(9).png1633866633576.png', 'admin'),
(32, 'Julia', 'monadressemail1@gmail.com', '$2b$10$7tjsKT3cPE.zeQOkBTyU4eGcarnt5bUewNMPaWtPVFMUb/.AwsTK2', 'http://localhost:3000/images/avataaars_(8).png1633866728473.png', 'membre'),
(33, 'Sébastien', 'monadressemail2@gmail.com', '$2b$10$whazZo9uQTfb//Dmf3gBI.akqBIa6tJcyOvqFPYkMI0/NF9wpm.56', 'http://localhost:3000/images/avataaars_(5).png1633866823828.png', 'membre'),
(34, 'Thomas', 'monadressemail3@gmail.com', '$2b$10$IhYzg0BG4Q.oozUz6PuchebkvsE6sZZSM8VWBYBcAPk7WW7vVEGHi', 'http://localhost:3000/images/avataaars_(7).png1633866882402.png', 'membre');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `fk_post_users` FOREIGN KEY (`userid`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
