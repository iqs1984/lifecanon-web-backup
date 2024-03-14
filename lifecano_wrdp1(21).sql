-- phpMyAdmin SQL Dump
-- version 4.7.8
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 31, 2021 at 02:01 AM
-- Server version: 5.7.17-13
-- PHP Version: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lifecano_wrdp1`
--

-- --------------------------------------------------------

--
-- Table structure for table `add_clients`
--

CREATE TABLE `add_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) DEFAULT NULL,
  `client_name` varchar(255) NOT NULL,
  `client_email` varchar(255) DEFAULT NULL,
  `plan_name` varchar(255) NOT NULL,
  `plan_amount` double NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0 for pending , 1 for accept and 2 for archieved',
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `client_start_date` datetime DEFAULT NULL,
  `client_end_date` datetime DEFAULT NULL,
  `code` varchar(255) NOT NULL,
  `subscription_id_for_coach` longtext,
  `subscription_status_for_coach` int(11) DEFAULT NULL,
  `subscription_id_for_client` longtext,
  `subscription_status_for_client` int(11) DEFAULT NULL,
  `cycle` int(11) DEFAULT NULL COMMENT 'plan end cycle for client',
  `phone` varchar(255) DEFAULT NULL,
  `appointment_fee` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `add_clients`
--

INSERT INTO `add_clients` (`id`, `user_id`, `client_id`, `client_name`, `client_email`, `plan_name`, `plan_amount`, `status`, `start_date`, `end_date`, `client_start_date`, `client_end_date`, `code`, `subscription_id_for_coach`, `subscription_status_for_coach`, `subscription_id_for_client`, `subscription_status_for_client`, `cycle`, `phone`, `appointment_fee`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 73, 74, 'Ajeet Singh', 'ajeet.iquincesoft@gmail.com', 'Monthly', 150, 1, '2021-10-27 14:30:16', '2021-11-27 14:30:16', '2021-10-27 12:46:31', '2021-10-27 12:46:31', '139616', 'sub_1Jp7zYIFwORoVejtFWEIWexg', 1, NULL, NULL, 12, '986-532-5689', 115, '2021-10-27 19:44:47', '2021-10-27 21:30:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `day` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL,
  `schedule_by` varchar(255) NOT NULL DEFAULT 'client' COMMENT 'schedule by client or reschedule by coach',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '0 for failed and 1 for success',
  `repeat` int(11) NOT NULL DEFAULT '0' COMMENT '0 for one time and 1 for repeat',
  `end_date` datetime DEFAULT NULL COMMENT 'if repeat is 1 then fill end date',
  `subscription_id` longtext,
  `subscription_status` int(11) DEFAULT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `user_id`, `client_id`, `date`, `day`, `time`, `schedule_by`, `status`, `repeat`, `end_date`, `subscription_id`, `subscription_status`, `payment_id`, `created_at`, `updated_at`) VALUES
(2, 73, 74, '2021-11-15', 'Monday', '8:00 AM - 9:00 AM', 'client', 1, 1, '2021-12-13 00:00:00', 'sub_1JvI5tApyRfvyTEwtM067hCg', 1, 44, '2021-11-13 22:30:19', '2021-11-13 22:30:19'),
(3, 73, 74, '2021-11-19', 'Friday', '5:00 PM - 6:00 PM', 'client', 0, 0, NULL, NULL, NULL, 45, '2021-11-13 22:46:03', '2021-11-23 23:29:08'),
(4, 73, 74, '2021-11-16', 'Tuesday', '8:00 AM - 9:00 AM', 'client', 1, 1, '2021-12-15 00:00:00', 'sub_1Jvz7NApyRfvyTEwFJmY13oT', 1, 47, '2021-11-15 20:26:43', '2021-11-15 20:26:43'),
(5, 73, 74, '2021-11-18', 'Thursday', '9:00 AM - 10:00 AM', 'client', 1, 1, NULL, NULL, NULL, 48, '2021-11-15 23:47:37', '2021-11-15 23:47:37'),
(6, 73, 74, '2021-11-19', 'Friday', '12:00 PM - 1:00 PM', 'client', 1, 1, '2021-11-28 00:00:00', NULL, NULL, 49, '2021-11-15 23:53:32', '2021-11-15 23:53:32'),
(7, 73, 74, '2021-11-17', 'Wednesday', '2:00 PM - 3:00 PM', 'coach', 1, 1, '2021-12-15 00:00:00', NULL, NULL, 51, '2021-11-16 01:17:58', '2021-11-16 19:01:19'),
(8, 73, 74, '2021-11-16', 'Tuesday', '2:00 PM - 3:00 PM', 'client', 1, 1, '2021-11-24 00:00:00', NULL, NULL, 53, '2021-11-16 01:50:37', '2021-11-16 01:50:37'),
(9, 73, 74, '2021-11-18', 'Thursday', '2:00 PM - 3:00 PM', 'client', 0, 0, NULL, NULL, NULL, 56, '2021-11-17 07:16:48', '2021-11-23 23:29:08'),
(10, 73, 74, '2021-11-17', 'Wednesday', '9:00 AM - 10:00 AM', 'client', 1, 1, '2021-11-22 00:00:00', NULL, NULL, 57, '2021-11-17 07:17:01', '2021-11-17 07:17:01'),
(11, 73, 74, '2021-11-24', 'Wednesday', '3:00 PM - 4:00 PM', 'client', 0, 0, NULL, NULL, NULL, 59, '2021-11-23 23:50:51', '2021-11-25 18:49:44'),
(12, 73, 74, '2021-11-24', 'Wednesday', '9:00 AM - 10:00 AM', 'client', 1, 1, '2021-12-23 00:00:00', NULL, NULL, 60, '2021-11-24 01:49:29', '2021-11-24 01:49:29'),
(13, 73, 74, '2021-11-29', 'Monday', '9:00 AM - 10:00 AM', 'client', 0, 0, NULL, NULL, NULL, 61, '2021-11-24 02:04:43', '2021-12-06 19:19:53'),
(14, 73, 74, '2021-12-01', 'Wednesday', '9:00 AM - 10:00 AM', 'client', 0, 0, NULL, NULL, NULL, 62, '2021-11-25 18:50:14', '2021-12-06 19:19:53'),
(15, 73, 74, '2021-11-29', 'Monday', '2:00 PM - 3:00 PM', 'client', 0, 0, NULL, NULL, NULL, 63, '2021-11-25 18:53:18', '2021-12-06 19:19:53'),
(16, 73, 74, '2021-11-30', 'Tuesday', '11:00 AM - 12:00 PM', 'client', 0, 0, NULL, NULL, NULL, 64, '2021-11-25 18:55:01', '2021-12-06 19:19:53'),
(17, 73, 74, '2021-11-27', 'Saturday', '12:00 PM - 1:00 PM', 'client', 0, 0, NULL, NULL, NULL, 65, '2021-11-25 18:56:07', '2021-12-06 19:19:53'),
(18, 73, 74, '2021-11-25', 'Thursday', '6:00 PM - 7:00 PM', 'client', 0, 0, NULL, NULL, NULL, 66, '2021-11-25 18:57:25', '2021-12-06 19:19:53'),
(19, 73, 74, '2021-11-25', 'Thursday', '2:00 PM - 3:00 PM', 'client', 0, 0, NULL, NULL, NULL, 67, '2021-11-25 19:40:01', '2021-12-06 19:19:53'),
(20, 73, 74, '2021-12-22', 'Wednesday', '8:00 AM - 9:00 AM', 'client', 1, 0, NULL, NULL, NULL, 68, '2021-12-16 23:47:49', '2021-12-16 23:47:49');

-- --------------------------------------------------------

--
-- Table structure for table `app_feedback`
--

CREATE TABLE `app_feedback` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `description` longtext NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '0 for disable , 1 for enable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `app_feedback`
--

INSERT INTO `app_feedback` (`id`, `user_id`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 74, 'Please make sure my email address is not shown anywhere in this app.', 1, '2021-10-28 04:49:08', '2021-10-28 04:49:08'),
(2, 80, 'Rate Us doesn’t work', 1, '2021-11-18 19:39:44', '2021-11-18 19:39:44');

-- --------------------------------------------------------

--
-- Table structure for table `availabilities`
--

CREATE TABLE `availabilities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `days` longtext,
  `time` longtext,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `availabilities`
--

INSERT INTO `availabilities` (`id`, `user_id`, `days`, `time`, `created_at`, `updated_at`) VALUES
(1, 73, 'a:6:{i:0;s:6:\"Monday\";i:1;s:7:\"Tuesday\";i:2;s:9:\"Wednesday\";i:3;s:8:\"Thursday\";i:4;s:6:\"Friday\";i:5;s:8:\"Saturday\";}', 'a:8:{i:0;s:17:\"8:00 AM - 9:00 AM\";i:1;s:18:\"9:00 AM - 10:00 AM\";i:2;s:19:\"11:00 AM - 12:00 PM\";i:3;s:18:\"12:00 PM - 1:00 PM\";i:4;s:17:\"2:00 PM - 3:00 PM\";i:5;s:17:\"3:00 PM - 4:00 PM\";i:6;s:17:\"5:00 PM - 6:00 PM\";i:7;s:17:\"6:00 PM - 7:00 PM\";}', '2021-10-27 19:31:50', '2021-10-27 19:31:50'),
(2, 80, 'a:1:{i:0;s:9:\"Wednesday\";}', 'a:3:{i:0;s:17:\"7:00 AM - 8:00 AM\";i:1;s:17:\"4:00 PM - 5:00 PM\";i:2;s:17:\"5:00 PM - 6:00 PM\";}', '2021-11-18 18:54:29', '2021-11-18 18:54:29');

-- --------------------------------------------------------

--
-- Table structure for table `chat_rooms`
--

CREATE TABLE `chat_rooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coach_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chat_rooms`
--

INSERT INTO `chat_rooms` (`id`, `coach_id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 73, 74, '2021-10-27 19:51:03', '2021-10-27 19:51:03'),
(2, 73, 76, '2021-11-02 00:17:18', '2021-11-02 00:17:18'),
(3, 73, 79, '2021-11-15 19:57:45', '2021-11-15 19:57:45'),
(4, 73, 78, '2021-11-16 18:16:36', '2021-11-16 18:16:36');

-- --------------------------------------------------------

--
-- Table structure for table `fcm_tokens`
--

CREATE TABLE `fcm_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `fcmtoken` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fcm_tokens`
--

INSERT INTO `fcm_tokens` (`id`, `user_id`, `fcmtoken`, `created_at`, `updated_at`) VALUES
(1, 73, 'dbrLWLs4mE2MjWahSmX3CU:APA91bHM8b2bjQRSGU90_w1d33bg_I4A7LfIy9hqUEaLX-mD62ppmuA-wmfNRy1X0h9tQ8OXffV9pR0WbAIQDviGZGNqgR-coP6G9uB8KrewEJo0boTaiSCcJF-0EUUQK609Q50Ky0En', '2021-10-27 19:31:18', '2021-12-21 01:21:31'),
(2, 74, 'dbrLWLs4mE2MjWahSmX3CU:APA91bHM8b2bjQRSGU90_w1d33bg_I4A7LfIy9hqUEaLX-mD62ppmuA-wmfNRy1X0h9tQ8OXffV9pR0WbAIQDviGZGNqgR-coP6G9uB8KrewEJo0boTaiSCcJF-0EUUQK609Q50Ky0En', '2021-10-27 19:46:04', '2021-12-21 01:25:49'),
(3, 75, 'e7vmkoglRt-MzNvRA_Vwa7:APA91bFDUNrzLvRK0htYSAnpyygHZCANbWmxRwJcuHsi8Pi43QyFYNZecQWqTrRBpRE9oWPch5glL8mn-a3X8FgwBdBISNLHPpn5YVwHaCqu_nQafCPeRj32ZUF4cVFR2_I_jkZgHVIn', '2021-11-01 22:54:45', '2021-11-01 22:54:45'),
(4, 76, 'drW_wom0SmatAk2WJtUw8_:APA91bGhwQMIXmA9NMs8doam36Nt-Sr2vV_ivOFSnNXOEp6MFs4EaQGDUyAMtfVZswK-x3d-fLqgJ5hilstCbWVVg9hjsT8_UO-m4FgViX_Tg6_qxu1tBIqrbnhAQ2xUjgJIIW4DMf9s', '2021-11-01 23:56:41', '2021-11-01 23:56:41'),
(5, 78, 'd97FMSilmErKqb8zcHpHvR:APA91bGa3LUujN1j_PvoVpqRJBYMUR2GOReKH_8iwaYoPxX4RABwGziQfN1Msg509ER1DIRTUEEKvN7E78dDOpr-eJpx5kABD52uLRBBQuV17Gtbp4OodA9QBSXqxegvH38kBh-FBRkf', '2021-11-09 01:41:58', '2021-11-09 05:23:06'),
(6, 79, 'eQ2VFISEJUZGvI9Q_D-m6I:APA91bGdPU53kOWYz-ic_diBfBa66AWum8DHmfAMaQc7zXBGV3Bdy5feAdc0AszLP2TacY-l6x-BMq_1hl38B5CR0LfCHc1Kfkh0tgX_0eovwAvcOB0bLsH3KrFwFbKFuwvKVZgWu3U2', '2021-11-09 01:59:46', '2021-11-16 00:51:11'),
(7, 80, 'firCzINU5UJThYnXN1dYge:APA91bEtVokHZTLRIAFTq6WcAtvkyi1D25SXiCTE1U9cOlFedv-3vFyoYyoOfWKH6bnnJUD_FDLI1v4oaGS8EZXnqZ5qNNDcJ_TcHywatWshwN9-gBRjiqLn2Tp4n0DJiF8jfW8JNcaF', '2021-11-18 18:52:16', '2021-11-18 18:52:16');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `contect_name` varchar(255) DEFAULT NULL,
  `contect_email` varchar(255) DEFAULT NULL,
  `contect_phone` varchar(255) DEFAULT NULL,
  `feedback` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `goals`
--

CREATE TABLE `goals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0 for notcomplete , 1 for complete',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `goals`
--

INSERT INTO `goals` (`id`, `user_id`, `client_id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(5, 73, 76, 'Lose 20 lbs', 1, '2021-11-03 04:02:20', '2021-11-22 18:56:31'),
(10, 73, 74, 'Ancd', 1, '2021-12-06 23:51:56', '2021-12-21 19:44:07');

-- --------------------------------------------------------

--
-- Table structure for table `habits`
--

