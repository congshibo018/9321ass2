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

 Date: 10/16/2017 15:18:40 PM
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
) ENGINE=MyISAM AUTO_INCREMENT=183 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `UNSWBookActivity`
-- ----------------------------
BEGIN;
INSERT INTO `UNSWBookActivity` VALUES ('1', 'regist', '2017-09-23 12:15:23', '4'), ('2', 'post message: 123', '2017-09-23 15:13:18', '1'), ('3', 'post message: 123', '2017-09-23 15:13:31', '1'), ('4', 'post message: ad', '2017-09-23 15:18:25', '1'), ('5', 'post message: sd', '2017-09-23 15:18:30', '1'), ('6', 'post message: adaf', '2017-09-23 15:22:00', '2'), ('7', 'post message: as', '2017-09-23 15:22:11', '2'), ('8', 'post message: yeeees', '2017-09-23 15:28:24', '1'), ('27', 'regist', '2017-09-25 17:28:49', '18'), ('28', 'regist', '2017-09-25 17:38:44', '19'), ('29', 'regist', '2017-09-25 17:41:18', '20'), ('30', 'regist', '2017-09-25 17:43:47', '21'), ('31', 'post message: ', '2017-09-25 17:44:10', '21'), ('32', '1 send friend request to 21', '2017-09-27 10:37:14', '1'), ('33', '1 send friend request to 21', '2017-09-27 10:41:15', '1'), ('34', '1 send friend request to 21', '2017-09-27 10:42:57', '1'), ('35', 'post message: test', '2017-09-28 13:44:23', '1'), ('36', 'post message: test', '2017-09-28 13:44:32', '1'), ('37', 'regist', '2017-09-28 14:14:11', '22'), ('38', 'regist', '2017-09-28 14:17:01', '23'), ('39', 'regist', '2017-09-28 14:24:42', '24'), ('40', 'post message: etasf', '2017-09-28 16:22:26', '1'), ('41', 'post message: tset', '2017-09-28 17:13:08', '1'), ('42', 'post message: test', '2017-09-28 17:15:44', '1'), ('43', 'post message: teset ', '2017-09-28 17:16:19', '1'), ('44', 'post message: tset', '2017-09-28 17:20:14', '1'), ('45', 'post message: test', '2017-09-28 17:30:55', '1'), ('46', 'post message: test', '2017-09-28 17:48:57', '1'), ('47', 'post message: set', '2017-09-28 17:52:18', '2'), ('48', 'post message: ets', '2017-09-28 17:55:24', '1'), ('49', 'post message: etst', '2017-09-29 15:25:43', '2'), ('50', '2 send friend request to 2', '2017-09-29 17:29:22', '2'), ('51', 'post message: set', '2017-09-29 18:00:00', '1'), ('52', 'regist', '2017-09-30 13:14:46', '25'), ('53', 'regist', '2017-09-30 16:40:38', '26'), ('54', '1 send friend request to 26', '2017-09-30 16:41:39', '1'), ('55', 'accept friend request from 1', '2017-09-30 16:42:04', '26'), ('56', 'post message: tests', '2017-09-30 17:44:01', '1'), ('57', 'post message: ', '2017-10-01 20:29:46', '1'), ('58', 'post message: ', '2017-10-01 20:29:48', '1'), ('59', 'post message: ', '2017-10-01 20:29:49', '1'), ('60', 'post message: ', '2017-10-01 20:29:49', '1'), ('61', 'regist', '2017-10-01 22:22:28', '27'), ('62', 'post message: lasttest', '2017-10-01 22:33:06', '1'), ('63', 'post message: last test', '2017-10-03 12:46:00', '1'), ('64', 'post message: ', '2017-10-03 12:49:39', '1'), ('65', 'post message: ', '2017-10-03 12:50:49', '1'), ('66', 'post message: ', '2017-10-03 12:51:12', '1'), ('67', 'post message: ', '2017-10-03 12:57:58', '1'), ('68', 'post message: ', '2017-10-03 13:02:00', '1'), ('69', 'post message: ', '2017-10-03 13:02:22', '1'), ('70', 'post message: ', '2017-10-03 13:02:39', '1'), ('71', 'post message: ', '2017-10-03 13:04:50', '1'), ('72', 'post message: ', '2017-10-03 13:09:27', '1'), ('73', 'post message: ', '2017-10-03 13:09:43', '1'), ('74', 'post message: ', '2017-10-03 13:10:40', '1'), ('75', 'post message: test null', '2017-10-03 13:14:24', '1'), ('76', 'post message: cute dogge', '2017-10-03 13:31:49', '2'), ('77', 'post message: test null', '2017-10-03 13:38:40', '1'), ('78', 'post message: dogge', '2017-10-03 13:46:25', '2'), ('79', 'post message: Am I doing well?', '2017-10-03 13:47:04', '2'), ('80', 'post message: test now', '2017-10-03 13:47:31', '2'), ('81', 'post message: 9321 made me exausted', '2017-10-03 13:50:45', '2'), ('82', 'post message: No picture will works', '2017-10-03 13:51:31', '2'), ('83', 'registe', '2017-10-03 13:56:28', '28'), ('84', 'post message: test now', '2017-10-03 14:01:59', '1'), ('85', 'post message: cute dog', '2017-10-03 14:06:40', '2'), ('86', 'post message: UNSW', '2017-10-03 14:07:40', '2'), ('87', 'post message: Am I right?', '2017-10-03 14:08:09', '2'), ('88', '2 send friend request to 26', '2017-10-03 14:13:42', '2'), ('89', 'accept friend request from 2', '2017-10-03 14:14:15', '26'), ('90', 'post message: No picture will works', '2017-10-03 14:15:42', '26'), ('91', 'post message: cute dog', '2017-10-03 14:19:51', '2'), ('92', 'post message: Boring test', '2017-10-03 14:20:15', '2'), ('93', 'post message: UNSW', '2017-10-03 14:20:32', '2'), ('94', 'post message: Am I right?', '2017-10-03 14:20:47', '2'), ('95', 'post message: test dog', '2017-10-03 14:32:34', '2'), ('96', 'post message: endless test', '2017-10-03 14:32:49', '2'), ('97', 'post message: UNSW ', '2017-10-03 14:33:04', '2'), ('98', 'post message: Am I right?', '2017-10-03 14:33:16', '2'), ('99', 'post message: a', '2017-10-03 14:36:48', '2'), ('100', 'post message: test dog', '2017-10-03 14:39:04', '2'), ('101', 'post message: endless test', '2017-10-03 14:39:19', '2'), ('102', 'post message: UNSW', '2017-10-03 14:39:33', '2'), ('103', 'post message: Am I right?', '2017-10-03 14:39:41', '2'), ('104', 'post message: please', '2017-10-03 14:43:41', '2'), ('105', 'post message: test dog', '2017-10-03 14:43:57', '2'), ('106', 'post message: UNSW', '2017-10-03 14:44:11', '2'), ('107', 'post message: Am I right?', '2017-10-03 14:44:21', '2'), ('108', 'registe', '2017-10-03 16:05:39', '29'), ('109', '1 send friend request to 29', '2017-10-03 16:16:37', '1'), ('110', 'accept friend request from 1', '2017-10-03 16:17:03', '29'), ('111', '28 send friend request to 29', '2017-10-03 16:18:54', '28'), ('112', 'accept friend request from 28', '2017-10-03 16:19:18', '29'), ('113', 'post message: etst', '2017-10-03 16:22:51', '29'), ('114', 'post message: test', '2017-10-03 16:23:05', '29'), ('115', 'post message: ', '2017-10-11 15:02:08', '28'), ('116', 'post message: ', '2017-10-11 15:04:02', '28'), ('117', 'post message: ', '2017-10-11 15:04:51', '28'), ('118', 'post message: ', '2017-10-11 15:09:50', '28'), ('119', 'post message: ag', '2017-10-11 15:45:59', '28'), ('120', 'post message: ', '2017-10-11 15:50:14', '28'), ('121', 'post message: ', '2017-10-11 15:53:01', '28'), ('122', 'post message: ', '2017-10-11 15:53:56', '28'), ('123', 'post message: ', '2017-10-11 16:02:36', '28'), ('124', 'post message: ', '2017-10-11 16:03:01', '28'), ('125', 'post message: ', '2017-10-11 16:04:35', '28'), ('126', 'post message: ', '2017-10-11 16:18:18', '28'), ('127', 'post message: ', '2017-10-11 16:19:23', '28'), ('128', 'post message: ', '2017-10-11 16:29:30', '28'), ('129', 'post message: ', '2017-10-11 16:31:20', '28'), ('130', 'post message: ', '2017-10-11 16:34:00', '28'), ('131', 'post message: ', '2017-10-11 16:35:54', '28'), ('132', 'post message: ', '2017-10-11 16:37:23', '28'), ('133', 'post message: ', '2017-10-11 16:38:07', '28'), ('134', 'post message: ', '2017-10-11 16:38:15', '28'), ('135', 'post message: ', '2017-10-11 16:40:30', '28'), ('136', 'post message: ', '2017-10-11 16:42:05', '28'), ('137', 'post message: ', '2017-10-11 17:48:17', '28'), ('138', 'post message: ', '2017-10-11 17:48:36', '28'), ('139', 'post message: ', '2017-10-11 17:48:46', '28'), ('140', 'post message: ', '2017-10-11 17:48:51', '28'), ('141', 'post message: ', '2017-10-11 17:51:42', '28'), ('142', 'post message: ', '2017-10-11 17:52:37', '28'), ('143', 'post message: ', '2017-10-11 17:52:42', '28'), ('144', 'post message: ', '2017-10-11 17:52:50', '28'), ('145', 'post message: ', '2017-10-11 17:53:12', '28'), ('146', 'post message: ', '2017-10-11 17:53:49', '28'), ('147', 'post message: ', '2017-10-11 17:53:53', '28'), ('148', 'post message: ', '2017-10-11 17:55:14', '28'), ('149', 'post message: ', '2017-10-11 17:55:22', '28'), ('150', 'post message: ', '2017-10-11 17:55:31', '28'), ('151', 'post message: ', '2017-10-11 17:57:54', '28'), ('152', 'post message: ', '2017-10-11 18:00:46', '28'), ('153', 'post message: ', '2017-10-11 18:02:12', '28'), ('154', 'post message: ', '2017-10-11 18:04:16', '28'), ('155', 'post message: ', '2017-10-11 18:05:53', '28'), ('156', 'post message: ', '2017-10-11 18:08:01', '28'), ('157', 'post message: ', '2017-10-11 18:13:55', '28'), ('158', 'post message: ', '2017-10-11 18:16:12', '28'), ('159', 'post message: ', '2017-10-11 18:19:35', '28'), ('160', 'post message: ', '2017-10-11 18:25:17', '28'), ('161', 'post message: ', '2017-10-11 18:25:45', '28'), ('162', 'post message: ', '2017-10-11 18:25:49', '28'), ('163', 'post message: ', '2017-10-12 18:50:00', '28'), ('164', 'post message: ', '2017-10-12 18:52:56', '28'), ('165', 'post message: ', '2017-10-12 18:53:34', '28'), ('166', 'post message: ', '2017-10-12 19:17:41', '28'), ('167', 'post message: ', '2017-10-12 19:17:41', '28'), ('168', 'post message: ', '2017-10-12 19:20:51', '28'), ('169', 'post message: ', '2017-10-12 19:20:51', '28'), ('170', 'post message: ', '2017-10-13 14:08:58', '28'), ('171', 'post message: ', '2017-10-13 14:12:32', '28'), ('172', 'post message: try', '2017-10-13 14:22:03', '28'), ('173', 'post message: tt', '2017-10-13 14:25:34', '28'), ('174', 'post message: tr', '2017-10-13 14:37:49', '28'), ('175', 'post message: re', '2017-10-13 14:51:20', '28'), ('176', 'post message: gan', '2017-10-13 15:00:47', '28'), ('177', 'post message: fuc', '2017-10-13 15:01:25', '28'), ('178', 'post message: haha', '2017-10-13 15:13:54', '28'), ('179', 'post message: bbubu', '2017-10-13 15:15:12', '28'), ('180', 'post message: matt', '2017-10-13 15:16:56', '28'), ('181', 'post message: prprpr', '2017-10-13 16:06:28', '28'), ('182', 'registe', '2017-10-15 12:26:05', '30');
COMMIT;

