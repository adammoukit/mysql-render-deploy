-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 11 juil. 2025 à 20:21
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `sql8789537`
--

-- --------------------------------------------------------

--
-- Structure de la table `address`
--

CREATE TABLE `address` (
  `id` char(36) NOT NULL,
  `city` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `street_address` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `user_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `attribute_metadata`
--

CREATE TABLE `attribute_metadata` (
  `id` char(36) NOT NULL,
  `data_type` varchar(255) DEFAULT NULL,
  `is_required` bit(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `category_id` char(36) DEFAULT NULL,
  `product_type_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `attribute_metadata`
--

INSERT INTO `attribute_metadata` (`id`, `data_type`, `is_required`, `name`, `category_id`, `product_type_id`) VALUES
('11c72b64-0a8e-4324-a1d3-483c5dcd22c4', 'DECIMAL', b'0', 'Taille écran (pouces)', 'e43bdfdc-972c-41ff-b704-6c6165c86c8e', 'd73385e8-9f86-426b-97b4-9bed3ec4cc72'),
('1709de03-5258-48bc-abd7-330081bc133b', 'STRING', b'1', 'Capacité de stockage', 'e43bdfdc-972c-41ff-b704-6c6165c86c8e', 'd73385e8-9f86-426b-97b4-9bed3ec4cc72'),
('4bf69d1b-06ed-48fb-91b9-0a1adef9a223', 'STRING', b'1', 'nutrition', NULL, NULL),
('520be253-6cdc-401c-988d-a0a9a2024bc8', 'INTEGER', b'1', 'RAM (Go)', 'e43bdfdc-972c-41ff-b704-6c6165c86c8e', 'd73385e8-9f86-426b-97b4-9bed3ec4cc72'),
('5ba203d6-9cc5-49d6-87b1-f7d0c8bc7255', 'STRING', b'1', 'Type de samsung', '2ed1ce1f-10a2-4420-ba5a-ad0b3df07ee9', NULL),
('ab435a89-a12a-48cd-aba3-e0ebb3583383', 'STRING', b'1', 'nutrition', '2ed1ce1f-10a2-4420-ba5a-ad0b3df07ee9', NULL),
('ba8d458b-5363-4423-96d5-7e36457c2027', 'STRING', b'1', 'Modèle', 'e43bdfdc-972c-41ff-b704-6c6165c86c8e', 'd73385e8-9f86-426b-97b4-9bed3ec4cc72'),
('e17339ee-5eee-4ac6-b6f5-93a9a3e889d3', 'INTEGER', b'0', 'Batterie (mAh)', 'e43bdfdc-972c-41ff-b704-6c6165c86c8e', 'd73385e8-9f86-426b-97b4-9bed3ec4cc72'),
('f9f1c607-5b1a-461a-acb7-52a4ecb27401', 'INTEGER', b'1', 'Stockage (Go)', 'e43bdfdc-972c-41ff-b704-6c6165c86c8e', 'd73385e8-9f86-426b-97b4-9bed3ec4cc72');

-- --------------------------------------------------------

--
-- Structure de la table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `total_amount` decimal(38,2) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `user_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `carts`
--

INSERT INTO `carts` (`id`, `created_at`, `total_amount`, `updated_at`, `user_id`) VALUES
(1, '2025-05-17 05:20:23.000000', 734.98, '2025-06-09 19:44:00.000000', 'cd8f5057-d20a-4f65-8377-017cfea017b5'),
(2, '2025-05-17 05:22:43.000000', 318.43, '2025-05-23 07:05:35.000000', '847b7e9f-8045-4f9a-9fdf-4cd862b5627a'),
(3, '2025-05-18 14:07:15.000000', 80.97, '2025-05-25 13:01:25.000000', '4cc9f727-0e66-4d66-8616-1345f16d65a3'),
(4, '2025-05-19 02:28:31.000000', 1399.98, '2025-06-25 19:17:55.000000', 'a51b0acd-6b06-47fe-86dd-3e4532ace47a');

-- --------------------------------------------------------

--
-- Structure de la table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `main_image_url` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `selected_color` varchar(255) DEFAULT NULL,
  `selected_size` varchar(255) DEFAULT NULL,
  `sku` varchar(255) NOT NULL,
  `subtotal` decimal(38,2) NOT NULL,
  `unit_price` decimal(38,2) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `cart_id` bigint(20) NOT NULL,
  `product_id` char(36) NOT NULL,
  `variant_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `cart_items`
--

INSERT INTO `cart_items` (`id`, `created_at`, `main_image_url`, `quantity`, `selected_color`, `selected_size`, `sku`, `subtotal`, `unit_price`, `updated_at`, `cart_id`, `product_id`, `variant_id`) VALUES
(74, '2025-05-22 15:45:40.000000', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747533806/ecommerce/products/as72njfcafq2jm3ts1ly.jpg', 7, 'noir', NULL, 'SAG-2036B5A3-A8C-NOIR', 318.43, 45.49, '2025-05-23 07:05:35.000000', 2, '3b13056b-38b9-493c-8e4f-35f9909d8e6b', '3add9cfd-f8c4-442f-805e-69ec31d0b3ea'),
(104, '2025-05-24 20:13:07.000000', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747578066/ecommerce/products/grhrjzfdf3lb3ufi4q91.jpg', 1, 'marron', NULL, 'SAG-EDA2A56E-61C-MARRON', 34.99, 34.99, '2025-05-24 20:13:07.000000', 3, 'eb2a7312-a02d-4d91-9ae9-47fd3bb062fa', '5dd83b37-bad4-4d21-81f4-5fe0fbc88104'),
(105, '2025-05-25 13:01:14.000000', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747556624/ecommerce/products/ywdyakqsvq9rqltmtc77.jpg', 2, 'noir', NULL, 'SAG-34D5226D-889-NOIR', 45.98, 22.99, '2025-05-25 13:01:25.000000', 3, '424593ce-c809-47b1-aad8-abc43261f55d', '6e111ff1-12af-443e-8b5a-7cfbcaefce9b'),
(110, '2025-06-09 19:43:12.000000', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747932914/ecommerce/products/e6xg2x1hyied18jejhny.jpg', 1, 'Noir', '128GB', 'SAM-055F51BC-466-NOIR-128GB', 699.99, 699.99, '2025-06-09 19:43:12.000000', 1, '1ebad9ee-f8af-4ac0-850f-1d2f9cb2f71e', '91899530-c46a-4c93-b937-6f45dcd96218'),
(111, '2025-06-09 19:44:00.000000', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747578066/ecommerce/products/grhrjzfdf3lb3ufi4q91.jpg', 1, 'marron', NULL, 'SAG-EDA2A56E-61C-MARRON', 34.99, 34.99, '2025-06-09 19:44:00.000000', 1, 'eb2a7312-a02d-4d91-9ae9-47fd3bb062fa', '5dd83b37-bad4-4d21-81f4-5fe0fbc88104'),
(124, '2025-06-25 17:57:22.000000', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747932916/ecommerce/products/wpyhzhmcrqhkngmaz8ez.jpg', 1, 'Noir', '32GB', 'SAM-055F51BC-466-NOIR-32GB', 699.99, 699.99, '2025-06-25 17:57:22.000000', 4, '1ebad9ee-f8af-4ac0-850f-1d2f9cb2f71e', '8d645e17-b68a-43a2-b032-8c825ffdb89b'),
(125, '2025-06-25 19:17:55.000000', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747932914/ecommerce/products/e6xg2x1hyied18jejhny.jpg', 1, 'Noir', '128GB', 'SAM-055F51BC-466-NOIR-128GB', 699.99, 699.99, '2025-06-25 19:17:55.000000', 4, '1ebad9ee-f8af-4ac0-850f-1d2f9cb2f71e', '91899530-c46a-4c93-b937-6f45dcd96218');

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `full_path` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`, `parent_id`, `full_path`) VALUES
('2ed1ce1f-10a2-4420-ba5a-ad0b3df07ee9', 'Samsung', 'e43bdfdc-972c-41ff-b704-6c6165c86c8e', 'Electronique > Smartphones > Samsung'),
('329585e7-2d58-4ffa-ab20-354ecdd6e2a0', 'Saga pour Homme', '57023595-6594-4669-954b-f1c2b7613e46', 'Sacs > Saga pour Homme'),
('409d48b2-42d2-4be7-8823-a068ea176520', 'Electronique', NULL, 'Electronique'),
('57023595-6594-4669-954b-f1c2b7613e46', 'Sacs', NULL, 'Sacs'),
('6e1bf24f-6e93-4363-b00f-d9730bbbfca8', 'Saga Golf', '329585e7-2d58-4ffa-ab20-354ecdd6e2a0', 'Sacs > Saga pour Homme > Saga Golf'),
('7d9ddc82-7915-475c-899f-378fe9c67d82', 'Saga Golf togolais', '6e1bf24f-6e93-4363-b00f-d9730bbbfca8', 'Sacs > Saga pour Homme > Saga Golf > Saga Golf togolais'),
('867e9a78-6b83-4ddd-bb13-85fd78d3dc86', 'Iphone', 'e43bdfdc-972c-41ff-b704-6c6165c86c8e', 'Electronique > Smartphones > Iphone'),
('caa4f99c-32b7-40e4-b4ae-04195658a82d', 'Saga Golf ivoirien', '6e1bf24f-6e93-4363-b00f-d9730bbbfca8', 'Sacs > Saga pour Homme > Saga Golf > Saga Golf ivoirien'),
('d22b327f-020d-4137-a632-6d931b41f529', 'Saga Golf béninois', '6e1bf24f-6e93-4363-b00f-d9730bbbfca8', 'Sacs > Saga pour Homme > Saga Golf > Saga Golf béninois'),
('e43bdfdc-972c-41ff-b704-6c6165c86c8e', 'Smartphones', '409d48b2-42d2-4be7-8823-a068ea176520', 'Electronique > Smartphones');

-- --------------------------------------------------------

--
-- Structure de la table `flyway_schema_history`
--

CREATE TABLE `flyway_schema_history` (
  `installed_rank` int(11) NOT NULL,
  `version` varchar(50) DEFAULT NULL,
  `description` varchar(200) NOT NULL,
  `type` varchar(20) NOT NULL,
  `script` varchar(1000) NOT NULL,
  `checksum` int(11) DEFAULT NULL,
  `installed_by` varchar(100) NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `execution_time` int(11) NOT NULL,
  `success` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `flyway_schema_history`
--

INSERT INTO `flyway_schema_history` (`installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`) VALUES
(1, '1', 'finalize product type migration', 'SQL', 'V1__finalize_product_type_migration.sql', 1903512658, 'root', '2025-06-16 16:08:53', 120, 1),
(2, '2', 'populate category full paths', 'SQL', 'V2__populate_category_full_paths.sql', -19406167, 'root', '2025-06-16 16:43:08', 104, 1);

-- --------------------------------------------------------

--
-- Structure de la table `order_item`
--

CREATE TABLE `order_item` (
  `id` char(36) NOT NULL,
  `delivery_date` datetime(6) DEFAULT NULL,
  `discounted_price` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `size` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `order_id` char(36) DEFAULT NULL,
  `product_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `payement_information`
--

CREATE TABLE `payement_information` (
  `user_id` char(36) NOT NULL,
  `cardholder_name` varchar(255) DEFAULT NULL,
  `card_number` varchar(255) DEFAULT NULL,
  `cvv` varchar(255) DEFAULT NULL,
  `expiration_date` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

CREATE TABLE `product` (
  `id` char(36) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `has_variants` bit(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(38,2) NOT NULL,
  `sku` varchar(255) NOT NULL,
  `stock` int(11) DEFAULT NULL,
  `upc` varchar(255) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `variant_type` enum('COLOR','COLOR_AND_SIZE','NONE','SIZE') NOT NULL,
  `category_id` char(36) DEFAULT NULL,
  `product_type_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `created_at`, `description`, `has_variants`, `name`, `price`, `sku`, `stock`, `upc`, `updated_at`, `variant_type`, `category_id`, `product_type_id`) VALUES
('02377682-f092-49e8-90d1-c88051e8225e', '2025-05-18 14:18:49.000000', 'Roman à succès avec édition spéciale en couleurs limitées. Couvertures disponibles : rouge vif, bleu nuit ou dorée (édition collector).', b'1', 'Le Secret des Étoiles | Couvertures Rouge, Bleu & Dorée', 22.99, 'SAG-D8C72C99-C31', 83, 'd8c72c99-c31', '2025-05-18 14:18:49.000000', 'COLOR', '7d9ddc82-7915-475c-899f-378fe9c67d82', NULL),
('1ebad9ee-f8af-4ac0-850f-1d2f9cb2f71e', '2025-05-22 16:54:54.000000', 'L\'iPhone 12 avec puce A14 Bionic, écran Super Retina XDR et double caméra. Disponible en plusieurs couleurs et capacités de stockage.', b'1', 'Samsung S20 Ultra | 32GB /64GB / 128GB / 256GB  - Rouge, & Noir', 699.99, 'SAM-055F51BC-466', 115, '055f51bc-466', '2025-05-22 16:54:54.000000', 'COLOR_AND_SIZE', '2ed1ce1f-10a2-4420-ba5a-ad0b3df07ee9', 'd73385e8-9f86-426b-97b4-9bed3ec4cc72'),
('3b13056b-38b9-493c-8e4f-35f9909d8e6b', '2025-05-18 02:03:21.000000', 'Roman à succès avec édition spéciale en couleurs limitées. Couvertures disponibles : rouge vif, bleu nuit ou dorée (édition collector).', b'1', 'Le Secret des Étoiles | Couvertures Rouge, Bleu & Dorée', 22.99, 'SAG-2036B5A3-A8C', 83, '2036b5a3-a8c', '2025-05-18 02:03:21.000000', 'COLOR', '7d9ddc82-7915-475c-899f-378fe9c67d82', NULL),
('424593ce-c809-47b1-aad8-abc43261f55d', '2025-05-18 08:23:25.000000', 'Roman à succès avec édition spéciale en couleurs limitées. Couvertures disponibles : rouge vif, bleu nuit ou dorée (édition collector).', b'1', 'Le Secret des Étoiles | Couvertures Rouge, Bleu & Dorée', 22.99, 'SAG-34D5226D-889', 83, '34d5226d-889', '2025-05-18 08:23:25.000000', 'COLOR', '7d9ddc82-7915-475c-899f-378fe9c67d82', NULL),
('493d2ceb-6c55-424f-a5ba-f90520e248e8', '2025-05-20 13:29:21.000000', 'L\'iPhone 12 avec puce A14 Bionic, écran Super Retina XDR et double caméra. Disponible en plusieurs couleurs et capacités de stockage.', b'1', 'iPhone 12 | 64GB / 128GB - Noir, & Or', 699.99, 'SMA-ED97D4C2-4FB', 65, 'ed97d4c2-4fb', '2025-05-20 13:29:21.000000', 'COLOR_AND_SIZE', '867e9a78-6b83-4ddd-bb13-85fd78d3dc86', NULL),
('6637e026-1c22-4f20-b2c4-4326711b59ec', '2025-05-22 16:53:51.000000', 'L\'iPhone 12 avec puce A14 Bionic, écran Super Retina XDR et double caméra. Disponible en plusieurs couleurs et capacités de stockage.', b'1', 'iPhone 12 | 64GB / 128GB - Noir, & Or', 699.99, 'SAM-53C41C00-01D', 115, '53c41c00-01d', '2025-05-22 16:53:51.000000', 'COLOR_AND_SIZE', '867e9a78-6b83-4ddd-bb13-85fd78d3dc86', 'd73385e8-9f86-426b-97b4-9bed3ec4cc72'),
('7c1c744f-18cb-4bd1-bf11-ee66a7dc99f3', '2025-05-17 14:57:40.000000', 'Roman à succès avec édition spéciale en couleurs limitées. Couvertures disponibles : rouge vif, bleu nuit ou dorée (édition collector).', b'1', 'Le Secret des Étoiles | Couvertures Rouge, Bleu & Dorée', 22.99, 'SAG-F6E1038B-C01', 83, 'f6e1038b-c01', '2025-05-17 14:57:40.000000', 'COLOR', '7d9ddc82-7915-475c-899f-378fe9c67d82', NULL),
('98b24275-4fdd-4ecf-8780-45bb443a57fe', '2025-05-18 01:30:33.000000', 'Roman à succès avec édition spéciale en couleurs limitées. Couvertures disponibles : rouge vif, bleu nuit ou dorée (édition collector).', b'1', 'Le Secret des Étoiles | Couvertures Rouge, Bleu & Dorée', 22.99, 'SAG-FB086D76-BD5', 83, 'fb086d76-bd5', '2025-05-18 01:30:33.000000', 'COLOR', '7d9ddc82-7915-475c-899f-378fe9c67d82', NULL),
('cc3456db-2625-41e0-a035-99c81624ed8a', '2025-05-17 09:45:43.000000', 'Roman à succès avec édition spéciale en couleurs limitées. Couvertures disponibles : rouge vif, bleu nuit ou dorée (édition collector).', b'1', 'Le Secret des Étoiles | Couvertures Rouge, Bleu & Dorée', 22.99, 'SAG-D8B2FD65-943', 118, 'd8b2fd65-943', '2025-05-17 09:45:43.000000', 'COLOR', '329585e7-2d58-4ffa-ab20-354ecdd6e2a0', NULL),
('eb2a7312-a02d-4d91-9ae9-47fd3bb062fa', '2025-05-18 14:21:04.000000', 'Roman à succès avec édition spéciale en couleurs limitées. Couvertures disponibles : rouge vif, bleu nuit ou dorée (édition collector).', b'1', 'Le Secret des Étoiles | Couvertures Rouge, Bleu & Dorée', 22.99, 'SAG-EDA2A56E-61C', 83, 'eda2a56e-61c', '2025-05-18 14:21:04.000000', 'COLOR', '7d9ddc82-7915-475c-899f-378fe9c67d82', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `product_media`
--

CREATE TABLE `product_media` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `file_name` varchar(255) NOT NULL,
  `is_main_media` bit(1) NOT NULL,
  `media_type` varchar(255) NOT NULL,
  `media_url` varchar(255) NOT NULL,
  `product_id` char(36) DEFAULT NULL,
  `variant_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `product_media`
--

INSERT INTO `product_media` (`id`, `created_at`, `file_name`, `is_main_media`, `media_type`, `media_url`, `product_id`, `variant_id`) VALUES
(8, '2025-05-17 09:45:43.000000', 'bleu.png', b'1', 'image/png', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747475143/ecommerce/products/zehqot1uv9fnfbyjpzcp.png', 'cc3456db-2625-41e0-a035-99c81624ed8a', NULL),
(9, '2025-05-17 09:45:45.000000', 'bleu.png', b'1', 'image/png', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747475145/ecommerce/products/dwlhz0l1abealzlkumji.png', 'cc3456db-2625-41e0-a035-99c81624ed8a', '05e12964-089f-4ab8-ade4-53e4b27b0a89'),
(10, '2025-05-17 09:45:46.000000', 'bleu2.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747475146/ecommerce/products/x4fhjixcdyovxduxbmof.jpg', 'cc3456db-2625-41e0-a035-99c81624ed8a', '05e12964-089f-4ab8-ade4-53e4b27b0a89'),
(11, '2025-05-17 09:45:48.000000', 'Rouge.jpg', b'1', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747475148/ecommerce/products/f3swvapcav9djvdgltqf.jpg', 'cc3456db-2625-41e0-a035-99c81624ed8a', '01f1642b-f9be-42d4-8358-4a8462bcd007'),
(12, '2025-05-17 09:45:49.000000', 'Rouge2.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747475150/ecommerce/products/srpvgeb6cntprmucy41e.jpg', 'cc3456db-2625-41e0-a035-99c81624ed8a', '01f1642b-f9be-42d4-8358-4a8462bcd007'),
(13, '2025-05-17 09:45:51.000000', 'doree.jpeg', b'1', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747475151/ecommerce/products/tphf0zmipscqyx9d4obl.jpg', 'cc3456db-2625-41e0-a035-99c81624ed8a', '47184bcc-dd87-4292-9882-42acd163e00d'),
(14, '2025-05-17 09:45:52.000000', 'doree2.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747475152/ecommerce/products/yqqt73mpz6kisay3suzg.jpg', 'cc3456db-2625-41e0-a035-99c81624ed8a', '47184bcc-dd87-4292-9882-42acd163e00d'),
(43, '2025-05-17 14:57:40.000000', 'black1.jpeg', b'1', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747493860/ecommerce/products/brpetx8arxocjtw94zys.jpg', '7c1c744f-18cb-4bd1-bf11-ee66a7dc99f3', NULL),
(44, '2025-05-17 14:57:41.000000', 'black1.jpeg', b'1', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747493861/ecommerce/products/pgkrzmkwxyx3v3tbminj.jpg', '7c1c744f-18cb-4bd1-bf11-ee66a7dc99f3', '7045b927-8232-4d26-a73f-73de0d7214c6'),
(45, '2025-05-17 14:57:42.000000', 'black2.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747493862/ecommerce/products/fgyrkm4xofb3hks34obk.jpg', '7c1c744f-18cb-4bd1-bf11-ee66a7dc99f3', '7045b927-8232-4d26-a73f-73de0d7214c6'),
(46, '2025-05-17 14:57:44.000000', 'black3.jpg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747493864/ecommerce/products/hmkkyvpgifflrzklrmkj.jpg', '7c1c744f-18cb-4bd1-bf11-ee66a7dc99f3', '7045b927-8232-4d26-a73f-73de0d7214c6'),
(47, '2025-05-17 14:57:45.000000', 'gris1.jpeg', b'1', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747493865/ecommerce/products/w9mr0nrujuyqruylh6v6.jpg', '7c1c744f-18cb-4bd1-bf11-ee66a7dc99f3', '2193414c-20e5-46df-ad66-55c79ceecd19'),
(48, '2025-05-17 14:57:46.000000', 'gris2.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747493866/ecommerce/products/kpvtwnhiwxfx8pxuh2b7.jpg', '7c1c744f-18cb-4bd1-bf11-ee66a7dc99f3', '2193414c-20e5-46df-ad66-55c79ceecd19'),
(49, '2025-05-17 14:57:47.000000', 'gris3.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747493867/ecommerce/products/shk7qu9kdggfgkffsc8n.jpg', '7c1c744f-18cb-4bd1-bf11-ee66a7dc99f3', '2193414c-20e5-46df-ad66-55c79ceecd19'),
(92, '2025-05-18 01:30:33.000000', '1.jpeg', b'1', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747531833/ecommerce/products/dekwbd1adfpgotaxsusn.jpg', '98b24275-4fdd-4ecf-8780-45bb443a57fe', NULL),
(93, '2025-05-18 01:30:34.000000', '1.jpeg', b'1', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747531835/ecommerce/products/y0ikmvu9la88u4r98epz.jpg', '98b24275-4fdd-4ecf-8780-45bb443a57fe', '6e20bfd9-5866-4ad4-b13c-f1027fd502b8'),
(94, '2025-05-18 01:30:36.000000', '1.jpeg', b'1', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747531837/ecommerce/products/izdjguxqwfejknc6ansr.jpg', '98b24275-4fdd-4ecf-8780-45bb443a57fe', '39ec23d5-5a72-40f3-882f-849dd0b58a8c'),
(95, '2025-05-18 01:30:38.000000', '1.jpeg', b'1', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747531838/ecommerce/products/rofyetc0uced6s0u4vme.jpg', '98b24275-4fdd-4ecf-8780-45bb443a57fe', 'fa9a8033-a403-4281-8556-236321b5bf87'),
(96, '2025-05-18 01:30:40.000000', '2.jpg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747531840/ecommerce/products/crpukzrin7wf0t7si9xg.jpg', '98b24275-4fdd-4ecf-8780-45bb443a57fe', '6e20bfd9-5866-4ad4-b13c-f1027fd502b8'),
(97, '2025-05-18 01:30:41.000000', '2.jpg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747531842/ecommerce/products/pzgewjgal147ze7wtzip.jpg', '98b24275-4fdd-4ecf-8780-45bb443a57fe', '39ec23d5-5a72-40f3-882f-849dd0b58a8c'),
(98, '2025-05-18 01:30:43.000000', '2.jpg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747531843/ecommerce/products/fflh0klhk5u2jadsrnra.jpg', '98b24275-4fdd-4ecf-8780-45bb443a57fe', 'fa9a8033-a403-4281-8556-236321b5bf87'),
(99, '2025-05-18 01:30:44.000000', '3.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747531845/ecommerce/products/mdwcfdmapi533ibjedb7.jpg', '98b24275-4fdd-4ecf-8780-45bb443a57fe', '6e20bfd9-5866-4ad4-b13c-f1027fd502b8'),
(100, '2025-05-18 01:30:45.000000', '3.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747531846/ecommerce/products/rn6ay3jouzsra9jy3tus.jpg', '98b24275-4fdd-4ecf-8780-45bb443a57fe', '39ec23d5-5a72-40f3-882f-849dd0b58a8c'),
(101, '2025-05-18 01:30:46.000000', '3.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747531847/ecommerce/products/k3lfm2l05dzidpflmq7r.jpg', '98b24275-4fdd-4ecf-8780-45bb443a57fe', 'fa9a8033-a403-4281-8556-236321b5bf87'),
(102, '2025-05-18 01:30:48.000000', '1.jpg', b'1', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747531848/ecommerce/products/r8twc6kqze7pkljvw8qp.jpg', '98b24275-4fdd-4ecf-8780-45bb443a57fe', 'c1c5b142-c3df-4afb-a619-b4b015935bee'),
(103, '2025-05-18 01:30:50.000000', '1.jpg', b'1', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747531850/ecommerce/products/gj5zguyqrdcqps8pinyw.jpg', '98b24275-4fdd-4ecf-8780-45bb443a57fe', '3d64af81-edbc-408c-bb63-20668357a9d7'),
(104, '2025-05-18 01:30:52.000000', '1.jpg', b'1', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747531852/ecommerce/products/xauavbye7kynyu6kotrd.jpg', '98b24275-4fdd-4ecf-8780-45bb443a57fe', '5f4ee9b9-042c-4bc1-a96e-81c857584e31'),
(105, '2025-05-18 01:30:53.000000', '2.jpg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747531853/ecommerce/products/dtkg4dixra15os46lblj.jpg', '98b24275-4fdd-4ecf-8780-45bb443a57fe', 'c1c5b142-c3df-4afb-a619-b4b015935bee'),
(106, '2025-05-18 01:30:55.000000', '2.jpg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747531855/ecommerce/products/la8yz1cpusyh6wycxfps.jpg', '98b24275-4fdd-4ecf-8780-45bb443a57fe', '3d64af81-edbc-408c-bb63-20668357a9d7'),
(107, '2025-05-18 01:30:57.000000', '2.jpg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747531857/ecommerce/products/kejrzd2bewijlojxhexa.jpg', '98b24275-4fdd-4ecf-8780-45bb443a57fe', '5f4ee9b9-042c-4bc1-a96e-81c857584e31'),
(108, '2025-05-18 01:30:59.000000', '3.jpg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747531859/ecommerce/products/nic4rhklsbillegfsazk.jpg', '98b24275-4fdd-4ecf-8780-45bb443a57fe', 'c1c5b142-c3df-4afb-a619-b4b015935bee'),
(109, '2025-05-18 01:31:01.000000', '3.jpg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747531862/ecommerce/products/rheuwnudrtl2fia0xsji.jpg', '98b24275-4fdd-4ecf-8780-45bb443a57fe', '3d64af81-edbc-408c-bb63-20668357a9d7'),
(110, '2025-05-18 01:31:04.000000', '3.jpg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747531865/ecommerce/products/ah2wqexswcrrxp2xdugd.jpg', '98b24275-4fdd-4ecf-8780-45bb443a57fe', '5f4ee9b9-042c-4bc1-a96e-81c857584e31'),
(111, '2025-05-18 02:03:21.000000', 'image1.jpg', b'1', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747533801/ecommerce/products/wt3tb5zwlv5w21iei66s.jpg', '3b13056b-38b9-493c-8e4f-35f9909d8e6b', NULL),
(112, '2025-05-18 02:03:22.000000', 'image1.jpg', b'1', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747533803/ecommerce/products/dbkhd0sfwozzefhe9yzc.jpg', '3b13056b-38b9-493c-8e4f-35f9909d8e6b', 'dfa52927-14f3-4fad-9500-63bd5ebddfc0'),
(113, '2025-05-18 02:03:24.000000', 'image1.jpg', b'1', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747533804/ecommerce/products/qgreowukk1jpibcj541r.jpg', '3b13056b-38b9-493c-8e4f-35f9909d8e6b', '60aa0ae2-3191-4052-ac20-fdca8d84a6ee'),
(114, '2025-05-18 02:03:25.000000', 'image1.jpg', b'1', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747533806/ecommerce/products/as72njfcafq2jm3ts1ly.jpg', '3b13056b-38b9-493c-8e4f-35f9909d8e6b', '3add9cfd-f8c4-442f-805e-69ec31d0b3ea'),
(115, '2025-05-18 02:03:27.000000', 'image2.jpg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747533808/ecommerce/products/byhv5aronscf3hiporaa.jpg', '3b13056b-38b9-493c-8e4f-35f9909d8e6b', 'dfa52927-14f3-4fad-9500-63bd5ebddfc0'),
(116, '2025-05-18 02:03:29.000000', 'image2.jpg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747533810/ecommerce/products/yzum73ec3tzdicpivpcn.jpg', '3b13056b-38b9-493c-8e4f-35f9909d8e6b', '60aa0ae2-3191-4052-ac20-fdca8d84a6ee'),
(117, '2025-05-18 02:03:31.000000', 'image2.jpg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747533812/ecommerce/products/fo3hjookowucicbclecv.jpg', '3b13056b-38b9-493c-8e4f-35f9909d8e6b', '3add9cfd-f8c4-442f-805e-69ec31d0b3ea'),
(118, '2025-05-18 02:03:33.000000', 'image3.jpg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747533813/ecommerce/products/gike8xlz8ntnyyr7yzrx.jpg', '3b13056b-38b9-493c-8e4f-35f9909d8e6b', 'dfa52927-14f3-4fad-9500-63bd5ebddfc0'),
(119, '2025-05-18 02:03:35.000000', 'image3.jpg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747533815/ecommerce/products/hhmdjlyixzu0rkxmqnsz.jpg', '3b13056b-38b9-493c-8e4f-35f9909d8e6b', '60aa0ae2-3191-4052-ac20-fdca8d84a6ee'),
(120, '2025-05-18 02:03:36.000000', 'image3.jpg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747533817/ecommerce/products/jccsskclufgfgpfen72q.jpg', '3b13056b-38b9-493c-8e4f-35f9909d8e6b', '3add9cfd-f8c4-442f-805e-69ec31d0b3ea'),
(121, '2025-05-18 02:03:38.000000', 'image1.jpg', b'1', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747533818/ecommerce/products/f4w3cwapsxhwo2zqb8tf.jpg', '3b13056b-38b9-493c-8e4f-35f9909d8e6b', '7649b92d-d1f1-4641-9146-64db9a7769e9'),
(122, '2025-05-18 02:03:39.000000', 'image1.jpg', b'1', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747533820/ecommerce/products/ni38dcibxdu6uwqgb5lo.jpg', '3b13056b-38b9-493c-8e4f-35f9909d8e6b', '3bca83d8-0a15-4df1-84a9-caed8df96afa'),
(123, '2025-05-18 02:03:41.000000', 'image1.jpg', b'1', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747533821/ecommerce/products/cwzxfl2usu8kdggnatx2.jpg', '3b13056b-38b9-493c-8e4f-35f9909d8e6b', 'adf9571d-2bb0-4ea5-9eb1-4c99d6f73e8c'),
(124, '2025-05-18 02:03:43.000000', 'image2.jpg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747533823/ecommerce/products/ctzhqdoyi7gd77atoet3.jpg', '3b13056b-38b9-493c-8e4f-35f9909d8e6b', '7649b92d-d1f1-4641-9146-64db9a7769e9'),
(125, '2025-05-18 02:03:45.000000', 'image2.jpg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747533825/ecommerce/products/asmp3qxglq5n8sba9v2t.jpg', '3b13056b-38b9-493c-8e4f-35f9909d8e6b', '3bca83d8-0a15-4df1-84a9-caed8df96afa'),
(126, '2025-05-18 02:03:47.000000', 'image2.jpg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747533827/ecommerce/products/oj3p3qzd7phxgrai4t0g.jpg', '3b13056b-38b9-493c-8e4f-35f9909d8e6b', 'adf9571d-2bb0-4ea5-9eb1-4c99d6f73e8c'),
(127, '2025-05-18 02:03:48.000000', 'image3.jpg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747533829/ecommerce/products/v1zaolriwd3hhjyvieow.jpg', '3b13056b-38b9-493c-8e4f-35f9909d8e6b', '7649b92d-d1f1-4641-9146-64db9a7769e9'),
(128, '2025-05-18 02:03:50.000000', 'image3.jpg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747533830/ecommerce/products/dr2wmt3u1fva06fyvtu2.jpg', '3b13056b-38b9-493c-8e4f-35f9909d8e6b', '3bca83d8-0a15-4df1-84a9-caed8df96afa'),
(129, '2025-05-18 02:03:52.000000', 'image3.jpg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747533832/ecommerce/products/v9wyjzrfw3wqnk4e0mok.jpg', '3b13056b-38b9-493c-8e4f-35f9909d8e6b', 'adf9571d-2bb0-4ea5-9eb1-4c99d6f73e8c'),
(149, '2025-05-18 08:23:25.000000', 'marron1.jpeg', b'1', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747556606/ecommerce/products/ok7hr1ftrfdhkxosdym1.jpg', '424593ce-c809-47b1-aad8-abc43261f55d', NULL),
(150, '2025-05-18 08:23:26.000000', 'marron1.jpeg', b'1', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747556607/ecommerce/products/exuxtjon5nwdowc60yi8.jpg', '424593ce-c809-47b1-aad8-abc43261f55d', 'f70fb55d-6419-4060-a47d-0253e290e59a'),
(151, '2025-05-18 08:23:27.000000', 'marron1.jpeg', b'1', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747556608/ecommerce/products/brnxivudmsnbfx9r4a0p.jpg', '424593ce-c809-47b1-aad8-abc43261f55d', '50b2652f-c200-4ad3-a34f-965f711779d3'),
(152, '2025-05-18 08:23:30.000000', 'marron1.jpeg', b'1', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747556610/ecommerce/products/iyqcxpxz56brdlfv3q8x.jpg', '424593ce-c809-47b1-aad8-abc43261f55d', 'ed18202c-1404-44fd-9d4c-42486e1362b8'),
(153, '2025-05-18 08:23:31.000000', 'marron2.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747556612/ecommerce/products/lagkbf7n7xotzolum1s4.jpg', '424593ce-c809-47b1-aad8-abc43261f55d', 'f70fb55d-6419-4060-a47d-0253e290e59a'),
(154, '2025-05-18 08:23:32.000000', 'marron2.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747556613/ecommerce/products/vpyx8tczxkfrb73b6g7q.jpg', '424593ce-c809-47b1-aad8-abc43261f55d', '50b2652f-c200-4ad3-a34f-965f711779d3'),
(155, '2025-05-18 08:23:33.000000', 'marron2.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747556614/ecommerce/products/ruavshyz0kwpmoaebyfc.jpg', '424593ce-c809-47b1-aad8-abc43261f55d', 'ed18202c-1404-44fd-9d4c-42486e1362b8'),
(156, '2025-05-18 08:23:35.000000', 'marron3.jpg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747556616/ecommerce/products/ksksjaqycwuevgb753pj.jpg', '424593ce-c809-47b1-aad8-abc43261f55d', 'f70fb55d-6419-4060-a47d-0253e290e59a'),
(157, '2025-05-18 08:23:39.000000', 'marron3.jpg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747556620/ecommerce/products/hiqgrmsubalvpe9yqubz.jpg', '424593ce-c809-47b1-aad8-abc43261f55d', '50b2652f-c200-4ad3-a34f-965f711779d3'),
(158, '2025-05-18 08:23:41.000000', 'marron3.jpg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747556622/ecommerce/products/zdha3is65sw6pov8bpbi.jpg', '424593ce-c809-47b1-aad8-abc43261f55d', 'ed18202c-1404-44fd-9d4c-42486e1362b8'),
(159, '2025-05-18 08:23:42.000000', 'black1.jpeg', b'1', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747556623/ecommerce/products/hshff4oifphhkx0mqlwk.jpg', '424593ce-c809-47b1-aad8-abc43261f55d', 'f88b4a49-d154-4987-bef2-e288fba4b397'),
(160, '2025-05-18 08:23:43.000000', 'black1.jpeg', b'1', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747556624/ecommerce/products/ywdyakqsvq9rqltmtc77.jpg', '424593ce-c809-47b1-aad8-abc43261f55d', '6e111ff1-12af-443e-8b5a-7cfbcaefce9b'),
(161, '2025-05-18 08:23:44.000000', 'black1.jpeg', b'1', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747556625/ecommerce/products/cwgqc9pgvdyct2lonk5i.jpg', '424593ce-c809-47b1-aad8-abc43261f55d', '71a67d4c-5432-4733-8496-c7637c14db46'),
(162, '2025-05-18 08:23:45.000000', 'black2.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747556626/ecommerce/products/i9xr4aeexaatcybinfp0.jpg', '424593ce-c809-47b1-aad8-abc43261f55d', 'f88b4a49-d154-4987-bef2-e288fba4b397'),
(163, '2025-05-18 08:23:46.000000', 'black2.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747556627/ecommerce/products/nppk3cxpriribdxfaxzw.jpg', '424593ce-c809-47b1-aad8-abc43261f55d', '6e111ff1-12af-443e-8b5a-7cfbcaefce9b'),
(164, '2025-05-18 08:23:47.000000', 'black2.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747556628/ecommerce/products/isis8qy416zzakhgsr5t.jpg', '424593ce-c809-47b1-aad8-abc43261f55d', '71a67d4c-5432-4733-8496-c7637c14db46'),
(165, '2025-05-18 08:23:48.000000', 'black3.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747556629/ecommerce/products/mbrciy2z8nzv22jetbpw.jpg', '424593ce-c809-47b1-aad8-abc43261f55d', 'f88b4a49-d154-4987-bef2-e288fba4b397'),
(166, '2025-05-18 08:23:49.000000', 'black3.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747556630/ecommerce/products/s6cm4b0xjg9krhq9er2g.jpg', '424593ce-c809-47b1-aad8-abc43261f55d', '6e111ff1-12af-443e-8b5a-7cfbcaefce9b'),
(167, '2025-05-18 08:23:50.000000', 'black3.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747556631/ecommerce/products/zqe5g0xv25xmdbahpqap.jpg', '424593ce-c809-47b1-aad8-abc43261f55d', '71a67d4c-5432-4733-8496-c7637c14db46'),
(168, '2025-05-18 14:18:49.000000', 'marron1.jpeg', b'1', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747577930/ecommerce/products/racx6hjgifxuoesx0sgd.jpg', '02377682-f092-49e8-90d1-c88051e8225e', NULL),
(169, '2025-05-18 14:18:50.000000', 'marron1.jpeg', b'1', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747577931/ecommerce/products/cwifrxw7sgmb53iexvr5.jpg', '02377682-f092-49e8-90d1-c88051e8225e', '8878fa2a-1d11-44f6-a0dd-194c62f80339'),
(170, '2025-05-18 14:18:51.000000', 'marron1.jpeg', b'1', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747577932/ecommerce/products/cggfgzjoi01flhunblb0.jpg', '02377682-f092-49e8-90d1-c88051e8225e', '10349ea9-75ae-4b3c-baad-26be3bdda8d5'),
(171, '2025-05-18 14:18:52.000000', 'marron1.jpeg', b'1', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747577933/ecommerce/products/wq1jwzgtvcokvfajx58w.jpg', '02377682-f092-49e8-90d1-c88051e8225e', 'fa8be379-20d8-4241-9602-74738e8640a4'),
(172, '2025-05-18 14:18:53.000000', 'marron2.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747577934/ecommerce/products/hf8t2cg0bwlmf0qhk3qg.jpg', '02377682-f092-49e8-90d1-c88051e8225e', '8878fa2a-1d11-44f6-a0dd-194c62f80339'),
(173, '2025-05-18 14:18:54.000000', 'marron2.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747577936/ecommerce/products/fs33lhtmv77ijn9t5cwt.jpg', '02377682-f092-49e8-90d1-c88051e8225e', '10349ea9-75ae-4b3c-baad-26be3bdda8d5'),
(174, '2025-05-18 14:18:55.000000', 'marron2.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747577937/ecommerce/products/fcu8bydlzspkjb8lq39h.jpg', '02377682-f092-49e8-90d1-c88051e8225e', 'fa8be379-20d8-4241-9602-74738e8640a4'),
(175, '2025-05-18 14:19:00.000000', 'marron3.jpg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747577941/ecommerce/products/nszztpcgwa0zk0xhtvzh.jpg', '02377682-f092-49e8-90d1-c88051e8225e', '8878fa2a-1d11-44f6-a0dd-194c62f80339'),
(176, '2025-05-18 14:19:03.000000', 'marron3.jpg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747577944/ecommerce/products/em0nasnodmqulyfyikkh.jpg', '02377682-f092-49e8-90d1-c88051e8225e', '10349ea9-75ae-4b3c-baad-26be3bdda8d5'),
(177, '2025-05-18 14:19:06.000000', 'marron3.jpg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747577947/ecommerce/products/bg87ilb80ticcp4b4wpf.jpg', '02377682-f092-49e8-90d1-c88051e8225e', 'fa8be379-20d8-4241-9602-74738e8640a4'),
(178, '2025-05-18 14:19:08.000000', 'black1.jpeg', b'1', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747577949/ecommerce/products/hcn6dvstdc0ndioo0dot.jpg', '02377682-f092-49e8-90d1-c88051e8225e', '6eb99d1a-bf27-4b0b-97d7-85421cf58baf'),
(179, '2025-05-18 14:19:09.000000', 'black1.jpeg', b'1', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747577950/ecommerce/products/cx69gltwt4ovnpbainjh.jpg', '02377682-f092-49e8-90d1-c88051e8225e', '129e8479-85da-44bc-843c-9234c93751fd'),
(180, '2025-05-18 14:19:10.000000', 'black1.jpeg', b'1', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747577951/ecommerce/products/m4s4kjlgdwsgi60vjnjm.jpg', '02377682-f092-49e8-90d1-c88051e8225e', '305fc827-a85c-4ffb-8df5-3da9ae8e14fa'),
(181, '2025-05-18 14:19:11.000000', 'black2.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747577952/ecommerce/products/nbcn0rzdfwoe0vimntdk.jpg', '02377682-f092-49e8-90d1-c88051e8225e', '6eb99d1a-bf27-4b0b-97d7-85421cf58baf'),
(182, '2025-05-18 14:19:12.000000', 'black2.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747577953/ecommerce/products/xmufhysb4uvqklerq5x3.jpg', '02377682-f092-49e8-90d1-c88051e8225e', '129e8479-85da-44bc-843c-9234c93751fd'),
(183, '2025-05-18 14:19:13.000000', 'black2.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747577954/ecommerce/products/ibh9zghcxdmz0mwd9p3v.jpg', '02377682-f092-49e8-90d1-c88051e8225e', '305fc827-a85c-4ffb-8df5-3da9ae8e14fa'),
(184, '2025-05-18 14:19:14.000000', 'black3.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747577955/ecommerce/products/rbyjsdhytvhalaelvwfx.jpg', '02377682-f092-49e8-90d1-c88051e8225e', '6eb99d1a-bf27-4b0b-97d7-85421cf58baf'),
(185, '2025-05-18 14:19:15.000000', 'black3.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747577956/ecommerce/products/vyypdxtrt9bz66u9eest.jpg', '02377682-f092-49e8-90d1-c88051e8225e', '129e8479-85da-44bc-843c-9234c93751fd'),
(186, '2025-05-18 14:19:16.000000', 'black3.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747577958/ecommerce/products/ovfz7awwyqlbdxydqc71.jpg', '02377682-f092-49e8-90d1-c88051e8225e', '305fc827-a85c-4ffb-8df5-3da9ae8e14fa'),
(187, '2025-05-18 14:21:04.000000', 'marron_1.jpeg', b'1', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747578065/ecommerce/products/ctyvuj1aptx92vcrffos.jpg', 'eb2a7312-a02d-4d91-9ae9-47fd3bb062fa', NULL),
(188, '2025-05-18 14:21:05.000000', 'marron_1.jpeg', b'1', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747578066/ecommerce/products/grhrjzfdf3lb3ufi4q91.jpg', 'eb2a7312-a02d-4d91-9ae9-47fd3bb062fa', '5dd83b37-bad4-4d21-81f4-5fe0fbc88104'),
(189, '2025-05-18 14:21:06.000000', 'marron_1.jpeg', b'1', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747578067/ecommerce/products/qnqwjz4ojdyol26s4uc2.jpg', 'eb2a7312-a02d-4d91-9ae9-47fd3bb062fa', 'd8dd11f5-2921-47fe-82c7-04cd7e905c4c'),
(190, '2025-05-18 14:21:07.000000', 'marron_1.jpeg', b'1', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747578068/ecommerce/products/evvrcnkawympktwxcwme.jpg', 'eb2a7312-a02d-4d91-9ae9-47fd3bb062fa', '8249359f-a073-47ab-9f2d-ae16921f8082'),
(191, '2025-05-18 14:21:09.000000', 'marron_2.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747578070/ecommerce/products/hhbihvzr0tdi12yvae9t.jpg', 'eb2a7312-a02d-4d91-9ae9-47fd3bb062fa', '5dd83b37-bad4-4d21-81f4-5fe0fbc88104'),
(192, '2025-05-18 14:21:11.000000', 'marron_2.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747578072/ecommerce/products/sgmxn7wp3xq6qdsv2xkt.jpg', 'eb2a7312-a02d-4d91-9ae9-47fd3bb062fa', 'd8dd11f5-2921-47fe-82c7-04cd7e905c4c'),
(193, '2025-05-18 14:21:13.000000', 'marron_2.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747578074/ecommerce/products/iv2axy8tqqyj3uyvx3lo.jpg', 'eb2a7312-a02d-4d91-9ae9-47fd3bb062fa', '8249359f-a073-47ab-9f2d-ae16921f8082'),
(194, '2025-05-18 14:21:14.000000', 'marron_3.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747578076/ecommerce/products/dih0vh2fq48ke670zz3w.jpg', 'eb2a7312-a02d-4d91-9ae9-47fd3bb062fa', '5dd83b37-bad4-4d21-81f4-5fe0fbc88104'),
(195, '2025-05-18 14:21:16.000000', 'marron_3.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747578077/ecommerce/products/dbzzvpi65whh0ocdyd1n.jpg', 'eb2a7312-a02d-4d91-9ae9-47fd3bb062fa', 'd8dd11f5-2921-47fe-82c7-04cd7e905c4c'),
(196, '2025-05-18 14:21:17.000000', 'marron_3.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747578078/ecommerce/products/lusubvflrhgfvtmrow1h.jpg', 'eb2a7312-a02d-4d91-9ae9-47fd3bb062fa', '8249359f-a073-47ab-9f2d-ae16921f8082'),
(197, '2025-05-18 14:21:18.000000', 'bleu_marrine_1.jpeg', b'1', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747578080/ecommerce/products/hzye2c1yrt7el6qgwwa5.jpg', 'eb2a7312-a02d-4d91-9ae9-47fd3bb062fa', 'af23bdca-3b1f-4ca2-9fe4-002f8f2da382'),
(198, '2025-05-18 14:21:20.000000', 'bleu_marrine_1.jpeg', b'1', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747578081/ecommerce/products/qomekimtxt0orfbwtvqw.jpg', 'eb2a7312-a02d-4d91-9ae9-47fd3bb062fa', 'f2142ff1-d432-42e3-b923-baf81ef3f277'),
(199, '2025-05-18 14:21:21.000000', 'bleu_marrine_1.jpeg', b'1', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747578082/ecommerce/products/fdr8sqvhvlta7kmyyrcf.jpg', 'eb2a7312-a02d-4d91-9ae9-47fd3bb062fa', '60e77eb1-f4e8-4377-b0aa-39ca2a8d9031'),
(200, '2025-05-18 14:21:24.000000', 'bleu_marrine_2.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747578085/ecommerce/products/httlzzoiaxdyjuona1qe.jpg', 'eb2a7312-a02d-4d91-9ae9-47fd3bb062fa', 'af23bdca-3b1f-4ca2-9fe4-002f8f2da382'),
(201, '2025-05-18 14:21:26.000000', 'bleu_marrine_2.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747578087/ecommerce/products/nb4m3lb1xmt08cd8aqaz.jpg', 'eb2a7312-a02d-4d91-9ae9-47fd3bb062fa', 'f2142ff1-d432-42e3-b923-baf81ef3f277'),
(202, '2025-05-18 14:21:29.000000', 'bleu_marrine_2.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747578090/ecommerce/products/ydvm0rlur1eidn6mqbhd.jpg', 'eb2a7312-a02d-4d91-9ae9-47fd3bb062fa', '60e77eb1-f4e8-4377-b0aa-39ca2a8d9031'),
(203, '2025-05-18 14:21:30.000000', 'bleu_marrine_3.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747578092/ecommerce/products/neotouzejjjgcldccfvy.jpg', 'eb2a7312-a02d-4d91-9ae9-47fd3bb062fa', 'af23bdca-3b1f-4ca2-9fe4-002f8f2da382'),
(204, '2025-05-18 14:21:32.000000', 'bleu_marrine_3.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747578093/ecommerce/products/caj8uxmulg5ytkkcdyn5.jpg', 'eb2a7312-a02d-4d91-9ae9-47fd3bb062fa', 'f2142ff1-d432-42e3-b923-baf81ef3f277'),
(205, '2025-05-18 14:21:34.000000', 'bleu_marrine_3.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747578095/ecommerce/products/dvr9a7bquin0mrqxvxkh.jpg', 'eb2a7312-a02d-4d91-9ae9-47fd3bb062fa', '60e77eb1-f4e8-4377-b0aa-39ca2a8d9031'),
(206, '2025-05-20 13:29:21.000000', 'iphone_black1.jpg', b'1', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747747762/ecommerce/products/pvfsnkizbiszinexzdvw.jpg', '493d2ceb-6c55-424f-a5ba-f90520e248e8', NULL),
(207, '2025-05-20 13:29:23.000000', 'iphone_black1.jpg', b'1', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747747764/ecommerce/products/xxs2gvckjdbcgtqbhzv3.jpg', '493d2ceb-6c55-424f-a5ba-f90520e248e8', 'a4b11850-6cc3-4b4f-a95f-208aef2e1328'),
(208, '2025-05-20 13:29:25.000000', 'iphone_black1.jpg', b'1', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747747766/ecommerce/products/cz6cegoesadsbtm3cclh.jpg', '493d2ceb-6c55-424f-a5ba-f90520e248e8', '0a7c11a5-81e3-46c1-9d15-22d5eba955c4'),
(209, '2025-05-20 13:29:27.000000', 'iphone_black2.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747747768/ecommerce/products/ma8lnphgcueeipmiroch.jpg', '493d2ceb-6c55-424f-a5ba-f90520e248e8', 'a4b11850-6cc3-4b4f-a95f-208aef2e1328'),
(210, '2025-05-20 13:29:28.000000', 'iphone_black2.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747747769/ecommerce/products/uatlopmpzptsv9rujfmd.jpg', '493d2ceb-6c55-424f-a5ba-f90520e248e8', '0a7c11a5-81e3-46c1-9d15-22d5eba955c4'),
(211, '2025-05-20 13:30:10.000000', 'iphone_gold_1.jpeg', b'1', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747747811/ecommerce/products/s5haaweifzck9r8sohmz.jpg', '493d2ceb-6c55-424f-a5ba-f90520e248e8', '00bd4bfa-467f-4baa-8c47-f18fb1a071b6'),
(212, '2025-05-20 13:30:12.000000', 'iphone_gold_1.jpeg', b'1', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747747814/ecommerce/products/xjnarxvyq91udqfafnil.jpg', '493d2ceb-6c55-424f-a5ba-f90520e248e8', '8f171e35-9360-4787-87cc-3ca1eb55f14d'),
(213, '2025-05-20 13:30:14.000000', 'iphone_gold_2.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747747815/ecommerce/products/thghlnfukiyzxkcielsp.jpg', '493d2ceb-6c55-424f-a5ba-f90520e248e8', '00bd4bfa-467f-4baa-8c47-f18fb1a071b6'),
(214, '2025-05-20 13:30:15.000000', 'iphone_gold_2.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747747816/ecommerce/products/jdnkyrf8e2eesxw8dimt.jpg', '493d2ceb-6c55-424f-a5ba-f90520e248e8', '8f171e35-9360-4787-87cc-3ca1eb55f14d'),
(215, '2025-05-20 13:30:16.000000', 'iphone_gold_3.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747747817/ecommerce/products/vzpxl1covnilundbyims.jpg', '493d2ceb-6c55-424f-a5ba-f90520e248e8', '00bd4bfa-467f-4baa-8c47-f18fb1a071b6'),
(216, '2025-05-20 13:30:17.000000', 'iphone_gold_3.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747747818/ecommerce/products/fjpjksemwaceknt4hpmm.jpg', '493d2ceb-6c55-424f-a5ba-f90520e248e8', '8f171e35-9360-4787-87cc-3ca1eb55f14d'),
(217, '2025-05-22 16:53:51.000000', 'rouge1.jpg', b'1', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747932830/ecommerce/products/jpc4o87u9fymjako69cm.jpg', '6637e026-1c22-4f20-b2c4-4326711b59ec', NULL),
(218, '2025-05-22 16:53:52.000000', 'rouge1.jpg', b'1', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747932832/ecommerce/products/axnvsonpfhzequ76whna.jpg', '6637e026-1c22-4f20-b2c4-4326711b59ec', 'b7e1ef32-8399-45bb-9a28-6b8a9d56cdc4'),
(219, '2025-05-22 16:53:54.000000', 'rouge1.jpg', b'1', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747932833/ecommerce/products/to4fjgqd00tv4ksyicwc.jpg', '6637e026-1c22-4f20-b2c4-4326711b59ec', '03fe05b0-3fb4-4012-b77b-c07accdec883'),
(220, '2025-05-22 16:53:55.000000', 'rouge1.jpg', b'1', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747932835/ecommerce/products/cjqlzmvn1dsmngqgsd2x.jpg', '6637e026-1c22-4f20-b2c4-4326711b59ec', '6d9c6574-ac8a-48ca-8a7b-95af9cf7d77f'),
(221, '2025-05-22 16:53:57.000000', 'rouge2.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747932836/ecommerce/products/ophkbws8moi65sarrxbc.jpg', '6637e026-1c22-4f20-b2c4-4326711b59ec', 'b7e1ef32-8399-45bb-9a28-6b8a9d56cdc4'),
(222, '2025-05-22 16:53:58.000000', 'rouge2.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747932837/ecommerce/products/joipc0idhlwrr6c2he98.jpg', '6637e026-1c22-4f20-b2c4-4326711b59ec', '03fe05b0-3fb4-4012-b77b-c07accdec883'),
(223, '2025-05-22 16:53:59.000000', 'rouge2.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747932839/ecommerce/products/wemjeifpaic8bp5l0yu1.jpg', '6637e026-1c22-4f20-b2c4-4326711b59ec', '6d9c6574-ac8a-48ca-8a7b-95af9cf7d77f'),
(224, '2025-05-22 16:54:00.000000', 'rouge3.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747932840/ecommerce/products/d5dvj7cyujv597nrumih.jpg', '6637e026-1c22-4f20-b2c4-4326711b59ec', 'b7e1ef32-8399-45bb-9a28-6b8a9d56cdc4'),
(225, '2025-05-22 16:54:01.000000', 'rouge3.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747932841/ecommerce/products/yxa4oqthely2zhrqmzwb.jpg', '6637e026-1c22-4f20-b2c4-4326711b59ec', '03fe05b0-3fb4-4012-b77b-c07accdec883'),
(226, '2025-05-22 16:54:03.000000', 'rouge3.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747932842/ecommerce/products/htcygpi2zswp4qajmd45.jpg', '6637e026-1c22-4f20-b2c4-4326711b59ec', '6d9c6574-ac8a-48ca-8a7b-95af9cf7d77f'),
(227, '2025-05-22 16:54:04.000000', 'noir1.jpg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747932843/ecommerce/products/q0xuubgccolhyhze44ps.jpg', '6637e026-1c22-4f20-b2c4-4326711b59ec', 'b7e1ef32-8399-45bb-9a28-6b8a9d56cdc4'),
(228, '2025-05-22 16:54:05.000000', 'noir1.jpg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747932845/ecommerce/products/ejmaozgfqotpml46vukx.jpg', '6637e026-1c22-4f20-b2c4-4326711b59ec', '03fe05b0-3fb4-4012-b77b-c07accdec883'),
(229, '2025-05-22 16:54:06.000000', 'noir1.jpg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747932846/ecommerce/products/m1xlaiotwm7xmsqu6scb.jpg', '6637e026-1c22-4f20-b2c4-4326711b59ec', '6d9c6574-ac8a-48ca-8a7b-95af9cf7d77f'),
(230, '2025-05-22 16:54:07.000000', 'noir2.jpeg', b'1', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747932847/ecommerce/products/cakeifszvvghedtj9eps.jpg', '6637e026-1c22-4f20-b2c4-4326711b59ec', 'd0969d9d-d90c-4fd5-a67b-fc9ead413174'),
(231, '2025-05-22 16:54:09.000000', 'noir2.jpeg', b'1', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747932848/ecommerce/products/qngsw2nxvybxuonujdaj.jpg', '6637e026-1c22-4f20-b2c4-4326711b59ec', 'b6dc2906-f0d1-4f4a-bf24-f2caff6cc5fa'),
(232, '2025-05-22 16:54:10.000000', 'noir2.jpeg', b'1', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747932850/ecommerce/products/zaksdkr311dqhfnromup.jpg', '6637e026-1c22-4f20-b2c4-4326711b59ec', '90f8e8a6-6378-4923-9c6f-524e4f36b571'),
(233, '2025-05-22 16:54:11.000000', 'noir2.jpeg', b'1', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747932851/ecommerce/products/urouarrzweovzqzjxccd.jpg', '6637e026-1c22-4f20-b2c4-4326711b59ec', '7d21f0ce-c123-4023-88aa-0b8fcfd9e48b'),
(234, '2025-05-22 16:54:12.000000', 'noir4.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747932852/ecommerce/products/hdzlkvmchg7iksw4y8ik.jpg', '6637e026-1c22-4f20-b2c4-4326711b59ec', 'd0969d9d-d90c-4fd5-a67b-fc9ead413174'),
(235, '2025-05-22 16:54:13.000000', 'noir4.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747932853/ecommerce/products/rryciwvhfgts3hhvfnos.jpg', '6637e026-1c22-4f20-b2c4-4326711b59ec', 'b6dc2906-f0d1-4f4a-bf24-f2caff6cc5fa'),
(236, '2025-05-22 16:54:14.000000', 'noir4.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747932854/ecommerce/products/soqkgzxbb3minfd28npy.jpg', '6637e026-1c22-4f20-b2c4-4326711b59ec', '90f8e8a6-6378-4923-9c6f-524e4f36b571'),
(237, '2025-05-22 16:54:16.000000', 'noir4.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747932855/ecommerce/products/hpyv7voftqimmtsfleq4.jpg', '6637e026-1c22-4f20-b2c4-4326711b59ec', '7d21f0ce-c123-4023-88aa-0b8fcfd9e48b'),
(238, '2025-05-22 16:54:17.000000', 'noir5.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747932856/ecommerce/products/f8bktpu72nfjitqw3hnv.jpg', '6637e026-1c22-4f20-b2c4-4326711b59ec', 'd0969d9d-d90c-4fd5-a67b-fc9ead413174'),
(239, '2025-05-22 16:54:18.000000', 'noir5.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747932857/ecommerce/products/h98j8kkt6jek28s5cxk4.jpg', '6637e026-1c22-4f20-b2c4-4326711b59ec', 'b6dc2906-f0d1-4f4a-bf24-f2caff6cc5fa'),
(240, '2025-05-22 16:54:19.000000', 'noir5.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747932859/ecommerce/products/b4tbvu2hap7wupglspi2.jpg', '6637e026-1c22-4f20-b2c4-4326711b59ec', '90f8e8a6-6378-4923-9c6f-524e4f36b571'),
(241, '2025-05-22 16:54:20.000000', 'noir5.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747932860/ecommerce/products/bqj8me4aim9mrs28bqae.jpg', '6637e026-1c22-4f20-b2c4-4326711b59ec', '7d21f0ce-c123-4023-88aa-0b8fcfd9e48b'),
(242, '2025-05-22 16:54:54.000000', 'rouge1.jpg', b'1', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747932894/ecommerce/products/wjjxqj9yvktpcvkcval2.jpg', '1ebad9ee-f8af-4ac0-850f-1d2f9cb2f71e', NULL),
(243, '2025-05-22 16:54:57.000000', 'rouge1.jpg', b'1', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747932896/ecommerce/products/pbqi0azexo13fyse9kql.jpg', '1ebad9ee-f8af-4ac0-850f-1d2f9cb2f71e', '34fbfc51-ccb1-483a-a1dc-d8d5c01e922c'),
(244, '2025-05-22 16:55:00.000000', 'rouge1.jpg', b'1', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747932899/ecommerce/products/c3z4q6lill6pwuua2ln8.jpg', '1ebad9ee-f8af-4ac0-850f-1d2f9cb2f71e', '7bdf7d0f-fed1-49b3-a7e7-d235f5c332e6'),
(245, '2025-05-22 16:55:01.000000', 'rouge1.jpg', b'1', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747932901/ecommerce/products/wgmqcf8oywhwyq2uz3no.jpg', '1ebad9ee-f8af-4ac0-850f-1d2f9cb2f71e', 'b537c194-f125-4904-a0d8-6cf8c640bd7e'),
(246, '2025-05-22 16:55:03.000000', 'rouge2.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747932902/ecommerce/products/ubaykzpukzolqpodujrs.jpg', '1ebad9ee-f8af-4ac0-850f-1d2f9cb2f71e', '34fbfc51-ccb1-483a-a1dc-d8d5c01e922c'),
(247, '2025-05-22 16:55:04.000000', 'rouge2.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747932903/ecommerce/products/t6e1kid4zs2hqyduyusi.jpg', '1ebad9ee-f8af-4ac0-850f-1d2f9cb2f71e', '7bdf7d0f-fed1-49b3-a7e7-d235f5c332e6'),
(248, '2025-05-22 16:55:05.000000', 'rouge2.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747932904/ecommerce/products/f9rxd4wacxrinoluyrwp.jpg', '1ebad9ee-f8af-4ac0-850f-1d2f9cb2f71e', 'b537c194-f125-4904-a0d8-6cf8c640bd7e'),
(249, '2025-05-22 16:55:06.000000', 'rouge3.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747932905/ecommerce/products/swr5stsuztisvsz2iath.jpg', '1ebad9ee-f8af-4ac0-850f-1d2f9cb2f71e', '34fbfc51-ccb1-483a-a1dc-d8d5c01e922c'),
(250, '2025-05-22 16:55:07.000000', 'rouge3.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747932906/ecommerce/products/djwyswmohac3iikdwq8h.jpg', '1ebad9ee-f8af-4ac0-850f-1d2f9cb2f71e', '7bdf7d0f-fed1-49b3-a7e7-d235f5c332e6'),
(251, '2025-05-22 16:55:08.000000', 'rouge3.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747932908/ecommerce/products/rliinryhmw6dmbp9tcsp.jpg', '1ebad9ee-f8af-4ac0-850f-1d2f9cb2f71e', 'b537c194-f125-4904-a0d8-6cf8c640bd7e'),
(252, '2025-05-22 16:55:09.000000', 'noir1.jpg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747932909/ecommerce/products/oul20ws8bv9hybzuacc4.jpg', '1ebad9ee-f8af-4ac0-850f-1d2f9cb2f71e', '34fbfc51-ccb1-483a-a1dc-d8d5c01e922c'),
(253, '2025-05-22 16:55:11.000000', 'noir1.jpg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747932911/ecommerce/products/qq5fbykwiul2de2tcncy.jpg', '1ebad9ee-f8af-4ac0-850f-1d2f9cb2f71e', '7bdf7d0f-fed1-49b3-a7e7-d235f5c332e6'),
(254, '2025-05-22 16:55:12.000000', 'noir1.jpg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747932912/ecommerce/products/vby8k4056xnj0snbdsls.jpg', '1ebad9ee-f8af-4ac0-850f-1d2f9cb2f71e', 'b537c194-f125-4904-a0d8-6cf8c640bd7e'),
(255, '2025-05-22 16:55:13.000000', 'noir2.jpeg', b'1', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747932913/ecommerce/products/xdnnif23ir68kfbdbpco.jpg', '1ebad9ee-f8af-4ac0-850f-1d2f9cb2f71e', 'd849779b-8c54-4893-84cb-34396d2f125f'),
(256, '2025-05-22 16:55:15.000000', 'noir2.jpeg', b'1', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747932914/ecommerce/products/e6xg2x1hyied18jejhny.jpg', '1ebad9ee-f8af-4ac0-850f-1d2f9cb2f71e', '91899530-c46a-4c93-b937-6f45dcd96218'),
(257, '2025-05-22 16:55:16.000000', 'noir2.jpeg', b'1', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747932915/ecommerce/products/pjiojletae5kmzvkwlly.jpg', '1ebad9ee-f8af-4ac0-850f-1d2f9cb2f71e', '55d87d35-ba66-4d72-ac7d-5e068a3e058a'),
(258, '2025-05-22 16:55:17.000000', 'noir2.jpeg', b'1', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747932916/ecommerce/products/wpyhzhmcrqhkngmaz8ez.jpg', '1ebad9ee-f8af-4ac0-850f-1d2f9cb2f71e', '8d645e17-b68a-43a2-b032-8c825ffdb89b'),
(259, '2025-05-22 16:55:18.000000', 'noir4.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747932917/ecommerce/products/a768xngwwoec3ikjrfm3.jpg', '1ebad9ee-f8af-4ac0-850f-1d2f9cb2f71e', 'd849779b-8c54-4893-84cb-34396d2f125f'),
(260, '2025-05-22 16:55:19.000000', 'noir4.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747932918/ecommerce/products/c9dooq29nx7lnku3ov5b.jpg', '1ebad9ee-f8af-4ac0-850f-1d2f9cb2f71e', '91899530-c46a-4c93-b937-6f45dcd96218'),
(261, '2025-05-22 16:55:20.000000', 'noir4.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747932919/ecommerce/products/vqddflxwizpyazces2si.jpg', '1ebad9ee-f8af-4ac0-850f-1d2f9cb2f71e', '55d87d35-ba66-4d72-ac7d-5e068a3e058a'),
(262, '2025-05-22 16:55:21.000000', 'noir4.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747932920/ecommerce/products/utuwuv4heti7unlay5jx.jpg', '1ebad9ee-f8af-4ac0-850f-1d2f9cb2f71e', '8d645e17-b68a-43a2-b032-8c825ffdb89b'),
(263, '2025-05-22 16:55:22.000000', 'noir5.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747932921/ecommerce/products/cordorn048z4gsydl2gt.jpg', '1ebad9ee-f8af-4ac0-850f-1d2f9cb2f71e', 'd849779b-8c54-4893-84cb-34396d2f125f'),
(264, '2025-05-22 16:55:23.000000', 'noir5.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747932922/ecommerce/products/l2pmpe7kyrzvxafjrib1.jpg', '1ebad9ee-f8af-4ac0-850f-1d2f9cb2f71e', '91899530-c46a-4c93-b937-6f45dcd96218'),
(265, '2025-05-22 16:55:24.000000', 'noir5.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747932923/ecommerce/products/hb5kq14vyqfqux6bwreh.jpg', '1ebad9ee-f8af-4ac0-850f-1d2f9cb2f71e', '55d87d35-ba66-4d72-ac7d-5e068a3e058a'),
(266, '2025-05-22 16:55:25.000000', 'noir5.jpeg', b'0', 'image/jpeg', 'https://res.cloudinary.com/dsvwny6le/image/upload/v1747932925/ecommerce/products/p5todht6qelgtwidohiy.jpg', '1ebad9ee-f8af-4ac0-850f-1d2f9cb2f71e', '8d645e17-b68a-43a2-b032-8c825ffdb89b');

-- --------------------------------------------------------

--
-- Structure de la table `product_type`
--

CREATE TABLE `product_type` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `product_type`
--

INSERT INTO `product_type` (`id`, `name`) VALUES
('a1d5f927-9e39-438e-a45a-2b0bfdb8f28d', 'Windows Phone'),
('d73385e8-9f86-426b-97b4-9bed3ec4cc72', 'SamrtPhone'),
('d90c147d-5c5a-4368-9a73-e5cabb445ea8', 'onduleur electronique');

-- --------------------------------------------------------

--
-- Structure de la table `product_type_hierarchy`
--

CREATE TABLE `product_type_hierarchy` (
  `id` char(36) NOT NULL,
  `product_type_id` char(36) NOT NULL,
  `category_id` char(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `product_type_hierarchy`
--

INSERT INTO `product_type_hierarchy` (`id`, `product_type_id`, `category_id`) VALUES
('304a7d61-4acc-11f0-a28a-1418779f1bb2', 'd90c147d-5c5a-4368-9a73-e5cabb445ea8', '409d48b2-42d2-4be7-8823-a068ea176520'),
('304a80a6-4acc-11f0-a28a-1418779f1bb2', 'a1d5f927-9e39-438e-a45a-2b0bfdb8f28d', 'e43bdfdc-972c-41ff-b704-6c6165c86c8e'),
('304a8166-4acc-11f0-a28a-1418779f1bb2', 'd73385e8-9f86-426b-97b4-9bed3ec4cc72', 'e43bdfdc-972c-41ff-b704-6c6165c86c8e');

-- --------------------------------------------------------

--
-- Structure de la table `product_variants`
--

CREATE TABLE `product_variants` (
  `id` char(36) NOT NULL,
  `color` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `price_modifier` decimal(38,2) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `sku` varchar(255) NOT NULL,
  `stock` int(11) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `variant_type` enum('COLOR','COLOR_AND_SIZE','NONE','SIZE') DEFAULT NULL,
  `product_id` char(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `product_variants`
--

INSERT INTO `product_variants` (`id`, `color`, `created_at`, `price_modifier`, `size`, `sku`, `stock`, `updated_at`, `variant_type`, `product_id`) VALUES
('00bd4bfa-467f-4baa-8c47-f18fb1a071b6', 'Or', '2025-05-20 13:29:21.000000', 0.00, '64GB', 'SMA-ED97D4C2-4FB-OR-64GB', 20, '2025-05-20 13:29:21.000000', 'COLOR_AND_SIZE', '493d2ceb-6c55-424f-a5ba-f90520e248e8'),
('01f1642b-f9be-42d4-8358-4a8462bcd007', 'Rouge', '2025-05-17 09:45:43.000000', 0.00, NULL, 'SAG-D8B2FD65-943-ROUGE', 20, '2025-05-17 09:45:43.000000', 'COLOR', 'cc3456db-2625-41e0-a035-99c81624ed8a'),
('03fe05b0-3fb4-4012-b77b-c07accdec883', 'Rouge', '2025-05-22 16:53:51.000000', 14.00, '128GB', 'SAM-53C41C00-01D-ROUGE-128GB', 12, '2025-05-22 16:53:51.000000', 'COLOR_AND_SIZE', '6637e026-1c22-4f20-b2c4-4326711b59ec'),
('05e12964-089f-4ab8-ade4-53e4b27b0a89', 'bleu', '2025-05-17 09:45:43.000000', 12.00, NULL, 'SAG-D8B2FD65-943-BLEU', 15, '2025-05-17 09:45:43.000000', 'COLOR', 'cc3456db-2625-41e0-a035-99c81624ed8a'),
('0a7c11a5-81e3-46c1-9d15-22d5eba955c4', 'Noir', '2025-05-20 13:29:21.000000', 14.00, '128GB', 'SMA-ED97D4C2-4FB-NOIR-128GB', 12, '2025-05-20 13:29:21.000000', 'COLOR_AND_SIZE', '493d2ceb-6c55-424f-a5ba-f90520e248e8'),
('10349ea9-75ae-4b3c-baad-26be3bdda8d5', 'marron', '2025-05-18 14:18:49.000000', 14.00, NULL, 'SAG-D8C72C99-C31-MARRON', 12, '2025-05-18 14:18:49.000000', 'COLOR', '02377682-f092-49e8-90d1-c88051e8225e'),
('129e8479-85da-44bc-843c-9234c93751fd', 'bleu-marine', '2025-05-18 14:18:49.000000', 0.00, NULL, 'SAG-D8C72C99-C31-BLEU-MARINE', 18, '2025-05-18 14:18:49.000000', 'COLOR', '02377682-f092-49e8-90d1-c88051e8225e'),
('2193414c-20e5-46df-ad66-55c79ceecd19', 'gris', '2025-05-17 14:57:40.000000', 0.00, NULL, 'SAG-F6E1038B-C01-GRIS', 20, '2025-05-17 14:57:40.000000', 'COLOR', '7c1c744f-18cb-4bd1-bf11-ee66a7dc99f3'),
('305fc827-a85c-4ffb-8df5-3da9ae8e14fa', 'bleu-marine', '2025-05-18 14:18:49.000000', 2.00, NULL, 'SAG-D8C72C99-C31-BLEU-MARINE', 10, '2025-05-18 14:18:49.000000', 'COLOR', '02377682-f092-49e8-90d1-c88051e8225e'),
('310fd686-d078-463f-85bd-54d6b52f39bd', 'bleu', '2025-05-17 09:45:43.000000', 14.00, NULL, 'SAG-D8B2FD65-943-BLEU', 12, '2025-05-17 09:45:43.000000', 'COLOR', 'cc3456db-2625-41e0-a035-99c81624ed8a'),
('31a75c22-0c15-4c42-b43b-cc8033b6474b', 'Dorée', '2025-05-17 09:45:43.000000', 22.50, NULL, 'SAG-D8B2FD65-943-DORÉE', 8, '2025-05-17 09:45:43.000000', 'COLOR', 'cc3456db-2625-41e0-a035-99c81624ed8a'),
('34fbfc51-ccb1-483a-a1dc-d8d5c01e922c', 'Rouge', '2025-05-22 16:54:54.000000', 12.00, '64GB', 'SAM-055F51BC-466-ROUGE-64GB', 15, '2025-05-22 16:54:54.000000', 'COLOR_AND_SIZE', '1ebad9ee-f8af-4ac0-850f-1d2f9cb2f71e'),
('39ec23d5-5a72-40f3-882f-849dd0b58a8c', 'noir', '2025-05-18 01:30:33.000000', 14.00, NULL, 'SAG-FB086D76-BD5-NOIR', 12, '2025-05-18 01:30:33.000000', 'COLOR', '98b24275-4fdd-4ecf-8780-45bb443a57fe'),
('3add9cfd-f8c4-442f-805e-69ec31d0b3ea', 'noir', '2025-05-18 02:03:21.000000', 22.50, NULL, 'SAG-2036B5A3-A8C-NOIR', 8, '2025-05-18 02:03:21.000000', 'COLOR', '3b13056b-38b9-493c-8e4f-35f9909d8e6b'),
('3bca83d8-0a15-4df1-84a9-caed8df96afa', 'gris', '2025-05-18 02:03:21.000000', 0.00, NULL, 'SAG-2036B5A3-A8C-GRIS', 18, '2025-05-18 02:03:21.000000', 'COLOR', '3b13056b-38b9-493c-8e4f-35f9909d8e6b'),
('3d64af81-edbc-408c-bb63-20668357a9d7', 'gris', '2025-05-18 01:30:33.000000', 0.00, NULL, 'SAG-FB086D76-BD5-GRIS', 18, '2025-05-18 01:30:33.000000', 'COLOR', '98b24275-4fdd-4ecf-8780-45bb443a57fe'),
('47184bcc-dd87-4292-9882-42acd163e00d', 'Dorée', '2025-05-17 09:45:43.000000', 12.00, NULL, 'SAG-D8B2FD65-943-DORÉE', 15, '2025-05-17 09:45:43.000000', 'COLOR', 'cc3456db-2625-41e0-a035-99c81624ed8a'),
('4ccbfe21-ce8a-4534-95a9-ea8e3f8cad18', 'bleu', '2025-05-17 09:45:43.000000', 22.50, NULL, 'SAG-D8B2FD65-943-BLEU', 8, '2025-05-17 09:45:43.000000', 'COLOR', 'cc3456db-2625-41e0-a035-99c81624ed8a'),
('50b2652f-c200-4ad3-a34f-965f711779d3', 'marron', '2025-05-18 08:23:25.000000', 14.00, NULL, 'SAG-34D5226D-889-MARRON', 12, '2025-05-18 08:23:25.000000', 'COLOR', '424593ce-c809-47b1-aad8-abc43261f55d'),
('50dfcc62-428c-498d-9564-070f5be0777e', 'Dorée', '2025-05-17 09:45:43.000000', 14.00, NULL, 'SAG-D8B2FD65-943-DORÉE', 12, '2025-05-17 09:45:43.000000', 'COLOR', 'cc3456db-2625-41e0-a035-99c81624ed8a'),
('5292bc5a-9cc0-4c7b-80f9-2bdd0b1f860d', 'Rouge', '2025-05-17 09:45:43.000000', 2.00, NULL, 'SAG-D8B2FD65-943-ROUGE', 10, '2025-05-17 09:45:43.000000', 'COLOR', 'cc3456db-2625-41e0-a035-99c81624ed8a'),
('55d87d35-ba66-4d72-ac7d-5e068a3e058a', 'Noir', '2025-05-22 16:54:54.000000', 0.00, '256GB', 'SAM-055F51BC-466-NOIR-256GB', 20, '2025-05-22 16:54:54.000000', 'COLOR_AND_SIZE', '1ebad9ee-f8af-4ac0-850f-1d2f9cb2f71e'),
('5dd83b37-bad4-4d21-81f4-5fe0fbc88104', 'marron', '2025-05-18 14:21:04.000000', 12.00, NULL, 'SAG-EDA2A56E-61C-MARRON', 15, '2025-05-18 14:21:04.000000', 'COLOR', 'eb2a7312-a02d-4d91-9ae9-47fd3bb062fa'),
('5f4ee9b9-042c-4bc1-a96e-81c857584e31', 'gris', '2025-05-18 01:30:33.000000', 2.00, NULL, 'SAG-FB086D76-BD5-GRIS', 10, '2025-05-18 01:30:33.000000', 'COLOR', '98b24275-4fdd-4ecf-8780-45bb443a57fe'),
('60aa0ae2-3191-4052-ac20-fdca8d84a6ee', 'noir', '2025-05-18 02:03:21.000000', 14.00, NULL, 'SAG-2036B5A3-A8C-NOIR', 12, '2025-05-18 02:03:21.000000', 'COLOR', '3b13056b-38b9-493c-8e4f-35f9909d8e6b'),
('60e77eb1-f4e8-4377-b0aa-39ca2a8d9031', 'bleu-marine', '2025-05-18 14:21:04.000000', 2.00, NULL, 'SAG-EDA2A56E-61C-BLEU-MARINE', 10, '2025-05-18 14:21:04.000000', 'COLOR', 'eb2a7312-a02d-4d91-9ae9-47fd3bb062fa'),
('6d9c6574-ac8a-48ca-8a7b-95af9cf7d77f', 'Rouge', '2025-05-22 16:53:51.000000', 14.00, '256', 'SAM-53C41C00-01D-ROUGE-256', 12, '2025-05-22 16:53:51.000000', 'COLOR_AND_SIZE', '6637e026-1c22-4f20-b2c4-4326711b59ec'),
('6e111ff1-12af-443e-8b5a-7cfbcaefce9b', 'noir', '2025-05-18 08:23:25.000000', 0.00, NULL, 'SAG-34D5226D-889-NOIR', 18, '2025-05-18 08:23:25.000000', 'COLOR', '424593ce-c809-47b1-aad8-abc43261f55d'),
('6e20bfd9-5866-4ad4-b13c-f1027fd502b8', 'noir', '2025-05-18 01:30:33.000000', 12.00, NULL, 'SAG-FB086D76-BD5-NOIR', 15, '2025-05-18 01:30:33.000000', 'COLOR', '98b24275-4fdd-4ecf-8780-45bb443a57fe'),
('6eb99d1a-bf27-4b0b-97d7-85421cf58baf', 'bleu-marine', '2025-05-18 14:18:49.000000', 0.00, NULL, 'SAG-D8C72C99-C31-BLEU-MARINE', 20, '2025-05-18 14:18:49.000000', 'COLOR', '02377682-f092-49e8-90d1-c88051e8225e'),
('7045b927-8232-4d26-a73f-73de0d7214c6', 'noir', '2025-05-17 14:57:40.000000', 12.00, NULL, 'SAG-F6E1038B-C01-NOIR', 15, '2025-05-17 14:57:40.000000', 'COLOR', '7c1c744f-18cb-4bd1-bf11-ee66a7dc99f3'),
('71a67d4c-5432-4733-8496-c7637c14db46', 'noir', '2025-05-18 08:23:25.000000', 2.00, NULL, 'SAG-34D5226D-889-NOIR', 10, '2025-05-18 08:23:25.000000', 'COLOR', '424593ce-c809-47b1-aad8-abc43261f55d'),
('7649b92d-d1f1-4641-9146-64db9a7769e9', 'gris', '2025-05-18 02:03:21.000000', 0.00, NULL, 'SAG-2036B5A3-A8C-GRIS', 20, '2025-05-18 02:03:21.000000', 'COLOR', '3b13056b-38b9-493c-8e4f-35f9909d8e6b'),
('7bdf7d0f-fed1-49b3-a7e7-d235f5c332e6', 'Rouge', '2025-05-22 16:54:54.000000', 14.00, '128GB', 'SAM-055F51BC-466-ROUGE-128GB', 12, '2025-05-22 16:54:54.000000', 'COLOR_AND_SIZE', '1ebad9ee-f8af-4ac0-850f-1d2f9cb2f71e'),
('7d21f0ce-c123-4023-88aa-0b8fcfd9e48b', 'Noir', '2025-05-22 16:53:51.000000', 0.00, '32GB', 'SAM-53C41C00-01D-NOIR-32GB', 18, '2025-05-22 16:53:51.000000', 'COLOR_AND_SIZE', '6637e026-1c22-4f20-b2c4-4326711b59ec'),
('8249359f-a073-47ab-9f2d-ae16921f8082', 'marron', '2025-05-18 14:21:04.000000', 22.50, NULL, 'SAG-EDA2A56E-61C-MARRON', 8, '2025-05-18 14:21:04.000000', 'COLOR', 'eb2a7312-a02d-4d91-9ae9-47fd3bb062fa'),
('8878fa2a-1d11-44f6-a0dd-194c62f80339', 'marron', '2025-05-18 14:18:49.000000', 12.00, NULL, 'SAG-D8C72C99-C31-MARRON', 15, '2025-05-18 14:18:49.000000', 'COLOR', '02377682-f092-49e8-90d1-c88051e8225e'),
('8d645e17-b68a-43a2-b032-8c825ffdb89b', 'Noir', '2025-05-22 16:54:54.000000', 0.00, '32GB', 'SAM-055F51BC-466-NOIR-32GB', 18, '2025-05-22 16:54:54.000000', 'COLOR_AND_SIZE', '1ebad9ee-f8af-4ac0-850f-1d2f9cb2f71e'),
('8f171e35-9360-4787-87cc-3ca1eb55f14d', 'Or', '2025-05-20 13:29:21.000000', 0.00, '128GB', 'SMA-ED97D4C2-4FB-OR-128GB', 18, '2025-05-20 13:29:21.000000', 'COLOR_AND_SIZE', '493d2ceb-6c55-424f-a5ba-f90520e248e8'),
('90f8e8a6-6378-4923-9c6f-524e4f36b571', 'Noir', '2025-05-22 16:53:51.000000', 0.00, '256GB', 'SAM-53C41C00-01D-NOIR-256GB', 20, '2025-05-22 16:53:51.000000', 'COLOR_AND_SIZE', '6637e026-1c22-4f20-b2c4-4326711b59ec'),
('91899530-c46a-4c93-b937-6f45dcd96218', 'Noir', '2025-05-22 16:54:54.000000', 0.00, '128GB', 'SAM-055F51BC-466-NOIR-128GB', 18, '2025-05-22 16:54:54.000000', 'COLOR_AND_SIZE', '1ebad9ee-f8af-4ac0-850f-1d2f9cb2f71e'),
('a1eb60cd-d7f0-42e1-8377-b1bbdf5920e8', 'Rouge', '2025-05-17 09:45:43.000000', 0.00, NULL, 'SAG-D8B2FD65-943-ROUGE', 18, '2025-05-17 09:45:43.000000', 'COLOR', 'cc3456db-2625-41e0-a035-99c81624ed8a'),
('a4b11850-6cc3-4b4f-a95f-208aef2e1328', 'Noir', '2025-05-20 13:29:21.000000', 12.00, '64GB', 'SMA-ED97D4C2-4FB-NOIR-64GB', 15, '2025-05-20 13:29:21.000000', 'COLOR_AND_SIZE', '493d2ceb-6c55-424f-a5ba-f90520e248e8'),
('adf9571d-2bb0-4ea5-9eb1-4c99d6f73e8c', 'gris', '2025-05-18 02:03:21.000000', 2.00, NULL, 'SAG-2036B5A3-A8C-GRIS', 10, '2025-05-18 02:03:21.000000', 'COLOR', '3b13056b-38b9-493c-8e4f-35f9909d8e6b'),
('af23bdca-3b1f-4ca2-9fe4-002f8f2da382', 'bleu-marine', '2025-05-18 14:21:04.000000', 0.00, NULL, 'SAG-EDA2A56E-61C-BLEU-MARINE', 20, '2025-05-18 14:21:04.000000', 'COLOR', 'eb2a7312-a02d-4d91-9ae9-47fd3bb062fa'),
('b537c194-f125-4904-a0d8-6cf8c640bd7e', 'Rouge', '2025-05-22 16:54:54.000000', 14.00, '256', 'SAM-055F51BC-466-ROUGE-256', 12, '2025-05-22 16:54:54.000000', 'COLOR_AND_SIZE', '1ebad9ee-f8af-4ac0-850f-1d2f9cb2f71e'),
('b6dc2906-f0d1-4f4a-bf24-f2caff6cc5fa', 'Noir', '2025-05-22 16:53:51.000000', 0.00, '128GB', 'SAM-53C41C00-01D-NOIR-128GB', 18, '2025-05-22 16:53:51.000000', 'COLOR_AND_SIZE', '6637e026-1c22-4f20-b2c4-4326711b59ec'),
('b7e1ef32-8399-45bb-9a28-6b8a9d56cdc4', 'Rouge', '2025-05-22 16:53:51.000000', 12.00, '64GB', 'SAM-53C41C00-01D-ROUGE-64GB', 15, '2025-05-22 16:53:51.000000', 'COLOR_AND_SIZE', '6637e026-1c22-4f20-b2c4-4326711b59ec'),
('c011f308-5e06-4543-9bc1-b9dd68485fcc', 'gris', '2025-05-17 14:57:40.000000', 2.00, NULL, 'SAG-F6E1038B-C01-GRIS', 10, '2025-05-17 14:57:40.000000', 'COLOR', '7c1c744f-18cb-4bd1-bf11-ee66a7dc99f3'),
('c1c5b142-c3df-4afb-a619-b4b015935bee', 'gris', '2025-05-18 01:30:33.000000', 0.00, NULL, 'SAG-FB086D76-BD5-GRIS', 20, '2025-05-18 01:30:33.000000', 'COLOR', '98b24275-4fdd-4ecf-8780-45bb443a57fe'),
('c524afcf-df3a-4348-91a1-5a384db7d115', 'noir', '2025-05-17 14:57:40.000000', 14.00, NULL, 'SAG-F6E1038B-C01-NOIR', 12, '2025-05-17 14:57:40.000000', 'COLOR', '7c1c744f-18cb-4bd1-bf11-ee66a7dc99f3'),
('c7e7807d-749d-4ec8-9766-4d918dc71d0f', 'gris', '2025-05-17 14:57:40.000000', 0.00, NULL, 'SAG-F6E1038B-C01-GRIS', 18, '2025-05-17 14:57:40.000000', 'COLOR', '7c1c744f-18cb-4bd1-bf11-ee66a7dc99f3'),
('d0969d9d-d90c-4fd5-a67b-fc9ead413174', 'Noir', '2025-05-22 16:53:51.000000', 0.00, '64GB', 'SAM-53C41C00-01D-NOIR-64GB', 20, '2025-05-22 16:53:51.000000', 'COLOR_AND_SIZE', '6637e026-1c22-4f20-b2c4-4326711b59ec'),
('d849779b-8c54-4893-84cb-34396d2f125f', 'Noir', '2025-05-22 16:54:54.000000', 0.00, '64GB', 'SAM-055F51BC-466-NOIR-64GB', 20, '2025-05-22 16:54:54.000000', 'COLOR_AND_SIZE', '1ebad9ee-f8af-4ac0-850f-1d2f9cb2f71e'),
('d8dd11f5-2921-47fe-82c7-04cd7e905c4c', 'marron', '2025-05-18 14:21:04.000000', 14.00, NULL, 'SAG-EDA2A56E-61C-MARRON', 12, '2025-05-18 14:21:04.000000', 'COLOR', 'eb2a7312-a02d-4d91-9ae9-47fd3bb062fa'),
('dfa52927-14f3-4fad-9500-63bd5ebddfc0', 'noir', '2025-05-18 02:03:21.000000', 12.00, NULL, 'SAG-2036B5A3-A8C-NOIR', 15, '2025-05-18 02:03:21.000000', 'COLOR', '3b13056b-38b9-493c-8e4f-35f9909d8e6b'),
('ed18202c-1404-44fd-9d4c-42486e1362b8', 'marron', '2025-05-18 08:23:25.000000', 22.50, NULL, 'SAG-34D5226D-889-MARRON', 8, '2025-05-18 08:23:25.000000', 'COLOR', '424593ce-c809-47b1-aad8-abc43261f55d'),
('edd0e7e0-1ff4-4d9b-b89e-11a0ac4cb1eb', 'noir', '2025-05-17 14:57:40.000000', 22.50, NULL, 'SAG-F6E1038B-C01-NOIR', 8, '2025-05-17 14:57:40.000000', 'COLOR', '7c1c744f-18cb-4bd1-bf11-ee66a7dc99f3'),
('f2142ff1-d432-42e3-b923-baf81ef3f277', 'bleu-marine', '2025-05-18 14:21:04.000000', 0.00, NULL, 'SAG-EDA2A56E-61C-BLEU-MARINE', 18, '2025-05-18 14:21:04.000000', 'COLOR', 'eb2a7312-a02d-4d91-9ae9-47fd3bb062fa'),
('f70fb55d-6419-4060-a47d-0253e290e59a', 'marron', '2025-05-18 08:23:25.000000', 12.00, NULL, 'SAG-34D5226D-889-MARRON', 15, '2025-05-18 08:23:25.000000', 'COLOR', '424593ce-c809-47b1-aad8-abc43261f55d'),
('f88b4a49-d154-4987-bef2-e288fba4b397', 'noir', '2025-05-18 08:23:25.000000', 0.00, NULL, 'SAG-34D5226D-889-NOIR', 20, '2025-05-18 08:23:25.000000', 'COLOR', '424593ce-c809-47b1-aad8-abc43261f55d'),
('fa8be379-20d8-4241-9602-74738e8640a4', 'marron', '2025-05-18 14:18:49.000000', 22.50, NULL, 'SAG-D8C72C99-C31-MARRON', 8, '2025-05-18 14:18:49.000000', 'COLOR', '02377682-f092-49e8-90d1-c88051e8225e'),
('fa9a8033-a403-4281-8556-236321b5bf87', 'noir', '2025-05-18 01:30:33.000000', 22.50, NULL, 'SAG-FB086D76-BD5-NOIR', 8, '2025-05-18 01:30:33.000000', 'COLOR', '98b24275-4fdd-4ecf-8780-45bb443a57fe');

-- --------------------------------------------------------

--
-- Structure de la table `rating`
--

CREATE TABLE `rating` (
  `id` bigint(20) NOT NULL,
  `rating` double DEFAULT NULL,
  `product_id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `review` varchar(255) DEFAULT NULL,
  `product_id` char(36) DEFAULT NULL,
  `user_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE `role` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'ROLE_ADMIN'),
(2, 'ROLE_USER');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` char(36) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `provider` enum('google','local') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `created_at`, `email`, `first_name`, `last_name`, `mobile`, `password`, `provider`) VALUES
('4cc9f727-0e66-4d66-8616-1345f16d65a3', '2025-05-18 14:07:15.000000', 'moukitadam20@gmail.com', 'Moukit', 'Adam', NULL, '$2a$10$wRkJ4372ILYMIDMyIEXXI.AUaoUfy0dfmIZ85bOcvuBKBDAT7obQS', 'google'),
('847b7e9f-8045-4f9a-9fdf-4cd862b5627a', '2025-05-17 05:22:43.000000', 'moukitadam@gmail.com', 'Moukit', 'Adam', NULL, '$2a$10$DBPX89ct/R15BL5Jtukn9umrYgy39Zp0.IRS2fWpP8WbNXB/ZpCcG', 'google'),
('a51b0acd-6b06-47fe-86dd-3e4532ace47a', '2025-05-19 02:28:31.000000', 'abdoumoukitadam@gmail.com', 'ABDOU-MOUKIT', 'ADAM', NULL, '$2a$10$redDhGzZFI69eDoX7qNYReElYmFWJoRVo9FX3Q3JLID1IdbtweT6W', 'google'),
('cd8f5057-d20a-4f65-8377-017cfea017b5', '2025-05-17 05:20:22.000000', 'moukitadam228@gmail.com', 'Moukit', 'ADAM', NULL, '$2a$10$ViZFpw8ALHHGBYHZ1Qn7..qRURfk7wX/VhY0Lfzgecih93zK2VuAm', 'local');

-- --------------------------------------------------------

--
-- Structure de la table `user_order`
--

CREATE TABLE `user_order` (
  `id` char(36) NOT NULL,
  `create_at` datetime(6) DEFAULT NULL,
  `delivery_date` datetime(6) DEFAULT NULL,
  `discounte` int(11) DEFAULT NULL,
  `order_date` datetime(6) DEFAULT NULL,
  `order_status` varchar(255) DEFAULT NULL,
  `payment_id` varchar(255) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `stripe_payment_intent_id` varchar(255) DEFAULT NULL,
  `total_discounted_price` int(11) DEFAULT NULL,
  `total_item` int(11) NOT NULL,
  `total_price` double DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `shipping_address_id` char(36) DEFAULT NULL,
  `user_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` char(36) NOT NULL,
  `role_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `user_roles`
--

INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES
('cd8f5057-d20a-4f65-8377-017cfea017b5', 1),
('847b7e9f-8045-4f9a-9fdf-4cd862b5627a', 2),
('4cc9f727-0e66-4d66-8616-1345f16d65a3', 2),
('a51b0acd-6b06-47fe-86dd-3e4532ace47a', 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKda8tuywtf0gb6sedwk7la1pgi` (`user_id`);

--
-- Index pour la table `attribute_metadata`
--
ALTER TABLE `attribute_metadata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKe45jxe6ab6j1k5fgc8fwag4h7` (`category_id`),
  ADD KEY `FKk1ui7cfvjc0351x2rbth7c23t` (`product_type_id`);

--
-- Index pour la table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK64t7ox312pqal3p7fg9o503c2` (`user_id`);

--
-- Index pour la table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKpcttvuq4mxppo8sxggjtn5i2c` (`cart_id`),
  ADD KEY `FKl7je3auqyq1raj52qmwrgih8x` (`product_id`),
  ADD KEY `FK5yyw1o0dor9gmxfra1dqvn4qa` (`variant_id`);

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK46ccwnsi9409t36lurvtyljak` (`name`),
  ADD KEY `FK2y94svpmqttx80mshyny85wqr` (`parent_id`),
  ADD KEY `idx_category_fullpath` (`full_path`(300));

--
-- Index pour la table `flyway_schema_history`
--
ALTER TABLE `flyway_schema_history`
  ADD PRIMARY KEY (`installed_rank`),
  ADD KEY `flyway_schema_history_s_idx` (`success`);

--
-- Index pour la table `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK7n8y8pth0uurnv55mfrtc8q89` (`order_id`),
  ADD KEY `FK551losx9j75ss5d6bfsqvijna` (`product_id`);

--
-- Index pour la table `payement_information`
--
ALTER TABLE `payement_information`
  ADD KEY `FK5pntvldsey283e0yypcw2suec` (`user_id`);

--
-- Index pour la table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UKq1mafxn973ldq80m1irp3mpvq` (`sku`),
  ADD UNIQUE KEY `UKi7d79mxdffa3t5xnn24r3eygm` (`upc`),
  ADD KEY `idx_product_name` (`name`),
  ADD KEY `idx_product_price` (`price`),
  ADD KEY `FK1mtsbur82frn64de7balymq9s` (`category_id`),
  ADD KEY `FKlabq3c2e90ybbxk58rc48byqo` (`product_type_id`);

--
-- Index pour la table `product_media`
--
ALTER TABLE `product_media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKish5xtvhdauc3njtkj6j5eyjp` (`product_id`),
  ADD KEY `FK9etojcf4ulg26bh79uhsr8mio` (`variant_id`);

--
-- Index pour la table `product_type`
--
ALTER TABLE `product_type`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `product_type_hierarchy`
--
ALTER TABLE `product_type_hierarchy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_pth_product_type` (`product_type_id`),
  ADD KEY `idx_pth_category` (`category_id`);

--
-- Index pour la table `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_product_color_size` (`product_id`,`color`,`size`);

--
-- Index pour la table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKlkuwie0au2dru36asng9nywmh` (`product_id`),
  ADD KEY `FKpn05vbx6usw0c65tcyuce4dw5` (`user_id`);

--
-- Index pour la table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK9yqmlf28ges8c30nj4v4hva7t` (`product_id`),
  ADD KEY `FKsdlcf7wf8l1k0m00gik0m6b1m` (`user_id`);

--
-- Index pour la table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK8sewwnpamngi6b1dwaa88askk` (`name`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user_order`
--
ALTER TABLE `user_order`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UKh1ig819hfwwuknhn8qxutho3i` (`shipping_address_id`),
  ADD KEY `FKj86u1x7csa8yd68ql2y1ibrou` (`user_id`);

--
-- Index pour la table `user_roles`
--
ALTER TABLE `user_roles`
  ADD KEY `FKrhfovtciq1l558cw6udg0h0d3` (`role_id`),
  ADD KEY `FK55itppkw3i07do3h7qoclqd4k` (`user_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT pour la table `product_media`
--
ALTER TABLE `product_media`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=267;

--
-- AUTO_INCREMENT pour la table `rating`
--
ALTER TABLE `rating`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `role`
--
ALTER TABLE `role`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `FKda8tuywtf0gb6sedwk7la1pgi` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `attribute_metadata`
--
ALTER TABLE `attribute_metadata`
  ADD CONSTRAINT `FKe45jxe6ab6j1k5fgc8fwag4h7` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `FKk1ui7cfvjc0351x2rbth7c23t` FOREIGN KEY (`product_type_id`) REFERENCES `product_type` (`id`);

--
-- Contraintes pour la table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `FKpay9408fi1tlnkqv3fhetr6hy` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `FK5yyw1o0dor9gmxfra1dqvn4qa` FOREIGN KEY (`variant_id`) REFERENCES `product_variants` (`id`),
  ADD CONSTRAINT `FKl7je3auqyq1raj52qmwrgih8x` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FKpcttvuq4mxppo8sxggjtn5i2c` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`);

--
-- Contraintes pour la table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `FK2y94svpmqttx80mshyny85wqr` FOREIGN KEY (`parent_id`) REFERENCES `category` (`id`);

--
-- Contraintes pour la table `order_item`
--
ALTER TABLE `order_item`
  ADD CONSTRAINT `FK551losx9j75ss5d6bfsqvijna` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FK7n8y8pth0uurnv55mfrtc8q89` FOREIGN KEY (`order_id`) REFERENCES `user_order` (`id`);

--
-- Contraintes pour la table `payement_information`
--
ALTER TABLE `payement_information`
  ADD CONSTRAINT `FK5pntvldsey283e0yypcw2suec` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK1mtsbur82frn64de7balymq9s` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `FKlabq3c2e90ybbxk58rc48byqo` FOREIGN KEY (`product_type_id`) REFERENCES `product_type` (`id`);

--
-- Contraintes pour la table `product_media`
--
ALTER TABLE `product_media`
  ADD CONSTRAINT `FK9etojcf4ulg26bh79uhsr8mio` FOREIGN KEY (`variant_id`) REFERENCES `product_variants` (`id`),
  ADD CONSTRAINT `FKish5xtvhdauc3njtkj6j5eyjp` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Contraintes pour la table `product_type_hierarchy`
--
ALTER TABLE `product_type_hierarchy`
  ADD CONSTRAINT `fk_pth_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `fk_pth_product_type` FOREIGN KEY (`product_type_id`) REFERENCES `product_type` (`id`);

--
-- Contraintes pour la table `product_variants`
--
ALTER TABLE `product_variants`
  ADD CONSTRAINT `FKjxq4wg24xktvlslcdyyc4nr7r` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Contraintes pour la table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `FKlkuwie0au2dru36asng9nywmh` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FKpn05vbx6usw0c65tcyuce4dw5` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `FK9yqmlf28ges8c30nj4v4hva7t` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FKsdlcf7wf8l1k0m00gik0m6b1m` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `user_order`
--
ALTER TABLE `user_order`
  ADD CONSTRAINT `FK9ons2gy90nxt6ply2xgxcmyte` FOREIGN KEY (`shipping_address_id`) REFERENCES `address` (`id`),
  ADD CONSTRAINT `FKj86u1x7csa8yd68ql2y1ibrou` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `FK55itppkw3i07do3h7qoclqd4k` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKrhfovtciq1l558cw6udg0h0d3` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
