-- phpMyAdmin SQL Dump
-- version 4.4.15
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2018-02-12 14:56:37
-- 服务器版本： 10.1.9-MariaDB
-- PHP Version: 7.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wechatbaoming`
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

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
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员授权表';

--
-- 转存表中的数据 `wx_auth_assignment`
--

INSERT INTO `wx_auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('zongadming', '1', 1470623219),
('zhaosheng', '4', 1516344541);

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
('admin_qrcode', 2, '我的二维码', NULL, NULL, NULL, NULL, 68),
('admin_quickentry', 2, '快捷入口设置', NULL, NULL, NULL, NULL, 35),
('admin_update', 2, '用户修改', NULL, NULL, NULL, NULL, 33),
('certificate_index', 2, '证书领取', NULL, NULL, NULL, NULL, 64),
('channel_create', 2, '添加频道', NULL, NULL, NULL, NULL, 36),
('course_index', 2, '课程管理查看', NULL, NULL, NULL, NULL, 49),
('grade_index', 2, '成绩管理', NULL, NULL, NULL, NULL, 62),
('itemspreset_index', 2, '转码查看', NULL, NULL, NULL, NULL, 40),
('itemstype/index', 2, '视频分类查看', NULL, NULL, NULL, NULL, 39),
('itemsupload_index', 2, '视频上传', NULL, NULL, NULL, NULL, 43),
('items_index', 2, '视频查看', NULL, NULL, NULL, NULL, 41),
('jf_index', 2, '积分管理', NULL, NULL, NULL, NULL, 61),
('jianding_del', 2, '鉴定报名删除', NULL, NULL, NULL, NULL, 54),
('jianding_index', 2, '鉴定报名管理', NULL, NULL, NULL, NULL, 54),
('jianding_nosh', 2, '商务委人才未审核管理', NULL, NULL, NULL, NULL, 67),
('lession_index', 2, '课程管理', NULL, NULL, NULL, NULL, 57),
('member_index', 2, '会员管理', NULL, NULL, NULL, NULL, 60),
('menu_create', 2, '菜单添加', NULL, NULL, NULL, NULL, 32),
('menu_delete', 2, '菜单删除', NULL, NULL, NULL, NULL, 32),
('menu_taxis', 2, '菜单排序', NULL, NULL, NULL, NULL, 32),
('menu_update', 2, '菜单修改', NULL, NULL, NULL, NULL, 32),
('news_index', 2, '公告信息', NULL, NULL, NULL, NULL, 66),
('order_index', 2, '订单管理', NULL, NULL, NULL, NULL, 70),
('password_update', 2, '修改密码', NULL, NULL, NULL, NULL, 75),
('permission_create', 2, '权限添加', NULL, NULL, NULL, NULL, 30),
('permission_delete', 2, '权限删除', NULL, NULL, NULL, NULL, 30),
('permission_update', 2, '权限修改', NULL, NULL, NULL, NULL, 30),
('plan_del', 2, '活动删除', NULL, NULL, NULL, NULL, 55),
('plan_index', 2, '活动管理', NULL, NULL, NULL, NULL, 55),
('platform_index', 2, '平台管理', NULL, NULL, NULL, NULL, 52),
('resource_index', 2, '资料管理', NULL, NULL, NULL, NULL, 63),
('role_create', 2, '角色添加', NULL, NULL, NULL, NULL, 31),
('role_delete', 2, '角色删除', NULL, NULL, NULL, NULL, 31),
('role_permission', 2, '角色权限设置', NULL, NULL, NULL, NULL, 31),
('role_update', 2, '角色修改', NULL, NULL, NULL, NULL, 31),
('shortcut_update', 2, '设置快捷方式', NULL, NULL, NULL, NULL, 74),
('teacher_index', 2, '教师管理', NULL, NULL, NULL, NULL, 58),
('zhaosheng', 1, '招生人员', NULL, NULL, NULL, NULL, NULL),
('zongadming', 1, '总管理员', NULL, NULL, NULL, NULL, NULL),
('zsinfo_index', 2, '我的会员', NULL, NULL, NULL, NULL, 69);

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
('teacher', 'enroll_score'),
('teacher', 'notice_create'),
('teacher', 'notice_delete'),
('teacher', 'notice_edit'),
('zhaosheng', 'admin_qrcode'),
('zhaosheng', 'admin_quickentry'),
('zhaosheng', 'zsinfo_index'),
('zongadming', 'admin_create'),
('zongadming', 'admin_delete'),
('zongadming', 'admin_qrcode'),
('zongadming', 'admin_quickentry'),
('zongadming', 'admin_update'),
('zongadming', 'jf_index'),
('zongadming', 'jianding_del'),
('zongadming', 'jianding_index'),
('zongadming', 'jianding_nosh'),
('zongadming', 'lession_index'),
('zongadming', 'member_index'),
('zongadming', 'menu_create'),
('zongadming', 'menu_delete'),
('zongadming', 'menu_taxis'),
('zongadming', 'menu_update'),
('zongadming', 'news_index'),
('zongadming', 'order_index'),
('zongadming', 'permission_create'),
('zongadming', 'permission_delete'),
('zongadming', 'permission_update'),
('zongadming', 'plan_del'),
('zongadming', 'plan_index'),
('zongadming', 'resource_index'),
('zongadming', 'role_create'),
('zongadming', 'role_delete'),
('zongadming', 'role_permission'),
('zongadming', 'role_update'),
('zongadming', 'teacher_index'),
('zongadming', 'zsinfo_index');

