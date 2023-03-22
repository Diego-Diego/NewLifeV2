-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           10.11.2-MariaDB - mariadb.org binary distribution
-- SE du serveur:                Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour local
CREATE DATABASE IF NOT EXISTS `local` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `local`;

-- Listage de la structure de la table local. addon_account
CREATE TABLE IF NOT EXISTS `addon_account` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table local.addon_account : ~4 rows (environ)
/*!40000 ALTER TABLE `addon_account` DISABLE KEYS */;
INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('bank_savings', 'Savings account', 0),
	('caution', 'caution', 0),
	('society_ambulance', 'EMS', 1),
	('society_cardealer', 'Cardealer', 1);
/*!40000 ALTER TABLE `addon_account` ENABLE KEYS */;

-- Listage de la structure de la table local. addon_account_data
CREATE TABLE IF NOT EXISTS `addon_account_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(100) DEFAULT NULL,
  `money` int(11) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_addon_account_data_account_name_owner` (`account_name`,`owner`),
  KEY `index_addon_account_data_account_name` (`account_name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table local.addon_account_data : ~4 rows (environ)
/*!40000 ALTER TABLE `addon_account_data` DISABLE KEYS */;
INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
	(1, 'society_cardealer', 0, NULL),
	(3, 'society_ambulance', 0, NULL),
	(10, 'bank_savings', 0, '467826b1f966aed6683f462c40b5cea8ad5b1a22'),
	(11, 'caution', 0, '467826b1f966aed6683f462c40b5cea8ad5b1a22');
/*!40000 ALTER TABLE `addon_account_data` ENABLE KEYS */;

-- Listage de la structure de la table local. addon_inventory
CREATE TABLE IF NOT EXISTS `addon_inventory` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table local.addon_inventory : ~2 rows (environ)
/*!40000 ALTER TABLE `addon_inventory` DISABLE KEYS */;
INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
	('society_ambulance', 'EMS', 1),
	('society_cardealer', 'Cardealer', 1);
/*!40000 ALTER TABLE `addon_inventory` ENABLE KEYS */;

-- Listage de la structure de la table local. addon_inventory_items
CREATE TABLE IF NOT EXISTS `addon_inventory_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_name` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_addon_inventory_items_inventory_name_name` (`inventory_name`,`name`),
  KEY `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`,`name`,`owner`),
  KEY `index_addon_inventory_inventory_name` (`inventory_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table local.addon_inventory_items : ~0 rows (environ)
/*!40000 ALTER TABLE `addon_inventory_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `addon_inventory_items` ENABLE KEYS */;

-- Listage de la structure de la table local. banking
CREATE TABLE IF NOT EXISTS `banking` (
  `identifier` varchar(46) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `amount` int(64) DEFAULT NULL,
  `time` bigint(20) DEFAULT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `balance` int(11) DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table local.banking : ~0 rows (environ)
/*!40000 ALTER TABLE `banking` DISABLE KEYS */;
/*!40000 ALTER TABLE `banking` ENABLE KEYS */;

-- Listage de la structure de la table local. billing
CREATE TABLE IF NOT EXISTS `billing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(46) DEFAULT NULL,
  `sender` varchar(60) NOT NULL,
  `target_type` varchar(50) NOT NULL,
  `target` varchar(40) NOT NULL,
  `label` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table local.billing : ~0 rows (environ)
/*!40000 ALTER TABLE `billing` DISABLE KEYS */;
/*!40000 ALTER TABLE `billing` ENABLE KEYS */;

-- Listage de la structure de la table local. cardealer_vehicles
CREATE TABLE IF NOT EXISTS `cardealer_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table local.cardealer_vehicles : ~0 rows (environ)
/*!40000 ALTER TABLE `cardealer_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `cardealer_vehicles` ENABLE KEYS */;

-- Listage de la structure de la table local. datastore
CREATE TABLE IF NOT EXISTS `datastore` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table local.datastore : ~7 rows (environ)
/*!40000 ALTER TABLE `datastore` DISABLE KEYS */;
INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
	('property', 'Property', 0),
	('society_ambulance', 'EMS', 1),
	('society_mechanic', 'Mechanic', 1),
	('user_ears', 'Ears', 0),
	('user_glasses', 'Glasses', 0),
	('user_helmet', 'Helmet', 0),
	('user_mask', 'Mask', 0);
/*!40000 ALTER TABLE `datastore` ENABLE KEYS */;

-- Listage de la structure de la table local. datastore_data
CREATE TABLE IF NOT EXISTS `datastore_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_datastore_data_name_owner` (`name`,`owner`),
  KEY `index_datastore_data_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table local.datastore_data : ~7 rows (environ)
/*!40000 ALTER TABLE `datastore_data` DISABLE KEYS */;
INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
	(6, 'society_ambulance', NULL, '\'{}\''),
	(7, 'society_mechanic', NULL, '\'{}\''),
	(8, 'property', '467826b1f966aed6683f462c40b5cea8ad5b1a22', '{}'),
	(9, 'user_glasses', '467826b1f966aed6683f462c40b5cea8ad5b1a22', '{}'),
	(10, 'user_helmet', '467826b1f966aed6683f462c40b5cea8ad5b1a22', '{}'),
	(11, 'user_ears', '467826b1f966aed6683f462c40b5cea8ad5b1a22', '{}'),
	(12, 'user_mask', '467826b1f966aed6683f462c40b5cea8ad5b1a22', '{}');
/*!40000 ALTER TABLE `datastore_data` ENABLE KEYS */;

-- Listage de la structure de la table local. fine_types
CREATE TABLE IF NOT EXISTS `fine_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table local.fine_types : ~52 rows (environ)
/*!40000 ALTER TABLE `fine_types` DISABLE KEYS */;
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(1, 'Misuse of a horn', 30, 0),
	(2, 'Illegally Crossing a continuous Line', 40, 0),
	(3, 'Driving on the wrong side of the road', 250, 0),
	(4, 'Illegal U-Turn', 250, 0),
	(5, 'Illegally Driving Off-road', 170, 0),
	(6, 'Refusing a Lawful Command', 30, 0),
	(7, 'Illegally Stopping a Vehicle', 150, 0),
	(8, 'Illegal Parking', 70, 0),
	(9, 'Failing to Yield to the right', 70, 0),
	(10, 'Failure to comply with Vehicle Information', 90, 0),
	(11, 'Failing to stop at a Stop Sign ', 105, 0),
	(12, 'Failing to stop at a Red Light', 130, 0),
	(13, 'Illegal Passing', 100, 0),
	(14, 'Driving an illegal Vehicle', 100, 0),
	(15, 'Driving without a License', 1500, 0),
	(16, 'Hit and Run', 800, 0),
	(17, 'Exceeding Speeds Over < 5 mph', 90, 0),
	(18, 'Exceeding Speeds Over 5-15 mph', 120, 0),
	(19, 'Exceeding Speeds Over 15-30 mph', 180, 0),
	(20, 'Exceeding Speeds Over > 30 mph', 300, 0),
	(21, 'Impeding traffic flow', 110, 1),
	(22, 'Public Intoxication', 90, 1),
	(23, 'Disorderly conduct', 90, 1),
	(24, 'Obstruction of Justice', 130, 1),
	(25, 'Insults towards Civilans', 75, 1),
	(26, 'Disrespecting of an LEO', 110, 1),
	(27, 'Verbal Threat towards a Civilan', 90, 1),
	(28, 'Verbal Threat towards an LEO', 150, 1),
	(29, 'Providing False Information', 250, 1),
	(30, 'Attempt of Corruption', 1500, 1),
	(31, 'Brandishing a weapon in city Limits', 120, 2),
	(32, 'Brandishing a Lethal Weapon in city Limits', 300, 2),
	(33, 'No Firearms License', 600, 2),
	(34, 'Possession of an Illegal Weapon', 700, 2),
	(35, 'Possession of Burglary Tools', 300, 2),
	(36, 'Grand Theft Auto', 1800, 2),
	(37, 'Intent to Sell/Distrube of an illegal Substance', 1500, 2),
	(38, 'Frabrication of an Illegal Substance', 1500, 2),
	(39, 'Possession of an Illegal Substance ', 650, 2),
	(40, 'Kidnapping of a Civilan', 1500, 2),
	(41, 'Kidnapping of an LEO', 2000, 2),
	(42, 'Robbery', 650, 2),
	(43, 'Armed Robbery of a Store', 650, 2),
	(44, 'Armed Robbery of a Bank', 1500, 2),
	(45, 'Assault on a Civilian', 2000, 3),
	(46, 'Assault of an LEO', 2500, 3),
	(47, 'Attempt of Murder of a Civilian', 3000, 3),
	(48, 'Attempt of Murder of an LEO', 5000, 3),
	(49, 'Murder of a Civilian', 10000, 3),
	(50, 'Murder of an LEO', 30000, 3),
	(51, 'Involuntary manslaughter', 1800, 3),
	(52, 'Fraud', 2000, 2);
/*!40000 ALTER TABLE `fine_types` ENABLE KEYS */;

-- Listage de la structure de la table local. items
CREATE TABLE IF NOT EXISTS `items` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `weight` int(11) NOT NULL DEFAULT 1,
  `rare` tinyint(4) NOT NULL DEFAULT 0,
  `can_remove` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table local.items : ~0 rows (environ)
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
/*!40000 ALTER TABLE `items` ENABLE KEYS */;

-- Listage de la structure de la table local. jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table local.jobs : ~3 rows (environ)
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('ambulance', 'EMS', 1),
	('cardealer', 'Concessionnaire', 1),
	('unemployed', 'Chômage', 0);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;

-- Listage de la structure de la table local. job_grades
CREATE TABLE IF NOT EXISTS `job_grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext NOT NULL,
  `skin_female` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table local.job_grades : ~9 rows (environ)
/*!40000 ALTER TABLE `job_grades` DISABLE KEYS */;
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(1, 'unemployed', 0, 'unemployed', 'R.S.A', 500, '{}', '{}'),
	(2, 'ambulance', 0, 'ambulance', 'Jr. EMT', 2000, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(3, 'ambulance', 1, 'doctor', 'EMT', 4000, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(4, 'ambulance', 2, 'chief_doctor', 'Sr. EMT', 6000, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(5, 'ambulance', 3, 'boss', 'EMT Supervisor', 8000, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(41, 'cardealer', 0, 'recruit', 'Recrue', 10, '{}', '{}'),
	(42, 'cardealer', 1, 'novice', 'Novice', 25, '{}', '{}'),
	(43, 'cardealer', 2, 'experienced', 'Experimente', 40, '{}', '{}'),
	(44, 'cardealer', 3, 'boss', 'Patron', 0, '{}', '{}');
/*!40000 ALTER TABLE `job_grades` ENABLE KEYS */;

-- Listage de la structure de la table local. licenses
CREATE TABLE IF NOT EXISTS `licenses` (
  `type` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table local.licenses : ~8 rows (environ)
/*!40000 ALTER TABLE `licenses` DISABLE KEYS */;
INSERT INTO `licenses` (`type`, `label`) VALUES
	('airplane', 'Permis - Avion'),
	('boat', 'Permis - Bâteau'),
	('dmv', 'Code de la route'),
	('drive', 'Permis - Voiture'),
	('drive_bike', 'Permis - Moto'),
	('drive_truck', 'Permis - Camion'),
	('heli', 'Permis - Hélicoptère'),
	('weapon', 'Permis port armes');
/*!40000 ALTER TABLE `licenses` ENABLE KEYS */;

-- Listage de la structure de la table local. multicharacter_slots
CREATE TABLE IF NOT EXISTS `multicharacter_slots` (
  `identifier` varchar(46) NOT NULL,
  `slots` int(11) NOT NULL,
  PRIMARY KEY (`identifier`) USING BTREE,
  KEY `slots` (`slots`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table local.multicharacter_slots : ~0 rows (environ)
/*!40000 ALTER TABLE `multicharacter_slots` DISABLE KEYS */;
/*!40000 ALTER TABLE `multicharacter_slots` ENABLE KEYS */;

-- Listage de la structure de la table local. owned_vehicles
CREATE TABLE IF NOT EXISTS `owned_vehicles` (
  `owner` varchar(46) DEFAULT NULL,
  `plate` varchar(12) NOT NULL,
  `vehicle` longtext DEFAULT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'car',
  `job` varchar(20) DEFAULT NULL,
  `stored` tinyint(4) NOT NULL DEFAULT 0,
  `parking` varchar(60) DEFAULT NULL,
  `pound` varchar(60) DEFAULT NULL,
  `glovebox` longtext DEFAULT NULL,
  `trunk` longtext DEFAULT NULL,
  `mileage` float DEFAULT 0,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table local.owned_vehicles : ~0 rows (environ)
/*!40000 ALTER TABLE `owned_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `owned_vehicles` ENABLE KEYS */;

-- Listage de la structure de la table local. ox_inventory
CREATE TABLE IF NOT EXISTS `ox_inventory` (
  `owner` varchar(60) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `data` longtext DEFAULT NULL,
  `lastupdated` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  UNIQUE KEY `owner` (`owner`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table local.ox_inventory : ~0 rows (environ)
/*!40000 ALTER TABLE `ox_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `ox_inventory` ENABLE KEYS */;

-- Listage de la structure de la table local. rented_vehicles
CREATE TABLE IF NOT EXISTS `rented_vehicles` (
  `vehicle` varchar(60) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table local.rented_vehicles : ~0 rows (environ)
/*!40000 ALTER TABLE `rented_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `rented_vehicles` ENABLE KEYS */;

-- Listage de la structure de la table local. society_moneywash
CREATE TABLE IF NOT EXISTS `society_moneywash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(46) DEFAULT NULL,
  `society` varchar(60) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table local.society_moneywash : ~0 rows (environ)
/*!40000 ALTER TABLE `society_moneywash` DISABLE KEYS */;
/*!40000 ALTER TABLE `society_moneywash` ENABLE KEYS */;

-- Listage de la structure de la table local. users
CREATE TABLE IF NOT EXISTS `users` (
  `identifier` varchar(46) NOT NULL,
  `accounts` longtext DEFAULT NULL,
  `group` varchar(50) DEFAULT 'user',
  `inventory` longtext DEFAULT NULL,
  `job` varchar(20) DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `loadout` longtext DEFAULT NULL,
  `position` longtext DEFAULT NULL,
  `firstname` varchar(16) DEFAULT NULL,
  `lastname` varchar(16) DEFAULT NULL,
  `dateofbirth` varchar(10) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `skin` longtext DEFAULT NULL,
  `status` longtext DEFAULT NULL,
  `is_dead` tinyint(1) DEFAULT 0,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `disabled` tinyint(1) DEFAULT 0,
  `last_property` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `last_seen` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `phone_number` varchar(20) DEFAULT NULL,
  `pincode` int(11) DEFAULT NULL,
  PRIMARY KEY (`identifier`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table local.users : ~2 rows (environ)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`identifier`, `accounts`, `group`, `inventory`, `job`, `job_grade`, `loadout`, `position`, `firstname`, `lastname`, `dateofbirth`, `sex`, `height`, `skin`, `status`, `is_dead`, `id`, `disabled`, `last_property`, `created_at`, `last_seen`, `phone_number`, `pincode`) VALUES
	('0c3ea31227c8666028082795ad0274e639c4b197', '{"bank":50200,"black_money":0,"money":0}', 'admin', '[]', 'unemployed', 0, '[]', '{"heading":206.92913818359376,"x":-254.88790893554688,"y":-980.7164916992188,"z":31.217529296875}', 'Oscar', 'Jimenez', '09/12/1993', 'm', 174, '{"ears_1":-1,"torso_1":0,"lipstick_3":0,"beard_1":0,"blush_3":0,"moles_2":0,"jaw_1":0,"nose_5":0,"sun_1":0,"bodyb_4":0,"complexion_1":0,"helmet_2":0,"mask_1":0,"skin_md_weight":50,"eyebrows_4":0,"blush_2":0,"face_md_weight":50,"chin_2":0,"bracelets_2":0,"chest_1":0,"shoes_2":0,"torso_2":0,"beard_2":0,"hair_color_2":0,"neck_thickness":0,"nose_3":0,"watches_1":-1,"chin_1":0,"moles_1":0,"beard_4":0,"bproof_1":0,"blemishes_1":0,"eyebrows_6":0,"nose_2":0,"mom":21,"decals_2":0,"glasses_1":0,"lipstick_1":0,"bodyb_3":-1,"helmet_1":-1,"bags_2":0,"eyebrows_5":0,"beard_3":0,"cheeks_1":0,"dad":0,"eyebrows_3":0,"eyebrows_2":0,"makeup_1":0,"age_1":0,"hair_color_1":0,"makeup_3":0,"eye_squint":0,"chain_2":0,"nose_4":0,"sex":0,"complexion_2":0,"chest_3":0,"bags_1":0,"makeup_2":0,"nose_1":0,"glasses_2":0,"cheeks_3":0,"decals_1":0,"watches_2":0,"ears_2":0,"mask_2":0,"chin_3":0,"chin_4":0,"eyebrows_1":0,"chest_2":0,"jaw_2":0,"lipstick_4":0,"eye_color":0,"blush_1":0,"pants_1":0,"blemishes_2":0,"bodyb_1":-1,"tshirt_2":0,"arms":0,"bracelets_1":-1,"bproof_2":0,"makeup_4":0,"pants_2":0,"lipstick_2":0,"tshirt_1":0,"lip_thickness":0,"chain_1":0,"cheeks_2":0,"sun_2":0,"age_2":0,"nose_6":0,"hair_1":0,"arms_2":0,"shoes_1":0,"hair_2":0,"bodyb_2":0}', '[{"val":979200,"name":"hunger","percent":97.92},{"val":984400,"name":"thirst","percent":98.44000000000001}]', 0, 3, 0, NULL, '2023-03-02 17:16:13', '2023-03-02 18:16:39', NULL, NULL),
	('467826b1f966aed6683f462c40b5cea8ad5b1a22', '{"money":7500,"black_money":0,"bank":3000}', 'admin', '[{"slot":1,"count":7500,"name":"money"},{"slot":2,"count":5,"name":"water"},{"slot":3,"count":5,"name":"bread"}]', 'unemployed', 0, '[]', '{"x":-1037.037353515625,"heading":240.94488525390626,"z":17.21533203125,"y":-816.6857299804688}', 'Kevin', 'Miller', '09/02/1999', 'm', 160, '{"blush_3":0,"ears_2":0,"beard_3":0,"age_1":0,"complexion_2":0,"helmet_1":-1,"makeup_2":0,"blemishes_2":0,"chain_1":0,"neck_thickness":0,"eyebrows_5":0,"glasses_1":0,"lipstick_4":0,"jaw_2":0,"eyebrows_2":0,"helmet_2":0,"beard_2":0,"bproof_1":0,"nose_1":0,"sun_1":0,"nose_3":0,"bags_1":0,"jaw_1":0,"lip_thickness":0,"chin_4":0,"eyebrows_1":0,"tshirt_1":0,"shoes_2":0,"bracelets_1":-1,"makeup_4":0,"mom":21,"face_md_weight":50,"decals_2":0,"bodyb_2":0,"complexion_1":0,"blemishes_1":0,"ears_1":-1,"makeup_1":0,"moles_2":0,"mask_1":0,"blush_2":0,"arms":0,"sex":0,"pants_2":0,"glasses_2":0,"dad":0,"chest_2":0,"eyebrows_3":0,"shoes_1":0,"decals_1":0,"lipstick_3":0,"eyebrows_6":0,"bracelets_2":0,"lipstick_2":0,"tshirt_2":0,"moles_1":0,"hair_color_1":0,"eyebrows_4":0,"nose_5":0,"cheeks_2":0,"hair_color_2":0,"chin_2":0,"hair_2":0,"chain_2":0,"eye_squint":0,"lipstick_1":0,"pants_1":0,"torso_2":0,"torso_1":0,"beard_4":0,"bodyb_3":-1,"sun_2":0,"watches_1":-1,"chin_1":0,"cheeks_1":0,"watches_2":0,"skin_md_weight":50,"cheeks_3":0,"bodyb_4":0,"eye_color":0,"nose_4":0,"chin_3":0,"bodyb_1":-1,"makeup_3":0,"arms_2":0,"chest_1":0,"chest_3":0,"bags_2":0,"beard_1":0,"bproof_2":0,"nose_2":0,"mask_2":0,"nose_6":0,"age_2":0,"blush_1":0,"hair_1":0}', '[]', 0, 4, 0, NULL, '2023-03-20 21:34:45', '2023-03-20 21:37:43', NULL, NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Listage de la structure de la table local. user_licenses
CREATE TABLE IF NOT EXISTS `user_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(60) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table local.user_licenses : ~0 rows (environ)
/*!40000 ALTER TABLE `user_licenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_licenses` ENABLE KEYS */;

-- Listage de la structure de la table local. vehicles
CREATE TABLE IF NOT EXISTS `vehicles` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table local.vehicles : ~240 rows (environ)
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Blade', 'blade', 15000, 'muscle'),
	('Buccaneer', 'buccaneer', 18000, 'muscle'),
	('Buccaneer Rider', 'buccaneer2', 24000, 'muscle'),
	('Chino', 'chino', 15000, 'muscle'),
	('Chino Luxe', 'chino2', 19000, 'muscle'),
	('Coquette BlackFin', 'coquette3', 55000, 'muscle'),
	('Dominator', 'dominator', 35000, 'muscle'),
	('Dukes', 'dukes', 28000, 'muscle'),
	('Gauntlet', 'gauntlet', 30000, 'muscle'),
	('Hotknife', 'hotknife', 125000, 'muscle'),
	('Faction', 'faction', 20000, 'muscle'),
	('Faction Rider', 'faction2', 30000, 'muscle'),
	('Faction XL', 'faction3', 40000, 'muscle'),
	('Nightshade', 'nightshade', 65000, 'muscle'),
	('Phoenix', 'phoenix', 12500, 'muscle'),
	('Picador', 'picador', 18000, 'muscle'),
	('Sabre Turbo', 'sabregt', 20000, 'muscle'),
	('Sabre GT', 'sabregt2', 25000, 'muscle'),
	('Slam Van', 'slamvan3', 11500, 'muscle'),
	('Tampa', 'tampa', 16000, 'muscle'),
	('Virgo', 'virgo', 14000, 'muscle'),
	('Vigero', 'vigero', 12500, 'muscle'),
	('Voodoo', 'voodoo', 7200, 'muscle'),
	('Blista', 'blista', 8000, 'compacts'),
	('Brioso R/A', 'brioso', 18000, 'compacts'),
	('Issi', 'issi2', 10000, 'compacts'),
	('Panto', 'panto', 10000, 'compacts'),
	('Prairie', 'prairie', 12000, 'compacts'),
	('Bison', 'bison', 45000, 'vans'),
	('Bobcat XL', 'bobcatxl', 32000, 'vans'),
	('Burrito', 'burrito3', 19000, 'vans'),
	('Burrito', 'gburrito2', 29000, 'vans'),
	('Camper', 'camper', 42000, 'vans'),
	('Gang Burrito', 'gburrito', 45000, 'vans'),
	('Journey', 'journey', 6500, 'vans'),
	('Minivan', 'minivan', 13000, 'vans'),
	('Moonbeam', 'moonbeam', 18000, 'vans'),
	('Moonbeam Rider', 'moonbeam2', 35000, 'vans'),
	('Paradise', 'paradise', 19000, 'vans'),
	('Rumpo', 'rumpo', 15000, 'vans'),
	('Rumpo Trail', 'rumpo3', 19500, 'vans'),
	('Surfer', 'surfer', 12000, 'vans'),
	('Youga', 'youga', 10800, 'vans'),
	('Youga Luxuary', 'youga2', 14500, 'vans'),
	('Asea', 'asea', 5500, 'sedans'),
	('Cognoscenti', 'cognoscenti', 55000, 'sedans'),
	('Emperor', 'emperor', 8500, 'sedans'),
	('Fugitive', 'fugitive', 12000, 'sedans'),
	('Glendale', 'glendale', 6500, 'sedans'),
	('Intruder', 'intruder', 7500, 'sedans'),
	('Premier', 'premier', 8000, 'sedans'),
	('Primo Custom', 'primo2', 14000, 'sedans'),
	('Regina', 'regina', 5000, 'sedans'),
	('Schafter', 'schafter2', 25000, 'sedans'),
	('Stretch', 'stretch', 90000, 'sedans'),
	('Super Diamond', 'superd', 130000, 'sedans'),
	('Tailgater', 'tailgater', 30000, 'sedans'),
	('Warrener', 'warrener', 4000, 'sedans'),
	('Washington', 'washington', 9000, 'sedans'),
	('Baller', 'baller2', 40000, 'suvs'),
	('Baller Sport', 'baller3', 60000, 'suvs'),
	('Cavalcade', 'cavalcade2', 55000, 'suvs'),
	('Contender', 'contender', 70000, 'suvs'),
	('Dubsta', 'dubsta', 45000, 'suvs'),
	('Dubsta Luxuary', 'dubsta2', 60000, 'suvs'),
	('Fhantom', 'fq2', 17000, 'suvs'),
	('Grabger', 'granger', 50000, 'suvs'),
	('Gresley', 'gresley', 47500, 'suvs'),
	('Huntley S', 'huntley', 40000, 'suvs'),
	('Landstalker', 'landstalker', 35000, 'suvs'),
	('Mesa', 'mesa', 16000, 'suvs'),
	('Mesa Trail', 'mesa3', 40000, 'suvs'),
	('Patriot', 'patriot', 55000, 'suvs'),
	('Radius', 'radi', 29000, 'suvs'),
	('Rocoto', 'rocoto', 45000, 'suvs'),
	('Seminole', 'seminole', 25000, 'suvs'),
	('XLS', 'xls', 32000, 'suvs'),
	('Btype', 'btype', 62000, 'sportsclassics'),
	('Btype Luxe', 'btype3', 85000, 'sportsclassics'),
	('Btype Hotroad', 'btype2', 155000, 'sportsclassics'),
	('Casco', 'casco', 30000, 'sportsclassics'),
	('Coquette Classic', 'coquette2', 40000, 'sportsclassics'),
	('Manana', 'manana', 12800, 'sportsclassics'),
	('Monroe', 'monroe', 55000, 'sportsclassics'),
	('Pigalle', 'pigalle', 20000, 'sportsclassics'),
	('Stinger', 'stinger', 80000, 'sportsclassics'),
	('Stinger GT', 'stingergt', 75000, 'sportsclassics'),
	('Stirling GT', 'feltzer3', 65000, 'sportsclassics'),
	('Z-Type', 'ztype', 220000, 'sportsclassics'),
	('Bifta', 'bifta', 12000, 'offroad'),
	('Bf Injection', 'bfinjection', 16000, 'offroad'),
	('Blazer', 'blazer', 6500, 'offroad'),
	('Blazer Sport', 'blazer4', 8500, 'offroad'),
	('Brawler', 'brawler', 45000, 'offroad'),
	('Bubsta 6x6', 'dubsta3', 120000, 'offroad'),
	('Dune Buggy', 'dune', 8000, 'offroad'),
	('Guardian', 'guardian', 45000, 'offroad'),
	('Rebel', 'rebel2', 35000, 'offroad'),
	('Sandking', 'sandking', 55000, 'offroad'),
	('The Liberator', 'monster', 210000, 'offroad'),
	('Trophy Truck', 'trophytruck', 60000, 'offroad'),
	('Trophy Truck Limited', 'trophytruck2', 80000, 'offroad'),
	('Cognoscenti Cabrio', 'cogcabrio', 55000, 'coupes'),
	('Exemplar', 'exemplar', 32000, 'coupes'),
	('F620', 'f620', 40000, 'coupes'),
	('Felon', 'felon', 42000, 'coupes'),
	('Felon GT', 'felon2', 55000, 'coupes'),
	('Jackal', 'jackal', 38000, 'coupes'),
	('Oracle XS', 'oracle2', 35000, 'coupes'),
	('Sentinel', 'sentinel', 32000, 'coupes'),
	('Sentinel XS', 'sentinel2', 40000, 'coupes'),
	('Windsor', 'windsor', 95000, 'coupes'),
	('Windsor Drop', 'windsor2', 125000, 'coupes'),
	('Zion', 'zion', 36000, 'coupes'),
	('Zion Cabrio', 'zion2', 45000, 'coupes'),
	('9F', 'ninef', 65000, 'sports'),
	('9F Cabrio', 'ninef2', 80000, 'sports'),
	('Alpha', 'alpha', 60000, 'sports'),
	('Banshee', 'banshee', 70000, 'sports'),
	('Bestia GTS', 'bestiagts', 55000, 'sports'),
	('Buffalo', 'buffalo', 12000, 'sports'),
	('Buffalo S', 'buffalo2', 20000, 'sports'),
	('Carbonizzare', 'carbonizzare', 75000, 'sports'),
	('Comet', 'comet2', 65000, 'sports'),
	('Coquette', 'coquette', 65000, 'sports'),
	('Drift Tampa', 'tampa2', 80000, 'sports'),
	('Elegy', 'elegy2', 38500, 'sports'),
	('Feltzer', 'feltzer2', 55000, 'sports'),
	('Furore GT', 'furoregt', 45000, 'sports'),
	('Fusilade', 'fusilade', 40000, 'sports'),
	('Jester', 'jester', 65000, 'sports'),
	('Jester(Racecar)', 'jester2', 135000, 'sports'),
	('Khamelion', 'khamelion', 38000, 'sports'),
	('Kuruma', 'kuruma', 30000, 'sports'),
	('Lynx', 'lynx', 40000, 'sports'),
	('Mamba', 'mamba', 70000, 'sports'),
	('Massacro', 'massacro', 65000, 'sports'),
	('Massacro(Racecar)', 'massacro2', 130000, 'sports'),
	('Omnis', 'omnis', 35000, 'sports'),
	('Penumbra', 'penumbra', 28000, 'sports'),
	('Rapid GT', 'rapidgt', 35000, 'sports'),
	('Rapid GT Convertible', 'rapidgt2', 45000, 'sports'),
	('Schafter V12', 'schafter3', 50000, 'sports'),
	('Seven 70', 'seven70', 39500, 'sports'),
	('Sultan', 'sultan', 15000, 'sports'),
	('Surano', 'surano', 50000, 'sports'),
	('Tropos', 'tropos', 40000, 'sports'),
	('Verlierer', 'verlierer2', 70000, 'sports'),
	('Adder', 'adder', 900000, 'super'),
	('Banshee 900R', 'banshee2', 255000, 'super'),
	('Bullet', 'bullet', 90000, 'super'),
	('Cheetah', 'cheetah', 375000, 'super'),
	('Entity XF', 'entityxf', 425000, 'super'),
	('ETR1', 'sheava', 220000, 'super'),
	('FMJ', 'fmj', 185000, 'super'),
	('Infernus', 'infernus', 180000, 'super'),
	('Osiris', 'osiris', 160000, 'super'),
	('Pfister', 'pfister811', 85000, 'super'),
	('RE-7B', 'le7b', 325000, 'super'),
	('Reaper', 'reaper', 150000, 'super'),
	('Sultan RS', 'sultanrs', 65000, 'super'),
	('T20', 't20', 300000, 'super'),
	('Turismo R', 'turismor', 350000, 'super'),
	('Tyrus', 'tyrus', 600000, 'super'),
	('Vacca', 'vacca', 120000, 'super'),
	('Voltic', 'voltic', 90000, 'super'),
	('X80 Proto', 'prototipo', 2500000, 'super'),
	('Zentorno', 'zentorno', 1500000, 'super'),
	('Akuma', 'AKUMA', 7500, 'motorcycles'),
	('Avarus', 'avarus', 18000, 'motorcycles'),
	('Bagger', 'bagger', 13500, 'motorcycles'),
	('Bati 801', 'bati', 12000, 'motorcycles'),
	('Bati 801RR', 'bati2', 19000, 'motorcycles'),
	('BF400', 'bf400', 6500, 'motorcycles'),
	('BMX (velo)', 'bmx', 160, 'motorcycles'),
	('Carbon RS', 'carbonrs', 18000, 'motorcycles'),
	('Chimera', 'chimera', 38000, 'motorcycles'),
	('Cliffhanger', 'cliffhanger', 9500, 'motorcycles'),
	('Cruiser (velo)', 'cruiser', 510, 'motorcycles'),
	('Daemon', 'daemon', 11500, 'motorcycles'),
	('Daemon High', 'daemon2', 13500, 'motorcycles'),
	('Defiler', 'defiler', 9800, 'motorcycles'),
	('Double T', 'double', 28000, 'motorcycles'),
	('Enduro', 'enduro', 5500, 'motorcycles'),
	('Esskey', 'esskey', 4200, 'motorcycles'),
	('Faggio', 'faggio', 1900, 'motorcycles'),
	('Vespa', 'faggio2', 2800, 'motorcycles'),
	('Fixter (velo)', 'fixter', 225, 'motorcycles'),
	('Gargoyle', 'gargoyle', 16500, 'motorcycles'),
	('Hakuchou', 'hakuchou', 31000, 'motorcycles'),
	('Hakuchou Sport', 'hakuchou2', 55000, 'motorcycles'),
	('Hexer', 'hexer', 12000, 'motorcycles'),
	('Innovation', 'innovation', 23500, 'motorcycles'),
	('Manchez', 'manchez', 5300, 'motorcycles'),
	('Nemesis', 'nemesis', 5800, 'motorcycles'),
	('Nightblade', 'nightblade', 35000, 'motorcycles'),
	('PCJ-600', 'pcj', 6200, 'motorcycles'),
	('Ruffian', 'ruffian', 6800, 'motorcycles'),
	('Sanchez', 'sanchez', 5300, 'motorcycles'),
	('Sanchez Sport', 'sanchez2', 5300, 'motorcycles'),
	('Sanctus', 'sanctus', 25000, 'motorcycles'),
	('Scorcher (velo)', 'scorcher', 280, 'motorcycles'),
	('Sovereign', 'sovereign', 22000, 'motorcycles'),
	('Shotaro Concept', 'shotaro', 320000, 'motorcycles'),
	('Thrust', 'thrust', 24000, 'motorcycles'),
	('Tri bike (velo)', 'tribike3', 520, 'motorcycles'),
	('Vader', 'vader', 7200, 'motorcycles'),
	('Vortex', 'vortex', 9800, 'motorcycles'),
	('Woflsbane', 'wolfsbane', 9000, 'motorcycles'),
	('Zombie', 'zombiea', 9500, 'motorcycles'),
	('Zombie Luxuary', 'zombieb', 12000, 'motorcycles'),
	('blazer5', 'blazer5', 1755600, 'offroad'),
	('Ruiner 2', 'ruiner2', 5745600, 'muscle'),
	('Voltic 2', 'voltic2', 3830400, 'super'),
	('Ardent', 'ardent', 1150000, 'sportsclassics'),
	('Oppressor', 'oppressor', 3524500, 'super'),
	('Visione', 'visione', 2250000, 'super'),
	('Retinue', 'retinue', 615000, 'sportsclassics'),
	('Cyclone', 'cyclone', 1890000, 'super'),
	('Rapid GT3', 'rapidgt3', 885000, 'sportsclassics'),
	('raiden', 'raiden', 1375000, 'sports'),
	('Yosemite', 'yosemite', 485000, 'muscle'),
	('Deluxo', 'deluxo', 4721500, 'sportsclassics'),
	('Pariah', 'pariah', 1420000, 'sports'),
	('Stromberg', 'stromberg', 3185350, 'sports'),
	('SC 1', 'sc1', 1603000, 'super'),
	('riata', 'riata', 380000, 'offroad'),
	('Hermes', 'hermes', 535000, 'muscle'),
	('Savestra', 'savestra', 990000, 'sportsclassics'),
	('Streiter', 'streiter', 500000, 'sports'),
	('Kamacho', 'kamacho', 345000, 'offroad'),
	('GT 500', 'gt500', 785000, 'sportsclassics'),
	('Z190', 'z190', 900000, 'sportsclassics'),
	('Viseris', 'viseris', 875000, 'sportsclassics'),
	('Autarch', 'autarch', 1955000, 'super'),
	('Comet 5', 'comet5', 1145000, 'sports'),
	('Neon', 'neon', 1500000, 'sports'),
	('Revolter', 'revolter', 1610000, 'sports'),
	('Sentinel3', 'sentinel3', 650000, 'sports'),
	('Hustler', 'hustler', 625000, 'muscle');
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;

-- Listage de la structure de la table local. vehicle_categories
CREATE TABLE IF NOT EXISTS `vehicle_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table local.vehicle_categories : ~11 rows (environ)
/*!40000 ALTER TABLE `vehicle_categories` DISABLE KEYS */;
INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
	('compacts', 'Compacts'),
	('coupes', 'Coupés'),
	('motorcycles', 'Motos'),
	('muscle', 'Muscle'),
	('offroad', 'Off Road'),
	('sedans', 'Sedans'),
	('sports', 'Sports'),
	('sportsclassics', 'Sports Classics'),
	('super', 'Super'),
	('suvs', 'SUVs'),
	('vans', 'Vans');
/*!40000 ALTER TABLE `vehicle_categories` ENABLE KEYS */;

-- Listage de la structure de la table local. vehicle_sold
CREATE TABLE IF NOT EXISTS `vehicle_sold` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `plate` varchar(50) NOT NULL,
  `soldby` varchar(50) NOT NULL,
  `date` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table local.vehicle_sold : ~0 rows (environ)
/*!40000 ALTER TABLE `vehicle_sold` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle_sold` ENABLE KEYS */;

-- Listage de la structure de la table local. whitelist
CREATE TABLE IF NOT EXISTS `whitelist` (
  `identifier` varchar(46) NOT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Listage des données de la table local.whitelist : ~0 rows (environ)
/*!40000 ALTER TABLE `whitelist` DISABLE KEYS */;
/*!40000 ALTER TABLE `whitelist` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
