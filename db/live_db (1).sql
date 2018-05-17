-- phpMyAdmin SQL Dump
-- version 4.4.15
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2017-08-30 14:57:14
-- 服务器版本： 10.1.9-MariaDB
-- PHP Version: 7.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wx_db`
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
  `level` tinyint(2) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `wx_admin`
--

INSERT INTO `wx_admin` (`id`, `username`, `password`, `name`, `gender`, `correspondence_id`, `role_name`, `is_delete`, `my_quickentry`, `courseids`, `disciplineids`, `p_id`, `level`) VALUES
(1, 'admin', '96e79218965eb72c92a549dd5a330112', '超级管理员', 1, NULL, 'zongadming', 0, '{"75":{"id":75,"name":"\\u4fee\\u6539\\u5bc6\\u7801","url":"admin\\/edit-password"}}', '', '', 1, 1),
(2, 'test', '96e79218965eb72c92a549dd5a330112', '测试账号', 1, NULL, NULL, 0, NULL, NULL, NULL, 1, 0),
(3, 'member', '96e79218965eb72c92a549dd5a330112', '1', 1, NULL, NULL, 0, NULL, NULL, NULL, 2, 0);

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
('channel_create', 2, '添加频道', NULL, NULL, NULL, NULL, 36),
('course_index', 2, '课程管理查看', NULL, NULL, NULL, NULL, 49),
('itemspreset_index', 2, '转码查看', NULL, NULL, NULL, NULL, 40),
('itemstype/index', 2, '视频分类查看', NULL, NULL, NULL, NULL, 39),
('itemsupload_index', 2, '视频上传', NULL, NULL, NULL, NULL, 43),
('items_index', 2, '视频查看', NULL, NULL, NULL, NULL, 41),
('menu_create', 2, '菜单添加', NULL, NULL, NULL, NULL, 32),
('menu_delete', 2, '菜单删除', NULL, NULL, NULL, NULL, 32),
('menu_taxis', 2, '菜单排序', NULL, NULL, NULL, NULL, 32),
('menu_update', 2, '菜单修改', NULL, NULL, NULL, NULL, 32),
('password_update', 2, '修改密码', NULL, NULL, NULL, NULL, 75),
('permission_create', 2, '权限添加', NULL, NULL, NULL, NULL, 30),
('permission_delete', 2, '权限删除', NULL, NULL, NULL, NULL, 30),
('permission_update', 2, '权限修改', NULL, NULL, NULL, NULL, 30),
('platform_index', 2, '平台管理', NULL, NULL, NULL, NULL, 52),
('role_create', 2, '角色添加', NULL, NULL, NULL, NULL, 31),
('role_delete', 2, '角色删除', NULL, NULL, NULL, NULL, 31),
('role_permission', 2, '角色权限设置', NULL, NULL, NULL, NULL, 31),
('role_update', 2, '角色修改', NULL, NULL, NULL, NULL, 31),
('shortcut_update', 2, '设置快捷方式', NULL, NULL, NULL, NULL, 74),
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
('teacher', 'enroll_score'),
('teacher', 'notice_create'),
('teacher', 'notice_delete'),
('teacher', 'notice_edit'),
('zongadming', 'admin_create'),
('zongadming', 'admin_delete'),
('zongadming', 'admin_quickentry'),
('zongadming', 'admin_update'),
('zongadming', 'channel_create'),
('zongadming', 'course_index'),
('zongadming', 'menu_create'),
('zongadming', 'menu_delete'),
('zongadming', 'menu_taxis'),
('zongadming', 'menu_update'),
('zongadming', 'permission_create'),
('zongadming', 'permission_delete'),
('zongadming', 'permission_update'),
('zongadming', 'platform_index'),
('zongadming', 'role_create'),
('zongadming', 'role_delete'),
('zongadming', 'role_permission'),
('zongadming', 'role_update');

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
-- 表的结构 `wx_channel`
--

CREATE TABLE IF NOT EXISTS `wx_channel` (
  `cid` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '网易频道ID 32位字符串',
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '频道名称',
  `ctime` bigint(15) DEFAULT NULL COMMENT '创建频道的时间戳',
  `push_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '推流地址',
  `http_pull_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT 'http拉流地址',
  `hls_pull_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT 'hls拉流地址',
  `rtmp_pull_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT 'rtmp拉流地址',
  `status` smallint(4) DEFAULT '0' COMMENT '状态 0 空闲  1 直播中 2 禁用',
  `type` smallint(4) DEFAULT '0' COMMENT '频道类型（0:rtmp；1:hls；2:http）',
  `is_exists` smallint(4) DEFAULT '1' COMMENT '外网（网易）是否存在',
  `is_delete` smallint(4) DEFAULT '0',
  `uid` varchar(255) DEFAULT NULL COMMENT '用户id',
  `need_record` smallint(4) DEFAULT '0' COMMENT '1-开启录制； 0-关闭录制',
  `format` smallint(4) DEFAULT '0' COMMENT '1-flv； 0-mp4',
  `duration` smallint(4) DEFAULT NULL COMMENT '录制切片时长(分钟)，默认120分钟',
  `filename` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '录制后文件名'
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

--
-- 转存表中的数据 `wx_channel`
--

INSERT INTO `wx_channel` (`cid`, `name`, `ctime`, `push_url`, `http_pull_url`, `hls_pull_url`, `rtmp_pull_url`, `status`, `type`, `is_exists`, `is_delete`, `uid`, `need_record`, `format`, `duration`, `filename`) VALUES
('8bf1e3d5d9ac4ec187010e3fbbd9492e', '频道', 1471423438592, 'rtmp://pee475c07.live.126.net/live/8bf1e3d5d9ac4ec187010e3fbbd9492e?wsSecret=f5f207bf20bcb4655dc805a41ae93cdd&wsTime=1471505590', 'http://vee475c07.live.126.net/live/8bf1e3d5d9ac4ec187010e3fbbd9492e.flv', 'http://pullhlsee475c07.live.126.net/live/8bf1e3d5d9ac4ec187010e3fbbd9492e/playlist.m3u8', 'rtmp://vee475c07.live.126.net/live/8bf1e3d5d9ac4ec187010e3fbbd9492e', 2, 0, 0, 1, '31037', 0, 1, 120, '频道'),
('81aff6eb0b2849ccb16131dac79b01dc', '笔', 1471423326773, 'rtmp://pee475c07.live.126.net/live/81aff6eb0b2849ccb16131dac79b01dc?wsSecret=19ed515ddf9dcf8952b07fee406d17f0&wsTime=1471502953', 'http://vee475c07.live.126.net/live/81aff6eb0b2849ccb16131dac79b01dc.flv', 'http://pullhlsee475c07.live.126.net/live/81aff6eb0b2849ccb16131dac79b01dc/playlist.m3u8', 'rtmp://vee475c07.live.126.net/live/81aff6eb0b2849ccb16131dac79b01dc', 2, 0, 0, 1, '31037', 0, 1, 120, '笔'),
('d4f1615e1d504fc49c270f6b4eb9e513', '添加频道2', 1471416197055, 'rtmp://pee475c07.live.126.net/live/d4f1615e1d504fc49c270f6b4eb9e513?wsSecret=2dfd4507a709fb4d6bf9a7c2b00d05c0&wsTime=1471505133', 'http://vee475c07.live.126.net/live/d4f1615e1d504fc49c270f6b4eb9e513.flv', 'http://pullhlsee475c07.live.126.net/live/d4f1615e1d504fc49c270f6b4eb9e513/playlist.m3u8', 'rtmp://vee475c07.live.126.net/live/d4f1615e1d504fc49c270f6b4eb9e513', 2, 0, 0, 1, '31037', 0, 1, 120, '添加频道'),
('4a7e41400e7641ecacea8c302abbb22e', '在线课堂', 1469429614943, 'rtmp://pee475c07.live.126.net/live/4a7e41400e7641ecacea8c302abbb22e?wsSecret=566d7a8bb2dd92a1c0557f0f3da9adc0&wsTime=1471502953', 'http://vee475c07.live.126.net/live/4a7e41400e7641ecacea8c302abbb22e.flv', 'http://pullhlsee475c07.live.126.net/live/4a7e41400e7641ecacea8c302abbb22e/playlist.m3u8', 'rtmp://vee475c07.live.126.net/live/4a7e41400e7641ecacea8c302abbb22e', 0, 0, 1, 0, '31037', 0, 1, 120, '在线课堂'),
('f3974215168742f2ad91aa331e43b628', '吉博直播', 1469068992627, 'rtmp://pee475c07.live.126.net/live/f3974215168742f2ad91aa331e43b628?wsSecret=618e416cdc418952806ae5cb7d128a7f&wsTime=1471502953', 'http://vee475c07.live.126.net/live/f3974215168742f2ad91aa331e43b628.flv', 'http://pullhlsee475c07.live.126.net/live/f3974215168742f2ad91aa331e43b628/playlist.m3u8', 'rtmp://vee475c07.live.126.net/live/f3974215168742f2ad91aa331e43b628', 0, 0, 1, 0, '31037', 0, 1, 120, '吉博直播'),
('b1d15b8ae44c4f8691ca7ed4ca64192f', '新建频道', 1471509347655, 'rtmp://pee475c07.live.126.net/live/b1d15b8ae44c4f8691ca7ed4ca64192f?wsSecret=4174c5b1d8efb1d8d896e9c87e312833&wsTime=1471593966', 'http://vee475c07.live.126.net/live/b1d15b8ae44c4f8691ca7ed4ca64192f.flv', 'http://pullhlsee475c07.live.126.net/live/b1d15b8ae44c4f8691ca7ed4ca64192f/playlist.m3u8', 'rtmp://vee475c07.live.126.net/live/b1d15b8ae44c4f8691ca7ed4ca64192f', 0, 0, 0, 1, '31037', 1, 1, 5, '新建频道'),
('379fe4cfafbf40e79f3b2374e6eec783', '测试时间', 1471576001410, 'rtmp://pee475c07.live.126.net/live/379fe4cfafbf40e79f3b2374e6eec783?wsSecret=9d1d5fe6d65a0b9e454ea9785bf02387&wsTime=1472191951', 'http://vee475c07.live.126.net/live/379fe4cfafbf40e79f3b2374e6eec783.flv', 'http://pullhlsee475c07.live.126.net/live/379fe4cfafbf40e79f3b2374e6eec783/playlist.m3u8', 'rtmp://vee475c07.live.126.net/live/379fe4cfafbf40e79f3b2374e6eec783', 0, 0, 0, 0, '31037', 1, 1, 5, '测试时间'),
('58fc5aac39de4c40980ad8c84d10feef', '添加频道', 1472194768310, 'rtmp://pee475c07.live.126.net/live/58fc5aac39de4c40980ad8c84d10feef?wsSecret=9e0d2cbe4f5cf65d53ad86a2fe048e9f&wsTime=1472449311', 'http://vee475c07.live.126.net/live/58fc5aac39de4c40980ad8c84d10feef.flv', 'http://pullhlsee475c07.live.126.net/live/58fc5aac39de4c40980ad8c84d10feef/playlist.m3u8', 'rtmp://vee475c07.live.126.net/live/58fc5aac39de4c40980ad8c84d10feef', 0, 0, 0, 1, '31037', 0, 1, 120, '添加频道2'),
('55cc1dba5c454a25a8a8ceff8ba9bd32', 'test', 1473322560436, 'rtmp://pee475c07.live.126.net/live/55cc1dba5c454a25a8a8ceff8ba9bd32?wsSecret=3257ead0222da2023c77ee774b1dd05a&wsTime=1473323809', 'http://vee475c07.live.126.net/live/55cc1dba5c454a25a8a8ceff8ba9bd32.flv', 'http://pullhlsee475c07.live.126.net/live/55cc1dba5c454a25a8a8ceff8ba9bd32/playlist.m3u8', 'rtmp://vee475c07.live.126.net/live/55cc1dba5c454a25a8a8ceff8ba9bd32', 0, 0, 1, 0, '31037', 0, 0, 120, 'test');

-- --------------------------------------------------------

--
-- 表的结构 `wx_channel_detail`
--

CREATE TABLE IF NOT EXISTS `wx_channel_detail` (
  `id` int(11) NOT NULL,
  `streamId` varchar(40) NOT NULL COMMENT '直播id',
  `channel_name` varchar(40) NOT NULL,
  `upstream_url` varchar(80) DEFAULT NULL COMMENT '推流地址',
  `upstream_url_params` varchar(220) DEFAULT NULL COMMENT '直播推流地址参数',
  `rtmp_address` varchar(80) DEFAULT NULL COMMENT '拉流rtmp地址',
  `flv_address` varchar(80) DEFAULT NULL,
  `hls_address` varchar(80) DEFAULT NULL,
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `end_time` int(10) NOT NULL,
  `channel_status` tinyint(2) NOT NULL,
  `audience_count` int(8) DEFAULT NULL COMMENT '观众人数',
  `pic` varchar(100) DEFAULT NULL,
  `like_count` int(8) DEFAULT NULL,
  `video_url` varchar(200) DEFAULT NULL,
  `pid` int(5) NOT NULL COMMENT '平台id',
  `isdelete` tinyint(1) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `wx_channel_detail`
--

INSERT INTO `wx_channel_detail` (`id`, `streamId`, `channel_name`, `upstream_url`, `upstream_url_params`, `rtmp_address`, `flv_address`, `hls_address`, `create_time`, `end_time`, `channel_status`, `audience_count`, `pic`, `like_count`, `video_url`, `pid`, `isdelete`) VALUES
(69, '7947_rz2k1wv4o27l9dyh7g2me', '1', 'rtmp://7947.livepush.myqcloud.com/live/', '7947_rz2k1wv4o27l9dyh7g2me?bizid=7947&txSecret=fdc1910a23e02f4dec8ac0e83c58b6dc&txTime=58C11E7C', 'rtmp://7947.liveplay.myqcloud.com/live/7947_rz2k1wv4o27l9dyh7g2me', 'http://7947.liveplay.myqcloud.com/live/7947_rz2k1wv4o27l9dyh7g2me.flv', 'http://7947.liveplay.myqcloud.com/live/7947_rz2k1wv4o27l9dyh7g2me.m3u8', 1490767820, 1489051260, 0, NULL, NULL, NULL, NULL, 1, 1),
(67, '7947_m6oqtsm10tis61w887nry', 'test1', 'rtmp://7947.livepush.myqcloud.com/live/', '7947_m6oqtsm10tis61w887nry?bizid=7947&txSecret=9dd6d0e980696c2a53a442ba37f4309c&txTime=58DA7A70', 'rtmp://7947.liveplay.myqcloud.com/live/7947_m6oqtsm10tis61w887nry', 'http://7947.liveplay.myqcloud.com/live/7947_m6oqtsm10tis61w887nry.flv', 'http://7947.liveplay.myqcloud.com/live/7947_m6oqtsm10tis61w887nry.m3u8', 1490673600, 1490713200, 0, NULL, NULL, NULL, NULL, 1, 1),
(68, '7947_d0xr548nxcvz19t9fekcc', 'test2', 'rtmp://7947.livepush.myqcloud.com/live/', '7947_d0xr548nxcvz19t9fekcc?bizid=7947&txSecret=918cb421c669fe2396334ee7c7578de2&txTime=58DA7A70', 'rtmp://7947.liveplay.myqcloud.com/live/7947_d0xr548nxcvz19t9fekcc', 'http://7947.liveplay.myqcloud.com/live/7947_d0xr548nxcvz19t9fekcc.flv', 'http://7947.liveplay.myqcloud.com/live/7947_d0xr548nxcvz19t9fekcc.m3u8', 1490673600, 1490713200, 0, NULL, NULL, NULL, NULL, 1, 1),
(66, '7947_bj2co88laxj7eu6433fdy', '123123123', 'rtmp://7947.livepush.myqcloud.com/live/', '7947_bj2co88laxj7eu6433fdy?bizid=7947&txSecret=fca5b8c4addcd8563dd0f2c10033e36c&txTime=58DA7A70', 'rtmp://7947.liveplay.myqcloud.com/live/7947_bj2co88laxj7eu6433fdy', 'http://7947.liveplay.myqcloud.com/live/7947_bj2co88laxj7eu6433fdy.flv', 'http://7947.liveplay.myqcloud.com/live/7947_bj2co88laxj7eu6433fdy.m3u8', 1490630400, 1490713200, 0, NULL, NULL, NULL, NULL, 1, 1),
(70, '7947_61zf2eslntpaen195zktd', '1', 'rtmp://7947.livepush.myqcloud.com/live/', '7947_61zf2eslntpaen195zktd?bizid=7947&txSecret=d3330799e7fc6d24e892e8fd5f887d80&txTime=58C11E7C', 'rtmp://7947.liveplay.myqcloud.com/live/7947_61zf2eslntpaen195zktd', 'http://7947.liveplay.myqcloud.com/live/7947_61zf2eslntpaen195zktd.flv', 'http://7947.liveplay.myqcloud.com/live/7947_61zf2eslntpaen195zktd.m3u8', 1490777294, 1489051260, 0, NULL, NULL, NULL, NULL, 1, 1),
(71, '7947_jv9zotn7c126p3ktfp3ij', '1', 'rtmp://7947.livepush.myqcloud.com/live/', '7947_jv9zotn7c126p3ktfp3ij?bizid=7947&txSecret=b6a61e5aba9803e893ba1f293babe3c5&txTime=58C11E7C', 'rtmp://7947.liveplay.myqcloud.com/live/7947_jv9zotn7c126p3ktfp3ij', 'http://7947.liveplay.myqcloud.com/live/7947_jv9zotn7c126p3ktfp3ij.flv', 'http://7947.liveplay.myqcloud.com/live/7947_jv9zotn7c126p3ktfp3ij.m3u8', 1490777568, 1489051260, 0, NULL, NULL, NULL, NULL, 1, 1),
(72, '7947_3uns32d4aykqk748g76dt', '1', 'rtmp://7947.livepush.myqcloud.com/live/', '7947_3uns32d4aykqk748g76dt?bizid=7947&txSecret=335f710362f189616aa8e527e2c633a0&txTime=58C11E7C', 'rtmp://7947.liveplay.myqcloud.com/live/7947_3uns32d4aykqk748g76dt', 'http://7947.liveplay.myqcloud.com/live/7947_3uns32d4aykqk748g76dt.flv', 'http://7947.liveplay.myqcloud.com/live/7947_3uns32d4aykqk748g76dt.m3u8', 1490777570, 1489051260, 0, NULL, NULL, NULL, NULL, 1, 1),
(73, '7947_i3tr72mvu31kp19nf1b0q', '1', 'rtmp://7947.livepush.myqcloud.com/live/', '7947_i3tr72mvu31kp19nf1b0q?bizid=7947&txSecret=b9a567da05f00a33b59c4f3ae79053b9&txTime=58C11E7C', 'rtmp://7947.liveplay.myqcloud.com/live/7947_i3tr72mvu31kp19nf1b0q', 'http://7947.liveplay.myqcloud.com/live/7947_i3tr72mvu31kp19nf1b0q.flv', 'http://7947.liveplay.myqcloud.com/live/7947_i3tr72mvu31kp19nf1b0q.m3u8', 1490778054, 1489051260, 0, NULL, NULL, NULL, NULL, 1, 1),
(74, '7947_eiftpeo57u0li4urpdros', '1', 'rtmp://7947.livepush.myqcloud.com/live/', '7947_eiftpeo57u0li4urpdros?bizid=7947&txSecret=c329912568d1b191be5b3bdc91d3ceab&txTime=58C11E7C', 'rtmp://7947.liveplay.myqcloud.com/live/7947_eiftpeo57u0li4urpdros', 'http://7947.liveplay.myqcloud.com/live/7947_eiftpeo57u0li4urpdros.flv', 'http://7947.liveplay.myqcloud.com/live/7947_eiftpeo57u0li4urpdros.m3u8', 1490778117, 1489051260, 0, NULL, NULL, NULL, NULL, 1, 1),
(75, '7947_0k7lsy4lmfh7ijr4fofx9', '1', 'rtmp://7947.livepush.myqcloud.com/live/', '7947_0k7lsy4lmfh7ijr4fofx9?bizid=7947&txSecret=7a07b72d59e29c8c8ad5b385e91b3c1d&txTime=58C11E7C', 'rtmp://7947.liveplay.myqcloud.com/live/7947_0k7lsy4lmfh7ijr4fofx9', 'http://7947.liveplay.myqcloud.com/live/7947_0k7lsy4lmfh7ijr4fofx9.flv', 'http://7947.liveplay.myqcloud.com/live/7947_0k7lsy4lmfh7ijr4fofx9.m3u8', 1490778122, 1489051260, 0, NULL, NULL, NULL, NULL, 1, 1),
(76, '7947_nj4o87ih3tsqe7at6ez8g', '1', 'rtmp://7947.livepush.myqcloud.com/live/', '7947_nj4o87ih3tsqe7at6ez8g?bizid=7947&txSecret=16dc1f5501586427be5a40af68be26f2&txTime=58C11E7C', 'rtmp://7947.liveplay.myqcloud.com/live/7947_nj4o87ih3tsqe7at6ez8g', 'http://7947.liveplay.myqcloud.com/live/7947_nj4o87ih3tsqe7at6ez8g.flv', 'http://7947.liveplay.myqcloud.com/live/7947_nj4o87ih3tsqe7at6ez8g.m3u8', 1490778124, 1489051260, 0, NULL, NULL, NULL, NULL, 1, 1),
(77, '7947_a7hj0jo6bn10i9886aiym', '1', 'rtmp://7947.livepush.myqcloud.com/live/', '7947_a7hj0jo6bn10i9886aiym?bizid=7947&txSecret=8e23655174804faae9e43bc599ba9dfa&txTime=58C11E7C', 'rtmp://7947.liveplay.myqcloud.com/live/7947_a7hj0jo6bn10i9886aiym', 'http://7947.liveplay.myqcloud.com/live/7947_a7hj0jo6bn10i9886aiym.flv', 'http://7947.liveplay.myqcloud.com/live/7947_a7hj0jo6bn10i9886aiym.m3u8', 1490778830, 1489051260, 0, NULL, NULL, NULL, NULL, 1, 1),
(78, '7947_nobaq8zb518gonh7w26x7', '1', 'rtmp://7947.livepush.myqcloud.com/live/', '7947_nobaq8zb518gonh7w26x7?bizid=7947&txSecret=c17099699489468d2d452cdc416f3e6c&txTime=58C11E7C', 'rtmp://7947.liveplay.myqcloud.com/live/7947_nobaq8zb518gonh7w26x7', 'http://7947.liveplay.myqcloud.com/live/7947_nobaq8zb518gonh7w26x7.flv', 'http://7947.liveplay.myqcloud.com/live/7947_nobaq8zb518gonh7w26x7.m3u8', 1490778921, 1489051260, 0, NULL, NULL, NULL, NULL, 1, 1),
(79, '7947_zm9mqt6h7hbqoig0gzokn', '1', 'rtmp://7947.livepush.myqcloud.com/live/', '7947_zm9mqt6h7hbqoig0gzokn?bizid=7947&txSecret=945bc053e8eecdce1996173961738e15&txTime=58C11E7C', 'rtmp://7947.liveplay.myqcloud.com/live/7947_zm9mqt6h7hbqoig0gzokn', 'http://7947.liveplay.myqcloud.com/live/7947_zm9mqt6h7hbqoig0gzokn.flv', 'http://7947.liveplay.myqcloud.com/live/7947_zm9mqt6h7hbqoig0gzokn.m3u8', 1490778952, 1489051260, 0, NULL, NULL, NULL, NULL, 1, 1),
(80, '7947_jz14p5nuzdelohtvz51tu', '1', 'rtmp://7947.livepush.myqcloud.com/live/', '7947_jz14p5nuzdelohtvz51tu?bizid=7947&txSecret=79858389ae1ae9a47d3818abe185e146&txTime=58C11E7C', 'rtmp://7947.liveplay.myqcloud.com/live/7947_jz14p5nuzdelohtvz51tu', 'http://7947.liveplay.myqcloud.com/live/7947_jz14p5nuzdelohtvz51tu.flv', 'http://7947.liveplay.myqcloud.com/live/7947_jz14p5nuzdelohtvz51tu.m3u8', 1490839447, 1489051260, 0, NULL, NULL, NULL, NULL, 1, 1),
(81, '7947_fhyzmml2jfpw6bn1itlqd', '1', 'rtmp://7947.livepush.myqcloud.com/live/', '7947_fhyzmml2jfpw6bn1itlqd?bizid=7947&txSecret=e5445dd74cf7e2573b50fa0e896387ab&txTime=5FE9B2F4', 'rtmp://7947.liveplay.myqcloud.com/live/7947_fhyzmml2jfpw6bn1itlqd', 'http://7947.liveplay.myqcloud.com/live/7947_fhyzmml2jfpw6bn1itlqd.flv', 'http://7947.liveplay.myqcloud.com/live/7947_fhyzmml2jfpw6bn1itlqd.m3u8', 1490839657, 1609151220, 0, NULL, NULL, NULL, NULL, 1, 1),
(82, '7947_24rh0vf4s56ubco0bbqiq', 'test', 'rtmp://7947.livepush.myqcloud.com/live/', '7947_24rh0vf4s56ubco0bbqiq?bizid=7947&txSecret=8896d2f498ff9797d283943deb53d5fa&txTime=5953D280', 'rtmp://7947.liveplay.myqcloud.com/live/7947_24rh0vf4s56ubco0bbqiq', 'http://7947.liveplay.myqcloud.com/live/7947_24rh0vf4s56ubco0bbqiq.flv', 'http://7947.liveplay.myqcloud.com/live/7947_24rh0vf4s56ubco0bbqiq.m3u8', 1496505600, 1498665600, 0, NULL, NULL, NULL, NULL, 1, 1),
(83, '7947_b2o39hfifpfpovaf62wpi', 'sss', 'rtmp://7947.livepush.myqcloud.com/live/', '7947_b2o39hfifpfpovaf62wpi?bizid=7947&txSecret=90ea89753363674c9ea91da7f2e29ea8&txTime=595D29D4', 'rtmp://7947.liveplay.myqcloud.com/live/7947_b2o39hfifpfpovaf62wpi', 'http://7947.liveplay.myqcloud.com/live/7947_b2o39hfifpfpovaf62wpi.flv', 'http://7947.liveplay.myqcloud.com/live/7947_b2o39hfifpfpovaf62wpi.m3u8', 1499191380, 1499277780, 0, NULL, '../web/upload_pic/Desert.jpg', NULL, NULL, 1, 0),
(84, '7947_o2trk9kqqtmvlblwwx0dq', 'adfasdf', 'rtmp://7947.livepush.myqcloud.com/live/', '7947_o2trk9kqqtmvlblwwx0dq?bizid=7947&txSecret=9d36d4272edbbff73aba1f4e20dab041&txTime=595CA964', 'rtmp://7947.liveplay.myqcloud.com/live/7947_o2trk9kqqtmvlblwwx0dq', 'http://7947.liveplay.myqcloud.com/live/7947_o2trk9kqqtmvlblwwx0dq.flv', 'http://7947.liveplay.myqcloud.com/live/7947_o2trk9kqqtmvlblwwx0dq.m3u8', 1499236380, 1499244900, 0, NULL, '../web/upload_pic/Hydrangeas.jpg', NULL, NULL, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `wx_course`
--

CREATE TABLE IF NOT EXISTS `wx_course` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '课程名称',
  `channel_id` int(11) DEFAULT NULL COMMENT '频道id',
  `img` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '图片路径',
  `price` int(11) DEFAULT NULL COMMENT '价格',
  `teacher_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '主讲',
  `description` text COMMENT '详述',
  `desc` varchar(1000) CHARACTER SET utf8 DEFAULT NULL COMMENT '简述',
  `bm_num` int(11) DEFAULT '0' COMMENT '报名人数',
  `score` float(4,0) DEFAULT NULL COMMENT '评分',
  `status` smallint(4) DEFAULT '0' COMMENT '状态 0 未开始 1 直播中 2 直播完成 ',
  `wx_start_time` int(11) DEFAULT NULL COMMENT '直播开始时间',
  `wx_end_time` int(11) DEFAULT NULL COMMENT '直播结束时间',
  `create_time` int(11) DEFAULT NULL,
  `is_delete` smallint(4) DEFAULT '0',
  `is_home` smallint(4) DEFAULT '1' COMMENT '是否显示前台',
  `streamId` varchar(128) NOT NULL COMMENT '直播id',
  `upstream_url_params` varchar(255) NOT NULL COMMENT '直播推流地址参数',
  `audience_count` int(11) NOT NULL COMMENT '参与人数'
) ENGINE=MyISAM AUTO_INCREMENT=127 DEFAULT CHARSET=gbk;

