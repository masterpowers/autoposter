-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 18, 2015
-- Server version: 5.1.73-cll
-- PHP Version: 5.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `phpSFP`
--

-- --------------------------------------------------------

--
-- Table structure for table `cronjobs`
--

CREATE TABLE IF NOT EXISTS `cronjobs` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_post` int(10) NOT NULL,
  `id_wall` bigint(10) NOT NULL,
  `page_access_token` text NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` enum('1','2','3') NOT NULL,
  `clicks` int(10) NOT NULL,
  `status` enum('0','1','2') NOT NULL DEFAULT '0',
  `error_log` varchar(255) NOT NULL,
  `permalink` text NOT NULL,
  `retry` smallint(5) NOT NULL,
  `timestamp` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_post` (`id_post`),
  KEY `id_wall` (`id_wall`),
  KEY `id_post_2` (`id_post`),
  KEY `id_wall_2` (`id_wall`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `email`
--

CREATE TABLE IF NOT EXISTS `email` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `protocol` enum('1','2','3') NOT NULL DEFAULT '1' COMMENT '1 - mail, 2 - sendmail, or 3 - smtp',
  `smtp_host` varchar(255) NOT NULL,
  `smtp_user` varchar(255) NOT NULL,
  `smtp_pass` varchar(255) NOT NULL,
  `smtp_port` varchar(255) NOT NULL,
  `from_name` varchar(255) NOT NULL,
  `from_email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `email`
--

INSERT INTO `email` (`id`, `protocol`, `smtp_host`, `smtp_user`, `smtp_pass`, `smtp_port`, `from_name`, `from_email`) VALUES
(1, '1', '', '', '', '', 'phpSFP', 'contact@litetech.eu');

-- --------------------------------------------------------

--
-- Table structure for table `error_log`
--

CREATE TABLE IF NOT EXISTS `error_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_cron` int(10) NOT NULL,
  `error` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cron` (`id_cron`),
  KEY `id_cron_2` (`id_cron`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `fbdata`
--

CREATE TABLE IF NOT EXISTS `fbdata` (
  `user_id` bigint(10) NOT NULL,
  `data` longblob NOT NULL,
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_user` int(10) NOT NULL,
  `user_id` bigint(10) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `access_token` text NOT NULL,
  `name` varchar(255) NOT NULL,
  `timestamp` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`),
  KEY `user_id` (`user_id`),
  KEY `id_user_2` (`id_user`),
  KEY `user_id_2` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `groups_data`
--

CREATE TABLE IF NOT EXISTS `groups_data` (
  `id_group` int(10) NOT NULL,
  `id_user` int(10) NOT NULL,
  `id_wall` bigint(10) NOT NULL,
  `page_access_token` text NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` enum('1','2','3') NOT NULL,
  KEY `id_group` (`id_group`),
  KEY `id_user` (`id_user`),
  KEY `id_wall` (`id_wall`),
  KEY `id_user_2` (`id_user`),
  KEY `id_wall_2` (`id_wall`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_users` int(10) NOT NULL,
  `user_id` bigint(10) NOT NULL,
  `user_name` varchar(244) NOT NULL,
  `access_token` text NOT NULL,
  `type` smallint(5) NOT NULL,
  `message` longblob NOT NULL,
  `link` text NOT NULL,
  `picture` text NOT NULL,
  `name` longblob NOT NULL,
  `caption` text NOT NULL,
  `description` longblob NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `delete` enum('0','1') NOT NULL DEFAULT '0',
  `interval` int(10) NOT NULL,
  `timestamp` varchar(50) NOT NULL,
  `timestamp_repeat` varchar(30) NOT NULL,
  `timestamp_pause` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_users` (`id_users`),
  KEY `user_id` (`user_id`),
  KEY `id_users_2` (`id_users`),
  KEY `user_id_2` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `recover_password`
--

CREATE TABLE IF NOT EXISTS `recover_password` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_user` int(10) NOT NULL,
  `code` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`),
  KEY `id_user_2` (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `id_user` int(10) NOT NULL,
  `app_id` text NOT NULL,
  `app_secret` text NOT NULL,
  `app_version` varchar(255) NOT NULL DEFAULT 'v2.4',
  `app_valid` enum('0','1') NOT NULL DEFAULT '0',
  `app_default` enum('0','1') NOT NULL DEFAULT '0',
  `pages_limit` int(10) NOT NULL,
  `groups_limit` int(10) NOT NULL,
  `retry_limit` int(11) NOT NULL,
  `track_clicks` enum('0','1') NOT NULL DEFAULT '0',
  `post_admin` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`),
  KEY `id_user_2` (`id_user`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `id_user`, `app_id`, `app_secret`, `app_valid`, `app_default`, `pages_limit`, `groups_limit`, `retry_limit`, `track_clicks`, `post_admin`) VALUES
(1, 1, '', '', '0', '0', 5000, 5000, 5, '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `settings_general`
--

CREATE TABLE IF NOT EXISTS `settings_general` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `app_id` text NOT NULL,
  `app_secret` text NOT NULL,
  `app_version` varchar(255) NOT NULL DEFAULT 'v2.4',
  `app_token` text NOT NULL,
  `app_valid` enum('0','1') NOT NULL DEFAULT '0',
  `pages_limit` int(10) NOT NULL,
  `groups_limit` int(10) NOT NULL,
  `retry_limit` int(11) NOT NULL,
  `track_clicks` enum('0','1') NOT NULL DEFAULT '0',
  `post_admin` enum('0','1') NOT NULL DEFAULT '0',
  `role_auto` enum('0','1') NOT NULL DEFAULT '1',
  `random_time` enum('0','1') NOT NULL DEFAULT '0',
  `newusers_app` enum('0','1') NOT NULL DEFAULT '1',
  `upload_limit` smallint(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `settings_general`
--

INSERT INTO `settings_general` (`id`, `app_id`, `app_secret`, `app_token`, `app_valid`, `pages_limit`, `groups_limit`, `retry_limit`, `track_clicks`, `post_admin`, `role_auto`, `upload_limit`) VALUES (1, '', '', '', '0', 5000, 5000, 5, '0', '0', '1', 4);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `fb_user_id` bigint(25) NOT NULL,
  `fb_id` bigint(25) NOT NULL,
  `password` text NOT NULL,
  `gmt` varchar(30) NOT NULL DEFAULT '0',
  `gmt_zone` varchar(255) NOT NULL DEFAULT 'Europe/London',
  `access` enum('0','1','2') NOT NULL DEFAULT '0',
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `timestamp_login` varchar(30) NOT NULL,
  `timestamp` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `username`, `fb_user_id`, `fb_id`, `password`, `gmt`, `gmt_zone`, `access`, `status`, `timestamp_login`, `timestamp`) VALUES
(1, 'Jhon Doe', 'jhon.doe@email.com', 'admin', 0, 0, 'd033e22ae348aeb5660fc2140aec35850c4da997', '0', 'Europe/London', '1', '1', '1373706233', '1373390527');
