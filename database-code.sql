-- MySQL dump 10.13  Distrib 8.4.4, for macos15 (arm64)
--
-- Host: 127.0.0.1    Database: zelio
-- ------------------------------------------------------
-- Server version	8.4.4

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `activations`
--

DROP TABLE IF EXISTS `activations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `code` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activations_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activations`
--

LOCK TABLES `activations` WRITE;
/*!40000 ALTER TABLE `activations` DISABLE KEYS */;
INSERT INTO `activations` VALUES (1,1,'PHwrOquRzviZBfi52qHAfAHsHkjTaQhF',1,'2025-03-24 09:44:07','2025-03-24 09:44:07','2025-03-24 09:44:07');
/*!40000 ALTER TABLE `activations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_notifications`
--

DROP TABLE IF EXISTS `admin_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permission` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_notifications`
--

LOCK TABLES `admin_notifications` WRITE;
/*!40000 ALTER TABLE `admin_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcements` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `has_action` tinyint(1) NOT NULL DEFAULT '0',
  `action_label` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_url` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_open_new_tab` tinyint(1) NOT NULL DEFAULT '0',
  `dismissible` tinyint(1) NOT NULL DEFAULT '0',
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcements_translations`
--

DROP TABLE IF EXISTS `announcements_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcements_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `announcements_id` bigint unsigned NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `action_label` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`announcements_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements_translations`
--

LOCK TABLES `announcements_translations` WRITE;
/*!40000 ALTER TABLE `announcements_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcements_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_histories`
--

DROP TABLE IF EXISTS `audit_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `module` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request` longtext COLLATE utf8mb4_unicode_ci,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_user` bigint unsigned NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `audit_histories_user_id_index` (`user_id`),
  KEY `audit_histories_module_index` (`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_histories`
--

LOCK TABLES `audit_histories` WRITE;
/*!40000 ALTER TABLE `audit_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `icon` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int unsigned NOT NULL DEFAULT '0',
  `is_featured` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_parent_id_index` (`parent_id`),
  KEY `categories_status_index` (`status`),
  KEY `categories_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Web Development',0,'Recusandae consequatur explicabo enim perferendis quis reprehenderit et. Aut consequatur atque rerum labore. Nihil dolorem tempore hic quo beatae magnam.','published',1,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2025-03-24 09:44:09','2025-03-24 09:44:09'),(2,'Open Source Contributions',0,'Architecto enim qui autem cumque quis pariatur. Neque quia accusantium quod repellendus aut. Aut voluptatem culpa nihil autem.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2025-03-24 09:44:09','2025-03-24 09:44:09'),(3,'Tutorials',0,'Numquam facilis suscipit dolorem sapiente. Ullam qui blanditiis suscipit consequuntur. Deserunt neque qui inventore sunt.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2025-03-24 09:44:09','2025-03-24 09:44:09'),(4,'Technology Reviews',0,'Et velit error in illo debitis. Ut veritatis dolorum omnis dolorem quae consequatur et voluptatibus. Ut unde aut in sit repellat eum aperiam. Porro adipisci labore aut nemo aut voluptates.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2025-03-24 09:44:09','2025-03-24 09:44:09'),(5,'Personal Blog',0,'Officiis ex nemo doloribus similique rerum libero facilis. Error illum voluptatem tempora ullam. Dolor commodi quia nam. Beatae rem eius ut.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2025-03-24 09:44:09','2025-03-24 09:44:09'),(6,'Career Journey',0,'Consequuntur iusto qui autem quas in culpa. Ipsum quia sunt architecto nihil commodi ratione. Reiciendis quia et vel id amet. Tempore vero velit consequatur aperiam est nam.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2025-03-24 09:44:09','2025-03-24 09:44:09'),(7,'Coding Challenges',0,'Id officiis nam earum molestias voluptatum consequuntur in aut. Et maiores officiis voluptas voluptatem molestiae. Expedita quia neque quos.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2025-03-24 09:44:09','2025-03-24 09:44:09'),(8,'Design Portfolio',0,'Sit ullam dolorem enim nesciunt qui reprehenderit sapiente blanditiis. Rerum velit nostrum hic consequatur. Nostrum est temporibus aperiam in repudiandae.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2025-03-24 09:44:09','2025-03-24 09:44:09'),(9,'Collaborations',0,'Sunt quaerat odit a iure quae ut. Cupiditate qui libero incidunt magnam. Dolores perspiciatis dolores vel quaerat quam vel inventore. Illum ut autem quia similique.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2025-03-24 09:44:09','2025-03-24 09:44:09');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_translations`
--

DROP TABLE IF EXISTS `categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categories_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_translations`
--

LOCK TABLES `categories_translations` WRITE;
/*!40000 ALTER TABLE `categories_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_field_options`
--

DROP TABLE IF EXISTS `contact_custom_field_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_field_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `custom_field_id` bigint unsigned NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '999',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_field_options`
--

LOCK TABLES `contact_custom_field_options` WRITE;
/*!40000 ALTER TABLE `contact_custom_field_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_field_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_field_options_translations`
--

DROP TABLE IF EXISTS `contact_custom_field_options_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_field_options_translations` (
  `contact_custom_field_options_id` bigint unsigned NOT NULL,
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`contact_custom_field_options_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_field_options_translations`
--

LOCK TABLES `contact_custom_field_options_translations` WRITE;
/*!40000 ALTER TABLE `contact_custom_field_options_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_field_options_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_fields`
--

DROP TABLE IF EXISTS `contact_custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_fields` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `placeholder` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int NOT NULL DEFAULT '999',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_fields`
--

LOCK TABLES `contact_custom_fields` WRITE;
/*!40000 ALTER TABLE `contact_custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_fields_translations`
--

DROP TABLE IF EXISTS `contact_custom_fields_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_fields_translations` (
  `contact_custom_fields_id` bigint unsigned NOT NULL,
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `placeholder` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`contact_custom_fields_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_fields_translations`
--

LOCK TABLES `contact_custom_fields_translations` WRITE;
/*!40000 ALTER TABLE `contact_custom_fields_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_fields_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_replies`
--

DROP TABLE IF EXISTS `contact_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_replies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_replies`
--

LOCK TABLES `contact_replies` WRITE;
/*!40000 ALTER TABLE `contact_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_fields` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_widget_settings`
--

DROP TABLE IF EXISTS `dashboard_widget_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_widget_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned NOT NULL,
  `widget_id` bigint unsigned NOT NULL,
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `status` tinyint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_widget_settings_user_id_index` (`user_id`),
  KEY `dashboard_widget_settings_widget_id_index` (`widget_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_widget_settings`
--

LOCK TABLES `dashboard_widget_settings` WRITE;
/*!40000 ALTER TABLE `dashboard_widget_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_widget_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_widgets`
--

DROP TABLE IF EXISTS `dashboard_widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_widgets`
--

LOCK TABLES `dashboard_widgets` WRITE;
/*!40000 ALTER TABLE `dashboard_widgets` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_widgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq_categories`
--

DROP TABLE IF EXISTS `faq_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq_categories`
--

LOCK TABLES `faq_categories` WRITE;
/*!40000 ALTER TABLE `faq_categories` DISABLE KEYS */;
INSERT INTO `faq_categories` VALUES (1,'Service Offerings',0,'published','2025-03-24 09:44:10','2025-03-24 09:44:10',NULL),(2,'Cost and Billing',1,'published','2025-03-24 09:44:10','2025-03-24 09:44:10',NULL),(3,'Follow-Up Support',2,'published','2025-03-24 09:44:10','2025-03-24 09:44:10',NULL);
/*!40000 ALTER TABLE `faq_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq_categories_translations`
--

DROP TABLE IF EXISTS `faq_categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq_categories_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faq_categories_id` bigint unsigned NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`faq_categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq_categories_translations`
--

LOCK TABLES `faq_categories_translations` WRITE;
/*!40000 ALTER TABLE `faq_categories_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `faq_categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs`
--

DROP TABLE IF EXISTS `faqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faqs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs`
--

LOCK TABLES `faqs` WRITE;
/*!40000 ALTER TABLE `faqs` DISABLE KEYS */;
INSERT INTO `faqs` VALUES (1,'What is business consulting?','Business consulting involves providing expert advice to organizations to help them improve their performance and achieve their business objectives.',1,'published','2025-03-24 09:44:10','2025-03-24 09:44:10'),(2,'How can consulting services benefit my business?','Consulting services can provide insights, strategies, and solutions to address specific challenges, improve efficiency, enhance decision-making, and ultimately contribute to the overall success of your business.',2,'published','2025-03-24 09:44:10','2025-03-24 09:44:10'),(3,'What specific services do you provide?','We offer a range of services, including strategic planning, financial advisory, operations optimization, market research, and more. Our goal is to tailor our services to meet the unique needs of each client.',1,'published','2025-03-24 09:44:10','2025-03-24 09:44:10'),(4,'How do you structure your fees?','Our fees are structured based on the scope and complexity of the project. We offer different pricing models, including hourly rates, project-based fees, and retainer agreements. The specific fee structure will be discussed and agreed upon during the initial consultation.',1,'published','2025-03-24 09:44:10','2025-03-24 09:44:10'),(5,'What industries do you specialize in?','We have experience and expertise across various industries, including but not limited to technology, finance, healthcare, and manufacturing. Our consultants work closely with clients to understand industry-specific challenges and provide tailored solutions.',1,'published','2025-03-24 09:44:10','2025-03-24 09:44:10'),(6,'Can you share any client testimonials or case studies?','Certainly! We have a collection of client testimonials and case studies that highlight the success stories of our consulting engagements. Please visit our \'Client Success Stories\' section for more details.',3,'published','2025-03-24 09:44:10','2025-03-24 09:44:10'),(7,'How do you collaborate with clients during the consulting process?','We believe in a collaborative approach. Throughout the consulting process, we maintain open communication with our clients, involve key stakeholders, and ensure that the client\'s perspective is integral to the decision-making process.',2,'published','2025-03-24 09:44:10','2025-03-24 09:44:10'),(8,'How long does a typical consulting engagement last?','The duration of a consulting engagement varies depending on the nature and scope of the project. During the initial consultation, we work with clients to define the timeline and milestones for the project, ensuring alignment with their goals and objectives.',2,'published','2025-03-24 09:44:10','2025-03-24 09:44:10'),(9,'Who are the key members of your consulting team?','Our consulting team consists of highly qualified and experienced professionals with diverse backgrounds. You can learn more about our team members on the \'Meet the Team\' page of our website.',3,'published','2025-03-24 09:44:10','2025-03-24 09:44:10'),(10,'How do you handle client information and sensitive data?','We take data privacy and confidentiality seriously. Our firm adheres to strict security protocols to protect client information. We have established measures to ensure the confidentiality and security of sensitive data throughout the consulting process.',3,'published','2025-03-24 09:44:10','2025-03-24 09:44:10'),(11,'Is there ongoing support after the consulting engagement?','Yes, we provide ongoing support to our clients even after the completion of the consulting engagement. This may include follow-up meetings, additional training, and assistance with the implementation of recommended strategies to ensure sustained success.',2,'published','2025-03-24 09:44:10','2025-03-24 09:44:10'),(12,'What is your policy regarding cancellations?','Our cancellation policy is outlined in the consulting agreement. Generally, we require advance notice for cancellations, and any associated fees or refunds will be discussed and agreed upon during the initial engagement negotiations.',2,'published','2025-03-24 09:44:10','2025-03-24 09:44:10'),(13,'What is your approach to sustainability consulting?','In sustainability consulting, we work with clients to develop environmentally responsible and socially conscious business practices. Our approach involves assessing current operations, identifying areas for improvement, and implementing sustainable strategies to reduce environmental impact and promote corporate social responsibility.',1,'published','2025-03-24 09:44:10','2025-03-24 09:44:10'),(14,'Do you offer remote consulting services?','Yes, we offer remote consulting services to clients worldwide. Our team is equipped to conduct virtual meetings, collaborate online, and deliver effective consulting services remotely. This allows us to work with clients regardless of geographical location.',1,'published','2025-03-24 09:44:10','2025-03-24 09:44:10'),(15,'How can your technology integration services benefit my business?','Our technology integration services focus on streamlining business processes through the effective use of technology. By integrating the right technologies, we help businesses enhance efficiency, improve communication, and stay competitive in today\'s rapidly evolving digital landscape.',1,'published','2025-03-24 09:44:10','2025-03-24 09:44:10'),(16,'What sets your leadership development programs apart?','Our leadership development programs are designed to empower individuals at all levels of an organization. We go beyond traditional training, focusing on personalized coaching, mentorship, and experiential learning to cultivate effective and inspiring leaders within your company.',1,'published','2025-03-24 09:44:10','2025-03-24 09:44:10'),(17,'How do you stay updated on industry trends and best practices?','We are committed to staying at the forefront of industry trends and best practices. Our team actively engages in continuous learning, participates in relevant conferences, and maintains a strong network of industry professionals to ensure that our consulting services are informed by the latest insights and innovations.',1,'published','2025-03-24 09:44:10','2025-03-24 09:44:10'),(18,'What measures do you take to ensure the quality of your consulting services?','We prioritize the quality of our consulting services by implementing rigorous quality assurance processes. This includes regular reviews of our methodologies, ongoing training for our consultants, and soliciting feedback from clients to continuously improve our service delivery.',3,'published','2025-03-24 09:44:10','2025-03-24 09:44:10');
/*!40000 ALTER TABLE `faqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs_translations`
--

DROP TABLE IF EXISTS `faqs_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faqs_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faqs_id` bigint unsigned NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci,
  `answer` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`faqs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs_translations`
--

LOCK TABLES `faqs_translations` WRITE;
/*!40000 ALTER TABLE `faqs_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `faqs_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fob_comments`
--

DROP TABLE IF EXISTS `fob_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fob_comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `reply_to` bigint unsigned DEFAULT NULL,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_id` bigint unsigned DEFAULT NULL,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_id` bigint unsigned DEFAULT NULL,
  `reference_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fob_comments_author_type_author_id_index` (`author_type`,`author_id`),
  KEY `fob_comments_reference_type_reference_id_index` (`reference_type`,`reference_id`),
  KEY `fob_comments_reply_to_index` (`reply_to`),
  KEY `fob_comments_reference_url_index` (`reference_url`),
  KEY `fob_comments_status_index` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fob_comments`
--

LOCK TABLES `fob_comments` WRITE;
/*!40000 ALTER TABLE `fob_comments` DISABLE KEYS */;
INSERT INTO `fob_comments` VALUES (1,NULL,NULL,NULL,'Botble\\Blog\\Models\\Post',14,'http://zelio.test','Gerry Dach','mcrona@cummings.com','https://friendsofbotble.com','This is really helpful, thank you!','approved','190.105.73.113','Mozilla/5.0 (Macintosh; U; PPC Mac OS X 10_6_7 rv:6.0) Gecko/20210704 Firefox/37.0','2025-03-03 22:32:32','2025-03-24 09:44:13'),(2,NULL,NULL,NULL,'Botble\\Blog\\Models\\Post',11,'http://zelio.test','Vivienne Yost','keebler.cecelia@hammes.org','https://friendsofbotble.com','I found this article to be quite informative.','approved','130.207.74.94','Mozilla/5.0 (X11; Linux x86_64; rv:5.0) Gecko/20100204 Firefox/37.0','2025-03-17 16:07:35','2025-03-24 09:44:13'),(3,NULL,NULL,NULL,'Botble\\Blog\\Models\\Post',6,'http://zelio.test','Prof. Veronica Schmeler Sr.','laura47@hotmail.com','https://friendsofbotble.com','Wow, I never knew about this before!','approved','72.0.216.13','Mozilla/5.0 (X11; Linux i686) AppleWebKit/533.0 (KHTML, like Gecko) Chrome/89.0.4327.36 Safari/533.0 EdgA/89.01123.44','2025-02-28 01:02:30','2025-03-24 09:44:13'),(4,NULL,NULL,NULL,'Botble\\Blog\\Models\\Post',10,'http://zelio.test','Everett Kuhlman III','jettie96@nolan.com','https://friendsofbotble.com','Great job on explaining such a complex topic.','approved','161.2.23.49','Mozilla/5.0 (compatible; MSIE 8.0; Windows 98; Win 9x 4.90; Trident/4.1)','2025-03-02 01:27:51','2025-03-24 09:44:13'),(5,NULL,NULL,NULL,'Botble\\Blog\\Models\\Post',3,'http://zelio.test','Josefina Franecki II','vergie.hagenes@bogan.info','https://friendsofbotble.com','I have a question about the third paragraph.','approved','199.152.117.169','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/5340 (KHTML, like Gecko) Chrome/39.0.887.0 Mobile Safari/5340','2025-03-01 14:49:48','2025-03-24 09:44:13'),(6,NULL,NULL,NULL,'Botble\\Blog\\Models\\Post',14,'http://zelio.test','Prof. Stanton Larson','ellis81@yahoo.com','https://friendsofbotble.com','This article changed my perspective entirely.','approved','79.65.101.67','Mozilla/5.0 (compatible; MSIE 11.0; Windows NT 6.1; Trident/3.1)','2025-03-09 23:01:22','2025-03-24 09:44:13'),(7,NULL,NULL,NULL,'Botble\\Blog\\Models\\Post',15,'http://zelio.test','Stephany Rolfson','ukshlerin@green.com','https://friendsofbotble.com','I appreciate the effort you put into this.','approved','135.38.169.162','Mozilla/5.0 (X11; Linux x86_64; rv:5.0) Gecko/20140422 Firefox/35.0','2025-03-02 02:34:19','2025-03-24 09:44:13'),(8,NULL,NULL,NULL,'Botble\\Blog\\Models\\Post',3,'http://zelio.test','Giovanni Rutherford','yrohan@yahoo.com','https://friendsofbotble.com','This is exactly what I was looking for, thank you!','approved','87.135.245.227','Mozilla/5.0 (compatible; MSIE 8.0; Windows 95; Trident/5.1)','2025-03-23 11:23:38','2025-03-24 09:44:13'),(9,NULL,NULL,NULL,'Botble\\Blog\\Models\\Post',8,'http://zelio.test','Sigmund Pfeffer','berneice.satterfield@hotmail.com','https://friendsofbotble.com','I disagree with some points mentioned here, though.','approved','6.200.19.93','Opera/9.68 (X11; Linux i686; en-US) Presto/2.9.278 Version/12.00','2025-03-12 16:20:02','2025-03-24 09:44:13'),(10,NULL,NULL,NULL,'Botble\\Blog\\Models\\Post',13,'http://zelio.test','Brycen Weber IV','drew.hessel@yahoo.com','https://friendsofbotble.com','Could you provide more examples to illustrate your point?','approved','118.7.189.167','Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 5.1; Trident/3.0)','2025-03-11 05:16:24','2025-03-24 09:44:13'),(11,NULL,NULL,NULL,'Botble\\Blog\\Models\\Post',4,'http://zelio.test','Stone Mueller','carroll.geovany@okuneva.info','https://friendsofbotble.com','I wish there were more articles like this out there.','approved','75.134.129.112','Opera/8.70 (Windows NT 4.0; sl-SI) Presto/2.11.314 Version/12.00','2025-03-20 17:05:33','2025-03-24 09:44:13'),(12,NULL,NULL,NULL,'Botble\\Blog\\Models\\Post',11,'http://zelio.test','Mr. Allen Dibbert','mbradtke@yahoo.com','https://friendsofbotble.com','I\'m bookmarking this for future reference.','approved','212.227.15.152','Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_7_6 rv:2.0) Gecko/20191112 Firefox/36.0','2025-03-19 14:51:13','2025-03-24 09:44:13'),(13,NULL,NULL,NULL,'Botble\\Blog\\Models\\Post',2,'http://zelio.test','Brittany Spencer III','teagan.waters@herzog.com','https://friendsofbotble.com','I\'ve shared this with my friends, they loved it!','approved','202.116.40.112','Mozilla/5.0 (X11; Linux i686) AppleWebKit/5360 (KHTML, like Gecko) Chrome/39.0.850.0 Mobile Safari/5360','2025-03-02 21:21:21','2025-03-24 09:44:13'),(14,NULL,NULL,NULL,'Botble\\Blog\\Models\\Post',7,'http://zelio.test','Jarrod Schimmel','mkoelpin@jacobs.com','https://friendsofbotble.com','This article is a must-read for everyone interested in the topic.','approved','222.207.90.85','Mozilla/5.0 (Macintosh; U; PPC Mac OS X 10_5_6 rv:4.0) Gecko/20220721 Firefox/36.0','2025-03-11 10:18:53','2025-03-24 09:44:13'),(15,NULL,NULL,NULL,'Botble\\Blog\\Models\\Post',12,'http://zelio.test','Vince Legros','hulda75@yahoo.com','https://friendsofbotble.com','Thank you for shedding light on this important issue.','approved','67.53.18.43','Opera/8.91 (X11; Linux x86_64; nl-NL) Presto/2.9.334 Version/11.00','2025-03-15 15:47:26','2025-03-24 09:44:13'),(16,NULL,NULL,NULL,'Botble\\Blog\\Models\\Post',5,'http://zelio.test','Violet Dach Sr.','linnie25@lehner.com','https://friendsofbotble.com','I\'ve been searching for information on this topic, glad I found this article.','approved','221.251.68.252','Mozilla/5.0 (compatible; MSIE 7.0; Windows NT 5.1; Trident/5.0)','2025-03-15 11:02:48','2025-03-24 09:44:13'),(17,NULL,NULL,NULL,'Botble\\Blog\\Models\\Post',8,'http://zelio.test','Favian Skiles','kuhn.arnold@hotmail.com','https://friendsofbotble.com','I\'m blown away by the insights shared in this article.','approved','238.203.199.98','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/536.2 (KHTML, like Gecko) Chrome/85.0.4259.72 Safari/536.2 EdgA/85.01019.65','2025-02-25 05:10:34','2025-03-24 09:44:13'),(18,NULL,NULL,NULL,'Botble\\Blog\\Models\\Post',10,'http://zelio.test','Camryn Rosenbaum','christian42@hills.com','https://friendsofbotble.com','This article tackles a complex topic with clarity.','approved','254.187.201.72','Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_5) AppleWebKit/531.2 (KHTML, like Gecko) Chrome/90.0.4050.62 Safari/531.2 Edg/90.01021.86','2025-03-21 03:10:58','2025-03-24 09:44:13'),(19,NULL,NULL,NULL,'Botble\\Blog\\Models\\Post',3,'http://zelio.test','Werner Spinka','eliezer.kihn@yahoo.com','https://friendsofbotble.com','I\'m going to reflect on the ideas presented in this article.','approved','96.246.81.42','Mozilla/5.0 (Windows; U; Windows NT 5.1) AppleWebKit/533.41.2 (KHTML, like Gecko) Version/5.0.3 Safari/533.41.2','2025-03-18 23:39:52','2025-03-24 09:44:13'),(20,NULL,NULL,NULL,'Botble\\Blog\\Models\\Post',11,'http://zelio.test','Armand Kautzer','merle66@nikolaus.com','https://friendsofbotble.com','The author\'s passion for the subject shines through in this article.','approved','150.67.174.196','Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/537.1 (KHTML, like Gecko) Version/15.0 EdgiOS/82.01140.54 Mobile/15E148 Safari/537.1','2025-03-23 12:40:19','2025-03-24 09:44:13'),(21,NULL,NULL,NULL,'Botble\\Blog\\Models\\Post',10,'http://zelio.test','Jaylen Hodkiewicz','zechariah15@gmail.com','https://friendsofbotble.com','This article challenged my preconceptions in a thought-provoking way.','approved','177.113.51.23','Mozilla/5.0 (Macintosh; PPC Mac OS X 10_5_8) AppleWebKit/5342 (KHTML, like Gecko) Chrome/38.0.886.0 Mobile Safari/5342','2025-03-22 04:01:33','2025-03-24 09:44:13'),(22,NULL,NULL,NULL,'Botble\\Blog\\Models\\Post',9,'http://zelio.test','Howell Ondricka','alisa.pagac@keeling.com','https://friendsofbotble.com','I\'ve added this article to my reading list, it\'s worth revisiting.','approved','51.28.142.149','Mozilla/5.0 (Macintosh; PPC Mac OS X 10_6_9 rv:3.0; nl-NL) AppleWebKit/531.33.4 (KHTML, like Gecko) Version/5.0 Safari/531.33.4','2025-03-23 05:15:06','2025-03-24 09:44:13'),(23,NULL,NULL,NULL,'Botble\\Blog\\Models\\Post',4,'http://zelio.test','Dr. Kendra Huel DDS','frida40@gmail.com','https://friendsofbotble.com','This article offers practical advice that I can apply in real life.','approved','207.123.212.119','Mozilla/5.0 (compatible; MSIE 6.0; Windows 98; Trident/3.1)','2025-03-01 21:28:45','2025-03-24 09:44:13'),(24,NULL,NULL,NULL,'Botble\\Blog\\Models\\Post',12,'http://zelio.test','Mossie Quitzon','anita05@hotmail.com','https://friendsofbotble.com','I\'m going to recommend this article to my study group.','approved','63.40.65.44','Mozilla/5.0 (X11; Linux x86_64; rv:5.0) Gecko/20121208 Firefox/36.0','2025-03-04 01:56:09','2025-03-24 09:44:13'),(25,NULL,NULL,NULL,'Botble\\Blog\\Models\\Post',5,'http://zelio.test','Margie Kassulke','bednar.bennie@ullrich.biz','https://friendsofbotble.com','The examples provided really helped me understand the concept better.','approved','136.222.221.24','Mozilla/5.0 (X11; Linux x86_64; rv:7.0) Gecko/20200326 Firefox/35.0','2025-02-24 13:24:00','2025-03-24 09:44:13'),(26,NULL,NULL,NULL,'Botble\\Blog\\Models\\Post',12,'http://zelio.test','Camren Sporer','pfannerstill.jacquelyn@kutch.com','https://friendsofbotble.com','I resonate with the ideas presented here.','approved','246.236.34.144','Mozilla/5.0 (Windows NT 5.0) AppleWebKit/533.1 (KHTML, like Gecko) Chrome/93.0.4608.57 Safari/533.1 Edg/93.01036.90','2025-03-16 06:44:10','2025-03-24 09:44:13'),(27,NULL,NULL,NULL,'Botble\\Blog\\Models\\Post',4,'http://zelio.test','Matt Collins','xhane@hotmail.com','https://friendsofbotble.com','This article made me think critically about the topic.','approved','121.22.198.198','Mozilla/5.0 (Windows NT 6.0; nl-NL; rv:1.9.1.20) Gecko/20190220 Firefox/36.0','2025-03-17 07:26:43','2025-03-24 09:44:13'),(28,NULL,NULL,NULL,'Botble\\Blog\\Models\\Post',14,'http://zelio.test','Bridie Towne','maggio.garrett@gmail.com','https://friendsofbotble.com','I\'ll definitely come back to this article for reference.','approved','51.231.21.157','Mozilla/5.0 (Windows NT 6.0) AppleWebKit/537.2 (KHTML, like Gecko) Chrome/92.0.4511.17 Safari/537.2 Edg/92.01084.15','2025-03-14 21:54:06','2025-03-24 09:44:13'),(29,NULL,NULL,NULL,'Botble\\Blog\\Models\\Post',10,'http://zelio.test','Derick Schumm','jwuckert@kunde.com','https://friendsofbotble.com','I\'ve shared this on social media, it\'s too good not to share.','approved','87.118.212.178','Mozilla/5.0 (Windows 95; en-US; rv:1.9.0.20) Gecko/20171210 Firefox/37.0','2025-03-08 08:33:36','2025-03-24 09:44:13'),(30,NULL,NULL,NULL,'Botble\\Blog\\Models\\Post',3,'http://zelio.test','Mckenzie Wehner','lula24@terry.org','https://friendsofbotble.com','This article presents a balanced view on a controversial topic.','approved','227.111.130.124','Opera/9.79 (X11; Linux i686; nl-NL) Presto/2.12.160 Version/10.00','2025-03-09 05:03:24','2025-03-24 09:44:13'),(31,NULL,NULL,NULL,'Botble\\Blog\\Models\\Post',15,'http://zelio.test','Soledad Kris MD','jacquelyn.rosenbaum@hotmail.com','https://friendsofbotble.com','I\'m glad I stumbled upon this article, it\'s a gem.','approved','181.135.76.63','Mozilla/5.0 (compatible; MSIE 7.0; Windows NT 6.0; Trident/3.1)','2025-03-21 22:42:54','2025-03-24 09:44:13'),(32,NULL,NULL,NULL,'Botble\\Blog\\Models\\Post',2,'http://zelio.test','Dereck Mertz','ullrich.emelie@yahoo.com','https://friendsofbotble.com','I\'ve been struggling with this, your article helped a lot.','approved','88.208.237.126','Mozilla/5.0 (Windows NT 6.0) AppleWebKit/5311 (KHTML, like Gecko) Chrome/36.0.811.0 Mobile Safari/5311','2025-03-17 17:51:18','2025-03-24 09:44:13'),(33,NULL,NULL,NULL,'Botble\\Blog\\Models\\Post',8,'http://zelio.test','Prof. Elmore Bergnaum III','haley.missouri@gmail.com','https://friendsofbotble.com','I\'ve learned something new today, thanks to this article.','approved','205.156.227.149','Mozilla/5.0 (compatible; MSIE 6.0; Windows NT 4.0; Trident/3.1)','2025-03-21 15:48:28','2025-03-24 09:44:13'),(34,NULL,NULL,NULL,'Botble\\Blog\\Models\\Post',7,'http://zelio.test','Cecil Moen','olen.mohr@walker.com','https://friendsofbotble.com','Kudos to the author for a well-researched piece.','approved','121.19.34.181','Mozilla/5.0 (iPhone; CPU iPhone OS 13_1 like Mac OS X) AppleWebKit/535.1 (KHTML, like Gecko) Version/15.0 EdgiOS/98.01033.74 Mobile/15E148 Safari/535.1','2025-03-20 12:48:04','2025-03-24 09:44:13'),(35,NULL,NULL,NULL,'Botble\\Blog\\Models\\Post',1,'http://zelio.test','Mrs. Era Sporer','angeline07@kassulke.com','https://friendsofbotble.com','I\'m impressed by the depth of knowledge demonstrated here.','approved','42.165.118.41','Mozilla/5.0 (X11; Linux i686) AppleWebKit/531.2 (KHTML, like Gecko) Chrome/97.0.4475.58 Safari/531.2 EdgA/97.01130.87','2025-03-13 06:17:29','2025-03-24 09:44:13'),(36,NULL,NULL,NULL,'Botble\\Blog\\Models\\Post',14,'http://zelio.test','Lawrence Schinner','pbailey@kihn.biz','https://friendsofbotble.com','This article challenged my assumptions in a good way.','approved','67.135.174.194','Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_0 rv:4.0; en-US) AppleWebKit/534.23.2 (KHTML, like Gecko) Version/5.1 Safari/534.23.2','2025-03-19 00:13:18','2025-03-24 09:44:13'),(37,NULL,NULL,NULL,'Botble\\Blog\\Models\\Post',11,'http://zelio.test','Hester Dach','coralie.padberg@lynch.com','https://friendsofbotble.com','I\'ve shared this with my colleagues, it\'s worth discussing.','approved','31.115.104.70','Mozilla/5.0 (Windows CE; nl-NL; rv:1.9.2.20) Gecko/20170220 Firefox/36.0','2025-03-02 22:44:56','2025-03-24 09:44:13'),(38,NULL,NULL,NULL,'Botble\\Blog\\Models\\Post',5,'http://zelio.test','Marcia Yost','ecormier@okon.com','https://friendsofbotble.com','The information presented here is very valuable.','approved','252.217.231.242','Mozilla/5.0 (Macintosh; U; PPC Mac OS X 10_7_9) AppleWebKit/5331 (KHTML, like Gecko) Chrome/40.0.820.0 Mobile Safari/5331','2025-03-05 00:21:39','2025-03-24 09:44:13'),(39,NULL,NULL,NULL,'Botble\\Blog\\Models\\Post',9,'http://zelio.test','Mr. Lorenz Veum MD','armstrong.nora@yahoo.com','https://friendsofbotble.com','You have a talent for explaining complex topics clearly.','approved','81.131.204.118','Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_9) AppleWebKit/531.1 (KHTML, like Gecko) Chrome/91.0.4330.50 Safari/531.1 Edg/91.01072.33','2025-03-08 08:03:06','2025-03-24 09:44:13'),(40,NULL,NULL,NULL,'Botble\\Blog\\Models\\Post',14,'http://zelio.test','Golden Cummerata DDS','clotilde34@gmail.com','https://friendsofbotble.com','I\'m inspired to learn more about this after reading your article.','approved','168.214.212.91','Mozilla/5.0 (Macintosh; U; PPC Mac OS X 10_7_2 rv:3.0) Gecko/20140616 Firefox/35.0','2025-03-05 21:48:09','2025-03-24 09:44:13'),(41,NULL,NULL,NULL,'Botble\\Blog\\Models\\Post',11,'http://zelio.test','Mr. Gust Runte','else59@yahoo.com','https://friendsofbotble.com','This article deserves wider recognition.','approved','205.34.243.20','Mozilla/5.0 (Windows; U; Windows NT 5.1) AppleWebKit/535.48.7 (KHTML, like Gecko) Version/5.0.4 Safari/535.48.7','2025-03-19 08:55:31','2025-03-24 09:44:13'),(42,NULL,NULL,NULL,'Botble\\Blog\\Models\\Post',9,'http://zelio.test','Jevon Bogan','carmela62@gmail.com','https://friendsofbotble.com','I\'m grateful for the insights shared in this piece.','approved','200.123.28.77','Mozilla/5.0 (iPhone; CPU iPhone OS 7_2_2 like Mac OS X; nl-NL) AppleWebKit/535.38.5 (KHTML, like Gecko) Version/4.0.5 Mobile/8B117 Safari/6535.38.5','2025-02-28 01:08:30','2025-03-24 09:44:13'),(43,NULL,NULL,NULL,'Botble\\Blog\\Models\\Post',8,'http://zelio.test','Herminio Mraz','eleanora14@hotmail.com','https://friendsofbotble.com','The author presents a balanced view on a controversial topic.','approved','147.73.223.177','Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.2; Trident/3.0)','2025-03-13 05:35:00','2025-03-24 09:44:13'),(44,NULL,NULL,NULL,'Botble\\Blog\\Models\\Post',10,'http://zelio.test','Darrell Hirthe','brandi.monahan@gerlach.net','https://friendsofbotble.com','I\'m glad I stumbled upon this article, it\'s','approved','24.57.23.17','Mozilla/5.0 (Windows CE; en-US; rv:1.9.0.20) Gecko/20230531 Firefox/35.0','2025-03-23 23:49:51','2025-03-24 09:44:13'),(45,NULL,NULL,NULL,'Botble\\Blog\\Models\\Post',1,'http://zelio.test','Janessa Gaylord','eda.maggio@gmail.com','https://friendsofbotble.com','I\'ve been searching for information on this topic, glad I found this article. It\'s incredibly insightful and provides a comprehensive overview of the subject matter. I appreciate the effort put into researching and writing this piece. It\'s truly eye-opening and has given me a new perspective. Thank you for sharing your knowledge with us!','approved','72.105.167.71','Mozilla/5.0 (X11; Linux i686) AppleWebKit/535.1 (KHTML, like Gecko) Chrome/95.0.4599.94 Safari/535.1 EdgA/95.01036.17','2025-03-23 16:07:36','2025-03-24 09:44:13'),(46,NULL,NULL,NULL,'Botble\\Blog\\Models\\Post',10,'http://zelio.test','Kristina O\'Hara','duane40@gmail.com','https://friendsofbotble.com','This article is a masterpiece! It dives deep into the topic and offers valuable insights that are both thought-provoking and enlightening. The author\'s expertise is evident throughout, making it a compelling read from start to finish. I\'ll definitely be coming back to this for reference in the future.','approved','101.118.10.119','Mozilla/5.0 (Windows; U; Windows NT 4.0) AppleWebKit/531.23.3 (KHTML, like Gecko) Version/5.1 Safari/531.23.3','2025-02-28 01:57:59','2025-03-24 09:44:13'),(47,NULL,NULL,NULL,'Botble\\Blog\\Models\\Post',4,'http://zelio.test','Yvette Pfeffer Jr.','landen.mills@yahoo.com','https://friendsofbotble.com','I\'m amazed by the depth of analysis in this article. It covers a wide range of aspects related to the topic, providing a comprehensive understanding. The clarity of explanation is commendable, making complex concepts easy to grasp. This article has enriched my understanding and sparked further curiosity. Kudos to the author!','approved','50.19.161.57','Mozilla/5.0 (compatible; MSIE 10.0; Windows 95; Trident/5.1)','2025-03-05 14:39:58','2025-03-24 09:44:13');
/*!40000 ALTER TABLE `fob_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language_meta`
--

DROP TABLE IF EXISTS `language_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language_meta` (
  `lang_meta_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lang_meta_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_meta_origin` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`lang_meta_id`),
  KEY `language_meta_reference_id_index` (`reference_id`),
  KEY `meta_code_index` (`lang_meta_code`),
  KEY `meta_origin_index` (`lang_meta_origin`),
  KEY `meta_reference_type_index` (`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_meta`
--

LOCK TABLES `language_meta` WRITE;
/*!40000 ALTER TABLE `language_meta` DISABLE KEYS */;
INSERT INTO `language_meta` VALUES (1,'en_US','4491fe0f3442cf178421226b406a3d57',1,'Botble\\Menu\\Models\\MenuLocation'),(2,'en_US','a37c899120356767650d46d40135e690',1,'Botble\\Menu\\Models\\Menu');
/*!40000 ALTER TABLE `language_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `lang_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lang_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_locale` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_flag` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `lang_order` int NOT NULL DEFAULT '0',
  `lang_is_rtl` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  KEY `lang_locale_index` (`lang_locale`),
  KEY `lang_code_index` (`lang_code`),
  KEY `lang_is_default_index` (`lang_is_default`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'English','en','en_US','us',1,0,0);
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_files`
--

DROP TABLE IF EXISTS `media_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `folder_id` bigint unsigned NOT NULL DEFAULT '0',
  `mime_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `visibility` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'public',
  PRIMARY KEY (`id`),
  KEY `media_files_user_id_index` (`user_id`),
  KEY `media_files_index` (`folder_id`,`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_files`
--

LOCK TABLES `media_files` WRITE;
/*!40000 ALTER TABLE `media_files` DISABLE KEYS */;
INSERT INTO `media_files` VALUES (1,0,'1','1',2,'image/png',9448,'main/posts/1.png','[]','2025-03-24 09:44:08','2025-03-24 09:44:08',NULL,'public'),(2,0,'10','10',2,'image/png',9448,'main/posts/10.png','[]','2025-03-24 09:44:08','2025-03-24 09:44:08',NULL,'public'),(3,0,'11','11',2,'image/png',9448,'main/posts/11.png','[]','2025-03-24 09:44:08','2025-03-24 09:44:08',NULL,'public'),(4,0,'12','12',2,'image/png',9448,'main/posts/12.png','[]','2025-03-24 09:44:08','2025-03-24 09:44:08',NULL,'public'),(5,0,'2','2',2,'image/png',9448,'main/posts/2.png','[]','2025-03-24 09:44:08','2025-03-24 09:44:08',NULL,'public'),(6,0,'3','3',2,'image/png',9448,'main/posts/3.png','[]','2025-03-24 09:44:08','2025-03-24 09:44:08',NULL,'public'),(7,0,'4','4',2,'image/png',9448,'main/posts/4.png','[]','2025-03-24 09:44:08','2025-03-24 09:44:08',NULL,'public'),(8,0,'5','5',2,'image/png',9448,'main/posts/5.png','[]','2025-03-24 09:44:08','2025-03-24 09:44:08',NULL,'public'),(9,0,'6','6',2,'image/png',9448,'main/posts/6.png','[]','2025-03-24 09:44:08','2025-03-24 09:44:08',NULL,'public'),(10,0,'7','7',2,'image/png',9448,'main/posts/7.png','[]','2025-03-24 09:44:08','2025-03-24 09:44:08',NULL,'public'),(11,0,'8','8',2,'image/png',9448,'main/posts/8.png','[]','2025-03-24 09:44:08','2025-03-24 09:44:08',NULL,'public'),(12,0,'9','9',2,'image/png',9448,'main/posts/9.png','[]','2025-03-24 09:44:09','2025-03-24 09:44:09',NULL,'public'),(13,0,'background','background',2,'image/png',9448,'main/posts/background.png','[]','2025-03-24 09:44:09','2025-03-24 09:44:09',NULL,'public'),(14,0,'1','1',3,'image/png',2100,'main/avatars/1.png','[]','2025-03-24 09:44:09','2025-03-24 09:44:09',NULL,'public'),(15,0,'2','2',3,'image/png',2100,'main/avatars/2.png','[]','2025-03-24 09:44:09','2025-03-24 09:44:09',NULL,'public'),(16,0,'man','man',3,'image/png',2100,'main/avatars/man.png','[]','2025-03-24 09:44:09','2025-03-24 09:44:09',NULL,'public'),(17,0,'1','1',4,'image/png',9448,'main/projects/1.png','[]','2025-03-24 09:44:09','2025-03-24 09:44:09',NULL,'public'),(18,0,'2','2',4,'image/png',9448,'main/projects/2.png','[]','2025-03-24 09:44:09','2025-03-24 09:44:09',NULL,'public'),(19,0,'3','3',4,'image/png',9448,'main/projects/3.png','[]','2025-03-24 09:44:09','2025-03-24 09:44:09',NULL,'public'),(20,0,'4','4',4,'image/png',9448,'main/projects/4.png','[]','2025-03-24 09:44:09','2025-03-24 09:44:09',NULL,'public'),(21,0,'corporation-avatar','corporation-avatar',6,'image/png',674,'code/general/corporation-avatar.png','[]','2025-03-24 09:44:10','2025-03-24 09:44:10',NULL,'public'),(22,0,'favicon','favicon',6,'image/png',2465,'code/general/favicon.png','[]','2025-03-24 09:44:10','2025-03-24 09:44:10',NULL,'public'),(23,0,'footer-bg','footer-bg',6,'image/png',6888,'code/general/footer-bg.png','[]','2025-03-24 09:44:10','2025-03-24 09:44:10',NULL,'public'),(24,0,'hero-bg-dark','hero-bg-dark',6,'image/png',113996,'code/general/hero-bg-dark.png','[]','2025-03-24 09:44:10','2025-03-24 09:44:10',NULL,'public'),(25,0,'hero-bg','hero-bg',6,'image/png',116152,'code/general/hero-bg.png','[]','2025-03-24 09:44:10','2025-03-24 09:44:10',NULL,'public'),(26,0,'logo-dark','logo-dark',6,'image/png',2465,'code/general/logo-dark.png','[]','2025-03-24 09:44:10','2025-03-24 09:44:10',NULL,'public'),(27,0,'people-shape','people-shape',6,'image/png',7048,'code/general/people-shape.png','[]','2025-03-24 09:44:10','2025-03-24 09:44:10',NULL,'public'),(28,0,'people','people',6,'image/png',10553,'code/general/people.png','[]','2025-03-24 09:44:10','2025-03-24 09:44:10',NULL,'public'),(29,0,'projects-bg','projects-bg',6,'image/png',80873,'code/general/projects-bg.png','[]','2025-03-24 09:44:11','2025-03-24 09:44:11',NULL,'public'),(30,0,'services-bg','services-bg',6,'image/png',18424,'code/general/services-bg.png','[]','2025-03-24 09:44:11','2025-03-24 09:44:11',NULL,'public'),(31,0,'static-bg','static-bg',6,'image/png',26400,'code/general/static-bg.png','[]','2025-03-24 09:44:11','2025-03-24 09:44:11',NULL,'public'),(32,0,'1','1',7,'image/png',1866,'code/skills/1.png','[]','2025-03-24 09:44:11','2025-03-24 09:44:11',NULL,'public'),(33,0,'2','2',7,'image/png',1866,'code/skills/2.png','[]','2025-03-24 09:44:11','2025-03-24 09:44:11',NULL,'public'),(34,0,'3','3',7,'image/png',1866,'code/skills/3.png','[]','2025-03-24 09:44:11','2025-03-24 09:44:11',NULL,'public'),(35,0,'4','4',7,'image/png',1866,'code/skills/4.png','[]','2025-03-24 09:44:11','2025-03-24 09:44:11',NULL,'public'),(36,0,'5','5',7,'image/png',1866,'code/skills/5.png','[]','2025-03-24 09:44:11','2025-03-24 09:44:11',NULL,'public'),(37,0,'6','6',7,'image/png',1866,'code/skills/6.png','[]','2025-03-24 09:44:11','2025-03-24 09:44:11',NULL,'public'),(38,0,'7','7',7,'image/png',1866,'code/skills/7.png','[]','2025-03-24 09:44:11','2025-03-24 09:44:11',NULL,'public'),(39,0,'8','8',7,'image/png',1866,'code/skills/8.png','[]','2025-03-24 09:44:11','2025-03-24 09:44:11',NULL,'public'),(40,0,'9','9',7,'image/png',1866,'code/skills/9.png','[]','2025-03-24 09:44:12','2025-03-24 09:44:12',NULL,'public'),(41,0,'bravado','bravado',8,'image/png',1726,'code/companies/bravado.png','[]','2025-03-24 09:44:12','2025-03-24 09:44:12',NULL,'public'),(42,0,'gocardless','gocardless',8,'image/png',1726,'code/companies/gocardless.png','[]','2025-03-24 09:44:12','2025-03-24 09:44:12',NULL,'public'),(43,0,'google','google',8,'image/png',1726,'code/companies/google.png','[]','2025-03-24 09:44:12','2025-03-24 09:44:12',NULL,'public'),(44,0,'intercom','intercom',8,'image/png',1726,'code/companies/intercom.png','[]','2025-03-24 09:44:12','2025-03-24 09:44:12',NULL,'public'),(45,0,'monzo','monzo',8,'image/png',1726,'code/companies/monzo.png','[]','2025-03-24 09:44:12','2025-03-24 09:44:12',NULL,'public'),(46,0,'samsung','samsung',8,'image/png',1726,'code/companies/samsung.png','[]','2025-03-24 09:44:12','2025-03-24 09:44:12',NULL,'public'),(47,0,'spotify','spotify',8,'image/png',1726,'code/companies/spotify.png','[]','2025-03-24 09:44:12','2025-03-24 09:44:12',NULL,'public'),(48,0,'stripe','stripe',8,'image/png',1726,'code/companies/stripe.png','[]','2025-03-24 09:44:12','2025-03-24 09:44:12',NULL,'public'),(49,0,'visa','visa',8,'image/png',1726,'code/companies/visa.png','[]','2025-03-24 09:44:12','2025-03-24 09:44:12',NULL,'public'),(50,0,'amazon','amazon',9,'image/png',2100,'code/experiences/amazon.png','[]','2025-03-24 09:44:12','2025-03-24 09:44:12',NULL,'public'),(51,0,'google','google',9,'image/png',2100,'code/experiences/google.png','[]','2025-03-24 09:44:12','2025-03-24 09:44:12',NULL,'public'),(52,0,'paypal','paypal',9,'image/png',2100,'code/experiences/paypal.png','[]','2025-03-24 09:44:12','2025-03-24 09:44:12',NULL,'public'),(53,0,'x','x',9,'image/png',2100,'code/experiences/x.png','[]','2025-03-24 09:44:13','2025-03-24 09:44:13',NULL,'public');
/*!40000 ALTER TABLE `media_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_folders`
--

DROP TABLE IF EXISTS `media_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_folders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_folders_user_id_index` (`user_id`),
  KEY `media_folders_index` (`parent_id`,`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_folders`
--

LOCK TABLES `media_folders` WRITE;
/*!40000 ALTER TABLE `media_folders` DISABLE KEYS */;
INSERT INTO `media_folders` VALUES (1,0,'main',NULL,'main',0,'2025-03-24 09:44:08','2025-03-24 09:44:08',NULL),(2,0,'posts',NULL,'posts',1,'2025-03-24 09:44:08','2025-03-24 09:44:08',NULL),(3,0,'avatars',NULL,'avatars',1,'2025-03-24 09:44:09','2025-03-24 09:44:09',NULL),(4,0,'projects',NULL,'projects',1,'2025-03-24 09:44:09','2025-03-24 09:44:09',NULL),(5,0,'code',NULL,'code',0,'2025-03-24 09:44:10','2025-03-24 09:44:10',NULL),(6,0,'general',NULL,'general',5,'2025-03-24 09:44:10','2025-03-24 09:44:10',NULL),(7,0,'skills',NULL,'skills',5,'2025-03-24 09:44:11','2025-03-24 09:44:11',NULL),(8,0,'companies',NULL,'companies',5,'2025-03-24 09:44:12','2025-03-24 09:44:12',NULL),(9,0,'experiences',NULL,'experiences',5,'2025-03-24 09:44:12','2025-03-24 09:44:12',NULL);
/*!40000 ALTER TABLE `media_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_settings`
--

DROP TABLE IF EXISTS `media_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `media_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_settings`
--

LOCK TABLES `media_settings` WRITE;
/*!40000 ALTER TABLE `media_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_locations`
--

DROP TABLE IF EXISTS `menu_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_locations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint unsigned NOT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_locations_menu_id_created_at_index` (`menu_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_locations`
--

LOCK TABLES `menu_locations` WRITE;
/*!40000 ALTER TABLE `menu_locations` DISABLE KEYS */;
INSERT INTO `menu_locations` VALUES (1,1,'main-menu','2025-03-24 09:44:13','2025-03-24 09:44:13');
/*!40000 ALTER TABLE `menu_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_nodes`
--

DROP TABLE IF EXISTS `menu_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_nodes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint unsigned NOT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `reference_id` bigint unsigned DEFAULT NULL,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_font` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `css_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `has_child` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_nodes_menu_id_index` (`menu_id`),
  KEY `menu_nodes_parent_id_index` (`parent_id`),
  KEY `reference_id` (`reference_id`),
  KEY `reference_type` (`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_nodes`
--

LOCK TABLES `menu_nodes` WRITE;
/*!40000 ALTER TABLE `menu_nodes` DISABLE KEYS */;
INSERT INTO `menu_nodes` VALUES (1,1,0,1,'Botble\\Page\\Models\\Page','/home',NULL,0,'Home',NULL,'_self',1,'2025-03-24 09:44:13','2025-03-24 09:44:13'),(2,1,1,NULL,NULL,'https://zelio.botble.com',NULL,0,'Home 1 - Designer',NULL,'_blank',0,'2025-03-24 09:44:13','2025-03-24 09:44:13'),(3,1,1,NULL,NULL,'https://zelio-developer.botble.com',NULL,1,'Home 2 - Developer',NULL,'_blank',0,'2025-03-24 09:44:13','2025-03-24 09:44:13'),(4,1,1,NULL,NULL,'https://zelio-writer.botble.com',NULL,2,'Home 3 - Writer',NULL,'_blank',0,'2025-03-24 09:44:13','2025-03-24 09:44:13'),(5,1,0,2,'Botble\\Page\\Models\\Page','/services',NULL,1,'Services',NULL,'_self',0,'2025-03-24 09:44:13','2025-03-24 09:44:13'),(6,1,0,3,'Botble\\Page\\Models\\Page','/projects',NULL,2,'Portfolio',NULL,'_self',0,'2025-03-24 09:44:13','2025-03-24 09:44:13'),(7,1,0,4,'Botble\\Page\\Models\\Page','/pricing',NULL,3,'Pricing',NULL,'_self',0,'2025-03-24 09:44:13','2025-03-24 09:44:13'),(8,1,0,5,'Botble\\Page\\Models\\Page','/blog',NULL,4,'Blog',NULL,'_self',0,'2025-03-24 09:44:13','2025-03-24 09:44:13'),(9,1,0,6,'Botble\\Page\\Models\\Page','/contact',NULL,5,'Contact',NULL,'_self',0,'2025-03-24 09:44:13','2025-03-24 09:44:13');
/*!40000 ALTER TABLE `menu_nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'Main Menu','main-menu','published','2025-03-24 09:44:13','2025-03-24 09:44:13');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meta_boxes`
--

DROP TABLE IF EXISTS `meta_boxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meta_boxes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `meta_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` text COLLATE utf8mb4_unicode_ci,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meta_boxes_reference_id_index` (`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta_boxes`
--

LOCK TABLES `meta_boxes` WRITE;
/*!40000 ALTER TABLE `meta_boxes` DISABLE KEYS */;
INSERT INTO `meta_boxes` VALUES (1,'icon','[\"ti ti-api\"]',1,'Botble\\Portfolio\\Models\\Service','2025-03-24 09:44:10','2025-03-24 09:44:10'),(2,'icon','[\"ti ti-code\"]',2,'Botble\\Portfolio\\Models\\Service','2025-03-24 09:44:10','2025-03-24 09:44:10'),(3,'icon','[\"ti ti-device-mobile\"]',3,'Botble\\Portfolio\\Models\\Service','2025-03-24 09:44:10','2025-03-24 09:44:10'),(4,'icon','[\"ti ti-server\"]',4,'Botble\\Portfolio\\Models\\Service','2025-03-24 09:44:10','2025-03-24 09:44:10'),(5,'icon','[\"ti ti-cloud\"]',5,'Botble\\Portfolio\\Models\\Service','2025-03-24 09:44:10','2025-03-24 09:44:10'),(6,'icon','[\"ti ti-database\"]',6,'Botble\\Portfolio\\Models\\Service','2025-03-24 09:44:10','2025-03-24 09:44:10'),(7,'link','[\"https:\\/\\/example.com\\/crm-system\"]',1,'Botble\\Portfolio\\Models\\Project','2025-03-24 09:44:10','2025-03-24 09:44:10'),(8,'github_url','[\"https:\\/\\/github.com\\/botble\"]',1,'Botble\\Portfolio\\Models\\Project','2025-03-24 09:44:10','2025-03-24 09:44:10'),(9,'category_ids','[[1]]',1,'Botble\\Portfolio\\Models\\Project','2025-03-24 09:44:10','2025-03-24 09:44:10'),(10,'link','[\"https:\\/\\/example.com\\/e-learning\"]',2,'Botble\\Portfolio\\Models\\Project','2025-03-24 09:44:10','2025-03-24 09:44:10'),(11,'github_url','[\"https:\\/\\/github.com\\/botble\"]',2,'Botble\\Portfolio\\Models\\Project','2025-03-24 09:44:10','2025-03-24 09:44:10'),(12,'category_ids','[[1,2]]',2,'Botble\\Portfolio\\Models\\Project','2025-03-24 09:44:10','2025-03-24 09:44:10'),(13,'link','[\"https:\\/\\/example.com\\/mobile-banking\"]',3,'Botble\\Portfolio\\Models\\Project','2025-03-24 09:44:10','2025-03-24 09:44:10'),(14,'github_url','[\"https:\\/\\/github.com\\/botble\"]',3,'Botble\\Portfolio\\Models\\Project','2025-03-24 09:44:10','2025-03-24 09:44:10'),(15,'category_ids','[[3]]',3,'Botble\\Portfolio\\Models\\Project','2025-03-24 09:44:10','2025-03-24 09:44:10'),(16,'link','[\"https:\\/\\/example.com\\/cloud-infrastructure\"]',4,'Botble\\Portfolio\\Models\\Project','2025-03-24 09:44:10','2025-03-24 09:44:10'),(17,'github_url','[\"https:\\/\\/github.com\\/botble\"]',4,'Botble\\Portfolio\\Models\\Project','2025-03-24 09:44:10','2025-03-24 09:44:10'),(18,'category_ids','[[4]]',4,'Botble\\Portfolio\\Models\\Project','2025-03-24 09:44:10','2025-03-24 09:44:10');
/*!40000 ALTER TABLE `meta_boxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000001_create_cache_table',1),(2,'2013_04_09_032329_create_base_tables',1),(3,'2013_04_09_062329_create_revisions_table',1),(4,'2014_10_12_000000_create_users_table',1),(5,'2014_10_12_100000_create_password_reset_tokens_table',1),(6,'2015_06_18_033822_create_blog_table',1),(7,'2015_06_29_025744_create_audit_history',1),(8,'2016_05_28_112028_create_system_request_logs_table',1),(9,'2016_06_10_230148_create_acl_tables',1),(10,'2016_06_14_230857_create_menus_table',1),(11,'2016_06_17_091537_create_contacts_table',1),(12,'2016_06_28_221418_create_pages_table',1),(13,'2016_10_03_032336_create_languages_table',1),(14,'2016_10_05_074239_create_setting_table',1),(15,'2016_10_07_193005_create_translations_table',1),(16,'2016_11_28_032840_create_dashboard_widget_tables',1),(17,'2016_12_16_084601_create_widgets_table',1),(18,'2017_05_09_070343_create_media_tables',1),(19,'2017_10_24_154832_create_newsletter_table',1),(20,'2017_11_03_070450_create_slug_table',1),(21,'2018_07_09_214610_create_testimonial_table',1),(22,'2018_07_09_221238_create_faq_table',1),(23,'2019_01_05_053554_create_jobs_table',1),(24,'2019_08_19_000000_create_failed_jobs_table',1),(25,'2019_12_14_000001_create_personal_access_tokens_table',1),(26,'2021_02_16_092633_remove_default_value_for_author_type',1),(27,'2021_10_25_021023_fix-priority-load-for-language-advanced',1),(28,'2021_12_03_030600_create_blog_translations',1),(29,'2021_12_03_075608_create_page_translations',1),(30,'2021_12_03_082134_create_faq_translations',1),(31,'2021_12_03_083642_create_testimonials_translations',1),(32,'2022_04_19_113923_add_index_to_table_posts',1),(33,'2022_04_20_100851_add_index_to_media_table',1),(34,'2022_04_20_101046_add_index_to_menu_table',1),(35,'2022_07_10_034813_move_lang_folder_to_root',1),(36,'2022_08_04_051940_add_missing_column_expires_at',1),(37,'2022_09_01_000001_create_admin_notifications_tables',1),(38,'2022_10_14_024629_drop_column_is_featured',1),(39,'2022_11_18_063357_add_missing_timestamp_in_table_settings',1),(40,'2022_12_02_093615_update_slug_index_columns',1),(41,'2023_01_30_024431_add_alt_to_media_table',1),(42,'2023_02_16_042611_drop_table_password_resets',1),(43,'2023_04_23_005903_add_column_permissions_to_admin_notifications',1),(44,'2023_05_10_075124_drop_column_id_in_role_users_table',1),(45,'2023_07_06_011444_create_slug_translations_table',1),(46,'2023_07_25_072632_create_portfolio_tables',1),(47,'2023_08_11_060908_create_announcements_table',1),(48,'2023_08_21_090810_make_page_content_nullable',1),(49,'2023_08_29_074620_make_column_author_id_nullable',1),(50,'2023_09_11_023233_create_pf_custom_fields_table',1),(51,'2023_09_13_042633_add_columns_to_pf_projects_table',1),(52,'2023_09_13_044041_create_pf_project_categories_table',1),(53,'2023_09_14_021936_update_index_for_slugs_table',1),(54,'2023_09_14_022423_add_index_for_language_table',1),(55,'2023_09_22_061723_create_custom_fields_translations_table',1),(56,'2023_09_22_343531_remove_project_categories_table',1),(57,'2023_11_05_081701_fix_projects_table',1),(58,'2023_11_10_080225_migrate_contact_blacklist_email_domains_to_core',1),(59,'2023_11_14_033417_change_request_column_in_table_audit_histories',1),(60,'2023_11_17_063408_add_description_column_to_faq_categories_table',1),(61,'2023_12_07_095130_add_color_column_to_media_folders_table',1),(62,'2023_12_12_105220_drop_translations_table',1),(63,'2023_12_17_162208_make_sure_column_color_in_media_folders_nullable',1),(64,'2024_01_16_050056_create_comments_table',1),(65,'2024_03_20_080001_migrate_change_attribute_email_to_nullable_form_contacts_table',1),(66,'2024_03_25_000001_update_captcha_settings_for_contact',1),(67,'2024_03_25_000001_update_captcha_settings_for_newsletter',1),(68,'2024_04_04_110758_update_value_column_in_user_meta_table',1),(69,'2024_04_19_063914_create_custom_fields_table',1),(70,'2024_04_27_100730_improve_analytics_setting',1),(71,'2024_05_12_091229_add_column_visibility_to_table_media_files',1),(72,'2024_05_16_060328_add_projects_translations_table',1),(73,'2024_07_07_091316_fix_column_url_in_menu_nodes_table',1),(74,'2024_07_12_100000_change_random_hash_for_media',1),(75,'2024_07_30_091615_fix_order_column_in_categories_table',1),(76,'2024_09_09_075552_add_action_field_pf_packages_table',1),(77,'2024_09_30_024515_create_sessions_table',1),(78,'2024_11_14_024038_improve_pf_packages_table',1),(79,'2025_01_06_033807_add_default_value_for_categories_author_type',1),(80,'2025_01_19_145943_add_column_order_to_table_pf_services',1),(81,'2025_02_11_153025_add_action_label_to_announcement_translations',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletters`
--

DROP TABLE IF EXISTS `newsletters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsletters` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'subscribed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletters`
--

LOCK TABLES `newsletters` WRITE;
/*!40000 ALTER TABLE `newsletters` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pages_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'Home','[hero-banner style=&quot;2&quot; title=&quot;Senior &lt;span&gt;{Full Stack}&lt;/span&gt;Web &amp; App developer&quot; subtitle=&quot;Hey, I&rsquo;m James&quot; description=&quot;With expertise in cutting-edge technologies such as &lt;span&gt;NodeJS&lt;/span&gt;, &lt;span&gt;React&lt;/span&gt;, &lt;span&gt;Angular&lt;/span&gt;, and &lt;span&gt;Laravel&lt;/span&gt;... I deliver web solutions that are both innovative and robust.&quot; primary_button_text=&quot;Download My CV&quot; primary_button_link=&quot;/storage/main/resume/cv.pdf&quot; primary_button_icon=&quot;ti ti-download&quot; below_button_text=&quot;...and more&quot; open_secondary_link_in_the_new_tab=&quot;no&quot; quantity=&quot;5&quot; name_1=&quot;Next.js&quot; image_1=&quot;code/skills/1.png&quot; name_2=&quot;Firebase&quot; image_2=&quot;code/skills/2.png&quot; name_3=&quot;MongoDB&quot; image_3=&quot;code/skills/3.png&quot; name_4=&quot;Node.js&quot; image_4=&quot;code/skills/4.png&quot; name_5=&quot;Tailwind CSS&quot; image_5=&quot;code/skills/5.png&quot; background_image=&quot;code/general/hero-bg.png&quot; background_image_dark=&quot;code/general/hero-bg-dark.png&quot; right_image=&quot;code/general/people.png&quot; right_image_shape=&quot;code/general/people-shape.png&quot; enable_lazy_loading=&quot;no&quot;][/hero-banner]\n[stats-counter style=&quot;2&quot; quantity=&quot;4&quot; label_1=&quot;Years Experience&quot; icon_1=&quot;ti ti-crown&quot; count_1=&quot;12&quot; label_2=&quot;Projects Completed&quot; icon_2=&quot;ti ti-device-desktop&quot; count_2=&quot;250&quot; label_3=&quot;Satisfied Clients&quot; icon_3=&quot;ti ti-heart-spark&quot; count_3=&quot;680&quot; label_4=&quot;Awards Winner&quot; icon_4=&quot;ti ti-award&quot; count_4=&quot;18&quot; background_image=&quot;code/general/static-bg.png&quot; enable_lazy_loading=&quot;no&quot;][/stats-counter]\n[corporation title=&quot;More than +168 &lt;span&gt;companies &lt;br /&gt;&lt;/span&gt; trusted &lt;span&gt;worldwide_&lt;/span&gt;&quot; subtitle=&quot;Cooperation&quot; companies_quantity=&quot;9&quot; companies_name_1=&quot;bravado&quot; companies_image_1=&quot;code/companies/bravado.png&quot; companies_name_2=&quot;gocardless&quot; companies_image_2=&quot;code/companies/gocardless.png&quot; companies_name_3=&quot;google&quot; companies_image_3=&quot;code/companies/google.png&quot; companies_name_4=&quot;intercom&quot; companies_image_4=&quot;code/companies/intercom.png&quot; companies_name_5=&quot;monzo&quot; companies_image_5=&quot;code/companies/monzo.png&quot; companies_name_6=&quot;samsung&quot; companies_image_6=&quot;code/companies/samsung.png&quot; companies_name_7=&quot;spotify&quot; companies_image_7=&quot;code/companies/spotify.png&quot; companies_name_8=&quot;stripe&quot; companies_image_8=&quot;code/companies/stripe.png&quot; companies_name_9=&quot;visa&quot; companies_image_9=&quot;code/companies/visa.png&quot; contact_avatar=&quot;code/general/corporation-avatar.png&quot; journey_title=&quot;Git Journaling&quot; journeys_quantity=&quot;5&quot; journeys_date_1=&quot;15 Jul&quot; journeys_title_1=&quot;Muzzilla-streaming-API-services-for-Python&quot; journeys_date_2=&quot;30 Jun&quot; journeys_title_2=&quot;ChatHub-Chat-application-VueJs-Mongodb&quot; journeys_date_3=&quot;26 May&quot; journeys_title_3=&quot;DineEasy-coffee-tea-reservation-system&quot; journeys_date_4=&quot;17 Apr&quot; journeys_title_4=&quot;FinanceBuddy-Personal-finance-tracker&quot; journeys_date_5=&quot;05 Mar&quot; journeys_title_5=&quot;TuneStream-Music-streaming-service-API&quot; contacts_quantity=&quot;3&quot; contacts_label_1=&quot;skype&quot; contacts_content_1=&quot;james.doe&quot; contacts_url_1=&quot;skype:james.doe?chat&quot; contacts_icon_1=&quot;ti ti-brand-skype&quot; contacts_label_2=&quot;email&quot; contacts_content_2=&quot;contact@botble.com&quot; contacts_url_2=&quot;mailto:contact@botble.com&quot; contacts_icon_2=&quot;ti ti-mail&quot; contacts_label_3=&quot;phone&quot; contacts_content_3=&quot;+1-234-567-8901&quot; contacts_url_3=&quot;tel:+1-234-567-8901&quot; contacts_icon_3=&quot;ti ti-phone&quot; enable_lazy_loading=&quot;yes&quot;][/corporation]\n[services style=&quot;2&quot; title=&quot;Designing solutions &lt;span class=&#039;text-300&#039;&gt;customized&lt;br&gt;to meet your requirements&lt;/span&gt;&quot; subtitle=&quot;Cooperation&quot; service_ids=&quot;3,4,2,5,1,6&quot; bottom_text=&quot;Excited to take on &lt;span class=&#039;text-dark&#039;&gt;new projects&lt;/span&gt; and collaborate. &lt;br&gt;Let\\&#039;s chat about your ideas. &lt;a href=&#039;&#039; class=&#039;text-primary-2&#039;&gt;Reach out!&lt;/a&gt;&quot; enable_lazy_loading=&quot;yes&quot;][/services]\n[experience title=&quot;+12 &lt;span&gt;years of&lt;/span&gt; passion &lt;span&gt;for &lt;br /&gt; programming techniques&lt;/span&gt;&quot; subtitle=&quot;Experience&quot; role_title=&quot;Senior Software Engineer&quot; role_description=&quot;Led development of scalable web applications, &lt;span&gt;improving performance&lt;/span&gt; and user experience for millions of users. \\n Implemented machine learning algorithms to enhance search functionality. \\n Collaborated with cross-functional teams to integrate new features seamlessly.&quot; experiences_quantity=&quot;4&quot; experiences_date_1=&quot;2018 - Present&quot; experiences_title_1=&quot;Google&quot; experiences_logo_1=&quot;code/experiences/google.png&quot; experiences_date_2=&quot;2012 - 2015&quot; experiences_title_2=&quot;Twitter (X)&quot; experiences_logo_2=&quot;code/experiences/x.png&quot; experiences_date_3=&quot;2018 - Present&quot; experiences_title_3=&quot;Amazon&quot; experiences_logo_3=&quot;code/experiences/amazon.png&quot; experiences_date_4=&quot;2010 - 2012&quot; experiences_title_4=&quot;Paypal&quot; experiences_logo_4=&quot;code/experiences/paypal.png&quot; skills_quantity=&quot;5&quot; skills_name_1=&quot;Python&quot; skills_name_2=&quot;TensorFlow&quot; skills_name_3=&quot;Angular&quot; skills_name_4=&quot;Kubernetes&quot; skills_name_5=&quot;GCP&quot; background_image=&quot;code/general/services-bg.png&quot; enable_lazy_loading=&quot;yes&quot;][/experience]\n[resume style=&quot;2&quot; resume_1_title=&quot;Education&quot; resume_1_title_icon=&quot;ti ti-school&quot; resume_1_quantity=&quot;4&quot; resume_1_time_1=&quot;2018 - 2019&quot; resume_1_title_1=&quot;Certification in UX Design&quot; resume_1_subtitle_1=&quot;University of Stanford&quot; resume_1_time_2=&quot;2017 - 2018&quot; resume_1_title_2=&quot;Certification in Web Dev&quot; resume_1_subtitle_2=&quot;University of Stanford&quot; resume_1_time_3=&quot;2014 - 2016&quot; resume_1_title_3=&quot;Advanced UX/UI Bootcamp&quot; resume_1_subtitle_3=&quot;Design Academy&quot; resume_1_time_4=&quot;2012 - 2013&quot; resume_1_title_4=&quot;Certification in Graphic Design&quot; resume_1_subtitle_4=&quot;Coursera&quot; resume_2_title=&quot;Experience&quot; resume_2_title_icon=&quot;ti ti-stars&quot; resume_2_quantity=&quot;4&quot; resume_2_time_1=&quot;2019 - Present&quot; resume_2_title_1=&quot;Senior UI/UX Designer&quot; resume_2_subtitle_1=&quot;Leader in Creative team&quot; resume_2_time_2=&quot;2016 - 2019&quot; resume_2_title_2=&quot;UI/UX Designer&quot; resume_2_subtitle_2=&quot;Tech Startup&quot; resume_2_time_3=&quot;2014 - 2016&quot; resume_2_title_3=&quot;Freelance UI/UX Designer&quot; resume_2_subtitle_3=&quot;Self-Employed&quot; resume_2_time_4=&quot;2012 - 2014&quot; resume_2_title_4=&quot;Junior UI Designer&quot; resume_2_subtitle_4=&quot;Web Solutions team&quot; enable_lazy_loading=&quot;yes&quot;][/resume]\n[projects style=&quot;2&quot; title=&quot;My Recent Works&quot; subtitle=&quot;Projects&quot; project_ids=&quot;1,2,3,4&quot; background_image=&quot;code/general/projects-bg.png&quot; enable_lazy_loading=&quot;yes&quot;][/projects]\n[skills style=&quot;2&quot; title=&quot;My Skills&quot; subtitle=&quot;Projects&quot; quantity=&quot;9&quot; name_1=&quot;Next.js&quot; image_1=&quot;code/skills/1.png&quot; name_2=&quot;Firebase&quot; image_2=&quot;code/skills/2.png&quot; name_3=&quot;MongoDB&quot; image_3=&quot;code/skills/3.png&quot; name_4=&quot;Node.js&quot; image_4=&quot;code/skills/4.png&quot; name_5=&quot;Tailwind CSS&quot; image_5=&quot;code/skills/5.png&quot; name_6=&quot;React&quot; image_6=&quot;code/skills/6.png&quot; name_7=&quot;Vue.js&quot; image_7=&quot;code/skills/7.png&quot; name_8=&quot;Angular&quot; image_8=&quot;code/skills/8.png&quot; name_9=&quot;Laravel&quot; image_9=&quot;code/skills/9.png&quot; list_quantity=&quot;5&quot; list_label_1=&quot;Front-End&quot; list_content_1=&quot;HTML, CSS, JavaScript, React, Angular&quot; list_label_2=&quot;Back-End&quot; list_content_2=&quot;Node.js, Express, Python, Django&quot; list_label_3=&quot;Databases&quot; list_content_3=&quot;MySQL, PostgreSQL, MongoDB&quot; list_label_4=&quot;Tools &amp; Platforms&quot; list_content_4=&quot;Git, Docker, AWS, Heroku&quot; list_label_5=&quot;Others&quot; list_content_5=&quot;RESTful APIs, GraphQL, Agile Methodologies&quot; enable_lazy_loading=&quot;yes&quot;][/skills]\n[blog-posts style=&quot;2&quot; paginate=&quot;3&quot; title=&quot;Recent blog&quot; subtitle=&quot;Latest Posts&quot; enable_lazy_loading=&quot;yes&quot;][/blog-posts]\n[contact-form style=&quot;2&quot; display_fields=&quot;phone,email,subject,address&quot; mandatory_fields=&quot;email,subject&quot; title=&quot;Let&#039;s connect&quot; quantity=&quot;4&quot; label_1=&quot;Phone&quot; content_1=&quot;+1-234-567-8901&quot; icon_1=&quot;ti ti-phone&quot; url_1=&quot;tel:+1-234-567-8901&quot; label_2=&quot;Email&quot; content_2=&quot;contact@botble.com&quot; icon_2=&quot;ti ti-mail&quot; url_2=&quot;mailto:contact@botble.com&quot; label_3=&quot;X (Twitter)&quot; content_3=&quot;Botble Technologies&quot; icon_3=&quot;ti ti-user&quot; url_3=&quot;https://x.com/botble&quot; label_4=&quot;Address&quot; content_4=&quot;0811 Erdman Prairie, Joaville CA&quot; icon_4=&quot;ti ti-map&quot; url_4=&quot;https://google.com/maps&quot;][/contact-form]',1,NULL,NULL,NULL,'published','2025-03-24 09:44:13','2025-03-24 09:44:13'),(2,'Services','[services style=&quot;4&quot; enable_lazy_loading=&quot;no&quot;][/services]',1,NULL,'has-heading','\n                With expertise in mobile app and web design, I transform ideas into visually\n                stunning and user-friendly interfaces that captivate and retain users.\n                Explore my work and see design in action.','published','2025-03-24 09:44:13','2025-03-24 09:44:13'),(3,'Projects','[projects style=&quot;4&quot; enable_lazy_loading=&quot;no&quot;][/projects]',1,NULL,'has-heading','\n                With expertise in mobile app and web design, I transform ideas into visually\n                stunning and user-friendly interfaces that captivate and retain users.\n                Explore my work and see design in action.','published','2025-03-24 09:44:13','2025-03-24 09:44:13'),(4,'Pricing','[pricing-plans package_ids=&quot;1,2&quot; enable_lazy_loading=&quot;no&quot;][/pricing-plans]\n[faqs title=&quot;Common Questions&quot; category_ids=&quot;1&quot; enable_lazy_loading=&quot;no&quot;][/faqs]',1,NULL,'has-heading','Flexible Plans Tailored to Meet Your Unique Needs, Ensuring High-Quality Services\n                Without Breaking the Bank','published','2025-03-24 09:44:13','2025-03-24 09:44:13'),(5,'Blog','',1,NULL,'has-heading','Discover key insights and emerging trends shaping the future of design: a detailed\n                examination of how these innovations are reshaping our industry','published','2025-03-24 09:44:13','2025-03-24 09:44:13'),(6,'Contact','[contact-form style=&quot;2&quot; display_fields=&quot;phone,email,subject,address&quot; mandatory_fields=&quot;email,subject&quot; title=&quot;Let&#039;s connect&quot; quantity=&quot;4&quot; label_1=&quot;Phone&quot; content_1=&quot;+1-234-567-8901&quot; icon_1=&quot;ti ti-phone&quot; url_1=&quot;tel:+1-234-567-8901&quot; label_2=&quot;Email&quot; content_2=&quot;contact@botble.com&quot; icon_2=&quot;ti ti-mail&quot; url_2=&quot;mailto:contact@botble.com&quot; label_3=&quot;X (Twitter)&quot; content_3=&quot;Botble Technologies&quot; icon_3=&quot;ti ti-user&quot; url_3=&quot;https://x.com/botble&quot; label_4=&quot;Address&quot; content_4=&quot;0811 Erdman Prairie, Joaville CA&quot; icon_4=&quot;ti ti-map&quot; url_4=&quot;https://google.com/maps&quot;][/contact-form]',1,NULL,'has-heading',NULL,'published','2025-03-24 09:44:13','2025-03-24 09:44:13'),(7,'Cookie Policy','<h3>EU Cookie Consent</h3><p>To use this website we are using Cookies and collecting some Data. To be compliant with the EU GDPR we give you to choose if you allow us to use certain Cookies and to collect some Data.</p><h4>Essential Data</h4><p>The Essential Data is needed to run the Site you are visiting technically. You can not deactivate them.</p><p>- Session Cookie: PHP uses a Cookie to identify user sessions. Without this Cookie the Website is not working.</p><p>- XSRF-Token Cookie: Laravel automatically generates a CSRF \"token\" for each active user session managed by the application. This token is used to verify that the authenticated user is the one actually making the requests to the application.</p>',1,NULL,'has-heading',NULL,'published','2025-03-24 09:44:13','2025-03-24 09:44:13');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_translations`
--

DROP TABLE IF EXISTS `pages_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pages_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`pages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_translations`
--

LOCK TABLES `pages_translations` WRITE;
/*!40000 ALTER TABLE `pages_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pf_custom_field_options`
--

DROP TABLE IF EXISTS `pf_custom_field_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pf_custom_field_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `custom_field_id` bigint unsigned NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '999',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pf_custom_field_options_custom_field_id_index` (`custom_field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pf_custom_field_options`
--

LOCK TABLES `pf_custom_field_options` WRITE;
/*!40000 ALTER TABLE `pf_custom_field_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `pf_custom_field_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pf_custom_field_options_translations`
--

DROP TABLE IF EXISTS `pf_custom_field_options_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pf_custom_field_options_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pf_custom_field_options_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`lang_code`,`pf_custom_field_options_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pf_custom_field_options_translations`
--

LOCK TABLES `pf_custom_field_options_translations` WRITE;
/*!40000 ALTER TABLE `pf_custom_field_options_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `pf_custom_field_options_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pf_custom_fields`
--

DROP TABLE IF EXISTS `pf_custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pf_custom_fields` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `placeholder` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '999',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pf_custom_fields_author_type_author_id_index` (`author_type`,`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pf_custom_fields`
--

LOCK TABLES `pf_custom_fields` WRITE;
/*!40000 ALTER TABLE `pf_custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `pf_custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pf_custom_fields_translations`
--

DROP TABLE IF EXISTS `pf_custom_fields_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pf_custom_fields_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `placeholder` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pf_custom_fields_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`lang_code`,`pf_custom_fields_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pf_custom_fields_translations`
--

LOCK TABLES `pf_custom_fields_translations` WRITE;
/*!40000 ALTER TABLE `pf_custom_fields_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `pf_custom_fields_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pf_packages`
--

DROP TABLE IF EXISTS `pf_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pf_packages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `annual_price` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'monthly',
  `features` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `is_popular` tinyint(1) NOT NULL DEFAULT '0',
  `action_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pf_packages`
--

LOCK TABLES `pf_packages` WRITE;
/*!40000 ALTER TABLE `pf_packages` DISABLE KEYS */;
INSERT INTO `pf_packages` VALUES (1,'Basic','For small businesses and startups.','','$49',NULL,'hourly','Require your wireframe\nDesign using Figma, Framer\nDevelop with Webflow, React, WordPress, Laravel/PHP\nRemote/Online collaboration\nAvailable on business days, no weekends\n6 months of support','published',0,'Get Started','/contact','2025-03-24 09:44:10','2025-03-24 09:44:10',0),(2,'Business','For growing businesses and agencies.','','$99',NULL,'hourly','No wireframe needed\nDesign using Figma, Framer\nDevelop with Webflow, React, WordPress, Laravel/PHP\nRemote/Online collaboration\nAvailable on business days, no weekends\n12 months of support\nYour project is always a priority\nCustomer care gifts included','published',0,'Get Started','/contact','2025-03-24 09:44:10','2025-03-24 09:44:10',0);
/*!40000 ALTER TABLE `pf_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pf_packages_translations`
--

DROP TABLE IF EXISTS `pf_packages_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pf_packages_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pf_packages_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `price` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `annual_price` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `features` text COLLATE utf8mb4_unicode_ci,
  `action_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`pf_packages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pf_packages_translations`
--

LOCK TABLES `pf_packages_translations` WRITE;
/*!40000 ALTER TABLE `pf_packages_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `pf_packages_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pf_projects`
--

DROP TABLE IF EXISTS `pf_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pf_projects` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `place` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` text COLLATE utf8mb4_unicode_ci,
  `views` int NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `author` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pf_projects`
--

LOCK TABLES `pf_projects` WRITE;
/*!40000 ALTER TABLE `pf_projects` DISABLE KEYS */;
INSERT INTO `pf_projects` VALUES (1,'CRM System','A custom-built CRM system with real-time data synchronization and multi-user support.','<h5 class=\"fs-5 fw-medium\">Description</h5>\n<p class=\"text-300\">Travila is a comprehensive travel booking app designed to provide users with a seamless and enjoyable booking experience. The project involved creating an intuitive and visually appealing user interface, ensuring that users can effortlessly book flights, hotels, and car rentals all within a single app. The primary goal was to enhance the overall user experience, making travel planning easy and enjoyable.</p>\n<h5 class=\"fs-5 fw-medium mt-4\">Key Features</h5>\n<ul>\n    <li>\n        <p class=\"text-dark fw-bold\">User-Centric Interface: <span class=\"text-300 fw-medium\">Designed a clean and intuitive interface that allows users to navigate through the app with ease, ensuring a smooth and enjoyable booking process.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Integrated Search and Booking: <span class=\"text-300 fw-medium\">Developed an integrated search function that enables users to find and book flights, hotels, and car rentals quickly and efficiently.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Personalized Recommendations: <span class=\"text-300 fw-medium\">Implemented a recommendation system that suggests destinations, accommodations, and activities based on user preferences and past behaviors.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">\n            Secure Payment Gateway: <span class=\"text-300 fw-medium\">Integrated a secure payment gateway to ensure that all transactions <span class=\"text-dark fw-bold\">are safe and user data is protected.</span></span>\n        </p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Interactive Maps: <span class=\"text-300 fw-medium\">Added interactive maps to help users explore destinations, find nearby attractions, and get directions.</span></p>\n    </li>\n</ul>\n<h5 class=\"fs-5 fw-medium mt-4\">Technologies Used</h5>\n<ul>\n    <li>\n        <p class=\"text-dark fw-bold\">Front-End: <span class=\"text-300 fw-medium\">React Native for cross-platform mobile development, ensuring a consistent experience on both iOS and Android devices.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Back-End: <span class=\"text-300 fw-medium\">Node.js and Express for handling server-side logic and database interactions.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Database: <span class=\"text-300 fw-medium\">MongoDB for flexible data storage and retrieval.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">APIs: <span class=\"text-300 fw-medium\">Integrated third-party APIs for flight, hotel, and car rental bookings to provide a wide range of options to users.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Payment Integration: <span class=\"text-300 fw-medium\">Stripe API for secure and reliable payment processing.</span></p>\n    </li>\n</ul>\n<h5 class=\"fs-5 fw-medium mt-4\">Design Highlights</h5>\n<ul>\n    <li>\n        <p class=\"text-dark fw-bold\">Visual Appeal: <span class=\"text-300 fw-medium\">Focused on a visually appealing design with high-quality images and a modern color palette to enhance user engagement.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Usability: <span class=\"text-300 fw-medium\">Ensured the app is user-friendly with clear icons, concise labels, and a straightforward navigation structure.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Responsive Design: <span class=\"text-300 fw-medium\">Made the app responsive to different screen sizes and orientations, providing a consistent user experience across various devices.</span></p>\n    </li>\n</ul>\n',NULL,'Corporate Client',0,'main/projects/1.png',NULL,3027,'published','2025-03-24 09:44:10','2025-03-24 09:44:10',NULL,'2023-06-01',0),(2,'E-Learning Platform','A scalable e-learning platform with integrated payment and live chat functionalities.','<h5 class=\"fs-5 fw-medium\">Description</h5>\n<p class=\"text-300\">Travila is a comprehensive travel booking app designed to provide users with a seamless and enjoyable booking experience. The project involved creating an intuitive and visually appealing user interface, ensuring that users can effortlessly book flights, hotels, and car rentals all within a single app. The primary goal was to enhance the overall user experience, making travel planning easy and enjoyable.</p>\n<h5 class=\"fs-5 fw-medium mt-4\">Key Features</h5>\n<ul>\n    <li>\n        <p class=\"text-dark fw-bold\">User-Centric Interface: <span class=\"text-300 fw-medium\">Designed a clean and intuitive interface that allows users to navigate through the app with ease, ensuring a smooth and enjoyable booking process.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Integrated Search and Booking: <span class=\"text-300 fw-medium\">Developed an integrated search function that enables users to find and book flights, hotels, and car rentals quickly and efficiently.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Personalized Recommendations: <span class=\"text-300 fw-medium\">Implemented a recommendation system that suggests destinations, accommodations, and activities based on user preferences and past behaviors.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">\n            Secure Payment Gateway: <span class=\"text-300 fw-medium\">Integrated a secure payment gateway to ensure that all transactions <span class=\"text-dark fw-bold\">are safe and user data is protected.</span></span>\n        </p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Interactive Maps: <span class=\"text-300 fw-medium\">Added interactive maps to help users explore destinations, find nearby attractions, and get directions.</span></p>\n    </li>\n</ul>\n<h5 class=\"fs-5 fw-medium mt-4\">Technologies Used</h5>\n<ul>\n    <li>\n        <p class=\"text-dark fw-bold\">Front-End: <span class=\"text-300 fw-medium\">React Native for cross-platform mobile development, ensuring a consistent experience on both iOS and Android devices.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Back-End: <span class=\"text-300 fw-medium\">Node.js and Express for handling server-side logic and database interactions.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Database: <span class=\"text-300 fw-medium\">MongoDB for flexible data storage and retrieval.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">APIs: <span class=\"text-300 fw-medium\">Integrated third-party APIs for flight, hotel, and car rental bookings to provide a wide range of options to users.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Payment Integration: <span class=\"text-300 fw-medium\">Stripe API for secure and reliable payment processing.</span></p>\n    </li>\n</ul>\n<h5 class=\"fs-5 fw-medium mt-4\">Design Highlights</h5>\n<ul>\n    <li>\n        <p class=\"text-dark fw-bold\">Visual Appeal: <span class=\"text-300 fw-medium\">Focused on a visually appealing design with high-quality images and a modern color palette to enhance user engagement.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Usability: <span class=\"text-300 fw-medium\">Ensured the app is user-friendly with clear icons, concise labels, and a straightforward navigation structure.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Responsive Design: <span class=\"text-300 fw-medium\">Made the app responsive to different screen sizes and orientations, providing a consistent user experience across various devices.</span></p>\n    </li>\n</ul>\n',NULL,'Education Startup',0,'main/projects/2.png',NULL,3880,'published','2025-03-24 09:44:10','2025-03-24 09:44:10',NULL,'2023-03-15',0),(3,'Mobile Banking App','A secure and user-friendly mobile banking app for managing personal finances.','<h5 class=\"fs-5 fw-medium\">Description</h5>\n<p class=\"text-300\">Travila is a comprehensive travel booking app designed to provide users with a seamless and enjoyable booking experience. The project involved creating an intuitive and visually appealing user interface, ensuring that users can effortlessly book flights, hotels, and car rentals all within a single app. The primary goal was to enhance the overall user experience, making travel planning easy and enjoyable.</p>\n<h5 class=\"fs-5 fw-medium mt-4\">Key Features</h5>\n<ul>\n    <li>\n        <p class=\"text-dark fw-bold\">User-Centric Interface: <span class=\"text-300 fw-medium\">Designed a clean and intuitive interface that allows users to navigate through the app with ease, ensuring a smooth and enjoyable booking process.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Integrated Search and Booking: <span class=\"text-300 fw-medium\">Developed an integrated search function that enables users to find and book flights, hotels, and car rentals quickly and efficiently.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Personalized Recommendations: <span class=\"text-300 fw-medium\">Implemented a recommendation system that suggests destinations, accommodations, and activities based on user preferences and past behaviors.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">\n            Secure Payment Gateway: <span class=\"text-300 fw-medium\">Integrated a secure payment gateway to ensure that all transactions <span class=\"text-dark fw-bold\">are safe and user data is protected.</span></span>\n        </p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Interactive Maps: <span class=\"text-300 fw-medium\">Added interactive maps to help users explore destinations, find nearby attractions, and get directions.</span></p>\n    </li>\n</ul>\n<h5 class=\"fs-5 fw-medium mt-4\">Technologies Used</h5>\n<ul>\n    <li>\n        <p class=\"text-dark fw-bold\">Front-End: <span class=\"text-300 fw-medium\">React Native for cross-platform mobile development, ensuring a consistent experience on both iOS and Android devices.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Back-End: <span class=\"text-300 fw-medium\">Node.js and Express for handling server-side logic and database interactions.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Database: <span class=\"text-300 fw-medium\">MongoDB for flexible data storage and retrieval.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">APIs: <span class=\"text-300 fw-medium\">Integrated third-party APIs for flight, hotel, and car rental bookings to provide a wide range of options to users.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Payment Integration: <span class=\"text-300 fw-medium\">Stripe API for secure and reliable payment processing.</span></p>\n    </li>\n</ul>\n<h5 class=\"fs-5 fw-medium mt-4\">Design Highlights</h5>\n<ul>\n    <li>\n        <p class=\"text-dark fw-bold\">Visual Appeal: <span class=\"text-300 fw-medium\">Focused on a visually appealing design with high-quality images and a modern color palette to enhance user engagement.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Usability: <span class=\"text-300 fw-medium\">Ensured the app is user-friendly with clear icons, concise labels, and a straightforward navigation structure.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Responsive Design: <span class=\"text-300 fw-medium\">Made the app responsive to different screen sizes and orientations, providing a consistent user experience across various devices.</span></p>\n    </li>\n</ul>\n',NULL,'Finance Company',1,'main/projects/3.png',NULL,2064,'published','2025-03-24 09:44:10','2025-03-24 09:44:10',NULL,'2022-09-10',0),(4,'Cloud Infrastructure Setup','Set up a scalable and secure cloud infrastructure with automated monitoring and logging.','<h5 class=\"fs-5 fw-medium\">Description</h5>\n<p class=\"text-300\">Travila is a comprehensive travel booking app designed to provide users with a seamless and enjoyable booking experience. The project involved creating an intuitive and visually appealing user interface, ensuring that users can effortlessly book flights, hotels, and car rentals all within a single app. The primary goal was to enhance the overall user experience, making travel planning easy and enjoyable.</p>\n<h5 class=\"fs-5 fw-medium mt-4\">Key Features</h5>\n<ul>\n    <li>\n        <p class=\"text-dark fw-bold\">User-Centric Interface: <span class=\"text-300 fw-medium\">Designed a clean and intuitive interface that allows users to navigate through the app with ease, ensuring a smooth and enjoyable booking process.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Integrated Search and Booking: <span class=\"text-300 fw-medium\">Developed an integrated search function that enables users to find and book flights, hotels, and car rentals quickly and efficiently.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Personalized Recommendations: <span class=\"text-300 fw-medium\">Implemented a recommendation system that suggests destinations, accommodations, and activities based on user preferences and past behaviors.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">\n            Secure Payment Gateway: <span class=\"text-300 fw-medium\">Integrated a secure payment gateway to ensure that all transactions <span class=\"text-dark fw-bold\">are safe and user data is protected.</span></span>\n        </p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Interactive Maps: <span class=\"text-300 fw-medium\">Added interactive maps to help users explore destinations, find nearby attractions, and get directions.</span></p>\n    </li>\n</ul>\n<h5 class=\"fs-5 fw-medium mt-4\">Technologies Used</h5>\n<ul>\n    <li>\n        <p class=\"text-dark fw-bold\">Front-End: <span class=\"text-300 fw-medium\">React Native for cross-platform mobile development, ensuring a consistent experience on both iOS and Android devices.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Back-End: <span class=\"text-300 fw-medium\">Node.js and Express for handling server-side logic and database interactions.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Database: <span class=\"text-300 fw-medium\">MongoDB for flexible data storage and retrieval.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">APIs: <span class=\"text-300 fw-medium\">Integrated third-party APIs for flight, hotel, and car rental bookings to provide a wide range of options to users.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Payment Integration: <span class=\"text-300 fw-medium\">Stripe API for secure and reliable payment processing.</span></p>\n    </li>\n</ul>\n<h5 class=\"fs-5 fw-medium mt-4\">Design Highlights</h5>\n<ul>\n    <li>\n        <p class=\"text-dark fw-bold\">Visual Appeal: <span class=\"text-300 fw-medium\">Focused on a visually appealing design with high-quality images and a modern color palette to enhance user engagement.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Usability: <span class=\"text-300 fw-medium\">Ensured the app is user-friendly with clear icons, concise labels, and a straightforward navigation structure.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Responsive Design: <span class=\"text-300 fw-medium\">Made the app responsive to different screen sizes and orientations, providing a consistent user experience across various devices.</span></p>\n    </li>\n</ul>\n',NULL,'Tech Company',0,'main/projects/4.png',NULL,7780,'published','2025-03-24 09:44:10','2025-03-24 09:44:10',NULL,'2023-04-20',0);
/*!40000 ALTER TABLE `pf_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pf_projects_translations`
--

DROP TABLE IF EXISTS `pf_projects_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pf_projects_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pf_projects_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pf_projects_translations`
--

LOCK TABLES `pf_projects_translations` WRITE;
/*!40000 ALTER TABLE `pf_projects_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `pf_projects_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pf_quotes`
--

DROP TABLE IF EXISTS `pf_quotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pf_quotes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fields` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pf_quotes`
--

LOCK TABLES `pf_quotes` WRITE;
/*!40000 ALTER TABLE `pf_quotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `pf_quotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pf_service_categories`
--

DROP TABLE IF EXISTS `pf_service_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pf_service_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pf_service_categories_parent_id_index` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pf_service_categories`
--

LOCK TABLES `pf_service_categories` WRITE;
/*!40000 ALTER TABLE `pf_service_categories` DISABLE KEYS */;
INSERT INTO `pf_service_categories` VALUES (1,NULL,'Backend Development','Server-side development with robust, scalable architectures.',NULL,0,'published','2025-03-24 09:44:10','2025-03-24 09:44:10'),(2,NULL,'Frontend Development','Building interactive and responsive web interfaces using modern technologies.',NULL,0,'published','2025-03-24 09:44:10','2025-03-24 09:44:10'),(3,NULL,'Mobile App Development','Developing cross-platform mobile applications for Android and iOS.',NULL,0,'published','2025-03-24 09:44:10','2025-03-24 09:44:10'),(4,NULL,'DevOps & Cloud','Cloud-based services and infrastructure management with CI/CD practices.',NULL,0,'published','2025-03-24 09:44:10','2025-03-24 09:44:10');
/*!40000 ALTER TABLE `pf_service_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pf_service_categories_translations`
--

DROP TABLE IF EXISTS `pf_service_categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pf_service_categories_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pf_service_categories_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`pf_service_categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pf_service_categories_translations`
--

LOCK TABLES `pf_service_categories_translations` WRITE;
/*!40000 ALTER TABLE `pf_service_categories_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `pf_service_categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pf_services`
--

DROP TABLE IF EXISTS `pf_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pf_services` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` text COLLATE utf8mb4_unicode_ci,
  `views` int NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pf_services_category_id_index` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pf_services`
--

LOCK TABLES `pf_services` WRITE;
/*!40000 ALTER TABLE `pf_services` DISABLE KEYS */;
INSERT INTO `pf_services` VALUES (1,4,'API Development','Designing and developing scalable RESTful APIs for web and mobile applications.','<h5 class=\"fs-5 fw-medium\">Description</h5>\n<p class=\"text-300\">Travila is a comprehensive travel booking app designed to provide users with a seamless and enjoyable booking experience. The project involved creating an intuitive and visually appealing user interface, ensuring that users can effortlessly book flights, hotels, and car rentals all within a single app. The primary goal was to enhance the overall user experience, making travel planning easy and enjoyable.</p>\n<h5 class=\"fs-5 fw-medium mt-4\">Key Features</h5>\n<ul>\n    <li>\n        <p class=\"text-dark fw-bold\">User-Centric Interface: <span class=\"text-300 fw-medium\">Designed a clean and intuitive interface that allows users to navigate through the app with ease, ensuring a smooth and enjoyable booking process.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Integrated Search and Booking: <span class=\"text-300 fw-medium\">Developed an integrated search function that enables users to find and book flights, hotels, and car rentals quickly and efficiently.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Personalized Recommendations: <span class=\"text-300 fw-medium\">Implemented a recommendation system that suggests destinations, accommodations, and activities based on user preferences and past behaviors.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">\n            Secure Payment Gateway: <span class=\"text-300 fw-medium\">Integrated a secure payment gateway to ensure that all transactions <span class=\"text-dark fw-bold\">are safe and user data is protected.</span></span>\n        </p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Interactive Maps: <span class=\"text-300 fw-medium\">Added interactive maps to help users explore destinations, find nearby attractions, and get directions.</span></p>\n    </li>\n</ul>\n<h5 class=\"fs-5 fw-medium mt-4\">Technologies Used</h5>\n<ul>\n    <li>\n        <p class=\"text-dark fw-bold\">Front-End: <span class=\"text-300 fw-medium\">React Native for cross-platform mobile development, ensuring a consistent experience on both iOS and Android devices.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Back-End: <span class=\"text-300 fw-medium\">Node.js and Express for handling server-side logic and database interactions.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Database: <span class=\"text-300 fw-medium\">MongoDB for flexible data storage and retrieval.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">APIs: <span class=\"text-300 fw-medium\">Integrated third-party APIs for flight, hotel, and car rental bookings to provide a wide range of options to users.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Payment Integration: <span class=\"text-300 fw-medium\">Stripe API for secure and reliable payment processing.</span></p>\n    </li>\n</ul>\n<h5 class=\"fs-5 fw-medium mt-4\">Design Highlights</h5>\n<ul>\n    <li>\n        <p class=\"text-dark fw-bold\">Visual Appeal: <span class=\"text-300 fw-medium\">Focused on a visually appealing design with high-quality images and a modern color palette to enhance user engagement.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Usability: <span class=\"text-300 fw-medium\">Ensured the app is user-friendly with clear icons, concise labels, and a straightforward navigation structure.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Responsive Design: <span class=\"text-300 fw-medium\">Made the app responsive to different screen sizes and orientations, providing a consistent user experience across various devices.</span></p>\n    </li>\n</ul>\n',1,NULL,NULL,2055,'published','2025-03-24 09:44:10','2025-03-24 09:44:10',0),(2,2,'Frontend Development','Creating dynamic and interactive web pages using React, Vue, and other modern JS frameworks.','<h5 class=\"fs-5 fw-medium\">Description</h5>\n<p class=\"text-300\">Travila is a comprehensive travel booking app designed to provide users with a seamless and enjoyable booking experience. The project involved creating an intuitive and visually appealing user interface, ensuring that users can effortlessly book flights, hotels, and car rentals all within a single app. The primary goal was to enhance the overall user experience, making travel planning easy and enjoyable.</p>\n<h5 class=\"fs-5 fw-medium mt-4\">Key Features</h5>\n<ul>\n    <li>\n        <p class=\"text-dark fw-bold\">User-Centric Interface: <span class=\"text-300 fw-medium\">Designed a clean and intuitive interface that allows users to navigate through the app with ease, ensuring a smooth and enjoyable booking process.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Integrated Search and Booking: <span class=\"text-300 fw-medium\">Developed an integrated search function that enables users to find and book flights, hotels, and car rentals quickly and efficiently.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Personalized Recommendations: <span class=\"text-300 fw-medium\">Implemented a recommendation system that suggests destinations, accommodations, and activities based on user preferences and past behaviors.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">\n            Secure Payment Gateway: <span class=\"text-300 fw-medium\">Integrated a secure payment gateway to ensure that all transactions <span class=\"text-dark fw-bold\">are safe and user data is protected.</span></span>\n        </p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Interactive Maps: <span class=\"text-300 fw-medium\">Added interactive maps to help users explore destinations, find nearby attractions, and get directions.</span></p>\n    </li>\n</ul>\n<h5 class=\"fs-5 fw-medium mt-4\">Technologies Used</h5>\n<ul>\n    <li>\n        <p class=\"text-dark fw-bold\">Front-End: <span class=\"text-300 fw-medium\">React Native for cross-platform mobile development, ensuring a consistent experience on both iOS and Android devices.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Back-End: <span class=\"text-300 fw-medium\">Node.js and Express for handling server-side logic and database interactions.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Database: <span class=\"text-300 fw-medium\">MongoDB for flexible data storage and retrieval.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">APIs: <span class=\"text-300 fw-medium\">Integrated third-party APIs for flight, hotel, and car rental bookings to provide a wide range of options to users.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Payment Integration: <span class=\"text-300 fw-medium\">Stripe API for secure and reliable payment processing.</span></p>\n    </li>\n</ul>\n<h5 class=\"fs-5 fw-medium mt-4\">Design Highlights</h5>\n<ul>\n    <li>\n        <p class=\"text-dark fw-bold\">Visual Appeal: <span class=\"text-300 fw-medium\">Focused on a visually appealing design with high-quality images and a modern color palette to enhance user engagement.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Usability: <span class=\"text-300 fw-medium\">Ensured the app is user-friendly with clear icons, concise labels, and a straightforward navigation structure.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Responsive Design: <span class=\"text-300 fw-medium\">Made the app responsive to different screen sizes and orientations, providing a consistent user experience across various devices.</span></p>\n    </li>\n</ul>\n',0,NULL,NULL,7967,'published','2025-03-24 09:44:10','2025-03-24 09:44:10',0),(3,1,'Mobile App Development','Building cross-platform mobile applications using Flutter and React Native.','<h5 class=\"fs-5 fw-medium\">Description</h5>\n<p class=\"text-300\">Travila is a comprehensive travel booking app designed to provide users with a seamless and enjoyable booking experience. The project involved creating an intuitive and visually appealing user interface, ensuring that users can effortlessly book flights, hotels, and car rentals all within a single app. The primary goal was to enhance the overall user experience, making travel planning easy and enjoyable.</p>\n<h5 class=\"fs-5 fw-medium mt-4\">Key Features</h5>\n<ul>\n    <li>\n        <p class=\"text-dark fw-bold\">User-Centric Interface: <span class=\"text-300 fw-medium\">Designed a clean and intuitive interface that allows users to navigate through the app with ease, ensuring a smooth and enjoyable booking process.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Integrated Search and Booking: <span class=\"text-300 fw-medium\">Developed an integrated search function that enables users to find and book flights, hotels, and car rentals quickly and efficiently.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Personalized Recommendations: <span class=\"text-300 fw-medium\">Implemented a recommendation system that suggests destinations, accommodations, and activities based on user preferences and past behaviors.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">\n            Secure Payment Gateway: <span class=\"text-300 fw-medium\">Integrated a secure payment gateway to ensure that all transactions <span class=\"text-dark fw-bold\">are safe and user data is protected.</span></span>\n        </p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Interactive Maps: <span class=\"text-300 fw-medium\">Added interactive maps to help users explore destinations, find nearby attractions, and get directions.</span></p>\n    </li>\n</ul>\n<h5 class=\"fs-5 fw-medium mt-4\">Technologies Used</h5>\n<ul>\n    <li>\n        <p class=\"text-dark fw-bold\">Front-End: <span class=\"text-300 fw-medium\">React Native for cross-platform mobile development, ensuring a consistent experience on both iOS and Android devices.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Back-End: <span class=\"text-300 fw-medium\">Node.js and Express for handling server-side logic and database interactions.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Database: <span class=\"text-300 fw-medium\">MongoDB for flexible data storage and retrieval.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">APIs: <span class=\"text-300 fw-medium\">Integrated third-party APIs for flight, hotel, and car rental bookings to provide a wide range of options to users.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Payment Integration: <span class=\"text-300 fw-medium\">Stripe API for secure and reliable payment processing.</span></p>\n    </li>\n</ul>\n<h5 class=\"fs-5 fw-medium mt-4\">Design Highlights</h5>\n<ul>\n    <li>\n        <p class=\"text-dark fw-bold\">Visual Appeal: <span class=\"text-300 fw-medium\">Focused on a visually appealing design with high-quality images and a modern color palette to enhance user engagement.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Usability: <span class=\"text-300 fw-medium\">Ensured the app is user-friendly with clear icons, concise labels, and a straightforward navigation structure.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Responsive Design: <span class=\"text-300 fw-medium\">Made the app responsive to different screen sizes and orientations, providing a consistent user experience across various devices.</span></p>\n    </li>\n</ul>\n',0,NULL,NULL,6752,'published','2025-03-24 09:44:10','2025-03-24 09:44:10',0),(4,1,'DevOps Consulting','Implementing automated pipelines for continuous integration and delivery.','<h5 class=\"fs-5 fw-medium\">Description</h5>\n<p class=\"text-300\">Travila is a comprehensive travel booking app designed to provide users with a seamless and enjoyable booking experience. The project involved creating an intuitive and visually appealing user interface, ensuring that users can effortlessly book flights, hotels, and car rentals all within a single app. The primary goal was to enhance the overall user experience, making travel planning easy and enjoyable.</p>\n<h5 class=\"fs-5 fw-medium mt-4\">Key Features</h5>\n<ul>\n    <li>\n        <p class=\"text-dark fw-bold\">User-Centric Interface: <span class=\"text-300 fw-medium\">Designed a clean and intuitive interface that allows users to navigate through the app with ease, ensuring a smooth and enjoyable booking process.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Integrated Search and Booking: <span class=\"text-300 fw-medium\">Developed an integrated search function that enables users to find and book flights, hotels, and car rentals quickly and efficiently.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Personalized Recommendations: <span class=\"text-300 fw-medium\">Implemented a recommendation system that suggests destinations, accommodations, and activities based on user preferences and past behaviors.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">\n            Secure Payment Gateway: <span class=\"text-300 fw-medium\">Integrated a secure payment gateway to ensure that all transactions <span class=\"text-dark fw-bold\">are safe and user data is protected.</span></span>\n        </p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Interactive Maps: <span class=\"text-300 fw-medium\">Added interactive maps to help users explore destinations, find nearby attractions, and get directions.</span></p>\n    </li>\n</ul>\n<h5 class=\"fs-5 fw-medium mt-4\">Technologies Used</h5>\n<ul>\n    <li>\n        <p class=\"text-dark fw-bold\">Front-End: <span class=\"text-300 fw-medium\">React Native for cross-platform mobile development, ensuring a consistent experience on both iOS and Android devices.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Back-End: <span class=\"text-300 fw-medium\">Node.js and Express for handling server-side logic and database interactions.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Database: <span class=\"text-300 fw-medium\">MongoDB for flexible data storage and retrieval.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">APIs: <span class=\"text-300 fw-medium\">Integrated third-party APIs for flight, hotel, and car rental bookings to provide a wide range of options to users.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Payment Integration: <span class=\"text-300 fw-medium\">Stripe API for secure and reliable payment processing.</span></p>\n    </li>\n</ul>\n<h5 class=\"fs-5 fw-medium mt-4\">Design Highlights</h5>\n<ul>\n    <li>\n        <p class=\"text-dark fw-bold\">Visual Appeal: <span class=\"text-300 fw-medium\">Focused on a visually appealing design with high-quality images and a modern color palette to enhance user engagement.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Usability: <span class=\"text-300 fw-medium\">Ensured the app is user-friendly with clear icons, concise labels, and a straightforward navigation structure.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Responsive Design: <span class=\"text-300 fw-medium\">Made the app responsive to different screen sizes and orientations, providing a consistent user experience across various devices.</span></p>\n    </li>\n</ul>\n',1,NULL,NULL,6447,'published','2025-03-24 09:44:10','2025-03-24 09:44:10',0),(5,2,'Cloud Integration','Seamlessly integrating applications with cloud services like AWS, Azure, and Google Cloud.','<h5 class=\"fs-5 fw-medium\">Description</h5>\n<p class=\"text-300\">Travila is a comprehensive travel booking app designed to provide users with a seamless and enjoyable booking experience. The project involved creating an intuitive and visually appealing user interface, ensuring that users can effortlessly book flights, hotels, and car rentals all within a single app. The primary goal was to enhance the overall user experience, making travel planning easy and enjoyable.</p>\n<h5 class=\"fs-5 fw-medium mt-4\">Key Features</h5>\n<ul>\n    <li>\n        <p class=\"text-dark fw-bold\">User-Centric Interface: <span class=\"text-300 fw-medium\">Designed a clean and intuitive interface that allows users to navigate through the app with ease, ensuring a smooth and enjoyable booking process.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Integrated Search and Booking: <span class=\"text-300 fw-medium\">Developed an integrated search function that enables users to find and book flights, hotels, and car rentals quickly and efficiently.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Personalized Recommendations: <span class=\"text-300 fw-medium\">Implemented a recommendation system that suggests destinations, accommodations, and activities based on user preferences and past behaviors.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">\n            Secure Payment Gateway: <span class=\"text-300 fw-medium\">Integrated a secure payment gateway to ensure that all transactions <span class=\"text-dark fw-bold\">are safe and user data is protected.</span></span>\n        </p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Interactive Maps: <span class=\"text-300 fw-medium\">Added interactive maps to help users explore destinations, find nearby attractions, and get directions.</span></p>\n    </li>\n</ul>\n<h5 class=\"fs-5 fw-medium mt-4\">Technologies Used</h5>\n<ul>\n    <li>\n        <p class=\"text-dark fw-bold\">Front-End: <span class=\"text-300 fw-medium\">React Native for cross-platform mobile development, ensuring a consistent experience on both iOS and Android devices.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Back-End: <span class=\"text-300 fw-medium\">Node.js and Express for handling server-side logic and database interactions.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Database: <span class=\"text-300 fw-medium\">MongoDB for flexible data storage and retrieval.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">APIs: <span class=\"text-300 fw-medium\">Integrated third-party APIs for flight, hotel, and car rental bookings to provide a wide range of options to users.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Payment Integration: <span class=\"text-300 fw-medium\">Stripe API for secure and reliable payment processing.</span></p>\n    </li>\n</ul>\n<h5 class=\"fs-5 fw-medium mt-4\">Design Highlights</h5>\n<ul>\n    <li>\n        <p class=\"text-dark fw-bold\">Visual Appeal: <span class=\"text-300 fw-medium\">Focused on a visually appealing design with high-quality images and a modern color palette to enhance user engagement.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Usability: <span class=\"text-300 fw-medium\">Ensured the app is user-friendly with clear icons, concise labels, and a straightforward navigation structure.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Responsive Design: <span class=\"text-300 fw-medium\">Made the app responsive to different screen sizes and orientations, providing a consistent user experience across various devices.</span></p>\n    </li>\n</ul>\n',0,NULL,NULL,4734,'published','2025-03-24 09:44:10','2025-03-24 09:44:10',0),(6,4,'Database Management','Managing and optimizing relational and non-relational databases for high performance.','<h5 class=\"fs-5 fw-medium\">Description</h5>\n<p class=\"text-300\">Travila is a comprehensive travel booking app designed to provide users with a seamless and enjoyable booking experience. The project involved creating an intuitive and visually appealing user interface, ensuring that users can effortlessly book flights, hotels, and car rentals all within a single app. The primary goal was to enhance the overall user experience, making travel planning easy and enjoyable.</p>\n<h5 class=\"fs-5 fw-medium mt-4\">Key Features</h5>\n<ul>\n    <li>\n        <p class=\"text-dark fw-bold\">User-Centric Interface: <span class=\"text-300 fw-medium\">Designed a clean and intuitive interface that allows users to navigate through the app with ease, ensuring a smooth and enjoyable booking process.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Integrated Search and Booking: <span class=\"text-300 fw-medium\">Developed an integrated search function that enables users to find and book flights, hotels, and car rentals quickly and efficiently.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Personalized Recommendations: <span class=\"text-300 fw-medium\">Implemented a recommendation system that suggests destinations, accommodations, and activities based on user preferences and past behaviors.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">\n            Secure Payment Gateway: <span class=\"text-300 fw-medium\">Integrated a secure payment gateway to ensure that all transactions <span class=\"text-dark fw-bold\">are safe and user data is protected.</span></span>\n        </p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Interactive Maps: <span class=\"text-300 fw-medium\">Added interactive maps to help users explore destinations, find nearby attractions, and get directions.</span></p>\n    </li>\n</ul>\n<h5 class=\"fs-5 fw-medium mt-4\">Technologies Used</h5>\n<ul>\n    <li>\n        <p class=\"text-dark fw-bold\">Front-End: <span class=\"text-300 fw-medium\">React Native for cross-platform mobile development, ensuring a consistent experience on both iOS and Android devices.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Back-End: <span class=\"text-300 fw-medium\">Node.js and Express for handling server-side logic and database interactions.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Database: <span class=\"text-300 fw-medium\">MongoDB for flexible data storage and retrieval.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">APIs: <span class=\"text-300 fw-medium\">Integrated third-party APIs for flight, hotel, and car rental bookings to provide a wide range of options to users.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Payment Integration: <span class=\"text-300 fw-medium\">Stripe API for secure and reliable payment processing.</span></p>\n    </li>\n</ul>\n<h5 class=\"fs-5 fw-medium mt-4\">Design Highlights</h5>\n<ul>\n    <li>\n        <p class=\"text-dark fw-bold\">Visual Appeal: <span class=\"text-300 fw-medium\">Focused on a visually appealing design with high-quality images and a modern color palette to enhance user engagement.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Usability: <span class=\"text-300 fw-medium\">Ensured the app is user-friendly with clear icons, concise labels, and a straightforward navigation structure.</span></p>\n    </li>\n    <li>\n        <p class=\"text-dark fw-bold\">Responsive Design: <span class=\"text-300 fw-medium\">Made the app responsive to different screen sizes and orientations, providing a consistent user experience across various devices.</span></p>\n    </li>\n</ul>\n',1,NULL,NULL,1752,'published','2025-03-24 09:44:10','2025-03-24 09:44:10',0);
/*!40000 ALTER TABLE `pf_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pf_services_translations`
--

DROP TABLE IF EXISTS `pf_services_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pf_services_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pf_services_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`pf_services_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pf_services_translations`
--

LOCK TABLES `pf_services_translations` WRITE;
/*!40000 ALTER TABLE `pf_services_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `pf_services_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_categories`
--

DROP TABLE IF EXISTS `post_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_categories` (
  `category_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  KEY `post_categories_category_id_index` (`category_id`),
  KEY `post_categories_post_id_index` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_categories`
--

LOCK TABLES `post_categories` WRITE;
/*!40000 ALTER TABLE `post_categories` DISABLE KEYS */;
INSERT INTO `post_categories` VALUES (2,1),(1,1),(8,2),(6,3),(1,3),(2,4),(9,4),(2,5),(6,5),(7,6),(2,6),(5,7),(3,7),(1,8),(5,8),(3,9),(2,9),(3,10),(1,10),(6,11),(7,11),(3,12),(8,12),(6,13),(8,13),(1,14),(4,15),(1,15);
/*!40000 ALTER TABLE `post_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tags`
--

DROP TABLE IF EXISTS `post_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_tags` (
  `tag_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  KEY `post_tags_tag_id_index` (`tag_id`),
  KEY `post_tags_post_id_index` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tags`
--

LOCK TABLES `post_tags` WRITE;
/*!40000 ALTER TABLE `post_tags` DISABLE KEYS */;
INSERT INTO `post_tags` VALUES (5,1),(6,1),(3,1),(6,2),(3,2),(7,2),(1,3),(5,3),(4,3),(2,4),(3,4),(6,4),(4,5),(3,5),(7,5),(8,6),(3,6),(1,7),(2,7),(5,7),(3,8),(8,9),(2,9),(8,10),(7,10),(6,11),(2,11),(4,11),(2,12),(3,12),(5,12),(5,13),(2,13),(6,13),(3,14),(2,14),(7,14),(1,15),(4,15),(5,15);
/*!40000 ALTER TABLE `post_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int unsigned NOT NULL DEFAULT '0',
  `format_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_status_index` (`status`),
  KEY `posts_author_id_index` (`author_id`),
  KEY `posts_author_type_index` (`author_type`),
  KEY `posts_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'Building a Full-Stack App with the TALL Stack','Learn how to build a full-stack web application using the TALL stack, integrating Laravel, Alpine.js, Tailwind CSS, and Livewire for dynamic and responsive web development.','<h5>Prioritize User-Centric Design</h5>\n<h5 class=\"fs-5 fw-medium\">Understand Your Users</h5>\n<p class=\"text-300\">Conduct thorough user research to understand your target audience’s needs, preferences, and pain points. Use surveys, interviews, and usability testing to gather valuable insights.</p>\n<h5 class=\"fs-5 fw-medium\">Simplify Navigation</h5>\n<p class=\"text-300\">Design a clean and intuitive navigation structure. Ensure users can easily find what they’re looking for without feeling overwhelmed. Use familiar icons and clear labels to guide them.</p>\n<h5 class=\"mt-6\">Optimize Performance</h5>\n<h5 class=\"fs-5 fw-medium\">Fast Loading Times</h5>\n<p class=\"text-300\">Optimize your app to load quickly. Users expect instant gratification, and slow load times can lead to frustration and app abandonment. Use efficient coding practices and minimize the use of heavy graphics.</p>\n<h5 class=\"fs-5 fw-medium\">Smooth Animations</h5>\n<p class=\"text-300\">Ensure animations and transitions are smooth and do not hinder the app’s performance. Well-executed animations can enhance the user experience by providing visual feedback and making interactions feel natural.</p>\n<h5 class=\"fs-5 fw-medium\">Offline Access</h5>\n<p class=\"text-300\">Provide offline capabilities for essential features. Allowing users to access certain functionalities without an internet connection can greatly improve their experience, especially in areas with poor connectivity.</p>\n<h5>Ensure Robust Security</h5>\n<h5 class=\"fs-5 fw-medium\">Data Protection</h5>\n<p class=\"text-300\">Implement strong security measures to protect user data. Use encryption, secure authentication methods, and regular security audits to safeguard sensitive information.</p>\n<h5 class=\"fs-5 fw-medium\">Transparent Policies</h5>\n<p class=\"text-300\">Be transparent about your data collection and usage policies. Provide users with clear information about how their data is used and give them control over their privacy settings.</p>\n<h5 class=\"fs-5 fw-medium\">Regular Updates</h5>\n<p class=\"text-300\">Keep your app updated with the latest security patches and improvements. Regular updates not only enhance security but also show users that you are actively maintaining and improving the app.</p>\n\n[highlighted-box title=\"Conclusion\" description=\"Creating a seamless mobile experience requires a user-centric approach, performance optimization, responsive design, user engagement strategies, and robust security measures. By focusing on these key areas, you can build a mobile app that not only meets user expectations but also stands out in the competitive app market. Remember, a great mobile experience can turn users into loyal advocates, driving the success of your app.\"][/highlighted-box]\n','published',1,'Botble\\ACL\\Models\\User',0,'main/posts/3.png',590,NULL,'2025-02-03 12:26:29','2025-03-24 09:44:09'),(2,'My Journey in Open Source: 3 Years of Contributions','A personal reflection on my experiences contributing to open source projects over the past three years, sharing lessons learned and advice for aspiring contributors.','<h5>Prioritize User-Centric Design</h5>\n<h5 class=\"fs-5 fw-medium\">Understand Your Users</h5>\n<p class=\"text-300\">Conduct thorough user research to understand your target audience’s needs, preferences, and pain points. Use surveys, interviews, and usability testing to gather valuable insights.</p>\n<h5 class=\"fs-5 fw-medium\">Simplify Navigation</h5>\n<p class=\"text-300\">Design a clean and intuitive navigation structure. Ensure users can easily find what they’re looking for without feeling overwhelmed. Use familiar icons and clear labels to guide them.</p>\n<h5 class=\"mt-6\">Optimize Performance</h5>\n<h5 class=\"fs-5 fw-medium\">Fast Loading Times</h5>\n<p class=\"text-300\">Optimize your app to load quickly. Users expect instant gratification, and slow load times can lead to frustration and app abandonment. Use efficient coding practices and minimize the use of heavy graphics.</p>\n<h5 class=\"fs-5 fw-medium\">Smooth Animations</h5>\n<p class=\"text-300\">Ensure animations and transitions are smooth and do not hinder the app’s performance. Well-executed animations can enhance the user experience by providing visual feedback and making interactions feel natural.</p>\n<h5 class=\"fs-5 fw-medium\">Offline Access</h5>\n<p class=\"text-300\">Provide offline capabilities for essential features. Allowing users to access certain functionalities without an internet connection can greatly improve their experience, especially in areas with poor connectivity.</p>\n<h5>Ensure Robust Security</h5>\n<h5 class=\"fs-5 fw-medium\">Data Protection</h5>\n<p class=\"text-300\">Implement strong security measures to protect user data. Use encryption, secure authentication methods, and regular security audits to safeguard sensitive information.</p>\n<h5 class=\"fs-5 fw-medium\">Transparent Policies</h5>\n<p class=\"text-300\">Be transparent about your data collection and usage policies. Provide users with clear information about how their data is used and give them control over their privacy settings.</p>\n<h5 class=\"fs-5 fw-medium\">Regular Updates</h5>\n<p class=\"text-300\">Keep your app updated with the latest security patches and improvements. Regular updates not only enhance security but also show users that you are actively maintaining and improving the app.</p>\n\n[highlighted-box title=\"Conclusion\" description=\"Creating a seamless mobile experience requires a user-centric approach, performance optimization, responsive design, user engagement strategies, and robust security measures. By focusing on these key areas, you can build a mobile app that not only meets user expectations but also stands out in the competitive app market. Remember, a great mobile experience can turn users into loyal advocates, driving the success of your app.\"][/highlighted-box]\n','published',1,'Botble\\ACL\\Models\\User',0,'main/posts/1.png',1735,NULL,'2025-01-30 10:43:02','2025-03-24 09:44:09'),(3,'5 Essential Tools for Web Developers in 2024','Discover the top 5 tools that are essential for web developers in 2024, from frameworks and libraries to productivity boosters.','<h5>Prioritize User-Centric Design</h5>\n<h5 class=\"fs-5 fw-medium\">Understand Your Users</h5>\n<p class=\"text-300\">Conduct thorough user research to understand your target audience’s needs, preferences, and pain points. Use surveys, interviews, and usability testing to gather valuable insights.</p>\n<h5 class=\"fs-5 fw-medium\">Simplify Navigation</h5>\n<p class=\"text-300\">Design a clean and intuitive navigation structure. Ensure users can easily find what they’re looking for without feeling overwhelmed. Use familiar icons and clear labels to guide them.</p>\n<h5 class=\"mt-6\">Optimize Performance</h5>\n<h5 class=\"fs-5 fw-medium\">Fast Loading Times</h5>\n<p class=\"text-300\">Optimize your app to load quickly. Users expect instant gratification, and slow load times can lead to frustration and app abandonment. Use efficient coding practices and minimize the use of heavy graphics.</p>\n<h5 class=\"fs-5 fw-medium\">Smooth Animations</h5>\n<p class=\"text-300\">Ensure animations and transitions are smooth and do not hinder the app’s performance. Well-executed animations can enhance the user experience by providing visual feedback and making interactions feel natural.</p>\n<h5 class=\"fs-5 fw-medium\">Offline Access</h5>\n<p class=\"text-300\">Provide offline capabilities for essential features. Allowing users to access certain functionalities without an internet connection can greatly improve their experience, especially in areas with poor connectivity.</p>\n<h5>Ensure Robust Security</h5>\n<h5 class=\"fs-5 fw-medium\">Data Protection</h5>\n<p class=\"text-300\">Implement strong security measures to protect user data. Use encryption, secure authentication methods, and regular security audits to safeguard sensitive information.</p>\n<h5 class=\"fs-5 fw-medium\">Transparent Policies</h5>\n<p class=\"text-300\">Be transparent about your data collection and usage policies. Provide users with clear information about how their data is used and give them control over their privacy settings.</p>\n<h5 class=\"fs-5 fw-medium\">Regular Updates</h5>\n<p class=\"text-300\">Keep your app updated with the latest security patches and improvements. Regular updates not only enhance security but also show users that you are actively maintaining and improving the app.</p>\n\n[highlighted-box title=\"Conclusion\" description=\"Creating a seamless mobile experience requires a user-centric approach, performance optimization, responsive design, user engagement strategies, and robust security measures. By focusing on these key areas, you can build a mobile app that not only meets user expectations but also stands out in the competitive app market. Remember, a great mobile experience can turn users into loyal advocates, driving the success of your app.\"][/highlighted-box]\n','published',1,'Botble\\ACL\\Models\\User',0,'main/posts/4.png',100,NULL,'2024-04-05 22:04:24','2025-03-24 09:44:09'),(4,'How I Built My Personal Portfolio Using Botble CMS','A detailed walkthrough on how I built my portfolio website using Botble CMS, customizing it with the Zelio template for an impressive online presence.','<h5>Prioritize User-Centric Design</h5>\n<h5 class=\"fs-5 fw-medium\">Understand Your Users</h5>\n<p class=\"text-300\">Conduct thorough user research to understand your target audience’s needs, preferences, and pain points. Use surveys, interviews, and usability testing to gather valuable insights.</p>\n<h5 class=\"fs-5 fw-medium\">Simplify Navigation</h5>\n<p class=\"text-300\">Design a clean and intuitive navigation structure. Ensure users can easily find what they’re looking for without feeling overwhelmed. Use familiar icons and clear labels to guide them.</p>\n<h5 class=\"mt-6\">Optimize Performance</h5>\n<h5 class=\"fs-5 fw-medium\">Fast Loading Times</h5>\n<p class=\"text-300\">Optimize your app to load quickly. Users expect instant gratification, and slow load times can lead to frustration and app abandonment. Use efficient coding practices and minimize the use of heavy graphics.</p>\n<h5 class=\"fs-5 fw-medium\">Smooth Animations</h5>\n<p class=\"text-300\">Ensure animations and transitions are smooth and do not hinder the app’s performance. Well-executed animations can enhance the user experience by providing visual feedback and making interactions feel natural.</p>\n<h5 class=\"fs-5 fw-medium\">Offline Access</h5>\n<p class=\"text-300\">Provide offline capabilities for essential features. Allowing users to access certain functionalities without an internet connection can greatly improve their experience, especially in areas with poor connectivity.</p>\n<h5>Ensure Robust Security</h5>\n<h5 class=\"fs-5 fw-medium\">Data Protection</h5>\n<p class=\"text-300\">Implement strong security measures to protect user data. Use encryption, secure authentication methods, and regular security audits to safeguard sensitive information.</p>\n<h5 class=\"fs-5 fw-medium\">Transparent Policies</h5>\n<p class=\"text-300\">Be transparent about your data collection and usage policies. Provide users with clear information about how their data is used and give them control over their privacy settings.</p>\n<h5 class=\"fs-5 fw-medium\">Regular Updates</h5>\n<p class=\"text-300\">Keep your app updated with the latest security patches and improvements. Regular updates not only enhance security but also show users that you are actively maintaining and improving the app.</p>\n\n[highlighted-box title=\"Conclusion\" description=\"Creating a seamless mobile experience requires a user-centric approach, performance optimization, responsive design, user engagement strategies, and robust security measures. By focusing on these key areas, you can build a mobile app that not only meets user expectations but also stands out in the competitive app market. Remember, a great mobile experience can turn users into loyal advocates, driving the success of your app.\"][/highlighted-box]\n','published',1,'Botble\\ACL\\Models\\User',1,'main/posts/7.png',2077,NULL,'2025-01-06 08:12:20','2025-03-24 09:44:09'),(5,'Creating Responsive UIs with Tailwind CSS','Learn how to create responsive user interfaces quickly and efficiently using the utility-first CSS framework, Tailwind CSS.','<h5>Prioritize User-Centric Design</h5>\n<h5 class=\"fs-5 fw-medium\">Understand Your Users</h5>\n<p class=\"text-300\">Conduct thorough user research to understand your target audience’s needs, preferences, and pain points. Use surveys, interviews, and usability testing to gather valuable insights.</p>\n<h5 class=\"fs-5 fw-medium\">Simplify Navigation</h5>\n<p class=\"text-300\">Design a clean and intuitive navigation structure. Ensure users can easily find what they’re looking for without feeling overwhelmed. Use familiar icons and clear labels to guide them.</p>\n<h5 class=\"mt-6\">Optimize Performance</h5>\n<h5 class=\"fs-5 fw-medium\">Fast Loading Times</h5>\n<p class=\"text-300\">Optimize your app to load quickly. Users expect instant gratification, and slow load times can lead to frustration and app abandonment. Use efficient coding practices and minimize the use of heavy graphics.</p>\n<h5 class=\"fs-5 fw-medium\">Smooth Animations</h5>\n<p class=\"text-300\">Ensure animations and transitions are smooth and do not hinder the app’s performance. Well-executed animations can enhance the user experience by providing visual feedback and making interactions feel natural.</p>\n<h5 class=\"fs-5 fw-medium\">Offline Access</h5>\n<p class=\"text-300\">Provide offline capabilities for essential features. Allowing users to access certain functionalities without an internet connection can greatly improve their experience, especially in areas with poor connectivity.</p>\n<h5>Ensure Robust Security</h5>\n<h5 class=\"fs-5 fw-medium\">Data Protection</h5>\n<p class=\"text-300\">Implement strong security measures to protect user data. Use encryption, secure authentication methods, and regular security audits to safeguard sensitive information.</p>\n<h5 class=\"fs-5 fw-medium\">Transparent Policies</h5>\n<p class=\"text-300\">Be transparent about your data collection and usage policies. Provide users with clear information about how their data is used and give them control over their privacy settings.</p>\n<h5 class=\"fs-5 fw-medium\">Regular Updates</h5>\n<p class=\"text-300\">Keep your app updated with the latest security patches and improvements. Regular updates not only enhance security but also show users that you are actively maintaining and improving the app.</p>\n\n[highlighted-box title=\"Conclusion\" description=\"Creating a seamless mobile experience requires a user-centric approach, performance optimization, responsive design, user engagement strategies, and robust security measures. By focusing on these key areas, you can build a mobile app that not only meets user expectations but also stands out in the competitive app market. Remember, a great mobile experience can turn users into loyal advocates, driving the success of your app.\"][/highlighted-box]\n','published',1,'Botble\\ACL\\Models\\User',0,'main/posts/10.png',357,NULL,'2024-12-14 20:13:20','2025-03-24 09:44:09'),(6,'Why I Love Contributing to Open Source Projects','A deep dive into why open source matters to me, how it helped me grow as a developer, and why every developer should contribute to open source.','<h5>Prioritize User-Centric Design</h5>\n<h5 class=\"fs-5 fw-medium\">Understand Your Users</h5>\n<p class=\"text-300\">Conduct thorough user research to understand your target audience’s needs, preferences, and pain points. Use surveys, interviews, and usability testing to gather valuable insights.</p>\n<h5 class=\"fs-5 fw-medium\">Simplify Navigation</h5>\n<p class=\"text-300\">Design a clean and intuitive navigation structure. Ensure users can easily find what they’re looking for without feeling overwhelmed. Use familiar icons and clear labels to guide them.</p>\n<h5 class=\"mt-6\">Optimize Performance</h5>\n<h5 class=\"fs-5 fw-medium\">Fast Loading Times</h5>\n<p class=\"text-300\">Optimize your app to load quickly. Users expect instant gratification, and slow load times can lead to frustration and app abandonment. Use efficient coding practices and minimize the use of heavy graphics.</p>\n<h5 class=\"fs-5 fw-medium\">Smooth Animations</h5>\n<p class=\"text-300\">Ensure animations and transitions are smooth and do not hinder the app’s performance. Well-executed animations can enhance the user experience by providing visual feedback and making interactions feel natural.</p>\n<h5 class=\"fs-5 fw-medium\">Offline Access</h5>\n<p class=\"text-300\">Provide offline capabilities for essential features. Allowing users to access certain functionalities without an internet connection can greatly improve their experience, especially in areas with poor connectivity.</p>\n<h5>Ensure Robust Security</h5>\n<h5 class=\"fs-5 fw-medium\">Data Protection</h5>\n<p class=\"text-300\">Implement strong security measures to protect user data. Use encryption, secure authentication methods, and regular security audits to safeguard sensitive information.</p>\n<h5 class=\"fs-5 fw-medium\">Transparent Policies</h5>\n<p class=\"text-300\">Be transparent about your data collection and usage policies. Provide users with clear information about how their data is used and give them control over their privacy settings.</p>\n<h5 class=\"fs-5 fw-medium\">Regular Updates</h5>\n<p class=\"text-300\">Keep your app updated with the latest security patches and improvements. Regular updates not only enhance security but also show users that you are actively maintaining and improving the app.</p>\n\n[highlighted-box title=\"Conclusion\" description=\"Creating a seamless mobile experience requires a user-centric approach, performance optimization, responsive design, user engagement strategies, and robust security measures. By focusing on these key areas, you can build a mobile app that not only meets user expectations but also stands out in the competitive app market. Remember, a great mobile experience can turn users into loyal advocates, driving the success of your app.\"][/highlighted-box]\n','published',1,'Botble\\ACL\\Models\\User',1,'main/posts/1.png',1372,NULL,'2025-01-30 09:00:14','2025-03-24 09:44:09'),(7,'A Deep Dive into Laravel for Beginners','A comprehensive guide for beginners who want to learn Laravel, covering everything from installation to building a simple application.','<h5>Prioritize User-Centric Design</h5>\n<h5 class=\"fs-5 fw-medium\">Understand Your Users</h5>\n<p class=\"text-300\">Conduct thorough user research to understand your target audience’s needs, preferences, and pain points. Use surveys, interviews, and usability testing to gather valuable insights.</p>\n<h5 class=\"fs-5 fw-medium\">Simplify Navigation</h5>\n<p class=\"text-300\">Design a clean and intuitive navigation structure. Ensure users can easily find what they’re looking for without feeling overwhelmed. Use familiar icons and clear labels to guide them.</p>\n<h5 class=\"mt-6\">Optimize Performance</h5>\n<h5 class=\"fs-5 fw-medium\">Fast Loading Times</h5>\n<p class=\"text-300\">Optimize your app to load quickly. Users expect instant gratification, and slow load times can lead to frustration and app abandonment. Use efficient coding practices and minimize the use of heavy graphics.</p>\n<h5 class=\"fs-5 fw-medium\">Smooth Animations</h5>\n<p class=\"text-300\">Ensure animations and transitions are smooth and do not hinder the app’s performance. Well-executed animations can enhance the user experience by providing visual feedback and making interactions feel natural.</p>\n<h5 class=\"fs-5 fw-medium\">Offline Access</h5>\n<p class=\"text-300\">Provide offline capabilities for essential features. Allowing users to access certain functionalities without an internet connection can greatly improve their experience, especially in areas with poor connectivity.</p>\n<h5>Ensure Robust Security</h5>\n<h5 class=\"fs-5 fw-medium\">Data Protection</h5>\n<p class=\"text-300\">Implement strong security measures to protect user data. Use encryption, secure authentication methods, and regular security audits to safeguard sensitive information.</p>\n<h5 class=\"fs-5 fw-medium\">Transparent Policies</h5>\n<p class=\"text-300\">Be transparent about your data collection and usage policies. Provide users with clear information about how their data is used and give them control over their privacy settings.</p>\n<h5 class=\"fs-5 fw-medium\">Regular Updates</h5>\n<p class=\"text-300\">Keep your app updated with the latest security patches and improvements. Regular updates not only enhance security but also show users that you are actively maintaining and improving the app.</p>\n\n[highlighted-box title=\"Conclusion\" description=\"Creating a seamless mobile experience requires a user-centric approach, performance optimization, responsive design, user engagement strategies, and robust security measures. By focusing on these key areas, you can build a mobile app that not only meets user expectations but also stands out in the competitive app market. Remember, a great mobile experience can turn users into loyal advocates, driving the success of your app.\"][/highlighted-box]\n','published',1,'Botble\\ACL\\Models\\User',0,'main/posts/10.png',1450,NULL,'2024-04-21 17:12:45','2025-03-24 09:44:09'),(8,'Exploring the Benefits of MySQL for Large-Scale Projects','An exploration of why MySQL is a great choice for large-scale projects, highlighting features, scalability, and performance tips.','<h5>Prioritize User-Centric Design</h5>\n<h5 class=\"fs-5 fw-medium\">Understand Your Users</h5>\n<p class=\"text-300\">Conduct thorough user research to understand your target audience’s needs, preferences, and pain points. Use surveys, interviews, and usability testing to gather valuable insights.</p>\n<h5 class=\"fs-5 fw-medium\">Simplify Navigation</h5>\n<p class=\"text-300\">Design a clean and intuitive navigation structure. Ensure users can easily find what they’re looking for without feeling overwhelmed. Use familiar icons and clear labels to guide them.</p>\n<h5 class=\"mt-6\">Optimize Performance</h5>\n<h5 class=\"fs-5 fw-medium\">Fast Loading Times</h5>\n<p class=\"text-300\">Optimize your app to load quickly. Users expect instant gratification, and slow load times can lead to frustration and app abandonment. Use efficient coding practices and minimize the use of heavy graphics.</p>\n<h5 class=\"fs-5 fw-medium\">Smooth Animations</h5>\n<p class=\"text-300\">Ensure animations and transitions are smooth and do not hinder the app’s performance. Well-executed animations can enhance the user experience by providing visual feedback and making interactions feel natural.</p>\n<h5 class=\"fs-5 fw-medium\">Offline Access</h5>\n<p class=\"text-300\">Provide offline capabilities for essential features. Allowing users to access certain functionalities without an internet connection can greatly improve their experience, especially in areas with poor connectivity.</p>\n<h5>Ensure Robust Security</h5>\n<h5 class=\"fs-5 fw-medium\">Data Protection</h5>\n<p class=\"text-300\">Implement strong security measures to protect user data. Use encryption, secure authentication methods, and regular security audits to safeguard sensitive information.</p>\n<h5 class=\"fs-5 fw-medium\">Transparent Policies</h5>\n<p class=\"text-300\">Be transparent about your data collection and usage policies. Provide users with clear information about how their data is used and give them control over their privacy settings.</p>\n<h5 class=\"fs-5 fw-medium\">Regular Updates</h5>\n<p class=\"text-300\">Keep your app updated with the latest security patches and improvements. Regular updates not only enhance security but also show users that you are actively maintaining and improving the app.</p>\n\n[highlighted-box title=\"Conclusion\" description=\"Creating a seamless mobile experience requires a user-centric approach, performance optimization, responsive design, user engagement strategies, and robust security measures. By focusing on these key areas, you can build a mobile app that not only meets user expectations but also stands out in the competitive app market. Remember, a great mobile experience can turn users into loyal advocates, driving the success of your app.\"][/highlighted-box]\n','published',1,'Botble\\ACL\\Models\\User',0,'main/posts/6.png',2001,NULL,'2024-07-25 20:20:57','2025-03-24 09:44:09'),(9,'How to Integrate APIs in Node.js for Your Next Project','Learn how to seamlessly integrate third-party APIs in your Node.js applications for powerful data access and functionality.','<h5>Prioritize User-Centric Design</h5>\n<h5 class=\"fs-5 fw-medium\">Understand Your Users</h5>\n<p class=\"text-300\">Conduct thorough user research to understand your target audience’s needs, preferences, and pain points. Use surveys, interviews, and usability testing to gather valuable insights.</p>\n<h5 class=\"fs-5 fw-medium\">Simplify Navigation</h5>\n<p class=\"text-300\">Design a clean and intuitive navigation structure. Ensure users can easily find what they’re looking for without feeling overwhelmed. Use familiar icons and clear labels to guide them.</p>\n<h5 class=\"mt-6\">Optimize Performance</h5>\n<h5 class=\"fs-5 fw-medium\">Fast Loading Times</h5>\n<p class=\"text-300\">Optimize your app to load quickly. Users expect instant gratification, and slow load times can lead to frustration and app abandonment. Use efficient coding practices and minimize the use of heavy graphics.</p>\n<h5 class=\"fs-5 fw-medium\">Smooth Animations</h5>\n<p class=\"text-300\">Ensure animations and transitions are smooth and do not hinder the app’s performance. Well-executed animations can enhance the user experience by providing visual feedback and making interactions feel natural.</p>\n<h5 class=\"fs-5 fw-medium\">Offline Access</h5>\n<p class=\"text-300\">Provide offline capabilities for essential features. Allowing users to access certain functionalities without an internet connection can greatly improve their experience, especially in areas with poor connectivity.</p>\n<h5>Ensure Robust Security</h5>\n<h5 class=\"fs-5 fw-medium\">Data Protection</h5>\n<p class=\"text-300\">Implement strong security measures to protect user data. Use encryption, secure authentication methods, and regular security audits to safeguard sensitive information.</p>\n<h5 class=\"fs-5 fw-medium\">Transparent Policies</h5>\n<p class=\"text-300\">Be transparent about your data collection and usage policies. Provide users with clear information about how their data is used and give them control over their privacy settings.</p>\n<h5 class=\"fs-5 fw-medium\">Regular Updates</h5>\n<p class=\"text-300\">Keep your app updated with the latest security patches and improvements. Regular updates not only enhance security but also show users that you are actively maintaining and improving the app.</p>\n\n[highlighted-box title=\"Conclusion\" description=\"Creating a seamless mobile experience requires a user-centric approach, performance optimization, responsive design, user engagement strategies, and robust security measures. By focusing on these key areas, you can build a mobile app that not only meets user expectations but also stands out in the competitive app market. Remember, a great mobile experience can turn users into loyal advocates, driving the success of your app.\"][/highlighted-box]\n','published',1,'Botble\\ACL\\Models\\User',1,'main/posts/8.png',1128,NULL,'2024-10-02 23:08:44','2025-03-24 09:44:09'),(10,'Best Practices for Designing User-Friendly Websites','Discover the best practices for designing websites that are not only aesthetically pleasing but also user-friendly and accessible.','<h5>Prioritize User-Centric Design</h5>\n<h5 class=\"fs-5 fw-medium\">Understand Your Users</h5>\n<p class=\"text-300\">Conduct thorough user research to understand your target audience’s needs, preferences, and pain points. Use surveys, interviews, and usability testing to gather valuable insights.</p>\n<h5 class=\"fs-5 fw-medium\">Simplify Navigation</h5>\n<p class=\"text-300\">Design a clean and intuitive navigation structure. Ensure users can easily find what they’re looking for without feeling overwhelmed. Use familiar icons and clear labels to guide them.</p>\n<h5 class=\"mt-6\">Optimize Performance</h5>\n<h5 class=\"fs-5 fw-medium\">Fast Loading Times</h5>\n<p class=\"text-300\">Optimize your app to load quickly. Users expect instant gratification, and slow load times can lead to frustration and app abandonment. Use efficient coding practices and minimize the use of heavy graphics.</p>\n<h5 class=\"fs-5 fw-medium\">Smooth Animations</h5>\n<p class=\"text-300\">Ensure animations and transitions are smooth and do not hinder the app’s performance. Well-executed animations can enhance the user experience by providing visual feedback and making interactions feel natural.</p>\n<h5 class=\"fs-5 fw-medium\">Offline Access</h5>\n<p class=\"text-300\">Provide offline capabilities for essential features. Allowing users to access certain functionalities without an internet connection can greatly improve their experience, especially in areas with poor connectivity.</p>\n<h5>Ensure Robust Security</h5>\n<h5 class=\"fs-5 fw-medium\">Data Protection</h5>\n<p class=\"text-300\">Implement strong security measures to protect user data. Use encryption, secure authentication methods, and regular security audits to safeguard sensitive information.</p>\n<h5 class=\"fs-5 fw-medium\">Transparent Policies</h5>\n<p class=\"text-300\">Be transparent about your data collection and usage policies. Provide users with clear information about how their data is used and give them control over their privacy settings.</p>\n<h5 class=\"fs-5 fw-medium\">Regular Updates</h5>\n<p class=\"text-300\">Keep your app updated with the latest security patches and improvements. Regular updates not only enhance security but also show users that you are actively maintaining and improving the app.</p>\n\n[highlighted-box title=\"Conclusion\" description=\"Creating a seamless mobile experience requires a user-centric approach, performance optimization, responsive design, user engagement strategies, and robust security measures. By focusing on these key areas, you can build a mobile app that not only meets user expectations but also stands out in the competitive app market. Remember, a great mobile experience can turn users into loyal advocates, driving the success of your app.\"][/highlighted-box]\n','published',1,'Botble\\ACL\\Models\\User',0,'main/posts/9.png',1640,NULL,'2024-08-31 00:51:59','2025-03-24 09:44:09'),(11,'Lessons from My First Web Development Job','Reflecting on my first web development job, the lessons I learned, the challenges I faced, and how it shaped my career.','<h5>Prioritize User-Centric Design</h5>\n<h5 class=\"fs-5 fw-medium\">Understand Your Users</h5>\n<p class=\"text-300\">Conduct thorough user research to understand your target audience’s needs, preferences, and pain points. Use surveys, interviews, and usability testing to gather valuable insights.</p>\n<h5 class=\"fs-5 fw-medium\">Simplify Navigation</h5>\n<p class=\"text-300\">Design a clean and intuitive navigation structure. Ensure users can easily find what they’re looking for without feeling overwhelmed. Use familiar icons and clear labels to guide them.</p>\n<h5 class=\"mt-6\">Optimize Performance</h5>\n<h5 class=\"fs-5 fw-medium\">Fast Loading Times</h5>\n<p class=\"text-300\">Optimize your app to load quickly. Users expect instant gratification, and slow load times can lead to frustration and app abandonment. Use efficient coding practices and minimize the use of heavy graphics.</p>\n<h5 class=\"fs-5 fw-medium\">Smooth Animations</h5>\n<p class=\"text-300\">Ensure animations and transitions are smooth and do not hinder the app’s performance. Well-executed animations can enhance the user experience by providing visual feedback and making interactions feel natural.</p>\n<h5 class=\"fs-5 fw-medium\">Offline Access</h5>\n<p class=\"text-300\">Provide offline capabilities for essential features. Allowing users to access certain functionalities without an internet connection can greatly improve their experience, especially in areas with poor connectivity.</p>\n<h5>Ensure Robust Security</h5>\n<h5 class=\"fs-5 fw-medium\">Data Protection</h5>\n<p class=\"text-300\">Implement strong security measures to protect user data. Use encryption, secure authentication methods, and regular security audits to safeguard sensitive information.</p>\n<h5 class=\"fs-5 fw-medium\">Transparent Policies</h5>\n<p class=\"text-300\">Be transparent about your data collection and usage policies. Provide users with clear information about how their data is used and give them control over their privacy settings.</p>\n<h5 class=\"fs-5 fw-medium\">Regular Updates</h5>\n<p class=\"text-300\">Keep your app updated with the latest security patches and improvements. Regular updates not only enhance security but also show users that you are actively maintaining and improving the app.</p>\n\n[highlighted-box title=\"Conclusion\" description=\"Creating a seamless mobile experience requires a user-centric approach, performance optimization, responsive design, user engagement strategies, and robust security measures. By focusing on these key areas, you can build a mobile app that not only meets user expectations but also stands out in the competitive app market. Remember, a great mobile experience can turn users into loyal advocates, driving the success of your app.\"][/highlighted-box]\n','published',1,'Botble\\ACL\\Models\\User',0,'main/posts/10.png',1929,NULL,'2025-02-22 05:11:10','2025-03-24 09:44:09'),(12,'How to Contribute to Open Source: A Beginner’s Guide','A step-by-step guide on how beginners can start contributing to open source projects, with tips on finding the right project and making meaningful contributions.','<h5>Prioritize User-Centric Design</h5>\n<h5 class=\"fs-5 fw-medium\">Understand Your Users</h5>\n<p class=\"text-300\">Conduct thorough user research to understand your target audience’s needs, preferences, and pain points. Use surveys, interviews, and usability testing to gather valuable insights.</p>\n<h5 class=\"fs-5 fw-medium\">Simplify Navigation</h5>\n<p class=\"text-300\">Design a clean and intuitive navigation structure. Ensure users can easily find what they’re looking for without feeling overwhelmed. Use familiar icons and clear labels to guide them.</p>\n<h5 class=\"mt-6\">Optimize Performance</h5>\n<h5 class=\"fs-5 fw-medium\">Fast Loading Times</h5>\n<p class=\"text-300\">Optimize your app to load quickly. Users expect instant gratification, and slow load times can lead to frustration and app abandonment. Use efficient coding practices and minimize the use of heavy graphics.</p>\n<h5 class=\"fs-5 fw-medium\">Smooth Animations</h5>\n<p class=\"text-300\">Ensure animations and transitions are smooth and do not hinder the app’s performance. Well-executed animations can enhance the user experience by providing visual feedback and making interactions feel natural.</p>\n<h5 class=\"fs-5 fw-medium\">Offline Access</h5>\n<p class=\"text-300\">Provide offline capabilities for essential features. Allowing users to access certain functionalities without an internet connection can greatly improve their experience, especially in areas with poor connectivity.</p>\n<h5>Ensure Robust Security</h5>\n<h5 class=\"fs-5 fw-medium\">Data Protection</h5>\n<p class=\"text-300\">Implement strong security measures to protect user data. Use encryption, secure authentication methods, and regular security audits to safeguard sensitive information.</p>\n<h5 class=\"fs-5 fw-medium\">Transparent Policies</h5>\n<p class=\"text-300\">Be transparent about your data collection and usage policies. Provide users with clear information about how their data is used and give them control over their privacy settings.</p>\n<h5 class=\"fs-5 fw-medium\">Regular Updates</h5>\n<p class=\"text-300\">Keep your app updated with the latest security patches and improvements. Regular updates not only enhance security but also show users that you are actively maintaining and improving the app.</p>\n\n[highlighted-box title=\"Conclusion\" description=\"Creating a seamless mobile experience requires a user-centric approach, performance optimization, responsive design, user engagement strategies, and robust security measures. By focusing on these key areas, you can build a mobile app that not only meets user expectations but also stands out in the competitive app market. Remember, a great mobile experience can turn users into loyal advocates, driving the success of your app.\"][/highlighted-box]\n','published',1,'Botble\\ACL\\Models\\User',1,'main/posts/11.png',1558,NULL,'2024-09-23 08:18:21','2025-03-24 09:44:09'),(13,'Optimizing Web Performance with React.js','Learn how to optimize your React.js applications for better performance, focusing on code splitting, lazy loading, and efficient state management.','<h5>Prioritize User-Centric Design</h5>\n<h5 class=\"fs-5 fw-medium\">Understand Your Users</h5>\n<p class=\"text-300\">Conduct thorough user research to understand your target audience’s needs, preferences, and pain points. Use surveys, interviews, and usability testing to gather valuable insights.</p>\n<h5 class=\"fs-5 fw-medium\">Simplify Navigation</h5>\n<p class=\"text-300\">Design a clean and intuitive navigation structure. Ensure users can easily find what they’re looking for without feeling overwhelmed. Use familiar icons and clear labels to guide them.</p>\n<h5 class=\"mt-6\">Optimize Performance</h5>\n<h5 class=\"fs-5 fw-medium\">Fast Loading Times</h5>\n<p class=\"text-300\">Optimize your app to load quickly. Users expect instant gratification, and slow load times can lead to frustration and app abandonment. Use efficient coding practices and minimize the use of heavy graphics.</p>\n<h5 class=\"fs-5 fw-medium\">Smooth Animations</h5>\n<p class=\"text-300\">Ensure animations and transitions are smooth and do not hinder the app’s performance. Well-executed animations can enhance the user experience by providing visual feedback and making interactions feel natural.</p>\n<h5 class=\"fs-5 fw-medium\">Offline Access</h5>\n<p class=\"text-300\">Provide offline capabilities for essential features. Allowing users to access certain functionalities without an internet connection can greatly improve their experience, especially in areas with poor connectivity.</p>\n<h5>Ensure Robust Security</h5>\n<h5 class=\"fs-5 fw-medium\">Data Protection</h5>\n<p class=\"text-300\">Implement strong security measures to protect user data. Use encryption, secure authentication methods, and regular security audits to safeguard sensitive information.</p>\n<h5 class=\"fs-5 fw-medium\">Transparent Policies</h5>\n<p class=\"text-300\">Be transparent about your data collection and usage policies. Provide users with clear information about how their data is used and give them control over their privacy settings.</p>\n<h5 class=\"fs-5 fw-medium\">Regular Updates</h5>\n<p class=\"text-300\">Keep your app updated with the latest security patches and improvements. Regular updates not only enhance security but also show users that you are actively maintaining and improving the app.</p>\n\n[highlighted-box title=\"Conclusion\" description=\"Creating a seamless mobile experience requires a user-centric approach, performance optimization, responsive design, user engagement strategies, and robust security measures. By focusing on these key areas, you can build a mobile app that not only meets user expectations but also stands out in the competitive app market. Remember, a great mobile experience can turn users into loyal advocates, driving the success of your app.\"][/highlighted-box]\n','published',1,'Botble\\ACL\\Models\\User',0,'main/posts/12.png',309,NULL,'2025-01-19 04:55:38','2025-03-24 09:44:09'),(14,'My Top 5 GitHub Projects','An overview of my top 5 GitHub projects, showcasing what I’ve built and how they’ve helped me grow as a developer.','<h5>Prioritize User-Centric Design</h5>\n<h5 class=\"fs-5 fw-medium\">Understand Your Users</h5>\n<p class=\"text-300\">Conduct thorough user research to understand your target audience’s needs, preferences, and pain points. Use surveys, interviews, and usability testing to gather valuable insights.</p>\n<h5 class=\"fs-5 fw-medium\">Simplify Navigation</h5>\n<p class=\"text-300\">Design a clean and intuitive navigation structure. Ensure users can easily find what they’re looking for without feeling overwhelmed. Use familiar icons and clear labels to guide them.</p>\n<h5 class=\"mt-6\">Optimize Performance</h5>\n<h5 class=\"fs-5 fw-medium\">Fast Loading Times</h5>\n<p class=\"text-300\">Optimize your app to load quickly. Users expect instant gratification, and slow load times can lead to frustration and app abandonment. Use efficient coding practices and minimize the use of heavy graphics.</p>\n<h5 class=\"fs-5 fw-medium\">Smooth Animations</h5>\n<p class=\"text-300\">Ensure animations and transitions are smooth and do not hinder the app’s performance. Well-executed animations can enhance the user experience by providing visual feedback and making interactions feel natural.</p>\n<h5 class=\"fs-5 fw-medium\">Offline Access</h5>\n<p class=\"text-300\">Provide offline capabilities for essential features. Allowing users to access certain functionalities without an internet connection can greatly improve their experience, especially in areas with poor connectivity.</p>\n<h5>Ensure Robust Security</h5>\n<h5 class=\"fs-5 fw-medium\">Data Protection</h5>\n<p class=\"text-300\">Implement strong security measures to protect user data. Use encryption, secure authentication methods, and regular security audits to safeguard sensitive information.</p>\n<h5 class=\"fs-5 fw-medium\">Transparent Policies</h5>\n<p class=\"text-300\">Be transparent about your data collection and usage policies. Provide users with clear information about how their data is used and give them control over their privacy settings.</p>\n<h5 class=\"fs-5 fw-medium\">Regular Updates</h5>\n<p class=\"text-300\">Keep your app updated with the latest security patches and improvements. Regular updates not only enhance security but also show users that you are actively maintaining and improving the app.</p>\n\n[highlighted-box title=\"Conclusion\" description=\"Creating a seamless mobile experience requires a user-centric approach, performance optimization, responsive design, user engagement strategies, and robust security measures. By focusing on these key areas, you can build a mobile app that not only meets user expectations but also stands out in the competitive app market. Remember, a great mobile experience can turn users into loyal advocates, driving the success of your app.\"][/highlighted-box]\n','published',1,'Botble\\ACL\\Models\\User',0,'main/posts/10.png',920,NULL,'2024-06-26 18:35:25','2025-03-24 09:44:09'),(15,'Adapting to the New Web Development Trends in 2024','A look at the latest trends in web development for 2024, including new technologies, best practices, and what the future holds for developers.','<h5>Prioritize User-Centric Design</h5>\n<h5 class=\"fs-5 fw-medium\">Understand Your Users</h5>\n<p class=\"text-300\">Conduct thorough user research to understand your target audience’s needs, preferences, and pain points. Use surveys, interviews, and usability testing to gather valuable insights.</p>\n<h5 class=\"fs-5 fw-medium\">Simplify Navigation</h5>\n<p class=\"text-300\">Design a clean and intuitive navigation structure. Ensure users can easily find what they’re looking for without feeling overwhelmed. Use familiar icons and clear labels to guide them.</p>\n<h5 class=\"mt-6\">Optimize Performance</h5>\n<h5 class=\"fs-5 fw-medium\">Fast Loading Times</h5>\n<p class=\"text-300\">Optimize your app to load quickly. Users expect instant gratification, and slow load times can lead to frustration and app abandonment. Use efficient coding practices and minimize the use of heavy graphics.</p>\n<h5 class=\"fs-5 fw-medium\">Smooth Animations</h5>\n<p class=\"text-300\">Ensure animations and transitions are smooth and do not hinder the app’s performance. Well-executed animations can enhance the user experience by providing visual feedback and making interactions feel natural.</p>\n<h5 class=\"fs-5 fw-medium\">Offline Access</h5>\n<p class=\"text-300\">Provide offline capabilities for essential features. Allowing users to access certain functionalities without an internet connection can greatly improve their experience, especially in areas with poor connectivity.</p>\n<h5>Ensure Robust Security</h5>\n<h5 class=\"fs-5 fw-medium\">Data Protection</h5>\n<p class=\"text-300\">Implement strong security measures to protect user data. Use encryption, secure authentication methods, and regular security audits to safeguard sensitive information.</p>\n<h5 class=\"fs-5 fw-medium\">Transparent Policies</h5>\n<p class=\"text-300\">Be transparent about your data collection and usage policies. Provide users with clear information about how their data is used and give them control over their privacy settings.</p>\n<h5 class=\"fs-5 fw-medium\">Regular Updates</h5>\n<p class=\"text-300\">Keep your app updated with the latest security patches and improvements. Regular updates not only enhance security but also show users that you are actively maintaining and improving the app.</p>\n\n[highlighted-box title=\"Conclusion\" description=\"Creating a seamless mobile experience requires a user-centric approach, performance optimization, responsive design, user engagement strategies, and robust security measures. By focusing on these key areas, you can build a mobile app that not only meets user expectations but also stands out in the competitive app market. Remember, a great mobile experience can turn users into loyal advocates, driving the success of your app.\"][/highlighted-box]\n','published',1,'Botble\\ACL\\Models\\User',1,'main/posts/9.png',1624,NULL,'2024-09-15 04:15:44','2025-03-24 09:44:09');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_translations`
--

DROP TABLE IF EXISTS `posts_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `posts_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`posts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_translations`
--

LOCK TABLES `posts_translations` WRITE;
/*!40000 ALTER TABLE `posts_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request_logs`
--

DROP TABLE IF EXISTS `request_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `request_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `status_code` int DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `count` int unsigned NOT NULL DEFAULT '0',
  `user_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referrer` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_logs`
--

LOCK TABLES `request_logs` WRITE;
/*!40000 ALTER TABLE `request_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `request_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revisions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `revisionable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `old_value` text COLLATE utf8mb4_unicode_ci,
  `new_value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_users`
--

DROP TABLE IF EXISTS `role_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_users` (
  `user_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_users_user_id_index` (`user_id`),
  KEY `role_users_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_users`
--

LOCK TABLES `role_users` WRITE;
/*!40000 ALTER TABLE `role_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_by` bigint unsigned NOT NULL,
  `updated_by` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`),
  KEY `roles_created_by_index` (`created_by`),
  KEY `roles_updated_by_index` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Admin','{\"users.index\":true,\"users.create\":true,\"users.edit\":true,\"users.destroy\":true,\"roles.index\":true,\"roles.create\":true,\"roles.edit\":true,\"roles.destroy\":true,\"core.system\":true,\"core.cms\":true,\"core.manage.license\":true,\"systems.cronjob\":true,\"core.tools\":true,\"tools.data-synchronize\":true,\"media.index\":true,\"files.index\":true,\"files.create\":true,\"files.edit\":true,\"files.trash\":true,\"files.destroy\":true,\"folders.index\":true,\"folders.create\":true,\"folders.edit\":true,\"folders.trash\":true,\"folders.destroy\":true,\"settings.index\":true,\"settings.common\":true,\"settings.options\":true,\"settings.email\":true,\"settings.media\":true,\"settings.admin-appearance\":true,\"settings.cache\":true,\"settings.datatables\":true,\"settings.email.rules\":true,\"settings.others\":true,\"menus.index\":true,\"menus.create\":true,\"menus.edit\":true,\"menus.destroy\":true,\"optimize.settings\":true,\"pages.index\":true,\"pages.create\":true,\"pages.edit\":true,\"pages.destroy\":true,\"plugins.index\":true,\"plugins.edit\":true,\"plugins.remove\":true,\"plugins.marketplace\":true,\"core.appearance\":true,\"theme.index\":true,\"theme.activate\":true,\"theme.remove\":true,\"theme.options\":true,\"theme.custom-css\":true,\"theme.custom-js\":true,\"theme.custom-html\":true,\"theme.robots-txt\":true,\"settings.website-tracking\":true,\"widgets.index\":true,\"analytics.general\":true,\"analytics.page\":true,\"analytics.browser\":true,\"analytics.referrer\":true,\"analytics.settings\":true,\"announcements.index\":true,\"announcements.create\":true,\"announcements.edit\":true,\"announcements.destroy\":true,\"announcements.settings\":true,\"audit-log.index\":true,\"audit-log.destroy\":true,\"backups.index\":true,\"backups.create\":true,\"backups.restore\":true,\"backups.destroy\":true,\"plugins.blog\":true,\"posts.index\":true,\"posts.create\":true,\"posts.edit\":true,\"posts.destroy\":true,\"categories.index\":true,\"categories.create\":true,\"categories.edit\":true,\"categories.destroy\":true,\"tags.index\":true,\"tags.create\":true,\"tags.edit\":true,\"tags.destroy\":true,\"blog.settings\":true,\"posts.export\":true,\"posts.import\":true,\"captcha.settings\":true,\"contacts.index\":true,\"contacts.edit\":true,\"contacts.destroy\":true,\"contact.custom-fields\":true,\"contact.settings\":true,\"plugin.faq\":true,\"faq.index\":true,\"faq.create\":true,\"faq.edit\":true,\"faq.destroy\":true,\"faq_category.index\":true,\"faq_category.create\":true,\"faq_category.edit\":true,\"faq_category.destroy\":true,\"faqs.settings\":true,\"fob-comment.index\":true,\"fob-comment.comments.index\":true,\"fob-comment.comments.edit\":true,\"fob-comment.comments.destroy\":true,\"fob-comment.comments.reply\":true,\"fob-comment.settings\":true,\"languages.index\":true,\"languages.create\":true,\"languages.edit\":true,\"languages.destroy\":true,\"newsletter.index\":true,\"newsletter.destroy\":true,\"newsletter.settings\":true,\"plugins.portfolio\":true,\"portfolio.projects.index\":true,\"portfolio.projects.create\":true,\"portfolio.projects.edit\":true,\"portfolio.projects.destroy\":true,\"portfolio.service-categories.index\":true,\"portfolio.service-categories.create\":true,\"portfolio.service-categories.edit\":true,\"portfolio.service-categories.destroy\":true,\"portfolio.services.index\":true,\"portfolio.services.create\":true,\"portfolio.services.edit\":true,\"portfolio.services.destroy\":true,\"portfolio.packages.index\":true,\"portfolio.packages.create\":true,\"portfolio.packages.edit\":true,\"portfolio.packages.destroy\":true,\"portfolio.quotation-requests.index\":true,\"portfolio.quotation-requests.create\":true,\"portfolio.quotation-requests.edit\":true,\"portfolio.quotation-requests.destroy\":true,\"portfolio.custom-fields.index\":true,\"portfolio.custom-fields.create\":true,\"portfolio.custom-fields.edit\":true,\"portfolio.custom-fields.destroy\":true,\"request-log.index\":true,\"request-log.destroy\":true,\"testimonial.index\":true,\"testimonial.create\":true,\"testimonial.edit\":true,\"testimonial.destroy\":true,\"plugins.translation\":true,\"translations.locales\":true,\"translations.theme-translations\":true,\"translations.index\":true,\"theme-translations.export\":true,\"other-translations.export\":true,\"theme-translations.import\":true,\"other-translations.import\":true,\"api.settings\":true,\"api.sanctum-token.index\":true,\"api.sanctum-token.create\":true,\"api.sanctum-token.destroy\":true}','Admin users role',1,1,1,'2025-03-24 09:44:07','2025-03-24 09:44:07');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'media_random_hash','23f95d0967d849bf8d19d02ea44c6777',NULL,'2025-03-24 09:44:13'),(2,'api_enabled','0',NULL,'2025-03-24 09:44:13'),(3,'activated_plugins','[\"language\",\"language-advanced\",\"analytics\",\"announcement\",\"audit-log\",\"backup\",\"blog\",\"captcha\",\"contact\",\"cookie-consent\",\"faq\",\"fob-comment\",\"newsletter\",\"portfolio\",\"request-log\",\"rss-feed\",\"testimonial\",\"translation\"]',NULL,'2025-03-24 09:44:13'),(4,'theme','zelio',NULL,'2025-03-24 09:44:13'),(5,'show_admin_bar','1',NULL,'2025-03-24 09:44:13'),(6,'language_hide_default','1',NULL,'2025-03-24 09:44:13'),(7,'language_switcher_display','dropdown',NULL,'2025-03-24 09:44:13'),(8,'language_display','all',NULL,'2025-03-24 09:44:13'),(9,'language_hide_languages','[]',NULL,'2025-03-24 09:44:13'),(10,'theme-zelio-favicon','code/general/favicon.png',NULL,NULL),(11,'theme-zelio-logo','code/general/favicon.png',NULL,NULL),(12,'theme-zelio-logo_dark','code/general/favicon.png',NULL,NULL),(13,'theme-zelio-site_title','Web & App developer',NULL,NULL),(14,'theme-zelio-site_name','James.dev',NULL,NULL),(15,'theme-zelio-seo_description','Discover innovative designs, creative projects, and unique artistic works. Showcasing the expertise and vision behind every creation.',NULL,NULL),(16,'theme-zelio-tp_primary_font','DM Mono',NULL,NULL),(17,'theme-zelio-primary_color','#62a92b',NULL,NULL),(18,'theme-zelio-gradient_color','#659932',NULL,NULL),(19,'theme-zelio-homepage_id','1',NULL,NULL),(20,'theme-zelio-social_links','[[{\"key\":\"name\",\"value\":\"Facebook\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-facebook\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.facebook.com\"}],[{\"key\":\"name\",\"value\":\"X (Twitter)\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-x\"},{\"key\":\"url\",\"value\":\"https:\\/\\/x.com\"}],[{\"key\":\"name\",\"value\":\"YouTube\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-youtube\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.youtube.com\"}],[{\"key\":\"name\",\"value\":\"Instagram\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-linkedin\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.linkedin.com\"}]]',NULL,NULL),(21,'theme-zelio-copyright','© %Y All Rights Reserved by <a href=\"https://botble.com\" class=\"text-primary\">botble.com</a>.',NULL,NULL),(22,'theme-zelio-preloader_enabled','yes',NULL,NULL),(23,'theme-zelio-preloader_version','v2',NULL,NULL),(24,'theme-zelio-footer_background','code/general/footer-bg.png',NULL,NULL),(25,'theme-zelio-header_style','2',NULL,NULL),(26,'theme-zelio-footer_style','2',NULL,NULL),(27,'theme-zelio-preloader_style','2',NULL,NULL),(28,'theme-zelio-blog_page_id','5',NULL,NULL),(29,'theme-zelio-post_item_style','2',NULL,NULL),(30,'theme-zelio-post_item_per_row','3',NULL,NULL),(31,'theme-zelio-cookie_consent_learn_more_url','/cookie-policy',NULL,NULL),(32,'theme-zelio-cookie_consent_learn_more_text','Cookie Policy',NULL,NULL);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slugs`
--

DROP TABLE IF EXISTS `slugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slugs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `slugs_reference_id_index` (`reference_id`),
  KEY `slugs_key_index` (`key`),
  KEY `slugs_prefix_index` (`prefix`),
  KEY `slugs_reference_index` (`reference_id`,`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slugs`
--

LOCK TABLES `slugs` WRITE;
/*!40000 ALTER TABLE `slugs` DISABLE KEYS */;
INSERT INTO `slugs` VALUES (1,'web-development',1,'Botble\\Blog\\Models\\Category','','2025-03-24 09:44:09','2025-03-24 09:44:09'),(2,'open-source-contributions',2,'Botble\\Blog\\Models\\Category','','2025-03-24 09:44:09','2025-03-24 09:44:09'),(3,'tutorials',3,'Botble\\Blog\\Models\\Category','','2025-03-24 09:44:09','2025-03-24 09:44:09'),(4,'technology-reviews',4,'Botble\\Blog\\Models\\Category','','2025-03-24 09:44:09','2025-03-24 09:44:09'),(5,'personal-blog',5,'Botble\\Blog\\Models\\Category','','2025-03-24 09:44:09','2025-03-24 09:44:09'),(6,'career-journey',6,'Botble\\Blog\\Models\\Category','','2025-03-24 09:44:09','2025-03-24 09:44:09'),(7,'coding-challenges',7,'Botble\\Blog\\Models\\Category','','2025-03-24 09:44:09','2025-03-24 09:44:09'),(8,'design-portfolio',8,'Botble\\Blog\\Models\\Category','','2025-03-24 09:44:09','2025-03-24 09:44:09'),(9,'collaborations',9,'Botble\\Blog\\Models\\Category','','2025-03-24 09:44:09','2025-03-24 09:44:09'),(10,'botble-cms',1,'Botble\\Blog\\Models\\Tag','tag','2025-03-24 09:44:09','2025-03-24 09:44:09'),(11,'javascript',2,'Botble\\Blog\\Models\\Tag','tag','2025-03-24 09:44:09','2025-03-24 09:44:09'),(12,'open-source',3,'Botble\\Blog\\Models\\Tag','tag','2025-03-24 09:44:09','2025-03-24 09:44:09'),(13,'web-design',4,'Botble\\Blog\\Models\\Tag','tag','2025-03-24 09:44:09','2025-03-24 09:44:09'),(14,'api-development',5,'Botble\\Blog\\Models\\Tag','tag','2025-03-24 09:44:09','2025-03-24 09:44:09'),(15,'full-stack-development',6,'Botble\\Blog\\Models\\Tag','tag','2025-03-24 09:44:09','2025-03-24 09:44:09'),(16,'vietnam-developer',7,'Botble\\Blog\\Models\\Tag','tag','2025-03-24 09:44:09','2025-03-24 09:44:09'),(17,'github-projects',8,'Botble\\Blog\\Models\\Tag','tag','2025-03-24 09:44:09','2025-03-24 09:44:09'),(18,'building-a-full-stack-app-with-the-tall-stack',1,'Botble\\Blog\\Models\\Post','','2025-03-24 09:44:09','2025-03-24 09:44:09'),(19,'my-journey-in-open-source-3-years-of-contributions',2,'Botble\\Blog\\Models\\Post','','2025-03-24 09:44:09','2025-03-24 09:44:09'),(20,'5-essential-tools-for-web-developers-in-2024',3,'Botble\\Blog\\Models\\Post','','2025-03-24 09:44:09','2025-03-24 09:44:09'),(21,'how-i-built-my-personal-portfolio-using-botble-cms',4,'Botble\\Blog\\Models\\Post','','2025-03-24 09:44:09','2025-03-24 09:44:09'),(22,'creating-responsive-uis-with-tailwind-css',5,'Botble\\Blog\\Models\\Post','','2025-03-24 09:44:09','2025-03-24 09:44:09'),(23,'why-i-love-contributing-to-open-source-projects',6,'Botble\\Blog\\Models\\Post','','2025-03-24 09:44:09','2025-03-24 09:44:09'),(24,'a-deep-dive-into-laravel-for-beginners',7,'Botble\\Blog\\Models\\Post','','2025-03-24 09:44:09','2025-03-24 09:44:09'),(25,'exploring-the-benefits-of-mysql-for-large-scale-projects',8,'Botble\\Blog\\Models\\Post','','2025-03-24 09:44:09','2025-03-24 09:44:09'),(26,'how-to-integrate-apis-in-nodejs-for-your-next-project',9,'Botble\\Blog\\Models\\Post','','2025-03-24 09:44:09','2025-03-24 09:44:09'),(27,'best-practices-for-designing-user-friendly-websites',10,'Botble\\Blog\\Models\\Post','','2025-03-24 09:44:09','2025-03-24 09:44:09'),(28,'lessons-from-my-first-web-development-job',11,'Botble\\Blog\\Models\\Post','','2025-03-24 09:44:09','2025-03-24 09:44:09'),(29,'how-to-contribute-to-open-source-a-beginners-guide',12,'Botble\\Blog\\Models\\Post','','2025-03-24 09:44:09','2025-03-24 09:44:09'),(30,'optimizing-web-performance-with-reactjs',13,'Botble\\Blog\\Models\\Post','','2025-03-24 09:44:09','2025-03-24 09:44:09'),(31,'my-top-5-github-projects',14,'Botble\\Blog\\Models\\Post','','2025-03-24 09:44:09','2025-03-24 09:44:09'),(32,'adapting-to-the-new-web-development-trends-in-2024',15,'Botble\\Blog\\Models\\Post','','2025-03-24 09:44:09','2025-03-24 09:44:09'),(33,'api-development',1,'Botble\\Portfolio\\Models\\Service','services','2025-03-24 09:44:10','2025-03-24 09:44:10'),(34,'frontend-development',2,'Botble\\Portfolio\\Models\\Service','services','2025-03-24 09:44:10','2025-03-24 09:44:10'),(35,'mobile-app-development',3,'Botble\\Portfolio\\Models\\Service','services','2025-03-24 09:44:10','2025-03-24 09:44:10'),(36,'devops-consulting',4,'Botble\\Portfolio\\Models\\Service','services','2025-03-24 09:44:10','2025-03-24 09:44:10'),(37,'cloud-integration',5,'Botble\\Portfolio\\Models\\Service','services','2025-03-24 09:44:10','2025-03-24 09:44:10'),(38,'database-management',6,'Botble\\Portfolio\\Models\\Service','services','2025-03-24 09:44:10','2025-03-24 09:44:10'),(39,'crm-system',1,'Botble\\Portfolio\\Models\\Project','projects','2025-03-24 09:44:10','2025-03-24 09:44:10'),(40,'e-learning-platform',2,'Botble\\Portfolio\\Models\\Project','projects','2025-03-24 09:44:10','2025-03-24 09:44:10'),(41,'mobile-banking-app',3,'Botble\\Portfolio\\Models\\Project','projects','2025-03-24 09:44:10','2025-03-24 09:44:10'),(42,'cloud-infrastructure-setup',4,'Botble\\Portfolio\\Models\\Project','projects','2025-03-24 09:44:10','2025-03-24 09:44:10'),(43,'home',1,'Botble\\Page\\Models\\Page','','2025-03-24 09:44:13','2025-03-24 09:44:13'),(44,'services',2,'Botble\\Page\\Models\\Page','','2025-03-24 09:44:13','2025-03-24 09:44:13'),(45,'projects',3,'Botble\\Page\\Models\\Page','','2025-03-24 09:44:13','2025-03-24 09:44:13'),(46,'pricing',4,'Botble\\Page\\Models\\Page','','2025-03-24 09:44:13','2025-03-24 09:44:13'),(47,'blog',5,'Botble\\Page\\Models\\Page','','2025-03-24 09:44:13','2025-03-24 09:44:13'),(48,'contact',6,'Botble\\Page\\Models\\Page','','2025-03-24 09:44:13','2025-03-24 09:44:13'),(49,'cookie-policy',7,'Botble\\Page\\Models\\Page','','2025-03-24 09:44:13','2025-03-24 09:44:13');
/*!40000 ALTER TABLE `slugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slugs_translations`
--

DROP TABLE IF EXISTS `slugs_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slugs_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slugs_id` bigint unsigned NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefix` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`lang_code`,`slugs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slugs_translations`
--

LOCK TABLES `slugs_translations` WRITE;
/*!40000 ALTER TABLE `slugs_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `slugs_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'Botble CMS',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-03-24 09:44:09','2025-03-24 09:44:09'),(2,'JavaScript',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-03-24 09:44:09','2025-03-24 09:44:09'),(3,'Open Source',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-03-24 09:44:09','2025-03-24 09:44:09'),(4,'Web Design',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-03-24 09:44:09','2025-03-24 09:44:09'),(5,'API Development',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-03-24 09:44:09','2025-03-24 09:44:09'),(6,'Full Stack Development',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-03-24 09:44:09','2025-03-24 09:44:09'),(7,'Vietnam Developer',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-03-24 09:44:09','2025-03-24 09:44:09'),(8,'GitHub Projects',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-03-24 09:44:09','2025-03-24 09:44:09');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags_translations`
--

DROP TABLE IF EXISTS `tags_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`tags_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags_translations`
--

LOCK TABLES `tags_translations` WRITE;
/*!40000 ALTER TABLE `tags_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonials`
--

DROP TABLE IF EXISTS `testimonials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testimonials` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonials`
--

LOCK TABLES `testimonials` WRITE;
/*!40000 ALTER TABLE `testimonials` DISABLE KEYS */;
INSERT INTO `testimonials` VALUES (1,'Jennifer Lee','“Working with this team was an absolute pleasure. Their attention to detail, professionalism, and understanding of my needs made the entire home buying process stress-free and enjoyable.”','main/avatars/2.png','Happy Home Seeker','published','2025-03-24 09:44:09','2025-03-24 09:44:09'),(2,'Robert Evans','“The guidance and insights provided by this team were invaluable in helping me secure profitable investments. Their market knowledge and dedication to client success are unmatched.”','main/avatars/2.png','Property Investor','published','2025-03-24 09:44:09','2025-03-24 09:44:09'),(3,'Jessica White','“I couldn’t have asked for a smoother selling experience. Their expert advice, flawless staging, and negotiation skills resulted in a quick sale at a great price. Truly impressive!”','main/avatars/1.png','Delighted Home Seller','published','2025-03-24 09:44:09','2025-03-24 09:44:09'),(4,'Daniel Miller','“From start to finish, the home buying experience was handled with care and professionalism. The team listened to all my concerns and helped me find the perfect home in no time.”','main/avatars/2.png','Happy New Homeowner','published','2025-03-24 09:44:09','2025-03-24 09:44:09');
/*!40000 ALTER TABLE `testimonials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonials_translations`
--

DROP TABLE IF EXISTS `testimonials_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testimonials_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `testimonials_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `company` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`testimonials_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonials_translations`
--

LOCK TABLES `testimonials_translations` WRITE;
/*!40000 ALTER TABLE `testimonials_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `testimonials_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_meta`
--

DROP TABLE IF EXISTS `user_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_meta` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_meta_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_meta`
--

LOCK TABLES `user_meta` WRITE;
/*!40000 ALTER TABLE `user_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_id` bigint unsigned DEFAULT NULL,
  `super_user` tinyint(1) NOT NULL DEFAULT '0',
  `manage_supers` tinyint(1) NOT NULL DEFAULT '0',
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `last_login` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'elyse.gusikowski@stanton.com',NULL,'$2y$12$pYfI/YfhVYg6zI.qPPWrLOEZ6Wg1MgbuN0oHeDv3A4WZJ3XUc0ZTe',NULL,'2025-03-24 09:44:07','2025-03-24 09:44:07','Toni','Stracke','admin',NULL,1,1,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `widget_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sidebar_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `data` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES (1,'ContactInformationWidget','sidebar_panel_sidebar','zelio',1,'{\"bio\":\"I\'m always excited to take on new projects and collaborate with innovative minds.\",\"details\":{\"Phone\":[{\"key\":\"label\",\"value\":\"Phone\"},{\"key\":\"value\",\"value\":\"+1 234 567 890\"}],\"Email\":[{\"key\":\"label\",\"value\":\"Email\"},{\"key\":\"value\",\"value\":\"contact@botble.com\"}],\"Website\":[{\"key\":\"label\",\"value\":\"Website\"},{\"key\":\"value\",\"value\":\"https:\\/\\/botble.com\"}],\"Address\":[{\"key\":\"label\",\"value\":\"Address\"},{\"key\":\"value\",\"value\":\"123 Main Street, New York, NY 10001\"}]}}','2025-03-24 09:44:13','2025-03-24 09:44:13'),(2,'SocialLinkWidget','sidebar_panel_sidebar','zelio',2,'{\"name\":\"Social\"}','2025-03-24 09:44:13','2025-03-24 09:44:13'),(3,'LanguageSwitcherWidget','sidebar_panel_sidebar','zelio',3,'[]','2025-03-24 09:44:13','2025-03-24 09:44:13'),(4,'SiteLogoWidget','footer_sidebar','zelio',1,'[]','2025-03-24 09:44:13','2025-03-24 09:44:13'),(5,'SocialLinkWidget','footer_sidebar','zelio',2,'{\"name\":\"Social\"}','2025-03-24 09:44:13','2025-03-24 09:44:13'),(6,'Botble\\Widget\\Widgets\\CoreSimpleMenu','footer_sidebar','zelio',3,'{\"id\":\"Botble\\\\Widget\\\\Widgets\\\\CoreSimpleMenu\",\"items\":[[{\"key\":\"label\",\"value\":\"Home\"},{\"key\":\"url\",\"value\":\"http:\\/\\/zelio.test\\/home\"}],[{\"key\":\"label\",\"value\":\"Services\"},{\"key\":\"url\",\"value\":\"http:\\/\\/zelio.test\\/services\"}],[{\"key\":\"label\",\"value\":\"Pricing\"},{\"key\":\"url\",\"value\":\"http:\\/\\/zelio.test\\/pricing\"}],[{\"key\":\"label\",\"value\":\"Blog\"},{\"key\":\"url\",\"value\":\"http:\\/\\/zelio.test\\/blog\"}],[{\"key\":\"label\",\"value\":\"Contact\"},{\"key\":\"url\",\"value\":\"http:\\/\\/zelio.test\\/contact\"}]]}','2025-03-24 09:44:13','2025-03-24 09:44:13');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-24 23:44:13
