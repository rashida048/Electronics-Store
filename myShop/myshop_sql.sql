-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 11, 2017 at 02:09 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `myshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(10) NOT NULL,
  `admin_email` varchar(100) NOT NULL,
  `admin_pass` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `admin_email`, `admin_pass`) VALUES
(1, 'sucky00@gmail.com', 'qwerty'),
(2, 'sucky048@yahoo.com', 'asdfgh');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(10) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'HP'),
(2, 'DELL'),
(3, 'Nokia'),
(4, 'Samsung'),
(5, 'Sony'),
(6, 'Motorola'),
(7, 'LG'),
(9, 'Ericson');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `p_id` int(10) NOT NULL,
  `ip_add` int(10) NOT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(10) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'Laptops'),
(2, 'Computers'),
(3, 'Mobiles'),
(4, 'Cameras'),
(9, 'Tablets'),
(10, 'TVs');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(10) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `customer_email` varchar(100) NOT NULL,
  `customer_pass` varchar(100) NOT NULL,
  `customer_country` text NOT NULL,
  `customer_city` text NOT NULL,
  `customer_contact` int(100) NOT NULL,
  `customer_address` text NOT NULL,
  `customer_image` text NOT NULL,
  `customer_ip` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_name`, `customer_email`, `customer_pass`, `customer_country`, `customer_city`, `customer_contact`, `customer_address`, `customer_image`, `customer_ip`) VALUES
(6, 'Rashida', 'sucky00@gmail.com', 'qwerty', 'United States', 'MIAMI', 2147483647, '2441 SW 31ST AVE APT 204', 'profile.png', 0);

-- --------------------------------------------------------

--
-- Table structure for table `customer_orders`
--

