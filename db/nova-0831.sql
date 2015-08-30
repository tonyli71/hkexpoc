-- MySQL dump 10.14  Distrib 5.5.44-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: nova
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
-- Table structure for table `agent_builds`
--

DROP TABLE IF EXISTS `agent_builds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agent_builds` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hypervisor` varchar(255) DEFAULT NULL,
  `os` varchar(255) DEFAULT NULL,
  `architecture` varchar(255) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `md5hash` varchar(255) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_agent_builds0hypervisor0os0architecture0deleted` (`hypervisor`,`os`,`architecture`,`deleted`),
  KEY `agent_builds_hypervisor_os_arch_idx` (`hypervisor`,`os`,`architecture`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agent_builds`
--

LOCK TABLES `agent_builds` WRITE;
/*!40000 ALTER TABLE `agent_builds` DISABLE KEYS */;
/*!40000 ALTER TABLE `agent_builds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aggregate_hosts`
--

DROP TABLE IF EXISTS `aggregate_hosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aggregate_hosts` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host` varchar(255) DEFAULT NULL,
  `aggregate_id` int(11) NOT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_aggregate_hosts0host0aggregate_id0deleted` (`host`,`aggregate_id`,`deleted`),
  KEY `aggregate_id` (`aggregate_id`),
  CONSTRAINT `aggregate_hosts_ibfk_1` FOREIGN KEY (`aggregate_id`) REFERENCES `aggregates` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aggregate_hosts`
--

LOCK TABLES `aggregate_hosts` WRITE;
/*!40000 ALTER TABLE `aggregate_hosts` DISABLE KEYS */;
/*!40000 ALTER TABLE `aggregate_hosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aggregate_metadata`
--

DROP TABLE IF EXISTS `aggregate_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aggregate_metadata` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aggregate_id` int(11) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_aggregate_metadata0aggregate_id0key0deleted` (`aggregate_id`,`key`,`deleted`),
  KEY `aggregate_metadata_key_idx` (`key`),
  CONSTRAINT `aggregate_metadata_ibfk_1` FOREIGN KEY (`aggregate_id`) REFERENCES `aggregates` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aggregate_metadata`
--

LOCK TABLES `aggregate_metadata` WRITE;
/*!40000 ALTER TABLE `aggregate_metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `aggregate_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aggregates`
--

DROP TABLE IF EXISTS `aggregates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aggregates` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aggregates`
--

LOCK TABLES `aggregates` WRITE;
/*!40000 ALTER TABLE `aggregates` DISABLE KEYS */;
/*!40000 ALTER TABLE `aggregates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `block_device_mapping`
--

DROP TABLE IF EXISTS `block_device_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `block_device_mapping` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_name` varchar(255) DEFAULT NULL,
  `delete_on_termination` tinyint(1) DEFAULT NULL,
  `snapshot_id` varchar(36) DEFAULT NULL,
  `volume_id` varchar(36) DEFAULT NULL,
  `volume_size` int(11) DEFAULT NULL,
  `no_device` tinyint(1) DEFAULT NULL,
  `connection_info` mediumtext,
  `instance_uuid` varchar(36) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `source_type` varchar(255) DEFAULT NULL,
  `destination_type` varchar(255) DEFAULT NULL,
  `guest_format` varchar(255) DEFAULT NULL,
  `device_type` varchar(255) DEFAULT NULL,
  `disk_bus` varchar(255) DEFAULT NULL,
  `boot_index` int(11) DEFAULT NULL,
  `image_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `snapshot_id` (`snapshot_id`),
  KEY `volume_id` (`volume_id`),
  KEY `block_device_mapping_instance_uuid_idx` (`instance_uuid`),
  KEY `block_device_mapping_instance_uuid_device_name_idx` (`instance_uuid`,`device_name`),
  KEY `block_device_mapping_instance_uuid_volume_id_idx` (`instance_uuid`,`volume_id`),
  CONSTRAINT `block_device_mapping_instance_uuid_fkey` FOREIGN KEY (`instance_uuid`) REFERENCES `instances` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `block_device_mapping`
--

LOCK TABLES `block_device_mapping` WRITE;
/*!40000 ALTER TABLE `block_device_mapping` DISABLE KEYS */;
INSERT INTO `block_device_mapping` VALUES ('2015-08-29 12:59:05','2015-08-29 12:59:09','2015-08-30 10:10:45',1,'/dev/vda',0,NULL,'f660957e-8e22-402e-8a8a-ded1c3600e8c',NULL,0,'{\"driver_volume_type\": \"rbd\", \"serial\": \"f660957e-8e22-402e-8a8a-ded1c3600e8c\", \"data\": {\"secret_type\": \"ceph\", \"name\": \"tier-pool/volume-f660957e-8e22-402e-8a8a-ded1c3600e8c\", \"secret_uuid\": \"08763753-b381-4a3c-9a79-af979e21ec31\", \"qos_specs\": null, \"hosts\": [\"192.168.251.35\", \"192.168.251.37\", \"192.168.252.39\", \"192.168.252.40\", \"192.168.252.41\"], \"auth_enabled\": true, \"access_mode\": \"rw\", \"auth_username\": \"cinder\", \"ports\": [\"6789\", \"6789\", \"6789\", \"6789\", \"6789\"]}}','a5846387-2fc7-40b9-9d44-17328f84f9ec',1,'volume','volume',NULL,'disk','virtio',0,NULL);
/*!40000 ALTER TABLE `block_device_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bw_usage_cache`
--

DROP TABLE IF EXISTS `bw_usage_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bw_usage_cache` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_period` datetime NOT NULL,
  `last_refreshed` datetime DEFAULT NULL,
  `bw_in` bigint(20) DEFAULT NULL,
  `bw_out` bigint(20) DEFAULT NULL,
  `mac` varchar(255) DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  `last_ctr_in` bigint(20) DEFAULT NULL,
  `last_ctr_out` bigint(20) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bw_usage_cache_uuid_start_period_idx` (`uuid`,`start_period`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bw_usage_cache`
--

LOCK TABLES `bw_usage_cache` WRITE;
/*!40000 ALTER TABLE `bw_usage_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `bw_usage_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cells`
--

DROP TABLE IF EXISTS `cells`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cells` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `api_url` varchar(255) DEFAULT NULL,
  `weight_offset` float DEFAULT NULL,
  `weight_scale` float DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `is_parent` tinyint(1) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `transport_url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_cells0name0deleted` (`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cells`
--

LOCK TABLES `cells` WRITE;
/*!40000 ALTER TABLE `cells` DISABLE KEYS */;
/*!40000 ALTER TABLE `cells` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificates`
--

DROP TABLE IF EXISTS `certificates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificates` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) DEFAULT NULL,
  `project_id` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `certificates_project_id_deleted_idx` (`project_id`,`deleted`),
  KEY `certificates_user_id_deleted_idx` (`user_id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates`
--

LOCK TABLES `certificates` WRITE;
/*!40000 ALTER TABLE `certificates` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compute_nodes`
--

DROP TABLE IF EXISTS `compute_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compute_nodes` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) DEFAULT NULL,
  `vcpus` int(11) NOT NULL,
  `memory_mb` int(11) NOT NULL,
  `local_gb` int(11) NOT NULL,
  `vcpus_used` int(11) NOT NULL,
  `memory_mb_used` int(11) NOT NULL,
  `local_gb_used` int(11) NOT NULL,
  `hypervisor_type` mediumtext NOT NULL,
  `hypervisor_version` int(11) NOT NULL,
  `cpu_info` mediumtext NOT NULL,
  `disk_available_least` int(11) DEFAULT NULL,
  `free_ram_mb` int(11) DEFAULT NULL,
  `free_disk_gb` int(11) DEFAULT NULL,
  `current_workload` int(11) DEFAULT NULL,
  `running_vms` int(11) DEFAULT NULL,
  `hypervisor_hostname` varchar(255) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `host_ip` varchar(39) DEFAULT NULL,
  `supported_instances` text,
  `pci_stats` text,
  `metrics` text,
  `extra_resources` text,
  `stats` text,
  `numa_topology` text,
  `host` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_compute_nodes0host0hypervisor_hostname0deleted` (`host`,`hypervisor_hostname`,`deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compute_nodes`
--

LOCK TABLES `compute_nodes` WRITE;
/*!40000 ALTER TABLE `compute_nodes` DISABLE KEYS */;
INSERT INTO `compute_nodes` VALUES ('2015-08-19 10:27:25','2015-08-30 17:30:40',NULL,1,4,4,7823,39,0,512,0,'QEMU',2001002,'{\"vendor\": \"Intel\", \"model\": \"SandyBridge\", \"arch\": \"x86_64\", \"features\": [\"pge\", \"avx\", \"clflush\", \"sep\", \"syscall\", \"tsc-deadline\", \"msr\", \"xsave\", \"cmov\", \"fpu\", \"pat\", \"lm\", \"tsc\", \"nx\", \"fxsr\", \"sse4.1\", \"pae\", \"sse4.2\", \"pclmuldq\", \"mmx\", \"osxsave\", \"cx8\", \"mce\", \"de\", \"rdtscp\", \"mca\", \"pse\", \"pni\", \"popcnt\", \"apic\", \"sse\", \"lahf_lm\", \"aes\", \"sse2\", \"hypervisor\", \"ssse3\", \"cx16\", \"pse36\", \"mtrr\", \"x2apic\"], \"topology\": {\"cores\": 1, \"threads\": 1, \"sockets\": 4}}',10,7311,39,0,0,'controller1.hkexpoc.com',0,'192.168.130.42','[[\"i686\", \"qemu\", \"hvm\"], [\"x86_64\", \"qemu\", \"hvm\"]]',NULL,'[]',NULL,'{}','{\"nova_object.version\": \"1.2\", \"nova_object.changes\": [\"cells\"], \"nova_object.name\": \"NUMATopology\", \"nova_object.data\": {\"cells\": [{\"nova_object.version\": \"1.2\", \"nova_object.changes\": [\"cpu_usage\", \"memory_usage\", \"cpuset\", \"mempages\", \"pinned_cpus\", \"memory\", \"siblings\", \"id\"], \"nova_object.name\": \"NUMACell\", \"nova_object.data\": {\"cpu_usage\": 0, \"memory_usage\": 0, \"cpuset\": [0, 1, 2, 3], \"pinned_cpus\": [], \"siblings\": [], \"memory\": 8191, \"mempages\": [{\"nova_object.version\": \"1.0\", \"nova_object.changes\": [\"total\", \"size_kb\", \"used\"], \"nova_object.name\": \"NUMAPagesTopology\", \"nova_object.data\": {\"total\": 2097052, \"used\": 0, \"size_kb\": 4}, \"nova_object.namespace\": \"nova\"}, {\"nova_object.version\": \"1.0\", \"nova_object.changes\": [\"total\", \"size_kb\", \"used\"], \"nova_object.name\": \"NUMAPagesTopology\", \"nova_object.data\": {\"total\": 0, \"used\": 0, \"size_kb\": 2048}, \"nova_object.namespace\": \"nova\"}], \"id\": 0}, \"nova_object.namespace\": \"nova\"}]}, \"nova_object.namespace\": \"nova\"}','controller1.hkexpoc.com'),('2015-08-19 12:40:36','2015-08-28 14:16:15',NULL,2,6,32,31982,449,0,512,0,'QEMU',2001002,'{\"vendor\": \"Intel\", \"model\": \"SandyBridge\", \"arch\": \"x86_64\", \"features\": [\"pge\", \"avx\", \"clflush\", \"sep\", \"syscall\", \"vme\", \"dtes64\", \"msr\", \"xsave\", \"vmx\", \"xtpr\", \"cmov\", \"ssse3\", \"est\", \"pat\", \"monitor\", \"smx\", \"pbe\", \"lm\", \"tsc\", \"nx\", \"fxsr\", \"tm\", \"sse4.1\", \"pae\", \"sse4.2\", \"pclmuldq\", \"acpi\", \"tsc-deadline\", \"mmx\", \"osxsave\", \"cx8\", \"mce\", \"de\", \"tm2\", \"ht\", \"dca\", \"lahf_lm\", \"pdcm\", \"mca\", \"pdpe1gb\", \"apic\", \"sse\", \"pse\", \"ds\", \"invtsc\", \"pni\", \"rdtscp\", \"aes\", \"sse2\", \"ss\", \"ds_cpl\", \"pcid\", \"fpu\", \"cx16\", \"pse36\", \"mtrr\", \"popcnt\", \"x2apic\"], \"topology\": {\"cores\": 8, \"threads\": 2, \"sockets\": 1}}',440,31470,449,0,0,'oc3.hkexpoc.com',0,'192.168.130.22','[[\"i686\", \"qemu\", \"hvm\"], [\"i686\", \"kvm\", \"hvm\"], [\"x86_64\", \"qemu\", \"hvm\"], [\"x86_64\", \"kvm\", \"hvm\"]]',NULL,'[]',NULL,'{}','{\"nova_object.version\": \"1.2\", \"nova_object.changes\": [\"cells\"], \"nova_object.name\": \"NUMATopology\", \"nova_object.data\": {\"cells\": [{\"nova_object.version\": \"1.2\", \"nova_object.changes\": [\"cpu_usage\", \"memory_usage\", \"cpuset\", \"mempages\", \"pinned_cpus\", \"memory\", \"siblings\", \"id\"], \"nova_object.name\": \"NUMACell\", \"nova_object.data\": {\"cpu_usage\": 0, \"memory_usage\": 0, \"cpuset\": [0, 1, 2, 3, 4, 5, 6, 7, 16, 17, 18, 19, 20, 21, 22, 23], \"pinned_cpus\": [], \"siblings\": [[2, 18], [1, 17], [0, 16], [3, 19], [6, 22], [4, 20], [7, 23], [5, 21]], \"memory\": 16355, \"mempages\": [{\"nova_object.version\": \"1.0\", \"nova_object.changes\": [\"total\", \"size_kb\", \"used\"], \"nova_object.name\": \"NUMAPagesTopology\", \"nova_object.data\": {\"total\": 4187079, \"used\": 0, \"size_kb\": 4}, \"nova_object.namespace\": \"nova\"}, {\"nova_object.version\": \"1.0\", \"nova_object.changes\": [\"total\", \"size_kb\", \"used\"], \"nova_object.name\": \"NUMAPagesTopology\", \"nova_object.data\": {\"total\": 0, \"used\": 0, \"size_kb\": 2048}, \"nova_object.namespace\": \"nova\"}, {\"nova_object.version\": \"1.0\", \"nova_object.changes\": [\"total\", \"size_kb\", \"used\"], \"nova_object.name\": \"NUMAPagesTopology\", \"nova_object.data\": {\"total\": 0, \"used\": 0, \"size_kb\": 1048576}, \"nova_object.namespace\": \"nova\"}], \"id\": 0}, \"nova_object.namespace\": \"nova\"}, {\"nova_object.version\": \"1.2\", \"nova_object.changes\": [\"cpu_usage\", \"memory_usage\", \"cpuset\", \"mempages\", \"pinned_cpus\", \"memory\", \"siblings\", \"id\"], \"nova_object.name\": \"NUMACell\", \"nova_object.data\": {\"cpu_usage\": 0, \"memory_usage\": 0, \"cpuset\": [8, 9, 10, 11, 12, 13, 14, 15, 24, 25, 26, 27, 28, 29, 30, 31], \"pinned_cpus\": [], \"siblings\": [[8, 24], [14, 30], [15, 31], [11, 27], [10, 26], [12, 28], [9, 25], [13, 29]], \"memory\": 16384, \"mempages\": [{\"nova_object.version\": \"1.0\", \"nova_object.changes\": [\"total\", \"size_kb\", \"used\"], \"nova_object.name\": \"NUMAPagesTopology\", \"nova_object.data\": {\"total\": 4194304, \"used\": 0, \"size_kb\": 4}, \"nova_object.namespace\": \"nova\"}, {\"nova_object.version\": \"1.0\", \"nova_object.changes\": [\"total\", \"size_kb\", \"used\"], \"nova_object.name\": \"NUMAPagesTopology\", \"nova_object.data\": {\"total\": 0, \"used\": 0, \"size_kb\": 2048}, \"nova_object.namespace\": \"nova\"}, {\"nova_object.version\": \"1.0\", \"nova_object.changes\": [\"total\", \"size_kb\", \"used\"], \"nova_object.name\": \"NUMAPagesTopology\", \"nova_object.data\": {\"total\": 0, \"used\": 0, \"size_kb\": 1048576}, \"nova_object.namespace\": \"nova\"}], \"id\": 1}, \"nova_object.namespace\": \"nova\"}]}, \"nova_object.namespace\": \"nova\"}','oc3.hkexpoc.com'),('2015-08-19 14:07:52','2015-08-28 14:00:28',NULL,3,6,4,23918,123,0,512,0,'QEMU',2001002,'{\"vendor\": \"Intel\", \"model\": \"SandyBridge\", \"arch\": \"x86_64\", \"features\": [\"pge\", \"avx\", \"clflush\", \"sep\", \"syscall\", \"vme\", \"dtes64\", \"msr\", \"xsave\", \"vmx\", \"xtpr\", \"cmov\", \"ssse3\", \"est\", \"pat\", \"monitor\", \"smx\", \"pbe\", \"lm\", \"tsc\", \"nx\", \"fxsr\", \"tm\", \"sse4.1\", \"pae\", \"sse4.2\", \"pclmuldq\", \"acpi\", \"tsc-deadline\", \"mmx\", \"osxsave\", \"cx8\", \"mce\", \"de\", \"tm2\", \"ht\", \"dca\", \"lahf_lm\", \"pdcm\", \"mca\", \"pdpe1gb\", \"apic\", \"sse\", \"pse\", \"ds\", \"invtsc\", \"pni\", \"rdtscp\", \"aes\", \"sse2\", \"ss\", \"ds_cpl\", \"pcid\", \"fpu\", \"cx16\", \"pse36\", \"mtrr\", \"popcnt\", \"x2apic\"], \"topology\": {\"cores\": 4, \"threads\": 1, \"sockets\": 1}}',113,23406,123,0,0,'oc1.hkexpoc.com',0,'192.168.130.20','[[\"i686\", \"qemu\", \"hvm\"], [\"i686\", \"kvm\", \"hvm\"], [\"x86_64\", \"qemu\", \"hvm\"], [\"x86_64\", \"kvm\", \"hvm\"]]',NULL,'[]',NULL,'{}','{\"nova_object.version\": \"1.2\", \"nova_object.changes\": [\"cells\"], \"nova_object.name\": \"NUMATopology\", \"nova_object.data\": {\"cells\": [{\"nova_object.version\": \"1.2\", \"nova_object.changes\": [\"cpu_usage\", \"memory_usage\", \"cpuset\", \"mempages\", \"pinned_cpus\", \"memory\", \"siblings\", \"id\"], \"nova_object.name\": \"NUMACell\", \"nova_object.data\": {\"cpu_usage\": 0, \"memory_usage\": 0, \"cpuset\": [0, 1, 2, 3], \"pinned_cpus\": [], \"siblings\": [], \"memory\": 24545, \"mempages\": [{\"nova_object.version\": \"1.0\", \"nova_object.changes\": [\"total\", \"size_kb\", \"used\"], \"nova_object.name\": \"NUMAPagesTopology\", \"nova_object.data\": {\"total\": 6283521, \"used\": 0, \"size_kb\": 4}, \"nova_object.namespace\": \"nova\"}, {\"nova_object.version\": \"1.0\", \"nova_object.changes\": [\"total\", \"size_kb\", \"used\"], \"nova_object.name\": \"NUMAPagesTopology\", \"nova_object.data\": {\"total\": 0, \"used\": 0, \"size_kb\": 2048}, \"nova_object.namespace\": \"nova\"}, {\"nova_object.version\": \"1.0\", \"nova_object.changes\": [\"total\", \"size_kb\", \"used\"], \"nova_object.name\": \"NUMAPagesTopology\", \"nova_object.data\": {\"total\": 0, \"used\": 0, \"size_kb\": 1048576}, \"nova_object.namespace\": \"nova\"}], \"id\": 0}, \"nova_object.namespace\": \"nova\"}]}, \"nova_object.namespace\": \"nova\"}','oc1.hkexpoc.com'),('2015-08-19 14:09:36','2015-08-19 16:32:13','2015-08-19 16:32:13',4,16,32,31983,449,0,512,0,'QEMU',2001002,'{\"vendor\": \"Intel\", \"model\": \"SandyBridge\", \"arch\": \"x86_64\", \"features\": [\"pge\", \"avx\", \"clflush\", \"sep\", \"syscall\", \"vme\", \"dtes64\", \"msr\", \"xsave\", \"vmx\", \"xtpr\", \"cmov\", \"ssse3\", \"est\", \"pat\", \"monitor\", \"smx\", \"pbe\", \"lm\", \"tsc\", \"nx\", \"fxsr\", \"tm\", \"sse4.1\", \"pae\", \"sse4.2\", \"pclmuldq\", \"acpi\", \"tsc-deadline\", \"mmx\", \"osxsave\", \"cx8\", \"mce\", \"de\", \"tm2\", \"ht\", \"dca\", \"lahf_lm\", \"pdcm\", \"mca\", \"pdpe1gb\", \"apic\", \"sse\", \"pse\", \"ds\", \"invtsc\", \"pni\", \"rdtscp\", \"aes\", \"sse2\", \"ss\", \"ds_cpl\", \"pcid\", \"fpu\", \"cx16\", \"pse36\", \"mtrr\", \"popcnt\", \"x2apic\"], \"topology\": {\"cores\": 8, \"threads\": 2, \"sockets\": 1}}',440,31471,449,0,0,'oc4.hkexpoc.com',4,'192.168.130.23','[[\"i686\", \"qemu\", \"hvm\"], [\"i686\", \"kvm\", \"hvm\"], [\"x86_64\", \"qemu\", \"hvm\"], [\"x86_64\", \"kvm\", \"hvm\"]]',NULL,'[]',NULL,'{}','{\"nova_object.version\": \"1.2\", \"nova_object.changes\": [\"cells\"], \"nova_object.name\": \"NUMATopology\", \"nova_object.data\": {\"cells\": [{\"nova_object.version\": \"1.2\", \"nova_object.changes\": [\"cpu_usage\", \"memory_usage\", \"cpuset\", \"mempages\", \"pinned_cpus\", \"memory\", \"siblings\", \"id\"], \"nova_object.name\": \"NUMACell\", \"nova_object.data\": {\"cpu_usage\": 0, \"memory_usage\": 0, \"cpuset\": [0, 1, 2, 3, 4, 5, 6, 7, 16, 17, 18, 19, 20, 21, 22, 23], \"pinned_cpus\": [], \"siblings\": [[2, 18], [1, 17], [0, 16], [3, 19], [6, 22], [4, 20], [7, 23], [5, 21]], \"memory\": 16355, \"mempages\": [{\"nova_object.version\": \"1.0\", \"nova_object.changes\": [\"total\", \"size_kb\", \"used\"], \"nova_object.name\": \"NUMAPagesTopology\", \"nova_object.data\": {\"total\": 4187065, \"used\": 0, \"size_kb\": 4}, \"nova_object.namespace\": \"nova\"}, {\"nova_object.version\": \"1.0\", \"nova_object.changes\": [\"total\", \"size_kb\", \"used\"], \"nova_object.name\": \"NUMAPagesTopology\", \"nova_object.data\": {\"total\": 0, \"used\": 0, \"size_kb\": 2048}, \"nova_object.namespace\": \"nova\"}], \"id\": 0}, \"nova_object.namespace\": \"nova\"}, {\"nova_object.version\": \"1.2\", \"nova_object.changes\": [\"cpu_usage\", \"memory_usage\", \"cpuset\", \"mempages\", \"pinned_cpus\", \"memory\", \"siblings\", \"id\"], \"nova_object.name\": \"NUMACell\", \"nova_object.data\": {\"cpu_usage\": 0, \"memory_usage\": 0, \"cpuset\": [8, 9, 10, 11, 12, 13, 14, 15, 24, 25, 26, 27, 28, 29, 30, 31], \"pinned_cpus\": [], \"siblings\": [[8, 24], [14, 30], [15, 31], [11, 27], [10, 26], [12, 28], [9, 25], [13, 29]], \"memory\": 16384, \"mempages\": [{\"nova_object.version\": \"1.0\", \"nova_object.changes\": [\"total\", \"size_kb\", \"used\"], \"nova_object.name\": \"NUMAPagesTopology\", \"nova_object.data\": {\"total\": 4194304, \"used\": 0, \"size_kb\": 4}, \"nova_object.namespace\": \"nova\"}, {\"nova_object.version\": \"1.0\", \"nova_object.changes\": [\"total\", \"size_kb\", \"used\"], \"nova_object.name\": \"NUMAPagesTopology\", \"nova_object.data\": {\"total\": 0, \"used\": 0, \"size_kb\": 2048}, \"nova_object.namespace\": \"nova\"}], \"id\": 1}, \"nova_object.namespace\": \"nova\"}]}, \"nova_object.namespace\": \"nova\"}','oc4.hkexpoc.com'),('2015-08-20 13:38:41','2015-08-30 17:30:18',NULL,7,16,32,31983,449,0,512,0,'QEMU',2001002,'{\"vendor\": \"Intel\", \"model\": \"SandyBridge\", \"arch\": \"x86_64\", \"features\": [\"pge\", \"avx\", \"clflush\", \"sep\", \"syscall\", \"vme\", \"dtes64\", \"msr\", \"xsave\", \"vmx\", \"xtpr\", \"cmov\", \"ssse3\", \"est\", \"pat\", \"monitor\", \"smx\", \"pbe\", \"lm\", \"tsc\", \"nx\", \"fxsr\", \"tm\", \"sse4.1\", \"pae\", \"sse4.2\", \"pclmuldq\", \"acpi\", \"tsc-deadline\", \"mmx\", \"osxsave\", \"cx8\", \"mce\", \"de\", \"tm2\", \"ht\", \"dca\", \"lahf_lm\", \"pdcm\", \"mca\", \"pdpe1gb\", \"apic\", \"sse\", \"pse\", \"ds\", \"invtsc\", \"pni\", \"rdtscp\", \"aes\", \"sse2\", \"ss\", \"ds_cpl\", \"pcid\", \"fpu\", \"cx16\", \"pse36\", \"mtrr\", \"popcnt\", \"x2apic\"], \"topology\": {\"cores\": 8, \"threads\": 2, \"sockets\": 1}}',440,31471,449,0,0,'oc4.hkexpoc.com',0,'192.168.130.23','[[\"i686\", \"qemu\", \"hvm\"], [\"i686\", \"kvm\", \"hvm\"], [\"x86_64\", \"qemu\", \"hvm\"], [\"x86_64\", \"kvm\", \"hvm\"]]',NULL,'[]',NULL,'{}','{\"nova_object.version\": \"1.2\", \"nova_object.changes\": [\"cells\"], \"nova_object.name\": \"NUMATopology\", \"nova_object.data\": {\"cells\": [{\"nova_object.version\": \"1.2\", \"nova_object.changes\": [\"cpu_usage\", \"memory_usage\", \"cpuset\", \"mempages\", \"pinned_cpus\", \"memory\", \"siblings\", \"id\"], \"nova_object.name\": \"NUMACell\", \"nova_object.data\": {\"cpu_usage\": 0, \"memory_usage\": 0, \"cpuset\": [0, 1, 2, 3, 4, 5, 6, 7, 16, 17, 18, 19, 20, 21, 22, 23], \"pinned_cpus\": [], \"siblings\": [[2, 18], [1, 17], [0, 16], [3, 19], [6, 22], [4, 20], [7, 23], [5, 21]], \"memory\": 16355, \"mempages\": [{\"nova_object.version\": \"1.0\", \"nova_object.changes\": [\"total\", \"size_kb\", \"used\"], \"nova_object.name\": \"NUMAPagesTopology\", \"nova_object.data\": {\"total\": 4187065, \"used\": 0, \"size_kb\": 4}, \"nova_object.namespace\": \"nova\"}, {\"nova_object.version\": \"1.0\", \"nova_object.changes\": [\"total\", \"size_kb\", \"used\"], \"nova_object.name\": \"NUMAPagesTopology\", \"nova_object.data\": {\"total\": 0, \"used\": 0, \"size_kb\": 2048}, \"nova_object.namespace\": \"nova\"}], \"id\": 0}, \"nova_object.namespace\": \"nova\"}, {\"nova_object.version\": \"1.2\", \"nova_object.changes\": [\"cpu_usage\", \"memory_usage\", \"cpuset\", \"mempages\", \"pinned_cpus\", \"memory\", \"siblings\", \"id\"], \"nova_object.name\": \"NUMACell\", \"nova_object.data\": {\"cpu_usage\": 0, \"memory_usage\": 0, \"cpuset\": [8, 9, 10, 11, 12, 13, 14, 15, 24, 25, 26, 27, 28, 29, 30, 31], \"pinned_cpus\": [], \"siblings\": [[8, 24], [14, 30], [15, 31], [11, 27], [10, 26], [12, 28], [9, 25], [13, 29]], \"memory\": 16384, \"mempages\": [{\"nova_object.version\": \"1.0\", \"nova_object.changes\": [\"total\", \"size_kb\", \"used\"], \"nova_object.name\": \"NUMAPagesTopology\", \"nova_object.data\": {\"total\": 4194304, \"used\": 0, \"size_kb\": 4}, \"nova_object.namespace\": \"nova\"}, {\"nova_object.version\": \"1.0\", \"nova_object.changes\": [\"total\", \"size_kb\", \"used\"], \"nova_object.name\": \"NUMAPagesTopology\", \"nova_object.data\": {\"total\": 0, \"used\": 0, \"size_kb\": 2048}, \"nova_object.namespace\": \"nova\"}], \"id\": 1}, \"nova_object.namespace\": \"nova\"}]}, \"nova_object.namespace\": \"nova\"}','oc4.hkexpoc.com'),('2015-08-20 14:42:07','2015-08-30 17:30:26',NULL,9,17,8,7822,39,0,512,0,'QEMU',2001002,'{\"vendor\": \"Intel\", \"model\": \"SandyBridge\", \"arch\": \"x86_64\", \"features\": [\"pge\", \"avx\", \"clflush\", \"sep\", \"syscall\", \"tsc-deadline\", \"msr\", \"xsave\", \"cmov\", \"fpu\", \"pat\", \"lm\", \"tsc\", \"nx\", \"fxsr\", \"sse4.1\", \"pae\", \"sse4.2\", \"pclmuldq\", \"mmx\", \"osxsave\", \"cx8\", \"mce\", \"de\", \"rdtscp\", \"mca\", \"pse\", \"pni\", \"popcnt\", \"apic\", \"sse\", \"lahf_lm\", \"aes\", \"sse2\", \"hypervisor\", \"ssse3\", \"cx16\", \"pse36\", \"mtrr\", \"x2apic\"], \"topology\": {\"cores\": 1, \"threads\": 1, \"sockets\": 8}}',25,7310,39,0,0,'controller4.hkexpoc.com',0,'192.168.130.17','[[\"i686\", \"qemu\", \"hvm\"], [\"x86_64\", \"qemu\", \"hvm\"]]',NULL,'[]',NULL,'{}','{\"nova_object.version\": \"1.2\", \"nova_object.changes\": [\"cells\"], \"nova_object.name\": \"NUMATopology\", \"nova_object.data\": {\"cells\": [{\"nova_object.version\": \"1.2\", \"nova_object.changes\": [\"cpu_usage\", \"memory_usage\", \"cpuset\", \"mempages\", \"pinned_cpus\", \"memory\", \"siblings\", \"id\"], \"nova_object.name\": \"NUMACell\", \"nova_object.data\": {\"cpu_usage\": 0, \"memory_usage\": 0, \"cpuset\": [0, 1, 2, 3, 4, 5, 6, 7], \"pinned_cpus\": [], \"siblings\": [], \"memory\": 8191, \"mempages\": [{\"nova_object.version\": \"1.0\", \"nova_object.changes\": [\"total\", \"size_kb\", \"used\"], \"nova_object.name\": \"NUMAPagesTopology\", \"nova_object.data\": {\"total\": 2097051, \"used\": 0, \"size_kb\": 4}, \"nova_object.namespace\": \"nova\"}, {\"nova_object.version\": \"1.0\", \"nova_object.changes\": [\"total\", \"size_kb\", \"used\"], \"nova_object.name\": \"NUMAPagesTopology\", \"nova_object.data\": {\"total\": 0, \"used\": 0, \"size_kb\": 2048}, \"nova_object.namespace\": \"nova\"}], \"id\": 0}, \"nova_object.namespace\": \"nova\"}]}, \"nova_object.namespace\": \"nova\"}','controller4.hkexpoc.com'),('2015-08-21 06:50:56','2015-08-30 17:30:29',NULL,12,31,8,7822,39,0,512,0,'QEMU',2001002,'{\"vendor\": \"Intel\", \"model\": \"SandyBridge\", \"arch\": \"x86_64\", \"features\": [\"pge\", \"avx\", \"clflush\", \"sep\", \"syscall\", \"tsc-deadline\", \"msr\", \"xsave\", \"cmov\", \"fpu\", \"pat\", \"lm\", \"tsc\", \"nx\", \"fxsr\", \"sse4.1\", \"pae\", \"sse4.2\", \"pclmuldq\", \"mmx\", \"osxsave\", \"cx8\", \"mce\", \"de\", \"rdtscp\", \"mca\", \"pse\", \"pni\", \"popcnt\", \"apic\", \"sse\", \"lahf_lm\", \"aes\", \"sse2\", \"hypervisor\", \"ssse3\", \"cx16\", \"pse36\", \"mtrr\", \"x2apic\"], \"topology\": {\"cores\": 1, \"threads\": 1, \"sockets\": 8}}',24,7310,39,0,0,'controller3.hkexpoc.com',0,'192.168.130.47','[[\"i686\", \"qemu\", \"hvm\"], [\"x86_64\", \"qemu\", \"hvm\"]]',NULL,'[]',NULL,'{}','{\"nova_object.version\": \"1.2\", \"nova_object.changes\": [\"cells\"], \"nova_object.name\": \"NUMATopology\", \"nova_object.data\": {\"cells\": [{\"nova_object.version\": \"1.2\", \"nova_object.changes\": [\"cpu_usage\", \"memory_usage\", \"cpuset\", \"mempages\", \"pinned_cpus\", \"memory\", \"siblings\", \"id\"], \"nova_object.name\": \"NUMACell\", \"nova_object.data\": {\"cpu_usage\": 0, \"memory_usage\": 0, \"cpuset\": [0, 1, 2, 3, 4, 5, 6, 7], \"pinned_cpus\": [], \"siblings\": [], \"memory\": 8191, \"mempages\": [{\"nova_object.version\": \"1.0\", \"nova_object.changes\": [\"total\", \"size_kb\", \"used\"], \"nova_object.name\": \"NUMAPagesTopology\", \"nova_object.data\": {\"total\": 2097051, \"used\": 0, \"size_kb\": 4}, \"nova_object.namespace\": \"nova\"}, {\"nova_object.version\": \"1.0\", \"nova_object.changes\": [\"total\", \"size_kb\", \"used\"], \"nova_object.name\": \"NUMAPagesTopology\", \"nova_object.data\": {\"total\": 0, \"used\": 0, \"size_kb\": 2048}, \"nova_object.namespace\": \"nova\"}], \"id\": 0}, \"nova_object.namespace\": \"nova\"}]}, \"nova_object.namespace\": \"nova\"}','controller3.hkexpoc.com'),('2015-08-21 07:02:18','2015-08-30 17:30:19',NULL,17,33,8,7822,39,0,512,0,'QEMU',2001002,'{\"vendor\": \"Intel\", \"model\": \"SandyBridge\", \"arch\": \"x86_64\", \"features\": [\"pge\", \"avx\", \"clflush\", \"sep\", \"syscall\", \"tsc-deadline\", \"msr\", \"xsave\", \"cmov\", \"fpu\", \"pat\", \"lm\", \"tsc\", \"nx\", \"fxsr\", \"sse4.1\", \"pae\", \"sse4.2\", \"pclmuldq\", \"mmx\", \"osxsave\", \"cx8\", \"mce\", \"de\", \"rdtscp\", \"mca\", \"pse\", \"pni\", \"popcnt\", \"apic\", \"sse\", \"lahf_lm\", \"aes\", \"sse2\", \"hypervisor\", \"ssse3\", \"cx16\", \"pse36\", \"mtrr\", \"x2apic\"], \"topology\": {\"cores\": 1, \"threads\": 1, \"sockets\": 8}}',16,7310,39,0,0,'controller2.hkexpoc.com',0,'192.168.130.46','[[\"i686\", \"qemu\", \"hvm\"], [\"x86_64\", \"qemu\", \"hvm\"]]',NULL,'[]',NULL,'{}','{\"nova_object.version\": \"1.2\", \"nova_object.changes\": [\"cells\"], \"nova_object.name\": \"NUMATopology\", \"nova_object.data\": {\"cells\": [{\"nova_object.version\": \"1.2\", \"nova_object.changes\": [\"cpu_usage\", \"memory_usage\", \"cpuset\", \"mempages\", \"pinned_cpus\", \"memory\", \"siblings\", \"id\"], \"nova_object.name\": \"NUMACell\", \"nova_object.data\": {\"cpu_usage\": 0, \"memory_usage\": 0, \"cpuset\": [0, 1, 2, 3, 4, 5, 6, 7], \"pinned_cpus\": [], \"siblings\": [], \"memory\": 8191, \"mempages\": [{\"nova_object.version\": \"1.0\", \"nova_object.changes\": [\"total\", \"size_kb\", \"used\"], \"nova_object.name\": \"NUMAPagesTopology\", \"nova_object.data\": {\"total\": 2097051, \"used\": 0, \"size_kb\": 4}, \"nova_object.namespace\": \"nova\"}, {\"nova_object.version\": \"1.0\", \"nova_object.changes\": [\"total\", \"size_kb\", \"used\"], \"nova_object.name\": \"NUMAPagesTopology\", \"nova_object.data\": {\"total\": 0, \"used\": 0, \"size_kb\": 2048}, \"nova_object.namespace\": \"nova\"}], \"id\": 0}, \"nova_object.namespace\": \"nova\"}]}, \"nova_object.namespace\": \"nova\"}','controller2.hkexpoc.com'),('2015-08-24 09:26:41','2015-08-30 17:30:38',NULL,21,35,4,15856,127,0,512,0,'QEMU',2001002,'{\"vendor\": \"Intel\", \"model\": \"SandyBridge\", \"arch\": \"x86_64\", \"features\": [\"pge\", \"avx\", \"clflush\", \"sep\", \"syscall\", \"vme\", \"dtes64\", \"msr\", \"xsave\", \"vmx\", \"xtpr\", \"cmov\", \"ssse3\", \"est\", \"pat\", \"monitor\", \"smx\", \"pbe\", \"lm\", \"tsc\", \"nx\", \"fxsr\", \"tm\", \"sse4.1\", \"pae\", \"sse4.2\", \"pclmuldq\", \"acpi\", \"tsc-deadline\", \"mmx\", \"osxsave\", \"cx8\", \"mce\", \"de\", \"tm2\", \"ht\", \"dca\", \"lahf_lm\", \"pdcm\", \"mca\", \"pdpe1gb\", \"apic\", \"sse\", \"pse\", \"ds\", \"invtsc\", \"pni\", \"rdtscp\", \"aes\", \"sse2\", \"ss\", \"ds_cpl\", \"pcid\", \"fpu\", \"cx16\", \"pse36\", \"mtrr\", \"popcnt\", \"x2apic\"], \"topology\": {\"cores\": 4, \"threads\": 1, \"sockets\": 1}}',125,15344,127,0,0,'oc2.hkexpoc.com',0,'192.168.130.8','[[\"i686\", \"qemu\", \"hvm\"], [\"i686\", \"kvm\", \"hvm\"], [\"x86_64\", \"qemu\", \"hvm\"], [\"x86_64\", \"kvm\", \"hvm\"]]',NULL,'[]',NULL,'{}','{\"nova_object.version\": \"1.2\", \"nova_object.changes\": [\"cells\"], \"nova_object.name\": \"NUMATopology\", \"nova_object.data\": {\"cells\": [{\"nova_object.version\": \"1.2\", \"nova_object.changes\": [\"cpu_usage\", \"memory_usage\", \"cpuset\", \"mempages\", \"pinned_cpus\", \"memory\", \"siblings\", \"id\"], \"nova_object.name\": \"NUMACell\", \"nova_object.data\": {\"cpu_usage\": 0, \"memory_usage\": 0, \"cpuset\": [0, 1, 2, 3], \"pinned_cpus\": [], \"siblings\": [], \"memory\": 16353, \"mempages\": [{\"nova_object.version\": \"1.0\", \"nova_object.changes\": [\"total\", \"size_kb\", \"used\"], \"nova_object.name\": \"NUMAPagesTopology\", \"nova_object.data\": {\"total\": 4186479, \"used\": 0, \"size_kb\": 4}, \"nova_object.namespace\": \"nova\"}, {\"nova_object.version\": \"1.0\", \"nova_object.changes\": [\"total\", \"size_kb\", \"used\"], \"nova_object.name\": \"NUMAPagesTopology\", \"nova_object.data\": {\"total\": 0, \"used\": 0, \"size_kb\": 2048}, \"nova_object.namespace\": \"nova\"}, {\"nova_object.version\": \"1.0\", \"nova_object.changes\": [\"total\", \"size_kb\", \"used\"], \"nova_object.name\": \"NUMAPagesTopology\", \"nova_object.data\": {\"total\": 0, \"used\": 0, \"size_kb\": 1048576}, \"nova_object.namespace\": \"nova\"}], \"id\": 0}, \"nova_object.namespace\": \"nova\"}]}, \"nova_object.namespace\": \"nova\"}','oc2.hkexpoc.com');
/*!40000 ALTER TABLE `compute_nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `console_pools`
--

DROP TABLE IF EXISTS `console_pools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `console_pools` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(39) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `console_type` varchar(255) DEFAULT NULL,
  `public_hostname` varchar(255) DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `compute_host` varchar(255) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_console_pools0host0console_type0compute_host0deleted` (`host`,`console_type`,`compute_host`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `console_pools`
--

LOCK TABLES `console_pools` WRITE;
/*!40000 ALTER TABLE `console_pools` DISABLE KEYS */;
/*!40000 ALTER TABLE `console_pools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consoles`
--

DROP TABLE IF EXISTS `consoles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consoles` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `instance_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `pool_id` int(11) DEFAULT NULL,
  `instance_uuid` varchar(36) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pool_id` (`pool_id`),
  KEY `consoles_instance_uuid_idx` (`instance_uuid`),
  CONSTRAINT `consoles_ibfk_1` FOREIGN KEY (`pool_id`) REFERENCES `console_pools` (`id`),
  CONSTRAINT `consoles_instance_uuid_fkey` FOREIGN KEY (`instance_uuid`) REFERENCES `instances` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consoles`
--

LOCK TABLES `consoles` WRITE;
/*!40000 ALTER TABLE `consoles` DISABLE KEYS */;
/*!40000 ALTER TABLE `consoles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dns_domains`
--

DROP TABLE IF EXISTS `dns_domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dns_domains` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `domain` varchar(255) NOT NULL,
  `scope` varchar(255) DEFAULT NULL,
  `availability_zone` varchar(255) DEFAULT NULL,
  `project_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`domain`),
  KEY `dns_domains_domain_deleted_idx` (`domain`,`deleted`),
  KEY `dns_domains_project_id_idx` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dns_domains`
--

LOCK TABLES `dns_domains` WRITE;
/*!40000 ALTER TABLE `dns_domains` DISABLE KEYS */;
/*!40000 ALTER TABLE `dns_domains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fixed_ips`
--

DROP TABLE IF EXISTS `fixed_ips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fixed_ips` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(39) DEFAULT NULL,
  `network_id` int(11) DEFAULT NULL,
  `allocated` tinyint(1) DEFAULT NULL,
  `leased` tinyint(1) DEFAULT NULL,
  `reserved` tinyint(1) DEFAULT NULL,
  `virtual_interface_id` int(11) DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `instance_uuid` varchar(36) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_fixed_ips0address0deleted` (`address`,`deleted`),
  KEY `network_id` (`network_id`),
  KEY `fixed_ips_virtual_interface_id_fkey` (`virtual_interface_id`),
  KEY `address` (`address`),
  KEY `fixed_ips_instance_uuid_fkey` (`instance_uuid`),
  KEY `fixed_ips_host_idx` (`host`),
  KEY `fixed_ips_network_id_host_deleted_idx` (`network_id`,`host`,`deleted`),
  KEY `fixed_ips_address_reserved_network_id_deleted_idx` (`address`,`reserved`,`network_id`,`deleted`),
  KEY `fixed_ips_deleted_allocated_idx` (`address`,`deleted`,`allocated`),
  KEY `fixed_ips_deleted_allocated_updated_at_idx` (`deleted`,`allocated`,`updated_at`),
  CONSTRAINT `fixed_ips_instance_uuid_fkey` FOREIGN KEY (`instance_uuid`) REFERENCES `instances` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fixed_ips`
--

LOCK TABLES `fixed_ips` WRITE;
/*!40000 ALTER TABLE `fixed_ips` DISABLE KEYS */;
/*!40000 ALTER TABLE `fixed_ips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `floating_ips`
--

DROP TABLE IF EXISTS `floating_ips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `floating_ips` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(39) DEFAULT NULL,
  `fixed_ip_id` int(11) DEFAULT NULL,
  `project_id` varchar(255) DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `auto_assigned` tinyint(1) DEFAULT NULL,
  `pool` varchar(255) DEFAULT NULL,
  `interface` varchar(255) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_floating_ips0address0deleted` (`address`,`deleted`),
  KEY `fixed_ip_id` (`fixed_ip_id`),
  KEY `floating_ips_host_idx` (`host`),
  KEY `floating_ips_project_id_idx` (`project_id`),
  KEY `floating_ips_pool_deleted_fixed_ip_id_project_id_idx` (`pool`,`deleted`,`fixed_ip_id`,`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `floating_ips`
--

LOCK TABLES `floating_ips` WRITE;
/*!40000 ALTER TABLE `floating_ips` DISABLE KEYS */;
/*!40000 ALTER TABLE `floating_ips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instance_actions`
--

DROP TABLE IF EXISTS `instance_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instance_actions` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(255) DEFAULT NULL,
  `instance_uuid` varchar(36) DEFAULT NULL,
  `request_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `project_id` varchar(255) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `finish_time` datetime DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `instance_uuid_idx` (`instance_uuid`),
  KEY `request_id_idx` (`request_id`),
  CONSTRAINT `fk_instance_actions_instance_uuid` FOREIGN KEY (`instance_uuid`) REFERENCES `instances` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instance_actions`
--

LOCK TABLES `instance_actions` WRITE;
/*!40000 ALTER TABLE `instance_actions` DISABLE KEYS */;
INSERT INTO `instance_actions` VALUES ('2015-08-29 12:59:05',NULL,NULL,1,'create','a5846387-2fc7-40b9-9d44-17328f84f9ec','req-8cd50f8d-9fa9-4c9a-b842-0838fefc6342','f901000cb1c842ccbe139860ba5080c2','5b6cca8b0e464a399f723e7660be3290','2015-08-29 12:59:05',NULL,NULL,0),('2015-08-30 01:23:31','2015-08-30 10:10:43',NULL,2,'delete','a5846387-2fc7-40b9-9d44-17328f84f9ec','req-591d3d2e-be2f-44d2-bd55-ffa88e46944f','f901000cb1c842ccbe139860ba5080c2','5b6cca8b0e464a399f723e7660be3290','2015-08-30 01:23:30',NULL,'Error',0),('2015-08-30 09:45:26',NULL,NULL,5,'delete','a5846387-2fc7-40b9-9d44-17328f84f9ec','req-124e871e-bf1f-4d92-bbe9-7e7c557a45cc','f901000cb1c842ccbe139860ba5080c2','5b6cca8b0e464a399f723e7660be3290','2015-08-30 09:45:25',NULL,NULL,0);
/*!40000 ALTER TABLE `instance_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instance_actions_events`
--

DROP TABLE IF EXISTS `instance_actions_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instance_actions_events` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event` varchar(255) DEFAULT NULL,
  `action_id` int(11) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `finish_time` datetime DEFAULT NULL,
  `result` varchar(255) DEFAULT NULL,
  `traceback` text,
  `deleted` int(11) DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `details` text,
  PRIMARY KEY (`id`),
  KEY `action_id` (`action_id`),
  CONSTRAINT `instance_actions_events_ibfk_1` FOREIGN KEY (`action_id`) REFERENCES `instance_actions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instance_actions_events`
--

LOCK TABLES `instance_actions_events` WRITE;
/*!40000 ALTER TABLE `instance_actions_events` DISABLE KEYS */;
INSERT INTO `instance_actions_events` VALUES ('2015-08-29 12:59:06','2015-08-30 10:10:42',NULL,1,'compute__do_build_and_run_instance',1,'2015-08-29 12:59:06','2015-08-30 10:10:42','Success',NULL,0,NULL,NULL),('2015-08-30 01:23:31','2015-08-30 10:10:43',NULL,2,'compute_terminate_instance',2,'2015-08-30 01:23:31','2015-08-30 10:10:43','Error','  File \"/usr/lib/python2.7/site-packages/nova/compute/manager.py\", line 377, in decorated_function\n    return function(self, context, *args, **kwargs)\n  File \"/usr/lib/python2.7/site-packages/nova/compute/manager.py\", line 355, in decorated_function\n    kwargs[\'instance\'], e, sys.exc_info())\n  File \"/usr/lib/python2.7/site-packages/oslo_utils/excutils.py\", line 85, in __exit__\n    six.reraise(self.type_, self.value, self.tb)\n  File \"/usr/lib/python2.7/site-packages/nova/compute/manager.py\", line 343, in decorated_function\n    return function(self, context, *args, **kwargs)\n  File \"/usr/lib/python2.7/site-packages/nova/compute/manager.py\", line 2737, in terminate_instance\n    do_terminate_instance(instance, bdms)\n  File \"/usr/lib/python2.7/site-packages/oslo_concurrency/lockutils.py\", line 445, in inner\n    return f(*args, **kwargs)\n  File \"/usr/lib/python2.7/site-packages/nova/compute/manager.py\", line 2735, in do_terminate_instance\n    self._set_instance_error_state(context, instance)\n  File \"/usr/lib/python2.7/site-packages/oslo_utils/excutils.py\", line 85, in __exit__\n    six.reraise(self.type_, self.value, self.tb)\n  File \"/usr/lib/python2.7/site-packages/nova/compute/manager.py\", line 2725, in do_terminate_instance\n    self._delete_instance(context, instance, bdms, quotas)\n  File \"/usr/lib/python2.7/site-packages/nova/hooks.py\", line 149, in inner\n    rv = f(*args, **kwargs)\n  File \"/usr/lib/python2.7/site-packages/nova/compute/manager.py\", line 2694, in _delete_instance\n    quotas.rollback()\n  File \"/usr/lib/python2.7/site-packages/oslo_utils/excutils.py\", line 85, in __exit__\n    six.reraise(self.type_, self.value, self.tb)\n  File \"/usr/lib/python2.7/site-packages/nova/compute/manager.py\", line 2664, in _delete_instance\n    self._shutdown_instance(context, instance, bdms)\n  File \"/usr/lib/python2.7/site-packages/nova/compute/manager.py\", line 2594, in _shutdown_instance\n    self._try_deallocate_network(context, instance, requested_networks)\n  File \"/usr/lib/python2.7/site-packages/nova/compute/manager.py\", line 2523, in _try_deallocate_network\n    self._set_instance_error_state(context, instance)\n  File \"/usr/lib/python2.7/site-packages/oslo_utils/excutils.py\", line 85, in __exit__\n    six.reraise(self.type_, self.value, self.tb)\n  File \"/usr/lib/python2.7/site-packages/nova/compute/manager.py\", line 2518, in _try_deallocate_network\n    self._deallocate_network(context, instance, requested_networks)\n  File \"/usr/lib/python2.7/site-packages/nova/compute/manager.py\", line 2084, in _deallocate_network\n    context, instance, requested_networks=requested_networks)\n  File \"/usr/lib/python2.7/site-packages/nova/network/neutronv2/api.py\", line 668, in deallocate_for_instance\n    data = neutron.list_ports(**search_opts)\n  File \"/usr/lib/python2.7/site-packages/neutronclient/v2_0/client.py\", line 102, in with_params\n    ret = self.function(instance, *args, **kwargs)\n  File \"/usr/lib/python2.7/site-packages/neutronclient/v2_0/client.py\", line 534, in list_ports\n    **_params)\n  File \"/usr/lib/python2.7/site-packages/neutronclient/v2_0/client.py\", line 307, in list\n    for r in self._pagination(collection, path, **params):\n  File \"/usr/lib/python2.7/site-packages/neutronclient/v2_0/client.py\", line 320, in _pagination\n    res = self.get(path, params=params)\n  File \"/usr/lib/python2.7/site-packages/neutronclient/v2_0/client.py\", line 293, in get\n    headers=headers, params=params)\n  File \"/usr/lib/python2.7/site-packages/neutronclient/v2_0/client.py\", line 270, in retry_request\n    headers=headers, params=params)\n  File \"/usr/lib/python2.7/site-packages/neutronclient/v2_0/client.py\", line 211, in do_request\n    self._handle_fault_response(status_code, replybody)\n  File \"/usr/lib/python2.7/site-packages/neutronclient/v2_0/client.py\", line 185, in _handle_fault_response\n    exception_handler_v20(status_code, des_error_body)\n  File \"/usr/lib/python2.7/site-packages/neutronclient/v2_0/client.py\", line 83, in exception_handler_v20\n    message=message)\n',0,NULL,NULL),('2015-08-30 09:45:26','2015-08-30 10:10:45',NULL,5,'compute_terminate_instance',5,'2015-08-30 09:45:26','2015-08-30 10:10:45','Success',NULL,0,NULL,NULL);
/*!40000 ALTER TABLE `instance_actions_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instance_extra`
--

DROP TABLE IF EXISTS `instance_extra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instance_extra` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `instance_uuid` varchar(36) NOT NULL,
  `numa_topology` text,
  `pci_requests` text,
  `flavor` text,
  `vcpu_model` text,
  PRIMARY KEY (`id`),
  KEY `instance_extra_idx` (`instance_uuid`),
  CONSTRAINT `instance_extra_instance_uuid_fkey` FOREIGN KEY (`instance_uuid`) REFERENCES `instances` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instance_extra`
--

LOCK TABLES `instance_extra` WRITE;
/*!40000 ALTER TABLE `instance_extra` DISABLE KEYS */;
INSERT INTO `instance_extra` VALUES ('2015-08-29 12:59:05','2015-08-30 10:10:45','2015-08-30 10:10:45',1,1,'a5846387-2fc7-40b9-9d44-17328f84f9ec',NULL,'[]','{\"new\": null, \"old\": null, \"cur\": {\"nova_object.version\": \"1.1\", \"nova_object.name\": \"Flavor\", \"nova_object.data\": {\"disabled\": false, \"root_gb\": 1, \"name\": \"m1.tiny\", \"flavorid\": \"1\", \"deleted\": false, \"created_at\": null, \"ephemeral_gb\": 0, \"updated_at\": null, \"memory_mb\": 512, \"vcpus\": 1, \"extra_specs\": {}, \"swap\": 0, \"rxtx_factor\": 1.0, \"is_public\": true, \"deleted_at\": null, \"vcpu_weight\": 0, \"id\": 2}, \"nova_object.namespace\": \"nova\"}}','{\"nova_object.version\": \"1.0\", \"nova_object.changes\": [\"vendor\", \"features\", \"model\", \"topology\", \"arch\", \"match\", \"mode\"], \"nova_object.name\": \"VirtCPUModel\", \"nova_object.data\": {\"vendor\": null, \"features\": [], \"mode\": \"host-model\", \"model\": null, \"arch\": null, \"match\": \"exact\", \"topology\": {\"nova_object.version\": \"1.0\", \"nova_object.changes\": [\"cores\", \"threads\", \"sockets\"], \"nova_object.name\": \"VirtCPUTopology\", \"nova_object.data\": {\"cores\": 1, \"threads\": 1, \"sockets\": 1}, \"nova_object.namespace\": \"nova\"}}, \"nova_object.namespace\": \"nova\"}');
/*!40000 ALTER TABLE `instance_extra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instance_faults`
--

DROP TABLE IF EXISTS `instance_faults`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instance_faults` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `instance_uuid` varchar(36) DEFAULT NULL,
  `code` int(11) NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `details` mediumtext,
  `host` varchar(255) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `instance_faults_host_idx` (`host`),
  KEY `instance_faults_instance_uuid_deleted_created_at_idx` (`instance_uuid`,`deleted`,`created_at`),
  CONSTRAINT `fk_instance_faults_instance_uuid` FOREIGN KEY (`instance_uuid`) REFERENCES `instances` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instance_faults`
--

LOCK TABLES `instance_faults` WRITE;
/*!40000 ALTER TABLE `instance_faults` DISABLE KEYS */;
INSERT INTO `instance_faults` VALUES ('2015-08-30 10:10:42',NULL,'2015-08-30 10:10:45',2,'a5846387-2fc7-40b9-9d44-17328f84f9ec',500,'Build of instance a5846387-2fc7-40b9-9d44-17328f84f9ec aborted: Could not clean up failed build, not rescheduling','  File \"/usr/lib/python2.7/site-packages/nova/compute/manager.py\", line 2219, in _do_build_and_run_instance\n    filter_properties)\n  File \"/usr/lib/python2.7/site-packages/nova/compute/manager.py\", line 2330, in _build_and_run_instance\n    \'create.error\', fault=e)\n  File \"/usr/lib/python2.7/site-packages/oslo_utils/excutils.py\", line 85, in __exit__\n    six.reraise(self.type_, self.value, self.tb)\n  File \"/usr/lib/python2.7/site-packages/nova/compute/manager.py\", line 2314, in _build_and_run_instance\n    block_device_info=block_device_info)\n  File \"/usr/lib64/python2.7/contextlib.py\", line 35, in __exit__\n    self.gen.throw(type, value, traceback)\n  File \"/usr/lib/python2.7/site-packages/nova/compute/manager.py\", line 2466, in _build_resources\n    instance_uuid=instance.uuid, reason=msg)\n','oc4.hkexpoc.com',2),('2015-08-30 10:10:43',NULL,'2015-08-30 10:10:45',5,'a5846387-2fc7-40b9-9d44-17328f84f9ec',500,'Authentication required','  File \"/usr/lib/python2.7/site-packages/nova/compute/manager.py\", line 343, in decorated_function\n    return function(self, context, *args, **kwargs)\n  File \"/usr/lib/python2.7/site-packages/nova/compute/manager.py\", line 2737, in terminate_instance\n    do_terminate_instance(instance, bdms)\n  File \"/usr/lib/python2.7/site-packages/oslo_concurrency/lockutils.py\", line 445, in inner\n    return f(*args, **kwargs)\n  File \"/usr/lib/python2.7/site-packages/nova/compute/manager.py\", line 2735, in do_terminate_instance\n    self._set_instance_error_state(context, instance)\n  File \"/usr/lib/python2.7/site-packages/oslo_utils/excutils.py\", line 85, in __exit__\n    six.reraise(self.type_, self.value, self.tb)\n  File \"/usr/lib/python2.7/site-packages/nova/compute/manager.py\", line 2725, in do_terminate_instance\n    self._delete_instance(context, instance, bdms, quotas)\n  File \"/usr/lib/python2.7/site-packages/nova/hooks.py\", line 149, in inner\n    rv = f(*args, **kwargs)\n  File \"/usr/lib/python2.7/site-packages/nova/compute/manager.py\", line 2694, in _delete_instance\n    quotas.rollback()\n  File \"/usr/lib/python2.7/site-packages/oslo_utils/excutils.py\", line 85, in __exit__\n    six.reraise(self.type_, self.value, self.tb)\n  File \"/usr/lib/python2.7/site-packages/nova/compute/manager.py\", line 2664, in _delete_instance\n    self._shutdown_instance(context, instance, bdms)\n  File \"/usr/lib/python2.7/site-packages/nova/compute/manager.py\", line 2594, in _shutdown_instance\n    self._try_deallocate_network(context, instance, requested_networks)\n  File \"/usr/lib/python2.7/site-packages/nova/compute/manager.py\", line 2523, in _try_deallocate_network\n    self._set_instance_error_state(context, instance)\n  File \"/usr/lib/python2.7/site-packages/oslo_utils/excutils.py\", line 85, in __exit__\n    six.reraise(self.type_, self.value, self.tb)\n  File \"/usr/lib/python2.7/site-packages/nova/compute/manager.py\", line 2518, in _try_deallocate_network\n    self._deallocate_network(context, instance, requested_networks)\n  File \"/usr/lib/python2.7/site-packages/nova/compute/manager.py\", line 2084, in _deallocate_network\n    context, instance, requested_networks=requested_networks)\n  File \"/usr/lib/python2.7/site-packages/nova/network/neutronv2/api.py\", line 668, in deallocate_for_instance\n    data = neutron.list_ports(**search_opts)\n  File \"/usr/lib/python2.7/site-packages/neutronclient/v2_0/client.py\", line 102, in with_params\n    ret = self.function(instance, *args, **kwargs)\n  File \"/usr/lib/python2.7/site-packages/neutronclient/v2_0/client.py\", line 534, in list_ports\n    **_params)\n  File \"/usr/lib/python2.7/site-packages/neutronclient/v2_0/client.py\", line 307, in list\n    for r in self._pagination(collection, path, **params):\n  File \"/usr/lib/python2.7/site-packages/neutronclient/v2_0/client.py\", line 320, in _pagination\n    res = self.get(path, params=params)\n  File \"/usr/lib/python2.7/site-packages/neutronclient/v2_0/client.py\", line 293, in get\n    headers=headers, params=params)\n  File \"/usr/lib/python2.7/site-packages/neutronclient/v2_0/client.py\", line 270, in retry_request\n    headers=headers, params=params)\n  File \"/usr/lib/python2.7/site-packages/neutronclient/v2_0/client.py\", line 211, in do_request\n    self._handle_fault_response(status_code, replybody)\n  File \"/usr/lib/python2.7/site-packages/neutronclient/v2_0/client.py\", line 185, in _handle_fault_response\n    exception_handler_v20(status_code, des_error_body)\n  File \"/usr/lib/python2.7/site-packages/neutronclient/v2_0/client.py\", line 83, in exception_handler_v20\n    message=message)\n','oc4.hkexpoc.com',5);
/*!40000 ALTER TABLE `instance_faults` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instance_group_member`
--

DROP TABLE IF EXISTS `instance_group_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instance_group_member` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `instance_id` varchar(255) DEFAULT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  KEY `instance_group_member_instance_idx` (`instance_id`),
  CONSTRAINT `instance_group_member_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `instance_groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instance_group_member`
--

LOCK TABLES `instance_group_member` WRITE;
/*!40000 ALTER TABLE `instance_group_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `instance_group_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instance_group_policy`
--

DROP TABLE IF EXISTS `instance_group_policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instance_group_policy` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `policy` varchar(255) DEFAULT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  KEY `instance_group_policy_policy_idx` (`policy`),
  CONSTRAINT `instance_group_policy_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `instance_groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instance_group_policy`
--

LOCK TABLES `instance_group_policy` WRITE;
/*!40000 ALTER TABLE `instance_group_policy` DISABLE KEYS */;
/*!40000 ALTER TABLE `instance_group_policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instance_groups`
--

DROP TABLE IF EXISTS `instance_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instance_groups` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) DEFAULT NULL,
  `project_id` varchar(255) DEFAULT NULL,
  `uuid` varchar(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_instance_groups0uuid0deleted` (`uuid`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instance_groups`
--

LOCK TABLES `instance_groups` WRITE;
/*!40000 ALTER TABLE `instance_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `instance_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instance_id_mappings`
--

DROP TABLE IF EXISTS `instance_id_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instance_id_mappings` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_instance_id_mappings_uuid` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instance_id_mappings`
--

LOCK TABLES `instance_id_mappings` WRITE;
/*!40000 ALTER TABLE `instance_id_mappings` DISABLE KEYS */;
INSERT INTO `instance_id_mappings` VALUES ('2015-08-29 12:59:05',NULL,NULL,1,'a5846387-2fc7-40b9-9d44-17328f84f9ec',0);
/*!40000 ALTER TABLE `instance_id_mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instance_info_caches`
--

DROP TABLE IF EXISTS `instance_info_caches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instance_info_caches` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `network_info` mediumtext,
  `instance_uuid` varchar(36) NOT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_instance_info_caches0instance_uuid` (`instance_uuid`),
  CONSTRAINT `instance_info_caches_instance_uuid_fkey` FOREIGN KEY (`instance_uuid`) REFERENCES `instances` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instance_info_caches`
--

LOCK TABLES `instance_info_caches` WRITE;
/*!40000 ALTER TABLE `instance_info_caches` DISABLE KEYS */;
INSERT INTO `instance_info_caches` VALUES ('2015-08-29 12:59:05','2015-08-30 10:10:44','2015-08-30 10:10:44',1,'[]','a5846387-2fc7-40b9-9d44-17328f84f9ec',1);
/*!40000 ALTER TABLE `instance_info_caches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instance_metadata`
--

DROP TABLE IF EXISTS `instance_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instance_metadata` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `instance_uuid` varchar(36) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `instance_metadata_instance_uuid_idx` (`instance_uuid`),
  CONSTRAINT `instance_metadata_instance_uuid_fkey` FOREIGN KEY (`instance_uuid`) REFERENCES `instances` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instance_metadata`
--

LOCK TABLES `instance_metadata` WRITE;
/*!40000 ALTER TABLE `instance_metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `instance_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instance_system_metadata`
--

DROP TABLE IF EXISTS `instance_system_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instance_system_metadata` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `instance_uuid` varchar(36) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `instance_uuid` (`instance_uuid`),
  CONSTRAINT `instance_system_metadata_ibfk_1` FOREIGN KEY (`instance_uuid`) REFERENCES `instances` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instance_system_metadata`
--

LOCK TABLES `instance_system_metadata` WRITE;
/*!40000 ALTER TABLE `instance_system_metadata` DISABLE KEYS */;
INSERT INTO `instance_system_metadata` VALUES ('2015-08-29 12:59:05',NULL,NULL,1,'a5846387-2fc7-40b9-9d44-17328f84f9ec','image_disk_format','qcow2',0),('2015-08-29 12:59:05',NULL,NULL,2,'a5846387-2fc7-40b9-9d44-17328f84f9ec','image_image_name','cirros-tony',0),('2015-08-29 12:59:05',NULL,NULL,3,'a5846387-2fc7-40b9-9d44-17328f84f9ec','image_checksum','ee1eca47dc88f4879d8a229cc70a07c6',0),('2015-08-29 12:59:05',NULL,NULL,4,'a5846387-2fc7-40b9-9d44-17328f84f9ec','image_image_id','b67a5837-e740-4c29-9570-3559ff2b7b7a',0),('2015-08-29 12:59:05',NULL,NULL,5,'a5846387-2fc7-40b9-9d44-17328f84f9ec','image_size','13287936',0),('2015-08-29 12:59:05',NULL,NULL,6,'a5846387-2fc7-40b9-9d44-17328f84f9ec','image_container_format','bare',0),('2015-08-29 12:59:05',NULL,NULL,7,'a5846387-2fc7-40b9-9d44-17328f84f9ec','image_min_ram','0',0),('2015-08-29 12:59:05',NULL,NULL,8,'a5846387-2fc7-40b9-9d44-17328f84f9ec','image_min_disk','1',0),('2015-08-29 12:59:05',NULL,NULL,9,'a5846387-2fc7-40b9-9d44-17328f84f9ec','image_base_image_ref','',0),('2015-08-29 12:59:08',NULL,NULL,10,'a5846387-2fc7-40b9-9d44-17328f84f9ec','network_allocated','True',0),('2015-08-30 10:10:42',NULL,NULL,11,'a5846387-2fc7-40b9-9d44-17328f84f9ec','clean_attempts','1',0);
/*!40000 ALTER TABLE `instance_system_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instance_type_extra_specs`
--

DROP TABLE IF EXISTS `instance_type_extra_specs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instance_type_extra_specs` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `instance_type_id` int(11) NOT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_instance_type_extra_specs0instance_type_id0key0deleted` (`instance_type_id`,`key`,`deleted`),
  KEY `instance_type_extra_specs_instance_type_id_key_idx` (`instance_type_id`,`key`),
  CONSTRAINT `instance_type_extra_specs_ibfk_1` FOREIGN KEY (`instance_type_id`) REFERENCES `instance_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instance_type_extra_specs`
--

LOCK TABLES `instance_type_extra_specs` WRITE;
/*!40000 ALTER TABLE `instance_type_extra_specs` DISABLE KEYS */;
/*!40000 ALTER TABLE `instance_type_extra_specs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instance_type_projects`
--

DROP TABLE IF EXISTS `instance_type_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instance_type_projects` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `instance_type_id` int(11) NOT NULL,
  `project_id` varchar(255) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_instance_type_projects0instance_type_id0project_id0deleted` (`instance_type_id`,`project_id`,`deleted`),
  KEY `instance_type_id` (`instance_type_id`),
  CONSTRAINT `instance_type_projects_ibfk_1` FOREIGN KEY (`instance_type_id`) REFERENCES `instance_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instance_type_projects`
--

LOCK TABLES `instance_type_projects` WRITE;
/*!40000 ALTER TABLE `instance_type_projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `instance_type_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instance_types`
--

DROP TABLE IF EXISTS `instance_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instance_types` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memory_mb` int(11) NOT NULL,
  `vcpus` int(11) NOT NULL,
  `swap` int(11) NOT NULL,
  `vcpu_weight` int(11) DEFAULT NULL,
  `flavorid` varchar(255) DEFAULT NULL,
  `rxtx_factor` float DEFAULT NULL,
  `root_gb` int(11) DEFAULT NULL,
  `ephemeral_gb` int(11) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  `is_public` tinyint(1) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_instance_types0name0deleted` (`name`,`deleted`),
  UNIQUE KEY `uniq_instance_types0flavorid0deleted` (`flavorid`,`deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instance_types`
--

LOCK TABLES `instance_types` WRITE;
/*!40000 ALTER TABLE `instance_types` DISABLE KEYS */;
INSERT INTO `instance_types` VALUES (NULL,NULL,NULL,'m1.medium',1,4096,2,0,NULL,'3',1,40,0,0,1,0),(NULL,NULL,NULL,'m1.tiny',2,512,1,0,NULL,'1',1,1,0,0,1,0),(NULL,NULL,NULL,'m1.large',3,8192,4,0,NULL,'4',1,80,0,0,1,0),(NULL,NULL,NULL,'m1.xlarge',4,16384,8,0,NULL,'5',1,160,0,0,1,0),(NULL,NULL,NULL,'m1.small',5,2048,1,0,NULL,'2',1,20,0,0,1,0);
/*!40000 ALTER TABLE `instance_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instances`
--

DROP TABLE IF EXISTS `instances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instances` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `internal_id` int(11) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `project_id` varchar(255) DEFAULT NULL,
  `image_ref` varchar(255) DEFAULT NULL,
  `kernel_id` varchar(255) DEFAULT NULL,
  `ramdisk_id` varchar(255) DEFAULT NULL,
  `launch_index` int(11) DEFAULT NULL,
  `key_name` varchar(255) DEFAULT NULL,
  `key_data` mediumtext,
  `power_state` int(11) DEFAULT NULL,
  `vm_state` varchar(255) DEFAULT NULL,
  `memory_mb` int(11) DEFAULT NULL,
  `vcpus` int(11) DEFAULT NULL,
  `hostname` varchar(255) DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `user_data` mediumtext,
  `reservation_id` varchar(255) DEFAULT NULL,
  `scheduled_at` datetime DEFAULT NULL,
  `launched_at` datetime DEFAULT NULL,
  `terminated_at` datetime DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `display_description` varchar(255) DEFAULT NULL,
  `availability_zone` varchar(255) DEFAULT NULL,
  `locked` tinyint(1) DEFAULT NULL,
  `os_type` varchar(255) DEFAULT NULL,
  `launched_on` mediumtext,
  `instance_type_id` int(11) DEFAULT NULL,
  `vm_mode` varchar(255) DEFAULT NULL,
  `uuid` varchar(36) NOT NULL,
  `architecture` varchar(255) DEFAULT NULL,
  `root_device_name` varchar(255) DEFAULT NULL,
  `access_ip_v4` varchar(39) DEFAULT NULL,
  `access_ip_v6` varchar(39) DEFAULT NULL,
  `config_drive` varchar(255) DEFAULT NULL,
  `task_state` varchar(255) DEFAULT NULL,
  `default_ephemeral_device` varchar(255) DEFAULT NULL,
  `default_swap_device` varchar(255) DEFAULT NULL,
  `progress` int(11) DEFAULT NULL,
  `auto_disk_config` tinyint(1) DEFAULT NULL,
  `shutdown_terminate` tinyint(1) DEFAULT NULL,
  `disable_terminate` tinyint(1) DEFAULT NULL,
  `root_gb` int(11) DEFAULT NULL,
  `ephemeral_gb` int(11) DEFAULT NULL,
  `cell_name` varchar(255) DEFAULT NULL,
  `node` varchar(255) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `locked_by` enum('owner','admin') DEFAULT NULL,
  `cleaned` int(11) DEFAULT NULL,
  `ephemeral_key_uuid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `uniq_instances0uuid` (`uuid`),
  KEY `instances_reservation_id_idx` (`reservation_id`),
  KEY `instances_terminated_at_launched_at_idx` (`terminated_at`,`launched_at`),
  KEY `instances_task_state_updated_at_idx` (`task_state`,`updated_at`),
  KEY `instances_uuid_deleted_idx` (`uuid`,`deleted`),
  KEY `instances_host_node_deleted_idx` (`host`,`node`,`deleted`),
  KEY `instances_host_deleted_cleaned_idx` (`host`,`deleted`,`cleaned`),
  KEY `instances_project_id_deleted_idx` (`project_id`,`deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instances`
--

LOCK TABLES `instances` WRITE;
/*!40000 ALTER TABLE `instances` DISABLE KEYS */;
INSERT INTO `instances` VALUES ('2015-08-29 12:59:05','2015-08-30 10:10:45','2015-08-30 10:10:45',1,NULL,'f901000cb1c842ccbe139860ba5080c2','5b6cca8b0e464a399f723e7660be3290','','','',0,NULL,NULL,0,'deleted',512,1,'tony-test','oc4.hkexpoc.com',NULL,'r-s02l1pzp',NULL,NULL,'2015-08-30 10:10:44','tony-test','tony-test','nova',0,NULL,'oc4.hkexpoc.com',2,NULL,'a5846387-2fc7-40b9-9d44-17328f84f9ec',NULL,'/dev/vda',NULL,NULL,'',NULL,NULL,NULL,0,1,0,0,1,0,NULL,'oc4.hkexpoc.com',1,NULL,1,NULL);
/*!40000 ALTER TABLE `instances` ENABLE KEYS */;
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_num` int(11) DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `volume_id` varchar(36) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `iscsi_targets_volume_id_fkey` (`volume_id`),
  KEY `iscsi_targets_host_volume_id_deleted_idx` (`host`,`volume_id`,`deleted`),
  CONSTRAINT `iscsi_targets_volume_id_fkey` FOREIGN KEY (`volume_id`) REFERENCES `volumes` (`id`)
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
-- Table structure for table `key_pairs`
--

DROP TABLE IF EXISTS `key_pairs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `key_pairs` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `fingerprint` varchar(255) DEFAULT NULL,
  `public_key` mediumtext,
  `deleted` int(11) DEFAULT NULL,
  `type` enum('ssh','x509') NOT NULL DEFAULT 'ssh',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_key_pairs0user_id0name0deleted` (`user_id`,`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `key_pairs`
--

LOCK TABLES `key_pairs` WRITE;
/*!40000 ALTER TABLE `key_pairs` DISABLE KEYS */;
/*!40000 ALTER TABLE `key_pairs` ENABLE KEYS */;
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
INSERT INTO `migrate_version` VALUES ('nova','/usr/lib/python2.7/site-packages/nova/db/sqlalchemy/migrate_repo',281);
/*!40000 ALTER TABLE `migrate_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source_compute` varchar(255) DEFAULT NULL,
  `dest_compute` varchar(255) DEFAULT NULL,
  `dest_host` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `instance_uuid` varchar(36) DEFAULT NULL,
  `old_instance_type_id` int(11) DEFAULT NULL,
  `new_instance_type_id` int(11) DEFAULT NULL,
  `source_node` varchar(255) DEFAULT NULL,
  `dest_node` varchar(255) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `migrations_by_host_nodes_and_status_idx` (`deleted`,`source_compute`(100),`dest_compute`(100),`source_node`(100),`dest_node`(100),`status`),
  KEY `migrations_instance_uuid_and_status_idx` (`deleted`,`instance_uuid`,`status`),
  KEY `fk_migrations_instance_uuid` (`instance_uuid`),
  CONSTRAINT `fk_migrations_instance_uuid` FOREIGN KEY (`instance_uuid`) REFERENCES `instances` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `networks`
--

DROP TABLE IF EXISTS `networks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `networks` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `injected` tinyint(1) DEFAULT NULL,
  `cidr` varchar(43) DEFAULT NULL,
  `netmask` varchar(39) DEFAULT NULL,
  `bridge` varchar(255) DEFAULT NULL,
  `gateway` varchar(39) DEFAULT NULL,
  `broadcast` varchar(39) DEFAULT NULL,
  `dns1` varchar(39) DEFAULT NULL,
  `vlan` int(11) DEFAULT NULL,
  `vpn_public_address` varchar(39) DEFAULT NULL,
  `vpn_public_port` int(11) DEFAULT NULL,
  `vpn_private_address` varchar(39) DEFAULT NULL,
  `dhcp_start` varchar(39) DEFAULT NULL,
  `project_id` varchar(255) DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `cidr_v6` varchar(43) DEFAULT NULL,
  `gateway_v6` varchar(39) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `netmask_v6` varchar(39) DEFAULT NULL,
  `bridge_interface` varchar(255) DEFAULT NULL,
  `multi_host` tinyint(1) DEFAULT NULL,
  `dns2` varchar(39) DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `rxtx_base` int(11) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `mtu` int(11) DEFAULT NULL,
  `dhcp_server` varchar(39) DEFAULT NULL,
  `enable_dhcp` tinyint(1) DEFAULT NULL,
  `share_address` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_networks0vlan0deleted` (`vlan`,`deleted`),
  KEY `networks_host_idx` (`host`),
  KEY `networks_cidr_v6_idx` (`cidr_v6`),
  KEY `networks_bridge_deleted_idx` (`bridge`,`deleted`),
  KEY `networks_project_id_deleted_idx` (`project_id`,`deleted`),
  KEY `networks_uuid_project_id_deleted_idx` (`uuid`,`project_id`,`deleted`),
  KEY `networks_vlan_deleted_idx` (`vlan`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `networks`
--

LOCK TABLES `networks` WRITE;
/*!40000 ALTER TABLE `networks` DISABLE KEYS */;
/*!40000 ALTER TABLE `networks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pci_devices`
--

DROP TABLE IF EXISTS `pci_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pci_devices` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `compute_node_id` int(11) NOT NULL,
  `address` varchar(12) NOT NULL,
  `product_id` varchar(4) NOT NULL,
  `vendor_id` varchar(4) NOT NULL,
  `dev_type` varchar(8) NOT NULL,
  `dev_id` varchar(255) DEFAULT NULL,
  `label` varchar(255) NOT NULL,
  `status` varchar(36) NOT NULL,
  `extra_info` text,
  `instance_uuid` varchar(36) DEFAULT NULL,
  `request_id` varchar(36) DEFAULT NULL,
  `numa_node` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_pci_devices0compute_node_id0address0deleted` (`compute_node_id`,`address`,`deleted`),
  KEY `ix_pci_devices_compute_node_id_deleted` (`compute_node_id`,`deleted`),
  KEY `ix_pci_devices_instance_uuid_deleted` (`instance_uuid`,`deleted`),
  CONSTRAINT `pci_devices_compute_node_id_fkey` FOREIGN KEY (`compute_node_id`) REFERENCES `compute_nodes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pci_devices`
--

LOCK TABLES `pci_devices` WRITE;
/*!40000 ALTER TABLE `pci_devices` DISABLE KEYS */;
/*!40000 ALTER TABLE `pci_devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_user_quotas`
--

DROP TABLE IF EXISTS `project_user_quotas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_user_quotas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `user_id` varchar(255) NOT NULL,
  `project_id` varchar(255) NOT NULL,
  `resource` varchar(255) NOT NULL,
  `hard_limit` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_project_user_quotas0user_id0project_id0resource0deleted` (`user_id`,`project_id`,`resource`,`deleted`),
  KEY `project_user_quotas_project_id_deleted_idx` (`project_id`,`deleted`),
  KEY `project_user_quotas_user_id_deleted_idx` (`user_id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_user_quotas`
--

LOCK TABLES `project_user_quotas` WRITE;
/*!40000 ALTER TABLE `project_user_quotas` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_user_quotas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider_fw_rules`
--

DROP TABLE IF EXISTS `provider_fw_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provider_fw_rules` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `protocol` varchar(5) DEFAULT NULL,
  `from_port` int(11) DEFAULT NULL,
  `to_port` int(11) DEFAULT NULL,
  `cidr` varchar(43) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider_fw_rules`
--

LOCK TABLES `provider_fw_rules` WRITE;
/*!40000 ALTER TABLE `provider_fw_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `provider_fw_rules` ENABLE KEYS */;
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) DEFAULT NULL,
  `resource` varchar(255) DEFAULT NULL,
  `hard_limit` int(11) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_quota_classes_class_name` (`class_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quota_classes`
--

LOCK TABLES `quota_classes` WRITE;
/*!40000 ALTER TABLE `quota_classes` DISABLE KEYS */;
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` varchar(255) DEFAULT NULL,
  `resource` varchar(255) NOT NULL,
  `in_use` int(11) NOT NULL,
  `reserved` int(11) NOT NULL,
  `until_refresh` int(11) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_quota_usages_project_id` (`project_id`),
  KEY `ix_quota_usages_user_id_deleted` (`user_id`,`deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quota_usages`
--

LOCK TABLES `quota_usages` WRITE;
/*!40000 ALTER TABLE `quota_usages` DISABLE KEYS */;
INSERT INTO `quota_usages` VALUES ('2015-08-29 12:59:05','2015-08-30 10:10:45',NULL,1,'5b6cca8b0e464a399f723e7660be3290','instances',0,0,NULL,0,'f901000cb1c842ccbe139860ba5080c2'),('2015-08-29 12:59:05','2015-08-30 10:10:45',NULL,2,'5b6cca8b0e464a399f723e7660be3290','ram',0,0,NULL,0,'f901000cb1c842ccbe139860ba5080c2'),('2015-08-29 12:59:05','2015-08-30 10:10:45',NULL,3,'5b6cca8b0e464a399f723e7660be3290','cores',0,0,NULL,0,'f901000cb1c842ccbe139860ba5080c2'),('2015-08-29 12:59:05','2015-08-29 12:59:05',NULL,4,'5b6cca8b0e464a399f723e7660be3290','security_groups',1,0,NULL,0,'f901000cb1c842ccbe139860ba5080c2');
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
  `project_id` varchar(255) DEFAULT NULL,
  `resource` varchar(255) NOT NULL,
  `hard_limit` int(11) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_quotas0project_id0resource0deleted` (`project_id`,`resource`,`deleted`)
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `usage_id` int(11) NOT NULL,
  `project_id` varchar(255) DEFAULT NULL,
  `resource` varchar(255) DEFAULT NULL,
  `delta` int(11) NOT NULL,
  `expire` datetime DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usage_id` (`usage_id`),
  KEY `ix_reservations_project_id` (`project_id`),
  KEY `ix_reservations_user_id_deleted` (`user_id`,`deleted`),
  KEY `reservations_uuid_idx` (`uuid`),
  KEY `reservations_deleted_expire_idx` (`deleted`,`expire`),
  CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`usage_id`) REFERENCES `quota_usages` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservations`
