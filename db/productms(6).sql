-- phpMyAdmin SQL Dump
-- version 4.4.15
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2018-06-25 13:26:55
-- 服务器版本： 10.1.9-MariaDB
-- PHP Version: 7.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


--
-- Database: `productms`
--

-- --------------------------------------------------------

--
-- 表的结构 `wx_admin`
--

CREATE TABLE IF NOT EXISTS `wx_admin` (
  `id` int(11) NOT NULL,
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
  `level` tinyint(2) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `wx_admin`
--

INSERT INTO `wx_admin` (`id`, `username`, `password`, `name`, `gender`, `correspondence_id`, `role_name`, `is_delete`, `my_quickentry`, `courseids`, `disciplineids`, `p_id`, `level`) VALUES
(1, 'admin', '96e79218965eb72c92a549dd5a330112', '超级管理员', 1, NULL, 'zongadming', 0, '{"75":{"id":75,"name":"\\u4fee\\u6539\\u5bc6\\u7801","url":"admin\\/edit-password"}}', '', '', 1, 1),
(2, 'test', '96e79218965eb72c92a549dd5a330112', '测试账号', 1, NULL, NULL, 0, NULL, NULL, NULL, 1, 0),
(3, 'member', '96e79218965eb72c92a549dd5a330112', '测试', 1, NULL, NULL, 0, NULL, NULL, NULL, 2, 0),
(4, 'zs', '96e79218965eb72c92a549dd5a330112', '招生1', 1, NULL, 'zhaosheng', 0, NULL, NULL, NULL, 0, 0),
(5, 'user1', '96e79218965eb72c92a549dd5a330112', '食材采购', 1, NULL, 'caigou', 0, NULL, NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `wx_auth_assignment`
--

CREATE TABLE IF NOT EXISTS `wx_auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员授权表';

--
-- 转存表中的数据 `wx_auth_assignment`
--

INSERT INTO `wx_auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('zongadming', '1', 1470623219),
('caigou', '5', 1529631272);

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
  `menu_id` int(11) DEFAULT NULL COMMENT '权限所属菜单'
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
('bs_del', 2, '删除报损', NULL, NULL, NULL, NULL, 65),
('bs_sh', 2, '报损审核', NULL, NULL, NULL, NULL, 65),
('caigou', 1, '食材采购人员', NULL, NULL, NULL, NULL, NULL),
('cangkuadmin', 1, '食材仓管理人员', NULL, NULL, NULL, NULL, NULL),
('chengpincang', 1, '成品仓管理人员', NULL, NULL, NULL, NULL, NULL),
('consume_add', 2, '添加', NULL, NULL, NULL, NULL, 64),
('consume_del', 2, '消耗删除', NULL, NULL, NULL, NULL, 63),
('consume_edit', 2, '消耗编辑', NULL, NULL, NULL, NULL, 63),
('consume_groupproduct', 2, '查询', NULL, NULL, NULL, NULL, 61),
('consume_index', 2, '列表', NULL, NULL, NULL, NULL, 63),
('consume_sh', 2, '报损管理', NULL, NULL, NULL, NULL, 65),
('food', 2, '食材名称', NULL, NULL, NULL, NULL, 38),
('foodclass', 2, '食材分类', NULL, NULL, NULL, NULL, 37),
('foodunit', 2, '食材单位', NULL, NULL, NULL, NULL, 40),
('menu_create', 2, '菜单添加', NULL, NULL, NULL, NULL, 32),
('menu_delete', 2, '菜单删除', NULL, NULL, NULL, NULL, 32),
('menu_taxis', 2, '菜单排序', NULL, NULL, NULL, NULL, 32),
('menu_update', 2, '菜单修改', NULL, NULL, NULL, NULL, 32),
('param', 2, '规格参数', NULL, NULL, NULL, NULL, 39),
('password_update', 2, '修改密码', NULL, NULL, NULL, NULL, 75),
('peihuo', 1, '成品配货人员', NULL, NULL, NULL, NULL, NULL),
('permission_create', 2, '权限添加', NULL, NULL, NULL, NULL, 30),
('permission_delete', 2, '权限删除', NULL, NULL, NULL, NULL, 30),
('permission_update', 2, '权限修改', NULL, NULL, NULL, NULL, 30),
('product', 2, '成品名称', NULL, NULL, NULL, NULL, 44),
('product-template_add', 2, '成品配比', NULL, NULL, NULL, NULL, 51),
('product-template_index', 2, '成品显示', NULL, NULL, NULL, NULL, 52),
('productclass', 2, '成品分类', NULL, NULL, NULL, NULL, 43),
('productunit', 2, '成品单位', NULL, NULL, NULL, NULL, 45),
('product_add', 2, '添加配货', NULL, NULL, NULL, NULL, 54),
('product_consume', 2, '添加消耗', NULL, NULL, NULL, NULL, 66),
('product_consumelist', 2, '消耗管理', NULL, NULL, NULL, NULL, 67),
('product_del', 2, '删除发配货信息', NULL, NULL, NULL, NULL, 54),
('product_edit', 2, '修改发配货信息', NULL, NULL, NULL, NULL, 54),
('product_groupproduct', 2, '查询', NULL, NULL, NULL, NULL, 60),
('product_inspector', 2, '验货入库', NULL, NULL, NULL, NULL, 56),
('product_search', 2, '成品库查询', NULL, NULL, NULL, NULL, 59),
('product_send', 2, '发货配货', NULL, NULL, NULL, NULL, 55),
('purchase_add', 2, '添加采购', NULL, NULL, NULL, NULL, 47),
('purchase_del', 2, '删除采购信息', NULL, NULL, NULL, NULL, 48),
('purchase_depot', 2, '验货入库', NULL, NULL, NULL, NULL, 49),
('purchase_edit', 2, '修改采购信息', NULL, NULL, NULL, NULL, 48),
('purchase_index', 2, '采购查看', NULL, NULL, NULL, NULL, 48),
('purchase_search', 2, '食材库查询', NULL, NULL, NULL, NULL, 58),
('role_create', 2, '角色添加', NULL, NULL, NULL, NULL, 31),
('role_delete', 2, '角色删除', NULL, NULL, NULL, NULL, 31),
('role_permission', 2, '角色权限设置', NULL, NULL, NULL, NULL, 31),
('role_update', 2, '角色修改', NULL, NULL, NULL, NULL, 31),
('shortcut_update', 2, '设置快捷方式', NULL, NULL, NULL, NULL, 74),
('supplier', 2, '供应商', NULL, NULL, NULL, NULL, 42),
('xiaoshou', 1, '成品销售人员', NULL, NULL, NULL, NULL, NULL),
('zongadming', 1, '总管理员', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `wx_auth_item_child`
--

CREATE TABLE IF NOT EXISTS `wx_auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员权限关系表';

--
-- 转存表中的数据 `wx_auth_item_child`
--

INSERT INTO `wx_auth_item_child` (`parent`, `child`) VALUES
('caigou', 'purchase_add'),
('caigou', 'purchase_index'),
('cangkuadmin', 'brand'),
('cangkuadmin', 'consume_groupproduct'),
('cangkuadmin', 'food'),
('cangkuadmin', 'foodclass'),
('cangkuadmin', 'foodunit'),
('cangkuadmin', 'param'),
('cangkuadmin', 'product'),
('cangkuadmin', 'productclass'),
('cangkuadmin', 'productunit'),
('cangkuadmin', 'product_groupproduct'),
('cangkuadmin', 'product_search'),
('cangkuadmin', 'purchase_depot'),
('cangkuadmin', 'purchase_search'),
('cangkuadmin', 'supplier'),
('chengpincang', 'consume_groupproduct'),
('chengpincang', 'product-template_add'),
('chengpincang', 'product-template_index'),
('chengpincang', 'product_groupproduct'),
('chengpincang', 'product_inspector'),
('chengpincang', 'product_search'),
('chengpincang', 'purchase_search'),
('peihuo', 'product_add'),
('peihuo', 'product_send'),
('xiaoshou', 'consume_add'),
('xiaoshou', 'consume_groupproduct'),
('xiaoshou', 'consume_index'),
('xiaoshou', 'product_groupproduct'),
('xiaoshou', 'product_search'),
('xiaoshou', 'purchase_search'),
('zongadming', 'admin_create'),
('zongadming', 'admin_delete'),
('zongadming', 'admin_quickentry'),
('zongadming', 'admin_update'),
('zongadming', 'brand'),
('zongadming', 'bs_del'),
('zongadming', 'bs_sh'),
('zongadming', 'consume_groupproduct'),
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
('zongadming', 'product_consume'),
('zongadming', 'product_consumelist'),
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
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL COMMENT '名称',
  `parent` int(11) DEFAULT '0' COMMENT '上级菜单',
  `route` varchar(256) DEFAULT NULL,
  `taxis` int(11) DEFAULT '0' COMMENT '排序字段 默认0,以数字倒序排列',
  `data` text,
  `url` varchar(100) DEFAULT NULL COMMENT '菜单链接地址'
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COMMENT='系统管理员菜单权限表\r\n';

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
(54, '配货需求', 53, NULL, NULL, NULL, 'product/createlist'),
(55, '发货配货', 53, NULL, NULL, NULL, 'product/sendlist'),
(56, '验货入库', 53, NULL, NULL, NULL, 'product/inspectorlist'),
(57, '数据查询', 0, NULL, 6, NULL, ''),
(58, '食材库查询', 57, NULL, NULL, NULL, 'purchase/search'),
(59, '成品库查询', 57, NULL, NULL, NULL, 'product/search'),
(60, '发货完成基准价', 57, NULL, NULL, NULL, 'product/groupproduct'),
(61, '成品消耗基准价', 57, NULL, NULL, NULL, 'product-consume/search'),
(62, '成品消耗', 0, NULL, 5, NULL, ''),
(65, '报损管理', 62, NULL, NULL, NULL, 'product-consume/sh'),
(66, '添加消耗', 62, NULL, 4, NULL, 'product/consume'),
(67, '消耗管理', 62, NULL, 3, NULL, 'product/consumelist');

-- --------------------------------------------------------

--
-- 表的结构 `wx_pf_map`
--

CREATE TABLE IF NOT EXISTS `wx_pf_map` (
  `id` int(11) NOT NULL,
  `pid` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `wx_pf_map`
--

INSERT INTO `wx_pf_map` (`id`, `pid`, `product_id`, `purchase_id`, `num`, `price`) VALUES
(1, 3, 39, 1, 12, '23.12'),
(2, 4, 26, 7, 8, '50.00'),
(3, 4, 26, 1, 21, '23.12'),
(4, 8, 26, 9, 2, '20.00'),
(5, 8, 26, 8, 7, '18.00'),
(6, 8, 26, 9, 6, '20.00'),
(7, 8, 26, 8, 7, '18.00'),
(8, 9, 26, 9, 6, '20.00'),
(9, 9, 26, 8, 7, '18.00'),
(10, 10, 26, 9, 6, '20.00'),
(11, 10, 26, 8, 7, '18.00'),
(12, 11, 26, 9, 6, '20.00'),
(13, 11, 26, 8, 7, '18.00'),
(14, 12, 26, 9, 6, '20.00'),
(15, 12, 26, 8, 7, '18.00'),
(16, 14, 27, 5, 44, '15.00'),
(17, 19, 39, 13, 12, '30.00'),
(18, 20, 39, 13, 15, '30.00');

-- --------------------------------------------------------

--
-- 表的结构 `wx_product`
--

CREATE TABLE IF NOT EXISTS `wx_product` (
  `id` int(11) NOT NULL,
  `booker_user` varchar(32) DEFAULT NULL COMMENT '配货人',
  `book_date` int(11) NOT NULL COMMENT '配货时间',
  `book_comment` text COMMENT '配货意见',
  `arrive_date` int(11) NOT NULL COMMENT '需要达到时间',
  `is_customer` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0：本单位 1：其他单位',
  `total_price` decimal(10,2) DEFAULT NULL COMMENT '总价',
  `sender_user` varchar(32) DEFAULT NULL COMMENT '发货人',
  `send_date` int(11) DEFAULT NULL COMMENT '发货时间',
  `send_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '发货状态 0：未发货 1：已发货',
  `send_comment` text COMMENT '发货意见',
  `inspector_user` varchar(32) DEFAULT NULL COMMENT '验货人',
  `inspect_date` int(11) DEFAULT NULL COMMENT '验货时间（入库时间）',
  `inspect_status` tinyint(4) DEFAULT NULL COMMENT '验货状态 0：未验货 1：已入库',
  `inspect_comment` text COMMENT '验收意见',
  `is_del` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除 1是，0否',
  `customer` varchar(128) DEFAULT NULL COMMENT '配送客户名称',
  `is_consume` tinyint(4) DEFAULT '0' COMMENT '是否消耗完 0：未消耗完 1：已消耗完',
  `consume_status` tinyint(4) DEFAULT '0' COMMENT '是否消耗 0：未消耗 1：已消耗'
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='成品配、发、验货主表';

--
-- 转存表中的数据 `wx_product`
--

INSERT INTO `wx_product` (`id`, `booker_user`, `book_date`, `book_comment`, `arrive_date`, `is_customer`, `total_price`, `sender_user`, `send_date`, `send_status`, `send_comment`, `inspector_user`, `inspect_date`, `inspect_status`, `inspect_comment`, `is_del`, `customer`, `is_consume`, `consume_status`) VALUES
(1, '超级管理员', 1529596800, '同意配货', 1529596800, 0, '38.84', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, '顾问杂货铺子', 0, 0),
(2, '超级管理员', 1529596800, '', 1529683200, 0, '150.27', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, '', 0, 0),
(3, '超级管理员', 1529683200, '', 1529769600, 1, '1332.32', '超级管理员', 1529596800, 1, '', NULL, NULL, NULL, NULL, 0, 'A', 0, 0),
(4, '超级管理员', 1529596800, '', 1529942400, 0, '1430.00', '超级管理员', 2147483647, 1, '', '超级管理员', 1529596800, 1, '', 0, '', 0, 0),
(5, '超级管理员', 1529596800, '同意配货', 1529596800, 0, '71.58', '超级管理员', 1529683200, 1, '', '超级管理员', 1529683200, 1, '', 0, '顾问杂货铺子', 0, 0),
(6, '超级管理员', 1529683200, '', 1529769600, 1, '1332.32', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 'A', 0, 0),
(7, '超级管理员', 1529596800, '', 1530201600, 0, '915.50', '超级管理员', 2147483647, 1, '', '超级管理员', 1529596800, 1, '', 0, '', 0, 0),
(8, '超级管理员', 1529596800, '', 1530115200, 0, '399.60', '超级管理员', 2147483647, 1, '', '超级管理员', 1529596800, 1, '', 0, '', 0, 0),
(9, '超级管理员', 1529596800, '', 1530115200, 0, '126.00', '超级管理员', 2147483647, 1, '', '超级管理员', 1529596800, 1, '', 0, '', 0, 0),
(10, '超级管理员', 1529596800, '同意配货', 1529596800, 0, '126.00', '超级管理员', 2147483647, 1, '', '超级管理员', 1529596800, 1, '', 0, 'AB', 0, 0),
(11, '超级管理员', 1529596800, '同意配货', 1529596800, 0, '246.00', '超级管理员', 1529596800, 1, '', '超级管理员', 1529596800, 1, '', 0, '顾问杂货铺子', 0, 0),
(12, '超级管理员', 1529596800, '同意配货', 1529596800, 0, '246.00', '超级管理员', 1529596800, 1, '', '超级管理员', 1529596800, 1, '', 0, 'AB', 0, 0),
(13, '超级管理员', 1529596800, '', 1529510400, 0, '335.70', '超级管理员', 1529596800, 1, '', '超级管理员', 1529596800, 1, '', 0, '', 0, 0),
(14, '超级管理员', 1529596800, '', 1529856000, 0, '1119.00', '超级管理员', 1529596800, 1, '', '超级管理员', 1529596800, 1, '', 0, '', 0, 0),
(15, '超级管理员', 1529683200, '可以配送', 1529683200, 0, '49.20', '超级管理员', 1529683200, 1, '发挥', '超级管理员', 1529683200, 1, '', 0, '顾问杂货店', 0, 0),
(16, '超级管理员', 1529683200, '可以配送', 1530288000, 1, '49.20', '超级管理员', 1529683200, 1, '', '超级管理员', 1529683200, NULL, NULL, 0, '杂货店', 0, 0),
(17, '超级管理员', 1529683200, '', 1529942400, 0, '1261.74', '超级管理员', 1529683200, 1, '', '超级管理员', 1529683200, 1, '', 0, '', 0, 1),
(18, '超级管理员', 1529683200, '', 1530028800, 0, '75540.52', '超级管理员', 1529683200, 1, '', '超级管理员', 1529683200, 1, '', 0, '', 1, 1),
(19, '超级管理员', 1529683200, '', 1529769600, 1, '1319.00', '超级管理员', 1529683200, 1, '', '超级管理员', 1529683200, NULL, NULL, 0, 'A', 0, 0),
(20, '超级管理员', 1529683200, '', 1529856000, 0, '1022.00', '超级管理员', 1529683200, 1, '', '超级管理员', 1529683200, 1, '', 0, '', 1, 1),
(21, '超级管理员', 1529683200, '', 1529856000, 0, '1376.40', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, '', 0, 0),
(22, '超级管理员', 1529683200, '', 1529856000, 0, '1376.40', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, '', 0, 0),
(23, '超级管理员', 1529683200, '', 1529856000, 0, '968.00', '超级管理员', 1529769600, 1, '', '超级管理员', 1529769600, 1, '', 0, '', 1, 1),
(24, '超级管理员', 1529683200, '', 1530266520, 0, '860.00', '超级管理员', 1529683200, 1, '', '超级管理员', 1529769600, 1, '', 0, '', 1, 1),
(25, '超级管理员', 1529683200, '', 1530266400, 0, '941.00', '超级管理员', 1529769600, 1, '', '超级管理员', 1529850780, 1, '', 0, '', 1, 1),
(26, '超级管理员', 1529683200, '', 1530354900, 0, '1340.40', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, '', 0, 0),
(27, '超级管理员', 1529683200, '', 1530268500, 0, '941.00', '超级管理员', 1529769600, 1, '', '超级管理员', 1529769600, 1, '', 0, '', 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `wx_product_consume`
--

CREATE TABLE IF NOT EXISTS `wx_product_consume` (
  `id` int(11) NOT NULL,
  `productclass_id` int(11) NOT NULL COMMENT '成品分类',
  `product_id` int(11) NOT NULL COMMENT '成品名称',
  `unitprice` decimal(10,2) DEFAULT '0.00' COMMENT '销售单价',
  `price` decimal(10,2) DEFAULT '0.00' COMMENT '单成品销售总价',
  `count` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '报损数量',
  `consume_type` tinyint(4) NOT NULL COMMENT '消耗方式 1：销售 2：损耗',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '审核状态 1：销售默认审核通过 0：报损需要指定人员审核',
  `create_dt` int(11) NOT NULL COMMENT '添加时间',
  `create_user` varchar(64) NOT NULL COMMENT '添加人',
  `is_del` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `product_entry_id` int(11) NOT NULL COMMENT '成品库存表id'
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='成品消耗表';

--
-- 转存表中的数据 `wx_product_consume`
--

INSERT INTO `wx_product_consume` (`id`, `productclass_id`, `product_id`, `unitprice`, `price`, `count`, `consume_type`, `status`, `create_dt`, `create_user`, `is_del`, `product_entry_id`) VALUES
(1, 18, 27, '80.00', '800.00', '10.00', 1, 1, 1529659833, '', 0, 0),
(2, 18, 27, '80.00', '1600.00', '20.00', 2, 1, 1529660616, '', 0, 0),
(3, 18, 27, '66.00', '330.00', '5.00', 1, 1, 1529667007, '', 0, 0),
(4, 18, 27, '0.00', '0.00', '20.00', 2, 1, 1529667554, '', 0, 0),
(5, 18, 27, '0.00', '0.00', '-1.00', 2, 0, 1529890067, '', 0, 44),
(6, 18, 39, '0.00', '0.00', '8.00', 2, 0, 1529890370, '', 0, 59),
(7, 18, 39, '0.00', '0.00', '4.00', 2, 0, 1529890723, '', 0, 59),
(8, 18, 27, '0.00', '0.00', '6.00', 2, 0, 1529891189, '超级管理员', 0, 44),
(9, 18, 27, '0.00', '0.00', '2.00', 2, 0, 1529891189, '111', 0, 44),
(10, 18, 27, '0.00', '0.00', '1.00', 2, 0, 0, '超级管理员', 0, 44),
(11, 18, 27, '0.00', '0.00', '1.00', 2, 0, 0, '超级管理员', 0, 44),
(12, 18, 27, '0.00', '0.00', '1.00', 2, 1, 0, '超级管理员', 0, 44),
(13, 18, 27, '0.00', '0.00', '1.00', 2, 0, 1529892610, '超级管理员', 0, 44),
(14, 18, 27, '0.00', '0.00', '1.00', 2, 0, 1529892626, '超级管理员', 0, 44),
(15, 18, 27, '0.00', '0.00', '2.00', 2, 0, 1529896571, '超级管理员', 0, 44),
(16, 18, 27, '0.00', '0.00', '3.00', 2, 1, 1529896603, '超级管理员', 0, 44),
(17, 18, 26, '0.00', '0.00', '5.00', 2, 1, 1529896868, '超级管理员', 0, 27),
(18, 18, 27, '0.00', '0.00', '9.00', 2, 0, 1529899004, '超级管理员', 0, 44),
(19, 18, 27, '0.00', '0.00', '8.00', 2, 1, 1529899094, '超级管理员', 0, 44);

-- --------------------------------------------------------

--
-- 表的结构 `wx_product_consume_entry`
--

CREATE TABLE IF NOT EXISTS `wx_product_consume_entry` (
  `id` int(11) NOT NULL,
  `product_consume_id` int(11) DEFAULT NULL COMMENT '成品消耗表id',
  `product_entry_id` int(11) DEFAULT NULL COMMENT '成品库存表id',
  `count` decimal(10,2) DEFAULT '0.00' COMMENT '消耗数量',
  `is_del` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除'
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='成品消耗子表';

--
-- 转存表中的数据 `wx_product_consume_entry`
--

INSERT INTO `wx_product_consume_entry` (`id`, `product_consume_id`, `product_entry_id`, `count`, `is_del`) VALUES
(1, 1, 16, '10.00', 0),
(2, 3, 23, '5.00', 0),
(3, 2, 23, '10.00', 0),
(4, 2, 24, '10.00', 0),
(5, 4, 24, '20.00', 0),
(6, 16, 12, '1.00', 0),
(7, 16, 24, '2.00', 0),
(8, 17, 11, '5.00', 0),
(9, 12, 24, '1.00', 0),
(10, 19, 24, '8.00', 0);

-- --------------------------------------------------------

--
-- 表的结构 `wx_product_entry`
--

CREATE TABLE IF NOT EXISTS `wx_product_entry` (
  `id` int(11) NOT NULL,
  `pid` int(11) NOT NULL COMMENT '主表id',
  `productclass_id` int(11) NOT NULL COMMENT '成品分类',
  `product_id` int(11) NOT NULL COMMENT '成品名称',
  `unitprice` decimal(10,2) NOT NULL COMMENT '基准价',
  `unit` varchar(32) NOT NULL COMMENT '单位',
  `price` decimal(10,2) NOT NULL COMMENT '单成品总价',
  `book_count` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '配货数量',
  `send_count` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '实际发货数量',
  `depot_count` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '验货数量（入库数量',
  `sycount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '剩余数量',
  `consume_count` decimal(10,2) NOT NULL DEFAULT '0.00',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否入库 0：未入库 1：已入库'
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COMMENT='成品配、发、验货详细表（成品库存表）';

--
-- 转存表中的数据 `wx_product_entry`
--

INSERT INTO `wx_product_entry` (`id`, `pid`, `productclass_id`, `product_id`, `unitprice`, `unit`, `price`, `book_count`, `send_count`, `depot_count`, `sycount`, `consume_count`, `status`) VALUES
(1, 1, 17, 24, '32.37', '杯', '38.84', '1.20', '0.00', '0.00', '0.00', '0.00', 0),
(4, 2, 18, 26, '32.37', '碗', '32.37', '1.00', '0.00', '0.00', '0.00', '0.00', 0),
(5, 2, 18, 27, '11.79', '千克', '117.90', '10.00', '0.00', '0.00', '0.00', '0.00', 0),
(8, 3, 18, 27, '38.12', '千克', '762.40', '20.00', '20.00', '0.00', '0.00', '0.00', 1),
(9, 3, 18, 39, '35.62', '千克', '569.92', '16.00', '16.00', '0.00', '0.00', '0.00', 1),
(10, 4, 18, 41, '23.12', '千克', '231.20', '10.00', '10.00', '10.00', '10.00', '0.00', 1),
(11, 4, 18, 26, '79.92', '碗', '1198.80', '15.00', '15.00', '15.00', '10.00', '0.00', 1),
(12, 5, 18, 27, '13.20', '千克', '13.20', '1.00', '1.00', '1.00', '0.00', '0.00', 1),
(13, 5, 18, 26, '25.20', '碗', '25.20', '1.00', '1.00', '1.00', '1.00', '0.00', 1),
(14, 6, 18, 27, '38.12', '千克', '762.40', '20.00', '0.00', '0.00', '0.00', '0.00', 0),
(15, 6, 18, 39, '35.62', '千克', '569.92', '16.00', '0.00', '0.00', '0.00', '0.00', 0),
(16, 7, 18, 27, '38.12', '千克', '381.20', '10.00', '10.00', '10.00', '0.00', '0.00', 1),
(17, 7, 18, 39, '35.62', '千克', '534.30', '15.00', '15.00', '15.00', '15.00', '0.00', 1),
(18, 8, 18, 26, '79.92', '碗', '399.60', '5.00', '5.00', '5.00', '5.00', '0.00', 1),
(19, 9, 18, 26, '79.92', '碗', '399.60', '5.00', '5.00', '5.00', '5.00', '0.00', 1),
(20, 10, 18, 26, '79.92', '碗', '399.60', '5.00', '5.00', '5.00', '5.00', '0.00', 1),
(21, 11, 18, 26, '79.92', '碗', '399.60', '5.00', '5.00', '5.00', '5.00', '0.00', 1),
(22, 12, 18, 26, '79.92', '碗', '399.60', '5.00', '5.00', '5.00', '5.00', '0.00', 1),
(23, 13, 18, 27, '38.12', '千克', '571.80', '15.00', '15.00', '15.00', '0.00', '0.00', 1),
(24, 14, 18, 27, '38.12', '千克', '1906.00', '50.00', '50.00', '50.00', '9.00', '0.00', 1),
(25, 15, 18, 26, '25.20', '碗', '25.20', '1.00', '1.00', '1.00', '1.00', '0.00', 1),
(26, 16, 18, 26, '49.20', '碗', '49.20', '1.00', '1.00', '0.00', '0.00', '0.00', 1),
(27, 17, 18, 26, '81.81', '碗', '1227.12', '15.00', '15.00', '15.00', '0.00', '10.00', 1),
(28, 17, 18, 27, '34.62', '千克', '34.62', '1.00', '1.00', '1.00', '0.00', '1.00', 1),
(29, 18, 18, 27, '37.37', '千克', '74730.52', '2000.00', '2000.00', '2000.00', '0.00', '2000.00', 1),
(30, 18, 18, 39, '27.00', '千克', '810.00', '30.00', '30.00', '30.00', '0.00', '30.00', 1),
(31, 19, 18, 27, '24.10', '千克', '482.00', '20.00', '20.00', '0.00', '0.00', '0.00', 1),
(32, 19, 18, 39, '27.00', '千克', '432.00', '16.00', '16.00', '0.00', '0.00', '0.00', 1),
(33, 19, 18, 39, '27.00', '千克', '405.00', '15.00', '15.00', '0.00', '0.00', '0.00', 1),
(34, 20, 18, 27, '24.10', '千克', '482.00', '20.00', '20.00', '20.00', '0.00', '20.00', 1),
(35, 20, 18, 39, '27.00', '千克', '540.00', '20.00', '20.00', '20.00', '0.00', '20.00', 1),
(36, 21, 18, 27, '34.62', '千克', '692.40', '20.00', '0.00', '0.00', '0.00', '0.00', 0),
(37, 21, 18, 39, '36.00', '千克', '684.00', '19.00', '0.00', '0.00', '0.00', '0.00', 0),
(38, 22, 18, 27, '34.62', '千克', '692.40', '20.00', '0.00', '0.00', '0.00', '0.00', 0),
(39, 22, 18, 39, '36.00', '千克', '684.00', '19.00', '0.00', '0.00', '0.00', '0.00', 0),
(40, 23, 18, 27, '24.10', '千克', '482.00', '20.00', '20.00', '20.00', '0.00', '20.00', 1),
(41, 23, 18, 39, '27.00', '千克', '486.00', '18.00', '18.00', '18.00', '0.00', '18.00', 1),
(44, 25, 18, 27, '24.10', '千克', '482.00', '20.00', '20.00', '20.00', '20.00', '8.00', 1),
(45, 25, 18, 39, '27.00', '千克', '459.00', '17.00', '17.00', '17.00', '17.00', '17.00', 1),
(48, 26, 18, 27, '34.62', '千克', '692.40', '20.00', '0.00', '0.00', '0.00', '0.00', 0),
(49, 26, 18, 39, '36.00', '千克', '612.00', '17.00', '0.00', '0.00', '0.00', '0.00', 0),
(52, 26, 18, 27, '34.62', '千克', '692.40', '20.00', '0.00', '0.00', '0.00', '0.00', 0),
(53, 26, 18, 39, '36.00', '千克', '504.00', '14.00', '0.00', '0.00', '0.00', '0.00', 0),
(54, 26, 18, 27, '34.62', '千克', '692.40', '20.00', '0.00', '0.00', '0.00', '0.00', 0),
(55, 26, 18, 39, '36.00', '千克', '612.00', '17.00', '0.00', '0.00', '0.00', '0.00', 0),
(56, 26, 18, 27, '34.62', '千克', '692.40', '20.00', '0.00', '0.00', '0.00', '0.00', 0),
(57, 26, 18, 39, '36.00', '千克', '504.00', '14.00', '0.00', '0.00', '0.00', '0.00', 0),
(58, 27, 18, 27, '24.10', '千克', '482.00', '20.00', '20.00', '20.00', '20.00', '20.00', 1),
(59, 27, 18, 39, '27.00', '千克', '459.00', '17.00', '17.00', '17.00', '17.00', '17.00', 1),
(60, 24, 18, 27, '24.10', '千克', '482.00', '20.00', '20.00', '20.00', '20.00', '20.00', 1),
(61, 24, 18, 39, '27.00', '千克', '378.00', '14.00', '14.00', '14.00', '14.00', '14.00', 1);

-- --------------------------------------------------------

--
-- 表的结构 `wx_product_template`
--

CREATE TABLE IF NOT EXISTS `wx_product_template` (
  `id` int(11) NOT NULL,
  `productclass_id` int(11) DEFAULT NULL COMMENT '成品分类',
  `product_id` int(11) DEFAULT NULL COMMENT '成品名称',
  `unitprice` decimal(10,2) DEFAULT NULL COMMENT '基准价',
  `unit` varchar(32) DEFAULT NULL COMMENT '单位',
  `is_del` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除 1是，0否'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='成品模板主表';

--
-- 转存表中的数据 `wx_product_template`
--

INSERT INTO `wx_product_template` (`id`, `productclass_id`, `product_id`, `unitprice`, `unit`, `is_del`) VALUES
(1, 18, 26, '154.80', '25', 0),
(2, 18, 27, '34.62', '22', 0),
(3, 18, 39, '15.26', '22', 1),
(4, 18, 41, '33.02', '22', 0),
(5, 18, 39, '36.00', '22', 0);

-- --------------------------------------------------------

--
-- 表的结构 `wx_product_template_entry`
--

CREATE TABLE IF NOT EXISTS `wx_product_template_entry` (
  `id` int(11) NOT NULL,
  `ptid` int(11) DEFAULT NULL COMMENT '父类id product_template.id',
  `foodclass_id` int(11) DEFAULT NULL COMMENT '食材分类',
  `food_id` int(11) DEFAULT NULL COMMENT '食材名称',
  `count` decimal(10,2) DEFAULT NULL COMMENT '数量'
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='成品模板明细表';

--
-- 转存表中的数据 `wx_product_template_entry`
--

INSERT INTO `wx_product_template_entry` (`id`, `ptid`, `foodclass_id`, `food_id`, `count`) VALUES
(7, 2, 2, 31, '0.51'),
(8, 2, 4, 34, '0.88'),
(9, 4, 2, 31, '0.66'),
(10, 4, 4, 42, '0.34'),
(11, 5, 2, 31, '0.75'),
(12, 5, 4, 40, '0.36'),
(19, 1, 1, 30, '1.20'),
(20, 1, 2, 31, '1.40');

-- --------------------------------------------------------

--
-- 表的结构 `wx_purchase`
--

CREATE TABLE IF NOT EXISTS `wx_purchase` (
  `id` int(11) NOT NULL,
  `foodclass_id` int(11) DEFAULT NULL COMMENT '食材分类',
  `food_id` int(11) DEFAULT NULL COMMENT '食材名称',
  `param_id` int(11) DEFAULT NULL COMMENT '规格参数',
  `book_count` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '采购数量',
  `price` decimal(10,2) DEFAULT NULL COMMENT '单价',
  `unit` varchar(32) DEFAULT NULL COMMENT '单位',
  `brand` varchar(128) DEFAULT NULL COMMENT '品牌',
  `supplier` varchar(128) DEFAULT NULL COMMENT '供应商',
  `pur_user` varchar(32) DEFAULT NULL COMMENT '采购人',
  `pur_date` int(11) NOT NULL COMMENT '采购时间',
  `create_date` int(11) DEFAULT NULL COMMENT '添加时间',
  `depot_user` varchar(32) DEFAULT NULL COMMENT '入库人',
  `depot_count` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '入库数量',
  `depot_date` int(11) NOT NULL COMMENT '入库时间',
  `sycount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '剩余数量',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0：未入库，1已入库',
  `comment` text NOT NULL COMMENT '验收意见',
  `is_del` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除 1是，0否'
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='采购表（市场库存表）';

--
-- 转存表中的数据 `wx_purchase`
--

INSERT INTO `wx_purchase` (`id`, `foodclass_id`, `food_id`, `param_id`, `book_count`, `price`, `unit`, `brand`, `supplier`, `pur_user`, `pur_date`, `create_date`, `depot_user`, `depot_count`, `depot_date`, `sycount`, `status`, `comment`, `is_del`) VALUES
(1, 2, 31, 37, '55.63', '23.12', NULL, '12', '', '超级管理员', 1529596800, NULL, '超级管理员', '55.63', 1529596800, '0.00', 1, '货不错', 0),
(2, 4, 40, NULL, '100.00', '12.50', NULL, '', '', '超级管理员', 1529596800, NULL, '超级管理员', '100.00', 1529596800, '54.64', 1, '', 0),
(3, 4, 40, NULL, '100.00', '20000.00', NULL, '8', '15', '超级管理员', 1529596800, NULL, '超级管理员', '100.00', 1529596800, '100.00', 1, '', 1),
(4, 1, 30, NULL, '10.00', '56.80', NULL, '', '', '超级管理员', 1529596800, NULL, '超级管理员', '10.00', 1529596800, '0.00', 1, '', 0),
(5, 4, 34, NULL, '500.00', '15.00', NULL, '', '', '超级管理员', 1529596800, NULL, '超级管理员', '500.00', 1529596800, '0.00', 1, '', 0),
(6, 4, 42, NULL, '500.00', '15.60', NULL, '', '', '超级管理员', 1529596800, NULL, '超级管理员', '500.00', 1529596800, '496.60', 1, '', 0),
(7, 1, 30, NULL, '12.00', '50.00', NULL, '', '', '超级管理员', 1529596800, NULL, '超级管理员', '12.00', 1529596800, '0.00', 1, '', 0),
(8, 2, 31, 38, '100.00', '18.00', NULL, '', '', '超级管理员', 1529596800, NULL, '超级管理员', '100.00', 1529596800, '0.00', 1, '', 0),
(9, 1, 30, NULL, '50.00', '20.00', NULL, '', '', '超级管理员', 1529596800, NULL, '超级管理员', '50.00', 1529596800, '0.00', 1, '', 0),
(10, 1, 30, NULL, '30.00', '80.00', NULL, '', '', '超级管理员', 1529683200, NULL, '超级管理员', '30.00', 1529683200, '26.40', 1, '', 0),
(11, 2, 31, 37, '50.00', '42.00', NULL, '', '', '超级管理员', 1529683200, NULL, '超级管理员', '50.00', 1529683200, '0.00', 1, '', 0),
(12, 2, 31, 37, '800.00', '60.00', NULL, '', '15', '超级管理员', 1529596800, NULL, '超级管理员', '800.00', 1529683200, '0.00', 1, '', 0),
(13, 2, 31, 37, '1000.00', '30.00', NULL, '', '16', '超级管理员', 1529683200, NULL, '超级管理员', '1000.00', 1529683200, '646.66', 1, '', 0),
(14, 4, 34, NULL, '3000.00', '10.00', NULL, '', '16', '超级管理员', 1529683200, NULL, '超级管理员', '3000.00', 1529683200, '1549.04', 1, '', 0),
(15, 2, 31, 38, '10.00', '10.00', NULL, '', '15', '超级管理员', 1529683200, NULL, '超级管理员', '10.00', 1529683200, '10.00', 1, 'OK', 0),
(16, 9, 33, NULL, '5.00', '15.00', NULL, '', '16', '超级管理员', 1529769600, NULL, NULL, '0.00', 0, '0.00', 0, '', 0),
(17, 1, 30, NULL, '10.00', '20.00', NULL, '', '16', '超级管理员', 1529769600, 1529821246, NULL, '0.00', 0, '0.00', 0, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `wx_refcode`
--

CREATE TABLE IF NOT EXISTS `wx_refcode` (
  `id` int(11) NOT NULL,
  `nm` varchar(128) DEFAULT NULL,
  `value` varchar(64) DEFAULT NULL COMMENT '对应的值',
  `type` varchar(32) DEFAULT NULL COMMENT '类型',
  `pid` int(11) DEFAULT NULL COMMENT '父类id',
  `pid2` int(11) DEFAULT NULL COMMENT '食材单位',
  `is_del` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除 1是，0否'
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='基础表';

--
-- 转存表中的数据 `wx_refcode`
--

INSERT INTO `wx_refcode` (`id`, `nm`, `value`, `type`, `pid`, `pid2`, `is_del`) VALUES
(1, '海鲜', NULL, 'foodclass', NULL, NULL, 0),
(2, '水产', NULL, 'foodclass', NULL, NULL, 0),
(3, '蔬菜', NULL, 'foodclass', NULL, NULL, 0),
(4, '调料', NULL, 'foodclass', NULL, NULL, 0),
(5, '千克', NULL, 'foodunit', NULL, NULL, 0),
(6, '克', NULL, 'foodunit', NULL, NULL, 0),
(7, '瓶', NULL, 'foodunit', NULL, NULL, 0),
(8, '老干妈', NULL, 'brand', NULL, NULL, 0),
(9, '禽类', NULL, 'foodclass', NULL, NULL, 0),
(10, '周黑鸭', NULL, 'brand', NULL, NULL, 0),
(11, '自制品牌', NULL, 'brand', NULL, NULL, 0),
(12, '无品牌', NULL, 'brand', NULL, NULL, 0),
(13, '双汇', NULL, 'brand', NULL, NULL, 0),
(14, '伊利', NULL, 'brand', NULL, NULL, 0),
(15, '供应商A', NULL, 'supplier', NULL, NULL, 0),
(16, '供应商B', NULL, 'supplier', NULL, NULL, 0),
(17, '饮料', NULL, 'productclass', NULL, NULL, 0),
(18, '浙菜', NULL, 'productclass', NULL, NULL, 0),
(19, '川菜', NULL, 'productclass', NULL, NULL, 0),
(20, '湘菜', NULL, 'productclass', NULL, NULL, 0),
(21, '杯', NULL, 'productunit', NULL, NULL, 0),
(22, '千克', NULL, 'productunit', NULL, NULL, 0),
(23, '碟', NULL, 'productunit', NULL, NULL, 0),
(24, '神秘恋人', NULL, 'product', 17, 21, 0),
(25, '碗', NULL, 'productunit', NULL, NULL, 0),
(26, '红烧鲫鱼', NULL, 'product', 18, 25, 0),
(27, '十三香小龙虾', NULL, 'product', 18, 22, 0),
(28, '口水鸡', NULL, 'product', 19, 25, 0),
(29, '水煮鱼', NULL, 'product', 20, 25, 0),
(30, '基围虾', '2', 'food', 1, 5, 0),
(31, '小龙虾', '2', 'food', 2, 5, 0),
(32, '只', NULL, 'foodunit', NULL, NULL, 0),
(33, '鸡肉', '5', 'food', 9, 32, 0),
(34, '珍珠', '200', 'food', 4, 6, 0),
(35, '奶类', NULL, 'foodclass', NULL, NULL, 0),
(36, '纯牛奶', '10', 'food', 35, 7, 0),
(37, '大于50克', NULL, 'param', 31, NULL, 0),
(38, '小于50克', NULL, 'param', 31, NULL, 0),
(39, '蒜泥清蒸小龙虾', NULL, 'product', 18, 22, 0),
(40, '蒜', '10', 'food', 4, 5, 0),
(41, '红烧小龙虾', NULL, 'product', 18, 22, 0),
(42, '酱油', '100', 'food', 4, 6, 0),
(43, '山珍', NULL, 'foodclass', NULL, NULL, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `wx_admin`
--
ALTER TABLE `wx_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wx_auth_assignment`
--
ALTER TABLE `wx_auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`),
  ADD KEY `user_id` (`user_id`) USING BTREE,
  ADD KEY `created_at` (`created_at`) USING BTREE,
  ADD KEY `item_name` (`item_name`) USING BTREE;

--
-- Indexes for table `wx_auth_item`
--
ALTER TABLE `wx_auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`) USING BTREE,
  ADD KEY `type` (`type`) USING BTREE,
  ADD KEY `name` (`name`) USING BTREE,
  ADD KEY `created_at` (`created_at`) USING BTREE;

--
-- Indexes for table `wx_auth_item_child`
--
ALTER TABLE `wx_auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`) USING BTREE,
  ADD KEY `parent` (`parent`) USING BTREE;

--
-- Indexes for table `wx_menu`
--
ALTER TABLE `wx_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`) USING BTREE,
  ADD KEY `name` (`name`) USING BTREE,
  ADD KEY `route` (`route`(255)) USING BTREE,
  ADD KEY `order` (`taxis`) USING BTREE;

--
-- Indexes for table `wx_pf_map`
--
ALTER TABLE `wx_pf_map`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wx_product`
--
ALTER TABLE `wx_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wx_product_consume`
--
ALTER TABLE `wx_product_consume`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wx_product_consume_entry`
--
ALTER TABLE `wx_product_consume_entry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wx_product_entry`
--
ALTER TABLE `wx_product_entry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wx_product_template`
--
ALTER TABLE `wx_product_template`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wx_product_template_entry`
--
ALTER TABLE `wx_product_template_entry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wx_purchase`
--
ALTER TABLE `wx_purchase`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wx_refcode`
--
ALTER TABLE `wx_refcode`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `wx_admin`
--
ALTER TABLE `wx_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `wx_menu`
--
ALTER TABLE `wx_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=68;
--
-- AUTO_INCREMENT for table `wx_pf_map`
--
ALTER TABLE `wx_pf_map`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `wx_product`
--
ALTER TABLE `wx_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `wx_product_consume`
--
ALTER TABLE `wx_product_consume`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `wx_product_consume_entry`
--
ALTER TABLE `wx_product_consume_entry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `wx_product_entry`
--
ALTER TABLE `wx_product_entry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=62;
--
-- AUTO_INCREMENT for table `wx_product_template`
--
ALTER TABLE `wx_product_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `wx_product_template_entry`
--
ALTER TABLE `wx_product_template_entry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `wx_purchase`
--
ALTER TABLE `wx_purchase`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `wx_refcode`
--
ALTER TABLE `wx_refcode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=44;
--
-- 限制导出的表
--

--
-- 限制表 `wx_auth_assignment`
--
ALTER TABLE `wx_auth_assignment`
  ADD CONSTRAINT `wx_auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `wx_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