--
-- 转存表中的数据 `wx_course`
--

INSERT INTO `wx_course` (`id`, `name`, `channel_id`, `img`, `price`, `teacher_name`, `description`, `desc`, `bm_num`, `score`, `status`, `wx_start_time`, `wx_end_time`, `create_time`, `is_delete`, `is_home`, `streamId`, `upstream_url_params`, `audience_count`) VALUES
(7, '课程', 1, '/upload_files/course_resource/201608131942-282.jpg', NULL, '', NULL, '', 0, NULL, 0, 0, 0, 1472447982, 1, 1, '', '', 0),
(8, '测试2', 2, '', NULL, '', NULL, '', 0, NULL, 0, 1472449999, 1472450000, 1472450018, 1, 1, '', '', 0),
(9, '20170714直播', 3, '/upload_files/course_resource/201707114517-989.jpg', 1, '周老师', NULL, '直播', 0, NULL, 0, 1500004252, 1500007498, 1500003917, 0, 1, '', '', 0),
(126, 'sfasdf', 2, '/upload_files/course_resource/201708143301-566.png', NULL, '周老师', NULL, 'asdf', 0, NULL, 0, 1501741968, 1501749171, 1501741981, 1, 1, '4804_gyenzxnambf1j8rng6acu', '4804_gyenzxnambf1j8rng6acu?bizid=4804&txSecret=899c184e494507bc6ddd449b27c75ee6&txTime=5982DFB3', 0),
(125, '2017080101', 3, '/upload_files/course_resource/201708134502-334.jpg', NULL, '', NULL, 'dd', 0, NULL, 0, 1501573583, 1501591585, 1502084702, 0, 1, '4804_8m2jdniybx0kslajam8m9', '4804_8m2jdniybx0kslajam8m9?bizid=4804&txSecret=bfb295293cdd9a17051e1a5c5c8ec693&txTime=59807821', 0),
(124, '20170801', 3, '/upload_files/course_resource/201708093113-978.png', NULL, '', NULL, '', 0, NULL, 0, 1501551063, 1501565466, 1501551073, 0, 1, '4804_xi2qulzxfvhysqv2gi30c', '4804_xi2qulzxfvhysqv2gi30c?bizid=4804&txSecret=1628af293cdf3d5e9c0f19e036066a0d&txTime=5980121A', 0);

