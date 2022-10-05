/*
SQLyog Ultimate - MySQL GUI v8.21 
MySQL - 5.1.29-rc-community : Database - project
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`project` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `project`;

/*Table structure for table `movies` */

DROP TABLE IF EXISTS `movies`;

CREATE TABLE `movies` (
  `Id` int(11) DEFAULT NULL,
  `movie` varchar(100) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  `Mid` int(11) NOT NULL AUTO_INCREMENT,
  UNIQUE KEY `Mid` (`Mid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*Data for the table `movies` */

insert  into `movies`(`Id`,`movie`,`description`,`Mid`) values (4,'Toy Story (1995)','Toy Story is a 1995 American computer-animated comedy film',3),(4,'Money Heist','Money Heist is a Spanish heist crime drama television series in Spain',4),(4,'John Wick','John Wick is an American neo-noir action-thriller media franchise starring Keanu Reeves as John Wick hamsof',6),(2,'hafiz abdulmanan','hamsof is great whao',7),(4,'Robot 2.0 ','A fiction movie',8),(4,'Breaking Bad','A beautiful action and thrill series on Meth',10),(4,'Dirilis: Ertugrul','A classis Muslim darama',13),(8,'Ghalib','Movie on a great poet',16),(4,'','',17);

/*Table structure for table `signup` */

DROP TABLE IF EXISTS `signup`;

CREATE TABLE `signup` (
  `email` varchar(100) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `isAdmin` tinyint(1) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `signup` */

insert  into `signup`(`email`,`name`,`age`,`isAdmin`,`password`,`Id`) values ('admin@hamsof.com','hamsof',24,1,'123',1),('hafizabdulman@gmail.com','hamza saleem',12,0,'124',2),('kahsir@yaka.com','kashir',22,0,'123',3),('myhamsof@gmail.com','HAFIZ',22,0,'123',4),('www@s.com','asa',12,0,'123',5),('hamza@gmail.com','hamza saleem ',22,0,'123',6),('ahmad@gmail.com','ahmad',22,0,'123',7),('hassan@pucit.edu.pk','Ali Khan',80,0,'123',8),('b@pucit.edu.com','Hasaan',20,0,'123',9);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
