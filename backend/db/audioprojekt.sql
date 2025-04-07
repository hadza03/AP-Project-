-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: audioprojekt
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `price` decimal(10,2) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='								';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,1,1,59.99,'2025-04-07 01:20:47'),(2,1,1,1,59.99,'2025-04-07 01:20:48'),(3,1,1,1,59.99,'2025-04-07 01:22:14'),(4,1,1,1,59.99,'2025-04-07 01:22:14'),(5,1,1,1,59.99,'2025-04-07 01:23:07'),(6,1,1,1,59.99,'2025-04-07 01:23:09'),(7,1,1,1,59.99,'2025-04-07 01:26:33'),(8,1,1,1,59.99,'2025-04-07 01:26:34'),(9,9,57,1,59.99,'2025-04-07 01:34:17'),(10,10,62,1,149.99,'2025-04-07 02:03:14'),(11,11,63,1,59.99,'2025-04-07 02:04:45'),(12,12,64,1,59.99,'2025-04-07 02:04:47');
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(45) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `status` enum('pending','paid','shipped','cancelled') NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `orderscol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='				';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'1',59.99,'pending','2025-04-07 01:20:47',NULL),(2,'1',59.99,'pending','2025-04-07 01:20:48',NULL),(3,'1',59.99,'pending','2025-04-07 01:22:13',NULL),(4,'1',59.99,'pending','2025-04-07 01:22:14',NULL),(5,'1',59.99,'pending','2025-04-07 01:23:07',NULL),(6,'1',59.99,'pending','2025-04-07 01:23:08',NULL),(7,'1',59.99,'pending','2025-04-07 01:26:33',NULL),(8,'1',59.99,'pending','2025-04-07 01:26:34',NULL),(9,'72',59.99,'pending','2025-04-07 01:34:17','Order 001'),(10,'77',149.99,'pending','2025-04-07 02:03:14',NULL),(11,'78',59.99,'pending','2025-04-07 02:04:45',NULL),(12,'79',59.99,'pending','2025-04-07 02:04:47',NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` text,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(45) DEFAULT NULL,
  `category` varchar(45) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Bluetooth Speaker','High-quality wireless speaker',79.99,NULL,'Audio',NULL),(2,'Bluetooth Speaker','High-quality wireless speaker',79.99,NULL,'Audio',NULL),(3,'Bluetooth Speaker','Compact and powerful speaker',59.99,NULL,'speaker',NULL),(4,'Bluetooth Speaker','Compact and powerful speaker',59.99,NULL,'speaker',NULL),(5,'Bluetooth Speaker','Compact and powerful speaker',59.99,NULL,'speaker',NULL),(6,'Bluetooth Speaker','Compact and powerful speaker',59.99,NULL,'speaker',NULL),(7,'Bluetooth Speaker','Compact and powerful speaker',59.99,NULL,'speaker',NULL),(8,'Bluetooth Speaker','Compact and powerful speaker',59.99,NULL,'speaker',NULL),(9,'Bluetooth Speaker','Compact and powerful speaker',59.99,NULL,'speaker',NULL),(10,'Bluetooth Speaker','Compact and powerful speaker',59.99,NULL,'speaker',NULL),(11,'Bluetooth Speaker','Compact and powerful speaker',59.99,NULL,'speaker',NULL),(12,'Bluetooth Speaker','Compact and powerful speaker',59.99,NULL,'speaker',NULL),(13,'Bluetooth Speaker','Compact and powerful speaker',59.99,NULL,'speaker',NULL),(14,'Bluetooth Speaker','Compact and powerful speaker',59.99,NULL,'speaker',NULL),(15,'Bluetooth Speaker','Compact and powerful speaker',59.99,NULL,'speaker',NULL),(16,'Bluetooth Speaker','Compact and powerful speaker',59.99,NULL,'speaker',NULL),(17,'Bluetooth Speaker','Compact and powerful speaker',59.99,NULL,'speaker',NULL),(18,'Bluetooth Speaker','Compact and powerful speaker',59.99,NULL,'speaker',NULL),(19,'Bluetooth Speaker','Compact and powerful speaker',59.99,NULL,'speaker',NULL),(20,'Bluetooth Speaker','Compact and powerful speaker',59.99,NULL,'speaker',NULL),(21,'Bluetooth Speaker','Compact and powerful speaker',59.99,NULL,'speaker',NULL),(22,'Bluetooth Speaker','Compact and powerful speaker',59.99,NULL,'speaker',NULL),(23,'Bluetooth Speaker','Compact and powerful speaker',59.99,NULL,'speaker',NULL),(24,'Bluetooth Speaker','Compact and powerful speaker',59.99,NULL,'speaker',NULL),(25,'Bluetooth Speaker','Compact and powerful speaker',59.99,NULL,'speaker',NULL),(26,'Bluetooth Speaker','Compact and powerful speaker',59.99,NULL,'speaker',NULL),(27,'Bluetooth Speaker','Compact and powerful speaker',59.99,NULL,'speaker',NULL),(28,'Bluetooth Speaker','Compact and powerful speaker',59.99,NULL,'speaker',NULL),(29,'Bluetooth Speaker','Compact and powerful speaker',59.99,NULL,'speaker',NULL),(30,'Bluetooth Speaker','Compact and powerful speaker',59.99,NULL,'speaker',NULL),(31,'Bluetooth Speaker','Compact and powerful speaker',59.99,NULL,'speaker',NULL),(32,'Bluetooth Speaker','Compact and powerful speaker',59.99,NULL,'speaker',NULL),(33,'Bluetooth Speaker','Compact and powerful speaker',59.99,NULL,'speaker',NULL),(34,'Bluetooth Speaker','Compact and powerful speaker',59.99,NULL,'speaker',NULL),(35,'Bluetooth Speaker','Compact and powerful speaker',59.99,NULL,'speaker',NULL),(36,'Bluetooth Speaker','Compact and powerful speaker',59.99,NULL,'speaker',NULL),(37,'Bluetooth Speaker','Compact and powerful speaker',59.99,NULL,'speaker',NULL),(38,'Bluetooth Speaker','Compact and powerful speaker',59.99,NULL,'speaker',NULL),(39,'Bluetooth Speaker','Compact and powerful speaker',59.99,NULL,'speaker',NULL),(40,'Bluetooth Speaker','Compact and powerful speaker',59.99,NULL,'speaker',NULL),(41,'Bluetooth Speaker','Compact and powerful speaker',59.99,NULL,'speaker',NULL),(42,'Bluetooth Speaker','Compact and powerful speaker',59.99,NULL,'speaker',NULL),(43,'Bluetooth Speaker','Compact and powerful speaker',59.99,NULL,'speaker',NULL),(44,'Bluetooth Speaker','Compact and powerful speaker',59.99,NULL,'speaker',NULL),(45,'Bluetooth Speaker','Compact and powerful speaker',59.99,NULL,'speaker','2025-04-07 01:20:15'),(46,'Bluetooth Speaker','Compact and powerful speaker',59.99,NULL,'speaker','2025-04-07 01:20:16'),(47,'Bluetooth Speaker','Compact and powerful speaker',59.99,NULL,'speaker','2025-04-07 01:20:47'),(48,'Bluetooth Speaker','Compact and powerful speaker',59.99,NULL,'speaker','2025-04-07 01:20:48'),(49,'Bluetooth Speaker','Compact and powerful speaker',59.99,NULL,'speaker','2025-04-07 01:22:13'),(50,'Bluetooth Speaker','Compact and powerful speaker',59.99,NULL,'speaker','2025-04-07 01:22:14'),(51,'Bluetooth Speaker','Compact and powerful speaker',59.99,NULL,'speaker','2025-04-07 01:23:07'),(52,'Bluetooth Speaker','Compact and powerful speaker',59.99,NULL,'speaker','2025-04-07 01:23:08'),(53,'Bluetooth Speaker','Compact and powerful speaker',59.99,NULL,'speaker','2025-04-07 01:25:01'),(54,'Bluetooth Speaker','Compact and powerful speaker',59.99,NULL,'speaker','2025-04-07 01:25:04'),(55,'Bluetooth Speaker','Compact and powerful speaker',59.99,NULL,'speaker','2025-04-07 01:26:33'),(56,'Bluetooth Speaker','Compact and powerful speaker',59.99,NULL,'speaker','2025-04-07 01:26:34'),(57,'Bluetooth Speaker','Compact and powerful speaker',59.99,'speaker.jpg','speaker','2025-04-07 01:34:17'),(58,'Test Speaker','This is a test product',149.99,NULL,'Speakers','2025-04-07 01:59:43'),(59,'Test Speaker','This is a test product',149.99,NULL,'Speakers','2025-04-07 02:01:05'),(60,'Test Speaker','This is a test product',149.99,NULL,'Speakers','2025-04-07 02:01:09'),(61,'Test Speaker','This is a test product',149.99,NULL,'Speakers','2025-04-07 02:01:37'),(62,'Test Speaker','This is a test product',149.99,NULL,'Speakers','2025-04-07 02:03:14'),(63,'Bluetooth Speaker','Compact and powerful speaker',59.99,NULL,'speaker','2025-04-07 02:04:45'),(64,'Bluetooth Speaker','Compact and powerful speaker',59.99,NULL,'speaker','2025-04-07 02:04:47');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `rating` int NOT NULL,
  `comment` text,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='		';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,72,57,5,'Great sound quality!','2025-04-07 01:34:17'),(2,77,62,5,'This test product is amazing!','2025-04-07 02:03:14'),(3,78,63,5,'Great sound!','2025-04-07 02:04:45'),(4,79,64,5,'Great sound!','2025-04-07 02:04:47');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('user','admin') NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `password_UNIQUE` (`password`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'john','john@example.com','$2y$10$GXM9OJ7.LA9iGjKphLaRRezdTyCil0iUhu/veH5.vjPSjmA.KfqRC','user','2025-04-07 00:26:35'),(2,'john','john@example.com','$2y$10$RDkvLsuFD8l7m5eNr2NCbuRSRCCgbze4GoZJ5.rgEQqjQtS/GvTWK','user','2025-04-07 00:34:11'),(3,'john','john@example.com','$2y$10$quaDr1EnLUbAoeaFV.8jtu72o.6uuzBfDFV34iuTgOwi1AjS5TK3K','user','2025-04-07 00:34:13'),(4,'john','john@example.com','$2y$10$8X9djcckCEY8DW/L5i6wTOvqfkUQrEp1x6kt5Ko0pK8lFXn/.eNW6','user','2025-04-07 00:38:13'),(5,'john','john@example.com','$2y$10$g/JH/ZwM87MvmUalmLn1jeFGH6qlKUJ.zLpNdX74Cw6Csy/61S5X6','user','2025-04-07 00:38:14'),(6,'john','john@example.com','$2y$10$5lRrnoIPXHHy1rMUt8XRxuq.W6lexRh1e1xLiI.6c4yKovJFdvqwu','user','2025-04-07 00:38:14'),(7,'john','john@example.com','$2y$10$Sh6o1f8qRnREL5zTH6GS2etASCrUHQV.ZgeE5TT8lfZtjxue1UZni','user','2025-04-07 00:38:15'),(8,'john','john@example.com','$2y$10$nRRfWHCr0.N/7bvDBzvFYu4KyoBDcTEqIxbsJdmPCfTh4CGfxAagy','user','2025-04-07 00:38:15'),(9,'john','john@example.com','$2y$10$zt52ZxsHX5UCC8ZQRM0L4OKMfMckrbUdee.WGjANIQ1celssryldu','user','2025-04-07 00:46:52'),(10,'john','john@example.com','$2y$10$PS/m9yk2sSPtClwrR8NYSuEalQvt1u/UQa.Npj.s9kOJmMZyBnGOK','user','2025-04-07 00:46:53'),(11,'john','john@example.com','$2y$10$sfkZ2/nDv.XW8KXitXMLVOLg/wjxHQPCSIeyrsX8y9g/z5Gj4cMHO','user','2025-04-07 00:46:53'),(12,'john','john@example.com','$2y$10$vJuoagzmCfFfCLGvxHGgd.SoVK/68JjshSHyWppFtCVVLpm92qW7.','user','2025-04-07 00:46:53'),(13,'john','john@example.com','$2y$10$.ZOkzndM9vfEfkL.ucoJleNZ1GnT6EN69NYo3ZdcwWjES5gdTjdwm','user','2025-04-07 00:46:54'),(14,'john','john@example.com','$2y$10$Te/4hEPjrrZrzWvdwio8zeIcJe4QBQqUs7Fu4W7ZPUolHz8j3IZcO','user','2025-04-07 00:46:54'),(15,'john','john@example.com','$2y$10$vU6IhAxZexNoiwdKkQYSfOdkUg7g82rdxLZbFqLGKy6ipNbVFjt3S','user','2025-04-07 00:46:54'),(16,'john','john@example.com','$2y$10$ldyr6whK7..9EtRnaHqGZe8xYIkGxCUb3YS0L9Ece8y6XwUFRMkMS','user','2025-04-07 00:57:48'),(17,'john','john@example.com','$2y$10$ajzoq34ACH7XJuNJ4RQ9teBqEYaEwDkuAIB22AnNK3PKD5aWRXazO','user','2025-04-07 00:57:50'),(18,'john','john@example.com','$2y$10$JpcqIrqRlX5yUvpTaRGTVe2Df4Mezd27.wcTp87KinQjw6tGwThme','user','2025-04-07 00:59:10'),(19,'john','john@example.com','$2y$10$buNGcsKvysGPxI4o/OFfU.V9ZhUecJ7l4UA2f/NiwV5J3FP4FUDEW','user','2025-04-07 01:03:48'),(20,'john','john@example.com','$2y$10$.ddqjQaxJoVXl8FhzijpUeVPi4YL1iO.pfCnduTgXlKKAyOZH/wcC','user','2025-04-07 01:03:50'),(21,'john','john@example.com','$2y$10$PwxU5jaRvDsfFMCnbZep0..NK46GOhm0h4.oPCKOfKYiR12zQO4Pe','user','2025-04-07 01:06:02'),(22,'john','john@example.com','$2y$10$krRrO8GB7ZEVJf6ZLFUM/uu0Bk89yceXVNHRf27MjrIsXTWlCrMbi','user','2025-04-07 01:06:04'),(23,'john','john@example.com','$2y$10$wNiCofPLeBa87n2xlquEo.kcPM7kObtHbXxaFNx2cOdID8RNc876u','user','2025-04-07 01:06:04'),(24,'john','john@example.com','$2y$10$IERxB/vguruhejkuBm9qDeSt7ul8XU4rDxQ9lI3hUpxqIL85REztG','user','2025-04-07 01:09:43'),(25,'john','john@example.com','$2y$10$A4AB046P/U16BfUJ2kQ3cO3GBdpTAcBAO/FqHOZwjG2Hlb3w8KwI6','user','2025-04-07 01:09:44'),(26,'john','john@example.com','$2y$10$rba9.cVHWaopScXCYU2w.OuVTSW.1vbfH8Fy1zfNhefa/Hw0f5ZoO','user','2025-04-07 01:09:44'),(27,'john','john@example.com','$2y$10$DIV7LIr5MjMLtcl9V4nA7uWeCeRxLa8pp0eAeE47X294X0RuOLczC','user','2025-04-07 01:09:45'),(28,'john','john@example.com','$2y$10$OHCn4AuOPd.dhv5QUSv64Oqnr6gJsWGsyqHT4zZ8Sgn7VFlX3qI0G','user','2025-04-07 01:09:45'),(29,'john','john@example.com','$2y$10$ugrgmVCy8VwAEWbv5K498O3LynshIk.MfBJ7v6yAlgmeha4wcUK.u','user','2025-04-07 01:09:45'),(30,'john','john@example.com','$2y$10$W3.C.sDXChU9hA2PyV..BuLrtlMG1Pk2svI5KisnwbkwND67Bh9OK','user','2025-04-07 01:09:45'),(31,'john','john@example.com','$2y$10$r4UXwcN4pY0bNwLq8DvV0OXefikc2om5lnHV8dQdlyiqc7istsCrW','user','2025-04-07 01:09:46'),(32,'john','john@example.com','$2y$10$74QvlVLc5NxRntbOKoJGMux881bWh38Wk6.wdVmevDxLXrJQ9Lve2','user','2025-04-07 01:09:46'),(33,'john','john@example.com','$2y$10$1lUVQidwd63cluyTXdBLp.WUJFPXpuLlyKwQXC3eyZlsokERXt.yq','user','2025-04-07 01:09:46'),(34,'john','john@example.com','$2y$10$PrN5jE7.wzdgoLmt6BGKhe/BIwXoV4KgF7TYP/CoIlamYxk3U0FS2','user','2025-04-07 01:09:46'),(35,'john','john@example.com','$2y$10$uvZ33QwbCDokJJYg3nl6.u96zNXM96Wdd5DkXrCifbOtTjrrxD9ta','user','2025-04-07 01:09:47'),(36,'john','john@example.com','$2y$10$vRfj.XV0.uortVIBkb8x8Oh6o4yiWCoRMVXgIm9dsEAbcao5wv/tm','user','2025-04-07 01:11:00'),(37,'john','john@example.com','$2y$10$Y3Wzi3GoIYJIEuAF8x16FeqI8d5LNQOKoN/8heL5lMADd73X0d7aO','user','2025-04-07 01:11:00'),(38,'john','john@example.com','$2y$10$TyOoGmq5mJ/GQGGM2bwbVupwZS74WJaoMuhyH4Pn.udfxk5BXyQ2.','user','2025-04-07 01:11:07'),(39,'john','john@example.com','$2y$10$7kK92h8hECpsl3YABTV.SObfkRP52Su5Eidwo4JMO5lRHINK1REde','user','2025-04-07 01:11:07'),(40,'john','john@example.com','$2y$10$/JT1So72fvnZ7SMVE/O/neKyo/PekMjj14g0I.t.FNidll2RiVFd2','user','2025-04-07 01:11:07'),(41,'john','john@example.com','$2y$10$hMFgkMd87m1W2TCl4Y90t.qpVevijkUqZO8J9jMb1PiZV/SPJCZu.','user','2025-04-07 01:11:08'),(42,'john','john@example.com','$2y$10$NQfKIZRSMR3JjlJiyaQXdeD4NJxb4H6iHUXP1aJNvpuCRBXnhSi.G','user','2025-04-07 01:11:08'),(43,'john','john@example.com','$2y$10$WR.Q9sef270os65CpX9lNe5FAj0VkiYaMiL2eibH2F/bVqIqhoAyO','user','2025-04-07 01:11:08'),(44,'john','john@example.com','$2y$10$6DVF0Uafaw81fwFNuSNlN.Mz4zWWLyY0DwIei5pQcpvGs0mRvmjh2','user','2025-04-07 01:11:08'),(45,'john','john@example.com','$2y$10$mQehJNQuLBcAlc6vg0L3Be4xAcj0TUdfJy49h4zZ7tE/B77OfmBF.','user','2025-04-07 01:11:09'),(46,'john','john@example.com','$2y$10$WONqwFla3CwYXT9UnmmL.OhzwHzAuGSS28ScFtrro2qpQ.TOnmOTy','user','2025-04-07 01:11:09'),(47,'john','john@example.com','$2y$10$DbhZ6K4u9pk.jMwXy3v5kOWmoPIZaCTQlOwvn9ILsaEeEcfDcQUFe','user','2025-04-07 01:11:09'),(48,'john','john@example.com','$2y$10$397Q50vr2OjxLAhPJc0cguyA6K8LUbOJ3xOd9XY259nqz71NZXsC2','user','2025-04-07 01:15:43'),(49,'john','john@example.com','$2y$10$46Q..yrDzLytDjStWjeBT.j7xSkZScamLW1MgISPgM69TooA1Q.FC','user','2025-04-07 01:15:44'),(50,'john','john@example.com','$2y$10$uZp0PAmV4ul1x9nyekYZBuzhWK9NpOX.mDZ4SS7GT6/8WY4kHPt4u','user','2025-04-07 01:15:44'),(51,'john','john@example.com','$2y$10$feyen5b6pNxVt9ycrRvtOOeJ9L4lcCU5I1wS1CICshrqBMB6FHX/u','user','2025-04-07 01:15:49'),(52,'john','john@example.com','$2y$10$/LqjZGtbmBBSnlYLLyitLezWWQYorgVzqr0uUv0V1fGAOnJohb9ey','user','2025-04-07 01:15:49'),(53,'john','john@example.com','$2y$10$yCCa9JHQtLpBH6T0e20CnOWfxhlEvnka0LAzsIsAu4TJ0Fosz5k2a','user','2025-04-07 01:15:50'),(54,'john','john@example.com','$2y$10$FWf/b4Y7Dsib2Zxl60zbXuc8JhZg5QWN4t3Nv5KnPm8kslDvCwpe6','user','2025-04-07 01:15:56'),(55,'john','john@example.com','$2y$10$kh46j.n5l2yduefrOM94OeKdF2s9ZIFBOPLbbxEEXYSiwfOvosd..','user','2025-04-07 01:15:56'),(56,'john','john@example.com','$2y$10$tj55jycMYARO2b2gInRL6OQtDFPU4oZZoWx0FQN8nEbNuwH6GThHO','user','2025-04-07 01:15:57'),(57,'john','john@example.com','$2y$10$PcAIMHcYZp6v0/rnPJTZ6.d0qgESgxsDRMDlbhwpSSK75mJya.74e','user','2025-04-07 01:15:57'),(58,'john','john@example.com','$2y$10$RuhXxrw2S94zr/Gf275AUeU6AR.jSPeEW638xbqDdWz8eZY5OVqai','user','2025-04-07 01:15:57'),(59,'john','john@example.com','$2y$10$6aNf.dEdBsXkFlEsGPQEUOshJk6b4Ed9YWIf/SqSoN.WW1ZxkZVxG','user','2025-04-07 01:17:07'),(60,'john','john@example.com','$2y$10$Imcx3DUkCDlJbSd.bKMBjODbTi2/SDpVHtvBvWpHLz1QsjB88KEN2','user','2025-04-07 01:20:15'),(61,'john','john@example.com','$2y$10$qVCBs80bcJWZWFcrrST2Bub5SNS/Zl5XpnI1Mp0NzMtuD3Ey5pn12','user','2025-04-07 01:20:16'),(62,'john','john@example.com','$2y$10$Sv2dxPRPzPpJBPXVjen2peLKKEXLp394xwDenORXTQqLyLUiMOJCi','user','2025-04-07 01:20:47'),(63,'john','john@example.com','$2y$10$OXvaEzacTM18M1qor6RGpu/0eM0ZzLp7nRpLis7FRyYECmk8bjicK','user','2025-04-07 01:20:48'),(64,'john','john@example.com','$2y$10$UkwZMrv1DEFKou1zL.W.6u0l7wCALFYTLhlRJuC68rkrQBjvDrMHm','user','2025-04-07 01:22:13'),(65,'john','john@example.com','$2y$10$FkBYX8NWtbQz/AHSpjad7.Tbu1ANMKksA1.Q14anml4q.H5.UtUBm','user','2025-04-07 01:22:14'),(66,'john','john@example.com','$2y$10$R0xqZNdLn5SCRd.9dGLWf.28re38dPXZHv9SGV9mB4KfbWgYcwxmS','user','2025-04-07 01:23:07'),(67,'john','john@example.com','$2y$10$G3gbVjTqncTOQPNboOq7Cu3p9N56vl8HhHKZ3PKB1JtrQUEAaUAiq','user','2025-04-07 01:23:08'),(68,'john','john@example.com','$2y$10$Qdn29z6YurvgKedFb9juyeouoqthauwi5nGy/AhtXQzT9jVq9u5T6','user','2025-04-07 01:25:01'),(69,'john','john@example.com','$2y$10$0bexhjR5WXRMld3nsV6xNuuZ0lOEMauN/BhyNtSQKk2A3eJyF4D7i','user','2025-04-07 01:25:04'),(70,'john','john@example.com','$2y$10$D/YX280yednGGGkz4Rbvru1sB5u.nBPoAbfxwEF2nl8K0MO6eXany','user','2025-04-07 01:26:33'),(71,'john','john@example.com','$2y$10$NNemjwBdTfXjANXm77dLRe7tEN5LvJlVJkDcWXIeYstIz5hQJ526K','user','2025-04-07 01:26:34'),(72,'john','john@example.com','$2y$10$5ruEE6tVtHVehKgu0jFBjubmgVrzYcS71dh4r882KvDrgAitRRhF2','user','2025-04-07 01:34:17'),(73,'test_user','test@example.com','$2y$10$av2R5VgpWob.ShNJN78y0uXS5yCIbbgvAVgXzW4fpZpQTuk4rK24C','user','2025-04-07 01:59:43'),(74,'test_user','test@example.com','$2y$10$d2odgCsh4AehNSDv5YBAR.m6lXVDGw9t5qW0YKIrOR0z6uHhB6gdi','user','2025-04-07 02:01:05'),(75,'test_user','test@example.com','$2y$10$RODx6QwkrEzPDuSFjREdv.HDrPaon6wLmDGPhn1/7nz312M186auG','user','2025-04-07 02:01:09'),(76,'test_user','test@example.com','$2y$10$1CYUrbb5PoHYGUTdAxpgp..7T4.bqrXZZnS0lJg.iAqtjKWqyfppu','user','2025-04-07 02:01:37'),(77,'test_user','test@example.com','$2y$10$2NJrcbKvY/toj1JtGINABOEN4yeuRbQUX2f7kq1RQb9c03.gaeOAe','user','2025-04-07 02:03:14'),(78,'john','john@example.com','$2y$10$TPZehB/RltsJKll78lXGOuUA06dB21cXZdnIMfUhpF8ymkJENZ6J.','user','2025-04-07 02:04:45'),(79,'john','john@example.com','$2y$10$fKZfswLaMNAlTBbh0XDdO.8ZWyQiJHKTaGKanzcYngP8pYQ7XZs7G','user','2025-04-07 02:04:47');
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

-- Dump completed on 2025-04-07  2:11:01
