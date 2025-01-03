-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--.
-- Host: 127.0.0.1    Database: sports_management2
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL,
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
-- Table structure for table `event_participants`
--

DROP TABLE IF EXISTS `event_participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_participants` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_participants_event_id_foreign` (`event_id`),
  KEY `event_participants_user_id_foreign` (`user_id`),
  CONSTRAINT `event_participants_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
  CONSTRAINT `event_participants_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_participants`
--

LOCK TABLES `event_participants` WRITE;
/*!40000 ALTER TABLE `event_participants` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `event_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
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
-- Table structure for table `fan_engagements`
--

DROP TABLE IF EXISTS `fan_engagements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fan_engagements` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `team_id` bigint(20) unsigned NOT NULL,
  `engagement_score` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fan_engagements_user_id_foreign` (`user_id`),
  KEY `fan_engagements_team_id_foreign` (`team_id`),
  CONSTRAINT `fan_engagements_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `fan_engagements_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fan_engagements`
--

LOCK TABLES `fan_engagements` WRITE;
/*!40000 ALTER TABLE `fan_engagements` DISABLE KEYS */;
/*!40000 ALTER TABLE `fan_engagements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `injuries`
--

DROP TABLE IF EXISTS `injuries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `injuries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `player_id` bigint(20) unsigned NOT NULL,
  `injury_type` varchar(255) NOT NULL,
  `injury_date` date DEFAULT NULL,
  `recovery_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `injuries_player_id_foreign` (`player_id`),
  CONSTRAINT `injuries_player_id_foreign` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `injuries`
--

LOCK TABLES `injuries` WRITE;
/*!40000 ALTER TABLE `injuries` DISABLE KEYS */;
INSERT INTO `injuries` VALUES (2,330,'Sağ ayak tabanında sinir sıkışması','2024-01-02','2024-04-02',NULL,NULL),(3,305,'Sol el bileği burkulması','2024-01-02','2024-01-02',NULL,NULL),(4,115,'Burunda kırılma','2023-04-15','2023-07-30',NULL,NULL),(5,96,'Kol kırığı','2020-07-11','2020-11-28',NULL,NULL),(6,330,'Sağ ayak tabanında sinir sıkışması','2024-01-02','2024-04-02',NULL,NULL),(7,305,'Sol el bileği burkulması','2024-01-02','2024-01-02',NULL,NULL),(8,115,'Burunda kırılma','2023-04-15','2023-07-30',NULL,NULL),(9,96,'Kol kırığı','2020-07-11','2020-11-28',NULL,NULL),(10,80,'Sol orta ayak parmağında çatlak','2024-12-01','2025-01-15',NULL,NULL),(11,75,'Kafa Darbesi','2023-05-05','2023-05-15',NULL,NULL),(12,51,'Gribal enfeksiyon','2024-07-04','2024-07-12',NULL,NULL),(13,43,'Uyluk gerilmesi','1999-03-16','1999-03-17',NULL,NULL),(14,37,'Ateş','2024-10-02','2024-10-05',NULL,NULL),(15,11,'Eklem parçalanması','2022-07-12','2023-07-12',NULL,NULL),(16,6,'Sağ ayak bileği burkulması','2022-02-02','2022-02-12',NULL,NULL),(17,4,'Kalça çıkığı','2020-05-01','2020-03-04',NULL,NULL),(18,2,'Kuyruk sokumuna darbe','2022-02-11','2022-03-11',NULL,NULL);
/*!40000 ALTER TABLE `injuries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
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
-- Table structure for table `leagues`
--

DROP TABLE IF EXISTS `leagues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leagues` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sports_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leagues`
--

LOCK TABLES `leagues` WRITE;
/*!40000 ALTER TABLE `leagues` DISABLE KEYS */;
INSERT INTO `leagues` VALUES (43,'Premier League',NULL,NULL,NULL,2),(44,'La Liga',NULL,NULL,NULL,2),(45,'Bundesliga',NULL,NULL,NULL,2),(46,'Serie A',NULL,NULL,NULL,2),(47,'Ligue 1',NULL,NULL,NULL,2),(48,'Brasileirão Serie A',NULL,NULL,NULL,2),(49,'Primera División',NULL,NULL,NULL,2),(50,'Primeira Liga',NULL,NULL,NULL,2),(51,'Eredivisie',NULL,NULL,NULL,2),(52,'Liga MX',NULL,NULL,NULL,2),(53,'Süper Lig',NULL,NULL,NULL,1),(54,'Türkiye Basketbol Ligi',NULL,NULL,NULL,1),(55,'Türkiye Basketbol 2. Ligi',NULL,NULL,NULL,1),(56,'Türkiye Şampiyonası',NULL,NULL,NULL,1),(57,'Süper Lig',NULL,NULL,NULL,2),(58,'1.Lig',NULL,NULL,NULL,2),(59,'2.Lig',NULL,NULL,NULL,2),(60,'3.Lig',NULL,NULL,NULL,2),(61,'Efeler ve Sultanlar Ligi',NULL,NULL,NULL,3),(62,'1.Lig',NULL,NULL,NULL,3),(63,'2.Lig',NULL,NULL,NULL,3),(64,'3.Lig',NULL,NULL,NULL,3),(65,'Bölgesel Lig',NULL,NULL,NULL,3);
/*!40000 ALTER TABLE `leagues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `match_details`
--

DROP TABLE IF EXISTS `match_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `match_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `match_id` bigint(20) unsigned NOT NULL,
  `home_team_score` int(11) NOT NULL,
  `away_team_score` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `match_details_match_id_foreign` (`match_id`),
  CONSTRAINT `match_details_match_id_foreign` FOREIGN KEY (`match_id`) REFERENCES `matches` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `match_details`
--

LOCK TABLES `match_details` WRITE;
/*!40000 ALTER TABLE `match_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `match_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `match_officials`
--

DROP TABLE IF EXISTS `match_officials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `match_officials` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `match_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `role` enum('referee','assistant_referee') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `match_officials_match_id_foreign` (`match_id`),
  KEY `match_officials_user_id_foreign` (`user_id`),
  CONSTRAINT `match_officials_match_id_foreign` FOREIGN KEY (`match_id`) REFERENCES `matches` (`id`),
  CONSTRAINT `match_officials_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `match_officials`
--

LOCK TABLES `match_officials` WRITE;
/*!40000 ALTER TABLE `match_officials` DISABLE KEYS */;
/*!40000 ALTER TABLE `match_officials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `match_results`
--

DROP TABLE IF EXISTS `match_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `match_results` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `match_id` bigint(20) unsigned NOT NULL,
  `home_team_score` int(11) NOT NULL,
  `away_team_score` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `match_results_match_id_foreign` (`match_id`),
  CONSTRAINT `match_results_match_id_foreign` FOREIGN KEY (`match_id`) REFERENCES `matches` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `match_results`
--

LOCK TABLES `match_results` WRITE;
/*!40000 ALTER TABLE `match_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `match_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matches`
--

DROP TABLE IF EXISTS `matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matches` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `home_team_id` bigint(20) unsigned NOT NULL,
  `away_team_id` bigint(20) unsigned NOT NULL,
  `match_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `matches_home_team_id_foreign` (`home_team_id`),
  KEY `matches_away_team_id_foreign` (`away_team_id`),
  CONSTRAINT `matches_away_team_id_foreign` FOREIGN KEY (`away_team_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `matches_home_team_id_foreign` FOREIGN KEY (`home_team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matches`
--

LOCK TABLES `matches` WRITE;
/*!40000 ALTER TABLE `matches` DISABLE KEYS */;
INSERT INTO `matches` VALUES (2,3,2,'2025-01-02 14:50:38',NULL,NULL),(3,3,2,'2025-01-02 15:00:00',NULL,NULL),(4,2,3,'2024-10-10 15:15:00',NULL,NULL),(5,4,3,'2024-09-03 16:00:00',NULL,NULL),(6,3,4,'2024-08-10 16:30:00',NULL,NULL),(7,4,2,'2024-07-23 17:00:00',NULL,NULL),(8,4,2,'2024-06-17 17:30:00',NULL,NULL),(9,3,2,'2024-05-03 18:00:00',NULL,NULL),(10,3,4,'2024-04-12 16:15:00',NULL,NULL),(11,2,4,'2024-03-11 17:15:00',NULL,NULL),(12,4,3,'2024-02-06 18:15:00',NULL,NULL),(13,3,2,'2025-01-02 15:00:00',NULL,NULL),(14,2,3,'2024-10-10 15:15:00',NULL,NULL),(15,4,3,'2024-09-03 16:00:00',NULL,NULL),(16,3,4,'2024-08-10 16:30:00',NULL,NULL),(17,4,2,'2024-07-23 17:00:00',NULL,NULL),(18,4,2,'2024-06-17 17:30:00',NULL,NULL),(19,3,2,'2024-05-03 18:00:00',NULL,NULL),(20,3,4,'2024-04-12 16:15:00',NULL,NULL),(21,2,4,'2024-03-11 17:15:00',NULL,NULL),(22,4,3,'2024-02-06 18:15:00',NULL,NULL);
/*!40000 ALTER TABLE `matches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2024_12_16_153743_create_sports_table',1),(5,'2024_12_16_153744_create_teams_table',1),(6,'2024_12_16_153745_create_players_table',1),(7,'2024_12_16_153746_create_transfers_table',1),(8,'2024_12_16_154432_create_macs_table',1),(9,'2024_12_16_154442_create_match_details_table',1),(10,'2024_12_16_154453_create_events_table',1),(11,'2024_12_16_154505_create_event_participants_table',1),(12,'2024_12_16_154519_create_player_statistics_table',1),(13,'2024_12_16_154528_create_news_table',1),(14,'2024_12_16_154745_create_injuries_table',1),(15,'2024_12_16_154800_create_leagues_table',1),(23,'2024_12_16_154834_create_match_results_table',2),(24,'2024_12_16_154847_create_match_officials_table',2),(25,'2024_12_16_154857_create_training_sessions_table',2),(26,'2024_12_16_154908_create_player_awards_table',2),(27,'2024_12_16_154929_create_fan_engagements_table',2),(28,'2024_12_16_154947_create_sponsors_table',2),(29,'2024_12_16_154957_create_team_financials_table',2),(30,'2024_12_23_180204_rollback',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sports_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `news_sports__fk` (`sports_id`),
  CONSTRAINT `news_sports__fk` FOREIGN KEY (`sports_id`) REFERENCES `sports` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (6,'Mikautadze\'den geleceğiyle ilgili flaş açıklama! Galatasaray...','Son dakika Galatasaray transfer haberi | Ara transfer döneminde çalışmalarını sürdüren Galatasaray, Lyon forması giyen Georges Mikautadze\'yi kadrosuna katmak istiyor. Gürcü futbolcu, geleceğiyle ilgili önemli açıklamalarda bulundu ve Lyon\'dan ayrılma ihtimaline dair net ifadeler kullandı. İşte Mikautadze\'nin o sözleri... (GS spor haberi)Galatasaray\'ın ara transfer döneminde kadrosuna katmak istediği Georges Mikautadze ile ilgili sıcak gelişmeler yaşanıyor.',NULL,NULL,2);
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
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
-- Table structure for table `player_awards`
--

DROP TABLE IF EXISTS `player_awards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_awards` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `player_id` bigint(20) unsigned NOT NULL,
  `award_name` varchar(255) NOT NULL,
  `award_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `player_awards_player_id_foreign` (`player_id`),
  CONSTRAINT `player_awards_player_id_foreign` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_awards`
--

LOCK TABLES `player_awards` WRITE;
/*!40000 ALTER TABLE `player_awards` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_awards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_statistics`
--

DROP TABLE IF EXISTS `player_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_statistics` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `player_id` bigint(20) unsigned NOT NULL,
  `match_id` bigint(20) unsigned NOT NULL,
  `goals` int(11) NOT NULL DEFAULT 0,
  `assists` int(11) NOT NULL DEFAULT 0,
  `yellow_cards` int(11) NOT NULL DEFAULT 0,
  `red_cards` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `player_statistics_player_id_foreign` (`player_id`),
  KEY `player_statistics_match_id_foreign` (`match_id`),
  CONSTRAINT `player_statistics_match_id_foreign` FOREIGN KEY (`match_id`) REFERENCES `matches` (`id`),
  CONSTRAINT `player_statistics_player_id_foreign` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_statistics`
--

LOCK TABLES `player_statistics` WRITE;
/*!40000 ALTER TABLE `player_statistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `players` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `team_id` bigint(20) unsigned NOT NULL,
  `position` varchar(255) NOT NULL,
  `date_of_birth` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=351 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES (1,'Victor Osimhen',2,'Forvet','1998-12-29',NULL,NULL),(2,'Mauro Icardi',2,'Forvet','1993-02-19',NULL,NULL),(3,'Barış Alper Yılmaz',2,'Forvet','2000-05-23',NULL,NULL),(4,'Yunus Akgün',2,'Forvet','2000-07-07',NULL,NULL),(5,'Hakim Ziyech',2,'Orta Saha','1993-03-19',NULL,NULL),(6,'Fernando Muslera',2,'Kaleci','1986-06-16',NULL,NULL),(7,'Gabriel Sara',2,'Orta Saha','1999-06-26',NULL,NULL),(8,'Roland Sallai',2,'Forvet','1997-05-22',NULL,NULL),(9,'Ismail Jakobs',2,'Defans','1999-08-17',NULL,NULL),(10,'Michy Batshuayi',2,'Forvet','1993-10-02',NULL,NULL),(11,'Dries Mertens',2,'Forvet','1987-05-06',NULL,NULL),(12,'Davinson Sanchez',2,'Defans','1996-06-12',NULL,NULL),(13,'Elias Jelert',2,'Defans','2003-06-12',NULL,NULL),(14,'Luca Torreira',2,'Orta Saha','1996-02-11',NULL,NULL),(15,'Berat Luş',2,'Forvet','2007-04-20',NULL,NULL),(16,'Metehan Baltacı',2,'Defans','2002-11-03',NULL,NULL),(17,'Abdülkerim Bardakcı',2,'Defans','1994-09-07',NULL,NULL),(18,'Kaan Ayhan',2,'Defans','1994-11-10',NULL,NULL),(19,'Yusuf Demir',2,'Forvet','2003-06-02',NULL,NULL),(20,'Kerem Demirbay',2,'Orta Saha','1993-07-03',NULL,NULL),(21,'Victor Nelsson',2,'Defans','1998-10-14',NULL,NULL),(22,'Günay Güvenç',2,'Kaleci','1991-06-25',NULL,NULL),(23,'Efe Akman',2,'Orta Saha','2006-03-20',NULL,NULL),(24,'Recep Yalın Dilek',2,'Forvet','2006-07-26',NULL,NULL),(25,'Berkan Kutlu',2,'Orta Saha','1998-01-25',NULL,NULL),(26,'Gökdeniz Gürpüz',2,'Orta Saha','2006-02-05',NULL,NULL),(27,'Eyüp Aydın',2,'Orta Saha','2004-08-02',NULL,NULL),(28,'Ali Yeşilyurt',2,'Defans','2005-07-30',NULL,NULL),(29,'Atakan Nuri Ordu',2,'Kaleci ','2005-03-29',NULL,NULL),(30,'Halim Ayaz Yükseloğlu',2,'Orta Saha','2006-04-04',NULL,NULL),(31,'Kadir Subaşı',2,'Defans','2006-08-27',NULL,NULL),(32,'Batuhan Ahmet Şen',2,'Kaleci','1999-02-03',NULL,NULL),(33,'Ciro Immobile',3,'Forvet','1990-02-20',NULL,NULL),(34,'Rafa Silva',3,'Orta Saha','1993-05-17',NULL,NULL),(35,'Joao Mario',3,'Orta Saha','1993-01-19',NULL,NULL),(36,'Semih Kılıçsoy',3,'Forvet','2005-08-15',NULL,NULL),(37,'Ernest Muçi',3,'Orta Saha','2001-03-19',NULL,NULL),(38,'Gedson Fernandes',3,'Orta Saha','1999-01-09',NULL,NULL),(39,'Mert Günok',3,'Kaleci','1989-03-01',NULL,NULL),(40,'Gabriel Paulista',3,'Defans','1990-11-26',NULL,NULL),(41,'Cher Ndour',3,'Orta Saha','2004-07-27',NULL,NULL),(42,'Mustafa Erhan Hekimoğlu',3,'Forvet','2007-04-22',NULL,NULL),(43,'Milot Rashika',3,'Orta Saha','1996-06-28',NULL,NULL),(44,'Felix Uduokhai',3,'Defans','1997-09-09',NULL,NULL),(45,'Jean Onana',3,'Orta Saha','2000-01-08',NULL,NULL),(46,'Alex Oxlade-Chamberlain',3,'Orta Saha','1993-08-15',NULL,NULL),(47,'Arthur Masuaku',3,'Defans','1993-11-07',NULL,NULL),(48,'Ersin Destanoğlu',3,'Kaleci','2001-01-01',NULL,NULL),(49,'Emirhan Topçu',3,'Defans','2000-10-11',NULL,NULL),(50,'El-Musrati',3,'Orta Saha','1996-04-06',NULL,NULL),(51,'Jonas Svensson',3,'Defans','1993-03-06',NULL,NULL),(52,'Can Keleş',3,'Forvet','2001-09-02',NULL,NULL),(53,'Necip Uysal',3,'Defans','1991-01-24',NULL,NULL),(54,'Bahtiyar Zaynutdinov',3,'Orta Saha','1998-04-02',NULL,NULL),(55,'Göktuğ Baytekin',3,'Kaleci','2004-11-20',NULL,NULL),(56,'Tayyip Talha Sanuç',3,'Defans','1999-12-17',NULL,NULL),(57,'Salih Uçan',3,'Orta Saha','1994-01-06',NULL,NULL),(58,'Onur Bulut',3,'Defans','1994-04-16',NULL,NULL),(59,'Emir Yaşar',3,'Kaleci','2006-01-16',NULL,NULL),(60,'Emrecan Terzi',3,'Defans','2004-01-05',NULL,NULL),(61,'Yakup Arda Kılıç',3,'Forvet','2005-01-04',NULL,NULL),(62,'Fahri Kerem Ay',3,'Orta Saha','2005-01-01',NULL,NULL),(63,'Arda Berk Özüarap',3,'Defans','2005-06-09',NULL,NULL),(64,'Muhammed Demirci',4,'Orta Saha','1995-01-03',NULL,NULL),(65,'Artun Akçakın',4,'Forvet','1993-05-06',NULL,NULL),(66,'Celal Emir Dede',4,'Forvet','2001-05-02',NULL,NULL),(67,'Yiğit Epözdemir',4,'Defans','2005-04-04',NULL,NULL),(68,'Ahmet Gülay',4,'Defans','2003-01-13',NULL,NULL),(69,'Bertuğ Bayar',4,'Forvet','1996-10-31',NULL,NULL),(70,'Doğukan Özçimen',4,'Kaleci ','1999-10-20',NULL,NULL),(71,'Serdar Güncü',4,'Orta Saha','1999-06-27',NULL,NULL),(72,'Özer Özdemir',4,'Defans','1998-02-05',NULL,NULL),(73,'Sedat Yiğit Kurnaz',4,'Orta Saha','1990-08-06',NULL,NULL),(74,'Volkan Altınsoy',4,'Defans','2003-08-13',NULL,NULL),(75,'Muhammet Araz',4,'Defans','2004-04-01',NULL,NULL),(76,'Güvenç Usta',4,'Forvet','1994-09-11',NULL,NULL),(77,'Hüseyin Altıntaş',4,'Kaleci ','1993-09-21',NULL,NULL),(78,'Şhin Şafakoğlu',4,'Defans','2002-01-01',NULL,NULL),(79,'Ali Karakaya',4,'Orta Saha','2002-01-01',NULL,NULL),(80,'Asım Hamzaçebi',4,'Orta Saha','1998-11-23',NULL,NULL),(81,'Samet Seymen Sargın',4,'Orta Saha','2006-04-01',NULL,NULL),(82,'Tayfun Kırca',4,'Defans','1999-03-01',NULL,NULL),(83,'Mert Tekin',4,'Defans','2005-08-27',NULL,NULL),(84,'Kağan Kayalı',4,'Defans','1999-01-30',NULL,NULL),(85,'Muhammed Eren Türkmen',4,'Defans','2005-06-16',NULL,NULL),(86,'Yasin Yiğit Berber',4,'Kaleci ','2002-06-11',NULL,NULL),(87,'Yiğit Dönmez',4,'Forvet','2008-06-02',NULL,NULL),(88,'Talha Doğuş',4,'Orta Saha','2008-03-27',NULL,NULL),(89,'Koray Tunç',4,'Forvet','2006-01-25',NULL,NULL),(90,'Mustafa Burak Gündoğan',4,'Orta Saha','2005-06-28',NULL,NULL),(91,'Ramazan Karakuzu',4,'Defans','2007-06-12',NULL,NULL),(92,'Ahmet Eren Ersoy',4,'Orta Saha','2007-02-07',NULL,NULL),(93,'Otis Livingston',5,'Oyun Kurucu','1996-10-12',NULL,NULL),(94,'David Efianayi',5,'Şutör Gard','1995-12-19',NULL,NULL),(95,'Sadık Emir Kabaca',5,'Uzun Forvet','2000-12-13',NULL,NULL),(96,'Will Cummings',5,'Oyun Kurucu','1992-10-07',NULL,NULL),(97,'Roberts Blumbergs',5,'Uzun Forvet','1998-04-29',NULL,NULL),(98,'Samet Geyik',5,'Uzun Forvet','1993-01-12',NULL,NULL),(99,'Can Korkmaz',5,'Oyun Kurucu','1992-10-21',NULL,NULL),(100,'Sam Yaman',5,'Pivot','2006-10-26',NULL,NULL),(101,'James Palmer Jr.',5,'Forvet','1996-07-31',NULL,NULL),(102,'Efe Vatan',5,'Uzun Forvet','2004-09-14',NULL,NULL),(103,'Ebuka Izundu',5,'Pivot','1996-06-28',NULL,NULL),(104,'Kerem Erdem',5,'Oyun Kurucu','2006-03-24',NULL,NULL),(105,'Buğrahan Tuncer',5,'Oyun Kurucu','1993-03-23',NULL,NULL),(106,'Altan Çamoğlu',5,'Forvet','2005-01-21',NULL,NULL),(107,'Berke İsmailçebi',5,'Forvet','2004-06-07',NULL,NULL),(108,'Angel Delgado',5,'Pivot','1994-11-20',NULL,NULL),(109,'Göksenin Köksal',5,'Forvet','1991-01-08',NULL,NULL),(110,'Michael Young',5,'Uzun Forvet','1994-09-05',NULL,NULL),(111,'Dustin Sleva',6,'Pivot','1995-09-23',NULL,NULL),(112,'Emanuel Terry',6,'Forvet','1996-08-21',NULL,NULL),(113,'Kelan Martin',6,'Forvet','1995-08-03',NULL,NULL),(114,'Conor Morgan',6,'Forvet','1994-08-03',NULL,NULL),(115,'Derek Needham',6,'Gard','1990-10-20',NULL,NULL),(116,'Kerem Konan',6,'Forvet','2004-10-09',NULL,NULL),(117,'Jonah Mathews',6,'Gard','1998-02-10',NULL,NULL),(118,'Berk Uğurlu',6,'Gard','1996-04-27',NULL,NULL),(119,'Emir Adıgüzel',6,'Gard','2003-01-01',NULL,NULL),(120,'Yiğit Arslan',6,'Gard','1996-05-12',NULL,NULL),(121,'Yağız Aksu',6,'Gard','2006-01-31',NULL,NULL),(122,'Kyle Allman Jr.',6,'Gard','1997-09-02',NULL,NULL),(123,'Eren Karakaya',6,'Forvet','2006-01-16',NULL,NULL),(124,'Yiğit Çoban',6,'Forvet','2002-11-26',NULL,NULL),(287,'Shane Larkin',8,'Gard','1992-10-02','2024-12-25 05:37:40','2024-12-25 05:37:40'),(288,'Rodrigue Beaubois',8,'Skorer Gard','1988-02-24','2024-12-25 05:37:41','2024-12-25 05:37:41'),(289,'Elijah Bryant',8,'Kısa Forvet','1995-04-19','2024-12-25 05:37:41','2024-12-25 05:37:41'),(290,'Jordan Nwora',8,'Kısa Forvet','1998-09-09','2024-12-25 05:37:41','2024-12-25 05:37:41'),(291,'Rolands Smits',8,'Uzun Forvet','1995-06-25','2024-12-25 05:37:41','2024-12-25 05:37:41'),(292,'Vincent Poirier',8,'Pivot','1993-10-17','2024-12-25 05:37:41','2024-12-25 05:37:41'),(293,'Darius Thompson',8,'Gard','1995-05-04','2024-12-25 05:37:41','2024-12-25 05:37:41'),(294,'Derek Willis',8,'Uzun Forvet','1995-06-21','2024-12-25 05:37:41','2024-12-25 05:37:41'),(295,'Doğuş Özdemiroğlu',8,'Gard','1996-07-17','2024-12-25 05:37:41','2024-12-25 05:37:41'),(296,'Ercan Osmani',8,'Pivot','1998-01-01','2024-12-25 05:37:41','2024-12-25 05:37:41'),(297,'Erkan Yılmaz',8,'Kısa Forvet','1997-03-20','2024-12-25 05:37:41','2024-12-25 05:37:41'),(298,'Justus Hollatz',8,'Gard','2001-04-21','2024-12-25 05:37:41','2024-12-25 05:37:41'),(299,'Rıdvan Öncel',8,'Gard','1997-01-01','2024-12-25 05:37:41','2024-12-25 05:37:41'),(300,'Salih Altuntaş',8,'Pivot','2000-08-15','2024-12-25 05:37:41','2024-12-25 05:37:41'),(301,'Stanley Herbert Johnson Jr.',8,'Kısa Forvet','1996-05-29','2024-12-25 05:37:41','2024-12-25 05:37:41'),(302,'Can Yıldızlı',8,'Uzun Forvet','1994-04-22','2024-12-25 05:37:41','2024-12-25 05:37:41'),(303,'Daniel Oturu',8,'Pivot','1999-09-20','2024-12-25 05:37:41','2024-12-25 05:37:41'),(304,'İlkin Aydın',8,'Smaçör','2000-01-05','2024-12-25 05:37:41','2024-12-25 05:37:41'),(305,'Britt Bongaerts',8,'Pasör','1996-11-03','2024-12-25 05:37:41','2024-12-25 05:37:41'),(306,'Eylül Akarçeşme',8,'Libero','1999-10-01','2024-12-25 05:37:41','2024-12-25 05:37:41'),(307,'Sude Hacımustafaoğlu',8,'Smaçör','2002-03-25','2024-12-25 05:37:41','2024-12-25 05:37:41'),(308,'Ceylan Arısan',8,'Orta Oyuncu','1994-01-01','2024-12-25 05:37:41','2024-12-25 05:37:41'),(309,'Yasemin Güveli',8,'Orta Oyuncu','1999-01-05','2024-12-25 05:37:41','2024-12-25 05:37:41'),(310,'Eline Timmerman',8,'Orta Oyuncu','1998-12-30','2024-12-25 05:37:41','2024-12-25 05:37:41'),(311,'Ayçin Akyol',8,'Orta Oyuncu','1999-06-15','2024-12-25 05:37:41','2024-12-25 05:37:41'),(312,'Aslıhan Kılıç',8,'Pasör','1998-04-21','2024-12-25 05:37:41','2024-12-25 05:37:41'),(313,'Bihter Dumanoğlu',8,'Libero','1995-02-03','2024-12-25 05:37:41','2024-12-25 05:37:41'),(314,'Alexia Căruțașu',8,'Pasör Çaprazı','2003-04-10','2024-12-25 05:37:41','2024-12-25 05:37:41'),(315,'Yasemin Özel',8,'Pasör Çaprazı','1998-05-13','2024-12-25 05:37:41','2024-12-25 05:37:41'),(316,'Katarina Lazović',8,'Smaçör','1999-09-12','2024-12-25 05:37:41','2024-12-25 05:37:41'),(317,'Ana Kalandadze',8,'Smaçör','1998-12-10','2024-12-25 05:37:41','2024-12-25 05:37:41'),(318,'Martin Atanasov',10,'Smaçör','1996-09-17','2024-12-25 05:37:41','2024-12-25 05:37:41'),(319,'Jiri Kovar',10,'Smaçör','1989-04-10','2024-12-25 05:37:41','2024-12-25 05:37:41'),(320,'Hasan Yeşilbudak',10,'Libero','1984-01-14','2024-12-25 05:37:41','2024-12-25 05:37:41'),(321,'Ahmet Tümer',10,'Orta Oyuncu','1993-05-05','2024-12-25 05:37:41','2024-12-25 05:37:41'),(322,'Aykut Acar',10,'Orta Oyuncu','1992-02-12','2024-12-25 05:37:41','2024-12-25 05:37:41'),(323,'Jean Patry',10,'Pasör Çaprazı','1996-12-25','2024-12-25 05:37:41','2024-12-25 05:37:41'),(324,'Arslan Ekşi',10,'Pasör','1985-07-17','2024-12-25 05:37:41','2024-12-25 05:37:41'),(325,'Muzaffer Yönet',10,'Pasör','1997-08-20','2024-12-25 05:37:41','2024-12-25 05:37:41'),(326,'Victor Cardoso',10,'Smaçör','1995-03-15','2024-12-25 05:37:41','2024-12-25 05:37:41'),(327,'Oğuzhan Karasu',10,'Orta Oyuncu','1994-01-01','2024-12-25 05:37:41','2024-12-25 05:37:41'),(328,'Zehra Güneş',11,'Orta Oyuncu','1999-07-07','2024-12-25 05:37:41','2024-12-25 05:37:41'),(329,'Ali Frantti',11,'Smaçör','1996-03-03','2024-12-25 05:37:41','2024-12-25 05:37:41'),(330,'Cansu Özbay',11,'Pasör','1996-10-17','2024-12-25 05:37:41','2024-12-25 05:37:41'),(331,'İlayda Naz Gergef',11,'Libero','2002-05-15','2024-12-25 05:37:41','2024-12-25 05:37:41'),(332,'Ayça Aykaç Altıntaş',11,'Libero','1996-02-27','2024-12-25 05:37:41','2024-12-25 05:37:41'),(333,'Kiera Van Ryk',11,'Pasör Çaprazı','1999-01-30','2024-12-25 05:37:41','2024-12-25 05:37:41'),(334,'Caterina Bosetti',11,'Smaçör','1994-02-02','2024-12-25 05:37:41','2024-12-25 05:37:41'),(335,'Kendall Kipp',11,'Pasör Çaprazı','2000-11-30','2024-12-25 05:37:41','2024-12-25 05:37:41'),(336,'Sıla Çalışkan',11,'Pasör','1998-08-08','2024-12-25 05:37:41','2024-12-25 05:37:41'),(337,'Yuan Xinyue',11,'Orta Oyuncu','1996-12-21','2024-12-25 05:37:41','2024-12-25 05:37:41'),(338,'Deniz Uyanık',11,'Orta Oyuncu','2001-06-25','2024-12-25 05:37:41','2024-12-25 05:37:41'),(339,'Aylin Sarıoğlu Acar',11,'Libero','1995-07-21','2024-12-25 05:37:41','2024-12-25 05:37:41'),(340,'Derya Cebecioğlu',11,'Smaçör','2000-10-24','2024-12-25 05:37:41','2024-12-25 05:37:41'),(341,'Bahar Akbay',11,'Orta Oyuncu','1998-01-21','2024-12-25 05:37:41','2024-12-25 05:37:41'),(342,'Selin Yener',11,'Pasör','2003-04-04','2024-12-25 05:37:41','2024-12-25 05:37:41'),(343,'Marina Markova',11,'Smaçör','2001-01-27','2024-12-25 05:37:41','2024-12-25 05:37:41'),(344,'Tuna Aybüke Özel',12,'Libero','2002-04-24','2024-12-25 05:37:41','2024-12-25 05:37:41'),(345,'Simge Aköz',12,'Libero','1991-04-23','2024-12-25 05:37:41','2024-12-25 05:37:41'),(346,'Tijana Bošković',12,'Pasör Çaprazı','1997-03-08','2024-12-25 05:37:41','2024-12-25 05:37:41'),(347,'Beyza Arıcı',12,'Orta Oyuncu','1995-07-27','2024-12-25 05:37:41','2024-12-25 05:37:41'),(348,'Hande Baladın',12,'Smaçör','1997-09-01','2024-12-25 05:37:41','2024-12-25 05:37:41'),(349,'Sinead Jack-Kısal',12,'Orta Oyuncu','1993-11-08','2024-12-25 05:37:41','2024-12-25 05:37:41'),(350,'Alexa Gray',12,'Smaçör','1994-08-07','2024-12-25 05:37:41','2024-12-25 05:37:41');
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
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
INSERT INTO `sessions` VALUES ('oEgCfpWU1OzyhLuNWGk0isM6wM5XVtAssPRACzzS',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoidjEzUzA0WWVVRzVZelBDZzhFSFBCandZVks0ZmJERzdETGVZeEhVSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1735613753),('Wi905LD4X8SmkPVjgTF5kYS4O7BHN95qIEPtqCXS',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiblpZdk9HU2lEUDZ1aWxCbGV2aTNVOFE2TWl1UTkwc2F2TG1yY0l2WiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9uZXdzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1735614562);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sponsors`
--

DROP TABLE IF EXISTS `sponsors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sponsors` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `team_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sponsors_team_id_foreign` (`team_id`),
  CONSTRAINT `sponsors_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sponsors`
--

LOCK TABLES `sponsors` WRITE;
/*!40000 ALTER TABLE `sponsors` DISABLE KEYS */;
INSERT INTO `sponsors` VALUES (2,2,'Pasifik Holding',NULL,NULL,NULL),(3,3,'Arçelik',NULL,NULL,NULL),(4,2,'Medicana',NULL,NULL,NULL),(5,2,'RAMS Global',NULL,NULL,NULL),(6,2,'Başkent İnşaat',NULL,NULL,NULL),(7,2,'SOCAR',NULL,NULL,NULL),(8,2,'SIXT',NULL,NULL,NULL),(9,2,'Puma',NULL,NULL,NULL),(10,3,'Beko',NULL,NULL,NULL),(11,3,'Pasha',NULL,NULL,NULL),(12,3,'Adidas',NULL,NULL,NULL),(13,3,'Safi Çimento',NULL,NULL,NULL),(14,3,'Nesine.com',NULL,NULL,NULL),(15,3,'Papara',NULL,NULL,NULL),(16,4,'Uluova İnşaat ve Makina Sanayi',NULL,NULL,NULL),(17,5,'Zeren Metal',NULL,NULL,NULL),(18,6,'BOA Yatçılık',NULL,NULL,NULL),(19,6,'Fibabank',NULL,NULL,NULL),(21,8,'İGA Pass',NULL,NULL,NULL),(22,8,'Bilcee',NULL,NULL,NULL),(23,10,'Tacirler Yatırım',NULL,NULL,NULL),(24,11,'Vakıfbank',NULL,NULL,NULL),(25,12,'Decathlon',NULL,NULL,NULL);
/*!40000 ALTER TABLE `sponsors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sports`
--

DROP TABLE IF EXISTS `sports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sports` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sports`
--

LOCK TABLES `sports` WRITE;
/*!40000 ALTER TABLE `sports` DISABLE KEYS */;
INSERT INTO `sports` VALUES (1,'Basketbol',NULL,NULL,NULL),(2,'Futbol',NULL,NULL,NULL),(3,'Voleybol',NULL,NULL,NULL);
/*!40000 ALTER TABLE `sports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_financials`
--

DROP TABLE IF EXISTS `team_financials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team_financials` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `team_id` bigint(20) unsigned NOT NULL,
  `revenue` decimal(15,2) NOT NULL,
  `expenses` decimal(15,2) NOT NULL,
  `profit` decimal(15,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `team_financials_team_id_foreign` (`team_id`),
  CONSTRAINT `team_financials_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_financials`
--

LOCK TABLES `team_financials` WRITE;
/*!40000 ALTER TABLE `team_financials` DISABLE KEYS */;
/*!40000 ALTER TABLE `team_financials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sport_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `column_name` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `teams_sport_id_foreign` (`sport_id`),
  CONSTRAINT `teams_sport_id_foreign` FOREIGN KEY (`sport_id`) REFERENCES `sports` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (2,'Galatasaray',2,NULL,NULL,NULL),(3,'Beşiktaş',2,NULL,NULL,NULL),(4,'Balıkesirspor',2,NULL,NULL,NULL),(5,'Galatasaray',1,NULL,NULL,NULL),(6,'Beşiktaş',1,NULL,NULL,NULL),(8,'Anadolu Efes',1,NULL,NULL,NULL),(10,'Galatasaray',3,NULL,NULL,NULL),(11,'Vakıfbank',3,NULL,NULL,NULL),(12,'Eczacıbaşı',3,NULL,NULL,NULL);
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `training_sessions`
--

DROP TABLE IF EXISTS `training_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `training_sessions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `team_id` bigint(20) unsigned NOT NULL,
  `session_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `agenda` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `training_sessions_team_id_foreign` (`team_id`),
  CONSTRAINT `training_sessions_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training_sessions`
--

LOCK TABLES `training_sessions` WRITE;
/*!40000 ALTER TABLE `training_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `training_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transfers`
--

DROP TABLE IF EXISTS `transfers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transfers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `player_id` bigint(20) unsigned NOT NULL,
  `from_team_id` bigint(20) unsigned NOT NULL,
  `to_team_id` bigint(20) unsigned NOT NULL,
  `transfer_fee` decimal(10,2) NOT NULL,
  `transfer_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transfers_player_id_foreign` (`player_id`),
  KEY `transfers_from_team_id_foreign` (`from_team_id`),
  KEY `transfers_to_team_id_foreign` (`to_team_id`),
  CONSTRAINT `transfers_from_team_id_foreign` FOREIGN KEY (`from_team_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `transfers_player_id_foreign` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`),
  CONSTRAINT `transfers_to_team_id_foreign` FOREIGN KEY (`to_team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transfers`
--

LOCK TABLES `transfers` WRITE;
/*!40000 ALTER TABLE `transfers` DISABLE KEYS */;
INSERT INTO `transfers` VALUES (1,1,2,4,17.00,'2024-10-18 21:00:00',NULL,NULL),(2,2,2,3,23.00,'2024-12-08 21:00:00',NULL,NULL),(3,3,2,3,12.00,'2024-11-05 21:00:00',NULL,NULL),(4,45,3,4,19.50,'2024-08-31 21:00:00',NULL,NULL),(5,46,3,2,6.70,'2024-08-09 21:00:00',NULL,NULL),(6,47,3,4,2.00,'2024-07-08 21:00:00',NULL,NULL),(7,71,4,3,13.90,'2024-06-20 21:00:00',NULL,NULL),(8,72,4,2,10.00,'2024-05-07 21:00:00',NULL,NULL),(9,73,4,3,11.20,'2024-04-14 21:00:00',NULL,NULL),(10,102,5,6,8.00,'2024-03-26 21:00:00',NULL,NULL),(11,101,5,6,14.50,'2024-02-11 21:00:00',NULL,NULL),(12,100,5,6,19.00,'2024-01-01 21:00:00',NULL,NULL);
/*!40000 ALTER TABLE `transfers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Test User','test@example.com','2024-12-25 04:48:23','$2y$12$.J2KyP1QDjMltjyZ.WObJeYG9dr5Pl4Ubxvs1cCb19Bm8ktTlY3dm','UtkErhaW6P','2024-12-25 04:48:24','2024-12-25 04:48:24');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-03 16:56:32
