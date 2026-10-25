-- phpMyAdmin SQL Dump
-- Database: `db_nilai5a`

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_nilai5a`
--
CREATE DATABASE IF NOT EXISTS `db_nilai5a` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `db_nilai5a`;

-- --------------------------------------------------------

--
-- Table structure for table `nilaimhsw`
--

DROP TABLE IF EXISTS `nilaimhsw`;
CREATE TABLE `nilaimhsw` (
  `nim` varchar(10) NOT NULL,
  `namamhsw` varchar(100) NOT NULL,
  `nilaiakhir` float NOT NULL,
  `nilaihuruf` varchar(10) DEFAULT NULL,
  `predikat` varchar(50) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`nim`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `nilaimhsw`
--

INSERT INTO `nilaimhsw` (`nim`, `namamhsw`, `nilaiakhir`, `nilaihuruf`, `predikat`, `file_path`, `create_date`, `modified_date`) VALUES
('3202316131', 'Patrizio Marcedes Diuva Amore', 86.7, 'A', 'Sangat Memuaskan', 'uploads/1792921050_images.jpg', '2026-10-18 07:41:33', '2026-10-18 20:56:33'),
('3202416002', 'Aril Apriyandi Wibowo', 31.5, 'E', 'Tidak Lulus', 'uploads/nasgoreng.jpg', '2026-10-17 08:16:33', '2026-10-17 20:41:33'),
('3202416005', 'Inka Audya Miranti', 82.75, 'A', 'Sangat Memuaskan', 'uploads/naksu.jpg', '2026-10-09 12:51:33', '2026-10-09 18:41:33'),
('3202416020', 'Aditya Ramadani', 48.3, 'D', 'Kurang', 'uploads/tiktok.jpg', '2026-10-15 11:46:33', '2026-10-15 20:06:33'),
('3202416025', 'Achmad Ardian Mulyadi', 53.25, 'C', 'Cukup', 'uploads/515c44eb-e800-4cf4-99c2-c1911cba3794.jpg', '2026-10-13 12:56:33', '2026-10-13 19:36:33'),
('3202416044', 'Hikmal Rizqi Rahman Fauzi', 76.4, 'B', 'Memuaskan', 'uploads/1792920637_jesse.jpg', '2026-10-06 17:01:33', '2026-10-06 17:51:33'),
('3202416068', 'Sabrina Utami', 92, 'A', 'Sangat Memuaskan', 'uploads/seolinah.jpg', '2026-10-07 16:26:33', '2026-10-07 18:06:33'),
('3202416083', 'Freky Ardiansyah', 58.5, 'C', 'Cukup', 'uploads/bahlil.jpg', '2026-10-11 14:06:33', '2026-10-11 19:06:33'),
('3202416084', 'Ilham Saputra', 88.5, 'A', 'Sangat Memuaskan', 'uploads/1792920624_walterwhtie.jpg', '2026-10-05 17:36:33', '2026-10-05 17:36:33'),
('3202416091', 'Rizq Ariiq Pratama', 64.8, 'B', 'Memuaskan', 'uploads/1792920845_mbg.jpg', '2026-10-10 14:41:33', '2026-10-10 18:51:33'),
('3202416133', 'Gabriel Diestra Kireizuka', 71.2, 'B', 'Memuaskan', 'uploads/1792920646_ironman.jpg', '2026-10-09 15:16:33', '2026-10-09 18:36:33'),
('3202416134', 'Gusty Faqikh', 44.6, 'D', 'Kurang', 'uploads/1792920829_images.jpg', '2026-10-14 12:21:33', '2026-10-14 19:51:33'),
('3202416149', 'Laili Surya Raja Murti', 78.9, 'B', 'Memuaskan', 'uploads/1792920838_seolinah.jpg', '2026-10-12 13:31:33', '2026-10-12 19:21:33');

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
