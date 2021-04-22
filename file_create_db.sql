-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 05, 2021 at 09:08 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `php0520e_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL COMMENT 'Tên danh mục',
  `type` tinyint(3) DEFAULT 0 COMMENT 'Loại danh mục: 0 - Product, 1 - News',
  `avatar` varchar(100) DEFAULT NULL COMMENT 'Tên file ảnh danh mục',
  `description` text DEFAULT NULL COMMENT 'Mô tả chi tiết cho danh mục',
  `status` tinyint(3) DEFAULT 0 COMMENT 'Trạng thái danh mục: 0 - Inactive, 1 - Active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo danh mục',
  `updated_at` datetime DEFAULT NULL COMMENT 'Ngày cập nhật cuối'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `type`, `avatar`, `description`, `status`, `created_at`, `updated_at`) VALUES
(2, 'du', 0, '', '<p>rtgege</p>\r\n', 1, '2020-08-29 12:00:39', NULL),
(5, 'hiếu', 0, '1601042155-84383880_843070849467363_1972024235274534912_n.jpg', '<p>babyng oncute</p>\r\n', 0, '2020-09-25 13:55:55', NULL),
(6, 'bay', 0, '1601126998-anh.jpg', '<p>rềgtt</p>\r\n', 1, '2020-09-26 13:29:58', '2020-09-26 20:38:35'),
(7, 'baby', 0, '', '<p>rff4f</p>\r\n', 1, '2020-09-26 13:36:23', '2020-09-26 20:38:43');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL COMMENT 'Id của danh mục mà tin tức thuộc về, là khóa ngoại liên kết với bảng categories',
  `title` varchar(100) NOT NULL COMMENT 'Tiêu đề tin tức',
  `summary` varchar(100) DEFAULT NULL COMMENT 'Mô tả ngắn cho tin tức',
  `avatar` varchar(100) DEFAULT NULL COMMENT 'Tên file ảnh tin tức',
  `content` text DEFAULT NULL COMMENT 'Mô tả chi tiết cho sản phẩm',
  `status` tinyint(3) DEFAULT 0 COMMENT 'Trạng thái danh mục: 0 - Inactive, 1 - Active',
  `seo_title` varchar(100) DEFAULT NULL COMMENT 'Từ khóa seo cho title',
  `seo_description` varchar(100) DEFAULT NULL COMMENT 'Từ khóa seo cho phần mô tả',
  `seo_keywords` varchar(100) DEFAULT NULL COMMENT 'Các từ khóa seo',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` datetime DEFAULT NULL COMMENT 'Ngày cập nhật cuối'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT 'Id của user trong trường hợp đã login và đặt hàng, là khóa ngoại liên kết với bảng users',
  `fullname` varchar(100) DEFAULT NULL COMMENT 'Tên khách hàng',
  `address` varchar(100) DEFAULT NULL COMMENT 'Địa chỉ khách hàng',
  `mobile` int(11) DEFAULT NULL COMMENT 'SĐT khách hàng',
  `email` varchar(100) DEFAULT NULL COMMENT 'Email khách hàng',
  `note` text DEFAULT NULL COMMENT 'Ghi chú từ khách hàng',
  `price_total` int(11) DEFAULT NULL COMMENT 'Tổng giá trị đơn hàng',
  `payment_status` tinyint(2) DEFAULT NULL COMMENT 'Trạng thái đơn hàng: 0 - Chưa thành toán, 1 - Đã thành toán',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo đơn',
  `updated_at` datetime DEFAULT NULL COMMENT 'Ngày cập nhật cuối'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `fullname`, `address`, `mobile`, `email`, `note`, `price_total`, `payment_status`, `created_at`, `updated_at`) VALUES