-- --------------------------------------------------------

--
-- 表的结构 `wx_auth_rule`
--

CREATE TABLE IF NOT EXISTS `wx_auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员权限规则表';

-- --------------------------------------------------------

--
-- 表的结构 `wx_jf`
--

CREATE TABLE IF NOT EXISTS `wx_jf` (
  `id` int(11) NOT NULL,
  `mid` int(11) DEFAULT NULL COMMENT '会员id',
  `jf` float DEFAULT NULL COMMENT '积分',
  `way` varchar(64) DEFAULT NULL COMMENT '获取方式',
  `datetime` varchar(32) DEFAULT NULL COMMENT '积分日期'
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='积分表';

-- --------------------------------------------------------

--
-- 表的结构 `wx_jianding_table`
--

CREATE TABLE IF NOT EXISTS `wx_jianding_table` (
  `id` int(11) NOT NULL,
  `plan_id` int(11) DEFAULT NULL COMMENT '活动id',
  `company` varchar(128) DEFAULT NULL COMMENT '申报单位',
  `name` varchar(64) DEFAULT NULL COMMENT '姓名',
  `sex` tinyint(4) DEFAULT NULL COMMENT '1：男 0：女',
  `nation` varchar(32) DEFAULT NULL COMMENT '民族',
  `birthday` varchar(32) DEFAULT NULL COMMENT '出生年月',
  `sfz` varchar(64) DEFAULT NULL COMMENT '身份证',
  `bkzs` varchar(64) DEFAULT NULL COMMENT '报考证书',
  `bkfx` varchar(128) DEFAULT NULL COMMENT '报考方向',
  `zsdj` varchar(64) DEFAULT NULL COMMENT '证书等级',
  `tel` varchar(32) DEFAULT NULL COMMENT '联系方式',
  `education` text COMMENT '教育经历',
  `job` text COMMENT '工作经历',
  `score` float DEFAULT '0' COMMENT '成绩分数',
  `is_sh` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否审核',
  `is_pay` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否付款 0未付 1已付',
  `zs_id` int(11) NOT NULL DEFAULT '0' COMMENT '招生人员id，0为非推广途径',
  `is_delete` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='电子商务专业人才鉴定申请表';

-- --------------------------------------------------------

--
-- 表的结构 `wx_lession`
--

CREATE TABLE IF NOT EXISTS `wx_lession` (
  `id` int(11) NOT NULL,
  `name` varchar(128) DEFAULT NULL COMMENT '课程名称',
  `img` varchar(128) DEFAULT NULL COMMENT '封面',
  `description` text COMMENT '描述',
  `is_delete` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='课程表';

--
-- 转存表中的数据 `wx_lession`
--

INSERT INTO `wx_lession` (`id`, `name`, `img`, `description`, `is_delete`) VALUES
(1, '电子商务', '', '电子商务', 0);

-- --------------------------------------------------------

--
-- 表的结构 `wx_mark`
--

CREATE TABLE IF NOT EXISTS `wx_mark` (
  `id` int(11) NOT NULL,
  `mid` int(11) DEFAULT NULL COMMENT '会员id',
  `course_score` tinyint(4) NOT NULL DEFAULT '0' COMMENT '课程评分',
  `teacher_score` tinyint(4) NOT NULL DEFAULT '0' COMMENT '教师评分',
  `teacher_id` int(11) DEFAULT NULL COMMENT '教师id',
  `course_id` int(11) DEFAULT NULL COMMENT '课程id',
  `datetime` int(11) DEFAULT NULL COMMENT '创建时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT '0',
  `message` text COMMENT '评论'
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='课程教师评分表';

-- --------------------------------------------------------

--
-- 表的结构 `wx_member`
--

CREATE TABLE IF NOT EXISTS `wx_member` (
  `id` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL COMMENT '姓名',
  `cid` varchar(64) DEFAULT NULL COMMENT '身份证',
  `nation` varchar(32) DEFAULT NULL COMMENT '民族',
  `birthday` varchar(32) DEFAULT NULL COMMENT '生日',
  `sex` tinyint(4) DEFAULT '1' COMMENT '1男 0女',
  `tel` varchar(32) DEFAULT NULL COMMENT '手机号码',
  `username` varchar(64) DEFAULT NULL COMMENT '用户名',
  `pass` varchar(64) DEFAULT NULL COMMENT '密码',
  `jf` float DEFAULT NULL COMMENT '积分',
  `source` tinyint(4) DEFAULT NULL COMMENT '数据来源(哪类报名)',
  `sid` int(11) DEFAULT NULL COMMENT '对应报名id',
  `datetime` varchar(32) DEFAULT NULL COMMENT '注册日期',
  `sfz_path` varchar(64) DEFAULT NULL COMMENT '身份证路径',
  `pic_path` varchar(64) DEFAULT NULL COMMENT '照片路径',
  `getway` tinyint(4) DEFAULT '1' COMMENT '证书领取方式 1:自取 2:快递',
  `address` varchar(255) DEFAULT NULL COMMENT '寄送地址',
  `express_name` varchar(128) DEFAULT NULL,
  `express_tel` varchar(32) DEFAULT NULL,
  `is_delete` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='会员表';

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
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COMMENT='系统管理员菜单权限表\r\n';

--
-- 转存表中的数据 `wx_menu`
--

INSERT INTO `wx_menu` (`id`, `name`, `parent`, `route`, `taxis`, `data`, `url`) VALUES
(29, '系统设置', 0, NULL, 20, NULL, ''),
(30, '权限管理', 29, NULL, NULL, NULL, 'permission-form/index'),
(31, '角色管理', 29, NULL, NULL, NULL, 'role-form/index'),
(32, '菜单管理', 29, NULL, NULL, NULL, 'menu/index'),
(33, '用户管理', 29, NULL, NULL, NULL, 'admin/index'),
(34, '设置快捷方式', 29, NULL, 1, NULL, 'shortcut/index'),
(35, '修改密码', 29, NULL, 2, NULL, 'admin/edit-password'),
(39, '分类设置', 38, NULL, 42, NULL, 'items-type/index'),
(40, '转码设置', 38, NULL, 41, NULL, 'items-preset/index'),
(41, '视频管理', 38, NULL, NULL, NULL, 'items/index'),
(43, '视频上传', 38, NULL, NULL, NULL, 'items-upload/index'),
(49, '直播管理', 37, NULL, NULL, NULL, 'course/index'),
(51, '平台管理', 29, NULL, NULL, NULL, 'platform/index'),
(52, '平台管理', 37, NULL, NULL, NULL, 'platform/index'),
(53, '在线报名', 0, NULL, 40, NULL, ''),
(54, '商务委人才申请-已审核', 53, NULL, 14, NULL, 'jianding/index'),
(55, '活动管理', 53, NULL, 20, NULL, 'plan/index'),
(56, '教务管理', 0, NULL, 39, NULL, ''),
(57, '课程管理', 56, NULL, 9, NULL, 'lession/index'),
(58, '教师管理', 56, NULL, 8, NULL, 'teacher/index'),
(60, '会员管理', 56, NULL, NULL, NULL, 'member/index'),
(62, '成绩管理', 56, NULL, 7, NULL, 'grade/index'),
(63, '资料管理', 56, NULL, 6, NULL, 'resource/index'),
(64, '证书领取', 56, NULL, 5, NULL, 'certificate/index'),
(66, '公告信息', 56, NULL, 4, NULL, 'news/index'),
(67, '商务委人才申请-未审核', 53, NULL, 15, NULL, 'jianding/nosh'),
(68, '我的二维码', 29, NULL, NULL, NULL, 'admin/qrcode'),
(69, '招生信息', 56, NULL, NULL, NULL, 'zsinfo/index'),
(70, '订单管理', 56, NULL, NULL, NULL, 'order/index');

-- --------------------------------------------------------

--
-- 表的结构 `wx_news`
--

CREATE TABLE IF NOT EXISTS `wx_news` (
  `id` int(11) NOT NULL,
  `title` varchar(128) DEFAULT NULL COMMENT '标题',
  `content` text COMMENT '内容',
  `pic` varchar(128) DEFAULT NULL COMMENT '图片',
  `attachment` varchar(255) DEFAULT NULL COMMENT '附件',
  `datetime` int(11) DEFAULT NULL COMMENT '日期',
  `is_delete` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除'
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='新闻表';

-- --------------------------------------------------------

--
-- 表的结构 `wx_order`
--

CREATE TABLE IF NOT EXISTS `wx_order` (
  `id` int(11) NOT NULL,
  `order_no` varchar(32) NOT NULL COMMENT '订单号',
  `price` float NOT NULL COMMENT '价格',
  `order_time` varchar(16) NOT NULL COMMENT '订单时间',
  `state` tinyint(4) NOT NULL COMMENT '支付状态：0：处理中；1：支付成功',
  `mid` int(11) NOT NULL COMMENT '会员id',
  `plan_id` int(11) DEFAULT NULL COMMENT '活动id',
  `source` tinyint(4) DEFAULT NULL COMMENT '数据来源(哪类报名)',
  `sid` int(11) DEFAULT NULL COMMENT '对应报名id',
  `is_delete` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='订单表';

-- --------------------------------------------------------

--
-- 表的结构 `wx_plan`
--

CREATE TABLE IF NOT EXISTS `wx_plan` (
  `id` int(11) NOT NULL,
  `name` varchar(128) DEFAULT NULL COMMENT '活动名称',
  `tabletype` tinyint(4) DEFAULT NULL COMMENT '报名类型',
  `img` varchar(128) DEFAULT NULL COMMENT '图片',
  `jf` float DEFAULT NULL COMMENT '活动积分',
  `fee` float DEFAULT NULL COMMENT '费用',
  `description` text COMMENT '活动描述',
  `enddate` varchar(32) DEFAULT NULL COMMENT '报名结束日期',
  `course_id` int(11) DEFAULT NULL COMMENT '课程id',
  `teacher_id` int(11) DEFAULT NULL COMMENT '老师id',
  `is_delete` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='活动计划表';

--
-- 转存表中的数据 `wx_plan`
--

INSERT INTO `wx_plan` (`id`, `name`, `tabletype`, `img`, `jf`, `fee`, `description`, `enddate`, `course_id`, `teacher_id`, `is_delete`) VALUES
(15, '美国营销国际协会（SMEI）中国峰会暨营销科学与创新人才', 2, '/uploads/201802145415-650.jpg', 10, 99, '', '', 1, 1, 0),
(14, '2017年7月电子商务职业资格鉴定', 2, '/uploads/201802145316-888.jpg', 20, 100, '', '', 1, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `wx_platform`
--

CREATE TABLE IF NOT EXISTS `wx_platform` (
  `id` tinyint(5) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `private_key` varchar(64) DEFAULT NULL COMMENT '私钥',
  `public_key` varchar(64) DEFAULT NULL COMMENT '公钥',
  `describe` varchar(255) DEFAULT NULL,
  `is_delete` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wx_teacher`
