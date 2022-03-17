-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 17, 2022 at 06:38 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ujikom_bernal`
--

-- --------------------------------------------------------

--
-- Table structure for table `detailfasilitaskamar`
--

CREATE TABLE `detailfasilitaskamar` (
  `iddetailfasilitaskamar` int(11) NOT NULL,
  `fasilitasid` int(11) NOT NULL,
  `kamarid` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detailfasilitaskamar`
--

INSERT INTO `detailfasilitaskamar` (`iddetailfasilitaskamar`, `fasilitasid`, `kamarid`, `created_at`, `updated_at`) VALUES
(2, 9, 2, '2022-03-11 20:12:50', '2022-03-11 20:12:50'),
(3, 9, 3, '2022-03-15 06:59:21', '2022-03-15 06:59:21'),
(4, 9, 1, '2022-03-15 11:28:56', '2022-03-15 11:28:56'),
(5, 8, 1, '2022-03-15 11:28:57', '2022-03-15 11:28:57'),
(6, 9, 4, '2022-03-15 11:31:04', '2022-03-15 11:31:04');

-- --------------------------------------------------------

--
-- Table structure for table `detailreservasi`
--

CREATE TABLE `detailreservasi` (
  `iddetailreservasi` int(11) NOT NULL,
  `reservasiid` int(11) NOT NULL,
  `kamar_idkamar` int(11) NOT NULL,
  `extraid` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `extra`
--

CREATE TABLE `extra` (
  `idextra` int(11) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `harga` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `fasilitas`
--

CREATE TABLE `fasilitas` (
  `idfasilitas` int(11) NOT NULL,
  `namafasilitas` varchar(50) NOT NULL,
  `icon` varchar(25) NOT NULL,
  `picture` varchar(45) NOT NULL,
  `jenisfasilitas` enum('KAMAR','HOTEL') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fasilitas`
--

INSERT INTO `fasilitas` (`idfasilitas`, `namafasilitas`, `icon`, `picture`, `jenisfasilitas`) VALUES
(1, 'Shower', '', '7982-IMG-Picture.JPG', 'HOTEL'),
(2, 'Kamar', '', '9512-IMG-Picture.JPG', 'HOTEL'),
(3, 'Kasur', '', '9343-IMG-Picture.JPG', 'HOTEL'),
(4, 'Shower', '', '1000-IMG-Picture.JPG', 'HOTEL'),
(5, 'Shower', '', '6470-IMG-Picture.jpg', 'HOTEL'),
(6, 'Shower', '', '4859-IMG-Picture.jpg', 'HOTEL'),
(7, 'Shower', '', '4524-IMG-Picture.jpg', 'HOTEL'),
(8, 'Kasur', 'fas fa-bed', '', 'KAMAR'),
(9, 'Shower', 'fas fa-shower', '', 'KAMAR');

-- --------------------------------------------------------

--
-- Table structure for table `kamar`
--

CREATE TABLE `kamar` (
  `idkamar` int(11) NOT NULL,
  `namakamar` varchar(100) NOT NULL,
  `harga` double NOT NULL,
  `jumlahqty` int(11) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `tipekamarid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kamar`
--

INSERT INTO `kamar` (`idkamar`, `namakamar`, `harga`, `jumlahqty`, `description`, `created_at`, `update_at`, `tipekamarid`) VALUES
(4, 'Kamar 1', 10000, 0, 'Tersedia', '2022-03-15 11:31:04', '2022-03-15 11:31:04', 1);

-- --------------------------------------------------------

--
-- Table structure for table `kamargalery`
--

CREATE TABLE `kamargalery` (
  `idkamargalery` int(11) NOT NULL,
  `url` varchar(100) NOT NULL,
  `text` text NOT NULL,
  `is_active` enum('YES','NO') NOT NULL,
  `kamarid` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kamargalery`
--

INSERT INTO `kamargalery` (`idkamargalery`, `url`, `text`, `is_active`, `kamarid`, `created_at`, `updated_at`) VALUES
(3, '8318-IMG-Picture.jpg', '', 'YES', 4, '2022-03-15 11:31:04', '2022-03-15 11:31:04');

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `idrating` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `tamuid` int(11) NOT NULL,
  `kamarid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`idrating`, `value`, `created_at`, `updated_at`, `tamuid`, `kamarid`) VALUES
(1, 3, '2022-03-15 11:37:07', '2022-03-15 11:37:07', 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `reservasi`
--

CREATE TABLE `reservasi` (
  `idreservasi` int(11) NOT NULL,
  `startdate` date NOT NULL,
  `enddate` date NOT NULL,
  `lama` int(11) NOT NULL,
  `status` enum('reservasi','checkin','checkout','cancel') NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT current_timestamp(),
  `approved_by` int(11) DEFAULT NULL,
  `canceled_by` int(11) DEFAULT NULL,
  `approved_date` datetime NOT NULL,
  `canceled_date` datetime NOT NULL,
  `tamuid` int(11) NOT NULL,
  `kamarid` int(11) NOT NULL,
  `qtykamar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reservasi`
--

INSERT INTO `reservasi` (`idreservasi`, `startdate`, `enddate`, `lama`, `status`, `created_at`, `update_at`, `approved_by`, `canceled_by`, `approved_date`, `canceled_date`, `tamuid`, `kamarid`, `qtykamar`) VALUES
(1, '2022-03-15', '2022-03-15', 1, 'checkin', '2022-03-15 11:38:36', NULL, NULL, NULL, '2022-03-15 12:38:05', '2022-03-15 12:38:05', 1, 4, 1);

--
-- Triggers `reservasi`
--
DELIMITER $$
CREATE TRIGGER `reservasi` AFTER UPDATE ON `reservasi` FOR EACH ROW BEGIN
IF new.status='cekin' THEN
BEGIN
UPDATE kamar SET jumlah=jumlah-old.jumlah_kamar WHERE idkamar-old.kamarid;
end;
END IF;
IF new.status='cekout' THEN
BEGIN
UPDATE kamar SET jumlah=jumlah+old.jumlah_kamar WHERE idkamar=old.kamarid;
end;
END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trigger_hotel` AFTER UPDATE ON `reservasi` FOR EACH ROW BEGIN
	IF new.status='CHECKIN' THEN
    UPDATE kamar SET jumlahqty=jumlahqty-old.qtykamar WHERE idkamar = old.kamarid;
    END IF;
    IF new.status='checkout' THEN
    	UPDATE kamar SET jumlahqty=jumlahqty+old.qtykamar WHERE idkamar 
=old.kamarid;
	END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `idreview` int(11) NOT NULL,
  `review` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `tamuid` int(11) NOT NULL,
  `kamarid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`idreview`, `review`, `created_at`, `updated_at`, `tamuid`, `kamarid`) VALUES
(1, 'Bagus.', '2022-03-15 11:36:50', '2022-03-15 11:36:50', 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `tamu`
--

CREATE TABLE `tamu` (
  `idtamu` int(11) NOT NULL,
  `nik` varchar(100) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jeniskelamin` enum('laki-laki','perempuan') NOT NULL,
  `alamat` text NOT NULL,
  `telepon` varchar(15) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` text NOT NULL,
  `ismember` enum('YA','NO') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tamu`
--

INSERT INTO `tamu` (`idtamu`, `nik`, `nama`, `jeniskelamin`, `alamat`, `telepon`, `username`, `password`, `ismember`, `created_at`, `updated_at`) VALUES
(1, '123456789', 'Alpiah', 'perempuan', 'Indonesia', '08', 'piah@gmail.com', '123456789', 'YA', '2022-03-15 11:36:18', '2022-03-15');

-- --------------------------------------------------------

--
-- Table structure for table `tipekamar`
--

CREATE TABLE `tipekamar` (
  `idtipekamar` int(11) NOT NULL,
  `tipekamar` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tipekamar`
--

INSERT INTO `tipekamar` (`idtipekamar`, `tipekamar`) VALUES
(3, 'Deluxe'),
(1, 'Super Deluxe'),
(4, 'VVIP'),
(5, 'VVIPP');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `idusers` int(11) NOT NULL,
  `namauser` varchar(50) NOT NULL,
  `jk` enum('laki-laki','perempuan') NOT NULL,
  `alamat` text NOT NULL,
  `notelepon` varchar(20) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` text NOT NULL,
  `role` enum('ADMIN','RECEPTIONIST') NOT NULL,
  `photo` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`idusers`, `namauser`, `jk`, `alamat`, `notelepon`, `username`, `password`, `role`, `photo`, `created_at`, `update_at`) VALUES
(3, 'alfiah', 'perempuan', 'Banjar', '08', 'alpiah1401@gmail.com', '$2y$10$XQm893FDm1B4y.96zL8dd.ehguM7I78jeQNeOXY6dYE3GN1FeoDHi', 'ADMIN', '7385-IMG-Picture.jpg', '2022-03-17 02:55:13', '2022-03-17 02:55:13'),
(4, 'fiahcantik', 'perempuan', 'Indonesia', '089662', 'alpiah1401@gmail.com', '$2y$10$hSDU2LNXnXrywgTWQzJxo.1mTI5j.NqR4nin2wNfcJX0bEQFPs0oO', 'RECEPTIONIST', '9995-IMG-Picture.jpg', '2022-03-17 15:58:37', '2022-03-17 15:58:37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detailfasilitaskamar`
--
ALTER TABLE `detailfasilitaskamar`
  ADD PRIMARY KEY (`iddetailfasilitaskamar`),
  ADD KEY `fasilitasid` (`fasilitasid`),
  ADD KEY `kamarid` (`kamarid`);

--
-- Indexes for table `detailreservasi`
--
ALTER TABLE `detailreservasi`
  ADD PRIMARY KEY (`iddetailreservasi`),
  ADD UNIQUE KEY `reservasiid` (`reservasiid`),
  ADD KEY `extraid` (`extraid`),
  ADD KEY `kamar_idkamar` (`kamar_idkamar`);

--
-- Indexes for table `extra`
--
ALTER TABLE `extra`
  ADD PRIMARY KEY (`idextra`);

--
-- Indexes for table `fasilitas`
--
ALTER TABLE `fasilitas`
  ADD PRIMARY KEY (`idfasilitas`);

--
-- Indexes for table `kamar`
--
ALTER TABLE `kamar`
  ADD PRIMARY KEY (`idkamar`),
  ADD KEY `tipekamar` (`tipekamarid`);

--
-- Indexes for table `kamargalery`
--
ALTER TABLE `kamargalery`
  ADD PRIMARY KEY (`idkamargalery`),
  ADD KEY `kamarid` (`kamarid`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`idrating`),
  ADD KEY `tamuid` (`tamuid`),
  ADD KEY `kamarid` (`kamarid`);

--
-- Indexes for table `reservasi`
--
ALTER TABLE `reservasi`
  ADD PRIMARY KEY (`idreservasi`),
  ADD KEY `tamu_id` (`tamuid`),
  ADD KEY `kamarid` (`kamarid`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`idreview`),
  ADD KEY `tamuid` (`tamuid`),
  ADD KEY `kamarid` (`kamarid`);

--
-- Indexes for table `tamu`
--
ALTER TABLE `tamu`
  ADD PRIMARY KEY (`idtamu`);

--
-- Indexes for table `tipekamar`
--
ALTER TABLE `tipekamar`
  ADD PRIMARY KEY (`idtipekamar`),
  ADD KEY `tipekamar` (`tipekamar`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`idusers`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detailfasilitaskamar`
--
ALTER TABLE `detailfasilitaskamar`
  MODIFY `iddetailfasilitaskamar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `detailreservasi`
--
ALTER TABLE `detailreservasi`
  MODIFY `iddetailreservasi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `extra`
--
ALTER TABLE `extra`
  MODIFY `idextra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fasilitas`
--
ALTER TABLE `fasilitas`
  MODIFY `idfasilitas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `kamar`
--
ALTER TABLE `kamar`
  MODIFY `idkamar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kamargalery`
--
ALTER TABLE `kamargalery`
  MODIFY `idkamargalery` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `idrating` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `reservasi`
--
ALTER TABLE `reservasi`
  MODIFY `idreservasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `idreview` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tamu`
--
ALTER TABLE `tamu`
  MODIFY `idtamu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tipekamar`
--
ALTER TABLE `tipekamar`
  MODIFY `idtipekamar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `idusers` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kamar`
--
ALTER TABLE `kamar`
  ADD CONSTRAINT `kamar_ibfk_1` FOREIGN KEY (`tipekamarid`) REFERENCES `tipekamar` (`idtipekamar`);

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`tamuid`) REFERENCES `tamu` (`idtamu`),
  ADD CONSTRAINT `rating_ibfk_2` FOREIGN KEY (`kamarid`) REFERENCES `kamar` (`idkamar`);

--
-- Constraints for table `reservasi`
--
ALTER TABLE `reservasi`
  ADD CONSTRAINT `reservasi_ibfk_1` FOREIGN KEY (`kamarid`) REFERENCES `kamar` (`idkamar`),
  ADD CONSTRAINT `reservasi_ibfk_2` FOREIGN KEY (`tamuid`) REFERENCES `tamu` (`idtamu`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`kamarid`) REFERENCES `kamar` (`idkamar`),
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`tamuid`) REFERENCES `tamu` (`idtamu`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
