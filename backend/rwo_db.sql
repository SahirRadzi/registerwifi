-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 18, 2024 at 05:50 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rwo_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(5) NOT NULL,
  `unique_id` varchar(6) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `unique_id`, `nama`, `email`, `password`) VALUES
(1, 'z5f4ba', 'ijat', 'ijat@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2'),
(2, 'vIyuI8', 'sahir', 'sahir.radzi@gmail.com', '1c6637a8f2e1f75e06ff9984894d6bd16a3a36a9');

-- --------------------------------------------------------

--
-- Table structure for table `demand_list`
--

CREATE TABLE `demand_list` (
  `id` int(5) NOT NULL,
  `unique_id` varchar(6) NOT NULL,
  `tarikh` date NOT NULL DEFAULT current_timestamp(),
  `nama` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phoneno` varchar(12) NOT NULL,
  `phonenoTambahan` varchar(12) DEFAULT NULL,
  `nokp` varchar(12) NOT NULL,
  `alamatPemasangan` varchar(255) NOT NULL,
  `alamatBill` varchar(255) NOT NULL,
  `pakej` varchar(255) NOT NULL,
  `tarikhWaktu` datetime DEFAULT NULL,
  `signa_s` varchar(255) NOT NULL,
  `signa_c` varchar(255) NOT NULL,
  `imgBill` varchar(255) NOT NULL,
  `imgKpD` varchar(255) NOT NULL,
  `imgKpB` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL,
  `catatan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `demand_list`
--

INSERT INTO `demand_list` (`id`, `unique_id`, `tarikh`, `nama`, `email`, `phoneno`, `phonenoTambahan`, `nokp`, `alamatPemasangan`, `alamatBill`, `pakej`, `tarikhWaktu`, `signa_s`, `signa_c`, `imgBill`, `imgKpD`, `imgKpB`, `status`, `catatan`) VALUES
(1, 'z5f4ba', '2024-01-17', 'Wan Muhammad Izzat', '', '0184674760', '', '', 'No 915 jalan 3/21 residen 3 bandar baru setia awan perdana 32000 Sitiawan, Perak', 'No 915 jalan 3/21 residen 3 bandar baru setia awan perdana 32000 Sitiawan, Perak', 'U89', '0000-00-00 00:00:00', '', '../uploaded_sign_c/-ghAmmhZRd4iAqW3eTnp4.png', '', '', '', '', NULL),
(2, 'z5f4ba', '2024-01-17', 'Che Muhamad Nurhafizi Bin Che Malek ', '', '0142478723', '', '', '166/4 residen 3 bandar baru setiawan 32000 setiawan,perak', '166/4 residen 3 bandar baru setiawan 32000 setiawan,perak', 'U89', '0000-00-00 00:00:00', '', '../uploaded_sign_c/-oM3Nbt1nIpSQPqvWnnHF.png', '', '', '', '', NULL),
(3, 'z5f4ba', '2024-01-17', 'Mohamad Hafiz Bin Md Noor', '', '0149451178', '', '', 'No 70, jalan Residen 3/2, Residen 3, Bandar Baru Setia Awan Perdana, 32000 Sitiawan, Perak', 'No 70, jalan Residen 3/2, Residen 3, Bandar Baru Setia Awan Perdana, 32000 Sitiawan, Perak', 'U89', '0000-00-00 00:00:00', '', '../uploaded_sign_c/-IuBM4ZMaKnJQF4kq5kwA.png', '', '', '', '', NULL),
(4, 'z5f4ba', '2024-01-17', 'Siti Munira', '', '01160767768', '', '', 'No. 612, jln residen 3/16, residen 3, bandar baru setia awan perdana, 32000 sitiawan, perak.', 'No. 612, jln residen 3/16, residen 3, bandar baru setia awan perdana, 32000 sitiawan, perak.', 'U89', '0000-00-00 00:00:00', '', '../uploaded_sign_c/-rJ9JP2B3LuU9OgQKjDqC.png', '', '', '', '', NULL),
(5, 'z5f4ba', '2024-01-17', 'Shahreza Huzaifah Bin Abdullah', '', '0194173800', '', '', 'Lot 107, Jalan Residen 3/2, Residen 3, Bandar Baru Setia Awan Perdana, 32000 Sitiawan, Perak.', 'Lot 107, Jalan Residen 3/2, Residen 3, Bandar Baru Setia Awan Perdana, 32000 Sitiawan, Perak.', 'U89', '0000-00-00 00:00:00', '', '../uploaded_sign_c/-w7xZC4DxkGLoQ3Zqp4dk.png', '', '', '', '', NULL),
(6, 'z5f4ba', '2024-01-17', 'Mohd Kamarol Ariffin Bin Kamarolzaman', '', '601116004821', '', '', 'No 903, jalan residen 3/21, residen 3 bandar baru setia awan perdana 32000 sitiawan perak darul ridzuan', 'No 903, jalan residen 3/21, residen 3 bandar baru setia awan perdana 32000 sitiawan perak darul ridzuan', 'U89', '0000-00-00 00:00:00', '', '../uploaded_sign_c/-RZ0dl7OU520KtxBVMPMm.png', '', '', '', '', NULL),
(7, 'z5f4ba', '2024-01-17', 'Muhammad shahidan bin zolkepli', '', '0123284012', '', '', 'No 99 jalan residen 4/2 residen 4', 'No 99 jalan residen 4/2 residen 4', 'U89', '0000-00-00 00:00:00', '', '../uploaded_sign_c/-CibMNgwHUDnzP4cyKx83.png', '', '', '', '', NULL),
(8, 'z5f4ba', '2024-01-17', 'Muhammad Syafiq bin mat isa', '', '0175452724', '', '', 'No 575, jalan residen 4/11 residen 4 bandar baru setia awan perdana 32000 sitiawan perak', 'No 575, jalan residen 4/11 residen 4 bandar baru setia awan perdana 32000 sitiawan perak', 'U89', '0000-00-00 00:00:00', '', '../uploaded_sign_c/-DwmkbEnAekLvpowwdunD.png', '', '', '', '', NULL),
(9, 'z5f4ba', '2024-01-17', 'Md Khairul Khadi bin Mohd Ayub Khan', '', '0166146504', '', '', 'No 174 Jalan 4/3, Bandar Baru Setiawan Perdana, 32000 Setiawan, Perak', 'No 174 Jalan 4/3, Bandar Baru Setiawan Perdana, 32000 Setiawan, Perak', 'U89', '0000-00-00 00:00:00', '', '../uploaded_sign_c/-ikbELSjuzWlcsQqp2b0e.png', '', '', '', '', NULL),
(10, 'z5f4ba', '2024-01-17', 'Kamarul Azuan bin Hashim ', '', '60163065381', '', '', '1107, Jalan 4/6', '1107, Jalan 4/6', 'U89', '0000-00-00 00:00:00', '', '../uploaded_sign_c/-2Vrz7CEUuPYUaquO0QYE.png', '', '', '', '', NULL),
(11, 'z5f4ba', '2024-01-17', 'Mohd Asrul Bustami Ismail', '', '0132777562', '', '', '863 Jln Residen 4/14 Residen 4 \r\nBandar Baru Setiawan Perdana\r\n32000 Sitiawan\r\nPerak.', '863 Jln Residen 4/14 Residen 4 \r\nBandar Baru Setiawan Perdana\r\n32000 Sitiawan\r\nPerak.', 'U89', '0000-00-00 00:00:00', '', '../uploaded_sign_c/-6TjMwRtNneMr3LWzjk8u.png', '', '', '', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(100) NOT NULL,
  `unique_id` varchar(6) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phoneno` varchar(12) NOT NULL,
  `message` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders_list`
--

CREATE TABLE `orders_list` (
  `id` int(5) NOT NULL,
  `unique_id` varchar(6) NOT NULL,
  `tarikh` date DEFAULT current_timestamp(),
  `nama` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phoneno` varchar(12) NOT NULL,
  `phonenoTambahan` varchar(12) DEFAULT NULL,
  `nokp` varchar(12) NOT NULL,
  `alamatPemasangan` varchar(255) NOT NULL,
  `alamatBill` varchar(255) NOT NULL,
  `pakej` varchar(255) NOT NULL,
  `tarikhWaktu` datetime DEFAULT NULL,
  `signa_s` varchar(255) DEFAULT NULL,
  `signa_c` varchar(255) NOT NULL,
  `imgBill` varchar(255) NOT NULL,
  `imgKpD` varchar(255) NOT NULL,
  `imgKpB` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'Baru',
  `catatan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders_list`
--

INSERT INTO `orders_list` (`id`, `unique_id`, `tarikh`, `nama`, `email`, `phoneno`, `phonenoTambahan`, `nokp`, `alamatPemasangan`, `alamatBill`, `pakej`, `tarikhWaktu`, `signa_s`, `signa_c`, `imgBill`, `imgKpD`, `imgKpB`, `status`, `catatan`) VALUES
(1, 'z5f4ba', '2024-01-11', 'Muhamad Sahir Syahmi Bin Muhamad Radzi', 'sahir.radzi@gmail.com', '123456789', NULL, '2147483647', 'No 7, Fasa 3, Seri Manjung Perak', 'No 7, Fasa 3, Seri Manjung Perak', 'U89', NULL, '', '', '', '', '', 'Batal', NULL),
(2, 'z5f4ba', '2024-01-11', 'Shah Test ', 'shahtest@gmail.com', '0198765431', NULL, '931104086159', 'NO 7, Seri Manjung', 'NO 7, Seri Manjung', 'U89', NULL, '', '', '', '', '', 'Batal', NULL),
(3, 'z5f4ba', '2024-01-11', 'Sahir Ezy Diy', 'sahir.ezydiy@gmail.com', '01133165639', NULL, '931104086159', 'NO 70, Perak', 'NO 70, Perak', 'U159', NULL, '', '', 'bill_01.jpg', 'ic_depan.jpg', 'ic_belakang.jpg', 'Proses', NULL),
(4, 'vIyuI8', '2024-01-12', 'Muhamad Fairul Azrul Bin Shahini', 'fairulazrul6@gmail.com', '01140738173', NULL, '950503085501', 'No 352, Jalan Seri Wangsa, 3/1 Taman Seri Wangsa 2, 32040 Seri Manjung, Perak', 'No 352, Jalan Seri Wangsa, 3/1 Taman Seri Wangsa 2, 32040 Seri Manjung, Perak', 'U89', NULL, '', '', 'Screenshot 2024-01-12 172501.png', 'Screenshot 2024-01-12 172439.png', 'Screenshot 2024-01-12 172448.png', 'Baru', NULL),
(5, 'vIyuI8', '2024-01-14', 'Norazlan bin shaharudin', 'yem.azlan90@yahoo.com', '0177479930', NULL, '900719016745', '596, Jalan Impiana 18, Taman Impiana, Kelapa Sawit 81030, Kulai, Johor\r\n', '596, Jalan Impiana 18, Taman Impiana, Kelapa Sawit 81030, Kulai, Johor', 'U89', NULL, '', '', '', 'HYKRFJ4KkecbATLH1Ebi.jpg', 'fwurGuyx6dGlehEBAQyf.jpg', 'Baru', NULL),
(6, 'z5f4ba', '2024-01-15', 'Nor Amirah Binti Tiammuddin', 'amira.tiammuddin@gmail.com', '0123456789', NULL, '830307114238', 'Lot 1234 Kampung Paya, 24000 Kemaman, Terengganu', 'Lot 1234 Kampung Paya, 24000 Kemaman, Terengganu', 'U89', NULL, NULL, '../uploaded_sign_c/830307114238-o0m7MVpFk7LTcef1RzgD.png', 'c8QVDuIx8CiRIuuaL2kv.png', 'uYMX44exPezgO1Q0pGvk.png', 'UXXjnqBtUHS4Ih0rKWz5.png', 'Baru', 'Cuba uji kemaskini'),
(7, 'z5f4ba', '2024-01-17', 'Iryanti Binti Mohammad Isa', 'yan.ian85@gmail.com', '01118727640', '', '850205015136', 'Lot 682A, Jln Lak Lok, Kampung Lok, 22000 Jerteh, Terengganu', 'Lot 682A, Jln Lak Lok, Kampung Lok, 22000 Jerteh, Terengganu', 'U89', '2024-01-19 17:00:00', NULL, '../uploaded_sign_c/850205015136-KJ8xX0Yyhr4i4hx9NU9H.png', 'Ov7lY2Im9r44GsVhZrvw.jpg', 'XTJxmwY8NDc6XtOrGB2t.jpg', 'H5MppO4VR9zI8mh2Dpq7.jpg', 'Baru', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `demand_list`
--
ALTER TABLE `demand_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders_list`
--
ALTER TABLE `orders_list`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `demand_list`
--
ALTER TABLE `demand_list`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders_list`
--
ALTER TABLE `orders_list`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