(1, NULL, 'du', 'thanh hóa', 985673110, NULL, 'baby', 0, 0, '2020-09-19 12:31:57', NULL),
(2, NULL, 'du', 'thanh hóa', 985673110, NULL, 'baby', 0, 0, '2020-09-19 12:32:30', NULL),
(3, NULL, 'du', 'thanh hóa', 985673110, NULL, 'baby', 0, 0, '2020-09-19 12:54:16', NULL),
(4, NULL, 'du', 'thanh hóa', 985673110, NULL, 'baby', 0, 0, '2020-09-19 12:54:31', NULL),
(5, NULL, 'du', 'thanh hóa', 985673110, NULL, 'pijpjip', 12, 0, '2020-09-19 12:55:54', NULL),
(6, NULL, 'du', 'thanh hóa', 985673110, NULL, 'pijpjip', 12, 0, '2020-09-19 13:12:02', NULL),
(7, NULL, 'du', 'thanh hóa', 985673110, NULL, 'pijpjip', 12, 0, '2020-09-19 13:16:51', NULL),
(8, NULL, 'du', 'thanh hóa', 985673110, NULL, 'pijpjip', 12, 0, '2020-09-19 13:17:57', NULL),
(9, NULL, 'du', 'thanh hóa', 985673110, NULL, 'pijpjip', 12, 0, '2020-09-19 13:18:24', NULL),
(10, NULL, 'du', 'thanh hóa', 985673110, NULL, 'pijpjip', 12, 0, '2020-09-19 13:21:00', NULL),
(11, NULL, 'du', 'thanh hóa', 985673110, NULL, 'pijpjip', 12, 0, '2020-09-19 13:25:27', NULL),
(12, NULL, 'du', 'thanh hóa', 985673110, NULL, 'pijpjip', 12, 0, '2020-09-19 13:26:30', NULL),
(13, NULL, 'du', 'thanh hóa', 985673110, NULL, 'pijpjip', 12, 0, '2020-09-19 13:38:12', NULL),
(14, NULL, 'du', 'thanh hóa', 985673110, NULL, 'fewfw', 12, 0, '2020-09-19 13:42:35', NULL),
(15, NULL, 'du', 'thanh hóa', 985673110, NULL, 'qfef', 12, 0, '2020-09-19 13:43:37', NULL),
(16, NULL, 'du', 'thanh hóa', 985673110, NULL, 'dưef', 12, 0, '2020-09-19 13:47:00', NULL),
(17, NULL, 'du', 'thanh hóa', 985673110, NULL, 'cds', 12, 0, '2020-09-19 13:55:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `order_id` int(11) DEFAULT NULL COMMENT 'Id của order tương ứng, là khóa ngoại liên kết với bảng orders',
  `product_id` int(11) DEFAULT NULL COMMENT 'Id của product tương ứng, là khóa ngoại liên kết với bảng products',
  `quantity` int(11) DEFAULT NULL COMMENT 'Số sản phẩm đã đặt'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`order_id`, `product_id`, `quantity`) VALUES
