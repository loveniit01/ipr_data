-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.12 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for ipr_data
DROP DATABASE IF EXISTS `ipr_data`;
CREATE DATABASE IF NOT EXISTS `ipr_data` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `ipr_data`;

-- Dumping structure for table ipr_data.account
DROP TABLE IF EXISTS `account`;
CREATE TABLE IF NOT EXISTS `account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(250) DEFAULT NULL,
  `mail_id` varchar(250) DEFAULT NULL,
  `contact` bigint(20) DEFAULT NULL,
  `address` text,
  `website` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `website` (`website`),
  UNIQUE KEY `mail_id` (`mail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ipr_data.account: ~0 rows (approximately)
DELETE FROM `account`;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
/*!40000 ALTER TABLE `account` ENABLE KEYS */;

-- Dumping structure for table ipr_data.app_role
DROP TABLE IF EXISTS `app_role`;
CREATE TABLE IF NOT EXISTS `app_role` (
  `ROLE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ROLE_NAME` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`ROLE_ID`),
  UNIQUE KEY `APP_ROLE_UK` (`ROLE_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table ipr_data.app_role: ~3 rows (approximately)
DELETE FROM `app_role`;
/*!40000 ALTER TABLE `app_role` DISABLE KEYS */;
INSERT INTO `app_role` (`ROLE_ID`, `ROLE_NAME`) VALUES
	(1, 'ROLE_ADMIN'),
	(3, 'ROLE_MANAGER'),
	(4, 'ROLE_TL'),
	(2, 'ROLE_USER');
/*!40000 ALTER TABLE `app_role` ENABLE KEYS */;

-- Dumping structure for table ipr_data.app_user
DROP TABLE IF EXISTS `app_user`;
CREATE TABLE IF NOT EXISTS `app_user` (
  `USER_ID` bigint(20) NOT NULL,
  `USER_NAME` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `ENCRYTED_PASSWORD` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `ENABLED` bit(1) NOT NULL,
  PRIMARY KEY (`USER_ID`),
  UNIQUE KEY `APP_USER_UK` (`USER_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table ipr_data.app_user: ~3 rows (approximately)
DELETE FROM `app_user`;
/*!40000 ALTER TABLE `app_user` DISABLE KEYS */;
INSERT INTO `app_user` (`USER_ID`, `USER_NAME`, `ENCRYTED_PASSWORD`, `ENABLED`) VALUES
	(1, 'dbadmin1', '$2a$10$PrI5Gk9L.tSZiW9FXhTS8O8Mz9E97k2FZbFvGFFaSsiTUIl.TCrFu', b'1'),
	(2, 'dbuser1', '$2a$10$PrI5Gk9L.tSZiW9FXhTS8O8Mz9E97k2FZbFvGFFaSsiTUIl.TCrFu', b'1'),
	(3, 'dbmanager1', '$2a$10$PrI5Gk9L.tSZiW9FXhTS8O8Mz9E97k2FZbFvGFFaSsiTUIl.TCrFu', b'1');
/*!40000 ALTER TABLE `app_user` ENABLE KEYS */;

-- Dumping structure for table ipr_data.contact
DROP TABLE IF EXISTS `contact`;
CREATE TABLE IF NOT EXISTS `contact` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_id` bigint(20) NOT NULL DEFAULT '0',
  `first_name` varchar(100) DEFAULT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `designation` varchar(100) DEFAULT NULL,
  `mail_id` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `mobile1` bigint(20) DEFAULT NULL,
  `mobile2` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mail_id` (`mail_id`),
  KEY `FK_contact_account` (`account_id`),
  CONSTRAINT `FK_contact_account` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ipr_data.contact: ~0 rows (approximately)
DELETE FROM `contact`;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;

-- Dumping structure for table ipr_data.project
DROP TABLE IF EXISTS `project`;
CREATE TABLE IF NOT EXISTS `project` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `project_type` int(11) NOT NULL DEFAULT '0',
  `account_id` bigint(20) NOT NULL DEFAULT '0',
  `project_name` varchar(250) DEFAULT NULL,
  `channel_name` varchar(250) DEFAULT NULL,
  `project_url` varchar(250) DEFAULT NULL,
  `contract_url` varchar(250) DEFAULT NULL COMMENT 'Letter Of Authorization',
  `created_by` bigint(20) DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_url` (`project_url`),
  KEY `FK_project_project_types` (`project_type`),
  KEY `FK_project_account_id` (`account_id`),
  CONSTRAINT `FK_project_account_id` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`),
  CONSTRAINT `FK_project_project_types` FOREIGN KEY (`project_type`) REFERENCES `project_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ipr_data.project: ~0 rows (approximately)
DELETE FROM `project`;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
/*!40000 ALTER TABLE `project` ENABLE KEYS */;

-- Dumping structure for table ipr_data.project_types
DROP TABLE IF EXISTS `project_types`;
CREATE TABLE IF NOT EXISTS `project_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` bigint(20) NOT NULL DEFAULT '0',
  `project_type` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_type` (`project_type`),
  KEY `FK_project_account` (`account_id`),
  CONSTRAINT `FK_project_account` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ipr_data.project_types: ~0 rows (approximately)
