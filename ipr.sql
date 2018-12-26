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
CREATE DATABASE IF NOT EXISTS `ipr_data` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `ipr_data`;

-- Dumping structure for table ipr_data.account
CREATE TABLE IF NOT EXISTS `account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(250) DEFAULT NULL,
  `mail_id` varchar(250) DEFAULT NULL,
  `contact` bigint(20) DEFAULT NULL,
  `address` text,
  `website` varchar(250) DEFAULT NULL,
  `created_by` bigint(20) NOT NULL DEFAULT '0',
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `website` (`website`),
  UNIQUE KEY `mail_id` (`mail_id`),
  KEY `FK_account_app_user` (`created_by`),
  CONSTRAINT `FK_account_app_user` FOREIGN KEY (`created_by`) REFERENCES `app_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ipr_data.account: ~0 rows (approximately)
DELETE FROM `account`;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
/*!40000 ALTER TABLE `account` ENABLE KEYS */;

-- Dumping structure for table ipr_data.app_role
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
CREATE TABLE IF NOT EXISTS `app_user` (
  `USER_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_NAME` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `ENCRYTED_PASSWORD` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `ENABLED` bit(1) NOT NULL,
  PRIMARY KEY (`USER_ID`),
  UNIQUE KEY `APP_USER_UK` (`USER_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table ipr_data.app_user: ~4 rows (approximately)
DELETE FROM `app_user`;
/*!40000 ALTER TABLE `app_user` DISABLE KEYS */;
INSERT INTO `app_user` (`USER_ID`, `USER_NAME`, `ENCRYTED_PASSWORD`, `ENABLED`) VALUES
	(1, 'admin', '$2a$10$1l9PJTwz.DeQt0YzWRBhYev1.SARsBdJwcJLaDXOeaioVCqAVlXwe', b'1'),
	(2, 'dbuser', '$2a$10$1l9PJTwz.DeQt0YzWRBhYev1.SARsBdJwcJLaDXOeaioVCqAVlXwe', b'1'),
	(3, 'dbmanager', '$2a$10$1l9PJTwz.DeQt0YzWRBhYev1.SARsBdJwcJLaDXOeaioVCqAVlXwe', b'1'),
	(4, 'dbteamlead', '$2a$10$1l9PJTwz.DeQt0YzWRBhYev1.SARsBdJwcJLaDXOeaioVCqAVlXwe', b'1');
/*!40000 ALTER TABLE `app_user` ENABLE KEYS */;

-- Dumping structure for table ipr_data.app_user_details
CREATE TABLE IF NOT EXISTS `app_user_details` (
  `USER_ID_ID` bigint(20) NOT NULL,
  `user_first_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `user_last_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `mail_id_ofc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `mail_id_personal` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `mobile_no` bigint(20) DEFAULT NULL,
  `phone_no` bigint(20) DEFAULT NULL,
  `dob_year` smallint(6) DEFAULT NULL COMMENT 'date of birth',
  `dob_month` tinyint(4) DEFAULT NULL,
  `dob_date` tinyint(4) DEFAULT NULL,
  `doj_year` smallint(6) DEFAULT NULL COMMENT 'date of joining',
  `doj_month` tinyint(4) DEFAULT NULL,
  `doj_date` tinyint(4) DEFAULT NULL,
  `id_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `id_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `father_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `father_mobile_no` bigint(20) DEFAULT NULL,
  `home_phone_no` bigint(20) DEFAULT NULL,
  `address` varchar(750) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `blood_group` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_by` bigint(20) NOT NULL DEFAULT '0',
  `created_date` datetime DEFAULT NULL,
  `disable_date` datetime DEFAULT NULL,
  `disable_by` bigint(20) NOT NULL DEFAULT '0',
  UNIQUE KEY `USER_ID` (`USER_ID_ID`),
  UNIQUE KEY `mobile_no` (`mobile_no`),
  UNIQUE KEY `mail_id_personal` (`mail_id_personal`),
  UNIQUE KEY `mail_id_ofc` (`mail_id_ofc`),
  CONSTRAINT `FK_app_user_details_app_user` FOREIGN KEY (`USER_ID_ID`) REFERENCES `app_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table ipr_data.app_user_details: ~0 rows (approximately)
DELETE FROM `app_user_details`;
/*!40000 ALTER TABLE `app_user_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_user_details` ENABLE KEYS */;

-- Dumping structure for view ipr_data.app_user_detail_view
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `app_user_detail_view` (
	`address` VARCHAR(750) NULL COLLATE 'utf8mb4_bin',
	`blood_group` VARCHAR(3) NULL COLLATE 'utf8mb4_bin',
	`created_by` BIGINT(20) NOT NULL,
	`created_date` DATETIME NULL,
	`disable_by` BIGINT(20) NOT NULL,
	`disable_date` DATETIME NULL,
	`dob_date` TINYINT(4) NULL,
	`dob_month` TINYINT(4) NULL,
	`dob_year` SMALLINT(6) NULL COMMENT 'date of birth',
	`doj_date` TINYINT(4) NULL,
	`doj_month` TINYINT(4) NULL,
	`doj_year` SMALLINT(6) NULL COMMENT 'date of joining',
	`ENABLED` BIT(1) NULL,
	`ENCRYTED_PASSWORD` VARCHAR(128) NULL COLLATE 'utf8mb4_bin',
	`father_mobile_no` BIGINT(20) NULL,
	`father_name` VARCHAR(100) NULL COLLATE 'utf8mb4_bin',
	`home_phone_no` BIGINT(20) NULL,
	`id_number` VARCHAR(50) NULL COLLATE 'utf8mb4_bin',
	`id_type` VARCHAR(50) NULL COLLATE 'utf8mb4_bin',
	`mail_id_ofc` VARCHAR(50) NULL COLLATE 'utf8mb4_bin',
	`mail_id_personal` VARCHAR(50) NULL COLLATE 'utf8mb4_bin',
	`mobile_no` BIGINT(20) NULL,
	`phone_no` BIGINT(20) NULL,
	`user_first_name` VARCHAR(50) NULL COLLATE 'utf8mb4_bin',
	`USER_ID` BIGINT(20) NULL,
	`USER_ID_ID` BIGINT(20) NOT NULL,
	`user_last_name` VARCHAR(50) NULL COLLATE 'utf8mb4_bin',
	`USER_NAME` VARCHAR(36) NULL COLLATE 'utf8mb4_bin'
) ENGINE=MyISAM;

-- Dumping structure for table ipr_data.contact
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
  `created_by` bigint(20) NOT NULL DEFAULT '0',
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mail_id` (`mail_id`),
  KEY `FK_contact_account` (`account_id`),
  KEY `FK_contact_app_user` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ipr_data.contact: ~0 rows (approximately)
DELETE FROM `contact`;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;

-- Dumping structure for table ipr_data.greylist_data
CREATE TABLE IF NOT EXISTS `greylist_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `domain_name` varchar(100) NOT NULL,
  `created_by` bigint(20) NOT NULL DEFAULT '0',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `deleted_by` bigint(20) NOT NULL DEFAULT '0',
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `domain_name` (`domain_name`),
  KEY `FK_greylist_data_app_user` (`created_by`),
  CONSTRAINT `FK_greylist_data_app_user` FOREIGN KEY (`created_by`) REFERENCES `app_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ipr_data.greylist_data: ~0 rows (approximately)
DELETE FROM `greylist_data`;
/*!40000 ALTER TABLE `greylist_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `greylist_data` ENABLE KEYS */;

-- Dumping structure for table ipr_data.persistent_logins
CREATE TABLE IF NOT EXISTS `persistent_logins` (
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `series` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `last_used` timestamp NOT NULL,
  PRIMARY KEY (`series`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table ipr_data.persistent_logins: ~0 rows (approximately)
DELETE FROM `persistent_logins`;
/*!40000 ALTER TABLE `persistent_logins` DISABLE KEYS */;
/*!40000 ALTER TABLE `persistent_logins` ENABLE KEYS */;

-- Dumping structure for table ipr_data.project
CREATE TABLE IF NOT EXISTS `project` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `project_types_id` int(11) NOT NULL DEFAULT '0',
  `account_id` bigint(20) NOT NULL DEFAULT '0',
  `project_name` varchar(250) DEFAULT NULL,
  `channel_name` varchar(250) DEFAULT NULL,
  `project_url` varchar(250) DEFAULT NULL,
  `contract_url` varchar(250) DEFAULT NULL COMMENT 'Letter Of Authorization',
  `created_by` bigint(20) DEFAULT NULL,
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deactivate` tinyint(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `deactivated_by` bigint(20) DEFAULT NULL,
  `deactivated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_url` (`project_url`),
  KEY `FK_project_project_types` (`project_types_id`),
  KEY `FK_project_account_id` (`account_id`),
  KEY `FK_project_app_user` (`deactivated_by`),
  KEY `FK_project_app_user_2` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ipr_data.project: ~0 rows (approximately)
DELETE FROM `project`;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
/*!40000 ALTER TABLE `project` ENABLE KEYS */;

-- Dumping structure for table ipr_data.project_types
CREATE TABLE IF NOT EXISTS `project_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` bigint(20) NOT NULL DEFAULT '0',
  `project_type` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_type` (`project_type`),
  KEY `FK_project_account` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ipr_data.project_types: ~0 rows (approximately)
DELETE FROM `project_types`;
/*!40000 ALTER TABLE `project_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_types` ENABLE KEYS */;

-- Dumping structure for table ipr_data.upload_data
CREATE TABLE IF NOT EXISTS `upload_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `link` varchar(250) NOT NULL,
  `project_id` bigint(20) NOT NULL,
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
CREATE TABLE IF NOT EXISTS `upload_data_action` (
  `upload_data_id` bigint(20) DEFAULT NULL,
  `direct_notice` tinyint(4) NOT NULL DEFAULT '0',
  `invalid` tinyint(4) NOT NULL DEFAULT '0',
  `invalid_by` bigint(20) NOT NULL DEFAULT '0',
  `invalid_date` datetime DEFAULT NULL,
  `invalid_reason` varchar(250) DEFAULT NULL,
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
  UNIQUE KEY `id` (`upload_data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ipr_data.upload_data_action: ~0 rows (approximately)
DELETE FROM `upload_data_action`;
/*!40000 ALTER TABLE `upload_data_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `upload_data_action` ENABLE KEYS */;

-- Dumping structure for view ipr_data.upload_data_view_omqc
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `upload_data_view_omqc` (
	`account_name` VARCHAR(250) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`channel_name` VARCHAR(250) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`domain_name` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`id` BIGINT(20) NOT NULL,
	`link` VARCHAR(250) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`project_id` BIGINT(20) NOT NULL,
	`project_name` VARCHAR(250) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`project_type` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`project_url` VARCHAR(250) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`source_link` VARCHAR(250) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`user_first_name` VARCHAR(50) NULL COLLATE 'utf8mb4_bin',
	`user_id` INT(11) NULL,
	`user_last_name` VARCHAR(50) NULL COLLATE 'utf8mb4_bin'
) ENGINE=MyISAM;

-- Dumping structure for view ipr_data.upload_data_view_pmqc
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `upload_data_view_pmqc` (
	`account_name` VARCHAR(250) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`channel_name` VARCHAR(250) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`domain_name` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`id` BIGINT(20) NOT NULL,
	`link` VARCHAR(250) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`project_id` BIGINT(20) NOT NULL,
	`project_name` VARCHAR(250) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`project_type` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`project_url` VARCHAR(250) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`source_link` VARCHAR(250) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`user_first_name` VARCHAR(50) NULL COLLATE 'utf8mb4_bin',
	`user_id` INT(11) NULL,
	`user_last_name` VARCHAR(50) NULL COLLATE 'utf8mb4_bin'
) ENGINE=MyISAM;

-- Dumping structure for table ipr_data.user_performance_detect
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
  `duplicate_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_work_date` (`user_id`,`work_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ipr_data.user_performance_detect: ~0 rows (approximately)
DELETE FROM `user_performance_detect`;
/*!40000 ALTER TABLE `user_performance_detect` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_performance_detect` ENABLE KEYS */;

-- Dumping structure for view ipr_data.user_performance_detect_view
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `user_performance_detect_view` (
	`fb_count` INT(11) NOT NULL,
	`gl_count` INT(11) NOT NULL COMMENT 'grey list',
	`infringing_count` INT(11) NOT NULL COMMENT 'infringing link',
	`insta_count` INT(11) NOT NULL,
	`invalid_count` INT(11) NOT NULL,
	`source_count` INT(11) NOT NULL COMMENT 'source link',
	`twitter_count` INT(11) NOT NULL,
	`user_first_name` VARCHAR(50) NULL COLLATE 'utf8mb4_bin',
	`USER_ID_ID` BIGINT(20) NULL,
	`user_last_name` VARCHAR(50) NULL COLLATE 'utf8mb4_bin',
	`wl_count` INT(11) NOT NULL COMMENT 'white list ',
	`work_date` DATE NULL,
	`yt_count` INT(11) NOT NULL
) ENGINE=MyISAM;

-- Dumping structure for table ipr_data.user_performance_notice
CREATE TABLE IF NOT EXISTS `user_performance_notice` (
  `Column 1` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Column 1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ipr_data.user_performance_notice: ~0 rows (approximately)
DELETE FROM `user_performance_notice`;
/*!40000 ALTER TABLE `user_performance_notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_performance_notice` ENABLE KEYS */;

-- Dumping structure for table ipr_data.user_role
CREATE TABLE IF NOT EXISTS `user_role` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_ID` bigint(20) NOT NULL,
  `ROLE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `USER_ROLE_UK` (`USER_ID`,`ROLE_ID`),
  KEY `USER_ROLE_FK2` (`ROLE_ID`),
  CONSTRAINT `FK_user_role_app_role` FOREIGN KEY (`ROLE_ID`) REFERENCES `app_role` (`role_id`),
  CONSTRAINT `FK_user_role_app_user` FOREIGN KEY (`USER_ID`) REFERENCES `app_user` (`user_id`)
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

-- Dumping structure for table ipr_data.whitelist_data
CREATE TABLE IF NOT EXISTS `whitelist_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `domain_name` varchar(100) NOT NULL,
  `created_by` bigint(20) NOT NULL DEFAULT '0',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `deleted_by` bigint(20) NOT NULL DEFAULT '0',
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `domain_name` (`domain_name`),
  KEY `FK_whitelist_data_app_user` (`created_by`),
  CONSTRAINT `FK_whitelist_data_app_user` FOREIGN KEY (`created_by`) REFERENCES `app_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ipr_data.whitelist_data: ~0 rows (approximately)
DELETE FROM `whitelist_data`;
/*!40000 ALTER TABLE `whitelist_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `whitelist_data` ENABLE KEYS */;

-- Dumping structure for view ipr_data.app_user_detail_view
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `app_user_detail_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`myuser`@`%` SQL SECURITY DEFINER VIEW `app_user_detail_view` AS select `aud`.`USER_ID_ID` AS `USER_ID_ID`,`aud`.`user_first_name` AS `user_first_name`,`aud`.`user_last_name` AS `user_last_name`,`aud`.`mail_id_ofc` AS `mail_id_ofc`,`aud`.`mail_id_personal` AS `mail_id_personal`,`aud`.`mobile_no` AS `mobile_no`,`aud`.`phone_no` AS `phone_no`,`aud`.`dob_year` AS `dob_year`,`aud`.`dob_month` AS `dob_month`,`aud`.`dob_date` AS `dob_date`,`aud`.`doj_year` AS `doj_year`,`aud`.`doj_month` AS `doj_month`,`aud`.`doj_date` AS `doj_date`,`aud`.`id_type` AS `id_type`,`aud`.`id_number` AS `id_number`,`aud`.`father_name` AS `father_name`,`aud`.`father_mobile_no` AS `father_mobile_no`,`aud`.`home_phone_no` AS `home_phone_no`,`aud`.`address` AS `address`,`aud`.`blood_group` AS `blood_group`,`aud`.`created_by` AS `created_by`,`aud`.`created_date` AS `created_date`,`aud`.`disable_date` AS `disable_date`,`aud`.`disable_by` AS `disable_by`,`au`.`USER_ID` AS `USER_ID`,`au`.`USER_NAME` AS `USER_NAME`,`au`.`ENCRYTED_PASSWORD` AS `ENCRYTED_PASSWORD`,`au`.`ENABLED` AS `ENABLED` from (`app_user_details` `aud` left join `app_user` `au` on((`au`.`USER_ID` = `aud`.`USER_ID_ID`)));

-- Dumping structure for view ipr_data.upload_data_view_omqc
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `upload_data_view_omqc`;
CREATE ALGORITHM=UNDEFINED DEFINER=`myuser`@`%` SQL SECURITY DEFINER VIEW `upload_data_view_omqc` AS select `ud`.`id` AS `id`,`ud`.`link` AS `link`,`ud`.`domain_name` AS `domain_name`,`ud`.`source_link` AS `source_link`,`ud`.`project_id` AS `project_id`,`pr`.`project_name` AS `project_name`,`pr`.`channel_name` AS `channel_name`,`pr`.`project_url` AS `project_url`,`pt`.`project_type` AS `project_type`,`acc`.`account_name` AS `account_name`,`ud`.`user_id` AS `user_id`,`aud`.`user_first_name` AS `user_first_name`,`aud`.`user_last_name` AS `user_last_name` from (((((`upload_data` `ud` join `upload_data_action` `uda`) join `project` `pr`) join `project_types` `pt`) join `app_user_details` `aud`) join `account` `acc`) where ((`ud`.`project_id` = `pr`.`id`) and (`pr`.`project_types_id` = `pt`.`id`) and (`pr`.`account_id` = `acc`.`id`) and (`ud`.`user_id` = `aud`.`USER_ID_ID`) and (`ud`.`id` = `uda`.`upload_data_id`) and (`uda`.`is_whiteList` = 0) and (`uda`.`qc1` = 1) and (`uda`.`qc2` = 0) and (`uda`.`direct_notice` = 0) and (`uda`.`invalid` = 0));

-- Dumping structure for view ipr_data.upload_data_view_pmqc
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `upload_data_view_pmqc`;
CREATE ALGORITHM=UNDEFINED DEFINER=`myuser`@`%` SQL SECURITY DEFINER VIEW `upload_data_view_pmqc` AS select `ud`.`id` AS `id`,`ud`.`link` AS `link`,`ud`.`domain_name` AS `domain_name`,`ud`.`source_link` AS `source_link`,`ud`.`project_id` AS `project_id`,`pr`.`project_name` AS `project_name`,`pr`.`channel_name` AS `channel_name`,`pr`.`project_url` AS `project_url`,`pt`.`project_type` AS `project_type`,`acc`.`account_name` AS `account_name`,`ud`.`user_id` AS `user_id`,`aud`.`user_first_name` AS `user_first_name`,`aud`.`user_last_name` AS `user_last_name` from (((((`upload_data` `ud` join `upload_data_action` `uda`) join `project` `pr`) join `project_types` `pt`) join `app_user_details` `aud`) join `account` `acc`) where ((`ud`.`project_id` = `pr`.`id`) and (`pr`.`project_types_id` = `pt`.`id`) and (`pr`.`account_id` = `acc`.`id`) and (`ud`.`user_id` = `aud`.`USER_ID_ID`) and (`ud`.`id` = `uda`.`upload_data_id`) and (`uda`.`is_whiteList` = 0) and (`uda`.`qc1` = 0) and (`uda`.`direct_notice` = 0) and (`uda`.`invalid` = 0));

-- Dumping structure for view ipr_data.user_performance_detect_view
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `user_performance_detect_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`myuser`@`%` SQL SECURITY DEFINER VIEW `user_performance_detect_view` AS select `aud`.`USER_ID_ID` AS `USER_ID_ID`,`aud`.`user_first_name` AS `user_first_name`,`aud`.`user_last_name` AS `user_last_name`,`upd`.`work_date` AS `work_date`,`upd`.`infringing_count` AS `infringing_count`,`upd`.`source_count` AS `source_count`,`upd`.`yt_count` AS `yt_count`,`upd`.`fb_count` AS `fb_count`,`upd`.`insta_count` AS `insta_count`,`upd`.`twitter_count` AS `twitter_count`,`upd`.`wl_count` AS `wl_count`,`upd`.`gl_count` AS `gl_count`,`upd`.`invalid_count` AS `invalid_count` from (`user_performance_detect` `upd` left join (`app_user_details` `aud` left join `app_user` `au` on((`au`.`USER_ID` = `aud`.`USER_ID_ID`))) on((`aud`.`USER_ID_ID` = `upd`.`user_id`)));

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
