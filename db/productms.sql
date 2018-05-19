-- phpMyAdmin SQL Dump
-- version 4.4.15
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2018-05-19 17:28:32
-- 服务器版本： 10.1.8-MariaDB
-- PHP Version: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `productms`
--

-- --------------------------------------------------------

--
-- 表的结构 `wx_product_consume`
--

CREATE TABLE IF NOT EXISTS `wx_product_consume` (
  `id` int(11) NOT NULL,
  `productclass_id` int(11) NOT NULL COMMENT '成品分类',
  `product_id` int(11) NOT NULL COMMENT '成品名称',
  `unitprice` float NOT NULL COMMENT '销售单价',
  `price` float NOT NULL COMMENT '单成品销售总价',
  `count` int(11) NOT NULL DEFAULT '0' COMMENT '消耗数量',
  `consume_type` tinyint(4) NOT NULL COMMENT '消耗方式 1：销售 2：损耗',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '审核状态 1：销售默认审核通过 0：报损需要指定人员审核',
  `create_dt` int(11) NOT NULL COMMENT '添加时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='成品消耗表';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `wx_product_consume`
--
ALTER TABLE `wx_product_consume`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `wx_product_consume`
--
ALTER TABLE `wx_product_consume`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
