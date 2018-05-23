-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2018 �?05 �?23 �?17:37
-- 服务器版本: 5.1.28-rc-community
-- PHP 版本: 5.5.30

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `productms`
--

-- --------------------------------------------------------

--
-- 表的结构 `wx_admin`
--

CREATE TABLE IF NOT EXISTS `wx_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL COMMENT '用户登录名',
  `password` varchar(32) DEFAULT NULL COMMENT '密码',
  `name` varchar(100) DEFAULT NULL COMMENT '姓名',
  `gender` tinyint(4) DEFAULT '1' COMMENT '性别(0：女；1：男；)',
  `correspondence_id` int(11) DEFAULT NULL COMMENT '函授站',
  `role_name` varchar(64) DEFAULT NULL COMMENT '角色名称',
  `is_delete` tinyint(4) DEFAULT '0' COMMENT '是否删除',
  `my_quickentry` text COMMENT '快捷入口',
  `courseids` varchar(255) DEFAULT NULL COMMENT '任课老师课程',
  `disciplineids` varchar(255) DEFAULT NULL COMMENT '任课老师的专业',
  `p_id` tinyint(2) NOT NULL,
  `level` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `wx_admin`
--

INSERT INTO `wx_admin` (`id`, `username`, `password`, `name`, `gender`, `correspondence_id`, `role_name`, `is_delete`, `my_quickentry`, `courseids`, `disciplineids`, `p_id`, `level`) VALUES
(1, 'admin', '96e79218965eb72c92a549dd5a330112', '超级管理员', 1, NULL, 'zongadming', 0, '{"75":{"id":75,"name":"\\u4fee\\u6539\\u5bc6\\u7801","url":"admin\\/edit-password"}}', '', '', 1, 1),
(2, 'test', '96e79218965eb72c92a549dd5a330112', '测试账号', 1, NULL, NULL, 0, NULL, NULL, NULL, 1, 0),
(3, 'member', '96e79218965eb72c92a549dd5a330112', '测试', 1, NULL, NULL, 0, NULL, NULL, NULL, 2, 0),
(4, 'zs', '96e79218965eb72c92a549dd5a330112', '招生1', 1, NULL, 'zhaosheng', 0, NULL, NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `wx_auth_assignment`
--

CREATE TABLE IF NOT EXISTS `wx_auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  KEY `user_id` (`user_id`),
  KEY `created_at` (`created_at`),
  KEY `item_name` (`item_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员授权表';

--
-- 转存表中的数据 `wx_auth_assignment`
--

INSERT INTO `wx_auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('zongadming', '1', 1470623219);

-- --------------------------------------------------------

--
-- 表的结构 `wx_auth_item`
--

CREATE TABLE IF NOT EXISTS `wx_auth_item` (
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '名称',
  `type` int(11) NOT NULL COMMENT '类型{1：角色；2：权限；}',
  `description` text COMMENT '描述',
  `rule_name` varchar(64) DEFAULT NULL COMMENT '规则名称',
  `data` text COMMENT '数据',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL COMMENT '权限所属菜单',
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `type` (`type`),
  KEY `name` (`name`),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理权权限条目';

--
-- 转存表中的数据 `wx_auth_item`
--

INSERT INTO `wx_auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`, `menu_id`) VALUES
('admin_create', 2, '用户添加', NULL, NULL, NULL, NULL, 33),
('admin_delete', 2, '用户删除', NULL, NULL, NULL, NULL, 33),
('admin_quickentry', 2, '快捷入口设置', NULL, NULL, NULL, NULL, 35),
('admin_update', 2, '用户修改', NULL, NULL, NULL, NULL, 33),
('brand', 2, '品牌', NULL, NULL, NULL, NULL, 41),
('consume_add', 2, '添加', NULL, NULL, NULL, NULL, 64),
('consume_groupproduct', 2, '查询', NULL, NULL, NULL, NULL, 61),
('consume_index', 2, '列表', NULL, NULL, NULL, NULL, 63),
('consume_sh', 2, '审核', NULL, NULL, NULL, NULL, 65),
('food', 2, '食材名称', NULL, NULL, NULL, NULL, 38),
('foodclass', 2, '食材分类', NULL, NULL, NULL, NULL, 37),
('foodunit', 2, '食材单位', NULL, NULL, NULL, NULL, 40),
('menu_create', 2, '菜单添加', NULL, NULL, NULL, NULL, 32),
('menu_delete', 2, '菜单删除', NULL, NULL, NULL, NULL, 32),
('menu_taxis', 2, '菜单排序', NULL, NULL, NULL, NULL, 32),
('menu_update', 2, '菜单修改', NULL, NULL, NULL, NULL, 32),
('param', 2, '规格参数', NULL, NULL, NULL, NULL, 39),
('password_update', 2, '修改密码', NULL, NULL, NULL, NULL, 75),
('permission_create', 2, '权限添加', NULL, NULL, NULL, NULL, 30),
('permission_delete', 2, '权限删除', NULL, NULL, NULL, NULL, 30),
('permission_update', 2, '权限修改', NULL, NULL, NULL, NULL, 30),
('product', 2, '成品名称', NULL, NULL, NULL, NULL, 44),
('product-template_add', 2, '成品配比', NULL, NULL, NULL, NULL, 51),
('product-template_index', 2, '成品显示', NULL, NULL, NULL, NULL, 52),
('productclass', 2, '成品分类', NULL, NULL, NULL, NULL, 43),
('productunit', 2, '成品单位', NULL, NULL, NULL, NULL, 45),
('product_add', 2, '配货需求', NULL, NULL, NULL, NULL, 54),
('product_del', 2, '删除发配货信息', NULL, NULL, NULL, NULL, 55),
('product_edit', 2, '修改发配货信息', NULL, NULL, NULL, NULL, 55),
('product_groupproduct', 2, '查询', NULL, NULL, NULL, NULL, 60),
('product_inspector', 2, '验货入库', NULL, NULL, NULL, NULL, 56),
('product_search', 2, '成品库查询', NULL, NULL, NULL, NULL, 59),
('product_send', 2, '发货配货', NULL, NULL, NULL, NULL, 55),
('purchase_add', 2, '添加采购', NULL, NULL, NULL, NULL, 47),
('purchase_del', 2, '删除采购信息', NULL, NULL, NULL, NULL, 48),
('purchase_depot', 2, '验货入库', NULL, NULL, NULL, NULL, 49),
('purchase_edit', 2, '修改采购信息', NULL, NULL, NULL, NULL, 48),
('purchase_index', 2, '采购管理', NULL, NULL, NULL, NULL, 48),
('purchase_search', 2, '食材库查询', NULL, NULL, NULL, NULL, 58),
('role_create', 2, '角色添加', NULL, NULL, NULL, NULL, 31),
('role_delete', 2, '角色删除', NULL, NULL, NULL, NULL, 31),
('role_permission', 2, '角色权限设置', NULL, NULL, NULL, NULL, 31),
('role_update', 2, '角色修改', NULL, NULL, NULL, NULL, 31),
('shortcut_update', 2, '设置快捷方式', NULL, NULL, NULL, NULL, 74),
('supplier', 2, '供应商', NULL, NULL, NULL, NULL, 42),
('zongadming', 1, '总管理员', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `wx_auth_item_child`
--

CREATE TABLE IF NOT EXISTS `wx_auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员权限关系表';

--
-- 转存表中的数据 `wx_auth_item_child`
--

INSERT INTO `wx_auth_item_child` (`parent`, `child`) VALUES
('zongadming', 'admin_create'),
('zongadming', 'admin_delete'),
('zongadming', 'admin_quickentry'),
('zongadming', 'admin_update'),
('zongadming', 'brand'),
('zongadming', 'consume_add'),
('zongadming', 'consume_groupproduct'),
('zongadming', 'consume_index'),
('zongadming', 'consume_sh'),
('zongadming', 'food'),
('zongadming', 'foodclass'),
('zongadming', 'foodunit'),
('zongadming', 'menu_create'),
('zongadming', 'menu_delete'),
('zongadming', 'menu_taxis'),
('zongadming', 'menu_update'),
('zongadming', 'param'),
('zongadming', 'permission_create'),
('zongadming', 'permission_delete'),
('zongadming', 'permission_update'),
('zongadming', 'product'),
('zongadming', 'product-template_add'),
('zongadming', 'product-template_index'),
('zongadming', 'productclass'),
('zongadming', 'productunit'),
('zongadming', 'product_add'),
('zongadming', 'product_del'),
('zongadming', 'product_edit'),
('zongadming', 'product_groupproduct'),
('zongadming', 'product_inspector'),
('zongadming', 'product_search'),
('zongadming', 'product_send'),
('zongadming', 'purchase_add'),
('zongadming', 'purchase_del'),
('zongadming', 'purchase_depot'),
('zongadming', 'purchase_edit'),
('zongadming', 'purchase_index'),
('zongadming', 'purchase_search'),
('zongadming', 'role_create'),
('zongadming', 'role_delete'),
('zongadming', 'role_permission'),
('zongadming', 'role_update'),
('zongadming', 'supplier');

-- --------------------------------------------------------

--
-- 表的结构 `wx_menu`
--

CREATE TABLE IF NOT EXISTS `wx_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL COMMENT '名称',
  `parent` int(11) DEFAULT '0' COMMENT '上级菜单',
  `route` varchar(256) DEFAULT NULL,
  `taxis` int(11) DEFAULT '0' COMMENT '排序字段 默认0,以数字倒序排列',
  `data` text,
  `url` varchar(100) DEFAULT NULL COMMENT '菜单链接地址',
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`),
  KEY `name` (`name`),
  KEY `route` (`route`(255)),
  KEY `order` (`taxis`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='系统管理员菜单权限表\r\n' AUTO_INCREMENT=66 ;

--
-- 转存表中的数据 `wx_menu`
--

INSERT INTO `wx_menu` (`id`, `name`, `parent`, `route`, `taxis`, `data`, `url`) VALUES
(29, '系统设置', 0, NULL, 1, NULL, ''),
(30, '权限管理', 29, NULL, NULL, NULL, 'permission-form/index'),
(31, '角色管理', 29, NULL, NULL, NULL, 'role-form/index'),
(32, '菜单管理', 29, NULL, NULL, NULL, 'menu/index'),
(33, '用户管理', 29, NULL, NULL, NULL, 'admin/index'),
(34, '设置快捷方式', 29, NULL, 1, NULL, 'shortcut/index'),
(35, '修改密码', 29, NULL, 2, NULL, 'admin/edit-password'),
(36, '基础信息', 0, NULL, 10, NULL, ''),
(37, '食材分类', 36, NULL, NULL, NULL, 'refcode/index?type_code=foodclass'),
(38, '食材名称', 36, NULL, NULL, NULL, 'refcode/index?type_code=food'),
(39, '规格参数', 36, NULL, NULL, NULL, 'refcode/index?type_code=param'),
(40, '食材单位', 36, NULL, NULL, NULL, 'refcode/index?type_code=foodunit'),
(41, '品牌', 36, NULL, NULL, NULL, 'refcode/index?type_code=brand'),
(42, '供应商', 36, NULL, NULL, NULL, 'refcode/index?type_code=supplier'),
(43, '成品分类', 36, NULL, NULL, NULL, 'refcode/index?type_code=productclass'),
(44, '成品名称', 36, NULL, NULL, NULL, 'refcode/index?type_code=product'),
(45, '成品单位', 36, NULL, NULL, NULL, 'refcode/index?type_code=productunit'),
(46, '采购入库', 0, NULL, 9, NULL, ''),
(47, '添加采购', 46, NULL, NULL, NULL, 'purchase/create'),
(48, '采购管理', 46, NULL, NULL, NULL, 'purchase/index'),
(49, '验货入库', 46, NULL, NULL, NULL, 'purchase/depot'),
(50, '食材配比', 0, NULL, 8, NULL, ''),
(51, '成品配比', 50, NULL, NULL, NULL, 'product-template/create'),
(52, '成品显示', 50, NULL, NULL, NULL, 'product-template/index'),
(53, '成品管理', 0, NULL, 7, NULL, ''),
(54, '配货需求', 53, NULL, NULL, NULL, 'product/create'),
(55, '发货配货', 53, NULL, NULL, NULL, 'product/send'),
(56, '验货入库', 53, NULL, NULL, NULL, 'product/inspector'),
(57, '数据查询', 0, NULL, 6, NULL, ''),
(58, '食材库查询', 57, NULL, NULL, NULL, 'purchase/search'),
(59, '成品库查询', 57, NULL, NULL, NULL, 'product/search'),
(60, '发货完成基准价', 57, NULL, NULL, NULL, 'product/groupproduct'),
(61, '成品消耗基准价', 57, NULL, NULL, NULL, 'consume/groupproduct'),
(62, '成品消耗', 0, NULL, 5, NULL, ''),
(63, '消耗管理', 62, NULL, 3, NULL, 'consume/index'),
(64, '消耗添加', 62, NULL, 4, NULL, 'consume/create'),
(65, '报损审核', 62, NULL, NULL, NULL, 'consume/sh');

-- --------------------------------------------------------

--
-- 表的结构 `wx_procut`
--

CREATE TABLE IF NOT EXISTS `wx_procut` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booker_id` int(11) DEFAULT NULL COMMENT '配货人',
  `book_date` int(11) NOT NULL COMMENT '配货时间',
  `book_comment` int(11) DEFAULT NULL COMMENT '配货意见',
  `arrive_date` int(11) NOT NULL COMMENT '需要达到时间',
  `is_customer` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0：本单位 1：其他单位',
  `total_price` float DEFAULT NULL COMMENT '总价',
  `sender_id` int(11) DEFAULT NULL COMMENT '发货人',
  `send_date` int(11) DEFAULT NULL COMMENT '发货时间',
  `send_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '发货状态 0：未发货 1：已发货',
  `send_comment` text COMMENT '发货意见',
  `inspector_id` int(11) DEFAULT NULL COMMENT '验货人',
  `inspect_date` int(11) DEFAULT NULL COMMENT '验货时间（入库时间）',
  `inspect_status` tinyint(4) DEFAULT NULL COMMENT '验货状态 0：未验货 1：已入库',
  `inspect_comment` text COMMENT '验收意见',
  `is_del` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除 1是，0否',
  `customer` varchar(128) DEFAULT NULL COMMENT '配送客户名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='成品配、发、验货主表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `wx_product_consume`
--

CREATE TABLE IF NOT EXISTS `wx_product_consume` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productclass_id` int(11) NOT NULL COMMENT '成品分类',
  `product_id` int(11) NOT NULL COMMENT '成品名称',
  `unitprice` float NOT NULL COMMENT '销售单价',
  `price` float NOT NULL COMMENT '单成品销售总价',
  `count` int(11) NOT NULL DEFAULT '0' COMMENT '消耗数量',
  `consume_type` tinyint(4) NOT NULL COMMENT '消耗方式 1：销售 2：损耗',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '审核状态 1：销售默认审核通过 0：报损需要指定人员审核',
  `create_dt` int(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='成品消耗表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `wx_product_entry`
--

CREATE TABLE IF NOT EXISTS `wx_product_entry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productclass_id` int(11) NOT NULL COMMENT '成品分类',
  `product_id` int(11) NOT NULL COMMENT '成品名称',
  `unitprice` float NOT NULL COMMENT '基准价',
  `unit` varchar(32) NOT NULL COMMENT '单位',
  `price` float NOT NULL COMMENT '单成品总价',
  `book_count` int(11) NOT NULL DEFAULT '0' COMMENT '配货数量',
  `send_count` int(11) NOT NULL DEFAULT '0' COMMENT '实际发货数量',
  `depot_count` int(11) NOT NULL DEFAULT '0' COMMENT '验货数量（入库数量',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否入库 0：未入库 1：已入库',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='成品配、发、验货详细表（成品库存表）' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `wx_product_template`
--

CREATE TABLE IF NOT EXISTS `wx_product_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productclass_id` int(11) DEFAULT NULL COMMENT '成品分类',
  `product_id` int(11) DEFAULT NULL COMMENT '成品名称',
  `unitprice` float DEFAULT NULL COMMENT '基准价',
  `unit` varchar(32) DEFAULT NULL COMMENT '单位',
  `is_del` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除 1是，0否',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='成品模板主表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `wx_product_template`
--

INSERT INTO `wx_product_template` (`id`, `productclass_id`, `product_id`, `unitprice`, `unit`, `is_del`) VALUES
(1, 10, 14, 100, '16', 0);

-- --------------------------------------------------------

--
-- 表的结构 `wx_product_template_entry`
--

CREATE TABLE IF NOT EXISTS `wx_product_template_entry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ptid` int(11) DEFAULT NULL,
  `foodclass_id` int(11) DEFAULT NULL COMMENT '食材分类',
  `food_id` int(11) DEFAULT NULL COMMENT '食材名称',
  `count` int(11) DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='成品模板明细表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `wx_purchase`
--

CREATE TABLE IF NOT EXISTS `wx_purchase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `foodclass_id` int(11) DEFAULT NULL COMMENT '食材分类',
  `food_id` int(11) DEFAULT NULL COMMENT '食材名称',
  `param_id` int(11) DEFAULT NULL COMMENT '规格参数',
  `book_count` int(11) NOT NULL DEFAULT '0' COMMENT '采购数量',
  `price` float DEFAULT NULL COMMENT '单价',
  `unit` varchar(32) DEFAULT NULL COMMENT '单位',
  `brand` varchar(128) DEFAULT NULL COMMENT '品牌',
  `supplier` varchar(128) DEFAULT NULL COMMENT '供应商',
  `pur_user` int(11) NOT NULL COMMENT '采购人',
  `pur_date` int(11) NOT NULL COMMENT '采购时间',
  `depot_user` int(11) NOT NULL COMMENT '入库人',
  `depot_count` int(11) NOT NULL DEFAULT '0' COMMENT '入库数量',
  `depot_date` int(11) NOT NULL COMMENT '入库时间',
  `sycount` int(11) NOT NULL DEFAULT '0' COMMENT '剩余数量',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0：未入库，1已入库',
  `comment` text NOT NULL COMMENT '验收意见',
  `is_del` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除 1是，0否',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='采购表（市场库存表）' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `wx_purchase`
--

INSERT INTO `wx_purchase` (`id`, `foodclass_id`, `food_id`, `param_id`, `book_count`, `price`, `unit`, `brand`, `supplier`, `pur_user`, `pur_date`, `depot_user`, `depot_count`, `depot_date`, `sycount`, `status`, `comment`, `is_del`) VALUES
(1, 2, 3, 7, 21, 100, '111', '11', '111', 2222, 222, 222, 22, 22, 22, 22, '22', 22);

-- --------------------------------------------------------

--
-- 表的结构 `wx_refcode`
--

CREATE TABLE IF NOT EXISTS `wx_refcode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nm` varchar(128) DEFAULT NULL,
  `value` varchar(64) DEFAULT NULL COMMENT '对应的值',
  `type` varchar(32) DEFAULT NULL COMMENT '类型',
  `pid` int(11) DEFAULT NULL COMMENT '父类id',
  `pid2` int(11) DEFAULT NULL COMMENT '食材单位',
  `is_del` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除 1是，0否',
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='基础表' AUTO_INCREMENT=22 ;

--
-- 转存表中的数据 `wx_refcode`
--

INSERT INTO `wx_refcode` (`id`, `nm`, `value`, `type`, `pid`, `pid2`, `is_del`) VALUES
(1, '牛肉1w', NULL, NULL, NULL, NULL, 1),
(2, '禽类21', NULL, 'foodclass', NULL, NULL, 0),
(3, '鸡肉', '20', 'food', 2, NULL, 0),
(4, '鸭肉', '10', 'food', 2, NULL, 1),
(5, '蔬菜', NULL, 'foodclass', NULL, NULL, 0),
(6, '食材1公司', NULL, 'supplier', NULL, NULL, 0),
(7, '年份', NULL, 'param', 3, NULL, 0),
(8, '鸭肉', '30', 'food', 2, 19, 0),
(9, '长度', NULL, 'param', 8, NULL, 0),
(10, '粤菜', NULL, 'productclass', NULL, NULL, 0),
(11, '湘菜', NULL, 'productclass', NULL, NULL, 0),
(12, '川菜', NULL, 'productclass', NULL, NULL, 0),
(13, '江浙菜', NULL, 'productclass', NULL, NULL, 0),
(14, '龙虎斗', NULL, 'product', 10, NULL, 0),
(15, '兴宁烤鸡', NULL, 'product', 13, NULL, 0),
(16, '斤', NULL, 'productunit', NULL, NULL, 0),
(17, '公斤', NULL, 'productunit', NULL, NULL, 0),
(18, '磅', NULL, 'productunit', NULL, NULL, 0),
(19, '只', NULL, 'foodunit', NULL, NULL, 0),
(20, '斤', NULL, 'foodunit', NULL, NULL, 0),
(21, '磅', NULL, 'foodunit', NULL, NULL, 0);

--
-- 限制导出的表
--

--
-- 限制表 `wx_auth_assignment`
--
ALTER TABLE `wx_auth_assignment`
  ADD CONSTRAINT `wx_auth_assignment_ibfk_2` FOREIGN KEY (`item_name`) REFERENCES `wx_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