--

LOCK TABLES `reservations` WRITE;
/*!40000 ALTER TABLE `reservations` DISABLE KEYS */;
INSERT INTO `reservations` VALUES ('2015-08-29 12:59:05',NULL,'2015-08-29 12:59:05',1,'52634358-2cf6-4a8d-b15f-161c3b3a8f91',1,'5b6cca8b0e464a399f723e7660be3290','instances',1,'2015-08-30 12:59:05',1,'f901000cb1c842ccbe139860ba5080c2'),('2015-08-29 12:59:05',NULL,'2015-08-29 12:59:05',2,'83a9b802-76cc-4141-8deb-39a3aef327fb',2,'5b6cca8b0e464a399f723e7660be3290','ram',512,'2015-08-30 12:59:05',2,'f901000cb1c842ccbe139860ba5080c2'),('2015-08-29 12:59:05',NULL,'2015-08-29 12:59:05',3,'f3ab761a-3f67-4d1d-908c-12eae7ad5e5b',3,'5b6cca8b0e464a399f723e7660be3290','cores',1,'2015-08-30 12:59:05',3,'f901000cb1c842ccbe139860ba5080c2'),('2015-08-30 01:23:31',NULL,'2015-08-30 10:10:43',5,'4cb721fd-7771-42cc-a25e-202458bebd69',1,'5b6cca8b0e464a399f723e7660be3290','instances',-1,'2015-08-31 01:23:31',5,'f901000cb1c842ccbe139860ba5080c2'),('2015-08-30 01:23:31',NULL,'2015-08-30 10:10:43',8,'762b578a-62cb-4657-9645-1c31352ec573',2,'5b6cca8b0e464a399f723e7660be3290','ram',-512,'2015-08-31 01:23:31',8,'f901000cb1c842ccbe139860ba5080c2'),('2015-08-30 01:23:31',NULL,'2015-08-30 10:10:43',11,'3d90db33-cecb-4945-a409-28fe8f399803',3,'5b6cca8b0e464a399f723e7660be3290','cores',-1,'2015-08-31 01:23:31',11,'f901000cb1c842ccbe139860ba5080c2'),('2015-08-30 09:45:26',NULL,'2015-08-30 10:10:45',14,'07396c45-a89c-4222-ac71-6982480a6a1b',1,'5b6cca8b0e464a399f723e7660be3290','instances',-1,'2015-08-31 09:45:26',14,'f901000cb1c842ccbe139860ba5080c2'),('2015-08-30 09:45:26',NULL,'2015-08-30 10:10:45',17,'20fb13bf-3708-4ea9-9f67-5f35c878963b',2,'5b6cca8b0e464a399f723e7660be3290','ram',-512,'2015-08-31 09:45:26',17,'f901000cb1c842ccbe139860ba5080c2'),('2015-08-30 09:45:26',NULL,'2015-08-30 10:10:45',20,'7fd2112e-2abb-42c6-9c62-e5d6d2fa544c',3,'5b6cca8b0e464a399f723e7660be3290','cores',-1,'2015-08-31 09:45:26',20,'f901000cb1c842ccbe139860ba5080c2');
/*!40000 ALTER TABLE `reservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s3_images`
--

DROP TABLE IF EXISTS `s3_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s3_images` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s3_images`
--

LOCK TABLES `s3_images` WRITE;
/*!40000 ALTER TABLE `s3_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `s3_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `security_group_default_rules`
--

DROP TABLE IF EXISTS `security_group_default_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `security_group_default_rules` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `protocol` varchar(5) DEFAULT NULL,
  `from_port` int(11) DEFAULT NULL,
  `to_port` int(11) DEFAULT NULL,
  `cidr` varchar(43) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `security_group_default_rules`
--

LOCK TABLES `security_group_default_rules` WRITE;
/*!40000 ALTER TABLE `security_group_default_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `security_group_default_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `security_group_instance_association`
--

DROP TABLE IF EXISTS `security_group_instance_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `security_group_instance_association` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `security_group_id` int(11) DEFAULT NULL,
  `instance_uuid` varchar(36) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `security_group_id` (`security_group_id`),
  KEY `security_group_instance_association_instance_uuid_idx` (`instance_uuid`),
  CONSTRAINT `security_group_instance_association_ibfk_1` FOREIGN KEY (`security_group_id`) REFERENCES `security_groups` (`id`),
  CONSTRAINT `security_group_instance_association_instance_uuid_fkey` FOREIGN KEY (`instance_uuid`) REFERENCES `instances` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `security_group_instance_association`
--

LOCK TABLES `security_group_instance_association` WRITE;
/*!40000 ALTER TABLE `security_group_instance_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `security_group_instance_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `security_group_rules`
--

DROP TABLE IF EXISTS `security_group_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `security_group_rules` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_group_id` int(11) DEFAULT NULL,
  `protocol` varchar(255) DEFAULT NULL,
  `from_port` int(11) DEFAULT NULL,
  `to_port` int(11) DEFAULT NULL,
  `cidr` varchar(43) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_group_id` (`parent_group_id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `security_group_rules_ibfk_1` FOREIGN KEY (`parent_group_id`) REFERENCES `security_groups` (`id`),
  CONSTRAINT `security_group_rules_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `security_groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `security_group_rules`
--

LOCK TABLES `security_group_rules` WRITE;
/*!40000 ALTER TABLE `security_group_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `security_group_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `security_groups`
--

DROP TABLE IF EXISTS `security_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `security_groups` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `project_id` varchar(255) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_security_groups0project_id0name0deleted` (`project_id`,`name`,`deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `security_groups`
--

LOCK TABLES `security_groups` WRITE;
/*!40000 ALTER TABLE `security_groups` DISABLE KEYS */;
INSERT INTO `security_groups` VALUES ('2015-08-29 12:59:05',NULL,NULL,1,'default','default','f901000cb1c842ccbe139860ba5080c2','5b6cca8b0e464a399f723e7660be3290',0);
/*!40000 ALTER TABLE `security_groups` ENABLE KEYS */;
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host` varchar(255) DEFAULT NULL,
  `binary` varchar(255) DEFAULT NULL,
  `topic` varchar(255) DEFAULT NULL,
  `report_count` int(11) NOT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `disabled_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_services0host0topic0deleted` (`host`,`topic`,`deleted`),
  UNIQUE KEY `uniq_services0host0binary0deleted` (`host`,`binary`,`deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES ('2015-08-19 10:27:20','2015-08-30 17:31:09',NULL,1,'controller1.hkexpoc.com','nova-consoleauth','consoleauth',90723,0,0,NULL),('2015-08-19 10:27:21','2015-08-30 17:31:09',NULL,2,'controller1.hkexpoc.com','nova-scheduler','scheduler',90720,0,0,NULL),('2015-08-19 10:27:23','2015-08-30 17:31:09',NULL,3,'controller1.hkexpoc.com','nova-conductor','conductor',91760,0,0,NULL),('2015-08-19 10:27:25','2015-08-30 17:31:10',NULL,4,'controller1.hkexpoc.com','nova-compute','compute',81577,0,0,NULL),('2015-08-19 10:27:30','2015-08-30 17:31:08',NULL,5,'controller1.hkexpoc.com','nova-cert','cert',90721,0,0,NULL),('2015-08-19 12:40:36','2015-08-28 14:00:48',NULL,6,'oc1.hkexpoc.com','nova-compute','compute',72948,0,0,NULL),('2015-08-19 12:47:24','2015-08-28 14:16:18',NULL,7,'oc3.hkexpoc.com','nova-compute','compute',73032,0,0,NULL),('2015-08-19 13:07:48','2015-08-30 17:31:05',NULL,8,'controller2.hkexpoc.com','nova-conductor','conductor',88592,0,0,NULL),('2015-08-19 13:07:48','2015-08-30 17:31:06',NULL,9,'controller2.hkexpoc.com','nova-cert','cert',88605,0,0,NULL),('2015-08-19 13:07:48','2015-08-30 17:31:05',NULL,10,'controller2.hkexpoc.com','nova-consoleauth','consoleauth',88605,0,0,NULL),('2015-08-19 13:07:48','2015-08-30 17:31:06',NULL,11,'controller2.hkexpoc.com','nova-scheduler','scheduler',88440,0,0,NULL),('2015-08-19 13:17:57','2015-08-30 17:31:06',NULL,12,'controller4.hkexpoc.com','nova-consoleauth','consoleauth',89331,0,0,NULL),('2015-08-19 13:17:57','2015-08-30 17:31:08',NULL,13,'controller4.hkexpoc.com','nova-conductor','conductor',90561,0,0,NULL),('2015-08-19 13:17:57','2015-08-30 17:31:08',NULL,14,'controller4.hkexpoc.com','nova-scheduler','scheduler',80135,0,0,NULL),('2015-08-19 13:17:57','2015-08-30 17:31:06',NULL,15,'controller4.hkexpoc.com','nova-cert','cert',80134,0,0,NULL),('2015-08-19 13:39:46','2015-08-30 17:31:11',NULL,16,'oc4.hkexpoc.com','nova-compute','compute',88476,0,0,NULL),('2015-08-20 14:41:10','2015-08-30 17:31:09',NULL,17,'controller4.hkexpoc.com','nova-compute','compute',78391,0,0,NULL),('2015-08-21 06:50:52','2015-08-30 17:31:09',NULL,20,'controller3.hkexpoc.com','nova-conductor','conductor',75873,0,0,NULL),('2015-08-21 06:50:52','2015-08-30 17:31:06',NULL,23,'controller3.hkexpoc.com','nova-consoleauth','consoleauth',74688,0,0,NULL),('2015-08-21 06:50:52','2015-08-30 17:31:06',NULL,26,'controller3.hkexpoc.com','nova-cert','cert',74688,0,0,NULL),('2015-08-21 06:50:53','2015-08-30 17:31:08',NULL,29,'controller3.hkexpoc.com','nova-scheduler','scheduler',74687,0,0,NULL),('2015-08-21 06:50:58','2015-08-30 17:31:09',NULL,31,'controller3.hkexpoc.com','nova-compute','compute',72670,0,0,NULL),('2015-08-21 07:02:18','2015-08-30 17:31:13',NULL,33,'controller2.hkexpoc.com','nova-compute','compute',71883,0,0,NULL),('2015-08-24 09:26:41','2015-08-30 17:31:08',NULL,35,'oc2.hkexpoc.com','nova-compute','compute',46449,0,0,NULL);
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shadow_agent_builds`
--

DROP TABLE IF EXISTS `shadow_agent_builds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shadow_agent_builds` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hypervisor` varchar(255) DEFAULT NULL,
  `os` varchar(255) DEFAULT NULL,
  `architecture` varchar(255) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `md5hash` varchar(255) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shadow_agent_builds`
--

LOCK TABLES `shadow_agent_builds` WRITE;
/*!40000 ALTER TABLE `shadow_agent_builds` DISABLE KEYS */;
/*!40000 ALTER TABLE `shadow_agent_builds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shadow_aggregate_hosts`
--

DROP TABLE IF EXISTS `shadow_aggregate_hosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shadow_aggregate_hosts` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host` varchar(255) DEFAULT NULL,
  `aggregate_id` int(11) NOT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shadow_aggregate_hosts`
--

LOCK TABLES `shadow_aggregate_hosts` WRITE;
/*!40000 ALTER TABLE `shadow_aggregate_hosts` DISABLE KEYS */;
/*!40000 ALTER TABLE `shadow_aggregate_hosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shadow_aggregate_metadata`
--

DROP TABLE IF EXISTS `shadow_aggregate_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shadow_aggregate_metadata` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aggregate_id` int(11) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shadow_aggregate_metadata`
--

LOCK TABLES `shadow_aggregate_metadata` WRITE;
/*!40000 ALTER TABLE `shadow_aggregate_metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `shadow_aggregate_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shadow_aggregates`
--

