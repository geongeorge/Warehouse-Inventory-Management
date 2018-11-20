-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 20, 2018 at 07:23 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.1.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `warehouse`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`) VALUES
(1, 'admin', '$2a$10$I3qKkNLEUGVIqbGCNyydSOovA5t.0385z7.BQI2vc8IuHms1U3dgi');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `username`, `password`) VALUES
(2, 'john', '$2b$10$78ua3oOo3z2OBb/RGidoJ.bi/mtrt4.Q0esk3FlLsLpjsXYLJFyKy'),
(3, 'athulya', '$2a$10$WtfOkNJmJyVKiuVzcJ1Lt.kM8r6YUHpqfISEfFaIniSFEMP/3GBzK');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'ordered'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `date`, `pid`, `uid`, `qty`, `status`) VALUES
(2, '2018-11-20 10:19:46', 1, 2, 4, 'delivered'),
(3, '2018-11-20 10:26:46', 2, 2, 2, 'delivered'),
(4, '2018-11-20 12:41:08', 2, 2, 20, 'ordered'),
(5, '2018-11-20 12:47:07', 2, 2, 12, 'delivered'),
(6, '2018-11-20 12:52:18', 1, 2, 3, 'ordered'),
(7, '2018-11-20 13:03:51', 2, 3, 4, 'ordered');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(1000) NOT NULL,
  `descr` text NOT NULL,
  `price` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `picture` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `descr`, `price`, `stock`, `picture`) VALUES
(1, 'All Natural Soap', 'Cleanse, moisturize and soothe your skin with all natural handmade soap made with organic oils and plant butters, pure essential oils, organic herbs, and spices. ', 126, 34, 'afc7eae2c9b20daad05728da662f3c65.jpg'),
(2, 'Unscented Baby Powder', 'An organic baby powder for delicate skin formulated with finely milled vegetable root powders, skin soothing botanicals and silky clay that work together to absorb moisture.', 520, 46, 'organic_natural_baby_skin_care_products-16.jpg'),
(4, 'Lip Balm: Healing Herbs', 'An organic lip balm made with soothing oils and botanicals that moisturize and help promote healing.', 560, 45, 'c335c6e65ac8c9327bf5bd023e38a3b1.jpg'),
(5, 'Deodorant: Coconut Cream', 'An organic cream deodorant made with soothing ingredients that effectively neutralize odor and plant-based powders that help absorb wetness, so you stay fresh naturally.', 122, 23, '40e14cf92b6d21976908d25fa136ccbf.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
