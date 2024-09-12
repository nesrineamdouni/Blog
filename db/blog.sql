-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 12 sep. 2024 à 03:21
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `blog`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `created_at`) VALUES
(1, 'Technologie ', 'Articles sur les dernières avancées technologiques, les gadgets, les logiciels, etc.', '2019-01-01 00:00:00'),
(2, 'Voyages ', 'Récits de voyage, conseils de voyage, destinations populaires, astuces pour voyager, etc.', '2019-01-01 00:00:00'),
(3, 'Santé et Bien-être', 'Conseils de santé, remise en forme, bien-être mental, modes de vie sains, etc.', '2024-09-12 01:23:38'),
(4, 'Entrepreneuriat ', 'Conseils en affaires, réussites entrepreneuriales, stratégies de démarrage, etc.', '2024-09-12 01:23:38');

-- --------------------------------------------------------

--
-- Structure de la table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `user_id_id` int(11) DEFAULT NULL,
  `post_id_id` int(11) DEFAULT NULL,
  `content` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `comments`
--

INSERT INTO `comments` (`id`, `user_id_id`, `post_id_id`, `content`) VALUES
(1, 1, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed finibus ultricies felis, et tempor nisi.'),
(7, 1, 5, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed finibus ultricies felis, et tempor nisi.'),
(8, 1, 5, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed finibus ultricies felis, et tempor nisi.'),
(15, 5, 5, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed finibus ultricies felis, et tempor nisi.');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `category_id_id` int(11) DEFAULT NULL,
  `author_id_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `created_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `image_path` varchar(255) DEFAULT NULL,
  `username_user` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `posts`
--

INSERT INTO `posts` (`id`, `category_id_id`, `author_id_id`, `title`, `content`, `created_at`, `image_path`, `username_user`) VALUES
(1, 1, 2, 'The Most Popular Series on Netflix Right Now', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed finibus ultricies felis, et tempor nisi. Proin vestibulum ex id nisl luctus, id tempus odio consequat. Phasellus tempus quis nibh id tempus. Cras dapibus condimentum blandit. Donec vestibulum eros risus, eget ornare libero gravida quis. Phasellus sed vestibulum ex. Nam vitae molestie lacus. Phasellus dignissim rutrum felis, quis ultrices risus elementum at. Maecenas sit amet sem sem. In malesuada interdum volutpat. Etiam mollis viverra justo at sagittis. Aliquam erat volutpat.\r\n\r\nNunc consequat nibh elit, quis scelerisque eros congue in. Nam consectetur pellentesque nibh in hendrerit. In a nisl suscipit, pulvinar urna id, fringilla massa. Sed elit nibh, malesuada ornare metus nec, porta laoreet massa. Nulla efficitur, felis ut fermentum condimentum, purus lorem varius libero, vestibulum malesuada eros sapien ullamcorper neque. Sed sit amet ipsum bibendum sem lacinia lobortis. Nam fringilla tellus ac sem hendrerit porttitor. Quisque eu quam tincidunt, egestas dolor vel, facilisis risus. Vivamus nec risus ac metus sollicitudin eleifend in sit amet velit.', '2019-01-01 00:00:00', '66db197596b6a.webp', 'Test1'),
(3, 1, 2, 'The Best Cameras of the Year', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed finibus ultricies felis, et tempor nisi. Proin vestibulum ex id nisl luctus, id tempus odio consequat. Phasellus tempus quis nibh id tempus. Cras dapibus condimentum blandit. Donec vestibulum eros risus, eget ornare libero gravida quis. Phasellus sed vestibulum ex. Nam vitae molestie lacus. Phasellus dignissim rutrum felis, quis ultrices risus elementum at. Maecenas sit amet sem sem. In malesuada interdum volutpat. Etiam mollis viverra justo at sagittis. Aliquam erat volutpat.\r\n\r\nNunc consequat nibh elit, quis scelerisque eros congue in. Nam consectetur pellentesque nibh in hendrerit. In a nisl suscipit, pulvinar urna id, fringilla massa. Sed elit nibh, malesuada ornare metus nec, porta laoreet massa. Nulla efficitur, felis ut fermentum condimentum, purus lorem varius libero, vestibulum malesuada eros sapien ullamcorper neque. Sed sit amet ipsum bibendum sem lacinia lobortis. Nam fringilla tellus ac sem hendrerit porttitor. Quisque eu quam tincidunt, egestas dolor vel, facilisis risus. Vivamus nec risus ac metus sollicitudin eleifend in sit amet velit.', '2019-01-01 00:00:00', '66db191f6af5f.jpg', 'Test1'),
(4, 1, 1, 'Comparison between smartphones', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed finibus ultricies felis, et tempor nisi. Proin vestibulum ex id nisl luctus, id tempus odio consequat. Phasellus tempus quis nibh id tempus. Cras dapibus condimentum blandit. Donec vestibulum eros risus, eget ornare libero gravida quis. Phasellus sed vestibulum ex. Nam vitae molestie lacus. Phasellus dignissim rutrum felis, quis ultrices risus elementum at. Maecenas sit amet sem sem. In malesuada interdum volutpat. Etiam mollis viverra justo at sagittis. Aliquam erat volutpat.\r\n\r\nNunc consequat nibh elit, quis scelerisque eros congue in. Nam consectetur pellentesque nibh in hendrerit. In a nisl suscipit, pulvinar urna id, fringilla massa. Sed elit nibh, malesuada ornare metus nec, porta laoreet massa. Nulla efficitur, felis ut fermentum condimentum, purus lorem varius libero, vestibulum malesuada eros sapien ullamcorper neque. Sed sit amet ipsum bibendum sem lacinia lobortis. Nam fringilla tellus ac sem hendrerit porttitor. Quisque eu quam tincidunt, egestas dolor vel, facilisis risus. Vivamus nec risus ac metus sollicitudin eleifend in sit amet velit.', '2019-01-01 00:00:00', '66db189b2368b.webp', 'Test'),
(5, 2, 1, 'The 10 Best Places for Hiking and Camping', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed finibus ultricies felis, et tempor nisi. Proin vestibulum ex id nisl luctus, id tempus odio consequat. Phasellus tempus quis nibh id tempus. Cras dapibus condimentum blandit. Donec vestibulum eros risus, eget ornare libero gravida quis. Phasellus sed vestibulum ex. Nam vitae molestie lacus. Phasellus dignissim rutrum felis, quis ultrices risus elementum at. Maecenas sit amet sem sem. In malesuada interdum volutpat. Etiam mollis viverra justo at sagittis. Aliquam erat volutpat. Nunc consequat nibh elit, quis scelerisque eros congue in. Nam consectetur pellentesque nibh in hendrerit. In a nisl suscipit, pulvinar urna id, fringilla massa. Sed elit nibh, malesuada ornare metus nec, porta laoreet massa. Nulla efficitur, felis ut fermentum condimentum, purus lorem varius libero, vestibulum malesuada eros sapien ullamcorper neque. Sed sit amet ipsum bibendum sem lacinia lobortis. Nam fringilla tellus ac sem hendrerit porttitor. Quisque eu quam tincidunt, egestas dolor vel, facilisis risus. Vivamus nec risus ac metus sollicitudin eleifend in sit amet velit.', '2024-09-07 18:26:00', '66df264045799.jpg', 'Test'),
(6, 2, 1, 'Hiking and Camping: Tips for Beginners', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed finibus ultricies felis, et tempor nisi. Proin vestibulum ex id nisl luctus, id tempus odio consequat. Phasellus tempus quis nibh id tempus. Cras dapibus condimentum blandit. Donec vestibulum eros risus, eget ornare libero gravida quis. Phasellus sed vestibulum ex. Nam vitae molestie lacus. Phasellus dignissim rutrum felis, quis ultrices risus elementum at. Maecenas sit amet sem sem. In malesuada interdum volutpat. Etiam mollis viverra justo at sagittis. Aliquam erat volutpat. Nunc consequat nibh elit, quis scelerisque eros congue in. Nam consectetur pellentesque nibh in hendrerit. In a nisl suscipit, pulvinar urna id, fringilla massa. Sed elit nibh, malesuada ornare metus nec, porta laoreet massa. Nulla efficitur, felis ut fermentum condimentum, purus lorem varius libero, vestibulum malesuada eros sapien ullamcorper neque. Sed sit amet ipsum bibendum sem lacinia lobortis. Nam fringilla tellus ac sem hendrerit porttitor. Quisque eu quam tincidunt, egestas dolor vel, facilisis risus. Vivamus nec risus ac metus sollicitudin eleifend in sit amet velit.', '2024-09-28 18:29:00', '66df257daaa43.jpg', 'Test'),
(9, 2, 5, 'The Mental Health Benefits of Hiking and Camping', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed finibus ultricies felis, et tempor nisi. Proin vestibulum ex id nisl luctus, id tempus odio consequat. Phasellus tempus quis nibh id tempus. Cras dapibus condimentum blandit. Donec vestibulum eros risus, eget ornare libero gravida quis. Phasellus sed vestibulum ex. Nam vitae molestie lacus. Phasellus dignissim rutrum felis, quis ultrices risus elementum at. Maecenas sit amet sem sem. In malesuada interdum volutpat. Etiam mollis viverra justo at sagittis. Aliquam erat volutpat. Nunc consequat nibh elit, quis scelerisque eros congue in. Nam consectetur pellentesque nibh in hendrerit. In a nisl suscipit, pulvinar urna id, fringilla massa. Sed elit nibh, malesuada ornare metus nec, porta laoreet massa. Nulla efficitur, felis ut fermentum condimentum, purus lorem varius libero, vestibulum malesuada eros sapien ullamcorper neque. Sed sit amet ipsum bibendum sem lacinia lobortis. Nam fringilla tellus ac sem hendrerit porttitor. Quisque eu quam tincidunt, egestas dolor vel, facilisis risus. Vivamus nec risus ac metus sollicitudin eleifend in sit amet velit.', '2024-09-07 03:56:00', '66e225c1af801.jpg', 'Nesrine Amdouni');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`roles`)),
  `password` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `username`) VALUES
(1, 'test@gmail.com', '[]', '$2y$13$C7H/WWeE0SfmLzGDId/BD.avLR01EMbA49R2n4Wl74PkDgthSk/Kq', 'Test'),
(2, 'test1@gmail.com', '[]', '$2y$13$JO2ZyO2B31x4uoU2QVCR3O88LIpU6b1Cw2YcveXuniv7kQO79TB82', 'Test1'),
(3, 'test2@gmail.com', '[]', '$2y$13$lrP08OB9Y.kO53q2zFx.X.L73cYGIsxd5DlMS4DF9keSPdCLAKTv2', 'Test2'),
(4, 'test3@gmail.com', '[]', '$2y$13$vIXsfXYKqDVff103cP78ieHauULYfDHRsBrfBNyXiTSc4UefHrzLy', 'Test3'),
(5, 'nesrine@gmail.com', '[]', '$2y$13$V7Xjs0D.UTpZPaCshoqgaeEKL81AJg.SdtZRznrKv9.DIOkd6FkXK', 'Nesrine Amdouni');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_5F9E962A9D86650F` (`user_id_id`),
  ADD KEY `IDX_5F9E962AE85F12B8` (`post_id_id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_885DBAFA9777D11E` (`category_id_id`),
  ADD KEY `IDX_885DBAFA69CCBE9A` (`author_id_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `FK_5F9E962A9D86650F` FOREIGN KEY (`user_id_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_5F9E962AE85F12B8` FOREIGN KEY (`post_id_id`) REFERENCES `posts` (`id`);

--
-- Contraintes pour la table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `FK_885DBAFA69CCBE9A` FOREIGN KEY (`author_id_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_885DBAFA9777D11E` FOREIGN KEY (`category_id_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