DROP TABLE IF EXISTS `shadow_aggregates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shadow_aggregates` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shadow_aggregates`
--

LOCK TABLES `shadow_aggregates` WRITE;
/*!40000 ALTER TABLE `shadow_aggregates` DISABLE KEYS */;
/*!40000 ALTER TABLE `shadow_aggregates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shadow_block_device_mapping`
--

DROP TABLE IF EXISTS `shadow_block_device_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shadow_block_device_mapping` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_name` varchar(255) DEFAULT NULL,
  `delete_on_termination` tinyint(1) DEFAULT NULL,
  `snapshot_id` varchar(36) DEFAULT NULL,
  `volume_id` varchar(36) DEFAULT NULL,
  `volume_size` int(11) DEFAULT NULL,
  `no_device` tinyint(1) DEFAULT NULL,
  `connection_info` mediumtext,
  `instance_uuid` varchar(36) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `source_type` varchar(255) DEFAULT NULL,
  `destination_type` varchar(255) DEFAULT NULL,
  `guest_format` varchar(255) DEFAULT NULL,
  `device_type` varchar(255) DEFAULT NULL,
  `disk_bus` varchar(255) DEFAULT NULL,
  `boot_index` int(11) DEFAULT NULL,
  `image_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shadow_block_device_mapping`
