-- MySQL dump 10.14  Distrib 5.5.44-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: neutron
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
-- Table structure for table `agents`
--

DROP TABLE IF EXISTS `agents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agents` (
  `id` varchar(36) NOT NULL,
  `agent_type` varchar(255) NOT NULL,
  `binary` varchar(255) NOT NULL,
  `topic` varchar(255) NOT NULL,
  `host` varchar(255) NOT NULL,
  `admin_state_up` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `started_at` datetime NOT NULL,
  `heartbeat_timestamp` datetime NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `configurations` varchar(4095) NOT NULL,
  `load` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_agents0agent_type0host` (`agent_type`,`host`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agents`
--

LOCK TABLES `agents` WRITE;
/*!40000 ALTER TABLE `agents` DISABLE KEYS */;
INSERT INTO `agents` VALUES ('14f5bf34-00d1-43a1-86d7-94b6fa55a258','DHCP agent','neutron-dhcp-agent','dhcp_agent','controller1.hkexpoc.com',1,'2015-08-19 10:29:27','2015-08-30 16:07:31','2015-08-30 17:30:31',NULL,'{\"subnets\": 1, \"use_namespaces\": true, \"dhcp_lease_duration\": 86400, \"dhcp_driver\": \"neutron.agent.linux.dhcp.Dnsmasq\", \"networks\": 1, \"ports\": 2}',1),('2557817c-4d16-4ecf-b3dd-de69a6b86388','Metadata agent','neutron-metadata-agent','N/A','controller4.hkexpoc.com',1,'2015-08-19 10:28:39','2015-08-28 14:47:12','2015-08-30 17:30:50',NULL,'{\"nova_metadata_ip\": \"osp-vip.hkexpoc.com\", \"nova_metadata_port\": 8775, \"metadata_proxy_socket\": \"/var/lib/neutron/metadata_proxy\"}',0),('27e61f9a-e575-4947-be76-e8dc7ccb96ff','L3 agent','neutron-l3-agent','l3_agent','controller1.hkexpoc.com',1,'2015-08-19 10:28:27','2015-08-30 16:07:32','2015-08-30 17:30:32',NULL,'{\"router_id\": \"\", \"agent_mode\": \"legacy\", \"gateway_external_network_id\": \"\", \"handle_internal_only_routers\": true, \"use_namespaces\": true, \"routers\": 0, \"interfaces\": 0, \"floating_ips\": 0, \"interface_driver\": \"neutron.agent.linux.interface.OVSInterfaceDriver\", \"external_network_bridge\": \"br-ex\", \"ex_gw_ports\": 0}',0),('3b904f56-81f1-49c6-aeeb-2f0c959f73f8','L3 agent','neutron-l3-agent','l3_agent','controller2.hkexpoc.com',1,'2015-08-19 10:29:03','2015-08-30 01:14:59','2015-08-30 17:30:34',NULL,'{\"router_id\": \"\", \"agent_mode\": \"legacy\", \"gateway_external_network_id\": \"\", \"handle_internal_only_routers\": true, \"use_namespaces\": true, \"routers\": 0, \"interfaces\": 0, \"floating_ips\": 0, \"interface_driver\": \"neutron.agent.linux.interface.OVSInterfaceDriver\", \"external_network_bridge\": \"br-ex\", \"ex_gw_ports\": 0}',0),('3bf9a4ca-bc77-4244-95a9-5854f2bcfdd6','Open vSwitch agent','neutron-openvswitch-agent','N/A','oc2.hkexpoc.com',1,'2015-08-24 10:42:30','2015-08-28 14:18:16','2015-08-30 17:30:50',NULL,'{\"in_distributed_mode\": false, \"arp_responder_enabled\": false, \"tunneling_ip\": \"192.168.251.214\", \"devices\": 0, \"l2_population\": false, \"tunnel_types\": [\"vxlan\"], \"enable_distributed_routing\": false, \"bridge_mappings\": {}}',0),('46f9eace-c8b9-4ca4-a2b3-0c352db3e96f','Open vSwitch agent','neutron-openvswitch-agent','N/A','controller3.hkexpoc.com',1,'2015-08-19 10:28:48','2015-08-28 14:44:07','2015-08-30 17:30:50',NULL,'{\"in_distributed_mode\": false, \"arp_responder_enabled\": false, \"tunneling_ip\": \"192.168.252.35\", \"devices\": 0, \"l2_population\": false, \"tunnel_types\": [\"vxlan\"], \"enable_distributed_routing\": false, \"bridge_mappings\": {}}',0),('4cfb0602-5b62-48b0-8f23-d18acc22e338','Metadata agent','neutron-metadata-agent','N/A','controller3.hkexpoc.com',1,'2015-08-19 10:29:16','2015-08-28 14:44:05','2015-08-30 17:30:49',NULL,'{\"nova_metadata_ip\": \"osp-vip.hkexpoc.com\", \"nova_metadata_port\": 8775, \"metadata_proxy_socket\": \"/var/lib/neutron/metadata_proxy\"}',0),('4e491393-df4f-45c7-9cc2-22ee7e377b00','Open vSwitch agent','neutron-openvswitch-agent','N/A','oc1.hkexpoc.com',1,'2015-08-19 12:43:14','2015-08-24 08:06:19','2015-08-28 14:00:28',NULL,'{\"in_distributed_mode\": false, \"arp_responder_enabled\": false, \"tunneling_ip\": \"192.168.251.211\", \"devices\": 0, \"l2_population\": false, \"tunnel_types\": [\"vxlan\"], \"enable_distributed_routing\": false, \"bridge_mappings\": {}}',0),('51c9f891-25ae-4ae6-9d1c-97b527ef2816','Open vSwitch agent','neutron-openvswitch-agent','N/A','oc4.hkexpoc.com',1,'2015-08-19 15:23:30','2015-08-28 14:24:39','2015-08-30 17:30:48',NULL,'{\"in_distributed_mode\": false, \"arp_responder_enabled\": false, \"tunneling_ip\": \"192.168.252.214\", \"devices\": 0, \"l2_population\": false, \"tunnel_types\": [\"vxlan\"], \"enable_distributed_routing\": false, \"bridge_mappings\": {}}',0),('5aba6909-6273-468b-9203-adb4afdc1b4c','Metadata agent','neutron-metadata-agent','N/A','controller1.hkexpoc.com',1,'2015-08-19 10:28:28','2015-08-30 16:07:31','2015-08-30 17:30:30',NULL,'{\"nova_metadata_ip\": \"osp-vip.hkexpoc.com\", \"nova_metadata_port\": 8775, \"metadata_proxy_socket\": \"/var/lib/neutron/metadata_proxy\"}',0),('6ab48eb5-4187-408d-8ab1-d1f64629ae93','Metadata agent','neutron-metadata-agent','N/A','controller2.hkexpoc.com',1,'2015-08-19 10:28:31','2015-08-30 01:14:57','2015-08-30 17:30:34',NULL,'{\"nova_metadata_ip\": \"osp-vip.hkexpoc.com\", \"nova_metadata_port\": 8775, \"metadata_proxy_socket\": \"/var/lib/neutron/metadata_proxy\"}',0),('7a5800a4-be5e-47dc-903b-a8bb41ff018c','Open vSwitch agent','neutron-openvswitch-agent','N/A','controller1.hkexpoc.com',1,'2015-08-19 10:29:28','2015-08-30 16:07:32','2015-08-30 17:30:32',NULL,'{\"in_distributed_mode\": false, \"arp_responder_enabled\": false, \"tunneling_ip\": \"192.168.251.31\", \"devices\": 1, \"l2_population\": false, \"tunnel_types\": [\"vxlan\"], \"enable_distributed_routing\": false, \"bridge_mappings\": {}}',0),('7e6cce87-b917-43ee-a40d-464f7b2284f8','Open vSwitch agent','neutron-openvswitch-agent','N/A','controller4.hkexpoc.com',1,'2015-08-19 10:29:10','2015-08-28 14:47:14','2015-08-30 17:30:48',NULL,'{\"in_distributed_mode\": false, \"arp_responder_enabled\": false, \"tunneling_ip\": \"192.168.252.36\", \"devices\": 1, \"l2_population\": false, \"tunnel_types\": [\"vxlan\"], \"enable_distributed_routing\": false, \"bridge_mappings\": {}}',0),('80fe96f8-7ee9-4b77-a654-237f027e4bc7','DHCP agent','neutron-dhcp-agent','dhcp_agent','controller4.hkexpoc.com',1,'2015-08-19 10:28:40','2015-08-28 14:47:14','2015-08-30 17:30:49',NULL,'{\"subnets\": 1, \"use_namespaces\": true, \"dhcp_lease_duration\": 86400, \"dhcp_driver\": \"neutron.agent.linux.dhcp.Dnsmasq\", \"networks\": 1, \"ports\": 2}',1),('8663dc6c-c218-413c-ab76-3bc99572ed18','L3 agent','neutron-l3-agent','l3_agent','controller4.hkexpoc.com',1,'2015-08-19 10:28:40','2015-08-28 14:47:14','2015-08-30 17:30:48',NULL,'{\"router_id\": \"\", \"agent_mode\": \"legacy\", \"gateway_external_network_id\": \"\", \"handle_internal_only_routers\": true, \"use_namespaces\": true, \"routers\": 0, \"interfaces\": 0, \"floating_ips\": 0, \"interface_driver\": \"neutron.agent.linux.interface.OVSInterfaceDriver\", \"external_network_bridge\": \"br-ex\", \"ex_gw_ports\": 0}',0),('9f2c5cfc-5da6-402a-8741-eecebe23afcf','Open vSwitch agent','neutron-openvswitch-agent','N/A','controller2.hkexpoc.com',1,'2015-08-19 10:28:33','2015-08-30 01:14:20','2015-08-30 17:30:51',NULL,'{\"in_distributed_mode\": false, \"arp_responder_enabled\": false, \"tunneling_ip\": \"192.168.251.34\", \"devices\": 0, \"l2_population\": false, \"tunnel_types\": [\"vxlan\"], \"enable_distributed_routing\": false, \"bridge_mappings\": {}}',0),('a8d24e1c-53e3-402b-bc83-2013d9bcd4b4','DHCP agent','neutron-dhcp-agent','dhcp_agent','controller2.hkexpoc.com',1,'2015-08-19 10:29:03','2015-08-30 01:14:59','2015-08-30 17:30:31',NULL,'{\"subnets\": 0, \"use_namespaces\": true, \"dhcp_lease_duration\": 86400, \"dhcp_driver\": \"neutron.agent.linux.dhcp.Dnsmasq\", \"networks\": 0, \"ports\": 0}',0),('ccd711c5-683b-4975-9fa9-fa25232a099e','L3 agent','neutron-l3-agent','l3_agent','controller3.hkexpoc.com',1,'2015-08-19 10:28:48','2015-08-28 14:44:07','2015-08-30 17:30:48',NULL,'{\"router_id\": \"\", \"agent_mode\": \"legacy\", \"gateway_external_network_id\": \"\", \"handle_internal_only_routers\": true, \"use_namespaces\": true, \"routers\": 0, \"interfaces\": 0, \"floating_ips\": 0, \"interface_driver\": \"neutron.agent.linux.interface.OVSInterfaceDriver\", \"external_network_bridge\": \"br-ex\", \"ex_gw_ports\": 0}',0),('cf6e91f6-30e7-4954-b77d-126a03727d0c','DHCP agent','neutron-dhcp-agent','dhcp_agent','controller3.hkexpoc.com',1,'2015-08-19 10:28:48','2015-08-28 14:44:07','2015-08-30 17:30:49',NULL,'{\"subnets\": 0, \"use_namespaces\": true, \"dhcp_lease_duration\": 86400, \"dhcp_driver\": \"neutron.agent.linux.dhcp.Dnsmasq\", \"networks\": 0, \"ports\": 0}',0),('dc2fdb6b-05d0-4105-9f72-08618d618802','Open vSwitch agent','neutron-openvswitch-agent','N/A','oc3.hkexpoc.com',1,'2015-08-19 12:47:49','2015-08-24 08:27:46','2015-08-28 14:15:58',NULL,'{\"in_distributed_mode\": false, \"arp_responder_enabled\": false, \"tunneling_ip\": \"192.168.252.211\", \"devices\": 0, \"l2_population\": false, \"tunnel_types\": [\"vxlan\"], \"enable_distributed_routing\": false, \"bridge_mappings\": {}}',0);
/*!40000 ALTER TABLE `agents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alembic_version`
--

DROP TABLE IF EXISTS `alembic_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alembic_version`
--

LOCK TABLES `alembic_version` WRITE;
/*!40000 ALTER TABLE `alembic_version` DISABLE KEYS */;
INSERT INTO `alembic_version` VALUES ('kilo');
/*!40000 ALTER TABLE `alembic_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `allowedaddresspairs`
--

DROP TABLE IF EXISTS `allowedaddresspairs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `allowedaddresspairs` (
  `port_id` varchar(36) NOT NULL,
  `mac_address` varchar(32) NOT NULL,
  `ip_address` varchar(64) NOT NULL,
  PRIMARY KEY (`port_id`,`mac_address`,`ip_address`),
  CONSTRAINT `allowedaddresspairs_ibfk_1` FOREIGN KEY (`port_id`) REFERENCES `ports` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allowedaddresspairs`
--

LOCK TABLES `allowedaddresspairs` WRITE;
/*!40000 ALTER TABLE `allowedaddresspairs` DISABLE KEYS */;
/*!40000 ALTER TABLE `allowedaddresspairs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arista_provisioned_nets`
--

DROP TABLE IF EXISTS `arista_provisioned_nets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arista_provisioned_nets` (
  `tenant_id` varchar(255) DEFAULT NULL,
  `id` varchar(36) NOT NULL,
  `network_id` varchar(36) DEFAULT NULL,
  `segmentation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_arista_provisioned_nets_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arista_provisioned_nets`
--

LOCK TABLES `arista_provisioned_nets` WRITE;
/*!40000 ALTER TABLE `arista_provisioned_nets` DISABLE KEYS */;
/*!40000 ALTER TABLE `arista_provisioned_nets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arista_provisioned_tenants`
--

DROP TABLE IF EXISTS `arista_provisioned_tenants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arista_provisioned_tenants` (
  `tenant_id` varchar(255) DEFAULT NULL,
  `id` varchar(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_arista_provisioned_tenants_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arista_provisioned_tenants`
--

LOCK TABLES `arista_provisioned_tenants` WRITE;
/*!40000 ALTER TABLE `arista_provisioned_tenants` DISABLE KEYS */;
/*!40000 ALTER TABLE `arista_provisioned_tenants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arista_provisioned_vms`
--

DROP TABLE IF EXISTS `arista_provisioned_vms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arista_provisioned_vms` (
  `tenant_id` varchar(255) DEFAULT NULL,
  `id` varchar(36) NOT NULL,
  `vm_id` varchar(255) DEFAULT NULL,
  `host_id` varchar(255) DEFAULT NULL,
  `port_id` varchar(36) DEFAULT NULL,
  `network_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_arista_provisioned_vms_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arista_provisioned_vms`
--

LOCK TABLES `arista_provisioned_vms` WRITE;
/*!40000 ALTER TABLE `arista_provisioned_vms` DISABLE KEYS */;
/*!40000 ALTER TABLE `arista_provisioned_vms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brocadenetworks`
--

DROP TABLE IF EXISTS `brocadenetworks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brocadenetworks` (
  `id` varchar(36) NOT NULL,
  `vlan` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brocadenetworks`
--

LOCK TABLES `brocadenetworks` WRITE;
/*!40000 ALTER TABLE `brocadenetworks` DISABLE KEYS */;
/*!40000 ALTER TABLE `brocadenetworks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brocadeports`
--

DROP TABLE IF EXISTS `brocadeports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brocadeports` (
  `port_id` varchar(36) NOT NULL DEFAULT '',
  `network_id` varchar(36) NOT NULL,
  `admin_state_up` tinyint(1) NOT NULL,
  `physical_interface` varchar(36) DEFAULT NULL,
  `vlan_id` varchar(36) DEFAULT NULL,
  `tenant_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`port_id`),
  KEY `network_id` (`network_id`),
  CONSTRAINT `brocadeports_ibfk_1` FOREIGN KEY (`network_id`) REFERENCES `brocadenetworks` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brocadeports`
--

LOCK TABLES `brocadeports` WRITE;
/*!40000 ALTER TABLE `brocadeports` DISABLE KEYS */;
/*!40000 ALTER TABLE `brocadeports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cisco_credentials`
--

DROP TABLE IF EXISTS `cisco_credentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cisco_credentials` (
  `credential_id` varchar(255) DEFAULT NULL,
  `credential_name` varchar(255) NOT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`credential_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cisco_credentials`
--

LOCK TABLES `cisco_credentials` WRITE;
/*!40000 ALTER TABLE `cisco_credentials` DISABLE KEYS */;
/*!40000 ALTER TABLE `cisco_credentials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cisco_csr_identifier_map`
--

DROP TABLE IF EXISTS `cisco_csr_identifier_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cisco_csr_identifier_map` (
  `tenant_id` varchar(255) DEFAULT NULL,
  `ipsec_site_conn_id` varchar(64) NOT NULL,
  `csr_tunnel_id` int(11) NOT NULL,
  `csr_ike_policy_id` int(11) NOT NULL,
  `csr_ipsec_policy_id` int(11) NOT NULL,
  PRIMARY KEY (`ipsec_site_conn_id`),
  CONSTRAINT `cisco_csr_identifier_map_ibfk_1` FOREIGN KEY (`ipsec_site_conn_id`) REFERENCES `ipsec_site_connections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cisco_csr_identifier_map`
--

LOCK TABLES `cisco_csr_identifier_map` WRITE;
/*!40000 ALTER TABLE `cisco_csr_identifier_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `cisco_csr_identifier_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cisco_hosting_devices`
--

DROP TABLE IF EXISTS `cisco_hosting_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cisco_hosting_devices` (
  `tenant_id` varchar(255) DEFAULT NULL,
  `id` varchar(36) NOT NULL,
  `complementary_id` varchar(36) DEFAULT NULL,
  `device_id` varchar(255) DEFAULT NULL,
  `admin_state_up` tinyint(1) NOT NULL,
  `management_port_id` varchar(36) DEFAULT NULL,
  `protocol_port` int(11) DEFAULT NULL,
  `cfg_agent_id` varchar(36) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `status` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cfg_agent_id` (`cfg_agent_id`),
  KEY `management_port_id` (`management_port_id`),
  KEY `ix_cisco_hosting_devices_tenant_id` (`tenant_id`),
  CONSTRAINT `cisco_hosting_devices_ibfk_1` FOREIGN KEY (`cfg_agent_id`) REFERENCES `agents` (`id`),
  CONSTRAINT `cisco_hosting_devices_ibfk_2` FOREIGN KEY (`management_port_id`) REFERENCES `ports` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cisco_hosting_devices`
--

LOCK TABLES `cisco_hosting_devices` WRITE;
/*!40000 ALTER TABLE `cisco_hosting_devices` DISABLE KEYS */;
/*!40000 ALTER TABLE `cisco_hosting_devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cisco_ml2_apic_contracts`
--

DROP TABLE IF EXISTS `cisco_ml2_apic_contracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cisco_ml2_apic_contracts` (
  `tenant_id` varchar(255) DEFAULT NULL,
  `router_id` varchar(64) NOT NULL,
  PRIMARY KEY (`router_id`),
  KEY `ix_cisco_ml2_apic_contracts_tenant_id` (`tenant_id`),
  CONSTRAINT `cisco_ml2_apic_contracts_ibfk_1` FOREIGN KEY (`router_id`) REFERENCES `routers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cisco_ml2_apic_contracts`
--

LOCK TABLES `cisco_ml2_apic_contracts` WRITE;
/*!40000 ALTER TABLE `cisco_ml2_apic_contracts` DISABLE KEYS */;
/*!40000 ALTER TABLE `cisco_ml2_apic_contracts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cisco_ml2_apic_host_links`
--

DROP TABLE IF EXISTS `cisco_ml2_apic_host_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cisco_ml2_apic_host_links` (
  `host` varchar(255) NOT NULL,
  `ifname` varchar(64) NOT NULL,
  `ifmac` varchar(32) DEFAULT NULL,
  `swid` varchar(32) NOT NULL,
  `module` varchar(32) NOT NULL,
  `port` varchar(32) NOT NULL,
  PRIMARY KEY (`host`,`ifname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cisco_ml2_apic_host_links`
--

LOCK TABLES `cisco_ml2_apic_host_links` WRITE;
/*!40000 ALTER TABLE `cisco_ml2_apic_host_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `cisco_ml2_apic_host_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cisco_ml2_apic_names`
--

DROP TABLE IF EXISTS `cisco_ml2_apic_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cisco_ml2_apic_names` (
  `neutron_id` varchar(36) NOT NULL,
  `neutron_type` varchar(32) NOT NULL,
  `apic_name` varchar(255) NOT NULL,
  PRIMARY KEY (`neutron_id`,`neutron_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cisco_ml2_apic_names`
--

LOCK TABLES `cisco_ml2_apic_names` WRITE;
/*!40000 ALTER TABLE `cisco_ml2_apic_names` DISABLE KEYS */;
/*!40000 ALTER TABLE `cisco_ml2_apic_names` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cisco_ml2_n1kv_network_bindings`
--

DROP TABLE IF EXISTS `cisco_ml2_n1kv_network_bindings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cisco_ml2_n1kv_network_bindings` (
  `network_id` varchar(36) NOT NULL,
  `network_type` varchar(32) NOT NULL,
  `segmentation_id` int(11) DEFAULT NULL,
  `profile_id` varchar(36) NOT NULL,
  PRIMARY KEY (`network_id`),
  KEY `profile_id` (`profile_id`),
  CONSTRAINT `cisco_ml2_n1kv_network_bindings_ibfk_1` FOREIGN KEY (`network_id`) REFERENCES `networks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cisco_ml2_n1kv_network_bindings_ibfk_2` FOREIGN KEY (`profile_id`) REFERENCES `cisco_ml2_n1kv_network_profiles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cisco_ml2_n1kv_network_bindings`
--

LOCK TABLES `cisco_ml2_n1kv_network_bindings` WRITE;
/*!40000 ALTER TABLE `cisco_ml2_n1kv_network_bindings` DISABLE KEYS */;
/*!40000 ALTER TABLE `cisco_ml2_n1kv_network_bindings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cisco_ml2_n1kv_network_profiles`
--

DROP TABLE IF EXISTS `cisco_ml2_n1kv_network_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cisco_ml2_n1kv_network_profiles` (
  `id` varchar(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `segment_type` enum('vlan','vxlan') NOT NULL,
  `segment_range` varchar(255) DEFAULT NULL,
  `multicast_ip_index` int(11) DEFAULT NULL,
  `multicast_ip_range` varchar(255) DEFAULT NULL,
  `sub_type` varchar(255) DEFAULT NULL,
  `physical_network` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cisco_ml2_n1kv_network_profiles`
--

LOCK TABLES `cisco_ml2_n1kv_network_profiles` WRITE;
/*!40000 ALTER TABLE `cisco_ml2_n1kv_network_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `cisco_ml2_n1kv_network_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cisco_ml2_n1kv_policy_profiles`
--

DROP TABLE IF EXISTS `cisco_ml2_n1kv_policy_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cisco_ml2_n1kv_policy_profiles` (
  `id` varchar(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `vsm_ip` varchar(16) NOT NULL,
  PRIMARY KEY (`id`,`vsm_ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cisco_ml2_n1kv_policy_profiles`
--

LOCK TABLES `cisco_ml2_n1kv_policy_profiles` WRITE;
/*!40000 ALTER TABLE `cisco_ml2_n1kv_policy_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `cisco_ml2_n1kv_policy_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cisco_ml2_n1kv_port_bindings`
--

DROP TABLE IF EXISTS `cisco_ml2_n1kv_port_bindings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cisco_ml2_n1kv_port_bindings` (
  `port_id` varchar(36) NOT NULL,
  `profile_id` varchar(36) NOT NULL,
  PRIMARY KEY (`port_id`),
  CONSTRAINT `cisco_ml2_n1kv_port_bindings_ibfk_1` FOREIGN KEY (`port_id`) REFERENCES `ports` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cisco_ml2_n1kv_port_bindings`
--

LOCK TABLES `cisco_ml2_n1kv_port_bindings` WRITE;
/*!40000 ALTER TABLE `cisco_ml2_n1kv_port_bindings` DISABLE KEYS */;
/*!40000 ALTER TABLE `cisco_ml2_n1kv_port_bindings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cisco_ml2_n1kv_profile_bindings`
--

DROP TABLE IF EXISTS `cisco_ml2_n1kv_profile_bindings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cisco_ml2_n1kv_profile_bindings` (
  `profile_type` enum('network','policy') DEFAULT NULL,
  `tenant_id` varchar(36) NOT NULL DEFAULT 'tenant_id_not_set',
  `profile_id` varchar(36) NOT NULL,
  PRIMARY KEY (`tenant_id`,`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cisco_ml2_n1kv_profile_bindings`
--

LOCK TABLES `cisco_ml2_n1kv_profile_bindings` WRITE;
/*!40000 ALTER TABLE `cisco_ml2_n1kv_profile_bindings` DISABLE KEYS */;
/*!40000 ALTER TABLE `cisco_ml2_n1kv_profile_bindings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cisco_ml2_n1kv_vlan_allocations`
--

DROP TABLE IF EXISTS `cisco_ml2_n1kv_vlan_allocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cisco_ml2_n1kv_vlan_allocations` (
  `physical_network` varchar(64) NOT NULL,
  `vlan_id` int(11) NOT NULL,
  `allocated` tinyint(1) NOT NULL,
  `network_profile_id` varchar(36) NOT NULL,
  PRIMARY KEY (`physical_network`,`vlan_id`),
  KEY `network_profile_id` (`network_profile_id`),
  CONSTRAINT `cisco_ml2_n1kv_vlan_allocations_ibfk_1` FOREIGN KEY (`network_profile_id`) REFERENCES `cisco_ml2_n1kv_network_profiles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cisco_ml2_n1kv_vlan_allocations`
--

LOCK TABLES `cisco_ml2_n1kv_vlan_allocations` WRITE;
/*!40000 ALTER TABLE `cisco_ml2_n1kv_vlan_allocations` DISABLE KEYS */;
/*!40000 ALTER TABLE `cisco_ml2_n1kv_vlan_allocations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cisco_ml2_n1kv_vxlan_allocations`
--

DROP TABLE IF EXISTS `cisco_ml2_n1kv_vxlan_allocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cisco_ml2_n1kv_vxlan_allocations` (
  `vxlan_id` int(11) NOT NULL,
  `allocated` tinyint(1) NOT NULL,
  `network_profile_id` varchar(36) NOT NULL,
  PRIMARY KEY (`vxlan_id`),
  KEY `network_profile_id` (`network_profile_id`),
  CONSTRAINT `cisco_ml2_n1kv_vxlan_allocations_ibfk_1` FOREIGN KEY (`network_profile_id`) REFERENCES `cisco_ml2_n1kv_network_profiles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cisco_ml2_n1kv_vxlan_allocations`
--

LOCK TABLES `cisco_ml2_n1kv_vxlan_allocations` WRITE;
/*!40000 ALTER TABLE `cisco_ml2_n1kv_vxlan_allocations` DISABLE KEYS */;
/*!40000 ALTER TABLE `cisco_ml2_n1kv_vxlan_allocations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cisco_ml2_nexus_nve`
--

DROP TABLE IF EXISTS `cisco_ml2_nexus_nve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cisco_ml2_nexus_nve` (
  `vni` int(11) NOT NULL AUTO_INCREMENT,
  `switch_ip` varchar(255) NOT NULL,
  `device_id` varchar(255) NOT NULL,
  `mcast_group` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`vni`,`switch_ip`,`device_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cisco_ml2_nexus_nve`
--

LOCK TABLES `cisco_ml2_nexus_nve` WRITE;
/*!40000 ALTER TABLE `cisco_ml2_nexus_nve` DISABLE KEYS */;
/*!40000 ALTER TABLE `cisco_ml2_nexus_nve` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cisco_ml2_nexusport_bindings`
--

DROP TABLE IF EXISTS `cisco_ml2_nexusport_bindings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cisco_ml2_nexusport_bindings` (
  `binding_id` int(11) NOT NULL AUTO_INCREMENT,
  `port_id` varchar(255) DEFAULT NULL,
  `vlan_id` int(11) NOT NULL,
  `switch_ip` varchar(255) DEFAULT NULL,
  `instance_id` varchar(255) DEFAULT NULL,
  `vni` int(11) DEFAULT NULL,
  `is_provider_vlan` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`binding_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cisco_ml2_nexusport_bindings`
--

LOCK TABLES `cisco_ml2_nexusport_bindings` WRITE;
/*!40000 ALTER TABLE `cisco_ml2_nexusport_bindings` DISABLE KEYS */;
/*!40000 ALTER TABLE `cisco_ml2_nexusport_bindings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cisco_n1kv_multi_segments`
--

DROP TABLE IF EXISTS `cisco_n1kv_multi_segments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cisco_n1kv_multi_segments` (
  `multi_segment_id` varchar(36) NOT NULL,
  `segment1_id` varchar(36) NOT NULL,
  `segment2_id` varchar(36) NOT NULL,
  `encap_profile_name` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`multi_segment_id`,`segment1_id`,`segment2_id`),
  CONSTRAINT `cisco_n1kv_multi_segments_ibfk_1` FOREIGN KEY (`multi_segment_id`) REFERENCES `networks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cisco_n1kv_multi_segments`
--

LOCK TABLES `cisco_n1kv_multi_segments` WRITE;
/*!40000 ALTER TABLE `cisco_n1kv_multi_segments` DISABLE KEYS */;
/*!40000 ALTER TABLE `cisco_n1kv_multi_segments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cisco_n1kv_network_bindings`
--

DROP TABLE IF EXISTS `cisco_n1kv_network_bindings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cisco_n1kv_network_bindings` (
  `network_id` varchar(36) NOT NULL,
  `network_type` varchar(32) NOT NULL,
  `physical_network` varchar(64) DEFAULT NULL,
  `segmentation_id` int(11) DEFAULT NULL,
  `multicast_ip` varchar(32) DEFAULT NULL,
  `profile_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`network_id`),
  KEY `profile_id` (`profile_id`),
  CONSTRAINT `cisco_n1kv_network_bindings_ibfk_1` FOREIGN KEY (`network_id`) REFERENCES `networks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cisco_n1kv_network_bindings_ibfk_2` FOREIGN KEY (`profile_id`) REFERENCES `cisco_network_profiles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cisco_n1kv_network_bindings`
--

LOCK TABLES `cisco_n1kv_network_bindings` WRITE;
/*!40000 ALTER TABLE `cisco_n1kv_network_bindings` DISABLE KEYS */;
/*!40000 ALTER TABLE `cisco_n1kv_network_bindings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cisco_n1kv_port_bindings`
--

DROP TABLE IF EXISTS `cisco_n1kv_port_bindings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cisco_n1kv_port_bindings` (
  `port_id` varchar(36) NOT NULL,
  `profile_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`port_id`),
  KEY `profile_id` (`profile_id`),
  CONSTRAINT `cisco_n1kv_port_bindings_ibfk_1` FOREIGN KEY (`port_id`) REFERENCES `ports` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cisco_n1kv_port_bindings_ibfk_2` FOREIGN KEY (`profile_id`) REFERENCES `cisco_policy_profiles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cisco_n1kv_port_bindings`
--

LOCK TABLES `cisco_n1kv_port_bindings` WRITE;
/*!40000 ALTER TABLE `cisco_n1kv_port_bindings` DISABLE KEYS */;
/*!40000 ALTER TABLE `cisco_n1kv_port_bindings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cisco_n1kv_profile_bindings`
--

DROP TABLE IF EXISTS `cisco_n1kv_profile_bindings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cisco_n1kv_profile_bindings` (
  `profile_type` enum('network','policy') DEFAULT NULL,
  `tenant_id` varchar(36) NOT NULL DEFAULT 'TENANT_ID_NOT_SET',
  `profile_id` varchar(36) NOT NULL,
  PRIMARY KEY (`tenant_id`,`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cisco_n1kv_profile_bindings`
--

LOCK TABLES `cisco_n1kv_profile_bindings` WRITE;
/*!40000 ALTER TABLE `cisco_n1kv_profile_bindings` DISABLE KEYS */;
/*!40000 ALTER TABLE `cisco_n1kv_profile_bindings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cisco_n1kv_trunk_segments`
--

DROP TABLE IF EXISTS `cisco_n1kv_trunk_segments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cisco_n1kv_trunk_segments` (
  `trunk_segment_id` varchar(36) NOT NULL,
  `segment_id` varchar(36) NOT NULL,
  `dot1qtag` varchar(36) NOT NULL,
  PRIMARY KEY (`trunk_segment_id`,`segment_id`,`dot1qtag`),
  CONSTRAINT `cisco_n1kv_trunk_segments_ibfk_1` FOREIGN KEY (`trunk_segment_id`) REFERENCES `networks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cisco_n1kv_trunk_segments`
--

LOCK TABLES `cisco_n1kv_trunk_segments` WRITE;
/*!40000 ALTER TABLE `cisco_n1kv_trunk_segments` DISABLE KEYS */;
/*!40000 ALTER TABLE `cisco_n1kv_trunk_segments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cisco_n1kv_vlan_allocations`
--

DROP TABLE IF EXISTS `cisco_n1kv_vlan_allocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cisco_n1kv_vlan_allocations` (
  `physical_network` varchar(64) NOT NULL,
  `vlan_id` int(11) NOT NULL,
  `allocated` tinyint(1) NOT NULL DEFAULT '0',
  `network_profile_id` varchar(36) NOT NULL,
  PRIMARY KEY (`physical_network`,`vlan_id`),
  KEY `cisco_n1kv_vlan_allocations_ibfk_1` (`network_profile_id`),
  CONSTRAINT `cisco_n1kv_vlan_allocations_ibfk_1` FOREIGN KEY (`network_profile_id`) REFERENCES `cisco_network_profiles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cisco_n1kv_vlan_allocations`
--

LOCK TABLES `cisco_n1kv_vlan_allocations` WRITE;
/*!40000 ALTER TABLE `cisco_n1kv_vlan_allocations` DISABLE KEYS */;
/*!40000 ALTER TABLE `cisco_n1kv_vlan_allocations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cisco_n1kv_vmnetworks`
--

DROP TABLE IF EXISTS `cisco_n1kv_vmnetworks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cisco_n1kv_vmnetworks` (
  `name` varchar(80) NOT NULL,
  `profile_id` varchar(36) DEFAULT NULL,
  `network_id` varchar(36) DEFAULT NULL,
  `port_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `profile_id` (`profile_id`),
  CONSTRAINT `cisco_n1kv_vmnetworks_ibfk_1` FOREIGN KEY (`profile_id`) REFERENCES `cisco_policy_profiles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cisco_n1kv_vmnetworks`
--

LOCK TABLES `cisco_n1kv_vmnetworks` WRITE;
/*!40000 ALTER TABLE `cisco_n1kv_vmnetworks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cisco_n1kv_vmnetworks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cisco_n1kv_vxlan_allocations`
--

DROP TABLE IF EXISTS `cisco_n1kv_vxlan_allocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cisco_n1kv_vxlan_allocations` (
  `vxlan_id` int(11) NOT NULL,
  `allocated` tinyint(1) NOT NULL DEFAULT '0',
  `network_profile_id` varchar(36) NOT NULL,
  PRIMARY KEY (`vxlan_id`),
  KEY `cisco_n1kv_vxlan_allocations_ibfk_1` (`network_profile_id`),
  CONSTRAINT `cisco_n1kv_vxlan_allocations_ibfk_1` FOREIGN KEY (`network_profile_id`) REFERENCES `cisco_network_profiles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cisco_n1kv_vxlan_allocations`
--

LOCK TABLES `cisco_n1kv_vxlan_allocations` WRITE;
/*!40000 ALTER TABLE `cisco_n1kv_vxlan_allocations` DISABLE KEYS */;
/*!40000 ALTER TABLE `cisco_n1kv_vxlan_allocations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cisco_network_profiles`
--

DROP TABLE IF EXISTS `cisco_network_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cisco_network_profiles` (
  `id` varchar(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `segment_type` enum('vlan','overlay','trunk','multi-segment') NOT NULL,
  `sub_type` varchar(255) DEFAULT NULL,
  `segment_range` varchar(255) DEFAULT NULL,
  `multicast_ip_index` int(11) DEFAULT '0',
  `multicast_ip_range` varchar(255) DEFAULT NULL,
  `physical_network` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cisco_network_profiles`
--

LOCK TABLES `cisco_network_profiles` WRITE;
/*!40000 ALTER TABLE `cisco_network_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `cisco_network_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cisco_policy_profiles`
--

DROP TABLE IF EXISTS `cisco_policy_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cisco_policy_profiles` (
  `id` varchar(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cisco_policy_profiles`
--

LOCK TABLES `cisco_policy_profiles` WRITE;
/*!40000 ALTER TABLE `cisco_policy_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `cisco_policy_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cisco_port_mappings`
--

DROP TABLE IF EXISTS `cisco_port_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cisco_port_mappings` (
  `logical_resource_id` varchar(36) NOT NULL,
  `logical_port_id` varchar(36) NOT NULL,
  `port_type` varchar(32) DEFAULT NULL,
  `network_type` varchar(32) DEFAULT NULL,
  `hosting_port_id` varchar(36) DEFAULT NULL,
  `segmentation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`logical_resource_id`,`logical_port_id`),
  KEY `hosting_port_id` (`hosting_port_id`),
  KEY `logical_port_id` (`logical_port_id`),
  CONSTRAINT `cisco_port_mappings_ibfk_1` FOREIGN KEY (`hosting_port_id`) REFERENCES `ports` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cisco_port_mappings_ibfk_2` FOREIGN KEY (`logical_port_id`) REFERENCES `ports` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cisco_port_mappings`
--

LOCK TABLES `cisco_port_mappings` WRITE;
/*!40000 ALTER TABLE `cisco_port_mappings` DISABLE KEYS */;
/*!40000 ALTER TABLE `cisco_port_mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cisco_provider_networks`
--

DROP TABLE IF EXISTS `cisco_provider_networks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cisco_provider_networks` (
  `network_id` varchar(36) NOT NULL,
  `network_type` varchar(255) NOT NULL,
  `segmentation_id` int(11) NOT NULL,
  PRIMARY KEY (`network_id`),
  CONSTRAINT `cisco_provider_networks_ibfk_1` FOREIGN KEY (`network_id`) REFERENCES `networks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cisco_provider_networks`
--

LOCK TABLES `cisco_provider_networks` WRITE;
/*!40000 ALTER TABLE `cisco_provider_networks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cisco_provider_networks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cisco_qos_policies`
--

DROP TABLE IF EXISTS `cisco_qos_policies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cisco_qos_policies` (
  `qos_id` varchar(255) DEFAULT NULL,
  `tenant_id` varchar(255) NOT NULL,
  `qos_name` varchar(255) NOT NULL,
  `qos_desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tenant_id`,`qos_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cisco_qos_policies`
--

LOCK TABLES `cisco_qos_policies` WRITE;
/*!40000 ALTER TABLE `cisco_qos_policies` DISABLE KEYS */;
/*!40000 ALTER TABLE `cisco_qos_policies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cisco_router_mappings`
--

DROP TABLE IF EXISTS `cisco_router_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cisco_router_mappings` (
  `router_id` varchar(36) NOT NULL,
  `auto_schedule` tinyint(1) NOT NULL,
  `hosting_device_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`router_id`),
  KEY `hosting_device_id` (`hosting_device_id`),
  CONSTRAINT `cisco_router_mappings_ibfk_1` FOREIGN KEY (`hosting_device_id`) REFERENCES `cisco_hosting_devices` (`id`) ON DELETE SET NULL,
  CONSTRAINT `cisco_router_mappings_ibfk_2` FOREIGN KEY (`router_id`) REFERENCES `routers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cisco_router_mappings`
--

LOCK TABLES `cisco_router_mappings` WRITE;
/*!40000 ALTER TABLE `cisco_router_mappings` DISABLE KEYS */;
/*!40000 ALTER TABLE `cisco_router_mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consistencyhashes`
--

DROP TABLE IF EXISTS `consistencyhashes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consistencyhashes` (
  `hash_id` varchar(255) NOT NULL,
  `hash` varchar(255) NOT NULL,
  PRIMARY KEY (`hash_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consistencyhashes`
--

LOCK TABLES `consistencyhashes` WRITE;
/*!40000 ALTER TABLE `consistencyhashes` DISABLE KEYS */;
/*!40000 ALTER TABLE `consistencyhashes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csnat_l3_agent_bindings`
--

DROP TABLE IF EXISTS `csnat_l3_agent_bindings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csnat_l3_agent_bindings` (
  `router_id` varchar(36) NOT NULL,
  `l3_agent_id` varchar(36) NOT NULL,
  `host_id` varchar(255) DEFAULT NULL,
  `csnat_gw_port_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`router_id`,`l3_agent_id`),
  KEY `csnat_l3_agent_bindings_ibfk_1` (`l3_agent_id`),
  KEY `csnat_l3_agent_bindings_ibfk_3` (`csnat_gw_port_id`),
  CONSTRAINT `csnat_l3_agent_bindings_ibfk_1` FOREIGN KEY (`l3_agent_id`) REFERENCES `agents` (`id`) ON DELETE CASCADE,
  CONSTRAINT `csnat_l3_agent_bindings_ibfk_2` FOREIGN KEY (`router_id`) REFERENCES `routers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `csnat_l3_agent_bindings_ibfk_3` FOREIGN KEY (`csnat_gw_port_id`) REFERENCES `ports` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csnat_l3_agent_bindings`
--

LOCK TABLES `csnat_l3_agent_bindings` WRITE;
/*!40000 ALTER TABLE `csnat_l3_agent_bindings` DISABLE KEYS */;
/*!40000 ALTER TABLE `csnat_l3_agent_bindings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_security_group`
--

DROP TABLE IF EXISTS `default_security_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_security_group` (
  `tenant_id` varchar(255) NOT NULL,
  `security_group_id` varchar(36) NOT NULL,
  PRIMARY KEY (`tenant_id`),
  KEY `security_group_id` (`security_group_id`),
  CONSTRAINT `default_security_group_ibfk_1` FOREIGN KEY (`security_group_id`) REFERENCES `securitygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_security_group`
--

LOCK TABLES `default_security_group` WRITE;
/*!40000 ALTER TABLE `default_security_group` DISABLE KEYS */;
INSERT INTO `default_security_group` VALUES ('f924c3bf43bb400a9852d6489705da5e','94c8fc5a-4b78-47db-92fd-2dd78c71975c'),('5b6cca8b0e464a399f723e7660be3290','9e0865e3-e36d-4acd-a9c8-255d531a8aba');
/*!40000 ALTER TABLE `default_security_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dnsnameservers`
--

DROP TABLE IF EXISTS `dnsnameservers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dnsnameservers` (
  `address` varchar(128) NOT NULL,
  `subnet_id` varchar(36) NOT NULL,
  PRIMARY KEY (`address`,`subnet_id`),
  KEY `subnet_id` (`subnet_id`),
  CONSTRAINT `dnsnameservers_ibfk_1` FOREIGN KEY (`subnet_id`) REFERENCES `subnets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dnsnameservers`
--

LOCK TABLES `dnsnameservers` WRITE;
/*!40000 ALTER TABLE `dnsnameservers` DISABLE KEYS */;
/*!40000 ALTER TABLE `dnsnameservers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dvr_host_macs`
--

DROP TABLE IF EXISTS `dvr_host_macs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dvr_host_macs` (
  `host` varchar(255) NOT NULL,
  `mac_address` varchar(32) NOT NULL,
  PRIMARY KEY (`host`),
  UNIQUE KEY `mac_address` (`mac_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dvr_host_macs`
--

LOCK TABLES `dvr_host_macs` WRITE;
/*!40000 ALTER TABLE `dvr_host_macs` DISABLE KEYS */;
/*!40000 ALTER TABLE `dvr_host_macs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `embrane_pool_port`
--

DROP TABLE IF EXISTS `embrane_pool_port`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `embrane_pool_port` (
  `pool_id` varchar(36) NOT NULL,
  `port_id` varchar(36) NOT NULL,
  PRIMARY KEY (`pool_id`),
  KEY `embrane_pool_port_ibfk_2` (`port_id`),
  CONSTRAINT `embrane_pool_port_ibfk_1` FOREIGN KEY (`pool_id`) REFERENCES `pools` (`id`),
  CONSTRAINT `embrane_pool_port_ibfk_2` FOREIGN KEY (`port_id`) REFERENCES `ports` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `embrane_pool_port`
--

LOCK TABLES `embrane_pool_port` WRITE;
/*!40000 ALTER TABLE `embrane_pool_port` DISABLE KEYS */;
/*!40000 ALTER TABLE `embrane_pool_port` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `externalnetworks`
--

DROP TABLE IF EXISTS `externalnetworks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `externalnetworks` (
  `network_id` varchar(36) NOT NULL,
  PRIMARY KEY (`network_id`),
  CONSTRAINT `externalnetworks_ibfk_1` FOREIGN KEY (`network_id`) REFERENCES `networks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `externalnetworks`
--

LOCK TABLES `externalnetworks` WRITE;
/*!40000 ALTER TABLE `externalnetworks` DISABLE KEYS */;
/*!40000 ALTER TABLE `externalnetworks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extradhcpopts`
--

DROP TABLE IF EXISTS `extradhcpopts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extradhcpopts` (
  `id` varchar(36) NOT NULL,
  `port_id` varchar(36) NOT NULL,
  `opt_name` varchar(64) NOT NULL,
  `opt_value` varchar(255) NOT NULL,
  `ip_version` int(11) NOT NULL DEFAULT '4',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_extradhcpopts0portid0optname0ipversion` (`port_id`,`opt_name`,`ip_version`),
  CONSTRAINT `extradhcpopts_ibfk_1` FOREIGN KEY (`port_id`) REFERENCES `ports` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extradhcpopts`
--

LOCK TABLES `extradhcpopts` WRITE;
/*!40000 ALTER TABLE `extradhcpopts` DISABLE KEYS */;
/*!40000 ALTER TABLE `extradhcpopts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `firewall_policies`
--

DROP TABLE IF EXISTS `firewall_policies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `firewall_policies` (
  `tenant_id` varchar(255) DEFAULT NULL,
  `id` varchar(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `shared` tinyint(1) DEFAULT NULL,
  `audited` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `firewall_policies`
--

LOCK TABLES `firewall_policies` WRITE;
/*!40000 ALTER TABLE `firewall_policies` DISABLE KEYS */;
/*!40000 ALTER TABLE `firewall_policies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `firewall_rules`
--

DROP TABLE IF EXISTS `firewall_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `firewall_rules` (
  `tenant_id` varchar(255) DEFAULT NULL,
  `id` varchar(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `firewall_policy_id` varchar(36) DEFAULT NULL,
  `shared` tinyint(1) DEFAULT NULL,
  `protocol` varchar(40) DEFAULT NULL,
  `ip_version` int(11) NOT NULL,
  `source_ip_address` varchar(46) DEFAULT NULL,
  `destination_ip_address` varchar(46) DEFAULT NULL,
  `source_port_range_min` int(11) DEFAULT NULL,
  `source_port_range_max` int(11) DEFAULT NULL,
  `destination_port_range_min` int(11) DEFAULT NULL,
  `destination_port_range_max` int(11) DEFAULT NULL,
  `action` enum('allow','deny') DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `firewall_rules_ibfk_1` (`firewall_policy_id`),
  CONSTRAINT `firewall_rules_ibfk_1` FOREIGN KEY (`firewall_policy_id`) REFERENCES `firewall_policies` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `firewall_rules`
--

LOCK TABLES `firewall_rules` WRITE;
/*!40000 ALTER TABLE `firewall_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `firewall_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `firewalls`
--

DROP TABLE IF EXISTS `firewalls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `firewalls` (
  `tenant_id` varchar(255) DEFAULT NULL,
  `id` varchar(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `shared` tinyint(1) DEFAULT NULL,
  `admin_state_up` tinyint(1) DEFAULT NULL,
  `status` varchar(16) DEFAULT NULL,
  `firewall_policy_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `firewalls_ibfk_1` (`firewall_policy_id`),
  CONSTRAINT `firewalls_ibfk_1` FOREIGN KEY (`firewall_policy_id`) REFERENCES `firewall_policies` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `firewalls`
--

LOCK TABLES `firewalls` WRITE;
/*!40000 ALTER TABLE `firewalls` DISABLE KEYS */;
/*!40000 ALTER TABLE `firewalls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `floatingips`
--

DROP TABLE IF EXISTS `floatingips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `floatingips` (
  `tenant_id` varchar(255) DEFAULT NULL,
  `id` varchar(36) NOT NULL,
  `floating_ip_address` varchar(64) NOT NULL,
  `floating_network_id` varchar(36) NOT NULL,
  `floating_port_id` varchar(36) NOT NULL,
  `fixed_port_id` varchar(36) DEFAULT NULL,
  `fixed_ip_address` varchar(64) DEFAULT NULL,
  `router_id` varchar(36) DEFAULT NULL,
  `last_known_router_id` varchar(36) DEFAULT NULL,
  `status` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fixed_port_id` (`fixed_port_id`),
  KEY `router_id` (`router_id`),
  KEY `ix_floatingips_tenant_id` (`tenant_id`),
  KEY `floating_port_id` (`floating_port_id`),
  CONSTRAINT `floatingips_ibfk_1` FOREIGN KEY (`fixed_port_id`) REFERENCES `ports` (`id`),
  CONSTRAINT `floatingips_ibfk_3` FOREIGN KEY (`router_id`) REFERENCES `routers` (`id`),
  CONSTRAINT `floatingips_ibfk_4` FOREIGN KEY (`floating_port_id`) REFERENCES `ports` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `floatingips`
--

LOCK TABLES `floatingips` WRITE;
/*!40000 ALTER TABLE `floatingips` DISABLE KEYS */;
/*!40000 ALTER TABLE `floatingips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ha_router_agent_port_bindings`
--

DROP TABLE IF EXISTS `ha_router_agent_port_bindings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ha_router_agent_port_bindings` (
  `port_id` varchar(36) NOT NULL,
  `router_id` varchar(36) NOT NULL,
  `l3_agent_id` varchar(36) DEFAULT NULL,
  `state` enum('active','standby') DEFAULT 'standby',
  PRIMARY KEY (`port_id`),
  KEY `router_id` (`router_id`),
  KEY `l3_agent_id` (`l3_agent_id`),
  CONSTRAINT `ha_router_agent_port_bindings_ibfk_1` FOREIGN KEY (`port_id`) REFERENCES `ports` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ha_router_agent_port_bindings_ibfk_2` FOREIGN KEY (`router_id`) REFERENCES `routers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ha_router_agent_port_bindings_ibfk_3` FOREIGN KEY (`l3_agent_id`) REFERENCES `agents` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ha_router_agent_port_bindings`
--

LOCK TABLES `ha_router_agent_port_bindings` WRITE;
/*!40000 ALTER TABLE `ha_router_agent_port_bindings` DISABLE KEYS */;
/*!40000 ALTER TABLE `ha_router_agent_port_bindings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ha_router_networks`
--

DROP TABLE IF EXISTS `ha_router_networks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ha_router_networks` (
  `tenant_id` varchar(255) NOT NULL,
  `network_id` varchar(36) NOT NULL,
  PRIMARY KEY (`tenant_id`,`network_id`),
  KEY `network_id` (`network_id`),
  CONSTRAINT `ha_router_networks_ibfk_1` FOREIGN KEY (`network_id`) REFERENCES `networks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ha_router_networks`
--

LOCK TABLES `ha_router_networks` WRITE;
/*!40000 ALTER TABLE `ha_router_networks` DISABLE KEYS */;
/*!40000 ALTER TABLE `ha_router_networks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ha_router_vrid_allocations`
--

DROP TABLE IF EXISTS `ha_router_vrid_allocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ha_router_vrid_allocations` (
  `network_id` varchar(36) NOT NULL,
  `vr_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`network_id`,`vr_id`),
  KEY `idx_autoinc_vr_id` (`vr_id`),
  CONSTRAINT `ha_router_vrid_allocations_ibfk_1` FOREIGN KEY (`network_id`) REFERENCES `networks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ha_router_vrid_allocations`
--

LOCK TABLES `ha_router_vrid_allocations` WRITE;
/*!40000 ALTER TABLE `ha_router_vrid_allocations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ha_router_vrid_allocations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `healthmonitors`
--

DROP TABLE IF EXISTS `healthmonitors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `healthmonitors` (
  `tenant_id` varchar(255) DEFAULT NULL,
  `id` varchar(36) NOT NULL,
  `type` enum('PING','TCP','HTTP','HTTPS') NOT NULL,
  `delay` int(11) NOT NULL,
  `timeout` int(11) NOT NULL,
  `max_retries` int(11) NOT NULL,
  `http_method` varchar(16) DEFAULT NULL,
  `url_path` varchar(255) DEFAULT NULL,
  `expected_codes` varchar(64) DEFAULT NULL,
  `admin_state_up` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `healthmonitors`
--

LOCK TABLES `healthmonitors` WRITE;
/*!40000 ALTER TABLE `healthmonitors` DISABLE KEYS */;
/*!40000 ALTER TABLE `healthmonitors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ikepolicies`
--

DROP TABLE IF EXISTS `ikepolicies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ikepolicies` (
  `tenant_id` varchar(255) DEFAULT NULL,
  `id` varchar(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `auth_algorithm` enum('sha1') NOT NULL,
  `encryption_algorithm` enum('3des','aes-128','aes-256','aes-192') NOT NULL,
  `phase1_negotiation_mode` enum('main') NOT NULL,
  `lifetime_units` enum('seconds','kilobytes') NOT NULL,
  `lifetime_value` int(11) NOT NULL,
  `ike_version` enum('v1','v2') NOT NULL,
  `pfs` enum('group2','group5','group14') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ikepolicies`
--

LOCK TABLES `ikepolicies` WRITE;
/*!40000 ALTER TABLE `ikepolicies` DISABLE KEYS */;
/*!40000 ALTER TABLE `ikepolicies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipallocationpools`
--

DROP TABLE IF EXISTS `ipallocationpools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ipallocationpools` (
  `id` varchar(36) NOT NULL,
  `subnet_id` varchar(36) DEFAULT NULL,
  `first_ip` varchar(64) NOT NULL,
  `last_ip` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subnet_id` (`subnet_id`),
  CONSTRAINT `ipallocationpools_ibfk_1` FOREIGN KEY (`subnet_id`) REFERENCES `subnets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipallocationpools`
--

LOCK TABLES `ipallocationpools` WRITE;
/*!40000 ALTER TABLE `ipallocationpools` DISABLE KEYS */;
INSERT INTO `ipallocationpools` VALUES ('8ecc4ad4-699e-4f3a-a476-cbfc8c0330de','d8532411-2794-4491-9553-5235e11abdc5','11.11.11.2','11.11.11.254');
/*!40000 ALTER TABLE `ipallocationpools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipallocations`
--

DROP TABLE IF EXISTS `ipallocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ipallocations` (
  `port_id` varchar(36) DEFAULT NULL,
  `ip_address` varchar(64) NOT NULL,
  `subnet_id` varchar(36) NOT NULL,
  `network_id` varchar(36) NOT NULL,
  PRIMARY KEY (`ip_address`,`subnet_id`,`network_id`),
  KEY `network_id` (`network_id`),
  KEY `port_id` (`port_id`),
  KEY `subnet_id` (`subnet_id`),
  CONSTRAINT `ipallocations_ibfk_1` FOREIGN KEY (`network_id`) REFERENCES `networks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ipallocations_ibfk_2` FOREIGN KEY (`port_id`) REFERENCES `ports` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ipallocations_ibfk_3` FOREIGN KEY (`subnet_id`) REFERENCES `subnets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipallocations`
--

LOCK TABLES `ipallocations` WRITE;
/*!40000 ALTER TABLE `ipallocations` DISABLE KEYS */;
INSERT INTO `ipallocations` VALUES ('218faf89-994e-4421-a6fd-91b11be1f672','11.11.11.4','d8532411-2794-4491-9553-5235e11abdc5','d815cb65-a06f-4afa-a8b0-4b1c0e569316'),('701e2ea9-188d-43ce-a336-d3e6c29cf775','11.11.11.2','d8532411-2794-4491-9553-5235e11abdc5','d815cb65-a06f-4afa-a8b0-4b1c0e569316');
/*!40000 ALTER TABLE `ipallocations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipavailabilityranges`
--

DROP TABLE IF EXISTS `ipavailabilityranges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ipavailabilityranges` (
  `allocation_pool_id` varchar(36) NOT NULL,
  `first_ip` varchar(64) NOT NULL,
  `last_ip` varchar(64) NOT NULL,
  PRIMARY KEY (`allocation_pool_id`,`first_ip`,`last_ip`),
  UNIQUE KEY `uniq_ipavailabilityranges0first_ip0allocation_pool_id` (`first_ip`,`allocation_pool_id`),
  UNIQUE KEY `uniq_ipavailabilityranges0last_ip0allocation_pool_id` (`last_ip`,`allocation_pool_id`),
  CONSTRAINT `ipavailabilityranges_ibfk_1` FOREIGN KEY (`allocation_pool_id`) REFERENCES `ipallocationpools` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipavailabilityranges`
--

LOCK TABLES `ipavailabilityranges` WRITE;
/*!40000 ALTER TABLE `ipavailabilityranges` DISABLE KEYS */;
INSERT INTO `ipavailabilityranges` VALUES ('8ecc4ad4-699e-4f3a-a476-cbfc8c0330de','11.11.11.5','11.11.11.254');
/*!40000 ALTER TABLE `ipavailabilityranges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipsec_site_connections`
--

DROP TABLE IF EXISTS `ipsec_site_connections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ipsec_site_connections` (
  `tenant_id` varchar(255) DEFAULT NULL,
  `id` varchar(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `peer_address` varchar(255) NOT NULL,
  `peer_id` varchar(255) NOT NULL,
  `route_mode` varchar(8) NOT NULL,
  `mtu` int(11) NOT NULL,
  `initiator` enum('bi-directional','response-only') NOT NULL,
  `auth_mode` varchar(16) NOT NULL,
  `psk` varchar(255) NOT NULL,
  `dpd_action` enum('hold','clear','restart','disabled','restart-by-peer') NOT NULL,
  `dpd_interval` int(11) NOT NULL,
  `dpd_timeout` int(11) NOT NULL,
  `status` varchar(16) NOT NULL,
  `admin_state_up` tinyint(1) NOT NULL,
  `vpnservice_id` varchar(36) NOT NULL,
  `ipsecpolicy_id` varchar(36) NOT NULL,
  `ikepolicy_id` varchar(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `vpnservice_id` (`vpnservice_id`),
  KEY `ipsecpolicy_id` (`ipsecpolicy_id`),
  KEY `ikepolicy_id` (`ikepolicy_id`),
  CONSTRAINT `ipsec_site_connections_ibfk_1` FOREIGN KEY (`vpnservice_id`) REFERENCES `vpnservices` (`id`),
  CONSTRAINT `ipsec_site_connections_ibfk_2` FOREIGN KEY (`ipsecpolicy_id`) REFERENCES `ipsecpolicies` (`id`),
  CONSTRAINT `ipsec_site_connections_ibfk_3` FOREIGN KEY (`ikepolicy_id`) REFERENCES `ikepolicies` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipsec_site_connections`
--

LOCK TABLES `ipsec_site_connections` WRITE;
/*!40000 ALTER TABLE `ipsec_site_connections` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipsec_site_connections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipsecpeercidrs`
--

DROP TABLE IF EXISTS `ipsecpeercidrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ipsecpeercidrs` (
  `cidr` varchar(32) NOT NULL,
  `ipsec_site_connection_id` varchar(36) NOT NULL,
  PRIMARY KEY (`cidr`,`ipsec_site_connection_id`),
  KEY `ipsec_site_connection_id` (`ipsec_site_connection_id`),
  CONSTRAINT `ipsecpeercidrs_ibfk_1` FOREIGN KEY (`ipsec_site_connection_id`) REFERENCES `ipsec_site_connections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipsecpeercidrs`
--

LOCK TABLES `ipsecpeercidrs` WRITE;
/*!40000 ALTER TABLE `ipsecpeercidrs` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipsecpeercidrs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipsecpolicies`
--

DROP TABLE IF EXISTS `ipsecpolicies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ipsecpolicies` (
  `tenant_id` varchar(255) DEFAULT NULL,
  `id` varchar(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `transform_protocol` enum('esp','ah','ah-esp') NOT NULL,
  `auth_algorithm` enum('sha1') NOT NULL,
  `encryption_algorithm` enum('3des','aes-128','aes-256','aes-192') NOT NULL,
  `encapsulation_mode` enum('tunnel','transport') NOT NULL,
  `lifetime_units` enum('seconds','kilobytes') NOT NULL,
  `lifetime_value` int(11) NOT NULL,
  `pfs` enum('group2','group5','group14') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipsecpolicies`
--

LOCK TABLES `ipsecpolicies` WRITE;
/*!40000 ALTER TABLE `ipsecpolicies` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipsecpolicies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsn`
--

DROP TABLE IF EXISTS `lsn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsn` (
  `net_id` varchar(36) NOT NULL,
  `lsn_id` varchar(36) NOT NULL,
  PRIMARY KEY (`lsn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsn`
--

LOCK TABLES `lsn` WRITE;
/*!40000 ALTER TABLE `lsn` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsn_port`
--

DROP TABLE IF EXISTS `lsn_port`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsn_port` (
  `lsn_port_id` varchar(36) NOT NULL,
  `lsn_id` varchar(36) NOT NULL,
  `sub_id` varchar(36) NOT NULL,
  `mac_addr` varchar(32) NOT NULL,
  PRIMARY KEY (`lsn_port_id`),
  UNIQUE KEY `sub_id` (`sub_id`),
  UNIQUE KEY `mac_addr` (`mac_addr`),
  KEY `lsn_id` (`lsn_id`),
  CONSTRAINT `lsn_port_ibfk_1` FOREIGN KEY (`lsn_id`) REFERENCES `lsn` (`lsn_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsn_port`
--

LOCK TABLES `lsn_port` WRITE;
/*!40000 ALTER TABLE `lsn_port` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsn_port` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maclearningstates`
--

DROP TABLE IF EXISTS `maclearningstates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maclearningstates` (
  `port_id` varchar(36) NOT NULL,
  `mac_learning_enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`port_id`),
  CONSTRAINT `maclearningstates_ibfk_1` FOREIGN KEY (`port_id`) REFERENCES `ports` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maclearningstates`
--

LOCK TABLES `maclearningstates` WRITE;
/*!40000 ALTER TABLE `maclearningstates` DISABLE KEYS */;
/*!40000 ALTER TABLE `maclearningstates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `members` (
  `tenant_id` varchar(255) DEFAULT NULL,
  `id` varchar(36) NOT NULL,
  `status` varchar(16) NOT NULL,
  `status_description` varchar(255) DEFAULT NULL,
  `pool_id` varchar(36) NOT NULL,
  `address` varchar(64) NOT NULL,
  `protocol_port` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  `admin_state_up` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_member0pool_id0address0port` (`pool_id`,`address`,`protocol_port`),
  CONSTRAINT `members_ibfk_1` FOREIGN KEY (`pool_id`) REFERENCES `pools` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meteringlabelrules`
--

DROP TABLE IF EXISTS `meteringlabelrules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meteringlabelrules` (
  `id` varchar(36) NOT NULL,
  `direction` enum('ingress','egress') DEFAULT NULL,
  `remote_ip_prefix` varchar(64) DEFAULT NULL,
  `metering_label_id` varchar(36) NOT NULL,
  `excluded` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `metering_label_id` (`metering_label_id`),
  CONSTRAINT `meteringlabelrules_ibfk_1` FOREIGN KEY (`metering_label_id`) REFERENCES `meteringlabels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meteringlabelrules`
--

LOCK TABLES `meteringlabelrules` WRITE;
/*!40000 ALTER TABLE `meteringlabelrules` DISABLE KEYS */;
/*!40000 ALTER TABLE `meteringlabelrules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meteringlabels`
--

DROP TABLE IF EXISTS `meteringlabels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meteringlabels` (
  `tenant_id` varchar(255) DEFAULT NULL,
  `id` varchar(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `shared` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ix_meteringlabels_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meteringlabels`
--

LOCK TABLES `meteringlabels` WRITE;
/*!40000 ALTER TABLE `meteringlabels` DISABLE KEYS */;
/*!40000 ALTER TABLE `meteringlabels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ml2_brocadenetworks`
--

DROP TABLE IF EXISTS `ml2_brocadenetworks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ml2_brocadenetworks` (
  `id` varchar(36) NOT NULL,
  `vlan` varchar(10) DEFAULT NULL,
  `segment_id` varchar(36) DEFAULT NULL,
  `network_type` varchar(10) DEFAULT NULL,
  `tenant_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_ml2_brocadenetworks_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ml2_brocadenetworks`
--

LOCK TABLES `ml2_brocadenetworks` WRITE;
/*!40000 ALTER TABLE `ml2_brocadenetworks` DISABLE KEYS */;
/*!40000 ALTER TABLE `ml2_brocadenetworks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ml2_brocadeports`
--

DROP TABLE IF EXISTS `ml2_brocadeports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ml2_brocadeports` (
  `id` varchar(36) NOT NULL,
  `network_id` varchar(36) NOT NULL,
  `admin_state_up` tinyint(1) NOT NULL,
  `physical_interface` varchar(36) DEFAULT NULL,
  `vlan_id` varchar(36) DEFAULT NULL,
  `tenant_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `network_id` (`network_id`),
  KEY `ix_ml2_brocadeports_tenant_id` (`tenant_id`),
  CONSTRAINT `ml2_brocadeports_ibfk_1` FOREIGN KEY (`network_id`) REFERENCES `ml2_brocadenetworks` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ml2_brocadeports`
--

LOCK TABLES `ml2_brocadeports` WRITE;
/*!40000 ALTER TABLE `ml2_brocadeports` DISABLE KEYS */;
/*!40000 ALTER TABLE `ml2_brocadeports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ml2_dvr_port_bindings`
--

DROP TABLE IF EXISTS `ml2_dvr_port_bindings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ml2_dvr_port_bindings` (
  `port_id` varchar(36) NOT NULL,
  `host` varchar(255) NOT NULL,
  `router_id` varchar(36) DEFAULT NULL,
  `vif_type` varchar(64) NOT NULL,
  `vif_details` varchar(4095) NOT NULL DEFAULT '',
  `vnic_type` varchar(64) NOT NULL DEFAULT 'normal',
  `profile` varchar(4095) NOT NULL DEFAULT '',
  `status` varchar(16) NOT NULL,
  PRIMARY KEY (`port_id`,`host`),
  CONSTRAINT `ml2_dvr_port_bindings_ibfk_1` FOREIGN KEY (`port_id`) REFERENCES `ports` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ml2_dvr_port_bindings`
--

LOCK TABLES `ml2_dvr_port_bindings` WRITE;
/*!40000 ALTER TABLE `ml2_dvr_port_bindings` DISABLE KEYS */;
/*!40000 ALTER TABLE `ml2_dvr_port_bindings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ml2_flat_allocations`
--

DROP TABLE IF EXISTS `ml2_flat_allocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ml2_flat_allocations` (
  `physical_network` varchar(64) NOT NULL,
  PRIMARY KEY (`physical_network`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ml2_flat_allocations`
--

LOCK TABLES `ml2_flat_allocations` WRITE;
/*!40000 ALTER TABLE `ml2_flat_allocations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ml2_flat_allocations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ml2_gre_allocations`
--

DROP TABLE IF EXISTS `ml2_gre_allocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ml2_gre_allocations` (
  `gre_id` int(11) NOT NULL,
  `allocated` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`gre_id`),
  KEY `ix_ml2_gre_allocations_allocated` (`allocated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ml2_gre_allocations`
--

LOCK TABLES `ml2_gre_allocations` WRITE;
/*!40000 ALTER TABLE `ml2_gre_allocations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ml2_gre_allocations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ml2_gre_endpoints`
--

DROP TABLE IF EXISTS `ml2_gre_endpoints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ml2_gre_endpoints` (
  `ip_address` varchar(64) NOT NULL,
  `host` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ip_address`),
  UNIQUE KEY `unique_ml2_gre_endpoints0host` (`host`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ml2_gre_endpoints`
--

LOCK TABLES `ml2_gre_endpoints` WRITE;
/*!40000 ALTER TABLE `ml2_gre_endpoints` DISABLE KEYS */;
/*!40000 ALTER TABLE `ml2_gre_endpoints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ml2_network_segments`
--

DROP TABLE IF EXISTS `ml2_network_segments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ml2_network_segments` (
  `id` varchar(36) NOT NULL,
  `network_id` varchar(36) NOT NULL,
  `network_type` varchar(32) NOT NULL,
  `physical_network` varchar(64) DEFAULT NULL,
  `segmentation_id` int(11) DEFAULT NULL,
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  `segment_index` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `network_id` (`network_id`),
  CONSTRAINT `ml2_network_segments_ibfk_1` FOREIGN KEY (`network_id`) REFERENCES `networks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ml2_network_segments`
--

LOCK TABLES `ml2_network_segments` WRITE;
/*!40000 ALTER TABLE `ml2_network_segments` DISABLE KEYS */;
INSERT INTO `ml2_network_segments` VALUES ('e2d995d5-5057-4f7f-b3af-3ebdc391c2fa','d815cb65-a06f-4afa-a8b0-4b1c0e569316','vxlan',NULL,10,0,0);
/*!40000 ALTER TABLE `ml2_network_segments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ml2_nexus_vxlan_allocations`
--

DROP TABLE IF EXISTS `ml2_nexus_vxlan_allocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ml2_nexus_vxlan_allocations` (
  `vxlan_vni` int(11) NOT NULL,
  `allocated` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`vxlan_vni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ml2_nexus_vxlan_allocations`
--

LOCK TABLES `ml2_nexus_vxlan_allocations` WRITE;
/*!40000 ALTER TABLE `ml2_nexus_vxlan_allocations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ml2_nexus_vxlan_allocations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ml2_nexus_vxlan_mcast_groups`
--

DROP TABLE IF EXISTS `ml2_nexus_vxlan_mcast_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ml2_nexus_vxlan_mcast_groups` (
  `id` varchar(36) NOT NULL,
  `mcast_group` varchar(64) NOT NULL,
  `associated_vni` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `associated_vni` (`associated_vni`),
  CONSTRAINT `ml2_nexus_vxlan_mcast_groups_ibfk_1` FOREIGN KEY (`associated_vni`) REFERENCES `ml2_nexus_vxlan_allocations` (`vxlan_vni`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ml2_nexus_vxlan_mcast_groups`
--

LOCK TABLES `ml2_nexus_vxlan_mcast_groups` WRITE;
/*!40000 ALTER TABLE `ml2_nexus_vxlan_mcast_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `ml2_nexus_vxlan_mcast_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ml2_port_binding_levels`
--

DROP TABLE IF EXISTS `ml2_port_binding_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ml2_port_binding_levels` (
  `port_id` varchar(36) NOT NULL,
  `host` varchar(255) NOT NULL,
  `level` int(11) NOT NULL,
  `driver` varchar(64) DEFAULT NULL,
  `segment_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`port_id`,`host`,`level`),
  KEY `segment_id` (`segment_id`),
  CONSTRAINT `ml2_port_binding_levels_ibfk_1` FOREIGN KEY (`port_id`) REFERENCES `ports` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ml2_port_binding_levels_ibfk_2` FOREIGN KEY (`segment_id`) REFERENCES `ml2_network_segments` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ml2_port_binding_levels`
--

LOCK TABLES `ml2_port_binding_levels` WRITE;
/*!40000 ALTER TABLE `ml2_port_binding_levels` DISABLE KEYS */;
INSERT INTO `ml2_port_binding_levels` VALUES ('701e2ea9-188d-43ce-a336-d3e6c29cf775','controller4.hkexpoc.com',0,'openvswitch','e2d995d5-5057-4f7f-b3af-3ebdc391c2fa');
/*!40000 ALTER TABLE `ml2_port_binding_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ml2_port_bindings`
--

DROP TABLE IF EXISTS `ml2_port_bindings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ml2_port_bindings` (
  `port_id` varchar(36) NOT NULL,
  `host` varchar(255) NOT NULL DEFAULT '',
  `vif_type` varchar(64) NOT NULL,
  `vnic_type` varchar(64) NOT NULL DEFAULT 'normal',
  `vif_details` varchar(4095) NOT NULL DEFAULT '',
  `profile` varchar(4095) NOT NULL DEFAULT '',
  PRIMARY KEY (`port_id`),
  CONSTRAINT `ml2_port_bindings_ibfk_1` FOREIGN KEY (`port_id`) REFERENCES `ports` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ml2_port_bindings`
--

LOCK TABLES `ml2_port_bindings` WRITE;
/*!40000 ALTER TABLE `ml2_port_bindings` DISABLE KEYS */;
INSERT INTO `ml2_port_bindings` VALUES ('218faf89-994e-4421-a6fd-91b11be1f672','controller2.hkexpoc.com','binding_failed','normal','',''),('701e2ea9-188d-43ce-a336-d3e6c29cf775','controller4.hkexpoc.com','ovs','normal','{\"port_filter\": true, \"ovs_hybrid_plug\": true}','');
/*!40000 ALTER TABLE `ml2_port_bindings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ml2_ucsm_port_profiles`
--

DROP TABLE IF EXISTS `ml2_ucsm_port_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ml2_ucsm_port_profiles` (
  `vlan_id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` varchar(64) NOT NULL,
  `created_on_ucs` tinyint(1) NOT NULL,
  PRIMARY KEY (`vlan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ml2_ucsm_port_profiles`
--

LOCK TABLES `ml2_ucsm_port_profiles` WRITE;
/*!40000 ALTER TABLE `ml2_ucsm_port_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `ml2_ucsm_port_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ml2_vlan_allocations`
--

DROP TABLE IF EXISTS `ml2_vlan_allocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ml2_vlan_allocations` (
  `physical_network` varchar(64) NOT NULL,
  `vlan_id` int(11) NOT NULL,
  `allocated` tinyint(1) NOT NULL,
  PRIMARY KEY (`physical_network`,`vlan_id`),
  KEY `ix_ml2_vlan_allocations_physical_network_allocated` (`physical_network`,`allocated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ml2_vlan_allocations`
--

LOCK TABLES `ml2_vlan_allocations` WRITE;
/*!40000 ALTER TABLE `ml2_vlan_allocations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ml2_vlan_allocations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ml2_vxlan_allocations`
--

DROP TABLE IF EXISTS `ml2_vxlan_allocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ml2_vxlan_allocations` (
  `vxlan_vni` int(11) NOT NULL,
  `allocated` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`vxlan_vni`),
  KEY `ix_ml2_vxlan_allocations_allocated` (`allocated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ml2_vxlan_allocations`
--

LOCK TABLES `ml2_vxlan_allocations` WRITE;
/*!40000 ALTER TABLE `ml2_vxlan_allocations` DISABLE KEYS */;
INSERT INTO `ml2_vxlan_allocations` VALUES (11,0),(12,0),(13,0),(14,0),(15,0),(16,0),(17,0),(18,0),(19,0),(20,0),(21,0),(22,0),(23,0),(24,0),(25,0),(26,0),(27,0),(28,0),(29,0),(30,0),(31,0),(32,0),(33,0),(34,0),(35,0),(36,0),(37,0),(38,0),(39,0),(40,0),(41,0),(42,0),(43,0),(44,0),(45,0),(46,0),(47,0),(48,0),(49,0),(50,0),(51,0),(52,0),(53,0),(54,0),(55,0),(56,0),(57,0),(58,0),(59,0),(60,0),(61,0),(62,0),(63,0),(64,0),(65,0),(66,0),(67,0),(68,0),(69,0),(70,0),(71,0),(72,0),(73,0),(74,0),(75,0),(76,0),(77,0),(78,0),(79,0),(80,0),(81,0),(82,0),(83,0),(84,0),(85,0),(86,0),(87,0),(88,0),(89,0),(90,0),(91,0),(92,0),(93,0),(94,0),(95,0),(96,0),(97,0),(98,0),(99,0),(100,0),(10,1);
/*!40000 ALTER TABLE `ml2_vxlan_allocations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ml2_vxlan_endpoints`
--

DROP TABLE IF EXISTS `ml2_vxlan_endpoints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ml2_vxlan_endpoints` (
  `ip_address` varchar(64) NOT NULL,
  `udp_port` int(11) NOT NULL,
  `host` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ip_address`),
  UNIQUE KEY `unique_ml2_vxlan_endpoints0host` (`host`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ml2_vxlan_endpoints`
--

LOCK TABLES `ml2_vxlan_endpoints` WRITE;
/*!40000 ALTER TABLE `ml2_vxlan_endpoints` DISABLE KEYS */;
INSERT INTO `ml2_vxlan_endpoints` VALUES ('192.168.251.211',4789,'oc1.hkexpoc.com'),('192.168.251.214',4789,'oc2.hkexpoc.com'),('192.168.251.31',4789,'controller1.hkexpoc.com'),('192.168.251.34',4789,'controller2.hkexpoc.com'),('192.168.252.211',4789,'oc3.hkexpoc.com'),('192.168.252.214',4789,'oc4.hkexpoc.com'),('192.168.252.35',4789,'controller3.hkexpoc.com'),('192.168.252.36',4789,'controller4.hkexpoc.com');
/*!40000 ALTER TABLE `ml2_vxlan_endpoints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multi_provider_networks`
--

DROP TABLE IF EXISTS `multi_provider_networks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `multi_provider_networks` (
  `network_id` varchar(36) NOT NULL,
  PRIMARY KEY (`network_id`),
  CONSTRAINT `multi_provider_networks_ibfk_1` FOREIGN KEY (`network_id`) REFERENCES `networks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multi_provider_networks`
--

LOCK TABLES `multi_provider_networks` WRITE;
/*!40000 ALTER TABLE `multi_provider_networks` DISABLE KEYS */;
/*!40000 ALTER TABLE `multi_provider_networks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `network_bindings`
--

DROP TABLE IF EXISTS `network_bindings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `network_bindings` (
  `network_id` varchar(36) NOT NULL,
  `physical_network` varchar(64) DEFAULT NULL,
  `vlan_id` int(11) NOT NULL,
  PRIMARY KEY (`network_id`),
  CONSTRAINT `network_bindings_ibfk_1` FOREIGN KEY (`network_id`) REFERENCES `networks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `network_bindings`
--

LOCK TABLES `network_bindings` WRITE;
/*!40000 ALTER TABLE `network_bindings` DISABLE KEYS */;
/*!40000 ALTER TABLE `network_bindings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `network_states`
--

DROP TABLE IF EXISTS `network_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `network_states` (
  `physical_network` varchar(64) NOT NULL,
  `vlan_id` int(11) NOT NULL,
  `allocated` tinyint(1) NOT NULL,
  PRIMARY KEY (`physical_network`,`vlan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `network_states`
--

LOCK TABLES `network_states` WRITE;
/*!40000 ALTER TABLE `network_states` DISABLE KEYS */;
/*!40000 ALTER TABLE `network_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `networkconnections`
--

DROP TABLE IF EXISTS `networkconnections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `networkconnections` (
  `tenant_id` varchar(255) DEFAULT NULL,
  `network_gateway_id` varchar(36) DEFAULT NULL,
  `network_id` varchar(36) DEFAULT NULL,
  `segmentation_type` enum('flat','vlan') DEFAULT NULL,
  `segmentation_id` int(11) DEFAULT NULL,
  `port_id` varchar(36) NOT NULL,
  PRIMARY KEY (`port_id`),
  UNIQUE KEY `network_gateway_id` (`network_gateway_id`,`segmentation_type`,`segmentation_id`),
  KEY `network_id` (`network_id`),
  KEY `ix_networkconnections_tenant_id` (`tenant_id`),
  CONSTRAINT `networkconnections_ibfk_1` FOREIGN KEY (`network_gateway_id`) REFERENCES `networkgateways` (`id`) ON DELETE CASCADE,
  CONSTRAINT `networkconnections_ibfk_2` FOREIGN KEY (`network_id`) REFERENCES `networks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `networkconnections_ibfk_3` FOREIGN KEY (`port_id`) REFERENCES `ports` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `networkconnections`
--

LOCK TABLES `networkconnections` WRITE;
/*!40000 ALTER TABLE `networkconnections` DISABLE KEYS */;
/*!40000 ALTER TABLE `networkconnections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `networkdhcpagentbindings`
--

DROP TABLE IF EXISTS `networkdhcpagentbindings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `networkdhcpagentbindings` (
  `network_id` varchar(36) NOT NULL,
  `dhcp_agent_id` varchar(36) NOT NULL,
  PRIMARY KEY (`network_id`,`dhcp_agent_id`),
  KEY `dhcp_agent_id` (`dhcp_agent_id`),
  CONSTRAINT `networkdhcpagentbindings_ibfk_1` FOREIGN KEY (`dhcp_agent_id`) REFERENCES `agents` (`id`) ON DELETE CASCADE,
  CONSTRAINT `networkdhcpagentbindings_ibfk_2` FOREIGN KEY (`network_id`) REFERENCES `networks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `networkdhcpagentbindings`
--

LOCK TABLES `networkdhcpagentbindings` WRITE;
/*!40000 ALTER TABLE `networkdhcpagentbindings` DISABLE KEYS */;
INSERT INTO `networkdhcpagentbindings` VALUES ('d815cb65-a06f-4afa-a8b0-4b1c0e569316','14f5bf34-00d1-43a1-86d7-94b6fa55a258');
/*!40000 ALTER TABLE `networkdhcpagentbindings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `networkflavors`
--

DROP TABLE IF EXISTS `networkflavors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `networkflavors` (
  `flavor` varchar(255) DEFAULT NULL,
  `network_id` varchar(36) NOT NULL,
  PRIMARY KEY (`network_id`),
  CONSTRAINT `networkflavors_ibfk_1` FOREIGN KEY (`network_id`) REFERENCES `networks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `networkflavors`
--

LOCK TABLES `networkflavors` WRITE;
/*!40000 ALTER TABLE `networkflavors` DISABLE KEYS */;
/*!40000 ALTER TABLE `networkflavors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `networkgatewaydevicereferences`
--

DROP TABLE IF EXISTS `networkgatewaydevicereferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `networkgatewaydevicereferences` (
  `id` varchar(36) NOT NULL,
  `network_gateway_id` varchar(36) NOT NULL,
  `interface_name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`,`network_gateway_id`,`interface_name`),
  KEY `network_gateway_id` (`network_gateway_id`),
  CONSTRAINT `networkgatewaydevicereferences_ibfk_1` FOREIGN KEY (`network_gateway_id`) REFERENCES `networkgateways` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `networkgatewaydevicereferences`
--

LOCK TABLES `networkgatewaydevicereferences` WRITE;
/*!40000 ALTER TABLE `networkgatewaydevicereferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `networkgatewaydevicereferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `networkgatewaydevices`
--

DROP TABLE IF EXISTS `networkgatewaydevices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `networkgatewaydevices` (
  `tenant_id` varchar(255) DEFAULT NULL,
  `id` varchar(36) NOT NULL,
  `nsx_id` varchar(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `connector_type` varchar(10) DEFAULT NULL,
  `connector_ip` varchar(64) DEFAULT NULL,
  `status` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_networkgatewaydevices_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `networkgatewaydevices`
--

LOCK TABLES `networkgatewaydevices` WRITE;
/*!40000 ALTER TABLE `networkgatewaydevices` DISABLE KEYS */;
/*!40000 ALTER TABLE `networkgatewaydevices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `networkgateways`
--

DROP TABLE IF EXISTS `networkgateways`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `networkgateways` (
  `id` varchar(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `tenant_id` varchar(36) DEFAULT NULL,
  `default` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `networkgateways`
--

LOCK TABLES `networkgateways` WRITE;
/*!40000 ALTER TABLE `networkgateways` DISABLE KEYS */;
/*!40000 ALTER TABLE `networkgateways` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `networkqueuemappings`
--

DROP TABLE IF EXISTS `networkqueuemappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `networkqueuemappings` (
  `network_id` varchar(36) NOT NULL,
  `queue_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`network_id`),
  KEY `queue_id` (`queue_id`),
  CONSTRAINT `networkqueuemappings_ibfk_1` FOREIGN KEY (`network_id`) REFERENCES `networks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `networkqueuemappings_ibfk_2` FOREIGN KEY (`queue_id`) REFERENCES `qosqueues` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `networkqueuemappings`
--

LOCK TABLES `networkqueuemappings` WRITE;
/*!40000 ALTER TABLE `networkqueuemappings` DISABLE KEYS */;
/*!40000 ALTER TABLE `networkqueuemappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `networks`
--

DROP TABLE IF EXISTS `networks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `networks` (
  `tenant_id` varchar(255) DEFAULT NULL,
  `id` varchar(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` varchar(16) DEFAULT NULL,
  `admin_state_up` tinyint(1) DEFAULT NULL,
  `shared` tinyint(1) DEFAULT NULL,
  `mtu` int(11) DEFAULT NULL,
  `vlan_transparent` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_networks_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `networks`
--

LOCK TABLES `networks` WRITE;
/*!40000 ALTER TABLE `networks` DISABLE KEYS */;
INSERT INTO `networks` VALUES ('5b6cca8b0e464a399f723e7660be3290','d815cb65-a06f-4afa-a8b0-4b1c0e569316','tony-test','ACTIVE',1,0,0,NULL);
/*!40000 ALTER TABLE `networks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `networksecuritybindings`
--

DROP TABLE IF EXISTS `networksecuritybindings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `networksecuritybindings` (
  `network_id` varchar(36) NOT NULL,
  `port_security_enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`network_id`),
  CONSTRAINT `networksecuritybindings_ibfk_1` FOREIGN KEY (`network_id`) REFERENCES `networks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `networksecuritybindings`
--

LOCK TABLES `networksecuritybindings` WRITE;
/*!40000 ALTER TABLE `networksecuritybindings` DISABLE KEYS */;
/*!40000 ALTER TABLE `networksecuritybindings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `neutron_nsx_network_mappings`
--

DROP TABLE IF EXISTS `neutron_nsx_network_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `neutron_nsx_network_mappings` (
  `neutron_id` varchar(36) NOT NULL,
  `nsx_id` varchar(36) NOT NULL,
  PRIMARY KEY (`neutron_id`,`nsx_id`),
  CONSTRAINT `neutron_nsx_network_mappings_ibfk_1` FOREIGN KEY (`neutron_id`) REFERENCES `networks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `neutron_nsx_network_mappings`
--

LOCK TABLES `neutron_nsx_network_mappings` WRITE;
/*!40000 ALTER TABLE `neutron_nsx_network_mappings` DISABLE KEYS */;
/*!40000 ALTER TABLE `neutron_nsx_network_mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `neutron_nsx_port_mappings`
--

DROP TABLE IF EXISTS `neutron_nsx_port_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `neutron_nsx_port_mappings` (
  `neutron_id` varchar(36) NOT NULL,
  `nsx_port_id` varchar(36) NOT NULL,
  `nsx_switch_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`neutron_id`),
  CONSTRAINT `neutron_nsx_port_mappings_ibfk_1` FOREIGN KEY (`neutron_id`) REFERENCES `ports` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `neutron_nsx_port_mappings`
--

LOCK TABLES `neutron_nsx_port_mappings` WRITE;
/*!40000 ALTER TABLE `neutron_nsx_port_mappings` DISABLE KEYS */;
/*!40000 ALTER TABLE `neutron_nsx_port_mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `neutron_nsx_router_mappings`
--

DROP TABLE IF EXISTS `neutron_nsx_router_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `neutron_nsx_router_mappings` (
  `neutron_id` varchar(36) NOT NULL,
  `nsx_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`neutron_id`),
  CONSTRAINT `neutron_nsx_router_mappings_ibfk_1` FOREIGN KEY (`neutron_id`) REFERENCES `routers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `neutron_nsx_router_mappings`
--

LOCK TABLES `neutron_nsx_router_mappings` WRITE;
/*!40000 ALTER TABLE `neutron_nsx_router_mappings` DISABLE KEYS */;
/*!40000 ALTER TABLE `neutron_nsx_router_mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `neutron_nsx_security_group_mappings`
--

DROP TABLE IF EXISTS `neutron_nsx_security_group_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `neutron_nsx_security_group_mappings` (
  `neutron_id` varchar(36) NOT NULL,
  `nsx_id` varchar(36) NOT NULL,
  PRIMARY KEY (`neutron_id`,`nsx_id`),
  CONSTRAINT `neutron_nsx_security_group_mappings_ibfk_1` FOREIGN KEY (`neutron_id`) REFERENCES `securitygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `neutron_nsx_security_group_mappings`
--

LOCK TABLES `neutron_nsx_security_group_mappings` WRITE;
/*!40000 ALTER TABLE `neutron_nsx_security_group_mappings` DISABLE KEYS */;
/*!40000 ALTER TABLE `neutron_nsx_security_group_mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nexthops`
--

DROP TABLE IF EXISTS `nexthops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nexthops` (
  `rule_id` int(11) NOT NULL,
  `nexthop` varchar(64) NOT NULL,
  PRIMARY KEY (`rule_id`,`nexthop`),
  CONSTRAINT `nexthops_ibfk_1` FOREIGN KEY (`rule_id`) REFERENCES `routerrules` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nexthops`
--

LOCK TABLES `nexthops` WRITE;
/*!40000 ALTER TABLE `nexthops` DISABLE KEYS */;
/*!40000 ALTER TABLE `nexthops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nsxv_edge_dhcp_static_bindings`
--

DROP TABLE IF EXISTS `nsxv_edge_dhcp_static_bindings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nsxv_edge_dhcp_static_bindings` (
  `edge_id` varchar(36) NOT NULL,
  `mac_address` varchar(32) NOT NULL,
  `binding_id` varchar(36) NOT NULL,
  PRIMARY KEY (`edge_id`,`mac_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nsxv_edge_dhcp_static_bindings`
--

LOCK TABLES `nsxv_edge_dhcp_static_bindings` WRITE;
/*!40000 ALTER TABLE `nsxv_edge_dhcp_static_bindings` DISABLE KEYS */;
/*!40000 ALTER TABLE `nsxv_edge_dhcp_static_bindings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nsxv_edge_vnic_bindings`
--

DROP TABLE IF EXISTS `nsxv_edge_vnic_bindings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nsxv_edge_vnic_bindings` (
  `edge_id` varchar(36) NOT NULL,
  `vnic_index` int(11) NOT NULL AUTO_INCREMENT,
  `tunnel_index` int(11) NOT NULL,
  `network_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`edge_id`,`vnic_index`,`tunnel_index`),
  KEY `idx_autoinc_vnic_index` (`vnic_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nsxv_edge_vnic_bindings`
--

LOCK TABLES `nsxv_edge_vnic_bindings` WRITE;
/*!40000 ALTER TABLE `nsxv_edge_vnic_bindings` DISABLE KEYS */;
/*!40000 ALTER TABLE `nsxv_edge_vnic_bindings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nsxv_firewall_rule_bindings`
--

DROP TABLE IF EXISTS `nsxv_firewall_rule_bindings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nsxv_firewall_rule_bindings` (
  `rule_id` varchar(36) NOT NULL,
  `edge_id` varchar(36) NOT NULL,
  `rule_vse_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`rule_id`,`edge_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nsxv_firewall_rule_bindings`
--

LOCK TABLES `nsxv_firewall_rule_bindings` WRITE;
/*!40000 ALTER TABLE `nsxv_firewall_rule_bindings` DISABLE KEYS */;
/*!40000 ALTER TABLE `nsxv_firewall_rule_bindings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nsxv_internal_edges`
--

DROP TABLE IF EXISTS `nsxv_internal_edges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nsxv_internal_edges` (
  `ext_ip_address` varchar(64) NOT NULL,
  `router_id` varchar(36) DEFAULT NULL,
  `purpose` enum('inter_edge_net') DEFAULT NULL,
  PRIMARY KEY (`ext_ip_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nsxv_internal_edges`
--

LOCK TABLES `nsxv_internal_edges` WRITE;
/*!40000 ALTER TABLE `nsxv_internal_edges` DISABLE KEYS */;
/*!40000 ALTER TABLE `nsxv_internal_edges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nsxv_internal_networks`
--

DROP TABLE IF EXISTS `nsxv_internal_networks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nsxv_internal_networks` (
  `network_purpose` enum('inter_edge_net') NOT NULL,
  `network_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`network_purpose`),
  KEY `network_id` (`network_id`),
  CONSTRAINT `nsxv_internal_networks_ibfk_1` FOREIGN KEY (`network_id`) REFERENCES `networks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nsxv_internal_networks`
--

LOCK TABLES `nsxv_internal_networks` WRITE;
/*!40000 ALTER TABLE `nsxv_internal_networks` DISABLE KEYS */;
/*!40000 ALTER TABLE `nsxv_internal_networks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nsxv_port_index_mappings`
--

DROP TABLE IF EXISTS `nsxv_port_index_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nsxv_port_index_mappings` (
  `port_id` varchar(36) NOT NULL,
  `device_id` varchar(255) NOT NULL,
  `index` int(11) NOT NULL,
  PRIMARY KEY (`port_id`),
  UNIQUE KEY `device_id` (`device_id`,`index`),
  CONSTRAINT `nsxv_port_index_mappings_ibfk_1` FOREIGN KEY (`port_id`) REFERENCES `ports` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nsxv_port_index_mappings`
--

LOCK TABLES `nsxv_port_index_mappings` WRITE;
/*!40000 ALTER TABLE `nsxv_port_index_mappings` DISABLE KEYS */;
/*!40000 ALTER TABLE `nsxv_port_index_mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nsxv_port_vnic_mappings`
--

DROP TABLE IF EXISTS `nsxv_port_vnic_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nsxv_port_vnic_mappings` (
  `neutron_id` varchar(36) NOT NULL,
  `nsx_id` varchar(42) NOT NULL,
  PRIMARY KEY (`neutron_id`,`nsx_id`),
  CONSTRAINT `nsxv_port_vnic_mappings_ibfk_1` FOREIGN KEY (`neutron_id`) REFERENCES `ports` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nsxv_port_vnic_mappings`
--

LOCK TABLES `nsxv_port_vnic_mappings` WRITE;
/*!40000 ALTER TABLE `nsxv_port_vnic_mappings` DISABLE KEYS */;
/*!40000 ALTER TABLE `nsxv_port_vnic_mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nsxv_router_bindings`
--

DROP TABLE IF EXISTS `nsxv_router_bindings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nsxv_router_bindings` (
  `status` varchar(16) NOT NULL,
  `status_description` varchar(255) DEFAULT NULL,
  `router_id` varchar(36) NOT NULL,
  `edge_id` varchar(36) DEFAULT NULL,
  `lswitch_id` varchar(36) DEFAULT NULL,
  `appliance_size` enum('compact','large','xlarge','quadlarge') DEFAULT NULL,
  `edge_type` enum('service','vdr') DEFAULT NULL,
  PRIMARY KEY (`router_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nsxv_router_bindings`
--

LOCK TABLES `nsxv_router_bindings` WRITE;
/*!40000 ALTER TABLE `nsxv_router_bindings` DISABLE KEYS */;
/*!40000 ALTER TABLE `nsxv_router_bindings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nsxv_router_ext_attributes`
--

DROP TABLE IF EXISTS `nsxv_router_ext_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nsxv_router_ext_attributes` (
  `router_id` varchar(36) NOT NULL,
  `distributed` tinyint(1) NOT NULL,
  `router_type` enum('shared','exclusive') NOT NULL,
  `service_router` tinyint(1) NOT NULL,
  PRIMARY KEY (`router_id`),
  CONSTRAINT `nsxv_router_ext_attributes_ibfk_1` FOREIGN KEY (`router_id`) REFERENCES `routers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nsxv_router_ext_attributes`
--

LOCK TABLES `nsxv_router_ext_attributes` WRITE;
/*!40000 ALTER TABLE `nsxv_router_ext_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `nsxv_router_ext_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nsxv_rule_mappings`
--

DROP TABLE IF EXISTS `nsxv_rule_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nsxv_rule_mappings` (
  `neutron_id` varchar(36) NOT NULL,
  `nsx_rule_id` varchar(36) NOT NULL,
  PRIMARY KEY (`neutron_id`,`nsx_rule_id`),
  CONSTRAINT `nsxv_rule_mappings_ibfk_1` FOREIGN KEY (`neutron_id`) REFERENCES `securitygrouprules` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nsxv_rule_mappings`
--

LOCK TABLES `nsxv_rule_mappings` WRITE;
/*!40000 ALTER TABLE `nsxv_rule_mappings` DISABLE KEYS */;
/*!40000 ALTER TABLE `nsxv_rule_mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nsxv_security_group_section_mappings`
--

DROP TABLE IF EXISTS `nsxv_security_group_section_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nsxv_security_group_section_mappings` (
  `neutron_id` varchar(36) NOT NULL,
  `ip_section_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`neutron_id`),
  CONSTRAINT `nsxv_security_group_section_mappings_ibfk_1` FOREIGN KEY (`neutron_id`) REFERENCES `securitygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nsxv_security_group_section_mappings`
--

LOCK TABLES `nsxv_security_group_section_mappings` WRITE;
/*!40000 ALTER TABLE `nsxv_security_group_section_mappings` DISABLE KEYS */;
/*!40000 ALTER TABLE `nsxv_security_group_section_mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nsxv_spoofguard_policy_network_mappings`
--

DROP TABLE IF EXISTS `nsxv_spoofguard_policy_network_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nsxv_spoofguard_policy_network_mappings` (
  `network_id` varchar(36) NOT NULL,
  `policy_id` varchar(36) NOT NULL,
  PRIMARY KEY (`network_id`),
  CONSTRAINT `nsxv_spoofguard_policy_network_mappings_ibfk_1` FOREIGN KEY (`network_id`) REFERENCES `networks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nsxv_spoofguard_policy_network_mappings`
--

LOCK TABLES `nsxv_spoofguard_policy_network_mappings` WRITE;
/*!40000 ALTER TABLE `nsxv_spoofguard_policy_network_mappings` DISABLE KEYS */;
/*!40000 ALTER TABLE `nsxv_spoofguard_policy_network_mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nsxv_tz_network_bindings`
--

DROP TABLE IF EXISTS `nsxv_tz_network_bindings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nsxv_tz_network_bindings` (
  `network_id` varchar(36) NOT NULL,
  `binding_type` enum('flat','vlan','portgroup') NOT NULL,
  `phy_uuid` varchar(36) NOT NULL,
  `vlan_id` int(11) NOT NULL,
  PRIMARY KEY (`network_id`,`binding_type`,`phy_uuid`,`vlan_id`),
  CONSTRAINT `nsxv_tz_network_bindings_ibfk_1` FOREIGN KEY (`network_id`) REFERENCES `networks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nsxv_tz_network_bindings`
--

LOCK TABLES `nsxv_tz_network_bindings` WRITE;
/*!40000 ALTER TABLE `nsxv_tz_network_bindings` DISABLE KEYS */;
/*!40000 ALTER TABLE `nsxv_tz_network_bindings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nuage_net_partition_router_mapping`
--

DROP TABLE IF EXISTS `nuage_net_partition_router_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nuage_net_partition_router_mapping` (
  `net_partition_id` varchar(36) NOT NULL,
  `router_id` varchar(36) NOT NULL,
  `nuage_router_id` varchar(36) DEFAULT NULL,
  `nuage_rtr_rd` varchar(36) DEFAULT NULL,
  `nuage_rtr_rt` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`net_partition_id`,`router_id`),
  UNIQUE KEY `uniq_nuage_net_partition_router_mapping0nuage_router_id` (`nuage_router_id`),
  KEY `router_id` (`router_id`),
  CONSTRAINT `nuage_net_partition_router_mapping_ibfk_1` FOREIGN KEY (`net_partition_id`) REFERENCES `nuage_net_partitions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `nuage_net_partition_router_mapping_ibfk_2` FOREIGN KEY (`router_id`) REFERENCES `routers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nuage_net_partition_router_mapping`
--

LOCK TABLES `nuage_net_partition_router_mapping` WRITE;
/*!40000 ALTER TABLE `nuage_net_partition_router_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `nuage_net_partition_router_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nuage_net_partitions`
--

DROP TABLE IF EXISTS `nuage_net_partitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nuage_net_partitions` (
  `id` varchar(36) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `l3dom_tmplt_id` varchar(36) DEFAULT NULL,
  `l2dom_tmplt_id` varchar(36) DEFAULT NULL,
  `isolated_zone` varchar(64) DEFAULT NULL,
  `shared_zone` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nuage_net_partitions`
--

LOCK TABLES `nuage_net_partitions` WRITE;
/*!40000 ALTER TABLE `nuage_net_partitions` DISABLE KEYS */;
/*!40000 ALTER TABLE `nuage_net_partitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nuage_provider_net_bindings`
--

DROP TABLE IF EXISTS `nuage_provider_net_bindings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nuage_provider_net_bindings` (
  `network_id` varchar(36) NOT NULL,
  `network_type` varchar(32) NOT NULL,
  `physical_network` varchar(64) NOT NULL,
  `vlan_id` int(11) NOT NULL,
  PRIMARY KEY (`network_id`),
  CONSTRAINT `nuage_provider_net_bindings_ibfk_1` FOREIGN KEY (`network_id`) REFERENCES `networks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nuage_provider_net_bindings`
--

LOCK TABLES `nuage_provider_net_bindings` WRITE;
/*!40000 ALTER TABLE `nuage_provider_net_bindings` DISABLE KEYS */;
/*!40000 ALTER TABLE `nuage_provider_net_bindings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nuage_subnet_l2dom_mapping`
--

DROP TABLE IF EXISTS `nuage_subnet_l2dom_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nuage_subnet_l2dom_mapping` (
  `subnet_id` varchar(36) NOT NULL,
  `net_partition_id` varchar(36) DEFAULT NULL,
  `nuage_subnet_id` varchar(36) DEFAULT NULL,
  `nuage_l2dom_tmplt_id` varchar(36) DEFAULT NULL,
  `nuage_user_id` varchar(36) DEFAULT NULL,
  `nuage_group_id` varchar(36) DEFAULT NULL,
  `nuage_managed_subnet` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`subnet_id`),
  UNIQUE KEY `uniq_nuage_subnet_l2dom_mapping0nuage_subnet_id` (`nuage_subnet_id`),
  KEY `net_partition_id` (`net_partition_id`),
  CONSTRAINT `nuage_subnet_l2dom_mapping_ibfk_1` FOREIGN KEY (`subnet_id`) REFERENCES `subnets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `nuage_subnet_l2dom_mapping_ibfk_2` FOREIGN KEY (`net_partition_id`) REFERENCES `nuage_net_partitions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nuage_subnet_l2dom_mapping`
--

LOCK TABLES `nuage_subnet_l2dom_mapping` WRITE;
/*!40000 ALTER TABLE `nuage_subnet_l2dom_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `nuage_subnet_l2dom_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofcfiltermappings`
--

DROP TABLE IF EXISTS `ofcfiltermappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ofcfiltermappings` (
  `ofc_id` varchar(255) NOT NULL,
  `neutron_id` varchar(36) NOT NULL,
  PRIMARY KEY (`neutron_id`),
  UNIQUE KEY `ofc_id` (`ofc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofcfiltermappings`
--

LOCK TABLES `ofcfiltermappings` WRITE;
/*!40000 ALTER TABLE `ofcfiltermappings` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofcfiltermappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofcnetworkmappings`
--

DROP TABLE IF EXISTS `ofcnetworkmappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ofcnetworkmappings` (
  `ofc_id` varchar(255) NOT NULL,
  `neutron_id` varchar(36) NOT NULL,
  PRIMARY KEY (`neutron_id`),
  UNIQUE KEY `ofc_id` (`ofc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofcnetworkmappings`
--

LOCK TABLES `ofcnetworkmappings` WRITE;
/*!40000 ALTER TABLE `ofcnetworkmappings` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofcnetworkmappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofcportmappings`
--

DROP TABLE IF EXISTS `ofcportmappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ofcportmappings` (
  `ofc_id` varchar(255) NOT NULL,
  `neutron_id` varchar(36) NOT NULL,
  PRIMARY KEY (`neutron_id`),
  UNIQUE KEY `ofc_id` (`ofc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofcportmappings`
--

LOCK TABLES `ofcportmappings` WRITE;
/*!40000 ALTER TABLE `ofcportmappings` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofcportmappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofcroutermappings`
--

DROP TABLE IF EXISTS `ofcroutermappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ofcroutermappings` (
  `ofc_id` varchar(255) NOT NULL,
  `neutron_id` varchar(36) NOT NULL,
  PRIMARY KEY (`neutron_id`),
  UNIQUE KEY `ofc_id` (`ofc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofcroutermappings`
--

LOCK TABLES `ofcroutermappings` WRITE;
/*!40000 ALTER TABLE `ofcroutermappings` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofcroutermappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofctenantmappings`
--

DROP TABLE IF EXISTS `ofctenantmappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ofctenantmappings` (
  `ofc_id` varchar(255) NOT NULL,
  `neutron_id` varchar(36) NOT NULL,
  PRIMARY KEY (`neutron_id`),
  UNIQUE KEY `ofc_id` (`ofc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofctenantmappings`
--

LOCK TABLES `ofctenantmappings` WRITE;
/*!40000 ALTER TABLE `ofctenantmappings` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofctenantmappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ovs_network_bindings`
--

DROP TABLE IF EXISTS `ovs_network_bindings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ovs_network_bindings` (
  `network_id` varchar(36) NOT NULL,
  `network_type` varchar(32) NOT NULL,
  `physical_network` varchar(64) DEFAULT NULL,
  `segmentation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`network_id`),
  CONSTRAINT `ovs_network_bindings_ibfk_1` FOREIGN KEY (`network_id`) REFERENCES `networks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ovs_network_bindings`
--

LOCK TABLES `ovs_network_bindings` WRITE;
/*!40000 ALTER TABLE `ovs_network_bindings` DISABLE KEYS */;
/*!40000 ALTER TABLE `ovs_network_bindings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ovs_tunnel_allocations`
--

DROP TABLE IF EXISTS `ovs_tunnel_allocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ovs_tunnel_allocations` (
  `tunnel_id` int(11) NOT NULL,
  `allocated` tinyint(1) NOT NULL,
  PRIMARY KEY (`tunnel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ovs_tunnel_allocations`
--

LOCK TABLES `ovs_tunnel_allocations` WRITE;
/*!40000 ALTER TABLE `ovs_tunnel_allocations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ovs_tunnel_allocations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ovs_tunnel_endpoints`
--

DROP TABLE IF EXISTS `ovs_tunnel_endpoints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ovs_tunnel_endpoints` (
  `ip_address` varchar(64) NOT NULL,
  `id` int(11) NOT NULL,
  PRIMARY KEY (`ip_address`),
  UNIQUE KEY `uniq_ovs_tunnel_endpoints0id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ovs_tunnel_endpoints`
--

LOCK TABLES `ovs_tunnel_endpoints` WRITE;
/*!40000 ALTER TABLE `ovs_tunnel_endpoints` DISABLE KEYS */;
/*!40000 ALTER TABLE `ovs_tunnel_endpoints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ovs_vlan_allocations`
--

DROP TABLE IF EXISTS `ovs_vlan_allocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ovs_vlan_allocations` (
  `physical_network` varchar(64) NOT NULL,
  `vlan_id` int(11) NOT NULL,
  `allocated` tinyint(1) NOT NULL,
  PRIMARY KEY (`physical_network`,`vlan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ovs_vlan_allocations`
--

LOCK TABLES `ovs_vlan_allocations` WRITE;
/*!40000 ALTER TABLE `ovs_vlan_allocations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ovs_vlan_allocations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packetfilters`
--

DROP TABLE IF EXISTS `packetfilters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `packetfilters` (
  `tenant_id` varchar(255) DEFAULT NULL,
  `id` varchar(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `network_id` varchar(36) NOT NULL,
  `priority` int(11) NOT NULL,
  `action` varchar(16) NOT NULL,
  `in_port` varchar(36) DEFAULT NULL,
  `src_mac` varchar(32) NOT NULL,
  `dst_mac` varchar(32) NOT NULL,
  `eth_type` int(11) NOT NULL,
  `src_cidr` varchar(64) NOT NULL,
  `dst_cidr` varchar(64) NOT NULL,
  `protocol` varchar(16) NOT NULL,
  `src_port` int(11) NOT NULL,
  `dst_port` int(11) NOT NULL,
  `admin_state_up` tinyint(1) NOT NULL,
  `status` varchar(16) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `network_id` (`network_id`),
  KEY `in_port` (`in_port`),
  KEY `ix_packetfilters_tenant_id` (`tenant_id`),
  CONSTRAINT `packetfilters_ibfk_1` FOREIGN KEY (`network_id`) REFERENCES `networks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `packetfilters_ibfk_2` FOREIGN KEY (`in_port`) REFERENCES `ports` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packetfilters`
--

LOCK TABLES `packetfilters` WRITE;
/*!40000 ALTER TABLE `packetfilters` DISABLE KEYS */;
/*!40000 ALTER TABLE `packetfilters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poolloadbalanceragentbindings`
--

DROP TABLE IF EXISTS `poolloadbalanceragentbindings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poolloadbalanceragentbindings` (
  `pool_id` varchar(36) NOT NULL,
  `agent_id` varchar(36) NOT NULL,
  PRIMARY KEY (`pool_id`),
  KEY `agent_id` (`agent_id`),
  CONSTRAINT `poolloadbalanceragentbindings_ibfk_1` FOREIGN KEY (`pool_id`) REFERENCES `pools` (`id`) ON DELETE CASCADE,
  CONSTRAINT `poolloadbalanceragentbindings_ibfk_2` FOREIGN KEY (`agent_id`) REFERENCES `agents` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poolloadbalanceragentbindings`
--

LOCK TABLES `poolloadbalanceragentbindings` WRITE;
/*!40000 ALTER TABLE `poolloadbalanceragentbindings` DISABLE KEYS */;
/*!40000 ALTER TABLE `poolloadbalanceragentbindings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poolmonitorassociations`
--

DROP TABLE IF EXISTS `poolmonitorassociations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poolmonitorassociations` (
  `status` varchar(16) NOT NULL,
  `status_description` varchar(255) DEFAULT NULL,
  `pool_id` varchar(36) NOT NULL,
  `monitor_id` varchar(36) NOT NULL,
  PRIMARY KEY (`pool_id`,`monitor_id`),
  KEY `monitor_id` (`monitor_id`),
  CONSTRAINT `poolmonitorassociations_ibfk_1` FOREIGN KEY (`pool_id`) REFERENCES `pools` (`id`),
  CONSTRAINT `poolmonitorassociations_ibfk_2` FOREIGN KEY (`monitor_id`) REFERENCES `healthmonitors` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poolmonitorassociations`
--

LOCK TABLES `poolmonitorassociations` WRITE;
/*!40000 ALTER TABLE `poolmonitorassociations` DISABLE KEYS */;
/*!40000 ALTER TABLE `poolmonitorassociations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pools`
--

DROP TABLE IF EXISTS `pools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pools` (
  `tenant_id` varchar(255) DEFAULT NULL,
  `id` varchar(36) NOT NULL,
  `status` varchar(16) NOT NULL,
  `status_description` varchar(255) DEFAULT NULL,
  `vip_id` varchar(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `subnet_id` varchar(36) NOT NULL,
  `protocol` enum('HTTP','HTTPS','TCP') NOT NULL,
  `lb_method` enum('ROUND_ROBIN','LEAST_CONNECTIONS','SOURCE_IP') NOT NULL,
  `admin_state_up` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `vip_id` (`vip_id`),
  CONSTRAINT `pools_ibfk_1` FOREIGN KEY (`vip_id`) REFERENCES `vips` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pools`
--

LOCK TABLES `pools` WRITE;
/*!40000 ALTER TABLE `pools` DISABLE KEYS */;
/*!40000 ALTER TABLE `pools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poolstatisticss`
--

DROP TABLE IF EXISTS `poolstatisticss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poolstatisticss` (
  `pool_id` varchar(36) NOT NULL,
  `bytes_in` bigint(20) NOT NULL,
  `bytes_out` bigint(20) NOT NULL,
  `active_connections` bigint(20) NOT NULL,
  `total_connections` bigint(20) NOT NULL,
  PRIMARY KEY (`pool_id`),
  CONSTRAINT `poolstatisticss_ibfk_1` FOREIGN KEY (`pool_id`) REFERENCES `pools` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poolstatisticss`
--

LOCK TABLES `poolstatisticss` WRITE;
/*!40000 ALTER TABLE `poolstatisticss` DISABLE KEYS */;
/*!40000 ALTER TABLE `poolstatisticss` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portbindingports`
--

DROP TABLE IF EXISTS `portbindingports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portbindingports` (
  `port_id` varchar(36) NOT NULL,
  `host` varchar(255) NOT NULL,
  PRIMARY KEY (`port_id`),
  CONSTRAINT `portbindingports_ibfk_1` FOREIGN KEY (`port_id`) REFERENCES `ports` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portbindingports`
--

LOCK TABLES `portbindingports` WRITE;
/*!40000 ALTER TABLE `portbindingports` DISABLE KEYS */;
/*!40000 ALTER TABLE `portbindingports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portinfos`
--

DROP TABLE IF EXISTS `portinfos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portinfos` (
  `id` varchar(36) NOT NULL,
  `datapath_id` varchar(36) NOT NULL,
  `port_no` int(11) NOT NULL,
  `vlan_id` int(11) NOT NULL,
  `mac` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `portinfos_ibfk_1` FOREIGN KEY (`id`) REFERENCES `ports` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portinfos`
--

LOCK TABLES `portinfos` WRITE;
/*!40000 ALTER TABLE `portinfos` DISABLE KEYS */;
/*!40000 ALTER TABLE `portinfos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portqueuemappings`
--

DROP TABLE IF EXISTS `portqueuemappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portqueuemappings` (
  `port_id` varchar(36) NOT NULL,
  `queue_id` varchar(36) NOT NULL,
  PRIMARY KEY (`port_id`,`queue_id`),
  KEY `queue_id` (`queue_id`),
  CONSTRAINT `portqueuemappings_ibfk_1` FOREIGN KEY (`port_id`) REFERENCES `ports` (`id`) ON DELETE CASCADE,
  CONSTRAINT `portqueuemappings_ibfk_2` FOREIGN KEY (`queue_id`) REFERENCES `qosqueues` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portqueuemappings`
--

LOCK TABLES `portqueuemappings` WRITE;
/*!40000 ALTER TABLE `portqueuemappings` DISABLE KEYS */;
/*!40000 ALTER TABLE `portqueuemappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ports`
--

DROP TABLE IF EXISTS `ports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ports` (
  `tenant_id` varchar(255) DEFAULT NULL,
  `id` varchar(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `network_id` varchar(36) NOT NULL,
  `mac_address` varchar(32) NOT NULL,
  `admin_state_up` tinyint(1) NOT NULL,
  `status` varchar(16) NOT NULL,
  `device_id` varchar(255) NOT NULL,
  `device_owner` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_ports0network_id0mac_address` (`network_id`,`mac_address`),
  KEY `ix_ports_tenant_id` (`tenant_id`),
  KEY `ix_ports_network_id_device_owner` (`network_id`,`device_owner`),
  KEY `ix_ports_network_id_mac_address` (`network_id`,`mac_address`),
  CONSTRAINT `ports_ibfk_1` FOREIGN KEY (`network_id`) REFERENCES `networks` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ports`
--

LOCK TABLES `ports` WRITE;
/*!40000 ALTER TABLE `ports` DISABLE KEYS */;
INSERT INTO `ports` VALUES ('5b6cca8b0e464a399f723e7660be3290','218faf89-994e-4421-a6fd-91b11be1f672','','d815cb65-a06f-4afa-a8b0-4b1c0e569316','fa:16:3e:15:ac:44',1,'DOWN','dhcp57aa2c89-eb31-5aa6-baa3-9db19f8fe78d-d815cb65-a06f-4afa-a8b0-4b1c0e569316','network:dhcp'),('5b6cca8b0e464a399f723e7660be3290','701e2ea9-188d-43ce-a336-d3e6c29cf775','','d815cb65-a06f-4afa-a8b0-4b1c0e569316','fa:16:3e:e1:2d:fe',1,'ACTIVE','reserved_dhcp_port','network:dhcp');
/*!40000 ALTER TABLE `ports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portsecuritybindings`
--

DROP TABLE IF EXISTS `portsecuritybindings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portsecuritybindings` (
  `port_id` varchar(36) NOT NULL,
  `port_security_enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`port_id`),
  CONSTRAINT `portsecuritybindings_ibfk_1` FOREIGN KEY (`port_id`) REFERENCES `ports` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portsecuritybindings`
--

LOCK TABLES `portsecuritybindings` WRITE;
/*!40000 ALTER TABLE `portsecuritybindings` DISABLE KEYS */;
/*!40000 ALTER TABLE `portsecuritybindings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `providerresourceassociations`
--

DROP TABLE IF EXISTS `providerresourceassociations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `providerresourceassociations` (
  `provider_name` varchar(255) NOT NULL,
  `resource_id` varchar(36) NOT NULL,
  PRIMARY KEY (`provider_name`,`resource_id`),
  UNIQUE KEY `resource_id` (`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `providerresourceassociations`
--

LOCK TABLES `providerresourceassociations` WRITE;
/*!40000 ALTER TABLE `providerresourceassociations` DISABLE KEYS */;
/*!40000 ALTER TABLE `providerresourceassociations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qosqueues`
--

DROP TABLE IF EXISTS `qosqueues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qosqueues` (
  `tenant_id` varchar(255) DEFAULT NULL,
  `id` varchar(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `default` tinyint(1) DEFAULT '0',
  `min` int(11) NOT NULL,
  `max` int(11) DEFAULT NULL,
  `qos_marking` enum('untrusted','trusted') DEFAULT NULL,
  `dscp` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_qosqueues_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qosqueues`
--

LOCK TABLES `qosqueues` WRITE;
/*!40000 ALTER TABLE `qosqueues` DISABLE KEYS */;
/*!40000 ALTER TABLE `qosqueues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quotas`
--

DROP TABLE IF EXISTS `quotas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quotas` (
  `id` varchar(36) NOT NULL,
  `tenant_id` varchar(255) DEFAULT NULL,
  `resource` varchar(255) DEFAULT NULL,
  `limit` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_quotas_tenant_id` (`tenant_id`)
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
-- Table structure for table `router_extra_attributes`
--

DROP TABLE IF EXISTS `router_extra_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `router_extra_attributes` (
  `router_id` varchar(36) NOT NULL,
  `distributed` tinyint(1) NOT NULL DEFAULT '0',
  `service_router` tinyint(1) NOT NULL DEFAULT '0',
  `ha` tinyint(1) NOT NULL DEFAULT '0',
  `ha_vr_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`router_id`),
  CONSTRAINT `router_extra_attributes_ibfk_1` FOREIGN KEY (`router_id`) REFERENCES `routers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `router_extra_attributes`
--

LOCK TABLES `router_extra_attributes` WRITE;
/*!40000 ALTER TABLE `router_extra_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `router_extra_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routerflavors`
--

DROP TABLE IF EXISTS `routerflavors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `routerflavors` (
  `flavor` varchar(255) DEFAULT NULL,
  `router_id` varchar(36) NOT NULL,
  PRIMARY KEY (`router_id`),
  CONSTRAINT `routerflavors_ibfk_1` FOREIGN KEY (`router_id`) REFERENCES `routers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routerflavors`
--

LOCK TABLES `routerflavors` WRITE;
/*!40000 ALTER TABLE `routerflavors` DISABLE KEYS */;
/*!40000 ALTER TABLE `routerflavors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routerl3agentbindings`
--

DROP TABLE IF EXISTS `routerl3agentbindings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `routerl3agentbindings` (
  `router_id` varchar(36) NOT NULL DEFAULT '',
  `l3_agent_id` varchar(36) NOT NULL DEFAULT '',
  PRIMARY KEY (`router_id`,`l3_agent_id`),
  KEY `routerl3agentbindings_ibfk_1` (`l3_agent_id`),
  CONSTRAINT `routerl3agentbindings_ibfk_1` FOREIGN KEY (`l3_agent_id`) REFERENCES `agents` (`id`) ON DELETE CASCADE,
  CONSTRAINT `routerl3agentbindings_ibfk_2` FOREIGN KEY (`router_id`) REFERENCES `routers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routerl3agentbindings`
--

LOCK TABLES `routerl3agentbindings` WRITE;
/*!40000 ALTER TABLE `routerl3agentbindings` DISABLE KEYS */;
/*!40000 ALTER TABLE `routerl3agentbindings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routerports`
--

DROP TABLE IF EXISTS `routerports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `routerports` (
  `router_id` varchar(36) NOT NULL,
  `port_id` varchar(36) NOT NULL,
  `port_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`router_id`,`port_id`),
  KEY `port_id` (`port_id`),
  CONSTRAINT `routerports_ibfk_1` FOREIGN KEY (`router_id`) REFERENCES `routers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `routerports_ibfk_2` FOREIGN KEY (`port_id`) REFERENCES `ports` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routerports`
--

LOCK TABLES `routerports` WRITE;
/*!40000 ALTER TABLE `routerports` DISABLE KEYS */;
/*!40000 ALTER TABLE `routerports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routerproviders`
--

DROP TABLE IF EXISTS `routerproviders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `routerproviders` (
  `provider` varchar(255) DEFAULT NULL,
  `router_id` varchar(36) NOT NULL,
  PRIMARY KEY (`router_id`),
  CONSTRAINT `routerproviders_ibfk_1` FOREIGN KEY (`router_id`) REFERENCES `routers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routerproviders`
--

LOCK TABLES `routerproviders` WRITE;
/*!40000 ALTER TABLE `routerproviders` DISABLE KEYS */;
/*!40000 ALTER TABLE `routerproviders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routerroutes`
--

DROP TABLE IF EXISTS `routerroutes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `routerroutes` (
  `destination` varchar(64) NOT NULL,
  `nexthop` varchar(64) NOT NULL,
  `router_id` varchar(36) NOT NULL,
  PRIMARY KEY (`destination`,`nexthop`,`router_id`),
  KEY `router_id` (`router_id`),
  CONSTRAINT `routerroutes_ibfk_1` FOREIGN KEY (`router_id`) REFERENCES `routers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routerroutes`
--

LOCK TABLES `routerroutes` WRITE;
/*!40000 ALTER TABLE `routerroutes` DISABLE KEYS */;
/*!40000 ALTER TABLE `routerroutes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routerrules`
--

DROP TABLE IF EXISTS `routerrules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `routerrules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source` varchar(64) NOT NULL,
  `destination` varchar(64) NOT NULL,
  `action` varchar(10) NOT NULL,
  `router_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `router_id` (`router_id`),
  CONSTRAINT `routerrules_ibfk_1` FOREIGN KEY (`router_id`) REFERENCES `routers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routerrules`
--

LOCK TABLES `routerrules` WRITE;
/*!40000 ALTER TABLE `routerrules` DISABLE KEYS */;
/*!40000 ALTER TABLE `routerrules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routers`
--

DROP TABLE IF EXISTS `routers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `routers` (
  `tenant_id` varchar(255) DEFAULT NULL,
  `id` varchar(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` varchar(16) DEFAULT NULL,
  `admin_state_up` tinyint(1) DEFAULT NULL,
  `gw_port_id` varchar(36) DEFAULT NULL,
  `enable_snat` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `gw_port_id` (`gw_port_id`),
  KEY `ix_routers_tenant_id` (`tenant_id`),
  CONSTRAINT `routers_ibfk_1` FOREIGN KEY (`gw_port_id`) REFERENCES `ports` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routers`
--

LOCK TABLES `routers` WRITE;
/*!40000 ALTER TABLE `routers` DISABLE KEYS */;
/*!40000 ALTER TABLE `routers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `securitygroupportbindings`
--

DROP TABLE IF EXISTS `securitygroupportbindings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `securitygroupportbindings` (
  `port_id` varchar(36) NOT NULL,
  `security_group_id` varchar(36) NOT NULL,
  PRIMARY KEY (`port_id`,`security_group_id`),
  KEY `security_group_id` (`security_group_id`),
  CONSTRAINT `securitygroupportbindings_ibfk_1` FOREIGN KEY (`port_id`) REFERENCES `ports` (`id`) ON DELETE CASCADE,
  CONSTRAINT `securitygroupportbindings_ibfk_2` FOREIGN KEY (`security_group_id`) REFERENCES `securitygroups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `securitygroupportbindings`
--

LOCK TABLES `securitygroupportbindings` WRITE;
/*!40000 ALTER TABLE `securitygroupportbindings` DISABLE KEYS */;
/*!40000 ALTER TABLE `securitygroupportbindings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `securitygrouprules`
--

DROP TABLE IF EXISTS `securitygrouprules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `securitygrouprules` (
  `tenant_id` varchar(255) DEFAULT NULL,
  `id` varchar(36) NOT NULL,
  `security_group_id` varchar(36) NOT NULL,
  `remote_group_id` varchar(36) DEFAULT NULL,
  `direction` enum('ingress','egress') DEFAULT NULL,
  `ethertype` varchar(40) DEFAULT NULL,
  `protocol` varchar(40) DEFAULT NULL,
  `port_range_min` int(11) DEFAULT NULL,
  `port_range_max` int(11) DEFAULT NULL,
  `remote_ip_prefix` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `security_group_id` (`security_group_id`),
  KEY `remote_group_id` (`remote_group_id`),
  KEY `ix_securitygrouprules_tenant_id` (`tenant_id`),
  CONSTRAINT `securitygrouprules_ibfk_1` FOREIGN KEY (`security_group_id`) REFERENCES `securitygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `securitygrouprules_ibfk_2` FOREIGN KEY (`remote_group_id`) REFERENCES `securitygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `securitygrouprules`
--

LOCK TABLES `securitygrouprules` WRITE;
/*!40000 ALTER TABLE `securitygrouprules` DISABLE KEYS */;
INSERT INTO `securitygrouprules` VALUES ('f924c3bf43bb400a9852d6489705da5e','1fbe2504-7784-42e1-be1a-46d96d90d796','94c8fc5a-4b78-47db-92fd-2dd78c71975c','94c8fc5a-4b78-47db-92fd-2dd78c71975c','ingress','IPv6',NULL,NULL,NULL,NULL),('f924c3bf43bb400a9852d6489705da5e','25137a99-b416-45e1-8b11-9457546572db','94c8fc5a-4b78-47db-92fd-2dd78c71975c',NULL,'egress','IPv4',NULL,NULL,NULL,NULL),('5b6cca8b0e464a399f723e7660be3290','5a38d53e-76e9-4ef8-8a7b-79b5ae4e120b','9e0865e3-e36d-4acd-a9c8-255d531a8aba',NULL,'egress','IPv4',NULL,NULL,NULL,NULL),('5b6cca8b0e464a399f723e7660be3290','5d03d6bc-3f1b-48c2-9708-933512876952','9e0865e3-e36d-4acd-a9c8-255d531a8aba',NULL,'egress','IPv6',NULL,NULL,NULL,NULL),('f924c3bf43bb400a9852d6489705da5e','877e3950-7dd4-468e-b0c7-b50a5e9cbf42','94c8fc5a-4b78-47db-92fd-2dd78c71975c','94c8fc5a-4b78-47db-92fd-2dd78c71975c','ingress','IPv4',NULL,NULL,NULL,NULL),('5b6cca8b0e464a399f723e7660be3290','8e2b85b1-a140-494a-8459-353389387b7e','9e0865e3-e36d-4acd-a9c8-255d531a8aba','9e0865e3-e36d-4acd-a9c8-255d531a8aba','ingress','IPv4',NULL,NULL,NULL,NULL),('f924c3bf43bb400a9852d6489705da5e','d3987a31-c219-484e-885a-874d3386be22','94c8fc5a-4b78-47db-92fd-2dd78c71975c',NULL,'egress','IPv6',NULL,NULL,NULL,NULL),('5b6cca8b0e464a399f723e7660be3290','dcc0bf96-5a91-48f0-a684-72af8577f667','9e0865e3-e36d-4acd-a9c8-255d531a8aba','9e0865e3-e36d-4acd-a9c8-255d531a8aba','ingress','IPv6',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `securitygrouprules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `securitygroups`
--

DROP TABLE IF EXISTS `securitygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `securitygroups` (
  `tenant_id` varchar(255) DEFAULT NULL,
  `id` varchar(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_securitygroups_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `securitygroups`
--

LOCK TABLES `securitygroups` WRITE;
/*!40000 ALTER TABLE `securitygroups` DISABLE KEYS */;
INSERT INTO `securitygroups` VALUES ('f924c3bf43bb400a9852d6489705da5e','94c8fc5a-4b78-47db-92fd-2dd78c71975c','default','Default security group'),('5b6cca8b0e464a399f723e7660be3290','9e0865e3-e36d-4acd-a9c8-255d531a8aba','default','Default security group');
/*!40000 ALTER TABLE `securitygroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessionpersistences`
--

DROP TABLE IF EXISTS `sessionpersistences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessionpersistences` (
  `vip_id` varchar(36) NOT NULL,
  `type` enum('SOURCE_IP','HTTP_COOKIE','APP_COOKIE') NOT NULL,
  `cookie_name` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`vip_id`),
  CONSTRAINT `sessionpersistences_ibfk_1` FOREIGN KEY (`vip_id`) REFERENCES `vips` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessionpersistences`
--

LOCK TABLES `sessionpersistences` WRITE;
/*!40000 ALTER TABLE `sessionpersistences` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessionpersistences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subnetpoolprefixes`
--

DROP TABLE IF EXISTS `subnetpoolprefixes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subnetpoolprefixes` (
  `cidr` varchar(64) NOT NULL,
  `subnetpool_id` varchar(36) NOT NULL,
  PRIMARY KEY (`cidr`,`subnetpool_id`),
  KEY `subnetpool_id` (`subnetpool_id`),
  CONSTRAINT `subnetpoolprefixes_ibfk_1` FOREIGN KEY (`subnetpool_id`) REFERENCES `subnetpools` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subnetpoolprefixes`
--

LOCK TABLES `subnetpoolprefixes` WRITE;
/*!40000 ALTER TABLE `subnetpoolprefixes` DISABLE KEYS */;
/*!40000 ALTER TABLE `subnetpoolprefixes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subnetpools`
--

DROP TABLE IF EXISTS `subnetpools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subnetpools` (
  `tenant_id` varchar(255) DEFAULT NULL,
  `id` varchar(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `ip_version` int(11) NOT NULL,
  `default_prefixlen` int(11) NOT NULL,
  `min_prefixlen` int(11) NOT NULL,
  `max_prefixlen` int(11) NOT NULL,
  `shared` tinyint(1) NOT NULL,
  `default_quota` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_subnetpools_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subnetpools`
--

LOCK TABLES `subnetpools` WRITE;
/*!40000 ALTER TABLE `subnetpools` DISABLE KEYS */;
/*!40000 ALTER TABLE `subnetpools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subnetroutes`
--

DROP TABLE IF EXISTS `subnetroutes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subnetroutes` (
  `destination` varchar(64) NOT NULL,
  `nexthop` varchar(64) NOT NULL,
  `subnet_id` varchar(36) NOT NULL,
  PRIMARY KEY (`destination`,`nexthop`,`subnet_id`),
  KEY `subnet_id` (`subnet_id`),
  CONSTRAINT `subnetroutes_ibfk_1` FOREIGN KEY (`subnet_id`) REFERENCES `subnets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subnetroutes`
--

LOCK TABLES `subnetroutes` WRITE;
/*!40000 ALTER TABLE `subnetroutes` DISABLE KEYS */;
/*!40000 ALTER TABLE `subnetroutes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subnets`
--

DROP TABLE IF EXISTS `subnets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subnets` (
  `tenant_id` varchar(255) DEFAULT NULL,
  `id` varchar(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `network_id` varchar(36) DEFAULT NULL,
  `ip_version` int(11) NOT NULL,
  `cidr` varchar(64) NOT NULL,
  `gateway_ip` varchar(64) DEFAULT NULL,
  `enable_dhcp` tinyint(1) DEFAULT NULL,
  `shared` tinyint(1) DEFAULT NULL,
  `ipv6_ra_mode` enum('slaac','dhcpv6-stateful','dhcpv6-stateless') DEFAULT NULL,
  `ipv6_address_mode` enum('slaac','dhcpv6-stateful','dhcpv6-stateless') DEFAULT NULL,
  `subnetpool_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `network_id` (`network_id`),
  KEY `ix_subnets_tenant_id` (`tenant_id`),
  KEY `ix_subnets_subnetpool_id` (`subnetpool_id`),
  CONSTRAINT `subnets_ibfk_1` FOREIGN KEY (`network_id`) REFERENCES `networks` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subnets`
--

LOCK TABLES `subnets` WRITE;
/*!40000 ALTER TABLE `subnets` DISABLE KEYS */;
INSERT INTO `subnets` VALUES ('5b6cca8b0e464a399f723e7660be3290','d8532411-2794-4491-9553-5235e11abdc5','tony-sub','d815cb65-a06f-4afa-a8b0-4b1c0e569316',4,'11.11.11.0/24','11.11.11.1',1,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `subnets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tz_network_bindings`
--

DROP TABLE IF EXISTS `tz_network_bindings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tz_network_bindings` (
  `network_id` varchar(36) NOT NULL,
  `binding_type` enum('flat','vlan','stt','gre','l3_ext') NOT NULL,
  `phy_uuid` varchar(36) NOT NULL,
  `vlan_id` int(11) NOT NULL,
  PRIMARY KEY (`network_id`,`binding_type`,`phy_uuid`,`vlan_id`),
  CONSTRAINT `tz_network_bindings_ibfk_1` FOREIGN KEY (`network_id`) REFERENCES `networks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tz_network_bindings`
--

LOCK TABLES `tz_network_bindings` WRITE;
/*!40000 ALTER TABLE `tz_network_bindings` DISABLE KEYS */;
/*!40000 ALTER TABLE `tz_network_bindings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vcns_router_bindings`
--

DROP TABLE IF EXISTS `vcns_router_bindings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vcns_router_bindings` (
  `status` varchar(16) NOT NULL,
  `status_description` varchar(255) DEFAULT NULL,
  `router_id` varchar(36) NOT NULL,
  `edge_id` varchar(16) DEFAULT NULL,
  `lswitch_id` varchar(36) NOT NULL,
  PRIMARY KEY (`router_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vcns_router_bindings`
--

LOCK TABLES `vcns_router_bindings` WRITE;
/*!40000 ALTER TABLE `vcns_router_bindings` DISABLE KEYS */;
/*!40000 ALTER TABLE `vcns_router_bindings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vips`
--

DROP TABLE IF EXISTS `vips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vips` (
  `tenant_id` varchar(255) DEFAULT NULL,
  `id` varchar(36) NOT NULL,
  `status` varchar(16) NOT NULL,
  `status_description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `port_id` varchar(36) DEFAULT NULL,
  `protocol_port` int(11) NOT NULL,
  `protocol` enum('HTTP','HTTPS','TCP') NOT NULL,
  `pool_id` varchar(36) NOT NULL,
  `admin_state_up` tinyint(1) NOT NULL,
  `connection_limit` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pool_id` (`pool_id`),
  KEY `port_id` (`port_id`),
  CONSTRAINT `vips_ibfk_1` FOREIGN KEY (`port_id`) REFERENCES `ports` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vips`
--

LOCK TABLES `vips` WRITE;
/*!40000 ALTER TABLE `vips` DISABLE KEYS */;
/*!40000 ALTER TABLE `vips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vpnservices`
--

DROP TABLE IF EXISTS `vpnservices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vpnservices` (
  `tenant_id` varchar(255) DEFAULT NULL,
  `id` varchar(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` varchar(16) NOT NULL,
  `admin_state_up` tinyint(1) NOT NULL,
  `subnet_id` varchar(36) NOT NULL,
  `router_id` varchar(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subnet_id` (`subnet_id`),
  KEY `router_id` (`router_id`),
  CONSTRAINT `vpnservices_ibfk_1` FOREIGN KEY (`subnet_id`) REFERENCES `subnets` (`id`),
  CONSTRAINT `vpnservices_ibfk_2` FOREIGN KEY (`router_id`) REFERENCES `routers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vpnservices`
--

LOCK TABLES `vpnservices` WRITE;
/*!40000 ALTER TABLE `vpnservices` DISABLE KEYS */;
/*!40000 ALTER TABLE `vpnservices` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-08-31  1:30:53
