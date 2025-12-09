-- 创建数据库
CREATE DATABASE IF NOT EXISTS `antechou` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE `antechou`;

-- 创建account表 - 用户账号表
CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mailbox` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `lost_ip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建user表 - 用户信息表
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `birthday` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `introduction` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `aid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aid` (`aid`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`aid`) REFERENCES `account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建ttype表 - 账单类型表
CREATE TABLE `ttype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  CONSTRAINT `ttype_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建tlist表 - 账单表
CREATE TABLE `tlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `in_ex` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `tid` int(11) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `datetime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `tid` (`tid`),
  CONSTRAINT `tlist_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`id`),
  CONSTRAINT `tlist_ibfk_2` FOREIGN KEY (`tid`) REFERENCES `ttype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 创建ip表 - IP记录表
CREATE TABLE `ip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) DEFAULT NULL,
  `datetime` varchar(255) DEFAULT NULL,
  `aid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aid` (`aid`),
  KEY `uid` (`uid`),
  CONSTRAINT `ip_ibfk_1` FOREIGN KEY (`aid`) REFERENCES `account` (`id`),
  CONSTRAINT `ip_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
