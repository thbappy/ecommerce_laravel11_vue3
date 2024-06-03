-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 03, 2024 at 03:57 PM
-- Server version: 8.0.36-0ubuntu0.20.04.1
-- PHP Version: 8.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_05_24_054400_create_personal_access_tokens_table', 1),
(5, '2024_06_02_150005_create_sellers_table', 1),
(6, '2024_06_02_150007_create_products_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'authToken', 'b8386cebc23c30205a85da5c7e931e8b9b98aa0686be664a3dd4f0153f5a0108', '[\"*\"]', '2024-06-03 09:30:34', NULL, '2024-06-03 09:18:31', '2024-06-03 09:30:34'),
(2, 'App\\Models\\User', 1, 'authToken', '82470280bd72b88048807c3da3f65b0a4b20896565e80f7fa875019ec60a5555', '[\"*\"]', '2024-06-03 09:36:42', NULL, '2024-06-03 09:36:25', '2024-06-03 09:36:42');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_order` int NOT NULL,
  `product_serial_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seller_location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `original_or_copy` enum('original','copy') COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_name`, `min_order`, `product_serial_number`, `price`, `seller_location`, `original_or_copy`, `product_image`, `created_at`, `updated_at`) VALUES
(1, 'Product 1', 1, 'SN001', '200', 'Dhaka', 'original', 'product_images/3R9dsHlNuBNX3BidgFgSc1rlwk2VYRZAV5ex147R.webp', '2024-06-03 09:18:13', '2024-06-03 09:29:13'),
(2, 'Product 2', 2, 'SN002', '130.00', 'Rajshahi', 'original', 'product_images/t0MnDuuEfXx6GbQf40DEoo0qthvOGRBPRoEvAf4d.jpg', '2024-06-03 09:18:13', '2024-06-03 09:27:35'),
(3, 'Product 3', 1, 'SN003', '1330.00', 'Mymensing', 'copy', 'product_images/EUTdJUgHrSJHOirnWcy6LzymReE5R6u2AZ6qWdIw.jpg', '2024-06-03 09:18:13', '2024-06-03 09:29:22'),
(4, 'Product 4', 2, 'SN004', '1000.00', 'Khulna', 'original', 'product_images/pzactI8vS1wGZKaW13lloC2Ya45GbP9sKB9W3nDH.jpg', '2024-06-03 09:18:13', '2024-06-03 09:28:16'),
(5, 'Product 5', 1, 'SN005', '1500.00', 'Comilla', 'copy', 'product_images/rXBW1hvv6kzjS3BZeDq62Cel0dVQ4sVOlkJp7q1s.webp', '2024-06-04 09:18:13', '2024-06-03 09:30:09'),
(6, 'Product 6', 1, 'SN006', '900.00', 'Bogura', 'original', 'product_images/DneQh2h6Es42lvkjcyWqBfOsqsqcfLp246j1vuES.jpg', '2024-06-03 04:18:13', '2024-06-03 09:27:53'),
(7, 'Product 7', 3, 'SN007', '300.00', 'Dhaka', 'copy', 'product_images/Pa2mgjMgviDyfvlQvxDrfgk5o3g3kqYrHVXxm6cU.webp', '2024-06-03 02:18:13', '2024-06-03 09:29:34'),
(8, 'Product 8', 4, 'SN008', '200.00', 'Sylhet', 'original', 'product_images/X935ZvKp4TAtJR07wCHuhx8OjJRvjI8gre1S7kZ1.jpg', '2024-06-03 09:09:13', '2024-06-03 09:28:59'),
(9, 'Product 9', 7, 'SN009', '800.00', 'Gazipur', 'copy', 'product_images/ucKv8Ey85namw02Ub8Yt25q9G3RZzhcBqhsfN9xD.webp', '2024-06-03 09:10:13', '2024-06-03 09:26:30'),
(10, 'Product 10', 1, 'SN0010', '350.00', 'Mirpur', 'original', 'product_images/0qnjAHjAHFksMSgmtCf2gxODsSlj57KMHvJIGGzA.jpg', '2024-06-03 09:26:13', '2024-06-03 09:28:41'),
(11, 'Product 11', 1, 'SN0011', '250.00', 'Dhanmondi', 'copy', 'product_images/A9lV9Hc6VHhFWBObwzymtQME7nK3yvq6gUUaVmxv.jpg', '2024-06-03 09:08:13', '2024-06-03 09:28:03'),
(12, 'Product 12', 3, 'SN0012', '170.00', 'Agarga', 'original', 'product_images/UXVgePnQoTZhfVWVdKBGBihoBpivz2PExKFbAnYm.webp', '2024-06-03 09:13:13', '2024-06-03 09:29:59'),
(13, 'Product 13', 1, 'SN0013', '450.00', 'Mohamadpur', 'copy', 'product_images/UtMBG5JLCGVhJYhtFbbaWnq7NcNRnWVY5sclvEs2.jpg', '2024-06-03 09:18:13', '2024-06-03 09:29:48'),
(14, 'Product 14', 2, 'SN0014', '980.00', 'Uttara', 'original', 'product_images/VWU5IDab4rrjcYjEJy0OID0itwWWUtg62d7dD7ER.jpg', '2024-06-03 09:18:13', '2024-06-03 09:28:50'),
(15, 'Product 15', 3, 'SN0015', '190.00', 'Bonani', 'copy', 'product_images/bDTbGHTxh0ezg09WLcyjZ2Cd8obPebkVJDkqDIJS.webp', '2024-06-03 09:13:13', '2024-06-03 09:30:19'),
(16, 'Product 16', 2, 'SN0016', '150', 'Gulshan', 'original', 'product_images/0CGvyr4smw9786em3zOLmnQ3ZVIwZhHudKA29PJM.jpg', '2024-06-03 09:14:13', '2024-06-03 09:27:24'),
(17, 'Product 17', 1, 'SN0017', '100.00', 'Mirpur Dohs', 'copy', 'product_images/M2hwtjRpSjxaP4FDIp767W6sDhHGgr16lI05RFGN.jpg', '2024-06-03 09:18:13', '2024-06-03 09:28:30'),
(18, 'Product 18', 4, 'SN0018', '300', 'Mohakali', 'original', 'product_images/jdwjee8nGe1YQjvYwdUd2RXgNiJ0QftZ7pn1wjw2.webp', '2024-06-03 09:18:13', '2024-06-03 09:26:57');

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

CREATE TABLE `sellers` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('IbxjWTcB3WSQKr19aa4bbZapHxeYXZL43EKUaGmq', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic2IwU0F2TGR4eVJMNnJIZ0I0TGhBa2lTUGtIWVJrWWxZRXM0NkpLQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9wcm9kdWN0cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1717430180);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin User', 'admin@gmail.com', '2024-06-03 09:18:13', '$2y$12$AXNdbnOlo7zbOycJnsxU6OcPsXM/apymoI0zk1EOQsX.1E7fC1YVW', 'admin', 'zuc7AeCfsz', '2024-06-03 09:18:13', '2024-06-03 09:18:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sellers_email_unique` (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `sellers`
--
ALTER TABLE `sellers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
