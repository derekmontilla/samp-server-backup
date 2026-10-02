-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 02, 2017 at 01:22 PM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `xmovie`
--
CREATE DATABASE IF NOT EXISTS `xmovie` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `xmovie`;

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `account_id` int(11) NOT NULL,
  `account_name` varchar(24) NOT NULL,
  `account_password` varchar(129) NOT NULL,
  `account_vip` tinyint(1) NOT NULL,
  `account_admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `adverts`
--

CREATE TABLE `adverts` (
  `advert_id` int(11) NOT NULL,
  `advert_message` varchar(115) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bans`
--

CREATE TABLE `bans` (
  `ban_id` int(11) NOT NULL,
  `account_id` int(11) DEFAULT NULL,
  `ban_ip` varchar(16) DEFAULT NULL,
  `ban_name` varchar(24) DEFAULT NULL,
  `ban_reason` varchar(200) DEFAULT NULL,
  `ban_issue_date` date DEFAULT NULL,
  `ban_issue_time` time DEFAULT NULL,
  `ban_expire_date` date DEFAULT NULL,
  `ban_expire_time` time DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hostbans`
--

CREATE TABLE `hostbans` (
  `host_name` varchar(50) NOT NULL,
  `host_description` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ips`
--

CREATE TABLE `ips` (
  `ip_id` int(11) NOT NULL,
  `ip_name` varchar(24) DEFAULT NULL,
  `ip_connect_ip` varchar(16) DEFAULT NULL,
  `ip_connect_host` varchar(75) DEFAULT NULL,
  `ip_connect_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `memos`
--

CREATE TABLE `memos` (
  `memo_target` varchar(24) NOT NULL,
  `memo_id` int(11) DEFAULT NULL,
  `memo_sender` varchar(24) DEFAULT NULL,
  `memo_read` tinyint(1) DEFAULT NULL,
  `memo_date` date DEFAULT NULL,
  `memo_time` time DEFAULT NULL,
  `memo_message` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `player_logs`
--

CREATE TABLE `player_logs` (
  `account_id` int(11) NOT NULL,
  `player_log_login_success_count` int(11) DEFAULT NULL,
  `player_log_login_fail_count` int(11) DEFAULT NULL,
  `player_log_last_login_date_1` date DEFAULT NULL,
  `player_log_last_login_date_2` date DEFAULT NULL,
  `player_log_last_login_date_3` date DEFAULT NULL,
  `player_log_last_login_date_4` date DEFAULT NULL,
  `player_log_last_login_date_5` date DEFAULT NULL,
  `player_log_last_login_time_1` time DEFAULT NULL,
  `player_log_last_login_time_2` time DEFAULT NULL,
  `player_log_last_login_time_3` time DEFAULT NULL,
  `player_log_last_login_time_4` time DEFAULT NULL,
  `player_log_last_login_time_5` time DEFAULT NULL,
  `player_log_last_logout_date_1` date DEFAULT NULL,
  `player_log_last_logout_date_2` date DEFAULT NULL,
  `player_log_last_logout_date_3` date DEFAULT NULL,
  `player_log_last_logout_date_4` date DEFAULT NULL,
  `player_log_last_logout_date_5` date DEFAULT NULL,
  `player_log_last_logout_time_1` time DEFAULT NULL,
  `player_log_last_logout_time_2` time DEFAULT NULL,
  `player_log_last_logout_time_3` time DEFAULT NULL,
  `player_log_last_logout_time_4` time DEFAULT NULL,
  `player_log_last_logout_time_5` time DEFAULT NULL,
  `player_log_last_connect_date` date DEFAULT NULL,
  `player_log_last_connect_time` time DEFAULT NULL,
  `player_log_register_date` date DEFAULT NULL,
  `player_log_register_time` time DEFAULT NULL,
  `player_log_total_playtime` int(11) DEFAULT NULL,
  `player_log_kick_count` int(11) DEFAULT NULL,
  `player_log_ban_count` int(11) DEFAULT NULL,
  `player_log_warn_count` int(11) DEFAULT NULL,
  `player_log_connect_count` int(11) DEFAULT NULL,
  `player_log_register_ip` varchar(16) DEFAULT NULL,
  `player_log_connect_ip` varchar(16) DEFAULT NULL,
  `player_log_login_ip` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `preferences`
--

CREATE TABLE `preferences` (
  `account_id` int(11) NOT NULL,
  `preference_email` varchar(40) DEFAULT NULL,
  `preference_hide` tinyint(1) DEFAULT NULL,
  `preference_god` tinyint(1) DEFAULT NULL,
  `preference_vgod` tinyint(1) DEFAULT NULL,
  `preference_greeting` varchar(100) DEFAULT NULL,
  `preference_location` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `server_logs`
--

CREATE TABLE `server_logs` (
  `server_logs_type` varchar(100) DEFAULT NULL,
  `server_logs_data` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `server_statistics`
--

CREATE TABLE `server_statistics` (
  `server_statistic_date` date DEFAULT NULL,
  `server_statistic_connections` int(11) DEFAULT NULL,
  `server_statistic_accounts_registered` int(11) DEFAULT NULL,
  `server_statistic_deaths` int(11) DEFAULT NULL,
  `server_statistic_kills` int(11) DEFAULT NULL,
  `server_statistic_warns` int(11) DEFAULT NULL,
  `server_statistic_kicks` int(11) DEFAULT NULL,
  `server_statistic_deathmatches_played` int(11) DEFAULT NULL,
  `server_statistic_derbies_played` int(11) DEFAULT NULL,
  `server_statistic_russianroulette_played` int(11) DEFAULT NULL,
  `server_statistic_copchases_played` int(11) DEFAULT NULL,
  `server_statistic_nadeball_played` int(11) DEFAULT NULL,
  `server_statistic_warzone_played` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `teleports`
--

CREATE TABLE `teleports` (
  `teleport_id` int(11) NOT NULL,
  `teleport_x` float DEFAULT NULL,
  `teleport_y` float DEFAULT NULL,
  `teleport_z` float DEFAULT NULL,
  `teleport_angle` float DEFAULT NULL,
  `teleport_interior` tinyint(4) DEFAULT NULL,
  `teleport_description` varchar(50) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `warzone_bases`
--

CREATE TABLE `warzone_bases` (
  `warzone_base_id` int(11) NOT NULL,
  `warzone_base_name` varchar(50) DEFAULT NULL,
  `warzone_base_attacker_x` float DEFAULT NULL,
  `warzone_base_attacker_y` float DEFAULT NULL,
  `warzone_base_attacker_z` float DEFAULT NULL,
  `warzone_base_attacker_angle` float DEFAULT NULL,
  `warzone_base_defender_x` float DEFAULT NULL,
  `warzone_base_defender_y` float DEFAULT NULL,
  `warzone_base_defender_z` float DEFAULT NULL,
  `warzone_base_defender_angle` float DEFAULT NULL,
  `warzone_base_checkpoint_x` float DEFAULT NULL,
  `warzone_base_checkpoint_y` float DEFAULT NULL,
  `warzone_base_checkpoint_z` float DEFAULT NULL,
  `warzone_base_checkpoint_size` float DEFAULT NULL,
  `warzone_base_base_mode` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `warzone_settings`
--

CREATE TABLE `warzone_settings` (
  `warzone_setting_id` int(11) NOT NULL,
  `warzone_setting_skin_attackers` tinyint(4) DEFAULT NULL,
  `warzone_setting_skin_defenders` tinyint(4) DEFAULT NULL,
  `warzone_setting_colour_attackers_r` tinyint(4) DEFAULT NULL,
  `warzone_setting_colour_attackers_g` tinyint(4) DEFAULT NULL,
  `warzone_setting_colour_attackers_b` tinyint(4) DEFAULT NULL,
  `warzone_setting_colour_attackers_a` tinyint(4) DEFAULT NULL,
  `warzone_setting_colour_defenders_r` tinyint(4) DEFAULT NULL,
  `warzone_setting_colour_defenders_g` tinyint(4) DEFAULT NULL,
  `warzone_setting_colour_defenders_b` tinyint(4) DEFAULT NULL,
  `warzone_setting_colour_defenders_a` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `warzone_vehicles`
--

CREATE TABLE `warzone_vehicles` (
  `warzone_vehicle_id` int(11) NOT NULL,
  `warzone_base_id` int(11) DEFAULT NULL,
  `warzone_vehicle_model_id` int(11) DEFAULT NULL,
  `warzone_vehicle_x` float DEFAULT NULL,
  `warzone_vehicle_y` float DEFAULT NULL,
  `warzone_vehicle_z` float DEFAULT NULL,
  `warzone_vehicle_angle` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`account_id`);

--
-- Indexes for table `adverts`
--
ALTER TABLE `adverts`
  ADD PRIMARY KEY (`advert_id`);

--
-- Indexes for table `bans`
--
ALTER TABLE `bans`
  ADD PRIMARY KEY (`ban_id`);

--
-- Indexes for table `hostbans`
--
ALTER TABLE `hostbans`
  ADD PRIMARY KEY (`host_name`);

--
-- Indexes for table `ips`
--
ALTER TABLE `ips`
  ADD PRIMARY KEY (`ip_id`);

--
-- Indexes for table `memos`
--
ALTER TABLE `memos`
  ADD PRIMARY KEY (`memo_target`);

--
-- Indexes for table `player_logs`
--
ALTER TABLE `player_logs`
  ADD PRIMARY KEY (`account_id`);

--
-- Indexes for table `preferences`
--
ALTER TABLE `preferences`
  ADD PRIMARY KEY (`account_id`);

--
-- Indexes for table `teleports`
--
ALTER TABLE `teleports`
  ADD PRIMARY KEY (`teleport_id`);

--
-- Indexes for table `warzone_bases`
--
ALTER TABLE `warzone_bases`
  ADD PRIMARY KEY (`warzone_base_id`);

--
-- Indexes for table `warzone_settings`
--
ALTER TABLE `warzone_settings`
  ADD PRIMARY KEY (`warzone_setting_id`);

--
-- Indexes for table `warzone_vehicles`
--
ALTER TABLE `warzone_vehicles`
  ADD PRIMARY KEY (`warzone_vehicle_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `account_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bans`
--
ALTER TABLE `bans`
  MODIFY `ban_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ips`
--
ALTER TABLE `ips`
  MODIFY `ip_id` int(11) NOT NULL AUTO_INCREMENT;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
