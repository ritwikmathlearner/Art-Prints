-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 12, 2019 at 07:31 AM
-- Server version: 10.1.39-MariaDB
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `artprints`
--
CREATE DATABASE IF NOT EXISTS `artprints` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `artprints`;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderID` int(11) NOT NULL,
  `customer` varchar(200) NOT NULL,
  `cost` decimal(12,2) DEFAULT NULL,
  `totalAmount` decimal(12,2) DEFAULT NULL,
  `orderDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderID`, `customer`, `cost`, `totalAmount`, `orderDate`) VALUES
(1, 'ritwikmath@gmail.com', '17.90', '18.80', '2019-07-11'),
(2, 'student@abc.com', '6.95', '7.30', '2019-07-12');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `productID` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `artist` varchar(200) NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(200) NOT NULL,
  `alias` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`productID`, `name`, `artist`, `price`, `description`, `image`, `alias`) VALUES
(1, 'Little Frida', 'treechild', '5.95', 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Non, similique! Aliquid, sequi nesciunt? Atque at eaque delectus saepe ad explicabo dolor deleniti consequuntur excepturi similique necessitatibus quibusdam dignissimos est id quas nobis ab nemo dolores cumque laboriosam, magni perspiciatis architecto quis. Minima corporis unde distinctio numquam itaque veritatis eius reiciendis.', 'product2.jpg', 'featured'),
(2, 'Frida Kahlo', 'treechild', '6.95', 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Non, similique! Aliquid, sequi nesciunt? Atque at eaque delectus saepe ad explicabo dolor deleniti consequuntur excepturi similique necessitatibus quibusdam dignissimos est id quas nobis ab nemo dolores cumque laboriosam, magni perspiciatis architecto quis. Minima corporis unde distinctio numquam itaque veritatis eius reiciendis.', 'product1.jpg', 'featured'),
(3, 'Little Van Gogh', 'Ninasilla', '13.00', 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Non, similique! Aliquid, sequi nesciunt? Atque at eaque delectus saepe ad explicabo dolor deleniti consequuntur excepturi similique necessitatibus quibusdam dignissimos est id quas nobis ab nemo dolores cumque laboriosam, magni perspiciatis architecto quis. Minima corporis unde distinctio numquam itaque veritatis eius reiciendis.', 'product3.jpg', 'new'),
(4, 'It\'s Called Pikapika', 'Victoria Verbaan', '1.35', 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Non, similique! Aliquid, sequi nesciunt? Atque at eaque delectus saepe ad explicabo dolor deleniti consequuntur excepturi similique necessitatibus quibusdam dignissimos est id quas nobis ab nemo dolores cumque laboriosam, magni perspiciatis architecto quis. Minima corporis unde distinctio numquam itaque veritatis eius reiciendis.', 'product4.jpg', NULL),
(5, 'Beach Love', 'Ingrid Beddoes', '11.95', 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Non, similique! Aliquid, sequi nesciunt? Atque at eaque delectus saepe ad explicabo dolor deleniti consequuntur excepturi similique necessitatibus quibusdam dignissimos est id quas nobis ab nemo dolores cumque laboriosam, magni perspiciatis architecto quis. Minima corporis unde distinctio numquam itaque veritatis eius reiciendis.', 'product5.jpg', 'featured'),
(6, 'Seagulls', 'Laura Palm', '4.65', 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Non, similique! Aliquid, sequi nesciunt? Atque at eaque delectus saepe ad explicabo dolor deleniti consequuntur excepturi similique necessitatibus quibusdam dignissimos est id quas nobis ab nemo dolores cumque laboriosam, magni perspiciatis architecto quis. Minima corporis unde distinctio numquam itaque veritatis eius reiciendis.', 'product6.jpg', NULL),
(7, 'Oh, Audrey', 'Ruben Ireland', '8.95', 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Non, similique! Aliquid, sequi nesciunt? Atque at eaque delectus saepe ad explicabo dolor deleniti consequuntur excepturi similique necessitatibus quibusdam dignissimos est id quas nobis ab nemo dolores cumque laboriosam, magni perspiciatis architecto quis. Minima corporis unde distinctio numquam itaque veritatis eius reiciendis.', 'product7.jpg', 'new'),
(8, 'Dance with Me', 'Victoria Verbaan', '5.95', 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Non, similique! Aliquid, sequi nesciunt? Atque at eaque delectus saepe ad explicabo dolor deleniti consequuntur excepturi similique necessitatibus quibusdam dignissimos est id quas nobis ab nemo dolores cumque laboriosam, magni perspiciatis architecto quis. Minima corporis unde distinctio numquam itaque veritatis eius reiciendis.', 'product8.jpg', NULL),
(9, 'Little Owl', 'Amy Hamilton', '3.95', 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Non, similique! Aliquid, sequi nesciunt? Atque at eaque delectus saepe ad explicabo dolor deleniti consequuntur excepturi similique necessitatibus quibusdam dignissimos est id quas nobis ab nemo dolores cumque laboriosam, magni perspiciatis architecto quis. Minima corporis unde distinctio numquam itaque veritatis eius reiciendis.', 'product9.jpg', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `productordered`
--

CREATE TABLE `productordered` (
  `orderID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `qnatity` int(11) NOT NULL,
  `cost` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `productordered`
--

INSERT INTO `productordered` (`orderID`, `productID`, `qnatity`, `cost`) VALUES
(1, 7, 2, '17.90'),
(2, 2, 1, '6.95');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `email` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `userType` varchar(200) DEFAULT 'customer'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`email`, `name`, `password`, `userType`) VALUES
('ritwikmath@gmail.com', 'Ritwik Math', '123', 'customer'),
('student@abc.com', 'Student', '1234', 'customer');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderID`),
  ADD KEY `customer` (`customer`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`productID`);

--
-- Indexes for table `productordered`
--
ALTER TABLE `productordered`
  ADD PRIMARY KEY (`orderID`,`productID`),
  ADD KEY `productID` (`productID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`email`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer`) REFERENCES `user` (`email`);

--
-- Constraints for table `productordered`
--
ALTER TABLE `productordered`
  ADD CONSTRAINT `productordered_ibfk_1` FOREIGN KEY (`orderID`) REFERENCES `orders` (`orderID`),
  ADD CONSTRAINT `productordered_ibfk_2` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
