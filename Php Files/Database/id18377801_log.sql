-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 24, 2022 at 06:42 AM
-- Server version: 10.5.16-MariaDB
-- PHP Version: 7.3.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id18377801_log`
--

-- --------------------------------------------------------

--
-- Table structure for table `AA`
--

CREATE TABLE `AA` (
  `id` int(255) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cartlast`
--

CREATE TABLE `cartlast` (
  `id` int(50) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `qty` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cartlast`
--

INSERT INTO `cartlast` (`id`, `name`, `price`, `qty`) VALUES
(1, 'mic', '50', '1'),
(2, 'led', '100', '3'),
(3, 'mouse', '5', '5'),
(4, 'keyboard', '10', '7');

-- --------------------------------------------------------

--
-- Table structure for table `customer_registration`
--

CREATE TABLE `customer_registration` (
  `id` int(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer_registration`
--

INSERT INTO `customer_registration` (`id`, `username`, `email`, `phone`, `password`) VALUES
(58, 'deepika', 'deepi@gmail.com', '9526843393', 'deepz'),
(60, 'ggh', 'ffgg@gmail.com', '8952369852', 't');

-- --------------------------------------------------------

--
-- Table structure for table `cust_cart_product`
--

CREATE TABLE `cust_cart_product` (
  `id` int(255) NOT NULL,
  `productid` varchar(255) NOT NULL,
  `product_qty` varchar(255) NOT NULL,
  `uid` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cust_cart_product`
--

INSERT INTO `cust_cart_product` (`id`, `productid`, `product_qty`, `uid`) VALUES
(238, '100', '1', '58'),
(239, '103', '5', ''),
(240, '101', '2', '58'),
(241, '102', '5', '58'),
(242, '104', '2', '58');

-- --------------------------------------------------------

--
-- Table structure for table `Hope_Admin_Registration`
--

CREATE TABLE `Hope_Admin_Registration` (
  `id` int(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Hope_Admin_Registration`
--

INSERT INTO `Hope_Admin_Registration` (`id`, `username`, `email`, `phone`, `password`) VALUES
(1, 'hope', 'hope@gmail.com', '8956231478', 'hope'),
(2, 'adminhope', 'g@gmail.com', '8529632356', 'vv');

-- --------------------------------------------------------

--
-- Table structure for table `Hope_User_Registration`
--

CREATE TABLE `Hope_User_Registration` (
  `id` int(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(255) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `login2`
--

CREATE TABLE `login2` (
  `id` int(255) NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `login2`
--

INSERT INTO `login2` (`id`, `email`, `password`) VALUES
(1, 'sanvi@gmail.com', 'sanvi');

-- --------------------------------------------------------

--
-- Table structure for table `merchant_add_product`
--

CREATE TABLE `merchant_add_product` (
  `id` int(255) NOT NULL,
  `productid` varchar(255) NOT NULL,
  `productname` varchar(255) NOT NULL,
  `productprice` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `stock` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `merchant_add_product`
--

INSERT INTO `merchant_add_product` (`id`, `productid`, `productname`, `productprice`, `image`, `stock`) VALUES
(198, '100', ' Shampoo ', '70', 'https://anthracitic-pecks.000webhostapp.com/scan_copy/Merchant/image_uploaded/image_picker4194974091571487974.jpg', '200'),
(200, '103', ' Lays ', '10', 'https://anthracitic-pecks.000webhostapp.com/scan_copy/Merchant/image_uploaded/image_picker8684951291057439233.jpg', '100'),
(201, '101', ' Note Book ', '50', 'https://anthracitic-pecks.000webhostapp.com/scan_copy/Merchant/image_uploaded/image_picker1141095624805125259.jpg', '200'),
(204, '102', ' Biscut ', '10', 'https://anthracitic-pecks.000webhostapp.com/scan_copy/Merchant/image_uploaded/image_picker5664061332707791337.jpg', '100'),
(205, '104', ' Hand Wash ', '70', 'https://anthracitic-pecks.000webhostapp.com/scan_copy/Merchant/image_uploaded/image_picker9014511477397623209.jpg', '200');

-- --------------------------------------------------------

--
-- Table structure for table `Merchant_Payment`
--

CREATE TABLE `Merchant_Payment` (
  `id` int(255) NOT NULL,
  `cust_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bank_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `amount` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `merchant_registration`
--

CREATE TABLE `merchant_registration` (
  `id` int(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `merchant_registration`
--

INSERT INTO `merchant_registration` (`id`, `username`, `email`, `phone`, `password`) VALUES
(48, 'abc', 'cc@gmail.com', '8956231478', 'cc');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` int(255) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `username`, `email`) VALUES
(1, 'fc', 'pp'),
(2, 'gg', 'fff'),
(3, 'feed', 'lpoo'),
(4, 'deepi', 'asdf'),
(5, 'ggh', 'tyyu'),
(6, 'xcxc', 'vccg'),
(7, 'gg', 'fg'),
(8, 'fg', 'vh'),
(9, 'yh', 'yu'),
(10, 'fc', 'pp'),
(11, 'gg', 'tt'),
(12, 'hh', 'cg');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(255) NOT NULL,
  `productid` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `productid`) VALUES
(28, '8902519002211'),
(29, '-1'),
(30, 'vhh'),
(31, 'hhh');

-- --------------------------------------------------------

--
-- Table structure for table `Reg`
--

CREATE TABLE `Reg` (
  `id` int(250) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Reg`
--

INSERT INTO `Reg` (`id`, `name`) VALUES
(48, 'nileswaram'),
(49, 'kannur'),
(50, 'kasaragod');

-- --------------------------------------------------------

--
-- Table structure for table `registered`
--

CREATE TABLE `registered` (
  `id` int(50) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `registered`
--

INSERT INTO `registered` (`id`, `username`, `email`, `phone`, `password`) VALUES
(10, 'deepika', 'deepika@gmail.com', '9586235836', 'deepi'),
(11, 'sanvi', 'sanu@gmail.com', '9856231478', 'cv'),
(12, 'umesh', 'um@gmail.com', '9874563215', 'gg'),
(33, 'fghh', 'f@gmail.com', '8956231478', 'cv'),
(34, 'jj', 'f@gmail.com', '9632587412', 'vb'),
(35, 'kk', 'h@gmail.com', '9632587412', 'vb'),
(36, 'ig', 'u@gmail.com', '3698521478', 'e'),
(37, 'hjkkk', 'h@gmail.com', '2583698745', 'pp'),
(38, 'cg', 'fg', '55', 'gg'),
(39, 'hhu', 'vhh', '553', 'cvg'),
(40, 'bbh', 'hh', '66', 'hh'),
(41, 'a', 'c', 'v', 'g');

-- --------------------------------------------------------

--
-- Table structure for table `student_list`
--

CREATE TABLE `student_list` (
  `id` int(30) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `class` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rollno` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `student_list`
--

INSERT INTO `student_list` (`id`, `name`, `address`, `class`, `rollno`) VALUES
(3, 'dll', 'nlswr', 'wew', 'qww'),
(4, 'dll', 'nlswr', 'wew', 'qww'),
(5, 'dll', 'nlswr', 'wew', 'qww'),
(6, 'dll', 'nlswr', 'wew', 'qww'),
(7, 'dll', 'nlswrjj', 'wew', 'qww'),
(8, 'fff', 'll', 'mm', 'oo');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(255) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_reg`
--

CREATE TABLE `user_reg` (
  `id` int(255) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_reg`
--

INSERT INTO `user_reg` (`id`, `name`, `email`, `password`) VALUES
(1, '', '', ''),
(2, '', '', ''),
(3, '', '', ''),
(4, '', '', ''),
(5, '', '', ''),
(6, '', '', ''),
(7, '', '', ''),
(8, '', '', ''),
(9, '', '', ''),
(10, '', '', ''),
(11, '', '', ''),
(12, '', '', ''),
(13, '', '', ''),
(14, '', '', ''),
(15, '', '', ''),
(16, '', '', ''),
(17, '', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `AA`
--
ALTER TABLE `AA`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cartlast`
--
ALTER TABLE `cartlast`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_registration`
--
ALTER TABLE `customer_registration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cust_cart_product`
--
ALTER TABLE `cust_cart_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Hope_Admin_Registration`
--
ALTER TABLE `Hope_Admin_Registration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Hope_User_Registration`
--
ALTER TABLE `Hope_User_Registration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login2`
--
ALTER TABLE `login2`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `merchant_add_product`
--
ALTER TABLE `merchant_add_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Merchant_Payment`
--
ALTER TABLE `Merchant_Payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `merchant_registration`
--
ALTER TABLE `merchant_registration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Reg`
--
ALTER TABLE `Reg`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `registered`
--
ALTER TABLE `registered`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_list`
--
ALTER TABLE `student_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_reg`
--
ALTER TABLE `user_reg`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `AA`
--
ALTER TABLE `AA`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cartlast`
--
ALTER TABLE `cartlast`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customer_registration`
--
ALTER TABLE `customer_registration`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `cust_cart_product`
--
ALTER TABLE `cust_cart_product`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=243;

--
-- AUTO_INCREMENT for table `Hope_Admin_Registration`
--
ALTER TABLE `Hope_Admin_Registration`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Hope_User_Registration`
--
ALTER TABLE `Hope_User_Registration`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login2`
--
ALTER TABLE `login2`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `merchant_add_product`
--
ALTER TABLE `merchant_add_product`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=206;

--
-- AUTO_INCREMENT for table `Merchant_Payment`
--
ALTER TABLE `Merchant_Payment`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `merchant_registration`
--
ALTER TABLE `merchant_registration`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `Reg`
--
ALTER TABLE `Reg`
  MODIFY `id` int(250) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `registered`
--
ALTER TABLE `registered`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `student_list`
--
ALTER TABLE `student_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_reg`
--
ALTER TABLE `user_reg`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
