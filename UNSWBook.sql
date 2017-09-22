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

 Date: 09/22/2017 21:14:58 PM
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `UNSWBookFriendship`
-- ----------------------------
BEGIN;
INSERT INTO `UNSWBookFriendship` VALUES ('2', '0', '1'), ('1', '1', '0');
COMMIT;

-- ----------------------------
--  Table structure for `UNSWBookLike`
-- ----------------------------
DROP TABLE IF EXISTS `UNSWBookLike`;
CREATE TABLE `UNSWBookLike` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `messageId` int(11) NOT NULL,
  `like` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `UNSWBookLike`
-- ----------------------------
BEGIN;
INSERT INTO `UNSWBookLike` VALUES ('1', '2', '1', '1');
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
  `like` int(11) NOT NULL DEFAULT '0',
  `unlike` int(11) NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `UNSWBookMessage`
-- ----------------------------
BEGIN;
INSERT INTO `UNSWBookMessage` VALUES ('1', '0', 'abab', null, null, '2017-09-22 15:43:04', '1', '0', 'tba');
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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `UNSWBookUser`
-- ----------------------------
BEGIN;
INSERT INTO `UNSWBookUser` VALUES ('1', '2017-09-22', '123@163.com', 'male', '123', 'bbb', null, 'aaa'), ('2', '1990-02-01', 'aka@gmail.com', 'male', 'aka', 'aka', null, 'aka'), ('3', '1990-02-01', 'abc@gmail.com', 'male', 'abc', 'abc', null, 'abs');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