-- --------------------------------------------------------

--
-- 表的结构 `wx_items`
--

CREATE TABLE IF NOT EXISTS `wx_items` (
  `vid` int(11) NOT NULL,
  `videoName` varchar(255) DEFAULT NULL COMMENT '视频的名称',
  `status` smallint(4) DEFAULT NULL COMMENT '视频的状态，10表示初始，20表示失败，30表示处理中，40表示成功，50表示屏蔽',
  `description` varchar(255) DEFAULT NULL COMMENT '视频的描述信息',
  `completeTime` bigint(20) DEFAULT NULL COMMENT '转码完成时间',
  `duration` int(11) DEFAULT NULL COMMENT '视频播放时长（单位：秒）',
  `typeId` int(11) DEFAULT NULL COMMENT '视频所属分类Id',
  `typeName` varchar(255) DEFAULT NULL COMMENT '视频所属分类名称',
  `snapshotUrl` varchar(1000) DEFAULT NULL COMMENT '视频封面截图URL地址',
  `origUrl` varchar(255) DEFAULT NULL COMMENT '原始视频的播放地址',
  `downloadOrigUrl` varchar(1000) DEFAULT NULL COMMENT '原始视频的下载地址',
  `initialSize` bigint(20) DEFAULT NULL COMMENT '原始视频文件大小（单位：字节）',
  `sdMp4Url` varchar(255) DEFAULT NULL COMMENT '标清Mp4视频格式文件播放地址',
  `downloadSdMp4Url` varchar(1000) DEFAULT NULL COMMENT '标清Mp4视频格式文件下载地址',
  `sdMp4Size` bigint(20) DEFAULT NULL COMMENT '标清Mp4视频格式文件的大小（单位：字节）',
  `hdMp4Url` varchar(255) DEFAULT NULL COMMENT '高清Mp4视频格式文件播放地址',
  `downloadHdMp4Url` varchar(1000) DEFAULT NULL COMMENT '高清Mp4视频格式文件下载地址',
  `hdMp4Size` bigint(20) DEFAULT NULL COMMENT '高清Mp4视频格式文件的大小（单位：字节）',
  `shdMp4Url` varchar(255) DEFAULT NULL COMMENT '超清Mp4视频格式文件播放地址',
  `downloadShdMp4Url` varchar(1000) DEFAULT NULL COMMENT '超清Mp4视频格式文件下载地址',
  `shdMp4Size` bigint(20) DEFAULT NULL COMMENT '超清Mp4视频格式文件的大小（单位：字节）',
  `sdFlvUrl` varchar(255) DEFAULT NULL COMMENT '标清Flv视频格式文件播放地址',
  `downloadSdFlvUrl` varchar(1000) DEFAULT NULL COMMENT '标清Flv视频格式文件下载地址',
  `sdFlvSize` bigint(20) DEFAULT NULL COMMENT '标清Flv视频格式文件的大小（单位：字节）',
  `hdFlvUrl` varchar(255) DEFAULT NULL COMMENT '高清Flv视频格式文件播放地址',
  `downloadHdFlvUrl` varchar(1000) DEFAULT NULL COMMENT '高清Flv视频格式文件下载地址',
  `hdFlvSize` bigint(20) DEFAULT NULL COMMENT '高清Flv视频格式文件的大小（单位：字节）',
  `shdFlvUrl` varchar(255) DEFAULT NULL COMMENT '超清Flv视频格式文件播放地址',
  `downloadShdFlvUrl` varchar(1000) DEFAULT NULL COMMENT '超清Flv视频格式文件下载地址',
  `shdFlvSize` bigint(20) DEFAULT NULL COMMENT '超清Flv视频格式文件的大小（单位：字节）',
  `sdHlsUrl` varchar(255) DEFAULT NULL COMMENT '标清Hls视频格式文件播放地址',
  `downloadSdHlsUrl` varchar(1000) DEFAULT NULL COMMENT '标清Hls视频格式文件下载地址',
  `sdHlsSize` bigint(20) DEFAULT NULL COMMENT '标清Hls视频格式文件的大小（单位：字节）',
  `hdHlsUrl` varchar(255) DEFAULT NULL COMMENT '高清Hls视频格式文件播放地址',
  `downloadHdHlsUrl` varchar(1000) DEFAULT NULL COMMENT '高清Hls视频格式文件下载地址',
  `hdHlsSize` bigint(20) DEFAULT NULL COMMENT '高清Hls视频格式文件的大小（单位：字节）',
  `shdHlsUrl` varchar(255) DEFAULT NULL COMMENT '超清Hls视频格式文件播放地址',
  `downloadShdHlsUrl` varchar(1000) DEFAULT NULL COMMENT '超清Hls视频格式文件下载地址',
  `shdHlsSize` bigint(20) DEFAULT NULL COMMENT '超清Hls视频格式文件的大小（单位：字节）',
  `createTime` bigint(15) DEFAULT NULL COMMENT '视频上传时间（单位：毫秒）',
  `updateTime` bigint(15) DEFAULT NULL,
  `is_exists` smallint(4) DEFAULT '1' COMMENT '是否存在外网',
  `is_delete` smallint(4) DEFAULT '0',
  `course_id` int(11) DEFAULT NULL COMMENT '课程id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `wx_items`
--

INSERT INTO `wx_items` (`vid`, `videoName`, `status`, `description`, `completeTime`, `duration`, `typeId`, `typeName`, `snapshotUrl`, `origUrl`, `downloadOrigUrl`, `initialSize`, `sdMp4Url`, `downloadSdMp4Url`, `sdMp4Size`, `hdMp4Url`, `downloadHdMp4Url`, `hdMp4Size`, `shdMp4Url`, `downloadShdMp4Url`, `shdMp4Size`, `sdFlvUrl`, `downloadSdFlvUrl`, `sdFlvSize`, `hdFlvUrl`, `downloadHdFlvUrl`, `hdFlvSize`, `shdFlvUrl`, `downloadShdFlvUrl`, `shdFlvSize`, `sdHlsUrl`, `downloadSdHlsUrl`, `sdHlsSize`, `hdHlsUrl`, `downloadHdHlsUrl`, `hdHlsSize`, `shdHlsUrl`, `downloadShdHlsUrl`, `shdHlsSize`, `createTime`, `updateTime`, `is_exists`, `is_delete`, `course_id`) VALUES
(99250, '测试时间_20160825-092931_20160825-092940', 50, NULL, 1472088870664, 8, 10250, '直播录制', NULL, 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/1_379fe4cfafbf40e79f3b2374e6eec783_1472088571825_1472088580670_117704-00000.flv', 'http://vodw0gzlakx.nosdn.127.net/1_379fe4cfafbf40e79f3b2374e6eec783_1472088571825_1472088580670_117704-00000.flv?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1503724239&download=%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_20160825-092931_20160825-092940.flv&Signature=Z8rgPslhH3QrIahNxMFEvbLBTNAflj9PDsGCtpyj%2BfI%3D', 702646, NULL, NULL, NULL, 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/mp4/iv0M1ugb_99250_hd.mp4', 'http://vodw0gzlakx.nosdn.127.net/mp4%2Fiv0M1ugb_99250_hd.mp4?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1503724239&download=%25E9%25AB%2598%25E6%25B8%2585_%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_20160825-092931_20160825-092940.mp4&Signature=Y3Rz3rfHZRUethll6ai9d61C5OFFa2Xqe09LH0F8z54%3D', 1059359, NULL, NULL, NULL, NULL, NULL, NULL, 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/flv/6KrnuCMe_99250_hd.flv', 'http://vodw0gzlakx.nosdn.127.net/flv%2F6KrnuCMe_99250_hd.flv?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1503724239&download=%25E9%25AB%2598%25E6%25B8%2585_%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_20160825-092931_20160825-092940.flv&Signature=ZGB3Rfz5%2Bh0dtqi3i%2Bxz5lrs8SZoPggB6RutJGg3i0s%3D', 816688, NULL, NULL, NULL, NULL, NULL, NULL, 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/hls/nYXqhXM0_99250_hd.m3u8', 'http://vodw0gzlakx.nosdn.127.net/hls%2FnYXqhXM0_99250_hd.m3u8?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1503724239&download=%25E9%25AB%2598%25E6%25B8%2585_%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_20160825-092931_20160825-092940.hls&Signature=EgUIOJV%2F3RXhd25uerOUhRfGzglmOhJlLH8enlrgFEY%3D', 2327756, NULL, NULL, NULL, 1472088580172, 1472178438219, 0, 1, NULL),
(98382, '测试时间_20160825-092648_20160825-092804', 40, NULL, NULL, 75, 10250, '直播录制', NULL, 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/1_379fe4cfafbf40e79f3b2374e6eec783_1472088408843_1472088484156_117696-00000.flv', 'http://vodw0gzlakx.nosdn.127.net/1_379fe4cfafbf40e79f3b2374e6eec783_1472088408843_1472088484156_117696-00000.flv?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1503724239&download=%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_20160825-092648_20160825-092804.flv&Signature=veUaFKMYePtQ6OPERLQD%2FrAVV%2BXAE4HE0ScTbkdoQx4%3D', 5681208, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1472088481385, 1472088481385, 0, 1, NULL),
(95252, '测试时间_20160823-104629_20160823-104743', 40, NULL, 1472178631971, 74, 10383, '测试分类', NULL, 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/1_379fe4cfafbf40e79f3b2374e6eec783_1471920389121_1471920463596_113879-00000.flv', 'http://vodw0gzlakx.nosdn.127.net/1_379fe4cfafbf40e79f3b2374e6eec783_1471920389121_1471920463596_113879-00000.flv?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1503724239&download=%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_20160823-104629_20160823-104743.flv&Signature=fplro%2FVFe%2Fkvg0da3OqwKup0fEsa1eyPBOK%2BigHcQRg%3D', 5603366, 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/mp4/ctYjJX1a_95252_sd.mp4', 'http://vodw0gzlakx.nosdn.127.net/mp4%2FctYjJX1a_95252_sd.mp4?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1503724239&download=%25E6%25A0%2587%25E6%25B8%2585_%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_20160823-104629_20160823-104743.mp4&Signature=iicH00F6MsCUy2J%2BvoOqq6bejP%2Btsufwox6nPRmVdGE%3D', 7719789, 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/mp4/yp8NFcFe_95252_hd.mp4', 'http://vodw0gzlakx.nosdn.127.net/mp4%2Fyp8NFcFe_95252_hd.mp4?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1503724239&download=%25E9%25AB%2598%25E6%25B8%2585_%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_20160823-104629_20160823-104743.mp4&Signature=%2BhIqCfI8hgbN8RwnGo4wvrs7RcptEGdFnPXYgLEp6Wc%3D', 10596459, 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/mp4/8i76PsUH_95252_shd.mp4', 'http://vodw0gzlakx.nosdn.127.net/mp4%2F8i76PsUH_95252_shd.mp4?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1503724239&download=%25E8%25B6%2585%25E6%25B8%2585_%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_20160823-104629_20160823-104743.mp4&Signature=urCocnlGQv8EU9ZregiBJz6XMQ9vI%2BJpzLVJ2qXdKvQ%3D', 16254867, '', '', 0, 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/flv/PkLn5VPZ_95252_hd.flv', 'http://vodw0gzlakx.nosdn.127.net/flv%2FPkLn5VPZ_95252_hd.flv?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1503724239&download=%25E9%25AB%2598%25E6%25B8%2585_%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_20160823-104629_20160823-104743.flv&Signature=Lm2GOYUE6OLpmkgmv7cKy%2Bv3A4c895hcNUPHLXBqork%3D', 9268179, 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/flv/iPb1cjA3_95252_shd.flv', 'http://vodw0gzlakx.nosdn.127.net/flv%2FiPb1cjA3_95252_shd.flv?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1503724239&download=%25E8%25B6%2585%25E6%25B8%2585_%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_20160823-104629_20160823-104743.flv&Signature=5%2Bb37wlj9SRGlRfe0ElkueQIt%2F0hvFaPvokcsZFwZAo%3D', 14804626, '', '', 0, 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/hls/6nN7beFW_95252_hd.m3u8', 'http://vodw0gzlakx.nosdn.127.net/hls%2F6nN7beFW_95252_hd.m3u8?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1503724239&download=%25E9%25AB%2598%25E6%25B8%2585_%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_20160823-104629_20160823-104743.hls&Signature=WmaTe6TYOietaZ70o%2FonYbSYVcnFGlaCSN7Lj8icbB8%3D', 21367744, 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/hls/v9yPcrlk_95252_shd.m3u8', 'http://vodw0gzlakx.nosdn.127.net/hls%2Fv9yPcrlk_95252_shd.m3u8?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1503724239&download=%25E8%25B6%2585%25E6%25B8%2585_%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_20160823-104629_20160823-104743.hls&Signature=uxx3JiiV1aHdJ0210yi7ESvJyt5RDV8iFk2D6%2FcIT2c%3D', 26448452, 1471920464736, 1472178631971, 0, 1, NULL),
(99545, '测试时间_20160826-131705_20160826-131752s', 40, '', 1472190181166, 46, 10250, '直播录制', NULL, 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/1_379fe4cfafbf40e79f3b2374e6eec783_1472188625972_1472188672386_120600-00000.flv', 'http://vodw0gzlakx.nosdn.127.net/1_379fe4cfafbf40e79f3b2374e6eec783_1472188625972_1472188672386_120600-00000.flv?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1504861134&download=%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_20160826-131705_20160826-131752s.flv&Signature=x%2F0RoX2VE6nTEVhDtgVPLXIrhW6SoXDBz9LqIRxfeEQ%3D', 3506563, 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/mp4/DLol1iFK_99545_sd.mp4', 'http://vodw0gzlakx.nosdn.127.net/mp4%2FDLol1iFK_99545_sd.mp4?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1504861134&download=%25E6%25A0%2587%25E6%25B8%2585_%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_20160826-131705_20160826-131752s.mp4&Signature=SoFHIudqI5EQpblDHHc%2Fgu6Ngw3SbeQhY4zOhewLVks%3D', 4780680, 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/mp4/rdXaugsm_99545_hd.mp4', 'http://vodw0gzlakx.nosdn.127.net/mp4%2FrdXaugsm_99545_hd.mp4?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1504861134&download=%25E9%25AB%2598%25E6%25B8%2585_%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_20160826-131705_20160826-131752s.mp4&Signature=hYEAUTw%2FVtR7lUjv0t5oxug9XHxHAJ9D45jGJmo2e64%3D', 6463922, 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/mp4/WfVmqbfT_99545_shd.mp4', 'http://vodw0gzlakx.nosdn.127.net/mp4%2FWfVmqbfT_99545_shd.mp4?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1504861134&download=%25E8%25B6%2585%25E6%25B8%2585_%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_20160826-131705_20160826-131752s.mp4&Signature=Q4RjvY3UKFSQidQYiX8cj37GuYKHTlkUIdFAaWgjFYc%3D', 9958752, 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/flv/NHRIPFZT_99545_sd.flv', 'http://vodw0gzlakx.nosdn.127.net/flv%2FNHRIPFZT_99545_sd.flv?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1504861134&download=%25E6%25A0%2587%25E6%25B8%2585_%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_20160826-131705_20160826-131752s.flv&Signature=c%2Ff0xLE2FqNiNtzi%2B%2FErA4RBo6hdiHfCZ9etVa2Xeew%3D', 3899783, 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/flv/USTCAHyS_99545_hd.flv', 'http://vodw0gzlakx.nosdn.127.net/flv%2FUSTCAHyS_99545_hd.flv?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1504861134&download=%25E9%25AB%2598%25E6%25B8%2585_%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_20160826-131705_20160826-131752s.flv&Signature=A84CrObXJStsQxlBq2ZazjWFJGhd4fIZZdqaLY0UGU8%3D', 5551211, 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/flv/mKoAgALt_99545_shd.flv', 'http://vodw0gzlakx.nosdn.127.net/flv%2FmKoAgALt_99545_shd.flv?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1504861134&download=%25E8%25B6%2585%25E6%25B8%2585_%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_20160826-131705_20160826-131752s.flv&Signature=H5iBqHyMwI7%2FP7u4xrkcP%2BIbqEtv7i4IvXFTbKUlRa8%3D', 8814062, 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/hls/z5WWPBBZ_99545_sd.m3u8', 'http://vodw0gzlakx.nosdn.127.net/hls%2Fz5WWPBBZ_99545_sd.m3u8?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1504861134&download=%25E6%25A0%2587%25E6%25B8%2585_%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_20160826-131705_20160826-131752s.hls&Signature=7wjVbZ9020LbWExhHzgfTtNMUaFCsjzG5G7z%2FyT%2BHvw%3D', 11961417, 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/hls/Vkqf0WrI_99545_hd.m3u8', 'http://vodw0gzlakx.nosdn.127.net/hls%2FVkqf0WrI_99545_hd.m3u8?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1504861134&download=%25E9%25AB%2598%25E6%25B8%2585_%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_20160826-131705_20160826-131752s.hls&Signature=T0cJH218AEjgLEZrzqSVUM2xck1u4ZtRZgvM5fGz9Ck%3D', 13225717, 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/hls/06UdRLyT_99545_shd.m3u8', 'http://vodw0gzlakx.nosdn.127.net/hls%2F06UdRLyT_99545_shd.m3u8?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1504861134&download=%25E8%25B6%2585%25E6%25B8%2585_%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_20160826-131705_20160826-131752s.hls&Signature=h3EnUaj8aSntu4szoqMUQm%2BUsqMscgwYNbZX2jjes9Q%3D', 16260794, 1472188670520, 1472452507687, 1, 0, 8),
(100642, '测试时间_s20160826-131615_20160826-131632', 40, NULL, 1472190397485, 16, 10250, '直播录制', NULL, 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/1_379fe4cfafbf40e79f3b2374e6eec783_1472188575387_1472188592109_120598-00000.flv', 'http://vodw0gzlakx.nosdn.127.net/1_379fe4cfafbf40e79f3b2374e6eec783_1472188575387_1472188592109_120598-00000.flv?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1504861134&download=%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_s20160826-131615_20160826-131632.flv&Signature=PRwl6GwnK3kFW2Fa1XWjioaQYYF5CMkBGUYasN7lT7Q%3D', 1326004, 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/mp4/aN2VFL4w_100642_sd.mp4', 'http://vodw0gzlakx.nosdn.127.net/mp4%2FaN2VFL4w_100642_sd.mp4?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1504861134&download=%25E6%25A0%2587%25E6%25B8%2585_%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_s20160826-131615_20160826-131632.mp4&Signature=pn7ZZFwqu%2FWDkgBEjAdenwI7g2jSSnjMg04wYDbY9S0%3D', 1679942, 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/mp4/nuxzMfk6_100642_hd.mp4', 'http://vodw0gzlakx.nosdn.127.net/mp4%2FnuxzMfk6_100642_hd.mp4?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1504861134&download=%25E9%25AB%2598%25E6%25B8%2585_%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_s20160826-131615_20160826-131632.mp4&Signature=GSggEgePT41VCuKn5D91OW%2FZQ9b8%2F%2Bbqpplu88cpAfA%3D', 2223244, 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/mp4/FDSGGj9u_100642_shd.mp4', 'http://vodw0gzlakx.nosdn.127.net/mp4%2FFDSGGj9u_100642_shd.mp4?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1504861134&download=%25E8%25B6%2585%25E6%25B8%2585_%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_s20160826-131615_20160826-131632.mp4&Signature=VvOu2%2BExgarCSpkTzmbquF7KdXgGvID3jXo8nDa%2B2J4%3D', 3424861, 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/flv/tWXC5IVT_100642_sd.flv', 'http://vodw0gzlakx.nosdn.127.net/flv%2FtWXC5IVT_100642_sd.flv?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1504861134&download=%25E6%25A0%2587%25E6%25B8%2585_%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_s20160826-131615_20160826-131632.flv&Signature=uglorv5dgqOmEPEbSKks6ai%2BO0S8jbhH%2BXPbL3o6FSw%3D', 1310564, 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/flv/KpkBLzht_100642_hd.flv', 'http://vodw0gzlakx.nosdn.127.net/flv%2FKpkBLzht_100642_hd.flv?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1504861134&download=%25E9%25AB%2598%25E6%25B8%2585_%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_s20160826-131615_20160826-131632.flv&Signature=1zgWcnDNeTrMM%2FMc4I0mpjQRpecLEncS0K%2Bp7ivozyk%3D', 1880646, 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/flv/tAXYdPXH_100642_shd.flv', 'http://vodw0gzlakx.nosdn.127.net/flv%2FtAXYdPXH_100642_shd.flv?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1504861134&download=%25E8%25B6%2585%25E6%25B8%2585_%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_s20160826-131615_20160826-131632.flv&Signature=yFW1sGIelzgdrugL3mEZHakCN8C6EiIbnt5vKLLKg9M%3D', 2989614, 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/hls/zPfQ1O4G_100642_sd.m3u8', 'http://vodw0gzlakx.nosdn.127.net/hls%2FzPfQ1O4G_100642_sd.m3u8?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1504861134&download=%25E6%25A0%2587%25E6%25B8%2585_%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_s20160826-131615_20160826-131632.hls&Signature=eakQ8mTBu2rdJaVWF%2BUwWF1mMpZxduSzpctDhhPdrwU%3D', 4234308, 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/hls/rz6Jv8fB_100642_hd.m3u8', 'http://vodw0gzlakx.nosdn.127.net/hls%2Frz6Jv8fB_100642_hd.m3u8?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1504861134&download=%25E9%25AB%2598%25E6%25B8%2585_%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_s20160826-131615_20160826-131632.hls&Signature=QAWMI7oU1NDPzZ7PuE1yIRx4BJ3lz0ZRpDGCobeZDnE%3D', 4629860, 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/hls/SunmXDqy_100642_shd.m3u8', 'http://vodw0gzlakx.nosdn.127.net/hls%2FSunmXDqy_100642_shd.m3u8?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1504861134&download=%25E8%25B6%2585%25E6%25B8%2585_%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_s20160826-131615_20160826-131632.hls&Signature=%2F%2FKAfP5hGiKhfETbdQz0MPaFZ%2BxNaaNeeBG6O%2F9g%2Fvw%3D', 5678714, 1472188591540, 1472190397485, 1, 0, NULL),
(98992, 'VID_20160823_100218', 40, NULL, NULL, 5, 10249, '默认分类', 'http://vodw0gzlakx.nosdn.127.net/8f810927-6924-4c0c-a203-e594a7313524.jpg', 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/25f373ad-b057-4644-b1b9-05910c4625f8.mp4', 'http://vodw0gzlakx.nosdn.127.net/25f373ad-b057-4644-b1b9-05910c4625f8.mp4?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1504861134&download=VID_20160823_100218.mp4&Signature=F8UZ6YdpgdH4mCw3rqWqyCdVLuMtUjSrH91tbahVOOk%3D', 6089103, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1472192218154, 1472192219290, 1, 0, NULL),
(118786, 'test_20160908-163805_20160908-164014', 30, NULL, NULL, 129, 10250, '直播录制', NULL, 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/1_55cc1dba5c454a25a8a8ceff8ba9bd32_1473323885577_1473324014589_141331-00000.flv', 'http://vodw0gzlakx.nosdn.127.net/1_55cc1dba5c454a25a8a8ceff8ba9bd32_1473323885577_1473324014589_141331-00000.flv?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1504861134&download=test_20160908-163805_20160908-164014.flv&Signature=1BrfX1ybHhrdqytHwQghr%2Fyl1%2BmwYF8k%2F0qrM%2FKFBEs%3D', 7731400, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1473324015724, 1473324131018, 1, 0, NULL),
(121165, 'test_20160908-163653_20160908-163722', 40, NULL, NULL, 29, 10250, '直播录制', NULL, 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/1_55cc1dba5c454a25a8a8ceff8ba9bd32_1473323813158_1473323842750_141327-00000.flv', 'http://vodw0gzlakx.nosdn.127.net/1_55cc1dba5c454a25a8a8ceff8ba9bd32_1473323813158_1473323842750_141327-00000.flv?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1504861134&download=test_20160908-163653_20160908-163722.flv&Signature=TaC8Ke2zGdGJS0t5cu4UwOBhk7IH8Ux4AJ42kfC1yis%3D', 1754014, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1473323841861, 1473323841861, 1, 0, NULL),
(119528, 'test_20160908-165614_20160908-165623', 40, NULL, NULL, 8, 10250, '直播录制', NULL, 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/1_55cc1dba5c454a25a8a8ceff8ba9bd32_1473324974635_1473324983121_141413-00000.flv', 'http://vodw0gzlakx.nosdn.127.net/1_55cc1dba5c454a25a8a8ceff8ba9bd32_1473324974635_1473324983121_141413-00000.flv?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1504861134&download=test_20160908-165614_20160908-165623.flv&Signature=m7JdeGgqsz6UqUeYhcasmyVjwP8MJHdsodeaUOJNo0A%3D', 515937, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1473324984817, 1473324984817, 1, 0, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `wx_items_preset`
--

CREATE TABLE IF NOT EXISTS `wx_items_preset` (
  `presetId` int(11) NOT NULL,
  `presetName` varchar(255) CHARACTER SET utf8 DEFAULT '视频转码模板的名称',
  `sdMp4` smallint(4) DEFAULT '0' COMMENT '	标清Mp4格式（1表示包含，0表示不包含）',
  `hdMp4` smallint(4) DEFAULT '0' COMMENT '1表示包含，0表示不包含）',
  `shdMp4` smallint(4) DEFAULT NULL COMMENT '超清Mp4格式（1表示包含，0表示不包含）',
  `sdFlv` smallint(4) DEFAULT NULL COMMENT '标清Flv格式（1表示包含，0表示不包含）',
  `hdFlv` smallint(4) DEFAULT NULL COMMENT '高清Flv格式（1表示包含，0表示不包含）',
  `shdFlv` smallint(4) DEFAULT NULL COMMENT '超清Flv格式（1表示包含，0表示不包含）',
  `sdHls` smallint(4) DEFAULT NULL COMMENT '标清Hls格式（1表示包含，0表示不包含）',
  `hdHls` smallint(4) DEFAULT NULL COMMENT '高清Hls格式（1表示包含，0表示不包含）',
  `shdHls` smallint(4) DEFAULT NULL COMMENT '超清Hls格式（1表示包含，0表示不包含）',
  `isDel` smallint(4) DEFAULT '1' COMMENT '是否允许被删除（默认模板不允许删除），1：允许，0：不允许',
  `is_delete` smallint(4) DEFAULT '0',
  `is_exists` smallint(4) DEFAULT '1' COMMENT '外网是否存在（网易）'
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

--
-- 转存表中的数据 `wx_items_preset`
--

INSERT INTO `wx_items_preset` (`presetId`, `presetName`, `sdMp4`, `hdMp4`, `shdMp4`, `sdFlv`, `hdFlv`, `shdFlv`, `sdHls`, `hdHls`, `shdHls`, `isDel`, `is_delete`, `is_exists`) VALUES
(63643, '默认模板', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(63793, '转码测试', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0),
(66106, '测试转码2', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1),
(63854, '测试转码', 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `wx_items_type`
--

CREATE TABLE IF NOT EXISTS `wx_items_type` (
  `typeId` int(11) NOT NULL,
  `typeName` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '视频分类的名称',
  `desc` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '视频分类的描述信息',
  `number` int(11) DEFAULT '0' COMMENT '该用户该类别下的视频文件数量',
  `isDel` smallint(4) DEFAULT '1' COMMENT '是否允许被删除（默认分类不允许删除），1：允许，0：不允许',
  `createTime` bigint(20) DEFAULT NULL COMMENT '视频分类的创建时间（单位：毫秒）',
  `is_delete` smallint(4) DEFAULT '0',
  `is_exists` smallint(4) DEFAULT '1' COMMENT '是否存在外网(网易)'
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

--
-- 转存表中的数据 `wx_items_type`
--

INSERT INTO `wx_items_type` (`typeId`, `typeName`, `desc`, `number`, `isDel`, `createTime`, `is_delete`, `is_exists`) VALUES
(10249, '默认分类', '默认分类', 0, 0, 1471583984106, 0, 1),
(10250, '直播录制', '直播录制', 0, 0, 1471583984107, 0, 1),
(10383, '测试分类', '', 2, 1, 1471914194594, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `wx_items_watermark`
--

CREATE TABLE IF NOT EXISTS `wx_items_watermark` (
  `watermarkId` int(11) NOT NULL COMMENT '视频水印模板的名称',
  `watermarkName` varchar(255) DEFAULT NULL COMMENT '视频水印的描述信息',
  `description` varchar(255) DEFAULT NULL COMMENT '视频水印的描述信息',
  `coordinate` varchar(255) DEFAULT NULL COMMENT '视频水印左上角的坐标，其值为相对值，比如：',
  `scale` varchar(255) DEFAULT NULL COMMENT '视频水印的长宽，其值为相对值，比如：'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COMMENT='系统管理员菜单权限表\r\n';

--
-- 转存表中的数据 `wx_menu`
--

INSERT INTO `wx_menu` (`id`, `name`, `parent`, `route`, `taxis`, `data`, `url`) VALUES
(29, '系统设置', 0, NULL, 40, NULL, ''),
(30, '权限管理', 29, NULL, NULL, NULL, 'permission-form/index'),
(31, '角色管理', 29, NULL, NULL, NULL, 'role-form/index'),
(32, '菜单管理', 29, NULL, NULL, NULL, 'menu/index'),
(33, '用户管理', 29, NULL, NULL, NULL, 'admin/index'),
(34, '设置快捷方式', 29, NULL, 1, NULL, 'shortcut/index'),
(35, '修改密码', 29, NULL, 2, NULL, 'admin/edit-password'),
(36, '频道管理', 29, NULL, 41, NULL, 'channel/index'),
(37, '直播管理', 0, NULL, 43, NULL, ''),
(38, '点播管理', 0, NULL, 42, NULL, ''),
(39, '分类设置', 38, NULL, 42, NULL, 'items-type/index'),
(40, '转码设置', 38, NULL, 41, NULL, 'items-preset/index'),
(41, '视频管理', 38, NULL, NULL, NULL, 'items/index'),
(43, '视频上传', 38, NULL, NULL, NULL, 'items-upload/index'),
(49, '直播管理', 37, NULL, NULL, NULL, 'course/index'),
(51, '平台管理', 29, NULL, NULL, NULL, 'platform/index'),
(52, '平台管理', 37, NULL, NULL, NULL, 'platform/index');

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
-- 表的结构 `wx_secret_key`
--

CREATE TABLE IF NOT EXISTS `wx_secret_key` (
  `public_key` varchar(258) NOT NULL,
  `private_key` varchar(258) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `wx_secret_key`
--

INSERT INTO `wx_secret_key` (`public_key`, `private_key`) VALUES
('123', 'md5');

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
-- Indexes for table `wx_channel`
--
ALTER TABLE `wx_channel`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `wx_channel_detail`
--
ALTER TABLE `wx_channel_detail`
  ADD PRIMARY KEY (`id`),
  ADD FULLTEXT KEY `upstream_url_params` (`upstream_url_params`);

--
-- Indexes for table `wx_course`
--
ALTER TABLE `wx_course`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wx_items`
--
ALTER TABLE `wx_items`
  ADD PRIMARY KEY (`vid`);

--
-- Indexes for table `wx_items_preset`
--
ALTER TABLE `wx_items_preset`
  ADD PRIMARY KEY (`presetId`);

--
-- Indexes for table `wx_items_type`
--
ALTER TABLE `wx_items_type`
  ADD PRIMARY KEY (`typeId`);

--
-- Indexes for table `wx_items_watermark`
--
ALTER TABLE `wx_items_watermark`
  ADD PRIMARY KEY (`watermarkId`);

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
-- Indexes for table `wx_platform`
--
ALTER TABLE `wx_platform`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `wx_admin`
--
ALTER TABLE `wx_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `wx_channel_detail`
--
ALTER TABLE `wx_channel_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=85;
--
-- AUTO_INCREMENT for table `wx_course`
--
ALTER TABLE `wx_course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=127;
--
-- AUTO_INCREMENT for table `wx_menu`
--
ALTER TABLE `wx_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=53;
--
-- AUTO_INCREMENT for table `wx_platform`
--
ALTER TABLE `wx_platform`
  MODIFY `id` tinyint(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
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