CREATE TABLE `habits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `all_day` int(11) NOT NULL DEFAULT '0' COMMENT '0 for not , 1 for yes',
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `repeat` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '0 for disable , 1 for enable and 2 for complete',
  `alert` varchar(256) DEFAULT NULL COMMENT 'At time of habit ,5 minutes before,10 minutes before,15 minutes before,30 minutes before,1 hour before,2 hour before,1 day beofre',
  `number_of_session` int(11) NOT NULL DEFAULT '0' COMMENT 'this will use to end of habit session',
  `week_days` longtext,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `habits`
--

INSERT INTO `habits` (`id`, `user_id`, `client_id`, `name`, `all_day`, `start_date`, `end_date`, `repeat`, `status`, `alert`, `number_of_session`, `week_days`, `created_at`, `updated_at`) VALUES
(1, 73, 74, '10 Running', 0, '2021-10-27 12:51:17', '2021-10-27 01:45:13', '', 1, '5 minutes before', 4, 'a:5:{i:0;s:6:\"Monday\";i:1;s:9:\"Wednesday\";i:2;s:8:\"Thursday\";i:3;s:6:\"Friday\";i:4;s:8:\"Saturday\";}', '2021-10-27 19:51:51', '2021-11-23 23:42:58'),
(2, 73, 74, '10 Push Ups', 0, '2021-10-27 01:15:13', '2021-10-27 01:20:13', '', 1, '15 minutes before', 3, 'a:7:{i:0;s:6:\"Monday\";i:1;s:7:\"Tuesday\";i:2;s:9:\"Wednesday\";i:3;s:8:\"Thursday\";i:4;s:6:\"Friday\";i:5;s:8:\"Saturday\";i:6;s:6:\"Sunday\";}', '2021-10-27 19:53:02', '2021-11-15 20:21:45'),
(3, 73, 74, 'Test alarm', 0, '2021-10-27 08:50:00', '2021-10-27 08:47:37', '', 1, 'At time of habit', 1, 'a:3:{i:0;s:7:\"Tuesday\";i:1;s:9:\"Wednesday\";i:2;s:6:\"Friday\";}', '2021-10-28 04:18:30', '2021-11-06 20:18:38'),
(4, 73, 76, 'Drink 50 once’s of water', 0, '2021-11-02 08:35:52', '2021-11-02 08:29:37', '', 1, '5 minutes before', 1, 'a:7:{i:0;s:6:\"Monday\";i:1;s:7:\"Tuesday\";i:2;s:9:\"Wednesday\";i:3;s:8:\"Thursday\";i:4;s:6:\"Friday\";i:5;s:8:\"Saturday\";i:6;s:6:\"Sunday\";}', '2021-11-03 04:00:45', '2021-11-03 04:00:45'),
(5, 73, 74, 'Drink 100 oz. water', 0, '2021-11-06 08:03:24', '2021-11-06 01:04:03', '', 1, '5 minutes before', 1, 'a:7:{i:0;s:6:\"Monday\";i:1;s:7:\"Tuesday\";i:2;s:9:\"Wednesday\";i:3;s:8:\"Thursday\";i:4;s:6:\"Friday\";i:5;s:8:\"Saturday\";i:6;s:6:\"Sunday\";}', '2021-11-07 09:35:13', '2021-11-07 09:35:13'),
(6, 73, 78, 'Trust yourself', 0, '2021-11-11 09:00:00', '2021-11-11 09:00:45', '', 1, '5 minutes before', 1, 'a:7:{i:0;s:6:\"Monday\";i:1;s:7:\"Tuesday\";i:2;s:9:\"Wednesday\";i:3;s:8:\"Thursday\";i:4;s:6:\"Friday\";i:5;s:8:\"Saturday\";i:6;s:6:\"Sunday\";}', '2021-11-12 05:59:15', '2021-11-12 05:59:15'),
(7, 73, 74, 'Eat 1 apple', 0, '2021-11-11 08:00:00', '2021-11-11 09:05:51', '', 1, '5 minutes before', 1, 'a:6:{i:0;s:6:\"Monday\";i:1;s:7:\"Tuesday\";i:2;s:9:\"Wednesday\";i:3;s:8:\"Thursday\";i:4;s:6:\"Friday\";i:5;s:6:\"Sunday\";}', '2021-11-12 07:26:01', '2021-11-23 23:42:58'),
(8, 73, 74, 'Walk with cow', 0, '2021-11-16 10:58:23', '2021-11-16 10:58:23', '', 1, '5 minutes before', 2, 'a:1:{i:0;s:6:\"Monday\";}', '2021-11-16 18:58:51', '2021-11-16 18:58:51'),
(9, 73, 74, 'Walk with car', 0, '2021-11-16 10:59:57', '2021-11-16 10:59:57', '', 1, '5 minutes before', 2, 'a:1:{i:0;s:7:\"Tuesday\";}', '2021-11-16 19:00:30', '2021-11-17 06:13:57'),
(10, 73, 74, 'Go to Home', 0, '2021-11-18 06:02:00', '2021-11-18 06:35:58', '', 1, '30 minutes before', 1, 'a:1:{i:0;s:9:\"Wednesday\";}', '2021-11-18 00:06:08', '2021-11-18 00:06:08');

-- --------------------------------------------------------

--
-- Table structure for table `habit_items`
--

CREATE TABLE `habit_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `habit_id` bigint(20) UNSIGNED NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `item_time` varchar(255) NOT NULL,
  `next_date` datetime DEFAULT NULL COMMENT 'it is for when it will repeat',
  `item_status` varchar(255) NOT NULL DEFAULT '0' COMMENT '0 for pending , 1 for complete',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `journals`
--

CREATE TABLE `journals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `description` longtext NOT NULL,
  `images` longtext,
  `date_time` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '0 for disable , 1 for enable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `journals`
--

INSERT INTO `journals` (`id`, `user_id`, `client_id`, `description`, `images`, `date_time`, `status`, `created_at`, `updated_at`) VALUES
(1, 73, 74, 'New Journal Test.', '[\"images\\/11635319826.jpeg\",\"images\\/21635319826.jpeg\"]', '2021-10-27 13:00:26', 1, '2021-10-27 20:00:26', '2021-10-27 20:00:26'),
(2, 73, 74, 'Why am I so tired all the time?', NULL, '2021-10-27 22:13:31', 1, '2021-10-28 05:13:31', '2021-10-28 05:13:31'),
(3, 73, 74, 'New Jounal Entry', NULL, '2021-10-28 12:17:23', 1, '2021-10-28 19:17:23', '2021-10-28 19:17:23'),
(4, 73, 74, 'This is a New Journal.', NULL, '2021-10-28 15:42:45', 1, '2021-10-28 22:42:45', '2021-10-28 22:42:45'),
(5, 73, 74, 'Ok done with best capability', NULL, '2021-10-29 15:57:51', 1, '2021-10-29 22:57:51', '2021-10-29 22:57:51'),
(6, 73, 74, 'Hi', NULL, '2021-11-16 23:11:02', 1, '2021-11-17 07:11:02', '2021-11-17 07:11:02'),
(7, 73, 74, 'Got hth Greg er', NULL, '2021-11-17 14:18:54', 1, '2021-11-17 22:18:54', '2021-11-17 22:18:54'),
(8, 73, 74, 'Cfgerge rhrt. Rthrtngfgb', NULL, '2021-11-17 14:19:12', 1, '2021-11-17 22:19:12', '2021-11-17 22:19:12'),
(9, 73, 74, 'Ch chchchvjvjvjv KB hchchchcu\n\n ivjfufhxyxgxtstfufuvufufufudydyst xgxgdydydy xhxhddydydysyays fydhdycyxydydydu', '[\"images\\/11637143887.jpeg\"]', '2021-11-17 15:41:27', 1, '2021-11-17 23:41:27', '2021-11-17 23:41:27'),
(10, 73, 74, 'Okdo it', NULL, '2021-11-17 15:44:06', 1, '2021-11-17 23:44:06', '2021-11-17 23:44:06');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2020_12_26_105854_create_settings_table', 1),
(4, '2021_05_03_061118_create_pages_table', 1),
(5, '2021_05_03_081616_create_feedback_table', 1),
(6, '2021_05_04_045605_create_templates_table', 1),
(7, '2021_05_12_040709_create_plans_table', 2),
(8, '2021_05_12_053958_create_availabilities_table', 3),
(9, '2021_06_01_075308_create_payments_table', 4),
(10, '2021_06_04_042806_create_selected_plans_table', 5),
(11, '2021_06_04_071725_create_add_clients_table', 6),
(13, '2021_06_12_044719_create_habits_table', 7),
(14, '2021_06_12_044918_create_habit_items_table', 8),
(15, '2021_06_17_071054_create_journals_table', 9),
(16, '2021_06_25_084723_create_reminders_table', 10),
(19, '2021_06_29_070339_create_appointments_table', 12),
(20, '2021_07_14_055222_create_chat_rooms_table', 13),
(22, '2021_07_26_050230_create_stripe_keys_table', 14),
(23, '2021_09_21_062122_create_fcm_tokens_table', 15),
(26, '2021_10_11_050105_create_goals_table', 17),
(27, '2021_10_22_103527_create_app_feedback_table', 18),
(29, '2021_09_21_082140_create_notifications_table', 19),
(30, '2021_06_25_100111_create_notes_table', 20);

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `description` longtext NOT NULL,
  `date_time` datetime NOT NULL,
  `images1` longtext,
  `images2` longtext,
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '0 for disable , 1 for enable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notes`
--

INSERT INTO `notes` (`id`, `user_id`, `client_id`, `description`, `date_time`, `images1`, `images2`, `status`, `created_at`, `updated_at`) VALUES
(1, 73, 74, 'Steve Joy Note.', '2021-11-08 15:38:08', NULL, NULL, 1, '2021-11-08 23:38:08', '2021-11-08 23:38:08'),
(2, 73, 74, 'Hello all good', '2021-11-08 17:44:51', NULL, NULL, 1, '2021-11-09 01:44:51', '2021-11-09 01:44:51'),
(3, 73, 74, 'It’s note for all and all', '2021-11-08 21:26:33', NULL, NULL, 1, '2021-11-09 05:26:33', '2021-11-09 05:26:33'),
(5, 73, 78, 'First session \nAsk lots of questions', '2021-11-11 22:00:07', NULL, NULL, 1, '2021-11-12 06:00:07', '2021-11-12 06:00:07');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` longtext NOT NULL,
  `body` longtext NOT NULL,
  `type` longtext,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `coach_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '0 for read , 1 for unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `title`, `body`, `type`, `client_id`, `coach_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 73, 'New Appointment', 'Your client Steve Joy scheduled a new appointment', 'Appointment', NULL, NULL, 0, '2021-11-02 21:18:24', '2021-11-02 21:26:03'),
