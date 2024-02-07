-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 05, 2024 at 04:41 AM
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
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(2) NOT NULL,
  `code_category` char(5) NOT NULL,
  `name_category` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `code_category`, `name_category`) VALUES
(1, 'HIP+N', 'Home Internet Plans + Netflix'),
(2, 'HIP', 'Home Internet Plans'),
(3, 'HIP@P', 'Home Internet Plans Promo');

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
  `pid` varchar(255) NOT NULL,
  `tarikhWaktu` datetime DEFAULT NULL,
  `signa_s` varchar(255) NOT NULL,
  `signa_c` varchar(255) NOT NULL,
  `imgBill` varchar(255) NOT NULL,
  `imgKpD` varchar(255) NOT NULL,
  `imgKpB` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'Baru',
  `catatan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `demand_list`
--

INSERT INTO `demand_list` (`id`, `unique_id`, `tarikh`, `nama`, `email`, `phoneno`, `phonenoTambahan`, `nokp`, `alamatPemasangan`, `alamatBill`, `pid`, `tarikhWaktu`, `signa_s`, `signa_c`, `imgBill`, `imgKpD`, `imgKpB`, `status`, `catatan`) VALUES
(1, 'z5f4ba', '2024-01-17', 'Wan Muhammad Izzat', '', '0184674760', '', '', 'No 915 jalan 3/21 residen 3 bandar baru setia awan perdana 32000 Sitiawan, Perak', 'No 915 jalan 3/21 residen 3 bandar baru setia awan perdana 32000 Sitiawan, Perak', '3', '0000-00-00 00:00:00', '', '../uploaded_sign_c/-ghAmmhZRd4iAqW3eTnp4.png', '', '', '', 'Baru', NULL),
(2, 'z5f4ba', '2024-01-17', 'Che Muhamad Nurhafizi Bin Che Malek ', '', '0142478723', '', '', '166/4 residen 3 bandar baru setiawan 32000 setiawan,perak', '166/4 residen 3 bandar baru setiawan 32000 setiawan,perak', '3', '0000-00-00 00:00:00', '', '../uploaded_sign_c/-oM3Nbt1nIpSQPqvWnnHF.png', '', '', '', 'Baru', NULL),
(3, 'z5f4ba', '2024-01-17', 'Mohamad Hafiz Bin Md Noor', '', '0149451178', '', '', 'No 70, jalan Residen 3/2, Residen 3, Bandar Baru Setia Awan Perdana, 32000 Sitiawan, Perak', 'No 70, jalan Residen 3/2, Residen 3, Bandar Baru Setia Awan Perdana, 32000 Sitiawan, Perak', '3', '0000-00-00 00:00:00', '', '../uploaded_sign_c/-IuBM4ZMaKnJQF4kq5kwA.png', '', '', '', 'Baru', NULL),
(4, 'z5f4ba', '2024-01-17', 'Siti Munira', '', '01160767768', '', '', 'No. 612, jln residen 3/16, residen 3, bandar baru setia awan perdana, 32000 sitiawan, perak.', 'No. 612, jln residen 3/16, residen 3, bandar baru setia awan perdana, 32000 sitiawan, perak.', '3', '0000-00-00 00:00:00', '', '../uploaded_sign_c/-rJ9JP2B3LuU9OgQKjDqC.png', '', '', '', 'Baru', NULL),
(5, 'z5f4ba', '2024-01-17', 'Shahreza Huzaifah Bin Abdullah', '', '0194173800', '', '', 'Lot 107, Jalan Residen 3/2, Residen 3, Bandar Baru Setia Awan Perdana, 32000 Sitiawan, Perak.', 'Lot 107, Jalan Residen 3/2, Residen 3, Bandar Baru Setia Awan Perdana, 32000 Sitiawan, Perak.', '3', '0000-00-00 00:00:00', '', '../uploaded_sign_c/-w7xZC4DxkGLoQ3Zqp4dk.png', '', '', '', 'Baru', NULL),
(6, 'z5f4ba', '2024-01-17', 'Mohd Kamarol Ariffin Bin Kamarolzaman', '', '601116004821', '', '', 'No 903, jalan residen 3/21, residen 3 bandar baru setia awan perdana 32000 sitiawan perak darul ridzuan', 'No 903, jalan residen 3/21, residen 3 bandar baru setia awan perdana 32000 sitiawan perak darul ridzuan', '3', '0000-00-00 00:00:00', '', '../uploaded_sign_c/-RZ0dl7OU520KtxBVMPMm.png', '', '', '', 'Baru', NULL),
(7, 'z5f4ba', '2024-01-17', 'Muhammad shahidan bin zolkepli', '', '0123284012', '', '', 'No 99 jalan residen 4/2 residen 4', 'No 99 jalan residen 4/2 residen 4', '3', '0000-00-00 00:00:00', '', '../uploaded_sign_c/-CibMNgwHUDnzP4cyKx83.png', '', '', '', 'Baru', NULL),
(8, 'z5f4ba', '2024-01-17', 'Muhammad Syafiq bin mat isa', '', '0175452724', '', '', 'No 575, jalan residen 4/11 residen 4 bandar baru setia awan perdana 32000 sitiawan perak', 'No 575, jalan residen 4/11 residen 4 bandar baru setia awan perdana 32000 sitiawan perak', '3', '0000-00-00 00:00:00', '', '../uploaded_sign_c/-DwmkbEnAekLvpowwdunD.png', '', '', '', 'Baru', NULL),
(9, 'z5f4ba', '2024-01-17', 'Md Khairul Khadi bin Mohd Ayub Khan', '', '0166146504', '', '', 'No 174 Jalan 4/3, Bandar Baru Setiawan Perdana, 32000 Setiawan, Perak', 'No 174 Jalan 4/3, Bandar Baru Setiawan Perdana, 32000 Setiawan, Perak', '3', '0000-00-00 00:00:00', '', '../uploaded_sign_c/-ikbELSjuzWlcsQqp2b0e.png', '', '', '', 'Baru', NULL),
(10, 'z5f4ba', '2024-01-17', 'Kamarul Azuan bin Hashim ', '', '60163065381', '', '', '1107, Jalan 4/6', '1107, Jalan 4/6', '3', '0000-00-00 00:00:00', '', '../uploaded_sign_c/-2Vrz7CEUuPYUaquO0QYE.png', '', '', '', 'Baru', NULL),
(11, 'z5f4ba', '2024-01-17', 'Mohd Asrul Bustami Ismail', '', '0132777562', '', '', '863 Jln Residen 4/14 Residen 4 \r\nBandar Baru Setiawan Perdana\r\n32000 Sitiawan\r\nPerak.', '863 Jln Residen 4/14 Residen 4 \r\nBandar Baru Setiawan Perdana\r\n32000 Sitiawan\r\nPerak.', '3', '0000-00-00 00:00:00', '', '../uploaded_sign_c/-6TjMwRtNneMr3LWzjk8u.png', '', '', '', 'Baru', NULL),
(12, 'vIyuI8', '2024-01-28', 'Mohamad Hazizie bin Juha Seman', 'hazizie@gmail.com', '01133757803', '', '', 'No 946, Jalan Residen 4/14, 32000 Sitiawan Perak', 'No 946, Jalan Residen 4/14, 32000 Sitiawan Perak', '3', '0000-00-00 00:00:00', '', '', '', '', '', 'Baru', NULL);

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
  `pid` varchar(255) NOT NULL,
  `tarikhWaktu` datetime DEFAULT NULL,
  `signa_s` varchar(255) DEFAULT NULL,
  `signa_c` varchar(255) NOT NULL,
  `imgBill` varchar(255) NOT NULL,
  `imgKpD` varchar(255) NOT NULL,
  `imgKpB` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'Baru',
  `referCode` varchar(6) DEFAULT NULL,
  `catatan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders_list`
--

INSERT INTO `orders_list` (`id`, `unique_id`, `tarikh`, `nama`, `email`, `phoneno`, `phonenoTambahan`, `nokp`, `alamatPemasangan`, `alamatBill`, `pid`, `tarikhWaktu`, `signa_s`, `signa_c`, `imgBill`, `imgKpD`, `imgKpB`, `status`, `referCode`, `catatan`) VALUES
(1, 'z5f4ba', '2024-01-11', 'Muhamad Sahir Syahmi Bin Muhamad Radzi', 'sahir.radzi@gmail.com', '123456789', NULL, '2147483647', 'No 7, Fasa 3, Seri Manjung Perak', 'No 7, Fasa 3, Seri Manjung Perak', '3', NULL, '', '', '', '', '', 'Baru', NULL, NULL),
(2, 'z5f4ba', '2024-01-11', 'Shah Test ', 'shahtest@gmail.com', '0198765431', NULL, '931104086159', 'NO 7, Seri Manjung', 'NO 7, Seri Manjung', '3', NULL, '', '', '', '', '', 'Baru', NULL, NULL),
(3, 'z5f4ba', '2024-01-11', 'Sahir Ezy Diy', 'sahir.ezydiy@gmail.com', '01133165639', NULL, '931104086159', 'NO 70, Perak', 'NO 70, Perak', '2', NULL, '', '', 'bill_01.jpg', 'ic_depan.jpg', 'ic_belakang.jpg', 'Baru', NULL, NULL),
(4, 'vIyuI8', '2024-01-12', 'Muhamad Fairul Azrul Bin Shahini', 'fairulazrul6@gmail.com', '01140738173', NULL, '950503085501', 'No 352, Jalan Seri Wangsa, 3/1 Taman Seri Wangsa 2, 32040 Seri Manjung, Perak', 'No 352, Jalan Seri Wangsa, 3/1 Taman Seri Wangsa 2, 32040 Seri Manjung, Perak', '3', NULL, '', '', 'Screenshot 2024-01-12 172501.png', 'Screenshot 2024-01-12 172439.png', 'Screenshot 2024-01-12 172448.png', 'Baru', NULL, NULL),
(5, 'vIyuI8', '2024-01-14', 'Norazlan bin shaharudin', 'yem.azlan90@yahoo.com', '0177479930', NULL, '900719016745', '596, Jalan Impiana 18, Taman Impiana, Kelapa Sawit 81030, Kulai, Johor\r\n', '596, Jalan Impiana 18, Taman Impiana, Kelapa Sawit 81030, Kulai, Johor', '3', NULL, '', '', '', 'HYKRFJ4KkecbATLH1Ebi.jpg', 'fwurGuyx6dGlehEBAQyf.jpg', 'Baru', NULL, NULL),
(6, 'z5f4ba', '2024-01-15', 'Nor Amirah Binti Tiammuddin', 'amira.tiammuddin@gmail.com', '0123456789', NULL, '830307114238', 'Lot 1234 Kampung Paya, 24000 Kemaman, Terengganu', 'Lot 1234 Kampung Paya, 24000 Kemaman, Terengganu', '3', NULL, NULL, '../uploaded_sign_c/830307114238-o0m7MVpFk7LTcef1RzgD.png', 'c8QVDuIx8CiRIuuaL2kv.png', 'uYMX44exPezgO1Q0pGvk.png', 'UXXjnqBtUHS4Ih0rKWz5.png', 'Baru', NULL, 'Cuba uji kemaskini'),
(7, 'z5f4ba', '2024-01-17', 'Iryanti Binti Mohammad Isa', 'yan.ian85@gmail.com', '01118727640', '', '850205015136', 'Lot 682A, Jln Lak Lok, Kampung Lok, 22000 Jerteh, Terengganu', 'Lot 682A, Jln Lak Lok, Kampung Lok, 22000 Jerteh, Terengganu', '3', '2024-01-19 17:00:00', NULL, '../uploaded_sign_c/850205015136-KJ8xX0Yyhr4i4hx9NU9H.png', 'Ov7lY2Im9r44GsVhZrvw.jpg', 'XTJxmwY8NDc6XtOrGB2t.jpg', 'H5MppO4VR9zI8mh2Dpq7.jpg', 'Baru', NULL, ''),
(8, 'Ggwtxm', '2024-02-01', 'Mohd Asrul Bustami Ismail', 'mohdasrul@gmail.com', '012345789', '0123456789', '910312082144', 'Seri Manjung, Perak', 'Seri Manjung, Perak', '2', '2024-02-02 17:00:00', NULL, '', '', '', '', 'Baru', NULL, NULL),
(9, 'aWppdJ', '2024-02-04', 'Mohamad Hazizie bin Juha Seman', 'hazizie@gmail.com', '01133757803', '0123456789', '991109086166', 'No 946,JLN RESIDEN 4/14,BBSAP', 'No 946,JLN RESIDEN 4/14,BBSAP', '3', '2024-02-10 16:00:00', NULL, '', 'K0WsTXDZ71INylVkWPuS.jpg', 'iY5US2CXIpbV2pi312uv.jpg', 'SzD2wMWFf9cKw6YuYmNa.jpg', 'Proses', '665658', NULL),
(10, 'aWppdJ', '2024-02-04', 'Nor shaza binti ramli', '', '60176461504', '', '', 'No,259,jln residen,residen 4 bandar baru sitiawan perdana\r\n32000 sitiawan,\r\nPerak.', 'No,259,jln residen,residen 4 bandar baru sitiawan perdana\r\n32000 sitiawan,\r\nPerak.', '3', '0000-00-00 00:00:00', NULL, '', 'FC00zUCss00YgwOVNvW4.jpg', 'USG9mBrrLxUGec55StLM.jpg', '9w2KKKnoJC6BIuWF961z.jpg', 'Proses', '665658', NULL),
(11, 'aWppdJ', '2024-02-04', 'muhammad izhar bin ibrahim', '', '0172738781', '', '', 'No 988, jalan resident 4/15\r\nresident 4, bandar baru setia awan perdana', 'No 988, jalan resident 4/15\r\nresident 4, bandar baru setia awan perdana', '3', '0000-00-00 00:00:00', NULL, '', '4qEurwvk9NOQ7EsT8CQN.jpg', 'HS5Z8uQ737krWNjsTtgZ.jpg', 'ldR5weYp7HIT4iKQgGht.jpg', 'Baru', NULL, NULL),
(12, 'aWppdJ', '2024-02-04', 'Muhammad Amzar Bin Nor Rham', '', '01110951553', '', '', 'No 1289, Jalan residen 4/16, Residen 4 Bandar Baru Setiawan Perdana, 32000, Sitiawan, Perak', 'No 1289, Jalan residen 4/16, Residen 4 Bandar Baru Setiawan Perdana, 32000, Sitiawan, Perak', '3', '0000-00-00 00:00:00', NULL, '', 'blS9PeVB36tkkJy4okoE.jpg', 'Pea1BvxKBw1qNe7pCEGt.jpg', 'p9StNAyRBeOlmkgAOrzt.jpg', 'Baru', NULL, NULL),
(13, 'aWppdJ', '2024-02-04', 'MOHAMAD SYAFIQ BIN SAIDI', '', '01119301610', '', '', 'RESIDEN 4 BANDAR BARU SETIA AWAN PERDANA 32000 SITIAWAN PERAK', 'RESIDEN 4 BANDAR BARU SETIA AWAN PERDANA 32000 SITIAWAN PERAK', '3', '2024-02-11 18:00:00', NULL, '', 'OC2Oukq4YjHqRlz2h9G7.jpg', 'sQq3biHv7oWwUZoYt1BK.jpg', 'WPjapHYarJKLvsfzZMrI.jpg', 'Proses', '665658', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `s_name` varchar(5) NOT NULL,
  `category` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(100) NOT NULL,
  `komisen` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `s_name`, `category`, `price`, `image`, `komisen`) VALUES
(1, 'Unifi Home 100Mbps RM 99 Bulanan', 'U100', 'Home Internet Plans', '99.00', 'Screenshot 2024-01-28 112759.png', '100.00'),
(2, 'Unifi + Netflix 100Mbps RM 117 Bulanan', 'UN100', 'Home Internet Plans + Netflix', '117.00', 'Screenshot 2024-01-28 122137.png', '100.00'),
(3, 'Unifi Home 100Mbps (P) RM 89 Bulanan', 'U100P', 'Home Internet Plans Promo', '89.00', 'Screenshot 2024-01-28 150812.png', '100.00'),
(4, 'Unifi Home 500Mbps RM 159 Bulanan', 'U159', 'Home Internet Plans', '159.00', 'Screenshot 2024-01-28 152425.png', '100.00');

-- --------------------------------------------------------

--
-- Table structure for table `report_affiliate`
--

CREATE TABLE `report_affiliate` (
  `referral_code` varchar(6) NOT NULL,
  `komisen_masuk` decimal(10,2) DEFAULT NULL,
  `tarikh` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(255) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `report_affiliate`
--

INSERT INTO `report_affiliate` (`referral_code`, `komisen_masuk`, `tarikh`, `status`) VALUES
('665658', '100.00', '2024-02-04 14:24:04', 'pending'),
('665658', '100.00', '2024-02-04 14:59:13', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(5) NOT NULL,
  `unique_id` varchar(6) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `number` varchar(12) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `otp` int(6) NOT NULL,
  `verification_status` varchar(50) NOT NULL,
  `referral_code` varchar(6) DEFAULT NULL,
  `refer_code` varchar(6) DEFAULT NULL,
  `click` int(255) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `unique_id`, `nama`, `number`, `email`, `password`, `otp`, `verification_status`, `referral_code`, `refer_code`, `click`) VALUES
(1, 'Ggwtxm', 'Sahir Syahmi', '0123456789', 'muhamadsahirsyahmi93@gmail.com', '8aefb06c426e07a0a671a1e2488b4858d694a730', 0, 'verified', '665658', '0', 9),
(2, '5CTah0', 'Si Ads', '0198765432', 'info8si.ads@gmail.com', '8aefb06c426e07a0a671a1e2488b4858d694a730', 0, 'verified', 'D340DC', '665658', 2),
(3, 'AlcByD', 'Ama Maliq', '0123456789', 'amamaliq@gmail.com', '8aefb06c426e07a0a671a1e2488b4858d694a730', 0, 'verified', '5D4E0B', '0', 0),
(4, 'jEdP1X', 'Info Rege', '0123456789', 'info8rege@gmail.com', '8aefb06c426e07a0a671a1e2488b4858d694a730', 0, 'verified', '18B8B9', '0', 0),
(5, 'aWppdJ', 'aminah', '0123456789', 'aminah.ezydiy@gmail.com', '8aefb06c426e07a0a671a1e2488b4858d694a730', 0, 'verified', '3A53FE', '665658', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_bank`
--

CREATE TABLE `user_bank` (
  `id` int(5) NOT NULL,
  `unique_id` varchar(6) NOT NULL,
  `nama_penuh` varchar(255) DEFAULT NULL,
  `no_acc` int(255) DEFAULT NULL,
  `nama_bank` varchar(255) DEFAULT NULL,
  `komisen_keluar` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_bank`
--

INSERT INTO `user_bank` (`id`, `unique_id`, `nama_penuh`, `no_acc`, `nama_bank`, `komisen_keluar`) VALUES
(1, 'Ggwtxm', NULL, NULL, NULL, NULL),
(2, '5CTah0', NULL, NULL, NULL, NULL),
(3, 'AlcByD', NULL, NULL, NULL, NULL),
(4, 'jEdP1X', NULL, NULL, NULL, NULL),
(5, 'aWppdJ', NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
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
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_bank`
--
ALTER TABLE `user_bank`
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
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `demand_list`
--
ALTER TABLE `demand_list`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders_list`
--
ALTER TABLE `orders_list`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_bank`
--
ALTER TABLE `user_bank`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
rwo_dbrwo_dbrwo_db