--

LOCK TABLES `shadow_block_device_mapping` WRITE;
/*!40000 ALTER TABLE `shadow_block_device_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `shadow_block_device_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shadow_bw_usage_cache`
--

DROP TABLE IF EXISTS `shadow_bw_usage_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shadow_bw_usage_cache` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_period` datetime NOT NULL,
  `last_refreshed` datetime DEFAULT NULL,
  `bw_in` bigint(20) DEFAULT NULL,
  `bw_out` bigint(20) DEFAULT NULL,
  `mac` varchar(255) DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  `last_ctr_in` bigint(20) DEFAULT NULL,
  `last_ctr_out` bigint(20) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shadow_bw_usage_cache`
--

LOCK TABLES `shadow_bw_usage_cache` WRITE;
/*!40000 ALTER TABLE `shadow_bw_usage_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `shadow_bw_usage_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shadow_cells`
--

DROP TABLE IF EXISTS `shadow_cells`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shadow_cells` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `api_url` varchar(255) DEFAULT NULL,
  `weight_offset` float DEFAULT NULL,
  `weight_scale` float DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `is_parent` tinyint(1) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `transport_url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shadow_cells`
--

LOCK TABLES `shadow_cells` WRITE;
/*!40000 ALTER TABLE `shadow_cells` DISABLE KEYS */;
/*!40000 ALTER TABLE `shadow_cells` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shadow_certificates`
--

DROP TABLE IF EXISTS `shadow_certificates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shadow_certificates` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) DEFAULT NULL,
  `project_id` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shadow_certificates`
--

LOCK TABLES `shadow_certificates` WRITE;
/*!40000 ALTER TABLE `shadow_certificates` DISABLE KEYS */;
/*!40000 ALTER TABLE `shadow_certificates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shadow_compute_nodes`
--

DROP TABLE IF EXISTS `shadow_compute_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shadow_compute_nodes` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) DEFAULT NULL,
  `vcpus` int(11) NOT NULL,
  `memory_mb` int(11) NOT NULL,
  `local_gb` int(11) NOT NULL,
  `vcpus_used` int(11) NOT NULL,
  `memory_mb_used` int(11) NOT NULL,
  `local_gb_used` int(11) NOT NULL,
  `hypervisor_type` mediumtext NOT NULL,
  `hypervisor_version` int(11) NOT NULL,
  `cpu_info` mediumtext NOT NULL,
  `disk_available_least` int(11) DEFAULT NULL,
  `free_ram_mb` int(11) DEFAULT NULL,
  `free_disk_gb` int(11) DEFAULT NULL,
  `current_workload` int(11) DEFAULT NULL,
  `running_vms` int(11) DEFAULT NULL,
  `hypervisor_hostname` varchar(255) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `host_ip` varchar(39) DEFAULT NULL,
  `supported_instances` text,
  `pci_stats` text,
  `metrics` text,
  `extra_resources` text,
  `stats` text,
  `numa_topology` text,
  `host` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shadow_compute_nodes`
--

LOCK TABLES `shadow_compute_nodes` WRITE;
/*!40000 ALTER TABLE `shadow_compute_nodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `shadow_compute_nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shadow_console_pools`
--

DROP TABLE IF EXISTS `shadow_console_pools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shadow_console_pools` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(39) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `console_type` varchar(255) DEFAULT NULL,
  `public_hostname` varchar(255) DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `compute_host` varchar(255) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shadow_console_pools`
--

LOCK TABLES `shadow_console_pools` WRITE;
/*!40000 ALTER TABLE `shadow_console_pools` DISABLE KEYS */;
/*!40000 ALTER TABLE `shadow_console_pools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shadow_consoles`
--

DROP TABLE IF EXISTS `shadow_consoles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shadow_consoles` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `instance_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `pool_id` int(11) DEFAULT NULL,
  `instance_uuid` varchar(36) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shadow_consoles`
--

LOCK TABLES `shadow_consoles` WRITE;
/*!40000 ALTER TABLE `shadow_consoles` DISABLE KEYS */;
/*!40000 ALTER TABLE `shadow_consoles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shadow_dns_domains`
--

DROP TABLE IF EXISTS `shadow_dns_domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shadow_dns_domains` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `domain` varchar(255) NOT NULL,
  `scope` varchar(255) DEFAULT NULL,
  `availability_zone` varchar(255) DEFAULT NULL,
  `project_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shadow_dns_domains`
--

LOCK TABLES `shadow_dns_domains` WRITE;
/*!40000 ALTER TABLE `shadow_dns_domains` DISABLE KEYS */;
/*!40000 ALTER TABLE `shadow_dns_domains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shadow_fixed_ips`
--

DROP TABLE IF EXISTS `shadow_fixed_ips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shadow_fixed_ips` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(39) DEFAULT NULL,
  `network_id` int(11) DEFAULT NULL,
  `allocated` tinyint(1) DEFAULT NULL,
  `leased` tinyint(1) DEFAULT NULL,
  `reserved` tinyint(1) DEFAULT NULL,
  `virtual_interface_id` int(11) DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `instance_uuid` varchar(36) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shadow_fixed_ips`
--

LOCK TABLES `shadow_fixed_ips` WRITE;
/*!40000 ALTER TABLE `shadow_fixed_ips` DISABLE KEYS */;
/*!40000 ALTER TABLE `shadow_fixed_ips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shadow_floating_ips`
--

DROP TABLE IF EXISTS `shadow_floating_ips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shadow_floating_ips` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(39) DEFAULT NULL,
  `fixed_ip_id` int(11) DEFAULT NULL,
  `project_id` varchar(255) DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `auto_assigned` tinyint(1) DEFAULT NULL,
  `pool` varchar(255) DEFAULT NULL,
  `interface` varchar(255) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shadow_floating_ips`
--

LOCK TABLES `shadow_floating_ips` WRITE;
/*!40000 ALTER TABLE `shadow_floating_ips` DISABLE KEYS */;
/*!40000 ALTER TABLE `shadow_floating_ips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shadow_instance_actions`
--

DROP TABLE IF EXISTS `shadow_instance_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shadow_instance_actions` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(255) DEFAULT NULL,
  `instance_uuid` varchar(36) DEFAULT NULL,
  `request_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `project_id` varchar(255) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `finish_time` datetime DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shadow_instance_actions`
--

LOCK TABLES `shadow_instance_actions` WRITE;
/*!40000 ALTER TABLE `shadow_instance_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `shadow_instance_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shadow_instance_actions_events`
--

DROP TABLE IF EXISTS `shadow_instance_actions_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shadow_instance_actions_events` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event` varchar(255) DEFAULT NULL,
  `action_id` int(11) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `finish_time` datetime DEFAULT NULL,
  `result` varchar(255) DEFAULT NULL,
  `traceback` text,
  `deleted` int(11) DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `details` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shadow_instance_actions_events`
--

LOCK TABLES `shadow_instance_actions_events` WRITE;
/*!40000 ALTER TABLE `shadow_instance_actions_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `shadow_instance_actions_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shadow_instance_extra`
--

DROP TABLE IF EXISTS `shadow_instance_extra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shadow_instance_extra` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `instance_uuid` varchar(36) NOT NULL,
  `numa_topology` text,
  `pci_requests` text,
  `flavor` text,
  `vcpu_model` text,
  PRIMARY KEY (`id`),
  KEY `shadow_instance_extra_idx` (`instance_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shadow_instance_extra`
--

LOCK TABLES `shadow_instance_extra` WRITE;
/*!40000 ALTER TABLE `shadow_instance_extra` DISABLE KEYS */;
/*!40000 ALTER TABLE `shadow_instance_extra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shadow_instance_faults`
--

DROP TABLE IF EXISTS `shadow_instance_faults`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shadow_instance_faults` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `instance_uuid` varchar(36) DEFAULT NULL,
  `code` int(11) NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `details` mediumtext,
  `host` varchar(255) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shadow_instance_faults`
--

LOCK TABLES `shadow_instance_faults` WRITE;
/*!40000 ALTER TABLE `shadow_instance_faults` DISABLE KEYS */;
/*!40000 ALTER TABLE `shadow_instance_faults` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shadow_instance_group_member`
--

DROP TABLE IF EXISTS `shadow_instance_group_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shadow_instance_group_member` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `instance_id` varchar(255) DEFAULT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shadow_instance_group_member`
--

LOCK TABLES `shadow_instance_group_member` WRITE;
/*!40000 ALTER TABLE `shadow_instance_group_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `shadow_instance_group_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shadow_instance_group_policy`
--

DROP TABLE IF EXISTS `shadow_instance_group_policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shadow_instance_group_policy` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `policy` varchar(255) DEFAULT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shadow_instance_group_policy`
--

LOCK TABLES `shadow_instance_group_policy` WRITE;
/*!40000 ALTER TABLE `shadow_instance_group_policy` DISABLE KEYS */;
/*!40000 ALTER TABLE `shadow_instance_group_policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shadow_instance_groups`
--

DROP TABLE IF EXISTS `shadow_instance_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shadow_instance_groups` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) DEFAULT NULL,
  `project_id` varchar(255) DEFAULT NULL,
  `uuid` varchar(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shadow_instance_groups`
--

LOCK TABLES `shadow_instance_groups` WRITE;
/*!40000 ALTER TABLE `shadow_instance_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `shadow_instance_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shadow_instance_id_mappings`
--

DROP TABLE IF EXISTS `shadow_instance_id_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shadow_instance_id_mappings` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shadow_instance_id_mappings`
--

LOCK TABLES `shadow_instance_id_mappings` WRITE;
/*!40000 ALTER TABLE `shadow_instance_id_mappings` DISABLE KEYS */;
/*!40000 ALTER TABLE `shadow_instance_id_mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shadow_instance_info_caches`
--

DROP TABLE IF EXISTS `shadow_instance_info_caches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shadow_instance_info_caches` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `network_info` mediumtext,
  `instance_uuid` varchar(36) NOT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shadow_instance_info_caches`
--

LOCK TABLES `shadow_instance_info_caches` WRITE;
/*!40000 ALTER TABLE `shadow_instance_info_caches` DISABLE KEYS */;
/*!40000 ALTER TABLE `shadow_instance_info_caches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shadow_instance_metadata`
--

DROP TABLE IF EXISTS `shadow_instance_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shadow_instance_metadata` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `instance_uuid` varchar(36) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shadow_instance_metadata`
--

LOCK TABLES `shadow_instance_metadata` WRITE;
/*!40000 ALTER TABLE `shadow_instance_metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `shadow_instance_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shadow_instance_system_metadata`
--

DROP TABLE IF EXISTS `shadow_instance_system_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shadow_instance_system_metadata` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `instance_uuid` varchar(36) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shadow_instance_system_metadata`
--

LOCK TABLES `shadow_instance_system_metadata` WRITE;
/*!40000 ALTER TABLE `shadow_instance_system_metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `shadow_instance_system_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shadow_instance_type_extra_specs`
--

DROP TABLE IF EXISTS `shadow_instance_type_extra_specs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shadow_instance_type_extra_specs` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `instance_type_id` int(11) NOT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shadow_instance_type_extra_specs`
--

LOCK TABLES `shadow_instance_type_extra_specs` WRITE;
/*!40000 ALTER TABLE `shadow_instance_type_extra_specs` DISABLE KEYS */;
/*!40000 ALTER TABLE `shadow_instance_type_extra_specs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shadow_instance_type_projects`
--

DROP TABLE IF EXISTS `shadow_instance_type_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shadow_instance_type_projects` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `instance_type_id` int(11) NOT NULL,
  `project_id` varchar(255) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shadow_instance_type_projects`
--

LOCK TABLES `shadow_instance_type_projects` WRITE;
/*!40000 ALTER TABLE `shadow_instance_type_projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `shadow_instance_type_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shadow_instance_types`
--

DROP TABLE IF EXISTS `shadow_instance_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shadow_instance_types` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memory_mb` int(11) NOT NULL,
  `vcpus` int(11) NOT NULL,
  `swap` int(11) NOT NULL,
  `vcpu_weight` int(11) DEFAULT NULL,
  `flavorid` varchar(255) DEFAULT NULL,
  `rxtx_factor` float DEFAULT NULL,
  `root_gb` int(11) DEFAULT NULL,
  `ephemeral_gb` int(11) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  `is_public` tinyint(1) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shadow_instance_types`
--

LOCK TABLES `shadow_instance_types` WRITE;
/*!40000 ALTER TABLE `shadow_instance_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `shadow_instance_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shadow_instances`
--

DROP TABLE IF EXISTS `shadow_instances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shadow_instances` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `internal_id` int(11) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `project_id` varchar(255) DEFAULT NULL,
  `image_ref` varchar(255) DEFAULT NULL,
  `kernel_id` varchar(255) DEFAULT NULL,
  `ramdisk_id` varchar(255) DEFAULT NULL,
  `launch_index` int(11) DEFAULT NULL,
  `key_name` varchar(255) DEFAULT NULL,
  `key_data` mediumtext,
  `power_state` int(11) DEFAULT NULL,
  `vm_state` varchar(255) DEFAULT NULL,
  `memory_mb` int(11) DEFAULT NULL,
  `vcpus` int(11) DEFAULT NULL,
  `hostname` varchar(255) DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `user_data` mediumtext,
  `reservation_id` varchar(255) DEFAULT NULL,
  `scheduled_at` datetime DEFAULT NULL,
  `launched_at` datetime DEFAULT NULL,
  `terminated_at` datetime DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `display_description` varchar(255) DEFAULT NULL,
  `availability_zone` varchar(255) DEFAULT NULL,
  `locked` tinyint(1) DEFAULT NULL,
  `os_type` varchar(255) DEFAULT NULL,
  `launched_on` mediumtext,
  `instance_type_id` int(11) DEFAULT NULL,
  `vm_mode` varchar(255) DEFAULT NULL,
  `uuid` varchar(36) NOT NULL,
  `architecture` varchar(255) DEFAULT NULL,
  `root_device_name` varchar(255) DEFAULT NULL,
  `access_ip_v4` varchar(39) DEFAULT NULL,
  `access_ip_v6` varchar(39) DEFAULT NULL,
  `config_drive` varchar(255) DEFAULT NULL,
  `task_state` varchar(255) DEFAULT NULL,
  `default_ephemeral_device` varchar(255) DEFAULT NULL,
  `default_swap_device` varchar(255) DEFAULT NULL,
  `progress` int(11) DEFAULT NULL,
  `auto_disk_config` tinyint(1) DEFAULT NULL,
  `shutdown_terminate` tinyint(1) DEFAULT NULL,
  `disable_terminate` tinyint(1) DEFAULT NULL,
  `root_gb` int(11) DEFAULT NULL,
  `ephemeral_gb` int(11) DEFAULT NULL,
  `cell_name` varchar(255) DEFAULT NULL,
  `node` varchar(255) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `locked_by` enum('owner','admin') DEFAULT NULL,
  `cleaned` int(11) DEFAULT NULL,
  `ephemeral_key_uuid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shadow_instances`
--

LOCK TABLES `shadow_instances` WRITE;
/*!40000 ALTER TABLE `shadow_instances` DISABLE KEYS */;
/*!40000 ALTER TABLE `shadow_instances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shadow_iscsi_targets`
--

DROP TABLE IF EXISTS `shadow_iscsi_targets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shadow_iscsi_targets` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_num` int(11) DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `volume_id` varchar(36) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shadow_iscsi_targets`
--

LOCK TABLES `shadow_iscsi_targets` WRITE;
/*!40000 ALTER TABLE `shadow_iscsi_targets` DISABLE KEYS */;
/*!40000 ALTER TABLE `shadow_iscsi_targets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shadow_key_pairs`
--

DROP TABLE IF EXISTS `shadow_key_pairs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shadow_key_pairs` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `fingerprint` varchar(255) DEFAULT NULL,
  `public_key` mediumtext,
  `deleted` int(11) DEFAULT NULL,
  `type` enum('ssh','x509') NOT NULL DEFAULT 'ssh',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shadow_key_pairs`
--

LOCK TABLES `shadow_key_pairs` WRITE;
/*!40000 ALTER TABLE `shadow_key_pairs` DISABLE KEYS */;
/*!40000 ALTER TABLE `shadow_key_pairs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shadow_migrate_version`
--

DROP TABLE IF EXISTS `shadow_migrate_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shadow_migrate_version` (
  `repository_id` varchar(250) NOT NULL,
  `repository_path` text,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`repository_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shadow_migrate_version`
--

LOCK TABLES `shadow_migrate_version` WRITE;
/*!40000 ALTER TABLE `shadow_migrate_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `shadow_migrate_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shadow_migrations`
--

DROP TABLE IF EXISTS `shadow_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shadow_migrations` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source_compute` varchar(255) DEFAULT NULL,
  `dest_compute` varchar(255) DEFAULT NULL,
  `dest_host` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `instance_uuid` varchar(36) DEFAULT NULL,
  `old_instance_type_id` int(11) DEFAULT NULL,
  `new_instance_type_id` int(11) DEFAULT NULL,
  `source_node` varchar(255) DEFAULT NULL,
  `dest_node` varchar(255) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shadow_migrations`
--

LOCK TABLES `shadow_migrations` WRITE;
/*!40000 ALTER TABLE `shadow_migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `shadow_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shadow_networks`
--

DROP TABLE IF EXISTS `shadow_networks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shadow_networks` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `injected` tinyint(1) DEFAULT NULL,
  `cidr` varchar(43) DEFAULT NULL,
  `netmask` varchar(39) DEFAULT NULL,
  `bridge` varchar(255) DEFAULT NULL,
  `gateway` varchar(39) DEFAULT NULL,
  `broadcast` varchar(39) DEFAULT NULL,
  `dns1` varchar(39) DEFAULT NULL,
  `vlan` int(11) DEFAULT NULL,
  `vpn_public_address` varchar(39) DEFAULT NULL,
  `vpn_public_port` int(11) DEFAULT NULL,
  `vpn_private_address` varchar(39) DEFAULT NULL,
  `dhcp_start` varchar(39) DEFAULT NULL,
  `project_id` varchar(255) DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `cidr_v6` varchar(43) DEFAULT NULL,
  `gateway_v6` varchar(39) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `netmask_v6` varchar(39) DEFAULT NULL,
  `bridge_interface` varchar(255) DEFAULT NULL,
  `multi_host` tinyint(1) DEFAULT NULL,
  `dns2` varchar(39) DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `rxtx_base` int(11) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `mtu` int(11) DEFAULT NULL,
  `dhcp_server` varchar(39) DEFAULT NULL,
  `enable_dhcp` tinyint(1) DEFAULT NULL,
  `share_address` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shadow_networks`
--

LOCK TABLES `shadow_networks` WRITE;
/*!40000 ALTER TABLE `shadow_networks` DISABLE KEYS */;
/*!40000 ALTER TABLE `shadow_networks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shadow_pci_devices`
--

DROP TABLE IF EXISTS `shadow_pci_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shadow_pci_devices` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `compute_node_id` int(11) NOT NULL,
  `address` varchar(12) NOT NULL,
  `product_id` varchar(4) DEFAULT NULL,
  `vendor_id` varchar(4) DEFAULT NULL,
  `dev_type` varchar(8) DEFAULT NULL,
  `dev_id` varchar(255) DEFAULT NULL,
  `label` varchar(255) NOT NULL,
  `status` varchar(36) NOT NULL,
  `extra_info` text,
  `instance_uuid` varchar(36) DEFAULT NULL,
  `request_id` varchar(36) DEFAULT NULL,
  `numa_node` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shadow_pci_devices`
--

LOCK TABLES `shadow_pci_devices` WRITE;
/*!40000 ALTER TABLE `shadow_pci_devices` DISABLE KEYS */;
/*!40000 ALTER TABLE `shadow_pci_devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shadow_project_user_quotas`
--

DROP TABLE IF EXISTS `shadow_project_user_quotas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shadow_project_user_quotas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `user_id` varchar(255) NOT NULL,
  `project_id` varchar(255) NOT NULL,
  `resource` varchar(255) NOT NULL,
  `hard_limit` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shadow_project_user_quotas`
--

LOCK TABLES `shadow_project_user_quotas` WRITE;
/*!40000 ALTER TABLE `shadow_project_user_quotas` DISABLE KEYS */;
/*!40000 ALTER TABLE `shadow_project_user_quotas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shadow_provider_fw_rules`
--

DROP TABLE IF EXISTS `shadow_provider_fw_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shadow_provider_fw_rules` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `protocol` varchar(5) DEFAULT NULL,
  `from_port` int(11) DEFAULT NULL,
  `to_port` int(11) DEFAULT NULL,
  `cidr` varchar(43) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shadow_provider_fw_rules`
--

LOCK TABLES `shadow_provider_fw_rules` WRITE;
/*!40000 ALTER TABLE `shadow_provider_fw_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `shadow_provider_fw_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shadow_quota_classes`
--

DROP TABLE IF EXISTS `shadow_quota_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shadow_quota_classes` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) DEFAULT NULL,
  `resource` varchar(255) DEFAULT NULL,
  `hard_limit` int(11) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shadow_quota_classes`
--

LOCK TABLES `shadow_quota_classes` WRITE;
/*!40000 ALTER TABLE `shadow_quota_classes` DISABLE KEYS */;
/*!40000 ALTER TABLE `shadow_quota_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shadow_quota_usages`
--

DROP TABLE IF EXISTS `shadow_quota_usages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shadow_quota_usages` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` varchar(255) DEFAULT NULL,
  `resource` varchar(255) DEFAULT NULL,
  `in_use` int(11) NOT NULL,
  `reserved` int(11) NOT NULL,
  `until_refresh` int(11) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shadow_quota_usages`
--

LOCK TABLES `shadow_quota_usages` WRITE;
/*!40000 ALTER TABLE `shadow_quota_usages` DISABLE KEYS */;
/*!40000 ALTER TABLE `shadow_quota_usages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shadow_quotas`
--

DROP TABLE IF EXISTS `shadow_quotas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shadow_quotas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `project_id` varchar(255) DEFAULT NULL,
  `resource` varchar(255) NOT NULL,
  `hard_limit` int(11) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shadow_quotas`
--

LOCK TABLES `shadow_quotas` WRITE;
/*!40000 ALTER TABLE `shadow_quotas` DISABLE KEYS */;
/*!40000 ALTER TABLE `shadow_quotas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shadow_reservations`
--

DROP TABLE IF EXISTS `shadow_reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shadow_reservations` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `usage_id` int(11) NOT NULL,
  `project_id` varchar(255) DEFAULT NULL,
  `resource` varchar(255) DEFAULT NULL,
  `delta` int(11) NOT NULL,
  `expire` datetime DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shadow_reservations`
--

LOCK TABLES `shadow_reservations` WRITE;
/*!40000 ALTER TABLE `shadow_reservations` DISABLE KEYS */;
/*!40000 ALTER TABLE `shadow_reservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shadow_s3_images`
--

DROP TABLE IF EXISTS `shadow_s3_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shadow_s3_images` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shadow_s3_images`
--

LOCK TABLES `shadow_s3_images` WRITE;
/*!40000 ALTER TABLE `shadow_s3_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `shadow_s3_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shadow_security_group_default_rules`
--

DROP TABLE IF EXISTS `shadow_security_group_default_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shadow_security_group_default_rules` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `protocol` varchar(5) DEFAULT NULL,
  `from_port` int(11) DEFAULT NULL,
  `to_port` int(11) DEFAULT NULL,
  `cidr` varchar(43) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shadow_security_group_default_rules`
--

LOCK TABLES `shadow_security_group_default_rules` WRITE;
/*!40000 ALTER TABLE `shadow_security_group_default_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `shadow_security_group_default_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shadow_security_group_instance_association`
--

DROP TABLE IF EXISTS `shadow_security_group_instance_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shadow_security_group_instance_association` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `security_group_id` int(11) DEFAULT NULL,
  `instance_uuid` varchar(36) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shadow_security_group_instance_association`
--

LOCK TABLES `shadow_security_group_instance_association` WRITE;
/*!40000 ALTER TABLE `shadow_security_group_instance_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `shadow_security_group_instance_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shadow_security_group_rules`
--

DROP TABLE IF EXISTS `shadow_security_group_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shadow_security_group_rules` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_group_id` int(11) DEFAULT NULL,
  `protocol` varchar(255) DEFAULT NULL,
  `from_port` int(11) DEFAULT NULL,
  `to_port` int(11) DEFAULT NULL,
  `cidr` varchar(43) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shadow_security_group_rules`
--

LOCK TABLES `shadow_security_group_rules` WRITE;
/*!40000 ALTER TABLE `shadow_security_group_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `shadow_security_group_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shadow_security_groups`
--

DROP TABLE IF EXISTS `shadow_security_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shadow_security_groups` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `project_id` varchar(255) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shadow_security_groups`
--

LOCK TABLES `shadow_security_groups` WRITE;
/*!40000 ALTER TABLE `shadow_security_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `shadow_security_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shadow_services`
--

DROP TABLE IF EXISTS `shadow_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shadow_services` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host` varchar(255) DEFAULT NULL,
  `binary` varchar(255) DEFAULT NULL,
  `topic` varchar(255) DEFAULT NULL,
  `report_count` int(11) NOT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `disabled_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shadow_services`
--

LOCK TABLES `shadow_services` WRITE;
/*!40000 ALTER TABLE `shadow_services` DISABLE KEYS */;
/*!40000 ALTER TABLE `shadow_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shadow_snapshot_id_mappings`
--

DROP TABLE IF EXISTS `shadow_snapshot_id_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shadow_snapshot_id_mappings` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shadow_snapshot_id_mappings`
--

LOCK TABLES `shadow_snapshot_id_mappings` WRITE;
/*!40000 ALTER TABLE `shadow_snapshot_id_mappings` DISABLE KEYS */;
/*!40000 ALTER TABLE `shadow_snapshot_id_mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shadow_snapshots`
--

DROP TABLE IF EXISTS `shadow_snapshots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shadow_snapshots` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
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
  `deleted` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shadow_snapshots`
--

LOCK TABLES `shadow_snapshots` WRITE;
/*!40000 ALTER TABLE `shadow_snapshots` DISABLE KEYS */;
/*!40000 ALTER TABLE `shadow_snapshots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shadow_task_log`
--

DROP TABLE IF EXISTS `shadow_task_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shadow_task_log` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_name` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `host` varchar(255) NOT NULL,
  `period_beginning` datetime NOT NULL,
  `period_ending` datetime NOT NULL,
  `message` varchar(255) NOT NULL,
  `task_items` int(11) DEFAULT NULL,
  `errors` int(11) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shadow_task_log`
--

LOCK TABLES `shadow_task_log` WRITE;
/*!40000 ALTER TABLE `shadow_task_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `shadow_task_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shadow_virtual_interfaces`
--

DROP TABLE IF EXISTS `shadow_virtual_interfaces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shadow_virtual_interfaces` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `network_id` int(11) DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  `instance_uuid` varchar(36) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shadow_virtual_interfaces`
--

LOCK TABLES `shadow_virtual_interfaces` WRITE;
/*!40000 ALTER TABLE `shadow_virtual_interfaces` DISABLE KEYS */;
/*!40000 ALTER TABLE `shadow_virtual_interfaces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shadow_volume_id_mappings`
--

DROP TABLE IF EXISTS `shadow_volume_id_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shadow_volume_id_mappings` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shadow_volume_id_mappings`
--

LOCK TABLES `shadow_volume_id_mappings` WRITE;
/*!40000 ALTER TABLE `shadow_volume_id_mappings` DISABLE KEYS */;
/*!40000 ALTER TABLE `shadow_volume_id_mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shadow_volume_usage_cache`
--

DROP TABLE IF EXISTS `shadow_volume_usage_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shadow_volume_usage_cache` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `volume_id` varchar(36) NOT NULL,
  `tot_last_refreshed` datetime DEFAULT NULL,
  `tot_reads` bigint(20) DEFAULT NULL,
  `tot_read_bytes` bigint(20) DEFAULT NULL,
  `tot_writes` bigint(20) DEFAULT NULL,
  `tot_write_bytes` bigint(20) DEFAULT NULL,
  `curr_last_refreshed` datetime DEFAULT NULL,
  `curr_reads` bigint(20) DEFAULT NULL,
  `curr_read_bytes` bigint(20) DEFAULT NULL,
  `curr_writes` bigint(20) DEFAULT NULL,
  `curr_write_bytes` bigint(20) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `instance_uuid` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `availability_zone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shadow_volume_usage_cache`
--

LOCK TABLES `shadow_volume_usage_cache` WRITE;
/*!40000 ALTER TABLE `shadow_volume_usage_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `shadow_volume_usage_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shadow_volumes`
--

DROP TABLE IF EXISTS `shadow_volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shadow_volumes` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` varchar(36) NOT NULL,
  `ec2_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `project_id` varchar(255) DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `availability_zone` varchar(255) DEFAULT NULL,
  `mountpoint` varchar(255) DEFAULT NULL,
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
  `volume_type_id` int(11) DEFAULT NULL,
  `instance_uuid` varchar(36) DEFAULT NULL,
  `attach_time` datetime DEFAULT NULL,
  `deleted` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shadow_volumes`
--

LOCK TABLES `shadow_volumes` WRITE;
/*!40000 ALTER TABLE `shadow_volumes` DISABLE KEYS */;
/*!40000 ALTER TABLE `shadow_volumes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snapshot_id_mappings`
--

DROP TABLE IF EXISTS `snapshot_id_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snapshot_id_mappings` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snapshot_id_mappings`
--

LOCK TABLES `snapshot_id_mappings` WRITE;
/*!40000 ALTER TABLE `snapshot_id_mappings` DISABLE KEYS */;
/*!40000 ALTER TABLE `snapshot_id_mappings` ENABLE KEYS */;
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
  `deleted` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
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
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `resource_id` varchar(36) NOT NULL,
  `tag` varchar(80) NOT NULL,
  PRIMARY KEY (`resource_id`,`tag`),
  KEY `tags_tag_idx` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_log`
--

DROP TABLE IF EXISTS `task_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_log` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_name` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `host` varchar(255) NOT NULL,
  `period_beginning` datetime NOT NULL,
  `period_ending` datetime NOT NULL,
  `message` varchar(255) NOT NULL,
  `task_items` int(11) DEFAULT NULL,
  `errors` int(11) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_task_log0task_name0host0period_beginning0period_ending` (`task_name`,`host`,`period_beginning`,`period_ending`),
  KEY `ix_task_log_period_beginning` (`period_beginning`),
  KEY `ix_task_log_host` (`host`),
  KEY `ix_task_log_period_ending` (`period_ending`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_log`
