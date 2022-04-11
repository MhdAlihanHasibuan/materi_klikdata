/*
SQLyog Community v13.1.5  (32 bit)
MySQL - 10.6.4-MariaDB : Database - db_test
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `tbl_asuransi` */

DROP TABLE IF EXISTS `tbl_asuransi`;

CREATE TABLE `tbl_asuransi` (
  `id_asuransi` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama_asuransi` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_asuransi`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tbl_asuransi` */

insert  into `tbl_asuransi`(`id_asuransi`,`nama_asuransi`) values 
(1,'BAYAR SENDIRI (UMUM)'),
(2,'BPJS KESEHATAN (BPJS)');

/*Table structure for table `tbl_dokter_jaga` */

DROP TABLE IF EXISTS `tbl_dokter_jaga`;

CREATE TABLE `tbl_dokter_jaga` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_dokter` int(10) unsigned DEFAULT NULL,
  `id_poliklinik` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tbl_dokter_jaga` */

/*Table structure for table `tbl_pendaftaran` */

DROP TABLE IF EXISTS `tbl_pendaftaran`;

CREATE TABLE `tbl_pendaftaran` (
  `id_pendaftaran` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tgl_berobat` date DEFAULT NULL,
  `id_asuransi` int(10) unsigned DEFAULT NULL,
  `id_poliklinik` int(10) unsigned DEFAULT NULL,
  `id_dokter` int(10) unsigned DEFAULT NULL,
  `id_pasien` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_pendaftaran`),
  KEY `tbl_pendaftaran_ibfk_1` (`id_pasien`),
  KEY `id_dokter` (`id_dokter`),
  CONSTRAINT `tbl_pendaftaran_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `tbl_user` (`id_user`) ON UPDATE CASCADE,
  CONSTRAINT `tbl_pendaftaran_ibfk_2` FOREIGN KEY (`id_dokter`) REFERENCES `tbl_user` (`id_user`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tbl_pendaftaran` */

/*Table structure for table `tbl_poliklinik` */

DROP TABLE IF EXISTS `tbl_poliklinik`;

CREATE TABLE `tbl_poliklinik` (
  `id_poliklinik` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama_poliklinik` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id_poliklinik`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tbl_poliklinik` */

insert  into `tbl_poliklinik`(`id_poliklinik`,`nama_poliklinik`) values 
(1,'POLI ANAK'),
(2,'POLI PENYAKIT DALAM'),
(3,'POLI BEDAH'),
(4,'POLI JANTUNG'),
(5,'POLI MATA');

/*Table structure for table `tbl_user` */

DROP TABLE IF EXISTS `tbl_user`;

CREATE TABLE `tbl_user` (
  `id_user` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama_user` varchar(300) DEFAULT NULL,
  `no_identitas` varchar(25) DEFAULT NULL,
  `jenis_kelamin` tinyint(1) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `sts_user` tinyint(1) DEFAULT NULL COMMENT '1= pasien, 2=dokter',
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tbl_user` */

insert  into `tbl_user`(`id_user`,`nama_user`,`no_identitas`,`jenis_kelamin`,`tgl_lahir`,`sts_user`) values 
(1,'User A','1131312312',1,'2022-04-06',1),
(2,'User B','293846892134',2,'2022-04-06',1),
(3,'User C','241441414',1,'2022-04-06',1),
(4,'User D','112441414',2,'2022-04-06',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
