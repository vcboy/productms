/*
Navicat MySQL Data Transfer

Source Server         : php7_local
Source Server Version : 50547
Source Host           : localhost:3306
Source Database       : live_db

Target Server Type    : MYSQL
Target Server Version : 50547
File Encoding         : 65001

Date: 2016-09-12 10:06:43
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `live_admin`
-- ----------------------------
DROP TABLE IF EXISTS `live_admin`;
CREATE TABLE `live_admin` (
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of live_admin
-- ----------------------------
INSERT INTO live_admin VALUES ('1', 'admin', '96e79218965eb72c92a549dd5a330112', '超级管理员', '1', null, 'zongadming', '0', '{\"75\":{\"id\":75,\"name\":\"\\u4fee\\u6539\\u5bc6\\u7801\",\"url\":\"admin\\/edit-password\"}}', '', '');

-- ----------------------------
-- Table structure for `live_auth_assignment`
-- ----------------------------
DROP TABLE IF EXISTS `live_auth_assignment`;
CREATE TABLE `live_auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  KEY `user_id` (`user_id`),
  KEY `created_at` (`created_at`),
  KEY `item_name` (`item_name`),
  CONSTRAINT `live_auth_assignment_ibfk_2` FOREIGN KEY (`item_name`) REFERENCES `live_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员授权表';

-- ----------------------------
-- Records of live_auth_assignment
-- ----------------------------
INSERT INTO live_auth_assignment VALUES ('zongadming', '1', '1470623219');

-- ----------------------------
-- Table structure for `live_auth_item`
-- ----------------------------
DROP TABLE IF EXISTS `live_auth_item`;
CREATE TABLE `live_auth_item` (
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
  KEY `created_at` (`created_at`),
  CONSTRAINT `live_auth_item_ibfk_2` FOREIGN KEY (`rule_name`) REFERENCES `live_auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理权权限条目';

-- ----------------------------
-- Records of live_auth_item
-- ----------------------------
INSERT INTO live_auth_item VALUES ('admin_create', '2', '用户添加', null, null, null, null, '35');
INSERT INTO live_auth_item VALUES ('admin_delete', '2', '用户删除', null, null, null, null, '35');
INSERT INTO live_auth_item VALUES ('admin_quickentry', '2', '快捷入口设置', null, null, null, null, '35');
INSERT INTO live_auth_item VALUES ('admin_update', '2', '用户修改', null, null, null, null, '35');
INSERT INTO live_auth_item VALUES ('channel_create', '2', '添加频道', null, null, null, null, '36');
INSERT INTO live_auth_item VALUES ('course_index', '2', '课程管理查看', null, null, null, null, '49');
INSERT INTO live_auth_item VALUES ('itemspreset_index', '2', '转码查看', null, null, null, null, '40');
INSERT INTO live_auth_item VALUES ('itemstype/index', '2', '视频分类查看', null, null, null, null, '39');
INSERT INTO live_auth_item VALUES ('itemsupload_index', '2', '视频上传', null, null, null, null, '43');
INSERT INTO live_auth_item VALUES ('items_index', '2', '视频查看', null, null, null, null, '41');
INSERT INTO live_auth_item VALUES ('menu_create', '2', '菜单添加', null, null, null, null, '32');
INSERT INTO live_auth_item VALUES ('menu_delete', '2', '菜单删除', null, null, null, null, '32');
INSERT INTO live_auth_item VALUES ('menu_taxis', '2', '菜单排序', null, null, null, null, '32');
INSERT INTO live_auth_item VALUES ('menu_update', '2', '菜单修改', null, null, null, null, '32');
INSERT INTO live_auth_item VALUES ('password_update', '2', '修改密码', null, null, null, null, '75');
INSERT INTO live_auth_item VALUES ('permission_create', '2', '权限添加', null, null, null, null, '30');
INSERT INTO live_auth_item VALUES ('permission_delete', '2', '权限删除', null, null, null, null, '30');
INSERT INTO live_auth_item VALUES ('permission_update', '2', '权限修改', null, null, null, null, '30');
INSERT INTO live_auth_item VALUES ('role_create', '2', '角色添加', null, null, null, null, '31');
INSERT INTO live_auth_item VALUES ('role_delete', '2', '角色删除', null, null, null, null, '31');
INSERT INTO live_auth_item VALUES ('role_permission', '2', '角色权限设置', null, null, null, null, '31');
INSERT INTO live_auth_item VALUES ('role_update', '2', '角色修改', null, null, null, null, '31');
INSERT INTO live_auth_item VALUES ('shortcut_update', '2', '设置快捷方式', null, null, null, null, '74');
INSERT INTO live_auth_item VALUES ('zongadming', '1', '总管理员', null, null, null, null, null);

-- ----------------------------
-- Table structure for `live_auth_item_child`
-- ----------------------------
DROP TABLE IF EXISTS `live_auth_item_child`;
CREATE TABLE `live_auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员权限关系表';

-- ----------------------------
-- Records of live_auth_item_child
-- ----------------------------
INSERT INTO live_auth_item_child VALUES ('zongadming', 'admin_create');
INSERT INTO live_auth_item_child VALUES ('zongadming', 'admin_delete');
INSERT INTO live_auth_item_child VALUES ('zongadming', 'admin_quickentry');
INSERT INTO live_auth_item_child VALUES ('zongadming', 'admin_update');
INSERT INTO live_auth_item_child VALUES ('zongadming', 'channel_create');
INSERT INTO live_auth_item_child VALUES ('zongadming', 'course_index');
INSERT INTO live_auth_item_child VALUES ('teacher', 'enroll_score');
INSERT INTO live_auth_item_child VALUES ('zongadming', 'itemspreset_index');
INSERT INTO live_auth_item_child VALUES ('zongadming', 'itemstype/index');
INSERT INTO live_auth_item_child VALUES ('zongadming', 'itemsupload_index');
INSERT INTO live_auth_item_child VALUES ('zongadming', 'items_index');
INSERT INTO live_auth_item_child VALUES ('zongadming', 'menu_create');
INSERT INTO live_auth_item_child VALUES ('zongadming', 'menu_delete');
INSERT INTO live_auth_item_child VALUES ('zongadming', 'menu_taxis');
INSERT INTO live_auth_item_child VALUES ('zongadming', 'menu_update');
INSERT INTO live_auth_item_child VALUES ('teacher', 'notice_create');
INSERT INTO live_auth_item_child VALUES ('teacher', 'notice_delete');
INSERT INTO live_auth_item_child VALUES ('teacher', 'notice_edit');
INSERT INTO live_auth_item_child VALUES ('zongadming', 'permission_create');
INSERT INTO live_auth_item_child VALUES ('zongadming', 'permission_delete');
INSERT INTO live_auth_item_child VALUES ('zongadming', 'permission_update');
INSERT INTO live_auth_item_child VALUES ('zongadming', 'role_create');
INSERT INTO live_auth_item_child VALUES ('zongadming', 'role_delete');
INSERT INTO live_auth_item_child VALUES ('zongadming', 'role_permission');
INSERT INTO live_auth_item_child VALUES ('zongadming', 'role_update');

-- ----------------------------
-- Table structure for `live_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `live_auth_rule`;
CREATE TABLE `live_auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `name` (`name`),
  KEY `created_at` (`created_at`),
  KEY `updated_at` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员权限规则表';

-- ----------------------------
-- Records of live_auth_rule
-- ----------------------------

-- ----------------------------
-- Table structure for `live_channel`
-- ----------------------------
DROP TABLE IF EXISTS `live_channel`;
CREATE TABLE `live_channel` (
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
  `filename` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '录制后文件名',
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of live_channel
-- ----------------------------
INSERT INTO live_channel VALUES ('8bf1e3d5d9ac4ec187010e3fbbd9492e', '频道', '1471423438592', 'rtmp://pee475c07.live.126.net/live/8bf1e3d5d9ac4ec187010e3fbbd9492e?wsSecret=f5f207bf20bcb4655dc805a41ae93cdd&wsTime=1471505590', 'http://vee475c07.live.126.net/live/8bf1e3d5d9ac4ec187010e3fbbd9492e.flv', 'http://pullhlsee475c07.live.126.net/live/8bf1e3d5d9ac4ec187010e3fbbd9492e/playlist.m3u8', 'rtmp://vee475c07.live.126.net/live/8bf1e3d5d9ac4ec187010e3fbbd9492e', '2', '0', '0', '1', '31037', '0', '1', '120', '频道');
INSERT INTO live_channel VALUES ('81aff6eb0b2849ccb16131dac79b01dc', '笔', '1471423326773', 'rtmp://pee475c07.live.126.net/live/81aff6eb0b2849ccb16131dac79b01dc?wsSecret=19ed515ddf9dcf8952b07fee406d17f0&wsTime=1471502953', 'http://vee475c07.live.126.net/live/81aff6eb0b2849ccb16131dac79b01dc.flv', 'http://pullhlsee475c07.live.126.net/live/81aff6eb0b2849ccb16131dac79b01dc/playlist.m3u8', 'rtmp://vee475c07.live.126.net/live/81aff6eb0b2849ccb16131dac79b01dc', '2', '0', '0', '1', '31037', '0', '1', '120', '笔');
INSERT INTO live_channel VALUES ('d4f1615e1d504fc49c270f6b4eb9e513', '添加频道2', '1471416197055', 'rtmp://pee475c07.live.126.net/live/d4f1615e1d504fc49c270f6b4eb9e513?wsSecret=2dfd4507a709fb4d6bf9a7c2b00d05c0&wsTime=1471505133', 'http://vee475c07.live.126.net/live/d4f1615e1d504fc49c270f6b4eb9e513.flv', 'http://pullhlsee475c07.live.126.net/live/d4f1615e1d504fc49c270f6b4eb9e513/playlist.m3u8', 'rtmp://vee475c07.live.126.net/live/d4f1615e1d504fc49c270f6b4eb9e513', '2', '0', '0', '1', '31037', '0', '1', '120', '添加频道');
INSERT INTO live_channel VALUES ('4a7e41400e7641ecacea8c302abbb22e', '在线课堂', '1469429614943', 'rtmp://pee475c07.live.126.net/live/4a7e41400e7641ecacea8c302abbb22e?wsSecret=566d7a8bb2dd92a1c0557f0f3da9adc0&wsTime=1471502953', 'http://vee475c07.live.126.net/live/4a7e41400e7641ecacea8c302abbb22e.flv', 'http://pullhlsee475c07.live.126.net/live/4a7e41400e7641ecacea8c302abbb22e/playlist.m3u8', 'rtmp://vee475c07.live.126.net/live/4a7e41400e7641ecacea8c302abbb22e', '0', '0', '1', '0', '31037', '0', '1', '120', '在线课堂');
INSERT INTO live_channel VALUES ('f3974215168742f2ad91aa331e43b628', '吉博直播', '1469068992627', 'rtmp://pee475c07.live.126.net/live/f3974215168742f2ad91aa331e43b628?wsSecret=618e416cdc418952806ae5cb7d128a7f&wsTime=1471502953', 'http://vee475c07.live.126.net/live/f3974215168742f2ad91aa331e43b628.flv', 'http://pullhlsee475c07.live.126.net/live/f3974215168742f2ad91aa331e43b628/playlist.m3u8', 'rtmp://vee475c07.live.126.net/live/f3974215168742f2ad91aa331e43b628', '0', '0', '1', '0', '31037', '0', '1', '120', '吉博直播');
INSERT INTO live_channel VALUES ('b1d15b8ae44c4f8691ca7ed4ca64192f', '新建频道', '1471509347655', 'rtmp://pee475c07.live.126.net/live/b1d15b8ae44c4f8691ca7ed4ca64192f?wsSecret=4174c5b1d8efb1d8d896e9c87e312833&wsTime=1471593966', 'http://vee475c07.live.126.net/live/b1d15b8ae44c4f8691ca7ed4ca64192f.flv', 'http://pullhlsee475c07.live.126.net/live/b1d15b8ae44c4f8691ca7ed4ca64192f/playlist.m3u8', 'rtmp://vee475c07.live.126.net/live/b1d15b8ae44c4f8691ca7ed4ca64192f', '0', '0', '0', '1', '31037', '1', '1', '5', '新建频道');
INSERT INTO live_channel VALUES ('379fe4cfafbf40e79f3b2374e6eec783', '测试时间', '1471576001410', 'rtmp://pee475c07.live.126.net/live/379fe4cfafbf40e79f3b2374e6eec783?wsSecret=9d1d5fe6d65a0b9e454ea9785bf02387&wsTime=1472191951', 'http://vee475c07.live.126.net/live/379fe4cfafbf40e79f3b2374e6eec783.flv', 'http://pullhlsee475c07.live.126.net/live/379fe4cfafbf40e79f3b2374e6eec783/playlist.m3u8', 'rtmp://vee475c07.live.126.net/live/379fe4cfafbf40e79f3b2374e6eec783', '0', '0', '0', '0', '31037', '1', '1', '5', '测试时间');
INSERT INTO live_channel VALUES ('58fc5aac39de4c40980ad8c84d10feef', '添加频道', '1472194768310', 'rtmp://pee475c07.live.126.net/live/58fc5aac39de4c40980ad8c84d10feef?wsSecret=9e0d2cbe4f5cf65d53ad86a2fe048e9f&wsTime=1472449311', 'http://vee475c07.live.126.net/live/58fc5aac39de4c40980ad8c84d10feef.flv', 'http://pullhlsee475c07.live.126.net/live/58fc5aac39de4c40980ad8c84d10feef/playlist.m3u8', 'rtmp://vee475c07.live.126.net/live/58fc5aac39de4c40980ad8c84d10feef', '0', '0', '0', '1', '31037', '0', '1', '120', '添加频道2');
INSERT INTO live_channel VALUES ('55cc1dba5c454a25a8a8ceff8ba9bd32', 'test', '1473322560436', 'rtmp://pee475c07.live.126.net/live/55cc1dba5c454a25a8a8ceff8ba9bd32?wsSecret=3257ead0222da2023c77ee774b1dd05a&wsTime=1473323809', 'http://vee475c07.live.126.net/live/55cc1dba5c454a25a8a8ceff8ba9bd32.flv', 'http://pullhlsee475c07.live.126.net/live/55cc1dba5c454a25a8a8ceff8ba9bd32/playlist.m3u8', 'rtmp://vee475c07.live.126.net/live/55cc1dba5c454a25a8a8ceff8ba9bd32', '0', '0', '1', '0', '31037', '1', '1', '120', 'test');

-- ----------------------------
-- Table structure for `live_course`
-- ----------------------------
DROP TABLE IF EXISTS `live_course`;
CREATE TABLE `live_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '课程名称',
  `channel_id` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '频道id',
  `img` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '图片路径',
  `price` int(11) DEFAULT NULL COMMENT '价格',
  `teacher_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '主讲',
  `description` text COMMENT '详述',
  `desc` varchar(1000) CHARACTER SET utf8 DEFAULT NULL COMMENT '简述',
  `bm_num` int(11) DEFAULT '0' COMMENT '报名人数',
  `score` float(4,0) DEFAULT NULL COMMENT '评分',
  `status` smallint(4) DEFAULT '0' COMMENT '状态 0 未开始 1 直播中 2 直播完成 ',
  `live_start_time` int(11) DEFAULT NULL COMMENT '直播开始时间',
  `live_end_time` int(11) DEFAULT NULL COMMENT '直播结束时间',
  `create_time` int(11) DEFAULT NULL,
  `is_delete` smallint(4) DEFAULT '0',
  `is_home` smallint(4) DEFAULT '1' COMMENT '是否显示前台',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of live_course
-- ----------------------------
INSERT INTO live_course VALUES ('7', '课程', '379fe4cfafbf40e79f3b2374e6eec783', '/upload_files/course_resource/201608131942-282.jpg', null, '', null, '', '0', null, '0', '0', '0', '1472447982', '0', '1');
INSERT INTO live_course VALUES ('8', '测试2', '379fe4cfafbf40e79f3b2374e6eec783', '', null, '', null, '', '0', null, '0', '1472449999', '1472450000', '1472450018', '0', '1');

-- ----------------------------
-- Table structure for `live_items`
-- ----------------------------
DROP TABLE IF EXISTS `live_items`;
CREATE TABLE `live_items` (
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
  `course_id` int(11) DEFAULT NULL COMMENT '课程id',
  PRIMARY KEY (`vid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of live_items
-- ----------------------------
INSERT INTO live_items VALUES ('99250', '测试时间_20160825-092931_20160825-092940', '50', null, '1472088870664', '8', '10250', '直播录制', null, 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/1_379fe4cfafbf40e79f3b2374e6eec783_1472088571825_1472088580670_117704-00000.flv', 'http://vodw0gzlakx.nosdn.127.net/1_379fe4cfafbf40e79f3b2374e6eec783_1472088571825_1472088580670_117704-00000.flv?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1503724239&download=%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_20160825-092931_20160825-092940.flv&Signature=Z8rgPslhH3QrIahNxMFEvbLBTNAflj9PDsGCtpyj%2BfI%3D', '702646', null, null, null, 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/mp4/iv0M1ugb_99250_hd.mp4', 'http://vodw0gzlakx.nosdn.127.net/mp4%2Fiv0M1ugb_99250_hd.mp4?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1503724239&download=%25E9%25AB%2598%25E6%25B8%2585_%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_20160825-092931_20160825-092940.mp4&Signature=Y3Rz3rfHZRUethll6ai9d61C5OFFa2Xqe09LH0F8z54%3D', '1059359', null, null, null, null, null, null, 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/flv/6KrnuCMe_99250_hd.flv', 'http://vodw0gzlakx.nosdn.127.net/flv%2F6KrnuCMe_99250_hd.flv?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1503724239&download=%25E9%25AB%2598%25E6%25B8%2585_%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_20160825-092931_20160825-092940.flv&Signature=ZGB3Rfz5%2Bh0dtqi3i%2Bxz5lrs8SZoPggB6RutJGg3i0s%3D', '816688', null, null, null, null, null, null, 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/hls/nYXqhXM0_99250_hd.m3u8', 'http://vodw0gzlakx.nosdn.127.net/hls%2FnYXqhXM0_99250_hd.m3u8?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1503724239&download=%25E9%25AB%2598%25E6%25B8%2585_%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_20160825-092931_20160825-092940.hls&Signature=EgUIOJV%2F3RXhd25uerOUhRfGzglmOhJlLH8enlrgFEY%3D', '2327756', null, null, null, '1472088580172', '1472178438219', '0', '1', null);
INSERT INTO live_items VALUES ('98382', '测试时间_20160825-092648_20160825-092804', '40', null, null, '75', '10250', '直播录制', null, 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/1_379fe4cfafbf40e79f3b2374e6eec783_1472088408843_1472088484156_117696-00000.flv', 'http://vodw0gzlakx.nosdn.127.net/1_379fe4cfafbf40e79f3b2374e6eec783_1472088408843_1472088484156_117696-00000.flv?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1503724239&download=%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_20160825-092648_20160825-092804.flv&Signature=veUaFKMYePtQ6OPERLQD%2FrAVV%2BXAE4HE0ScTbkdoQx4%3D', '5681208', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1472088481385', '1472088481385', '0', '1', null);
INSERT INTO live_items VALUES ('95252', '测试时间_20160823-104629_20160823-104743', '40', null, '1472178631971', '74', '10383', '测试分类', null, 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/1_379fe4cfafbf40e79f3b2374e6eec783_1471920389121_1471920463596_113879-00000.flv', 'http://vodw0gzlakx.nosdn.127.net/1_379fe4cfafbf40e79f3b2374e6eec783_1471920389121_1471920463596_113879-00000.flv?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1503724239&download=%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_20160823-104629_20160823-104743.flv&Signature=fplro%2FVFe%2Fkvg0da3OqwKup0fEsa1eyPBOK%2BigHcQRg%3D', '5603366', 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/mp4/ctYjJX1a_95252_sd.mp4', 'http://vodw0gzlakx.nosdn.127.net/mp4%2FctYjJX1a_95252_sd.mp4?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1503724239&download=%25E6%25A0%2587%25E6%25B8%2585_%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_20160823-104629_20160823-104743.mp4&Signature=iicH00F6MsCUy2J%2BvoOqq6bejP%2Btsufwox6nPRmVdGE%3D', '7719789', 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/mp4/yp8NFcFe_95252_hd.mp4', 'http://vodw0gzlakx.nosdn.127.net/mp4%2Fyp8NFcFe_95252_hd.mp4?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1503724239&download=%25E9%25AB%2598%25E6%25B8%2585_%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_20160823-104629_20160823-104743.mp4&Signature=%2BhIqCfI8hgbN8RwnGo4wvrs7RcptEGdFnPXYgLEp6Wc%3D', '10596459', 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/mp4/8i76PsUH_95252_shd.mp4', 'http://vodw0gzlakx.nosdn.127.net/mp4%2F8i76PsUH_95252_shd.mp4?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1503724239&download=%25E8%25B6%2585%25E6%25B8%2585_%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_20160823-104629_20160823-104743.mp4&Signature=urCocnlGQv8EU9ZregiBJz6XMQ9vI%2BJpzLVJ2qXdKvQ%3D', '16254867', '', '', '0', 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/flv/PkLn5VPZ_95252_hd.flv', 'http://vodw0gzlakx.nosdn.127.net/flv%2FPkLn5VPZ_95252_hd.flv?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1503724239&download=%25E9%25AB%2598%25E6%25B8%2585_%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_20160823-104629_20160823-104743.flv&Signature=Lm2GOYUE6OLpmkgmv7cKy%2Bv3A4c895hcNUPHLXBqork%3D', '9268179', 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/flv/iPb1cjA3_95252_shd.flv', 'http://vodw0gzlakx.nosdn.127.net/flv%2FiPb1cjA3_95252_shd.flv?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1503724239&download=%25E8%25B6%2585%25E6%25B8%2585_%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_20160823-104629_20160823-104743.flv&Signature=5%2Bb37wlj9SRGlRfe0ElkueQIt%2F0hvFaPvokcsZFwZAo%3D', '14804626', '', '', '0', 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/hls/6nN7beFW_95252_hd.m3u8', 'http://vodw0gzlakx.nosdn.127.net/hls%2F6nN7beFW_95252_hd.m3u8?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1503724239&download=%25E9%25AB%2598%25E6%25B8%2585_%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_20160823-104629_20160823-104743.hls&Signature=WmaTe6TYOietaZ70o%2FonYbSYVcnFGlaCSN7Lj8icbB8%3D', '21367744', 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/hls/v9yPcrlk_95252_shd.m3u8', 'http://vodw0gzlakx.nosdn.127.net/hls%2Fv9yPcrlk_95252_shd.m3u8?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1503724239&download=%25E8%25B6%2585%25E6%25B8%2585_%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_20160823-104629_20160823-104743.hls&Signature=uxx3JiiV1aHdJ0210yi7ESvJyt5RDV8iFk2D6%2FcIT2c%3D', '26448452', '1471920464736', '1472178631971', '0', '1', null);
INSERT INTO live_items VALUES ('99545', '测试时间_20160826-131705_20160826-131752s', '40', '', '1472190181166', '46', '10250', '直播录制', null, 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/1_379fe4cfafbf40e79f3b2374e6eec783_1472188625972_1472188672386_120600-00000.flv', 'http://vodw0gzlakx.nosdn.127.net/1_379fe4cfafbf40e79f3b2374e6eec783_1472188625972_1472188672386_120600-00000.flv?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1504861134&download=%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_20160826-131705_20160826-131752s.flv&Signature=x%2F0RoX2VE6nTEVhDtgVPLXIrhW6SoXDBz9LqIRxfeEQ%3D', '3506563', 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/mp4/DLol1iFK_99545_sd.mp4', 'http://vodw0gzlakx.nosdn.127.net/mp4%2FDLol1iFK_99545_sd.mp4?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1504861134&download=%25E6%25A0%2587%25E6%25B8%2585_%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_20160826-131705_20160826-131752s.mp4&Signature=SoFHIudqI5EQpblDHHc%2Fgu6Ngw3SbeQhY4zOhewLVks%3D', '4780680', 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/mp4/rdXaugsm_99545_hd.mp4', 'http://vodw0gzlakx.nosdn.127.net/mp4%2FrdXaugsm_99545_hd.mp4?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1504861134&download=%25E9%25AB%2598%25E6%25B8%2585_%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_20160826-131705_20160826-131752s.mp4&Signature=hYEAUTw%2FVtR7lUjv0t5oxug9XHxHAJ9D45jGJmo2e64%3D', '6463922', 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/mp4/WfVmqbfT_99545_shd.mp4', 'http://vodw0gzlakx.nosdn.127.net/mp4%2FWfVmqbfT_99545_shd.mp4?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1504861134&download=%25E8%25B6%2585%25E6%25B8%2585_%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_20160826-131705_20160826-131752s.mp4&Signature=Q4RjvY3UKFSQidQYiX8cj37GuYKHTlkUIdFAaWgjFYc%3D', '9958752', 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/flv/NHRIPFZT_99545_sd.flv', 'http://vodw0gzlakx.nosdn.127.net/flv%2FNHRIPFZT_99545_sd.flv?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1504861134&download=%25E6%25A0%2587%25E6%25B8%2585_%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_20160826-131705_20160826-131752s.flv&Signature=c%2Ff0xLE2FqNiNtzi%2B%2FErA4RBo6hdiHfCZ9etVa2Xeew%3D', '3899783', 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/flv/USTCAHyS_99545_hd.flv', 'http://vodw0gzlakx.nosdn.127.net/flv%2FUSTCAHyS_99545_hd.flv?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1504861134&download=%25E9%25AB%2598%25E6%25B8%2585_%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_20160826-131705_20160826-131752s.flv&Signature=A84CrObXJStsQxlBq2ZazjWFJGhd4fIZZdqaLY0UGU8%3D', '5551211', 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/flv/mKoAgALt_99545_shd.flv', 'http://vodw0gzlakx.nosdn.127.net/flv%2FmKoAgALt_99545_shd.flv?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1504861134&download=%25E8%25B6%2585%25E6%25B8%2585_%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_20160826-131705_20160826-131752s.flv&Signature=H5iBqHyMwI7%2FP7u4xrkcP%2BIbqEtv7i4IvXFTbKUlRa8%3D', '8814062', 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/hls/z5WWPBBZ_99545_sd.m3u8', 'http://vodw0gzlakx.nosdn.127.net/hls%2Fz5WWPBBZ_99545_sd.m3u8?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1504861134&download=%25E6%25A0%2587%25E6%25B8%2585_%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_20160826-131705_20160826-131752s.hls&Signature=7wjVbZ9020LbWExhHzgfTtNMUaFCsjzG5G7z%2FyT%2BHvw%3D', '11961417', 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/hls/Vkqf0WrI_99545_hd.m3u8', 'http://vodw0gzlakx.nosdn.127.net/hls%2FVkqf0WrI_99545_hd.m3u8?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1504861134&download=%25E9%25AB%2598%25E6%25B8%2585_%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_20160826-131705_20160826-131752s.hls&Signature=T0cJH218AEjgLEZrzqSVUM2xck1u4ZtRZgvM5fGz9Ck%3D', '13225717', 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/hls/06UdRLyT_99545_shd.m3u8', 'http://vodw0gzlakx.nosdn.127.net/hls%2F06UdRLyT_99545_shd.m3u8?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1504861134&download=%25E8%25B6%2585%25E6%25B8%2585_%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_20160826-131705_20160826-131752s.hls&Signature=h3EnUaj8aSntu4szoqMUQm%2BUsqMscgwYNbZX2jjes9Q%3D', '16260794', '1472188670520', '1472452507687', '1', '0', '8');
INSERT INTO live_items VALUES ('100642', '测试时间_s20160826-131615_20160826-131632', '40', null, '1472190397485', '16', '10250', '直播录制', null, 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/1_379fe4cfafbf40e79f3b2374e6eec783_1472188575387_1472188592109_120598-00000.flv', 'http://vodw0gzlakx.nosdn.127.net/1_379fe4cfafbf40e79f3b2374e6eec783_1472188575387_1472188592109_120598-00000.flv?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1504861134&download=%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_s20160826-131615_20160826-131632.flv&Signature=PRwl6GwnK3kFW2Fa1XWjioaQYYF5CMkBGUYasN7lT7Q%3D', '1326004', 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/mp4/aN2VFL4w_100642_sd.mp4', 'http://vodw0gzlakx.nosdn.127.net/mp4%2FaN2VFL4w_100642_sd.mp4?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1504861134&download=%25E6%25A0%2587%25E6%25B8%2585_%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_s20160826-131615_20160826-131632.mp4&Signature=pn7ZZFwqu%2FWDkgBEjAdenwI7g2jSSnjMg04wYDbY9S0%3D', '1679942', 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/mp4/nuxzMfk6_100642_hd.mp4', 'http://vodw0gzlakx.nosdn.127.net/mp4%2FnuxzMfk6_100642_hd.mp4?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1504861134&download=%25E9%25AB%2598%25E6%25B8%2585_%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_s20160826-131615_20160826-131632.mp4&Signature=GSggEgePT41VCuKn5D91OW%2FZQ9b8%2F%2Bbqpplu88cpAfA%3D', '2223244', 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/mp4/FDSGGj9u_100642_shd.mp4', 'http://vodw0gzlakx.nosdn.127.net/mp4%2FFDSGGj9u_100642_shd.mp4?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1504861134&download=%25E8%25B6%2585%25E6%25B8%2585_%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_s20160826-131615_20160826-131632.mp4&Signature=VvOu2%2BExgarCSpkTzmbquF7KdXgGvID3jXo8nDa%2B2J4%3D', '3424861', 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/flv/tWXC5IVT_100642_sd.flv', 'http://vodw0gzlakx.nosdn.127.net/flv%2FtWXC5IVT_100642_sd.flv?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1504861134&download=%25E6%25A0%2587%25E6%25B8%2585_%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_s20160826-131615_20160826-131632.flv&Signature=uglorv5dgqOmEPEbSKks6ai%2BO0S8jbhH%2BXPbL3o6FSw%3D', '1310564', 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/flv/KpkBLzht_100642_hd.flv', 'http://vodw0gzlakx.nosdn.127.net/flv%2FKpkBLzht_100642_hd.flv?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1504861134&download=%25E9%25AB%2598%25E6%25B8%2585_%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_s20160826-131615_20160826-131632.flv&Signature=1zgWcnDNeTrMM%2FMc4I0mpjQRpecLEncS0K%2Bp7ivozyk%3D', '1880646', 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/flv/tAXYdPXH_100642_shd.flv', 'http://vodw0gzlakx.nosdn.127.net/flv%2FtAXYdPXH_100642_shd.flv?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1504861134&download=%25E8%25B6%2585%25E6%25B8%2585_%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_s20160826-131615_20160826-131632.flv&Signature=yFW1sGIelzgdrugL3mEZHakCN8C6EiIbnt5vKLLKg9M%3D', '2989614', 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/hls/zPfQ1O4G_100642_sd.m3u8', 'http://vodw0gzlakx.nosdn.127.net/hls%2FzPfQ1O4G_100642_sd.m3u8?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1504861134&download=%25E6%25A0%2587%25E6%25B8%2585_%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_s20160826-131615_20160826-131632.hls&Signature=eakQ8mTBu2rdJaVWF%2BUwWF1mMpZxduSzpctDhhPdrwU%3D', '4234308', 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/hls/rz6Jv8fB_100642_hd.m3u8', 'http://vodw0gzlakx.nosdn.127.net/hls%2Frz6Jv8fB_100642_hd.m3u8?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1504861134&download=%25E9%25AB%2598%25E6%25B8%2585_%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_s20160826-131615_20160826-131632.hls&Signature=QAWMI7oU1NDPzZ7PuE1yIRx4BJ3lz0ZRpDGCobeZDnE%3D', '4629860', 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/hls/SunmXDqy_100642_shd.m3u8', 'http://vodw0gzlakx.nosdn.127.net/hls%2FSunmXDqy_100642_shd.m3u8?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1504861134&download=%25E8%25B6%2585%25E6%25B8%2585_%25E6%25B5%258B%25E8%25AF%2595%25E6%2597%25B6%25E9%2597%25B4_s20160826-131615_20160826-131632.hls&Signature=%2F%2FKAfP5hGiKhfETbdQz0MPaFZ%2BxNaaNeeBG6O%2F9g%2Fvw%3D', '5678714', '1472188591540', '1472190397485', '1', '0', null);
INSERT INTO live_items VALUES ('98992', 'VID_20160823_100218', '40', null, null, '5', '10249', '默认分类', 'http://vodw0gzlakx.nosdn.127.net/8f810927-6924-4c0c-a203-e594a7313524.jpg', 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/25f373ad-b057-4644-b1b9-05910c4625f8.mp4', 'http://vodw0gzlakx.nosdn.127.net/25f373ad-b057-4644-b1b9-05910c4625f8.mp4?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1504861134&download=VID_20160823_100218.mp4&Signature=F8UZ6YdpgdH4mCw3rqWqyCdVLuMtUjSrH91tbahVOOk%3D', '6089103', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1472192218154', '1472192219290', '1', '0', null);
INSERT INTO live_items VALUES ('118786', 'test_20160908-163805_20160908-164014', '30', null, null, '129', '10250', '直播录制', null, 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/1_55cc1dba5c454a25a8a8ceff8ba9bd32_1473323885577_1473324014589_141331-00000.flv', 'http://vodw0gzlakx.nosdn.127.net/1_55cc1dba5c454a25a8a8ceff8ba9bd32_1473323885577_1473324014589_141331-00000.flv?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1504861134&download=test_20160908-163805_20160908-164014.flv&Signature=1BrfX1ybHhrdqytHwQghr%2Fyl1%2BmwYF8k%2F0qrM%2FKFBEs%3D', '7731400', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1473324015724', '1473324131018', '1', '0', null);
INSERT INTO live_items VALUES ('121165', 'test_20160908-163653_20160908-163722', '40', null, null, '29', '10250', '直播录制', null, 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/1_55cc1dba5c454a25a8a8ceff8ba9bd32_1473323813158_1473323842750_141327-00000.flv', 'http://vodw0gzlakx.nosdn.127.net/1_55cc1dba5c454a25a8a8ceff8ba9bd32_1473323813158_1473323842750_141327-00000.flv?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1504861134&download=test_20160908-163653_20160908-163722.flv&Signature=TaC8Ke2zGdGJS0t5cu4UwOBhk7IH8Ux4AJ42kfC1yis%3D', '1754014', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1473323841861', '1473323841861', '1', '0', null);
INSERT INTO live_items VALUES ('119528', 'test_20160908-165614_20160908-165623', '40', null, null, '8', '10250', '直播录制', null, 'http://vodw0gzlakx.vod.126.net/vodw0gzlakx/1_55cc1dba5c454a25a8a8ceff8ba9bd32_1473324974635_1473324983121_141413-00000.flv', 'http://vodw0gzlakx.nosdn.127.net/1_55cc1dba5c454a25a8a8ceff8ba9bd32_1473324974635_1473324983121_141413-00000.flv?NOSAccessKeyId=ab1856bb39044591939d7b94e1b8e5ee&Expires=1504861134&download=test_20160908-165614_20160908-165623.flv&Signature=m7JdeGgqsz6UqUeYhcasmyVjwP8MJHdsodeaUOJNo0A%3D', '515937', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1473324984817', '1473324984817', '1', '0', null);

-- ----------------------------
-- Table structure for `live_items_preset`
-- ----------------------------
DROP TABLE IF EXISTS `live_items_preset`;
CREATE TABLE `live_items_preset` (
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
  `is_exists` smallint(4) DEFAULT '1' COMMENT '外网是否存在（网易）',
  PRIMARY KEY (`presetId`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of live_items_preset
-- ----------------------------
INSERT INTO live_items_preset VALUES ('63643', '默认模板', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO live_items_preset VALUES ('63793', '转码测试', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0');
INSERT INTO live_items_preset VALUES ('66106', '测试转码2', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '1');
INSERT INTO live_items_preset VALUES ('63854', '测试转码', '0', '1', '1', '0', '1', '1', '0', '1', '1', '1', '0', '1');

-- ----------------------------
-- Table structure for `live_items_type`
-- ----------------------------
DROP TABLE IF EXISTS `live_items_type`;
CREATE TABLE `live_items_type` (
  `typeId` int(11) NOT NULL,
  `typeName` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '视频分类的名称',
  `desc` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '视频分类的描述信息',
  `number` int(11) DEFAULT '0' COMMENT '该用户该类别下的视频文件数量',
  `isDel` smallint(4) DEFAULT '1' COMMENT '是否允许被删除（默认分类不允许删除），1：允许，0：不允许',
  `createTime` bigint(20) DEFAULT NULL COMMENT '视频分类的创建时间（单位：毫秒）',
  `is_delete` smallint(4) DEFAULT '0',
  `is_exists` smallint(4) DEFAULT '1' COMMENT '是否存在外网(网易)',
  PRIMARY KEY (`typeId`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of live_items_type
-- ----------------------------
INSERT INTO live_items_type VALUES ('10249', '默认分类', '默认分类', '0', '0', '1471583984106', '0', '1');
INSERT INTO live_items_type VALUES ('10250', '直播录制', '直播录制', '0', '0', '1471583984107', '0', '1');
INSERT INTO live_items_type VALUES ('10383', '测试分类', '', '2', '1', '1471914194594', '0', '1');

-- ----------------------------
-- Table structure for `live_items_watermark`
-- ----------------------------
DROP TABLE IF EXISTS `live_items_watermark`;
CREATE TABLE `live_items_watermark` (
  `watermarkId` int(11) NOT NULL COMMENT '视频水印模板的名称',
  `watermarkName` varchar(255) DEFAULT NULL COMMENT '视频水印的描述信息',
  `description` varchar(255) DEFAULT NULL COMMENT '视频水印的描述信息',
  `coordinate` varchar(255) DEFAULT NULL COMMENT '视频水印左上角的坐标，其值为相对值，比如：',
  `scale` varchar(255) DEFAULT NULL COMMENT '视频水印的长宽，其值为相对值，比如：',
  PRIMARY KEY (`watermarkId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of live_items_watermark
-- ----------------------------

-- ----------------------------
-- Table structure for `live_menu`
-- ----------------------------
DROP TABLE IF EXISTS `live_menu`;
CREATE TABLE `live_menu` (
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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COMMENT='系统管理员菜单权限表\r\n';

-- ----------------------------
-- Records of live_menu
-- ----------------------------
INSERT INTO live_menu VALUES ('29', '系统设置', '0', null, '40', null, '');
INSERT INTO live_menu VALUES ('30', '权限管理', '29', null, null, null, 'permission-form/index');
INSERT INTO live_menu VALUES ('31', '角色管理', '29', null, null, null, 'role-form/index');
INSERT INTO live_menu VALUES ('32', '菜单管理', '29', null, null, null, 'menu/index');
INSERT INTO live_menu VALUES ('33', '用户管理', '29', null, null, null, 'admin/index');
INSERT INTO live_menu VALUES ('34', '设置快捷方式', '29', null, '1', null, 'shortcut/index');
INSERT INTO live_menu VALUES ('35', '修改密码', '29', null, '2', null, 'admin/edit-password');
INSERT INTO live_menu VALUES ('36', '频道管理', '37', null, '41', null, 'channel/index');
INSERT INTO live_menu VALUES ('37', '直播管理', '0', null, '43', null, '');
INSERT INTO live_menu VALUES ('38', '点播管理', '0', null, '42', null, '');
INSERT INTO live_menu VALUES ('39', '分类设置', '38', null, '42', null, 'items-type/index');
INSERT INTO live_menu VALUES ('40', '转码设置', '38', null, '41', null, 'items-preset/index');
INSERT INTO live_menu VALUES ('41', '视频管理', '38', null, null, null, 'items/index');
INSERT INTO live_menu VALUES ('43', '视频上传', '38', null, null, null, 'items-upload/index');
INSERT INTO live_menu VALUES ('49', '课程管理', '37', null, null, null, 'course/index');
