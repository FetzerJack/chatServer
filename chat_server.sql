-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 22, 2020 at 10:51 AM
-- Server version: 5.7.23
-- PHP Version: 7.1.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chat_server`
--

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `username` varchar(16) NOT NULL,
  `message` varchar(512) NOT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `username`, `message`, `time_stamp`) VALUES
(1, 'root', 'sdf', '2019-05-16 19:27:44'),
(2, 'root', 'good', '2019-05-16 19:27:47'),
(3, 'root', 'hello', '2019-05-17 11:23:48'),
(4, 'root', 'I ', '2019-05-17 11:23:49'),
(5, 'root', 'test', '2019-05-17 11:23:51'),
(6, 'root', 'boom', '2019-05-17 11:23:53'),
(7, 'root', 'da', '2019-05-17 11:23:55'),
(8, 'root', 'thing', '2019-05-17 11:23:56'),
(9, 'root', 'text', '2019-05-17 11:23:58'),
(10, 'root', 'stuff', '2019-05-17 11:24:00'),
(11, 'admin', 'hello', '2019-05-17 14:57:09'),
(12, 'jack', '14:01:16  -- jack: I suck', '2019-05-23 18:01:16'),
(13, 'admin', 'test', '2019-05-23 19:02:52'),
(14, 'admin', 'sdf', '2019-05-23 19:03:07'),
(15, 'admin', 'Hi', '2019-05-24 13:12:59'),
(16, 'admin', 'How are you', '2019-05-24 13:13:03'),
(17, 'admin', 'I am splended', '2019-05-24 13:13:07'),
(18, 'admin', 'Awesome', '2019-05-24 13:13:09'),
(19, 'admin', 'Continue with your amazing life', '2019-05-24 13:13:17'),
(20, 'admin', 'test', '2019-05-24 14:49:33'),
(21, 'admin', 'hi', '2019-05-24 14:52:44'),
(22, 'admin', 'hi', '2019-05-24 14:53:02'),
(23, 'admin', 'test', '2019-05-24 14:54:14'),
(24, 'admin', 'test', '2019-05-24 14:54:15'),
(26, 'admin', 'hello', '2019-05-24 14:58:35'),
(27, 'admin', 'saperstein', '2019-05-24 14:58:39'),
(28, 'admin', 'sd', '2019-05-24 14:58:48'),
(29, 'admin', 'f', '2019-05-24 14:58:49'),
(30, 'admin', 'dsf', '2019-05-24 14:58:49'),
(31, 'admin', 'sdf', '2019-05-24 14:58:49'),
(32, 'admin', 'sd', '2019-05-24 14:58:49'),
(33, 'admin', 'f', '2019-05-24 14:58:49'),
(34, 'admin', 'ds', '2019-05-24 14:58:49'),
(35, 'admin', 'sf', '2019-05-24 14:58:49'),
(36, 'admin', 'sd', '2019-05-24 14:58:49'),
(37, 'admin', 'fsdf', '2019-05-24 14:58:50'),
(38, 'admin', 'sd', '2019-05-24 14:58:50'),
(39, 'admin', 'f', '2019-05-24 14:58:50'),
(40, 'admin', 'sdf', '2019-05-24 14:58:50'),
(41, 'admin', 'sd', '2019-05-24 14:58:50'),
(42, 'admin', 'fsd', '2019-05-24 14:58:50'),
(43, 'admin', 'f', '2019-05-24 14:58:50'),
(44, 'admin', 'sf', '2019-05-24 14:58:51'),
(45, 'admin', 'dsf', '2019-05-24 14:58:51'),
(46, 'admin', 'sdfsd', '2019-05-24 14:58:51'),
(47, 'admin', 'fs', '2019-05-24 14:58:51'),
(48, 'admin', 's', '2019-05-24 14:58:51'),
(49, 'admin', 'fds', '2019-05-24 14:58:51'),
(50, 'admin', 'fd', '2019-05-24 14:58:52'),
(51, 'admin', 'sd', '2019-05-24 14:58:52'),
(52, 'admin', 'f', '2019-05-24 14:58:52'),
(53, 'admin', 'sdf', '2019-05-24 14:58:52'),
(54, 'admin', 'sf', '2019-05-24 14:58:52'),
(55, 'admin', 'd', '2019-05-24 14:58:52'),
(56, 'admin', '13:37:28  -- admin: This works. It really works.', '2019-05-25 17:37:28'),
(57, 'admin', 'this is a chat server', '2019-06-11 12:13:57'),
(58, 'admin', 'test', '2019-06-11 12:16:58'),
(59, 'admin', 'test', '2019-06-11 12:16:59'),
(60, 'admin', '123', '2019-06-11 12:16:59'),
(61, 'admin', 'test', '2019-10-24 19:29:04'),
(62, 'testacct', 'Hi Jack', '2019-11-13 14:50:37'),
(63, 'admin', 'Hello', '2019-11-13 14:50:41'),
(64, 'testacct', 'This is so cool', '2019-11-13 14:50:47'),
(65, 'admin', 'Yes it is', '2019-11-13 14:50:49'),
(66, 'testacct', 'hello', '2019-11-13 18:53:45'),
(67, 'admin', 'hi', '2019-11-13 18:53:47'),
(68, 'admin', 'welcome', '2019-11-13 18:53:48'),
(69, 'testacct', 'woahh', '2019-11-13 18:53:50'),
(70, 'admin', 'woahhhhhhh', '2019-11-13 18:53:54'),
(71, 'testacct', 'crazyyy', '2019-11-13 18:53:58'),
(72, 'admin', 'super crazyyyy', '2019-11-13 18:54:02'),
(73, 'jfetzer', 'hi', '2019-11-13 18:55:14'),
(74, 'admin', 'hello', '2019-11-14 00:48:35'),
(75, 'jfetzer', 'hi', '2019-11-14 00:50:09'),
(76, 'jfetzer', 'hello', '2019-11-14 00:50:48'),
(77, 'admin', 'test', '2019-11-14 00:54:56'),
(78, 'admin', 'test', '2019-11-14 00:55:34'),
(79, 'admin', 'test', '2019-11-14 00:56:25'),
(80, 'admin', 'test', '2019-11-14 00:56:53'),
(81, 'admin', 'test', '2019-11-14 00:59:03'),
(82, 'admin', 'test', '2019-11-14 00:59:46'),
(83, 'admin', 'test', '2019-11-14 01:01:41'),
(84, 'admin', 'test', '2019-11-14 01:02:58'),
(85, 'admin', 'test', '2019-11-14 01:04:47'),
(86, 'admin', 'test', '2019-11-14 01:05:42'),
(87, 'admin', 'test', '2019-11-14 01:07:29'),
(88, 'admin', 'test', '2019-11-14 01:09:00'),
(89, 'admin', 'tes', '2019-11-14 01:13:40'),
(90, 'admin', 'hello', '2019-11-14 01:18:16'),
(91, 'admin', 'helo', '2019-11-14 01:18:39'),
(92, 'admin', 'hello', '2019-11-14 01:19:53'),
(93, 'admin', 'hi', '2019-11-14 01:20:17'),
(94, 'admin', 'hi', '2019-11-14 01:20:38'),
(95, 'admin', 'he', '2019-11-14 01:23:02'),
(96, 'admin', 'hello', '2019-11-14 01:24:02'),
(97, 'admin', 'hello', '2019-11-14 01:26:42'),
(98, 'admin', 'hi', '2019-11-14 01:29:13'),
(99, 'admin', 'test', '2019-11-14 01:29:39'),
(100, 'admin', 'tset', '2019-11-14 01:30:39'),
(101, 'admin', 'test', '2019-11-14 01:31:28'),
(102, 'admin', 'test', '2019-11-14 01:31:50'),
(103, 'admin', 'test', '2019-11-14 01:32:40'),
(104, 'admin', 'admin', '2019-11-14 01:32:51'),
(105, 'admin', 'admin', '2019-11-14 01:33:09'),
(106, 'admin', 'admin', '2019-11-14 01:33:27'),
(107, 'admin', 'testtest', '2019-11-14 01:35:21'),
(108, 'admin', 'test', '2019-11-14 01:36:10'),
(109, 'admin', 'test', '2019-11-14 01:37:28'),
(110, 'admin', 'test', '2019-11-14 01:37:58'),
(111, 'admin', 'test', '2019-11-14 01:38:15'),
(112, 'admin', 'test', '2019-11-14 01:38:55'),
(113, 'admin', 'test', '2019-11-14 01:39:33'),
(114, 'admin', 'test', '2019-11-14 01:40:51'),
(115, 'admin', 'test', '2019-11-14 01:41:52'),
(116, 'admin', 'test', '2019-11-14 01:42:15'),
(117, 'admin', 'test', '2019-11-14 01:43:58'),
(118, 'admin', 'test', '2019-11-14 01:44:45'),
(119, 'admin', 'test', '2019-11-14 01:45:18'),
(120, 'admin', 'test', '2019-11-14 01:46:01'),
(121, 'admin', 'test', '2019-11-14 01:48:08'),
(122, 'admin', 'test', '2019-11-14 01:48:34'),
(123, 'admin', 'test', '2019-11-14 01:48:56'),
(124, 'admin', 'test', '2019-11-14 01:49:32'),
(125, 'admin', 'test', '2019-11-14 01:53:00'),
(126, 'admin', 'test', '2019-11-14 01:59:02'),
(127, 'admin', 'test', '2019-11-14 01:59:32'),
(128, 'admin', 'test', '2019-11-14 02:00:05'),
(129, 'admin', 'test', '2019-11-14 02:00:37'),
(130, 'admin', 'test', '2019-11-14 02:01:40'),
(131, 'admin', 'test', '2019-11-14 02:02:05'),
(132, 'admin', 'test', '2019-11-14 02:02:39'),
(133, 'admin', 'test', '2019-11-14 02:03:08'),
(134, 'admin', 'test', '2019-11-14 02:04:21'),
(135, 'admin', 'test', '2019-11-14 02:05:24'),
(136, 'admin', 'test', '2019-11-14 02:05:50'),
(137, 'admin', 'test', '2019-11-14 02:06:23'),
(138, 'admin', 'test', '2019-11-14 02:07:07'),
(139, 'admin', 'test', '2019-11-14 02:08:01'),
(140, 'admin', 'YES IT FUCKING WORKS', '2019-11-14 02:08:07'),
(141, 'admin', 'test', '2019-11-14 02:10:18'),
(142, 'admin', 'test', '2019-11-14 02:10:59'),
(143, 'admin', 'test', '2019-11-14 02:11:32'),
(144, 'admin', 'test', '2019-11-14 02:12:50'),
(145, 'admin', 'test', '2019-11-14 02:26:53'),
(146, 'admin', 'admin', '2019-11-14 02:28:33'),
(147, 'admin', 'admin', '2019-11-14 02:28:51'),
(148, 'admin', 'test', '2019-11-14 12:25:50'),
(149, 'admin', 'test', '2019-11-14 12:26:41'),
(150, 'admin', 'test', '2019-11-14 12:29:10'),
(151, 'admin', 'test', '2019-11-14 12:29:29'),
(152, 'admin', 'test', '2019-11-14 12:31:22'),
(153, 'admin', 'test', '2019-11-14 12:31:35'),
(154, 'admin', 'test', '2019-11-14 12:32:47'),
(155, 'admin', 'test', '2019-11-14 12:35:06'),
(156, 'admin', 'test', '2019-11-14 13:57:43'),
(157, 'admin', 'test', '2019-11-14 13:59:30'),
(158, 'jfetzer', 'test', '2019-11-14 15:20:32'),
(159, 'admin', 'test', '2019-11-14 15:41:47'),
(160, 'admin', 'test', '2019-11-14 15:48:10'),
(161, 'admin', 'test', '2019-11-14 15:48:49'),
(162, 'admin', 'test', '2019-11-14 15:49:11'),
(163, 'admin', 'test', '2019-11-14 15:49:46'),
(164, 'admin', 'test', '2019-11-14 15:52:32'),
(165, 'admin', 'test', '2019-11-14 15:53:28'),
(166, 'admin', 'test', '2019-11-14 15:54:23'),
(167, 'admin', 'test', '2019-11-14 15:56:14'),
(168, 'admin', 'test', '2019-11-14 15:56:27'),
(169, 'jfetzer', 'hello', '2019-11-16 20:43:23'),
(170, 'admin', 'hello', '2019-11-16 20:46:01'),
(171, 'admin', 'test', '2019-11-16 20:48:45'),
(172, 'admin', 'test', '2019-11-16 20:53:23'),
(173, 'admin', 'test', '2019-11-16 20:56:50'),
(174, 'admin', 'test', '2019-11-16 21:02:14'),
(175, 'admin', 'test', '2019-11-16 21:05:00'),
(176, 'admin', 'test', '2019-11-16 21:06:40'),
(177, 'admin', 'test', '2019-11-16 21:07:01'),
(178, 'admin', 'test', '2019-11-16 21:08:11'),
(179, 'admin', 'test', '2019-11-16 21:40:23'),
(181, 'admin', 'tre', '2019-11-16 21:45:04'),
(182, 'admin', 'test', '2019-11-16 21:56:33'),
(183, 'admin', 'test', '2019-11-16 21:57:57'),
(193, 'admin', 'sdkjfdsjklfkjlsdjklfdsjklfdsksfdklsfdklfdsklsfdfdskljsdfklsdfsdflksfdjsfdkldsflkjfdsklsfdkldfsklsfdklsfdklj', '2019-11-18 16:07:48');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(16) NOT NULL,
  `password` varchar(16) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `isAdmin` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `status`, `isAdmin`) VALUES
('admin', 'admin', 1, 1),
('jfetzer', 'admin', 1, 1),
('root', 'iamroot', 1, 0),
('testacct', 'test', 0, 0),
('testacct2', 'test2', 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `id_2` (`id`),
  ADD KEY `id_3` (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=194;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
