CREATE DATABASE IF NOT EXISTS `mobiledatabase`;
USE `mobiledatabase`;

CREATE TABLE IF NOT EXISTS `mobileclassify` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `mobileclassify` (`id`, `name`) VALUES
	(1, 'iOS手机'),
	(2, 'Android手机');

CREATE TABLE IF NOT EXISTS `mobileform` (
  `mobile_version` char(30) NOT NULL,
  `mobile_name` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci DEFAULT NULL,
  `mobile_made` varchar(20) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci DEFAULT NULL,
  `mobile_price` float DEFAULT NULL,
  `mobile_mess` varchar(600) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci DEFAULT NULL,
  `mobile_pic` varchar(20) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`mobile_version`),
  KEY `id` (`id`),
  CONSTRAINT `mobileform_ibfk_1` FOREIGN KEY (`id`) REFERENCES `mobileclassify` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `mobileform` (`mobile_version`, `mobile_name`, `mobile_made`, `mobile_price`, `mobile_mess`, `mobile_pic`, `id`) VALUES
	('A1699', 'Apple iPhone6s plus', '苹果公司', 5999, '128G金色', 'apple2.jpg', 1),
	('A2223', 'Apple iPhone11', '苹果公司', 5999, '128G黑色', 'apple1.jpg', 1),
	('HW658', 'Huawei P30', '华为公司', 4698, '128G蓝色', 'huawei2.jpg', 2),
	('HW987', 'Huawei mate30 Pro', '华为公司', 5798, '128G黑色', 'huawei1.jpg', 2),
	('XM123', '小米9 Pro5G', '小米公司', 4398, '128G蓝色', 'xiaomi1.jpg', 2),
	('XM567', '红米 note8', '小米公司', 1099, '64G红色', 'xiaomi2.jpg', 2);

CREATE TABLE IF NOT EXISTS `orderform` (
  `orderNumber` int NOT NULL AUTO_INCREMENT,
  `logname` char(30) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci DEFAULT NULL,
  `mess` varchar(5000) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci DEFAULT NULL,
  PRIMARY KEY (`orderNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE IF NOT EXISTS `shoppingform` (
  `goodsId` char(30) NOT NULL,
  `logname` char(30) NOT NULL,
  `goodsName` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci DEFAULT NULL,
  `goodsPrice` float DEFAULT NULL,
  `goodsAmount` int DEFAULT NULL,
  KEY `logname` (`logname`),
  CONSTRAINT `shoppingform_ibfk_1` FOREIGN KEY (`logname`) REFERENCES `user` (`logname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE IF NOT EXISTS `user` (
  `logname` char(30) NOT NULL,
  `password` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone` char(20) DEFAULT NULL,
  `addess` char(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci DEFAULT NULL,
  `realname` char(60) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci DEFAULT NULL,
  PRIMARY KEY (`logname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

