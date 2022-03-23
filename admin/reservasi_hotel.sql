-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 23, 2022 at 02:55 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `reservasi_hotel`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_cekin`
--

CREATE TABLE `tb_cekin` (
  `id_cekin` int(11) NOT NULL,
  `kd_tamu` varchar(10) NOT NULL,
  `kd_kamar` varchar(10) NOT NULL,
  `tanggal_cekin` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_cekin`
--

INSERT INTO `tb_cekin` (`id_cekin`, `kd_tamu`, `kd_kamar`, `tanggal_cekin`) VALUES
(1, '1', '1', '2022-03-14'),
(2, '2', '2', '2022-03-21'),
(3, '3', '3', '2022-03-18'),
(4, '4', '4', '2022-03-20');

-- --------------------------------------------------------

--
-- Table structure for table `tb_cekout`
--

CREATE TABLE `tb_cekout` (
  `id_cekout` int(11) NOT NULL,
  `kd_tamu` varchar(10) NOT NULL,
  `kd_kamar` varchar(20) NOT NULL,
  `id_pesan` int(11) NOT NULL,
  `tgl_cekout` date NOT NULL,
  `biaya_inap` decimal(10,0) NOT NULL,
  `total_biaya` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_cekout`
--

INSERT INTO `tb_cekout` (`id_cekout`, `kd_tamu`, `kd_kamar`, `id_pesan`, `tgl_cekout`, `biaya_inap`, `total_biaya`) VALUES
(1, '1', '1', 1, '2022-03-21', '500000', '500000'),
(2, '2', '2', 2, '2022-03-22', '1000000', '1000000'),
(3, '3', '3', 3, '2022-03-19', '4000000', '4000000'),
(4, '4', '4', 4, '2022-03-20', '3000000', '3000000');

-- --------------------------------------------------------

--
-- Table structure for table `tb_kamar`
--

CREATE TABLE `tb_kamar` (
  `id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `harga kamar` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_kamar`
--

INSERT INTO `tb_kamar` (`id`, `type_id`, `type`, `harga kamar`) VALUES
(1, 1, 'Kamar Kela', 500000),
(2, 2, 'Kamar Ultr', 2000000),
(3, 3, 'Kamar Gran', 1000000),
(4, 4, 'Kamar Pres', 4000000);

-- --------------------------------------------------------

--
-- Table structure for table `tb_pembayaran`
--

CREATE TABLE `tb_pembayaran` (
  `id_kamar` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `harga kamar` varchar(10) NOT NULL,
  `jumlah pembayaran` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_pembayaran`
--

INSERT INTO `tb_pembayaran` (`id_kamar`, `id_pelanggan`, `harga kamar`, `jumlah pembayaran`) VALUES
(1, 1, '5000000', 5000000),
(2, 2, '1000000', 2000000),
(3, 3, '1000000', 1000000),
(4, 4, '4000000', 4000000);

-- --------------------------------------------------------

--
-- Table structure for table `tb_type`
--

CREATE TABLE `tb_type` (
  `type_id` int(11) NOT NULL,
  `type_nama` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_type`
--

INSERT INTO `tb_type` (`type_id`, `type_nama`) VALUES
(1, 'Kamar Kelasik'),
(2, 'Kamar Ultra Superior'),
(3, 'Kamar Grand Deluxe'),
(4, 'Kamar Presidential');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `password` varchar(10) NOT NULL,
  `telp` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `level_user` enum('admin','petugas','pelanggan') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id`, `nama`, `user_name`, `password`, `telp`, `email`, `level_user`) VALUES
(1, 'user1', '@user1', '@user1', '0831234567', 'user1@gmail.com', 'admin'),
(2, 'user2', '@user2', '@user2', '0835671234', 'user2@gmail.com', 'petugas'),
(3, 'user3', '@user3', '@user3', '0837654876', 'user3@gmail.com', 'pelanggan');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_cekin`
--
ALTER TABLE `tb_cekin`
  ADD PRIMARY KEY (`id_cekin`);

--
-- Indexes for table `tb_cekout`
--
ALTER TABLE `tb_cekout`
  ADD PRIMARY KEY (`id_cekout`);

--
-- Indexes for table `tb_kamar`
--
ALTER TABLE `tb_kamar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_id` (`type_id`);

--
-- Indexes for table `tb_pembayaran`
--
ALTER TABLE `tb_pembayaran`
  ADD PRIMARY KEY (`id_kamar`,`id_pelanggan`);

--
-- Indexes for table `tb_type`
--
ALTER TABLE `tb_type`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_cekin`
--
ALTER TABLE `tb_cekin`
  MODIFY `id_cekin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_cekout`
--
ALTER TABLE `tb_cekout`
  MODIFY `id_cekout` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_kamar`
--
ALTER TABLE `tb_kamar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_pembayaran`
--
ALTER TABLE `tb_pembayaran`
  MODIFY `id_kamar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_type`
--
ALTER TABLE `tb_type`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_pembayaran`
--
ALTER TABLE `tb_pembayaran`
  ADD CONSTRAINT `tb_pembayaran_ibfk_1` FOREIGN KEY (`id_kamar`) REFERENCES `tb_kamar` (`id`);

--
-- Constraints for table `tb_type`
--
ALTER TABLE `tb_type`
  ADD CONSTRAINT `tb_type_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `tb_kamar` (`type_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
