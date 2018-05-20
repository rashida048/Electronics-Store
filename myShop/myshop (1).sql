-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2018 at 10:28 PM
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
(10, 'Ericson');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `p_id` int(10) NOT NULL,
  `ip_add` int(10) NOT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`p_id`, `ip_add`, `qty`) VALUES
(11, 0, 0),
(19, 0, 0),
(20, 0, 0);

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
(35, 6, 1259, 1484299256, 2, '2017-07-18 18:58:43', 'Pending');

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
(37, 6, 1484299256, 24, 1, 'Pending');

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
(11, 1, 2, '2017-06-21 21:38:19', 'DELL xps', 'Dell XPS1.png', 'Dell XPS2.png', 'Dell XPS3.png', 1199, '<ul class=\"productFeatLst\" style=\"margin: 18px 0px; padding: 0px; direction: ltr; font-size: 16px; line-height: 1.6; list-style: none; font-family: HPSimplified, arial; display: table; table-layout: fixed; width: 304px; box-sizing: border-box;\">\r\n<li class=\"productFeat\" style=\"margin: 0px; padding: 0px; direction: ltr; list-style: none; font-family: HPSimplifiedLight; line-height: 24px; max-width: 100%; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; box-sizing: border-box;\"><span style=\"box-sizing: border-box;\" title=\"Windows 10 Pro 64\">Windows 10 Pro 64</span></li>\r\n<li class=\"productFeat\" style=\"margin: 0px; padding: 0px; direction: ltr; list-style: none; font-family: HPSimplifiedLight; line-height: 24px; max-width: 100%; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; box-sizing: border-box;\"><span style=\"box-sizing: border-box;\" title=\"6th Generation Intel&reg; Core&trade; m processor\">6th Generation Intel&reg; Core&trade; m processor</span></li>\r\n<li class=\"productFeat\" style=\"margin: 0px; padding: 0px; direction: ltr; list-style: none; font-family: HPSimplifiedLight; line-height: 24px; max-width: 100%; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; box-sizing: border-box;\"><strong><span style=\"box-sizing: border-box;\" title=\"8 GB memory; 128 GB SSD storage\">8 GB memory; 128 GB SSD storage</span></strong></li>\r\n<li class=\"productFeat\" style=\"margin: 0px; padding: 0px; direction: ltr; list-style: none; font-family: HPSimplifiedLight; line-height: 24px; max-width: 100%; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; box-sizing: border-box;\"><em><span style=\"box-sizing: border-box;\" title=\"12.5&quot; FHD Touch display\">12.5\" FHD Touch display</span></em></li>\r\n</ul>', 'dell, laptops', 'on'),
(17, 1, 2, '2017-07-18 14:25:39', 'Dell 1', 'dell11.png', 'dell12.png', 'dell13.png', 699, '<p><span style=\"color: #444444; font-family: roboto, Arial, Helvetica, sans-serif;\">Expansive 17.3\" laptop featuring Intel&reg; processors, a DVD drive and a vibrant FHD display. The following options and default selections are included with your order.\n\nTheoretical Gray, Matte Metallic IMR\nBacklit Keyboard, English\nAMD Radeon R5 M335 4GB DDR3\n40 WHr, 4-Cell Battery (removable)\nNo Optical Drive Software\n65 Watt AC Adaptor\nWindows 10 OS Recovery 64bit – DVD\nTray load DVD Drive (Reads and Writes to DVD/CD)\n802.11ac + Bluetooth 4.0, Dual Band 2.4&5 GHz, 1x1\nAward Winning Service and Support</span></p>', 'DELL, laptop', 'on'),
(18, 1, 2, '2017-07-18 14:26:17', 'Dell 1', 'dell11.png', 'dell12.png', 'dell13.png', 699, '<p><span style=\"color: #444444; font-family: roboto, Arial, Helvetica, sans-serif;\">Expansive 17.3\" laptop featuring Intel&reg; processors, a DVD drive and a vibrant FHD display. The following options and default selections are included with your order.\n\nTheoretical Gray, Matte Metallic IMR\nBacklit Keyboard, English\nAMD Radeon R5 M335 4GB DDR3\n40 WHr, 4-Cell Battery (removable)\nNo Optical Drive Software\n65 Watt AC Adaptor\nWindows 10 OS Recovery 64bit – DVD\nTray load DVD Drive (Reads and Writes to DVD/CD)\n802.11ac + Bluetooth 4.0, Dual Band 2.4&5 GHz, 1x1\nAward Winning Service and Support</span></p>', 'DELL, laptop', 'on'),
(19, 1, 1, '2017-07-18 15:30:37', 'HP Pavilion x360', 'Hp1.png', 'hp2.png', 'hp13.png', 599, '<p style=\"box-sizing: border-box; margin: 0px 0px 10px; color: #444444; font-family: roboto, Arial, Helvetica, sans-serif;\">The following options and default selections are included with your order.</p>\r\n<ul class=\"unstyled\" style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; margin-left: 0px; padding-left: 0px; list-style: none; display: inline-block; color: #444444; font-family: roboto, Arial, Helvetica, sans-serif;\">\r\n<li style=\"box-sizing: border-box;\">Theoretical Gray, Matte Metallic IMR</li>\r\n<li style=\"box-sizing: border-box;\">Backlit Keyboard, English</li>\r\n<li style=\"box-sizing: border-box;\">AMD Radeon R5 M335 4GB DDR3</li>\r\n<li style=\"box-sizing: border-box;\">40 WHr, 4-Cell Battery (removable)</li>\r\n<li style=\"box-sizing: border-box;\">No Optical Drive Software</li>\r\n<li style=\"box-sizing: border-box;\">65 Watt AC Adaptor</li>\r\n<li style=\"box-sizing: border-box;\">Windows 10 OS Recovery 64bit &ndash; DVD</li>\r\n<li style=\"box-sizing: border-box;\">Tray load DVD Drive (Reads and Writes to DVD/CD)</li>\r\n<li style=\"box-sizing: border-box;\">802.11ac + Bluetooth 4.0, Dual Band 2.4&amp;5 GHz, 1x1</li>\r\n<li style=\"box-sizing: border-box;\">Award Winning Service and Support</li>\r\n</ul>', 'HP, laptop', 'on'),
(20, 3, 4, '2017-07-18 17:47:48', 'Samsung Galaxy S8', 'Sm21.png', 'Sm22.png', 'Sm23.png', 840, '<p style=\"box-sizing: border-box; margin: 0px 0px 10px; color: #444444; font-family: roboto, Arial, Helvetica, sans-serif;\">The following options and default selections are included with your order.</p>\r\n<ul class=\"unstyled\" style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; margin-left: 0px; padding-left: 0px; list-style: none; display: inline-block; color: #444444; font-family: roboto, Arial, Helvetica, sans-serif;\">\r\n<li style=\"box-sizing: border-box;\">Theoretical Gray, Matte Metallic IMR</li>\r\n<li style=\"box-sizing: border-box;\">Backlit Keyboard, English</li>\r\n<li style=\"box-sizing: border-box;\">AMD Radeon R5 M335 4GB DDR3</li>\r\n<li style=\"box-sizing: border-box;\">40 WHr, 4-Cell Battery (removable)</li>\r\n<li style=\"box-sizing: border-box;\">No Optical Drive Software</li>\r\n<li style=\"box-sizing: border-box;\">65 Watt AC Adaptor</li>\r\n<li style=\"box-sizing: border-box;\">Windows 10 OS Recovery 64bit &ndash; DVD</li>\r\n<li style=\"box-sizing: border-box;\">Tray load DVD Drive (Reads and Writes to DVD/CD)</li>\r\n<li style=\"box-sizing: border-box;\">802.11ac + Bluetooth 4.0, Dual Band 2.4&amp;5 GHz, 1x1</li>\r\n<li style=\"box-sizing: border-box;\">Award Winning Service and Support</li>\r\n</ul>', 'Samsung, mobile', 'on'),
(21, 3, 4, '2017-07-18 17:50:12', 'Samsung J3', 'Sa12.png', 'Sa11.png', 'Sa13.png', 549, '<p style=\"box-sizing: border-box; margin: 0px 0px 10px; color: #444444; font-family: roboto, Arial, Helvetica, sans-serif;\">The following options and default selections are included with your order.</p>\r\n<ul class=\"unstyled\" style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; margin-left: 0px; padding-left: 0px; list-style: none; display: inline-block; color: #444444; font-family: roboto, Arial, Helvetica, sans-serif;\">\r\n<li style=\"box-sizing: border-box;\">Theoretical Gray, Matte Metallic IMR</li>\r\n<li style=\"box-sizing: border-box;\">Backlit Keyboard, English</li>\r\n<li style=\"box-sizing: border-box;\">AMD Radeon R5 M335 4GB DDR3</li>\r\n<li style=\"box-sizing: border-box;\">40 WHr, 4-Cell Battery (removable)</li>\r\n<li style=\"box-sizing: border-box;\">No Optical Drive Software</li>\r\n<li style=\"box-sizing: border-box;\">65 Watt AC Adaptor</li>\r\n<li style=\"box-sizing: border-box;\">Windows 10 OS Recovery 64bit &ndash; DVD</li>\r\n<li style=\"box-sizing: border-box;\">Tray load DVD Drive (Reads and Writes to DVD/CD)</li>\r\n<li style=\"box-sizing: border-box;\">802.11ac + Bluetooth 4.0, Dual Band 2.4&amp;5 GHz, 1x1</li>\r\n<li style=\"box-sizing: border-box;\">Award Winning Service and Support</li>\r\n</ul>', 'Samsung, mobile', 'on'),
(22, 4, 5, '2017-07-18 17:58:19', 'Sony A7 dan', 'Sony11.png', 'Sony12.png', 'Sony12.png', 479, '<p style=\"box-sizing: border-box; margin: 0px 0px 10px; color: #444444; font-family: roboto, Arial, Helvetica, sans-serif;\">The following options and default selections are included with your order.</p>\r\n<ul class=\"unstyled\" style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; margin-left: 0px; padding-left: 0px; list-style: none; display: inline-block; color: #444444; font-family: roboto, Arial, Helvetica, sans-serif;\">\r\n<li style=\"box-sizing: border-box;\">Theoretical Gray, Matte Metallic IMR</li>\r\n<li style=\"box-sizing: border-box;\">Backlit Keyboard, English</li>\r\n<li style=\"box-sizing: border-box;\">AMD Radeon R5 M335 4GB DDR3</li>\r\n<li style=\"box-sizing: border-box;\">40 WHr, 4-Cell Battery (removable)</li>\r\n<li style=\"box-sizing: border-box;\">No Optical Drive Software</li>\r\n<li style=\"box-sizing: border-box;\">65 Watt AC Adaptor</li>\r\n<li style=\"box-sizing: border-box;\">Windows 10 OS Recovery 64bit &ndash; DVD</li>\r\n<li style=\"box-sizing: border-box;\">Tray load DVD Drive (Reads and Writes to DVD/CD)</li>\r\n<li style=\"box-sizing: border-box;\">802.11ac + Bluetooth 4.0, Dual Band 2.4&amp;5 GHz, 1x1</li>\r\n<li style=\"box-sizing: border-box;\">Award Winning Service and Support</li>\r\n</ul>', 'Sony, cameras', 'on'),
(23, 4, 5, '2017-07-18 18:06:20', 'Sony LMF', 'Sony21.png', 'Sony22.png', 'Sony23.png', 389, '<p style=\"box-sizing: border-box; margin: 0px 0px 10px; color: #444444; font-family: roboto, Arial, Helvetica, sans-serif;\">The following options and default selections are included with your order.</p>\r\n<ul class=\"unstyled\" style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; margin-left: 0px; padding-left: 0px; list-style: none; display: inline-block; color: #444444; font-family: roboto, Arial, Helvetica, sans-serif;\">\r\n<li style=\"box-sizing: border-box;\">Theoretical Gray, Matte Metallic IMR</li>\r\n<li style=\"box-sizing: border-box;\">Backlit Keyboard, English</li>\r\n<li style=\"box-sizing: border-box;\">AMD Radeon R5 M335 4GB DDR3</li>\r\n<li style=\"box-sizing: border-box;\">40 WHr, 4-Cell Battery (removable)</li>\r\n<li style=\"box-sizing: border-box;\">No Optical Drive Software</li>\r\n<li style=\"box-sizing: border-box;\">65 Watt AC Adaptor</li>\r\n<li style=\"box-sizing: border-box;\">Windows 10 OS Recovery 64bit &ndash; DVD</li>\r\n<li style=\"box-sizing: border-box;\">Tray load DVD Drive (Reads and Writes to DVD/CD)</li>\r\n<li style=\"box-sizing: border-box;\">802.11ac + Bluetooth 4.0, Dual Band 2.4&amp;5 GHz, 1x1</li>\r\n<li style=\"box-sizing: border-box;\">Award Winning Service and Support</li>\r\n</ul>', 'Sony, cameras', 'on'),
(24, 3, 6, '2017-07-18 18:13:42', 'Motorola iFit', 'Moto11.png', 'Moto12.png', 'Moto13.png', 560, '<p style=\"box-sizing: border-box; margin: 0px 0px 10px; color: #444444; font-family: roboto, Arial, Helvetica, sans-serif;\">The following options and default selections are included with your order.</p>\r\n<ul class=\"unstyled\" style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; margin-left: 0px; padding-left: 0px; list-style: none; display: inline-block; color: #444444; font-family: roboto, Arial, Helvetica, sans-serif;\">\r\n<li style=\"box-sizing: border-box;\">Theoretical Gray, Matte Metallic IMR</li>\r\n<li style=\"box-sizing: border-box;\">Backlit Keyboard, English</li>\r\n<li style=\"box-sizing: border-box;\">AMD Radeon R5 M335 4GB DDR3</li>\r\n<li style=\"box-sizing: border-box;\">40 WHr, 4-Cell Battery (removable)</li>\r\n<li style=\"box-sizing: border-box;\">No Optical Drive Software</li>\r\n<li style=\"box-sizing: border-box;\">65 Watt AC Adaptor</li>\r\n<li style=\"box-sizing: border-box;\">Windows 10 OS Recovery 64bit &ndash; DVD</li>\r\n<li style=\"box-sizing: border-box;\">Tray load DVD Drive (Reads and Writes to DVD/CD)</li>\r\n<li style=\"box-sizing: border-box;\">802.11ac + Bluetooth 4.0, Dual Band 2.4&amp;5 GHz, 1x1</li>\r\n<li style=\"box-sizing: border-box;\">Award Winning Service and Support</li>\r\n</ul>', 'Motorola, Mobiles', 'on');

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
  MODIFY `brand_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
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
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `pending_orders`
--
ALTER TABLE `pending_orders`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
