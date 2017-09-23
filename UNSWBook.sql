/*
 Navicat Premium Data Transfer

 Source Server         : ass2
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : localhost
 Source Database       : UNSWBook

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : utf-8

 Date: 09/23/2017 17:23:56 PM
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `UNSWBookActivity`
-- ----------------------------
DROP TABLE IF EXISTS `UNSWBookActivity`;
CREATE TABLE `UNSWBookActivity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity` varchar(255) COLLATE utf8_bin NOT NULL,
  `time` datetime NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `UNSWBookActivity`
-- ----------------------------
BEGIN;
INSERT INTO `UNSWBookActivity` VALUES ('1', 'regist', '2017-09-23 12:15:23', '4'), ('2', 'post message: 123', '2017-09-23 15:13:18', '1'), ('3', 'post message: 123', '2017-09-23 15:13:31', '1'), ('4', 'post message: ad', '2017-09-23 15:18:25', '1'), ('5', 'post message: sd', '2017-09-23 15:18:30', '1'), ('6', 'post message: adaf', '2017-09-23 15:22:00', '2'), ('7', 'post message: as', '2017-09-23 15:22:11', '2'), ('8', 'post message: yeeees', '2017-09-23 15:28:24', '1');
COMMIT;

-- ----------------------------
--  Table structure for `UNSWBookAdmin`
-- ----------------------------
DROP TABLE IF EXISTS `UNSWBookAdmin`;
CREATE TABLE `UNSWBookAdmin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) COLLATE utf8_bin NOT NULL,
  `username` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `UNSWBookFriendship`
-- ----------------------------
DROP TABLE IF EXISTS `UNSWBookFriendship`;
CREATE TABLE `UNSWBookFriendship` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Fid` int(11) NOT NULL,
  `Uid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `UNSWBookFriendship`
-- ----------------------------
BEGIN;
INSERT INTO `UNSWBookFriendship` VALUES ('2', '0', '1'), ('6', '2', '1'), ('7', '1', '2'), ('1', '1', '0');
COMMIT;

-- ----------------------------
--  Table structure for `UNSWBookMessage`
-- ----------------------------
DROP TABLE IF EXISTS `UNSWBookMessage`;
CREATE TABLE `UNSWBookMessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `time` datetime NOT NULL,
  `thumbUp` int(11) NOT NULL DEFAULT '0',
  `thumbDown` int(11) NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `UNSWBookMessage`
-- ----------------------------
BEGIN;
INSERT INTO `UNSWBookMessage` VALUES ('1', '0', 'abab', null, null, '2017-09-22 15:43:04', '1', '0', 'tba'), ('3', '1', '123', '321', null, '2017-09-23 15:13:18', '0', '0', '131'), ('4', '1', '123', '321', null, '2017-09-23 15:13:31', '0', '0', '131'), ('5', '1', 'ad', 'df', null, '2017-09-23 15:18:25', '0', '0', 'pdf'), ('6', '1', 'sd', 'ds', null, '2017-09-23 15:18:30', '0', '0', 'sds'), ('7', '2', 'adaf', 'adad', null, '2017-09-23 15:22:00', '0', '0', 'asad'), ('8', '2', 'as', 'as', null, '2017-09-23 15:22:11', '0', '0', 'asad'), ('9', '1', 'yeeees', 'yeees', null, '2017-09-23 15:28:24', '0', '0', 'yes');
COMMIT;

-- ----------------------------
--  Table structure for `UNSWBookUser`
-- ----------------------------
DROP TABLE IF EXISTS `UNSWBookUser`;
CREATE TABLE `UNSWBookUser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DoB` date NOT NULL,
  `emailAddress` varchar(255) COLLATE utf8_bin NOT NULL,
  `gender` varchar(255) COLLATE utf8_bin NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `password` varchar(255) COLLATE utf8_bin NOT NULL,
  `photo` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `UNSWBookUser`
-- ----------------------------
BEGIN;
INSERT INTO `UNSWBookUser` VALUES ('1', '2017-09-22', '123@163.com', 'male', '123', 'bbb', null, 'aaa'), ('2', '1990-02-01', 'aka@gmail.com', 'male', 'aka', 'aka', null, 'aka'), ('3', '1990-02-01', 'abc@gmail.com', 'male', 'abc', 'abc', null, 'abs'), ('4', '1990-02-01', 'iiikkk@gmail.com', 'male', 'iiikkk', 'iiikkk', null, 'iiikkk');
COMMIT;

-- ----------------------------
--  Table structure for `UNSWBookVote`
-- ----------------------------
DROP TABLE IF EXISTS `UNSWBookVote`;
CREATE TABLE `UNSWBookVote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `messageId` int(11) NOT NULL,
  `thumbUp` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `UNSWBookVote`
-- ----------------------------
BEGIN;
INSERT INTO `UNSWBookVote` VALUES ('1', '2', '1', '1');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
