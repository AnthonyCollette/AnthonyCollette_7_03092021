-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 01 oct. 2021 à 11:42
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
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `comments`
--

INSERT INTO `comments` (`id`, `userid`, `text`, `postid`) VALUES
(31, 25, 'Ahah oui, réplique culte !', 62),
(39, 22, 'Ahah oui, j\'adore cette série !', 63),
(41, 19, 'Oui, elle est top !', 63),
(46, 29, 'Au top cette série !', 64);

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
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `posts`
--

INSERT INTO `posts` (`id`, `text`, `userid`, `image`) VALUES
(62, 'Ahah, sacré Joey !', 8, 'http://localhost:3000/images/39d4c5e5b23963bb452e357eb32162a0.gif1631952441917.gif'),
(63, 'Brooklyn 99 ♥', 25, 'http://localhost:3000/images/brooklyn-nine-nine-brooklyn99.gif1631988670211.gif'),
(64, 'Excellent !', 22, 'http://localhost:3000/images/giphy_(2).gif1631989309665.gif');

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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `avatar`, `role`) VALUES
(8, 'Anthony', 'monadressemail1@gmail.com', '$2b$10$.Nra7ySoLX0aSBmghGHEye74i5QdVk6js.0IvsfNqYJDmMPUZnBhC', 'http://localhost:3000/images/avataaars_(5).png1631573790625.png', 'membre'),
(19, 'Beth', 'monadressemail11@gmail.com', '$2b$10$DLoa6nNl7LtuPMeAe7EQ3epKz.6.A3Trrdwxa3YnI648hUPvdDefq', 'http://localhost:3000/images/avataaars.png1630716611534.png', 'membre'),
(20, 'Grégoire', 'monadressemail12@gmail.com', '$2b$10$Ey9bjJTjiY.d02k91R.lBez..R3idUr1SRk8S/NN4Ss3NcAVmHr2C', 'http://localhost:3000/images/avataaars_(1).png1630797097898.png', 'membre'),
(21, 'Timothée', 'monadressemail13@gmail.com', '$2b$10$jMEiFE0bUQdrOgzwqx3BeOT.7MIWy8J7dLhZNMa3cQ2qHxm1UfH1u', 'http://localhost:3000/images/avataaars_(2).png1630801219435.png', 'membre'),
(22, 'Jade', 'monadressemail14@gmail.com', '$2b$10$9jDlIiCpjUY62Ph4Nv8Y9utpq.8lwzDDCGmxSQ2gWaS3NEj4hziYu', 'http://localhost:3000/images/avataaars_(3).png1631095847236.png', 'membre'),
(23, 'Georgio', 'monadressemail15@gmail.com', '$2b$10$RmWUGkBehVKX60HNMymhluKj62whHG8nzZOmas7qRAAZvAkNuMbxO', 'http://localhost:3000/images/avataaars_(4).png1631095916743.png', 'membre'),
(24, 'Sébastien', 'monadressemail16@gmail.com', '$2b$10$lWXieexkzTXMXQTqb972Qeq0E3DKYm/XWd7fqaS.GY7kuauv/X.vm', 'http://localhost:3000/images/avataaars_(5).png1631118923225.png', 'membre'),
(25, 'Paul', 'monadressemail2@gmail.com', '$2b$10$hjw./n2tIgAxHRY321zH2uR17vprwVPm8tZhAeLjpmWX0wTP3cT0m', 'http://localhost:3000/images/avataaars_(7).png1631784038376.png', 'membre'),
(26, 'Jeanne', 'monadressemail3@gmail.com', '$2b$10$qr2yEWEuii8.viHSEY/9.OwwIw1FWTZo8c6EmwwFUTBNeqeVe93W6', 'http://localhost:3000/images/avataaars_(8).png1631784380105.png', 'membre'),
(27, 'Georges', 'monadressemail4@gmail.com', '$2b$10$xYdPcb2s8sWk9/gFbwq9N.rFRQoUmkHSYmhU6Mov3BSIRps4jyUR.', 'http://localhost:3000/images/avataaars_(6).png1631877157706.png', 'membre'),
(28, 'Théo', 'monadressemail5@gmail.com', '$2b$10$GQ4KmCa/loxRUtMUKOGYxOQ4jNqGqtgdRnh8tSnLtr/VPRxgvjLO6', 'http://localhost:3000/images/avataaars_(8).png1631888088678.png', 'membre'),
(29, 'Admin', 'admin@gmail.com', '$2b$10$URGDd8k3vgjnLX1K6LsUo.yoOSmfqjBOC.MfqPzDpuBGMT9LkbR62', 'http://localhost:3000/images/avataaars_(9).png1631893438902.png', 'admin'),
(30, 'Julia', 'monadressemail6@gmail.com', '$2b$10$.VBZqacPT87DWv2.dTvEweV.JIlTwVOYYgas0BjYiZinAk8iwORb.', 'http://localhost:3000/images/avataaars_(10).png1631951243662.png', 'membre');

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
