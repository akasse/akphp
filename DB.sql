-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Hôte : db
-- Généré le :  sam. 10 mars 2018 à 16:41
-- Version du serveur :  8.0.3-rc-log
-- Version de PHP :  7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `laravel`
--

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_03_10_085933_entrust_setup_tables', 1);

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'AJOUTER', 'Nam dolorem ut.', 'Eos qui dolorem molestias aperiam quod.', '2018-03-10 09:32:13', '2018-03-10 09:32:13'),
(2, 'MODIFIER', 'Eum et maiores qui.', 'Voluptas ut et illo sed. Sit consequatur nobis nihil non atque.', '2018-03-10 09:32:13', '2018-03-10 09:32:13'),
(3, 'SUPPRIMER', 'In earum nesciunt.', 'Officiis eveniet excepturi unde eos reiciendis voluptatem.', '2018-03-10 09:32:13', '2018-03-10 09:32:13'),
(10, 'LECTURE', 'Quis a rem autem.', 'Possimus dignissimos autem eaque dolores ducimus doloribus porro.', '2018-03-10 10:57:02', '2018-03-10 10:57:02');

-- --------------------------------------------------------

--
-- Structure de la table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(10, 1),
(2, 2),
(10, 2),
(10, 3),
(10, 4);

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Error ratione ut.', 'Iusto ipsam id sit tempore occaecati.', '2018-03-10 09:31:50', '2018-03-10 09:31:50'),
(2, 'staff', 'Pariatur eius sed.', 'Ex expedita voluptatem animi quia.', '2018-03-10 09:31:56', '2018-03-10 09:31:56'),
(3, 'simple', 'Qui vel odio libero.', 'Quisquam sit tempora et quae ad unde consectetur.', '2018-03-10 09:31:58', '2018-03-10 09:31:58'),
(4, 'guest', 'Consequatur dolores.', 'Ratione in architecto veritatis inventore aut dolores.', '2018-03-10 09:32:01', '2018-03-10 09:32:01');

-- --------------------------------------------------------

--
-- Structure de la table `role_user`
--

CREATE TABLE `role_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `role_user`
--

INSERT INTO `role_user` (`user_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 2),
(6, 2),
(7, 2),
(4, 3),
(5, 3),
(6, 3),
(7, 3),
(8, 3);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Mrs. Wava Von', 'akasse@localhost.com', '$2y$10$66H7O2k4QuuNPTaezLuQEOcw2Y8pk01klQJPmpBRn9UzqSMjFkEt.', 'UTVpcCJrAd', '2018-03-10 09:31:06', '2018-03-10 09:31:06'),
(2, 'Mr. Broderick Borer', 'gene43@example.com', '$2y$10$9MLy1kZ7FdGYqWxYECvYq.ljZNc1IeYqlVByOh5lGlOF8DAl0Hem.', '2ZFy6romcA', '2018-03-10 09:31:19', '2018-03-10 09:31:19'),
(3, 'Prof. Colten Hammes', 'hauck.alexandrine@example.org', '$2y$10$TE6x1CMlL.FvvcRDYAb7/OL67xsu89InYVu.5TJj7l4ui8.JfFRyG', 'YNLN4pzgsx', '2018-03-10 09:31:21', '2018-03-10 09:31:21'),
(4, 'Ms. Marianna Vandervort Jr.', 'welch.tavares@example.net', '$2y$10$ut8VjjsTlSHtEwIw5F76u.5oKFRRBxLREauziJoorfAfWrnGwe3.u', 'gNRNUD0ock', '2018-03-10 09:31:22', '2018-03-10 09:31:22'),
(5, 'Kara Dickens', 'bill.hudson@example.net', '$2y$10$VxoZg6VWROc1M5GBlJ6zk.lkv7OW.yj9g/Y3wI6mQTV49DWivSSk6', 's5cc1YUn7d', '2018-03-10 09:31:31', '2018-03-10 09:31:31'),
(6, 'Jaylen Jakubowski', 'bart.prosacco@example.com', '$2y$10$9CsO6gsQ3hEmLiSaCRNqnuJhZoj3UaVGW5zSK4UKEpTw58ZbZlOf2', 'Eq0Po0r7nb', '2018-03-10 09:31:32', '2018-03-10 09:31:32'),
(7, 'Margarette Stamm', 'shodkiewicz@example.org', '$2y$10$hU4LcD5tUNk4qP7Jddy/jOUqrNLQTLzyRr160Vk4lMdHudDUsNiOK', 'yF4CtNFW0b', '2018-03-10 09:31:33', '2018-03-10 09:31:33'),
(8, 'Maye Bergnaum', 'shyanne.leffler@example.net', '$2y$10$Psb50nprEviEhgtX0CdHyOUJc1VGb78P2QdibD769P/pvlRB037pq', 'TSl2kLxbfs', '2018-03-10 09:31:34', '2018-03-10 09:31:34');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Index pour la table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Index pour la table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Index pour la table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;