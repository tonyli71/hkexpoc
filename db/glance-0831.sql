-- MySQL dump 10.14  Distrib 5.5.44-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: glance
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
-- Table structure for table `artifact_blob_locations`
--

DROP TABLE IF EXISTS `artifact_blob_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artifact_blob_locations` (
  `id` varchar(36) NOT NULL,
  `blob_id` varchar(36) NOT NULL,
  `value` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `position` int(11) DEFAULT NULL,
  `status` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_artifact_blob_locations_blob_id` (`blob_id`),
  CONSTRAINT `artifact_blob_locations_ibfk_1` FOREIGN KEY (`blob_id`) REFERENCES `artifact_blobs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artifact_blob_locations`
--

LOCK TABLES `artifact_blob_locations` WRITE;
/*!40000 ALTER TABLE `artifact_blob_locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `artifact_blob_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artifact_blobs`
--

DROP TABLE IF EXISTS `artifact_blobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artifact_blobs` (
  `id` varchar(36) NOT NULL,
  `artifact_id` varchar(36) NOT NULL,
  `size` bigint(20) NOT NULL,
  `checksum` varchar(32) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `item_key` varchar(329) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_artifact_blobs_artifact_id` (`artifact_id`),
  KEY `ix_artifact_blobs_name` (`name`),
  CONSTRAINT `artifact_blobs_ibfk_1` FOREIGN KEY (`artifact_id`) REFERENCES `artifacts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artifact_blobs`
--

LOCK TABLES `artifact_blobs` WRITE;
/*!40000 ALTER TABLE `artifact_blobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `artifact_blobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artifact_dependencies`
--

DROP TABLE IF EXISTS `artifact_dependencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artifact_dependencies` (
  `id` varchar(36) NOT NULL,
  `artifact_source` varchar(36) NOT NULL,
  `artifact_dest` varchar(36) NOT NULL,
  `artifact_origin` varchar(36) NOT NULL,
  `is_direct` tinyint(1) NOT NULL,
  `position` int(11) DEFAULT NULL,
  `name` varchar(36) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_artifact_dependencies_source_id` (`artifact_source`),
  KEY `ix_artifact_dependencies_direct_dependencies` (`artifact_source`,`is_direct`),
  KEY `ix_artifact_dependencies_origin_id` (`artifact_origin`),
  KEY `ix_artifact_dependencies_dest_id` (`artifact_dest`),
  CONSTRAINT `artifact_dependencies_ibfk_1` FOREIGN KEY (`artifact_source`) REFERENCES `artifacts` (`id`),
  CONSTRAINT `artifact_dependencies_ibfk_2` FOREIGN KEY (`artifact_dest`) REFERENCES `artifacts` (`id`),
  CONSTRAINT `artifact_dependencies_ibfk_3` FOREIGN KEY (`artifact_origin`) REFERENCES `artifacts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artifact_dependencies`
--

LOCK TABLES `artifact_dependencies` WRITE;
/*!40000 ALTER TABLE `artifact_dependencies` DISABLE KEYS */;
/*!40000 ALTER TABLE `artifact_dependencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artifact_properties`
--

DROP TABLE IF EXISTS `artifact_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artifact_properties` (
  `id` varchar(36) NOT NULL,
  `artifact_id` varchar(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `string_value` varchar(255) DEFAULT NULL,
  `int_value` int(11) DEFAULT NULL,
  `numeric_value` decimal(10,0) DEFAULT NULL,
  `bool_value` tinyint(1) DEFAULT NULL,
  `text_value` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_artifact_properties_artifact_id` (`artifact_id`),
  KEY `ix_artifact_properties_name` (`name`),
  CONSTRAINT `artifact_properties_ibfk_1` FOREIGN KEY (`artifact_id`) REFERENCES `artifacts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artifact_properties`
--

LOCK TABLES `artifact_properties` WRITE;
/*!40000 ALTER TABLE `artifact_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `artifact_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artifact_tags`
--

DROP TABLE IF EXISTS `artifact_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artifact_tags` (
  `id` varchar(36) NOT NULL,
  `artifact_id` varchar(36) NOT NULL,
  `value` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_artifact_tags_artifact_id` (`artifact_id`),
  KEY `ix_artifact_tags_artifact_id_tag_value` (`artifact_id`,`value`),
  CONSTRAINT `artifact_tags_ibfk_1` FOREIGN KEY (`artifact_id`) REFERENCES `artifacts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artifact_tags`
--

LOCK TABLES `artifact_tags` WRITE;
/*!40000 ALTER TABLE `artifact_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `artifact_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artifacts`
--

DROP TABLE IF EXISTS `artifacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artifacts` (
  `id` varchar(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type_name` varchar(255) NOT NULL,
  `type_version_prefix` bigint(20) NOT NULL,
  `type_version_suffix` varchar(255) DEFAULT NULL,
  `type_version_meta` varchar(255) DEFAULT NULL,
  `version_prefix` bigint(20) NOT NULL,
  `version_suffix` varchar(255) DEFAULT NULL,
  `version_meta` varchar(255) DEFAULT NULL,
  `description` text,
  `visibility` varchar(32) NOT NULL,
  `state` varchar(32) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_artifact_state` (`state`),
  KEY `ix_artifact_name_and_version` (`name`,`version_prefix`,`version_suffix`),
  KEY `ix_artifact_visibility` (`visibility`),
  KEY `ix_artifact_owner` (`owner`),
  KEY `ix_artifact_type` (`type_name`,`type_version_prefix`,`type_version_suffix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artifacts`
--

LOCK TABLES `artifacts` WRITE;
/*!40000 ALTER TABLE `artifacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `artifacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image_locations`
--

DROP TABLE IF EXISTS `image_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image_locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_id` varchar(36) NOT NULL,
  `value` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `meta_data` text,
  `status` varchar(30) NOT NULL DEFAULT 'active',
  PRIMARY KEY (`id`),
  KEY `ix_image_locations_image_id` (`image_id`),
  KEY `ix_image_locations_deleted` (`deleted`),
  CONSTRAINT `image_locations_ibfk_1` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image_locations`
--

LOCK TABLES `image_locations` WRITE;
/*!40000 ALTER TABLE `image_locations` DISABLE KEYS */;
INSERT INTO `image_locations` VALUES (1,'b67a5837-e740-4c29-9570-3559ff2b7b7a','rbd://30d1e78f-f665-41c4-b2a4-2481c2f9e2af/glance-pool/b67a5837-e740-4c29-9570-3559ff2b7b7a/snap','2015-08-25 03:16:03','2015-08-25 03:16:03',NULL,0,'{}','active'),(2,'b5686267-6a66-43d1-9109-0c0e5452f99c','rbd://30d1e78f-f665-41c4-b2a4-2481c2f9e2af/glance-pool/b5686267-6a66-43d1-9109-0c0e5452f99c/snap','2015-08-28 17:11:54','2015-08-28 17:11:54',NULL,0,'{}','active'),(3,'8ee0c177-9cbd-405f-9a4d-7d6a25a151c7','rbd://30d1e78f-f665-41c4-b2a4-2481c2f9e2af/glance-pool/8ee0c177-9cbd-405f-9a4d-7d6a25a151c7/snap','2015-08-29 02:39:31','2015-08-29 02:39:31',NULL,0,'{}','active'),(5,'827c3d52-77fa-484e-b33d-07330ac8bea1','rbd://30d1e78f-f665-41c4-b2a4-2481c2f9e2af/glance-pool/827c3d52-77fa-484e-b33d-07330ac8bea1/snap','2015-08-30 01:01:35','2015-08-30 01:24:37','2015-08-30 01:24:37',1,'{}','deleted'),(8,'827c3d52-77fa-484e-b33d-07330ac8bea2','rbd://30d1e78f-f665-41c4-b2a4-2481c2f9e2af/glance-pool/827c3d52-77fa-484e-b33d-07330ac8bea2/snap','2015-08-30 01:31:59','2015-08-30 01:31:59','2015-08-30 01:31:59',1,'{}','deleted'),(11,'827c3d52-77fa-484e-b33d-07330ac8bea2','rbd://30d1e78f-f665-41c4-b2a4-2481c2f9e2af/glance-pool/827c3d52-77fa-484e-b33d-07330ac8bea2/snap','2015-08-30 01:31:59','2015-08-30 01:34:14','2015-08-30 01:34:14',1,'{}','deleted'),(14,'827c3d52-77fa-484e-b33d-07330ac8bea3','rbd://30d1e78f-f665-41c4-b2a4-2481c2f9e2af/glance-pool/827c3d52-77fa-484e-b33d-07330ac8bea3/snap','2015-08-30 01:39:41','2015-08-30 01:39:41','2015-08-30 01:39:41',1,'{}','deleted'),(17,'827c3d52-77fa-484e-b33d-07330ac8bea3','rbd://30d1e78f-f665-41c4-b2a4-2481c2f9e2af/glance-pool/827c3d52-77fa-484e-b33d-07330ac8bea3/snap','2015-08-30 01:39:41','2015-08-30 01:40:03','2015-08-30 01:40:03',1,'{}','deleted'),(20,'a007d4af-3793-4b4a-9862-19bfdc2ca5b1','rbd://30d1e78f-f665-41c4-b2a4-2481c2f9e2af/glance-pool/a007d4af-3793-4b4a-9862-19bfdc2ca5b1/snap','2015-08-30 01:48:09','2015-08-30 01:48:09','2015-08-30 01:48:09',1,'{}','deleted'),(23,'a007d4af-3793-4b4a-9862-19bfdc2ca5b1','rbd://30d1e78f-f665-41c4-b2a4-2481c2f9e2af/glance-pool/a007d4af-3793-4b4a-9862-19bfdc2ca5b1/snap','2015-08-30 01:48:09','2015-08-30 01:48:09',NULL,0,'{}','active'),(26,'5616038a-9473-4df5-84f3-d774ad4ad321','rbd://30d1e78f-f665-41c4-b2a4-2481c2f9e2af/glance-pool/5616038a-9473-4df5-84f3-d774ad4ad321/snap','2015-08-30 01:53:08','2015-08-30 01:53:08','2015-08-30 01:53:08',1,'{}','deleted'),(29,'5616038a-9473-4df5-84f3-d774ad4ad321','rbd://30d1e78f-f665-41c4-b2a4-2481c2f9e2af/glance-pool/5616038a-9473-4df5-84f3-d774ad4ad321/snap','2015-08-30 01:53:08','2015-08-30 01:53:08',NULL,0,'{}','active'),(32,'13d68e6f-f15f-4dcc-a015-732fc25e82d1','rbd://30d1e78f-f665-41c4-b2a4-2481c2f9e2af/glance-pool/13d68e6f-f15f-4dcc-a015-732fc25e82d1/snap','2015-08-30 01:57:33','2015-08-30 01:57:33','2015-08-30 01:57:33',1,'{}','deleted'),(35,'13d68e6f-f15f-4dcc-a015-732fc25e82d1','rbd://30d1e78f-f665-41c4-b2a4-2481c2f9e2af/glance-pool/13d68e6f-f15f-4dcc-a015-732fc25e82d1/snap','2015-08-30 01:57:33','2015-08-30 01:57:33',NULL,0,'{}','active'),(38,'4421dc4e-7df4-4458-b3e7-e48185a63dc1','rbd://30d1e78f-f665-41c4-b2a4-2481c2f9e2af/glance-pool/4421dc4e-7df4-4458-b3e7-e48185a63dc1/snap','2015-08-30 02:01:27','2015-08-30 02:01:27','2015-08-30 02:01:27',1,'{}','deleted'),(41,'4421dc4e-7df4-4458-b3e7-e48185a63dc1','rbd://30d1e78f-f665-41c4-b2a4-2481c2f9e2af/glance-pool/4421dc4e-7df4-4458-b3e7-e48185a63dc1/snap','2015-08-30 02:01:27','2015-08-30 02:01:27',NULL,0,'{}','active'),(44,'bc04c71d-cd20-4002-a4d5-ba69c8eff3cf','rbd://30d1e78f-f665-41c4-b2a4-2481c2f9e2af/glance-pool/bc04c71d-cd20-4002-a4d5-ba69c8eff3cf/snap','2015-08-30 02:53:17','2015-08-30 02:53:17',NULL,0,'{}','active'),(47,'91010c73-d853-4190-866e-4bc81e726733','rbd://30d1e78f-f665-41c4-b2a4-2481c2f9e2af/glance-pool/91010c73-d853-4190-866e-4bc81e726733/snap','2015-08-30 02:58:07','2015-08-30 02:58:07',NULL,0,'{}','active'),(50,'b1f92581-b242-4d3a-a86e-7fd001355108','rbd://30d1e78f-f665-41c4-b2a4-2481c2f9e2af/glance-pool/b1f92581-b242-4d3a-a86e-7fd001355108/snap','2015-08-30 03:11:30','2015-08-30 03:11:30',NULL,0,'{}','active'),(53,'265471e4-7a96-4ab1-b206-ee6eb5c6dba3','rbd://30d1e78f-f665-41c4-b2a4-2481c2f9e2af/glance-pool/265471e4-7a96-4ab1-b206-ee6eb5c6dba3/snap','2015-08-30 03:24:46','2015-08-30 03:24:46',NULL,0,'{}','active'),(56,'4e9ebbf2-8d65-4e4d-bcec-461fffc47d87','rbd://30d1e78f-f665-41c4-b2a4-2481c2f9e2af/glance-pool/4e9ebbf2-8d65-4e4d-bcec-461fffc47d87/snap','2015-08-30 03:45:48','2015-08-30 03:45:48',NULL,0,'{}','active'),(59,'6b2948cf-4b43-4cdf-bd1f-6320ce810341','rbd://30d1e78f-f665-41c4-b2a4-2481c2f9e2af/glance-pool/6b2948cf-4b43-4cdf-bd1f-6320ce810341/snap','2015-08-30 09:08:59','2015-08-30 09:08:59','2015-08-30 09:08:59',1,'{}','deleted'),(62,'6b2948cf-4b43-4cdf-bd1f-6320ce810341','rbd://30d1e78f-f665-41c4-b2a4-2481c2f9e2af/glance-pool/6b2948cf-4b43-4cdf-bd1f-6320ce810341/snap','2015-08-30 09:08:59','2015-08-30 09:08:59',NULL,0,'{}','active'),(65,'58f8ac05-24eb-44a5-b102-c3e0decb54d1','rbd://30d1e78f-f665-41c4-b2a4-2481c2f9e2af/glance-pool/58f8ac05-24eb-44a5-b102-c3e0decb54d1/snap','2015-08-30 09:12:48','2015-08-30 09:12:48','2015-08-30 09:12:48',1,'{}','deleted'),(68,'58f8ac05-24eb-44a5-b102-c3e0decb54d1','rbd://30d1e78f-f665-41c4-b2a4-2481c2f9e2af/glance-pool/58f8ac05-24eb-44a5-b102-c3e0decb54d1/snap','2015-08-30 09:12:48','2015-08-30 09:12:48',NULL,0,'{}','active'),(71,'5b6b5db9-ca46-4bf0-b17b-79238fdcde21','rbd://30d1e78f-f665-41c4-b2a4-2481c2f9e2af/glance-pool/5b6b5db9-ca46-4bf0-b17b-79238fdcde21/snap','2015-08-30 09:16:27','2015-08-30 09:16:27','2015-08-30 09:16:27',1,'{}','deleted'),(74,'5b6b5db9-ca46-4bf0-b17b-79238fdcde21','rbd://30d1e78f-f665-41c4-b2a4-2481c2f9e2af/glance-pool/5b6b5db9-ca46-4bf0-b17b-79238fdcde21/snap','2015-08-30 09:16:27','2015-08-30 09:16:27',NULL,0,'{}','active'),(77,'b4099924-360d-425b-b446-01f5e5845181','rbd://30d1e78f-f665-41c4-b2a4-2481c2f9e2af/glance-pool/b4099924-360d-425b-b446-01f5e5845181/snap','2015-08-30 09:21:07','2015-08-30 09:21:07','2015-08-30 09:21:07',1,'{}','deleted'),(80,'b4099924-360d-425b-b446-01f5e5845181','rbd://30d1e78f-f665-41c4-b2a4-2481c2f9e2af/glance-pool/b4099924-360d-425b-b446-01f5e5845181/snap','2015-08-30 09:21:07','2015-08-30 09:21:07',NULL,0,'{}','active'),(83,'61c7b4d4-9fd2-4818-a385-9574cfe04ea1','rbd://30d1e78f-f665-41c4-b2a4-2481c2f9e2af/glance-pool/61c7b4d4-9fd2-4818-a385-9574cfe04ea1/snap','2015-08-30 09:25:19','2015-08-30 09:25:19','2015-08-30 09:25:19',1,'{}','deleted'),(86,'61c7b4d4-9fd2-4818-a385-9574cfe04ea1','rbd://30d1e78f-f665-41c4-b2a4-2481c2f9e2af/glance-pool/61c7b4d4-9fd2-4818-a385-9574cfe04ea1/snap','2015-08-30 09:25:19','2015-08-30 09:25:19',NULL,0,'{}','active'),(89,'4e131321-fdb3-47c5-a079-65dbc283ac91','rbd://30d1e78f-f665-41c4-b2a4-2481c2f9e2af/glance-pool/4e131321-fdb3-47c5-a079-65dbc283ac91/snap','2015-08-30 09:28:56','2015-08-30 09:28:56','2015-08-30 09:28:56',1,'{}','deleted'),(92,'4e131321-fdb3-47c5-a079-65dbc283ac91','rbd://30d1e78f-f665-41c4-b2a4-2481c2f9e2af/glance-pool/4e131321-fdb3-47c5-a079-65dbc283ac91/snap','2015-08-30 09:28:56','2015-08-30 09:28:56',NULL,0,'{}','active'),(95,'e6c45ff0-c359-4b63-acaf-55c8e0daab71','rbd://30d1e78f-f665-41c4-b2a4-2481c2f9e2af/glance-pool/e6c45ff0-c359-4b63-acaf-55c8e0daab71/snap','2015-08-30 09:33:32','2015-08-30 09:33:32','2015-08-30 09:33:32',1,'{}','deleted'),(98,'e6c45ff0-c359-4b63-acaf-55c8e0daab71','rbd://30d1e78f-f665-41c4-b2a4-2481c2f9e2af/glance-pool/e6c45ff0-c359-4b63-acaf-55c8e0daab71/snap','2015-08-30 09:33:32','2015-08-30 09:33:32',NULL,0,'{}','active');
/*!40000 ALTER TABLE `image_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image_members`
--

DROP TABLE IF EXISTS `image_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_id` varchar(36) NOT NULL,
  `member` varchar(255) NOT NULL,
  `can_share` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'pending',
  PRIMARY KEY (`id`),
  UNIQUE KEY `image_members_image_id_member_deleted_at_key` (`image_id`,`member`,`deleted_at`),
  KEY `ix_image_members_deleted` (`deleted`),
  KEY `ix_image_members_image_id` (`image_id`),
  KEY `ix_image_members_image_id_member` (`image_id`,`member`),
  CONSTRAINT `image_members_ibfk_1` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image_members`
--

LOCK TABLES `image_members` WRITE;
/*!40000 ALTER TABLE `image_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `image_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image_properties`
--

DROP TABLE IF EXISTS `image_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image_properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_id` varchar(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_image_properties_image_id_name` (`image_id`,`name`),
  KEY `ix_image_properties_image_id` (`image_id`),
  KEY `ix_image_properties_deleted` (`deleted`),
  CONSTRAINT `image_properties_ibfk_1` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image_properties`
--

LOCK TABLES `image_properties` WRITE;
/*!40000 ALTER TABLE `image_properties` DISABLE KEYS */;
INSERT INTO `image_properties` VALUES (1,'b5686267-6a66-43d1-9109-0c0e5452f99c','description',NULL,'2015-08-29 03:08:31','2015-08-29 03:08:31',NULL,0),(2,'a007d4af-3793-4b4a-9862-19bfdc2ca5b1','description',NULL,'2015-08-30 01:48:43','2015-08-30 01:48:43',NULL,0);
/*!40000 ALTER TABLE `image_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image_tags`
--

DROP TABLE IF EXISTS `image_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_id` varchar(36) NOT NULL,
  `value` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_image_tags_image_id` (`image_id`),
  KEY `ix_image_tags_image_id_tag_value` (`image_id`,`value`),
  CONSTRAINT `image_tags_ibfk_1` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image_tags`
--

LOCK TABLES `image_tags` WRITE;
/*!40000 ALTER TABLE `image_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `image_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `images` (
  `id` varchar(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `size` bigint(20) DEFAULT NULL,
  `status` varchar(30) NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `disk_format` varchar(20) DEFAULT NULL,
  `container_format` varchar(20) DEFAULT NULL,
  `checksum` varchar(32) DEFAULT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `min_disk` int(11) NOT NULL,
  `min_ram` int(11) NOT NULL,
  `protected` tinyint(1) NOT NULL DEFAULT '0',
  `virtual_size` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_images_deleted` (`deleted`),
  KEY `ix_images_is_public` (`is_public`),
  KEY `checksum_image_idx` (`checksum`),
  KEY `owner_image_idx` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES ('13d68e6f-f15f-4dcc-a015-732fc25e82d1','SWEB0078-disk3',94031970304,'active',1,'2015-08-30 01:57:33','2015-08-30 01:57:33',NULL,0,'qcow2','bare',NULL,'5b6cca8b0e464a399f723e7660be3290',0,0,0,NULL),('13d68e6f-f15f-4dcc-a015-732fc25e82d6','SWEB0078-disk3',94031970304,'deleted',1,'2015-08-29 03:21:36','2015-08-30 01:57:57','2015-08-30 01:57:57',1,'qcow2','bare',NULL,'5b6cca8b0e464a399f723e7660be3290',0,0,0,NULL),('20c2e3e5-6e79-47c0-a7c7-33fcf7ae1159','SWEB0078-disk2',388930928640,'deleted',1,'2015-08-29 17:36:53','2015-08-30 01:35:49','2015-08-30 01:35:49',1,'qcow2','bare',NULL,'5b6cca8b0e464a399f723e7660be3290',0,0,0,NULL),('265471e4-7a96-4ab1-b206-ee6eb5c6dba3','SIRSAPP1-disk1',4762763264,'active',1,'2015-08-30 02:58:00','2015-08-30 03:24:46',NULL,0,'qcow2','bare','8da39ff751ad85a4017f7ba44dec223f','5b6cca8b0e464a399f723e7660be3290',0,0,0,NULL),('4421dc4e-7df4-4458-b3e7-e48185a63dc1','SWEB0078-disk1',92073295872,'active',1,'2015-08-30 02:01:27','2015-08-30 02:01:27',NULL,0,'qcow2','bare',NULL,'5b6cca8b0e464a399f723e7660be3290',0,0,0,NULL),('4421dc4e-7df4-4458-b3e7-e48185a63dcf','SWEB0078-disk1',92073295872,'deleted',1,'2015-08-29 03:21:23','2015-08-30 02:01:57','2015-08-30 02:01:57',1,'qcow2','bare',NULL,'5b6cca8b0e464a399f723e7660be3290',0,0,0,NULL),('449a979d-3951-40b4-8387-a78107a6c41a','SWEB0078-disk2',388930928640,'killed',1,'2015-08-29 17:20:16','2015-08-29 17:22:12',NULL,0,'qcow2','bare',NULL,'5b6cca8b0e464a399f723e7660be3290',0,0,0,NULL),('47688920-9666-49bc-bc1d-f1d2b48dbbae','cirros-tony',13287936,'killed',1,'2015-08-19 18:45:53','2015-08-19 19:01:21',NULL,0,'qcow2','bare',NULL,'5b6cca8b0e464a399f723e7660be3290',0,0,0,NULL),('4e131321-fdb3-47c5-a079-65dbc283ac91','SWEB0078-disk1-vhd',87847272448,'active',1,'2015-08-30 09:28:56','2015-08-30 09:28:56',NULL,0,'qcow2','bare',NULL,'5b6cca8b0e464a399f723e7660be3290',0,0,0,NULL),('4e131321-fdb3-47c5-a079-65dbc283ac9f','SWEB0078-disk1-vhd',87847272448,'deleted',1,'2015-08-30 02:36:42','2015-08-30 09:29:28','2015-08-30 09:29:28',1,'qcow2','bare',NULL,'5b6cca8b0e464a399f723e7660be3290',0,0,0,NULL),('4e9ebbf2-8d65-4e4d-bcec-461fffc47d87','SDDC0029-disk2',11449729024,'active',1,'2015-08-30 02:49:54','2015-08-30 03:45:48',NULL,0,'qcow2','bare','8e01ab6b25e9df969d7dcc1d58ad9975','5b6cca8b0e464a399f723e7660be3290',0,0,0,NULL),('5616038a-9473-4df5-84f3-d774ad4ad321','SSQL0207-disk1',79124758528,'active',1,'2015-08-30 01:53:08','2015-08-30 01:53:08',NULL,0,'qcow2','bare',NULL,'5b6cca8b0e464a399f723e7660be3290',0,0,0,NULL),('5616038a-9473-4df5-84f3-d774ad4ad32e','SSQL0207-disk1',79124758528,'deleted',1,'2015-08-29 03:39:00','2015-08-30 01:53:29','2015-08-30 01:53:29',1,'qcow2','bare',NULL,'5b6cca8b0e464a399f723e7660be3290',0,0,0,NULL),('58f8ac05-24eb-44a5-b102-c3e0decb54d1','SIRSAPP1-disk2',43170725888,'active',1,'2015-08-30 09:12:48','2015-08-30 09:12:48',NULL,0,'qcow2','bare',NULL,'5b6cca8b0e464a399f723e7660be3290',0,0,0,NULL),('58f8ac05-24eb-44a5-b102-c3e0decb54d4','SIRSAPP1-disk2',43170725888,'deleted',1,'2015-08-30 02:59:26','2015-08-30 09:13:20','2015-08-30 09:13:20',1,'qcow2','bare',NULL,'5b6cca8b0e464a399f723e7660be3290',0,0,0,NULL),('5b6b5db9-ca46-4bf0-b17b-79238fdcde20','SDDC0029-disk1',34394669056,'deleted',1,'2015-08-30 02:48:51','2015-08-30 09:17:40','2015-08-30 09:17:40',1,'qcow2','bare',NULL,'5b6cca8b0e464a399f723e7660be3290',0,0,0,NULL),('5b6b5db9-ca46-4bf0-b17b-79238fdcde21','SDDC0029-disk1',34394669056,'active',1,'2015-08-30 09:16:27','2015-08-30 09:16:27',NULL,0,'qcow2','bare',NULL,'5b6cca8b0e464a399f723e7660be3290',0,0,0,NULL),('61c7b4d4-9fd2-4818-a385-9574cfe04ea1','SDDC0025-disk1',67441590272,'active',1,'2015-08-30 09:25:19','2015-08-30 09:25:19',NULL,0,'qcow2','bare',NULL,'5b6cca8b0e464a399f723e7660be3290',0,0,0,NULL),('61c7b4d4-9fd2-4818-a385-9574cfe04ea7','SDDC0025-disk1',67441590272,'deleted',1,'2015-08-30 02:44:38','2015-08-30 09:25:59','2015-08-30 09:25:59',1,'qcow2','bare',NULL,'5b6cca8b0e464a399f723e7660be3290',0,0,0,NULL),('68979f31-3808-4156-8926-45470dc48a00','SDCC0027_clone-disk2',14827126784,'deleted',1,'2015-08-28 17:23:38','2015-08-29 00:57:28','2015-08-29 00:57:28',1,'qcow2','bare',NULL,'5b6cca8b0e464a399f723e7660be3290',0,0,0,NULL),('6b2948cf-4b43-4cdf-bd1f-6320ce810341','SHKXAPP1-disk2',33735639040,'active',1,'2015-08-30 09:08:59','2015-08-30 09:08:59',NULL,0,'qcow2','bare',NULL,'5b6cca8b0e464a399f723e7660be3290',0,0,0,NULL),('6b2948cf-4b43-4cdf-bd1f-6320ce810346','SHKXAPP1-disk2',33735639040,'deleted',1,'2015-08-30 02:55:58','2015-08-30 09:09:56','2015-08-30 09:09:56',1,'qcow2','bare',NULL,'5b6cca8b0e464a399f723e7660be3290',0,0,0,NULL),('7ad9f626-6840-4208-a6fe-e36f8b15813c','SDDC0025_Clone_20150708-disk2',52256768000,'deleted',1,'2015-08-29 01:19:23','2015-08-29 02:39:08','2015-08-29 02:39:08',1,'qcow2','bare',NULL,'5b6cca8b0e464a399f723e7660be3290',0,0,0,NULL),('827c3d52-77fa-484e-b33d-07330ac8bea1','xxxx',13287936,'deleted',1,'2015-08-30 01:01:35','2015-08-30 01:24:37','2015-08-30 01:24:37',1,'qcow2','bare',NULL,'5b6cca8b0e464a399f723e7660be3290',0,0,0,NULL),('827c3d52-77fa-484e-b33d-07330ac8bea2','aaaa',13287936,'deleted',1,'2015-08-30 01:31:59','2015-08-30 01:34:14','2015-08-30 01:34:14',1,'qcow2','bare',NULL,'5b6cca8b0e464a399f723e7660be3290',0,0,0,NULL),('827c3d52-77fa-484e-b33d-07330ac8bea3','aaaa',13287936,'deleted',1,'2015-08-30 01:39:41','2015-08-30 01:40:03','2015-08-30 01:40:03',1,'qcow2','bare',NULL,'5b6cca8b0e464a399f723e7660be3290',0,0,0,NULL),('827c3d52-77fa-484e-b33d-07330ac8beab','SWEB0078-disk2',388930928640,'deleted',1,'2015-08-29 03:17:04','2015-08-30 01:42:20','2015-08-30 01:42:20',1,'qcow2','bare',NULL,'5b6cca8b0e464a399f723e7660be3290',0,0,0,NULL),('8ee0c177-9cbd-405f-9a4d-7d6a25a151c7','SDCC0027_clone-disk2',14827126784,'active',1,'2015-08-29 02:32:47','2015-08-29 02:39:31',NULL,0,'qcow2','bare','0db0d9c6ac75a09723c28db8e9ea2597','5b6cca8b0e464a399f723e7660be3290',0,0,0,NULL),('91010c73-d853-4190-866e-4bc81e726733','SHKXAPP1-disk4',841744384,'active',1,'2015-08-30 02:54:07','2015-08-30 02:58:07',NULL,0,'qcow2','bare','d3a4bb2878dfbb101fa4875edd661da0','5b6cca8b0e464a399f723e7660be3290',0,0,0,NULL),('a007d4af-3793-4b4a-9862-19bfdc2ca5b1','SSQL0207-disk2',73470771200,'active',1,'2015-08-30 01:48:09','2015-08-30 01:48:43',NULL,0,'qcow2','bare',NULL,'5b6cca8b0e464a399f723e7660be3290',0,0,0,NULL),('a007d4af-3793-4b4a-9862-19bfdc2ca5bd','SSQL0207-disk2',73470771200,'deleted',1,'2015-08-29 03:39:30','2015-08-30 01:48:52','2015-08-30 01:48:52',1,'qcow2','bare',NULL,'5b6cca8b0e464a399f723e7660be3290',0,0,0,NULL),('b1f92581-b242-4d3a-a86e-7fd001355108','SHKXAPP1-disk3',3330932736,'active',1,'2015-08-30 02:53:27','2015-08-30 03:11:30',NULL,0,'qcow2','bare','88d47b122efbd8640c2b3ad6563a5b29','5b6cca8b0e464a399f723e7660be3290',0,0,0,NULL),('b4099924-360d-425b-b446-01f5e5845180','SDDC0025-disk2',52256768000,'deleted',1,'2015-08-30 02:46:01','2015-08-30 09:22:16','2015-08-30 09:22:16',1,'qcow2','bare',NULL,'5b6cca8b0e464a399f723e7660be3290',0,0,0,NULL),('b4099924-360d-425b-b446-01f5e5845181','SDDC0025-disk2',52256768000,'active',1,'2015-08-30 09:21:07','2015-08-30 09:21:07',NULL,0,'qcow2','bare',NULL,'5b6cca8b0e464a399f723e7660be3290',0,0,0,NULL),('b4808c25-7e89-4d7d-b7b9-2b4cc52a2907','SWEB0078-disk2',388930928640,'killed',1,'2015-08-29 17:22:56','2015-08-29 17:28:55',NULL,0,'qcow2','bare',NULL,'5b6cca8b0e464a399f723e7660be3290',0,0,0,NULL),('b5686267-6a66-43d1-9109-0c0e5452f99c','PoC_Cloud_SDCC0027_clone-disk1-sda',32339918848,'active',1,'2015-08-28 16:53:46','2015-08-29 03:08:31',NULL,0,'qcow2','bare','f94818437494a1aa7fbbbbe194dfb59d','5b6cca8b0e464a399f723e7660be3290',0,0,0,NULL),('b67a5837-e740-4c29-9570-3559ff2b7b7a','cirros-tony',13287936,'active',1,'2015-08-25 03:16:00','2015-08-25 03:16:03',NULL,0,'qcow2','bare','ee1eca47dc88f4879d8a229cc70a07c6','5b6cca8b0e464a399f723e7660be3290',0,0,0,NULL),('ba46e01b-d369-45ef-beeb-fb58c18ee3e5','SDCC0027_clone-disk2',14827126784,'deleted',1,'2015-08-29 01:04:45','2015-08-29 02:53:03','2015-08-29 02:53:03',1,'qcow2','bare',NULL,'5b6cca8b0e464a399f723e7660be3290',0,0,0,NULL),('bc04c71d-cd20-4002-a4d5-ba69c8eff3cf','SHKXAPP1-disk1',68419584,'active',1,'2015-08-30 02:52:56','2015-08-30 02:53:17',NULL,0,'qcow2','bare','545cce883bb70d45965fef995bfcb40a','5b6cca8b0e464a399f723e7660be3290',0,0,0,NULL),('e6c45ff0-c359-4b63-acaf-55c8e0daab71','SWEB0078-disk2',388930928640,'active',1,'2015-08-30 09:33:32','2015-08-30 09:33:32',NULL,0,'qcow2','bare',NULL,'5b6cca8b0e464a399f723e7660be3290',0,0,0,NULL),('e6c45ff0-c359-4b63-acaf-55c8e0daab73','SWEB0078-disk2',388930928640,'deleted',1,'2015-08-30 02:17:07','2015-08-30 09:33:57','2015-08-30 09:33:57',1,'qcow2','bare',NULL,'5b6cca8b0e464a399f723e7660be3290',0,0,0,NULL);
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metadef_namespace_resource_types`
--

DROP TABLE IF EXISTS `metadef_namespace_resource_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metadef_namespace_resource_types` (
  `resource_type_id` int(11) NOT NULL,
  `namespace_id` int(11) NOT NULL,
  `properties_target` varchar(80) DEFAULT NULL,
  `prefix` varchar(80) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`resource_type_id`,`namespace_id`),
  KEY `ix_metadef_ns_res_types_res_type_id_ns_id` (`resource_type_id`,`namespace_id`),
  KEY `ix_metadef_ns_res_types_namespace_id` (`namespace_id`),
  CONSTRAINT `metadef_namespace_resource_types_ibfk_1` FOREIGN KEY (`resource_type_id`) REFERENCES `metadef_resource_types` (`id`),
  CONSTRAINT `metadef_namespace_resource_types_ibfk_2` FOREIGN KEY (`namespace_id`) REFERENCES `metadef_namespaces` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metadef_namespace_resource_types`
--

LOCK TABLES `metadef_namespace_resource_types` WRITE;
/*!40000 ALTER TABLE `metadef_namespace_resource_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `metadef_namespace_resource_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metadef_namespaces`
--

DROP TABLE IF EXISTS `metadef_namespaces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metadef_namespaces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `namespace` varchar(80) NOT NULL,
  `display_name` varchar(80) DEFAULT NULL,
  `description` text,
  `visibility` varchar(32) DEFAULT NULL,
  `protected` tinyint(1) DEFAULT NULL,
  `owner` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_metadef_namespaces_namespace` (`namespace`),
  KEY `ix_metadef_namespaces_owner` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metadef_namespaces`
--

LOCK TABLES `metadef_namespaces` WRITE;
/*!40000 ALTER TABLE `metadef_namespaces` DISABLE KEYS */;
/*!40000 ALTER TABLE `metadef_namespaces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metadef_objects`
--

DROP TABLE IF EXISTS `metadef_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metadef_objects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `namespace_id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `description` text,
  `required` text,
  `json_schema` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_metadef_objects_name` (`name`),
  KEY `ix_metadef_objects_namespace_id` (`namespace_id`),
  CONSTRAINT `metadef_objects_ibfk_1` FOREIGN KEY (`namespace_id`) REFERENCES `metadef_namespaces` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metadef_objects`
--

LOCK TABLES `metadef_objects` WRITE;
/*!40000 ALTER TABLE `metadef_objects` DISABLE KEYS */;
/*!40000 ALTER TABLE `metadef_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metadef_properties`
--

DROP TABLE IF EXISTS `metadef_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metadef_properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `namespace_id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `json_schema` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_metadef_properties_name` (`name`),
  KEY `ix_metadef_properties_namespace_id` (`namespace_id`),
  CONSTRAINT `metadef_properties_ibfk_1` FOREIGN KEY (`namespace_id`) REFERENCES `metadef_namespaces` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metadef_properties`
--

LOCK TABLES `metadef_properties` WRITE;
/*!40000 ALTER TABLE `metadef_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `metadef_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metadef_resource_types`
--

DROP TABLE IF EXISTS `metadef_resource_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metadef_resource_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `protected` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_metadef_resource_types_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metadef_resource_types`
--

LOCK TABLES `metadef_resource_types` WRITE;
/*!40000 ALTER TABLE `metadef_resource_types` DISABLE KEYS */;
INSERT INTO `metadef_resource_types` VALUES (1,'OS::Glance::Image',1,'2015-08-19 10:25:31','2015-08-19 10:25:31'),(2,'OS::Cinder::Volume',1,'2015-08-19 10:25:31','2015-08-19 10:25:31'),(3,'OS::Nova::Flavor',1,'2015-08-19 10:25:31','2015-08-19 10:25:31'),(4,'OS::Nova::Aggregate',1,'2015-08-19 10:25:31','2015-08-19 10:25:31'),(5,'OS::Nova::Instance',1,'2015-08-19 10:25:31','2015-08-19 10:25:31');
/*!40000 ALTER TABLE `metadef_resource_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metadef_tags`
--

DROP TABLE IF EXISTS `metadef_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metadef_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `namespace_id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_metadef_tags_name` (`name`),
  KEY `ix_metadef_tags_namespace_id` (`namespace_id`,`name`),
  CONSTRAINT `metadef_tags_namespace_id_fkey` FOREIGN KEY (`namespace_id`) REFERENCES `metadef_namespaces` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metadef_tags`
--

LOCK TABLES `metadef_tags` WRITE;
/*!40000 ALTER TABLE `metadef_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `metadef_tags` ENABLE KEYS */;
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
INSERT INTO `migrate_version` VALUES ('Glance Migrations','/usr/lib/python2.7/site-packages/glance/db/sqlalchemy/migrate_repo',41);
/*!40000 ALTER TABLE `migrate_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_info`
--

DROP TABLE IF EXISTS `task_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_info` (
  `task_id` varchar(36) NOT NULL,
  `input` text,
  `result` text,
  `message` text,
  PRIMARY KEY (`task_id`),
  CONSTRAINT `task_info_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_info`
--

LOCK TABLES `task_info` WRITE;
/*!40000 ALTER TABLE `task_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasks` (
  `id` varchar(36) NOT NULL,
  `type` varchar(30) NOT NULL,
  `status` varchar(30) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_tasks_deleted` (`deleted`),
  KEY `ix_tasks_type` (`type`),
  KEY `ix_tasks_updated_at` (`updated_at`),
  KEY `ix_tasks_status` (`status`),
  KEY `ix_tasks_owner` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-08-31  1:28:03