--

LOCK TABLES `task_log` WRITE;
/*!40000 ALTER TABLE `task_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `virtual_interfaces`
--

DROP TABLE IF EXISTS `virtual_interfaces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `virtual_interfaces` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `network_id` int(11) DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  `instance_uuid` varchar(36) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_virtual_interfaces0address0deleted` (`address`,`deleted`),
  KEY `virtual_interfaces_instance_uuid_fkey` (`instance_uuid`),
  KEY `virtual_interfaces_network_id_idx` (`network_id`),
  KEY `virtual_interfaces_uuid_idx` (`uuid`),
  CONSTRAINT `virtual_interfaces_instance_uuid_fkey` FOREIGN KEY (`instance_uuid`) REFERENCES `instances` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virtual_interfaces`
--

LOCK TABLES `virtual_interfaces` WRITE;
/*!40000 ALTER TABLE `virtual_interfaces` DISABLE KEYS */;
/*!40000 ALTER TABLE `virtual_interfaces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volume_id_mappings`
--

DROP TABLE IF EXISTS `volume_id_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volume_id_mappings` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volume_id_mappings`
--

LOCK TABLES `volume_id_mappings` WRITE;
/*!40000 ALTER TABLE `volume_id_mappings` DISABLE KEYS */;
/*!40000 ALTER TABLE `volume_id_mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volume_usage_cache`
--

DROP TABLE IF EXISTS `volume_usage_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volume_usage_cache` (
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `volume_id` varchar(36) NOT NULL,
  `tot_last_refreshed` datetime DEFAULT NULL,
  `tot_reads` bigint(20) DEFAULT NULL,
  `tot_read_bytes` bigint(20) DEFAULT NULL,
  `tot_writes` bigint(20) DEFAULT NULL,
  `tot_write_bytes` bigint(20) DEFAULT NULL,
  `curr_last_refreshed` datetime DEFAULT NULL,
  `curr_reads` bigint(20) DEFAULT NULL,
  `curr_read_bytes` bigint(20) DEFAULT NULL,
  `curr_writes` bigint(20) DEFAULT NULL,
  `curr_write_bytes` bigint(20) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `instance_uuid` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(64) DEFAULT NULL,
  `availability_zone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volume_usage_cache`
--

LOCK TABLES `volume_usage_cache` WRITE;
/*!40000 ALTER TABLE `volume_usage_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `volume_usage_cache` ENABLE KEYS */;
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
  `id` varchar(36) NOT NULL,
  `ec2_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `project_id` varchar(255) DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `availability_zone` varchar(255) DEFAULT NULL,
  `mountpoint` varchar(255) DEFAULT NULL,
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
  `volume_type_id` int(11) DEFAULT NULL,
  `instance_uuid` varchar(36) DEFAULT NULL,
  `attach_time` datetime DEFAULT NULL,
  `deleted` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `volumes_instance_uuid_idx` (`instance_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
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

-- Dump completed on 2015-08-31  1:31:14
