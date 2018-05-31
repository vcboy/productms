/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : productms

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-06-01 00:32:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for wx_admin
-- ----------------------------
DROP TABLE IF EXISTS `wx_admin`;
CREATE TABLE `wx_admin` (
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_admin
-- ----------------------------
INSERT INTO `wx_admin` VALUES ('1', 'admin', '96e79218965eb72c92a549dd5a330112', '超级管理员', '1', null, 'zongadming', '0', '{\"75\":{\"id\":75,\"name\":\"\\u4fee\\u6539\\u5bc6\\u7801\",\"url\":\"admin\\/edit-password\"}}', '', '', '1', '1');
INSERT INTO `wx_admin` VALUES ('2', 'test', '96e79218965eb72c92a549dd5a330112', '测试账号', '1', null, null, '0', null, null, null, '1', '0');
INSERT INTO `wx_admin` VALUES ('3', 'member', '96e79218965eb72c92a549dd5a330112', '测试', '1', null, null, '0', null, null, null, '2', '0');
INSERT INTO `wx_admin` VALUES ('4', 'zs', '96e79218965eb72c92a549dd5a330112', '招生1', '1', null, 'zhaosheng', '0', null, null, null, '0', '0');

-- ----------------------------
-- Table structure for wx_auth_assignment
-- ----------------------------
DROP TABLE IF EXISTS `wx_auth_assignment`;
CREATE TABLE `wx_auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  KEY `user_id` (`user_id`),
  KEY `created_at` (`created_at`),
  KEY `item_name` (`item_name`),
  CONSTRAINT `wx_auth_assignment_ibfk_2` FOREIGN KEY (`item_name`) REFERENCES `wx_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员授权表';

-- ----------------------------
-- Records of wx_auth_assignment
-- ----------------------------
INSERT INTO `wx_auth_assignment` VALUES ('zongadming', '1', '1470623219');

-- ----------------------------
-- Table structure for wx_auth_item
-- ----------------------------
DROP TABLE IF EXISTS `wx_auth_item`;
CREATE TABLE `wx_auth_item` (
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

-- ----------------------------
-- Records of wx_auth_item
-- ----------------------------
INSERT INTO `wx_auth_item` VALUES ('admin_create', '2', '用户添加', null, null, null, null, '33');
INSERT INTO `wx_auth_item` VALUES ('admin_delete', '2', '用户删除', null, null, null, null, '33');
INSERT INTO `wx_auth_item` VALUES ('admin_quickentry', '2', '快捷入口设置', null, null, null, null, '35');
INSERT INTO `wx_auth_item` VALUES ('admin_update', '2', '用户修改', null, null, null, null, '33');
INSERT INTO `wx_auth_item` VALUES ('brand', '2', '品牌', null, null, null, null, '41');
INSERT INTO `wx_auth_item` VALUES ('consume_add', '2', '添加', null, null, null, null, '64');
INSERT INTO `wx_auth_item` VALUES ('consume_groupproduct', '2', '查询', null, null, null, null, '61');
INSERT INTO `wx_auth_item` VALUES ('consume_index', '2', '列表', null, null, null, null, '63');
INSERT INTO `wx_auth_item` VALUES ('consume_sh', '2', '审核', null, null, null, null, '65');
INSERT INTO `wx_auth_item` VALUES ('food', '2', '食材名称', null, null, null, null, '38');
INSERT INTO `wx_auth_item` VALUES ('foodclass', '2', '食材分类', null, null, null, null, '37');
INSERT INTO `wx_auth_item` VALUES ('foodunit', '2', '食材单位', null, null, null, null, '40');
INSERT INTO `wx_auth_item` VALUES ('menu_create', '2', '菜单添加', null, null, null, null, '32');
INSERT INTO `wx_auth_item` VALUES ('menu_delete', '2', '菜单删除', null, null, null, null, '32');
INSERT INTO `wx_auth_item` VALUES ('menu_taxis', '2', '菜单排序', null, null, null, null, '32');
INSERT INTO `wx_auth_item` VALUES ('menu_update', '2', '菜单修改', null, null, null, null, '32');
INSERT INTO `wx_auth_item` VALUES ('param', '2', '规格参数', null, null, null, null, '39');
INSERT INTO `wx_auth_item` VALUES ('password_update', '2', '修改密码', null, null, null, null, '75');
INSERT INTO `wx_auth_item` VALUES ('permission_create', '2', '权限添加', null, null, null, null, '30');
INSERT INTO `wx_auth_item` VALUES ('permission_delete', '2', '权限删除', null, null, null, null, '30');
INSERT INTO `wx_auth_item` VALUES ('permission_update', '2', '权限修改', null, null, null, null, '30');
INSERT INTO `wx_auth_item` VALUES ('product', '2', '成品名称', null, null, null, null, '44');
INSERT INTO `wx_auth_item` VALUES ('product-template_add', '2', '成品配比', null, null, null, null, '51');
INSERT INTO `wx_auth_item` VALUES ('product-template_index', '2', '成品显示', null, null, null, null, '52');
INSERT INTO `wx_auth_item` VALUES ('productclass', '2', '成品分类', null, null, null, null, '43');
INSERT INTO `wx_auth_item` VALUES ('productunit', '2', '成品单位', null, null, null, null, '45');
INSERT INTO `wx_auth_item` VALUES ('product_add', '2', '配货需求', null, null, null, null, '54');
INSERT INTO `wx_auth_item` VALUES ('product_del', '2', '删除发配货信息', null, null, null, null, '55');
INSERT INTO `wx_auth_item` VALUES ('product_edit', '2', '修改发配货信息', null, null, null, null, '55');
INSERT INTO `wx_auth_item` VALUES ('product_groupproduct', '2', '查询', null, null, null, null, '60');
INSERT INTO `wx_auth_item` VALUES ('product_inspector', '2', '验货入库', null, null, null, null, '56');
INSERT INTO `wx_auth_item` VALUES ('product_search', '2', '成品库查询', null, null, null, null, '59');
INSERT INTO `wx_auth_item` VALUES ('product_send', '2', '发货配货', null, null, null, null, '55');
INSERT INTO `wx_auth_item` VALUES ('purchase_add', '2', '添加采购', null, null, null, null, '47');
INSERT INTO `wx_auth_item` VALUES ('purchase_del', '2', '删除采购信息', null, null, null, null, '48');
INSERT INTO `wx_auth_item` VALUES ('purchase_depot', '2', '验货入库', null, null, null, null, '49');
INSERT INTO `wx_auth_item` VALUES ('purchase_edit', '2', '修改采购信息', null, null, null, null, '48');
INSERT INTO `wx_auth_item` VALUES ('purchase_index', '2', '采购管理', null, null, null, null, '48');
INSERT INTO `wx_auth_item` VALUES ('purchase_search', '2', '食材库查询', null, null, null, null, '58');
INSERT INTO `wx_auth_item` VALUES ('role_create', '2', '角色添加', null, null, null, null, '31');
INSERT INTO `wx_auth_item` VALUES ('role_delete', '2', '角色删除', null, null, null, null, '31');
INSERT INTO `wx_auth_item` VALUES ('role_permission', '2', '角色权限设置', null, null, null, null, '31');
INSERT INTO `wx_auth_item` VALUES ('role_update', '2', '角色修改', null, null, null, null, '31');
INSERT INTO `wx_auth_item` VALUES ('shortcut_update', '2', '设置快捷方式', null, null, null, null, '74');
INSERT INTO `wx_auth_item` VALUES ('supplier', '2', '供应商', null, null, null, null, '42');
INSERT INTO `wx_auth_item` VALUES ('zongadming', '1', '总管理员', null, null, null, null, null);

-- ----------------------------
-- Table structure for wx_auth_item_child
-- ----------------------------
DROP TABLE IF EXISTS `wx_auth_item_child`;
CREATE TABLE `wx_auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员权限关系表';

-- ----------------------------
-- Records of wx_auth_item_child
-- ----------------------------
INSERT INTO `wx_auth_item_child` VALUES ('zongadming', 'admin_create');
INSERT INTO `wx_auth_item_child` VALUES ('zongadming', 'admin_delete');
INSERT INTO `wx_auth_item_child` VALUES ('zongadming', 'admin_quickentry');
INSERT INTO `wx_auth_item_child` VALUES ('zongadming', 'admin_update');
INSERT INTO `wx_auth_item_child` VALUES ('zongadming', 'brand');
INSERT INTO `wx_auth_item_child` VALUES ('zongadming', 'consume_add');
INSERT INTO `wx_auth_item_child` VALUES ('zongadming', 'consume_groupproduct');
INSERT INTO `wx_auth_item_child` VALUES ('zongadming', 'consume_index');
INSERT INTO `wx_auth_item_child` VALUES ('zongadming', 'consume_sh');
INSERT INTO `wx_auth_item_child` VALUES ('zongadming', 'food');
INSERT INTO `wx_auth_item_child` VALUES ('zongadming', 'foodclass');
INSERT INTO `wx_auth_item_child` VALUES ('zongadming', 'foodunit');
INSERT INTO `wx_auth_item_child` VALUES ('zongadming', 'menu_create');
INSERT INTO `wx_auth_item_child` VALUES ('zongadming', 'menu_delete');
INSERT INTO `wx_auth_item_child` VALUES ('zongadming', 'menu_taxis');
INSERT INTO `wx_auth_item_child` VALUES ('zongadming', 'menu_update');
INSERT INTO `wx_auth_item_child` VALUES ('zongadming', 'param');
INSERT INTO `wx_auth_item_child` VALUES ('zongadming', 'permission_create');
INSERT INTO `wx_auth_item_child` VALUES ('zongadming', 'permission_delete');
INSERT INTO `wx_auth_item_child` VALUES ('zongadming', 'permission_update');
INSERT INTO `wx_auth_item_child` VALUES ('zongadming', 'product');
INSERT INTO `wx_auth_item_child` VALUES ('zongadming', 'product-template_add');
INSERT INTO `wx_auth_item_child` VALUES ('zongadming', 'product-template_index');
INSERT INTO `wx_auth_item_child` VALUES ('zongadming', 'productclass');
INSERT INTO `wx_auth_item_child` VALUES ('zongadming', 'productunit');
INSERT INTO `wx_auth_item_child` VALUES ('zongadming', 'product_add');
INSERT INTO `wx_auth_item_child` VALUES ('zongadming', 'product_del');
INSERT INTO `wx_auth_item_child` VALUES ('zongadming', 'product_edit');
INSERT INTO `wx_auth_item_child` VALUES ('zongadming', 'product_groupproduct');
INSERT INTO `wx_auth_item_child` VALUES ('zongadming', 'product_inspector');
INSERT INTO `wx_auth_item_child` VALUES ('zongadming', 'product_search');
INSERT INTO `wx_auth_item_child` VALUES ('zongadming', 'product_send');
INSERT INTO `wx_auth_item_child` VALUES ('zongadming', 'purchase_add');
INSERT INTO `wx_auth_item_child` VALUES ('zongadming', 'purchase_del');
INSERT INTO `wx_auth_item_child` VALUES ('zongadming', 'purchase_depot');
INSERT INTO `wx_auth_item_child` VALUES ('zongadming', 'purchase_edit');
INSERT INTO `wx_auth_item_child` VALUES ('zongadming', 'purchase_index');
INSERT INTO `wx_auth_item_child` VALUES ('zongadming', 'purchase_search');
INSERT INTO `wx_auth_item_child` VALUES ('zongadming', 'role_create');
INSERT INTO `wx_auth_item_child` VALUES ('zongadming', 'role_delete');
INSERT INTO `wx_auth_item_child` VALUES ('zongadming', 'role_permission');
INSERT INTO `wx_auth_item_child` VALUES ('zongadming', 'role_update');
INSERT INTO `wx_auth_item_child` VALUES ('zongadming', 'supplier');

-- ----------------------------
-- Table structure for wx_menu
-- ----------------------------
DROP TABLE IF EXISTS `wx_menu`;
CREATE TABLE `wx_menu` (
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
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COMMENT='系统管理员菜单权限表\r\n';

-- ----------------------------
-- Records of wx_menu
-- ----------------------------
INSERT INTO `wx_menu` VALUES ('29', '系统设置', '0', null, '1', null, '');
INSERT INTO `wx_menu` VALUES ('30', '权限管理', '29', null, null, null, 'permission-form/index');
INSERT INTO `wx_menu` VALUES ('31', '角色管理', '29', null, null, null, 'role-form/index');
INSERT INTO `wx_menu` VALUES ('32', '菜单管理', '29', null, null, null, 'menu/index');
INSERT INTO `wx_menu` VALUES ('33', '用户管理', '29', null, null, null, 'admin/index');
INSERT INTO `wx_menu` VALUES ('34', '设置快捷方式', '29', null, '1', null, 'shortcut/index');
INSERT INTO `wx_menu` VALUES ('35', '修改密码', '29', null, '2', null, 'admin/edit-password');
INSERT INTO `wx_menu` VALUES ('36', '基础信息', '0', null, '10', null, '');
INSERT INTO `wx_menu` VALUES ('37', '食材分类', '36', null, null, null, 'refcode/index?type_code=foodclass');
INSERT INTO `wx_menu` VALUES ('38', '食材名称', '36', null, null, null, 'refcode/index?type_code=food');
INSERT INTO `wx_menu` VALUES ('39', '规格参数', '36', null, null, null, 'refcode/index?type_code=param');
INSERT INTO `wx_menu` VALUES ('40', '食材单位', '36', null, null, null, 'refcode/index?type_code=foodunit');
INSERT INTO `wx_menu` VALUES ('41', '品牌', '36', null, null, null, 'refcode/index?type_code=brand');
INSERT INTO `wx_menu` VALUES ('42', '供应商', '36', null, null, null, 'refcode/index?type_code=supplier');
INSERT INTO `wx_menu` VALUES ('43', '成品分类', '36', null, null, null, 'refcode/index?type_code=productclass');
INSERT INTO `wx_menu` VALUES ('44', '成品名称', '36', null, null, null, 'refcode/index?type_code=product');
INSERT INTO `wx_menu` VALUES ('45', '成品单位', '36', null, null, null, 'refcode/index?type_code=productunit');
INSERT INTO `wx_menu` VALUES ('46', '采购入库', '0', null, '9', null, '');
INSERT INTO `wx_menu` VALUES ('47', '添加采购', '46', null, null, null, 'purchase/create');
INSERT INTO `wx_menu` VALUES ('48', '采购管理', '46', null, null, null, 'purchase/index');
INSERT INTO `wx_menu` VALUES ('49', '验货入库', '46', null, null, null, 'purchase/depot');
INSERT INTO `wx_menu` VALUES ('50', '食材配比', '0', null, '8', null, '');
INSERT INTO `wx_menu` VALUES ('51', '成品配比', '50', null, null, null, 'product-template/create');
INSERT INTO `wx_menu` VALUES ('52', '成品显示', '50', null, null, null, 'product-template/index');
INSERT INTO `wx_menu` VALUES ('53', '成品管理', '0', null, '7', null, '');
INSERT INTO `wx_menu` VALUES ('54', '配货需求', '53', null, null, null, 'product/create');
INSERT INTO `wx_menu` VALUES ('55', '发货配货', '53', null, null, null, 'product/send');
INSERT INTO `wx_menu` VALUES ('56', '验货入库', '53', null, null, null, 'product/inspector');
INSERT INTO `wx_menu` VALUES ('57', '数据查询', '0', null, '6', null, '');
INSERT INTO `wx_menu` VALUES ('58', '食材库查询', '57', null, null, null, 'purchase/search');
INSERT INTO `wx_menu` VALUES ('59', '成品库查询', '57', null, null, null, 'product/search');
INSERT INTO `wx_menu` VALUES ('60', '发货完成基准价', '57', null, null, null, 'product/groupproduct');
INSERT INTO `wx_menu` VALUES ('61', '成品消耗基准价', '57', null, null, null, 'consume/groupproduct');
INSERT INTO `wx_menu` VALUES ('62', '成品消耗', '0', null, '5', null, '');
INSERT INTO `wx_menu` VALUES ('63', '消耗管理', '62', null, '3', null, 'product-consume/index');
INSERT INTO `wx_menu` VALUES ('64', '消耗添加', '62', null, '4', null, 'product-consume/create');
INSERT INTO `wx_menu` VALUES ('65', '报损审核', '62', null, null, null, 'product-consume/sh');

-- ----------------------------
-- Table structure for wx_product
-- ----------------------------
DROP TABLE IF EXISTS `wx_product`;
CREATE TABLE `wx_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booker_user` varchar(32) DEFAULT NULL COMMENT '配货人',
  `book_date` int(11) NOT NULL COMMENT '配货时间',
  `book_comment` int(11) DEFAULT NULL COMMENT '配货意见',
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='成品配、发、验货主表';

-- ----------------------------
-- Records of wx_product
-- ----------------------------

-- ----------------------------
-- Table structure for wx_product_consume
-- ----------------------------
DROP TABLE IF EXISTS `wx_product_consume`;
CREATE TABLE `wx_product_consume` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productclass_id` int(11) NOT NULL COMMENT '成品分类',
  `product_id` int(11) NOT NULL COMMENT '成品名称',
  `unitprice` float NOT NULL COMMENT '销售单价',
  `price` float NOT NULL COMMENT '单成品销售总价',
  `count` int(11) NOT NULL DEFAULT '0' COMMENT '消耗数量',
  `consume_type` tinyint(4) NOT NULL COMMENT '消耗方式 1：销售 2：损耗',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '审核状态 1：销售默认审核通过 0：报损需要指定人员审核',
  `create_dt` int(11) NOT NULL COMMENT '添加时间',
  `create_user` varchar(32) DEFAULT NULL COMMENT '添加人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='成品消耗表';

-- ----------------------------
-- Records of wx_product_consume
-- ----------------------------
INSERT INTO `wx_product_consume` VALUES ('1', '10', '14', '33.62', '11531.7', '343', '2', '0', '1527436800', null);
INSERT INTO `wx_product_consume` VALUES ('2', '13', '15', '44', '88', '2', '1', '0', '1527436800', null);
INSERT INTO `wx_product_consume` VALUES ('3', '10', '14', '44', '1452', '33', '1', '1', '1527609600', null);
INSERT INTO `wx_product_consume` VALUES ('4', '10', '14', '55', '1155', '21', '1', '1', '1527691197', null);
INSERT INTO `wx_product_consume` VALUES ('5', '10', '14', '55', '1375', '25', '1', '1', '1527692315', null);
INSERT INTO `wx_product_consume` VALUES ('6', '10', '14', '55', '1375', '25', '1', '1', '1527692393', null);

-- ----------------------------
-- Table structure for wx_product_consume_entry
-- ----------------------------
DROP TABLE IF EXISTS `wx_product_consume_entry`;
CREATE TABLE `wx_product_consume_entry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_consume_id` int(11) DEFAULT NULL COMMENT '成品消耗表id',
  `product_entry_id` int(11) DEFAULT NULL COMMENT '成品库存表id',
  `count` int(11) DEFAULT NULL COMMENT '消耗数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='成品消耗子表';

-- ----------------------------
-- Records of wx_product_consume_entry
-- ----------------------------
INSERT INTO `wx_product_consume_entry` VALUES ('5', '6', '1', '10');
INSERT INTO `wx_product_consume_entry` VALUES ('6', '6', '2', '15');

-- ----------------------------
-- Table structure for wx_product_entry
-- ----------------------------
DROP TABLE IF EXISTS `wx_product_entry`;
CREATE TABLE `wx_product_entry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productclass_id` int(11) NOT NULL COMMENT '成品分类',
  `product_id` int(11) NOT NULL COMMENT '成品名称',
  `unitprice` float NOT NULL COMMENT '基准价',
  `unit` varchar(32) NOT NULL COMMENT '单位',
  `price` float NOT NULL COMMENT '单成品总价',
  `book_count` int(11) NOT NULL DEFAULT '0' COMMENT '配货数量',
  `send_count` int(11) NOT NULL DEFAULT '0' COMMENT '实际发货数量',
  `depot_count` int(11) NOT NULL DEFAULT '0' COMMENT '验货数量（入库数量',
  `sycount` int(11) NOT NULL DEFAULT '0' COMMENT '剩余数量',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否入库 0：未入库 1：已入库',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='成品配、发、验货详细表（成品库存表）';

-- ----------------------------
-- Records of wx_product_entry
-- ----------------------------
INSERT INTO `wx_product_entry` VALUES ('1', '10', '14', '33', '', '330', '10', '10', '10', '0', '1');
INSERT INTO `wx_product_entry` VALUES ('2', '10', '14', '34', '', '1020', '30', '30', '30', '15', '1');

-- ----------------------------
-- Table structure for wx_product_template
-- ----------------------------
DROP TABLE IF EXISTS `wx_product_template`;
CREATE TABLE `wx_product_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productclass_id` int(11) DEFAULT NULL COMMENT '成品分类',
  `product_id` int(11) DEFAULT NULL COMMENT '成品名称',
  `unitprice` float DEFAULT NULL COMMENT '基准价',
  `unit` varchar(32) DEFAULT NULL COMMENT '单位',
  `is_del` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除 1是，0否',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='成品模板主表';

-- ----------------------------
-- Records of wx_product_template
-- ----------------------------
INSERT INTO `wx_product_template` VALUES ('1', '10', '14', '100', '16', '0');

-- ----------------------------
-- Table structure for wx_product_template_entry
-- ----------------------------
DROP TABLE IF EXISTS `wx_product_template_entry`;
CREATE TABLE `wx_product_template_entry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ptid` int(11) DEFAULT NULL COMMENT '父类id product_template.id',
  `foodclass_id` int(11) DEFAULT NULL COMMENT '食材分类',
  `food_id` int(11) DEFAULT NULL COMMENT '食材名称',
  `count` int(11) DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='成品模板明细表';

-- ----------------------------
-- Records of wx_product_template_entry
-- ----------------------------

-- ----------------------------
-- Table structure for wx_purchase
-- ----------------------------
DROP TABLE IF EXISTS `wx_purchase`;
CREATE TABLE `wx_purchase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `foodclass_id` int(11) DEFAULT NULL COMMENT '食材分类',
  `food_id` int(11) DEFAULT NULL COMMENT '食材名称',
  `param_id` int(11) DEFAULT NULL COMMENT '规格参数',
  `book_count` int(11) NOT NULL DEFAULT '0' COMMENT '采购数量',
  `price` decimal(10,2) DEFAULT NULL COMMENT '单价',
  `unit` varchar(32) DEFAULT NULL COMMENT '单位',
  `brand` varchar(128) DEFAULT NULL COMMENT '品牌',
  `supplier` varchar(128) DEFAULT NULL COMMENT '供应商',
  `pur_user` varchar(32) DEFAULT NULL COMMENT '采购人',
  `pur_date` int(11) NOT NULL COMMENT '采购时间',
  `depot_user` varchar(32) DEFAULT NULL COMMENT '入库人',
  `depot_count` int(11) DEFAULT NULL COMMENT '入库数量',
  `depot_date` int(11) NOT NULL COMMENT '入库时间',
  `sycount` int(11) NOT NULL DEFAULT '0' COMMENT '剩余数量',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0：未入库，1已入库',
  `comment` text NOT NULL COMMENT '验收意见',
  `is_del` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除 1是，0否',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='采购表（市场库存表）';

-- ----------------------------
-- Records of wx_purchase
-- ----------------------------
INSERT INTO `wx_purchase` VALUES ('1', '2', '3', '7', '21', '100.00', '111', '11', '111', '1', '222', '222', '22', '22', '22', '1', '22', '1');
INSERT INTO `wx_purchase` VALUES ('2', '2', '8', '9', '100', '5.00', null, '22', '6', '1', '1526832000', '0', '0', '0', '0', '1', '', '0');
INSERT INTO `wx_purchase` VALUES ('3', '2', '3', '7', '23', '234.33', null, '22', '6', '1', '1526486400', '0', '0', '0', '0', '0', '', '0');
INSERT INTO `wx_purchase` VALUES ('4', '2', '3', '7', '30', '23.50', null, '22', '6', '1', '1527004800', '0', '0', '0', '0', '0', '', '0');
INSERT INTO `wx_purchase` VALUES ('5', '2', '3', '7', '343', '4.00', null, '', '', '高级管理员', '1527004800', '超级管理员', '343', '1527091200', '343', '1', 'aaaaaaaaaaaa', '0');
INSERT INTO `wx_purchase` VALUES ('6', '2', '3', '7', '3', '4.00', null, '22', '6', '超级管理员2', '1527004800', '超级管理员', '3', '1527091200', '0', '1', 'sdfsdf', '0');

-- ----------------------------
-- Table structure for wx_refcode
-- ----------------------------
DROP TABLE IF EXISTS `wx_refcode`;
CREATE TABLE `wx_refcode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nm` varchar(128) DEFAULT NULL,
  `value` varchar(64) DEFAULT NULL COMMENT '对应的值',
  `type` varchar(32) DEFAULT NULL COMMENT '类型',
  `pid` int(11) DEFAULT NULL COMMENT '父类id',
  `pid2` int(11) DEFAULT NULL COMMENT '食材单位',
  `is_del` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除 1是，0否',
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='基础表';

-- ----------------------------
-- Records of wx_refcode
-- ----------------------------
INSERT INTO `wx_refcode` VALUES ('1', '牛肉1w', null, null, null, null, '1');
INSERT INTO `wx_refcode` VALUES ('2', '禽类21', null, 'foodclass', null, null, '0');
INSERT INTO `wx_refcode` VALUES ('3', '鸡肉', '20', 'food', '2', null, '0');
INSERT INTO `wx_refcode` VALUES ('4', '鸭肉', '10', 'food', '2', null, '1');
INSERT INTO `wx_refcode` VALUES ('5', '蔬菜', null, 'foodclass', null, null, '1');
INSERT INTO `wx_refcode` VALUES ('6', '食材1公司', null, 'supplier', null, null, '0');
INSERT INTO `wx_refcode` VALUES ('7', '年份', null, 'param', '3', null, '0');
INSERT INTO `wx_refcode` VALUES ('8', '鸭肉', '30', 'food', '2', '19', '0');
INSERT INTO `wx_refcode` VALUES ('9', '长度', null, 'param', '8', null, '0');
INSERT INTO `wx_refcode` VALUES ('10', '粤菜', null, 'productclass', null, null, '0');
INSERT INTO `wx_refcode` VALUES ('11', '湘菜', null, 'productclass', null, null, '0');
INSERT INTO `wx_refcode` VALUES ('12', '川菜', null, 'productclass', null, null, '0');
INSERT INTO `wx_refcode` VALUES ('13', '江浙菜', null, 'productclass', null, null, '0');
INSERT INTO `wx_refcode` VALUES ('14', '龙虎斗', null, 'product', '10', '16', '0');
INSERT INTO `wx_refcode` VALUES ('15', '兴宁烤鸡', null, 'product', '13', '18', '0');
INSERT INTO `wx_refcode` VALUES ('16', '斤', null, 'productunit', null, null, '0');
INSERT INTO `wx_refcode` VALUES ('17', '公斤', null, 'productunit', null, null, '0');
INSERT INTO `wx_refcode` VALUES ('18', '磅', null, 'productunit', null, null, '0');
INSERT INTO `wx_refcode` VALUES ('19', '只', null, 'foodunit', null, null, '0');
INSERT INTO `wx_refcode` VALUES ('20', '斤', null, 'foodunit', null, null, '0');
INSERT INTO `wx_refcode` VALUES ('21', '磅', null, 'foodunit', null, null, '0');
INSERT INTO `wx_refcode` VALUES ('22', '双汇', null, 'brand', null, null, '0');
INSERT INTO `wx_refcode` VALUES ('26', '蔬菜', null, 'foodclass', null, null, '0');
INSERT INTO `wx_refcode` VALUES ('27', '蔬菜222', null, 'foodclass', null, null, '0');
