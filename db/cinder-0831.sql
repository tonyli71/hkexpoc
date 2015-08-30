-- MySQL dump 10.14  Distrib 5.5.44-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: cinder
-- ------------------------------------------------------
-- Server version	5.5.42-MariaDB-wsrep

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `backups`
--

DROP TABLE IF EXISTS `backups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backups` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `id` varchar(36) NOT NULL,
  `volume_id` varchar(36) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `project_id` varchar(255) DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `availability_zone` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `display_description` varchar(255) DEFAULT NULL,
  `container` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `fail_reason` varchar(255) DEFAULT NULL,
  `service_metadata` varchar(255) DEFAULT NULL,
  `service` varchar(255) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `object_count` int(11) DEFAULT NULL,
  `parent_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backups`
--

LOCK TABLES `backups` WRITE;
/*!40000 ALTER TABLE `backups` DISABLE KEYS */;
/*!40000 ALTER TABLE `backups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cgsnapshots`
--

DROP TABLE IF EXISTS `cgsnapshots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cgsnapshots` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `id` varchar(36) NOT NULL,
  `consistencygroup_id` varchar(36) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `project_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `consistencygroup_id` (`consistencygroup_id`),
  CONSTRAINT `cgsnapshots_ibfk_1` FOREIGN KEY (`consistencygroup_id`) REFERENCES `consistencygroups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cgsnapshots`
--

LOCK TABLES `cgsnapshots` WRITE;
/*!40000 ALTER TABLE `cgsnapshots` DISABLE KEYS */;
/*!40000 ALTER TABLE `cgsnapshots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consistencygroups`
--

DROP TABLE IF EXISTS `consistencygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consistencygroups` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `id` varchar(36) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `project_id` varchar(255) DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `availability_zone` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `volume_type_id` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `cgsnapshot_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consistencygroups`
--

LOCK TABLES `consistencygroups` WRITE;
/*!40000 ALTER TABLE `consistencygroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `consistencygroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driver_initiator_data`
--

DROP TABLE IF EXISTS `driver_initiator_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `driver_initiator_data` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `initiator` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `initiator` (`initiator`,`namespace`,`key`),
  KEY `ix_driver_initiator_data_initiator` (`initiator`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver_initiator_data`
--

LOCK TABLES `driver_initiator_data` WRITE;
/*!40000 ALTER TABLE `driver_initiator_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `driver_initiator_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encryption`
--

DROP TABLE IF EXISTS `encryption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `encryption` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `cipher` varchar(255) DEFAULT NULL,
  `control_location` varchar(255) NOT NULL,
  `key_size` int(11) DEFAULT NULL,
  `provider` varchar(255) NOT NULL,
  `volume_type_id` varchar(36) NOT NULL,
  `encryption_id` varchar(36) NOT NULL DEFAULT '',
  PRIMARY KEY (`encryption_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encryption`
--

LOCK TABLES `encryption` WRITE;
/*!40000 ALTER TABLE `encryption` DISABLE KEYS */;
/*!40000 ALTER TABLE `encryption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iscsi_targets`
--

DROP TABLE IF EXISTS `iscsi_targets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iscsi_targets` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_num` int(11) DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `volume_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `volume_id` (`volume_id`),
  CONSTRAINT `iscsi_targets_ibfk_1` FOREIGN KEY (`volume_id`) REFERENCES `volumes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iscsi_targets`
--

LOCK TABLES `iscsi_targets` WRITE;
/*!40000 ALTER TABLE `iscsi_targets` DISABLE KEYS */;
/*!40000 ALTER TABLE `iscsi_targets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrate_version`
--

DROP TABLE IF EXISTS `migrate_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrate_version` (
  `repository_id` varchar(250) NOT NULL,
  `repository_path` text,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`repository_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrate_version`
--

LOCK TABLES `migrate_version` WRITE;
/*!40000 ALTER TABLE `migrate_version` DISABLE KEYS */;
INSERT INTO `migrate_version` VALUES ('cinder','/usr/lib/python2.7/site-packages/cinder/db/sqlalchemy/migrate_repo',41);
/*!40000 ALTER TABLE `migrate_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quality_of_service_specs`
--

DROP TABLE IF EXISTS `quality_of_service_specs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quality_of_service_specs` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `id` varchar(36) NOT NULL,
  `specs_id` varchar(36) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `specs_id` (`specs_id`),
  CONSTRAINT `quality_of_service_specs_ibfk_1` FOREIGN KEY (`specs_id`) REFERENCES `quality_of_service_specs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quality_of_service_specs`
--

LOCK TABLES `quality_of_service_specs` WRITE;
/*!40000 ALTER TABLE `quality_of_service_specs` DISABLE KEYS */;
/*!40000 ALTER TABLE `quality_of_service_specs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quota_classes`
--

DROP TABLE IF EXISTS `quota_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quota_classes` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) DEFAULT NULL,
  `resource` varchar(255) DEFAULT NULL,
  `hard_limit` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_quota_classes_class_name` (`class_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quota_classes`
--

LOCK TABLES `quota_classes` WRITE;
/*!40000 ALTER TABLE `quota_classes` DISABLE KEYS */;
INSERT INTO `quota_classes` VALUES ('2015-08-19 18:25:06',NULL,NULL,0,1,'default','volumes',10),('2015-08-19 18:25:06',NULL,NULL,0,2,'default','snapshots',10),('2015-08-19 18:25:06',NULL,NULL,0,3,'default','gigabytes',1000),('2015-08-19 18:25:06',NULL,NULL,0,4,'default','consistencygroups',10);
/*!40000 ALTER TABLE `quota_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quota_usages`
--

DROP TABLE IF EXISTS `quota_usages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quota_usages` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` varchar(255) DEFAULT NULL,
  `resource` varchar(255) DEFAULT NULL,
  `in_use` int(11) NOT NULL,
  `reserved` int(11) NOT NULL,
  `until_refresh` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_quota_usages_project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quota_usages`
--

LOCK TABLES `quota_usages` WRITE;
/*!40000 ALTER TABLE `quota_usages` DISABLE KEYS */;
INSERT INTO `quota_usages` VALUES ('2015-08-29 01:29:47','2015-08-30 16:11:33',NULL,0,1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',181,0,NULL),('2015-08-29 01:29:47','2015-08-30 15:35:03',NULL,0,2,'5b6cca8b0e464a399f723e7660be3290','volumes_ceph',0,0,NULL),('2015-08-29 01:29:47','2015-08-30 15:35:03',NULL,0,3,'5b6cca8b0e464a399f723e7660be3290','gigabytes_ceph',0,0,NULL),('2015-08-29 01:29:47','2015-08-30 16:11:33',NULL,0,4,'5b6cca8b0e464a399f723e7660be3290','volumes',2,0,NULL);
/*!40000 ALTER TABLE `quota_usages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quotas`
--

DROP TABLE IF EXISTS `quotas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quotas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `project_id` varchar(255) DEFAULT NULL,
  `resource` varchar(255) NOT NULL,
  `hard_limit` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quotas`
--

LOCK TABLES `quotas` WRITE;
/*!40000 ALTER TABLE `quotas` DISABLE KEYS */;
/*!40000 ALTER TABLE `quotas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservations` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `usage_id` int(11) NOT NULL,
  `project_id` varchar(255) DEFAULT NULL,
  `resource` varchar(255) DEFAULT NULL,
  `delta` int(11) NOT NULL,
  `expire` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usage_id` (`usage_id`),
  KEY `ix_reservations_project_id` (`project_id`),
  KEY `reservations_deleted_expire_idx` (`deleted`,`expire`),
  CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`usage_id`) REFERENCES `quota_usages` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=461 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservations`
--

LOCK TABLES `reservations` WRITE;
/*!40000 ALTER TABLE `reservations` DISABLE KEYS */;
INSERT INTO `reservations` VALUES ('2015-08-29 01:29:47','2015-08-29 01:29:47','2015-08-29 01:29:47',1,1,'0f817e50-2cd3-491b-a96f-37a7eb4cf962',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',31,'2015-08-30 01:29:47'),('2015-08-29 01:29:47','2015-08-29 01:29:47','2015-08-29 01:29:47',1,2,'36e5f86a-3cfa-40a1-9096-949b0fde26d8',2,'5b6cca8b0e464a399f723e7660be3290','volumes_ceph',1,'2015-08-30 01:29:47'),('2015-08-29 01:29:47','2015-08-29 01:29:47','2015-08-29 01:29:47',1,3,'01ac7733-2d27-4e2a-9fc3-6647aed38db7',4,'5b6cca8b0e464a399f723e7660be3290','volumes',1,'2015-08-30 01:29:47'),('2015-08-29 01:29:47','2015-08-29 01:29:47','2015-08-29 01:29:47',1,4,'16a8d6ad-ab3d-49ed-b64f-f082c7f4596c',3,'5b6cca8b0e464a399f723e7660be3290','gigabytes_ceph',31,'2015-08-30 01:29:47'),('2015-08-29 01:40:03','2015-08-29 01:40:03','2015-08-29 01:40:03',1,5,'a2561d69-5617-445f-b1da-5c00dc10053f',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',-31,'2015-08-30 01:40:03'),('2015-08-29 01:40:03','2015-08-29 01:40:03','2015-08-29 01:40:03',1,6,'5c1586c1-20af-419a-8a91-36c3b6187a1e',2,'5b6cca8b0e464a399f723e7660be3290','volumes_ceph',-1,'2015-08-30 01:40:03'),('2015-08-29 01:40:03','2015-08-29 01:40:03','2015-08-29 01:40:03',1,7,'21e2804f-8e50-4825-b9a7-3f474e5cb784',3,'5b6cca8b0e464a399f723e7660be3290','gigabytes_ceph',-31,'2015-08-30 01:40:03'),('2015-08-29 01:40:03','2015-08-29 01:40:03','2015-08-29 01:40:03',1,8,'a0b4a57e-e848-4d4e-95f3-50625334055f',4,'5b6cca8b0e464a399f723e7660be3290','volumes',-1,'2015-08-30 01:40:03'),('2015-08-29 01:40:32','2015-08-29 01:40:32','2015-08-29 01:40:32',1,9,'57985851-d138-4fb3-9a57-547cbb3d7260',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',31,'2015-08-30 01:40:32'),('2015-08-29 01:40:32','2015-08-29 01:40:32','2015-08-29 01:40:32',1,10,'61ff6c74-f6dd-43f4-9b69-ffac64d63371',2,'5b6cca8b0e464a399f723e7660be3290','volumes_ceph',1,'2015-08-30 01:40:32'),('2015-08-29 01:40:32','2015-08-29 01:40:32','2015-08-29 01:40:32',1,11,'1e378c7a-ff80-4d4a-a50c-526d8804f04d',4,'5b6cca8b0e464a399f723e7660be3290','volumes',1,'2015-08-30 01:40:32'),('2015-08-29 01:40:32','2015-08-29 01:40:32','2015-08-29 01:40:32',1,12,'76519a9c-f2d9-4011-a5cc-86f3a7ec4081',3,'5b6cca8b0e464a399f723e7660be3290','gigabytes_ceph',31,'2015-08-30 01:40:32'),('2015-08-29 02:19:59','2015-08-29 02:19:59','2015-08-29 02:19:59',1,13,'2673cf37-033a-406f-bb2a-f541a884e5a9',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',-31,'2015-08-30 02:19:59'),('2015-08-29 02:19:59','2015-08-29 02:19:59','2015-08-29 02:19:59',1,14,'bbc6799a-7e92-46fe-b5d5-7997fbee1173',2,'5b6cca8b0e464a399f723e7660be3290','volumes_ceph',-1,'2015-08-30 02:19:59'),('2015-08-29 02:19:59','2015-08-29 02:19:59','2015-08-29 02:19:59',1,15,'7d0496b8-416a-4c95-9e33-94fd46199fd2',3,'5b6cca8b0e464a399f723e7660be3290','gigabytes_ceph',-31,'2015-08-30 02:19:59'),('2015-08-29 02:19:59','2015-08-29 02:19:59','2015-08-29 02:19:59',1,16,'660509cd-cb7d-4972-84af-bf4347c4626f',4,'5b6cca8b0e464a399f723e7660be3290','volumes',-1,'2015-08-30 02:19:59'),('2015-08-29 02:21:33','2015-08-29 02:21:33','2015-08-29 02:21:33',1,17,'29364ef2-b498-40b0-8853-723621e6f1e2',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',31,'2015-08-30 02:21:33'),('2015-08-29 02:21:33','2015-08-29 02:21:33','2015-08-29 02:21:33',1,18,'733d10ed-c38e-4f46-8b72-1f223c04de3a',2,'5b6cca8b0e464a399f723e7660be3290','volumes_ceph',1,'2015-08-30 02:21:33'),('2015-08-29 02:21:33','2015-08-29 02:21:33','2015-08-29 02:21:33',1,19,'896eaed5-fdf2-4621-aa7d-cb4e6b7f282d',4,'5b6cca8b0e464a399f723e7660be3290','volumes',1,'2015-08-30 02:21:33'),('2015-08-29 02:21:33','2015-08-29 02:21:33','2015-08-29 02:21:33',1,20,'3a79d978-0809-40c9-aaa7-7aa14963352b',3,'5b6cca8b0e464a399f723e7660be3290','gigabytes_ceph',31,'2015-08-30 02:21:33'),('2015-08-29 03:24:51','2015-08-29 03:24:51','2015-08-29 03:24:51',1,21,'c4fd4d09-9dac-4115-aad0-84295704cdb0',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',-31,'2015-08-30 03:24:51'),('2015-08-29 03:24:51','2015-08-29 03:24:51','2015-08-29 03:24:51',1,22,'1fec365b-92f6-4db7-9b25-de436590bc17',2,'5b6cca8b0e464a399f723e7660be3290','volumes_ceph',-1,'2015-08-30 03:24:51'),('2015-08-29 03:24:51','2015-08-29 03:24:51','2015-08-29 03:24:51',1,23,'ba2adead-b7b9-48db-8994-87eff3bb0fd3',3,'5b6cca8b0e464a399f723e7660be3290','gigabytes_ceph',-31,'2015-08-30 03:24:51'),('2015-08-29 03:24:51','2015-08-29 03:24:51','2015-08-29 03:24:51',1,24,'cd4f02a2-fd2f-4db6-bceb-e1df12a05f86',4,'5b6cca8b0e464a399f723e7660be3290','volumes',-1,'2015-08-30 03:24:51'),('2015-08-29 03:32:41','2015-08-29 03:32:41','2015-08-29 03:32:41',1,25,'61a1ba31-b728-48f8-8a1e-048114a43c77',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',80,'2015-08-30 03:32:41'),('2015-08-29 03:32:41','2015-08-29 03:32:41','2015-08-29 03:32:41',1,26,'3261a1bd-17b1-4fe1-989f-3bbe816a3b80',2,'5b6cca8b0e464a399f723e7660be3290','volumes_ceph',1,'2015-08-30 03:32:41'),('2015-08-29 03:32:41','2015-08-29 03:32:41','2015-08-29 03:32:41',1,27,'bd7d20b4-c123-4c8e-858c-50cf3cbb293b',4,'5b6cca8b0e464a399f723e7660be3290','volumes',1,'2015-08-30 03:32:41'),('2015-08-29 03:32:41','2015-08-29 03:32:41','2015-08-29 03:32:41',1,28,'35816579-cf2e-4856-9ca3-9fb2e66a8baf',3,'5b6cca8b0e464a399f723e7660be3290','gigabytes_ceph',80,'2015-08-30 03:32:41'),('2015-08-29 12:52:09','2015-08-29 12:52:09','2015-08-29 12:52:09',1,29,'e67ab823-4c7b-405d-a115-2b02e9a7b256',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',80,'2015-08-30 12:52:09'),('2015-08-29 12:52:09','2015-08-29 12:52:09','2015-08-29 12:52:09',1,30,'a3a96cb9-8aa4-4c08-9b16-619aa130e7bb',2,'5b6cca8b0e464a399f723e7660be3290','volumes_ceph',1,'2015-08-30 12:52:09'),('2015-08-29 12:52:09','2015-08-29 12:52:09','2015-08-29 12:52:09',1,31,'1fdfebd0-5319-4d8f-997b-3c78f7d8942d',4,'5b6cca8b0e464a399f723e7660be3290','volumes',1,'2015-08-30 12:52:09'),('2015-08-29 12:52:09','2015-08-29 12:52:09','2015-08-29 12:52:09',1,32,'ae64b3f0-1355-4d2e-8788-a71e0d0c1bdb',3,'5b6cca8b0e464a399f723e7660be3290','gigabytes_ceph',80,'2015-08-30 12:52:09'),('2015-08-29 12:52:45','2015-08-29 12:52:45','2015-08-29 12:52:45',1,33,'951d2a43-ab4f-4741-bf5d-4ab60cc3e246',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',-80,'2015-08-30 12:52:45'),('2015-08-29 12:52:45','2015-08-29 12:52:45','2015-08-29 12:52:45',1,34,'dbc01c9d-efb2-4c3c-932f-d99274cd3440',2,'5b6cca8b0e464a399f723e7660be3290','volumes_ceph',-1,'2015-08-30 12:52:45'),('2015-08-29 12:52:45','2015-08-29 12:52:45','2015-08-29 12:52:45',1,35,'25459b74-64bf-4c0f-91fb-380beb6e7853',3,'5b6cca8b0e464a399f723e7660be3290','gigabytes_ceph',-80,'2015-08-30 12:52:45'),('2015-08-29 12:52:45','2015-08-29 12:52:45','2015-08-29 12:52:45',1,36,'3ad5d217-d043-4a0a-b627-f68801f14b60',4,'5b6cca8b0e464a399f723e7660be3290','volumes',-1,'2015-08-30 12:52:45'),('2015-08-29 12:55:16','2015-08-29 12:55:16','2015-08-29 12:55:16',1,37,'f95307b6-3d0f-4c07-bf24-086434e1ded3',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',1,'2015-08-30 12:55:16'),('2015-08-29 12:55:16','2015-08-29 12:55:16','2015-08-29 12:55:16',1,38,'d31d508a-caa3-46be-810f-5f765174f8b7',2,'5b6cca8b0e464a399f723e7660be3290','volumes_ceph',1,'2015-08-30 12:55:16'),('2015-08-29 12:55:16','2015-08-29 12:55:16','2015-08-29 12:55:16',1,39,'45b3caf1-c70e-41d9-b879-e7480ed10c8a',4,'5b6cca8b0e464a399f723e7660be3290','volumes',1,'2015-08-30 12:55:16'),('2015-08-29 12:55:16','2015-08-29 12:55:16','2015-08-29 12:55:16',1,40,'93d74ff5-2a04-4d96-ada4-9ca74936b578',3,'5b6cca8b0e464a399f723e7660be3290','gigabytes_ceph',1,'2015-08-30 12:55:16'),('2015-08-30 12:39:10','2015-08-30 12:39:10','2015-08-30 12:39:10',1,41,'cefe7873-5ec5-4665-98a4-5fe548e94976',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',560,'2015-08-31 12:39:10'),('2015-08-30 12:39:10','2015-08-30 12:39:10','2015-08-30 12:39:10',1,44,'aa8afbd3-e231-422a-ad90-f44e4973f309',4,'5b6cca8b0e464a399f723e7660be3290','volumes',1,'2015-08-31 12:39:10'),('2015-08-30 12:42:03','2015-08-30 12:42:03','2015-08-30 12:42:03',1,47,'4ff7addb-1a83-4cc9-8fcc-6787549e9df6',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',-560,'2015-08-31 12:42:03'),('2015-08-30 12:42:03','2015-08-30 12:42:03','2015-08-30 12:42:03',1,50,'16652c96-6766-43d8-bda1-cea1b4fb2ae7',4,'5b6cca8b0e464a399f723e7660be3290','volumes',-1,'2015-08-31 12:42:03'),('2015-08-30 12:42:48','2015-08-30 12:42:48','2015-08-30 12:42:48',1,53,'e717570d-ed8c-4d60-bcc8-1ab5d2c54f1d',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',560,'2015-08-31 12:42:48'),('2015-08-30 12:42:48','2015-08-30 12:42:48','2015-08-30 12:42:48',1,56,'1386857f-db34-4fc1-9172-645ac9a566a9',2,'5b6cca8b0e464a399f723e7660be3290','volumes_ceph',1,'2015-08-31 12:42:48'),('2015-08-30 12:42:48','2015-08-30 12:42:48','2015-08-30 12:42:48',1,59,'18c61703-5fc7-4b74-a6f6-b74bd8c26734',4,'5b6cca8b0e464a399f723e7660be3290','volumes',1,'2015-08-31 12:42:48'),('2015-08-30 12:42:48','2015-08-30 12:42:48','2015-08-30 12:42:48',1,62,'b0e16de9-4961-478b-8ca0-e5710d2e64ed',3,'5b6cca8b0e464a399f723e7660be3290','gigabytes_ceph',560,'2015-08-31 12:42:48'),('2015-08-30 12:45:07','2015-08-30 12:45:07','2015-08-30 12:45:07',1,65,'dd5b1539-b43f-46db-a16f-a5ff615df00d',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',-560,'2015-08-31 12:45:07'),('2015-08-30 12:45:07','2015-08-30 12:45:07','2015-08-30 12:45:07',1,68,'e6d8111d-93db-46d4-8edd-9cbb5cc406f0',2,'5b6cca8b0e464a399f723e7660be3290','volumes_ceph',-1,'2015-08-31 12:45:07'),('2015-08-30 12:45:07','2015-08-30 12:45:07','2015-08-30 12:45:07',1,71,'dc44f7e1-44ae-4f5d-a186-6ff58d46df5c',3,'5b6cca8b0e464a399f723e7660be3290','gigabytes_ceph',-560,'2015-08-31 12:45:07'),('2015-08-30 12:45:07','2015-08-30 12:45:07','2015-08-30 12:45:07',1,74,'252a2b18-42bf-4d93-9c08-7eaabc51ce6d',4,'5b6cca8b0e464a399f723e7660be3290','volumes',-1,'2015-08-31 12:45:07'),('2015-08-30 12:51:38','2015-08-30 12:51:38','2015-08-30 12:51:38',1,77,'e11093d1-dd9b-4c63-9a6c-58fbc9e5bf2b',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',560,'2015-08-31 12:51:38'),('2015-08-30 12:51:38','2015-08-30 12:51:38','2015-08-30 12:51:38',1,80,'e7522917-e096-4fb8-94e3-cd0b2af08cf7',4,'5b6cca8b0e464a399f723e7660be3290','volumes',1,'2015-08-31 12:51:38'),('2015-08-30 12:55:23','2015-08-30 12:55:23','2015-08-30 12:55:23',1,83,'38585b30-3f77-4650-a2dd-825ae4701e94',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',-560,'2015-08-31 12:55:23'),('2015-08-30 12:55:23','2015-08-30 12:55:23','2015-08-30 12:55:23',1,86,'172cb316-e083-4d23-8850-c2622773b75b',4,'5b6cca8b0e464a399f723e7660be3290','volumes',-1,'2015-08-31 12:55:23'),('2015-08-30 12:59:42','2015-08-30 12:59:42','2015-08-30 12:59:42',1,89,'48533c5e-061a-4bd1-94e8-2c7c220ce690',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',560,'2015-08-31 12:59:42'),('2015-08-30 12:59:42','2015-08-30 12:59:42','2015-08-30 12:59:42',1,92,'d9fdd7cd-4dc3-476f-b4dc-305c5fa27eb0',2,'5b6cca8b0e464a399f723e7660be3290','volumes_ceph',1,'2015-08-31 12:59:42'),('2015-08-30 12:59:42','2015-08-30 12:59:42','2015-08-30 12:59:42',1,95,'032acbc7-4f69-4ea4-9dd7-fedc89fa5d4c',4,'5b6cca8b0e464a399f723e7660be3290','volumes',1,'2015-08-31 12:59:42'),('2015-08-30 12:59:42','2015-08-30 12:59:42','2015-08-30 12:59:42',1,98,'fc8dad72-b97d-4b83-8fa9-b6a443e58bb6',3,'5b6cca8b0e464a399f723e7660be3290','gigabytes_ceph',560,'2015-08-31 12:59:42'),('2015-08-30 13:02:02','2015-08-30 13:02:02','2015-08-30 13:02:02',1,101,'9cdadc60-0576-4bac-9801-e7d2a631513a',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',-560,'2015-08-31 13:02:02'),('2015-08-30 13:02:02','2015-08-30 13:02:02','2015-08-30 13:02:02',1,104,'9299dbb1-9305-4fd0-ad60-0d174c962efa',2,'5b6cca8b0e464a399f723e7660be3290','volumes_ceph',-1,'2015-08-31 13:02:02'),('2015-08-30 13:02:02','2015-08-30 13:02:02','2015-08-30 13:02:02',1,107,'0b753bf4-bfc3-49e8-8da5-5703668d70d8',3,'5b6cca8b0e464a399f723e7660be3290','gigabytes_ceph',-560,'2015-08-31 13:02:02'),('2015-08-30 13:02:02','2015-08-30 13:02:02','2015-08-30 13:02:02',1,110,'8390f679-6837-4518-9072-0916c6fd4cf6',4,'5b6cca8b0e464a399f723e7660be3290','volumes',-1,'2015-08-31 13:02:02'),('2015-08-30 13:02:45','2015-08-30 13:02:45','2015-08-30 13:02:45',1,113,'e4e1b2a0-ecce-4af8-9476-9586019b8826',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',560,'2015-08-31 13:02:45'),('2015-08-30 13:02:45','2015-08-30 13:02:45','2015-08-30 13:02:45',1,116,'d2553098-3407-432c-831f-2e3cfc536ff2',4,'5b6cca8b0e464a399f723e7660be3290','volumes',1,'2015-08-31 13:02:45'),('2015-08-30 13:08:20','2015-08-30 13:08:20','2015-08-30 13:08:20',1,119,'6e712fba-99d7-4b14-9702-a204d1d12b99',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',-560,'2015-08-31 13:08:20'),('2015-08-30 13:08:20','2015-08-30 13:08:20','2015-08-30 13:08:20',1,122,'bf16802e-7dd9-416d-80ad-48efa187115d',4,'5b6cca8b0e464a399f723e7660be3290','volumes',-1,'2015-08-31 13:08:20'),('2015-08-30 13:11:00','2015-08-30 13:11:00','2015-08-30 13:11:00',1,125,'26f89b0a-813a-422b-85ba-1d804e0f5234',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',-80,'2015-08-31 13:11:00'),('2015-08-30 13:11:00','2015-08-30 13:11:00','2015-08-30 13:11:00',1,128,'019a6d9f-a31e-40b8-b84d-161d1b041980',2,'5b6cca8b0e464a399f723e7660be3290','volumes_ceph',-1,'2015-08-31 13:11:00'),('2015-08-30 13:11:00','2015-08-30 13:11:00','2015-08-30 13:11:00',1,131,'fb461526-5549-4253-8cfc-1b5562d802d8',3,'5b6cca8b0e464a399f723e7660be3290','gigabytes_ceph',-80,'2015-08-31 13:11:00'),('2015-08-30 13:11:00','2015-08-30 13:11:00','2015-08-30 13:11:00',1,134,'22376a5e-c09b-4256-8b77-1cb5c1954a76',4,'5b6cca8b0e464a399f723e7660be3290','volumes',-1,'2015-08-31 13:11:00'),('2015-08-30 13:11:57','2015-08-30 13:11:58','2015-08-30 13:11:58',1,137,'3b59e7ff-8885-4e37-aa6d-1adc2ee9a17e',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',80,'2015-08-31 13:11:57'),('2015-08-30 13:11:57','2015-08-30 13:11:58','2015-08-30 13:11:58',1,140,'5ced8f05-b1cc-483c-b1b9-dc14fcd94a1d',4,'5b6cca8b0e464a399f723e7660be3290','volumes',1,'2015-08-31 13:11:57'),('2015-08-30 13:12:25','2015-08-30 13:12:25','2015-08-30 13:12:25',1,143,'40c30558-fd75-47b6-bb52-aade7b6951b7',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',560,'2015-08-31 13:12:25'),('2015-08-30 13:12:25','2015-08-30 13:12:25','2015-08-30 13:12:25',1,146,'096ac4f6-8884-418e-be8d-815b03262ffa',4,'5b6cca8b0e464a399f723e7660be3290','volumes',1,'2015-08-31 13:12:25'),('2015-08-30 13:13:27','2015-08-30 13:13:27','2015-08-30 13:13:27',1,149,'5dcc518f-fe0c-45eb-8663-44d90324187e',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',-560,'2015-08-31 13:13:27'),('2015-08-30 13:13:27','2015-08-30 13:13:27','2015-08-30 13:13:27',1,152,'cded72e4-803a-4b05-bdc2-725909dd8cf2',4,'5b6cca8b0e464a399f723e7660be3290','volumes',-1,'2015-08-31 13:13:27'),('2015-08-30 13:15:20','2015-08-30 13:15:20','2015-08-30 13:15:20',1,155,'5e4d91c1-3bc4-4b7f-9279-b9fde0f2eeab',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',100,'2015-08-31 13:15:20'),('2015-08-30 13:15:20','2015-08-30 13:15:20','2015-08-30 13:15:20',1,158,'b9880ca3-c88b-45e3-8655-f7d1d017e3e6',4,'5b6cca8b0e464a399f723e7660be3290','volumes',1,'2015-08-31 13:15:20'),('2015-08-30 13:15:36','2015-08-30 13:15:36','2015-08-30 13:15:36',1,161,'5ff9a109-4722-42b3-9303-7f5e5e4daaae',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',-100,'2015-08-31 13:15:36'),('2015-08-30 13:15:36','2015-08-30 13:15:36','2015-08-30 13:15:36',1,164,'27faf65f-d557-4bf0-b333-1e8145754ef3',4,'5b6cca8b0e464a399f723e7660be3290','volumes',-1,'2015-08-31 13:15:36'),('2015-08-30 13:17:05','2015-08-30 13:17:05','2015-08-30 13:17:05',1,167,'447c692b-79d4-4e59-8495-fcfd7f0b3b1d',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',560,'2015-08-31 13:17:05'),('2015-08-30 13:17:05','2015-08-30 13:17:05','2015-08-30 13:17:05',1,170,'b40e5e89-a6eb-4a57-8ea6-d0f8b042efe6',4,'5b6cca8b0e464a399f723e7660be3290','volumes',1,'2015-08-31 13:17:05'),('2015-08-30 13:17:16','2015-08-30 13:17:16','2015-08-30 13:17:16',1,173,'b7b213c7-3ce2-4a47-a337-3ad94332b838',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',-560,'2015-08-31 13:17:16'),('2015-08-30 13:17:16','2015-08-30 13:17:16','2015-08-30 13:17:16',1,176,'e6fd9fc0-254e-4a7c-b79f-de02a198cd79',4,'5b6cca8b0e464a399f723e7660be3290','volumes',-1,'2015-08-31 13:17:16'),('2015-08-30 13:17:58','2015-08-30 13:17:58','2015-08-30 13:17:58',1,179,'0ee65037-3635-4d43-a837-faa695eeb9a4',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',200,'2015-08-31 13:17:58'),('2015-08-30 13:17:58','2015-08-30 13:17:58','2015-08-30 13:17:58',1,182,'2f63b510-a72c-4352-bc0a-2cd802bede86',4,'5b6cca8b0e464a399f723e7660be3290','volumes',1,'2015-08-31 13:17:58'),('2015-08-30 13:18:11','2015-08-30 13:18:12','2015-08-30 13:18:12',1,185,'f8acd500-6ade-4b2c-9e93-a9b43a6d57ca',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',-200,'2015-08-31 13:18:11'),('2015-08-30 13:18:11','2015-08-30 13:18:12','2015-08-30 13:18:12',1,188,'9610c46e-3d8a-48a7-b832-59e38db9b740',4,'5b6cca8b0e464a399f723e7660be3290','volumes',-1,'2015-08-31 13:18:11'),('2015-08-30 13:18:51','2015-08-30 13:18:51','2015-08-30 13:18:51',1,191,'6f706928-3d6b-483f-95cb-0cfebcd35da7',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',100,'2015-08-31 13:18:51'),('2015-08-30 13:18:51','2015-08-30 13:18:51','2015-08-30 13:18:51',1,194,'69583cd4-ce16-4370-9bb4-701d34d95cd5',4,'5b6cca8b0e464a399f723e7660be3290','volumes',1,'2015-08-31 13:18:51'),('2015-08-30 13:19:05','2015-08-30 13:19:05','2015-08-30 13:19:05',1,197,'632fb0d4-64d9-4722-8e84-6945a0f57c7c',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',-100,'2015-08-31 13:19:05'),('2015-08-30 13:19:05','2015-08-30 13:19:05','2015-08-30 13:19:05',1,200,'ee4b6bf9-33c3-4926-a1b2-f7e00fdb297f',4,'5b6cca8b0e464a399f723e7660be3290','volumes',-1,'2015-08-31 13:19:05'),('2015-08-30 13:19:29','2015-08-30 13:19:29','2015-08-30 13:19:29',1,203,'cad672a2-57ae-4560-9af7-0d52c36e77d3',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',150,'2015-08-31 13:19:29'),('2015-08-30 13:19:29','2015-08-30 13:19:29','2015-08-30 13:19:29',1,206,'076f1edb-5fa6-4d08-89d6-f5143e06b1bc',4,'5b6cca8b0e464a399f723e7660be3290','volumes',1,'2015-08-31 13:19:29'),('2015-08-30 13:19:48','2015-08-30 13:19:48','2015-08-30 13:19:48',1,209,'84be07e8-f715-4559-841e-7da7a2c44f88',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',-150,'2015-08-31 13:19:48'),('2015-08-30 13:19:48','2015-08-30 13:19:48','2015-08-30 13:19:48',1,212,'ead5aa1a-adb7-4743-9585-df449e898f61',4,'5b6cca8b0e464a399f723e7660be3290','volumes',-1,'2015-08-31 13:19:48'),('2015-08-30 13:20:13','2015-08-30 13:20:14','2015-08-30 13:20:14',1,215,'f35f8955-6473-4493-853a-3e5fba9da63a',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',180,'2015-08-31 13:20:13'),('2015-08-30 13:20:13','2015-08-30 13:20:14','2015-08-30 13:20:14',1,218,'e3e6d890-ec06-472a-a98d-622ac6b3d136',4,'5b6cca8b0e464a399f723e7660be3290','volumes',1,'2015-08-31 13:20:13'),('2015-08-30 13:20:29','2015-08-30 13:20:29','2015-08-30 13:20:29',1,221,'42706f13-258f-4d5c-ad82-63f6b22005fb',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',-180,'2015-08-31 13:20:29'),('2015-08-30 13:20:29','2015-08-30 13:20:29','2015-08-30 13:20:29',1,224,'2542c252-29ab-4fe9-98f9-a882370cf320',4,'5b6cca8b0e464a399f723e7660be3290','volumes',-1,'2015-08-31 13:20:29'),('2015-08-30 13:20:59','2015-08-30 13:20:59','2015-08-30 13:20:59',1,227,'133f867e-4ba2-4615-b565-4af795966a43',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',200,'2015-08-31 13:20:59'),('2015-08-30 13:20:59','2015-08-30 13:20:59','2015-08-30 13:20:59',1,230,'e7580868-0ba6-4d74-8bb5-e69d2a0bf78a',4,'5b6cca8b0e464a399f723e7660be3290','volumes',1,'2015-08-31 13:20:59'),('2015-08-30 13:21:14','2015-08-30 13:21:14','2015-08-30 13:21:14',1,233,'e839bf3d-7d7c-45c3-9222-c21d67789654',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',-200,'2015-08-31 13:21:14'),('2015-08-30 13:21:14','2015-08-30 13:21:14','2015-08-30 13:21:14',1,236,'22295cbb-ac22-45e8-952d-cd2c1fc15e16',4,'5b6cca8b0e464a399f723e7660be3290','volumes',-1,'2015-08-31 13:21:14'),('2015-08-30 13:21:38','2015-08-30 13:21:38','2015-08-30 13:21:38',1,239,'52abee08-b0f7-45e5-b96c-010d9e81cba0',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',199,'2015-08-31 13:21:38'),('2015-08-30 13:21:38','2015-08-30 13:21:38','2015-08-30 13:21:38',1,242,'2a628891-4342-404a-b55c-701b6e973b8a',4,'5b6cca8b0e464a399f723e7660be3290','volumes',1,'2015-08-31 13:21:38'),('2015-08-30 13:21:48','2015-08-30 13:21:48','2015-08-30 13:21:48',1,245,'52309557-fa68-49e8-8408-b03fef05202e',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',-199,'2015-08-31 13:21:48'),('2015-08-30 13:21:48','2015-08-30 13:21:48','2015-08-30 13:21:48',1,248,'7e094ca9-df7c-4419-afba-36954e1c00f0',4,'5b6cca8b0e464a399f723e7660be3290','volumes',-1,'2015-08-31 13:21:48'),('2015-08-30 13:22:59','2015-08-30 13:22:59','2015-08-30 13:22:59',1,251,'f549a3e5-a40c-4a01-85fd-8511e46306fa',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',185,'2015-08-31 13:22:59'),('2015-08-30 13:22:59','2015-08-30 13:22:59','2015-08-30 13:22:59',1,254,'d4fb8ae5-1eb5-4fcc-87f2-7a104eaccadd',4,'5b6cca8b0e464a399f723e7660be3290','volumes',1,'2015-08-31 13:22:59'),('2015-08-30 13:23:31','2015-08-30 13:23:31','2015-08-30 13:23:31',1,257,'688087b9-277f-4bc9-98e8-26d6635b73ef',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',189,'2015-08-31 13:23:31'),('2015-08-30 13:23:31','2015-08-30 13:23:31','2015-08-30 13:23:31',1,260,'b9db0cab-08e1-4c88-9d2f-455830ca4df1',4,'5b6cca8b0e464a399f723e7660be3290','volumes',1,'2015-08-31 13:23:31'),('2015-08-30 13:23:57','2015-08-30 13:23:57','2015-08-30 13:23:57',1,263,'b8b21351-0e9f-4f74-956a-350e488f574a',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',190,'2015-08-31 13:23:57'),('2015-08-30 13:23:57','2015-08-30 13:23:57','2015-08-30 13:23:57',1,266,'da811e55-abed-4fa6-8d1a-59bcba74bb4a',4,'5b6cca8b0e464a399f723e7660be3290','volumes',1,'2015-08-31 13:23:57'),('2015-08-30 13:24:32','2015-08-30 13:24:32','2015-08-30 13:24:32',1,269,'988bdae7-3f94-44c3-b9c8-887e843c4adb',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',195,'2015-08-31 13:24:32'),('2015-08-30 13:24:32','2015-08-30 13:24:32','2015-08-30 13:24:32',1,272,'00dc3c6b-bb90-4cac-a32d-ddc77f6e5119',4,'5b6cca8b0e464a399f723e7660be3290','volumes',1,'2015-08-31 13:24:32'),('2015-08-30 13:24:44','2015-08-30 13:24:45','2015-08-30 13:24:45',1,275,'64eb9b17-69b5-4c06-ae36-539018794c14',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',-195,'2015-08-31 13:24:44'),('2015-08-30 13:24:44','2015-08-30 13:24:45','2015-08-30 13:24:45',1,278,'8d2fe3f0-8cc6-42df-9ea0-8d275eb44ea5',4,'5b6cca8b0e464a399f723e7660be3290','volumes',-1,'2015-08-31 13:24:44'),('2015-08-30 13:25:30','2015-08-30 13:25:30','2015-08-30 13:25:30',1,281,'de593ec6-d1ec-4423-98c6-a1377045611d',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',193,'2015-08-31 13:25:30'),('2015-08-30 13:25:30','2015-08-30 13:25:30','2015-08-30 13:25:30',1,284,'b681fdc2-cb12-4542-b8b9-1428198bcd49',4,'5b6cca8b0e464a399f723e7660be3290','volumes',1,'2015-08-31 13:25:30'),('2015-08-30 13:26:10','2015-08-30 13:26:10','2015-08-30 13:26:10',1,287,'b66611d5-1ebf-437c-a67e-0b045184f77b',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',-193,'2015-08-31 13:26:10'),('2015-08-30 13:26:10','2015-08-30 13:26:10','2015-08-30 13:26:10',1,290,'261fe988-7dd5-4500-920f-84dc50a10c32',4,'5b6cca8b0e464a399f723e7660be3290','volumes',-1,'2015-08-31 13:26:10'),('2015-08-30 13:26:41','2015-08-30 13:26:41','2015-08-30 13:26:41',1,293,'f4b06a98-fde1-4686-b168-870c4bdd78ee',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',194,'2015-08-31 13:26:41'),('2015-08-30 13:26:41','2015-08-30 13:26:41','2015-08-30 13:26:41',1,296,'eeab2ea4-c4e9-46a0-a4a7-01e9fed9c6cf',4,'5b6cca8b0e464a399f723e7660be3290','volumes',1,'2015-08-31 13:26:41'),('2015-08-30 13:37:55','2015-08-30 13:37:55','2015-08-30 13:37:55',1,299,'bee192e6-791c-4e37-9851-44355363972c',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',-194,'2015-08-31 13:37:55'),('2015-08-30 13:37:55','2015-08-30 13:37:55','2015-08-30 13:37:55',1,302,'6b14f92e-80f1-46a6-bf1f-a502924808f0',4,'5b6cca8b0e464a399f723e7660be3290','volumes',-1,'2015-08-31 13:37:55'),('2015-08-30 13:38:00','2015-08-30 13:38:01','2015-08-30 13:38:01',1,305,'4c21eb8f-f3a5-4e37-bf6f-58ca84b18688',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',-190,'2015-08-31 13:38:00'),('2015-08-30 13:38:00','2015-08-30 13:38:01','2015-08-30 13:38:01',1,308,'d81b54d9-fa3c-47f1-bc40-1d6e23d16582',4,'5b6cca8b0e464a399f723e7660be3290','volumes',-1,'2015-08-31 13:38:00'),('2015-08-30 13:38:56','2015-08-30 13:38:57','2015-08-30 13:38:57',1,311,'1bb5f7fb-0967-4ee0-8acc-34a3ab700eb1',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',-189,'2015-08-31 13:38:56'),('2015-08-30 13:38:56','2015-08-30 13:38:57','2015-08-30 13:38:57',1,314,'bbde5c53-889c-47c9-a2b9-e1b6c9caa44f',4,'5b6cca8b0e464a399f723e7660be3290','volumes',-1,'2015-08-31 13:38:56'),('2015-08-30 13:39:41','2015-08-30 13:39:41','2015-08-30 13:39:41',1,317,'cd26d08b-1200-4a7d-ac4c-ec4f1783eca3',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',-185,'2015-08-31 13:39:41'),('2015-08-30 13:39:41','2015-08-30 13:39:41','2015-08-30 13:39:41',1,320,'12686fb0-f3f8-4cfc-8ec4-07449dac157f',4,'5b6cca8b0e464a399f723e7660be3290','volumes',-1,'2015-08-31 13:39:41'),('2015-08-30 13:39:44','2015-08-30 13:39:44','2015-08-30 13:39:44',1,323,'44fb3bf7-b0e5-4659-947b-7fc192da5db2',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',-80,'2015-08-31 13:39:44'),('2015-08-30 13:39:44','2015-08-30 13:39:44','2015-08-30 13:39:44',1,326,'260d1daa-0f34-4a62-9563-c773835ebf45',4,'5b6cca8b0e464a399f723e7660be3290','volumes',-1,'2015-08-31 13:39:44'),('2015-08-30 13:41:29','2015-08-30 13:41:29','2015-08-30 13:41:29',1,329,'6c2aa8ec-ef78-4792-928e-9d545658b2be',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',560,'2015-08-31 13:41:29'),('2015-08-30 13:41:29','2015-08-30 13:41:29','2015-08-30 13:41:29',1,332,'9192a48a-f592-4d65-a940-9fcf6c3d793c',4,'5b6cca8b0e464a399f723e7660be3290','volumes',1,'2015-08-31 13:41:29'),('2015-08-30 13:47:03','2015-08-30 13:47:03','2015-08-30 13:47:03',1,335,'818cdf78-d7df-4973-84a0-63ffb2510f70',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',-560,'2015-08-31 13:47:03'),('2015-08-30 13:47:03','2015-08-30 13:47:03','2015-08-30 13:47:03',1,338,'af98fe6b-231a-40e8-a5de-d319f938d15f',4,'5b6cca8b0e464a399f723e7660be3290','volumes',-1,'2015-08-31 13:47:03'),('2015-08-30 13:47:53','2015-08-30 13:47:53','2015-08-30 13:47:53',1,341,'5dba1483-d463-4713-a5cb-ced2503de0f2',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',560,'2015-08-31 13:47:53'),('2015-08-30 13:47:53','2015-08-30 13:47:53','2015-08-30 13:47:53',1,344,'b7a245c3-bd00-4d0a-99ae-0c67483da5c0',2,'5b6cca8b0e464a399f723e7660be3290','volumes_ceph',1,'2015-08-31 13:47:53'),('2015-08-30 13:47:53','2015-08-30 13:47:53','2015-08-30 13:47:53',1,347,'17c71b5f-dee8-4671-9701-7c93e91216ca',4,'5b6cca8b0e464a399f723e7660be3290','volumes',1,'2015-08-31 13:47:53'),('2015-08-30 13:47:53','2015-08-30 13:47:53','2015-08-30 13:47:53',1,350,'955bb685-262f-4949-81dd-5fce99de9a6b',3,'5b6cca8b0e464a399f723e7660be3290','gigabytes_ceph',560,'2015-08-31 13:47:53'),('2015-08-30 13:51:43','2015-08-30 13:51:43','2015-08-30 13:51:43',1,353,'3b503b3e-a93a-4084-805a-a1dfde2adf09',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',-560,'2015-08-31 13:51:43'),('2015-08-30 13:51:43','2015-08-30 13:51:43','2015-08-30 13:51:43',1,356,'94ec4bc7-86ee-4d6a-be3c-fcc39f1389db',2,'5b6cca8b0e464a399f723e7660be3290','volumes_ceph',-1,'2015-08-31 13:51:43'),('2015-08-30 13:51:43','2015-08-30 13:51:43','2015-08-30 13:51:43',1,359,'4da5552e-0923-469a-824d-b90f96d190dd',3,'5b6cca8b0e464a399f723e7660be3290','gigabytes_ceph',-560,'2015-08-31 13:51:43'),('2015-08-30 13:51:43','2015-08-30 13:51:43','2015-08-30 13:51:43',1,362,'e6c0c58e-b754-4000-8c01-fd4a532294c2',4,'5b6cca8b0e464a399f723e7660be3290','volumes',-1,'2015-08-31 13:51:43'),('2015-08-30 13:52:19','2015-08-30 13:52:19','2015-08-30 13:52:19',1,365,'3f83e05f-eed1-44fe-9a26-74e25d345b70',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',200,'2015-08-31 13:52:19'),('2015-08-30 13:52:19','2015-08-30 13:52:19','2015-08-30 13:52:19',1,368,'4b64ce53-a332-4ed0-93f4-d5572b27992f',4,'5b6cca8b0e464a399f723e7660be3290','volumes',1,'2015-08-31 13:52:19'),('2015-08-30 14:11:00','2015-08-30 14:11:00','2015-08-30 14:11:00',1,371,'7d57b9a1-5d59-4eb1-9c7c-c3c0f3237e41',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',-200,'2015-08-31 14:11:00'),('2015-08-30 14:11:00','2015-08-30 14:11:00','2015-08-30 14:11:00',1,374,'6897a7c2-a100-4d35-94da-a8e987c3938d',4,'5b6cca8b0e464a399f723e7660be3290','volumes',-1,'2015-08-31 14:11:00'),('2015-08-30 14:11:35','2015-08-30 14:11:35','2015-08-30 14:11:35',1,377,'2b7c011d-2629-4198-b852-2a46404a779e',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',560,'2015-08-31 14:11:35'),('2015-08-30 14:11:35','2015-08-30 14:11:35','2015-08-30 14:11:35',1,380,'a4c4d66f-c0d0-440a-bcff-15254730b944',4,'5b6cca8b0e464a399f723e7660be3290','volumes',1,'2015-08-31 14:11:35'),('2015-08-30 15:16:26','2015-08-30 15:16:27','2015-08-30 15:16:27',1,383,'7b107a6c-537d-494b-89c6-b97e1684bb71',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',-560,'2015-08-31 15:16:26'),('2015-08-30 15:16:27','2015-08-30 15:16:27','2015-08-30 15:16:27',1,386,'a383f79c-79fc-473b-b24b-8904fbfc53e6',4,'5b6cca8b0e464a399f723e7660be3290','volumes',-1,'2015-08-31 15:16:26'),('2015-08-30 15:16:54','2015-08-30 15:16:54','2015-08-30 15:16:54',1,389,'e13e8de1-242d-4d01-b8d1-420951908823',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',560,'2015-08-31 15:16:54'),('2015-08-30 15:16:54','2015-08-30 15:16:54','2015-08-30 15:16:54',1,392,'da618073-8e40-4f61-8ce6-13d9fffa8538',4,'5b6cca8b0e464a399f723e7660be3290','volumes',1,'2015-08-31 15:16:54'),('2015-08-30 15:26:02','2015-08-30 15:26:02','2015-08-30 15:26:02',1,395,'4218b1a0-6dbf-4c27-addf-f947d193ce00',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',-560,'2015-08-31 15:26:02'),('2015-08-30 15:26:02','2015-08-30 15:26:02','2015-08-30 15:26:02',1,398,'635b3c03-0287-4929-8cc8-0021df35faaa',4,'5b6cca8b0e464a399f723e7660be3290','volumes',-1,'2015-08-31 15:26:02'),('2015-08-30 15:27:04','2015-08-30 15:27:04','2015-08-30 15:27:04',1,401,'3addd5e3-ad30-45a2-9fd5-6e39c25b343b',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',560,'2015-08-31 15:27:04'),('2015-08-30 15:27:04','2015-08-30 15:27:04','2015-08-30 15:27:04',1,404,'35991e74-f46a-4e5a-867a-9b814f3e50ad',4,'5b6cca8b0e464a399f723e7660be3290','volumes',1,'2015-08-31 15:27:04'),('2015-08-30 15:34:33','2015-08-30 15:34:33','2015-08-30 15:34:33',1,407,'5beffe54-07da-4504-b9e0-bbce481ba6a5',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',-560,'2015-08-31 15:34:33'),('2015-08-30 15:34:33','2015-08-30 15:34:33','2015-08-30 15:34:33',1,410,'3d05c90d-c93c-498e-862c-450d8b833540',4,'5b6cca8b0e464a399f723e7660be3290','volumes',-1,'2015-08-31 15:34:33'),('2015-08-30 15:35:03','2015-08-30 15:35:03','2015-08-30 15:35:03',1,413,'b4e86d63-034d-48af-85f1-9088dbfb2883',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',-1,'2015-08-31 15:35:03'),('2015-08-30 15:35:03','2015-08-30 15:35:03','2015-08-30 15:35:03',1,416,'24e4c297-48cd-41fa-ab1a-8b3189dc9b20',2,'5b6cca8b0e464a399f723e7660be3290','volumes_ceph',-1,'2015-08-31 15:35:03'),('2015-08-30 15:35:03','2015-08-30 15:35:03','2015-08-30 15:35:03',1,419,'7430012e-d430-4f5b-9de7-7ef35dd5e160',3,'5b6cca8b0e464a399f723e7660be3290','gigabytes_ceph',-1,'2015-08-31 15:35:03'),('2015-08-30 15:35:03','2015-08-30 15:35:03','2015-08-30 15:35:03',1,422,'08565956-13ef-41b0-9442-3ca3332928ab',4,'5b6cca8b0e464a399f723e7660be3290','volumes',-1,'2015-08-31 15:35:03'),('2015-08-30 15:40:05','2015-08-30 15:40:05','2015-08-30 15:40:05',1,425,'3a2030e8-9712-45dc-84dc-8d97cb4ac75e',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',560,'2015-08-31 15:40:05'),('2015-08-30 15:40:05','2015-08-30 15:40:05','2015-08-30 15:40:05',1,428,'3bbbe505-37f1-4398-8f4c-5ce35b56849d',4,'5b6cca8b0e464a399f723e7660be3290','volumes',1,'2015-08-31 15:40:05'),('2015-08-30 15:45:28','2015-08-30 15:45:28','2015-08-30 15:45:28',1,431,'16c48609-f1cd-449f-939f-103f9ddae536',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',-560,'2015-08-31 15:45:28'),('2015-08-30 15:45:28','2015-08-30 15:45:28','2015-08-30 15:45:28',1,434,'3dfc7c0c-83d8-4ddc-b664-b3e16baf75a9',4,'5b6cca8b0e464a399f723e7660be3290','volumes',-1,'2015-08-31 15:45:28'),('2015-08-30 16:07:01','2015-08-30 16:07:01','2015-08-30 16:07:01',1,437,'7f657885-90be-440d-a8b2-6d4951a74984',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',1,'2015-08-31 16:07:01'),('2015-08-30 16:07:01','2015-08-30 16:07:01','2015-08-30 16:07:01',1,440,'890e6112-5774-4334-aa25-d0eb5b9efd11',4,'5b6cca8b0e464a399f723e7660be3290','volumes',1,'2015-08-31 16:07:01'),('2015-08-30 16:07:42','2015-08-30 16:07:42','2015-08-30 16:07:42',1,443,'1c30d1c5-2fdc-437c-a745-9e17f079108e',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',-1,'2015-08-31 16:07:42'),('2015-08-30 16:07:42','2015-08-30 16:07:42','2015-08-30 16:07:42',1,446,'82e60b38-f464-4820-999d-bde7921c95e1',4,'5b6cca8b0e464a399f723e7660be3290','volumes',-1,'2015-08-31 16:07:42'),('2015-08-30 16:08:17','2015-08-30 16:08:17','2015-08-30 16:08:17',1,449,'e4feb0a1-3d19-45a7-a08e-819637e14a80',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',1,'2015-08-31 16:08:17'),('2015-08-30 16:08:17','2015-08-30 16:08:17','2015-08-30 16:08:17',1,452,'0c9e480b-21fb-45c0-9649-c71be6e9ae7b',4,'5b6cca8b0e464a399f723e7660be3290','volumes',1,'2015-08-31 16:08:17'),('2015-08-30 16:11:33','2015-08-30 16:11:33','2015-08-30 16:11:33',1,455,'73ec9d30-a33f-4b9d-a3a4-3b205e5a098d',1,'5b6cca8b0e464a399f723e7660be3290','gigabytes',180,'2015-08-31 16:11:33'),('2015-08-30 16:11:33','2015-08-30 16:11:33','2015-08-30 16:11:33',1,458,'f7c00989-6e7b-4bde-8f64-c6637ab82e2c',4,'5b6cca8b0e464a399f723e7660be3290','volumes',1,'2015-08-31 16:11:33');
/*!40000 ALTER TABLE `reservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host` varchar(255) DEFAULT NULL,
  `binary` varchar(255) DEFAULT NULL,
  `topic` varchar(255) DEFAULT NULL,
  `report_count` int(11) NOT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  `availability_zone` varchar(255) DEFAULT NULL,
  `disabled_reason` varchar(255) DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES ('2015-08-19 10:25:09','2015-08-30 17:29:32',NULL,0,1,'controller1.hkexpoc.com','cinder-backup','cinder-backup',81711,0,'nova',NULL,NULL),('2015-08-19 10:25:14','2015-08-30 17:29:32',NULL,0,2,'controller1.hkexpoc.com','cinder-scheduler','cinder-scheduler',80680,0,'nova',NULL,NULL),('2015-08-19 10:25:15','2015-08-20 16:13:09',NULL,0,3,'controller1.hkexpoc.com@lvm','cinder-volume','cinder-volume',9259,1,'nova',NULL,'2015-08-30 14:09:28'),('2015-08-19 13:07:47','2015-08-20 13:40:01',NULL,0,4,'controller2.hkexpoc.com@lvm','cinder-volume','cinder-volume',15379,1,'nova',NULL,'2015-08-30 14:07:01'),('2015-08-19 13:07:47','2015-08-30 17:29:30',NULL,0,5,'controller2.hkexpoc.com','cinder-scheduler','cinder-scheduler',93669,1,'nova',NULL,'2015-08-30 14:08:38'),('2015-08-19 13:07:48','2015-08-30 17:29:30',NULL,0,6,'controller2.hkexpoc.com','cinder-backup','cinder-backup',87580,1,'nova',NULL,'2015-08-30 14:06:10'),('2015-08-19 13:17:56','2015-08-29 13:33:06',NULL,0,7,'controller4.hkexpoc.com','cinder-scheduler','cinder-scheduler',21825,1,'nova',NULL,'2015-08-30 14:08:22'),('2015-08-19 13:17:56','2015-08-27 03:34:59',NULL,0,8,'controller4.hkexpoc.com@lvm','cinder-volume','cinder-volume',56335,1,'nova',NULL,'2015-08-30 14:07:22'),('2015-08-19 13:17:56','2015-08-29 13:33:06',NULL,0,9,'controller4.hkexpoc.com','cinder-backup','cinder-backup',72573,1,'nova',NULL,'2015-08-30 14:06:42'),('2015-08-20 16:13:23','2015-08-30 17:29:37',NULL,0,11,'controller1.hkexpoc.com@rbd','cinder-volume','cinder-volume',71989,0,'nova',NULL,NULL),('2015-08-21 06:50:49','2015-08-29 13:33:04',NULL,0,17,'controller3.hkexpoc.com','cinder-scheduler','cinder-scheduler',67090,1,'nova',NULL,'2015-08-30 14:08:01'),('2015-08-21 06:50:49','2015-08-29 13:33:06',NULL,0,20,'controller3.hkexpoc.com@rbd','cinder-volume','cinder-volume',67132,1,'nova',NULL,'2015-08-30 14:05:13'),('2015-08-21 06:50:49','2015-08-29 13:33:06',NULL,0,23,'controller3.hkexpoc.com','cinder-backup','cinder-backup',67132,1,'nova',NULL,'2015-08-30 14:06:21'),('2015-08-21 07:02:17','2015-08-30 17:29:31',NULL,0,26,'controller2.hkexpoc.com@rbd','cinder-volume','cinder-volume',72204,1,'nova',NULL,'2015-08-30 14:05:28'),('2015-08-27 09:16:21','2015-08-29 13:33:05',NULL,0,27,'controller4.hkexpoc.com@rbd','cinder-volume','cinder-volume',16237,1,'nova',NULL,'2015-08-30 14:04:15');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snapshot_metadata`
--

DROP TABLE IF EXISTS `snapshot_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snapshot_metadata` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `snapshot_id` varchar(36) NOT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `snapshot_id` (`snapshot_id`),
  CONSTRAINT `snapshot_metadata_ibfk_1` FOREIGN KEY (`snapshot_id`) REFERENCES `snapshots` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snapshot_metadata`
--

LOCK TABLES `snapshot_metadata` WRITE;
/*!40000 ALTER TABLE `snapshot_metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `snapshot_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snapshots`
--

DROP TABLE IF EXISTS `snapshots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snapshots` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `id` varchar(36) NOT NULL,
  `volume_id` varchar(36) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `project_id` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `progress` varchar(255) DEFAULT NULL,
  `volume_size` int(11) DEFAULT NULL,
  `scheduled_at` datetime DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `display_description` varchar(255) DEFAULT NULL,
  `provider_location` varchar(255) DEFAULT NULL,
  `encryption_key_id` varchar(36) DEFAULT NULL,
  `volume_type_id` varchar(36) DEFAULT NULL,
  `cgsnapshot_id` varchar(36) DEFAULT NULL,
  `provider_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `snapshots_volume_id_fkey` (`volume_id`),
  KEY `cgsnapshot_id` (`cgsnapshot_id`),
  CONSTRAINT `snapshots_ibfk_1` FOREIGN KEY (`cgsnapshot_id`) REFERENCES `cgsnapshots` (`id`),
  CONSTRAINT `snapshots_volume_id_fkey` FOREIGN KEY (`volume_id`) REFERENCES `volumes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snapshots`
--

LOCK TABLES `snapshots` WRITE;
/*!40000 ALTER TABLE `snapshots` DISABLE KEYS */;
/*!40000 ALTER TABLE `snapshots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transfers`
--

DROP TABLE IF EXISTS `transfers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transfers` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `id` varchar(36) NOT NULL,
  `volume_id` varchar(36) NOT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `crypt_hash` varchar(255) DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `volume_id` (`volume_id`),
  CONSTRAINT `transfers_ibfk_1` FOREIGN KEY (`volume_id`) REFERENCES `volumes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transfers`
--

LOCK TABLES `transfers` WRITE;
/*!40000 ALTER TABLE `transfers` DISABLE KEYS */;
/*!40000 ALTER TABLE `transfers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volume_admin_metadata`
--

DROP TABLE IF EXISTS `volume_admin_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volume_admin_metadata` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `volume_id` varchar(36) NOT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `volume_id` (`volume_id`),
  CONSTRAINT `volume_admin_metadata_ibfk_1` FOREIGN KEY (`volume_id`) REFERENCES `volumes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volume_admin_metadata`
--

LOCK TABLES `volume_admin_metadata` WRITE;
/*!40000 ALTER TABLE `volume_admin_metadata` DISABLE KEYS */;
INSERT INTO `volume_admin_metadata` VALUES ('2015-08-29 12:59:09',NULL,'2015-08-30 15:35:03',1,1,'f660957e-8e22-402e-8a8a-ded1c3600e8c','readonly','False'),('2015-08-29 12:59:09',NULL,'2015-08-30 10:10:44',1,2,'f660957e-8e22-402e-8a8a-ded1c3600e8c','attached_mode','rw');
/*!40000 ALTER TABLE `volume_admin_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volume_attachment`
--

DROP TABLE IF EXISTS `volume_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volume_attachment` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `id` varchar(36) NOT NULL,
  `volume_id` varchar(36) NOT NULL,
  `attached_host` varchar(255) DEFAULT NULL,
  `instance_uuid` varchar(36) DEFAULT NULL,
  `mountpoint` varchar(255) DEFAULT NULL,
  `attach_time` datetime DEFAULT NULL,
  `detach_time` datetime DEFAULT NULL,
  `attach_mode` varchar(36) DEFAULT NULL,
  `attach_status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `volume_id` (`volume_id`),
  CONSTRAINT `volume_attachment_ibfk_1` FOREIGN KEY (`volume_id`) REFERENCES `volumes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volume_attachment`
--

LOCK TABLES `volume_attachment` WRITE;
/*!40000 ALTER TABLE `volume_attachment` DISABLE KEYS */;
INSERT INTO `volume_attachment` VALUES ('2015-08-29 12:59:09','2015-08-30 10:10:44','2015-08-30 10:10:44',1,'1ffdc745-f797-418f-a1d6-ac2da45ca3ff','f660957e-8e22-402e-8a8a-ded1c3600e8c',NULL,'a5846387-2fc7-40b9-9d44-17328f84f9ec','/dev/vda','2015-08-29 12:59:09','2015-08-30 10:10:44','rw','detached');
/*!40000 ALTER TABLE `volume_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volume_glance_metadata`
--

DROP TABLE IF EXISTS `volume_glance_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volume_glance_metadata` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `volume_id` varchar(36) DEFAULT NULL,
  `snapshot_id` varchar(36) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text,
  PRIMARY KEY (`id`),
  KEY `volume_id` (`volume_id`),
  KEY `snapshot_id` (`snapshot_id`),
  CONSTRAINT `volume_glance_metadata_ibfk_1` FOREIGN KEY (`volume_id`) REFERENCES `volumes` (`id`),
  CONSTRAINT `volume_glance_metadata_ibfk_2` FOREIGN KEY (`snapshot_id`) REFERENCES `snapshots` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volume_glance_metadata`
--

LOCK TABLES `volume_glance_metadata` WRITE;
/*!40000 ALTER TABLE `volume_glance_metadata` DISABLE KEYS */;
INSERT INTO `volume_glance_metadata` VALUES ('2015-08-29 12:55:19',NULL,'2015-08-30 15:35:03',1,1,'f660957e-8e22-402e-8a8a-ded1c3600e8c',NULL,'container_format','bare'),('2015-08-29 12:55:19',NULL,'2015-08-30 15:35:03',1,2,'f660957e-8e22-402e-8a8a-ded1c3600e8c',NULL,'min_ram','0'),('2015-08-29 12:55:19',NULL,'2015-08-30 15:35:03',1,3,'f660957e-8e22-402e-8a8a-ded1c3600e8c',NULL,'disk_format','qcow2'),('2015-08-29 12:55:19',NULL,'2015-08-30 15:35:03',1,4,'f660957e-8e22-402e-8a8a-ded1c3600e8c',NULL,'image_name','cirros-tony'),('2015-08-29 12:55:19',NULL,'2015-08-30 15:35:03',1,5,'f660957e-8e22-402e-8a8a-ded1c3600e8c',NULL,'image_id','b67a5837-e740-4c29-9570-3559ff2b7b7a'),('2015-08-29 12:55:19',NULL,'2015-08-30 15:35:03',1,6,'f660957e-8e22-402e-8a8a-ded1c3600e8c',NULL,'checksum','ee1eca47dc88f4879d8a229cc70a07c6'),('2015-08-29 12:55:19',NULL,'2015-08-30 15:35:03',1,7,'f660957e-8e22-402e-8a8a-ded1c3600e8c',NULL,'min_disk','0'),('2015-08-29 12:55:19',NULL,'2015-08-30 15:35:03',1,8,'f660957e-8e22-402e-8a8a-ded1c3600e8c',NULL,'size','13287936'),('2015-08-30 16:08:21',NULL,NULL,0,11,'4b26ec07-bbae-4366-af78-bf67e8ead5d2',NULL,'container_format','bare'),('2015-08-30 16:08:21',NULL,NULL,0,14,'4b26ec07-bbae-4366-af78-bf67e8ead5d2',NULL,'min_ram','0'),('2015-08-30 16:08:21',NULL,NULL,0,17,'4b26ec07-bbae-4366-af78-bf67e8ead5d2',NULL,'disk_format','qcow2'),('2015-08-30 16:08:22',NULL,NULL,0,20,'4b26ec07-bbae-4366-af78-bf67e8ead5d2',NULL,'image_name','cirros-tony'),('2015-08-30 16:08:22',NULL,NULL,0,23,'4b26ec07-bbae-4366-af78-bf67e8ead5d2',NULL,'image_id','b67a5837-e740-4c29-9570-3559ff2b7b7a'),('2015-08-30 16:08:22',NULL,NULL,0,26,'4b26ec07-bbae-4366-af78-bf67e8ead5d2',NULL,'checksum','ee1eca47dc88f4879d8a229cc70a07c6'),('2015-08-30 16:08:22',NULL,NULL,0,29,'4b26ec07-bbae-4366-af78-bf67e8ead5d2',NULL,'min_disk','0'),('2015-08-30 16:08:22',NULL,NULL,0,32,'4b26ec07-bbae-4366-af78-bf67e8ead5d2',NULL,'size','13287936');
/*!40000 ALTER TABLE `volume_glance_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volume_metadata`
--

DROP TABLE IF EXISTS `volume_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volume_metadata` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `volume_id` varchar(36) NOT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `volume_id` (`volume_id`),
  CONSTRAINT `volume_metadata_ibfk_1` FOREIGN KEY (`volume_id`) REFERENCES `volumes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volume_metadata`
--

LOCK TABLES `volume_metadata` WRITE;
/*!40000 ALTER TABLE `volume_metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `volume_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volume_type_extra_specs`
--

DROP TABLE IF EXISTS `volume_type_extra_specs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volume_type_extra_specs` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `volume_type_id` varchar(36) NOT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `volume_type_extra_specs_ibfk_1` (`volume_type_id`),
  CONSTRAINT `volume_type_extra_specs_ibfk_1` FOREIGN KEY (`volume_type_id`) REFERENCES `volume_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volume_type_extra_specs`
--

LOCK TABLES `volume_type_extra_specs` WRITE;
/*!40000 ALTER TABLE `volume_type_extra_specs` DISABLE KEYS */;
INSERT INTO `volume_type_extra_specs` VALUES ('2015-08-19 10:25:13',NULL,'2015-08-30 13:07:45',1,1,'cb03ee4e-1465-45f4-8cf0-cc7c0ad1e0c0','volume_backend_name','lvm'),('2015-08-25 08:05:13','2015-08-30 13:01:21',NULL,0,3,'4c8388d8-9094-4e6c-8d2c-4d05569684f5','volume_backend_name','rbd');
/*!40000 ALTER TABLE `volume_type_extra_specs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volume_type_projects`
--

DROP TABLE IF EXISTS `volume_type_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volume_type_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `volume_type_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `volume_type_id` (`volume_type_id`,`project_id`,`deleted`),
  CONSTRAINT `volume_type_projects_ibfk_1` FOREIGN KEY (`volume_type_id`) REFERENCES `volume_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volume_type_projects`
--

LOCK TABLES `volume_type_projects` WRITE;
/*!40000 ALTER TABLE `volume_type_projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `volume_type_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volume_types`
--

DROP TABLE IF EXISTS `volume_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volume_types` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `id` varchar(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `qos_specs_id` varchar(36) DEFAULT NULL,
  `is_public` tinyint(1) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `qos_specs_id` (`qos_specs_id`),
  CONSTRAINT `volume_types_ibfk_1` FOREIGN KEY (`qos_specs_id`) REFERENCES `quality_of_service_specs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volume_types`
--

LOCK TABLES `volume_types` WRITE;
/*!40000 ALTER TABLE `volume_types` DISABLE KEYS */;
INSERT INTO `volume_types` VALUES ('2015-08-25 08:04:47',NULL,'2015-08-28 04:22:33',1,'11e5e5fb-1c3b-43ea-b63a-8bada9387944','lvm',NULL,1,NULL),('2015-08-25 08:04:58',NULL,NULL,0,'4c8388d8-9094-4e6c-8d2c-4d05569684f5','ceph',NULL,1,NULL),('2015-08-19 10:25:10',NULL,'2015-08-30 13:07:45',1,'cb03ee4e-1465-45f4-8cf0-cc7c0ad1e0c0','iscsi',NULL,1,NULL);
/*!40000 ALTER TABLE `volume_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumes` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `id` varchar(36) NOT NULL,
  `ec2_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `project_id` varchar(255) DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `availability_zone` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `attach_status` varchar(255) DEFAULT NULL,
  `scheduled_at` datetime DEFAULT NULL,
  `launched_at` datetime DEFAULT NULL,
  `terminated_at` datetime DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `display_description` varchar(255) DEFAULT NULL,
  `provider_location` varchar(256) DEFAULT NULL,
  `provider_auth` varchar(256) DEFAULT NULL,
  `snapshot_id` varchar(36) DEFAULT NULL,
  `volume_type_id` varchar(36) DEFAULT NULL,
  `source_volid` varchar(36) DEFAULT NULL,
  `bootable` tinyint(1) DEFAULT NULL,
  `provider_geometry` varchar(255) DEFAULT NULL,
  `_name_id` varchar(36) DEFAULT NULL,
  `encryption_key_id` varchar(36) DEFAULT NULL,
  `migration_status` varchar(255) DEFAULT NULL,
  `replication_status` varchar(255) DEFAULT NULL,
  `replication_extended_status` varchar(255) DEFAULT NULL,
  `replication_driver_data` varchar(255) DEFAULT NULL,
  `consistencygroup_id` varchar(36) DEFAULT NULL,
  `provider_id` varchar(255) DEFAULT NULL,
  `multiattach` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `consistencygroup_id` (`consistencygroup_id`),
  CONSTRAINT `volumes_ibfk_1` FOREIGN KEY (`consistencygroup_id`) REFERENCES `consistencygroups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
INSERT INTO `volumes` VALUES ('2015-08-30 13:26:41','2015-08-30 13:37:48','2015-08-30 13:37:55',1,'1356fab8-814c-47ce-b1c0-7026585b4005',NULL,'f901000cb1c842ccbe139860ba5080c2','5b6cca8b0e464a399f723e7660be3290','controller1.hkexpoc.com@rbd#RBD',194,'nova','deleted','detached','2015-08-30 13:26:41','2015-08-30 13:26:41','2015-08-30 13:37:48','tony-test',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'disabled',NULL,NULL,NULL,NULL,0),('2015-08-30 13:25:30','2015-08-30 13:26:04','2015-08-30 13:26:10',1,'15eb6844-191b-4c73-b32d-af6797382cf1',NULL,'f901000cb1c842ccbe139860ba5080c2','5b6cca8b0e464a399f723e7660be3290','controller1.hkexpoc.com@rbd#RBD',193,'nova','deleted','detached','2015-08-30 13:25:30','2015-08-30 13:25:30','2015-08-30 13:26:04','tony-test',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'disabled',NULL,NULL,NULL,NULL,0),('2015-08-30 13:12:25','2015-08-30 13:12:25','2015-08-30 13:13:27',1,'2e180a5c-bfe4-4d97-93bf-06fbd006f13a',NULL,'f901000cb1c842ccbe139860ba5080c2','5b6cca8b0e464a399f723e7660be3290',NULL,560,'nova','deleted','detached',NULL,NULL,NULL,'SWEB0078-disk2',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'disabled',NULL,NULL,NULL,NULL,0),('2015-08-29 01:40:32','2015-08-29 02:19:58','2015-08-29 02:19:59',1,'368ffd84-1099-48ea-a46d-4db48e5052bf',NULL,'f901000cb1c842ccbe139860ba5080c2','5b6cca8b0e464a399f723e7660be3290','controller1.hkexpoc.com@rbd#RBD',31,'nova','deleted','detached','2015-08-29 01:40:33',NULL,'2015-08-29 02:19:58','SDCC0027',NULL,NULL,NULL,NULL,'4c8388d8-9094-4e6c-8d2c-4d05569684f5',NULL,0,NULL,NULL,NULL,NULL,'disabled',NULL,NULL,NULL,NULL,0),('2015-08-30 16:08:17','2015-08-30 16:08:22',NULL,0,'4b26ec07-bbae-4366-af78-bf67e8ead5d2',NULL,'f901000cb1c842ccbe139860ba5080c2','5b6cca8b0e464a399f723e7660be3290','controller1.hkexpoc.com@rbd#RBD',1,'nova','available','detached','2015-08-30 16:08:17','2015-08-30 16:08:22',NULL,'cirros-tony',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'disabled',NULL,NULL,NULL,NULL,0),('2015-08-30 13:20:59','2015-08-30 13:21:00','2015-08-30 13:21:14',1,'4b7c49ff-7eae-4716-81a0-deb0e7cfbe87',NULL,'f901000cb1c842ccbe139860ba5080c2','5b6cca8b0e464a399f723e7660be3290',NULL,200,'nova','deleted','detached',NULL,NULL,NULL,'SWEB0078-disk2',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'disabled',NULL,NULL,NULL,NULL,0),('2015-08-30 13:20:14','2015-08-30 13:20:24','2015-08-30 13:20:29',1,'4db6597b-6c7e-41f9-b522-08bec39f1492',NULL,'f901000cb1c842ccbe139860ba5080c2','5b6cca8b0e464a399f723e7660be3290','controller1.hkexpoc.com@rbd#RBD',180,'nova','deleted','detached','2015-08-30 13:20:14','2015-08-30 13:20:15','2015-08-30 13:20:24','SWEB0078-disk2',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'disabled',NULL,NULL,NULL,NULL,0),('2015-08-30 15:27:04','2015-08-30 15:27:05','2015-08-30 15:34:33',1,'59c8ace9-c416-4651-ad21-28cd57fed362',NULL,'f901000cb1c842ccbe139860ba5080c2','5b6cca8b0e464a399f723e7660be3290',NULL,560,'nova','deleted','detached',NULL,NULL,NULL,'SWEB0078-disk2',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'disabled',NULL,NULL,NULL,NULL,0),('2015-08-30 13:17:58','2015-08-30 13:17:58','2015-08-30 13:18:12',1,'5c428a85-a1cb-42a8-a87e-d2e65e95aa93',NULL,'f901000cb1c842ccbe139860ba5080c2','5b6cca8b0e464a399f723e7660be3290',NULL,200,'nova','deleted','detached',NULL,NULL,NULL,'SWEB0078-disk2',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'disabled',NULL,NULL,NULL,NULL,0),('2015-08-30 13:19:29','2015-08-30 13:19:43','2015-08-30 13:19:48',1,'5c4f2227-3b28-4742-bf38-58cb9e7bee29',NULL,'f901000cb1c842ccbe139860ba5080c2','5b6cca8b0e464a399f723e7660be3290','controller1.hkexpoc.com@rbd#RBD',150,'nova','deleted','detached','2015-08-30 13:19:29','2015-08-30 13:19:29','2015-08-30 13:19:43','SWEB0078-disk2',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'disabled',NULL,NULL,NULL,NULL,0),('2015-08-30 13:22:59','2015-08-30 13:39:36','2015-08-30 13:39:41',1,'65a4a107-da5c-47a5-888e-d6657c555a64',NULL,'f901000cb1c842ccbe139860ba5080c2','5b6cca8b0e464a399f723e7660be3290','controller1.hkexpoc.com@rbd#RBD',185,'nova','deleted','detached','2015-08-30 13:22:59','2015-08-30 13:22:59','2015-08-30 13:39:36','SWEB0078-disk2',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'disabled',NULL,NULL,NULL,NULL,0),('2015-08-30 13:41:29','2015-08-30 13:41:29','2015-08-30 13:47:03',1,'8072dfa6-a245-4ea9-9369-edd98e5e99dd',NULL,'f901000cb1c842ccbe139860ba5080c2','5b6cca8b0e464a399f723e7660be3290',NULL,560,'nova','deleted','detached',NULL,NULL,NULL,'SWEB0078-disk2',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'disabled',NULL,NULL,NULL,NULL,0),('2015-08-30 14:11:35','2015-08-30 14:11:35','2015-08-30 15:16:27',1,'8338ff60-5641-4e65-984d-193b31a5eaee',NULL,'f901000cb1c842ccbe139860ba5080c2','5b6cca8b0e464a399f723e7660be3290',NULL,560,'nova','deleted','detached',NULL,NULL,NULL,'TEST',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'disabled',NULL,NULL,NULL,NULL,0),('2015-08-29 02:21:33','2015-08-29 03:24:49','2015-08-29 03:24:51',1,'898ae046-b49e-48ed-bbd2-54bbe22fad25',NULL,'f901000cb1c842ccbe139860ba5080c2','5b6cca8b0e464a399f723e7660be3290','controller1.hkexpoc.com@rbd#RBD',31,'nova','deleted','detached','2015-08-29 02:21:34',NULL,'2015-08-29 03:24:49','SDCC0027',NULL,NULL,NULL,NULL,'4c8388d8-9094-4e6c-8d2c-4d05569684f5',NULL,0,NULL,NULL,NULL,NULL,'disabled',NULL,NULL,NULL,NULL,0),('2015-08-30 13:24:32','2015-08-30 13:24:32','2015-08-30 13:24:45',1,'8ab3c7ab-b952-44e8-b51b-097534933250',NULL,'f901000cb1c842ccbe139860ba5080c2','5b6cca8b0e464a399f723e7660be3290',NULL,195,'nova','deleted','detached',NULL,NULL,NULL,'tony-test',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'disabled',NULL,NULL,NULL,NULL,0),('2015-08-30 15:40:05','2015-08-30 15:40:05','2015-08-30 15:45:28',1,'91cc128e-6769-49dc-95b6-55330a58b5fe',NULL,'f901000cb1c842ccbe139860ba5080c2','5b6cca8b0e464a399f723e7660be3290',NULL,560,'nova','deleted','detached',NULL,NULL,NULL,'SWEB0078-disk2',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'disabled',NULL,NULL,NULL,NULL,0),('2015-08-30 12:39:10','2015-08-30 12:39:10','2015-08-30 12:42:03',1,'9210c1ab-93b9-4492-a116-00a609870e33',NULL,'f901000cb1c842ccbe139860ba5080c2','5b6cca8b0e464a399f723e7660be3290',NULL,560,'nova','deleted','detached',NULL,NULL,NULL,'SWEB0078-disk2',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'disabled',NULL,NULL,NULL,NULL,0),('2015-08-30 15:16:54','2015-08-30 15:16:54','2015-08-30 15:26:02',1,'9e97148d-8ec3-4c64-acd5-e94a45409687',NULL,'f901000cb1c842ccbe139860ba5080c2','5b6cca8b0e464a399f723e7660be3290',NULL,560,'nova','deleted','detached',NULL,NULL,NULL,'TEST',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'disabled',NULL,NULL,NULL,NULL,0),('2015-08-30 13:11:57','2015-08-30 13:39:41','2015-08-30 13:39:44',1,'a5b01325-0aa7-46b4-ba11-ec32689ce26b',NULL,'f901000cb1c842ccbe139860ba5080c2','5b6cca8b0e464a399f723e7660be3290','controller1.hkexpoc.com@rbd#RBD',80,'nova','deleted','detached','2015-08-30 13:11:58','2015-08-30 13:11:59','2015-08-30 13:39:41','PoC_Cloud_SDCC0027_disk1',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'disabled',NULL,NULL,NULL,NULL,0),('2015-08-30 12:59:42','2015-08-30 12:59:43','2015-08-30 13:02:02',1,'aba5234e-957f-4d38-9111-e4601719b1c7',NULL,'f901000cb1c842ccbe139860ba5080c2','5b6cca8b0e464a399f723e7660be3290',NULL,560,'nova','deleted','detached',NULL,NULL,NULL,'SWEB0078-disk2',NULL,NULL,NULL,NULL,'4c8388d8-9094-4e6c-8d2c-4d05569684f5',NULL,0,NULL,NULL,NULL,NULL,'disabled',NULL,NULL,NULL,NULL,0),('2015-08-29 03:32:41','2015-08-29 12:52:43','2015-08-29 12:52:45',1,'ade52de0-63d3-4d89-ac0e-661f90d9e16b',NULL,'f901000cb1c842ccbe139860ba5080c2','5b6cca8b0e464a399f723e7660be3290','controller1.hkexpoc.com@rbd#RBD',80,'nova','deleted','detached','2015-08-29 03:32:41',NULL,'2015-08-29 12:52:43','PoC_Cloud_SDCC0027_clone-disk1-sda',NULL,NULL,NULL,NULL,'4c8388d8-9094-4e6c-8d2c-4d05569684f5',NULL,0,NULL,NULL,NULL,NULL,'disabled',NULL,NULL,NULL,NULL,0),('2015-08-30 13:15:20','2015-08-30 13:15:33','2015-08-30 13:15:36',1,'ae9177bf-9bc8-48b1-9286-264be0c72aeb',NULL,'f901000cb1c842ccbe139860ba5080c2','5b6cca8b0e464a399f723e7660be3290','controller1.hkexpoc.com@rbd#RBD',100,'nova','deleted','detached','2015-08-30 13:15:20','2015-08-30 13:15:20','2015-08-30 13:15:33','PoC_Cloud_SDCC0027_disk2',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'disabled',NULL,NULL,NULL,NULL,0),('2015-08-30 13:23:31','2015-08-30 13:38:51','2015-08-30 13:38:57',1,'af28db8e-b9c7-4f6e-8335-f73feaf4d3fa',NULL,'f901000cb1c842ccbe139860ba5080c2','5b6cca8b0e464a399f723e7660be3290','controller1.hkexpoc.com@rbd#RBD',189,'nova','deleted','detached','2015-08-30 13:23:31','2015-08-30 13:23:31','2015-08-30 13:38:51','tony-test',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'disabled',NULL,NULL,NULL,NULL,0),('2015-08-30 13:21:38','2015-08-30 13:21:38','2015-08-30 13:21:48',1,'b4507f4b-aed8-4167-baa3-5d99a9839333',NULL,'f901000cb1c842ccbe139860ba5080c2','5b6cca8b0e464a399f723e7660be3290',NULL,199,'nova','deleted','detached',NULL,NULL,NULL,'SWEB0078-disk2',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'disabled',NULL,NULL,NULL,NULL,0),('2015-08-30 13:47:53','2015-08-30 13:47:53','2015-08-30 13:51:43',1,'b61418d7-4fb5-4225-ae46-04b75c672d5d',NULL,'f901000cb1c842ccbe139860ba5080c2','5b6cca8b0e464a399f723e7660be3290',NULL,560,'nova','deleted','detached',NULL,NULL,NULL,'tony-test',NULL,NULL,NULL,NULL,'4c8388d8-9094-4e6c-8d2c-4d05569684f5',NULL,0,NULL,NULL,NULL,NULL,'disabled',NULL,NULL,NULL,NULL,0),('2015-08-29 01:29:47','2015-08-29 01:40:01','2015-08-29 01:40:03',1,'b7171b90-b9ec-489b-9e70-b1e622083723',NULL,'f901000cb1c842ccbe139860ba5080c2','5b6cca8b0e464a399f723e7660be3290','controller1.hkexpoc.com@rbd#RBD',31,'nova','deleted','detached','2015-08-29 01:29:47',NULL,'2015-08-29 01:40:01','SDCC0027',NULL,NULL,NULL,NULL,'4c8388d8-9094-4e6c-8d2c-4d05569684f5',NULL,0,NULL,NULL,NULL,NULL,'disabled',NULL,NULL,NULL,NULL,0),('2015-08-30 16:11:33','2015-08-30 16:56:27',NULL,0,'c488a3fb-db0e-4933-86a0-e2ee89bb26f6',NULL,'f901000cb1c842ccbe139860ba5080c2','5b6cca8b0e464a399f723e7660be3290','controller1.hkexpoc.com@rbd#RBD',180,'nova','error','detached','2015-08-30 16:11:33',NULL,NULL,'SIRSAPP1-disk1',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'disabled',NULL,NULL,NULL,NULL,0),('2015-08-30 13:18:51','2015-08-30 13:19:02','2015-08-30 13:19:05',1,'c52d41f0-058b-470a-a56c-46d280c07820',NULL,'f901000cb1c842ccbe139860ba5080c2','5b6cca8b0e464a399f723e7660be3290','controller1.hkexpoc.com@rbd#RBD',100,'nova','deleted','detached','2015-08-30 13:18:51','2015-08-30 13:18:51','2015-08-30 13:19:02','SWEB0078-disk2',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'disabled',NULL,NULL,NULL,NULL,0),('2015-08-30 13:17:05','2015-08-30 13:17:05','2015-08-30 13:17:16',1,'c848eb31-fe0d-4174-bd24-1321da7c0587',NULL,'f901000cb1c842ccbe139860ba5080c2','5b6cca8b0e464a399f723e7660be3290',NULL,560,'nova','deleted','detached',NULL,NULL,NULL,'SWEB0078_disk2',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'disabled',NULL,NULL,NULL,NULL,0),('2015-08-30 13:02:45','2015-08-30 13:02:45','2015-08-30 13:08:20',1,'ca5509d9-53f7-425e-880d-ad3dd31b5a89',NULL,'f901000cb1c842ccbe139860ba5080c2','5b6cca8b0e464a399f723e7660be3290',NULL,560,'nova','deleted','detached',NULL,NULL,NULL,'SWEB0078-disk2',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'disabled',NULL,NULL,NULL,NULL,0),('2015-08-30 13:23:57','2015-08-30 13:37:54','2015-08-30 13:38:00',1,'cccbfab3-2eef-45ad-a975-ff36bcbf9642',NULL,'f901000cb1c842ccbe139860ba5080c2','5b6cca8b0e464a399f723e7660be3290','controller1.hkexpoc.com@rbd#RBD',190,'nova','deleted','detached','2015-08-30 13:23:57','2015-08-30 13:23:57','2015-08-30 13:37:54','tony-test',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'disabled',NULL,NULL,NULL,NULL,0),('2015-08-30 16:07:01','2015-08-30 16:07:03','2015-08-30 16:07:42',1,'cf1d59c3-8ab2-49b9-aaa9-bbdf8aaedc83',NULL,'f901000cb1c842ccbe139860ba5080c2','5b6cca8b0e464a399f723e7660be3290',NULL,1,'nova','deleted','detached','2015-08-30 16:07:02',NULL,NULL,'cirros-tony',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'disabled',NULL,NULL,NULL,NULL,0),('2015-08-30 12:51:38','2015-08-30 12:51:39','2015-08-30 12:55:23',1,'e78479ad-4f48-4113-ad71-95751ef4df26',NULL,'f901000cb1c842ccbe139860ba5080c2','5b6cca8b0e464a399f723e7660be3290',NULL,560,'nova','deleted','detached',NULL,NULL,NULL,'TEST',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'disabled',NULL,NULL,NULL,NULL,0),('2015-08-29 12:52:09','2015-08-30 13:10:57','2015-08-30 13:11:00',1,'e8636d53-bd2e-4be2-b65d-74039a7a04d5',NULL,'f901000cb1c842ccbe139860ba5080c2','5b6cca8b0e464a399f723e7660be3290','controller1.hkexpoc.com@rbd#RBD',80,'nova','deleted','detached','2015-08-29 12:52:09','2015-08-29 12:52:10','2015-08-30 13:10:57','PoC_Cloud_SDCC0027_disk1',NULL,NULL,NULL,NULL,'4c8388d8-9094-4e6c-8d2c-4d05569684f5',NULL,0,NULL,NULL,NULL,NULL,'disabled',NULL,NULL,NULL,NULL,0),('2015-08-30 12:42:48','2015-08-30 12:42:48','2015-08-30 12:45:07',1,'f2ba4613-e975-40ff-8e3b-7614a573cae7',NULL,'f901000cb1c842ccbe139860ba5080c2','5b6cca8b0e464a399f723e7660be3290',NULL,560,'nova','deleted','detached',NULL,NULL,NULL,'SWEB0078-disk2',NULL,NULL,NULL,NULL,'4c8388d8-9094-4e6c-8d2c-4d05569684f5',NULL,0,NULL,NULL,NULL,NULL,'disabled',NULL,NULL,NULL,NULL,0),('2015-08-29 12:55:16','2015-08-30 15:35:02','2015-08-30 15:35:03',1,'f660957e-8e22-402e-8a8a-ded1c3600e8c',NULL,'f901000cb1c842ccbe139860ba5080c2','5b6cca8b0e464a399f723e7660be3290','controller1.hkexpoc.com@rbd#RBD',1,'nova','deleted','detached','2015-08-29 12:55:17','2015-08-29 12:55:19','2015-08-30 15:35:02','cirros-tony',NULL,NULL,NULL,NULL,'4c8388d8-9094-4e6c-8d2c-4d05569684f5',NULL,1,NULL,NULL,NULL,NULL,'disabled',NULL,NULL,NULL,NULL,0),('2015-08-30 13:52:19','2015-08-30 13:52:19','2015-08-30 14:11:00',1,'fe8b7796-78f8-4ab6-9fb9-7cf192bdab3d',NULL,'f901000cb1c842ccbe139860ba5080c2','5b6cca8b0e464a399f723e7660be3290',NULL,200,'nova','deleted','detached',NULL,NULL,NULL,'tony-test',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'disabled',NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-08-31  1:29:39
