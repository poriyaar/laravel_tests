-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 10, 2024 at 04:29 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_tests`
--

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2024_11_07_190215_create_tests_table', 1),
(7, '2024_11_07_190423_create_results_table', 1),
(8, '2024_11_07_204854_create_sessions_table', 1),
(9, '2024_11_08_103309_create_students_table', 2),
(10, '2024_11_08_103412_create_subjects_table', 2),
(12, '2024_11_08_154435_add_subject_id_to_tests_table', 3),
(13, '2024_11_08_154943_add_subject_id_to_results_table', 4),
(14, '2024_11_09_164258_add_subject_name_to_results_table', 5),
(17, '2024_11_09_185633_add_new_column_to_subjects_table', 6),
(18, '2024_11_09_195958_add_new_column_to_students_table', 6);

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE `results` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `subject_id` int NOT NULL,
  `subject_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `score` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
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
('YltJTkVCcKWfIm7fynQ2cjrng2AgX8uipCfx2Gl9', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiQW9ac3lxaG1MREhYbUQzMXdickN1cFl5ejgyQjRyaU9CRXRXWVBDbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zZW5kUmVtYWluaW5nVGltZS8yOS45ODMzMzMzMzMzMzMzMzQvc3ViamVjdElkLzIiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjM6InVybCI7YTowOnt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMCRjNG1RUGJXR2V1VWJSVGVwT1FPcVVlaVFMeG1xdGcyZS5CRXl4NzFqeU1QT0JFeTA1N0hQRyI7fQ==', 1731255716);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `remaining_time` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `user_id`, `name`, `subject_id`, `created_at`, `updated_at`, `remaining_time`) VALUES
(1, 1, 'poriya', 1, NULL, NULL, NULL),
(8, 1, 'poriya', 2, NULL, NULL, 30),
(9, 1, 'poriya', 3, NULL, NULL, 52);

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` bigint UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `exam_availability` tinyint(1) NOT NULL,
  `exam_start_date` date NOT NULL,
  `exam_deadline` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `duration` int NOT NULL DEFAULT '60'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `name`, `exam_availability`, `exam_start_date`, `exam_deadline`, `created_at`, `updated_at`, `duration`) VALUES
(1, 'math', 1, '2024-11-05', '2024-11-07 00:00:00', NULL, NULL, 60),
(2, 'Cocial Scinece', 1, '2024-11-10', '2024-11-17 00:00:00', NULL, NULL, 60),
(3, 'sport', 1, '2024-11-10', '2024-11-14 00:00:00', NULL, NULL, 60);

-- --------------------------------------------------------

--
-- Table structure for table `tests`
--

CREATE TABLE `tests` (
  `id` bigint UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` int NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer2` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer3` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer4` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `correct_answer` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tests`
--

INSERT INTO `tests` (`id`, `name`, `subject_id`, `question`, `answer1`, `answer2`, `answer3`, `answer4`, `correct_answer`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'math', 1, 'what is the square root of 36?', 'the square root of 36 is 5', 'the square root of 36 is 4', 'the square root of 36 is 6', 'the square root of 36 is 10', 3, '2024-11-07 22:18:24', '2024-11-07 22:18:24', NULL),
(2, 'social science', 2, 'what is resulte of the following operation 5x5', 'The resulte is 25', 'The resulte is 29', 'The resulte is 30', 'The resulte is 20', 1, '2024-11-07 22:18:25', '2024-11-07 22:18:25', NULL),
(3, 'math', 1, 'what is the square root of 36?', 'the square root of 36 is 5', 'the square root of 36 is 4', 'the square root of 36 is 6', 'the square root of 36 is 10', 3, '2024-11-07 22:18:24', '2024-11-07 22:18:24', NULL),
(4, 'math', 1, 'what is the square root of 36?', 'the square root of 36 is 5', 'the square root of 36 is 4', 'the square root of 36 is 6', 'the square root of 36 is 10', 3, '2024-11-07 22:18:24', '2024-11-07 22:18:24', NULL),
(5, 'math', 1, 'what is the square root of 36?', 'the square root of 36 is 5', 'the square root of 36 is 4', 'the square root of 36 is 6', 'the square root of 36 is 10', 3, '2024-11-07 22:18:24', '2024-11-07 22:18:24', NULL),
(6, 'math', 1, 'what is the square root of 36?', 'the square root of 36 is 5', 'the square root of 36 is 4', 'the square root of 36 is 6', 'the square root of 36 is 10', 3, '2024-11-07 22:18:24', '2024-11-07 22:18:24', NULL),
(7, 'math', 1, 'what is the square root of 36?', 'the square root of 36 is 5', 'the square root of 36 is 4', 'the square root of 36 is 6', 'the square root of 36 is 10', 3, '2024-11-07 22:18:24', '2024-11-07 22:18:24', NULL),
(8, 'math', 1, 'what is the square root of 36?', 'the square root of 36 is 5', 'the square root of 36 is 4', 'the square root of 36 is 6', 'the square root of 36 is 10', 3, '2024-11-07 22:18:24', '2024-11-07 22:18:24', NULL),
(9, 'math', 1, 'what is the square root of 36?', 'the square root of 36 is 5', 'the square root of 36 is 4', 'the square root of 36 is 6', 'the square root of 36 is 10', 3, '2024-11-07 22:18:24', '2024-11-07 22:18:24', NULL),
(10, 'math', 1, 'what is the square root of 36?', 'the square root of 36 is 5', 'the square root of 36 is 4', 'the square root of 36 is 6', 'the square root of 36 is 10', 3, '2024-11-07 22:18:24', '2024-11-07 22:18:24', NULL),
(11, 'math', 1, 'what is the square root of 36?', 'the square root of 36 is 5', 'the square root of 36 is 4', 'the square root of 36 is 6', 'the square root of 36 is 10', 3, '2024-11-07 22:18:24', '2024-11-07 22:18:24', NULL),
(12, 'math', 1, 'what is the square root of 36?', 'the square root of 36 is 5', 'the square root of 36 is 4', 'the square root of 36 is 6', 'the square root of 36 is 10', 3, '2024-11-07 22:18:24', '2024-11-07 22:18:24', NULL),
(13, 'math', 1, 'what is the square root of 36?', 'the square root of 36 is 5', 'the square root of 36 is 4', 'the square root of 36 is 6', 'the square root of 36 is 10', 3, '2024-11-07 22:18:24', '2024-11-07 22:18:24', NULL),
(14, 'math', 1, 'what is the square root of 36?', 'the square root of 36 is 5', 'the square root of 36 is 4', 'the square root of 36 is 6', 'the square root of 36 is 10', 3, '2024-11-07 22:18:24', '2024-11-07 22:18:24', NULL),
(15, 'math', 1, 'what is the square root of 36?', 'the square root of 36 is 5', 'the square root of 36 is 4', 'the square root of 36 is 6', 'the square root of 36 is 10', 3, '2024-11-07 22:18:24', '2024-11-07 22:18:24', NULL),
(16, 'social science', 2, 'what is resulte of the following operation 5x5', 'The resulte is 25', 'The resulte is 29', 'The resulte is 30', 'The resulte is 20', 1, '2024-11-07 22:18:25', '2024-11-07 22:18:25', NULL),
(17, 'social science', 2, 'what is resulte of the following operation 5x5', 'The resulte is 25', 'The resulte is 29', 'The resulte is 30', 'The resulte is 20', 1, '2024-11-07 22:18:25', '2024-11-07 22:18:25', NULL),
(18, 'social science', 2, 'what is resulte of the following operation 5x5', 'The resulte is 25', 'The resulte is 29', 'The resulte is 30', 'The resulte is 20', 1, '2024-11-07 22:18:25', '2024-11-07 22:18:25', NULL),
(19, 'social science', 2, 'what is resulte of the following operation 5x5', 'The resulte is 25', 'The resulte is 29', 'The resulte is 30', 'The resulte is 20', 1, '2024-11-07 22:18:25', '2024-11-07 22:18:25', NULL),
(20, 'social science', 2, 'what is resulte of the following operation 5x5', 'The resulte is 25', 'The resulte is 29', 'The resulte is 30', 'The resulte is 20', 1, '2024-11-07 22:18:25', '2024-11-07 22:18:25', NULL),
(21, 'social science', 2, 'what is resulte of the following operation 5x5', 'The resulte is 25', 'The resulte is 29', 'The resulte is 30', 'The resulte is 20', 1, '2024-11-07 22:18:25', '2024-11-07 22:18:25', NULL),
(22, 'social science', 2, 'what is resulte of the following operation 5x5', 'The resulte is 25', 'The resulte is 29', 'The resulte is 30', 'The resulte is 20', 1, '2024-11-07 22:18:25', '2024-11-07 22:18:25', NULL),
(23, 'social science', 2, 'what is resulte of the following operation 5x5', 'The resulte is 25', 'The resulte is 29', 'The resulte is 30', 'The resulte is 20', 1, '2024-11-07 22:18:25', '2024-11-07 22:18:25', NULL),
(24, 'social science', 2, 'what is resulte of the following operation 5x5', 'The resulte is 25', 'The resulte is 29', 'The resulte is 30', 'The resulte is 20', 1, '2024-11-07 22:18:25', '2024-11-07 22:18:25', NULL),
(25, 'social science', 2, 'what is resulte of the following operation 5x5', 'The resulte is 25', 'The resulte is 29', 'The resulte is 30', 'The resulte is 20', 1, '2024-11-07 22:18:25', '2024-11-07 22:18:25', NULL),
(26, 'social science', 2, 'what is resulte of the following operation 5x5', 'The resulte is 25', 'The resulte is 29', 'The resulte is 30', 'The resulte is 20', 1, '2024-11-07 22:18:25', '2024-11-07 22:18:25', NULL),
(27, 'social science', 2, 'what is resulte of the following operation 5x5', 'The resulte is 25', 'The resulte is 29', 'The resulte is 30', 'The resulte is 20', 1, '2024-11-07 22:18:25', '2024-11-07 22:18:25', NULL),
(28, 'social science', 2, 'what is resulte of the following operation 5x5', 'The resulte is 25', 'The resulte is 29', 'The resulte is 30', 'The resulte is 20', 1, '2024-11-07 22:18:25', '2024-11-07 22:18:25', NULL),
(29, 'social science', 2, 'what is resulte of the following operation 5x5', 'The resulte is 25', 'The resulte is 29', 'The resulte is 30', 'The resulte is 20', 1, '2024-11-07 22:18:25', '2024-11-07 22:18:25', NULL),
(30, 'social science', 2, 'what is resulte of the following operation 5x5', 'The resulte is 25', 'The resulte is 29', 'The resulte is 30', 'The resulte is 20', 1, '2024-11-07 22:18:25', '2024-11-07 22:18:25', NULL),
(31, 'social science', 2, 'what is resulte of the following operation 5x5', 'The resulte is 25', 'The resulte is 29', 'The resulte is 30', 'The resulte is 20', 1, '2024-11-07 22:18:25', '2024-11-07 22:18:25', NULL);

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
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'student',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `status`, `is_admin`, `created_at`, `updated_at`) VALUES
(1, 'poriya', 'poriya@gmail.com', NULL, '$2y$10$c4mQPbWGeuUbRTepOQOqUeiQLxmqtg2e.BEyx71jyMPOBEy057HPG', NULL, NULL, NULL, NULL, NULL, NULL, 'student', 0, '2024-11-07 18:09:15', '2024-11-07 18:09:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tests`
--
ALTER TABLE `tests`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `results`
--
ALTER TABLE `results`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tests`
--
ALTER TABLE `tests`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