CREATE TABLE `customer_orders` (
  `order_id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `due_amount` int(100) NOT NULL,
  `invoice_no` int(100) NOT NULL,
  `total_products` int(100) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `order_status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_orders`
--

INSERT INTO `customer_orders` (`order_id`, `customer_id`, `due_amount`, `invoice_no`, `total_products`, `order_date`, `order_status`) VALUES
(18, 6, 300, 615041356, 1, '2017-07-07 01:07:43', 'Pending'),
(19, 6, 690, 1398144471, 1, '2017-07-08 02:05:16', 'Pending'),
(29, 6, 900, 1753837452, 1, '2017-07-07 00:30:52', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(10) NOT NULL,
  `invoice_no` int(10) NOT NULL,
  `amount` int(10) NOT NULL,
  `payment_mode` text NOT NULL,
  `payment_date` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `invoice_no`, `amount`, `payment_mode`, `payment_date`) VALUES
(3, 1392297403, 900, 'Bank Transfer', '6/29/2017'),
(4, 38715234, 400, 'Western Union', '6/29/2017'),
(5, 38715234, 400, 'Western Union', '6/29/2017'),
(6, 1753837452, 900, 'Card', '7/6/2017');

-- --------------------------------------------------------

--
-- Table structure for table `pending_orders`
--

CREATE TABLE `pending_orders` (
  `order_id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `invoice_no` int(10) NOT NULL,
  `product_id` int(10) NOT NULL,
  `qty` int(10) NOT NULL,
  `order_status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pending_orders`
--

INSERT INTO `pending_orders` (`order_id`, `customer_id`, `invoice_no`, `product_id`, `qty`, `order_status`) VALUES
(30, 6, 615041356, 6, 1, 'Pending'),
(31, 6, 1398144471, 14, 1, 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(10) NOT NULL,
  `cat_id` int(10) NOT NULL,
  `brand_id` int(10) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `product_title` text NOT NULL,
  `product_img1` text NOT NULL,
  `product_img2` text NOT NULL,
  `product_img3` text NOT NULL,
  `product_price` int(10) NOT NULL,
  `product_desc` text NOT NULL,
  `product_keywords` text NOT NULL,
  `status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `cat_id`, `brand_id`, `date`, `product_title`, `product_img1`, `product_img2`, `product_img3`, `product_price`, `product_desc`, `product_keywords`, `status`) VALUES
(2, 1, 2, '2017-06-17 19:29:32', 'DELL Laptop', 'HP laptop.png', 'HP laptop.png', 'HP laptop.png', 500, 'This is a very user friendly product!', 'DELL, laptops', 'on'),
(3, 3, 6, '2017-06-17 19:29:40', 'Motorola Mobile', 'Motorola mobile.png', 'Motorola mobile.png', '', 300, 'This is our new addition!', 'Motorola, mobiles', 'on'),
(6, 4, 4, '2017-06-17 19:29:52', 'Samsung Smart Camera', 'Samsung smart Camera.png', 'Samsung Camera.png', '', 300, '<p>A&nbsp;professional&nbsp;<strong>photographer</strong> Camera</p>', 'Samsung, smart, cameras', 'on'),
(7, 9, 4, '2017-06-17 19:29:56', 'Samsung Tablet', 'Samsung tablet.png', 'Samsung tablet.png', '', 250, '<p>This is a super <strong>Samsung tablet</strong>! You will love it!!</p>', 'Samsung, tablets', 'on'),
(9, 1, 1, '2017-06-21 21:37:31', 'HP M1', 'Hp M1.png', 'Hp M2.png', 'Hp M3.png', 1200, '<ul class=\"productFeatLst\" style=\"margin: 18px 0px; padding: 0px; direction: ltr; font-size: 16px; line-height: 1.6; list-style: none; font-family: HPSimplified, arial; display: table; table-layout: fixed; width: 304px; box-sizing: border-box;\">\r\n<li class=\"productFeat\" style=\"margin: 0px; padding: 0px; direction: ltr; list-style: none; font-family: HPSimplifiedLight; line-height: 24px; max-width: 100%; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; box-sizing: border-box;\"><span style=\"box-sizing: border-box;\" title=\"Chrome OS&trade;\">Chrome OS&trade;</span></li>\r\n<li class=\"productFeat\" style=\"margin: 0px; padding: 0px; direction: ltr; list-style: none; font-family: HPSimplifiedLight; line-height: 24px; max-width: 100%; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; box-sizing: border-box;\"><span style=\"box-sizing: border-box;\" title=\"Intel&reg; Celeron&reg; processor\">Intel&reg; Celeron&reg; processor</span></li>\r\n<li class=\"productFeat\" style=\"margin: 0px; padding: 0px; direction: ltr; list-style: none; font-family: HPSimplifiedLight; line-height: 24px; max-width: 100%; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; box-sizing: border-box;\"><span style=\"box-sizing: border-box;\" title=\"2 GB memory; 16 GB eMMC storage\">2 GB memory; 16 GB eMMC storage</span></li>\r\n<li class=\"productFeat\" style=\"margin: 0px; padding: 0px; direction: ltr; list-style: none; font-family: HPSimplifiedLight; line-height: 24px; max-width: 100%; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; box-sizing: border-box;\"><span style=\"box-sizing: border-box;\" title=\"14&quot; HD display\">14\" HD display</span></li>\r\n</ul>', 'HP, laptops', 'on'),
(10, 1, 2, '2017-06-21 21:38:00', 'DELL 3p1', 'Dell 3p1.png', 'Dell 3p2.png', 'Dell 3p3.png', 900, '<ul class=\"productFeatLst\" style=\"margin: 18px 0px; padding: 0px; direction: ltr; font-size: 16px; line-height: 1.6; list-style: none; font-family: HPSimplified, arial; display: table; table-layout: fixed; width: 304px; box-sizing: border-box;\">\r\n<li class=\"productFeat\" style=\"margin: 0px; padding: 0px; direction: ltr; list-style: none; font-family: HPSimplifiedLight; line-height: 24px; max-width: 100%; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; box-sizing: border-box;\"><span style=\"box-sizing: border-box;\" title=\"Chrome OS&trade;\">Chrome OS&trade;</span></li>\r\n<li class=\"productFeat\" style=\"margin: 0px; padding: 0px; direction: ltr; list-style: none; font-family: HPSimplifiedLight; line-height: 24px; max-width: 100%; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; box-sizing: border-box;\"><span style=\"box-sizing: border-box;\" title=\"Intel&reg; Celeron&reg; processor\">Intel&reg; Celeron&reg; processor</span></li>\r\n<li class=\"productFeat\" style=\"margin: 0px; padding: 0px; direction: ltr; list-style: none; font-family: HPSimplifiedLight; line-height: 24px; max-width: 100%; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; box-sizing: border-box;\"><span style=\"box-sizing: border-box;\" title=\"4 GB memory; 16 GB eMMC storage\">4 GB memory; <em><strong>16 GB eMMC storage</strong></em></span></li>\r\n<li class=\"productFeat\" style=\"margin: 0px; padding: 0px; direction: ltr; list-style: none; font-family: HPSimplifiedLight; line-height: 24px; max-width: 100%; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; box-sizing: border-box;\"><span style=\"box-sizing: border-box;\" title=\"Intel&reg; HD Graphics 400\">Intel&reg; HD Graphics 400</span></li>\r\n</ul>', 'dell, laptops', 'on'),
(11, 1, 2, '2017-06-21 21:38:19', 'DELL xps', 'Dell XPS1.png', 'Dell XPS2.png', 'Dell XPS3.png', 1199, '<ul class=\"productFeatLst\" style=\"margin: 18px 0px; padding: 0px; direction: ltr; font-size: 16px; line-height: 1.6; list-style: none; font-family: HPSimplified, arial; display: table; table-layout: fixed; width: 304px; box-sizing: border-box;\">\r\n<li class=\"productFeat\" style=\"margin: 0px; padding: 0px; direction: ltr; list-style: none; font-family: HPSimplifiedLight; line-height: 24px; max-width: 100%; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; box-sizing: border-box;\"><span style=\"box-sizing: border-box;\" title=\"Windows 10 Pro 64\">Windows 10 Pro 64</span></li>\r\n<li class=\"productFeat\" style=\"margin: 0px; padding: 0px; direction: ltr; list-style: none; font-family: HPSimplifiedLight; line-height: 24px; max-width: 100%; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; box-sizing: border-box;\"><span style=\"box-sizing: border-box;\" title=\"6th Generation Intel&reg; Core&trade; m processor\">6th Generation Intel&reg; Core&trade; m processor</span></li>\r\n<li class=\"productFeat\" style=\"margin: 0px; padding: 0px; direction: ltr; list-style: none; font-family: HPSimplifiedLight; line-height: 24px; max-width: 100%; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; box-sizing: border-box;\"><strong><span style=\"box-sizing: border-box;\" title=\"8 GB memory; 128 GB SSD storage\">8 GB memory; 128 GB SSD storage</span></strong></li>\r\n<li class=\"productFeat\" style=\"margin: 0px; padding: 0px; direction: ltr; list-style: none; font-family: HPSimplifiedLight; line-height: 24px; max-width: 100%; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; box-sizing: border-box;\"><em><span style=\"box-sizing: border-box;\" title=\"12.5&quot; FHD Touch display\">12.5\" FHD Touch display</span></em></li>\r\n</ul>', 'dell, laptops', 'on'),
(12, 10, 4, '2017-06-21 21:38:46', 'Sony LE', 'Sony LE1.png', 'Sony LE2.png', 'Sony LE3.png', 600, '<p>This product one of the most beautiful product of ours. You will definitely love it.&nbsp;</p>', 'Sony, tvs', 'on'),
(13, 3, 4, '2017-06-21 21:39:06', 'Samsung S', 'Samsung s1.png', 'Samsung s2.png', 'Samsung s3.png', 790, '<ul style=\"box-sizing: border-box; margin: 0px; padding-left: 0px; color: #474747; font-family: Arial, Helvetica, sans-serif; font-size: 13px;\">\r\n<li style=\"box-sizing: border-box; display: block; padding-left: 1.25em; position: relative;\">Android 7.0 Nougat</li>\r\n<li style=\"box-sizing: border-box; display: block; padding-left: 1.25em; position: relative;\">4G LTE speed</li>\r\n<li style=\"box-sizing: border-box; display: block; padding-left: 1.25em; position: relative;\">5.8\" WQHD+ touch-screen display</li>\r\n<li style=\"box-sizing: border-box; display: block; padding-left: 1.25em; position: relative;\">12.0MP rear- and 8.0MP front-facing cameras</li>\r\n<li style=\"box-sizing: border-box; display: block; padding-left: 1.25em; position: relative;\">Compatible with most major US carriers, including AT&amp;T, T-Mobile, Verizon Wireless and Sprint</li>\r\n</ul>', 'samsung, mobiles', 'on'),
(14, 3, 4, '2017-06-21 21:39:34', 'Samsung p', 'Samsung p1.png', 'Samsung p2.png', 'Samsung p3.png', 690, '<ul style=\"box-sizing: border-box; margin: 0px; padding-left: 0px; color: #474747; font-family: Arial, Helvetica, sans-serif; font-size: 13px;\">\r\n<li style=\"box-sizing: border-box; display: block; padding-left: 1.25em; position: relative;\">Android 7.0 Nougat</li>\r\n<li style=\"box-sizing: border-box; display: block; padding-left: 1.25em; position: relative;\">4G LTE speed</li>\r\n<li style=\"box-sizing: border-box; display: block; padding-left: 1.25em; position: relative;\">5.8\" Super AMOLED HD touch-screen display</li>\r\n<li style=\"box-sizing: border-box; display: block; padding-left: 1.25em; position: relative;\">8.0MP front-facing and 12.0MP rear-facing cameras</li>\r\n<li style=\"box-sizing: border-box; display: block; padding-left: 1.25em; position: relative;\">Wi-Fi, Bluetooth</li>\r\n<li style=\"box-sizing: border-box; display: block; padding-left: 1.25em; position: relative;\"></li>\r\n</ul>', 'samsung, mobiles', 'on'),
(15, 3, 4, '2017-06-22 03:09:30', 'Gwlaxy S8', 'pol-SOL-14894-Jupiter.jpg', '', '', 500, '<p>Mobile</p>', '', 'on');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`p_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `customer_orders`
--
ALTER TABLE `customer_orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `pending_orders`
--
ALTER TABLE `pending_orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `customer_orders`
--
ALTER TABLE `customer_orders`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `pending_orders`
--
ALTER TABLE `pending_orders`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