-- ----------------------------
--  Table structure for `UNSWBookAdmin`
-- ----------------------------
DROP TABLE IF EXISTS `UNSWBookAdmin`;
CREATE TABLE `UNSWBookAdmin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) COLLATE utf8_bin NOT NULL,
  `username` varchar(255) COLLATE utf8_bin NOT NULL,
  `emailAddress` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `UNSWBookAdmin`
-- ----------------------------
BEGIN;
INSERT INTO `UNSWBookAdmin` VALUES ('1', '132', 'acb', 'acb@gmail.com'), ('2', 'admin', 'admin', 'congshibo018@gmail.com');
COMMIT;

-- ----------------------------
--  Table structure for `UNSWBookEntity`
-- ----------------------------
DROP TABLE IF EXISTS `UNSWBookEntity`;
CREATE TABLE `UNSWBookEntity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entityId` varchar(255) NOT NULL,
  `entityAttribute` varchar(255) NOT NULL,
  `attributeValue` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `UNSWBookEntity`
-- ----------------------------
BEGIN;
INSERT INTO `UNSWBookEntity` VALUES ('1', 'E1', 'Type', 'directedLink'), ('2', 'E1', 'Class', 'edge'), ('3', 'E1', 'Label', 'friendOf'), ('4', 'E2', 'Type', 'directedLink'), ('5', 'E2', 'Class', 'edge'), ('6', 'E2', 'Label', 'posted'), ('7', 'E3', 'Type', 'directedLink'), ('8', 'E3', 'Class', 'edge'), ('9', 'E3', 'Label', 'liked'), ('10', 'E4', 'Type', 'directedLink'), ('11', 'E4', 'Class', 'edge'), ('12', 'E4', 'Label', 'disliked'), ('28', 'M137', 'Type', 'Message'), ('29', 'M137', 'Class', 'entityNode'), ('30', 'M137', 'Title', 'mattMessage'), ('31', 'M138', 'Type', 'Message'), ('32', 'M138', 'Class', 'entityNode'), ('33', 'M138', 'Title', 'prprpr'), ('34', 'P30', 'Type', 'Person'), ('35', 'P30', 'Class', 'entityNode'), ('36', 'P30', 'Name', 'alex'), ('37', 'M72', 'Type', 'Message'), ('38', 'M72', 'Class', 'entityNode'), ('39', 'M72', 'Title', 'haha'), ('40', 'P28', 'Type', 'Person'), ('41', 'P28', 'Class', 'entityNode'), ('42', 'P28', 'Name', 'matt'), ('43', 'P1', 'Name', 'test1'), ('44', 'P2', 'Name', 'test2');
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
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `UNSWBookFriendship`
-- ----------------------------
BEGIN;
INSERT INTO `UNSWBookFriendship` VALUES ('2', '0', '1', '1'), ('6', '2', '1', '1'), ('7', '1', '2', '1'), ('1', '1', '0', '1'), ('21', '1', '14', '1'), ('20', '14', '1', '1'), ('26', '21', '1', '0'), ('27', '1', '21', '0'), ('28', '2', '2', '0'), ('29', '2', '2', '0'), ('30', '26', '1', '1'), ('31', '1', '26', '1'), ('32', '26', '2', '1'), ('33', '2', '26', '1'), ('34', '29', '1', '1'), ('35', '1', '29', '1'), ('36', '29', '28', '1'), ('37', '28', '29', '1');
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
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `UNSWBookMessage`
-- ----------------------------
BEGIN;
INSERT INTO `UNSWBookMessage` VALUES ('54', '26', 'No picture will works', '', 'nopic.jpg', '2017-10-03 14:15:42', '0', '0', ''), ('68', '2', 'please', 'be right', '22017-10-03 14:43:40.668e53f2a91132e99d1a060bcfecc25d3b2.jpg', '2017-10-03 14:43:41', '1', '0', ''), ('69', '2', 'test dog', 'test post', '22017-10-03 14:43:57.4621f6c06368fa1766e03e8d597931ac409.jpg', '2017-10-03 14:43:57', '0', '0', ''), ('70', '2', 'UNSW', 'you never sleep well', '22017-10-03 14:44:10.9294f9db78474f14d802bc3711fb78b019e.jpg', '2017-10-03 14:44:11', '0', '0', ''), ('71', '2', 'Am I right?', '', '22017-10-03 14:44:20.879aa4d0ee2b67d411f3ecf5ea4b6f5b497.jpeg', '2017-10-03 14:44:21', '0', '0', ''), ('72', '29', 'etst', 'tset', 'nopic.jpg', '2017-10-03 16:22:51', '1', '0', ''), ('73', '29', 'test', 'test', '292017-10-03 16:23:04.621aa4d0ee2b67d411f3ecf5ea4b6f5b497.jpeg', '2017-10-03 16:23:05', '1', '0', 'tset'), ('124', '28', '', 'abuse', 'nopic.jpg', '2017-10-12 18:53:34', '0', '0', ''), ('125', '28', '', 'abuse', 'nopic.jpg', '2017-10-12 19:17:41', '0', '0', ''), ('126', '28', '', 'abuse', 'nopic.jpg', '2017-10-12 19:20:51', '0', '0', ''), ('127', '28', '', 'try\r\n', 'nopic.jpg', '2017-10-13 14:08:58', '0', '0', ''), ('128', '28', '', 'try\r\n', 'nopic.jpg', '2017-10-13 14:12:32', '0', '0', ''), ('129', '28', 'try', 'try', 'nopic.jpg', '2017-10-13 14:22:03', '0', '0', ''), ('130', '28', 'tt', 'tt', 'nopic.jpg', '2017-10-13 14:25:34', '0', '0', ''), ('131', '28', 'tr', 'tr', 'nopic.jpg', '2017-10-13 14:37:49', '0', '0', ''), ('132', '28', 're', 're', 'nopic.jpg', '2017-10-13 14:51:20', '0', '0', ''), ('133', '28', 'gan', 'gan\r\n', 'nopic.jpg', '2017-10-13 15:00:47', '0', '0', ''), ('134', '28', 'fuc', 'fun', 'nopic.jpg', '2017-10-13 15:01:25', '0', '0', ''), ('135', '28', 'haha', 'haha', 'nopic.jpg', '2017-10-13 15:13:54', '0', '0', ''), ('136', '28', 'bbubu', 'bububu', 'nopic.jpg', '2017-10-13 15:15:12', '0', '0', ''), ('137', '28', 'matt', 'matt', 'nopic.jpg', '2017-10-13 15:16:56', '0', '0', ''), ('138', '28', 'prprpr', 'prprpr', 'nopic.jpg', '2017-10-13 16:06:28', '0', '0', '');
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
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `UNSWBookNotification`
-- ----------------------------
BEGIN;
INSERT INTO `UNSWBookNotification` VALUES ('31', '1', 'aka like your post!', 'Some one like your post!', '2017-10-01 21:27:41'), ('32', '2', '123 like your post!', 'Some one like your post!', '2017-10-03 13:32:05'), ('33', '2', '123 like your post!', 'Some one like your post!', '2017-10-03 14:09:26'), ('34', '2', '123 like your post!', 'Some one like your post!', '2017-10-03 14:09:28'), ('35', '2', '123 like your post!', 'Some one like your post!', '2017-10-03 14:09:29'), ('36', '2', 'testname accept your friend request :)  ', 'Friend request accepted', '2017-10-03 14:14:15'), ('37', '2', '123 like your post!', 'Some one like your post!', '2017-10-03 14:22:00'), ('38', '2', 'It works like your post!', 'Some one like your post!', '2017-10-03 14:44:29'), ('39', '1', 'alex accept your friend request :)  ', 'Friend request accepted', '2017-10-03 16:17:03'), ('40', '28', 'alex accept your friend request :)  ', 'Friend request accepted', '2017-10-03 16:19:18'), ('41', '29', 'matt like your post!', 'Some one like your post!', '2017-10-03 16:24:54'), ('42', '29', 'matt like your post!', 'Some one like your post!', '2017-10-13 16:00:28'), ('43', '29', 'matt like your post!', 'Some one like your post!', '2017-10-13 16:00:37'), ('44', '29', 'matt like your post!', 'Some one like your post!', '2017-10-13 16:06:39'), ('45', '29', 'matt like your post!', 'Some one like your post!', '2017-10-13 16:06:56'), ('46', '29', 'matt like your post!', 'Some one like your post!', '2017-10-13 16:10:45'), ('47', '29', 'matt like your post!', 'Some one like your post!', '2017-10-13 16:10:51'), ('48', '29', 'matt like your post!', 'Some one like your post!', '2017-10-13 16:10:55'), ('49', '29', 'matt like your post!', 'Some one like your post!', '2017-10-13 16:12:48'), ('50', '29', 'matt like your post!', 'Some one like your post!', '2017-10-13 16:12:53'), ('51', '29', 'matt like your post!', 'Some one like your post!', '2017-10-13 16:12:58'), ('52', '29', 'matt like your post!', 'Some one like your post!', '2017-10-13 16:13:01'), ('53', '29', 'matt like your post!', 'Some one like your post!', '2017-10-13 16:13:17');
COMMIT;

-- ----------------------------
--  Table structure for `UNSWBookTriple`
-- ----------------------------
DROP TABLE IF EXISTS `UNSWBookTriple`;
CREATE TABLE `UNSWBookTriple` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nodeFrom` varchar(255) NOT NULL,
  `edge` varchar(255) NOT NULL,
  `nodeTo` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `UNSWBookTriple`