(2, 73, 'Payment Received', 'You have received $100 payment for appointment', 'payment', NULL, NULL, 0, '2021-11-02 21:18:25', '2021-11-02 21:25:56'),
(3, 73, 'New Appointment', 'Your client Steve Joy scheduled a new appointment', 'Appointment', NULL, NULL, 0, '2021-11-02 21:20:54', '2021-11-02 21:25:51'),
(4, 73, 'Payment Received', 'You have received $100 payment for appointment', 'payment', NULL, NULL, 0, '2021-11-02 21:20:54', '2021-11-02 21:25:45'),
(5, 74, 'New Message Received', 'Hello', 'Message', 74, 73, 0, '2021-11-02 21:26:15', '2021-11-02 21:27:13'),
(6, 74, 'New Message Received', 'Hi', 'Message', 74, 73, 0, '2021-11-02 21:26:23', '2021-11-02 21:27:09'),
(7, 74, 'New Message Received', 'Hello', 'Message', 74, 73, 0, '2021-11-02 21:27:25', '2021-11-03 04:16:52'),
(8, 74, 'New Message Received', 'How are you', 'Message', 74, 73, 0, '2021-11-02 21:27:43', '2021-11-03 04:17:00'),
(9, 76, 'Habit List', 'A new habit added by your coach  Michael Green', 'Habit List', 76, 73, 1, '2021-11-03 04:00:45', '2021-11-03 04:00:45'),
(10, 76, 'New Message Received', 'Don’t forget to drink some water.', 'Message', 76, 73, 1, '2021-11-03 04:01:37', '2021-11-03 04:01:37'),
(11, 74, 'Habit List', 'Habit start reminder', 'Habit List', 74, 73, 0, '2021-11-03 08:00:01', '2021-11-09 01:14:27'),
(12, 76, 'Habit List', 'Habit start reminder', 'Habit List', 76, 73, 1, '2021-11-03 15:30:02', '2021-11-03 15:30:02'),
(13, 74, 'Habit List', 'Habit start reminder', 'Habit List', 74, 73, 0, '2021-11-03 19:46:02', '2021-11-09 01:14:38'),
(14, 74, 'Habit List', 'Habit start reminder', 'Habit List', 74, 73, 0, '2021-11-04 08:00:01', '2021-11-09 01:14:46'),
(15, 76, 'Habit List', 'Habit start reminder', 'Habit List', 76, 73, 1, '2021-11-04 15:30:02', '2021-11-04 15:30:02'),
(16, 74, 'Habit List', 'Habit start reminder', 'Habit List', 74, 73, 0, '2021-11-04 19:46:01', '2021-11-09 01:15:04'),
(17, 74, 'Habit List', 'Habit start reminder', 'Habit List', 74, 73, 0, '2021-11-05 08:00:02', '2021-11-09 01:14:53'),
(18, 76, 'Habit List', 'Habit start reminder', 'Habit List', 76, 73, 1, '2021-11-05 15:30:01', '2021-11-05 15:30:01'),
(19, 74, 'Habit List', 'Habit start reminder', 'Habit List', 74, 73, 0, '2021-11-05 19:46:02', '2021-11-09 01:15:13'),
(20, 74, 'Habit List', 'Habit start reminder', 'Habit List', 74, 73, 0, '2021-11-06 08:00:01', '2021-11-09 01:15:17'),
(21, 76, 'Habit List', 'Habit start reminder', 'Habit List', 76, 73, 1, '2021-11-06 15:30:02', '2021-11-06 15:30:02'),
(22, 74, 'Habit List', 'Habit start reminder', 'Habit List', 74, 73, 0, '2021-11-06 19:46:02', '2021-11-06 20:18:36'),
(23, 74, 'Habit List', 'Habit start reminder', 'Habit List', 74, 73, 0, '2021-11-07 09:00:02', '2021-11-09 01:15:28'),
(24, 73, 'Habit List', 'A new habit added by your client  Steve Joy', 'Habit List', 74, 73, 0, '2021-11-07 09:35:13', '2021-11-08 23:29:24'),
(25, 74, 'Habit List', 'Habit start reminder', 'Habit List', 74, 73, 0, '2021-11-07 15:58:02', '2021-11-09 01:15:50'),
(26, 76, 'Habit List', 'Habit start reminder', 'Habit List', 76, 73, 1, '2021-11-07 16:30:01', '2021-11-07 16:30:01'),
(27, 74, 'Habit List', 'Habit start reminder', 'Habit List', 74, 73, 0, '2021-11-08 09:00:02', '2021-11-09 01:15:33'),
(28, 74, 'Habit List', 'Habit start reminder', 'Habit List', 74, 73, 0, '2021-11-08 15:58:02', '2021-11-09 01:15:45'),
(29, 76, 'Habit List', 'Habit start reminder', 'Habit List', 76, 73, 1, '2021-11-08 16:30:02', '2021-11-08 16:30:02'),
(30, 73, 'New Client Subscribed', 'Your client Smith added you as coach', 'New Client Subscribed', NULL, NULL, 1, '2021-11-09 01:42:48', '2021-11-09 01:42:48'),
(31, 73, 'Payment Recieved', 'You have received $ 200 payment from client Steve', 'Payment Recieved', NULL, NULL, 1, '2021-11-09 01:42:49', '2021-11-09 01:42:49'),
(32, 73, 'New Client Subscribed', 'Your client Smith added you as coach', 'New Client Subscribed', NULL, NULL, 1, '2021-11-09 01:51:23', '2021-11-09 01:51:23'),
(33, 73, 'Payment Recieved', 'You have received $ 259 payment from client joy', 'Payment Recieved', NULL, NULL, 1, '2021-11-09 01:51:24', '2021-11-09 01:51:24'),
(34, 73, 'New Client Subscribed', 'Your client Kane added you as coach', 'New Client Subscribed', NULL, NULL, 1, '2021-11-09 02:00:42', '2021-11-09 02:00:42'),
(35, 73, 'Payment Recieved', 'You have received $ 245 payment from client Kane', 'Payment Recieved', NULL, NULL, 1, '2021-11-09 02:00:42', '2021-11-09 02:00:42'),
(36, 73, 'New Appointment', 'Your client Kane scheduled a new appointment', 'Appointment', NULL, NULL, 1, '2021-11-09 02:04:10', '2021-11-09 02:04:10'),
(37, 73, 'Payment Received', 'You have received $115 payment for appointment', 'payment', NULL, NULL, 1, '2021-11-09 02:04:10', '2021-11-09 02:04:10'),
(38, 73, 'New Client Subscribed', 'Your client Smith added you as coach', 'New Client Subscribed', NULL, NULL, 1, '2021-11-09 05:20:20', '2021-11-09 05:20:20'),
(39, 73, 'Payment Recieved', 'You have received $ 200 payment from client Atul', 'Payment Recieved', NULL, NULL, 1, '2021-11-09 05:20:20', '2021-11-09 05:20:20'),
(40, 73, 'New Appointment', 'Your client Smith scheduled a new appointment', 'Appointment', NULL, NULL, 1, '2021-11-09 05:21:20', '2021-11-09 05:21:20'),
(41, 73, 'Payment Received', 'You have received $145 payment for appointment', 'payment', NULL, NULL, 1, '2021-11-09 05:21:20', '2021-11-09 05:21:20'),
(42, 73, 'New Appointment', 'Your client Smith scheduled a new appointment', 'Appointment', NULL, NULL, 1, '2021-11-09 05:23:40', '2021-11-09 05:23:40'),
(43, 73, 'Payment Received', 'You have received $145 payment for appointment', 'payment', NULL, NULL, 1, '2021-11-09 05:23:41', '2021-11-09 05:23:41'),
(44, 74, 'Habit List', 'Habit start reminder', 'Habit List', 74, 73, 1, '2021-11-09 09:00:02', '2021-11-09 09:00:02'),
(45, 74, 'Habit List', 'Habit start reminder', 'Habit List', 74, 73, 1, '2021-11-09 15:58:02', '2021-11-09 15:58:02'),
(46, 74, 'Habit List', 'Habit start reminder', 'Habit List', 74, 73, 1, '2021-11-10 09:00:01', '2021-11-10 09:00:01'),
(47, 74, 'Habit List', 'Habit start reminder', 'Habit List', 74, 73, 1, '2021-11-10 15:58:01', '2021-11-10 15:58:01'),
(48, 74, 'Habit List', 'Habit start reminder', 'Habit List', 74, 73, 0, '2021-11-10 20:46:01', '2021-11-12 07:42:45'),
(49, 74, 'Habit List', 'Habit start reminder', 'Habit List', 74, 73, 0, '2021-11-11 09:00:01', '2021-11-12 07:37:12'),
(50, 74, 'New Message Received', 'Test text', 'Message', 74, 73, 0, '2021-11-11 15:22:13', '2021-11-12 07:41:17'),
(51, 79, 'Reschedule Appointment', 'Your appointment with coach Michael Green rescheduled', 'Reschedule', NULL, NULL, 1, '2021-11-11 15:23:42', '2021-11-11 15:23:42'),
(52, 73, 'New Appointment', 'Your client Steve Joy scheduled a new appointment', 'Appointment', NULL, NULL, 1, '2021-11-11 15:32:20', '2021-11-11 15:32:20'),
(53, 73, 'Payment Received', 'You have received $0 payment for appointment', 'payment', NULL, NULL, 1, '2021-11-11 15:32:20', '2021-11-11 15:32:20'),
(54, 74, 'Habit List', 'Habit start reminder', 'Habit List', 74, 73, 0, '2021-11-11 15:58:01', '2021-11-12 07:40:07'),
(55, 73, 'New Appointment', 'Your client Steve Joy scheduled a new appointment', 'Appointment', NULL, NULL, 0, '2021-11-12 05:50:20', '2021-11-12 06:04:17'),
(56, 73, 'Payment Received', 'You have received $0 payment for appointment', 'payment', NULL, NULL, 0, '2021-11-12 05:50:21', '2021-11-12 06:03:50'),
(57, 78, 'Habit List', 'A new habit added by your coach  Michael Green', 'Habit List', 78, 73, 1, '2021-11-12 05:59:15', '2021-11-12 05:59:15'),
(58, 74, 'Reschedule Appointment', 'Your appointment with coach Michael Green rescheduled', 'Reschedule', NULL, NULL, 0, '2021-11-12 06:01:55', '2021-11-12 07:38:01'),
(59, 73, 'Habit List', 'A new habit added by your client  Steve Joy', 'Habit List', 74, 73, 1, '2021-11-12 07:26:01', '2021-11-12 07:26:01'),
(60, 73, 'Appointment Cancelled', 'Your client Steve Joy cancelled the appointment ', 'Appointment Cancelled', NULL, NULL, 1, '2021-11-12 07:29:30', '2021-11-12 07:29:30'),
(61, 74, 'Habit List', 'Habit start reminder', 'Habit List', 74, 73, 1, '2021-11-12 15:55:02', '2021-11-12 15:55:02'),
(62, 74, 'Habit List', 'Habit start reminder', 'Habit List', 74, 73, 1, '2021-11-12 15:58:01', '2021-11-12 15:58:01'),
(63, 78, 'Habit List', 'Habit start reminder', 'Habit List', 78, 73, 1, '2021-11-12 16:55:01', '2021-11-12 16:55:01'),
(64, 78, 'Habit List', 'Habit start reminder', 'Habit List', 78, 73, 1, '2021-11-13 16:55:02', '2021-11-13 16:55:02'),
(65, 74, 'Reschedule Appointment', 'Your appointment with coach Michael Green rescheduled', 'Reschedule', NULL, NULL, 0, '2021-11-13 20:03:23', '2021-11-13 20:23:54'),
(66, 73, 'New Appointment', 'Your client Steve Joy scheduled a new appointment', 'Appointment', NULL, NULL, 1, '2021-11-13 22:19:56', '2021-11-13 22:19:56'),
(67, 73, 'Payment Received', 'You have received $0 payment for appointment', 'payment', NULL, NULL, 1, '2021-11-13 22:19:56', '2021-11-13 22:19:56'),
(68, 73, 'New Appointment', 'Your client Steve Joy scheduled a new appointment', 'Appointment', NULL, NULL, 1, '2021-11-13 22:30:19', '2021-11-13 22:30:19'),
(69, 73, 'Payment Received', 'You have received $115 payment for appointment', 'payment', NULL, NULL, 1, '2021-11-13 22:30:19', '2021-11-13 22:30:19'),
(70, 73, 'New Appointment', 'Your client Steve Joy scheduled a new appointment', 'Appointment', NULL, NULL, 1, '2021-11-13 22:46:03', '2021-11-13 22:46:03'),
(71, 73, 'Payment Received', 'You have received $115 payment for appointment', 'payment', NULL, NULL, 1, '2021-11-13 22:46:03', '2021-11-13 22:46:03'),
(72, 74, 'Habit List', 'Habit start reminder', 'Habit List', 74, 73, 0, '2021-11-14 15:55:02', '2021-11-17 22:20:06'),
(73, 78, 'Habit List', 'Habit start reminder', 'Habit List', 78, 73, 1, '2021-11-14 16:55:02', '2021-11-14 16:55:02'),
(74, 74, 'Habit List', 'Habit start reminder', 'Habit List', 74, 73, 0, '2021-11-15 15:55:02', '2021-11-15 20:21:43'),
(75, 78, 'Habit List', 'Habit start reminder', 'Habit List', 78, 73, 1, '2021-11-15 16:55:02', '2021-11-15 16:55:02'),
(76, 73, 'New Appointment', 'Your client Steve Joy scheduled a new appointment', 'Appointment', NULL, NULL, 1, '2021-11-15 20:26:43', '2021-11-15 20:26:43'),
(77, 73, 'Payment Received', 'You have received $115 payment for appointment', 'payment', NULL, NULL, 1, '2021-11-15 20:26:43', '2021-11-15 20:26:43'),
(78, 74, 'Habit List', 'Habit start reminder', 'Habit List', 74, 73, 0, '2021-11-15 20:46:01', '2021-11-16 01:51:36'),
(79, 73, 'New Appointment', 'Your client Steve Joy scheduled a new appointment', 'Appointment', NULL, NULL, 1, '2021-11-15 23:47:37', '2021-11-15 23:47:37'),
(80, 73, 'Payment Received', 'You have received $115 payment for appointment', 'payment', NULL, NULL, 1, '2021-11-15 23:47:37', '2021-11-15 23:47:37'),
(81, 73, 'New Appointment', 'Your client Steve Joy scheduled a new appointment', 'Appointment', NULL, NULL, 1, '2021-11-15 23:53:32', '2021-11-15 23:53:32'),
(82, 73, 'Payment Received', 'You have received $230 payment for appointment', 'payment', NULL, NULL, 1, '2021-11-15 23:53:32', '2021-11-15 23:53:32'),
(83, 73, 'New Client Subscribed', 'Your client Kane added you as coach', 'New Client Subscribed', NULL, NULL, 1, '2021-11-16 00:52:43', '2021-11-16 00:52:43'),
(84, 73, 'Payment Recieved', 'You have received $ 149 payment from client Johanas', 'Payment Recieved', NULL, NULL, 1, '2021-11-16 00:52:43', '2021-11-16 00:52:43'),
(85, 73, 'New Appointment', 'Your client Steve Joy scheduled a new appointment', 'Appointment', NULL, NULL, 1, '2021-11-16 01:17:58', '2021-11-16 01:17:58'),
(86, 73, 'Payment Received', 'You have received $575 payment for appointment', 'payment', NULL, NULL, 1, '2021-11-16 01:17:58', '2021-11-16 01:17:58'),
(87, 73, 'New Client Subscribed', 'Your client Steve Joy added you as coach', 'New Client Subscribed', NULL, NULL, 1, '2021-11-16 01:48:25', '2021-11-16 01:48:25'),
(88, 73, 'Payment Recieved', 'You have received $ 125 payment from client John Jones', 'Payment Recieved', NULL, NULL, 1, '2021-11-16 01:48:25', '2021-11-16 01:48:25'),
(89, 73, 'New Appointment', 'Your client Steve Joy scheduled a new appointment', 'Appointment', NULL, NULL, 1, '2021-11-16 01:50:37', '2021-11-16 01:50:37'),
(90, 73, 'Payment Received', 'You have received $230 payment for appointment', 'payment', NULL, NULL, 0, '2021-11-16 01:50:37', '2021-11-16 19:03:54'),
(91, 74, 'Habit List', 'Habit start reminder', 'Habit List', 74, 73, 0, '2021-11-16 09:00:02', '2021-11-17 22:19:59'),
(92, 74, 'Habit List', 'Habit start reminder', 'Habit List', 74, 73, 0, '2021-11-16 15:55:01', '2021-11-17 22:19:54'),
(93, 78, 'Habit List', 'Habit start reminder', 'Habit List', 78, 73, 1, '2021-11-16 16:55:01', '2021-11-16 16:55:01'),
(94, 78, 'New Message Received', 'Great job this week ', 'Message', 78, 73, 1, '2021-11-16 18:17:19', '2021-11-16 18:17:19'),
(95, 74, 'Habit List', 'A new habit added by your coach  Michael Green', 'Habit List', 74, 73, 0, '2021-11-16 18:58:51', '2021-11-17 10:38:57'),
(96, 74, 'Habit List', 'A new habit added by your coach  Michael Green', 'Habit List', 74, 73, 0, '2021-11-16 19:00:30', '2021-11-16 19:19:56'),
(97, 74, 'Reschedule Appointment', 'Your appointment with coach Michael Green rescheduled', 'Reschedule', NULL, NULL, 0, '2021-11-16 19:01:19', '2021-11-16 19:07:00'),
(98, 74, 'New Message Received', 'Hello', 'Message', 74, 73, 0, '2021-11-16 19:07:15', '2021-11-16 19:08:33'),
(99, 73, 'New Appointment', 'Your client Steve Joy scheduled a new appointment', 'Appointment', NULL, NULL, 1, '2021-11-17 07:16:48', '2021-11-17 07:16:48'),
(100, 73, 'Payment Received', 'You have received $115 payment for appointment', 'payment', NULL, NULL, 1, '2021-11-17 07:16:48', '2021-11-17 07:16:48'),
(101, 73, 'New Appointment', 'Your client Steve Joy scheduled a new appointment', 'Appointment', NULL, NULL, 1, '2021-11-17 07:17:02', '2021-11-17 07:17:02'),
(102, 73, 'Payment Received', 'You have received $115 payment for appointment', 'payment', NULL, NULL, 0, '2021-11-17 07:17:02', '2021-11-17 22:48:54'),
(103, 74, 'Habit List', 'Habit start reminder', 'Habit List', 74, 73, 0, '2021-11-17 15:55:01', '2021-11-17 22:19:38'),
(104, 78, 'Habit List', 'Habit start reminder', 'Habit List', 78, 73, 1, '2021-11-17 16:55:02', '2021-11-17 16:55:02'),
(105, 74, 'Habit List', 'Habit start reminder', 'Habit List', 74, 73, 0, '2021-11-17 20:46:02', '2021-11-17 22:19:45'),
(106, 73, 'Habit List', 'A new habit added by your client  Steve Joy', 'Habit List', 74, 73, 1, '2021-11-18 00:06:09', '2021-11-18 00:06:09'),
(107, 74, 'Habit List', 'Habit start reminder', 'Habit List', 74, 73, 0, '2021-11-22 18:53:02', '2021-11-23 23:43:01'),
(108, 74, 'Habit List', 'Habit start reminder', 'Habit List', 74, 73, 0, '2021-11-23 18:54:01', '2021-11-23 23:42:57'),
(109, 73, 'New Appointment', 'Your client Steve Joy scheduled a new appointment', 'Appointment', NULL, NULL, 0, '2021-11-23 23:50:51', '2021-12-21 19:44:45'),
(110, 73, 'Payment Received', 'You have received $115 payment for appointment', 'payment', NULL, NULL, 0, '2021-11-23 23:50:52', '2021-12-21 19:44:54'),
(111, 73, 'New Appointment', 'Your client Steve Joy scheduled a new appointment', 'Appointment', NULL, NULL, 0, '2021-11-24 01:49:29', '2021-12-21 19:45:03'),
(112, 73, 'Payment Received', 'You have received $575 payment for appointment', 'payment', NULL, NULL, 0, '2021-11-24 01:49:29', '2021-12-21 19:46:50'),
(113, 73, 'New Appointment', 'Your client Steve Joy scheduled a new appointment', 'Appointment', NULL, NULL, 0, '2021-11-24 02:04:43', '2021-12-21 19:46:37'),
(114, 73, 'Payment Received', 'You have received $115 payment for appointment', 'payment', NULL, NULL, 0, '2021-11-24 02:04:43', '2021-12-21 19:46:22'),
(115, 74, 'Habit List', 'Habit start reminder', 'Habit List', 74, 73, 0, '2021-11-24 13:32:02', '2021-12-16 23:47:55'),
(116, 73, 'New Appointment', 'Your client Steve Joy scheduled a new appointment', 'Appointment', NULL, NULL, 0, '2021-11-25 18:50:14', '2021-12-21 19:46:08'),
(117, 73, 'Payment Received', 'You have received $115 payment for appointment', 'payment', NULL, NULL, 0, '2021-11-25 18:50:15', '2021-12-21 19:45:59'),
(118, 73, 'New Appointment', 'Your client Steve Joy scheduled a new appointment', 'Appointment', NULL, NULL, 0, '2021-11-25 18:53:18', '2021-12-21 19:45:46'),
(119, 73, 'Payment Received', 'You have received $115 payment for appointment', 'payment', NULL, NULL, 0, '2021-11-25 18:53:18', '2021-12-21 19:45:38'),
(120, 73, 'New Appointment', 'Your client Steve Joy scheduled a new appointment', 'Appointment', NULL, NULL, 0, '2021-11-25 18:55:01', '2021-12-21 19:45:27'),
(121, 73, 'Payment Received', 'You have received $115 payment for appointment', 'payment', NULL, NULL, 0, '2021-11-25 18:55:01', '2021-12-21 19:45:14'),
(122, 73, 'New Appointment', 'Your client Steve Joy scheduled a new appointment', 'Appointment', NULL, NULL, 0, '2021-11-25 18:56:07', '2021-12-21 19:44:27'),
(123, 73, 'Payment Received', 'You have received $115 payment for appointment', 'payment', NULL, NULL, 0, '2021-11-25 18:56:07', '2021-12-21 19:44:35'),
(124, 73, 'New Appointment', 'Your client Steve Joy scheduled a new appointment', 'Appointment', NULL, NULL, 0, '2021-11-25 18:57:25', '2021-12-21 19:44:17'),
(125, 73, 'Payment Received', 'You have received $115 payment for appointment', 'payment', NULL, NULL, 0, '2021-11-25 18:57:26', '2021-12-19 00:42:11'),
(126, 73, 'New Appointment', 'Your client Steve Joy scheduled a new appointment', 'Appointment', NULL, NULL, 0, '2021-11-25 19:40:01', '2021-12-18 19:36:55'),
(127, 73, 'Payment Received', 'You have received $115 payment for appointment', 'payment', NULL, NULL, 0, '2021-11-25 19:40:01', '2021-12-19 00:42:04'),
(128, 74, 'Habit List', 'Habit start reminder', 'Habit List', 74, 73, 0, '2021-11-29 18:53:01', '2021-12-06 19:20:54'),
(129, 73, 'New Appointment', 'Your client Steve Joy scheduled a new appointment', 'Appointment', NULL, NULL, 0, '2021-12-16 23:47:49', '2021-12-19 00:41:43'),
(130, 73, 'Payment Received', 'You have received $115 payment for appointment', 'payment', NULL, NULL, 0, '2021-12-16 23:47:49', '2021-12-18 19:36:04'),
(131, 74, 'New Message Received', 'Vfryh', 'Message', 74, 73, 1, '2021-12-17 20:14:50', '2021-12-17 20:14:50'),
(132, 74, 'New Message Received', 'Jjhg', 'Message', 74, 73, 1, '2021-12-17 20:14:55', '2021-12-17 20:14:55'),
(133, 74, 'New Message Received', 'Hhggyh', 'Message', 74, 73, 1, '2021-12-17 20:17:03', '2021-12-17 20:17:03'),
(134, 74, 'New Message Received', 'Gggg', 'Message', 74, 73, 1, '2021-12-17 20:17:58', '2021-12-17 20:17:58'),
(135, 74, 'New Message Received', 'Gggh', 'Message', 74, 73, 1, '2021-12-17 20:18:03', '2021-12-17 20:18:03'),
(136, 74, 'New Message Received', 'Ghxh', 'Message', 74, 73, 1, '2021-12-17 20:18:12', '2021-12-17 20:18:12'),
(137, 74, 'New Message Received', 'Fhfhhf', 'Message', 74, 73, 1, '2021-12-17 20:18:18', '2021-12-17 20:18:18'),
(138, 74, 'New Message Received', 'Ffghh', 'Message', 74, 73, 1, '2021-12-17 20:20:32', '2021-12-17 20:20:32'),
(139, 74, 'New Message Received', 'Gghh', 'Message', 74, 73, 1, '2021-12-17 20:22:07', '2021-12-17 20:22:07'),
(140, 74, 'New Message Received', 'Hhhhh', 'Message', 74, 73, 1, '2021-12-17 20:22:08', '2021-12-17 20:22:08'),
(141, 74, 'New Message Received', 'Ghgdd', 'Message', 74, 73, 1, '2021-12-17 20:22:08', '2021-12-17 20:22:08'),
(142, 74, 'New Message Received', 'Hhhj', 'Message', 74, 73, 1, '2021-12-17 20:22:09', '2021-12-17 20:22:09'),
(143, 74, 'New Message Received', 'Alpha bravo', 'Message', 74, 73, 1, '2021-12-17 20:24:00', '2021-12-17 20:24:00'),
(144, 74, 'New Message Received', 'Go home', 'Message', 74, 73, 1, '2021-12-17 20:24:37', '2021-12-17 20:24:37'),
(145, 74, 'New Message Received', 'Hello', 'Message', 74, 73, 1, '2021-12-21 19:40:02', '2021-12-21 19:40:02');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `page_title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_data` varchar(255) DEFAULT NULL,
  `page_content` text,
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0 for Inactive and 1 for active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `page_title`, `slug`, `meta_description`, `meta_data`, `page_content`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 'Privacy Policy', 'privacy-policy', NULL, NULL, '<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"CENTER\"><font size=\"6\"><b><font face=\"Arial, serif\"><font style=\"font-size: 22pt\" size=\"6\">MOBILE\r\nAPP PRIVACY POLICY</font></font></b></font></p>\r\n<p style=\"margin-bottom: 0in\"><br>\r\n</p>\r\n<p style=\"margin-bottom: 0.03in; line-height: 115%\" align=\"CENTER\"><font color=\"#00b050\"><font size=\"5\"><b>Life\r\nCanon</b></font></font> \r\n</p>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"center\"><font color=\"#999999\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">Last\r\nupdated 10/05/2021</font></font></font></p>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><br>\r\n</p>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\"><b>Life\r\nCanon</b></font></font><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">\r\n(“we” or “us” or “our”) respects the privacy of our users\r\n(“user” or “you”). This Privacy Policy explains how we\r\ncollect, use, disclose, and safeguard your information when you visit\r\nour mobile application (the “Application”).</font></font><font face=\"Times New Roman, serif\"><font size=\"3\">\r\n</font></font><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">\r\n</font></font><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\"><b>\r\n</b></font></font><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">Please\r\nread this Privacy Policy carefully.  IF YOU DO NOT AGREE WITH THE\r\nTERMS OF THIS PRIVACY POLICY, PLEASE DO NOT ACCESS THE APPLICATION. </font></font>\r\n</p>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><br>\r\n</p>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">We\r\nreserve the right to make changes to this Privacy Policy at any time\r\nand for any reason.  We will alert you about any changes by updating\r\nthe “Last updated” date of this Privacy Policy.  You are\r\nencouraged to periodically review this Privacy Policy to stay\r\ninformed of updates. You will be deemed to have been made aware of,\r\nwill be subject to, and will be deemed to have accepted the changes\r\nin any revised Privacy Policy by your continued use of the\r\nApplication after the date such revised Privacy Policy is posted.  </font></font>\r\n</p>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><br>\r\n</p>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">This\r\nPrivacy Policy does not apply to the third-party online/mobile store\r\nfrom which you install the Application or make payments, including\r\nany in-game virtual items, which may also collect and use data about\r\nyou.  We are not responsible for any of the data collected by any\r\nsuch third party. </font></font>\r\n</p>\r\n<h1 class=\"western\" style=\"line-height: 115%\"><a name=\"_eenucvnqa0rq\"></a>\r\nCOLLECTION OF YOUR INFORMATION</h1>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">We\r\nmay collect information about you in a variety of ways.  The\r\ninformation we may collect via the Application depends on the content\r\nand materials you use, and includes:  </font></font>\r\n</p>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><br>\r\n</p>\r\n<h2 class=\"western\" style=\"line-height: 115%\"><a name=\"_rima4gqmeezw\"></a>\r\nPersonal Data \r\n</h2>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">Demographic\r\nand other personally identifiable information (such as your name and\r\nemail address) that you voluntarily give to us when choosing to\r\nparticipate in various activities related to the Application, such as\r\nchat, posting messages in comment sections or in our forums, liking\r\nposts, sending feedback, and responding to surveys.  If you choose to\r\nshare data about yourself via your profile, online chat, or other\r\ninteractive areas of the Application, please be advised that all data\r\nyou disclose in these areas is public and your data will be\r\naccessible to anyone who accesses the Application.</font></font></p>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><br>\r\n</p>\r\n<h2 class=\"western\" style=\"line-height: 115%\"><a name=\"_qs8x7isf2hqt\"></a>\r\nDerivative Data  \r\n</h2>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">Information\r\nour servers automatically collect when you access the Application,\r\nsuch as your native actions that are integral to the Application,\r\nincluding liking, re-blogging, or replying to a post, as well as\r\nother interactions with the Application and other users via server\r\nlog files.  </font></font>\r\n</p>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><br>\r\n</p>\r\n<h2 class=\"western\" style=\"line-height: 115%\"><a name=\"_jmz6d47e30t\"></a>\r\nFinancial Data \r\n</h2>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">Financial\r\ninformation, such as data related to your payment method (e.g. valid\r\ncredit card number, card brand, expiration date) that we may collect\r\nwhen you purchase, order, return, exchange, or request information\r\nabout our services from the Application. [We store only very limited,\r\nif any, financial information that we collect. Otherwise, all\r\nfinancial information is stored by our payment processor,  </font></font><a href=\"https://stripe.com/us/privacy/\"><font color=\"#1155cc\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\"><u>Stripe,</u></font></font></font></a><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">\r\nand you are encouraged to review their privacy policy and contact\r\nthem directly for responses to your questions.</font></font></p>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><br>\r\n</p>\r\n<h2 class=\"western\" style=\"line-height: 115%\"><a name=\"_z0yqukvj8bh9\"></a>\r\nFacebook Permissions  \r\n</h2>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">The\r\nApplication may by default access your </font></font><a href=\"https://www.facebook.com/about/privacy/\"><font color=\"#1155cc\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\"><u>Facebook</u></font></font></font></a><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">\r\nbasic account information, including your name, email, gender,\r\nbirthday, current city, and profile picture URL, as well as other\r\ninformation that you choose to make public. We may also request\r\naccess to other permissions related to your account, such as friends,\r\ncheckins, and likes, and you may choose to grant or deny us access to\r\neach individual permission. For more information regarding Facebook\r\npermissions, refer to the </font></font><a href=\"https://developers.facebook.com/docs/facebook-login/permissions\"><font color=\"#1155cc\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\"><u>Facebook\r\nPermissions Reference </u></font></font></font></a><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">page.</font></font></p>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><br>\r\n</p>\r\n<h2 class=\"western\" style=\"line-height: 115%\"><a name=\"_64xreagpas2f\"></a>\r\nData from Social Networks  \r\n</h2>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">User\r\ninformation from social networking sites, such as Facebook, Google,\r\nincluding your name, your social network username, location, gender,\r\nbirth date, email address, profile picture, and public data for\r\ncontacts, if you connect your account to such social networks. This\r\ninformation may also include the contact information of anyone you\r\ninvite to use and/or join the Application.</font></font></p>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><br>\r\n</p>\r\n<h2 class=\"western\" style=\"line-height: 115%\"><a name=\"_1wgqc2u1087n\"></a>\r\nGeo-Location Information \r\n</h2>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\"><span style=\"background: #ffffff\">We\r\nmay request access or permission to and track location-based\r\ninformation from your mobile device, either continuously or while you\r\nare using the Application, to provide location-based services. If you\r\nwish to change our access or permissions, you may do so in your\r\ndevice’s settings.</span></font></font></p>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><br>\r\n</p>\r\n<h2 class=\"western\" style=\"line-height: 115%\"><a name=\"_ohf32362ce60\"></a>\r\nMobile Device Access \r\n</h2>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">We\r\nmay request access or permission to certain features from your mobile\r\ndevice, including your mobile device’s [bluetooth, calendar,\r\ncamera, contacts, microphone, reminders, sensors, SMS messages,\r\nsocial media accounts, storage,] and other features. </font></font><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\"><span style=\"background: #ffffff\">If\r\nyou wish to change our access or permissions, you may do so in your\r\ndevice’s settings.</span></font></font></p>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><br>\r\n</p>\r\n<h2 class=\"western\" style=\"line-height: 115%\"><a name=\"_4iy4n37v9m63\"></a>\r\nMobile Device Data \r\n</h2>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">Device\r\ninformation such as your mobile device ID number, model, and\r\nmanufacturer, version of your operating system, phone number,\r\ncountry, location, and any other data you choose to provide.</font></font></p>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><br>\r\n</p>\r\n<h2 class=\"western\" style=\"line-height: 115%\"><a name=\"_z2mmqno9ju37\"></a>\r\nPush Notifications \r\n</h2>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">We\r\nmay request to send you push notifications regarding your account or\r\nthe Application. If you wish to opt-out from receiving these types of\r\ncommunications, you may turn them off in your device’s settings.</font></font></p>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><br>\r\n</p>\r\n<h2 class=\"western\" style=\"line-height: 115%\"><a name=\"_urn7verkgc6k\"></a>\r\nThird-Party Data \r\n</h2>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">Information\r\nfrom third parties, such as personal information or network friends,\r\nif you connect your account to the third party and grant the\r\nApplication permission to access this information.</font></font></p>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><br>\r\n</p>\r\n<h2 class=\"western\" style=\"line-height: 115%\"><a name=\"_b8ijir46a2b\"></a>\r\nData From Contests, Giveaways, and Surveys \r\n</h2>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">Personal\r\nand other information you may provide when entering contests or\r\ngiveaways and/or responding to surveys.</font></font></p>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><br>\r\n</p>\r\n<h1 class=\"western\" style=\"line-height: 115%\"><a name=\"_v2uc2vjvvxe1\"></a>\r\nUSE OF YOUR INFORMATION</h1>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">Having\r\naccurate information about you permits us to provide you with a\r\nsmooth, efficient, and customized experience.  Specifically, we may\r\nuse information collected about you via the Application to: </font></font>\r\n</p>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><br>\r\n</p>\r\n<ol><li><p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">Administer\r\n	sweepstakes, promotions, and contests. </font></font>\r\n	</p>\r\n	</li><li><p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">Assist\r\n	law enforcement and respond to subpoena.</font></font></p>\r\n	</li><li><p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">Compile\r\n	anonymous statistical data and analysis for use internally or with\r\n	third parties. </font></font>\r\n	</p>\r\n	</li><li><p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">Create\r\n	and manage your account.</font></font></p>\r\n	</li><li><p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">Deliver\r\n	targeted advertising, coupons, newsletters, and other information\r\n	regarding promotions and the Application to you. </font></font>\r\n	</p>\r\n	</li><li><p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">Email\r\n	you regarding your account or order.</font></font></p>\r\n	</li><li><p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">Enable\r\n	user-to-user communications.</font></font></p>\r\n	</li><li><p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">Fulfill\r\n	and manage purchases, orders, payments, and other transactions\r\n	related to the Application.</font></font></p>\r\n	</li><li><p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">Generate\r\n	a personal profile about you to make future visits to the\r\n	Application more personalized.</font></font></p>\r\n	</li><li><p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">Increase\r\n	the efficiency and operation of the Application.</font></font></p>\r\n	</li><li><p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">Monitor\r\n	and analyze usage and trends to improve your experience with the\r\n	Application.</font></font></p>\r\n	</li><li><p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">Notify\r\n	you of updates to the Application.</font></font></p>\r\n	</li><li><p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">Offer\r\n	new products, services, mobile applications, and/or recommendations\r\n	to you.</font></font></p>\r\n	</li><li><p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">Perform\r\n	other business activities as needed.</font></font></p>\r\n	</li><li><p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">Prevent\r\n	fraudulent transactions, monitor against theft, and protect against\r\n	criminal activity.</font></font></p>\r\n	</li><li><p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">Process\r\n	payments and refunds.</font></font></p>\r\n	</li><li><p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">Request\r\n	feedback and contact you about your use of the Application. </font></font>\r\n	</p>\r\n	</li><li><p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">Resolve\r\n	disputes and troubleshoot problems.</font></font></p>\r\n	</li><li><p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">Respond\r\n	to product and customer service requests.</font></font></p>\r\n	</li><li><p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">Send\r\n	you a newsletter.</font></font></p>\r\n	</li><li><p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">Solicit\r\n	support for the Application.</font></font></p>\r\n</li></ol>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><br>\r\n</p>\r\n<h1 class=\"western\" style=\"line-height: 115%\"><a name=\"_klddry1k9fe6\"></a>\r\nDISCLOSURE OF YOUR INFORMATION</h1>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">We\r\nmay share information we have collected about you in certain\r\nsituations. Your information may be disclosed as follows: </font></font>\r\n</p>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><br>\r\n</p>\r\n<h2 class=\"western\" style=\"line-height: 115%\"><a name=\"_wmqiyk8z1ifq\"></a>\r\nBy Law or to Protect Rights \r\n</h2>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">If\r\nwe believe the release of information about you is necessary to\r\nrespond to legal process, to investigate or remedy potential\r\nviolations of our policies, or to protect the rights, property, and\r\nsafety of others, we may share your information as permitted or\r\nrequired by any applicable law, rule, or regulation.  This includes\r\nexchanging information with other entities for fraud protection and\r\ncredit risk reduction.</font></font></p>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><br>\r\n</p>\r\n<h2 class=\"western\" style=\"line-height: 115%\"><a name=\"_fae8kjk8qmdd\"></a>\r\nThird-Party Service Providers \r\n</h2>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">We\r\nmay share your information with third parties that perform services\r\nfor us or on our behalf, including payment processing, data analysis,\r\nemail delivery, hosting services, customer service, and marketing\r\nassistance.  </font></font>\r\n</p>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><br>\r\n</p>\r\n<h2 class=\"western\" style=\"line-height: 115%\"><a name=\"_m891eoq353db\"></a>\r\nMarketing Communications</h2>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">With\r\nyour consent, or with an opportunity for you to withdraw consent, we\r\nmay share your information with third parties for marketing purposes,\r\nas permitted by law.</font></font></p>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><br>\r\n</p>\r\n<h2 class=\"western\" style=\"line-height: 115%\"><a name=\"_1g4s611s98t6\"></a>\r\nInteractions with Other Users \r\n</h2>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">If\r\nyou interact with other users of the Application, those users may see\r\nyour name, profile photo, and descriptions of your activity,\r\nincluding sending invitations to other users, chatting with other\r\nusers, liking posts, following blogs. </font></font>\r\n</p>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><br>\r\n</p>\r\n<h2 class=\"western\" style=\"line-height: 115%\"><a name=\"_qni5gjh20gty\"></a>\r\nOnline Postings</h2>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">When\r\nyou post comments, contributions or other content to the\r\nApplications, your posts may be viewed by all users and may be\r\npublicly distributed outside the Application in perpetuity</font></font></p>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><br>\r\n</p>\r\n<h2 class=\"western\" style=\"line-height: 115%\"><a name=\"_w1o99isgvu3t\"></a>\r\nThird-Party Advertisers \r\n</h2>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">We\r\nmay use third-party advertising companies to serve ads when you visit\r\nthe Application. These companies may use information about your\r\nvisits to the Application and other websites that are contained in\r\nweb cookies in order to provide advertisements about goods and\r\nservices of interest to you. </font></font>\r\n</p>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><a name=\"_wvhkv7isu1op\"></a>\r\n<br>\r\n</p>\r\n<h2 class=\"western\" style=\"line-height: 115%\"><a name=\"_dpeckra1seq2\"></a>\r\nAffiliates \r\n</h2>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">We\r\nmay share your information with our affiliates, in which case we will\r\nrequire those affiliates to honor this Privacy Policy. Affiliates\r\ninclude our parent company and any subsidiaries, joint venture\r\npartners or other companies that we control or that are under common\r\ncontrol with us.</font></font></p>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><br>\r\n</p>\r\n<h2 class=\"western\" style=\"line-height: 115%\"><a name=\"_mlwpc7lo5h0z\"></a>\r\nBusiness Partners \r\n</h2>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">We\r\nmay share your information with our business partners to offer you\r\ncertain products, services or promotions. </font></font>\r\n</p>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><br>\r\n</p>\r\n<h2 class=\"western\" style=\"line-height: 115%\"><a name=\"_kloybglpsxbm\"></a>\r\nOffer Wall  \r\n</h2>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><a name=\"_mn9wp5k3v2vz\"></a>\r\n<font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">The\r\nApplication may display a third-party-hosted “offer wall.”  Such\r\nan offer wall allows third-party advertisers to offer virtual\r\ncurrency, gifts, or other items to users in return for acceptance and\r\ncompletion of an advertisement offer.  Such an offer wall may appear\r\nin the Application and be displayed to you based on certain data,\r\nsuch as your geographic area or demographic information.  When you\r\nclick on an offer wall, you will leave the Application.  A unique\r\nidentifier, such as your user ID, will be shared with the offer wall\r\nprovider in order to prevent fraud and properly credit your account. \r\n</font></font><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\"><b>\r\n </b></font></font>\r\n</p>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><br>\r\n</p>\r\n<h2 class=\"western\" style=\"line-height: 115%\"><a name=\"_1b3lbtrwlnlf\"></a>\r\nSocial Media Contacts  \r\n</h2>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">If\r\nyou connect to the Application through a social network, your\r\ncontacts on the social network will see your name, profile photo, and\r\ndescriptions of your activity.</font></font></p>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><br>\r\n</p>\r\n<h2 class=\"western\" style=\"line-height: 115%\"><a name=\"_j770ddi8r35t\"></a>\r\nOther Third Parties</h2>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">We\r\nmay share your information with advertisers and investors for the\r\npurpose of conducting general business analysis. We may also share\r\nyour information with such third parties for marketing purposes, as\r\npermitted by law. </font></font>\r\n</p>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><br>\r\n</p>\r\n<h2 class=\"western\" style=\"line-height: 115%\"><a name=\"_gfgj94limquo\"></a>\r\nSale or Bankruptcy \r\n</h2>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">If\r\nwe reorganize or sell all or a portion of our assets, undergo a\r\nmerger, or are acquired by another entity, we may transfer your\r\ninformation to the successor entity.  If we go out of business or\r\nenter bankruptcy, your information would be an asset transferred or\r\nacquired by a third party.  You acknowledge that such transfers may\r\noccur and that the transferee may decline honor commitments we made\r\nin this Privacy Policy. </font></font>\r\n</p>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><br>\r\n</p>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">We\r\nare not responsible for the actions of third parties with whom you\r\nshare personal or sensitive data, and we have no authority to manage\r\nor control third-party solicitations.  If you no longer wish to\r\nreceive correspondence, emails or other communications from third\r\nparties, you are responsible for contacting the third party directly.</font></font></p><p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\"><br></font></font></p><h1 class=\"western\" style=\"line-height: 115%\">TRACKING TECHNOLOGIES</h1>\r\n<h2 class=\"western\" style=\"line-height: 115%\"><a name=\"_56emerdysgpo\"></a>\r\nCookies and Web Beacons</h2>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">We\r\nmay use cookies, web beacons, tracking pixels, and other tracking\r\ntechnologies on the Application to help customize the Application and\r\nimprove your experience. When you access the Application, your\r\npersonal information is not collected through the use of tracking\r\ntechnology. Most browsers are set to accept cookies by default. You\r\ncan remove or reject cookies, but be aware that such action could\r\naffect the availability and functionality of the Application. You may\r\nnot decline web beacons. However, they can be rendered ineffective by\r\ndeclining all cookies or by modifying your web browser’s settings\r\nto notify you each time a cookie is tendered, permitting you to\r\naccept or decline cookies on an individual basis.</font></font></p>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><br>\r\n</p>\r\n<h2 class=\"western\" style=\"line-height: 115%\"><a name=\"_4fc8mj1uajxp\"></a>\r\nInternet-Based Advertising</h2>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">Additionally,\r\nwe may use third-party software to serve ads on the Application,\r\nimplement email marketing campaigns, and manage other interactive\r\nmarketing initiatives.  This third-party software may use cookies or\r\nsimilar tracking technology to help manage and optimize your online\r\nexperience with us.  For more information about opting-out of\r\ninterest-based ads, visit the </font></font><a href=\"http://www.networkadvertising.org/choices/\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\"><u>Network\r\nAdvertising Initiative Opt-Out Tool</u></font></font></a><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">\r\nor </font></font><a href=\"http://www.aboutads.info/choices/\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\"><u>Digital\r\nAdvertising Alliance Opt-Out Tool</u></font></font></a><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">.</font></font></p>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><br>\r\n</p>\r\n<h2 class=\"western\" style=\"line-height: 115%\"><a name=\"_n6oeggdkjcgr\"></a>\r\nWebsite Analytics \r\n</h2>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">We\r\nmay also partner with selected third-party vendors[, such as </font></font><a href=\"https://support.google.com/analytics/answer/6004245?hl=en\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\"><u>Google\r\nAnalytics</u></font></font></a><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">\r\nand others, to allow tracking technologies and remarketing services\r\non the Application through the use of first party cookies and\r\nthird-party cookies, to, among other things, analyze and track users’\r\nuse of the Application, determine the popularity of certain content,\r\nand better understand online activity. By accessing the Application,\r\nyou consent to the collection and use of your information by these\r\nthird-party vendors. You are encouraged to review their privacy\r\npolicy and contact them directly for responses to your questions. We\r\ndo not transfer personal information to these third-party vendors.\r\nHowever, if you do not want any information to be collected and used\r\nby tracking technologies, you can install and/or update your settings\r\nfor one of the following: </font></font>\r\n</p>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><a href=\"https://tools.google.com/dlpage/gaoptout/\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\"><u>Google\r\nAnalytics Opt-Out Plugin</u></font></font></a><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">\r\n</font></font>\r\n</p>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><a href=\"https://www.google.com/settings/u/0/ads/authenticated?hl=en\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\"><u>Google\r\nAds Settings Page</u></font></font></a></p>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><a href=\"http://www.networkadvertising.org/choices/\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\"><u>Network\r\nAdvertising Initiative Opt-Out Tool</u></font></font></a><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">\r\n</font></font>\r\n</p>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><br>\r\n</p>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">You\r\nshould be aware that getting a new computer, installing a new\r\nbrowser, upgrading an existing browser, or erasing or otherwise\r\naltering your browser’s cookies files may also clear certain\r\nopt-out cookies, plug-ins, or settings.</font></font></p>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><br>\r\n</p>\r\n<h1 class=\"western\" style=\"line-height: 115%\"><a name=\"_hs1jfy8yvwt0\"></a>\r\nTHIRD-PARTY WEBSITES</h1>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">The\r\nApplication may contain links to third-party websites and\r\napplications of interest, including advertisements and external\r\nservices, that are not affiliated with us. Once you have used these\r\nlinks to leave the Application, any information you provide to these\r\nthird parties is not covered by this Privacy Policy, and we cannot\r\nguarantee the safety and privacy of your information. Before visiting\r\nand providing any information to any third-party websites, you should\r\ninform yourself of the privacy policies and practices (if any) of the\r\nthird party responsible for that website, and should take those steps\r\nnecessary to, in your discretion, protect the privacy of your\r\ninformation. We are not responsible for the content or privacy and\r\nsecurity practices and policies of any third parties, including other\r\nsites, services or applications that may be linked to or from the\r\nApplication.</font></font></p>\r\n<h1 class=\"western\" style=\"line-height: 115%\"><a name=\"_odf08ny3ibiq\"></a>\r\nSECURITY OF YOUR INFORMATION</h1>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">We\r\nuse administrative, technical, and physical security measures to help\r\nprotect your personal information.  While we have taken reasonable\r\nsteps to secure the personal information you provide to us, please be\r\naware that despite our efforts, no security measures are perfect or\r\nimpenetrable, and no method of data transmission can be guaranteed\r\nagainst any interception or other type of misuse.  Any information\r\ndisclosed online is vulnerable to interception and misuse by\r\nunauthorized parties.  Therefore, we cannot guarantee complete\r\nsecurity if you provide personal information.</font></font></p>\r\n<h1 class=\"western\" style=\"line-height: 115%\" align=\"LEFT\"><a name=\"_fnsu8nbgwwh0\"></a>\r\nPOLICY FOR CHILDREN</h1>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">We\r\ndo not knowingly solicit information from or market to children under\r\nthe age of 13. If you become aware of any data we have collected from\r\nchildren under age 13, please contact us using the contact\r\ninformation provided below. </font></font>\r\n</p>\r\n<h1 class=\"western\"><a name=\"_lchlm3ya7ak\"></a>CONTROLS FOR\r\nDO-NOT-TRACK FEATURES  \r\n</h1>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">Most\r\nweb browsers and some mobile operating systems [and our mobile\r\napplications] include a Do-Not-Track (“DNT”) feature or setting\r\nyou can activate to signal your privacy preference not to have data\r\nabout your online browsing activities monitored and collected.  No\r\nuniform technology standard for recognizing and implementing DNT\r\nsignals has been finalized. As such, we do not currently respond to\r\nDNT browser signals or any other mechanism that automatically\r\ncommunicates your choice not to be tracked online.  If a standard for\r\nonline tracking is adopted that we must follow in the future, we will\r\ninform you about that practice in a revised version of this Privacy\r\nPolicy.  </font></font>\r\n</p>\r\n<h1 class=\"western\" style=\"line-height: 115%\"><a name=\"_oynxufe0hy32\"></a>\r\nOPTIONS REGARDING YOUR INFORMATION</h1>\r\n<h2 class=\"western\" style=\"line-height: 115%\">Account Information</h2>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">You\r\nmay at any time review or change the information in your account or\r\nterminate your account by:</font></font></p>\r\n<ul><li><p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">Logging\r\n	into your account settings and updating your account</font></font></p>\r\n	</li><li><p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">Contacting\r\n	us using the contact information provided below</font></font></p>\r\n	\r\n</li></ul>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">Upon\r\nyour request to terminate your account, we will deactivate or delete\r\nyour account and information from our active databases. However, some\r\ninformation may be retained in our files to prevent fraud,\r\ntroubleshoot problems, assist with any investigations, enforce our\r\nTerms of Use and/or comply with legal requirements.</font></font></p>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><br>\r\n</p>\r\n<h2 class=\"western\" style=\"line-height: 115%\"><a name=\"_3mc89ff9i0fu\"></a>\r\nEmails and Communications</h2>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">If\r\nyou no longer wish to receive correspondence, emails, or other\r\ncommunications from us, you may opt-out by:</font></font></p>\r\n<ul><li><p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">Noting\r\n	your preferences at the time you register your account with the\r\n	Application</font></font></p>\r\n	</li><li><p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">Logging\r\n	into your account settings and updating your preferences.</font></font></p>\r\n	</li><li><p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">Contacting\r\n	us using the contact information provided below</font></font></p>\r\n</li></ul>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">If\r\nyou no longer wish to receive correspondence, emails, or other\r\ncommunications from third parties, you are responsible for contacting\r\nthe third party directly. </font></font>\r\n</p>\r\n<h1 class=\"western\" style=\"line-height: 115%\"><a name=\"_1na8btj6bp4l\"></a>\r\nCALIFORNIA PRIVACY RIGHTS</h1>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">California\r\nCivil Code Section 1798.83, also known as the “Shine The Light”\r\nlaw, permits our users who are California residents to request and\r\nobtain from us, once a year and free of charge, information about\r\ncategories of personal information (if any) we disclosed to third\r\nparties for direct marketing purposes and the names and addresses of\r\nall third parties with which we shared personal information in the\r\nimmediately preceding calendar year. If you are a California resident\r\nand would like to make such a request, please submit your request in\r\nwriting to us using the contact information provided below.</font></font></p>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><br>\r\n</p>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">If\r\nyou are under 18 years of age, reside in California, and have a\r\nregistered account with the Application, you have the right to\r\nrequest removal of unwanted data that you publicly post on the\r\nApplication. To request removal of such data, please contact us using\r\nthe contact information provided below, and include the email address\r\nassociated with your account and a statement that you reside in\r\nCalifornia.  We will make sure the data is not publicly displayed on\r\nthe Application, but please be aware that the data may not be\r\ncompletely or comprehensively removed from our systems.</font></font></p>\r\n<h1 class=\"western\" style=\"line-height: 115%\" align=\"LEFT\"><a name=\"_v07gykoweind\"></a>\r\nCONTACT US</h1>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt\" size=\"2\">If\r\nyou have questions or comments about this Privacy Policy, please\r\ncontact us at:</font></font></p>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><br>\r\n</p>\r\n<p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;;\r\nmso-fareast-font-family:Calibri;mso-fareast-theme-font:minor-latin;mso-ansi-language:\r\nEN-IN;mso-fareast-language:EN-IN;mso-bidi-language:AR-SA\">info@lifecanon.com</span><br></p><p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><span style=\"font-size: 14.6667px;\"><br></span></font></p><p style=\"margin-bottom: 0in; line-height: 115%\" align=\"JUSTIFY\"><font face=\"Arial, serif\"><span style=\"font-size: 14.6667px;\"><br></span></font></p>', '1', '2021-05-20 23:47:20', '2021-10-28 18:07:48', NULL),
(3, 'About Us', 'about-us', NULL, NULL, '<h2 style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"></h2><h3 style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;\"></h3><blockquote><p><span lang=\"EN-US\" style=\"font-weight: normal; font-family: Arial;\">Hello, my name is Poul and I’m a certified Life, Health, and Nutrition coach.&nbsp; After 20 years of holistic living and helping friends and loved ones with their health and life, I decided to get certified and do this for a living.&nbsp; While coaching I discovered my once-a-week client sessions wasn’t as effective as I wanted it to be.&nbsp; I knew my clients could benefit more if there was a daily connection and accountability.&nbsp; Though I have a business degree I know that many of you do not and that may hinder your growth potential.&nbsp; That is why I integrate coaching tools with, organization and bookkeeping in one app.</span></p></blockquote><blockquote><p><span style=\"font-size: 1rem; font-family: Arial;\">In this app, coaches and clients can interact during a session or during the week.&nbsp; Together they can set up goals and accomplish each goal with Habit changes.&nbsp; All of this can be monitored in real time by the coach, including journaling and notes. You can even send a word of encouragement addressing their progress right in the app.&nbsp; Easy auto pay set up for clients and coaches makes bookkeeping a snap.&nbsp; Transition from the struggle of managing 2-4 clients to easily handle 20+ clients all in one location.&nbsp;&nbsp;</span><span style=\"font-size: 1rem; color: rgb(0, 176, 240); font-family: Arial;\">Coaching doesn’t need to be complicated.&nbsp; The main thing is to stay on the same page with your client.&nbsp; Listen to them, find the why beneath the why, then supporting their goals with monitored habit changes.&nbsp; They don’t need to go fast as much as they need accountability and encouragement.</span><span style=\"font-size: 1rem; font-family: Arial;\">&nbsp;</span></p></blockquote><p><span style=\"font-size: 1rem; font-family: Arial;\">I am committed to listening to all your comments and updating my application to meet and exceed your needs as a coach.&nbsp; As we grow together this app will become more and more powerful.&nbsp; I only ask that you start learning the basics now, so new updates are not overwhelming.&nbsp; Some apps start off so complicated that users give up.&nbsp; My goal is to help you the beginner with all your set up and then move into better features.&nbsp; Believe me when I say I want this app to help grow your business and I am willing to put the time and money into this to make sure&nbsp;</span><span style=\"font-size: 1rem; color: rgb(0, 176, 80); font-family: Arial;\">Life Canon</span><span style=\"font-size: 1rem; color: rgb(0, 176, 80); font-family: Arial;\">&nbsp;</span><span style=\"font-size: 1rem; font-family: Arial;\">can meet your needs.</span><br></p><p><span lang=\"EN-US\" style=\"font-size: 1rem; color: black; font-family: Arial;\">DOWNLOAD&nbsp;</span><span lang=\"EN-US\" style=\"font-size: 1rem; color: rgb(0, 176, 80); font-family: Arial;\"><b>Life Canon</b></span><span lang=\"EN-US\" style=\"font-size: 1rem; color: rgb(0, 176, 80); font-family: Arial;\">&nbsp;</span><span lang=\"EN-US\" style=\"font-size: 1rem; color: black; font-family: Arial;\">today and take control of your future!</span><br></p><p></p><p></p>', '1', '2021-05-20 23:47:53', '2021-10-27 00:54:51', NULL),
(4, 'Help', 'help', 'help', 'help', '<p align=\"JUSTIFY\" style=\"text-align: center; margin-bottom: 0in; font-size: 16px; line-height: 18.4px;\"><font face=\"Arial, serif\"><font style=\"font-size: 11pt;\">If you have questions, please contact us at:</font></font></p><p align=\"JUSTIFY\" style=\"margin-bottom: 0in; font-size: 16px; line-height: 18.4px;\"><br></p><p align=\"JUSTIFY\" style=\"text-align: center; margin-bottom: 0in; font-size: 16px; line-height: 18.4px;\"><span style=\"font-family: &quot;Times New Roman&quot;, serif; text-align: justify;\">info@lifecanon.com</span><br></p><p></p>', '1', '2021-10-14 15:47:00', '2021-10-30 18:55:54', NULL),
(5, 'Stripe Setup', 'stripe-setup', 'Stripe Setup', 'Stripe Setup', '<p><b>How to setup Stripe?</b><br><br>Follow the below steps to complete the Stripe setup to receive payments from your clients:<br><br>Step 1 – Visit <a href=\"https://stripe.com\" target=\"_blank\">https://stripe.com</a> website and setup your account.</p><p><br>Step 2- Go to your dashboard and find the “Publishable key” and Secret key..</p>', '1', '2021-10-26 13:48:15', '2021-10-26 13:49:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` double NOT NULL,
  `transaction_id` longtext,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0 for failed and 1 for success',
  `payment_for` int(11) NOT NULL DEFAULT '1' COMMENT '1 for coach plan and 2 for client add and 3 for client payment and 4 for appointment 5 for reInstateClient and 6 for verify stripe',
  `payment_date` datetime DEFAULT NULL,
  `payee_id` int(11) DEFAULT NULL COMMENT 'recieving id of a user/coach',
  `subscription_id` longtext,
  `subscription_status` int(11) DEFAULT NULL COMMENT '0 for disabled 1 for enabled',
  `added_client_id` int(11) DEFAULT NULL COMMENT 'for add or reinstate client',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `user_id`, `amount`, `transaction_id`, `status`, `payment_for`, `payment_date`, `payee_id`, `subscription_id`, `subscription_status`, `added_client_id`, `created_at`, `updated_at`) VALUES
