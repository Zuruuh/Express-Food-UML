-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : jeu. 01 juil. 2021 à 14:53
-- Version du serveur :  5.7.24
-- Version de PHP : 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `expressfood`
--

-- --------------------------------------------------------

--
-- Structure de la table `account`
--

CREATE TABLE `account` (
  `account_id` int(11) NOT NULL,
  `first_name` varchar(32) NOT NULL,
  `last_name` varchar(32) NOT NULL,
  `register_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `email` varchar(48) NOT NULL,
  `password` varchar(64) NOT NULL,
  `phone_number` varchar(16) NOT NULL,
  `account_type` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `account`
--

INSERT INTO `account` (`account_id`, `first_name`, `last_name`, `register_date`, `email`, `password`, `phone_number`, `account_type`) VALUES
(1, 'Damien', 'Dupont', '2021-06-29 17:31:56', 'dupont.damien@gmail.com', '123456789', '0785135942', 'CUSTOMER'),
(2, 'Valérie', 'Marchand', '2021-06-29 17:35:17', 'valerie12marchand@protonmail.com', 'motDePasse', '0651258495', 'CUSTOMER'),
(3, 'Jérémy', 'Moulin', '2021-06-29 17:51:37', 'moulin.jeremy@hotmail.com', 'password', '0612154823', 'DELIVERY_MAN'),
(4, 'Dominique', 'Serle', '2021-06-29 17:55:00', 'serle.dominique@outlook.fr', 'azertyuiop', '0754286531', 'ADMIN');

-- --------------------------------------------------------

--
-- Structure de la table `customer`
--

CREATE TABLE `customer` (
  `account_id` int(11) NOT NULL,
  `balance` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `customer`
--

INSERT INTO `customer` (`account_id`, `balance`) VALUES
(1, 1599),
(2, 99);

-- --------------------------------------------------------

--
-- Structure de la table `customers_adresses`
--

CREATE TABLE `customers_adresses` (
  `adress_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `adress` varchar(128) NOT NULL,
  `number` varchar(8) NOT NULL,
  `city` varchar(48) NOT NULL,
  `postal_code` int(11) NOT NULL,
  `floor` int(11) NOT NULL,
  `code` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `customers_adresses`
--

INSERT INTO `customers_adresses` (`adress_id`, `account_id`, `adress`, `number`, `city`, `postal_code`, `floor`, `code`) VALUES
(1, 1, 'Rue des lilas', '15', 'Paris', 75004, 2, '5426B'),
(2, 1, 'Avenue des pommiers', '37', 'Paris', 75016, 7, '0798'),
(3, 2, 'avenue Lucien Michard', '12', 'Paris', 75002, 0, '0');

-- --------------------------------------------------------

--
-- Structure de la table `customers_order`
--

CREATE TABLE `customers_order` (
  `order_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `delivery_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  `payment_method_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `order_price` int(11) NOT NULL,
  `delivery_price` int(11) NOT NULL,
  `status` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `customers_order`
--

INSERT INTO `customers_order` (`order_id`, `account_id`, `delivery_id`, `address_id`, `payment_method_id`, `date`, `order_price`, `delivery_price`, `status`) VALUES
(1, 1, 3, 1, 1, '2021-06-29 12:05:36', 2990, 300, 'DELIVERED'),
(2, 2, 3, 1, 3, '2021-06-29 14:46:35', 1790, 300, 'DELIVERED');

-- --------------------------------------------------------

--
-- Structure de la table `customers_payment_methods`
--

CREATE TABLE `customers_payment_methods` (
  `payment_method_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `first_digits` int(11) NOT NULL,
  `second_digits` int(11) NOT NULL,
  `third_digits` int(11) NOT NULL,
  `fourth_digits` int(11) NOT NULL,
  `card_holder` varchar(32) NOT NULL,
  `exp_date` date NOT NULL,
  `cvv` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `customers_payment_methods`
--

INSERT INTO `customers_payment_methods` (`payment_method_id`, `account_id`, `first_digits`, `second_digits`, `third_digits`, `fourth_digits`, `card_holder`, `exp_date`, `cvv`) VALUES
(1, 1, 123, 4567, 891011, 1213, 'Dupont Damien', '2022-12-01', 123),
(2, 1, 5469, 7854, 5487, 3512, 'Dupont Damien', '2021-12-01', 798),
(3, 2, 6542, 1542, 3675, 6984, 'Marchand Valérie', '2022-05-01', 478);

-- --------------------------------------------------------

--
-- Structure de la table `delivery_man`
--

CREATE TABLE `delivery_man` (
  `delivery_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `latitude` varchar(32) NOT NULL,
  `longitude` varchar(32) NOT NULL,
  `available` tinyint(4) NOT NULL,
  `dish_id` int(11) DEFAULT NULL,
  `average_rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `delivery_man`
--

INSERT INTO `delivery_man` (`delivery_id`, `account_id`, `order_id`, `latitude`, `longitude`, `available`, `dish_id`, `average_rating`) VALUES
(3, 3, NULL, '48.894950', '2.310900', 0, NULL, 45);

-- --------------------------------------------------------

--
-- Structure de la table `dishes`
--

CREATE TABLE `dishes` (
  `dish_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `dish_type` varchar(16) NOT NULL,
  `date` date NOT NULL,
  `unit_pricing` int(11) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `dishes`
--

INSERT INTO `dishes` (`dish_id`, `name`, `dish_type`, `date`, `unit_pricing`, `description`) VALUES
(1, 'Escalope Viennoise', 'MAIN_COURSE', '2021-06-29', 840, 'L\'escalope viennoise (Wiener Schnitzel) est une fine escalope de veau pannée.'),
(2, 'Blanquette de veau', 'MAIN_COURSE', '2021-06-29', 1620, 'La blanquette est un classique de la cuisine familiale Française, mais aussi de la cuisine de bistrot. C\'est de la viande de veau cuite longuement, et dont la sauce est liée (épaissie) avec un mélange de jaunes d\'œuf et de crème. Je vous propose une façon un peu spéciale de la réaliser.'),
(3, 'Thon mariné aux herbes', 'MAIN_COURSE', '2021-06-29', 2230, 'Voici une recette très simple de thon mariné, à cuire de préférence au barbecue ou à la plancha, mais ce n\'est pas un impératif. Comme c\'est une recette vite faite, bien faite, façon cuisine d\'été, les proportions sont très vagues, vous en mettrez selon votre goût.'),
(4, 'Rôti de porc à la sauge', 'MAIN_COURSE', '2021-06-29', 1450, 'La viande blanche, ici du porc, s\'accorde naturellement très bien à la sauge, mais dans cette recette on va en augmenter les saveurs par une cuisson longue dite \"au sac\".\r\n\r\nLe rôti de porc, simplement salé et poivré va être mis dans un sac de cuisson, et cuit plusieurs heures à faible température.\r\n\r\nLe délicieux jus de cuisson obtenu servira a faire cuire les légumes de garniture, navets et artichauts violets, qui seront donc braisés.\r\n\r\nC\'est une recette toute en douceur, en délicieuse lenteur, qui donne un plat très savoureux.'),
(5, 'Tartelettes au citron vert ', 'DESSERT', '2021-06-29', 240, 'Avec cette recette très rapide, vous ferez des tartelettes qui n\'ont rien à envier à celles du commerce.\r\n\r\n'),
(6, 'Pain perdu', 'DESSERT', '2021-06-29', 170, 'Le pain perdu, ce sont des tranches de pain qu\'on trempe dans un mélange de lait, crème, jaunes d\'œufs et sucre vanillé, puis qu\'on fait ensuite dorer à la poêle. C\'est très simple, et surtout à se damner tellement c\'est bon !'),
(7, 'Amaretti ', 'DESSERT', '2021-06-29', 770, 'Les amaretti, ce sont des petits biscuits italiens aux amandes. Un peu comme des meringues, mais très sucrées, et avec de la poudre d\'amandes.\r\n\r\n'),
(8, 'Crème au chocolat', 'DESSERT', '2021-06-29', 210, 'Une recette très simple au gout de chocolat très prononcé.\r\nCrème, lait et chocolat, mélangés à des jaunes d\'œufs et du sucre, qu\'on fait cuire au four, au bain-marie un peu comme pour une crème brulée.');

-- --------------------------------------------------------

--
-- Structure de la table `orders_content`
--

CREATE TABLE `orders_content` (
  `order_content_id` int(11) NOT NULL,
  `dish_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `discount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `orders_content`
--

INSERT INTO `orders_content` (`order_content_id`, `dish_id`, `order_id`, `quantity`, `discount`) VALUES
(1, 2, 2, 1, 0),
(2, 6, 2, 1, 0),
(3, 3, 1, 1, 500),
(4, 1, 1, 1, 0),
(5, 8, 1, 2, 0);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`account_id`);

--
-- Index pour la table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`account_id`);

--
-- Index pour la table `customers_adresses`
--
ALTER TABLE `customers_adresses`
  ADD PRIMARY KEY (`adress_id`),
  ADD KEY `account_id` (`account_id`);

--
-- Index pour la table `customers_order`
--
ALTER TABLE `customers_order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `address_id` (`address_id`),
  ADD KEY `delivery_id` (`delivery_id`),
  ADD KEY `payment_method_id` (`payment_method_id`);

--
-- Index pour la table `customers_payment_methods`
--
ALTER TABLE `customers_payment_methods`
  ADD PRIMARY KEY (`payment_method_id`),
  ADD KEY `account_id` (`account_id`);

--
-- Index pour la table `delivery_man`
--
ALTER TABLE `delivery_man`
  ADD PRIMARY KEY (`delivery_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `dish_id` (`dish_id`),
  ADD KEY `account_id` (`account_id`);

--
-- Index pour la table `dishes`
--
ALTER TABLE `dishes`
  ADD PRIMARY KEY (`dish_id`);

--
-- Index pour la table `orders_content`
--
ALTER TABLE `orders_content`
  ADD PRIMARY KEY (`order_content_id`),
  ADD KEY `dish_id` (`dish_id`),
  ADD KEY `order_id` (`order_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `account`
--
ALTER TABLE `account`
  MODIFY `account_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `customers_adresses`
--
ALTER TABLE `customers_adresses`
  MODIFY `adress_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `customers_order`
--
ALTER TABLE `customers_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `customers_payment_methods`
--
ALTER TABLE `customers_payment_methods`
  MODIFY `payment_method_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `delivery_man`
--
ALTER TABLE `delivery_man`
  MODIFY `delivery_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `dishes`
--
ALTER TABLE `dishes`
  MODIFY `dish_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `orders_content`
--
ALTER TABLE `orders_content`
  MODIFY `order_content_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`);

--
-- Contraintes pour la table `customers_adresses`
--
ALTER TABLE `customers_adresses`
  ADD CONSTRAINT `customers_adresses_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`);

--
-- Contraintes pour la table `customers_order`
--
ALTER TABLE `customers_order`
  ADD CONSTRAINT `customers_order_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`),
  ADD CONSTRAINT `customers_order_ibfk_2` FOREIGN KEY (`address_id`) REFERENCES `customers_adresses` (`adress_id`),
  ADD CONSTRAINT `customers_order_ibfk_3` FOREIGN KEY (`delivery_id`) REFERENCES `delivery_man` (`delivery_id`),
  ADD CONSTRAINT `customers_order_ibfk_4` FOREIGN KEY (`payment_method_id`) REFERENCES `customers_payment_methods` (`payment_method_id`);

--
-- Contraintes pour la table `customers_payment_methods`
--
ALTER TABLE `customers_payment_methods`
  ADD CONSTRAINT `customers_payment_methods_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`);

--
-- Contraintes pour la table `delivery_man`
--
ALTER TABLE `delivery_man`
  ADD CONSTRAINT `delivery_man_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `customers_order` (`order_id`),
  ADD CONSTRAINT `delivery_man_ibfk_2` FOREIGN KEY (`dish_id`) REFERENCES `dishes` (`dish_id`),
  ADD CONSTRAINT `delivery_man_ibfk_3` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `orders_content`
--
ALTER TABLE `orders_content`
  ADD CONSTRAINT `orders_content_ibfk_1` FOREIGN KEY (`dish_id`) REFERENCES `dishes` (`dish_id`),
  ADD CONSTRAINT `orders_content_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `customers_order` (`order_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
