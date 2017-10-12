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

 Date: 10/02/2017 23:24:26 PM
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
) ENGINE=MyISAM AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `UNSWBookActivity`
-- ----------------------------
BEGIN;
INSERT INTO `UNSWBookActivity` VALUES ('1', 'regist', '2017-09-23 12:15:23', '4'), ('2', 'post message: 123', '2017-09-23 15:13:18', '1'), ('3', 'post message: 123', '2017-09-23 15:13:31', '1'), ('4', 'post message: ad', '2017-09-23 15:18:25', '1'), ('5', 'post message: sd', '2017-09-23 15:18:30', '1'), ('6', 'post message: adaf', '2017-09-23 15:22:00', '2'), ('7', 'post message: as', '2017-09-23 15:22:11', '2'), ('8', 'post message: yeeees', '2017-09-23 15:28:24', '1'), ('27', 'regist', '2017-09-25 17:28:49', '18'), ('28', 'regist', '2017-09-25 17:38:44', '19'), ('29', 'regist', '2017-09-25 17:41:18', '20'), ('30', 'regist', '2017-09-25 17:43:47', '21'), ('31', 'post message: ', '2017-09-25 17:44:10', '21'), ('32', '1 send friend request to 21', '2017-09-27 10:37:14', '1'), ('33', '1 send friend request to 21', '2017-09-27 10:41:15', '1'), ('34', '1 send friend request to 21', '2017-09-27 10:42:57', '1'), ('35', 'post message: test', '2017-09-28 13:44:23', '1'), ('36', 'post message: test', '2017-09-28 13:44:32', '1'), ('37', 'regist', '2017-09-28 14:14:11', '22'), ('38', 'regist', '2017-09-28 14:17:01', '23'), ('39', 'regist', '2017-09-28 14:24:42', '24'), ('40', 'post message: etasf', '2017-09-28 16:22:26', '1'), ('41', 'post message: tset', '2017-09-28 17:13:08', '1'), ('42', 'post message: test', '2017-09-28 17:15:44', '1'), ('43', 'post message: teset ', '2017-09-28 17:16:19', '1'), ('44', 'post message: tset', '2017-09-28 17:20:14', '1'), ('45', 'post message: test', '2017-09-28 17:30:55', '1'), ('46', 'post message: test', '2017-09-28 17:48:57', '1'), ('47', 'post message: set', '2017-09-28 17:52:18', '2'), ('48', 'post message: ets', '2017-09-28 17:55:24', '1'), ('49', 'post message: etst', '2017-09-29 15:25:43', '2'), ('50', '2 send friend request to 2', '2017-09-29 17:29:22', '2'), ('51', 'post message: set', '2017-09-29 18:00:00', '1'), ('52', 'regist', '2017-09-30 13:14:46', '25'), ('53', 'regist', '2017-09-30 16:40:38', '26'), ('54', '1 send friend request to 26', '2017-09-30 16:41:39', '1'), ('55', 'accept friend request from 1', '2017-09-30 16:42:04', '26'), ('56', 'post message: tests', '2017-09-30 17:44:01', '1'), ('57', 'post message: ', '2017-10-01 20:29:46', '1'), ('58', 'post message: ', '2017-10-01 20:29:48', '1'), ('59', 'post message: ', '2017-10-01 20:29:49', '1'), ('60', 'post message: ', '2017-10-01 20:29:49', '1'), ('61', 'regist', '2017-10-01 22:22:28', '27'), ('62', 'post message: lasttest', '2017-10-01 22:33:06', '1');
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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `UNSWBookAdmin`
-- ----------------------------
BEGIN;
INSERT INTO `UNSWBookAdmin` VALUES ('1', '132', 'acb'), ('2', 'admin', 'admin');
COMMIT;

