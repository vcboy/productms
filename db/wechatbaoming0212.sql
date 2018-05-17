-- phpMyAdmin SQL Dump
-- version 4.4.15
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2018-01-24 16:47:46
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
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='积分表';

--
-- 转存表中的数据 `wx_jf`
--

INSERT INTO `wx_jf` (`id`, `mid`, `jf`, `way`, `datetime`) VALUES
(1, 1, 5, 'register', NULL),
(2, 2, 1, 'register', NULL),
(3, 3, 5, 'register', NULL),
(4, 4, 5, 'register', NULL),
(5, 5, 5, 'register', '1507558399'),
(6, 6, 5, 'register', '1507558551'),
(7, 7, 5, 'register', '1509194477'),
(8, 8, 5, 'register', '1510109035'),
(9, 9, 5, 'register', '1516689541'),
(10, 10, 5, 'register', '1516758100'),
(11, 11, 5, 'register', '1516764366'),
(12, 12, 5, 'register', '1516764630');

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
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='电子商务专业人才鉴定申请表';

--
-- 转存表中的数据 `wx_jianding_table`
--

INSERT INTO `wx_jianding_table` (`id`, `plan_id`, `company`, `name`, `sex`, `nation`, `birthday`, `sfz`, `bkzs`, `bkfx`, `zsdj`, `tel`, `education`, `job`, `score`, `is_sh`, `is_pay`, `zs_id`, `is_delete`) VALUES
(1, 1, 'a', 'b', 1, 'c', '10/10/0', 'q', 'e', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(2, 2, 'a', 'b', 1, 'sdf', '12/0/0', '777555', '234', NULL, '234', NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(3, 9, 'g', 'r', 1, '34', '15/0/0', '46', 'ert', '456', '456', '2342', '[["6","678","879","Ms."]]', NULL, NULL, 0, 0, 0, 0),
(4, 2, 'a', 'b', 1, 'c', '2003/10/01', '3', '2', '234', '234', '234234', '[["1234","21341","234","Ms."]]', '[]', NULL, 1, 0, 0, 0),
(5, 2, 'asdf', 'sdf', 0, 'dsf', '2005/12/1', '32234', '234', '234', '234', '324', '[["44","32","234","Mr."],["55","66","77","Dr."]]', '[["78","678","678","Sir"]]', NULL, 1, 0, 0, 0),
(6, 2, '', '', 0, '', '', '', '', '', '', '', '', '', NULL, 0, 0, 0, 1),
(7, 1, '浙江大学', '孙兴民', 0, '朝鲜', '2017/08/24', '32666333322114555', '证书', '方向', '3', '136999655555', '经历', '工作经历', NULL, 1, 0, 0, 0),
(8, 9, 'aaa', 'bbb', 1, 'd', '2007/1/1', '123654654321', 'aa', 'cc', 'bb', '03265555555', '[["23","23","23","Mrs."]]', '[["234","432","234","Mr."]]', NULL, 1, 0, 0, 0),
(9, 9, '234', '234', 1, '234', '2005/1/1', '23444442654321', '123', '123', '123', '123', '[["123","123","123","Mrs."]]', '[["123","123","123","Sir"]]', NULL, 1, 0, 0, 0),
(10, 9, 'ccc', 'aaa', 1, 'sdf', '2007/12/1', '2342343123456', '122', '33', '44', '33', '[["44","33","44","Ms."]]', '[["55","66","77","Ms."]]', NULL, 1, 0, 0, 0),
(11, 9, 'bb', '66', 1, '77', '2009/1/11', '987654321', '1234', '534', '643', '23', '[["345","644","657","Ms."]]', '[["776","67","67","Ms."]]', NULL, 1, 0, 0, 0),
(12, 9, 'bbb', 'ee', 1, '44', '2005/12/1', '777555', '444', '66', '55', '77', '[["99","88","77","Ms."],["99","88","77","Ms."]]', '[["oo","uu","tt","Ms."]]', 98, 1, 0, 0, 0),
(13, 9, 'bb', 'dd', 1, 'ee', '2017/1/1', '333333321', '123', '321', '312', '132', '[["123","123","123","Mr."]]', '[["453","45","345","Mr."]]', 55, 1, 0, 0, 0),
(14, 9, 'badad', 'eeeee', 1, 'ee', '2002/11/17', '23423423', '4', '234', '234', '234234234', '[["2","2","33","42"]]', '[["34234","234","2342","34"]]', 0, 0, 0, 0, 0),
(15, 9, 'aaabbb', '234', 1, 'han', '2007/1/1', '123654789632547', '11', '33', '22', '44', '[["55","66","77","88"]]', '[["77","66","55","33"]]', 0, 0, 0, 0, 0),
(16, 8, '浙江工商', '陈志忠', 1, '汗', '2007/4/8', '330227125698563214', '计算机', '技能', '3级', '13696325411', '[["1996.9-1999.7","高专","计算机","职高"]]', '[["2001.3-现在","宁波公司","技工","莆田"]]', 0, 0, 0, 0, 0),
(17, 8, 'AA', 'BB', 1, 'CC', '2005/1/1', '123654456321', '11', '33', '22', '1369696666', '[["113","33","44","55"]]', '[["66","77","88",""]]', 0, 0, 0, 0, 0),
(18, 8, 'AAA', 'BBB', 1, 'CCC', '2006/1/1', '12365445632122', 'DDD', 'FFF', 'EEE', 'GGG', '[["1968","333","222","111"]]', '[["1999","66","77","88"]]', 0, 0, 0, 0, 0),
(19, 8, 'A', 'B', 1, 'C', '2006/1/1', '789654123654', '222', '4', '33', '4', '[["234","34","34","324"]]', '[["3","2","2","2"]]', 0, 0, 0, 0, 0),
(20, 13, 'aa', 'bb', 1, 'cc', '2006/1/1', '123', '123', '123', '123', '123', '[["123","123","123","123"]]', '[["123","123","123","123"]]', 0, 0, 0, 4, 0),
(21, 13, 'aa', 'bb', 1, 'cc', '2007/1/1', '23', 'e', 'wer', 'wer', 'wer', '[["sdf","sdf","de","23"]]', '[["asdf","a","bd","d"]]', 0, 0, 0, 4, 0),
(22, 13, 'abc', 'eee', 1, 'ww', '2007/1/1', 'qwer', 'qwe', '34', '23', '5', '[["34","34","5","334"]]', '[["34","34","23","32"]]', 0, 0, 0, 4, 0),
(23, 13, 'abc', 'ee', 1, 'ewr', '2008/1/1', 'we', 'rwe', '233', 'wer', '23', '[["sdf","sdf","ee","ew"]]', '[["fd","df","ew","sdf"]]', 0, 0, 0, 4, 0);

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

--
-- 转存表中的数据 `wx_mark`
--

INSERT INTO `wx_mark` (`id`, `mid`, `course_score`, `teacher_score`, `teacher_id`, `course_id`, `datetime`, `is_delete`, `message`) VALUES
(9, 5, 4, 2, 1, 1, 1508399599, 0, 'asdf'),
(10, 5, 5, 3, 1, 1, 1508499599, 0, 'asdf'),
(11, 5, 32, 33, 1, 1, 1508499599, 0, 'asdf');

-- --------------------------------------------------------

--
-- 表的结构 `wx_member`
--

CREATE TABLE IF NOT EXISTS `wx_member` (
  `id` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL COMMENT '姓名',
  `cid` varchar(64) DEFAULT NULL COMMENT '身份证',
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
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='会员表';

--
-- 转存表中的数据 `wx_member`
--

INSERT INTO `wx_member` (`id`, `name`, `cid`, `tel`, `username`, `pass`, `jf`, `source`, `sid`, `datetime`, `sfz_path`, `pic_path`, `getway`, `address`, `express_name`, `express_tel`, `is_delete`) VALUES
(1, '234', '23444442654321', '123', '23444442654321', '654321', 5, 2, 9, NULL, NULL, NULL, 1, '', NULL, NULL, 1),
(2, '234', '23444442654321', '123', '23444442654321', '654321', 5, 2, 9, NULL, NULL, NULL, 1, '', NULL, NULL, 0),
(3, 'aaa', '2342343123456', '33', '2342343123456', '123456', 5, 2, 10, NULL, NULL, NULL, 1, '', NULL, NULL, 0),
(4, '66', '987654321', '23', '987654321', '654321', 5, 2, 11, NULL, NULL, NULL, 1, '', NULL, NULL, 0),
(5, 'ee2124433', '777555', '1356666444', '777555', '777555', 5, 2, 12, NULL, './upload/sfz/777555', './upload/zj/777555.jpg', 2, '123', 'abc', '123123', 0),
(6, 'dd', '333333321', '132', '333333321', '333321', 5, 2, 13, '1507558551', NULL, NULL, 1, '', NULL, NULL, 0),
(7, 'eeeee', '23423423', '234234234', '23423423', '423423', 5, 2, 14, '1509194477', NULL, NULL, 1, '', NULL, NULL, 0),
(8, 'B', '789654123654', '4', '789654123654', '123654', 5, 2, 19, '1510109035', NULL, NULL, 1, NULL, NULL, NULL, 0),
(9, 'bb', '123', '123', '123', '123', 5, 2, 20, '1516689541', NULL, NULL, 1, NULL, NULL, NULL, 0),
(10, 'bb', '23', 'wer', '23', '23', 5, 2, 21, '1516758100', NULL, NULL, 1, NULL, NULL, NULL, 0),
(11, 'eee', 'qwer', '5', 'qwer', 'qwer', 5, 2, 22, '1516764366', NULL, NULL, 1, NULL, NULL, NULL, 0),
(12, 'ee', 'we', '23', 'we', 'we', 5, 2, 23, '1516764630', NULL, NULL, 1, NULL, NULL, NULL, 0);

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
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COMMENT='系统管理员菜单权限表\r\n';

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
(59, '会员管理', 0, NULL, 38, NULL, ''),
(60, '会员管理', 56, NULL, NULL, NULL, 'member/index'),
(61, '积分管理', 59, NULL, NULL, NULL, 'jf/index'),
(62, '成绩管理', 56, NULL, 7, NULL, 'grade/index'),
(63, '资料管理', 56, NULL, 6, NULL, 'resource/index'),
(64, '证书领取', 56, NULL, 5, NULL, 'certificate/index'),
(66, '公告信息', 56, NULL, 4, NULL, 'news/index'),
(67, '商务委人才申请-未审核', 53, NULL, 15, NULL, 'jianding/nosh'),
(68, '我的二维码', 29, NULL, NULL, NULL, 'admin/qrcode'),
(69, '招生信息', 56, NULL, NULL, NULL, 'zsinfo/index');

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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='新闻表';

--
-- 转存表中的数据 `wx_news`
--

INSERT INTO `wx_news` (`id`, `title`, `content`, `pic`, `attachment`, `datetime`, `is_delete`) VALUES
(1, '丁薛祥接任中央直属机关工委书', '丁薛祥，男，汉族，1962年9月生，江苏南通人，1982年8月参加工作，1984年10月加入中国共产党，复旦大学管理学院行政管理专业毕业，在职研究生学历，理学硕士学位，教授级高级工程师。\r\n\r\n　　现任中央政治局委员、中央书记处书记，中央办公厅主任兼国家主席办公室主任，中央直属机关工委书记。\r\n\r\n　　1978-1982年　东北重型机械学院机械工程系锻压工艺及设备专业学习\r\n\r\n　　1982-1984年　上海材料研究所九室科研人员\r\n\r\n　　1984-1988年　上海材料研究所办公室副主任、团委书记\r\n\r\n　　1988-1992年　上海材料研究所办公室主任、宣传部主任\r\n\r\n　　1992-1994年　上海材料研究所九室主任（其间：1993.09-1993.12上海市委党校中青年干部培训班学习）', NULL, NULL, 1508499599, 0),
(2, '丁薛祥接任中央直属机关工委书', '丁薛祥，男，汉族，1962年9月生，江苏南通人，1982年8月参加工作，1984年10月加入中国共产党，复旦大学管理学院行政管理专业毕业，在职研究生学历，理学硕士学位，教授级高级工程师。\r\n\r\n　　现任中央政治局委员、中央书记处书记，中央办公厅主任兼国家主席办公室主任，中央直属机关工委书记。\r\n\r\n　　1978-1982年　东北重型机械学院机械工程系锻压工艺及设备专业学习\r\n\r\n　　1982-1984年　上海材料研究所九室科研人员\r\n\r\n　　1984-1988年　上海材料研究所办公室副主任、团委书记\r\n\r\n　　1988-1992年　上海材料研究所办公室主任、宣传部主任\r\n\r\n　　1992-1994年　上海材料研究所九室主任（其间：1993.09-1993.12上海市委党校中青年干部培训班学习）', NULL, NULL, 1508499999, 0),
(3, '啊啊啊啊啊啊啊', NULL, NULL, '', NULL, 0),
(4, '不不不', NULL, NULL, '', 1510194748, 0),
(5, '擦擦擦', '<p>都是<img src="/ueditor/php/upload/image/20171109/1510194887.png" title="1510194887.png" alt="{C7A42637-DEAF-4D11-B059-739764295F04}.png"/></p>', NULL, '', 1510194868, 0),
(6, 'adfasd', '<p>asdf</p><p style="line-height: 16px;"><img style="vertical-align: middle; margin-right: 2px;" src="http://www.local/wechatbaoming/backend/web/ueditor/dialogs/attachment/fileTypeImages/icon_xls.gif"/><a style="font-size:12px; color:#0066cc;" href="/ueditor/php/upload/file/20171109/1510208575.xls" title="学生成绩管理.xls">学生成绩管理.xls</a></p><p style="line-height: 16px;"><img style="vertical-align: middle; margin-right: 2px;" src="http://www.local/wechatbaoming/backend/web/ueditor/dialogs/attachment/fileTypeImages/icon_jpg.gif"/><a style="font-size:12px; color:#0066cc;" href="/ueditor/php/upload/file/20171109/1510208575.png" title="png-Angular2-by-StuQ.png">png-Angular2-by-StuQ.png</a></p><p><br/></p>', NULL, '33', 1510207156, 0),
(7, 'abcde', '<p>ssss</p><p>sdfsdf</p>', '/uploads/201711145337-993.jpg', '', 1510210156, 0);

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单表';

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
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='活动计划表';

--
-- 转存表中的数据 `wx_plan`
--

INSERT INTO `wx_plan` (`id`, `name`, `tabletype`, `img`, `jf`, `fee`, `description`, `enddate`, `course_id`, `teacher_id`, `is_delete`) VALUES
(1, '2017年08月活动', 1, NULL, 10, NULL, '安安', '2017/08/31', 1, 1, 0),
(2, '2017年9月活动', 4, NULL, 15, 100, '', '', 1, 1, 1),
(3, '啊啊啊啊', 1, '', 2, NULL, '', '2017/08/23', 1, 1, 1),
(4, '啊啊啊啊', 1, '', 2, NULL, '', '2017/08/23', 1, 1, 1),
(5, '啊啊啊啊', 1, '', 2, NULL, '', '2017/08/23', 1, 1, 1),
(6, '啊啊啊啊', 1, '', 2, NULL, '', '2017/08/23', 1, 1, 0),
(7, '啊啊啊啊', 1, '', 2, NULL, '', '2017/08/23', 1, 1, 1),
(8, '阿斯顿发送到', 2, '', 10, 59, '', '', 1, 1, 0),
(9, '阿斯顿发送到', 2, '', 10, 99, '', '2018/01/15', 1, 1, 0),
(10, '我们1', 1, '', 1, 100, '', '', 1, 1, 1),
(11, '其他人1', 4, '/uploads/201709100602-503.jpg', 5, 100, '111', '2017/09/20', 1, 1, 1),
(12, '20170909', 3, NULL, 3, 5, '', '', 1, 1, 1),
(13, '4444', 2, NULL, 6, 60, '', '', 1, 1, 0);

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

--
-- 转存表中的数据 `wx_platform`
--

INSERT INTO `wx_platform` (`id`, `name`, `private_key`, `public_key`, `describe`, `is_delete`) VALUES
(1, '麦能网', 'bbb', 'dd', 'ee', 0),
(3, '自考平台', 'zjnep20170718', 'zjnep', '人', 0);

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
  `is_pay` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否支付',
  `is_delete` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除'
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='招生信息表';

--
-- 转存表中的数据 `wx_zsinfo`
--

INSERT INTO `wx_zsinfo` (`id`, `plan_id`, `source`, `sid`, `zs_id`, `is_pay`, `is_delete`) VALUES
(2, 13, 2, 23, 4, 0, 0),
(3, 13, 2, 23, 3, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `wx_zsinfo_id_seq`
--

CREATE TABLE IF NOT EXISTS `wx_zsinfo_id_seq` (
  `id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `wx_zsinfo_id_seq`
--

INSERT INTO `wx_zsinfo_id_seq` (`id`) VALUES
(2);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `wx_jianding_table`
--
ALTER TABLE `wx_jianding_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=24;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `wx_menu`
--
ALTER TABLE `wx_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=70;
--
-- AUTO_INCREMENT for table `wx_news`
--
ALTER TABLE `wx_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `wx_order`
--
ALTER TABLE `wx_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wx_plan`
--
ALTER TABLE `wx_plan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
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