(1, 73, 99.99, NULL, 1, 1, '2021-10-27 12:31:36', NULL, 'sub_1Jp68iIFwORoVejtcr7zyyu7', NULL, NULL, '2021-10-27 19:31:38', '2021-10-27 19:31:38'),
(2, 73, 1, 'txn_3Jp6KUApyRfvyTEw1H1Lzhor', 1, 6, '2021-10-27 12:43:46', NULL, NULL, NULL, NULL, '2021-10-27 19:43:47', '2021-10-27 19:43:47'),
(3, 73, 8, NULL, 1, 2, '2021-10-27 12:44:45', NULL, 'sub_1Jp6LSIFwORoVejtqU5BM2oF', 0, 1, '2021-10-27 19:44:48', '2021-10-27 21:17:59'),
(4, 74, 150, 'txn_3Jp6N9ApyRfvyTEw0ErpTOyr', 1, 3, '2021-10-27 12:46:31', 73, NULL, NULL, NULL, '2021-10-27 19:46:32', '2021-10-27 19:46:32'),
(5, 74, 100, NULL, 1, 4, '2021-10-27 12:49:13', 73, 'sub_1Jp6PlApyRfvyTEwVkHSe6Fl', 0, NULL, '2021-10-27 19:49:15', '2021-10-28 04:54:21'),
(6, 74, 100, 'txn_3Jp6QNApyRfvyTEw1kvUbdtW', 1, 4, '2021-10-27 12:49:51', 73, NULL, NULL, NULL, '2021-10-27 19:49:52', '2021-10-27 19:49:52'),
(7, 73, 8, NULL, 1, 2, '2021-10-27 14:09:15', NULL, 'sub_1Jp7fDIFwORoVejtBhdoKuRq', 0, 2, '2021-10-27 21:09:17', '2021-10-27 21:16:19'),
(8, 73, 8, NULL, 1, 5, '2021-10-27 14:26:15', NULL, 'sub_1Jp7vfIFwORoVejtJrlYuGcs', 0, NULL, '2021-10-27 21:26:17', '2021-10-27 21:26:54'),
(9, 73, 8, NULL, 1, 5, '2021-10-27 14:30:16', NULL, 'sub_1Jp7zYIFwORoVejtFWEIWexg', NULL, NULL, '2021-10-27 21:30:18', '2021-10-27 21:30:18'),
(10, 73, 8, NULL, 1, 2, '2021-10-27 21:21:45', NULL, 'sub_1JpEPlIFwORoVejthgIn4Uow', NULL, 3, '2021-10-28 04:21:48', '2021-10-28 04:21:48'),
(11, 74, 100, 'txn_3JpEyyApyRfvyTEw0F6xNYXC', 1, 4, '2021-10-27 21:58:08', 73, NULL, NULL, NULL, '2021-10-28 04:58:09', '2021-10-28 04:58:09'),
(12, 74, 100, 'txn_3JpF3GApyRfvyTEw14ITynF4', 1, 4, '2021-10-27 22:02:34', 73, NULL, NULL, NULL, '2021-10-28 05:02:35', '2021-10-28 05:02:35'),
(13, 74, 100, 'txn_3JpRMyApyRfvyTEw0GOqkPHe', 1, 4, '2021-10-28 11:11:44', 73, NULL, NULL, NULL, '2021-10-28 18:11:46', '2021-10-28 18:11:46'),
(14, 74, 100, 'txn_3JpU4HApyRfvyTEw1VANDw3i', 1, 4, '2021-10-28 14:04:37', 73, NULL, NULL, NULL, '2021-10-28 21:04:38', '2021-10-28 21:04:38'),
(15, 74, 100, NULL, 1, 4, '2021-10-29 10:33:20', 73, 'sub_1JpnFMApyRfvyTEwO2Fy1SMe', NULL, NULL, '2021-10-29 17:33:22', '2021-10-29 17:33:22'),
(16, 74, 100, 'txn_3JpnlhApyRfvyTEw0sZhQWec', 1, 4, '2021-10-29 11:06:45', 73, NULL, NULL, NULL, '2021-10-29 18:06:46', '2021-10-29 18:06:46'),
(17, 74, 100, 'txn_3Jpns4ApyRfvyTEw0UdpB0l9', 1, 4, '2021-10-29 11:13:20', 73, NULL, NULL, NULL, '2021-10-29 18:13:20', '2021-10-29 18:13:20'),
(18, 74, 100, 'txn_3JpolWApyRfvyTEw1k04hySE', 1, 4, '2021-10-29 12:10:38', 73, NULL, NULL, NULL, '2021-10-29 19:10:38', '2021-10-29 19:10:38'),
(19, 74, 100, 'txn_3JpoxxApyRfvyTEw0viY21Gp', 1, 4, '2021-10-29 12:23:29', 73, NULL, NULL, NULL, '2021-10-29 19:23:30', '2021-10-29 19:23:30'),
(20, 74, 100, 'txn_3JprLfApyRfvyTEw14FwlsC8', 1, 4, '2021-10-29 14:56:07', 73, NULL, NULL, NULL, '2021-10-29 21:56:08', '2021-10-29 21:56:08'),
(21, 74, 100, 'txn_3Jqyq5ApyRfvyTEw11cVa5Hz', 1, 4, '2021-11-01 17:08:09', 73, NULL, NULL, NULL, '2021-11-02 00:08:10', '2021-11-02 00:08:10'),
(24, 74, 100, NULL, 1, 4, '2021-11-02 10:49:01', 73, 'sub_1JrFOjApyRfvyTEwencdsnE0', NULL, NULL, '2021-11-02 17:49:03', '2021-11-02 17:49:03'),
(25, 73, 8, NULL, 1, 2, '2021-11-02 12:27:20', NULL, 'sub_1JrGvsIFwORoVejtVQt5Vmio', NULL, 4, '2021-11-02 19:27:22', '2021-11-02 19:27:22'),
(26, 73, 8, NULL, 1, 5, '2021-11-02 12:30:41', NULL, 'sub_1JrGz7IFwORoVejtRIczbU59', NULL, NULL, '2021-11-02 19:30:43', '2021-11-02 19:30:43'),
(27, 74, 100, NULL, 1, 4, '2021-11-02 14:04:16', 73, 'sub_1JrIRhApyRfvyTEwKH7e7bD7', NULL, NULL, '2021-11-02 21:04:19', '2021-11-02 21:04:19'),
(28, 74, 100, NULL, 1, 4, '2021-11-02 14:18:22', 73, 'sub_1JrIfLApyRfvyTEwVdFmLUGU', NULL, NULL, '2021-11-02 21:18:24', '2021-11-02 21:18:24'),
(29, 74, 100, NULL, 1, 4, '2021-11-02 14:20:51', 73, 'sub_1JrIhkApyRfvyTEwAWCSdnb8', NULL, NULL, '2021-11-02 21:20:54', '2021-11-02 21:20:54'),
(30, 73, 8, NULL, 1, 2, '2021-11-08 15:21:01', NULL, 'sub_1JtUVFIFwORoVejtHbDPPfyY', NULL, 5, '2021-11-08 23:21:04', '2021-11-08 23:21:04'),
(31, 73, 8, NULL, 1, 2, '2021-11-08 17:17:30', NULL, 'sub_1JtWJyIFwORoVejtJS4Hrnig', NULL, 6, '2021-11-09 01:17:32', '2021-11-09 01:17:32'),
(34, 73, 8, NULL, 1, 2, '2021-11-08 17:55:57', NULL, 'sub_1JtWvBIFwORoVejtOA4qXBuW', NULL, 7, '2021-11-09 01:55:59', '2021-11-09 01:55:59'),
(40, 74, 0, NULL, 1, 4, '2021-11-11 07:32:18', 73, 'sub_1JuScJApyRfvyTEwUaR4OzOX', NULL, NULL, '2021-11-11 15:32:20', '2021-11-11 15:32:20'),
(41, 74, 0, NULL, 1, 4, '2021-11-11 21:50:19', 73, 'sub_1Jug0dApyRfvyTEwcTcJ1ug1', 0, NULL, '2021-11-12 05:50:20', '2021-11-12 07:29:30'),
(42, 73, 8, NULL, 1, 2, '2021-11-11 22:07:16', NULL, 'sub_1JugH2IFwORoVejtBSd1Lrxa', NULL, 8, '2021-11-12 06:07:19', '2021-11-12 06:07:19'),
(43, 74, 0, NULL, 1, 4, '2021-11-13 14:19:55', 73, 'sub_1JvHvrApyRfvyTEwOVpOmblr', NULL, NULL, '2021-11-13 22:19:56', '2021-11-13 22:19:56'),
(44, 74, 115, NULL, 1, 4, '2021-11-13 14:30:16', 73, 'sub_1JvI5tApyRfvyTEwtM067hCg', NULL, NULL, '2021-11-13 22:30:19', '2021-11-13 22:30:19'),
(45, 74, 115, 'txn_3JvIL8ApyRfvyTEw0Bkc7tIL', 1, 4, '2021-11-13 14:46:02', 73, NULL, NULL, NULL, '2021-11-13 22:46:03', '2021-11-13 22:46:03'),
(46, 73, 8, NULL, 1, 2, '2021-11-15 12:19:22', NULL, 'sub_1Jvz0IIFwORoVejtdvmrq59d', NULL, 9, '2021-11-15 20:19:24', '2021-11-15 20:19:24'),
(47, 74, 115, NULL, 1, 4, '2021-11-15 12:26:41', 73, 'sub_1Jvz7NApyRfvyTEwFJmY13oT', NULL, NULL, '2021-11-15 20:26:43', '2021-11-15 20:26:43'),
(48, 74, 115, 'txn_3Jw2FnApyRfvyTEw0g904e86', 1, 4, '2021-11-15 15:47:35', 73, NULL, NULL, NULL, '2021-11-15 23:47:37', '2021-11-15 23:47:37'),
(49, 74, 230, 'txn_3Jw2LXApyRfvyTEw10wSlyWT', 1, 4, '2021-11-15 15:53:31', 73, NULL, NULL, NULL, '2021-11-15 23:53:32', '2021-11-15 23:53:32'),
(51, 74, 575, 'txn_3Jw3fFApyRfvyTEw07Q3Kuqp', 1, 4, '2021-11-15 17:17:57', 73, NULL, NULL, NULL, '2021-11-16 01:17:58', '2021-11-16 01:17:58'),
(52, 74, 125, NULL, 1, 3, '2021-11-15 17:48:23', 73, 'sub_1Jw48hApyRfvyTEwNM1t2vtr', NULL, 8, '2021-11-16 01:48:25', '2021-11-16 01:48:25'),
(53, 74, 230, 'txn_3Jw4AqApyRfvyTEw1XftsS2F', 1, 4, '2021-11-15 17:50:36', 73, NULL, NULL, NULL, '2021-11-16 01:50:37', '2021-11-16 01:50:37'),
(54, 73, 8, NULL, 1, 5, '2021-11-16 11:08:56', NULL, 'sub_1JwKNgIFwORoVejtDzTB5QuU', NULL, NULL, '2021-11-16 19:08:58', '2021-11-16 19:08:58'),
(55, 73, 8, NULL, 1, 2, '2021-11-16 22:45:21', NULL, 'sub_1JwVFdIFwORoVejtnS55USCz', NULL, 10, '2021-11-17 06:45:24', '2021-11-17 06:45:24'),
(56, 74, 115, 'txn_3JwVk3ApyRfvyTEw18ntwLwb', 1, 4, '2021-11-16 23:16:47', 73, NULL, NULL, NULL, '2021-11-17 07:16:48', '2021-11-17 07:16:48'),
(57, 74, 115, 'txn_3JwVkGApyRfvyTEw0xMotKTV', 1, 4, '2021-11-16 23:17:00', 73, NULL, NULL, NULL, '2021-11-17 07:17:00', '2021-11-17 07:17:00'),
(59, 74, 115, 'txn_3Jyw7LApyRfvyTEw1palUdhK', 1, 4, '2021-11-23 15:50:51', 73, NULL, NULL, NULL, '2021-11-23 23:50:51', '2021-11-23 23:50:51'),
(60, 74, 575, 'txn_3Jyxy8ApyRfvyTEw1i7NhtbU', 1, 4, '2021-11-23 17:49:28', 73, NULL, NULL, NULL, '2021-11-24 01:49:29', '2021-11-24 01:49:29'),
(61, 74, 115, 'txn_3JyyCsApyRfvyTEw1Zr81VOj', 1, 4, '2021-11-23 18:04:42', 73, NULL, NULL, NULL, '2021-11-24 02:04:43', '2021-11-24 02:04:43'),
(62, 74, 115, 'txn_3JzaNVApyRfvyTEw07NFeOi5', 1, 4, '2021-11-25 10:50:13', 73, NULL, NULL, NULL, '2021-11-25 18:50:14', '2021-11-25 18:50:14'),
(63, 74, 115, 'txn_3JzaQTApyRfvyTEw1q7R1pey', 1, 4, '2021-11-25 10:53:17', 73, NULL, NULL, NULL, '2021-11-25 18:53:18', '2021-11-25 18:53:18'),
(64, 74, 115, 'txn_3JzaS8ApyRfvyTEw0baecmxv', 1, 4, '2021-11-25 10:55:00', 73, NULL, NULL, NULL, '2021-11-25 18:55:01', '2021-11-25 18:55:01'),
(65, 74, 115, 'txn_3JzaTCApyRfvyTEw0buzB1XX', 1, 4, '2021-11-25 10:56:06', 73, NULL, NULL, NULL, '2021-11-25 18:56:07', '2021-11-25 18:56:07'),
(66, 74, 115, 'txn_3JzaUSApyRfvyTEw1QsXR4bg', 1, 4, '2021-11-25 10:57:24', 73, NULL, NULL, NULL, '2021-11-25 18:57:25', '2021-11-25 18:57:25'),
(67, 74, 115, 'txn_3Jzb9gApyRfvyTEw1vzp17kr', 1, 4, '2021-11-25 11:40:00', 73, NULL, NULL, NULL, '2021-11-25 19:40:01', '2021-11-25 19:40:01'),
(68, 74, 115, 'txn_3K7H1zApyRfvyTEw0DEChEK5', 1, 4, '2021-12-16 15:47:47', 73, NULL, NULL, NULL, '2021-12-16 23:47:49', '2021-12-16 23:47:49');

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `content` longtext,
  `price` double(8,2) NOT NULL,
  `save_amount` double(8,2) NOT NULL DEFAULT '0.00',
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`id`, `name`, `content`, `price`, `save_amount`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Monthly', 'test', 9.99, 0.00, 1, '2021-05-12 01:30:00', '2021-05-12 01:30:00'),
(2, 'Yearly', 'test yearly', 99.99, 19.89, 1, '2021-05-12 01:30:00', '2021-05-12 01:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `reminders`
--

CREATE TABLE `reminders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `day` varchar(255) NOT NULL,
  `time` time NOT NULL,
  `details` longtext,
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '0 for disable , 1 for enable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `selected_plans`
--

CREATE TABLE `selected_plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `plan_id` bigint(20) UNSIGNED NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '0 for expire and 1 for not expire',
  `subscription_id` longtext,
  `subscription_status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `selected_plans`
--

INSERT INTO `selected_plans` (`id`, `user_id`, `plan_id`, `start_date`, `end_date`, `status`, `subscription_id`, `subscription_status`, `created_at`, `updated_at`) VALUES
(1, 73, 2, '2021-10-27 12:31:36', '2022-10-27 12:31:36', 1, 'sub_1Jp68iIFwORoVejtcr7zyyu7', 1, '2021-10-27 19:31:38', '2021-10-28 00:07:55');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stripe_keys`
--

CREATE TABLE `stripe_keys` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `secret_key` longtext NOT NULL,
  `published_key` longtext NOT NULL,
  `verified` int(11) NOT NULL DEFAULT '0' COMMENT '0 for not verified , 1 for verified',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0 for disable , 1 for enable',
  `auth_code` longtext,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stripe_keys`
--

INSERT INTO `stripe_keys` (`id`, `user_id`, `secret_key`, `published_key`, `verified`, `status`, `auth_code`, `created_at`, `updated_at`) VALUES
(1, 73, 'sk_test_naDZ8OPFSdo4bYLGTUxKK3uy00bqtI5k9n', 'pk_test_ENoc1j1LyB4b3yDYT7KL5ajG00tEhgTd6v', 1, 1, '5115', '2021-10-27 19:43:25', '2021-11-23 23:28:51');

-- --------------------------------------------------------

--
-- Table structure for table `templates`
--

CREATE TABLE `templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `templates`
--

INSERT INTO `templates` (`id`, `type`, `content`, `status`, `created_at`, `updated_at`) VALUES
(1, '1', '<p>hello {{name}} {{lastname}}<br></p>', 1, '2021-05-04 15:18:21', '2021-05-04 17:31:04'),
(2, '2', '<p>&lt;!DOCTYPE html&gt;<br>&lt;html lang=\"en-US\"&gt;<br>&lt;head&gt;<br>&nbsp;&nbsp;&nbsp; &lt;meta charset=\"utf-8\"&gt;<br>&lt;/head&gt;<br>&lt;body&gt;<br><br>&lt;div&gt;<br>&nbsp;&nbsp;&nbsp; Hi {{name}},<br>&nbsp;&nbsp;&nbsp; &lt;br&gt;<br>&nbsp;&nbsp;&nbsp; Thank you for creating an account with us. Don\'t forget to complete your registration!<br>&nbsp;&nbsp;&nbsp; &lt;br&gt;<br>&nbsp;&nbsp;&nbsp; Please click on the link below or copy it into the address bar of your browser to confirm your email address:<br>&nbsp;&nbsp;&nbsp; &lt;br&gt;<br><br>&nbsp;&nbsp;&nbsp; &lt;a href=\"http://lifecanon.com.nmsrv.com/public/verify-email/{{user_id}}\"&gt;Confirm my email address &lt;/a&gt;<br><br>&nbsp;&nbsp;&nbsp; &lt;br/&gt;<br>&lt;/div&gt;<br><br>&lt;/body&gt;<br>&lt;/html&gt;<br><br></p>', 1, '2021-05-10 17:36:02', '2021-05-10 17:57:23'),
(3, '2', '&lt;!DOCTYPE html&gt;<br>&lt;html&gt;<br>&nbsp;&lt;head&gt;<br>&nbsp; &lt;meta charset=\"utf-8\"&gt;<br>&nbsp; &lt;meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"&gt;<br>&nbsp; &lt;meta name=\"viewport\" content=\"width=device-width, initial-scale=1\"&gt;<br>&nbsp; &lt;meta name=\"description\" content=\"\"&gt;<br>&nbsp; &lt;meta name=\"author\" content=\"\"&gt;<br>&nbsp;<br>&nbsp; &lt;title&gt;&lt;/title&gt;<br>&nbsp; &nbsp;<br>&nbsp;&lt;/head&gt;<br>&lt;body&gt;<br><br>&lt;div style=\"background-image:url(https://lifecanon.com.nmsrv.com/public/admin_assets/img/brand/bg.png); background-position:top center; background-size:cover; font-family:Arial; margin:0 auto; padding:50px 0; text-align:center; width:800px;\"&gt;<br>&nbsp;&lt;div style=\"background-color:#fff; border-radius:5px; margin:0 auto 40px; padding:0 18px 50px; text-align:left; width:370px;\"&gt;<br>&nbsp; &lt;a href=\"#\"&gt;&lt;img style=\"margin:-22px 0 0; width:45px;\" src=\"https://lifecanon.com.nmsrv.com/public/admin_assets/img/brand/logo1.png\"&gt;&lt;/a&gt;<br>&nbsp; &lt;h3 style=\"color:#000; font-size:24px; margin:30px 0 15px;\"&gt;Welcome to Life Canon,&lt;/h3&gt;<br>&nbsp; &lt;p style=\"color:#40507a; font-size:12px; font-weight:600; margin:0 0 12px;\"&gt;You’re receiving this message because you recently signed up for a Life Canon account.Confirm your email address by clicking the button below. This step adds extra security to your business by verifying you own this email&lt;/p&gt;<br>&nbsp; &lt;p style=\"color:#40507a; font-size:12px; font-weight:600; margin:0 0 20px;\"&gt;Let’s get you a new one!&lt;/p&gt;<br>&nbsp; &lt;a href=\"http://lifecanon.com.nmsrv.com/public/verify-email/{{user_id}}\" style=\"background-color:#000; border:none; border-radius:6px; color:#fff; font-size:12px; padding:8px 16px; text-transform:capitalize;\"&gt;Confirm Email&lt;/a&gt;<br>&nbsp;<br>&nbsp;&lt;/div&gt;<br>&nbsp;&lt;div&gt;&lt;a href=\"#\"&gt;&lt;img style=\"margin:0 0 22px; width:35px;\" src=\"https://lifecanon.com.nmsrv.com/public/admin_assets/img/brand/logo1.png\"&gt;&lt;/a&gt;&lt;/div&gt;<br>&nbsp;&lt;a href=\"#\"&gt;&lt;img style=\"margin-right:8px;\" src=\"https://lifecanon.com.nmsrv.com/public/admin_assets/img/brand/ins.png\"&gt;&lt;/a&gt;<br>&nbsp;&lt;a href=\"#\"&gt;&lt;img src=\"https://lifecanon.com.nmsrv.com/public/admin_assets/img/brand/twit.png\"&gt;&lt;/a&gt;<br><br>&nbsp;&lt;p style=\"color:#97a2da; font-size:11px; margin:0;\"&gt;This link will expire in the next 24 hours.&lt;/p&gt;<br>&nbsp;&lt;p style=\"color:#97a2da; font-size:11px; margin:0 0 15px;\"&gt;Please feel free to contact us at info@lifecanon.com.&lt;/p&gt;<br>&nbsp;&lt;p style=\"color:#97a2da; font-size:11px; margin:0;\"&gt;Copyright© 2021 Your Brand.&lt;/p&gt;<br>&lt;/div&gt;<br><br><br>&lt;/body&gt;<br>&lt;/html&gt;', 1, '2021-05-10 18:02:10', '2021-09-28 14:20:00'),
(4, '3', '&lt;!DOCTYPE html&gt;<br>&lt;html&gt;<br>&nbsp;&lt;head&gt;<br>&nbsp; &lt;meta charset=\"utf-8\"&gt;<br>&nbsp; &lt;meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"&gt;<br>&nbsp; &lt;meta name=\"viewport\" content=\"width=device-width, initial-scale=1\"&gt;<br>&nbsp; &lt;meta name=\"description\" content=\"\"&gt;<br>&nbsp; &lt;meta name=\"author\" content=\"\"&gt;<br>&nbsp;<br>&nbsp; &lt;title&gt;&lt;/title&gt;<br>&nbsp; &nbsp;<br>&nbsp;&lt;/head&gt;<br>&lt;body&gt;<br><br>&lt;div style=\"background-image:url(https://lifecanon.com.nmsrv.com/public/admin_assets/img/brand/bg.png); background-position:top center; background-size:cover; font-family:Arial; margin:0 auto; padding:50px 0; text-align:center; width:800px;\"&gt;<br>&nbsp;&lt;div style=\"background-color:#fff; border-radius:5px; margin:0 auto 40px; padding:0 18px 50px; text-align:left; width:370px;\"&gt;<br>&nbsp; &lt;a href=\"#\"&gt;&lt;img style=\"margin:-22px 0 0; width:45px;\" src=\"https://lifecanon.com.nmsrv.com/public/admin_assets/img/brand/logo1.png\"&gt;&lt;/a&gt;<br>&nbsp; &lt;h3 style=\"color:#000; font-size:24px; margin:30px 0 15px;\"&gt;Reset Password,&lt;/h3&gt;<br>&nbsp; &lt;p style=\"color:#40507a; font-size:12px; font-weight:600; margin:0 0 12px;\"&gt;You have recently requested a link to change your password for your Life Canon account.Please click on the button below to reset your password:&lt;/p&gt;<br>&nbsp; &lt;p style=\"color:#40507a; font-size:12px; font-weight:600; margin:0 0 20px;\"&gt;Let’s get you a new one!&lt;/p&gt;<br>&nbsp; &lt;a href=\"http://lifecanon.com.nmsrv.com/public/reset_password/{{user_id}}\"&nbsp; style=\"background-color:#000; border:none; border-radius:6px; color:#fff; font-size:12px; padding:8px 16px; text-transform:capitalize;\"&gt;Reset My Passwod&lt;/a&gt;<br>&nbsp; &lt;p style=\"color:#40507a; font-size:12px; margin:14px 0 0;\"&gt;If you did not request this, please ignore this email. Your account is secured and your password remains unchanged.&lt;/p&gt; &nbsp;<br>&nbsp; &lt;br /&gt;<br>&nbsp;Best Regards, &lt;br /&gt;<br><br>Life Canon team&lt;br /&gt;<br>&nbsp;&lt;/div&gt;<br>&lt;/div&gt;<br><br><br>&lt;/body&gt;<br>&lt;/html&gt;', 1, '2021-05-11 14:25:00', '2021-09-28 14:17:21'),
(5, '4', '&lt;!DOCTYPE html&gt;<br>&lt;html&gt;<br>&nbsp;&lt;head&gt;<br>&nbsp; &lt;meta charset=\"utf-8\"&gt;<br>&nbsp; &lt;meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"&gt;<br>&nbsp; &lt;meta name=\"viewport\" content=\"width=device-width, initial-scale=1\"&gt;<br>&nbsp; &lt;meta name=\"description\" content=\"\"&gt;<br>&nbsp; &lt;meta name=\"author\" content=\"\"&gt;<br>&nbsp;<br>&nbsp; &lt;title&gt;&lt;/title&gt;<br>&nbsp;<br>&nbsp;&lt;/head&gt;<br>&lt;body&gt;<br><br>&lt;div class=\"main\" style=\"background-color:#fff; font-family:Arial; margin:0 auto; padding:30px; text-align:center; width:600px;\"&gt;<br>&nbsp;&lt;img src=\"http://lifecanon.com.nmsrv.com/public/admin_assets/img/logo.png\" width=\"120px\" height=\"120px\"&gt;<br>&nbsp;&lt;div style=\"background-color:#f3f3f3; box-shadow:0 0 4px #ddd; margin:15px 0 0; padding:35px 0;\"&gt;<br>&nbsp;&lt;h3 style=\"color:#000; font-size:28px; margin:35px 0 12px;\"&gt;Stripe Update Request OTP&lt;/h3&gt;<br>&nbsp;&lt;p style=\"color:#333; font-size:16px; line-height:1.5; margin:0 0 28px;\"&gt;{{name}}, OTP is {{otp}}.&lt;/p&gt;<br><br>&lt;/div&gt;<br><br>&lt;/body&gt;<br>&lt;/html&gt;', 1, '2021-07-23 16:43:40', '2021-07-23 16:43:40');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `user_type` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `is_varified` int(11) NOT NULL DEFAULT '0',
  `profile_pic` longtext,
  `remember_token` varchar(100) DEFAULT NULL,
  `stripe_customer_id` longtext,
  `experience` longtext,
  `area_of_expertise` longtext,
  `description` longtext,
  `phone` varchar(255) DEFAULT NULL,
  `appointment_fees` double DEFAULT '100',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `user_type`, `status`, `is_varified`, `profile_pic`, `remember_token`, `stripe_customer_id`, `experience`, `area_of_expertise`, `description`, `phone`, `appointment_fees`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@lifecanon.com', NULL, '$2y$10$WtUyCWSsJ3nqCZVdDni4lOw4bXD/vmzZygW6itGtZo2kHz/dsOQvW', 1, 1, 0, NULL, 'SemqKS9bA0zhFMMbqp33TI6jHRJ1bVJudjmi1iwZt4vVWqDUwrCphpeI0F1W', NULL, NULL, NULL, NULL, NULL, 100, '2021-05-04 15:10:26', '2021-05-04 15:37:57'),
(73, 'Michael Green', 'praveen.singhb680@gmail.com', NULL, '$2y$10$Gj3XJJPLSvNcLIepVx/tz.InF6PrflCoGF61ESKcFXQzgHX1pZShu', 1, 1, 1, '1635318001.jpeg', NULL, '', '12', 'GYM, Aerobics', 'Test Desc.', '986-532-1457', 100, '2021-10-27 19:30:01', '2021-11-08 23:41:58'),
(74, 'Steve Joy', 'ajeet.iquincesoft@gmail.com', NULL, '$2y$10$vxfP1.9sEaEIqti7qch8le/Y1Os3pqQZUjA7L93AYLIJ0tXMP6rXO', 2, 1, 1, '1635318201.jpeg', NULL, '', NULL, NULL, 'Test', '986-532-3256', 0, '2021-10-27 19:33:21', '2021-12-16 23:44:00'),
(81, 'Hodasevich', 'hodasevich.ulia@icloud.com', NULL, '$2y$10$iugCyy.jfQ4GIWWfSi7Kbe9wGWCL4tEQPVO6OCefSJuiom8OWu/AG', 2, 1, 1, '1638893552.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, 100, '2021-12-08 05:42:32', '2021-12-08 05:44:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `add_clients`
--
ALTER TABLE `add_clients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `add_clients_code_unique` (`code`),
  ADD KEY `add_clients_user_id_foreign` (`user_id`);

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appointments_user_id_foreign` (`user_id`),
  ADD KEY `appointments_client_id_foreign` (`client_id`);

--
-- Indexes for table `app_feedback`
--
ALTER TABLE `app_feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_feedback_user_id_foreign` (`user_id`);

--
-- Indexes for table `availabilities`
--
ALTER TABLE `availabilities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `availabilities_user_id_foreign` (`user_id`);

--
-- Indexes for table `chat_rooms`
--
ALTER TABLE `chat_rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_rooms_coach_id_foreign` (`coach_id`),
  ADD KEY `chat_rooms_client_id_foreign` (`client_id`);

--
-- Indexes for table `fcm_tokens`
--
ALTER TABLE `fcm_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fcm_tokens_user_id_foreign` (`user_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `goals`
--
ALTER TABLE `goals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `goals_user_id_foreign` (`user_id`),
  ADD KEY `goals_client_id_foreign` (`client_id`);

--
-- Indexes for table `habits`
--
ALTER TABLE `habits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `habits_user_id_foreign` (`user_id`),
  ADD KEY `habits_client_id_foreign` (`client_id`);

--
-- Indexes for table `habit_items`
--
ALTER TABLE `habit_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `habit_items_habit_id_foreign` (`habit_id`);

--
-- Indexes for table `journals`
--
ALTER TABLE `journals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `journals_user_id_foreign` (`user_id`),
  ADD KEY `journals_client_id_foreign` (`client_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notes_user_id_foreign` (`user_id`),
  ADD KEY `notes_client_id_foreign` (`client_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_user_id_foreign` (`user_id`),
  ADD KEY `notifications_client_id_foreign` (`client_id`),
  ADD KEY `notifications_coach_id_foreign` (`coach_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_user_id_foreign` (`user_id`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reminders`
--
ALTER TABLE `reminders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reminders_client_id_foreign` (`client_id`);

--
-- Indexes for table `selected_plans`
--
ALTER TABLE `selected_plans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `selected_plans_user_id_foreign` (`user_id`),
  ADD KEY `selected_plans_plan_id_foreign` (`plan_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_name_unique` (`name`);

--
-- Indexes for table `stripe_keys`
--
ALTER TABLE `stripe_keys`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stripe_keys_user_id_foreign` (`user_id`);

--
-- Indexes for table `templates`
--
ALTER TABLE `templates`
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
-- AUTO_INCREMENT for table `add_clients`
--
ALTER TABLE `add_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `app_feedback`
--
ALTER TABLE `app_feedback`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `availabilities`
--
ALTER TABLE `availabilities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `chat_rooms`
--
ALTER TABLE `chat_rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `fcm_tokens`
--
ALTER TABLE `fcm_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `goals`
--
ALTER TABLE `goals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `habits`
--
ALTER TABLE `habits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `habit_items`
--
ALTER TABLE `habit_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `journals`
--
ALTER TABLE `journals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reminders`
--
ALTER TABLE `reminders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `selected_plans`
--
ALTER TABLE `selected_plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stripe_keys`
--
ALTER TABLE `stripe_keys`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `templates`
--
ALTER TABLE `templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