-- ----------------------------
--  Table structure for `UNSWBookFriendship`
-- ----------------------------
DROP TABLE IF EXISTS `UNSWBookFriendship`;
CREATE TABLE `UNSWBookFriendship` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Fid` int(11) NOT NULL,
  `Uid` int(11) NOT NULL,
  `status` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `UNSWBookFriendship`
-- ----------------------------
BEGIN;
INSERT INTO `UNSWBookFriendship` VALUES ('2', '0', '1', '1'), ('6', '2', '1', '1'), ('7', '1', '2', '1'), ('1', '1', '0', '1'), ('21', '1', '14', '1'), ('20', '14', '1', '1'), ('26', '21', '1', '0'), ('27', '1', '21', '0'), ('28', '2', '2', '0'), ('29', '2', '2', '0'), ('30', '26', '1', '1'), ('31', '1', '26', '1');
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `UNSWBookMessage`
-- ----------------------------
BEGIN;
INSERT INTO `UNSWBookMessage` VALUES ('7', '2', 'adaf', 'adad', null, '2017-09-23 15:22:00', '0', '0', 'asad'), ('8', '2', 'as', 'as', null, '2017-09-23 15:22:11', '1', '0', 'asad'), ('22', '2', 'etst', 'tset', '22017-09-29 15:25:43.3771505881097604.jpg', '2017-09-29 15:25:43', '1', '0', 'test'), ('23', '1', 'set', 'set', '12017-09-29 18:00:00.3191505881097604.jpg', '2017-09-29 18:00:00', '0', '0', 'et'), ('26', '1', '', '', '12017-10-01 20:29:48.224', '2017-10-01 20:29:48', '0', '0', ''), ('27', '1', '', '', '12017-10-01 20:29:49.02', '2017-10-01 20:29:49', '0', '0', ''), ('28', '1', '', '', '12017-10-01 20:29:49.279', '2017-10-01 20:29:49', '0', '0', ''), ('29', '1', 'lasttest', '', '12017-10-01 22:33:06.391', '2017-10-01 22:33:06', '0', '0', '');
COMMIT;

-- ----------------------------
--  Table structure for `UNSWBookNotification`
-- ----------------------------
DROP TABLE IF EXISTS `UNSWBookNotification`;
CREATE TABLE `UNSWBookNotification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Uid` int(11) NOT NULL,
  `text` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `UNSWBookNotification`
-- ----------------------------
BEGIN;
INSERT INTO `UNSWBookNotification` VALUES ('31', '1', 'aka like your post!', 'Some one like your post!', '2017-10-01 21:27:41');
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
  `photo` varchar(255) COLLATE utf8_bin DEFAULT 'default.jpeg',
  `username` varchar(255) COLLATE utf8_bin NOT NULL,
  `status` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `code` varchar(255) COLLATE utf8_bin NOT NULL,
  `activateTime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `UNSWBookUser`
-- ----------------------------
BEGIN;
INSERT INTO `UNSWBookUser` VALUES ('1', '1990-02-01', '123@163.com', 'male', '123', 'bbb', '1505881097604.jpg', 'aaa', '1', '1', '2017-09-25 13:38:40'), ('2', '1994-03-01', 'aka@gmail.com', 'male', 'aka', 'aka', 'default.jpeg', 'aka', '1', '1', '2017-09-25 13:38:40'), ('3', '1999-07-11', 'abc@gmail.com', 'male', 'abc', 'abc', 'default.jpeg', 'abs', '1', '1', '2017-09-25 13:38:40'), ('4', '1980-12-21', 'iiikkk@gmail.com', 'male', 'iiikkk', 'iiikkk', 'default.jpeg', 'iiikkk', '1', '1', '2017-09-25 13:38:40'), ('26', '1975-01-01', 'congshibo018@gmail.com', 'male', 'testname', 'test', 'default.jpeg', 'test', '1', '3ae265e8434815047e19f00d484b4b79', '2017-10-01 17:40:21'), ('27', '1998-08-13', 'jpchen213177@gmail.com', 'male', 'jpchen', 'jppassword', 'default.jpeg', 'jp', '1', 'ef95d81c0d2c2560eceafb62e0a17b38', '2017-10-02 22:22:06');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `UNSWBookVote`
-- ----------------------------
BEGIN;
INSERT INTO `UNSWBookVote` VALUES ('1', '2', '1', '0'), ('5', '1', '22', '1'), ('6', '1', '8', '1'), ('7', '1', '7', '0');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