-- ----------------------------
BEGIN;
INSERT INTO `UNSWBookTriple` VALUES ('1', 'P28', 'E2', 'M138'), ('7', 'P28', 'E3', 'M72'), ('8', 'P28', 'E1', 'P1'), ('9', 'P1', 'E1', 'P2');
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
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `UNSWBookUser`
-- ----------------------------
BEGIN;
INSERT INTO `UNSWBookUser` VALUES ('1', '1990-01-01', '123@163.com', 'male', 'It works', 'bbb', 'e53f2a91132e99d1a060bcfecc25d3b2.jpg', 'aaa', '1', '1', '2017-09-25 13:38:40'), ('2', '1994-03-01', 'aka@gmail.com', 'male', 'aka', 'aka', 'default.jpeg', 'aka', '1', '1', '2017-09-25 13:38:40'), ('3', '1999-07-11', 'abc@gmail.com', 'male', 'abc', 'abc', 'default.jpeg', 'abs', '1', '1', '2017-09-25 13:38:40'), ('4', '1980-12-21', 'iiikkk@gmail.com', 'male', 'iiikkk', 'iiikkk', 'default.jpeg', 'iiikkk', '1', '1', '2017-09-25 13:38:40'), ('27', '1998-08-13', 'jpchen213177@gmail.com', 'male', 'jpchen', 'jppassword', 'default.jpeg', 'jp', '1', 'ef95d81c0d2c2560eceafb62e0a17b38', '2017-10-02 22:22:06'), ('28', '1990-01-01', 'mattcuinevergiveup@gmail.com', 'male', 'matt', 'matt', 'default.jpeg', 'matt', '1', '4065353f5e96702dfd08bed3854ac2e3', '2017-10-04 13:56:10'), ('30', '1990-01-01', 'congshibo018@gmail.com', 'male', 'alex', 'alex', 'default.jpeg', 'alex', '1', '88d261d571a5f46d652d4bca8282ed72', '2017-10-16 12:25:48');
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `UNSWBookVote`
-- ----------------------------
BEGIN;
INSERT INTO `UNSWBookVote` VALUES ('1', '2', '1', '0'), ('5', '1', '22', '1'), ('6', '1', '8', '1'), ('7', '1', '7', '0'), ('8', '1', '43', '1'), ('9', '1', '51', '1'), ('10', '1', '52', '1'), ('11', '1', '53', '1'), ('12', '1', '55', '1'), ('13', '1', '68', '1'), ('14', '28', '73', '1'), ('15', '28', '72', '1');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
