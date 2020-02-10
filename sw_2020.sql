-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 04, 2020 at 03:39 PM
-- Server version: 5.7.28-0ubuntu0.18.04.4
-- PHP Version: 7.2.24-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sw_2020`
--

-- --------------------------------------------------------

--
-- Table structure for table `candidates`
--

CREATE TABLE `candidates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `candidate_id` int(11) NOT NULL,
  `category` enum('vocal','serious','foolish','dancer','shy','marry','silliest','talkactive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `votes` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `gossip_id` int(11) NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dares`
--

CREATE TABLE `dares` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `by_user_id` int(11) NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `votes` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gossips`
--

CREATE TABLE `gossips` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `likes` json NOT NULL,
  `dislikes` json NOT NULL,
  `score` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gossip_chats`
--

CREATE TABLE `gossip_chats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `gossip_id` int(11) NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `group_chats`
--

CREATE TABLE `group_chats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `message` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `known_user_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_received` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2019_12_03_183231_create_messages_table', 1),
(10, '2019_12_03_183303_create_dares_table', 1),
(11, '2019_12_03_183325_create_votes_table', 1),
(12, '2019_12_03_183741_create_gossips_table', 1),
(13, '2019_12_03_185555_create_comments_table', 1),
(14, '2019_12_08_151101_create_group_chats_table', 1),
(15, '2019_12_08_151145_create_gossip_chats_table', 1),
(16, '2019_12_11_215152_create_candidates_table', 1),
(17, '2020_01_01_193439_create_vote_logs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, '2020 ITCA Dakar Trip Personal Access Client', '9f5OvuZQB8nzcvAXdL5JGaYFB8Q4P7Dy8aLS4iSi', 'http://localhost', 1, 0, 0, '2020-01-04 15:31:52', '2020-01-04 15:31:52'),
(2, NULL, '2020 ITCA Dakar Trip Password Grant Client', 'sjXBpYtW4J303hx8OgneWKHvpaymwQ0LSWb52C6W', 'http://localhost', 0, 1, 0, '2020-01-04 15:31:52', '2020-01-04 15:31:52');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-01-04 15:31:52', '2020-01-04 15:31:52');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'profiles/default.png',
  `user_id` int(11) DEFAULT NULL,
  `gender` enum('m','f') COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` enum('java','python','js','php') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `about` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email_verified_at`, `password`, `img`, `user_id`, `gender`, `group`, `is_admin`, `about`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'ISMILA CHAM', '100', NULL, '$2y$10$qwQwtyC7s0IvEVBYh63KD.V0nB372KGYRRy6jxs/qQ2/P3gMKmbJy', 'profiles/default.png', 16, 'm', 'js', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:58'),
(2, 'MUHHAMED TOURAY', '101', NULL, '$2y$10$p.k3d6YTHN7g1IGePKiexu1PlABm00B0duXhlnCxVD0tQlhz2Znva', 'profiles/default.png', 33, 'm', 'java', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:58'),
(3, 'DAWDA JOBE', '102', NULL, '$2y$10$v4/q6QB2MqZ3KtSw1VForu2d4tzu6QZwUenmBBlESExBW00F.VqiO', 'profiles/default.png', 34, 'm', 'php', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:58'),
(4, 'MUHHAMED W DRAMMEH', '103', NULL, '$2y$10$RPHEgOgU1/1cBhsSBWXVYupwVXqpNYxg9RVCkyRSwp1XgR2H4pL0G', 'profiles/default.png', 18, 'm', 'js', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:57'),
(5, 'AMDOU SAIDY', '104', NULL, '$2y$10$LWd2FQyKQq3rAALxA0j2/.Au2s5TcuWbo006cKg2zDnVMQQqUFzzy', 'profiles/default.png', 49, 'm', 'js', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:56'),
(6, 'KARAMO SAMATEH', '105', NULL, '$2y$10$NfT6w1oUFlbVzS6Iugjrve/05JalfjlNb7uulewu2VpMQKXnTGyb6', 'profiles/default.png', 51, 'm', 'python', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:54'),
(7, 'BUBACCAR MARONG', '106', NULL, '$2y$10$C9.sz7FFFtmCChT0JxOUKeWxLE7wrpqOQU77YZGjSJU6QMHcjtp9a', 'profiles/default.png', 62, 'm', 'php', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:55'),
(8, 'IBRAHIM SISHO', '107', NULL, '$2y$10$1Hxu6EisvY/x9r1LlBX84OFIfFMM8Z36VMpxaqsEvd5SgYAKlZnGW', 'profiles/default.png', 57, 'm', 'php', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:55'),
(9, 'ISMAILA SISSOHO', '108', NULL, '$2y$10$iM5qIIY75jTfCNHU6VoFgeJBrOR9lpLcOew32.e6DC9LujRAziNkW', 'profiles/default.png', 58, 'm', 'js', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:54'),
(10, 'ABDOU CEESAY', '109', NULL, '$2y$10$uCXMBuaWV/yz9.Db4yaryO1400y81WSMOzjRC9D4czvrMQQokkWI2', 'profiles/default.png', 47, 'm', 'java', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:54'),
(11, 'ISMAILA JALLOW', '110', NULL, '$2y$10$ol.6Y0uZd2MRuEfAXRq4FeLxJX5enDw8TEyy90cMENABULnZM0fCK', 'profiles/default.png', 1, 'm', 'python', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:56'),
(12, 'OUSAINOU JAITEH', '111', NULL, '$2y$10$WV9E6j.Q.zSNsZUcUGwsPeI9LwiHaIqNhO3HGoARHy43OXuJKng8i', 'profiles/default.png', 63, 'm', 'python', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:55'),
(13, 'SHERIFF SONKO', '112', NULL, '$2y$10$.QwpXW7WytryTCKXS5eQ0O83V5xE55uITvWpvEtAssIQMfwA0sFEm', 'profiles/default.png', 54, 'm', 'java', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:55'),
(14, 'EBRAHIM KEBBEH', '113', NULL, '$2y$10$6W0FvX9ito35XekaNbT9Ju/G2o0SoOKqM3MTSzeDJjFS3uu904IVe', 'profiles/default.png', 64, 'm', 'php', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:55'),
(15, 'OUSMAN CAMARA', '114', NULL, '$2y$10$4A6Ich2kg05h8KXksJRSDehLYtpN7X2cN3WGHHu9PDNzTReumAKu2', 'profiles/default.png', 59, 'm', 'java', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:56'),
(16, 'MODOU LAMIN BARROW', '115', NULL, '$2y$10$xJZwt76NkyGd9YGPzxZzWuAZYpUpnDB5p4KcEGm8Zaov4kqRrrlcW', 'profiles/default.png', 39, 'm', 'js', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:56'),
(17, 'MUSA NDOW', '116', NULL, '$2y$10$nAXGV4yJ.AOI/sdWZcmfQuHx0VziNi7qjsZ9gzAaMQQr0jNohfK5q', 'profiles/default.png', 43, 'm', 'js', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:56'),
(18, 'SASH SILLAH', '117', NULL, '$2y$10$DBoyRRe76mraD93bhCfFROgTUjnd2.x2e8EbvU5N10wXegoRxNLqm', 'profiles/default.png', 37, 'm', 'js', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:55'),
(19, 'KARAMBA CEESAY', '118', NULL, '$2y$10$0mv88LZpQONW5td6fwDhV.jG53/5WU9gd9GrfQ4bKFWcMt2tx5yTu', 'profiles/default.png', 46, 'm', 'python', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:56'),
(20, 'DODOU DEMBA', '119', NULL, '$2y$10$6rzV09EEQO7K6yA9KfuCE.Ur2AMo0FahOd09vGrJlPtuEiW0h5hMa', 'profiles/default.png', 38, 'm', 'java', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:55'),
(21, 'MODOU K.TOURAY', '120', NULL, '$2y$10$Z78/MT0o2Dkr/0Z.kc5F3Od0iFecpV75D9ussnshs72cWcILKKnue', 'profiles/default.png', 55, 'm', 'php', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:56'),
(22, 'MUHAMMED DANSO', '121', NULL, '$2y$10$6ZiarEoJwOcItRmA5zuC/OlDS1w40D1Q7VJGVVUhdW0d1otm2pKYK', 'profiles/default.png', 44, 'm', 'python', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:55'),
(23, 'MONEEB UL-HASSAN HARIS', '122', NULL, '$2y$10$wPiHjZYhauAKrWW9rYRKueVGIDp/2MuVli9xUXUPitj75q7Oq0zGK', 'profiles/default.png', 53, 'm', 'python', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:56'),
(24, 'ALIEU JALLOW', '123', NULL, '$2y$10$.GUgc4u4Fmd9w0H9vSyhFeyIMKTHHSwErL1w6n4BCqbkvzgrjn3Di', 'profiles/default.png', 50, 'm', 'php', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:56'),
(25, 'MAHMOUD JALLOW', '124', NULL, '$2y$10$5EBXWoAoW4oTiDhV7lo3i.LH/v8hDnoo/0W5/TnX4NwDyo8fsqHTG', 'profiles/default.png', 56, 'm', 'python', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:55'),
(26, 'MUHAMMED S BALDEH', '125', NULL, '$2y$10$IIwVYwVHBbZe1XVDGATEOOmAvdiOkvypxTKUybZMwCgzKJJv7hUuu', 'profiles/default.png', 3, 'm', 'js', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:56'),
(27, 'JAMBA CEESAY', '126', NULL, '$2y$10$ayVsNjuJLZLYCN5YU/G96.h1mAyzTDFEEm0bmTZOX/TR3c8Uz/lVm', 'profiles/default.png', 48, 'm', 'java', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:56'),
(28, 'EBRIMA S. JALLOW', '127', NULL, '$2y$10$i32qTJxpEStRXefbgTWe6.836MChef2E5.TAGSxOydedtwkV.wEkm', 'profiles/default.png', 40, 'm', 'js', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:55'),
(29, 'ESSA JANNEH', '128', NULL, '$2y$10$405s/SZzhjRXD.PLsh50yOb3aBCUAe8ut8lY4UV03WKYQa.MTvqKW', 'profiles/default.png', 52, 'm', 'java', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:55'),
(30, 'YUSUPHA WAGGEH', '129', NULL, '$2y$10$BGkoQbuUGwX7igl6uPA3iedu1iTbKMmJh1Lb7RfUHy89uRbeD8cwm', 'profiles/default.png', 2, 'm', 'php', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:56'),
(31, 'OMAR JOBARTEH', '130', NULL, '$2y$10$DPqyCDehoOo8APbIbAca7OqAGGg5PtwVj35P.eGk/N1M3aPqXYBRK', 'profiles/default.png', 41, 'm', 'java', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:55'),
(32, 'EBRIMA KHAN', '131', NULL, '$2y$10$s94qUzmuNXpqTsqI86Q8vukbCuyNu.V3mVMvCVoWINxxj0QuT9ybW', 'profiles/default.png', 61, 'm', 'js', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:55'),
(33, 'PA NJAGA JAW', '132', NULL, '$2y$10$ljLgNC51102x4n9.N6ohoO9z0M0cPg5621Hwk6qisuZv9myIzeHkG', 'profiles/default.png', 60, 'm', 'java', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:56'),
(34, 'ABDUL WAHAB JABANG', '133', NULL, '$2y$10$tZSSogOTIJOi454d6jF3ouuWUHsgo0O1l7C9XfLZ3w7ylcOXeCH9W', 'profiles/default.png', 45, 'm', 'php', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:56'),
(35, 'ALAGIE M.A JALLOW', '134', NULL, '$2y$10$IwfcKQ0SHwMuyNQ8q0HB5u86mHX/jENy11orGzx5ejC2/b8snANpG', 'profiles/default.png', 42, 'm', 'php', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:55'),
(36, 'MALICK LANLOKUM', '135', NULL, '$2y$10$Mitzjz5JgvkMq2BPzK2jbu4iUPzoFPZwk.cY2P.TtZQ5pCAp8st3a', 'profiles/default.png', 4, 'm', 'python', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:55'),
(37, 'AISHA A. JALLOW', '136', NULL, '$2y$10$kSZuOp05o4N9tjAArYnwweapmbVS6Lz1hys1jdBjCps01Naygqd1i', 'profiles/default.png', 8, 'f', 'php', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:57'),
(38, 'AJI DADO MAKALO', '137', NULL, '$2y$10$7JsF00wzZq9ug7t7mlkoVe1kmqCC0emAdXIJJ.EpbAjz4NJwQavsu', 'profiles/default.png', 12, 'f', 'python', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:57'),
(39, 'FATOU JAITEH', '138', NULL, '$2y$10$Mx4EhAS9FKEg6L0yl9MU8equTS2BZ7Axwd7XLzQXgqGN/VsFgHBxC', 'profiles/default.png', 30, 'f', 'php', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:58'),
(40, 'SIRRA KEBBEH', '139', NULL, '$2y$10$Cg5bPdw/1uLl0LMMwP69M.mgYhmLUN2mj0i9xURIiZUSi0f57WkAe', 'profiles/default.png', 7, 'f', 'php', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:57'),
(41, 'YA FATOU NJIE', '140', NULL, '$2y$10$F8uUdTbZRvvYW6TjOnw.9.d/NNu9wmr8TcUygAY51sK5TqiXf2W3W', 'profiles/default.png', 25, 'f', 'python', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:57'),
(42, 'AMIE GOMEZ', '141', NULL, '$2y$10$1FO.dvzMIHdGlD5OyiYGweEwClNqJfRDbinOpEc7matqeitRTTcRC', 'profiles/default.png', 20, 'f', 'java', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:57'),
(43, 'FATIMA JABBIE', '142', NULL, '$2y$10$jX.zbVbXyBRqJOEOo7IlxO3QNe7KwpDIzaDp0.k9RCygSSVD7afLW', 'profiles/default.png', 35, 'f', 'php', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:58'),
(44, 'AMIE BADJIE', '143', NULL, '$2y$10$NoFUJ9ArNaGWfRFyMwkiVOZr0IwqenmKFs9jP51XIcoZ/9B7tA2aC', 'profiles/default.png', 28, 'f', 'js', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:57'),
(45, 'BINTOU CHAM', '144', NULL, '$2y$10$gN/B467M.AnssYg6M4ggIuMoi4gsx6Y0FP1CFH5pXtYb4YSCnXdGO', 'profiles/default.png', 13, 'f', 'java', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:58'),
(46, 'ISATOU JASSEH', '145', NULL, '$2y$10$u67b3NIdig8XtBD5BFac7eueMNFQNEqOVAscA2TkAze.JKMXrMqVe', 'profiles/default.png', 17, 'f', 'js', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:58'),
(47, 'MARIAMA CHAM', '146', NULL, '$2y$10$L8fRob9MsD97B/2qHfNuW.fSjXWdnSHeg2r1Xfegy.QZiqJBwCRKG', 'profiles/default.png', 11, 'f', 'python', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:59'),
(48, 'LALIA BANGURA', '147', NULL, '$2y$10$s8LkNE2T4/XgYeWfZReVVOIL6nCIDpcmR54cGWg4/7tpNpGBItjSu', 'profiles/default.png', 23, 'f', 'python', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:58'),
(49, 'ISATOU BALDEH', '148', NULL, '$2y$10$O4I25fNPYHJHWu66GDzxceyyKHXN8W2NoZPcy6qHpA.TPLg.EwKwW', 'profiles/default.png', 24, 'f', 'php', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:58'),
(50, 'ANNA S. NDURE', '149', NULL, '$2y$10$7yrLoM04R/4DbG0eirOnSubfTS2NK3Ls7RXpXbR8EnsVsV6veT15i', 'profiles/default.png', 15, 'f', 'java', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:58'),
(51, 'RUKI SILLAH', '150', NULL, '$2y$10$v4ZSj0/JrKArPGHqI7R6veoV51QK/3qWUf/1/5eNjejiTnfjUqYCO', 'profiles/default.png', 5, 'f', 'js', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:59'),
(52, 'HAJARA KANDEH', '151', NULL, '$2y$10$xUhW.0lmHRbN4ajyFrzJA.XY5RwHj5DQJ2O0ukH8MCsgzCZSbAyAG', 'profiles/default.png', 6, 'f', 'python', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:57'),
(53, 'FATOUMATTA SANNEH', '152', NULL, '$2y$10$Z1MmhHnqZvDpM/4YApJ8rucHQtZs2Ey57yk2a1CPZzDrBNfq4vQKa', 'profiles/default.png', 26, 'f', 'js', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:58'),
(54, 'MARIAMA DARBOE', '153', NULL, '$2y$10$Q.PJ6Yx2ZSr9I.CeNkAUSO.xFNXgjLbJ4KQicm4WuRWX8Qxztrfae', 'profiles/default.png', 36, 'f', 'python', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:57'),
(55, 'FAMA SALLAH', '154', NULL, '$2y$10$XQIWC8A24g2miDEDA4LySOapguY3rU1kYuEoQjVQIIz9CO0jrpZwa', 'profiles/default.png', 27, 'f', 'java', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:58'),
(56, 'BINTA BAYO', '155', NULL, '$2y$10$iBUubHvtZRaUCXskpSBCfubMBWa97HljWIbtGCrr8CE/XvPw0zzvq', 'profiles/default.png', 9, 'f', 'js', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:57'),
(57, 'RAMA M.A CHAM', '156', NULL, '$2y$10$t3PWn8C8v4uMa.oFn5Keqec49SE6aqwupLmtb9M5.TigUjRGKILLG', 'profiles/default.png', 29, 'f', 'java', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:57'),
(58, 'FATOU JARRA MANNEH', '157', NULL, '$2y$10$p4YftupT27SavKKuppK2p.Zu/iun2psL4.nM17LANNgJKQZQjsv1i', 'profiles/default.png', 21, 'f', 'php', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:59'),
(59, 'MAM BINTA NJIE', '158', NULL, '$2y$10$arlGsUa5OnSRTUsU1ZnP..7/rS65KsysUznrn3YhpM9dOkYmqKU7a', 'profiles/default.png', 19, 'f', 'python', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:58'),
(60, 'AMINATA CHAM', '159', NULL, '$2y$10$DqEukoKX3jw4lV2xhGiGMuJdEB3EA3tuXQLqeDqcjdAy.tMP88e12', 'profiles/default.png', 22, 'f', 'python', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:58'),
(61, 'ROHEY JOHN', '160', NULL, '$2y$10$c3jOeTDJzLjIvJhomPJgm.rltaW.NByytRyETkyoQ.a2pg5dP4K5e', 'profiles/default.png', 14, 'f', 'php', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:57'),
(62, 'SAINABOU JOBARTEH', '161', NULL, '$2y$10$OAtLG9A991wWbJX2v.z56.nQKEyHwbRV05u8P1MJH81UH5EQsdRW.', 'profiles/default.png', 31, 'f', 'java', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:57'),
(63, 'AJI FAMA', '162', NULL, '$2y$10$1gSIGxbRn1wLIFTzPGp7TegKrKqPcpIt2bgqyylMjtwYx342S85yi', 'profiles/default.png', 32, 'f', 'js', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:57'),
(64, 'ZAHRA VP-SU', '163', NULL, '$2y$10$nXZaE/u2z1GXYSDxBM.gTOXpWE0r9FVl/uBX8CHwHyKoIZyBTUqQ.', 'profiles/default.png', 10, 'f', 'java', 0, '', NULL, '2020-01-04 15:31:54', '2020-01-04 15:31:57');

-- --------------------------------------------------------

--
-- Table structure for table `votes`
--

CREATE TABLE `votes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  `candidate_id` int(11) NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vote_logs`
--

CREATE TABLE `vote_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `candidate_id` int(11) NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `candidates`
--
ALTER TABLE `candidates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dares`
--
ALTER TABLE `dares`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gossips`
--
ALTER TABLE `gossips`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gossip_chats`
--
ALTER TABLE `gossip_chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_chats`
--
ALTER TABLE `group_chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- Indexes for table `votes`
--
ALTER TABLE `votes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vote_logs`
--
ALTER TABLE `vote_logs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `candidates`
--
ALTER TABLE `candidates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dares`
--
ALTER TABLE `dares`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gossips`
--
ALTER TABLE `gossips`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gossip_chats`
--
ALTER TABLE `gossip_chats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `group_chats`
--
ALTER TABLE `group_chats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;
--
-- AUTO_INCREMENT for table `votes`
--
ALTER TABLE `votes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `vote_logs`
--
ALTER TABLE `vote_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
