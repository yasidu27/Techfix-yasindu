-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 08, 2025 at 10:19 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tech_fix_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `categoryId` int(11) NOT NULL,
  `categoryName` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryId`, `categoryName`) VALUES
(1, 'Processors'),
(2, 'Graphics Cards'),
(3, 'Memory (RAM)'),
(4, 'Storage (SSD)'),
(5, 'Power Supplies'),
(6, 'Cooling Solutions'),
(7, 'Motherboards'),
(8, 'Monitors'),
(9, 'Keyboards & Mice'),
(10, 'Networking Equipment'),
(11, 'Hard Disk Drive(HDD)'),
(12, 'CCTV');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `productId` int(11) NOT NULL,
  `productName` varchar(100) NOT NULL,
  `productPrice` decimal(10,2) NOT NULL,
  `productImage` varchar(100) DEFAULT NULL,
  `category` int(11) NOT NULL,
  `supplier` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`productId`, `productName`, `productPrice`, `productImage`, `category`, `supplier`) VALUES
(1, 'Intel Core i9-13900K', 599.99, 'download.jpeg', 1, 1),
(2, 'AMD Ryzen 9 7950X', 549.99, 'download.jpeg', 1, 2),
(3, 'Nvidia RTX 4090', 1599.99, 'download.jpeg', 2, 3),
(4, 'Kingston Fury 32GB DDR5', 149.99, 'download.jpeg', 3, 4),
(5, 'Samsung 980 PRO 1TB SSD', 129.99, 'download.jpeg', 4, 8),
(6, 'Corsair RM850x Power Supply', 139.99, 'download.jpeg', 5, 5),
(7, 'Noctua NH-D15 CPU Cooler', 99.99, 'download.jpeg', 6, 5),
(8, 'Asus ROG Strix X670E Motherboard', 399.99, 'download.jpeg', 7, 6),
(9, 'LG UltraGear 27\" Gaming Monitor', 299.99, 'download.jpeg', 8, 7),
(10, 'Logitech G Pro X Mechanical Keyboard', 129.99, 'download.jpeg', 9, 9),
(11, 'TP-Link Archer AX6000 Router', 199.99, 'download.jpeg', 10, 10),
(12, 'Intel i7-11700K', 45000.00, 'download.jpeg', 1, 1),
(13, 'Nvidia GTX1090', 15000.00, 'download.jpeg', 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `purches_request`
--

CREATE TABLE `purches_request` (
  `purcheseId` int(11) NOT NULL,
  `requestId` int(11) NOT NULL,
  `purcheseQty` int(11) NOT NULL,
  `purcheseAt` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `purches_request`
--

INSERT INTO `purches_request` (`purcheseId`, `requestId`, `purcheseQty`, `purcheseAt`) VALUES
(1, 2, 20, '2025-03-07 01:16:44');

-- --------------------------------------------------------

--
-- Table structure for table `request_product`
--

CREATE TABLE `request_product` (
  `requestID` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `requestQty` int(11) DEFAULT NULL,
  `requestDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `request_product`
--

INSERT INTO `request_product` (`requestID`, `productId`, `requestQty`, `requestDate`) VALUES
(1, 2, 20, '2025-03-05 21:01:41'),
(2, 1, 100, '2025-03-05 21:02:44'),
(3, 2, 100, '2025-03-08 03:06:55'),
(4, 13, 20, '2025-03-08 03:08:19');

-- --------------------------------------------------------

--
-- Table structure for table `sale`
--

