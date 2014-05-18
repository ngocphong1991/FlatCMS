/*
MySQL Backup
Source Server Version: 5.6.12
Source Database: db_sym
Date: 5/18/2014 01:08:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
--  Table structure for `article`
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_group_article` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date_create` datetime NOT NULL,
  `views` bigint(20) NOT NULL,
  `is_active` smallint(6) NOT NULL,
  `is_special` smallint(6) NOT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_23A0E662B36786B` (`title`),
  UNIQUE KEY `UNIQ_23A0E66F47645AE` (`url`),
  KEY `IDX_23A0E663A128B0F` (`id_group_article`),
  CONSTRAINT `FK_23A0E663A128B0F` FOREIGN KEY (`id_group_article`) REFERENCES `group_article` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `article_specialgrouparticle`
-- ----------------------------
DROP TABLE IF EXISTS `article_specialgrouparticle`;
CREATE TABLE `article_specialgrouparticle` (
  `article_id` bigint(20) NOT NULL,
  `specialgrouparticle_id` int(11) NOT NULL,
  PRIMARY KEY (`article_id`,`specialgrouparticle_id`),
  KEY `IDX_4BCDB3AD7294869C` (`article_id`),
  KEY `IDX_4BCDB3ADC36ECB8F` (`specialgrouparticle_id`),
  CONSTRAINT `FK_4BCDB3AD7294869C` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_4BCDB3ADC36ECB8F` FOREIGN KEY (`specialgrouparticle_id`) REFERENCES `special_group_article` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `article_tag`
-- ----------------------------
DROP TABLE IF EXISTS `article_tag`;
CREATE TABLE `article_tag` (
  `article_id` bigint(20) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`article_id`,`tag_id`),
  KEY `IDX_919694F97294869C` (`article_id`),
  KEY `IDX_919694F9BAD26311` (`tag_id`),
  CONSTRAINT `FK_919694F9BAD26311` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_919694F97294869C` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `cms_page`
-- ----------------------------
DROP TABLE IF EXISTS `cms_page`;
CREATE TABLE `cms_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `sort_desciption` varchar(500) NOT NULL,
  `description` longtext NOT NULL,
  `url` varchar(255) NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `date_create` datetime NOT NULL,
  `date_update` datetime DEFAULT NULL,
  `is_active` smallint(6) NOT NULL,
  `options` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_D39C1B5DF47645AE` (`url`),
  UNIQUE KEY `UNIQ_D39C1B5D2B36786B` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `group_article`
-- ----------------------------
DROP TABLE IF EXISTS `group_article`;
CREATE TABLE `group_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` smallint(6) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_843A5A6A5E237E06` (`name`),
  UNIQUE KEY `UNIQ_843A5A6AF47645AE` (`url`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `roles`
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `role` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_B63E2EC757698A6A` (`role`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `setting`
-- ----------------------------
DROP TABLE IF EXISTS `setting`;
CREATE TABLE `setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `special_group_article`
-- ----------------------------
DROP TABLE IF EXISTS `special_group_article`;
CREATE TABLE `special_group_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` smallint(6) NOT NULL,
  `position` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_FD3E24605E237E06` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `tag`
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_389B7835E237E06` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `salt` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1483A5E9F85E0677` (`username`),
  UNIQUE KEY `UNIQ_1483A5E9E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `user_role`
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `IDX_2DE8C6A3A76ED395` (`user_id`),
  KEY `IDX_2DE8C6A3D60322AC` (`role_id`),
  CONSTRAINT `FK_2DE8C6A3A76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_2DE8C6A3D60322AC` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records 
-- ----------------------------
INSERT INTO `article` VALUES ('2','1','Test','Test','e917df03725bc31a985a2b1ffff502c574bec4e1.png','2014-05-17 16:19:55','1','0','0','2014-05-19 14:20:00','2014-05-29 16:20:00','test');
INSERT INTO `article_specialgrouparticle` VALUES ('2','1');
INSERT INTO `article_tag` VALUES ('2','1'), ('2','3');
INSERT INTO `cms_page` VALUES ('1','Giới thiệu','Giới thiệu về chúng tôi','<b><i><span class=\"wysiwyg-color-red\">Giới thiệu về chúng tôi</span></i></b><br>','gioi-thieu.html','chung toi','2014-05-16 13:08:11','2014-05-17 17:41:36','1',NULL);
INSERT INTO `group_article` VALUES ('1','Thể thao','0',NULL,'the-thao.net','9a99cd49ae44dbe721736da2607d9c378caefb33.png');
INSERT INTO `roles` VALUES ('1','admin','ROLE_ADMIN');
INSERT INTO `special_group_article` VALUES ('1','Khuyến mãi - Giảm giá','0','0');
INSERT INTO `tag` VALUES ('1','thể thao','0'), ('3','du lịch','0');
INSERT INTO `users` VALUES ('1','admin','9518664cd261da57a39f4ac03044bb08','wONpRr/UO5dG3MJxUswKzyN+GdXxyDfXH5l+etb55uM9bNer2DU+LLyvNSmsT3IFWNPuZcBRJ4/fgXZ7mUGrbQ==','admin@contact.com','1');
INSERT INTO `user_role` VALUES ('1','1');