--

CREATE TABLE IF NOT EXISTS `wx_teacher` (
  `id` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL COMMENT '姓名',
  `phone` varchar(32) DEFAULT NULL COMMENT '电话',
  `course_id` int(11) DEFAULT NULL COMMENT '课程id',
  `is_delete` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `wx_teacher`
--

INSERT INTO `wx_teacher` (`id`, `name`, `phone`, `course_id`, `is_delete`) VALUES
(1, '周鑫鑫', '12366659874', 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `wx_zsinfo`
--

CREATE TABLE IF NOT EXISTS `wx_zsinfo` (
  `id` int(11) NOT NULL,
  `plan_id` int(11) DEFAULT NULL COMMENT '活动id',
  `source` tinyint(4) DEFAULT NULL COMMENT '数据来源(哪类报名)',
  `sid` int(11) DEFAULT NULL COMMENT '对应报名id',
  `zs_id` int(11) DEFAULT NULL COMMENT '招生人员id',
  `mid` int(11) DEFAULT NULL COMMENT '学员id',
  `is_pay` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否支付',
  `is_delete` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除'
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='招生信息表';

-- --------------------------------------------------------

--
-- 表的结构 `wx_zyzgjd_table`
--

CREATE TABLE IF NOT EXISTS `wx_zyzgjd_table` (
  `id` int(11) NOT NULL,
  `plan_id` int(11) DEFAULT NULL COMMENT '活动id',
  `name` varchar(64) DEFAULT NULL COMMENT '姓名',
  `sex` tinyint(4) DEFAULT NULL COMMENT '1：男 0：女',
  `birthday` varchar(32) DEFAULT NULL COMMENT '出生年月',
  `edu_level` tinyint(4) DEFAULT NULL COMMENT '文化程度',
  `card_type` tinyint(4) DEFAULT NULL COMMENT '证件类型',
  `sfz` varchar(64) DEFAULT NULL COMMENT '证件号码',
  `nation` varchar(128) DEFAULT NULL COMMENT '户籍所在地',
  `hukou_type` tinyint(4) DEFAULT NULL COMMENT '户口性质',
  `company` varchar(128) DEFAULT NULL COMMENT '单位名称',
  `address` varchar(128) DEFAULT NULL COMMENT '通讯地址',
  `zipcode` varchar(16) DEFAULT NULL COMMENT '邮政编码',
  `tel` varchar(32) DEFAULT NULL COMMENT '联系电话',
  `phone` varchar(32) DEFAULT NULL COMMENT '手机号码',
  `email` varchar(64) DEFAULT NULL COMMENT '电子邮件',
  `zhiye_type` tinyint(4) DEFAULT NULL COMMENT '现职业资格',
  `zhicheng_type` tinyint(4) DEFAULT NULL COMMENT '现职称',
  `sbzy` varchar(128) DEFAULT NULL COMMENT '申报职业',
  `sbjb` tinyint(4) DEFAULT NULL COMMENT '申报级别',
  `examtype` tinyint(4) DEFAULT NULL COMMENT '考试类型',
  `khkm` tinyint(4) DEFAULT NULL COMMENT '考核科目',
  `is_delete` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='国家职业资格鉴定申请表';

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
  ADD KEY `user_id` (`user_id`),
  ADD KEY `created_at` (`created_at`),
  ADD KEY `item_name` (`item_name`);

--
-- Indexes for table `wx_auth_item`
--
ALTER TABLE `wx_auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `type` (`type`),
  ADD KEY `name` (`name`),
  ADD KEY `created_at` (`created_at`);

--
-- Indexes for table `wx_auth_item_child`
--
ALTER TABLE `wx_auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`),
  ADD KEY `parent` (`parent`);

--
-- Indexes for table `wx_auth_rule`
--
ALTER TABLE `wx_auth_rule`
  ADD PRIMARY KEY (`name`),
  ADD KEY `name` (`name`),
  ADD KEY `created_at` (`created_at`),
  ADD KEY `updated_at` (`updated_at`);

--
-- Indexes for table `wx_jf`
--
ALTER TABLE `wx_jf`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mid` (`mid`);

--
-- Indexes for table `wx_jianding_table`
--
ALTER TABLE `wx_jianding_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plan_id` (`plan_id`),
  ADD KEY `sfz` (`sfz`);

--
-- Indexes for table `wx_lession`
--
ALTER TABLE `wx_lession`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wx_mark`
--
ALTER TABLE `wx_mark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wx_member`
--
ALTER TABLE `wx_member`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sid` (`sid`);

--
-- Indexes for table `wx_menu`
--
ALTER TABLE `wx_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `name` (`name`),
  ADD KEY `route` (`route`(255)),
  ADD KEY `order` (`taxis`);

--
-- Indexes for table `wx_news`
--
ALTER TABLE `wx_news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wx_order`
--
ALTER TABLE `wx_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mid` (`mid`);

--
-- Indexes for table `wx_plan`
--
ALTER TABLE `wx_plan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wx_platform`
--
ALTER TABLE `wx_platform`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wx_teacher`
--
ALTER TABLE `wx_teacher`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wx_zsinfo`
--
ALTER TABLE `wx_zsinfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wx_zyzgjd_table`
--
ALTER TABLE `wx_zyzgjd_table`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `wx_admin`
--
ALTER TABLE `wx_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `wx_jf`
--
ALTER TABLE `wx_jf`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `wx_jianding_table`
--
ALTER TABLE `wx_jianding_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `wx_lession`
--
ALTER TABLE `wx_lession`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `wx_mark`
--
ALTER TABLE `wx_mark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `wx_member`
--
ALTER TABLE `wx_member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `wx_menu`
--
ALTER TABLE `wx_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=71;
--
-- AUTO_INCREMENT for table `wx_news`
--
ALTER TABLE `wx_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `wx_order`
--
ALTER TABLE `wx_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `wx_plan`
--
ALTER TABLE `wx_plan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `wx_platform`
--
ALTER TABLE `wx_platform`
  MODIFY `id` tinyint(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `wx_teacher`
--
ALTER TABLE `wx_teacher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `wx_zsinfo`
--
ALTER TABLE `wx_zsinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `wx_zyzgjd_table`
--
ALTER TABLE `wx_zyzgjd_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 限制导出的表
--

--
-- 限制表 `wx_auth_assignment`
--
ALTER TABLE `wx_auth_assignment`
  ADD CONSTRAINT `wx_auth_assignment_ibfk_2` FOREIGN KEY (`item_name`) REFERENCES `wx_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `wx_auth_item`
--
ALTER TABLE `wx_auth_item`
  ADD CONSTRAINT `wx_auth_item_ibfk_2` FOREIGN KEY (`rule_name`) REFERENCES `wx_auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