CREATE TABLE `sale` (
  `saleId` int(11) NOT NULL,
  `customerName` varchar(100) NOT NULL,
  `saleAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sale`
--

INSERT INTO `sale` (`saleId`, `customerName`, `saleAt`) VALUES
(1, 'Cash', '2025-03-07 01:56:45'),
(2, 'Cash', '2025-03-07 01:57:35'),
(3, 'Cash', '2025-03-08 01:29:50');

-- --------------------------------------------------------

--
-- Table structure for table `sale_product`
--

CREATE TABLE `sale_product` (
  `saleProductId` int(11) NOT NULL,
  `saleId` int(11) NOT NULL,
  `product` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sale_product`
--

INSERT INTO `sale_product` (`saleProductId`, `saleId`, `product`, `qty`) VALUES
(1, 2, 2, 1),
(2, 2, 3, 1),
(3, 2, 7, 1),
(4, 3, 12, 5);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `supplierId` int(11) NOT NULL,
  `supplierName` varchar(45) NOT NULL,
  `supplierAddress` varchar(200) DEFAULT NULL,
  `supplierEmail` varchar(200) NOT NULL,
  `supplierMobile` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`supplierId`, `supplierName`, `supplierAddress`, `supplierEmail`, `supplierMobile`) VALUES
(1, 'Intel', '123 Tech Street, USA', 'contact@intel.com', '+11234567890'),
(2, 'AMD', '456 Chip Ave, USA', 'support@amd.com', '+19876543210'),
(3, 'Nvidia', '789 GPU Lane, USA', 'help@nvidia.com', '+12123456789'),
(4, 'Kingston', '101 Memory Blvd, USA', 'sales@kingston.com', '+13456789012'),
(5, 'Corsair', '202 Cooling Rd, USA', 'info@corsair.com', '+14567890123'),
(6, 'Asus', '303 Motherboard St, Taiwan', 'contact@asus.com', '+15678901234'),
(7, 'MSI', '404 Gaming Rd, Taiwan', 'support@msi.com', '+16789012345'),
(8, 'Samsung', '505 SSD St, South Korea', 'sales@samsung.com', '+17890123456'),
(9, 'Logitech', '606 Peripheral Rd, Switzerland', 'support@logitech.com', '+18901234567'),
(10, 'TP-Link', '707 Network Blvd, China', 'info@tp-link.com', '+19012345678'),
(11, 'Ryzen', NULL, 'info@ryzen,com', '+15768889439'),
(12, 'ZTE', NULL, 'info@ZTE.com', '+95332224239'),
(13, 'Huwaeri', NULL, 'info@huwaeri.com', '+473298472942');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryId`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`productId`),
  ADD KEY `fk_product_category_idx` (`category`),
  ADD KEY `fk_product_supplier_idx` (`supplier`);

--
-- Indexes for table `purches_request`
--
ALTER TABLE `purches_request`
  ADD PRIMARY KEY (`purcheseId`),
  ADD KEY `fk_purchese_request_idx` (`requestId`);

--
-- Indexes for table `request_product`
--
ALTER TABLE `request_product`
  ADD PRIMARY KEY (`requestID`),
  ADD KEY `fk_request_product_idx` (`productId`);

--
-- Indexes for table `sale`
--
ALTER TABLE `sale`
  ADD PRIMARY KEY (`saleId`);

--
-- Indexes for table `sale_product`
--
ALTER TABLE `sale_product`
  ADD PRIMARY KEY (`saleProductId`),
  ADD KEY `fk_sale_Product_idx` (`product`),
  ADD KEY `fk_sale_id_idx` (`saleId`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supplierId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `categoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `productId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `purches_request`
--
ALTER TABLE `purches_request`
  MODIFY `purcheseId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `request_product`
--
ALTER TABLE `request_product`
  MODIFY `requestID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sale`
--
ALTER TABLE `sale`
  MODIFY `saleId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sale_product`
--
ALTER TABLE `sale_product`
  MODIFY `saleProductId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `supplierId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_product_category` FOREIGN KEY (`category`) REFERENCES `category` (`categoryId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_product_supplier` FOREIGN KEY (`supplier`) REFERENCES `supplier` (`supplierId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `purches_request`
--
ALTER TABLE `purches_request`
  ADD CONSTRAINT `fk_purchese_request` FOREIGN KEY (`requestId`) REFERENCES `request_product` (`requestID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `request_product`
--
ALTER TABLE `request_product`
  ADD CONSTRAINT `fk_request_product` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sale_product`
--
ALTER TABLE `sale_product`
  ADD CONSTRAINT `fk_sale_Product` FOREIGN KEY (`product`) REFERENCES `product` (`productId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_sale_id` FOREIGN KEY (`saleId`) REFERENCES `sale` (`saleId`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