(4, 22, 2),
(5, 22, 3),
(5, 23, 1),
(6, 22, 3),
(6, 23, 1),
(7, 22, 3),
(7, 23, 1),
(8, 22, 3),
(8, 23, 1),
(9, 22, 3),
(9, 23, 1),
(10, 22, 3),
(10, 23, 1),
(11, 22, 3),
(11, 23, 1),
(12, 22, 3),
(12, 23, 1),
(13, 22, 3),
(13, 23, 1),
(14, 22, 3),
(14, 23, 1),
(15, 22, 3),
(15, 23, 1),
(16, 22, 3),
(16, 23, 1),
(17, 22, 3),
(17, 23, 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL COMMENT 'Id của danh mục mà sản phẩm thuộc về, là khóa ngoại liên kết với bảng categories',
  `title` varchar(100) DEFAULT NULL COMMENT 'Tên sản phẩm',
  `avatar` varchar(100) DEFAULT NULL COMMENT 'Tên file ảnh sản phẩm',
  `price` int(11) DEFAULT NULL COMMENT 'Giá sản phẩm',
  `amount` int(11) DEFAULT NULL COMMENT 'Số lượng sản phẩm trong kho',
  `summary` varchar(100) DEFAULT NULL COMMENT 'Mô tả ngắn cho sản phẩm',
  `content` text DEFAULT NULL COMMENT 'Mô tả chi tiết cho sản phẩm',
  `status` tinyint(3) DEFAULT 0 COMMENT 'Trạng thái danh mục: 0 - Inactive, 1 - Active',
  `seo_title` varchar(100) DEFAULT NULL COMMENT 'Từ khóa seo cho title',
  `seo_description` varchar(100) DEFAULT NULL COMMENT 'Từ khóa seo cho phần mô tả',
  `seo_keywords` varchar(100) DEFAULT NULL COMMENT 'Các từ khóa seo',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` datetime DEFAULT NULL COMMENT 'Ngày cập nhật cuối'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `title`, `avatar`, `price`, `amount`, `summary`, `content`, `status`, `seo_title`, `seo_description`, `seo_keywords`, `created_at`, `updated_at`) VALUES
(20, 2, 'fsfd', '1599913356-product-anh2.jpg', 0, 0, '', '', 1, '', '', '', '2020-09-12 12:22:36', NULL),
(21, 2, 'bibi', '1599913434-product-cat_cute_ball_127642_1366x768.jpg', 0, 0, '', '', 1, '', '', '', '2020-09-12 12:23:54', NULL),
(22, 2, 'tata', '1599913464-product-lone_girl-t2.jpg', 0, 0, '', '', 1, '', '', '', '2020-09-12 12:24:24', NULL),
(23, 2, 'ultucf', '1599913857-product-anh4.jpg', 12, 0, '', '', 1, '', '', '', '2020-09-12 12:30:57', NULL),
(24, 5, 'dien thoaidfbdf', '', 34564646, 0, '', '', 1, '', '', '', '2020-09-25 13:57:12', NULL),
(25, 6, 'sdfrê', '1601127039-product-anh.jpg', 0, 0, '', '', 1, '', '', '', '2020-09-26 13:30:39', NULL),
(26, 7, 'chính', '1601127421-product-bt3.jpg', 400, 0, '', '', 1, '', '', '', '2020-09-26 13:37:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) DEFAULT NULL COMMENT 'Tên đăng nhập',
  `password` varchar(100) DEFAULT NULL COMMENT 'Mật khẩu đăng nhập',
  `first_name` varchar(100) DEFAULT NULL COMMENT 'Fist name',
  `last_name` varchar(100) DEFAULT NULL COMMENT 'Last name',
  `phone` int(11) DEFAULT NULL COMMENT 'SĐT user',
  `address` varchar(100) DEFAULT NULL COMMENT 'Địa chỉ user',
  `email` varchar(100) DEFAULT NULL COMMENT 'Email của user',
  `avatar` varchar(100) DEFAULT NULL COMMENT 'File ảnh đại diện',
  `jobs` varchar(100) DEFAULT NULL COMMENT 'Nghề nghiệp',
  `last_login` datetime DEFAULT NULL COMMENT 'Lần đăng nhập gần đây nhất',
  `facebook` varchar(100) DEFAULT NULL COMMENT 'Link facebook',
  `status` tinyint(3) DEFAULT 0 COMMENT 'Trạng thái danh mục: 0 - Inactive, 1 - Active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` datetime DEFAULT NULL COMMENT 'Ngày cập nhật cuối'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `first_name`, `last_name`, `phone`, `address`, `email`, `avatar`, `jobs`, `last_login`, `facebook`, `status`, `created_at`, `updated_at`) VALUES
(1, 'truongdu0212@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-08-29 09:20:57', NULL),
(3, 'truongdu1107@gmail.com', '915d1427fdf8a4e9cdc2df8a8cb727a3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-03-05 07:58:29', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
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
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