DELETE FROM `project_types`;
/*!40000 ALTER TABLE `project_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_types` ENABLE KEYS */;

-- Dumping structure for table ipr_data.upload_data
DROP TABLE IF EXISTS `upload_data`;
CREATE TABLE IF NOT EXISTS `upload_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `link` varchar(250) NOT NULL,
  `project_id` varchar(250) NOT NULL,
  `domain_name` varchar(50) NOT NULL,
  `source_link` varchar(250) NOT NULL,
  `note1` varchar(250) DEFAULT NULL,
  `note2` varchar(250) DEFAULT NULL,
  `note3` varchar(250) DEFAULT NULL,
  `upload_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `link_type` tinyint(4) NOT NULL DEFAULT '1',
  `is_manual` tinyint(4) NOT NULL DEFAULT '1',
  `user_id` int(11) DEFAULT NULL,
  `project_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique key` (`link`,`project_id`,`domain_name`,`link_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ipr_data.upload_data: ~0 rows (approximately)
DELETE FROM `upload_data`;
/*!40000 ALTER TABLE `upload_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `upload_data` ENABLE KEYS */;

-- Dumping structure for table ipr_data.upload_data_action
DROP TABLE IF EXISTS `upload_data_action`;
CREATE TABLE IF NOT EXISTS `upload_data_action` (
  `id` bigint(20) DEFAULT NULL,
  `direct_notice` tinyint(4) NOT NULL DEFAULT '0',
  `qc1` tinyint(4) NOT NULL DEFAULT '0',
  `qc1_user` int(11) DEFAULT NULL,
  `qc1_time` datetime DEFAULT NULL,
  `qc2` tinyint(4) NOT NULL DEFAULT '0',
  `qc2_user` int(11) DEFAULT NULL,
  `qc2_time` datetime DEFAULT NULL,
  `is_whiteList` tinyint(4) NOT NULL DEFAULT '0',
  `is_greyList` tinyint(4) NOT NULL DEFAULT '0',
  `data_Notify` tinyint(4) NOT NULL DEFAULT '0',
  `data_notify_user` int(11) NOT NULL DEFAULT '0',
  `fource_notify` tinyint(4) NOT NULL DEFAULT '0',
  UNIQUE KEY `id` (`id`),
  CONSTRAINT `data_detail` FOREIGN KEY (`id`) REFERENCES `upload_data` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ipr_data.upload_data_action: ~0 rows (approximately)
DELETE FROM `upload_data_action`;
/*!40000 ALTER TABLE `upload_data_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `upload_data_action` ENABLE KEYS */;

-- Dumping structure for table ipr_data.user_performance_detect
DROP TABLE IF EXISTS `user_performance_detect`;
CREATE TABLE IF NOT EXISTS `user_performance_detect` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `work_date` date DEFAULT NULL,
  `infringing_count` int(11) NOT NULL DEFAULT '0' COMMENT 'infringing link',
  `source_count` int(11) NOT NULL DEFAULT '0' COMMENT 'source link',
  `yt_count` int(11) NOT NULL DEFAULT '0',
  `fb_count` int(11) NOT NULL DEFAULT '0',
  `insta_count` int(11) NOT NULL DEFAULT '0',
  `twitter_count` int(11) NOT NULL DEFAULT '0',
  `wl_count` int(11) NOT NULL DEFAULT '0' COMMENT 'white list ',
  `gl_count` int(11) NOT NULL DEFAULT '0' COMMENT 'grey list',
  `invalid_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_work_date` (`user_id`,`work_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ipr_data.user_performance_detect: ~0 rows (approximately)
DELETE FROM `user_performance_detect`;
/*!40000 ALTER TABLE `user_performance_detect` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_performance_detect` ENABLE KEYS */;

-- Dumping structure for table ipr_data.user_performance_notice
DROP TABLE IF EXISTS `user_performance_notice`;
CREATE TABLE IF NOT EXISTS `user_performance_notice` (
  `Column 1` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Column 1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ipr_data.user_performance_notice: ~0 rows (approximately)
DELETE FROM `user_performance_notice`;
/*!40000 ALTER TABLE `user_performance_notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_performance_notice` ENABLE KEYS */;

-- Dumping structure for table ipr_data.user_role
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE IF NOT EXISTS `user_role` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_ID` bigint(20) NOT NULL,
  `ROLE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `USER_ROLE_UK` (`USER_ID`,`ROLE_ID`),
  KEY `USER_ROLE_FK2` (`ROLE_ID`),
  CONSTRAINT `FK_user_role_app_role` FOREIGN KEY (`ROLE_ID`) REFERENCES `app_role` (`role_id`),
  CONSTRAINT `USER_ROLE_FK1` FOREIGN KEY (`USER_ID`) REFERENCES `app_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table ipr_data.user_role: ~6 rows (approximately)
DELETE FROM `user_role`;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` (`ID`, `USER_ID`, `ROLE_ID`) VALUES
	(1, 1, 1),
	(2, 1, 2),
	(4, 1, 3),
	(3, 2, 2),
	(6, 3, 2),
	(5, 3, 3);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
