/* DATABASE CREATE co_operative_society */ 

/* CREATE DATABASE co_operative_society; */ 
/* CREATE TABLE 'setting' */ 

CREATE TABLE `setting` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `favicon` varchar(255) DEFAULT '../images/default/favicon.ico',
  `logo` varchar(255) DEFAULT '../images/default/logo.png',
  `status` int(2) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO setting VALUES("1","Co-Operative Society","../images/favicon/99@favicon.ico","../images/logo/56@logo.png","1");



/* CREATE TABLE 'terms' */ 

CREATE TABLE `terms` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `details` longtext NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO terms VALUES("1","Legal and Issues","<html>



/* CREATE TABLE 'user_address_info' */ 

CREATE TABLE `user_address_info` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `user_id` int(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `area` varchar(255) DEFAULT NULL,
  `other` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `user_address_info_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_basic_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

INSERT INTO user_address_info VALUES("35","1","Bangladesh","Dhaka","Banani","n/a");



/* CREATE TABLE 'user_avatar' */ 

CREATE TABLE `user_avatar` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `user_id` int(255) NOT NULL,
  `avatar` varchar(255) DEFAULT '../images/default/user.png',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `user_avatar_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_basic_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO user_avatar VALUES("2","1","../images/default/user.png");



/* CREATE TABLE 'user_basic_info' */ 

CREATE TABLE `user_basic_info` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `status` int(2) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO user_basic_info VALUES("1","Onjon Hossain","onjon_sh@yahoo.com","01674917525","1");



/* CREATE TABLE 'user_documents' */ 

CREATE TABLE `user_documents` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `user_id` int(255) NOT NULL,
  `document_type` varchar(255) NOT NULL,
  `document` varchar(255) NOT NULL,
  `status` int(2) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_documents_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_basic_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




/* CREATE TABLE 'user_log' */ 

CREATE TABLE `user_log` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `user_id` int(255) NOT NULL,
  `login_on` datetime DEFAULT NULL,
  `logout_on` datetime DEFAULT NULL,
  `ip` varchar(255) NOT NULL,
  `status` int(2) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_basic_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

INSERT INTO user_log VALUES("1","1","2014-02-20 18:16:46","2014-02-20 18:18:20","::1","0");
INSERT INTO user_log VALUES("2","1","2014-02-20 18:20:38","2014-02-20 18:20:45","::1","0");
INSERT INTO user_log VALUES("3","1","2014-02-20 18:56:29","0000-00-00 00:00:00","::1","1");



/* CREATE TABLE 'user_login_info' */ 

CREATE TABLE `user_login_info` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `user_id` int(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `user_login_info_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_basic_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO user_login_info VALUES("1","1","onmMmYtsHIMdE");



/* CREATE TABLE 'user_type' */ 

CREATE TABLE `user_type` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `user_id` int(255) NOT NULL,
  `type_id` int(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `user_type_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_basic_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_type_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `user_type_list` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO user_type VALUES("1","1","1");



/* CREATE TABLE 'user_type_list' */ 

CREATE TABLE `user_type_list` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

INSERT INTO user_type_list VALUES("2","Admin");
INSERT INTO user_type_list VALUES("3","Investors");
INSERT INTO user_type_list VALUES("1","Super Admin");


