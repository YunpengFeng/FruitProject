/*
Navicat MySQL Data Transfer

Source Server         : feng_profession
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : fruit

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2018-06-02 20:30:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `additions`
-- ----------------------------
DROP TABLE IF EXISTS `additions`;
CREATE TABLE `additions` (
  `add_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '附加产品，刀，叉子等',
  `add__name` varchar(255) NOT NULL,
  `add_price` float NOT NULL,
  PRIMARY KEY (`add_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of additions
-- ----------------------------

-- ----------------------------
-- Table structure for `admins`
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `admin_id` varchar(10) NOT NULL,
  `admin_name` varchar(20) NOT NULL,
  `admin_pass` varchar(20) NOT NULL,
  `admin_role` int(2) NOT NULL DEFAULT '1' COMMENT '0为超级管理员，1为商户',
  `admin_register` int(2) NOT NULL DEFAULT '0' COMMENT '0注册未审核，1注册已审核',
  `admin_list` varchar(300) DEFAULT NULL COMMENT '权限列表，以，隔开 ',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES ('1', '冯云鹏', '1', '0', '1', '11,12,13,14,15,16,17,18,19,20,21,22,23,24');
INSERT INTO `admins` VALUES ('2', '冷天明', '123', '1', '1', '14,15,16,17,18');
INSERT INTO `admins` VALUES ('3', '罗婧', '123', '1', '1', '12,13,14,15');
INSERT INTO `admins` VALUES ('4', '黄达胜', '123', '1', '1', '11,12,13,14,15');

-- ----------------------------
-- Table structure for `cars`
-- ----------------------------
DROP TABLE IF EXISTS `cars`;
CREATE TABLE `cars` (
  `users_id` varchar(20) NOT NULL,
  `fruit__id` int(20) NOT NULL,
  `amount` int(4) NOT NULL,
  PRIMARY KEY (`users_id`,`fruit__id`),
  KEY `fruit__id` (`fruit__id`),
  CONSTRAINT `cars_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `users` (`users_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `cars_ibfk_2` FOREIGN KEY (`fruit__id`) REFERENCES `fruits` (`fruit_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cars
-- ----------------------------
INSERT INTO `cars` VALUES ('1', '10002', '1');
INSERT INTO `cars` VALUES ('1', '10003', '1');
INSERT INTO `cars` VALUES ('1', '10156', '1');
INSERT INTO `cars` VALUES ('1', '10158', '1');
INSERT INTO `cars` VALUES ('1', '10160', '2');
INSERT INTO `cars` VALUES ('1', '10169', '1');
INSERT INTO `cars` VALUES ('1', '10474', '1');
INSERT INTO `cars` VALUES ('1', '10600', '2');

-- ----------------------------
-- Table structure for `collections`
-- ----------------------------
DROP TABLE IF EXISTS `collections`;
CREATE TABLE `collections` (
  `users_id` varchar(20) NOT NULL,
  `fruit_id` int(20) NOT NULL,
  `c_time` varchar(20) NOT NULL,
  PRIMARY KEY (`users_id`,`fruit_id`),
  KEY `fruit_id` (`fruit_id`),
  CONSTRAINT `collections_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `users` (`users_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `collections_ibfk_2` FOREIGN KEY (`fruit_id`) REFERENCES `fruits` (`fruit_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collections
-- ----------------------------
INSERT INTO `collections` VALUES ('1', '10028', '2018-01-14 18:20:13');
INSERT INTO `collections` VALUES ('1', '10029', '2018-01-14 18:20:14');
INSERT INTO `collections` VALUES ('1', '10045', '2018-05-01 11:49:19');
INSERT INTO `collections` VALUES ('1', '10046', '2018-05-01 11:49:20');
INSERT INTO `collections` VALUES ('1', '10047', '2018-05-01 11:49:21');
INSERT INTO `collections` VALUES ('1', '10048', '2018-04-24 21:52:42');
INSERT INTO `collections` VALUES ('1', '10049', '2018-05-01 11:49:23');
INSERT INTO `collections` VALUES ('1', '10053', '2018-05-01 11:49:24');
INSERT INTO `collections` VALUES ('1', '10054', '2018-04-24 21:52:55');

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `item_id` int(20) NOT NULL,
  `users_id` varchar(20) NOT NULL,
  `content` varchar(200) DEFAULT NULL COMMENT '内容',
  `c_date` varchar(20) NOT NULL COMMENT '评论时间',
  `c_rank` int(2) DEFAULT '5' COMMENT '评论等级',
  `c_states` int(2) NOT NULL DEFAULT '0' COMMENT '0 :未审核；1已审核',
  `c_images` varchar(30) DEFAULT NULL COMMENT '评论图片名使用item_id+userid拼接命名',
  `c_imgcounts` int(2) DEFAULT '0' COMMENT '评论图片数量',
  `p_states` int(2) NOT NULL DEFAULT '0' COMMENT '0为审核未通过，1 为通过',
  PRIMARY KEY (`item_id`,`users_id`),
  KEY `users_id` (`users_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`users_id`) REFERENCES `users` (`users_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('29', '1', '1111111111111111111111', '2018-03-12 22:11:30', '5', '0', '29', '1', '0');
INSERT INTO `comment` VALUES ('30', '1', 'yyyyyyyyyyyyyyyyyyyyyy', '2018-03-12 22:06:54', '6', '0', '30', '1', '0');
INSERT INTO `comment` VALUES ('31', '1', 'asfghkj', '2018-03-12 22:04:40', '5', '0', '31', '1', '0');
INSERT INTO `comment` VALUES ('32', '1', '33333333333333333', '2018-03-12 22:02:51', '5', '0', '32', '1', '0');
INSERT INTO `comment` VALUES ('33', '1', '111111111111111111', '2018-03-12 22:01:15', '5', '0', '33', '1', '0');
INSERT INTO `comment` VALUES ('34', '1', 'ppppppppppppppp', '2018-03-12 21:56:21', '5', '0', '34', '1', '0');
INSERT INTO `comment` VALUES ('35', '1', '臭死了，不能吃啊 !', '2017-12-25 21:23:07', '5', '1', null, '0', '1');
INSERT INTO `comment` VALUES ('36', '1', 'test菠萝蜜', '2017-12-30 13:27:20', '6', '1', '36', '5', '1');
INSERT INTO `comment` VALUES ('37', '1', '12222222222222222222222222', '2018-03-12 21:50:05', '5', '0', '37', '1', '0');
INSERT INTO `comment` VALUES ('38', '1', '9999999999999999', '2018-03-12 21:54:02', '6', '0', '38', '1', '0');
INSERT INTO `comment` VALUES ('39', '1', '挺大的一个桃子的！', '2017-12-24 19:23:40', '6', '1', '39', '5', '1');
INSERT INTO `comment` VALUES ('40', '1', 'test', '2017-12-26 15:22:07', '5', '1', '40', '4', '1');
INSERT INTO `comment` VALUES ('41', '1', '很红，很新鲜的，大家快买啊 ', '2017-12-25 15:37:34', '5', '1', '41', '3', '1');
INSERT INTO `comment` VALUES ('42', '1', '臭死了，百香果很臭，看起来像屎一样！', '2017-12-24 15:34:07', '3', '1', null, '0', '0');
INSERT INTO `comment` VALUES ('43', '1', '好黑 啊，不好吃', '2017-12-25 15:14:58', '2', '1', null, '0', '1');
INSERT INTO `comment` VALUES ('44', '1', '奇怪的水果来自台湾的，中国统一，祖国万岁。', '2017-12-24 20:01:42', '6', '1', '44', '3', '1');
INSERT INTO `comment` VALUES ('45', '1', '新鲜大批吧', '2017-12-24 17:53:19', '6', '1', null, '0', '1');
INSERT INTO `comment` VALUES ('46', '1', '酸死人了，大家不要买啊 真的不行！', '2017-12-24 15:33:10', '2', '1', null, '0', '1');
INSERT INTO `comment` VALUES ('47', '1', '葡萄很大的一颗，很好吃，又红又大很诱人的，大家都快来买吧！', '2017-12-24 15:32:44', '6', '1', null, '0', '1');
INSERT INTO `comment` VALUES ('48', '1', '水果很奇怪，第一次吃，不是很好吃啊！', '2017-12-24 15:30:09', '5', '1', '48', '3', '1');
INSERT INTO `comment` VALUES ('49', '1', '樱桃很漂亮，很好吃，心情倍好！', '2017-12-24 15:29:49', '6', '1', null, '0', '1');
INSERT INTO `comment` VALUES ('50', '1', '烂菠萝，妈卖批的，卖家发的货很慢，真心差评。', '2017-12-24 15:30:54', '1', '1', null, '0', '1');
INSERT INTO `comment` VALUES ('51', '1', '\n又大又甜的枇杷，卖家发货也很快，感谢卖家。', '2017-12-24 15:30:22', '6', '1', null, '0', '1');
INSERT INTO `comment` VALUES ('52', '1', 'test', '2017-12-26 15:25:12', '1', '1', '52', '4', '1');
INSERT INTO `comment` VALUES ('53', '1', 'errrrrrrrrrr', '2018-03-12 21:33:30', '5', '0', '53', '1', '0');
INSERT INTO `comment` VALUES ('54', '1', 'test柠檬好酸 啊 ', '2017-12-30 12:48:31', '5', '1', '54', '4', '1');
INSERT INTO `comment` VALUES ('55', '1', 'test', '2017-12-26 20:07:21', '3', '1', '55', '1', '0');
INSERT INTO `comment` VALUES ('56', '1', '奇怪了啊 ', '2017-12-30 11:30:55', '6', '1', '56', '2', '1');
INSERT INTO `comment` VALUES ('57', '1', 'test你梦', '2017-12-30 13:34:47', '5', '1', '57', '3', '1');
INSERT INTO `comment` VALUES ('58', '1', 'fengli', '2018-03-12 21:35:51', '6', '1', '58', '4', '1');
INSERT INTO `comment` VALUES ('59', '1', 'test桃子好大 啊 \r\n', '2017-12-30 13:43:54', '6', '1', '59', '5', '1');
INSERT INTO `comment` VALUES ('60', '1', 'test葡萄', '2017-12-30 15:30:29', '6', '1', '60', '1', '1');
INSERT INTO `comment` VALUES ('61', '1', '123456789', '2017-12-30 15:33:19', '6', '1', '61', '1', '1');
INSERT INTO `comment` VALUES ('62', '1', '1222222222222222', '2018-03-12 21:31:21', '6', '1', '62', '1', '1');
INSERT INTO `comment` VALUES ('63', '1', '肉肉肉肉肉v', '2018-03-12 21:09:59', '2', '1', '63', '1', '0');
INSERT INTO `comment` VALUES ('64', '1', 'banana is  yellow!', '2018-03-12 21:29:40', '6', '0', '64', '1', '0');
INSERT INTO `comment` VALUES ('65', '1', '22222222222222222222222222222', '2018-03-12 21:28:29', '6', '0', '65', '1', '0');
INSERT INTO `comment` VALUES ('70', '1', '葡萄好看', '2018-03-12 21:09:50', '6', '1', '70', '3', '1');
INSERT INTO `comment` VALUES ('71', '1', 'banana to semll', '2018-02-01 04:29:49', '6', '1', '71', '4', '1');
INSERT INTO `comment` VALUES ('72', '1', '歧义的蔬果', '2018-03-12 18:50:28', '6', '1', '72', '4', '1');
INSERT INTO `comment` VALUES ('73', '1', '666666666666666666666666666666666', '2018-02-01 04:08:37', '5', '1', '73', '3', '1');
INSERT INTO `comment` VALUES ('74', '1', '11111111111111111111', '2018-02-01 03:59:46', '6', '1', '74', '1', '1');
INSERT INTO `comment` VALUES ('75', '1', 'pppppppppppppppppppppppppppppppppppp', '2018-02-01 04:24:04', '5', '1', '75', '3', '1');
INSERT INTO `comment` VALUES ('76', '1', 'kkkkkkkkkkkkkkkkkkkkkk', '2018-02-01 04:23:08', '5', '1', '76', '3', '1');
INSERT INTO `comment` VALUES ('77', '1', '看起老很好吃的样子啊 test', '2018-02-01 04:11:57', '6', '1', '77', '3', '1');
INSERT INTO `comment` VALUES ('78', '1', '测试，什么鬼的柚子！', '2018-02-01 03:26:12', '5', '1', '78', '2', '1');
INSERT INTO `comment` VALUES ('79', '1', '测试车厘子', '2018-02-01 03:54:52', '3', '1', '79', '2', '1');
INSERT INTO `comment` VALUES ('80', '1', 'test,kexin可行的！！！！！', '2018-02-01 03:53:07', '5', '1', '80', '2', '1');
INSERT INTO `comment` VALUES ('83', '5237353', '所得到的多多多多多多多多多多多多多多多多多多多是对方是大V', '2018-05-30 22:58:26', '6', '1', '83', '4', '1');
INSERT INTO `comment` VALUES ('84', '5237353', 'TAI heJin阿德阿萨***的 我熬***！', '2018-05-30 22:19:53', '6', '1', '84', '4', '1');
INSERT INTO `comment` VALUES ('93', '1', '1111111111111', '2018-03-12 21:11:58', '6', '1', '93', '1', '0');
INSERT INTO `comment` VALUES ('94', '1', '这种葡萄真是很甜的哦，下次在来买。', '2018-04-30 17:06:50', '5', '1', '94', '3', '1');
INSERT INTO `comment` VALUES ('95', '1', 'asdcsvsdfvfsdv', '2018-04-30 17:46:36', '5', '1', '95', '1', '1');
INSERT INTO `comment` VALUES ('96', '1', '44444444444', '2018-03-12 22:18:14', '6', '1', '96', '3', '1');
INSERT INTO `comment` VALUES ('97', '1', '44444444444455555555555555', '2018-03-12 22:20:29', '6', '1', '97', '1', '1');
INSERT INTO `comment` VALUES ('98', '1', '好看', '2018-04-25 16:10:43', '6', '1', '98', '2', '1');
INSERT INTO `comment` VALUES ('99', '1', '橙子好吃啊 ！', '2018-04-08 15:16:29', '6', '1', '99', '1', '1');
INSERT INTO `comment` VALUES ('100', '1', '很大一个的石榴很漂亮。', '2018-04-30 17:18:05', '6', '1', '100', '3', '0');
INSERT INTO `comment` VALUES ('101', '1', '浏览啊    ？？？？？？？？', '2018-05-12 16:25:45', '5', '1', '101', '2', '1');
INSERT INTO `comment` VALUES ('102', '1', 't45yt3byt4byer', '2018-05-12 17:49:29', '5', '1', '102', '2', '1');
INSERT INTO `comment` VALUES ('104', '1', '看起来味道很差啊  ！不好吃', '2018-05-12 16:24:22', '1', '1', '104', '1', '1');
INSERT INTO `comment` VALUES ('105', '1', '11111111111111111111111111', '2018-05-12 16:32:07', '6', '0', '105', '1', '0');
INSERT INTO `comment` VALUES ('106', '1', 'QEF ', '2018-05-12 16:35:00', '5', '0', '106', '1', '0');
INSERT INTO `comment` VALUES ('107', '1', '1212111111111111111111111111111111111111111111111111111111111111111111111111', '2018-05-12 16:49:22', '5', '1', '107', '1', '1');
INSERT INTO `comment` VALUES ('108', '1', '垃圾星级麻痹评价星级评价垃圾星级评价\r\n', '2018-05-12 18:51:39', '5', '1', '108', '0', '1');
INSERT INTO `comment` VALUES ('109', '1', '22222222222222222222222222222', '2018-05-12 16:39:58', '6', '0', '109', '1', '0');
INSERT INTO `comment` VALUES ('111', '1', '垃圾星级麻痹评价星级评价垃圾星级评价\r\n112222222222222222222222222222222', '2018-05-12 18:52:01', '5', '1', '111', '0', '1');
INSERT INTO `comment` VALUES ('112', '1', '垃圾星级麻痹评价星级评价垃圾星级评价\r\n112222222222222222222222222222222', '2018-05-12 18:52:04', '5', '1', '112', '0', '1');
INSERT INTO `comment` VALUES ('113', '1', '垃圾星级麻痹评价星级评价垃圾星级评价\r\n112222222222222222222222222222222', '2018-05-12 18:53:03', '5', '1', '113', '0', '1');
INSERT INTO `comment` VALUES ('114', '1', '评论内容（100字内）麻痹的评论内容（100字内）****', '2018-05-12 19:03:37', '5', '1', '114', '0', '1');
INSERT INTO `comment` VALUES ('115', '1', '垃圾星级100麻痹评价星级100评价垃圾100星级评价\r\n', '2018-05-12 19:09:04', '5', '1', '115', '0', '0');
INSERT INTO `comment` VALUES ('116', '1', '****星级100****评价星级100评****价****100星级评价++****', '2018-05-12 19:54:39', '5', '1', '116', '0', '1');
INSERT INTO `comment` VALUES ('117', '1', '****星级麻痹评价星级评价****星级评价\r\n', '2018-05-12 19:51:25', '6', '1', '117', '0', '1');
INSERT INTO `comment` VALUES ('118', '1', '自动向 Google 发送某些系********统信息和网页内容，以****帮助检****测危****险应****用和网站', '2018-05-12 19:57:25', '5', '1', '118', '0', '1');
INSERT INTO `comment` VALUES ('119', '1', '烂菠萝，妈卖批垃圾的，卖家发的。。。操蛋货很慢，真心差评。', '2018-05-16 10:12:31', '6', '1', '119', '3', '1');
INSERT INTO `comment` VALUES ('120', '1', 'http://曹丹loca废物lhost:8080/F***ruitProject/***comImage***s/119_(3).png', '2018-05-16 10:17:48', '5', '1', '120', '6', '1');
INSERT INTO `comment` VALUES ('121', '1', 'http://localhost:***80废物80/FruitProject/comImages/119_(3).p***啊 啊', '2018-05-16 10:16:36', '5', '1', '121', '3', '1');
INSERT INTO `comment` VALUES ('122', '1', '菠萝及水果', '2018-05-16 10:10:29', '6', '1', '122', '2', '1');
INSERT INTO `comment` VALUES ('123', '1', '好吃 麻痹的 啊 卧槽啊 进口垃圾红提', '2018-05-18 10:53:13', '6', '1', '123', '2', '1');
INSERT INTO `comment` VALUES ('124', '1', '对方水电费否发送好吃 ***的 啊 ***啊 进口湖痹的 啊 ***啊南冰痹的 啊 ***啊糖橙', '2018-05-18 10:54:55', '6', '1', '124', '3', '1');
INSERT INTO `comment` VALUES ('129', '1', '好吃***不腻 ，猕猴桃', '2018-05-18 13:12:15', '6', '1', '129', '3', '1');
INSERT INTO `comment` VALUES ('130', '1', '', '2018-05-18 16:07:47', '5', '1', '130', '4', '1');
INSERT INTO `comment` VALUES ('131', '1', 'bfs b', '2018-05-21 10:49:36', '5', '1', '131', '1', '1');
INSERT INTO `comment` VALUES ('132', '1', 'WEFWERG', '2018-05-21 10:50:07', '5', '1', '132', '2', '1');
INSERT INTO `comment` VALUES ('162', '1', '好吃 啊 ，怎么这么丑啊  ***玩意，卖相也不好看啊 ，***的，下次不买了。', '2018-05-29 18:24:29', '5', '1', '162', '3', '1');
INSERT INTO `comment` VALUES ('170', '5237353', '******* 萨哈苏', '2018-05-31 09:09:29', '5', '1', '170', '3', '1');
INSERT INTO `comment` VALUES ('172', '5237353', '闪电发货***', '2018-05-31 09:09:48', '5', '1', '172', '2', '1');

-- ----------------------------
-- Table structure for `conversation`
-- ----------------------------
DROP TABLE IF EXISTS `conversation`;
CREATE TABLE `conversation` (
  `id` bigint(30) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sendid` varchar(10) NOT NULL DEFAULT '' COMMENT '发送者id',
  `receiveid` varchar(20) DEFAULT NULL COMMENT '接受者id',
  `sendtime` varchar(30) NOT NULL DEFAULT '' COMMENT '发送时间',
  `fruit_id` varchar(10) NOT NULL COMMENT '商品id',
  `content` varchar(100) NOT NULL COMMENT '发送内容',
  `isread` int(2) NOT NULL DEFAULT '0' COMMENT '是否阅读，读取状态 1 为已读，0为未读',
  `picture` varchar(20) DEFAULT NULL COMMENT '图片名字',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=388 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of conversation
-- ----------------------------
INSERT INTO `conversation` VALUES ('301', '1', null, '2018-05-05 21:40:20', '10052', '曹丹', '1', null);
INSERT INTO `conversation` VALUES ('302', '1', null, '2018-05-05 21:41:21', '10046', '啊飒飒的', '1', null);
INSERT INTO `conversation` VALUES ('303', '1', null, '2018-05-05 21:42:18', '10046', '驱蚊器群无', '1', null);
INSERT INTO `conversation` VALUES ('304', '', '1', '2018-05-05 21:42:33', '10046', 'S成都市', '1', null);
INSERT INTO `conversation` VALUES ('305', '1', null, '2018-05-05 21:43:29', '10046', '1212', '1', null);
INSERT INTO `conversation` VALUES ('306', '1', null, '2018-05-05 21:46:52', '10002', '3223', '1', null);
INSERT INTO `conversation` VALUES ('307', '1', null, '2018-05-16 09:12:17', '11686', '奇怪的额水果哦', '1', null);
INSERT INTO `conversation` VALUES ('308', '', '1', '2018-05-16 09:12:38', '11686', '好吗', '1', null);
INSERT INTO `conversation` VALUES ('309', '1', null, '2018-05-16 09:12:45', '11686', '\n还吃的额', '1', null);
INSERT INTO `conversation` VALUES ('310', '', '1', '2018-05-16 09:12:50', '11686', '\n吃你妈暴跌', '1', null);
INSERT INTO `conversation` VALUES ('311', '1', null, '2018-05-16 09:13:00', '11686', '\n你竟然骂人啊', '1', null);
INSERT INTO `conversation` VALUES ('312', '', '1', '2018-05-16 09:13:31', '11686', '\n卧槽，骂你你这垃圾玩意', '1', null);
INSERT INTO `conversation` VALUES ('313', '1', null, '2018-05-16 09:13:35', '11686', '\n傻逼', '1', null);
INSERT INTO `conversation` VALUES ('314', '', '1', '2018-05-16 09:13:44', '11686', '\n我靠', '1', null);
INSERT INTO `conversation` VALUES ('315', '1', null, '2018-05-16 09:13:50', '11686', '\nmabi', '1', null);
INSERT INTO `conversation` VALUES ('316', '1', null, '2018-05-16 09:14:12', '10057', '害了', '1', null);
INSERT INTO `conversation` VALUES ('317', '1', null, '2018-05-16 09:14:35', '10057', '\n还', '1', null);
INSERT INTO `conversation` VALUES ('318', '1', null, '2018-05-16 17:42:14', '11683', '1212e332', '1', null);
INSERT INTO `conversation` VALUES ('319', '', '1', '2018-05-16 17:42:52', '11683', 'sdafc ', '1', null);
INSERT INTO `conversation` VALUES ('320', '', '1', '2018-05-16 17:43:00', '11683', '243r324234 ', '1', null);
INSERT INTO `conversation` VALUES ('321', '1', null, '2018-05-16 17:43:03', '11683', 'asd ', '1', null);
INSERT INTO `conversation` VALUES ('322', '', '1', '2018-05-16 17:43:06', '11683', 'dfew ', '1', null);
INSERT INTO `conversation` VALUES ('323', '1', null, '2018-05-23 14:45:17', '10001', '我是老表', '1', null);
INSERT INTO `conversation` VALUES ('324', '1', null, '2018-05-23 14:45:27', '10001', '的父亲而污染费 \n', '1', null);
INSERT INTO `conversation` VALUES ('325', '', '1', '2018-05-23 14:45:39', '10001', '往复VR发我去而非', '1', null);
INSERT INTO `conversation` VALUES ('326', '', '1', '2018-05-23 14:45:45', '10001', '我去而非', '1', null);
INSERT INTO `conversation` VALUES ('327', '1', null, '2018-05-23 14:45:50', '10001', '\n我是', '1', null);
INSERT INTO `conversation` VALUES ('328', '1', null, '2018-05-24 09:20:11', '10001', '好不好吃', '1', null);
INSERT INTO `conversation` VALUES ('329', '1', null, '2018-05-24 09:20:35', '10001', '甜不甜', '1', null);
INSERT INTO `conversation` VALUES ('330', '1', null, '2018-05-24 09:20:53', '10001', '？？？？？？？？？\n', '1', null);
INSERT INTO `conversation` VALUES ('331', '1', null, '2018-05-24 09:24:23', '10001', '\nk.j', '1', null);
INSERT INTO `conversation` VALUES ('332', '1', null, '2018-05-24 09:25:42', '10001', '郭敬明', '1', null);
INSERT INTO `conversation` VALUES ('333', '1', null, '2018-05-24 16:09:24', '10006', '香啊  ', '1', null);
INSERT INTO `conversation` VALUES ('334', '1', null, '2018-05-24 16:09:33', '10006', '撒阿萨是\n', '1', null);
INSERT INTO `conversation` VALUES ('335', '1', null, '2018-05-24 16:09:38', '10006', '阿萨斯', '1', null);
INSERT INTO `conversation` VALUES ('336', '1', null, '2018-05-24 16:09:45', '10006', '阿双方单位 ', '1', null);
INSERT INTO `conversation` VALUES ('337', '1', null, '2018-05-24 16:15:19', '10007', '为热风枪违法 ', '1', null);
INSERT INTO `conversation` VALUES ('338', '1', null, '2018-05-24 16:22:49', '10007', 'ADV', '1', null);
INSERT INTO `conversation` VALUES ('339', '1', null, '2018-05-24 16:22:59', '10007', '违法的违反', '1', null);
INSERT INTO `conversation` VALUES ('340', '1', null, '2018-05-24 16:23:22', '10001', '全微分 ', '1', null);
INSERT INTO `conversation` VALUES ('341', '1', null, '2018-05-24 16:23:29', '10001', '请问 ', '1', null);
INSERT INTO `conversation` VALUES ('342', '1', null, '2018-05-24 16:23:44', '10001', '请问', '1', null);
INSERT INTO `conversation` VALUES ('343', '1', null, '2018-05-24 16:23:59', '10160', 'dw 强无敌', '1', null);
INSERT INTO `conversation` VALUES ('344', '', '1', '2018-05-24 16:50:30', '10160', 'asd ', '1', null);
INSERT INTO `conversation` VALUES ('345', '1', null, '2018-05-30 19:36:38', '10474', '你好，你好挖到 ', '1', null);
INSERT INTO `conversation` VALUES ('346', '1', null, '2018-05-30 19:36:45', '10474', '\n当然会', '1', null);
INSERT INTO `conversation` VALUES ('347', '1', null, '2018-05-30 19:36:50', '10474', '玩儿\n', '1', null);
INSERT INTO `conversation` VALUES ('348', '1', null, '2018-05-30 19:37:43', '10000', '违反 ', '1', null);
INSERT INTO `conversation` VALUES ('349', '1', null, '2018-05-30 21:34:54', '10000', '去无法定位两节课快乐 ', '1', null);
INSERT INTO `conversation` VALUES ('350', '1', null, '2018-05-30 21:41:34', '10000', 'qedc  \n', '1', null);
INSERT INTO `conversation` VALUES ('351', '1', null, '2018-05-30 21:49:57', '11687', '1212212121', '1', null);
INSERT INTO `conversation` VALUES ('352', '1', null, '2018-05-30 21:54:09', '11687', '我是shabi ', '1', null);
INSERT INTO `conversation` VALUES ('353', '1', null, '2018-05-30 21:54:35', '11687', '\n按时', '1', null);
INSERT INTO `conversation` VALUES ('354', '1', null, '2018-05-30 21:57:17', '10002', '聺', '1', null);
INSERT INTO `conversation` VALUES ('355', '1', null, '2018-05-30 21:57:32', '10002', '手动 ', '1', null);
INSERT INTO `conversation` VALUES ('356', '1', null, '2018-05-30 21:59:37', '10002', '我失败', '1', null);
INSERT INTO `conversation` VALUES ('357', '', '1', '2018-05-30 21:59:44', '10002', 'hai', '1', null);
INSERT INTO `conversation` VALUES ('358', '1', null, '2018-05-30 21:59:53', '10002', '\n会wiwi', '1', null);
INSERT INTO `conversation` VALUES ('359', '', '1', '2018-05-30 21:59:57', '10002', '\n谁说的 ', '1', null);
INSERT INTO `conversation` VALUES ('360', '1', null, '2018-05-30 22:00:02', '10002', '\n我是你妈', '1', null);
INSERT INTO `conversation` VALUES ('361', '', '1', '2018-05-30 22:00:09', '10002', '你麻痹的', '1', null);
INSERT INTO `conversation` VALUES ('362', '1', null, '2018-05-30 22:00:16', '10002', '\n卧槽但啊 ', '1', null);
INSERT INTO `conversation` VALUES ('363', '', '1', '2018-05-30 22:00:24', '10002', '\n喔喔', '1', null);
INSERT INTO `conversation` VALUES ('364', '1', null, '2018-05-30 22:00:30', '10002', '\n我是你啊 ', '1', null);
INSERT INTO `conversation` VALUES ('365', '1', null, '2018-05-30 22:00:35', '10002', '我已啊 ', '1', null);
INSERT INTO `conversation` VALUES ('366', '', '1', '2018-05-30 22:00:43', '10002', '完全打破都没你聪明', '1', null);
INSERT INTO `conversation` VALUES ('367', '1', null, '2018-05-30 22:00:53', '10002', '\n1111111111111', '1', null);
INSERT INTO `conversation` VALUES ('368', '', '1', '2018-05-30 22:01:00', '10002', '\n \n  11111\n ', '1', null);
INSERT INTO `conversation` VALUES ('369', '1', null, '2018-05-30 22:01:07', '10002', '\n121222222222222222222', '1', null);
INSERT INTO `conversation` VALUES ('370', '1', null, '2018-05-30 22:01:28', '10002', '\n111111111111', '1', null);
INSERT INTO `conversation` VALUES ('371', '1', null, '2018-05-30 22:01:31', '11027', '22222222222', '1', null);
INSERT INTO `conversation` VALUES ('372', '1', null, '2018-05-30 22:01:40', '11027', '12222222', '1', null);
INSERT INTO `conversation` VALUES ('373', '1', null, '2018-05-30 22:01:47', '10002', '11111111111111', '1', null);
INSERT INTO `conversation` VALUES ('374', '', '1', '2018-05-30 22:02:08', '10002', '122222222', '1', null);
INSERT INTO `conversation` VALUES ('375', '1', null, '2018-05-30 22:02:17', '10002', '1111111111111', '1', null);
INSERT INTO `conversation` VALUES ('376', '1', null, '2018-05-30 22:02:22', '11027', '2222222222222', '1', null);
INSERT INTO `conversation` VALUES ('377', '', '1', '2018-05-30 22:02:31', '11027', '333333333333333333333333', '1', null);
INSERT INTO `conversation` VALUES ('378', '1', null, '2018-05-30 22:02:35', '11027', '2222222222', '1', null);
INSERT INTO `conversation` VALUES ('379', '1', null, '2018-05-30 22:02:38', '10002', '2222222222', '1', null);
INSERT INTO `conversation` VALUES ('380', '5237353', null, '2018-05-30 22:07:07', '10160', 'WDFS', '1', null);
INSERT INTO `conversation` VALUES ('381', '', '5237353', '2018-05-30 22:07:29', '10160', '122222222', '1', null);
INSERT INTO `conversation` VALUES ('382', '5237353', null, '2018-05-30 22:07:33', '10160', '12122121', '1', null);
INSERT INTO `conversation` VALUES ('383', '', '5237353', '2018-05-30 22:07:36', '10160', '121212', '1', null);
INSERT INTO `conversation` VALUES ('384', '5237353', null, '2018-05-30 22:20:35', '10017', '安徽省发的哈恐惧', '1', null);
INSERT INTO `conversation` VALUES ('385', '5237353', null, '2018-05-31 09:05:06', '11687', '好吃吗‘ ’', '1', null);
INSERT INTO `conversation` VALUES ('386', '', '5237353', '2018-05-31 09:05:24', '11687', '好吃', '1', null);
INSERT INTO `conversation` VALUES ('387', '5237353', null, '2018-05-31 09:05:30', '11687', '\n还比', '1', null);

-- ----------------------------
-- Table structure for `diction`
-- ----------------------------
DROP TABLE IF EXISTS `diction`;
CREATE TABLE `diction` (
  `config` int(20) NOT NULL COMMENT '配置编号',
  `flag` int(1) NOT NULL COMMENT '序号',
  `blank` varchar(200) DEFAULT NULL COMMENT '备注管理员/商家配置是否自动发布 1 为自动， 2 为手动',
  PRIMARY KEY (`config`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of diction
-- ----------------------------
INSERT INTO `diction` VALUES ('1', '1', '管理员/商家配置是否自动发布');
INSERT INTO `diction` VALUES ('2', '1', '销售最高图片');
INSERT INTO `diction` VALUES ('3', '1', '评价最高图片');
INSERT INTO `diction` VALUES ('4', '1', '水果知识图片');

-- ----------------------------
-- Table structure for `dirtypool`
-- ----------------------------
DROP TABLE IF EXISTS `dirtypool`;
CREATE TABLE `dirtypool` (
  `id` int(5) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `content` varchar(40) NOT NULL COMMENT '脏词内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dirtypool
-- ----------------------------
INSERT INTO `dirtypool` VALUES ('2', '妈的');
INSERT INTO `dirtypool` VALUES ('3', 'fack');
INSERT INTO `dirtypool` VALUES ('4', '卧槽');
INSERT INTO `dirtypool` VALUES ('15', '操');
INSERT INTO `dirtypool` VALUES ('22', '傻逼');
INSERT INTO `dirtypool` VALUES ('24', '垃圾');
INSERT INTO `dirtypool` VALUES ('25', '智障');
INSERT INTO `dirtypool` VALUES ('26', '废物');

-- ----------------------------
-- Table structure for `fruitimfo`
-- ----------------------------
DROP TABLE IF EXISTS `fruitimfo`;
CREATE TABLE `fruitimfo` (
  `id` int(3) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `num` varchar(10) DEFAULT NULL COMMENT '对应的水果编号',
  `type` varchar(10) DEFAULT NULL COMMENT '水果类型名',
  `information` varchar(15000) DEFAULT NULL COMMENT '水果知识内容',
  `isshow` varchar(1) NOT NULL DEFAULT '1' COMMENT '是否前台显示 1 显示，0 不显示',
  `season` varchar(10) DEFAULT NULL COMMENT '季节水果',
  `addman` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fruitimfo
-- ----------------------------
INSERT INTO `fruitimfo` VALUES ('11', '29', '苹果', '<ul class=\"lemmaWgt-lemmaTitle lemmaWgt-lemmaTitle- list-paddingleft-2\" style=\"margin: 0px 0px 10px; padding: 0px; width: 700px; font-family: arial, tahoma, &quot;Microsoft Yahei&quot;, 宋体, sans-serif; color: rgb(51, 51, 51); font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);\"><li><p style=\"text-align: center;\"><strong><span style=\"font-family: 宋体, SimSun; font-size: 36px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 苹果</span></strong></p></li><li><p><br/></p></li></ul><p><span style=\"font-weight: 700;\">苹果</span>（学名：<em>Malus pumila</em>）是水果的一种，是<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%94%B7%E8%96%87%E7%A7%91\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">蔷薇科</a><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%8B%B9%E6%9E%9C%E4%BA%9A%E7%A7%91\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">苹果亚科</a><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%8B%B9%E6%9E%9C%E5%B1%9E\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">苹果属</a><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%A4%8D%E7%89%A9\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">植物</a>，其树为<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%90%BD%E5%8F%B6%E4%B9%94%E6%9C%A8\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">落叶乔木</a>。苹果的果实富含<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%9F%BF%E7%89%A9%E8%B4%A8\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">矿物质</a>和<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%BB%B4%E7%94%9F%E7%B4%A0\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">维生素</a>，是人们经常食用的水果之一。</p><p>苹果是一种低热量<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E9%A3%9F%E7%89%A9/85041\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">食物</a>，每100克只产生60千卡<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%83%AD%E9%87%8F/1137730\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">热量</a>。苹果中营养成分可溶性大，易被人体吸收，故有“活水”之称。其有利于溶解<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%A1%AB%E5%85%83%E7%B4%A0\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">硫元素</a>，使皮肤润滑柔嫩<span class=\"sup--normal\" style=\"font-size: 12px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em; margin-left: 2px; color: rgb(51, 102, 204); cursor: pointer; padding: 0px 2px;\">&nbsp;[1]</span><a class=\"sup-anchor\" style=\"color: rgb(19, 110, 194); position: relative; top: -50px; font-size: 0px; line-height: 0;\">&nbsp;</a>&nbsp;。据说“每天一苹果，医生远离我”。</p><p>根据<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%81%94%E5%90%88%E5%9B%BD%E7%B2%AE%E5%86%9C%E7%BB%84%E7%BB%87\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">联合国粮农组织</a>统计，2013年全世界的苹果产量为8082万吨，超过<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%91%A1%E8%90%84/1116\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">葡萄</a>的7718万吨，排世界第二位（第一位是<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E9%A6%99%E8%95%89/150475\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">香蕉</a>：1.067亿吨）。毫无疑问，苹果是<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%B8%A9%E5%B8%A6\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">温带</a>水果之王。</p><p>苹果营养丰富，味道甜美。<span class=\"sup--normal\" style=\"font-size: 12px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em; margin-left: 2px; color: rgb(51, 102, 204); cursor: pointer; padding: 0px 2px;\">&nbsp;[1]</span><a class=\"sup-anchor\" style=\"color: rgb(19, 110, 194); position: relative; top: -50px; font-size: 0px; line-height: 0;\">&nbsp;</a></p><p>苹果树多为异花<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%8E%88%E7%B2%89\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">授粉</a>，有2～4%的花座果较为理想。虽然成熟苹果的大小、形状、颜色和酸度因品种和环境条件的不同而差异很大，但通常圆形，直径50～100毫米，带红色或黄色。</p><p><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E4%B8%AD%E5%9B%BD/1122445\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">中国</a>是苹果生产大国，其产量占苹果总产量的65%。主要品种：辽南寒富；甘肃天水<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%8A%B1%E7%89%9B%E8%8B%B9%E6%9E%9C\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">花牛苹果</a>、陕西洛川富士、乾县红富士、山东红星、山西万荣等。</p><p><br/><span class=\"description\" style=\"display: block; color: rgb(85, 85, 85); font-size: 12px; text-indent: 0px; font-family: 宋体; word-wrap: break-word; word-break: break-all; line-height: 15px; padding: 8px 7px; min-height: 12px; border-top: 1px solid rgb(224, 224, 224);\">苹果</span></p><p>美国的名种有Red Delicious（<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E9%A6%99%E6%B8%AF/128775\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">香港</a>称地利蛇果，简称<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%9B%87%E6%9E%9C\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">蛇果</a>；台湾称五爪苹果）、Gold Delicious等。英国北威尔斯巴德西岛（Bardsey Island）则在发现新品种，比普通的果树 更健康，除了虫害以外，并不会患病，被媒体称为世界上最罕有的苹果。</p><h2 class=\"title-text\" style=\"margin: 0px; padding: 0px 8px 0px 18px; font-size: 22px; color: rgb(0, 0, 0); float: left; display: block; line-height: 24px; font-weight: 400; background: rgb(255, 255, 255);\">营养价值</h2><p><a class=\"edit-icon j-edit-link\" style=\"color: rgb(136, 136, 136); text-decoration: none; display: block; float: right; height: 22px; line-height: 22px; padding-left: 24px; font-size: 12px; font-family: SimSun; background: rgb(255, 255, 255);\"><em class=\"cmn-icon wiki-lemma-icons wiki-lemma-icons_edit-lemma\" style=\"font-style: normal; font-family: baikeFont_layout; font-weight: 400; -webkit-font-smoothing: antialiased; speak: none; font-variant: normal; text-transform: none; line-height: 1; outline: 0px; margin: 0px 3px 0px 0px; vertical-align: text-bottom; text-decoration: none; color: rgb(170, 170, 170);\"></em>编辑</a></p><p><a class=\"lemma-anchor para-title\" style=\"color: rgb(19, 110, 194); text-decoration: none; position: absolute; top: -50px;\"></a><a class=\"lemma-anchor \" style=\"color: rgb(19, 110, 194); text-decoration: none; position: absolute; top: -50px;\"></a><a class=\"lemma-anchor \" style=\"color: rgb(19, 110, 194); text-decoration: none; position: absolute; top: -50px;\"></a><a class=\"lemma-anchor \" style=\"color: rgb(19, 110, 194); text-decoration: none; position: absolute; top: -50px;\"></a></p><h3 class=\"title-text\" style=\"margin: 0px; padding: 0px; font-size: 18px; color: rgb(51, 51, 51); font-weight: 400;\">营养成分</h3><p>苹果是美容佳品，既能减肥，又可使皮肤润滑柔嫩。苹果是种低热量食物，每10</p><p><br/><span class=\"description\" style=\"display: block; color: rgb(85, 85, 85); text-align: left; font-size: 12px; text-indent: 0px; font-family: 宋体; font-weight: 400; word-wrap: break-word; word-break: break-all; font-style: normal; line-height: 15px; padding: 8px 7px; min-height: 12px; border-top: 1px solid rgb(224, 224, 224);\"></span></p><p>0克只产生60千卡热量；苹果中营养成份可溶性大，易被人体吸收，故有“活水”之称，有利于溶解硫元素，使皮肤润滑柔嫩。苹果中含有铜、碘、锰、锌、 钾等元素，人体如缺乏这些元素，皮肤就会发生干燥、易裂、奇痒。</p><p>苹果中的维生素C是心血管的保护神、心脏病患者的健康元素。</p><p>吃较多苹果的人远比不吃或少吃苹果的人感冒几率要低。所以，有科学家和医师把苹果称为“全方位的健康水果”或称为“全科医生”。空气污染比较严重，多吃苹果可改善呼吸系统和肺功能，保护肺部免受空气中的灰尘和烟尘的影响。<sup class=\"sup--normal\" style=\"font-size: 12px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em; white-space: normal; margin-left: 2px; color: rgb(51, 102, 204); cursor: pointer; padding: 0px 2px;\">&nbsp;[7]</sup></p><p><sup class=\"sup--normal\" style=\"font-size: 12px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em; white-space: normal; margin-left: 2px; color: rgb(51, 102, 204); cursor: pointer; padding: 0px 2px;\"></sup></p><h3 class=\"title-text\" style=\"margin: 0px; padding: 0px; font-size: 18px; color: rgb(51, 51, 51); font-weight: 400;\">价值</h3><p>苹果的性味温和，含有丰富的碳水化合物、维生素和微量元素，有糖类、有机酸、果胶、蛋白质、钙、磷、钾、铁、维生素A、维生素B、维生素C和膳食纤维，另含有苹果酸，酒石酸，胡萝卜素，是所有蔬果中营养价值最接近的一个。</p><p><strong style=\"font-weight: 700;\">锌</strong></p><ol class=\"custom_num  para-list list-paddingleft-1\" style=\"list-style-type: none;\"><li class=\"list-num-1-1 list-num-paddingleft-1\" style=\"\"><p>苹果有“智慧果”、“记忆果”的美称。人们早就发现，多吃苹果有增进记忆、提高智能的效果。苹果不仅含有丰富的糖、维生素和矿物质等大脑必需的营养素，而且更重要的是富含锌元素。据研究，锌是人体内许多重要酶的组成部分，是促进生长发育的关键元素，锌还是构成与记忆力息息相关的核酸与蛋白质的必不可少的元素，锌还与产生抗体、提高人体免疫力等有密切关系。</p></li><li class=\"list-num-1-2 list-num-paddingleft-1\" style=\"\"><p>苹果中的含水量为85%。</p></li><li class=\"list-num-1-3 list-num-paddingleft-1\" style=\"\"><p>苹果中含的多酚及黄酮类天然化学抗氧化物质和大量的粗纤维。</p></li><li class=\"list-num-1-4 list-num-paddingleft-1\" style=\"\"><p>含有较多的钾，能与人体过剩的钠盐结合，使之排出体外。当人体摄入钠盐过多时，吃些苹果，有利于平衡体内电解质。</p></li><li class=\"list-num-1-5 list-num-paddingleft-1\" style=\"\"><p>含有的磷和铁等元素，易被肠壁吸收，有补脑养血、宁神安眠作用。</p></li><li class=\"list-num-1-6 list-num-paddingleft-1\" style=\"\"><p>苹果的香气是治疗抑郁和压抑感的良药。专家们经过多次试验发现，在诸多气味中，苹果的香气对人的心理影响最大，它具有明显的消除心理压抑感的作用。临床使用证明，让精神压抑患者嗅苹果香气后，心境大有好转，精神轻松愉快，压抑的心情得以消除。</p></li><li class=\"list-num-1-7 list-num-paddingleft-1\" style=\"\"><p>苹果中的苹果酸有美白的效果。许多人担心苹果的酸性会腐蚀牙齿的风险，苹果配上奶酪可以限制苹果中的酸性。吃苹果还可以帮助有效地清洁牙齿。</p></li></ol><h2 class=\"title-text\" style=\"margin: 0px; padding: 0px 8px 0px 18px; font-size: 22px; color: rgb(0, 0, 0); float: left; display: block; line-height: 24px; font-weight: 400; background: rgb(255, 255, 255);\">苹果功效</h2><p><a class=\"edit-icon j-edit-link\" style=\"color: rgb(136, 136, 136); text-decoration: none; display: block; float: right; height: 22px; line-height: 22px; padding-left: 24px; font-size: 12px; font-family: SimSun; background: rgb(255, 255, 255);\"><em class=\"cmn-icon wiki-lemma-icons wiki-lemma-icons_edit-lemma\" style=\"font-style: normal; font-family: baikeFont_layout; font-weight: 400; -webkit-font-smoothing: antialiased; speak: none; font-variant: normal; text-transform: none; line-height: 1; outline: 0px; margin: 0px 3px 0px 0px; vertical-align: text-bottom; text-decoration: none; color: rgb(170, 170, 170);\"></em>编辑</a></p><p>苹果含有较多的钾，能与人体过剩的钠盐结合，使之排出体外。</p><p><span class=\"description\" style=\"display: block; color: rgb(85, 85, 85); text-align: left; font-size: 12px; text-indent: 0px; font-family: 宋体; font-weight: 400; word-wrap: break-word; word-break: break-all; font-style: normal; line-height: 15px; padding: 8px 7px; min-height: 12px; border-top: 1px solid rgb(224, 224, 224);\">苹果果脯</span></p><p>当人体摄入钠盐过多时，吃些苹果，有利于平衡体内电解质。苹果中含有的磷和铁等元素，易被肠壁吸收，有补脑养血、宁神安眠作用。临床使用证明，让精神压抑患者嗅苹果香气后，心境大有好转，精神轻松愉快，压抑感消失。实验还证明，失眠患者在入睡前嗅苹果香味，能使人较快安静入睡。用苹果洗净挤汁，每次服100毫升，每日3次，连续服用，15天为一疗程，苹果具有降低胆固醇含量的作用。<sup class=\"sup--normal\" style=\"font-size: 12px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em; white-space: normal; margin-left: 2px; color: rgb(51, 102, 204); cursor: pointer; padding: 0px 2px;\">&nbsp;[7]</sup><a class=\"sup-anchor\" style=\"color: rgb(19, 110, 194); text-decoration: none; position: relative; top: -50px; font-size: 0px; line-height: 0;\">&nbsp;</a></p><p>降低胆固醇：保持血糖的稳定，还能有效降低胆固醇。<br/>　　防癌抗癌：减少肺癌的危险，预防铅中毒，原花青素能预防结肠癌血。</p><p>呼吸管道清理剂：改善呼吸系统和肺功能，保护肺部免受污染和烟尘的影响。<br/>　　促进胃肠蠕动：协助人体排出废物，减少有害物质对皮肤的危害。<br/>　　维持<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E9%85%B8%E7%A2%B1%E5%B9%B3%E8%A1%A1\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">酸碱平衡</a>：苹果是碱性食品，吃苹果可迅速中和体内过多的酸性物质(包括运动(运动食品)产生的酸及鱼、肉、蛋等酸性食物在体内产生的酸性代谢产物)，增强体力和抗病能力。<br/>　　减肥：苹果会增加饱腹感，饭前吃能减少进食量，达到减肥目的。</p><p>苹果富含多种微量元素和维生素等多种人体所需的营养成分，是公认的营养程度最高的健康水果之一。而苹果籽更被誉为“生命之库”，营养成分更是果肉的10倍以上。苹果籽蕴含大量植物性荷尔蒙，能有效双向调节人体内分泌，促进细胞微循环，提高细胞活性等。<sup class=\"sup--normal\" style=\"font-size: 12px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em; white-space: normal; margin-left: 2px; color: rgb(51, 102, 204); cursor: pointer; padding: 0px 2px;\">&nbsp;[9]</sup><a class=\"sup-anchor\" style=\"color: rgb(19, 110, 194); text-decoration: none; position: relative; top: -50px; font-size: 0px; line-height: 0;\">&nbsp;</a>&nbsp;然而，苹果籽中含有毒性物质氰苷。氰苷遇酸或在生物酶的作用下可水解为剧毒物质氢氰酸（HCN）。每克苹果籽中的氰苷折算为氢氰酸后约有几百个微克，几乎不存在致人中毒的可能，但在日常食用苹果时，也应避免食用果核部分。</p><p><sup class=\"sup--normal\" style=\"font-size: 12px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em; white-space: normal; margin-left: 2px; color: rgb(51, 102, 204); cursor: pointer; padding: 0px 2px;\"></sup><a class=\"sup-anchor\" style=\"color: rgb(19, 110, 194); text-decoration: none; position: relative; top: -50px; font-size: 0px; line-height: 0;\"> <br/></a><br/></p><p><br/></p>', '1', '6', '冯云鹏');
INSERT INTO `fruitimfo` VALUES ('12', '1', '山竹', '<p style=\"text-align: center;\"><strong><span style=\"font-family: 宋体, SimSun; font-size: 36px;\">山竹果</span></strong></p><p><strong><span style=\"font-family: 宋体, SimSun; font-size: 36px;\"></span></strong><br/></p><p>山竹（学名：Garcinia mangostana），又名莽吉柿、山竺、山竹子、倒捻子、凤果，既可以指植物山竹，为金丝桃科藤黄属下的一个种，也可以指这种植物的果实山竹。</p><p>山竹原名<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%8E%BD%E5%90%89%E6%9F%BF\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">莽吉柿</a>，原产于东南亚，一般种植10年才开始结果，对环境要求非常严格，因此是名副其实的绿色水果，与<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%A6%B4%E8%8E%B2\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">榴莲</a>齐名，号称“果中皇后”。</p><h2 class=\"title-text\" style=\"margin: 0px; padding: 0px 8px 0px 18px; font-size: 22px; color: rgb(0, 0, 0); float: left; display: block; line-height: 24px; font-weight: 400; background: rgb(255, 255, 255);\">主要价值</h2><p><a class=\"edit-icon j-edit-link\" style=\"color: rgb(136, 136, 136); text-decoration: none; display: block; float: right; height: 22px; line-height: 22px; padding-left: 24px; font-size: 12px; font-family: SimSun; background: rgb(255, 255, 255);\"><em class=\"cmn-icon wiki-lemma-icons wiki-lemma-icons_edit-lemma\" style=\"font-style: normal; font-family: baikeFont_layout; font-weight: 400; -webkit-font-smoothing: antialiased; speak: none; font-variant: normal; text-transform: none; line-height: 1; outline: 0px; margin: 0px 3px 0px 0px; vertical-align: text-bottom; text-decoration: none; color: rgb(170, 170, 170);\"></em>编辑</a></p><p>性平，味甘、微酸。皮：性凉，味苦、涩。</p><p>健脾生津，止泻。皮：消炎止痛。</p><p>主治脾虚腹泻，口干，烧伤，烫伤，湿疹，<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%8F%A3%E8%85%94%E7%82%8E\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">口腔炎</a>。</p><p>其果皮外敷有治疗烫伤作用。</p><p><a class=\"lemma-anchor para-title\" style=\"color: rgb(19, 110, 194); text-decoration: none; position: absolute; top: -50px;\"></a><a class=\"lemma-anchor \" style=\"color: rgb(19, 110, 194); text-decoration: none; position: absolute; top: -50px;\"></a><a class=\"lemma-anchor \" style=\"color: rgb(19, 110, 194); text-decoration: none; position: absolute; top: -50px;\"></a><a class=\"lemma-anchor \" style=\"color: rgb(19, 110, 194); text-decoration: none; position: absolute; top: -50px;\"></a></p><h3 class=\"title-text\" style=\"margin: 0px; padding: 0px; font-size: 18px; color: rgb(51, 51, 51); font-weight: 400;\">营养功效</h3><p>果中之后</p><p>在热带地区一年四季都盛产新鲜的水果，但被人称为“果后”的山竹每半年只产一次。在气候温和的北美和欧洲，人们对山竹几乎闻所未闻，而在热带雨林地区，山竹却家喻户晓，人们称其为“果中之后”和 “上帝之果”。山竹所以称为“果后”，除了本身味道甜美之外，另一个主要原因是在古时东南亚医药中所担当的角色，传统上，山竹被人用来控制发烧的温度及防止各种皮肤感染。而研究表示，山竹的果皮或外皮都蕴含丰富的Xanthone，不但具备<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%8A%97%E6%B0%A7%E5%8C%96\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">抗氧化</a>能力，也有助增进免疫系统健康，令人身心舒畅，整个山竹都有用，故深受人们推崇。也有以山竹果实做成的饮料登陆香港，正切合香港年轻一代钟意果汁饮料的趋势。</p><p>山竹果肉含<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%8F%AF%E6%BA%B6%E6%80%A7%E5%9B%BA%E5%BD%A2%E7%89%A9\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">可溶性固形物</a>16.8%，柠檬酸0.63%，还含有其它维生素B1，B2，C4和矿物质，具有降燥、清凉解热的作用，因此，山竹不仅味美，而且还有<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E9%99%8D%E7%81%AB\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">降火</a>的功效，能克榴莲之燥热。在泰国，人们将榴莲山竹视“夫妻果”。如果吃了过多<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%A6%B4%E8%8E%B2\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">榴莲</a>上了火，吃上几个山竹就能缓解。</p><p>另外，山竹含有丰富的蛋白质和脂类，对机体有很好的补养作用，对体弱、营养不良、病后都有很好的调养作用。</p><p><a class=\"lemma-anchor para-title\" style=\"color: rgb(19, 110, 194); text-decoration: none; position: absolute; top: -50px;\"></a><a class=\"lemma-anchor \" style=\"color: rgb(19, 110, 194); text-decoration: none; position: absolute; top: -50px;\"></a><a class=\"lemma-anchor \" style=\"color: rgb(19, 110, 194); text-decoration: none; position: absolute; top: -50px;\"></a><a class=\"lemma-anchor \" style=\"color: rgb(19, 110, 194); text-decoration: none; position: absolute; top: -50px;\"></a></p><h3 class=\"title-text\" style=\"margin: 0px; padding: 0px; font-size: 18px; color: rgb(51, 51, 51); font-weight: 400;\">化学组成</h3><p><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%B1%B1%E7%AB%B9\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">山竹</a>吃起来很甜美，但其散发出的气味很淡，因为其气味的化学组分量约是芳香水果气味的1/400。山竹的清香气味主要由挥发性成分，包括<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E4%B9%99%E9%85%B8%E5%B7%B1%E9%85%AF\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">乙酸己酯</a>、叶醇（顺-3-己烯醇）以及α-古巴烯（Copaene）组成。山竹营养丰富，抗氧化作用强，而且有保健功效，不过食用要适量，因为虽然正在研究中的氧杂<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%92%BD%E9%85%AE\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">蒽酮</a>被指出可能有抗病效果，但过量摄入此物质会增加酸中毒的可能性。氧杂蒽酮的一种——α-<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%80%92%E6%8D%BB%E5%AD%90\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">倒捻子</a>素有显著的抗氧化性，已广泛用于药品中，但过量服用会对线粒体功能有毒害作用，损害<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%91%BC%E5%90%B8%E4%BD%9C%E7%94%A8\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">呼吸作用</a>，造成乳酸酸中毒。山竹富含蛋白质、糖质和脂类，主治脾虚腹泻、口渴口干、烧伤、<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%83%AB%E4%BC%A4\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">烫伤</a>、湿疹、<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%8F%A3%E8%85%94%E7%82%8E\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">口腔炎</a>。山竹果肉性寒，因此食用易造成上火的榴莲后，可食用山竹去火，但不宜多吃，且肾病患者、心脏病患者、糖尿病者慎食，<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%B9%BF%E7%83%AD%E8%85%B9%E7%97%9B\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">湿热腹痛</a>腹泻者不可服用。外果皮粉末内服可治腹泻、<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%B5%A4%E7%97%A2\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">赤痢</a>，外敷可治皮肤病，干燥的山竹叶可用来泡茶。外果皮中的红色素可用来制黄色染料。</p><h2 class=\"title-text\" style=\"margin: 0px; padding: 0px 8px 0px 18px; font-size: 22px; color: rgb(0, 0, 0); float: left; display: block; line-height: 24px; font-weight: 400; background: rgb(255, 255, 255);\">孕妇</h2><p><a class=\"edit-icon j-edit-link\" style=\"color: rgb(136, 136, 136); text-decoration: none; display: block; float: right; height: 22px; line-height: 22px; padding-left: 24px; font-size: 12px; font-family: SimSun; background: rgb(255, 255, 255);\"><em class=\"cmn-icon wiki-lemma-icons wiki-lemma-icons_edit-lemma\" style=\"font-style: normal; font-family: baikeFont_layout; font-weight: 400; -webkit-font-smoothing: antialiased; speak: none; font-variant: normal; text-transform: none; line-height: 1; outline: 0px; margin: 0px 3px 0px 0px; vertical-align: text-bottom; text-decoration: none; color: rgb(170, 170, 170);\"></em>编辑</a></p><p><a class=\"lemma-anchor para-title\" style=\"color: rgb(19, 110, 194); text-decoration: none; position: absolute; top: -50px;\"></a><a class=\"lemma-anchor \" style=\"color: rgb(19, 110, 194); text-decoration: none; position: absolute; top: -50px;\"></a><a class=\"lemma-anchor \" style=\"color: rgb(19, 110, 194); text-decoration: none; position: absolute; top: -50px;\"></a><a class=\"lemma-anchor \" style=\"color: rgb(19, 110, 194); text-decoration: none; position: absolute; top: -50px;\"></a></p><h3 class=\"title-text\" style=\"margin: 0px; padding: 0px; font-size: 18px; color: rgb(51, 51, 51); font-weight: 400;\">可以吃</h3><p>正常体质的孕妇能吃山竹。<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%B1%B1%E7%AB%B9\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">山竹</a>含有叶酸、脂肪、<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%9B%8B%E7%99%BD%E8%B4%A8%E7%B2%89\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">蛋白质粉</a>等对孕妇身体有益的物质，应该说从水果中汲取营养成分是十分安全健康的，孕妇可以通过吃山竹来滋养身体。</p><p>山竹含有丰厚的维生素、矿物质，果肉雪白嫩软，吃在嘴里甜中略酸，能够为孕妇补充很多孕妇需要的营养。</p><p>山竹性寒凉，有极佳的降热解燥功效，是最能与果中之王<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%A6%B4%E8%8E%B2\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">榴莲</a>相调和的水果。吃了大补的榴莲之后，吃几个山竹可以清热，既补益身体，又不会上火。</p><p>山竹果肉含丰富的膳食纤维、糖类、维生素及镁、钙、磷、钾等矿物元素。中医认为有清热降火、减肥润肤的功效。对平时肝火旺盛、皮肤不太好的孕妇，常吃山竹可以清热解毒，改善皮肤。</p><p><a class=\"lemma-anchor para-title\" style=\"color: rgb(19, 110, 194); text-decoration: none; position: absolute; top: -50px;\"></a><a class=\"lemma-anchor \" style=\"color: rgb(19, 110, 194); text-decoration: none; position: absolute; top: -50px;\"></a><a class=\"lemma-anchor \" style=\"color: rgb(19, 110, 194); text-decoration: none; position: absolute; top: -50px;\"></a><a class=\"lemma-anchor \" style=\"color: rgb(19, 110, 194); text-decoration: none; position: absolute; top: -50px;\"></a></p><h3 class=\"title-text\" style=\"margin: 0px; padding: 0px; font-size: 18px; color: rgb(51, 51, 51); font-weight: 400;\">注意事项</h3><p>但是，孕妈妈要千万注意：<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%B1%B1%E7%AB%B9\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">山竹</a>中糖分较高，因此妊娠高血压和妊娠糖尿病患者请勿食用；山竹中含有较高钾质，患有肾病和心脏病的孕妈妈要少吃；山竹性寒凉，因此体质虚寒的人要少吃；另外，山竹富含纤维素，过多食用会引起便秘，这点孕妈妈不能忽视哦。</p><p>山竹不能和西瓜、豆浆、啤酒、白菜、<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%8A%A5%E8%8F%9C\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">芥菜</a>、苦瓜同吃，如果孕妈妈担心山竹的寒凉对身体有伤，可以煮着吃或是做菜，水果也可以入菜的。</p><p>总之，孕妇能吃山竹，但是一定要注意数量和方法，每日食用山竹不超过3个。</p><p><br/></p>', '1', '6', '冯云鹏');
INSERT INTO `fruitimfo` VALUES ('20', '20', '草莓', '<p style=\";margin-bottom:0;text-align:center;text-indent:32px;line-height:29px\"><span style=\"font-size: 36px;\"><strong><span style=\"font-family: 宋体;\">草莓</span></strong></span></p><p style=\";margin-bottom:0;text-indent:32px;line-height:29px\"><span style=\";color:red\">草莓的介绍</span><span style=\"font-family:&#39;MS Mincho&#39;\"></span><strong><span style=\"font-family:宋体\">：</span></strong></p><p style=\";margin-bottom:0;text-indent:32px;line-height:29px\"><a href=\"https://baike.pcbaby.com.cn/qzbd/1027180.html\" target=\"_blank\"><span style=\"color:#333333;text-underline:none\">草莓</span></a>属蔷薇科多年生草本植物，又叫洋莓，原产于南美洲，我国是在20世纪初才引进的。草莓一般生长在拥有温暖天气的地区，不耐寒冷。草莓原产于南美洲，主要分布于亚洲、欧洲和美洲。中国的河北省、山东省和很多南方省市都有草莓的种植。草莓品种繁多，有2000多个品种，果实鲜红美艳，柔软多汁，甘酸宜人，芳香馥郁。</p><p style=\";margin-bottom:0;text-indent:32px;line-height:29px\">常见的草莓有以下品种：</p><p style=\";margin-bottom:0;text-indent:32px;line-height:29px\">1、章姬。果形是长圆锥形，果肉软多汁、味甜，深得草莓一族的青睐。因产量少，品质高，采摘价偏高。它不耐储存，若想多保存两天，建议在它七八分熟时就采下。</p><p style=\";margin-bottom:0;text-indent:32px;line-height:29px\">2、甜查理。它的每一次结果个儿大小差不多、果形为圆锥形，表面深红色，它的叶片比一般草莓大，呈浓绿色，光合作用强，产量高，因此采摘价格相对便宜。</p><p style=\";margin-bottom:0;text-indent:32px;line-height:29px\">3、红颜。其特征有些地方像章姬，果实长圆锥形，因其植株基部红色，果实鲜红漂亮而得名。果肉多汁、甜香、浓郁是“红颜”的最大特点。今年，它是郊区各大采摘园力推的拳头产品，可见它的受欢迎程度。</p><p style=\";margin-bottom:0;text-indent:32px;line-height:29px\">4、天香。 “天香”草莓由“达赛莱克特”与“卡姆罗莎”草莓杂交育成。在北京地区日光温室条件下1月上旬成熟, 果实圆锥形, 果形正，平均单果质量29.8 g，最大果质量58 g，橙红色，光泽强， 风味浓，耐贮运。因此在采摘时，可以多采些拿回家慢慢品尝。</p><p style=\";margin-bottom:0;text-indent:32px;line-height:29px\">5、天皇御用。引自日本的最新品种，据说这也是在日本最受欢迎的品种，果大，短圆锥形，符合我们心目中的草莓形象，味道甜，吃起来有香气，颜色鲜红，完全成熟后果实呈现暗紫色。</p><p style=\";margin-bottom:0;text-indent:32px;line-height:29px\"><span style=\";color:red\">草莓的营养价值</span><strong><span style=\"font-family:宋体\">：</span></strong></p><p style=\";margin-bottom:0;text-indent:32px;line-height:29px;background:white;orphans: auto;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:#333333\"><a href=\"https://baike.pcbaby.com.cn/qzbd/5397.html\" target=\"_blank\"><span style=\"color:#333333;text-underline:none\">草莓的营养价值</span></a></span><span style=\";color:#333333\">极高，其成分容易被人体消化、吸收，多吃也不会受凉或上火，是老少皆宜的健康食品。加上它的果实鲜红美艳，柔软多汁，甘酸宜人，芳香馥郁，是不可多得的色香味俱全的水果。</span></p><p style=\";margin-bottom:0;text-indent:32px;line-height:29px;background:white;orphans: auto;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:#333333\">草莓营养丰富，含有果糖、蔗糖、柠檬酸、苹果酸、水杨酸、氨基酸以及钙、磷、铁等矿物质。此外，它还含有多种维生素，尤其是维生素C含量非常丰富，每100克草莓中就含有维生素C60毫克。草莓中所含的胡萝卜素是合成维生素A的重要物质，具有明目养肝作用。草莓还含有果胶和丰富的<a href=\"https://baike.pcbaby.com.cn/qzbd/1028992.html\" target=\"_blank\"><span style=\"color:#333333;text-underline:none\">膳食纤维</span></a>，可以帮助消化、通畅大便。</span></p><p style=\";margin-bottom:0;text-indent:32px;line-height:29px;background:white;orphans: auto;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:#333333\">草莓的功效与作用</span></p><p style=\";margin-bottom:0;text-indent:32px;line-height:29px;background:white;orphans: auto;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:#333333\">1</span><span style=\";color:#333333\">、草莓中所含的胡萝卜素是合成维生素A的重要物质，具有明目养肝作用;</span></p><p style=\";margin-bottom:0;text-indent:32px;line-height:29px;background:white;orphans: auto;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:#333333\">2</span><span style=\";color:#333333\">、草莓对胃肠道和贫血均有一定的滋补调理作用;</span></p><p style=\";margin-bottom:0;text-indent:32px;line-height:29px;background:white;orphans: auto;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:#333333\">3</span><span style=\";color:#333333\">、草莓除可以预防坏血病外，对防治<a href=\"https://baike.pcbaby.com.cn/qzbd/4349.html\" target=\"_blank\"><span style=\"color:#333333;text-underline:none\">动脉硬化</span></a>，冠心病也有较好的疗效;</span></p><p style=\";margin-bottom:0;text-indent:32px;line-height:29px;background:white;orphans: auto;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:#333333\">4</span><span style=\";color:#333333\">、草莓是鞣酸含量丰富的植物，在体内可吸附和阻止致癌化学物质的吸收，具有防癌作用;</span></p><p style=\";margin-bottom:0;text-indent:32px;line-height:29px;background:white;orphans: auto;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:#333333\">5</span><span style=\";color:#333333\">、草莓中含有天冬氨酸，可以自然平和的清除体内的重金属离子。</span></p><p style=\";margin-bottom:0;text-indent:32px;line-height:29px\"><span style=\";color:red\">草莓的适用人群：</span></p><p style=\";margin-bottom:0;text-indent:32px;line-height:29px;background:white;orphans: auto;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:#333333\">中医认为，<a href=\"https://baike.pcbaby.com.cn/qzbd/1027180.html\" target=\"_blank\"><span style=\"color:#333333;text-underline:none\">草莓</span></a>有祛火、解暑、清热的作用，春天人的肝火比较旺盛，吃草莓可以起到抑制作用。另外，草莓最好在饭后吃，因为其含有大量果胶及纤维素，可促进胃肠蠕动，帮助消化，改善<a href=\"https://baike.pcbaby.com.cn/qzbd/4250.html\" target=\"_blank\"><span style=\"color:#333333;text-underline:none\">便秘</span></a>，预防<a href=\"https://baike.pcbaby.com.cn/qzbd/4231.html\" target=\"_blank\"><span style=\"color:#333333;text-underline:none\">痔疮</span></a>、肠癌的发生。草莓虽然具有丰富的营养物质，但是也并非人人都可以吃。有的人因为吃草莓会引起胃肠功能紊乱，另外患有尿路结石和<a href=\"https://baike.pcbaby.com.cn/qzbd/1775.html\" target=\"_blank\"><span style=\"color:#333333;text-underline:none\">肾功能</span></a>不好的人也不宜多吃，因为草莓含草酸钙较多，过多食用会加重患者病情。一般的人都可以享受到草莓的美味。以下人群就要特备注意了。</span></p><p style=\";margin-bottom:0;text-indent:32px;line-height:29px;background:white;orphans: auto;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:#333333\">1. </span><span style=\";color:#333333\">风热<a href=\"https://baike.pcbaby.com.cn/qzbd/4312.html\" target=\"_blank\"><span style=\"color:#333333;text-underline:none\">咳嗽</span></a>、咽喉肿痛、声音嘶哑者；夏季烦热口干或腹泻如水者；癌症，特别是鼻咽癌、肺癌、扁桃体癌、喉癌患者尤宜食用；</span></p><p style=\";margin-bottom:0;text-indent:32px;line-height:29px;background:white;orphans: auto;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:#333333\">2. </span><span style=\";color:#333333\">痰湿内盛、肠滑便泻者、尿路结石病人不宜多食。</span></p><p style=\";margin-bottom:0;text-indent:32px;line-height:29px\"><strong><span style=\"font-family:&#39;MS Mincho&#39;\"></span></strong></p><p style=\"text-indent:32px;line-height:29px\"><span style=\"font-size:16px;font-family:宋体\">&nbsp;</span></p><p><br/></p>', '1', '5', '冯云鹏');
INSERT INTO `fruitimfo` VALUES ('21', '36', '芒果', '<p style=\";margin-bottom:0;text-align:center;text-indent:70px;line-height:29px\"><strong><span style=\"font-size:35px;font-family:宋体\">芒果</span></strong></p><p style=\";margin-bottom:0;text-indent:32px;line-height:29px\"><span style=\";color:red\">基本内容：</span></p><p style=\"margin-top:0;margin-right:0;margin-bottom:12px;margin-left:0;text-indent:32px;line-height:19px;background:white\"><span style=\";color:#333333\">别名：<a href=\"https://baike.sogou.com/v72813808.htm\" target=\"_blank\"><span style=\"color:#3366CC;text-underline:none\">庵罗果</span></a>、檬果、蜜望子、香盖、果、漭果、闷果、蜜望、<a href=\"https://baike.sogou.com/v244166.htm\" target=\"_blank\"><span style=\"color:#3366CC;text-underline:none\">望果</span></a>、面果、庵波罗果</span></p><p style=\"margin-top:0;margin-right:0;margin-bottom:12px;margin-left:0;text-indent:32px;line-height:19px;background:white;orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:red\">禁忌人群</span><span style=\";color:#333333\">：皮肤病、肿瘤、糖尿病患者忌食。</span></p><p style=\"margin-top:0;margin-right:0;margin-bottom:12px;margin-left:0;text-indent:32px;line-height:19px;background:white;orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:#333333\">基本介绍：芒果为<a href=\"https://baike.sogou.com/v177274.htm\" target=\"_blank\"><span style=\"color:#3366CC;text-underline:none\">漆树科</span></a><a href=\"https://baike.sogou.com/v103011.htm\" target=\"_blank\"><span style=\"color:#3366CC;text-underline:none\">芒果属</span></a>热带常绿<a href=\"https://baike.sogou.com/v56325973.htm\" target=\"_blank\"><span style=\"color:#3366CC;text-underline:none\">大乔木</span></a>，高9到27米，<a href=\"https://baike.sogou.com/v73845518.htm\" target=\"_blank\"><span style=\"color:#3366CC;text-underline:none\">叶为</span></a>披针形，油绿而发亮，花小而多，红色或黄色，呈顶生圆锥花序，树的寿命长的可达几百年。原产印度及马来西亚，印度栽培历史最久，产量最多，占世界产量的80％。芒果的名字来源于印度南部的泰<a href=\"https://baike.sogou.com/v128979853.htm\" target=\"_blank\"><span style=\"color:#3366CC;text-underline:none\">米乐</span></a>语。<a href=\"https://baike.sogou.com/v6272373.htm\" target=\"_blank\"><span style=\"color:#3366CC;text-underline:none\">野芒</span></a>果树的果实不能食用，<a href=\"https://baike.sogou.com/v1152890.htm\" target=\"_blank\"><span style=\"color:#3366CC;text-underline:none\">印度人</span></a>最先发现这种树，并栽培成可吃的芒果，还用它来遮蔽热带的骄阳，距今已有4000多年的历史了。世界上许多国家都有各自喜爱的芒果品种。<a href=\"https://baike.sogou.com/v7739825.htm\" target=\"_blank\"><span style=\"color:#3366CC;text-underline:none\">泰国人</span></a>常常爱说自己的芒果是世界上最好的，泰国人喜爱一种叫“<a href=\"https://baike.sogou.com/v264141.htm\" target=\"_blank\"><span style=\"color:#3366CC;text-underline:none\">婆罗门</span></a>米亚”的芒果，意思是“卖老婆的婆罗门”，传说有个酷爱芒果的婆罗门竟把老婆卖了买芒果吃，因此得名。印度人把<a href=\"https://baike.sogou.com/v138877182.htm\" target=\"_blank\"><span style=\"color:#3366CC;text-underline:none\">阿方索芒果</span></a>、佩珊芒果和孟加拉芒果当作珍品。斯里兰卡人喜爱的是鹦鱼芒果和卢比芒果。菲律宾人欣赏的是加拉巴奥芒果，近年来为了做生意，将它改名为<a href=\"https://baike.sogou.com/v85611.htm\" target=\"_blank\"><span style=\"color:#3366CC;text-underline:none\">马尼拉</span></a>超级芒果。我国芒果的经济栽培地区有广东、广西、海南、福建、云南、台湾等省区。栽培最多的是海南省的海南岛，分布在陵水、保亭、乐东。东方、昌江、崖县等，目前，年产约500吨。广西的南宁、钦州、百色、玉林；云南的西双版纳、德宏、思茅；福建的安溪、漳州、云霄、厦门等地均有相当产量的芒果。</span></p><p style=\";margin-bottom:0;text-indent:32px;line-height:29px\"><span style=\";color:red\">功效与作用</span><span style=\";color:black\">：</span></p><p style=\"margin-top:0;margin-right:0;margin-bottom:12px;margin-left:0;text-indent:32px;line-height:19px;background:white\"><span style=\";color:#333333\">1.</span><span style=\";color:#333333\">防治心血管疾病</span></p><p style=\"margin-top:0;margin-right:0;margin-bottom:12px;margin-left:0;text-indent:32px;line-height:19px;background:white;orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:#333333\">芒果中含维生素C量高于一般水果，且具有即使加热加工处理，其含量也不会消失的特点，常食芒果可以不断补充体内维生素C的消耗，<a href=\"https://baike.sogou.com/v63775392.htm\" target=\"_blank\"><span style=\"color:#3366CC;text-underline:none\">降低胆固醇</span></a>、甘油三酯，有利于防治心血管疾病。</span></p><p style=\"margin-top:0;margin-right:0;margin-bottom:12px;margin-left:0;text-indent:32px;line-height:19px;background:white;orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:#333333\">2.</span><span style=\";color:#333333\">抗癌</span></p><p style=\"margin-top:0;margin-right:0;margin-bottom:12px;margin-left:0;text-indent:32px;line-height:19px;background:white;orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:#333333\">据现代食疗观点而言，芒果含有大量的维生素A，因此具有防癌、抗癌的作用。</span></p><p style=\"margin-top:0;margin-right:0;margin-bottom:12px;margin-left:0;text-indent:32px;line-height:19px;background:white;orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:#333333\">3.</span><span style=\";color:#333333\">美化肌肤</span></p><p style=\"margin-top:0;margin-right:0;margin-bottom:12px;margin-left:0;text-indent:32px;line-height:19px;background:white;orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:#333333\">由于芒果中含有大量的维生素，因此经常食用芒果，可以起到滋润肌肤的作用。</span></p><p style=\"margin-top:0;margin-right:0;margin-bottom:12px;margin-left:0;text-indent:32px;line-height:19px;background:white;orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:#333333\">4.</span><span style=\";color:#333333\">明目</span></p><p style=\"margin-top:0;margin-right:0;margin-bottom:12px;margin-left:0;text-indent:32px;line-height:19px;background:white;orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:#333333\">芒果的糖类及维生素含量非常丰富，尤其<a href=\"https://baike.sogou.com/v66068601.htm\" target=\"_blank\"><span style=\"color:#3366CC;text-underline:none\">维生素A</span><span style=\"color:#3366CC;text-underline:none\">原</span></a>含量占水果之首位，具有明目的作用。</span></p><p style=\"margin-top:0;margin-right:0;margin-bottom:12px;margin-left:0;text-indent:32px;line-height:19px;background:white;orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:#333333\">5.</span><span style=\";color:#333333\">防治便秘</span></p><p style=\"margin-top:0;margin-right:0;margin-bottom:12px;margin-left:0;text-indent:32px;line-height:19px;background:white;orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:#333333\">芒果促进排便，对于防治便秘具有一定的好处。</span></p><p style=\"margin-top:0;margin-right:0;margin-bottom:12px;margin-left:0;text-indent:32px;line-height:19px;background:white;orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:#333333\">6.</span><span style=\";color:#333333\">杀菌</span></p><p style=\"margin-top:0;margin-right:0;margin-bottom:12px;margin-left:0;text-indent:32px;line-height:19px;background:white;orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:#333333\"><a href=\"https://baike.sogou.com/v54459114.htm\" target=\"_blank\"><span style=\"color:#3366CC;text-underline:none\">芒果叶</span></a></span><span style=\";color:#333333\">的提取物能抑制<a href=\"https://baike.sogou.com/v76100550.htm\" target=\"_blank\"><span style=\"color:#3366CC;text-underline:none\">化脓球菌</span></a>、大肠杆菌、绿脓杆菌。同时还具有抑制流感病毒的作用。</span></p><p style=\"margin-top:0;margin-right:0;margin-bottom:12px;margin-left:0;text-indent:32px;line-height:19px;background:white;orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:#333333\">7.</span><span style=\";color:#333333\">祛痰止咳</span></p><p style=\"margin-top:0;margin-right:0;margin-bottom:12px;margin-left:0;text-indent:32px;line-height:19px;background:white;orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:#333333\">芒果中所含的芒果甙有祛疾止咳的功效，对咳嗽痰多气喘等症有辅助治疗作用。</span></p><p style=\"margin-top:0;margin-right:0;margin-bottom:12px;margin-left:0;text-indent:32px;line-height:19px;background:white;orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:#333333\">8.</span><span style=\";color:#333333\">防止晕车</span></p><p style=\"margin-top:0;margin-right:0;margin-bottom:12px;margin-left:0;text-indent:32px;line-height:19px;background:white;orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:#333333\">食用芒果对于晕车、晕船有一定的止吐作用。</span></p><p style=\";margin-bottom:0;text-indent:32px;line-height:29px\"><span style=\";color:red\">营养价值</span><span style=\";color:black\">：</span></p><p style=\"margin-top:0;margin-right:0;margin-bottom:12px;margin-left:0;text-indent:32px;line-height:19px;background:white\"><span style=\";color:#333333\">1.</span><span style=\";color:#333333\">芒果的含水量较高，约为82%。每100克含有66千卡热量。未成熟的果子含有淀粉，成熟转为糖。</span></p><p style=\"margin-top:0;margin-right:0;margin-bottom:12px;margin-left:0;text-indent:32px;line-height:19px;background:white;orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:#333333\">2.</span><span style=\";color:#333333\">成熟的芒果果肉含糖14%~16%，<a href=\"https://baike.sogou.com/v7865036.htm\" target=\"_blank\"><span style=\"color:#3366CC;text-underline:none\">可溶性固形物</span></a>15%~24%，另外含有丰富的蛋白质，芒果酮酸、维生素A、维生素B、维生素C、胡萝卜素及多种人体所需要的钙、磷、铁等矿物质和氨基酸。</span></p><p style=\";margin-bottom:0;text-indent:32px;line-height:29px\"><span style=\";color:red\">选购方法</span><span style=\";color:black\">：</span></p><p style=\"margin-top:0;margin-right:0;margin-bottom:12px;margin-left:0;text-indent:32px;line-height:19px;background:white\"><span style=\";color:#333333\">1.</span><span style=\";color:#333333\">自然成熟的芒果颜色不十分均匀，而催熟的芒果则只有小头顶尖处果皮翠绿，其他部位的果皮则发黄。</span></p><p style=\"margin-top:0;margin-right:0;margin-bottom:12px;margin-left:0;text-indent:32px;line-height:19px;background:white;orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:#333333\">2.</span><span style=\";color:#333333\">催熟的芒果味淡或有异味，没有芒果特有的香味。</span></p><p style=\"margin-top:0;margin-right:0;margin-bottom:12px;margin-left:0;text-indent:32px;line-height:19px;background:white;orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:#333333\">3.</span><span style=\";color:#333333\">自然成熟的芒果有适中的硬度和弹性，而催熟的芒果则整体扁软。</span></p><p style=\";margin-bottom:0;text-indent:32px;line-height:29px\"><span style=\";color:red\">禁忌</span><span style=\";color:black\">：</span></p><p style=\"margin-top:0;margin-right:0;margin-bottom:12px;margin-left:0;text-indent:32px;line-height:19px;background:white\"><span style=\";color:#333333\">虽然芒果的营养价值很高，但不宜进食过量，若进食2/3的中型芒果已达到营养师每日建议的食用量。而芒果含有的刺激性物质比较多，吃芒果时又易将<a href=\"https://baike.sogou.com/v29917452.htm\" target=\"_blank\"><span style=\"color:#3366CC;text-underline:none\">芒果汁</span></a>沾到嘴、脸颊等部位，刺激面部皮肤，造成面部红肿、发炎，严重者会出现眼部红肿、疼痛现象。因此吃完后要及时清洗掉残留在口唇周围皮肤上的芒果汁肉，以免发生过敏反应。此外，因为芒果含有特殊物质，不适合吃芒果的人群还是应该忌口较好。</span></p><p style=\"margin-top:0;margin-right:0;margin-bottom:12px;margin-left:0;text-indent:32px;line-height:19px;background:white;orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:#333333\">1</span><span style=\";color:#333333\">、饱饭后不可食用芒果。芒果不可与大蒜等辛辣物质共食，否则可能引起发黄病。</span></p><p style=\"margin-top:0;margin-right:0;margin-bottom:12px;margin-left:0;text-indent:32px;line-height:19px;background:white;orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:#333333\">2</span><span style=\";color:#333333\">、由于芒果含糖量较高，故糖尿病患者应忌食。芒果带湿毒，患有皮肤病或肿瘤者，应避免进食。</span></p><p style=\"margin-top:0;margin-right:0;margin-bottom:12px;margin-left:0;text-indent:32px;line-height:19px;background:white;orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:#333333\">3</span><span style=\";color:#333333\">、<a href=\"https://baike.sogou.com/v67925784.htm\" target=\"_blank\"><span style=\"color:#3366CC;text-underline:none\">虚寒咳嗽</span></a>(喉痒痰白)者应避免进食，以免令喉头痒。而哮喘患者，亦应遵照医嘱戒吃。</span></p><p style=\"margin-top:0;margin-right:0;margin-bottom:12px;margin-left:0;text-indent:32px;line-height:19px;background:white;orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:#333333\">4</span><span style=\";color:#333333\">、<a href=\"https://baike.sogou.com/v54459114.htm\" target=\"_blank\"><span style=\"color:#3366CC;text-underline:none\">芒果叶</span></a>和芒果汁会引起过敏体质人的皮炎，故过敏体质人应注意。</span></p><p style=\"margin: 0px 0px 12px; text-indent: 32px; line-height: 19px; background: white none repeat scroll 0% 0%; text-align: start; -webkit-text-stroke-width: 0px; word-spacing: 0px;\"><span style=\";color:#333333\">5</span><span style=\";color:#333333\">、 芒果未熟时，<a href=\"https://baike.sogou.com/v7646178.htm\" target=\"_blank\"><span style=\"color:#3366CC;text-underline:none\">果蒂</span></a>部位会有白色汁液渗出，估计这可能是致敏原因。多吃芒果会引起过敏，严重的可能会损害肾脏。</span></p>', '1', '5', '冯云鹏');
INSERT INTO `fruitimfo` VALUES ('22', '4', '李子', '<p style=\";margin-bottom:0;text-align:center;text-indent:69px;line-height:29px\"><span style=\"font-size:35px;color:black\">李子</span></p><p style=\";margin-bottom:0;text-indent:32px;line-height:29px;background:white\"><span style=\";color:red\">别名</span><span style=\";color:#333333\">:<a href=\"https://baike.sogou.com/v167388.htm\" target=\"_blank\"><span style=\"color:#3366CC;text-underline:none\">麦李</span></a></span><span style=\";color:#333333\">、脆李、金沙李、嘉庆子、<a href=\"https://baike.sogou.com/v64678001.htm\" target=\"_blank\"><span style=\"color:#3366CC;text-underline:none\">李实</span></a>、嘉应子</span></p><p style=\";margin-bottom:0;text-indent:32px;line-height:29px;background:white;orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:red\">禁忌人群</span><span style=\";color:#333333\">:<a href=\"https://baike.sogou.com/v493501.htm\" target=\"_blank\"><span style=\"color:#3366CC;text-underline:none\">溃疡病</span></a></span><span style=\";color:#333333\">及急、<a href=\"https://baike.sogou.com/v52948234.htm\" target=\"_blank\"><span style=\"color:#3366CC;text-underline:none\">慢性胃肠炎</span></a>、<a href=\"https://baike.sogou.com/v279811.htm\" target=\"_blank\"><span style=\"color:#3366CC;text-underline:none\">IGA</span><span style=\"color:#3366CC;text-underline:none\">肾病</span></a>患者忌服；脾虚痰湿及小儿不宜多吃。</span></p><p style=\";margin-bottom:0;text-indent:32px;line-height:29px;background:white;orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:red\">适宜人群</span><span style=\";color:#333333\">:</span><span style=\";color:#333333\">一般人群均可食用。发热、口渴、虚痨骨蒸、肝病腹水者，教师、演员音哑或失音者，慢性肝炎、肝硬化者尤益食用。</span></p><p style=\";margin-bottom:0;text-indent:32px;line-height:29px;background:white;orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:red\">基本介绍</span><span style=\";color:#333333\">:</span><span style=\";color:#333333\">李子是蔷薇科植物李的果实，俗称“<a href=\"https://baike.sogou.com/v614886.htm\" target=\"_blank\"><span style=\"color:#3366CC;text-underline:none\">恐龙蛋</span></a>”。我国大部分地区均产。7～8月间采收成熟果实，洗净，去核鲜用，或晒干用。饱满圆润，玲珑剔透，形态美艳，口味甘甜，是人们喜食的传统果品之一。它既可鲜食，又可以制成罐头、果脯，是夏季的主要水果之一。</span></p><p style=\";margin-bottom:0;text-indent:32px;line-height:29px;background:white;orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:red\">功效与作用</span><span style=\";color:#333333\">:</span><span style=\";color:#333333\">性平、味甘、酸；入肝、肾经。具有生津止渴、清肝除热、利水的功效；主治阴虚内热，骨蒸痨热，消渴引饮，肝胆湿热，腹水，小便不利等病症。1.促进消化李子能促进胃酸和胃<a href=\"https://baike.sogou.com/v382190.htm\" target=\"_blank\"><span style=\"color:#3366CC;text-underline:none\">消化酶</span></a>的分泌，有增加肠胃蠕动的作用，因而食李能促进消化，增加食欲，为<a href=\"https://baike.sogou.com/v67922042.htm\" target=\"_blank\"><span style=\"color:#3366CC;text-underline:none\">胃酸缺乏</span></a>、食后饱胀、大便秘结者的食疗良品。2.清肝利水生食之对于治疗<a href=\"https://baike.sogou.com/v2956348.htm\" target=\"_blank\"><span style=\"color:#3366CC;text-underline:none\">肝硬化腹水</span></a>大有种益。3.降压、导泻、镇咳可加快肠道蠕动，促进干燥的大便排出，同时也具有止咳祛痰的作用。4.美容养颜可以“去粉滓黑黯”，“令人面泽”，对<a href=\"https://baike.sogou.com/v1546248.htm\" target=\"_blank\"><span style=\"color:#3366CC;text-underline:none\">汗斑</span></a>、脸生黑斑等有良效。</span></p><p style=\";margin-bottom:0;text-indent:32px;line-height:29px;background:white;orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:red\">营养价值</span><span style=\";color:#333333\">:</span><span style=\";color:#333333\">李子的果实含有丰富的糖、维生素、果酸、氨基酸等营养成分。具有很高的营养价值。</span></p><p style=\";margin-bottom:0;text-indent:32px;line-height:29px;background:white;orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:red\">选购</span><span style=\";color:#333333\">:</span><span style=\";color:#333333\">果实饱满，大小适中、外形完好、无碰伤及病斑为好。李子味苦涩或放入水中漂浮者为有毒，不宜食之。其中，红肉李子以果粒硕大，果皮紫黑色，果面有白色果粉为佳；黄肉李子以果皮亮黄色，肉质软有弹性为佳；桃接李子以色洪亮微呈透明状、有弹性者为佳。</span></p><p style=\";margin-bottom:0;text-indent:32px;line-height:29px;background:white;orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:red\">存储</span><span style=\";color:#333333\">:</span><span style=\";color:#333333\">放在阴凉处，不要洗。</span></p><p style=\"margin-bottom: 0px; text-indent: 32px; line-height: 29px; background: white none repeat scroll 0% 0%; text-align: start; -webkit-text-stroke-width: 0px; word-spacing: 0px;\"><span style=\";color:red\">食用方法</span><span style=\";color:#333333\">:1.</span><span style=\";color:#333333\">未熟透的李子不要吃；2.李子含高量的果酸，多食易生痰湿、伤脾胃，又损齿。</span></p>', '1', '5', '冯云鹏');
INSERT INTO `fruitimfo` VALUES ('23', '25', '西瓜', '<p style=\"text-align:center;text-indent:69px;line-height:29px\"><span style=\"font-size:35px;font-family:宋体\">西瓜</span></p><p style=\";margin-bottom:0;text-indent:32px;line-height:29px;background:white\"><strong><span style=\"font-family:宋体;color:black\">　<a href=\"http://health.pclady.com.cn/fruit/watermellon/\" target=\"_blank\" style=\"transition: all 0.2s ease-in-out\"><span style=\"color:black;text-underline:none\">西瓜</span></a>的功效：</span></strong></p><p style=\";margin-bottom:0;text-indent:32px;line-height:29px;background:white;orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:black\">　　西瓜性寒，味甘，归心、胃、膀胱经;具有清热解暑、生津止渴、利尿除烦的功效;主治胸膈气壅，满闷不舒，小便不利，口鼻生疮，暑热，中暑，解酒毒等症。</span></p><p style=\";margin-bottom:0;text-indent:32px;line-height:29px;background:white;orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:black\">　　1、解暑气：盛夏，赤日炎炎，一些人感到胸闷不适，精神萎靡，疲惫乏力，头晕目眩，食 欲不振，体重下降，或有低热等。随着高温天气的持续，症状有增无减，直到 秋凉后才逐渐康复。翌年又有可能周而复始，然而各种检查却无器质性病变。 这一系列症候，俗称疰夏。祖国医学认为，疰夏是由于夏天暑湿之气侵入人体，阻遏中焦脾胃之气的缘故。尤其是小儿饮品过杂，妇女少作活动，就很容易有这种病症。“疰夏”之后， 一个夏季，要消瘦10kg多，等待夏去秋来，才能逐渐康复，患者除请医服药外，宜用西瓜皮和<a href=\"http://health.pclady.com.cn/healthzq/jianguo/huasheng/\" target=\"_blank\" style=\"transition: all 0.2s ease-in-out\"><span style=\"color:black;text-underline:none\">花生</span></a>2两，麦芽1两，米仁1两，煮成浓汤，连服六七日，就可以食欲大增。</span></p><p style=\";margin-bottom:0;text-indent:32px;line-height:29px;background:white;orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:black\">　　2、治中暑：夏令中暑，忽然头昏脑热，如尚无呕吐泄泻情形，可用西瓜刨汁，日服两三盅，轻的就此治愈。发热不退的，可用淡豆豉9克，香薷6克煲汤，作为药剂，再以西瓜汁作饮料，也可治愈。要是中暑的人突然昏倒或吐泻不止，应请医急治，此方不宜应用。但服药休养后，以西瓜汁代替饮料也是相宜的。</span></p><p style=\";margin-bottom:0;line-height:29px;background:white\"><strong><span style=\"font-family:宋体;color:black\"><a href=\"http://health.pclady.com.cn/fruit/watermellon/\" target=\"_blank\"><span style=\"color:black;text-underline:none\">西瓜</span></a></span></strong><strong><span style=\"font-family: 宋体;color:black\">的作用：</span></strong></p><p style=\";margin-bottom:0;text-indent:32px;line-height:29px;background:white\"><span style=\";color:black\">1</span><span style=\";color:black\">、夏季痤疮：绿豆100克，加水1500毫升，煮汤，沸后10分钟去绿豆，西瓜皮(不用削去外皮)500克，煮沸后冷却。饮汤，一日数次。方中绿豆甘凉，可消肿下气、清热解毒;西瓜皮甘寒，可清热解暑、除烦止渴。</span></p><p style=\";margin-bottom:0;text-indent:32px;line-height:29px;background:white\"><span style=\";color:black\">2</span><span style=\";color:black\">、健脾消暑：新鲜西瓜皮100克，<a href=\"http://health.pclady.com.cn/healthzq/bupin/dazao/\" target=\"_blank\" style=\"transition: all 0.2s ease-in-out\"><span style=\"color:black;text-underline:none\">大枣</span></a>10枚，共煎汤，每日当<a href=\"http://health.pclady.com.cn/healthzq/chalei/chayin/\" target=\"_blank\" style=\"transition: all 0.2s ease-in-out\"><span style=\"color:black;text-underline:none\">茶饮</span></a>。</span></p><p style=\";margin-bottom:0;text-indent:32px;line-height:29px;background:white;orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:black\">3</span><span style=\";color:black\">、壮阳：西瓜皮切丝，开水焯后捞出，与熟鸡丝、瘦肉丝加调料食用。</span></p><p style=\"text-indent:32px;line-height:29px\"><span style=\"font-size:16px;font-family:宋体;color:#333333;background:#FDFDFD\">4</span><span style=\"font-size:16px;font-family:宋体;color:#333333;background:#FDFDFD\">、西瓜子性味甘，性平，无毒，其具有利肺、润肠、健胃、止血等功效。西瓜子含有丰富的蛋白质、脂肪酸、维生素B族、维生素E、钾、铁、硒等营养元素，有清肺化痰的作用，对咳嗽痰多和咳血等症有辅助疗效；</span></p><p style=\"text-indent:32px;line-height:29px\"><span style=\"font-size:16px;font-family:宋体;color:#333333;background:#FDFDFD\">5</span><span style=\"font-size:16px;font-family:宋体;color:#333333;background:#FDFDFD\">、西瓜子富含油脂，有健胃、通便的作用，没有食欲或便秘时食用一些西瓜子之类的种仁；含有不饱和脂肪酸，有降低血压的功效，并有助于预防动脉硬化、缓解急性膀胱炎等症状，是适合高血压病人食用的小吃；</span></p><p style=\"text-indent: 28px; line-height: 29px;\"><span style=\"font-size:16px;font-family:宋体;color:#333333;background:#FDFDFD\">6</span><span style=\"font-size:16px;font-family:宋体;color:#333333;background:#FDFDFD\">、西瓜子有止血的功能。</span>新鲜西瓜子常被炒熟或煮熟干制后食用，它营养丰富，功能广泛，可帮助体弱的妇女补充蛋白质，也可帮助儿童补锌补铁，还有助于预防老年人动脉硬化。西瓜子富含油脂，有健胃、通便的作用，没有食欲或便秘时食用一些西瓜子之类的种仁有一定作用。</p>', '1', '5', '冯云鹏');
INSERT INTO `fruitimfo` VALUES ('24', '10', '桃', '<p style=\"text-indent: 28px; line-height: 29px; text-align: center;\"><strong><span style=\"font-family: 宋体; color: rgb(51, 51, 51); background: rgb(253, 253, 253) none repeat scroll 0% 0%; font-size: 36px;\">桃子</span></strong></p><p style=\";margin-bottom:0;text-indent:32px;line-height:29px;background:white\"><span style=\";color:red\">基本内容</span><span style=\";color:#333333\">：</span></p><p style=\";margin-bottom:0;text-indent:32px;line-height:29px;background:white\"><span style=\";color:#333333\">别名:桃实、桃子</span></p><p style=\";margin-bottom:0;text-indent:32px;line-height:29px;background:white;orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:#333333\">禁忌人群:糖尿人不宜多吃。</span></p><p style=\";margin-bottom:0;text-indent:32px;line-height:29px;background:white;orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:#333333\">适宜人群:一般人群均可食用。</span></p><p style=\";margin-bottom:0;text-indent:32px;line-height:29px;background:white;orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:#333333\">基本介绍:桃是一种果实作为水果的落叶小乔木，花可以观赏，果实多汁，可以生食或制<a href=\"https://baike.sogou.com/v425166.htm\" target=\"_blank\"><span style=\"color:#3366CC;text-underline:none\">桃脯</span></a>、罐头等，核仁也可以食用。果肉有白色和黄色的，一般在亚洲最受欢迎的品种多为白色果肉，多汁而甜；欧洲、澳大利亚和北美洲的人则在历史上喜欢黄色果肉较酸的品种。桃的变种有：油桃、蟠桃、<a href=\"https://baike.sogou.com/v1354776.htm\" target=\"_blank\"><span style=\"color:#3366CC;text-underline:none\">寿星桃</span></a>、碧桃。桃果味道鲜美，营养丰富，是人们最为喜欢的鲜果之一。除鲜食外，还可加工成桃脯、桃酱、<a href=\"https://baike.sogou.com/v74159996.htm\" target=\"_blank\"><span style=\"color:#3366CC;text-underline:none\">桃汁</span></a>、<a href=\"https://baike.sogou.com/v58005349.htm\" target=\"_blank\"><span style=\"color:#3366CC;text-underline:none\">桃干</span></a>和桃罐头。桃树很多部分还具有药用价值，其根、叶、花、仁可以入药，具有止咳、活血、通便等功能，桃仁含油量45%，可榨取<a href=\"https://baike.sogou.com/v83484103.htm\" target=\"_blank\"><span style=\"color:#3366CC;text-underline:none\">工业用油</span></a>，桃核硬壳可制活性炭，是多用途的工业原料。</span></p><p style=\"text-indent:32px;line-height:29px\"><span style=\"font-size:16px;font-family:宋体;color:red\">功效作用</span><span style=\"font-size:16px;font-family:宋体\">：</span></p><p style=\"text-indent:28px;line-height:29px\"><span style=\"font-size:16px;font-family:宋体;color:#333333;background:white\">补益气血、养阴生津对</span><span style=\"font-size: 16px;font-family:宋体\"><a href=\"https://baike.sogou.com/v94903238.htm\" target=\"_blank\" style=\"orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:#3366CC;background:white\">大病之后</span></a></span><span style=\"font-size:16px;font-family:宋体;color:#333333;background:white\"><span style=\"orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;float:none;word-spacing:0px\">，气血亏虚，面黄肌瘦，心悸气短者、</span></span><span style=\"font-size:16px;font-family:宋体\"><a href=\"https://baike.sogou.com/v126340.htm\" target=\"_blank\" style=\"orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:#3366CC;background:white\">慢性支气管炎</span></a></span><span style=\"font-size:16px;font-family:宋体;color:#333333;background:white\"><span style=\"orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;float:none;word-spacing:0px\">、</span></span><span style=\"font-size: 16px;font-family:宋体\"><a href=\"https://baike.sogou.com/v6720146.htm\" target=\"_blank\" style=\"orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:#3366CC;background:white\">支气管扩张症</span></a></span><span style=\"font-size:16px;font-family:宋体;color:#333333;background:white\"><span style=\"orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;float:none;word-spacing:0px\">、肺纤维化、</span></span><span style=\"font-size:16px;font-family:宋体\"><a href=\"https://baike.sogou.com/v437962.htm\" target=\"_blank\" style=\"orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:#3366CC;background:white\">肺不张</span></a></span><span style=\"font-size:16px;font-family:宋体;color:#333333;background:white\"><span style=\"orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;float:none;word-spacing:0px\">、矽肺、肺结核等出现的干咳、咳血、慢性发热、盗汗等症有辅助食疗效果。2.补气益</span></span><span style=\"font-size:16px;font-family:宋体\"><a href=\"https://baike.sogou.com/v74079576.htm\" target=\"_blank\" style=\"orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:#3366CC;background:white\">血桃</span></a></span><span style=\"font-size:16px;font-family: 宋体;color:#333333;background:white\"><span style=\"orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;float:none;word-spacing:0px\">的含铁量较高，是</span></span><span style=\"font-size:16px;font-family:宋体\"><a href=\"https://baike.sogou.com/v10233417.htm\" target=\"_blank\" style=\"orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:#3366CC;background:white\">缺铁性贫血</span></a></span><span style=\"font-size:16px;font-family:宋体;color:#333333;background:white\"><span style=\"orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;float:none;word-spacing:0px\">病人的理想辅助食物。3.缓解水肿桃含钾多，含钠少，适合水肿病人食用。4.活血润肠桃仁有活血化淤、润肠通便作用，可用于闭经、跌打损伤等的辅助治疗。5.降血压有抗凝血作用，并能抑制咳嗽中枢而止咳。同时能使血压下降，可用于高血压病人的辅助治疗。</span></span></p><p style=\"text-indent:28px;line-height:29px\"><span style=\"font-size:16px;font-family:宋体;color:red\">营养价值</span><span style=\"font-size:16px;font-family:宋体\">：</span></p><p style=\";margin-bottom:0;text-indent:32px;line-height:29px;background:white\"><span style=\";color:#333333\">1.</span><span style=\";color:#333333\">桃子性味平和，含有多种维生素，果酸以及钙，磷，铁等矿物质，尤其是铁的含量较高。2.新鲜的桃子含水量较高约89%，热量较低，其热量主要来源于甜味中的天然糖。</span></p><p style=\";margin-bottom:0;text-indent:32px;line-height:29px;background:white;orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:#333333\">选购:看外型：果体大，形状端正，外皮无伤有桃毛、果色鲜亮为佳。看果味：以汁液丰富，味道甜酸适中，果香浓郁者为优。反之，汁液稀少，甜味不足，酸味较大，香味无或淡薄者为次。</span></p><p style=\"text-indent:28px;line-height:29px\"><span style=\"font-size:16px;font-family:宋体\">形态介绍：</span></p><p style=\"text-indent: 28px; line-height: 29px;\"><span style=\"font-size:16px;font-family:宋体;color:#333333;background:white\">落叶小乔木，高达8米，树冠开展。小枝红褐色或褐绿色。单叶互生，椭圆状披针形，先端长尖，边缘有粗锯齿状。花期3--4月，花单生，无柄，通常粉红色，单瓣。果实6---9月成熟，核果卵球形，表面有短柔毛。</span></p>', '1', '5', '冯云鹏');
INSERT INTO `fruitimfo` VALUES ('25', '9', '柠檬', '<p style=\"text-align:center;text-indent:28px;line-height:29px\"><strong><span style=\"font-size:35px;font-family:宋体;color:#333333;background:white\">柠檬</span></strong></p><p style=\"text-indent:32px;line-height:29px\"><span style=\"font-size:16px;font-family:宋体;color:#333333;background:white\">柠檬（拉丁学名：Citrus limon）是</span><span style=\"font-size:16px;font-family:宋体\"><a href=\"https://baike.sogou.com/v157470434.htm\" target=\"_blank\" style=\"orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:#3366CC;background:white\">芸香科</span></a><a href=\"https://baike.sogou.com/v45105.htm\" target=\"_blank\" style=\"orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:#3366CC;background:white\">柑橘属</span></a></span><span style=\"font-size:16px;font-family:宋体;color:#333333;background:white\"><span style=\"orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;float:none;word-spacing:0px\">的常绿小乔木，性喜温暖，耐阴，怕热。果实为黄色椭圆状，主要为榨汁用，有时也用做烹饪调料，但基本不用作鲜食，因为太酸。柠檬由阿拉伯人带往欧洲，古希腊、古罗马的文献中均无记载，15世纪时才在意大利</span></span><span style=\"font-size: 16px;font-family:宋体\"><a href=\"https://baike.sogou.com/v178323.htm\" target=\"_blank\" style=\"orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:#3366CC;background:white\">热那亚</span></a></span><span style=\"font-size:16px;font-family:宋体;color:#333333;background:white\"><span style=\"orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;float:none;word-spacing:0px\">开始种植，1494年在</span></span><span style=\"font-size:16px;font-family:宋体\"><a href=\"https://baike.sogou.com/v498933.htm\" target=\"_blank\" style=\"orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:#3366CC;background:white\">亚速尔群岛</span></a></span><span style=\"font-size:16px;font-family:宋体;color:#333333;background:white\"><span style=\"orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;float:none;word-spacing:0px\">出现，由于它富含维生素C，解决了西方人远程航海致命的问题——</span></span><span style=\"font-size:16px;font-family:宋体\"><a href=\"https://baike.sogou.com/v3250764.htm\" target=\"_blank\" style=\"orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:#3366CC;background:white\">坏血病</span></a></span><span style=\"font-size:16px;font-family:宋体;color:#333333;background:white\"><span style=\"orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;float:none;word-spacing:0px\">，英国海军曾用以补充维生素C。 柠檬是柑橘类中最不耐寒的种类之一。适宜于冬季较暖、夏季不酷热、气温较平稳的地方。原产东南亚，现主要产地为美国、意大利、西班牙和希腊。</span></span></p><p style=\"text-indent:32px;line-height:29px\"><span style=\"font-size:16px;font-family:宋体;color:red;background:white\">基本内容</span><span style=\"font-size:16px;font-family:宋体;color:#333333;background:white\">：</span></p><p style=\";margin-bottom:0;text-indent:32px;line-height:29px;background:white\"><span style=\";color:#333333\">别名:黎檬、黎檬子、黎朦子、宜母子、里<a href=\"https://baike.sogou.com/v64413777.htm\" target=\"_blank\"><span style=\"color:#3366CC;text-underline:none\">木子</span></a>、梨橡干、<a href=\"https://baike.sogou.com/v75763089.htm\" target=\"_blank\"><span style=\"color:#3366CC;text-underline:none\">药果</span></a>、檬子、<a href=\"https://baike.sogou.com/v41763774.htm\" target=\"_blank\"><span style=\"color:#3366CC;text-underline:none\">梦子</span></a>、宜蒙子、宜母果、柠果、黎檬干</span></p><p style=\";margin-bottom:0;text-indent:32px;line-height:29px;background:white;orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:#333333\">禁忌人群:胃溃疡、胃酸分泌过多，患有龋齿者和糖尿病患者慎食。</span></p><p style=\";margin-bottom:0;text-indent:32px;line-height:29px;background:white;orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:#333333\">适宜人群:一般人群均可食用。尤适宜暑热口干烦躁、消化不良者，<a href=\"https://baike.sogou.com/v59845992.htm\" target=\"_blank\"><span style=\"color:#3366CC;text-underline:none\">维生素C</span><span style=\"color:#3366CC;text-underline:none\">缺乏</span></a>者，胎动不安的孕妇，<a href=\"https://baike.sogou.com/v124494.htm\" target=\"_blank\"><span style=\"color:#3366CC;text-underline:none\">肾结石</span></a>患者，高血压、心肌梗死者。</span></p><p style=\";margin-bottom:0;text-indent:32px;line-height:29px;background:white;orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:#333333\">基本介绍:柠檬是<a href=\"https://baike.sogou.com/v157470434.htm\" target=\"_blank\"><span style=\"color:#3366CC;text-underline:none\">芸香科</span></a><a href=\"https://baike.sogou.com/v45105.htm\" target=\"_blank\"><span style=\"color:#3366CC;text-underline:none\">柑桔属</span></a>的常绿小乔木，主要为榨汁用，有时也用做烹饪调料，但基本不用作鲜食，因为太酸。柠檬由阿拉伯人带往欧洲，古希腊、古罗马的文献中均无记载，15世纪时才在意大利<a href=\"https://baike.sogou.com/v178323.htm\" target=\"_blank\"><span style=\"color:#3366CC;text-underline:none\">热那亚</span></a>开始种植，1494年在<a href=\"https://baike.sogou.com/v498933.htm\" target=\"_blank\"><span style=\"color:#3366CC;text-underline:none\">亚速尔群岛</span></a>出现，由于它富含维生素C，解决了西方人远程航海致命的问题——<a href=\"https://baike.sogou.com/v3250764.htm\" target=\"_blank\"><span style=\"color:#3366CC;text-underline:none\">坏血病</span></a>，英国海军曾用以补充维生素C。柠檬是柑橘类中最不耐寒的种类之一。适宜于冬季较暖、夏季不酷热、气温较平稳的地方。原产东南亚，现主要产地为美国、意大利、西班牙和希腊。</span></p><p style=\";margin-bottom:0;text-indent:32px;line-height:29px;background:white;orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:#333333\">功效与作用:味酸甘、性平，入肝、胃经；有化痰止咳，生津，健脾的功效；主治支气管炎、<a href=\"https://baike.sogou.com/v90939.htm\" target=\"_blank\"><span style=\"color:#3366CC;text-underline:none\">百日咳</span></a>、<a href=\"https://baike.sogou.com/v5870919.htm\" target=\"_blank\"><span style=\"color:#3366CC;text-underline:none\">维生素C</span><span style=\"color:#3366CC;text-underline:none\">缺乏症</span></a>、中暑烦渴、食欲不振、怀孕妇女<a href=\"https://baike.sogou.com/v604730.htm\" target=\"_blank\"><span style=\"color:#3366CC;text-underline:none\">胃气不和</span></a>、<a href=\"https://baike.sogou.com/v8083089.htm\" target=\"_blank\"><span style=\"color:#3366CC;text-underline:none\">纳减</span></a>、<a href=\"https://baike.sogou.com/v45920739.htm\" target=\"_blank\"><span style=\"color:#3366CC;text-underline:none\">噫气</span></a>等。1.生津解暑开胃别看柠檬食之味酸、微苦，不能像其他水果一样生吃鲜食，但柠檬果皮富含芳香挥发成分，可以生津解暑，开胃醒脾。夏季暑湿较重，很多人神疲乏力，长时间工作或学习之后往往胃口不佳，喝一杯柠檬泡水，清新酸爽的味道让人精神一振，更可以打开胃口。在西餐中多用柠檬作海鲜的调味，除去腥味异味，<a href=\"https://baike.sogou.com/v126664.htm\" target=\"_blank\"><span style=\"color:#3366CC;text-underline:none\">东南亚菜</span></a>则用它来直接烹煮，以突显其酸甜的食味。我国南方人爱吃的烤鸭、烧鹅中，也少不了柠檬这一调味品。2.预防心血管疾病柠檬富含维生素C和维生素P，能增强血管弹性和韧性，可预防和治疗高血压和心肌梗塞症状。近年来国外研究还发现，<a href=\"https://baike.sogou.com/v73063809.htm\" target=\"_blank\"><span style=\"color:#3366CC;text-underline:none\">青柠檬</span></a>中含有一种近似胰岛素的成分，可以使异常的血糖值降低。3.清热化痰柠檬也能袪痰。<a href=\"https://baike.sogou.com/v148851.htm\" target=\"_blank\"><span style=\"color:#3366CC;text-underline:none\">柠檬皮</span></a>的袪痰功效比柑橘还强。夏季天气湿热，如果饮食上不加以注意，人体的内湿和自然气候的外湿相互感应，湿浊郁积日久就可生痰。因此，夏季痰多，咽喉不适时，将柠檬汁加温水和少量食盐，可将喉咙积聚的浓痰顺利咳出。4.抗菌消炎柠檬富含维生素C，对人体发挥的作用犹如天然抗生素，具有抗菌消炎、增强人体免疫力等多种功效，平时可多喝热<a href=\"https://baike.sogou.com/v389047.htm\" target=\"_blank\"><span style=\"color:#3366CC;text-underline:none\">柠檬水</span></a>来保养身体。5.美容果柠檬中含有<a href=\"https://baike.sogou.com/v102420307.htm\" target=\"_blank\"><span style=\"color:#3366CC;text-underline:none\">维生素B1</span></a>、<a href=\"https://baike.sogou.com/v102420337.htm\" target=\"_blank\"><span style=\"color:#3366CC;text-underline:none\">维生素B2</span></a>、维生素C等多种营养成分，还含有丰富的有机酸、柠檬酸，柠檬是高度碱性食品，具有很强的抗氧化作用，对促进肌肤的新陈代谢、延缓衰老及抑制色素沉着等十分有效。6.止吐果两广地区中医著述《<a href=\"https://baike.sogou.com/v53767.htm\" target=\"_blank\"><span style=\"color:#3366CC;text-underline:none\">粤语</span></a>》记载：“柠檬，宜母子，味极酸，孕妇肝虚嗜之，故曰宜母。当熟时，人家竞买，以多藏而经岁久为尚，汁可代醋。”就是说，怀孕妇女可以放置一些柠檬在床边，早上起来嗅一嗅，有消除<a href=\"https://baike.sogou.com/v57353638.htm\" target=\"_blank\"><span style=\"color:#3366CC;text-underline:none\">晨吐</span></a>的效应。</span></p><p style=\"text-indent:32px;line-height:29px\"><span style=\"font-size:16px;font-family:宋体;color:red\">营养价值</span><span style=\"font-size:16px;font-family:宋体\">：</span></p><p style=\"text-indent:32px;line-height:29px\"><span style=\"font-size:16px;font-family:宋体;color:#333333;background:white\">鲜柠檬的热量很低，富含柠檬酸，是钾，钙，铁，维生素C和</span><span style=\"font-size:16px;font-family:宋体\"><a href=\"https://baike.sogou.com/v7607811.htm\" target=\"_blank\" style=\"orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:#3366CC;background:white\">生物类黄酮</span></a></span><span style=\"font-size:16px;font-family:宋体;color:#333333;background:white\"><span style=\"orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;float:none;word-spacing:0px\">的上等来源。2.柠檬汁的生物类黄酮大大低于果实，因为其主要是存在于果实的皮和膜中。3.柠檬皮中含有相当的</span></span><span style=\"font-size: 16px;font-family:宋体\"><a href=\"https://baike.sogou.com/v7572847.htm\" target=\"_blank\" style=\"orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;word-spacing:0px\"><span style=\";color:#3366CC;background:white\">柠檬醛</span></a></span><span style=\"font-size:16px;font-family:宋体;color:#333333;background:white\"><span style=\"orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;float:none;word-spacing:0px\">，这是一种与维生素A的作用相对抗的醛，必须确保膳食中维生素A的供给量是足够的，方可吃大量的柠檬皮。4.柠檬富含维生素C和维生素P，青柠檬中含有一种近似胰岛素的成分。</span></span></p><p style=\"text-indent:32px;line-height:29px\"><span style=\"font-size:16px;font-family:宋体;color:red\">选购</span><span style=\"font-size:16px;font-family:宋体\">：</span></p><p style=\"text-indent: 32px; line-height: 29px;\"><span style=\"font-size:16px;font-family:宋体;color:#333333;background:white\">.</span><span style=\"font-size:16px;font-family:宋体;color:#333333;background:white\">看颜色新鲜的柠檬色泽是很鲜艳的，鲜黄色的，而且色泽会很均匀，不会黄绿分布，皮是发亮的，顶部的那个结是绿色的，就是那个原来与树上连接的地方，摘下来后一般都会留下一个绿色的小顶部，就像橙子的顶部有一个象疙瘩的东西，如果是褐色的就证明这个柠檬是不新鲜的了。2.试手感比较结实的，比较硬的就是比较酸的，而较软的就会没那么酸，但是千万别买软绵绵的，软绵绵的就是很不新鲜的了。3.观形状整体形状比较圆的是会没那么酸，但是汁会多一点；而比较尖的就会比较酸，但是汁会少一点。</span></p>', '1', '5', '冯云鹏');
INSERT INTO `fruitimfo` VALUES ('26', '2', '提子', '<p style=\"text-align: center;\"><strong><span style=\"font-family: 宋体, SimSun; font-size: 36px;\">提子</span></strong></p><p><strong><span style=\"font-family: 宋体, SimSun; font-size: 36px;\"><br/></span></strong></p><p>提子又称“美国葡萄”、“美国提子”，是葡萄的一类品种。以其果脆个大、甜酸适口、极耐贮运、品质佳等优点，被称为“葡萄之王”。在围棋中，把对方无气之子取(提)出棋盘外叫提子。</p><p class=\"m-th pt22\"><a href=\"https://baike.pcbaby.com.cn/long/25936.html\" target=\"_blank\">提子的营养价值</a></p><p>1、提子中的糖主要是葡萄糖，能很快的被人体吸收。当人体出现低血糖时，若及时饮用葡萄汁，可很快使症状缓 解;</p><p>2、法国科学家研究发现，提子能比阿斯匹林更好地阻止血栓形成，并且能降低人体血清胆固醇水平，降低血小板的凝聚力，对预防心脑血管病有一定作用;</p><p>3、提子中含的类黄酮是一种强力抗氧化剂，可抗衰老，并可清除体内自由基;</p><p>4、提子中含有一种抗癌<a href=\"https://baike.pcbaby.com.cn/qzbd/7143.html\" target=\"_blank\" class=\"linkWordClass\">微量元素</a>，可以防止健康细胞癌变，阻止癌细胞扩散。葡萄汁可以帮助器官植手术患者减少排异反应，促进早日康复。 每100克葡萄所含营养素如下： 热量 (43.00千卡) 蛋白质 (0.50克) 脂肪 (0.20克) <a href=\"https://baike.pcbaby.com.cn/qzbd/6864.html\" target=\"_blank\" class=\"linkWordClass\">碳水化合物</a> (10.30克) <a href=\"https://baike.pcbaby.com.cn/qzbd/1028992.html\" target=\"_blank\" class=\"linkWordClass\">膳食纤维</a> (0.40克) 维生素A (8.00微克) 胡萝卜素 (50.00微克) 硫胺素 (0.04毫克) 核黄素 (0.02毫克) 尼克酸 (0.20毫克) <a href=\"https://baike.pcbaby.com.cn/qzbd/1028927.html\" target=\"_blank\" class=\"linkWordClass\">维生素C</a> (25.00毫克) <a href=\"https://baike.pcbaby.com.cn/qzbd/1028930.html\" target=\"_blank\" class=\"linkWordClass\">维生素E</a> (0.70毫克) 钙 (5.00毫克) 磷 (13.00毫克) 钠 (1.30毫克) 镁 (8.00毫克) 铁 (0.04毫克) 锌 (0.18毫克) 硒 (0.20微克) 铜 (0.09毫克) 锰 (0.06毫克) 钾 (104.00毫克)</p><p class=\"m-th pt22\"><a href=\"https://baike.pcbaby.com.cn/long/26118.html\" target=\"_blank\">提子的功效与作用</a></p><p>1、抗病毒杀细菌：葡萄中含有天然的聚合苯酚，能与病毒或细菌中的<a href=\"https://baike.pcbaby.com.cn/qzbd/6862.html\" target=\"_blank\" class=\"linkWordClass\">蛋白质</a>化合，使之失去传染疾病的能力，尤其对肝炎病毒、脊髓灰质炎病毒等有很好的杀灭作用。</p><p>2、防癌抗癌：葡萄中含有一种叫白藜芦醇的化合物质，可以防止正常细胞癌变，并能抑制已恶变细胞扩散，有较强的防癌抗癌功能。</p><p>3、抗贫血：葡萄中含具有抗恶性贫血作用的<a href=\"https://baike.pcbaby.com.cn/qzbd/1028917.html\" target=\"_blank\" class=\"linkWordClass\">维生素B</a>12，尤其是带皮的葡萄发酵制成的红葡萄酒，每升中约含维生素B12。12～15毫克。因此，常饮红葡萄酒，有益于治疗恶性贫血。</p><p>4、降低胃酸利胆：现代药理研究证明，葡萄中还含有维生素P，用葡萄种子油15克口服即可降低胃酸毒性，12克口服即可达到利胆的作用，因而可治疗胃炎、肠炎及呕吐等。</p><p>5、抗动脉粥样硬化：研究发现，葡萄酒在增加血浆中高密度脂蛋白的同时，能减少低密度脂蛋白含量。低密度脂蛋白可引起动脉粥样硬化，而高度密脂蛋白不仅不引起动脉粥样硬化，还有抗动脉粥样硬化的作用。因此常食葡萄(葡萄酒)，可减少<a href=\"https://baike.pcbaby.com.cn/qzbd/4317.html\" target=\"_blank\" class=\"linkWordClass\">冠心病</a>引起的死亡。同时，葡萄中钾元素含量较高，能帮助人体积累钙质，促进肾脏功能，调节心搏次数。</p><p>6、补益和兴奋大脑神经：葡萄果实中，葡萄糖、有机酸、<a href=\"https://baike.pcbaby.com.cn/qzbd/3843.html\" target=\"_blank\" class=\"linkWordClass\">氨基酸</a>、维生素的含量都很丰富，可补益和兴奋大脑神经，对治疗<a href=\"https://baike.pcbaby.com.cn/qzbd/4229.html\" target=\"_blank\" class=\"linkWordClass\">神经衰弱</a>和消除过度疲劳有一定效果。</p><p>7、利尿消肿安胎：据李时珍记载，葡萄的根、藤、叶等有很好的利尿、消肿、安胎作用，可治疗妊娠恶阻、呕吵、浮肿等病症。</p><p class=\"m-th pt22\"><a href=\"https://baike.pcbaby.com.cn/long/26300.html\" target=\"_blank\">提子的传说</a></p><p>斯塔菲路斯是阿里阿德涅和酒神狄俄尼索斯的儿子。他在勒莫斯岛(Lemmos)出生，他的兄弟是陶阿斯·奥诺皮翁(Thoas Oenopion)和泼帕力陶斯(Peparithos)。 希腊时代之后，以色列人对<a href=\"https://baike.pcbaby.com.cn/qzbd/1027150.html\" target=\"_blank\" class=\"linkWordClass\">葡萄</a>酒也情有独钟。</p><p>以色列人常常幽默地说，仁慈的上帝知道我们时常会需要酒，所以才把它赐予我们。记载以色列民族史的《旧约》中有很多地方都提到酒。葡萄及其初级(主要)产品——葡萄酒，被提及的次数大大超过其他植物。自古以来，累范特地区(Levant地中海东部地区)的葡萄酒以其品质和产量闻名于世。把酒送给旅行者是一个风俗，酒还用在盛宴和婚礼上。在食物匮乏的时期，它还可以和水甚至<a href=\"https://baike.pcbaby.com.cn/qzbd/5719.html\" target=\"_blank\" class=\"linkWordClass\">牛奶</a>混合饮用。这一事实可在上帝惩罚犹太人的记录中看到。</p><p>《旧约·创世记》第九章提到，大洪水过后，诺亚(Noah)开始重新种植葡萄和酿酒。他是被记录的第一个种植葡萄的人。诺亚的父亲拉麦(Lamech)如此预言：“这个孩子必将为我们的操作、和手中的劳苦，安慰我们”。作为酿酒第一人，他的确做到了。醉酒与酒几乎是伴生的，《旧约》里还有许多篇章劝诫人们认识嗜酒的危害。《旧约》中说酒是一个嘲弄者，不管是谁，被酒引诱都是不明智的。</p><p>《旧约》是要提醒我们：上帝创造了酒，是赐福于我们，让我们愉悦，但毫无疑问，是适度的愉悦。</p><p>《旧约》之后，又有《新约》。我们看到耶稣(Jesus)的第一个奇迹是在迦南(Cana)的婚礼庆典上把水变成酒(我们真希望能品尝到那种酒)。使徒保罗(Paul)把酒推荐给蒂莫西(Timothy)，让它助消化。它的象征意义一直流传至今，对基督徒来说是众所周知的</p><p><br/></p>', '1', '5', '冯云鹏');

-- ----------------------------
-- Table structure for `fruits`
-- ----------------------------
DROP TABLE IF EXISTS `fruits`;
CREATE TABLE `fruits` (
  `fruit_id` int(20) NOT NULL AUTO_INCREMENT,
  `fruit_name` varchar(200) NOT NULL,
  `fruit_sellprice` float(10,2) NOT NULL COMMENT '售价',
  `fruit_price` float(10,2) NOT NULL COMMENT '原价',
  `fruit_place` varchar(200) DEFAULT NULL,
  `fruit_images` varchar(20) DEFAULT NULL COMMENT '图片名',
  `fruit_imgcount` int(4) NOT NULL DEFAULT '4' COMMENT '图片数量',
  `fruit_amount` int(5) NOT NULL DEFAULT '100' COMMENT '库存数量',
  `fruit_states` int(2) NOT NULL DEFAULT '0' COMMENT '0 为上架，1为下架',
  `fruit_info` varchar(500) DEFAULT NULL COMMENT '信息描述',
  `fruit_date` int(4) NOT NULL DEFAULT '90' COMMENT '保鲜时间',
  `fruit_time` varchar(20) NOT NULL DEFAULT '2017-12-20 19:59:52' COMMENT '上架时间',
  `istop` varchar(13) DEFAULT '0' COMMENT '置顶 ，插入的是时间戳 根据时间戳倒序查询',
  `fruit_type` varchar(20) DEFAULT NULL COMMENT '水果的类型',
  `fruit_enterprice` float(10,2) DEFAULT '10.00',
  `addman` varchar(30) DEFAULT '冯云鹏',
  PRIMARY KEY (`fruit_id`),
  KEY `fruit_name_index` (`fruit_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11696 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fruits
-- ----------------------------
INSERT INTO `fruits` VALUES ('10000', '苹果', '70.50', '59.00', '中国（山东）', '10000', '5', '0', '1', '宏辉果蔬 烟台优级红富士 苹果 礼盒装 12个 85mm 新鲜水果', '100', '2017-12-11 19:59:52', '1526568074986', '苹果', '10.00', '冯云鹏');
INSERT INTO `fruits` VALUES ('10001', '猕猴桃', '25.50', '30.20', '陕西眉县', '10001', '4', '0', '1', '爱奇果 陕西眉县 精品徐香猕猴桃 15个精致装 单果约80-100g 新鲜水果 ', '100', '2017-12-11 19:59:52', '1526565949540', '猕猴桃', '10.00', '冯云鹏');
INSERT INTO `fruits` VALUES ('10002', '龙眼/桂圆', '17.60', '21.50', 'f泰国', '10002', '4', '97', '1', '展卉 泰国进口龙眼 1kg 新鲜水果 ', '100', '2017-12-11 19:59:52', '1526568686141', '龙眼', '10.00', '冯云鹏');
INSERT INTO `fruits` VALUES ('10003', '火龙果', '27.90', '23.60', 'f越南', '10003', '5', '97', '1', '【京东生鲜产地直采】【柑橘研究所推荐】云南哀牢山冰糖橙皮薄肉厚，入口化渣，黄金糖酸比，独特橙味，只选对的，不选贵的，云南柑桔研究所联手京东倾力打造', '100', '2017-12-11 19:59:52', '1526568086139', '火龙果', '10.00', '冯云鹏');
INSERT INTO `fruits` VALUES ('10004', '香梨', '50.80', '45.20', '新疆库尔勒', '10004', '4', '100', '1', '爱奇果 新疆库尔勒香梨 约2kg 当季新果 一级装 单果约90-120g 新鲜水果', '100', '2017-12-11 19:59:52', '0', '梨', '10.00', '冯云鹏');
INSERT INTO `fruits` VALUES ('10005', '橙子', '89.80', '45.50', '云南', '10005', '4', '100', '1', ' 展卉先锋橙 云南新平哀牢山冰糖橙 新鲜橙 甜橙子2.5kg装 新鲜水果\r\n【京东生鲜产地直采】【柑橘研究所推荐】云南哀牢山冰糖橙皮薄肉厚，入口化渣，黄金糖酸比，独特橙味，只选对的，不选贵的，云南柑桔研究所联手京东倾力打造', '100', '2017-12-11 19:59:52', '0', '橙子', '10.00', '冯云鹏');
INSERT INTO `fruits` VALUES ('10006', '百香果', '45.00', '23.30', '广西', '10006', '4', '103', '1', '展卉 百香果西番莲 12个装 单果50-80g 新鲜水果 ', '100', '2017-12-11 19:59:52', '1526565459269', '百香果', '10.00', '冯云鹏');
INSERT INTO `fruits` VALUES ('10007', '石榴', '29.00', '26.00', '云南', '10007', '4', '100', '1', '蒙生 云南蒙自石榴 6粒装 单果约重230-280g 新鲜水果\r\n【京东生鲜产地直采】在云南雨季的滋润中，蒙自的石榴悄悄的成熟了 【地处云贵高原 低纬度 蒙自的石榴更早遇见阳光】疏松肥沃的土壤更让石榴能够任性的生长', '100', '2017-12-11 19:59:52', '1526565940017', '石榴', '10.00', '冯云鹏');
INSERT INTO `fruits` VALUES ('10008', '桃子', '65.40', '56.30', '山东莱西', '10008', '4', '89', '1', '宏辉果蔬 桃子 映霜红 冬桃 雪桃 鲜桃 总重约1.5kg 新鲜水果\r\n【尝冬桃 品味四季】冬桃开花于阳春时节，成熟在霜降之后，果实生长期长达200余天，历经春、夏、秋三季的洗礼，长成外形精致、口感清脆甘甜、营养丰富的冬桃，是罕见而珍贵的桃中奇品。【爆款猕猴桃 王者归来】', '100', '2017-12-11 19:59:52', '1526565426009', '桃', '10.00', '冯云鹏');
INSERT INTO `fruits` VALUES ('10009', '芒果', '23.30', '10.20', '四川攀枝花', '10009', '4', '91', '1', '千里山 精选芒果 3kg礼盒装 ±100g 送礼佳选 新鲜水果 ', '100', '2017-12-11 19:59:52', '1526565420130', '芒果', '10.00', '冯云鹏');
INSERT INTO `fruits` VALUES ('10010', '蓝莓', '33.30', '22.20', 'f秘鲁', '10010', '4', '96', '1', '秘鲁 进口精选蓝莓 2盒装 约125g/盒 新鲜水果 ', '100', '2017-12-11 19:59:52', '1526565296366', '蓝莓', '10.00', '冯云鹏');
INSERT INTO `fruits` VALUES ('10011', '椰子', '30.20', '28.20', '海南', '10011', '4', '100', '1', '展卉 泰国进口椰青 2个装 单果约750g 赠送开椰器和吸管 新鲜水果', '100', '2017-12-11 19:59:52', '0', '椰青', '10.00', '冯云鹏');
INSERT INTO `fruits` VALUES ('10012', '葡萄', '17.40', '28.20', '云南', '10012', '4', '95', '1', '国产红提葡萄 约1kg 新鲜水果\r\n皮薄细腻，圆润剔透，鲜甜多汁，果香、清新怡人芳香！新一季农夫山泉 17.5°橙，京东首发，请点击~', '100', '2017-12-11 19:59:52', '0', '提子', '10.00', '冯云鹏');
INSERT INTO `fruits` VALUES ('10013', '香蕉', '89.22', '45.23', 'f菲律宾', '10013', '4', '91', '1', ' 都乐（DOLE） 超甜蕉一把 进口香蕉 都乐香蕉 热带水果\r\n新鲜采摘 软糯可口 皮薄肉甜，点击查询具体配送时效', '100', '2017-12-11 19:59:52', '1526568078500', '香蕉', '10.00', '冯云鹏');
INSERT INTO `fruits` VALUES ('10014', '榴莲', '212.50', '199.00', 'f泰国', '10014', '5', '99', '1', '泰国进口金枕头榴莲水果约2.5-3.5kg ', '100', '2017-12-11 19:59:52', '0', '榴莲', '10.00', '冯云鹏');
INSERT INTO `fruits` VALUES ('10015', '菠萝蜜', '178.00', '155.00', '海南', '10015', '4', '100', '1', '珍锐 海南三亚热带大树新鲜菠萝蜜1个约18斤-22斤 18到22斤 ', '100', '2017-12-11 19:59:52', '1526562440102', '菠萝蜜', '10.00', '冯云鹏');
INSERT INTO `fruits` VALUES ('10016', '甘蔗', '43.60', '36.20', '江西吉安', '10016', '4', '98', '1', ' 小毛驴 云南保山水果甘蔗一根分三段 2kg 一根分三段约4斤装\r\n水分充足 口感爽甜 蒲缥甜脆 现砍现发', '100', '2017-12-11 19:59:52', '0', '甘蔗', '10.00', '冯云鹏');
INSERT INTO `fruits` VALUES ('10017', '柚子', '100.00', '78.20', '福建漳州平和县', '10017', '4', '99', '1', '五丰 美仑达 精品琯溪蜜柚 红心柚子2个装 2kg~2.5kg 简致塑袋装 新鲜水果\r\n【国家地标产品 皇家贡品】正宗平和琯溪蜜柚，原产地直采，供港央企品质保障，肉嫩多汁，晶莹饱满【滋润冬季 吃正宗琯溪蜜柚】【领券满减】爱媛38号柑4斤装，品质出众', '100', '2017-12-11 19:59:52', '0', '柚子', '10.00', '冯云鹏');
INSERT INTO `fruits` VALUES ('10018', '释迦果', '156.20', '104.00', '台湾', '10018', '3', '98', '1', '台湾释迦果番荔枝新鲜水果 五颗装', '100', '2017-12-11 19:59:52', '0', '番荔枝/释迦', '10.00', '冯云鹏');
INSERT INTO `fruits` VALUES ('10019', '车厘子', '45.20', '45.00', 'f智利', '10019', '5', '92', '1', '智利进口车厘子J级 约500g 果径约26-28mm 新鲜水果\r\n智利车厘子空运直达，品质保证，个头饱满，肉厚多汁，从源头到餐桌新鲜极致体验。', '100', '2017-12-18 19:59:52', '0', '车厘子/樱桃', '10.00', '冯云鹏');
INSERT INTO `fruits` VALUES ('10020', '柠檬', '22.20', '45.10', '四川', '10020', '4', '99', '1', '原味邦（ywb） 原味邦 四川安岳黄柠檬500g 单果约80-160g 约3-5个水果', '100', '2017-12-18 19:59:52', '0', '柠檬', '10.00', '冯云鹏');
INSERT INTO `fruits` VALUES ('10021', '菠萝', '60.00', '40.00', '中国台湾', '10021', '4', '23413', '1', ' 树懒果园 台湾进口金钻凤梨 2个 单果1.2-1.5kg\r\n单个2斤半-3斤， 台湾正宗金钻凤梨，树上自然成熟，无需挖孔，削皮即食！', '100', '2017-12-19 19:59:52', '0', '菠萝', '10.00', '冯云鹏');
INSERT INTO `fruits` VALUES ('10022', '草莓', '25.50', '19.70', '安徽合肥', '10022', '5', '100', '1', ' 【长丰馆】长丰特产新鲜草莓水果现摘巧克力草莓红颜草莓 大果2斤顺丰包邮 1KG\r\n现采现发，顺丰包邮，长丰特产，破损包赔', '100', '2017-12-19 19:59:52', '0', '草莓', '10.00', '冯云鹏');
INSERT INTO `fruits` VALUES ('10023', '枇杷', '33.90', '20.30', '云南', '10023', '4', '99', '1', ' 果然阳光 攀枝花枇杷水果（京东配送） 16个（单果约45g）净含量650g以上\r\n攀枝花本地商家 上午采果 下午发货 你也可以选择枇杷礼盒装', '100', '2017-12-20 19:59:52', '0', '枇杷', '10.00', '冯云鹏');
INSERT INTO `fruits` VALUES ('10024', '琯溪蜜柚', '19.90', '15.90', '福建漳州平和县', '10024', '4', '96', '0', ' 五丰 美仑达 精品琯溪蜜柚 红心柚子2个装 2kg~2.5kg 简致塑袋装 新鲜水果【国家地标产品 皇家贡品】正宗平和琯溪蜜柚，原产地直采，供港央企品质保障，肉嫩多汁，晶莹饱满【滋润冬季 吃正宗琯溪蜜柚】【超实惠】美仑达赣南脐橙3斤装，低价风暴', '200', '2017-12-01 15:01:03', '0', '柚子', '30.00', '冯云鹏');
INSERT INTO `fruits` VALUES ('10025', '新西兰车厘子樱桃 ', '49.99', '15.00', 'f新西兰', '10025', '4', '97', '0', '天天果园 新西兰车厘子樱桃 1kg 进口樱桃车厘子 果径28-30mm 新鲜水果 包邮 ', '200', '2018-01-03 14:46:36', '0', '车厘子/樱桃', '30.00', '冯云鹏');
INSERT INTO `fruits` VALUES ('10026', '进口红提', '45.00', '26.00', 'f秘鲁', '10026', '5', '100', '0', ' 秘鲁 进口红提 提子 500g装 新鲜水果沐浴在南半球的红珍珠，皮肉同食不涩，轻咬紧实迸汁，鲜香清甜，放一颗嘴里，满满的爆汁~', '200', '2018-01-01 15:07:38', '0', '提子', '30.00', '冯云鹏');
INSERT INTO `fruits` VALUES ('10027', '华盛顿加力果', '200.00', '142.00', 'f美国华盛顿', '10027', '4', '99', '0', ' 美国 进口华盛顿加力果 苹果8个装 单果重约130-180g 新鲜水果美国华盛顿州苹果园，火山灰沃土，充裕而洁净的山泉水灌溉，遵从美国严格的分级和处理标准，高纤维、低卡路里的营养结构，是家庭餐桌上的健康小食或美味甜点的优良之选', '200', '2018-01-03 15:19:24', '0', '苹果', '130.00', '冯云鹏');
INSERT INTO `fruits` VALUES ('10028', '青芒果', '39.02', '23.30', 'f菲律宾', '10028', '5', '99', '0', '菲律宾 青芒 芒果 2.5kg装 单果重约250g以上 新鲜水果【温馨提示，芒果不易冷藏，还请室内常温储存】当季青芒果，新鲜速达，甜爆味蕾，唇齿留香，热销中~', '200', '2018-01-01 15:53:27', '0', '芒果', '30.00', '冯云鹏');
INSERT INTO `fruits` VALUES ('10029', '美国 进口华盛顿红蛇果 ', '19.00', '19.90', 'f美国', '10029', '5', '100', '0', ' 美国 进口华盛顿红蛇果 苹果4个装 单果重约180g 新鲜水果红地厘蛇果，与众不同的经典红，果芯细小让您大口啃！手工采摘，全程0-4度冷链运输，还原蛇果枝头本味，劲甜依旧出色！', '200', '2018-01-09 16:04:24', '0', '苹果', '10.00', '冯云鹏');
INSERT INTO `fruits` VALUES ('10030', '黄心猕猴桃奇异果', '42.99', '60.00', 'f新加坡', '10030', '5', '100', '0', '展卉 四川浦江黄心猕猴桃奇异果 12个装 单果约90-110g 新鲜水果', '200', '2018-01-16 21:42:30', '0', '猕猴桃', '30.00', '冷天明');
INSERT INTO `fruits` VALUES ('10031', '红心柚', '19.90', '21.80', '琯溪', '10031', '3', '100', '1', '五丰 美仑达 精品琯溪蜜柚 红心柚子2个装 2kg~2.5kg 简致塑袋装 自营水果【国家地标产品 皇家贡品】正宗平和琯溪蜜柚，原产地直采，供港央企品质保障，肉嫩多汁，晶莹饱满【滋润冬季 吃正宗琯溪蜜柚】', '30', '2018-01-20 15:44:43', '0', '柚子', '15.00', '罗婧');
INSERT INTO `fruits` VALUES ('10032', '猕猴桃', '15.70', '16.90', ' 陕西眉县', '10032', '3', '200', '1', '爱奇果 陕西眉县 徐香猕猴桃 12个 单果约80-90g', '20', '2018-01-19 15:52:50', '0', '猕猴桃', '12.00', '罗婧');
INSERT INTO `fruits` VALUES ('10033', '赣南脐橙', '20.90', '24.90', '赣南', '10033', '3', '298', '1', '精选赣南脐橙 12粒铂金果礼盒装 自营水果 新包装发货【专注好橙30年】脐橙专家，杨氏果业良心品质，2017赣南脐橙新鲜上市，采自全球GAP认证、绿色食品认证果园，个个严苛分选，黄金甜酸比，风味浓郁，汁多饱满', '60', '2018-01-20 11:58:05', '0', '橙子', '15.00', '罗婧');
INSERT INTO `fruits` VALUES ('10034', '红心火龙果', '35.90', '37.90', 'f越南', '10034', '4', '1000', '0', '越南进口红心火龙果 4个装 单果约350~400g【越南直采 精选大果】果肉更足 享受饱满的甜蜜诱惑！红心果富含花青素，天然抗氧化营养库！', '20', '2018-11-11 16:08:08', '0', '火龙果', '25.00', '罗婧');
INSERT INTO `fruits` VALUES ('10035', '黄心猕猴桃', '20.90', '21.90', '四川蒲江', '10035', '4', '500', '0', '四川浦江黄心猕猴桃奇异果 12个装 单果约90-110g 新鲜水果【金艳核心产区成都浦江】美味黄金果肉 果汁充盈 酸甜可口 维C满满 活力无限', '20', '2018-11-20 16:15:16', '0', '猕猴桃', '15.00', '罗婧');
INSERT INTO `fruits` VALUES ('10036', '湖南冰糖橙', '21.90', '22.90', '湖南', '10036', '4', '997', '0', '湖南冰糖橙 甜橙 新鲜橙子约2.5kg 单果约100g 新鲜水果【京东生鲜产地直采】黔阳冰糖橙个头小，形如蜜橘，无酸，甜度高，又称“冰糖泡”，橙子类的著名品种，被评为“中华名果” ，中国重点地理标识产品。冰糖橙品种优良，味浓甜，肉质脆嫩深受消费者喜爱。', '60', '2018-11-20 16:15:16', '0', '橙子', '9.50', '罗婧');
INSERT INTO `fruits` VALUES ('10037', '苹果', '31.80', '33.90', '新疆', '10037', '3', '700', '0', '新疆阿克苏苹果 果径70mm-80mm 12个装 约2kg【精选中小果 甜蜜如初】自营阿克苏苹果抢鲜上市！兵团农场直采，天山雪水灌溉，超长日照与大温差酝酿出纯正的冰糖心，甜爆你的味蕾~', '200', '2018-12-20 16:15:16', '0', '苹果', '15.50', '罗婧');
INSERT INTO `fruits` VALUES ('10038', '奶油草莓', '76.60', '78.80', '四川', '10038', '4', '300', '1', '红颜巧克力奶油草莓 1.5kg装中大果约70枚 冬季新鲜水果 顺丰直发', '10', '2017-12-16 16:24:25', '0', '草莓', '30.00', '罗婧');
INSERT INTO `fruits` VALUES ('10039', '香梨', '34.90', '36.00', '新疆库尔勒', '10039', '3', '100', '0', '爱奇果 新疆库尔勒香梨 单果120-150g 总重约2.5kg 礼盒装【爱奇果】【国家地理标志产品】【京东团队 新疆库尔勒产地直采】【梨中贵族 甘甜滋润】你有一个果园在新疆！', '200', '2017-12-20 16:15:16', '0', '梨', '6.00', '罗婧');
INSERT INTO `fruits` VALUES ('10040', '牛油果', '30.90', '33.90', '墨西哥', '10040', '4', '2000', '1', '进口 牛油果 6个装 单果重约130-180g【适合女人和宝宝的健康辅食】【牛油果——新一代水果明星 强势来袭】【滑软细腻 醇香软糯】【富含多酚、不饱和脂肪酸、膳食纤维】【多种吃法：拌酸奶、作沙拉、蘸生抽】产自美洲的应季好物，营养丰富、品控严苛', '100', '2018-01-12 16:46:32', '0', '牛油果', '10.50', '罗婧');
INSERT INTO `fruits` VALUES ('10041', '蛇果', '20.00', '21.50', '甘肃天水', '10041', '4', '1000', '1', '甘肃天水 花牛苹果/蛇果 12个 单果约70mm【潘苹果花牛/蛇果】【潘石屹亲情代言】天水花牛是与日本富士、美国蛇果齐名的世界三大苹果之一，口感绵软，果香浓郁！', '45', '2018-02-02 16:49:36', '0', '苹果', '3.50', '罗婧');
INSERT INTO `fruits` VALUES ('10042', '杨桃', '47.80', '49.90', 'f马来西亚', '10042', '4', '400', '1', '聚果臻品 新鲜水果农家现摘杨桃 5斤装酸甜口，孕妇食品，新鲜采摘，坏果包赔', '15', '2018-01-09 16:56:51', '0', '杨桃', '8.50', '罗婧');
INSERT INTO `fruits` VALUES ('10043', '蓝莓', '46.90', '49.90', 'f智力', '10043', '3', '269', '1', '秘鲁 进口精选蓝莓 2盒装 约125g/盒 新鲜水果 ', '15', '2018-01-02 17:07:17', '0', '苹果', '22.00', '罗婧');
INSERT INTO `fruits` VALUES ('10045', '红提', '19.80', '20.50', 'f秘鲁', '10045', '4', '552', '1', '秘鲁 进口红提 提子 500g装沐浴在南半球的红珍珠，皮肉同食不涩，轻咬紧实迸汁，鲜香清甜，放一颗嘴里，满满的爆汁~幸福正当时，不能 “莓”有你！Driscoll高端精品原箱礼盒，过年送礼必备佳品！', '25', '2018-01-01 17:38:21', '0', '提子', '14.60', '罗婧');
INSERT INTO `fruits` VALUES ('10046', '海南西瓜', '40.99', '49.99', '海南', '10046', '4', '100', '0', '西农八号西瓜种子 高产杂交抗病西瓜种子', '200', '2018-01-20 17:37:41', '0', '西瓜', '30.00', '冯云鹏');
INSERT INTO `fruits` VALUES ('10047', '车厘子', '75.00', '76.00', '智力', '10047', '4', '344', '1', '智利进口车厘子巨无霸JJJ级 约450g 果径约30-32mm智利新鲜直达巨无霸车厘子，精选大果，个头硕大，体验爆汁口感，品质之选，你值得拥有。', '20', '2018-03-08 18:06:35', '0', '苹果', '70.00', '罗婧');
INSERT INTO `fruits` VALUES ('10048', '鲜红大苹果', '30.00', '33.90', 'f以色列', '10048', '4', '269', '1', '以色列 进口红西柚中果 6个装 单果重约280g-320g【榨汁首选】以色列独特的地中海气候，给西柚提供了优良的生长环境，超长的日照赋予了红西柚清甜微苦的口感！', '35', '2018-01-15 18:08:53', '0', '苹果', '6.70', '罗婧');
INSERT INTO `fruits` VALUES ('10049', '柿饼', '45.00', '48.00', '富平', '10049', '3', '20482', '0', '富平吊饼 300g 柿饼 非圆饼 新鲜霜降柿饼 陕西特产【京东自营 新货新鲜发售】富平南高北低的自然大阳坡，造就了一颗颗柿界甜心，从树上到嘴里，时间沉淀的精品！', '180', '2018-01-20 18:11:37', '0', '苹果', '40.00', '罗婧');
INSERT INTO `fruits` VALUES ('10050', '椰子', '28.00', '23.00', 'f泰国', '10050', '3', '100', '1', '泰国进口椰青 2个装 单果约750g 赠送开椰器和吸管【两粒尝鲜装 长在树上的“矿泉水” 】自营团队泰国“定制”优质产地 ，附带开椰器和吸管【苛求新鲜美味 我们不一样】只挑“适龄椰青”，汁更香甜肉更细嫩，清晨采摘急速冷藏只为更鲜！', '45', '2018-01-17 18:13:23', '0', '苹果', '4.69', '罗婧');
INSERT INTO `fruits` VALUES ('10051', '石榴', '19.90', '21.90', '陕西', '10051', '4', '200', '0', ' 陕西临潼石榴6个超值装甜蜜水晶石榴单果200-300g 时令水果', '200', '2018-01-11 18:15:49', '0', '苹果', '15.00', '罗婧');
INSERT INTO `fruits` VALUES ('10052', '苹果', '18.80', '21.00', '新疆', '10052', '3', '100', '1', '新疆阿克苏冰糖心苹果1.5kg果径80mm以上 国产 新鲜水果', '60', '2018-01-20 19:11:08', '0', '苹果', '15.00', '冷天明');
INSERT INTO `fruits` VALUES ('10053', '哈蜜瓜', '27.50', '32.00', '海南', '10053', '3', '99', '1', '【苏宁生鲜】海南薄皮脆甜西州蜜瓜1个1.3kg以上/个 哈密瓜 新鲜水果', '60', '2018-01-20 19:14:23', '0', '哈密瓜', '20.00', '冷天明');
INSERT INTO `fruits` VALUES ('10054', '火龙果', '35.50', '39.00', 'f菲律宾', '10054', '3', '97', '1', '越南红心火龙果2个(大果)410g以上/个 新鲜水果 进口热带水果', '60', '2018-01-20 19:16:17', '0', '火龙果', '20.00', '冷天明');
INSERT INTO `fruits` VALUES ('10055', '红蛇果', '42.80', '45.00', 'f美国', '10055', '3', '100', '1', '美国红蛇果12个约190g/个 苹果礼盒装 新鲜水果全球精选,产地直采  ', '60', '2018-01-20 19:18:00', '0', '苹果', '30.00', '冷天明');
INSERT INTO `fruits` VALUES ('10056', '麒麟瓜', '29.99', '30.99', '海南', '10056', '3', '100', '0', '麒麟西瓜清甜多汁单个重 4-5kg', '200', '2018-01-19 19:53:17', '0', '西瓜', '30.00', '冯云鹏');
INSERT INTO `fruits` VALUES ('10057', '烟台市车厘子', '70.47', '77.13', '山东省烟台市', '10057', '5', '100', '0', '车厘子烟台大樱桃5新鲜水果殷桃2j山东10现摘现发车离子里4斤包邮', '180', '2018-05-08 16:12', '0', '车厘子/樱桃', '44.23', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10058', '中国车厘子', '53.12', '69.28', '中国大陆', '10058', '5', '100', '0', '辽宁大连樱桃1盒(250g/盒) 新鲜水果 大连樱桃 时令水果', '180', '2018-05-08 16:12', '0', '车厘子/樱桃', '51.74', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10059', '烟台市车厘子', '71.72', '73.75', '山东省烟台市', '10059', '5', '100', '0', '现摘现发10山东烟台大樱桃国产车厘子新鲜水果5孕妇樱桃3斤包邮', '180', '2018-05-08 16:12', '0', '车厘子/樱桃', '65.50', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10060', '烟台市车厘子', '65.87', '70.21', '山东省烟台市', '10060', '5', '100', '0', '圣春秋 烟台大樱桃5车厘子新鲜水果山东10美早2斤车里子非大连樱', '180', '2018-05-08 16:12', '0', '车厘子/樱桃', '65.78', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10061', '烟台市车厘子', '56.45', '78.45', '山东省烟台市', '10061', '5', '100', '0', '车厘子大红灯大樱桃烟台樱桃露天新鲜水果先锋山东5斤顺丰包邮', '180', '2018-05-08 16:12', '0', '车厘子/樱桃', '51.04', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10062', '烟台市车厘子', '74.06', '77.63', '山东省烟台市', '10062', '5', '100', '0', '樱桃新鲜车厘子新鲜水果5斤10大连樱桃山东烟台大樱桃车里子美早', '180', '2018-05-08 16:12', '0', '车厘子/樱桃', '69.22', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10063', '烟台市车厘子', '60.58', '79.89', '山东省烟台市', '10063', '5', '100', '0', '山东烟台大樱桃新鲜水果包邮2斤装5美早车厘子现摘现发10车里子甜', '180', '2018-05-08 16:12', '0', '车厘子/樱桃', '52.79', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10064', '烟台市车厘子', '73.27', '75.95', '山东省烟台市', '10064', '5', '100', '0', '山东烟台大樱桃新鲜水果5黄水晶黄蜜甜小殷桃车厘子水果3斤装包邮', '180', '2018-05-08 16:12', '0', '车厘子/樱桃', '45.07', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10065', '烟台市车厘子', '65.70', '70.74', '山东省烟台市', '10065', '5', '100', '0', '车厘子殷桃新鲜10水果包邮山东大樱桃5烟台黑珍珠车里子3斤孕妇', '180', '2018-05-08 16:12', '0', '车厘子/樱桃', '64.81', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10066', '烟台市车厘子', '40.47', '60.70', '山东省烟台市', '10066', '5', '100', '0', '烟台大樱桃新鲜水果黄水晶黄蜜黄樱桃山东黄金车厘子2斤现货包邮', '180', '2018-05-08 16:12', '0', '车厘子/樱桃', '40.08', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10067', '烟台市车厘子', '75.23', '78.69', '山东省烟台市', '10067', '5', '100', '0', '山东烟台美早大樱桃车厘子当季新鲜水果5斤包邮车里子', '180', '2018-05-08 16:12', '0', '车厘子/樱桃', '58.84', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10068', '烟台市车厘子', '46.51', '62.75', '山东省烟台市', '10068', '5', '100', '0', '现摘现发山东烟台美早大樱桃5新鲜孕妇水果批发3包邮2斤车厘子', '180', '2018-05-08 16:12', '0', '车厘子/樱桃', '44.95', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10069', '烟台市车厘子', '68.29', '68.60', '山东省烟台市', '10069', '5', '100', '0', '樱桃新鲜烟台现摘现发3斤山东孕妇大小5水果包邮大连车厘子', '180', '2018-05-08 16:12', '0', '车厘子/樱桃', '46.90', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10070', '烟台市车厘子', '42.00', '60.39', '山东省烟台市', '10070', '5', '100', '0', '【第2件0元】王小二 山东烟台大樱桃 新鲜水果批发包邮美早车厘子', '180', '2018-05-08 16:12', '0', '车厘子/樱桃', '40.54', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10071', '大连市车厘子', '50.52', '77.38', '辽宁省大连市', '10071', '5', '100', '0', '甜现货大连大樱桃美早车厘子2斤新鲜孕妇水果现摘现发胜山东烟台', '180', '2018-05-08 16:12', '0', '车厘子/樱桃', '48.43', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10072', '烟台市车厘子', '64.64', '75.72', '山东省烟台市', '10072', '5', '100', '0', '山东烟台大樱桃美早5车厘子 新鲜 水果包邮2斤殷桃车离子现摘现货', '180', '2018-05-08 16:12', '0', '车厘子/樱桃', '41.75', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10073', '烟台市车厘子', '69.36', '79.84', '山东省烟台市', '10073', '5', '100', '0', '【2斤大樱桃】樱桃新鲜5烟台大樱桃新鲜车厘子山东大樱桃孕妇水果', '180', '2018-05-08 16:12', '0', '车厘子/樱桃', '60.55', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10074', '中国车厘子', '41.10', '71.13', '中国大陆', '10074', '5', '100', '0', '辽宁大连樱桃500g 8', '180', '2018-05-08 16:12', '0', '车厘子/樱桃', '40.04', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10075', '烟台市车厘子', '63.83', '68.97', '山东省烟台市', '10075', '5', '100', '0', '现摘 烟台大樱桃车厘子新鲜美早樱桃黑珍珠车里子殷桃孕妇水果3斤', '180', '2018-05-08 16:12', '0', '车厘子/樱桃', '63.74', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10076', '烟台市车厘子', '74.96', '75.77', '山东省烟台市', '10076', '5', '100', '0', '车厘子大红灯山东烟台大樱桃先锋樱桃新鲜水果山东6斤顺丰包邮', '180', '2018-05-08 16:12', '0', '车厘子/樱桃', '57.21', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10077', '烟台市车厘子', '68.70', '77.98', '山东省烟台市', '10077', '5', '100', '0', '山东烟台大樱桃3斤装车厘子 新鲜 水果包邮特级车离里子殷桃新鲜', '180', '2018-05-08 16:12', '0', '车厘子/樱桃', '54.23', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10078', '烟台市车厘子', '51.84', '52.62', '山东省烟台市', '10078', '5', '100', '0', '烟台大樱桃新鲜水果黄水晶黄樱桃山东黄蜜黄金车厘子2斤现货包邮', '180', '2018-05-08 16:12', '0', '车厘子/樱桃', '42.78', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10079', '烟台市车厘子', '58.49', '58.59', '山东省烟台市', '10079', '5', '100', '0', '甜 山东烟台大樱桃车厘子3斤黑珍珠非大连10新鲜水果5现摘现发', '180', '2018-05-08 16:13', '0', '车厘子/樱桃', '51.39', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10080', '烟台市车厘子', '48.64', '49.83', '山东省烟台市', '10080', '5', '100', '0', '圣春秋 第2件0元山东烟台大樱桃5车厘子新鲜水果包邮10黑珍珠美早', '180', '2018-05-08 16:13', '0', '车厘子/樱桃', '42.95', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10081', '烟台市车厘子', '55.98', '58.48', '山东省烟台市', '10081', '5', '100', '0', '现货山东烟台美早大樱桃车厘子新鲜水果3斤非智利进口车里子', '180', '2018-05-08 16:13', '0', '车厘子/樱桃', '53.06', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10082', '烟台市车厘子', '77.44', '78.95', '山东省烟台市', '10082', '4', '100', '0', '山东烟台大樱桃新鲜车厘子水果 黑珍珠3斤非美早现摘现发拍2件5斤', '180', '2018-05-08 16:13', '0', '车厘子/樱桃', '66.45', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10083', '烟台市车厘子', '70.48', '73.59', '山东省烟台市', '10083', '5', '100', '0', '烟台大樱桃车厘子新鲜水果山东美早樱桃果园新鲜大樱桃买2斤送1斤', '180', '2018-05-08 16:13', '0', '车厘子/樱桃', '60.22', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10084', '烟台市车厘子', '69.79', '79.42', '山东省烟台市', '10084', '5', '100', '0', '果园鲜摘大樱桃车厘子新鲜水果山东烟台孕妇水果美早大樱桃送1斤', '180', '2018-05-08 16:13', '0', '车厘子/樱桃', '54.95', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10085', '烟台市车厘子', '52.32', '73.71', '山东省烟台市', '10085', '5', '100', '0', '山东烟台大樱桃现摘现发车厘子现货孕妇水果批发包邮新鲜当季整箱', '180', '2018-05-08 16:13', '0', '车厘子/樱桃', '42.62', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10086', '烟台市车厘子', '65.14', '79.37', '山东省烟台市', '10086', '5', '100', '0', '烟台大樱桃车厘子新鲜水果山东美早樱桃现货果园现摘现发顺丰包邮', '180', '2018-05-08 16:13', '0', '车厘子/樱桃', '43.04', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10087', '烟台市车厘子', '57.33', '75.72', '山东省烟台市', '10087', '5', '100', '0', '现摘现发山东烟台大樱桃车厘子5孕妇新鲜水果3美早10樱桃4斤包邮', '180', '2018-05-08 16:13', '0', '车厘子/樱桃', '43.11', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10088', '中国车厘子', '78.31', '78.84', '中国大陆', '10088', '5', '100', '0', '山东烟台美早樱桃1kg7g以上/个 新鲜水果 樱桃 美早樱桃 新鲜樱桃', '180', '2018-05-08 16:13', '0', '车厘子/樱桃', '59.50', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10089', '大连市车厘子', '75.63', '79.85', '辽宁省大连市', '10089', '5', '100', '0', '现货美早大连大樱桃新鲜水果 大果 甜车厘子现摘现发时令应季水果', '180', '2018-05-08 16:13', '0', '车厘子/樱桃', '61.55', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10090', '烟台市车厘子', '65.50', '71.73', '山东省烟台市', '10090', '5', '100', '0', '现摘现发山东烟台大樱桃车厘子新鲜水果2斤5大连樱桃美早车里子10', '180', '2018-05-08 16:13', '0', '车厘子/樱桃', '45.20', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10091', '烟台市车厘子', '48.87', '65.62', '山东省烟台市', '10091', '5', '100', '0', '山东烟台大樱桃新鲜水果车厘子孕妇水果现摘现发大红灯酸甜多汁', '180', '2018-05-08 16:13', '0', '车厘子/樱桃', '44.76', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10092', '大连市车厘子', '77.42', '77.91', '辽宁省大连市', '10092', '5', '100', '0', '现摘现发大大果大连大樱桃5新鲜水果美早国产车厘子10空运包邮2斤', '180', '2018-05-08 16:13', '0', '车厘子/樱桃', '69.60', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10093', '烟台市车厘子', '52.96', '69.92', '山东省烟台市', '10093', '5', '100', '0', '新鲜水果大樱桃5孕妇车厘子山东烟台黑珍珠包邮3斤6月发货', '180', '2018-05-08 16:13', '0', '车厘子/樱桃', '40.58', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10094', '烟台市车厘子', '42.11', '65.93', '山东省烟台市', '10094', '5', '100', '0', '绿渡 正宗山东烟台大樱桃新鲜3A 樱桃车厘子车里子3斤装预售', '180', '2018-05-08 16:13', '0', '车厘子/樱桃', '41.58', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10095', '烟台市车厘子', '66.68', '74.84', '山东省烟台市', '10095', '5', '100', '0', '烟台大樱桃新鲜水果甜车厘子山东大红灯樱桃现摘现发现货顺丰包邮', '180', '2018-05-08 16:13', '0', '车厘子/樱桃', '62.27', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10096', '中国车厘子', '64.71', '65.40', '中国大陆', '10096', '5', '100', '0', '山东烟台大樱桃新鲜水果孕妇水果非进口车厘子2斤送一斤共3斤美早', '180', '2018-05-08 16:13', '0', '车厘子/樱桃', '42.48', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10097', '中国车厘子', '73.31', '76.94', '中国大陆', '10097', '5', '100', '0', '山东烟台美早樱桃400g7g以上/个 新鲜水果 樱桃 美早樱桃', '180', '2018-05-08 16:13', '0', '车厘子/樱桃', '41.08', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10098', '烟台市车厘子', '79.03', '79.61', '山东省烟台市', '10098', '5', '100', '0', '现摘现发山东烟台大樱桃车厘子车里子樱桃新鲜水果现货空运包邮', '180', '2018-05-08 16:13', '0', '车厘子/樱桃', '52.76', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10099', '烟台市车厘子', '54.71', '56.67', '山东省烟台市', '10099', '5', '100', '0', '山东烟台美早大樱桃新鲜现摘水果包邮4斤非进口车厘子车里子5', '180', '2018-05-08 16:13', '0', '车厘子/樱桃', '43.46', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10100', '烟台市车厘子', '69.29', '79.98', '山东省烟台市', '10100', '5', '100', '0', '山东烟台大樱桃新鲜车厘子现摘现发包邮国产美早现货批发当季水果', '180', '2018-05-08 16:13', '0', '车厘子/樱桃', '46.46', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10101', '烟台市车厘子', '74.87', '75.47', '山东省烟台市', '10101', '5', '100', '0', '车厘子山东烟台大樱桃10樱桃新鲜 5孕妇3斤现摘现发水果包邮顺丰', '180', '2018-05-08 16:13', '0', '车厘子/樱桃', '44.89', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10102', '烟台市车厘子', '65.80', '74.03', '山东省烟台市', '10102', '5', '100', '0', '烟台大樱桃美早5山东车厘子新鲜水果现摘现发非智利2斤现货包邮3J', '180', '2018-05-08 16:13', '0', '车厘子/樱桃', '54.43', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10103', '烟台市车厘子', '52.16', '74.76', '山东省烟台市', '10103', '5', '100', '0', '王小二 烟台大樱桃 新鲜水果批发包邮美早车厘子 车里子', '180', '2018-05-08 16:13', '0', '车厘子/樱桃', '43.39', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10104', '大连市车厘子', '51.77', '59.38', '辽宁省大连市', '10104', '5', '100', '0', '现摘现发大连美早大樱桃车厘子5新鲜孕妇水果国产车里子包邮2斤', '180', '2018-05-08 16:13', '0', '车厘子/樱桃', '40.31', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10105', '烟台市车厘子', '68.70', '76.64', '山东省烟台市', '10105', '1', '100', '0', '现摘现发山东烟台大樱桃新鲜车厘子新鲜孕妇水果5斤包邮', '180', '2018-05-08 16:13', '0', '车厘子/樱桃', '50.24', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10106', '烟台市车厘子', '67.41', '76.72', '山东省烟台市', '10106', '5', '100', '0', '美早车厘子山东烟台大樱桃5殷桃车里子10新鲜水果3斤包邮现摘现发', '180', '2018-05-08 16:13', '0', '车厘子/樱桃', '45.90', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10107', '烟台市车厘子', '46.12', '68.45', '山东省烟台市', '10107', '5', '100', '0', '烟台大樱桃新鲜水果车厘子山东美早樱桃现货2斤现摘现发顺丰包邮', '180', '2018-05-08 16:13', '0', '车厘子/樱桃', '44.50', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10108', '烟台市车厘子', '73.13', '73.46', '山东省烟台市', '10108', '5', '100', '0', '【32mm以上果径】正宗山东烟台大樱桃新鲜水果美早车厘子顺丰包邮', '180', '2018-05-08 16:13', '0', '车厘子/樱桃', '53.01', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10109', '烟台市车厘子', '68.73', '74.77', '山东省烟台市', '10109', '5', '100', '0', '现摘现发山东有机大樱桃车厘子5车里子10新鲜水果送1斤发3斤包邮', '180', '2018-05-08 16:13', '0', '车厘子/樱桃', '64.74', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10110', '烟台市车厘子', '56.35', '64.96', '山东省烟台市', '10110', '5', '100', '0', '山东烟台车厘子大樱桃新鲜5斤现摘现发孕妇水果包邮美2非大连10早', '180', '2018-05-08 16:13', '0', '车厘子/樱桃', '52.67', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10111', '烟台市车厘子', '67.93', '76.00', '山东省烟台市', '10111', '5', '100', '0', '现摘现发5山东烟台大樱桃车厘子4孕妇新鲜水果10大连樱桃3斤包邮', '180', '2018-05-08 16:13', '0', '车厘子/樱桃', '51.47', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10112', '烟台市车厘子', '52.72', '67.83', '山东省烟台市', '10112', '5', '100', '0', '山东大樱桃3烟台车里子5斤孕妇现摘现发车厘子殷桃新鲜10水果包邮', '180', '2018-05-08 16:13', '0', '车厘子/樱桃', '41.38', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10113', '烟台市车厘子', '42.65', '70.42', '山东省烟台市', '10113', '5', '100', '0', '现摘现发 山东烟台大樱桃车厘子黄蜜水晶5小樱桃新鲜水果送1发3斤', '180', '2018-05-08 16:13', '0', '车厘子/樱桃', '41.22', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10114', '烟台市车厘子', '55.27', '76.37', '山东省烟台市', '10114', '3', '100', '0', '车厘子 樱桃新鲜 10现摘现发先锋山东烟台大樱桃5 斤水果包邮顺丰', '180', '2018-05-08 16:13', '0', '车厘子/樱桃', '51.59', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10115', '烟台市车厘子', '55.49', '65.35', '山东省烟台市', '10115', '5', '100', '0', '山东烟台大樱桃现摘现发车厘子美早5斤孕妇3新鲜水果批发顺丰包邮', '180', '2018-05-08 16:13', '0', '车厘子/樱桃', '55.31', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10116', '烟台市车厘子', '65.61', '78.56', '山东省烟台市', '10116', '5', '100', '0', '圣春秋 烟台大樱桃车厘子新鲜水果批发包邮10山东5顺丰实发3斤', '180', '2018-05-08 16:13', '0', '车厘子/樱桃', '40.20', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10117', '中国牛油果', '51.05', '65.85', '中国大陆', '10117', '4', '100', '0', '【第2件1元】墨西哥牛油果5个 鳄梨辅食9新鲜进口水果批发包邮 10', '180', '2018-05-08 16:13', '0', '牛油果', '46.94', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10118', '中国牛油果', '78.54', '79.08', '中国大陆', '10118', '5', '100', '0', '墨西哥牛油果新鲜进口鳄梨水果森林奶油果宝宝辅食【买一送一】', '180', '2018-05-08 16:13', '0', '牛油果', '58.13', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10119', '中国牛油果', '41.55', '51.11', '中国大陆', '10119', '2', '100', '0', '墨西哥牛油果8个鳄梨新鲜进口水果包邮宝宝辅食', '180', '2018-05-08 16:13', '0', '牛油果', '40.61', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10120', '中国牛油果', '79.72', '79.80', '中国大陆', '10120', '5', '100', '0', '墨西哥进口牛油果 水果新鲜巨无霸8个装鳄梨宝宝辅食批发包邮', '180', '2018-05-08 16:13', '0', '牛油果', '60.43', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10121', '中国牛油果', '72.71', '78.51', '中国大陆', '10121', '5', '100', '0', '【Dole都乐】墨西哥绿巨人牛油果6只 新鲜水果鳄梨单果约120', '180', '2018-05-08 16:13', '0', '牛油果', '52.94', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10122', '中国牛油果', '55.69', '76.56', '中国大陆', '10122', '5', '100', '0', 'SunMoon正熟墨西哥即食牛油果4个130g以上/个鳄梨 水果', '180', '2018-05-08 16:13', '0', '牛油果', '49.56', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10123', '中国牛油果', '51.21', '77.47', '中国大陆', '10123', '5', '100', '0', '树果悦浓 墨西哥进口牛油果水果新鲜鳄梨宝宝辅食4个装包邮', '180', '2018-05-08 16:13', '0', '牛油果', '40.68', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10124', '中国牛油果', '79.79', '79.88', '中国大陆', '10124', '5', '100', '0', '墨西哥巨无霸牛油果进口鳄梨油梨8颗装200', '180', '2018-05-08 16:13', '0', '牛油果', '55.58', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10125', '中国牛油果', '59.33', '70.03', '中国大陆', '10125', '5', '100', '0', '树果悦浓 墨西哥进口牛油果水果新鲜鳄梨包邮宝宝辅食8个装', '180', '2018-05-08 16:14', '0', '牛油果', '55.54', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10126', '中国牛油果', '68.02', '72.87', '中国大陆', '10126', '5', '100', '0', '墨西哥进口牛油果 新鲜水果大果巨无霸鳄梨5个装包邮单果200', '180', '2018-05-08 16:14', '0', '牛油果', '59.16', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10127', '中国牛油果', '46.66', '73.50', '中国大陆', '10127', '5', '100', '0', '树果悦浓  墨西哥进口牛油果水果新鲜鳄梨包邮6个装宝宝辅食', '180', '2018-05-08 16:14', '0', '牛油果', '44.89', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10128', '中国牛油果', '48.01', '57.84', '中国大陆', '10128', '5', '100', '0', '新鲜牛油果智利牛油果4粒鳄梨单果140', '180', '2018-05-08 16:14', '0', '牛油果', '47.92', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10129', '中国牛油果', '59.46', '70.81', '中国大陆', '10129', '5', '100', '0', '【买1送1 共发8个】yqyq墨西哥牛油果新鲜牛油果进口水果鳄梨酪梨', '180', '2018-05-08 16:14', '0', '牛油果', '57.90', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10130', '中国牛油果', '58.18', '78.75', '中国大陆', '10130', '5', '100', '0', '墨西哥进口巨无霸牛油果大果鳄梨单果170', '180', '2018-05-08 16:14', '0', '牛油果', '41.36', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10131', '中国牛油果', '49.06', '61.96', '中国大陆', '10131', '5', '100', '0', '墨西哥森林牛油果 5个装 单果130', '180', '2018-05-08 16:14', '0', '牛油果', '47.29', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10132', '中国牛油果', '55.27', '58.71', '中国大陆', '10132', '2', '100', '0', '新鲜牛油果 鳄梨10个 进口水果', '180', '2018-05-08 16:14', '0', '牛油果', '50.42', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10133', '中国牛油果', '72.00', '73.13', '中国大陆', '10133', '5', '100', '0', '新季墨西哥牛油果 鳄梨 8个装 新鲜水果包邮', '180', '2018-05-08 16:14', '0', '牛油果', '69.19', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10134', '中国牛油果', '45.56', '65.33', '中国大陆', '10134', '5', '100', '0', '【苏洪鲜食】进口牛油果水果新鲜鳄梨6个墨西哥或智利随机', '180', '2018-05-08 16:14', '0', '牛油果', '43.58', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10135', '中国牛油果', '50.31', '60.64', '中国大陆', '10135', '3', '100', '0', '品赞 墨西哥牛油果9个 单果130', '180', '2018-05-08 16:14', '0', '牛油果', '43.54', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10136', '中国牛油果', '50.02', '63.44', '中国大陆', '10136', '5', '100', '0', 'SunMoon新鲜墨西哥牛油果6个装130', '180', '2018-05-08 16:14', '0', '牛油果', '41.79', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10137', '中国牛油果', '63.41', '71.28', '中国大陆', '10137', '3', '100', '0', '品赞 墨西哥牛油果5个 巨无霸单果200以上 鳄梨 新鲜进口水果包邮', '180', '2018-05-08 16:14', '0', '牛油果', '56.93', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10138', '中国牛油果', '46.20', '69.96', '中国大陆', '10138', '5', '100', '0', '【猪玛水果】墨西哥牛油果9个 进口鳄梨新鲜酪梨宝宝辅食水果包邮', '180', '2018-05-08 16:14', '0', '牛油果', '41.44', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10139', '中国牛油果', '73.12', '78.05', '中国大陆', '10139', '5', '100', '0', '【买一送一 共发6个】yqyq墨西哥哈斯牛油果新鲜进口鳄梨牛油果', '180', '2018-05-08 16:14', '0', '牛油果', '49.14', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10140', '中国牛油果', '77.53', '78.06', '中国大陆', '10140', '4', '100', '0', '进口牛油果6个装大果鳄梨酪梨孕妇宝宝水果辅食新鲜非墨西哥', '180', '2018-05-08 16:14', '0', '牛油果', '74.25', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10141', '中国牛油果', '42.57', '62.49', '中国大陆', '10141', '5', '100', '0', 'SunMoon能量STAR墨西哥牛油果4个装进口新鲜水果鳄梨宝宝辅食', '180', '2018-05-08 16:14', '0', '牛油果', '40.52', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10142', '中国牛油果', '59.28', '64.88', '中国大陆', '10142', '5', '100', '0', '【丘峰宅】墨西哥牛油果5个装超大果进口新鲜水果巨无霸鳄梨包邮', '180', '2018-05-08 16:14', '0', '牛油果', '50.54', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10143', '中国牛油果', '50.67', '77.40', '中国大陆', '10143', '4', '100', '0', '【第2件1元共发8个】 进口牛油果 水果 新鲜4个装鳄梨宝宝辅食', '180', '2018-05-08 16:14', '0', '牛油果', '47.52', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10144', '中国牛油果', '71.55', '75.93', '中国大陆', '10144', '4', '100', '0', '小饭团李简如_墨西哥进口牛油果6枚 新鲜鳄梨孕妇宝宝辅食水果^@^', '180', '2018-05-08 16:14', '0', '牛油果', '40.54', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10145', '中国牛油果', '47.15', '60.42', '中国大陆', '10145', '5', '100', '0', 'SunMoon能量STAR墨西哥牛油果6个130', '180', '2018-05-08 16:14', '0', '牛油果', '41.36', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10146', '中国牛油果', '76.50', '78.97', '中国大陆', '10146', '5', '100', '0', '【果王佳园】墨西哥进口牛油果6只新鲜绿巨人牛油果鳄梨酪梨新鲜', '180', '2018-05-08 16:14', '0', '牛油果', '62.46', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10147', '中国牛油果', '70.81', '71.29', '中国大陆', '10147', '5', '100', '0', '墨西哥进口牛油果6个装鳄梨 新鲜水果中果批发包邮单果约120', '180', '2018-05-08 16:14', '0', '牛油果', '63.68', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10148', '中国牛油果', '68.21', '78.08', '中国大陆', '10148', '5', '100', '0', '牛油果水果新鲜8个装鳄梨墨西哥10进口宝宝辅食孕妇9批发非缅甸6', '180', '2018-05-08 16:14', '0', '牛油果', '45.71', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10149', '中国牛油果', '44.27', '66.88', '中国大陆', '10149', '5', '100', '0', '【小鲜柚】进口牛油果6只 170', '180', '2018-05-08 16:14', '0', '牛油果', '42.91', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10150', '中国牛油果', '73.50', '77.08', '中国大陆', '10150', '5', '100', '0', '【猪玛水果】墨西哥牛油果 8个装进口新鲜水果酪鳄梨包邮', '180', '2018-05-08 16:14', '0', '牛油果', '70.07', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10151', '中国牛油果', '63.99', '76.71', '中国大陆', '10151', '5', '100', '0', '墨西哥牛油果2个130', '180', '2018-05-08 16:14', '0', '牛油果', '49.11', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10152', '中国牛油果', '76.09', '79.58', '中国大陆', '10152', '5', '100', '0', '【收藏送1只】 墨西哥牛油果共8个 辅食鳄梨新鲜进口水果包邮', '180', '2018-05-08 16:14', '0', '牛油果', '46.37', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10153', '中国牛油果', '49.33', '62.62', '中国大陆', '10153', '5', '100', '0', 'SunMoon能量star墨西哥牛油果8个装鳄梨进口水果孕妇宝宝辅食', '180', '2018-05-08 16:14', '0', '牛油果', '41.91', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10154', '中国牛油果', '50.26', '67.00', '中国大陆', '10154', '5', '100', '0', '【果透】墨西哥进口牛油果6个装 新鲜进口水果 牛油果 约150g/个', '180', '2018-05-08 16:14', '0', '牛油果', '41.49', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10155', '中国牛油果', '78.99', '79.45', '中国大陆', '10155', '4', '100', '0', '【巨无霸】墨西哥进口牛油果 水果新鲜8个装鳄梨单果均重200', '180', '2018-05-08 16:14', '0', '牛油果', '78.75', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10156', '中国牛油果', '72.48', '75.70', '中国大陆', '10156', '4', '98', '0', '巨无霸墨西哥牛油果鳄梨 新鲜水果8个', '180', '2018-05-08 16:14', '1527058191816', '牛油果', '40.16', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10157', '中国牛油果', '53.47', '56.21', '中国大陆', '10157', '5', '100', '0', 'SunMoon新鲜墨西哥牛油果8个装130', '180', '2018-05-08 16:14', '0', '牛油果', '45.25', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10158', '中国牛油果', '58.05', '69.11', '中国大陆', '10158', '5', '100', '0', '墨西哥牛油果新鲜进口鳄梨水果森林奶油果宝宝辅食 6个装', '180', '2018-05-08 16:14', '1527058193363', '牛油果', '46.84', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10159', '中国牛油果', '60.26', '74.92', '中国大陆', '10159', '2', '100', '0', '墨西哥牛油果 鳄梨 5个装', '180', '2018-05-08 16:14', '0', '牛油果', '46.80', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10160', '中国牛油果', '63.02', '70.75', '中国大陆', '10160', '3', '93', '0', '墨西哥新鲜牛油果 鳄梨 8个装 进口水果', '180', '2018-05-08 16:14', '1527590937606', '牛油果', '41.88', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10161', '中国牛油果', '45.76', '79.53', '中国大陆', '10161', '5', '100', '0', '墨西哥牛油果 鳄梨新鲜水果10个装 包邮', '180', '2018-05-08 16:14', '0', '牛油果', '43.09', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10162', '中国牛油果', '69.47', '72.07', '中国大陆', '10162', '5', '100', '0', '久迎人气墨西哥包装水果新鲜奶油森林鳄梨进口牛油果 6个', '180', '2018-05-08 16:14', '0', '牛油果', '44.62', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10163', '中国牛油果', '72.53', '79.27', '中国大陆', '10163', '5', '100', '0', '久迎 墨西哥6个装牛油果新鲜进口鳄梨水果森林奶油果 新鲜水果', '180', '2018-05-08 16:14', '0', '牛油果', '56.88', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10164', '中国牛油果', '60.89', '78.15', '中国大陆', '10164', '5', '100', '0', '墨西哥牛油果 鳄梨 10个装 新鲜水果', '180', '2018-05-08 16:14', '0', '牛油果', '60.84', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10165', '中国牛油果', '74.00', '79.70', '中国大陆', '10165', '5', '100', '0', '墨西哥智利进口牛油果巨无霸6个大果新鲜水果鳄梨孕妇宝宝辅食', '180', '2018-05-08 16:14', '0', '牛油果', '56.84', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10166', '中国牛油果', '55.42', '75.32', '中国大陆', '10166', '5', '100', '0', 'SunMoon能量STAR墨西哥牛油果6个130', '180', '2018-05-08 16:14', '0', '牛油果', '52.94', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10167', '中国牛油果', '45.31', '65.16', '中国大陆', '10167', '5', '100', '0', '第二件33元墨西哥牛油果5颗大果新鲜孕妇水果包邮宝宝辅食', '180', '2018-05-08 16:14', '0', '牛油果', '40.06', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10168', '中国牛油果', '69.51', '71.18', '中国大陆', '10168', '5', '100', '0', '墨西哥特大牛油果 鳄梨 新鲜水果5个装包邮', '180', '2018-05-08 16:14', '0', '牛油果', '52.86', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10169', '中国牛油果', '74.38', '77.61', '中国大陆', '10169', '5', '93', '0', '进口牛油果2个总重约350g', '180', '2018-05-08 16:14', '1526644707892', '牛油果', '73.72', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10170', '中国牛油果', '55.13', '61.67', '中国大陆', '10170', '5', '100', '0', '【yqyq】墨西哥HASS牛油果4个装进口牛油果新鲜鳄梨酪梨', '180', '2018-05-08 16:14', '0', '牛油果', '41.46', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10171', '中国牛油果', '79.15', '79.38', '中国大陆', '10171', '5', '100', '0', '【新果现货】墨西哥进口牛油果 5个装鳄梨 牛油果水果 新鲜水果', '180', '2018-05-08 16:14', '0', '牛油果', '51.08', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10172', '中国牛油果', '56.38', '66.73', '中国大陆', '10172', '4', '100', '0', '歌慕 墨西哥进口牛油果 新鲜水果鳄梨包邮代餐宝宝辅食 大果包熟', '180', '2018-05-08 16:14', '0', '牛油果', '41.57', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10173', '中国牛油果', '66.28', '78.27', '中国大陆', '10173', '5', '100', '0', '满69减20SunMoon能量STAR墨西哥牛油果4个130', '180', '2018-05-08 16:15', '0', '牛油果', '40.67', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10174', '中国牛油果', '58.97', '79.23', '中国大陆', '10174', '5', '100', '0', '墨西哥牛油果 鳄梨 新鲜水果5个装包邮', '180', '2018-05-08 16:15', '0', '牛油果', '42.25', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10175', '中国牛油果', '62.24', '63.03', '中国大陆', '10175', '5', '100', '0', '丘峰宅进口牛油果水果新鲜5个装鳄梨宝宝辅食 第二份1元共发10个', '180', '2018-05-08 16:15', '0', '牛油果', '62.23', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10176', '中国牛油果', '46.97', '57.58', '中国大陆', '10176', '3', '100', '0', '现货墨西哥牛油果8个单果170', '180', '2018-05-08 16:15', '0', '牛油果', '42.56', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10177', '中国苹果', '47.99', '50.56', '中国大陆', '10177', '5', '100', '0', '美国爱妃苹果4个190g以上/个 新鲜水果 进口苹果 ENVY 美国爱妃', '180', '2018-05-08 16:15', '0', '苹果', '41.41', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10178', '中国苹果', '45.75', '60.72', '中国大陆', '10178', '5', '100', '0', '新西兰Jazz爵士苹果12个150g以上/个  新鲜水果  苹果  进口水果', '180', '2018-05-08 16:15', '0', '苹果', '40.14', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10179', '渭南市苹果', '51.32', '53.40', '陕西省渭南市', '10179', '5', '100', '0', '新鲜当季苹果水果现摘陕西红富士丑苹果一整箱批发包邮8斤', '180', '2018-05-08 16:15', '0', '苹果', '43.94', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10180', '延安市苹果', '71.83', '79.83', '陕西省延安市', '10180', '5', '100', '0', '陕西洛川苹果红富士苹果水果 40枚75送礼礼盒新鲜水果苹果包邮', '180', '2018-05-08 16:15', '0', '苹果', '42.91', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10181', '烟台市苹果', '57.17', '58.80', '山东省烟台市', '10181', '5', '100', '0', '黄金帅黄元帅黄香蕉粉面苹果烟台苹果新鲜水果栖霞红富士10斤包邮', '180', '2018-05-08 16:15', '0', '苹果', '50.46', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10182', '徐州市苹果', '75.69', '79.25', '江苏省徐州市', '10182', '5', '100', '0', '冰糖心苹果水果批发包邮 当季新鲜水果丑萍果红富士非阿克苏', '180', '2018-05-08 16:15', '0', '苹果', '47.93', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10183', '烟台市苹果', '75.04', '77.45', '山东省烟台市', '10183', '5', '100', '0', '山东特产烟台苹果新鲜红富士第二份0.1元共10斤包邮脆甜水果现货', '180', '2018-05-08 16:15', '0', '苹果', '73.52', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10184', '中国苹果', '63.58', '76.24', '中国大陆', '10184', '5', '100', '0', '山东烟台红富士苹果3个果径75mm以上 新鲜水果 国产红富士', '180', '2018-05-08 16:15', '0', '苹果', '53.80', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10185', '阿克苏地区苹果', '46.73', '48.70', '新疆维吾尔族自治区阿克苏地区', '10185', '5', '100', '0', '【甘福园】新疆阿克苏冰糖心苹果10斤新鲜水果脆甜多汁大苹果包邮', '180', '2018-05-08 16:15', '0', '苹果', '44.10', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10186', '咸阳市苹果', '42.13', '66.31', '陕西省咸阳市', '10186', '5', '100', '0', '尧坝新鲜苹果水果陕西红富士苹果农家无蜡批发10斤24个左右', '180', '2018-05-08 16:15', '0', '苹果', '40.45', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10187', '烟台市苹果', '63.31', '67.92', '山东省烟台市', '10187', '5', '100', '0', '金帅烟台苹果黄金帅粉苹果面黄元帅新鲜水果红富士平果5斤包邮', '180', '2018-05-08 16:15', '0', '苹果', '51.62', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10188', '中国苹果', '57.14', '69.09', '中国大陆', '10188', '5', '100', '0', '陕西洛川精品红富士6个果径80mm以上/个 苹果 富士苹果 洛川苹果', '180', '2018-05-08 16:15', '0', '苹果', '55.45', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10189', '延安市苹果', '72.52', '78.37', '陕西省延安市', '10189', '5', '100', '0', '陕西拉丝苹果水果新鲜无蜡当季延安红富士10斤包邮脆甜整一箱批发', '180', '2018-05-08 16:15', '0', '苹果', '62.07', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10190', '渭南市苹果', '62.16', '77.41', '陕西省渭南市', '10190', '5', '100', '0', '冰糖心苹果新鲜水果陕西正宗非新疆阿克苏烟台栖霞红富士8斤', '180', '2018-05-08 16:15', '0', '苹果', '60.39', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10191', '徐州市苹果', '77.69', '78.47', '江苏省徐州市', '10191', '5', '100', '0', '农果香约', '180', '2018-05-08 16:15', '0', '苹果', '77.46', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10192', '天水市苹果', '48.44', '75.88', '甘肃省天水市', '10192', '5', '100', '0', '甘肃天水花牛苹果新鲜水果红蛇果5斤包邮礼县粉面刮泥买2份发10斤', '180', '2018-05-08 16:15', '0', '苹果', '43.28', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10193', '西安市苹果', '60.63', '71.59', '陕西省西安市', '10193', '5', '100', '0', '【爱心助农】 陕西礼泉苹果冰糖心红富士时令新鲜水果批发包邮', '180', '2018-05-08 16:15', '0', '苹果', '42.84', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10194', '延安市苹果', '44.36', '45.59', '陕西省延安市', '10194', '5', '100', '0', '陕西红富士苹果水果新鲜洛川苹果当季水果5斤脆甜新鲜水果苹果甜', '180', '2018-05-08 16:15', '0', '苹果', '40.22', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10195', '徐州市苹果', '57.19', '58.01', '江苏省徐州市', '10195', '5', '100', '0', '冰糖心苹果水果10斤批发包邮 当季新鲜水果丑萍果红富士 整箱现发', '180', '2018-05-08 16:15', '0', '苹果', '40.49', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10196', '徐州市苹果', '48.37', '78.23', '江苏省徐州市', '10196', '5', '100', '0', '新鲜苹果水果10斤当季红富士批发包邮大沙河冰糖心一整箱吃的苹果', '180', '2018-05-08 16:15', '0', '苹果', '43.67', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10197', '天水市苹果', '77.45', '78.53', '甘肃省天水市', '10197', '5', '100', '0', '花牛苹果水果新鲜蛇果红苹果老人吃宝宝刮泥吃粉面苹果5斤7~12个', '180', '2018-05-08 16:15', '0', '苹果', '73.24', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10198', '徐州市苹果', '67.13', '76.07', '江苏省徐州市', '10198', '4', '100', '0', '冰糖心苹果水果批发10斤包邮 当季新鲜水果丑萍果红富士', '180', '2018-05-08 16:15', '0', '苹果', '47.05', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10199', '延安市苹果', '65.50', '79.27', '陕西省延安市', '10199', '5', '100', '0', '买一送一冰糖心苹果水果新鲜正宗陕西红富士10斤批发非阿克苏栖霞', '180', '2018-05-08 16:15', '0', '苹果', '59.42', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10200', '中国苹果', '64.41', '68.30', '中国大陆', '10200', '5', '100', '0', '甘肃静宁富士苹果4个200g以上/个 脆苹果 新鲜水果 山地苹果', '180', '2018-05-08 16:15', '0', '苹果', '49.03', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10201', '徐州市苹果', '62.00', '76.03', '江苏省徐州市', '10201', '5', '100', '0', '农果香约', '180', '2018-05-08 16:15', '0', '苹果', '46.47', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10202', '天水市苹果', '59.11', '71.67', '甘肃省天水市', '10202', '5', '100', '0', '甘肃天水花牛苹果水果批发包邮新鲜蛇果刮泥当季整箱5斤粉面苹果', '180', '2018-05-08 16:15', '0', '苹果', '46.11', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10203', '渭南市苹果', '44.29', '74.29', '陕西省渭南市', '10203', '5', '100', '0', '新鲜陕西冰糖心苹果红富士丑果当季现摘水果非新疆阿克苏批发包邮', '180', '2018-05-08 16:15', '0', '苹果', '40.14', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10204', '三门峡市苹果', '73.73', '76.96', '河南省三门峡市', '10204', '5', '100', '0', '青苹果水果5斤批发包邮新鲜 当季整箱现摘现发非富士印度青苹果', '180', '2018-05-08 16:15', '0', '苹果', '56.60', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10205', '阿克苏地区苹果', '58.23', '77.22', '新疆维吾尔族自治区阿克苏地区', '10205', '5', '100', '0', '新疆阿克苏冰糖心苹果新鲜水果5斤大果批发包邮脆甜红富士平果', '180', '2018-05-08 16:15', '0', '苹果', '53.81', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10206', '中国苹果', '50.84', '54.97', '中国大陆', '10206', '5', '100', '0', '新西兰嘎啦果6个150g以上/个 新鲜水果 苹果 进口嘎啦果', '180', '2018-05-08 16:15', '0', '苹果', '46.83', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10207', '延安市苹果', '53.02', '70.94', '陕西省延安市', '10207', '5', '100', '0', '【洛川苹果】红富士苹果水果新鲜 当季陕西苹果红富士中果包邮', '180', '2018-05-08 16:15', '0', '苹果', '44.37', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10208', '中国苹果', '67.26', '67.72', '中国大陆', '10208', '5', '100', '0', 'Mr APPLE新西兰皇家嘎啦果2个150g以上/个 新鲜水果 苹果', '180', '2018-05-08 16:15', '0', '苹果', '59.81', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10209', '延安市苹果', '66.97', '67.10', '陕西省延安市', '10209', '5', '100', '0', '陕西洛川苹果水果新鲜红富士40枚中果新鲜水果红富士苹果批发包邮', '180', '2018-05-08 16:15', '0', '苹果', '53.66', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10210', '中国苹果', '71.48', '75.64', '中国大陆', '10210', '5', '100', '0', '智利嘎啦果8个130g以上/个 新鲜水果 苹果 进口嘎啦果', '180', '2018-05-08 16:15', '0', '苹果', '49.00', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10211', '咸阳市苹果', '49.24', '72.09', '陕西省咸阳市', '10211', '5', '100', '0', '陕西红富士冰糖心苹果10斤大果包邮新鲜当季水果丑萍果一整箱批发', '180', '2018-05-08 16:15', '0', '苹果', '44.21', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10212', '中国苹果', '49.41', '61.47', '中国大陆', '10212', '5', '100', '0', '美国红蛇果4个180g以上/个 新鲜水果 苹果', '180', '2018-05-08 16:15', '0', '苹果', '42.89', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10213', '阿克苏地区苹果', '73.55', '77.39', '新疆维吾尔族自治区阿克苏地区', '10213', '5', '100', '0', '新疆阿克苏冰糖心苹果10斤水果批发包邮 新鲜脆甜红富士非邵通', '180', '2018-05-08 16:15', '0', '苹果', '48.57', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10214', '阿克苏地区苹果', '75.31', '78.04', '新疆维吾尔族自治区阿克苏地区', '10214', '5', '100', '0', '新疆阿克苏冰糖心苹果新鲜水果10斤大果批发包邮脆甜红富士平果', '180', '2018-05-08 16:16', '0', '苹果', '56.51', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10215', '中国苹果', '57.21', '79.20', '中国大陆', '10215', '5', '100', '0', '山东栖霞优质红富士12个200g以上/个苹果 新鲜水果', '180', '2018-05-08 16:16', '0', '苹果', '45.47', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10216', '阿克苏地区苹果', '50.78', '56.55', '新疆维吾尔族自治区阿克苏地区', '10216', '5', '100', '0', '【家庭装】新疆阿克苏冰糖心小苹果新鲜水果10斤装脆甜红富士包邮', '180', '2018-05-08 16:16', '0', '苹果', '46.61', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10217', '延安市苹果', '49.06', '62.64', '陕西省延安市', '10217', '5', '100', '0', '【高塬农】洛川苹果新鲜糖心陕西农家红富士苹果水果10斤包邮批发', '180', '2018-05-08 16:16', '0', '苹果', '44.84', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10218', '中国苹果', '55.36', '64.43', '中国大陆', '10218', '5', '100', '0', '美国红蛇果2个约180g/个', '180', '2018-05-08 16:16', '0', '苹果', '44.85', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10219', '烟台市苹果', '62.18', '63.23', '山东省烟台市', '10219', '5', '100', '0', '甜嘴猴 烟台红富士新鲜苹果水果山东农家特产脆甜苹果吃的苹果', '180', '2018-05-08 16:16', '0', '苹果', '52.34', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10220', '烟台市苹果', '65.07', '71.83', '山东省烟台市', '10220', '5', '100', '0', '烟台苹果山东特产栖霞红富士平果新鲜水果脆甜吃的平果10斤包邮', '180', '2018-05-08 16:16', '0', '苹果', '49.84', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10221', '延安市苹果', '46.17', '73.54', '陕西省延安市', '10221', '5', '100', '0', '陕西洛川苹果红富士苹果水果 新鲜水果40枚大果陕西苹果批发包邮', '180', '2018-05-08 16:16', '0', '苹果', '44.40', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10222', '烟台市苹果', '78.62', '79.16', '山东省烟台市', '10222', '5', '100', '0', '新鲜苹果水果山东烟台红富士苹果批发一整箱平果5斤包邮吃的萍果', '180', '2018-05-08 16:16', '0', '苹果', '46.72', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10223', '徐州市苹果', '79.66', '79.78', '江苏省徐州市', '10223', '5', '100', '0', '冰糖心苹果水果10斤红富士新鲜当季现发批发包邮一整箱吃的丑萍果', '180', '2018-05-08 16:16', '0', '苹果', '51.78', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10224', '中国苹果', '50.99', '67.76', '中国大陆', '10224', '5', '100', '0', '山东蓬莱精品红富士4个果径80mm以上 苹果 新鲜水果', '180', '2018-05-08 16:16', '0', '苹果', '50.18', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10225', '中国苹果', '61.72', '66.26', '中国大陆', '10225', '5', '100', '0', '美国红蛇果12个180g以上/个 新鲜水果 苹果', '180', '2018-05-08 16:16', '0', '苹果', '45.10', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10226', '中国苹果', '50.14', '74.95', '中国大陆', '10226', '5', '100', '0', '甘肃黄蕉苹果6个果径75', '180', '2018-05-08 16:16', '0', '苹果', '46.25', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10227', '中国苹果', '78.19', '78.84', '中国大陆', '10227', '5', '100', '0', 'MrAPPLE新西兰皇家嘎啦果6个150g以上/个 新鲜水果 苹果', '180', '2018-05-08 16:16', '0', '苹果', '53.76', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10228', '中国苹果', '47.09', '56.78', '中国大陆', '10228', '5', '100', '0', '美国青苹果4个135g以上/个 脆苹果 色拉 新鲜水果', '180', '2018-05-08 16:16', '0', '苹果', '45.98', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10229', '中国苹果', '76.80', '78.25', '中国大陆', '10229', '5', '100', '0', '满69减20山东栖霞优质红富士8个果径80mm以上 苹果 新鲜苹果 水果', '180', '2018-05-08 16:16', '0', '苹果', '58.15', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10230', '天水市苹果', '54.20', '74.99', '甘肃省天水市', '10230', '4', '100', '0', '花牛苹果新鲜水果红蛇果10斤批发包邮甘肃礼县天水粉面刮泥苹安果', '180', '2018-05-08 16:16', '0', '苹果', '52.48', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10231', '烟台市苹果', '55.82', '67.67', '山东省烟台市', '10231', '5', '100', '0', '王小二 山东烟台苹果水果批发包邮当季新鲜萍平果吃的栖霞红富士', '180', '2018-05-08 16:16', '0', '苹果', '40.21', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10232', '烟台市苹果', '63.21', '69.90', '山东省烟台市', '10232', '5', '100', '0', '喜人喜新鲜牛奶黄金苹果水果山东烟台苹果红富士5斤包邮奶油富士', '180', '2018-05-08 16:16', '0', '苹果', '47.69', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10233', '烟台市苹果', '65.02', '76.05', '山东省烟台市', '10233', '5', '100', '0', '王小二 山东烟台苹果水果新鲜批发包邮当季应季时令平果萍果丑果', '180', '2018-05-08 16:16', '0', '苹果', '46.84', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10234', '烟台市苹果', '56.30', '70.40', '山东省烟台市', '10234', '5', '100', '0', '山东烟台栖霞红富士苹果水果吃的新鲜苹果5斤包邮糖心胜阿克苏', '180', '2018-05-08 16:16', '0', '苹果', '43.64', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10235', '烟台市苹果', '42.29', '78.35', '山东省烟台市', '10235', '5', '100', '0', '山东烟台红富士苹果水果批发包邮 当季新鲜水果丑萍果非阿克苏', '180', '2018-05-08 16:16', '0', '苹果', '41.58', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10236', '烟台市苹果', '79.08', '79.49', '山东省烟台市', '10236', '5', '100', '0', '王小二 山东烟台苹果新鲜水果批发包邮当季当季采摘平果吃的萍果', '180', '2018-05-08 16:16', '0', '苹果', '76.57', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10237', '怀化市橙子', '48.91', '69.49', '湖南省怀化市', '10237', '5', '100', '0', '橙子现货新鲜水果麻阳冰糖橙10斤批发包邮精选果超甜比赣南脐橙甜', '180', '2018-05-08 16:16', '0', '橙子', '41.95', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10238', '中国橙子', '44.88', '71.68', '中国大陆', '10238', '5', '100', '0', '美国进口新奇士橙12个 黑标4013 新鲜水果脐橙甜橙子晚熟美橙晚橙', '180', '2018-05-08 16:16', '0', '橙子', '44.27', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10239', '怀化市橙子', '42.44', '42.60', '湖南省怀化市', '10239', '5', '100', '0', '麻阳冰糖橙正宗新鲜水果非爱媛永兴橙子褚橙赣南脐橙带箱10斤包邮', '180', '2018-05-08 16:16', '0', '橙子', '40.74', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10240', '宜昌市橙子', '56.10', '58.04', '湖北省宜昌市', '10240', '5', '100', '0', '秭归红肉血橙脐橙手剥橙子非赣南红心橙水果批发包邮新鲜当季整箱', '180', '2018-05-08 16:16', '0', '橙子', '40.65', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10241', '怀化市橙子', '69.35', '70.02', '湖南省怀化市', '10241', '5', '100', '0', '麻阳冰糖橙10斤包邮手拨薄皮橙子新鲜当季水果批发手剥橙脐橙甜橙', '180', '2018-05-08 16:16', '0', '橙子', '61.91', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10242', '中国橙子', '75.70', '77.32', '中国大陆', '10242', '5', '100', '0', '四川不知火丑橘1盒(400g/盒)', '180', '2018-05-08 16:16', '0', '橙子', '41.38', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10243', '中国橙子', '44.61', '57.51', '中国大陆', '10243', '5', '100', '0', '西班牙脐橙2个180g以上/个', '180', '2018-05-08 16:16', '0', '橙子', '41.91', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10244', '宜昌市橙子', '70.10', '71.01', '湖北省宜昌市', '10244', '5', '100', '0', '湖北秭归伦晚脐橙当季时令新鲜水果现摘现发孕妇大橙子大果5斤包', '180', '2018-05-08 16:16', '0', '橙子', '46.81', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10245', '宜昌市橙子', '75.83', '77.75', '湖北省宜昌市', '10245', '5', '100', '0', '秭归橙子伦晚脐橙现摘当季新鲜水果中果带箱9斤甜橙非赣南冰糖橙', '180', '2018-05-08 16:16', '0', '橙子', '54.28', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10246', '怀化市橙子', '70.28', '74.57', '湖南省怀化市', '10246', '5', '100', '0', '甜心脐橙 橙子新鲜水果包邮10斤带箱批发当季非赣南秭归脐橙夏橙', '180', '2018-05-08 16:16', '0', '橙子', '48.29', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10247', '中国橙子', '70.85', '76.85', '中国大陆', '10247', '5', '100', '0', '满69减20新奇士美国晚季脐橙6个190g以上/个 脐橙 橙子 进口水果', '180', '2018-05-08 16:16', '0', '橙子', '62.71', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10248', '中国橙子', '55.52', '64.20', '中国大陆', '10248', '5', '100', '0', '广西沃柑1盒(500g/盒)', '180', '2018-05-08 16:16', '0', '橙子', '53.19', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10249', '中国橙子', '50.77', '61.81', '中国大陆', '10249', '5', '100', '0', '重庆脐橙新鲜水果橙子现摘批发 非赣南脐橙麻阳冰糖橙血橙2件10斤', '180', '2018-05-08 16:16', '0', '橙子', '50.37', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10250', '成都市橙子', '52.03', '62.62', '四川省成都市', '10250', '4', '100', '0', '现摘现发血橙橙子批发当季新鲜水果非奉节赣南脐橙拍2件发10斤', '180', '2018-05-08 16:16', '0', '橙子', '43.11', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10251', '宜昌市橙子', '40.68', '42.99', '湖北省宜昌市', '10251', '5', '100', '0', '秭归伦晚脐橙 橙子新鲜当季水果批发包邮甜橙手剥春橙 拍2件10斤', '180', '2018-05-08 16:16', '0', '橙子', '40.12', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10252', '宜昌市橙子', '60.22', '71.32', '湖北省宜昌市', '10252', '5', '100', '0', '秭归伦晚脐橙现摘现发橙子新鲜水果包邮批发当季甜橙非赣南冰糖橙', '180', '2018-05-08 16:16', '0', '橙子', '46.99', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10253', '中国橙子', '65.02', '65.40', '中国大陆', '10253', '5', '100', '0', '新奇士美国CaraCara红心脐橙4个160g以上/个 新鲜水果 红心脐橙', '180', '2018-05-08 16:16', '0', '橙子', '54.71', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10254', '宜昌市橙子', '71.45', '79.24', '湖北省宜昌市', '10254', '5', '100', '0', '伦晚脐橙湖北秭归当季新鲜水果橙子5斤包邮春夏橙晚橙拍两件10斤', '180', '2018-05-08 16:16', '0', '橙子', '56.22', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10255', '中国橙子', '44.04', '55.95', '中国大陆', '10255', '5', '100', '0', '美国新奇士黑标脐橙 12个进口橙子新鲜水果甜橙晚熟橙sunkist4013', '180', '2018-05-08 16:16', '0', '橙子', '42.92', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10256', '中国橙子', '63.92', '78.19', '中国大陆', '10256', '5', '100', '0', '【果美妙】美国新奇士脐橙sunkist黑标4012大果5斤装橙子纯甜脐橙', '180', '2018-05-08 16:16', '0', '橙子', '49.30', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10257', '宜昌市橙子', '52.19', '73.39', '湖北省宜昌市', '10257', '5', '100', '0', '你点湖北秭归伦晚脐橙新鲜水果现摘现发孕妇水果榨汁橙子买一送一', '180', '2018-05-08 16:16', '0', '橙子', '50.35', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10258', '宜昌市橙子', '45.62', '55.43', '湖北省宜昌市', '10258', '5', '100', '0', '现摘秭归伦晚脐橙 当季水果批发包邮 新鲜 手剥橙子非赣南冰糖橙', '180', '2018-05-08 16:16', '0', '橙子', '44.10', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10259', '宜昌市橙子', '59.95', '70.97', '湖北省宜昌市', '10259', '5', '100', '0', '淘乡甜秭归伦晚脐橙5斤16粒单果重130', '180', '2018-05-08 16:16', '0', '橙子', '58.38', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10260', '宜昌市橙子', '54.04', '58.11', '湖北省宜昌市', '10260', '5', '100', '0', '伦晚脐橙 秭归应季橙子孕妇水果批发包邮新鲜当季整箱非赣南脐橙', '180', '2018-05-08 16:17', '0', '橙子', '40.30', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10261', '中国橙子', '70.98', '78.61', '中国大陆', '10261', '5', '100', '0', '美国新奇士橙10个 大果3107 220g/个 黑标新鲜进口水果甜橙子脐橙', '180', '2018-05-08 16:17', '0', '橙子', '69.48', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10262', '宜昌市橙子', '76.32', '78.05', '湖北省宜昌市', '10262', '5', '100', '0', '【拍2件发5斤】秭归血橙脐橙现摘现发新鲜橙子水果批发包邮', '180', '2018-05-08 16:17', '0', '橙子', '49.43', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10263', '中国橙子', '43.03', '56.24', '中国大陆', '10263', '5', '100', '0', '第二件0元】四川不知火沃柑桔子新鲜水果丑八怪橘子新鲜包邮丑橘', '180', '2018-05-08 16:17', '0', '橙子', '40.21', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10264', '怀化市橙子', '57.24', '77.76', '湖南省怀化市', '10264', '5', '100', '0', '麻阳冰糖橙带箱10斤包邮橙子新鲜正宗当季超甜水果批发手剥拨甜橙', '180', '2018-05-08 16:17', '0', '橙子', '44.46', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10265', '宜昌市橙子', '74.76', '79.54', '湖北省宜昌市', '10265', '5', '100', '0', '血橙秭归红心脐橙子孕妇应季水果批发包邮新鲜当季整箱 拍2件10斤', '180', '2018-05-08 16:17', '0', '橙子', '51.24', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10266', '中国橙子', '78.97', '79.30', '中国大陆', '10266', '5', '100', '0', '新奇士美国晚季脐橙10个190g以上/个 新鲜水果 脐橙 新奇士橙', '180', '2018-05-08 16:17', '0', '橙子', '45.64', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10267', '宜昌市橙子', '43.43', '79.93', '湖北省宜昌市', '10267', '5', '100', '0', '淘乡甜秭归伦晚脐橙5斤12粒新鲜水果甜橘子晚熟春橙甜橙整箱包邮', '180', '2018-05-08 16:17', '0', '橙子', '41.85', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10268', '宜昌市橙子', '78.56', '79.67', '湖北省宜昌市', '10268', '5', '100', '0', '秭归伦晚脐橙10斤 橙子新鲜包邮批发当季水果整箱应季时令甜橙', '180', '2018-05-08 16:17', '0', '橙子', '47.62', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10269', '成都市橙子', '74.59', '78.18', '四川省成都市', '10269', '5', '100', '0', '现摘现发四川新鲜橙子血橙香甜橙水果非赣南橘子砂糖桔2件约10斤', '180', '2018-05-08 16:17', '0', '橙子', '61.93', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10270', '中国橙子', '44.76', '52.29', '中国大陆', '10270', '5', '100', '0', '埃及橙2个180g以上/个', '180', '2018-05-08 16:17', '0', '橙子', '42.95', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10271', '中国橙子', '76.17', '78.96', '中国大陆', '10271', '5', '100', '0', '世果汇奉节脐橙现摘橙子甜橙时令春橙新鲜水果批发包邮非江西赣南', '180', '2018-05-08 16:17', '0', '橙子', '66.35', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10272', '宜昌市橙子', '64.98', '73.83', '湖北省宜昌市', '10272', '5', '100', '0', '誉福天下 湖北秭归伦晚脐橙 新鲜水果橙子甜橙手剥橙', '180', '2018-05-08 16:17', '0', '橙子', '41.77', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10273', '宜昌市橙子', '66.38', '72.86', '湖北省宜昌市', '10273', '5', '100', '0', '秭归伦晚脐橙手剥橙甜橙子新鲜水果包邮10斤批发非赣南脐橙冰糖橙', '180', '2018-05-08 16:17', '0', '橙子', '54.45', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10274', '中国橙子', '54.75', '67.36', '中国大陆', '10274', '5', '100', '0', '新奇士美国晚季脐橙12个190g以上/个 新鲜水果 脐橙 新奇士橙', '180', '2018-05-08 16:17', '0', '橙子', '45.67', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10275', '中国橙子', '79.02', '79.98', '中国大陆', '10275', '5', '100', '0', '埃及夏橙10个220g以上/个 新鲜水果 橙子 榨汁橙 进口橙', '180', '2018-05-08 16:17', '0', '橙子', '52.21', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10276', '宜昌市橙子', '52.95', '67.09', '湖北省宜昌市', '10276', '5', '100', '0', '买一送一 春橙秭归伦晚脐橙 当季鲜果现摘现发新鲜水果橙子', '180', '2018-05-08 16:17', '0', '橙子', '52.50', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10277', '宜昌市橙子', '59.30', '77.46', '湖北省宜昌市', '10277', '5', '100', '0', '买一送一 湖北秭归伦晚脐橙 新鲜水果橙子甜橙手剥橙 当季鲜橙', '180', '2018-05-08 16:17', '0', '橙子', '55.46', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10278', '中国橙子', '46.17', '54.24', '中国大陆', '10278', '5', '100', '0', '新奇士美国晚季脐橙2个190g以上/个', '180', '2018-05-08 16:17', '0', '橙子', '45.29', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10279', '成都市橙子', '48.46', '71.96', '四川省成都市', '10279', '5', '100', '0', '四川特产丑八怪丑橘水果 整箱10斤包邮批发丑桔不知火丑橘包邮', '180', '2018-05-08 16:17', '0', '橙子', '40.25', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10280', '中国橙子', '61.55', '73.36', '中国大陆', '10280', '5', '100', '0', '【买一送一】 炫果多 埃及进口橙6个 单果190g进口脐橙新鲜甜橙子', '180', '2018-05-08 16:17', '0', '橙子', '43.46', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10281', '中国橙子', '69.58', '70.85', '中国大陆', '10281', '5', '100', '0', '湖北伦晚脐橙2kg140g以上/个 新鲜水果 橙子 伦晚脐橙 脐橙', '180', '2018-05-08 16:17', '0', '橙子', '62.92', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10282', '中国橙子', '58.09', '74.64', '中国大陆', '10282', '5', '100', '0', '西班牙脐橙15个180g以上/个 新鲜水果 脐橙 橙子 进口 西班牙橙', '180', '2018-05-08 16:17', '0', '橙子', '48.20', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10283', '中国橙子', '66.30', '74.94', '中国大陆', '10283', '5', '100', '0', '满69减20西班牙脐橙10个180g以上/个 新鲜水果进口脐橙 橙子 进口', '180', '2018-05-08 16:17', '0', '橙子', '55.04', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10284', '宜昌市橙子', '47.62', '60.76', '湖北省宜昌市', '10284', '5', '100', '0', '送1斤 甜橙子新鲜水果当季伦晚脐橙秭归夏橙包邮孕妇批发共5斤', '180', '2018-05-08 16:17', '0', '橙子', '43.45', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10285', '宜昌市橙子', '54.02', '70.84', '湖北省宜昌市', '10285', '5', '100', '0', '湖北秭归橙子5斤当季水果新鲜带叶现摘现发甜橙孕妇伦晚脐橙通果', '180', '2018-05-08 16:17', '0', '橙子', '48.02', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10286', '中国橙子', '78.50', '79.49', '中国大陆', '10286', '5', '100', '0', '湖北伦晚脐橙500g140g以上/个', '180', '2018-05-08 16:17', '0', '橙子', '63.60', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10287', '成都市橙子', '42.12', '79.54', '四川省成都市', '10287', '5', '100', '0', '现摘现发橙子血橙新鲜水果批发5斤非赣南脐橙丑柑橘子2件10斤', '180', '2018-05-08 16:17', '0', '橙子', '40.80', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10288', '中国橙子', '72.76', '76.55', '中国大陆', '10288', '5', '100', '0', '新奇士美国脐橙2个200g以上/个', '180', '2018-05-08 16:17', '0', '橙子', '59.86', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10289', '宜昌市橙子', '54.67', '70.87', '湖北省宜昌市', '10289', '5', '100', '0', '秭归橙子新鲜水果当季伦晚脐橙8斤净重大果甜橙非赣南奉节冰糖橙', '180', '2018-05-08 16:17', '0', '橙子', '43.49', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10290', '成都市橙子', '59.46', '64.30', '四川省成都市', '10290', '5', '100', '0', '高山纽荷尔脐橙2.5斤 应季新鲜水果非赣南脐橙冰糖橙【买一送一】', '180', '2018-05-08 16:17', '0', '橙子', '51.15', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10291', '宜昌市橙子', '57.47', '68.06', '湖北省宜昌市', '10291', '5', '100', '0', '伦晚脐橙湖北秭归当季新鲜橙子孕妇水果5斤包邮春夏橙拍两件10斤', '180', '2018-05-08 16:17', '0', '橙子', '47.95', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10292', '中国橙子', '55.96', '77.13', '中国大陆', '10292', '5', '100', '0', '美国新奇士4013黑标脐橙 12个sunkist进口甜橙子新鲜水果手剥橙', '180', '2018-05-08 16:17', '0', '橙子', '49.43', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10293', '中国橙子', '74.25', '79.72', '中国大陆', '10293', '5', '100', '0', '湖北伦晚脐橙1kg140g以上/个 新鲜水果 橙子 伦晚脐橙 脐橙', '180', '2018-05-08 16:17', '0', '橙子', '44.25', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10294', '宜昌市橙子', '56.92', '68.40', '湖北省宜昌市', '10294', '5', '100', '0', '秭归伦晚脐橙 橙子新鲜10斤水果批发包邮当季新鲜甜橙非赣南脐橙', '180', '2018-05-08 16:17', '0', '橙子', '54.66', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10295', '成都市橙子', '41.86', '43.48', '四川省成都市', '10295', '5', '100', '0', '现摘现发脐橙橙子批发当季新鲜水果整箱非赣南冰糖橙拍2件发10斤', '180', '2018-05-08 16:17', '0', '橙子', '40.38', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10296', '宜昌市橙子', '65.49', '73.04', '湖北省宜昌市', '10296', '5', '100', '0', '鲜优甜秭归春橙伦晚脐橙新鲜水果甜橙子当季榨汁手剥橙水果批发', '180', '2018-05-08 16:17', '0', '橙子', '50.92', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10297', '中国山竹', '63.51', '75.74', '中国大陆', '10297', '5', '100', '0', '海南新款包装水果新鲜山竹3斤装 有坏包赔顺丰 空运', '180', '2018-05-08 16:17', '0', '山竹', '43.13', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10298', '三亚市山竹', '44.17', '51.63', '海南省三亚市', '10298', '5', '100', '0', '海南三亚山竹新鲜水果新鲜山竹5斤海南山竹顺丰空运', '180', '2018-05-08 16:17', '0', '山竹', '43.51', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10299', '中国山竹', '42.18', '58.64', '中国大陆', '10299', '4', '100', '0', '缤果沃野 泰国4A山竹10个约2斤新鲜麻竹大果热带应季当季水果5A', '180', '2018-05-08 16:17', '0', '山竹', '41.11', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10300', '昆明市山竹', '47.54', '76.37', '云南省昆明市', '10300', '5', '100', '0', '泰国5A级大果山竹 新鲜时令水果 泰国5A级山竹进口5斤装顺丰包邮', '180', '2018-05-08 16:18', '0', '山竹', '42.99', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10301', '中国山竹', '74.29', '76.31', '中国大陆', '10301', '4', '100', '0', '【叼食】泰国进口5A山竹4斤', '180', '2018-05-08 16:18', '0', '山竹', '62.02', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10302', '中国山竹', '51.44', '70.38', '中国大陆', '10302', '5', '100', '0', '【阳光鲜果】新鲜进口热带水果印尼山竹5斤装水果皇后甜糯包邮', '180', '2018-05-08 16:18', '0', '山竹', '49.78', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10303', '中国山竹', '47.56', '58.37', '中国大陆', '10303', '5', '100', '0', '进口山竹 5斤 新鲜水果 SG', '180', '2018-05-08 16:18', '0', '山竹', '44.92', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10304', '中国山竹', '66.12', '77.48', '中国大陆', '10304', '5', '100', '0', '山竹5斤泰国进口新鲜水果 顺丰空运坏果包赔孕妇营养帝尼协斯生鲜', '180', '2018-05-08 16:18', '0', '山竹', '61.23', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10305', '中国山竹', '52.96', '67.54', '中国大陆', '10305', '4', '100', '0', '【上领顶】泰国进口山竹 5斤装 新鲜进口水果', '180', '2018-05-08 16:18', '0', '山竹', '50.28', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10306', '中国山竹', '65.63', '65.69', '中国大陆', '10306', '5', '100', '0', '泰国山竹1盒(4个/盒)100g以上/个', '180', '2018-05-08 16:18', '0', '山竹', '60.98', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10307', '中国山竹', '66.15', '71.80', '中国大陆', '10307', '5', '100', '0', '泰国进口山竹热带新鲜水果山竹3斤包邮水果', '180', '2018-05-08 16:18', '0', '山竹', '50.04', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10308', '中国山竹', '50.53', '77.40', '中国大陆', '10308', '5', '100', '0', '泰国进口5A山竹 新鲜水果大果当季 5斤装免运费团购空运2件10斤', '180', '2018-05-08 16:18', '0', '山竹', '41.32', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10309', '中国山竹', '76.38', '77.71', '中国大陆', '10309', '5', '100', '0', '泰国进口山竹新鲜5A水果大果当季孕妇5斤装包邮免运费2件10斤', '180', '2018-05-08 16:18', '0', '山竹', '58.99', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10310', '中国山竹', '74.37', '77.97', '中国大陆', '10310', '5', '100', '0', '5斤包邮泰国新鲜水果进口山竹5A级当季时令孕妇水果 2件10斤现货', '180', '2018-05-08 16:18', '0', '山竹', '58.81', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10311', '中国山竹', '43.36', '52.56', '中国大陆', '10311', '5', '100', '0', '【鲜蜂队】泰国进口山竹3A级新鲜热带水果麻竹花竹油竹5斤装包邮', '180', '2018-05-08 16:18', '0', '山竹', '42.36', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10312', '中国山竹', '75.96', '78.17', '中国大陆', '10312', '5', '100', '0', '【新到现货】泰国进口山竹 山竹 新鲜水果 应季降火孕妇水果 5斤', '180', '2018-05-08 16:18', '0', '山竹', '59.86', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10313', '中国山竹', '41.71', '74.83', '中国大陆', '10313', '5', '100', '0', '现货泰国进口5A大果山竹麻油竹 热带水果空运包邮坏果拍照包赔', '180', '2018-05-08 16:18', '0', '山竹', '40.44', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10314', '中国山竹', '70.69', '76.20', '中国大陆', '10314', '4', '100', '0', '【两份减10元】泰国进口山竹大果5斤装 新鲜水果批发团购空运包邮', '180', '2018-05-08 16:18', '0', '山竹', '65.63', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10315', '中国山竹', '75.82', '78.93', '中国大陆', '10315', '5', '100', '0', '源润鲜泰国山竹进口新鲜山竹热带水果麻竹油竹降火水果3斤发顺丰', '180', '2018-05-08 16:18', '0', '山竹', '47.64', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10316', '中国山竹', '50.83', '66.23', '中国大陆', '10316', '5', '100', '0', '顺丰空运泰国进口山竹5斤大果麻竹热带时令新鲜孕妇水果团购批发', '180', '2018-05-08 16:18', '0', '山竹', '47.22', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10317', '中国山竹', '45.84', '55.69', '中国大陆', '10317', '5', '100', '0', '悦之品环球新鲜水果礼盒组合装悦之鲜6450g年货大礼包顺丰直送', '180', '2018-05-08 16:18', '0', '山竹', '41.04', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10318', '中国山竹', '58.13', '64.25', '中国大陆', '10318', '5', '100', '0', '山竹新鲜水果 泰国进口5A大果麻油竹热带应季水果包邮坏果包赔', '180', '2018-05-08 16:18', '0', '山竹', '52.47', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10319', '中国山竹', '64.30', '67.87', '中国大陆', '10319', '5', '100', '0', '5斤装 泰国进口5A山竹新鲜热带当应季时令水果包邮 坏果包赔', '180', '2018-05-08 16:18', '0', '山竹', '42.03', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10320', '三亚市山竹', '79.39', '79.41', '海南省三亚市', '10320', '5', '100', '0', '顺丰空运新鲜山竹3斤装空运果肉嫩白海南美味水果', '180', '2018-05-08 16:18', '0', '山竹', '48.59', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10321', '中国山竹', '51.59', '54.66', '中国大陆', '10321', '5', '100', '0', '泰国进口山竹5A新鲜热带水果5斤装现货应季时令孕妇水果批发包邮', '180', '2018-05-08 16:18', '0', '山竹', '42.85', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10322', '中国山竹', '52.32', '69.74', '中国大陆', '10322', '5', '100', '0', '【顺丰空运】泰国进口山竹 5A单果110g 油麻竹热带新鲜水果4斤装', '180', '2018-05-08 16:18', '0', '山竹', '50.24', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10323', '中国山竹', '72.68', '74.25', '中国大陆', '10323', '5', '100', '0', '【两份减10元】泰国进口新鲜山竹2斤装 新鲜水果批发团购空运包邮', '180', '2018-05-08 16:18', '0', '山竹', '41.75', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10324', '南宁市山竹', '63.92', '71.13', '广西壮族自治区南宁市', '10324', '5', '100', '0', '泰国5A山竹大果新鲜时令应季水果麻油竹热带水果批发5斤精装包邮', '180', '2018-05-08 16:18', '0', '山竹', '63.19', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10325', '中国山竹', '68.39', '76.55', '中国大陆', '10325', '5', '100', '0', '泰国山竹 5A大果沙竹油麻竹花竹热带进口新鲜水果现货新鲜包邮', '180', '2018-05-08 16:18', '0', '山竹', '48.03', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10326', '中国山竹', '54.21', '72.90', '中国大陆', '10326', '5', '100', '0', '【上果】印尼山竹新鲜孕妇可食新鲜水果山竹2斤两件顺丰包邮', '180', '2018-05-08 16:18', '0', '山竹', '49.80', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10327', '中国山竹', '53.80', '69.65', '中国大陆', '10327', '5', '100', '0', '新鲜 山竹3斤装热带应季 水果鲜甜孕妇当季沙竹顺丰包邮 新鲜发货', '180', '2018-05-08 16:18', '0', '山竹', '46.41', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10328', '中国山竹', '61.46', '62.61', '中国大陆', '10328', '5', '100', '0', '泰国进口山竹新鲜水果5斤免运费 孕妇麻竹团购免邮当季2件发10斤', '180', '2018-05-08 16:18', '0', '山竹', '48.83', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10329', '中国山竹', '50.46', '73.55', '中国大陆', '10329', '5', '100', '0', '源润鲜泰国进口山竹 新鲜热带水果麻竹花竹油竹5斤发顺丰', '180', '2018-05-08 16:18', '0', '山竹', '46.84', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10330', '中国山竹', '43.21', '74.43', '中国大陆', '10330', '5', '100', '0', '【糖宝果鲜】2A泰国油山竹3斤送1斤热带新鲜水果油竹', '180', '2018-05-08 16:18', '0', '山竹', '40.18', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10331', '中国山竹', '61.39', '72.64', '中国大陆', '10331', '5', '100', '0', '鲜蜂队 泰国山竹 4A级新鲜热带水果 5斤装油竹麻竹花竹小果核更少', '180', '2018-05-08 16:18', '0', '山竹', '60.15', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10332', '中国山竹', '47.80', '66.74', '中国大陆', '10332', '4', '100', '0', '泰国进口山竹4A级新鲜热带水果麻竹花竹油竹3斤装包邮', '180', '2018-05-08 16:18', '0', '山竹', '42.36', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10333', '中国山竹', '65.22', '71.20', '中国大陆', '10333', '5', '100', '0', '现货泰国进口山竹5斤大果麻竹热带时令新鲜孕妇水果团购批发空运', '180', '2018-05-08 16:18', '0', '山竹', '49.41', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10334', '中国山竹', '48.13', '63.56', '中国大陆', '10334', '5', '100', '0', '乐拉 进口泰国新鲜5A山竹 热带时令孕妇水果4斤装顺丰空运', '180', '2018-05-08 16:19', '0', '山竹', '43.99', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10335', '中国山竹', '78.83', '79.39', '中国大陆', '10335', '5', '100', '0', '【飞猴】泰国正宗进口新鲜降火山竹3斤装孕妇水果免运费批发团购', '180', '2018-05-08 16:19', '0', '山竹', '55.97', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10336', '中国山竹', '46.48', '65.73', '中国大陆', '10336', '4', '100', '0', '帆儿庄园  泰国进口山竹新鲜水果5斤装', '180', '2018-05-08 16:19', '0', '山竹', '42.81', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10337', '中国山竹', '60.90', '73.50', '中国大陆', '10337', '5', '100', '0', '现货泰国进口山竹新鲜水果5A大果麻油竹热带水果批发包邮坏果包赔', '180', '2018-05-08 16:19', '0', '山竹', '60.48', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10338', '中国山竹', '46.80', '58.23', '中国大陆', '10338', '5', '100', '0', '山竹3斤泰国进口新鲜水果顺丰空运包邮团购免运费 当季孕妇营养甜', '180', '2018-05-08 16:19', '0', '山竹', '43.46', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10339', '中国山竹', '41.03', '59.94', '中国大陆', '10339', '5', '100', '0', '【5斤仅需98元】泰国进口山竹大果5斤新鲜水果批发团购空运包邮', '180', '2018-05-08 16:19', '0', '山竹', '40.02', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10340', '中国山竹', '41.22', '52.21', '中国大陆', '10340', '5', '100', '0', '新鲜 山竹热带应季水果顺丰包邮孕妇水果5斤装鲜甜当季 沙竹', '180', '2018-05-08 16:19', '0', '山竹', '40.05', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10341', '中国山竹', '65.46', '67.02', '中国大陆', '10341', '5', '100', '0', '泰国进口山竹新鲜水果5A大果麻竹花竹油竹5斤装包邮2件10斤', '180', '2018-05-08 16:19', '0', '山竹', '54.96', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10342', '中国山竹', '50.49', '78.95', '中国大陆', '10342', '5', '100', '0', '长春湖 泰国进口新鲜山竹3斤装 进口水果应季新鲜时令水果包邮', '180', '2018-05-08 16:19', '0', '山竹', '42.63', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10343', '中国山竹', '66.01', '67.18', '中国大陆', '10343', '5', '100', '0', 'EMS空运包邮进口山竹5斤5A6A大果新鲜水果新鲜时令水果', '180', '2018-05-08 16:19', '0', '山竹', '57.32', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10344', '中国山竹', '65.65', '78.45', '中国大陆', '10344', '5', '100', '0', '泰国进口A级 山竹 新鲜水果批发5斤包邮山竹麻竹花竹油竹现货', '180', '2018-05-08 16:19', '0', '山竹', '53.79', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10345', '中国山竹', '54.88', '55.56', '中国大陆', '10345', '5', '100', '0', '[卓上精选]新鲜水果团购价 进口5A级泰国山竹5斤当季批发比海南好', '180', '2018-05-08 16:19', '0', '山竹', '40.41', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10346', '中国山竹', '47.42', '72.89', '中国大陆', '10346', '5', '100', '0', '【两份减10元】泰国进口山竹3斤油麻竹热带应季新鲜水果批发包邮', '180', '2018-05-08 16:19', '0', '山竹', '45.49', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10347', '中国山竹', '63.49', '72.74', '中国大陆', '10347', '5', '100', '0', '泰国山竹500g', '180', '2018-05-08 16:19', '0', '山竹', '50.42', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10348', '中国山竹', '47.55', '72.12', '中国大陆', '10348', '4', '100', '0', '飞猴泰国进口山竹新鲜水果5斤免运费现货团购坏果包赔', '180', '2018-05-08 16:19', '0', '山竹', '40.73', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10349', '中国山竹', '61.22', '66.13', '中国大陆', '10349', '5', '100', '0', '【坏果包赔】泰国进口山竹新鲜水果大果麻竹花竹油竹5斤装包邮', '180', '2018-05-08 16:19', '0', '山竹', '49.24', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10350', '中国山竹', '43.92', '48.48', '中国大陆', '10350', '4', '100', '0', '帆儿庄园 泰国进口山竹新鲜水果 3斤装', '180', '2018-05-08 16:19', '0', '山竹', '40.37', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10351', '中国山竹', '56.54', '68.10', '中国大陆', '10351', '5', '100', '0', '泰国进口山竹新鲜水果山竹果 麻油竹热带水果空运包邮坏果包赔', '180', '2018-05-08 16:19', '0', '山竹', '44.55', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10352', '中国山竹', '60.19', '63.92', '中国大陆', '10352', '5', '100', '0', '拾蘑菇 泰国山竹 新鲜水果 油麻竹5A级大果 进口热带水果包邮3斤', '180', '2018-05-08 16:19', '0', '山竹', '56.69', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10353', '中国山竹', '46.84', '63.78', '中国大陆', '10353', '2', '100', '0', '现货泰国进口山竹热带新鲜水果山竹3斤5A级孕妇水果礼盒团购包邮', '180', '2018-05-08 16:19', '0', '山竹', '43.11', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10354', '中国山竹', '75.84', '77.76', '中国大陆', '10354', '5', '100', '0', '齐峰泰国山竹3斤装正宗泰国进口山竹新鲜水果3A级', '180', '2018-05-08 16:19', '0', '山竹', '49.65', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10355', '中国山竹', '66.51', '68.90', '中国大陆', '10355', '5', '100', '0', '新鲜水果进口山竹 泰国进口山竹3斤装 新鲜好吃山竹水果特价包邮', '180', '2018-05-08 16:19', '0', '山竹', '55.79', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10356', '中国山竹', '78.54', '78.70', '中国大陆', '10356', '5', '100', '0', '浙江温州陶山甘蔗1盒(2kg/盒)', '180', '2018-05-08 16:19', '0', '山竹', '43.41', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10357', '海口市木瓜', '78.30', '78.63', '海南省海口市', '10357', '4', '100', '0', '海南三亚新鲜水果海南水果三亚水果新鲜木瓜 红心木瓜牛奶木瓜5斤', '180', '2018-05-08 16:19', '0', '木瓜', '50.18', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10358', '昆明市木瓜', '69.98', '79.89', '云南省昆明市', '10358', '5', '100', '0', '【多送4斤发9斤】云南特产红心木瓜甜木瓜新鲜水果树冬瓜批发包邮', '180', '2018-05-08 16:19', '0', '木瓜', '47.74', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10359', '红河哈尼族彝族自治州木瓜', '52.38', '55.87', '云南省红河哈尼族彝族自治州', '10359', '5', '100', '0', '云南红心木瓜甜现摘9斤新鲜水果熟现摘现发树上熟甜蜜多汁木瓜', '180', '2018-05-08 16:19', '0', '木瓜', '46.17', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10360', '南宁市木瓜', '63.69', '74.58', '广西壮族自治区南宁市', '10360', '5', '100', '0', '果蔬姐妹 红心木瓜 水果 新鲜包邮共享8斤雷州冰糖青木瓜牛奶木瓜', '180', '2018-05-08 16:19', '0', '木瓜', '59.18', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10361', '海口市木瓜', '40.47', '73.74', '海南省海口市', '10361', '5', '100', '0', '【买一送一共发8斤】海南三亚新鲜水果牛奶红心木瓜4斤特大爆甜', '180', '2018-05-08 16:19', '0', '木瓜', '40.23', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10362', '昆明市木瓜', '42.17', '71.45', '云南省昆明市', '10362', '5', '100', '0', '十六御 云南红心大牛奶木瓜当季特产新鲜水果批发包邮10斤非海南', '180', '2018-05-08 16:19', '0', '木瓜', '41.48', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10363', '三亚市木瓜', '44.34', '48.44', '海南省三亚市', '10363', '5', '100', '0', '[卓上精选]新鲜水果 10斤海南红心熟牛奶木瓜 现摘现发批发8当季', '180', '2018-05-08 16:19', '0', '木瓜', '43.11', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10364', '昆明市木瓜', '79.62', '79.83', '云南省昆明市', '10364', '5', '100', '0', '送4斤云南红心牛奶木瓜新鲜包邮当季水果批发非海南青木瓜共发9斤', '180', '2018-05-08 16:19', '0', '木瓜', '50.81', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10365', '三亚市木瓜', '72.35', '77.07', '海南省三亚市', '10365', '5', '100', '0', '凤凰湾海南新鲜水果树上熟红心木瓜5斤航空包邮', '180', '2018-05-08 16:19', '0', '木瓜', '66.30', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10366', '中国木瓜', '60.05', '66.95', '中国大陆', '10366', '5', '100', '0', '海南树上熟木瓜2只装 新鲜水果 海南水果 树上熟', '180', '2018-05-08 16:19', '0', '木瓜', '48.71', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10367', '昆明市木瓜', '43.38', '67.69', '云南省昆明市', '10367', '5', '100', '0', '云南红心木瓜新鲜水果特产夏威夷牛奶冰糖香甜青大木瓜特产包邮', '180', '2018-05-08 16:20', '0', '木瓜', '42.88', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10368', '湛江市木瓜', '73.24', '79.22', '广东省湛江市', '10368', '5', '100', '0', '现摘 广东特产雷州冰糖木瓜 当季青皮红心牛奶 新鲜水果 5斤包邮', '180', '2018-05-08 16:20', '0', '木瓜', '73.20', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10369', '南宁市木瓜', '41.56', '45.05', '广西壮族自治区南宁市', '10369', '5', '100', '0', '广西红心牛奶木瓜新鲜水果包邮10斤非海南雷州冰糖青木瓜酸木瓜', '180', '2018-05-08 16:20', '0', '木瓜', '40.22', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10370', '海口市木瓜', '57.96', '76.98', '海南省海口市', '10370', '5', '100', '0', '海南红心冰糖心木瓜 水果 新鲜 包邮非广西云南牛奶木瓜5斤', '180', '2018-05-08 16:20', '0', '木瓜', '55.48', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10371', '昆明市木瓜', '46.68', '73.42', '云南省昆明市', '10371', '5', '100', '0', '海南红心木瓜新鲜水果牛奶10现摘现发整箱8斤低价批发熟非青木瓜', '180', '2018-05-08 16:20', '0', '木瓜', '45.03', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10372', '海口市木瓜', '60.72', '63.18', '海南省海口市', '10372', '5', '100', '0', '【买一送一共发8斤】海南三亚新鲜水果牛奶红心木瓜4斤特大爆甜', '180', '2018-05-08 16:20', '0', '木瓜', '48.65', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10373', '三亚市木瓜', '42.18', '66.61', '海南省三亚市', '10373', '5', '100', '0', '【升森水果】新鲜海南红心木瓜 新鲜水果青木瓜包邮', '180', '2018-05-08 16:20', '0', '木瓜', '41.37', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10374', '三亚市木瓜', '59.83', '71.29', '海南省三亚市', '10374', '5', '100', '0', '共8斤海南红心牛奶木瓜新鲜三亚新鲜水果当季熟青木瓜孕妇爱吃', '180', '2018-05-08 16:20', '0', '木瓜', '43.92', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10375', '红河哈尼族彝族自治州木瓜', '76.58', '79.54', '云南省红河哈尼族彝族自治州', '10375', '5', '100', '0', '新鲜现摘云南红心木瓜冰糖心牛奶木瓜新鲜水果批发5斤包邮树上熟', '180', '2018-05-08 16:20', '0', '木瓜', '68.65', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10376', '三亚市木瓜', '70.45', '79.09', '海南省三亚市', '10376', '5', '100', '0', '【升森水果】升森新鲜海南木瓜 新鲜热带水果青木瓜包邮批发包邮', '180', '2018-05-08 16:20', '0', '木瓜', '52.22', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10377', '湛江市木瓜', '64.64', '78.04', '广东省湛江市', '10377', '5', '100', '0', '现摘新鲜木瓜水果树上熟雷州冰糖红心木瓜海南红心牛奶木瓜5斤装', '180', '2018-05-08 16:20', '0', '木瓜', '54.28', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10378', '中国木瓜', '65.46', '71.41', '中国大陆', '10378', '5', '100', '0', '海南夏威夷木瓜1个500g以上/个 新鲜水果  国产水果', '180', '2018-05-08 16:20', '0', '木瓜', '61.45', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10379', '湛江市木瓜', '48.49', '52.94', '广东省湛江市', '10379', '5', '100', '0', '【2018新货】雷州冰糖红心木瓜8斤 青皮红心牛奶青木瓜新鲜水果', '180', '2018-05-08 16:20', '0', '木瓜', '45.58', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10380', '湛江市木瓜', '78.35', '79.40', '广东省湛江市', '10380', '5', '100', '0', '【乡村铺子】雷州冰糖心木瓜 现摘新鲜水果冰糖牛奶木瓜 包邮', '180', '2018-05-08 16:20', '0', '木瓜', '53.15', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10381', '湛江市木瓜', '63.78', '74.78', '广东省湛江市', '10381', '5', '100', '0', '现摘雷州冰糖红心牛奶木瓜8斤新鲜水果青木瓜包邮非海南红心云南', '180', '2018-05-08 16:20', '0', '木瓜', '56.51', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10382', '昆明市木瓜', '71.95', '72.21', '云南省昆明市', '10382', '5', '100', '0', '悦太 生青木瓜炖牛奶水果新鲜包邮一箱女人女性整箱丰胸批发下奶', '180', '2018-05-08 16:20', '0', '木瓜', '52.12', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10383', '海口市木瓜', '69.59', '78.22', '海南省海口市', '10383', '5', '100', '0', '【热带国度】树上熟红心木瓜 热带新鲜水果冰糖心牛奶木瓜', '180', '2018-05-08 16:20', '0', '木瓜', '49.39', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10384', '大理白族自治州木瓜', '67.32', '77.96', '云南省大理白族自治州', '10384', '5', '100', '0', '大理新鲜水果酸木瓜2000克云南特产泡酒炖排骨水果蔬菜绿色青木瓜', '180', '2018-05-08 16:20', '0', '木瓜', '47.73', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10385', '红河哈尼族彝族自治州木瓜', '58.09', '76.79', '云南省红河哈尼族彝族自治州', '10385', '5', '100', '0', '现摘现发 云南红心木瓜 夏威夷冰糖牛奶 树上熟 新鲜水果9斤包邮', '180', '2018-05-08 16:20', '0', '木瓜', '56.25', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10386', '海口市木瓜', '42.47', '68.04', '海南省海口市', '10386', '5', '100', '0', '海南红心木瓜水果新鲜包邮现摘现发批发当季整箱木瓜树上熟非云南', '180', '2018-05-08 16:20', '0', '木瓜', '41.04', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10387', '昆明市木瓜', '45.44', '55.49', '云南省昆明市', '10387', '5', '100', '0', '新鲜水果红心木瓜9斤 自然树上熟现摘现发 冰糖牛奶大青木瓜特产', '180', '2018-05-08 16:20', '0', '木瓜', '41.67', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10388', '昆明市木瓜', '71.68', '73.97', '云南省昆明市', '10388', '5', '100', '0', '【送4斤发9斤】云南红心木瓜树上熟夏威夷牛奶青木瓜冰糖新鲜水果', '180', '2018-05-08 16:20', '0', '木瓜', '68.95', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10389', '海口市木瓜', '51.81', '52.55', '海南省海口市', '10389', '5', '100', '0', '【拍下减10元】海南三亚新鲜水果牛奶红心大青木瓜煲汤5斤', '180', '2018-05-08 16:20', '0', '木瓜', '45.21', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10390', '红河哈尼族彝族自治州木瓜', '68.97', '74.47', '云南省红河哈尼族彝族自治州', '10390', '5', '100', '0', '现摘现发云南红心木瓜树上熟新鲜特产水果木瓜牛奶木瓜9斤包邮', '180', '2018-05-08 16:20', '0', '木瓜', '66.71', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10391', '中国木瓜', '59.05', '65.83', '中国大陆', '10391', '5', '100', '0', '海南树上熟木瓜1个(600g以上/个)', '180', '2018-05-08 16:20', '0', '木瓜', '57.58', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10392', '丽江市木瓜', '65.27', '73.94', '云南省丽江市', '10392', '5', '100', '0', '云南红心木瓜发9斤现摘现发新鲜木瓜水果甜木瓜牛奶冰糖青大木瓜', '180', '2018-05-08 16:20', '0', '木瓜', '47.79', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10393', '红河哈尼族彝族自治州木瓜', '47.51', '54.35', '云南省红河哈尼族彝族自治州', '10393', '5', '100', '0', '云南红心木瓜新鲜水果特产夏威夷牛奶冰糖青大木瓜10斤包邮', '180', '2018-05-08 16:20', '0', '木瓜', '46.87', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10394', '三亚市木瓜', '53.07', '76.34', '海南省三亚市', '10394', '5', '100', '0', '新鲜海南红心木瓜水果包邮 牛奶冰糖青木瓜树上熟 实发8斤', '180', '2018-05-08 16:20', '0', '木瓜', '44.89', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10395', '三亚市木瓜', '59.75', '65.82', '海南省三亚市', '10395', '4', '100', '0', '5斤送3斤 8斤海南红心木瓜新鲜水果批发夏威夷三亚木瓜非广西广东', '180', '2018-05-08 16:20', '0', '木瓜', '44.23', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10396', '湛江市木瓜', '59.01', '59.85', '广东省湛江市', '10396', '5', '100', '0', '8斤广东雷州冰糖红心木瓜新鲜水果现摘现发木瓜青皮红心木瓜海南', '180', '2018-05-08 16:20', '0', '木瓜', '49.74', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10397', '三亚市木瓜', '63.82', '66.10', '海南省三亚市', '10397', '5', '100', '0', '【升森水果】新鲜海南三亚红心木瓜 新鲜热带水果青木瓜批发包邮', '180', '2018-05-08 16:20', '0', '木瓜', '46.78', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10398', '红河哈尼族彝族自治州木瓜', '79.75', '79.79', '云南省红河哈尼族彝族自治州', '10398', '5', '100', '0', '【送4斤发9斤】云南高山红心冰糖木瓜新鲜树冬瓜应季水果特产包邮', '180', '2018-05-08 16:20', '0', '木瓜', '41.31', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10399', '昆明市木瓜', '43.95', '54.76', '云南省昆明市', '10399', '5', '100', '0', '【送4斤发8斤】云南红心木瓜树上熟夏威夷牛奶青木瓜冰糖新鲜水果', '180', '2018-05-08 16:20', '0', '木瓜', '40.42', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10400', '湛江市木瓜', '57.19', '66.56', '广东省湛江市', '10400', '5', '100', '0', '雷州冰糖心木瓜新鲜水果牛奶红心青木瓜5斤装包邮非海南云南木瓜', '180', '2018-05-08 16:20', '0', '木瓜', '46.09', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10401', '南宁市木瓜', '57.70', '60.88', '广西壮族自治区南宁市', '10401', '5', '100', '0', '广西红心牛奶木瓜当季新鲜水果5斤批发包邮冰糖青木瓜树上熟', '180', '2018-05-08 16:20', '0', '木瓜', '48.72', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10402', '南宁市木瓜', '45.97', '67.11', '广西壮族自治区南宁市', '10402', '5', '100', '0', '【收藏送4斤】新鲜现摘红心牛奶木瓜新鲜当季水果冰糖青木瓜批发', '180', '2018-05-08 16:20', '0', '木瓜', '43.41', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10403', '红河哈尼族彝族自治州木瓜', '45.41', '68.91', '云南省红河哈尼族彝族自治州', '10403', '5', '100', '0', '现摘现发 云南特产红心木瓜 青皮红心牛奶木瓜新鲜 水果包邮', '180', '2018-05-08 16:21', '0', '木瓜', '43.39', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10404', '昆明市木瓜', '76.72', '78.64', '云南省昆明市', '10404', '5', '100', '0', '新鲜现摘红心牛奶木瓜8斤装新鲜当季水果冰糖青木瓜批发非海南', '180', '2018-05-08 16:21', '0', '木瓜', '71.05', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10405', '海口市木瓜', '44.77', '78.48', '海南省海口市', '10405', '5', '100', '0', '海南红心木瓜8斤热带新鲜水果青皮木瓜牛奶甜木瓜时令水果包邮', '180', '2018-05-08 16:21', '0', '木瓜', '40.92', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10406', '中国木瓜', '54.06', '71.85', '中国大陆', '10406', '5', '100', '0', '海南树上熟木瓜1个450g以上/个 乳瓜 海鲜特产 热带水果 新鲜水果', '180', '2018-05-08 16:21', '0', '木瓜', '53.56', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10407', '红河哈尼族彝族自治州木瓜', '79.73', '79.77', '云南省红河哈尼族彝族自治州', '10407', '5', '100', '0', '云南树上熟红心木瓜8斤新鲜水果特产夏威夷红肉牛奶冰糖青大木瓜', '180', '2018-05-08 16:21', '0', '木瓜', '78.56', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10408', '三亚市木瓜', '46.81', '52.98', '海南省三亚市', '10408', '5', '100', '0', '王小二 海南红心木瓜当季特产新鲜热带水果包邮批发青大牛奶木瓜', '180', '2018-05-08 16:21', '0', '木瓜', '40.00', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10409', '大理白族自治州木瓜', '43.84', '48.70', '云南省大理白族自治州', '10409', '5', '100', '0', '云南大理特产野生酸木瓜4斤新鲜水果孕妇食品泡酒炖汤蔬菜青味瓜', '180', '2018-05-08 16:21', '0', '木瓜', '42.17', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10410', '三亚市木瓜', '74.31', '78.18', '海南省三亚市', '10410', '5', '100', '0', '【现摘现发】海南红心木瓜8斤 新鲜水果冰糖心牛奶青木瓜批发包邮', '180', '2018-05-08 16:21', '0', '木瓜', '59.07', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10411', '三亚市木瓜', '48.33', '67.67', '海南省三亚市', '10411', '5', '100', '0', '木瓜水果新鲜包邮海南红心木瓜夏威夷牛奶木瓜青木瓜共发9斤包邮', '180', '2018-05-08 16:21', '0', '木瓜', '46.56', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10412', '三亚市木瓜', '76.15', '77.27', '海南省三亚市', '10412', '5', '100', '0', '木瓜水果新鲜包邮海南红心木瓜夏威夷牛奶木瓜青木瓜共发9斤', '180', '2018-05-08 16:21', '0', '木瓜', '54.34', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10413', '海口市木瓜', '46.40', '67.43', '海南省海口市', '10413', '5', '100', '0', '[苏二头]海南红心木瓜8斤 青木瓜新鲜水果包邮 夏威夷牛奶木瓜', '180', '2018-05-08 16:21', '0', '木瓜', '46.20', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10414', '南宁市木瓜', '55.48', '62.42', '广西壮族自治区南宁市', '10414', '5', '100', '0', '食蕴鲜 广西新鲜青木瓜8斤装包邮番木瓜下奶产妇水果非红心木瓜', '180', '2018-05-08 16:21', '0', '木瓜', '41.09', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10415', '三亚市木瓜', '43.06', '68.08', '海南省三亚市', '10415', '1', '100', '0', '5斤海南三亚牛奶红心木瓜 青木瓜 爆甜海南热带新鲜水果', '180', '2018-05-08 16:21', '0', '木瓜', '41.70', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10416', '中国木瓜', '70.37', '71.89', '中国大陆', '10416', '5', '100', '0', '海南树上熟木瓜1个450g以上/个', '180', '2018-05-08 16:21', '0', '木瓜', '65.17', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10417', '资阳区柠檬', '62.15', '68.67', '四川省资阳区', '10417', '5', '100', '0', '荷尔檬安岳一级黄柠檬四川特产皮薄多汁当季新鲜孕妇水果批发包邮', '180', '2018-05-08 16:21', '0', '柠檬', '40.78', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10418', '资阳区柠檬', '59.26', '65.61', '四川省资阳区', '10418', '5', '100', '0', '华柠 安岳黄柠檬新鲜水果二三级柠檬果5斤装包邮酸爽皮薄多汁划算', '180', '2018-05-08 16:21', '0', '柠檬', '43.81', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10419', '资阳区柠檬', '60.38', '63.49', '四川省资阳区', '10419', '5', '100', '0', '荷尔檬5斤安岳二三级黄柠檬当季新鲜水果皮薄多汁批发整箱包邮', '180', '2018-05-08 16:21', '0', '柠檬', '47.87', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10420', '资阳区柠檬', '70.07', '76.17', '四川省资阳区', '10420', '5', '100', '0', '四川安岳黄柠檬新鲜水果5斤一级大果皮薄现摘现发包邮批发', '180', '2018-05-08 16:21', '0', '柠檬', '61.26', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10421', '资阳区柠檬', '60.06', '66.74', '四川省资阳区', '10421', '5', '100', '0', '安岳柠檬皮薄新鲜黄柠檬水果现摘现发大小果一二级3斤批发包邮', '180', '2018-05-08 16:21', '0', '柠檬', '58.67', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10422', '资阳区柠檬', '44.22', '79.42', '四川省资阳区', '10422', '5', '100', '0', '当季四川安岳黄柠檬新鲜水果二级果5斤装皮薄多汁产地现摘现发', '180', '2018-05-08 16:21', '0', '柠檬', '42.62', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10423', '资阳区柠檬', '56.07', '65.42', '四川省资阳区', '10423', '5', '100', '0', '鹏瑞达 四川安岳一二级黄柠檬 新鲜水果当季批发2斤装中大果柠檬', '180', '2018-05-08 16:21', '0', '柠檬', '47.95', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10424', '资阳区柠檬', '75.43', '78.94', '四川省资阳区', '10424', '5', '100', '0', '华秧安岳黄柠檬当季时令新鲜水果一级小果黄柠檬酸味十足批发5斤', '180', '2018-05-08 16:21', '0', '柠檬', '74.09', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10425', '资阳区柠檬', '72.69', '75.82', '四川省资阳区', '10425', '5', '100', '0', '5斤柠檬四川水果批发3新鲜鲜安岳黄柠檬皮薄10现摘现发柃2檬柠', '180', '2018-05-08 16:21', '0', '柠檬', '66.86', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10426', '资阳区柠檬', '68.25', '75.89', '四川省资阳区', '10426', '5', '100', '0', '华秧安岳黄柠檬当季时令新鲜水果一级中果黄柠檬酸味十足批发5斤', '180', '2018-05-08 16:21', '0', '柠檬', '58.47', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10427', '资阳区柠檬', '78.76', '79.61', '四川省资阳区', '10427', '5', '100', '0', '鲜果地带正宗安岳黄柠檬新鲜小果10个装皮薄多汁现摘现发批发包邮', '180', '2018-05-08 16:21', '0', '柠檬', '67.05', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10428', '资阳区柠檬', '63.71', '70.02', '四川省资阳区', '10428', '5', '100', '0', '【好食道】柠檬新鲜安岳黄柠檬多汁鲜柠檬皮薄榨汁二三级柠檬5斤', '180', '2018-05-08 16:21', '0', '柠檬', '49.86', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10429', '西双版纳傣族自治州柠檬', '43.22', '69.68', '云南省西双版纳傣族自治州', '10429', '5', '100', '0', '多省包邮新鲜柠檬绿柠檬多汁水果青柠檬免邮云南新鲜小青柠檬覆膜', '180', '2018-05-08 16:21', '0', '柠檬', '40.77', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10430', '昆明市柠檬', '44.31', '59.86', '云南省昆明市', '10430', '4', '100', '0', '4斤装青柠檬新鲜夏季水果小绿云南皮薄多汁茶 覆保鲜膜免邮坏包赔', '180', '2018-05-08 16:21', '0', '柠檬', '42.84', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10431', '资阳区柠檬', '79.15', '79.39', '四川省资阳区', '10431', '5', '100', '0', '四川安岳黄柠檬5斤当季新鲜水果整箱批发包邮皮薄多汁现摘现发', '180', '2018-05-08 16:21', '0', '柠檬', '48.55', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10432', '资阳区柠檬', '69.11', '73.64', '四川省资阳区', '10432', '5', '100', '0', '【柠聚园】5斤装安岳一级黄柠檬新鲜水果皮薄多汁包邮', '180', '2018-05-08 16:21', '0', '柠檬', '52.34', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10433', '资阳区柠檬', '45.29', '71.42', '四川省资阳区', '10433', '5', '100', '0', '柠聚园四川安岳尤力克黄柠檬 新鲜中小果皮薄多汁1斤装包邮', '180', '2018-05-08 16:21', '0', '柠檬', '43.61', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10434', '资阳区柠檬', '57.26', '76.59', '四川省资阳区', '10434', '5', '100', '0', '安岳黄柠檬5斤柠檬水果批发包邮整箱新鲜一级果皮薄青香水鲜柠檬', '180', '2018-05-08 16:21', '0', '柠檬', '41.47', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10435', '资阳区柠檬', '57.97', '58.18', '四川省资阳区', '10435', '5', '100', '0', '5斤装安岳柠檬水果批发包邮 新鲜柠檬一二级大果柠檬新鲜皮薄多汁', '180', '2018-05-08 16:21', '0', '柠檬', '49.61', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10436', '资阳区柠檬', '50.57', '63.83', '四川省资阳区', '10436', '5', '100', '0', '绿真 四川安岳黄柠檬二三级果新鲜水果 皮薄汁多 不打蜡坏包赔', '180', '2018-05-08 16:21', '0', '柠檬', '45.89', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10437', '中国柠檬', '63.21', '68.73', '中国大陆', '10437', '5', '100', '0', '海南青柠檬4个75g以上/个 新鲜水果 青柠 海南水果', '180', '2018-05-08 16:21', '0', '柠檬', '61.06', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10438', '资阳区柠檬', '65.32', '73.38', '四川省资阳区', '10438', '5', '100', '0', '【柠聚园】四川安岳一级黄柠檬 新鲜水果 皮薄多汁中小果12个装', '180', '2018-05-08 16:21', '0', '柠檬', '48.61', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10439', '资阳区柠檬', '76.81', '79.94', '四川省资阳区', '10439', '5', '100', '0', '柠之恋安岳柠檬新鲜一级果黄柠檬非青柠檬1斤装水果现摘现发免邮', '180', '2018-05-08 16:21', '0', '柠檬', '62.25', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10440', '资阳区柠檬', '71.99', '76.25', '四川省资阳区', '10440', '5', '100', '0', '柠之恋  四川安岳柠檬黄柠檬新鲜水果一级果批发包邮', '180', '2018-05-08 16:22', '0', '柠檬', '53.68', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10441', '南宁市柠檬', '60.40', '61.77', '广西壮族自治区南宁市', '10441', '5', '100', '0', '泰国无籽柠檬 新鲜皮薄多汁鲜柠檬水果青柠大青柠檬 新鲜免邮多省', '180', '2018-05-08 16:22', '0', '柠檬', '49.39', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10442', '中国柠檬', '59.61', '65.04', '中国大陆', '10442', '5', '100', '0', '泰国无籽青柠檬4斤 新鲜时令水果无籽大青柠檬皮薄多汁有坏包赔', '180', '2018-05-08 16:22', '0', '柠檬', '53.09', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10443', '河池市柠檬', '75.14', '77.84', '广西壮族自治区河池市', '10443', '5', '100', '0', '【老一生鲜】 新鲜青柠檬 无籽青柠檬无籽柠檬 肉绿皮薄汁多500g', '180', '2018-05-08 16:22', '0', '柠檬', '55.29', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10444', '资阳区柠檬', '79.12', '79.81', '四川省资阳区', '10444', '5', '100', '0', '柠檬新鲜安岳一级黄柠檬水果5斤批发包邮现摘现发皮薄鲜柠檬', '180', '2018-05-08 16:22', '0', '柠檬', '62.04', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10445', '资阳区柠檬', '47.33', '62.79', '四川省资阳区', '10445', '5', '100', '0', '【HTO华通】安岳当季新鲜水果黄柠檬二级果4斤装产地现发皮薄', '180', '2018-05-08 16:22', '0', '柠檬', '47.20', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10446', '资阳区柠檬', '61.46', '66.47', '四川省资阳区', '10446', '5', '100', '0', '柠之恋 安岳柠檬新鲜黄柠檬二级水果现摘现发批发4斤包邮鲜柠檬', '180', '2018-05-08 16:22', '0', '柠檬', '46.31', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10447', '中国柠檬', '61.26', '73.98', '中国大陆', '10447', '5', '100', '0', '海南小青柠500g 柠檬 新鲜水果 青柠檬 海南水果', '180', '2018-05-08 16:22', '0', '柠檬', '46.14', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10448', '资阳区柠檬', '57.15', '59.72', '四川省资阳区', '10448', '5', '100', '0', '四川安岳黄柠檬现摘现发新鲜水果一级大果5斤批发包邮鲜柠檬皮薄', '180', '2018-05-08 16:22', '0', '柠檬', '47.99', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10449', '资阳区柠檬', '61.25', '61.27', '四川省资阳区', '10449', '5', '100', '0', '华秧安岳柠檬新鲜水果1级大果黄柠檬孕妇水果当季批发包邮整箱5斤', '180', '2018-05-08 16:22', '0', '柠檬', '58.92', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10450', '资阳区柠檬', '55.82', '76.02', '四川省资阳区', '10450', '5', '100', '0', '【柠聚园】5斤装安岳黄柠檬新鲜水果三级丑小果皮薄多汁包邮', '180', '2018-05-08 16:22', '0', '柠檬', '50.53', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10451', '资阳区柠檬', '65.87', '79.13', '四川省资阳区', '10451', '5', '100', '0', '现摘现发 四川安岳黄柠檬一级鲜柠檬5斤装新鲜水果非青柠批发包邮', '180', '2018-05-08 16:22', '0', '柠檬', '51.70', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10452', '中国柠檬', '49.31', '59.61', '中国大陆', '10452', '4', '100', '0', '歌慕海南小金桔新鲜青金桔小青橘包邮餐饮店原料坏果包赔非青柠檬', '180', '2018-05-08 16:22', '0', '柠檬', '44.13', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10453', '资阳区柠檬', '63.56', '73.42', '四川省资阳区', '10453', '5', '100', '0', '华秧安岳柠檬新鲜水果2级黄柠檬四川特产当季水果批发整箱包邮5斤', '180', '2018-05-08 16:22', '0', '柠檬', '58.38', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10454', '资阳区柠檬', '53.89', '78.94', '四川省资阳区', '10454', '5', '100', '0', '柠檬新鲜皮薄多汁5斤孕妇水果批发包邮现摘现发安岳黄柠檬鲜柠檬', '180', '2018-05-08 16:22', '0', '柠檬', '44.63', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10455', '海口市柠檬', '48.16', '54.70', '海南省海口市', '10455', '5', '100', '0', '（送2斤共发5斤）海南新鲜青柠檬青柠檬不是无籽柠檬现摘一件批发', '180', '2018-05-08 16:22', '0', '柠檬', '45.58', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10456', '中国柠檬', '68.85', '78.05', '中国大陆', '10456', '5', '100', '0', '四川安岳黄柠檬2个75g以上/个 新鲜水果 国产水果', '180', '2018-05-08 16:22', '0', '柠檬', '45.82', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10457', '资阳区柠檬', '63.84', '75.32', '四川省资阳区', '10457', '5', '100', '0', '四川安岳柠檬新鲜一级果小柠檬四斤装约25个皮薄多汁酸爽柠檬包邮', '180', '2018-05-08 16:22', '0', '柠檬', '63.70', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10458', '资阳区柠檬', '59.23', '65.58', '四川省资阳区', '10458', '5', '100', '0', '柠之恋 安岳柠檬新鲜水果黄柠檬一级果批发12个装包邮鲜柠檬', '180', '2018-05-08 16:22', '0', '柠檬', '55.90', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10459', '资阳区柠檬', '40.38', '70.64', '四川省资阳区', '10459', '5', '100', '0', '【买1送1发5斤】华秧安岳柠檬新鲜水果2级黄柠檬整箱特产批发包邮', '180', '2018-05-08 16:22', '0', '柠檬', '40.33', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10460', '遂宁市柠檬', '74.53', '75.05', '四川省遂宁市', '10460', '3', '100', '0', '蜀珍安岳新鲜黄柠檬水果二三级统果4斤装包邮泡水榨汁皮薄多汁', '180', '2018-05-08 16:22', '0', '柠檬', '73.17', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10461', '资阳区柠檬', '66.72', '67.70', '四川省资阳区', '10461', '5', '100', '0', '华秧安岳柠檬新鲜水果一二级黄柠檬小果皮薄多汁特价批发包邮10个', '180', '2018-05-08 16:22', '0', '柠檬', '43.00', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10462', '海口市柠檬', '48.25', '50.96', '海南省海口市', '10462', '4', '100', '0', '海南一级青柠檬5斤包邮 新鲜皮薄多汁鲜柠檬水果青柠大青柠檬', '180', '2018-05-08 16:22', '0', '柠檬', '43.18', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10463', '文昌市柠檬', '68.14', '77.39', '海南省文昌市', '10463', '5', '100', '0', '【一级果】海南青柠檬新鲜皮薄多汁 小免邮5斤现摘水果特价批发2', '180', '2018-05-08 16:22', '0', '柠檬', '56.35', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10464', '资阳区柠檬', '71.83', '75.64', '四川省资阳区', '10464', '5', '100', '0', '四川安岳黄柠檬6斤新鲜水果 现摘一级大果皮薄鲜柠檬青柠批发包邮', '180', '2018-05-08 16:22', '0', '柠檬', '66.43', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10465', '资阳区柠檬', '74.28', '77.57', '四川省资阳区', '10465', '5', '100', '0', '【柠聚园】新鲜黄柠檬一级大果2斤装独立包装果大多汁水果', '180', '2018-05-08 16:22', '0', '柠檬', '46.84', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10466', '中国柠檬', '51.70', '67.70', '中国大陆', '10466', '5', '100', '0', '新奇士美国柠檬4个85g以上/个 新鲜水果 进口柠檬 新奇士柠檬', '180', '2018-05-08 16:22', '0', '柠檬', '48.87', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10467', '资阳区柠檬', '46.37', '56.76', '四川省资阳区', '10467', '5', '100', '0', '一级5斤装安岳黄柠檬新鲜水果鲜柠檬批发大果非青柠檬包邮', '180', '2018-05-08 16:22', '0', '柠檬', '42.57', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10468', '资阳区柠檬', '52.40', '69.85', '四川省资阳区', '10468', '5', '100', '0', '安岳柠檬新鲜二三级果五斤现摘现发皮薄多汁榨汁酵素批发丑果包邮', '180', '2018-05-08 16:22', '0', '柠檬', '52.02', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10469', '资阳区柠檬', '63.50', '79.73', '四川省资阳区', '10469', '5', '100', '0', '安岳黄柠檬新鲜水果批发5斤包邮现摘现发四川一级皮薄香水柃檬', '180', '2018-05-08 16:22', '0', '柠檬', '42.21', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10470', '中国柠檬', '44.60', '61.12', '中国大陆', '10470', '5', '100', '0', '四川安岳黄柠檬4个75g以上/个 新鲜水果', '180', '2018-05-08 16:23', '0', '柠檬', '43.85', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10471', '资阳区柠檬', '76.77', '78.82', '四川省资阳区', '10471', '5', '100', '0', '【柠聚园】5斤装安岳黄柠檬新鲜水果二三级黄柠檬皮薄多汁包邮', '180', '2018-05-08 16:23', '0', '柠檬', '54.49', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10472', '中国柠檬', '45.12', '55.22', '中国大陆', '10472', '5', '100', '0', '四川安岳黄柠檬8个75g以上/个 新鲜水果 国产水果', '180', '2018-05-08 16:23', '0', '柠檬', '42.22', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10473', '西双版纳傣族自治州柠檬', '59.60', '67.60', '云南省西双版纳傣族自治州', '10473', '5', '100', '0', '青柠檬4斤云南新鲜时令水果小青柠皮薄多汁绿柠檬青柠檬有坏包赔', '180', '2018-05-08 16:23', '0', '柠檬', '55.94', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10474', '成都市柠檬', '48.33', '74.96', '四川省成都市', '10474', '5', '98', '0', '海南新鲜小金桔青桔金橘柠檬5斤包邮清香多汁新鲜现货非青柠免邮', '180', '2018-05-08 16:23', '1526568077448', '柠檬', '40.37', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10475', '西双版纳傣族自治州柠檬', '51.71', '57.22', '云南省西双版纳傣族自治州', '10475', '5', '100', '0', '青柠檬5斤多省免邮皮薄汁多小鲜柠檬新鲜绿水果云南青柠现摘批发', '180', '2018-05-08 16:23', '0', '柠檬', '50.44', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10476', '资阳区柠檬', '40.48', '54.99', '四川省资阳区', '10476', '5', '100', '0', '四川安岳柠檬新鲜时令水果一级果2斤装当季鲜黄柠檬批发包邮', '180', '2018-05-08 16:23', '0', '柠檬', '40.17', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10477', '中国椰青', '55.39', '60.35', '中国大陆', '10477', '5', '100', '0', '炫果多 泰国椰青9个 进口中号原箱椰子新鲜椰子汁水果送开椰器', '180', '2018-05-08 16:23', '0', '椰青', '52.90', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10478', '海口市椰青', '41.69', '79.76', '海南省海口市', '10478', '5', '100', '0', '榴芒客 海南椰青9个装新鲜热带水果批发老椰子椰皇青椰子海南特产', '180', '2018-05-08 16:23', '0', '椰青', '41.11', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10479', '嘉兴市椰青', '47.67', '59.38', '浙江省嘉兴市', '10479', '3', '100', '0', '菲诺椰子冻2个盒装顺丰包邮黄金椰粒椰奶冻新鲜黑椰冻果全奶椰冻', '180', '2018-05-08 16:23', '0', '椰青', '42.84', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10480', '儋州市椰青', '66.13', '66.44', '海南省儋州市', '10480', '5', '100', '0', '海南带皮椰子海南椰青新鲜水果海南特产青椰子黄椰子椰子果11元个', '180', '2018-05-08 16:23', '0', '椰青', '52.51', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10481', '中国椰青', '49.62', '73.98', '中国大陆', '10481', '5', '100', '0', '泰国椰青1个800g以上/1个（附开椰器）', '180', '2018-05-08 16:23', '0', '椰青', '42.67', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10482', '儋州市椰青', '51.49', '65.33', '海南省儋州市', '10482', '5', '100', '0', '海南椰青海南去皮椰子新鲜水果海南特产青椰子黄椰子椰子果9个装', '180', '2018-05-08 16:23', '0', '椰青', '42.72', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10483', '中国椰青', '40.58', '79.07', '中国大陆', '10483', '5', '100', '0', '懒懒椰泰国金椰青4个装新鲜椰子椰青天然椰汁进口水果批发包邮', '180', '2018-05-08 16:23', '0', '椰青', '40.34', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10484', '中国椰青', '59.67', '69.92', '中国大陆', '10484', '5', '100', '0', '佳利麦 泰国椰青泰国包邮9个原箱大果进口新鲜椰子汁送开椰器吸管', '180', '2018-05-08 16:23', '0', '椰青', '54.41', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10485', '中国椰青', '63.53', '72.57', '中国大陆', '10485', '5', '100', '0', '【小鲜柚】泰国椰青4只赠送开椰器椰子汁水进口新鲜水果多地包邮', '180', '2018-05-08 16:23', '0', '椰青', '48.16', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10486', '中国椰青', '42.26', '43.93', '中国大陆', '10486', '5', '92', '0', '展卉泰国新鲜椰子烤椰12个非海南印度椰皇椰青新鲜水果批发烧烤椰', '180', '2018-05-08 16:23', '0', '椰青', '40.47', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10487', '中国椰青', '65.20', '69.95', '中国大陆', '10487', '5', '100', '0', '展卉 椰青泰国包邮9个大号果进口香水椰新鲜椰子非海南椰皇椰奶冻', '180', '2018-05-08 16:23', '0', '椰青', '52.92', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10488', '文昌市椰青', '62.48', '64.80', '海南省文昌市', '10488', '5', '100', '0', '海南椰青新鲜椰子文昌现摘现发热带水果批发整箱6个青椰子非泰国', '180', '2018-05-08 16:23', '0', '椰青', '44.70', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10489', '中国椰青', '74.68', '79.65', '中国大陆', '10489', '5', '100', '0', '泰国椰皇小椰子新鲜水果6个水椰包邮烧烤椰懒懒椰耶子非海南椰青', '180', '2018-05-08 16:23', '0', '椰青', '60.32', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10490', '中国椰青', '70.45', '71.31', '中国大陆', '10490', '5', '100', '0', '易拉罐椰皇椰青1个 泰国进口拉环椰子买6个包邮 可定制logo礼盒装', '180', '2018-05-08 16:23', '0', '椰青', '58.41', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10491', '中国椰青', '43.37', '61.85', '中国大陆', '10491', '5', '100', '0', '【易果生鲜】懒懒椰泰国椰青2个700g/个 进口椰青 新鲜水果', '180', '2018-05-08 16:23', '0', '椰青', '40.41', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10492', '中国椰青', '42.58', '47.51', '中国大陆', '10492', '5', '100', '0', '歌慕 泰国进口椰青新鲜水果包邮大椰子椰汁椰奶冻香甜可口 9个装', '180', '2018-05-08 16:23', '0', '椰青', '42.01', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10493', '中国椰青', '51.58', '71.73', '中国大陆', '10493', '5', '100', '0', '展卉 泰国烤椰6个新鲜烤椰子新鲜水果椰青椰皇泰国烤耶天然无添加', '180', '2018-05-08 16:23', '0', '椰青', '43.65', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10494', '嘉兴市椰青', '50.15', '67.11', '浙江省嘉兴市', '10494', '5', '100', '0', '菲诺1+2黄金椰粒椰子冻椰子非蓝牌海南黒椰冻2个新鲜水果顺丰空运', '180', '2018-05-08 16:23', '0', '椰青', '40.02', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10495', '中国椰青', '71.22', '72.16', '中国大陆', '10495', '5', '100', '0', '懒懒椰泰国椰青9个原箱700g/个 椰子 新鲜水果', '180', '2018-05-08 16:23', '0', '椰青', '67.41', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10496', '三亚市椰青', '61.11', '78.38', '海南省三亚市', '10496', '5', '100', '0', '6个装大椰子海南三亚新鲜热带半野生嫩椰子青绿皮椰青果青椰子', '180', '2018-05-08 16:23', '0', '椰青', '50.59', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10497', '中国椰青', '44.03', '70.90', '中国大陆', '10497', '5', '100', '0', '【易果生鲜】懒懒椰泰国椰青4个700g/个椰青新鲜水果', '180', '2018-05-08 16:23', '0', '椰青', '43.57', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10498', '中国椰青', '62.81', '67.86', '中国大陆', '10498', '5', '100', '0', '懒懒椰泰国椰青2个700g/个椰子  新鲜水果', '180', '2018-05-08 16:23', '0', '椰青', '52.57', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10499', '中国椰青', '63.11', '64.15', '中国大陆', '10499', '5', '100', '0', '泰国椰青原箱9个装大号果进口椰青新鲜椰子水果包邮送开椰器吸管', '180', '2018-05-08 16:23', '0', '椰青', '48.69', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10500', '中国椰青', '72.17', '79.46', '中国大陆', '10500', '5', '100', '0', '【易果生鲜】懒懒椰泰国椰青9个进口新鲜椰青送开椰器', '180', '2018-05-08 16:23', '0', '椰青', '50.70', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10501', '中国椰青', '77.85', '78.23', '中国大陆', '10501', '5', '100', '0', 'avomone 泰国椰青9个 大号果 进口原箱新鲜水果椰子汁椰子椰青', '180', '2018-05-08 16:24', '0', '椰青', '68.84', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10502', '中国椰青', '62.98', '76.92', '中国大陆', '10502', '5', '100', '0', '本来生活 泰国进口椰青9个/原箱 赠开椰器 椰子 椰子新鲜', '180', '2018-05-08 16:24', '0', '椰青', '51.17', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10503', '三亚市椰青', '71.87', '73.66', '海南省三亚市', '10503', '5', '100', '0', '6个装海南三亚新鲜黄色金椰子带皮小个型椰子味水分甘甜', '180', '2018-05-08 16:24', '0', '椰青', '58.11', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10504', '中国椰青', '71.43', '73.02', '中国大陆', '10504', '5', '100', '0', '易拉罐椰皇椰青6个装礼盒 泰国进口新鲜椰子春节礼品年货水果顺丰', '180', '2018-05-08 16:24', '0', '椰青', '47.26', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10505', '文昌市椰青', '70.22', '75.52', '海南省文昌市', '10505', '5', '100', '0', '海南椰子新鲜水果批发包邮 文昌热带椰子水新鲜椰子大果9个装免邮', '180', '2018-05-08 16:24', '0', '椰青', '53.30', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10506', '中国椰青', '61.74', '67.31', '中国大陆', '10506', '5', '100', '0', '优霸 泰国椰青 9个 赠开椰器吸管 进口椰子泰国香水椰汁新鲜水果', '180', '2018-05-08 16:24', '0', '椰青', '45.32', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10507', '中国椰青', '50.30', '63.43', '中国大陆', '10507', '5', '100', '0', '懒懒椰泰国椰青4个700g/个 椰青椰子 新鲜水果', '180', '2018-05-08 16:24', '0', '椰青', '46.35', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10508', '中国椰青', '70.38', '78.43', '中国大陆', '10508', '5', '100', '0', '炫果多 泰国椰青9个 大号果 进口原箱新鲜水果椰子汁椰子送开椰器', '180', '2018-05-08 16:24', '0', '椰青', '46.84', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10509', '中国椰青', '70.76', '73.82', '中国大陆', '10509', '5', '100', '0', 'K FRESH 品牌原装进口泰国椰青9个包邮大果新鲜水果椰子送开椰器', '180', '2018-05-08 16:24', '0', '椰青', '68.04', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10510', '中国椰青', '71.91', '79.82', '中国大陆', '10510', '5', '100', '0', '泰国椰青新鲜椰子进口新鲜水果椰子汁送开椰器4个装包邮', '180', '2018-05-08 16:24', '0', '椰青', '57.82', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10511', '儋州市椰青', '79.64', '79.83', '海南省儋州市', '10511', '5', '100', '0', '海南椰青海南去皮椰子新鲜水果海南特产青椰子黄椰子椰子果2个装', '180', '2018-05-08 16:24', '0', '椰青', '69.15', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10512', '中国椰青', '41.33', '45.66', '中国大陆', '10512', '5', '100', '0', '懒懒椰泰国椰青9个装进口原箱新鲜水果椰子汁椰子送开椰器包邮', '180', '2018-05-08 16:24', '0', '椰青', '41.01', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10513', '中国椰青', '79.16', '79.30', '中国大陆', '10513', '5', '100', '0', '开袋即食型泰国进口易开椰皇4个装 不烧烤新鲜椰子更健康椰青包邮', '180', '2018-05-08 16:24', '0', '椰青', '44.48', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10514', '中国椰青', '60.91', '74.56', '中国大陆', '10514', '5', '100', '0', '泰国椰青2个 （约1.4kg） 椰子 新鲜水果 泰国水果 热带水果', '180', '2018-05-08 16:24', '0', '椰青', '50.60', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10515', '中国椰青', '78.14', '78.54', '中国大陆', '10515', '5', '100', '0', '泰国进口椰青椰子2个装原箱大果全国多省包邮送开椰器+吸管', '180', '2018-05-08 16:24', '0', '椰青', '67.35', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10516', '中国椰青', '51.04', '61.42', '中国大陆', '10516', '5', '100', '0', '上果 | 泰国进口椰青2个椰子椰子汁新鲜水果送开椰器两件顺丰包邮', '180', '2018-05-08 16:24', '0', '椰青', '40.91', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10517', '中国椰青', '77.66', '78.42', '中国大陆', '10517', '5', '100', '0', '泰国进口椰皇椰王椰子6个装新鲜水果批发包邮非椰青老椰子海南', '180', '2018-05-08 16:24', '0', '椰青', '45.81', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10518', '三亚市椰青', '44.80', '72.15', '海南省三亚市', '10518', '5', '100', '0', '【鲜悠味】海南白玉椰皇1400克以上/2个包邮新鲜老椰子椰青毛椰子', '180', '2018-05-08 16:24', '0', '椰青', '40.16', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10519', '南宁市椰青', '67.67', '70.93', '广西壮族自治区南宁市', '10519', '5', '100', '0', '【南国屋】海南新鲜水果青椰子 牛奶小香椰3个带皮椰青 超甜多汁', '180', '2018-05-08 16:24', '0', '椰青', '51.87', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10520', '中国椰青', '56.54', '57.53', '中国大陆', '10520', '5', '100', '0', '买1送1 共发4个 果郡王 泰国香水椰青  新鲜椰子椰水 进口水果', '180', '2018-05-08 16:24', '0', '椰青', '56.24', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10521', '中国椰青', '54.38', '67.57', '中国大陆', '10521', '5', '100', '0', '泰国椰青热带大椰子9颗装原装进口送开椰器椰汁新鲜水果多仓包邮', '180', '2018-05-08 16:24', '0', '椰青', '43.21', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10522', '中国椰青', '61.58', '65.36', '中国大陆', '10522', '5', '100', '0', '展卉 泰国烤椰4个进口新鲜烧烤椰子椰青椰皇椰肉批发整箱烧烤椰子', '180', '2018-05-08 16:24', '0', '椰青', '55.28', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10523', '嘉兴市椰青', '51.50', '66.94', '浙江省嘉兴市', '10523', '5', '100', '0', '菲诺椰子冻6个一箱 盒装新鲜黄金椰粒椰奶冻京津冀包邮次日达', '180', '2018-05-08 16:24', '0', '椰青', '48.65', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10524', '中国椰青', '59.26', '77.28', '中国大陆', '10524', '5', '100', '0', '【炫果多】泰国进口椰青4个装 约2.8KG 进口椰子椰汁水果送开椰器', '180', '2018-05-08 16:24', '0', '椰青', '41.30', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10525', '中国椰青', '73.71', '79.70', '中国大陆', '10525', '5', '100', '0', '懒懒椰泰国椰青1个700g/个（含开椰器）', '180', '2018-05-08 16:24', '0', '椰青', '63.08', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10526', '中国椰青', '69.94', '77.97', '中国大陆', '10526', '4', '100', '0', '泰国进口椰皇椰青6个装全国包邮泰国椰子新鲜水果 宝宝饮品', '180', '2018-05-08 16:24', '0', '椰青', '56.71', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10527', '中国椰青', '59.67', '73.78', '中国大陆', '10527', '5', '100', '0', '展卉 泰国进口椰青2个椰子汁煲汤水果新鲜孕妇水果椰奶椰子皇批发', '180', '2018-05-08 16:24', '0', '椰青', '50.13', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10528', '海口市椰青', '68.48', '69.72', '海南省海口市', '10528', '5', '100', '0', '海南新鲜水果青椰子 三亚特产包邮 清甜大老椰子 带青皮现摘3个装', '180', '2018-05-08 16:24', '0', '椰青', '65.85', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10529', '中国椰青', '66.73', '77.64', '中国大陆', '10529', '5', '100', '0', '泰国椰青4个 约700g/个 椰子 新鲜水果 泰国水果 进口水果', '180', '2018-05-08 16:24', '0', '椰青', '41.40', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10530', '嘉兴市椰青', '64.67', '79.68', '嘉兴市', '10530', '5', '100', '0', '菲诺椰子冻1个盒装椰冻约650克京津冀2个包邮其他省份4个包邮', '180', '2018-05-08 16:24', '0', '椰青', '62.44', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10531', '中国椰青', '78.33', '79.60', '中国大陆', '10531', '5', '100', '0', '泰国椰青9个原箱 新鲜水果 原箱包装 椰子 进口椰青', '180', '2018-05-08 16:24', '0', '椰青', '75.69', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10532', '中国椰青', '52.49', '68.28', '中国大陆', '10532', '5', '100', '0', '炫果多 泰国进口椰青2个 单果约700g 新鲜椰汁椰子水果送开椰器', '180', '2018-05-08 16:24', '0', '椰青', '45.80', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10533', '中国椰青', '57.89', '76.44', '中国大陆', '10533', '5', '100', '0', '展卉 椰青9个大号果包邮泰国进口新鲜椰子非海南椰皇椰奶椰子冻', '180', '2018-05-08 16:24', '0', '椰青', '53.69', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10534', '中国椰青', '42.72', '72.08', '中国大陆', '10534', '5', '100', '0', '展卉新鲜椰子泰国椰青2个烤椰非印度海南新鲜水果椰皇批发烧烤椰', '180', '2018-05-08 16:24', '0', '椰青', '41.57', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10535', '中国椰青', '59.35', '73.72', '中国大陆', '10535', '5', '100', '0', '上果 | 泰国香水椰青一箱9个装椰子椰子汁进口新鲜批发顺丰包邮', '180', '2018-05-08 16:25', '0', '椰青', '45.84', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10536', '中国椰青', '50.62', '71.42', '中国大陆', '10536', '5', '100', '0', '【买一送三 共发4个】泰国进口椰青新鲜椰子水果现摘现发 包邮', '180', '2018-05-08 16:25', '0', '椰青', '44.17', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10537', '中国番荔枝', '43.18', '45.83', '中国大陆', '10537', '5', '100', '0', '台湾进口凤梨释迦水果摩尼果5斤当季新鲜包邮菩提番荔枝佛头果', '180', '2018-05-08 16:25', '0', '番荔枝/释迦', '42.89', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10538', '三亚市番荔枝', '66.13', '74.69', '海南省三亚市', '10538', '4', '100', '0', '凤梨释迦果 新鲜水果番荔枝佛头果大目 释迦海南热带特产4斤装', '180', '2018-05-08 16:25', '0', '番荔枝/释迦', '60.17', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10539', '中国番荔枝', '51.13', '65.76', '中国大陆', '10539', '5', '100', '0', '7~8个泰国热带新鲜水果大目释迦果番荔枝佛头果牛奶冰琪淋释迦果', '180', '2018-05-08 16:25', '0', '番荔枝/释迦', '48.76', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10540', '中国番荔枝', '63.46', '71.29', '中国大陆', '10540', '4', '100', '0', '释莲台 释迦水果新鲜台湾凤梨释迦果 番荔枝 释迦 佛头果5斤大果', '180', '2018-05-08 16:25', '0', '番荔枝/释迦', '41.88', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10541', '中国番荔枝', '40.08', '57.29', '中国大陆', '10541', '5', '100', '0', '一果人生台湾进口凤梨释迦果精品大果3个装番荔枝佛头果新鲜水果', '180', '2018-05-08 16:25', '0', '番荔枝/释迦', '40.06', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10542', '中国番荔枝', '78.26', '79.28', '中国大陆', '10542', '4', '100', '0', '泰国进口释迦果 释迦摩尼果2只释加牟尼大果 新鲜佛头果顺丰包邮', '180', '2018-05-08 16:25', '0', '番荔枝/释迦', '69.63', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10543', '中国番荔枝', '63.98', '76.38', '中国大陆', '10543', '5', '100', '0', '台湾进口释迦果礼盒装释迦牟尼番荔枝佛头果新鲜水果5斤送礼团购', '180', '2018-05-08 16:25', '0', '番荔枝/释迦', '45.38', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10544', '中国番荔枝', '51.81', '61.89', '中国大陆', '10544', '3', '100', '0', '阳哥 台湾进口新鲜水果套餐组合 番荔枝凤梨释迦果/黑金刚莲雾果', '180', '2018-05-08 16:25', '0', '番荔枝/释迦', '45.93', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10545', '中国番荔枝', '58.71', '76.65', '中国大陆', '10545', '5', '100', '0', '乐拉 台湾释迦果佛头果新鲜番荔枝凤梨3斤装 孕妇水果顺丰空运', '180', '2018-05-08 16:25', '0', '番荔枝/释迦', '54.17', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10546', '中国番荔枝', '78.47', '79.20', '中国大陆', '10546', '5', '100', '0', '歌慕 台湾番荔枝释迦果新鲜水果批发包邮 释迦摩尼果佛头果 大果', '180', '2018-05-08 16:25', '0', '番荔枝/释迦', '74.48', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10547', '中国番荔枝', '49.92', '64.28', '中国大陆', '10547', '4', '100', '0', '释迦水果 5大个新鲜包邮促销斤释迦果番荔枝台湾凤梨佛头果5个装', '180', '2018-05-08 16:25', '0', '番荔枝/释迦', '47.71', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10548', '中国番荔枝', '64.82', '72.15', '中国大陆', '10548', '3', '100', '0', '【鲜果恋】台湾台东凤梨释迦果4斤（3', '180', '2018-05-08 16:25', '0', '番荔枝/释迦', '54.37', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10549', '中国番荔枝', '68.62', '75.08', '中国大陆', '10549', '4', '100', '0', '台湾进口凤梨释迦果番荔枝精选大果 原装箱11.5', '180', '2018-05-08 16:25', '0', '番荔枝/释迦', '65.66', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10550', '三亚市番荔枝', '68.35', '69.19', '海南省三亚市', '10550', '4', '100', '0', '海南部落 三亚新鲜水果 释迦果佛头果 10斤装凤梨释迦番荔枝 包邮', '180', '2018-05-08 16:25', '0', '番荔枝/释迦', '52.90', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10551', '中国番荔枝', '79.86', '79.95', '中国大陆', '10551', '5', '100', '0', '【全而廉】台湾凤梨释迦3只装约1KG 番荔枝佛头果 甜 新鲜水果', '180', '2018-05-08 16:25', '0', '番荔枝/释迦', '66.29', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10552', '中国番荔枝', '46.06', '47.55', '中国大陆', '10552', '4', '100', '0', '新鲜进口水果台湾凤梨释迦果 释迦 番荔枝 佛头果5斤装3个大果', '180', '2018-05-08 16:25', '0', '番荔枝/释迦', '41.11', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10553', '三亚市番荔枝', '76.31', '78.60', '海南省三亚市', '10553', '5', '100', '0', '5斤装大果3', '180', '2018-05-08 16:25', '0', '番荔枝/释迦', '50.08', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10554', '三亚市番荔枝', '68.20', '71.85', '海南省三亚市', '10554', '3', '100', '0', 'GREENHOW 海南新鲜水果非台湾进口 释迦凤梨  释迦果5斤顺丰包邮', '180', '2018-05-08 16:26', '0', '番荔枝/释迦', '57.11', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10555', '中国番荔枝', '76.62', '76.67', '中国大陆', '10555', '5', '100', '0', '释迦果水果 新鲜包邮 台湾凤梨刺果番荔枝佛陀果佛头果摩尼果大果', '180', '2018-05-08 16:26', '0', '番荔枝/释迦', '49.28', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10556', '三亚市番荔枝', '73.46', '76.96', '海南省三亚市', '10556', '4', '100', '0', '5斤 海南三亚释迦果番荔枝 新鲜水果 大目佛头果发货野生', '180', '2018-05-08 16:26', '0', '番荔枝/释迦', '62.43', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10557', '中国番荔枝', '74.77', '78.51', '中国大陆', '10557', '5', '100', '0', '阳哥 新鲜进口水果台湾凤梨释迦果 番荔枝  佛头果5斤装3个大果', '180', '2018-05-08 16:26', '0', '番荔枝/释迦', '58.87', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10558', '中国番荔枝', '52.16', '52.56', '中国大陆', '10558', '5', '100', '0', '【阳光鲜果】台湾凤梨释迦果4个(单个约300g)番荔枝 新鲜中通包', '180', '2018-05-08 16:26', '0', '番荔枝/释迦', '48.98', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10559', '中国番荔枝', '47.21', '76.10', '中国大陆', '10559', '5', '100', '0', '台湾凤梨释迦果5斤大果番荔枝佛头果胜泰国大目释迦新鲜水果空运', '180', '2018-05-08 16:26', '0', '番荔枝/释迦', '46.71', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10560', '中国番荔枝', '52.38', '61.88', '中国大陆', '10560', '5', '100', '0', '慧海 新鲜泰国进口释迦果热带水果番荔枝佛头果奶香释迦低价包邮', '180', '2018-05-08 16:26', '0', '番荔枝/释迦', '41.59', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10561', '中国番荔枝', '62.17', '76.27', '中国大陆', '10561', '5', '100', '0', '阳哥 新鲜进口水果台湾凤梨释迦果 番荔枝 释迦 佛头果5斤大果', '180', '2018-05-08 16:26', '0', '番荔枝/释迦', '42.63', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10562', '中国番荔枝', '56.05', '71.13', '中国大陆', '10562', '5', '100', '0', '【收藏送1斤发5斤】泰国进口番荔枝释迦果新鲜水果释加牟尼佛头果', '180', '2018-05-08 16:26', '0', '番荔枝/释迦', '43.06', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10563', '中国番荔枝', '70.76', '77.83', '中国大陆', '10563', '5', '100', '0', '树懒果园 台湾凤梨释迦果3只|单果400g+ 新鲜番荔枝 进口水果', '180', '2018-05-08 16:26', '0', '番荔枝/释迦', '70.48', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10564', '中国番荔枝', '70.17', '71.68', '中国大陆', '10564', '5', '100', '0', '缤果沃野 台湾释迦果特大新鲜佛头果番荔枝凤梨进口应季孕妇水果', '180', '2018-05-08 16:26', '0', '番荔枝/释迦', '46.50', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10565', '三亚市番荔枝', '42.43', '61.73', '海南省三亚市', '10565', '5', '100', '0', '海南三亚水果凤梨释迦番荔枝佛头果海南特产水果5斤装顺丰空运', '180', '2018-05-08 16:26', '0', '番荔枝/释迦', '41.12', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10566', '三亚市番荔枝', '51.15', '63.38', '海南省三亚市', '10566', '5', '100', '0', '海南三亚释迦果5斤4到6个装 佛头果牛奶凤梨释迦 番荔枝大目释迦', '180', '2018-05-08 16:27', '0', '番荔枝/释迦', '44.17', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10567', '中国番荔枝', '73.99', '78.83', '中国大陆', '10567', '5', '100', '0', '【上领顶】台湾番荔枝/释迦果 5斤装 佛头果 新鲜水果', '180', '2018-05-08 16:27', '0', '番荔枝/释迦', '58.47', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10568', '琼海市番荔枝', '50.99', '56.21', '海南省琼海市', '10568', '3', '100', '0', '海南新鲜水果释迦果台湾凤梨释迦果佛头果番荔枝5斤装包邮', '180', '2018-05-08 16:27', '0', '番荔枝/释迦', '50.75', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10569', '潮州市番荔枝', '62.05', '69.48', '广东省潮州市', '10569', '5', '100', '0', '释迦果新鲜3斤 台湾番荔枝释迦佛头果中果 新鲜牛奶释迦热带水果', '180', '2018-05-08 16:27', '0', '番荔枝/释迦', '60.71', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10570', '漳州市番荔枝', '58.19', '65.80', '福建省漳州市', '10570', '5', '100', '0', '台湾进口凤梨释迦果新鲜水果大果番荔枝释迦摩尼果佛头果5斤包邮', '180', '2018-05-08 16:27', '0', '番荔枝/释迦', '47.29', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10571', '三亚市番荔枝', '67.88', '76.34', '海南省三亚市', '10571', '4', '100', '0', '海南部落 三亚新鲜水果 释迦果佛头果 5斤装 凤梨释迦番荔枝 包邮', '180', '2018-05-08 16:27', '0', '番荔枝/释迦', '67.61', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10572', '三亚市番荔枝', '43.68', '67.60', '海南省三亚市', '10572', '5', '100', '0', '海南三亚释迦果3斤约3个 佛头果牛奶凤梨释迦 番荔枝大目释迦空运', '180', '2018-05-08 16:27', '0', '番荔枝/释迦', '42.97', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10573', '三亚市番荔枝', '73.48', '78.91', '海南省三亚市', '10573', '5', '100', '0', '海南凤梨释迦果 摩尼果新鲜水果佛头番荔枝3斤 肉滑爆甜 多省包邮', '180', '2018-05-08 16:27', '0', '番荔枝/释迦', '66.65', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10574', '中国番荔枝', '68.86', '79.91', '中国大陆', '10574', '5', '100', '0', '新鲜进口水果台湾凤梨释迦果 番荔枝 释迦 佛头果3斤大果', '180', '2018-05-08 16:27', '0', '番荔枝/释迦', '52.90', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10575', '海口市番荔枝', '74.42', '77.06', '海南省海口市', '10575', '5', '100', '0', '鲜万家 顺丰包邮新鲜水果海南释迦凤梨番荔枝非台湾进口5斤装', '180', '2018-05-08 16:27', '0', '番荔枝/释迦', '60.39', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10576', '中国番荔枝', '70.69', '79.84', '中国大陆', '10576', '4', '100', '0', '【阳哥】台湾凤梨释迦果/番荔枝 原装箱11.5', '180', '2018-05-08 16:27', '0', '番荔枝/释迦', '61.11', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10577', '中国番荔枝', '61.82', '77.95', '中国大陆', '10577', '4', '100', '0', '台湾进口释迦果 释迦摩尼果 牛奶佛头果货凤梨刺果番荔枝新鲜水果', '180', '2018-05-08 16:27', '0', '番荔枝/释迦', '50.58', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10578', '中国番荔枝', '58.63', '76.40', '中国大陆', '10578', '5', '100', '0', '7~8个果泰国释迦果番荔枝释迦摩尼果装新鲜时令热带水果番鬼荔枝', '180', '2018-05-08 16:27', '0', '番荔枝/释迦', '50.97', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10579', '中国番荔枝', '67.53', '79.49', '中国大陆', '10579', '5', '100', '0', '台湾释迦果水果凤梨释迦果番荔枝释迦佛头果4斤', '180', '2018-05-08 16:27', '0', '番荔枝/释迦', '65.93', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10580', '中国番荔枝', '41.52', '45.37', '中国大陆', '10580', '4', '100', '0', '释迦水果 5大个 新鲜番荔枝斤 凤梨释迦果 佛头果 4', '180', '2018-05-08 16:27', '0', '番荔枝/释迦', '40.00', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10581', '中国番荔枝', '48.59', '57.10', '中国大陆', '10581', '4', '100', '0', '歌慕 泰国进口大目释迦果番荔枝佛头果新鲜水果包邮 5斤装', '180', '2018-05-08 16:27', '0', '番荔枝/释迦', '42.69', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10597', '中国龙眼', '76.80', '77.11', '中国大陆', '10597', '4', '100', '0', '泰国新鲜龙眼带包装2kg/4斤泰国进口新鲜龙眼新鲜桂圆去枝净果', '180', '2018-05-08 16:27', '0', '龙眼', '48.87', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10598', '中国龙眼', '76.72', '78.03', '中国大陆', '10598', '5', '100', '0', '佳利麦 桂圆新鲜泰国水果新鲜龙眼 1斤装进口水果 4份全国包邮', '180', '2018-05-08 16:27', '0', '龙眼', '70.27', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10599', '漳州市龙眼', '52.61', '73.18', '福建省漳州市', '10599', '5', '100', '0', '顺丰包邮现摘现发 福建石硖龙眼桂圆 新鲜水果 5斤装 非泰国龙眼', '180', '2018-05-08 16:27', '0', '龙眼', '46.42', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10600', '中国龙眼', '54.30', '59.89', '中国大陆', '10600', '5', '99', '0', '【果王佳园】泰国龙眼桂圆进口水果4斤去枝净果新鲜龙眼桂圆', '180', '2018-05-08 16:27', '0', '龙眼', '50.02', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10601', '中国龙眼', '73.09', '77.97', '中国大陆', '10601', '5', '100', '0', '【小鲜柚】泰国龙眼4斤装 进口大桂圆新鲜热带时水果', '180', '2018-05-08 16:27', '0', '龙眼', '50.49', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10602', '中国龙眼', '56.64', '70.56', '中国大陆', '10602', '4', '100', '0', '优霸 泰国龙眼 2斤 顺丰冰袋 新鲜龙眼 桂圆 进口龙眼 新鲜水果', '180', '2018-05-08 16:28', '0', '龙眼', '41.89', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10603', '中国龙眼', '70.20', '72.37', '中国大陆', '10603', '3', '100', '0', '【全而廉】泰国龙眼2斤 新鲜桂圆 进口水果', '180', '2018-05-08 16:28', '0', '龙眼', '58.17', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10604', '中国龙眼', '70.07', '73.99', '中国大陆', '10604', '5', '100', '0', '【苏洪鲜食】泰国龙眼新鲜桂圆 2 斤新鲜水果 坏单包退', '180', '2018-05-08 16:28', '0', '龙眼', '55.44', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10605', '中国龙眼', '43.21', '79.28', '中国大陆', '10605', '5', '100', '0', '泰国龙眼2kg 新鲜桂圆 进口水果 新鲜水果', '180', '2018-05-08 16:28', '0', '龙眼', '40.68', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10606', '中国龙眼', '40.54', '67.31', '中国大陆', '10606', '4', '100', '0', '【果王佳园】泰国龙眼2斤新鲜桂圆进口水果净果新鲜龙眼', '180', '2018-05-08 16:28', '0', '龙眼', '40.26', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10607', '三亚市龙眼', '59.22', '79.39', '海南省三亚市', '10607', '4', '100', '0', '发顺丰  海南三亚新鲜水果龙眼鲜桂圆1500g肉厚香甜', '180', '2018-05-08 16:28', '0', '龙眼', '56.91', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10608', '中国龙眼', '70.19', '78.23', '中国大陆', '10608', '5', '100', '0', '齐峰缘 进口泰国龙眼新鲜龙眼 热带应季水果鲜桂圆', '180', '2018-05-08 16:28', '0', '龙眼', '50.94', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10609', '中国龙眼', '67.79', '79.04', '中国大陆', '10609', '5', '100', '0', '美果汇泰国进口新鲜去枝龙眼桂圆4斤年货礼盒装 新鲜热带水果', '180', '2018-05-08 16:28', '0', '龙眼', '48.01', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10610', '中国龙眼', '42.83', '75.25', '中国大陆', '10610', '4', '100', '0', '进口龙眼桂圆 礼盒原箱2.5kg 去枝去杆 新鲜 SG', '180', '2018-05-08 16:28', '0', '龙眼', '42.26', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10611', '中国龙眼', '74.70', '79.01', '中国大陆', '10611', '5', '100', '0', '泰国龙眼新鲜桂圆热带桂圆进口小核金标龙眼水果肉厚5斤装包邮', '180', '2018-05-08 16:28', '0', '龙眼', '62.88', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10612', '中国龙眼', '59.80', '61.91', '中国大陆', '10612', '4', '100', '0', '优霸 泰国龙眼 4斤 顺丰冰袋 新鲜龙眼 桂圆 进口龙眼 新鲜水果', '180', '2018-05-08 16:28', '0', '龙眼', '52.49', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10613', '中国龙眼', '64.85', '72.82', '中国大陆', '10613', '4', '100', '0', '易果生鲜 泰国龙眼1kg 进口热带湿桂圆2斤装水果特价', '180', '2018-05-08 16:28', '0', '龙眼', '46.03', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10614', '中国龙眼', '53.08', '69.00', '中国大陆', '10614', '5', '100', '0', '买1送1 共发3斤 果郡王 泰国龙眼 热带新鲜去枝桂圆 新鲜进口水果', '180', '2018-05-08 16:28', '0', '龙眼', '44.94', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10615', '南宁市龙眼', '48.81', '63.82', '广西壮族自治区南宁市', '10615', '1', '100', '0', '龙眼干', '180', '2018-05-08 16:28', '0', '龙眼', '45.88', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10616', '中国龙眼', '49.46', '52.12', '中国大陆', '10616', '5', '100', '0', '【买3免邮】泰国进口龙眼1斤装 新鲜桂圆甜新鲜水果去枝净果', '180', '2018-05-08 16:28', '0', '龙眼', '48.19', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10617', '临沧市龙眼', '61.89', '76.34', '云南省临沧市', '10617', '4', '100', '0', '新鲜龙眼 5斤装 桂圆龙眼 肉干新鲜水果 云南临沧  XF 生鲜', '180', '2018-05-08 16:28', '0', '龙眼', '52.51', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10618', '中国龙眼', '67.05', '75.28', '中国大陆', '10618', '5', '100', '0', '尚顿进口水果泰国龙眼颗粒饱满桂圆甜口热带水果1KG装水嫩多汁', '180', '2018-05-08 16:28', '0', '龙眼', '54.05', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10619', '中国龙眼', '62.26', '71.73', '中国大陆', '10619', '5', '100', '0', '泰国进口龙眼桂圆新鲜水果5斤包邮热带水果肉厚鲜甜多汁核小去枝', '180', '2018-05-08 16:29', '0', '龙眼', '52.46', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10620', '中国龙眼', '72.08', '78.88', '中国大陆', '10620', '5', '100', '0', '泰国龙眼500g（天津）', '180', '2018-05-08 16:29', '0', '龙眼', '69.53', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10621', '北海市龙眼', '68.67', '71.80', '广西壮族自治区北海市', '10621', '4', '100', '0', '广西龙眼 新鲜桂圆非高州储良3斤装现摘水果', '180', '2018-05-08 16:29', '0', '龙眼', '41.55', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10622', '中国龙眼', '41.57', '54.86', '中国大陆', '10622', '5', '100', '0', '泰国龙眼600g', '180', '2018-05-08 16:29', '0', '龙眼', '40.52', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10623', '中国龙眼', '73.89', '76.81', '中国大陆', '10623', '5', '100', '0', 'avomone 泰国进口龙眼4斤装 去枝 小核新鲜桂圆水果湿桂圆包邮', '180', '2018-05-08 16:29', '0', '龙眼', '61.52', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10624', '中国龙眼', '45.81', '56.91', '中国大陆', '10624', '5', '100', '0', '新鲜龙眼水果泰国金标龙眼3斤装进口好吃水果批发顺丰包邮', '180', '2018-05-08 16:29', '0', '龙眼', '43.80', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10625', '昆明市龙眼', '54.04', '67.65', '云南省昆明市', '10625', '1', '100', '0', '拾蘑菇 新鲜龙眼 新鲜桂圆 小核 水果 云南特产 包邮 3斤', '180', '2018-05-08 16:29', '0', '龙眼', '40.74', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10626', '中国龙眼', '66.22', '78.30', '中国大陆', '10626', '5', '100', '0', '泰国进口龙眼新鲜桂圆 4斤装 热带进口水果批发新鲜水果 包邮', '180', '2018-05-08 16:29', '0', '龙眼', '40.37', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10627', '中国龙眼', '49.08', '71.70', '中国大陆', '10627', '5', '100', '0', '尚顿泰国新鲜龙眼进口水果桂圆水嫩多汁热带多汁水果4斤装2000g', '180', '2018-05-08 16:29', '0', '龙眼', '46.79', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10628', '三亚市龙眼', '52.37', '54.88', '海南省三亚市', '10628', '5', '100', '0', '海南三亚龙眼 新鲜桂圆 海南龙眼 肉厚 空运 5斤装顺丰空运', '180', '2018-05-08 16:29', '0', '龙眼', '40.95', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10629', '中国龙眼', '41.93', '56.85', '中国大陆', '10629', '5', '100', '0', '泰国新鲜龙眼热带进口水果2斤新鲜应季现货水果', '180', '2018-05-08 16:29', '0', '龙眼', '41.39', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10630', '中国龙眼', '64.60', '73.98', '中国大陆', '10630', '5', '100', '0', '买一送一 齐峰缘 泰国进口龙眼新鲜龙眼热带应季热带水果', '180', '2018-05-08 16:29', '0', '龙眼', '64.09', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10631', '中国龙眼', '44.28', '69.31', '中国大陆', '10631', '5', '100', '0', '土巴吉 泰国龙眼批发新鲜进口水果桂圆2斤装热带水果现发包邮', '180', '2018-05-08 16:29', '0', '龙眼', '41.15', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10632', '乐东黎族自治县龙眼', '69.65', '78.64', '海南省乐东黎族自治县', '10632', '5', '100', '0', '顺丰包邮 新鲜水果 海南龙眼 桂圆乐东龙眼 非泰国龙眼 3斤装', '180', '2018-05-08 16:29', '0', '龙眼', '47.82', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10633', '中国龙眼', '63.15', '68.08', '中国大陆', '10633', '5', '100', '0', '树懒果园 泰国进口龙眼3斤 新鲜时令桂圆 热带水果', '180', '2018-05-08 16:29', '0', '龙眼', '47.13', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10634', '中国龙眼', '53.43', '78.35', '中国大陆', '10634', '5', '100', '0', '【买一送一】齐峰缘 泰国进口龙眼500g 热带新鲜水果新鲜桂圆', '180', '2018-05-08 16:29', '0', '龙眼', '50.45', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10635', '中国龙眼', '47.03', '58.53', '中国大陆', '10635', '5', '100', '0', '泰国龙眼250g', '180', '2018-05-08 16:29', '0', '龙眼', '40.45', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10636', '中国龙眼', '68.10', '69.61', '中国大陆', '10636', '5', '100', '0', '正宗泰国龙眼3斤装新鲜水果非广西高州石硖储良桂圆顺丰空运', '180', '2018-05-08 16:29', '0', '龙眼', '49.86', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10637', '中国龙眼', '60.82', '71.06', '中国大陆', '10637', '5', '100', '0', '歌慕 泰国龙眼新鲜桂圆热带进口水果批发 2斤装 部分地区包邮', '180', '2018-05-08 16:29', '0', '龙眼', '40.07', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10638', '海口市龙眼', '77.94', '79.85', '海南省海口市', '10638', '5', '100', '0', '顺丰空运海南新鲜桂圆龙眼三亚水果原产发货石夹龙眼 3斤装 空运', '180', '2018-05-08 16:30', '0', '龙眼', '67.29', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10639', '中国龙眼', '60.26', '70.41', '中国大陆', '10639', '5', '100', '0', '港渔记新鲜泰国龙眼进口水果桂圆水嫩多汁热带多汁水果5斤装', '180', '2018-05-08 16:30', '0', '龙眼', '44.33', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10640', '中国龙眼', '41.59', '66.70', '中国大陆', '10640', '5', '100', '0', '【易果生鲜】泰国龙眼2kg', '180', '2018-05-08 16:30', '0', '龙眼', '41.21', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10641', '中国龙眼', '64.22', '67.02', '中国大陆', '10641', '5', '100', '0', '自然之灵现货新鲜进口泰国龙眼鲜桂圆热带水果 鲜甜多汁 5斤包邮', '180', '2018-05-08 16:30', '0', '龙眼', '45.76', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10642', '中国龙眼', '41.89', '68.80', '中国大陆', '10642', '5', '100', '0', '【小心柑儿】现货泰国龙眼新鲜现摘水果批发包邮桂圆去枝非龙眼干', '180', '2018-05-08 16:30', '0', '龙眼', '41.31', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10643', '莆田市龙眼', '52.55', '68.02', '福建省莆田市', '10643', '1', '100', '0', '龙眼2500g', '180', '2018-05-08 16:30', '0', '龙眼', '50.16', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10644', '中国龙眼', '59.70', '78.82', '中国大陆', '10644', '5', '100', '0', '泰国龙眼进口桂圆新鲜水果4斤包邮热带水果核小肉厚鲜甜多汁去枝', '180', '2018-05-08 16:30', '0', '龙眼', '58.07', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10645', '中国龙眼', '64.48', '78.11', '中国大陆', '10645', '5', '100', '0', '【阳光鲜果】泰国金标龙眼（5斤/2500g）进口龙眼桂圆 中通包邮', '180', '2018-05-08 16:30', '0', '龙眼', '58.34', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10646', '中国龙眼', '64.39', '77.54', '中国大陆', '10646', '5', '100', '0', '帝鸿农 泰国龙眼2斤鲜桂圆进口现摘新鲜水果', '180', '2018-05-08 16:30', '0', '龙眼', '54.23', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10647', '中国龙眼', '65.16', '70.07', '中国大陆', '10647', '4', '100', '0', '悠乐果 泰国进口龙眼4斤装 桂圆 新鲜水果 进口热带水果', '180', '2018-05-08 16:30', '0', '龙眼', '57.28', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10648', '中国龙眼', '71.00', '75.67', '中国大陆', '10648', '5', '100', '0', '帝鸿农 泰国龙眼500g鲜桂圆进口现摘新鲜水果', '180', '2018-05-08 16:30', '0', '龙眼', '53.43', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10649', '中国龙眼', '77.91', '78.14', '中国大陆', '10649', '5', '100', '0', '世果汇 泰国进口龙眼 热带新鲜水果 桂圆包邮', '180', '2018-05-08 16:30', '0', '龙眼', '61.98', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10650', '中国龙眼', '67.81', '75.38', '中国大陆', '10650', '5', '100', '0', '泰国龙眼进口新鲜水果桂圆5斤包邮热带水果肉厚核小鲜甜多汁去枝', '180', '2018-05-08 16:30', '0', '龙眼', '63.22', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10651', '中国龙眼', '61.47', '75.13', '中国大陆', '10651', '5', '100', '0', '泰国龙眼1kg 新鲜桂圆 进口热带水果 新鲜 龙眼', '180', '2018-05-08 16:30', '0', '龙眼', '47.40', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10652', '中国龙眼', '58.91', '77.49', '中国大陆', '10652', '5', '100', '0', '炫果多 4斤装泰国进口龙眼 去枝 小核新鲜桂圆水果湿桂圆去枝龙眼', '180', '2018-05-08 16:30', '0', '龙眼', '50.88', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10653', '中国龙眼', '77.30', '78.16', '中国大陆', '10653', '5', '100', '0', '新鲜龙眼水果泰国蓝标龙眼3斤装 新鲜桂圆进口水果龙眼 顺丰包邮', '180', '2018-05-08 16:30', '0', '龙眼', '60.54', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10654', '中国龙眼', '41.17', '45.86', '中国大陆', '10654', '5', '100', '0', '泰国龙眼500g', '180', '2018-05-08 16:30', '0', '龙眼', '40.97', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10655', '中国龙眼', '55.02', '76.95', '中国大陆', '10655', '5', '100', '0', '本来生活 泰国进口新鲜龙眼约2斤包邮  热带水果 鲜桂圆 泰国龙眼', '180', '2018-05-08 16:31', '0', '龙眼', '44.73', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10656', '中国龙眼', '66.93', '66.99', '中国大陆', '10656', '5', '100', '0', '【果王佳园】泰国进口龙眼 新鲜水果桂圆3斤装 去枝净果', '180', '2018-05-08 16:31', '0', '龙眼', '66.15', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10717', '巴音郭楞蒙古自治州梨', '52.64', '73.30', '新疆维吾尔族自治区巴音郭楞蒙古自治州', '10717', '5', '100', '0', '新疆库尔勒香梨 新鲜水果斤现摘脆甜梨子整箱5批发包邮非全母梨', '180', '2018-05-08 16:31', '0', '梨', '44.67', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10718', '中国梨', '44.85', '52.90', '中国大陆', '10718', '5', '100', '0', '【买一送一】比利时Truval啤梨10只装 单果大于120g', '180', '2018-05-08 16:31', '0', '梨', '44.39', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10719', '库尔勒市梨', '59.24', '62.46', '新疆维吾尔族自治区库尔勒市', '10719', '5', '100', '0', '梨子香梨新疆库尔勒包邮拍两件10斤批发水果包邮新鲜整箱小香梨', '180', '2018-05-08 16:31', '0', '梨', '40.37', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10720', '库尔勒市梨', '46.49', '63.17', '新疆维吾尔族自治区库尔勒市', '10720', '5', '100', '0', '升森水果 新疆库尔勒香梨现摘特产梨子新鲜水果整箱批发包邮', '180', '2018-05-08 16:31', '0', '梨', '42.73', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10721', '库尔勒市梨', '57.39', '78.48', '新疆维吾尔族自治区库尔勒市', '10721', '5', '100', '0', '新疆库尔勒香梨一级小梨子2.5斤装新鲜孕妇水果整箱批发包邮', '180', '2018-05-08 16:31', '0', '梨', '52.03', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10722', '石家庄市梨', '72.53', '73.42', '河北省石家庄市', '10722', '5', '100', '0', '爱亚汇河北赵州雪梨水果新鲜整箱梨子比鸭梨香梨营养雪花梨5斤装', '180', '2018-05-08 16:31', '0', '梨', '45.93', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10723', '库尔勒市梨', '77.32', '79.33', '新疆维吾尔族自治区库尔勒市', '10723', '5', '100', '0', '升森水果 新疆库尔勒香梨现摘特产梨子新鲜水果整箱批发包邮', '180', '2018-05-08 16:31', '0', '梨', '40.10', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10724', '库尔勒市梨', '74.31', '74.53', '新疆维吾尔族自治区库尔勒市', '10724', '5', '100', '0', '齐峰缘新疆库尔勒香梨新鲜特产甜梨青梨子批发孕妇水果', '180', '2018-05-08 16:31', '0', '梨', '72.43', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10725', '聊城市梨', '63.97', '72.54', '山东省聊城市', '10725', '5', '100', '0', '梨子水果新鲜当季整箱丰水梨山东莱阳梨香梨黄晶梨水晶梨5斤脆甜', '180', '2018-05-08 16:31', '0', '梨', '46.39', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10726', '烟台市梨', '67.96', '74.58', '山东省烟台市', '10726', '5', '100', '0', '现货莱阳丰水梨新鲜应季脆梨子现摘现发新鲜水果5斤包邮非红啤梨', '180', '2018-05-08 16:31', '0', '梨', '57.53', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10727', '徐州市梨', '79.03', '79.84', '江苏省徐州市', '10727', '5', '100', '0', '新鲜翠冠青梨酥梨10斤水果梨子砀山梨香梨雪梨皇冠梨包邮', '180', '2018-05-08 16:31', '0', '梨', '76.92', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10728', '中国梨', '76.92', '77.39', '中国大陆', '10728', '5', '100', '0', '新疆库尔勒香梨2kg100g以上/个 生梨 梨子 时令水果 新鲜', '180', '2018-05-08 16:31', '0', '梨', '59.11', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10729', '中国梨', '79.61', '79.86', '中国大陆', '10729', '5', '100', '0', '满69减20新疆库尔勒精选香梨1kg120g以上/个 梨子 新鲜水果', '180', '2018-05-08 16:31', '0', '梨', '56.12', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10730', '中国梨', '78.62', '79.89', '中国大陆', '10730', '5', '100', '0', '新疆天山雪梨1.5kg180g以上/个梨子 新鲜水果', '180', '2018-05-08 16:31', '0', '梨', '54.01', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10731', '库尔勒市梨', '49.64', '50.03', '新疆维吾尔族自治区库尔勒市', '10731', '5', '100', '0', '新疆库尔勒一级香梨当季现摘特产梨子新鲜水果5斤批发包邮2件10斤', '180', '2018-05-08 16:32', '0', '梨', '45.87', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10732', '库尔勒市梨', '65.46', '69.70', '新疆维吾尔族自治区库尔勒市', '10732', '5', '100', '0', '淘乡甜库尔勒小香梨4斤100', '180', '2018-05-08 16:32', '0', '梨', '42.69', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10733', '库尔勒市梨', '57.56', '60.90', '新疆维吾尔族自治区库尔勒市', '10733', '5', '100', '0', '新疆特产库尔勒香梨梨子当季新鲜水果一件5斤整箱批发包邮2件10斤', '180', '2018-05-08 16:32', '0', '梨', '42.02', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10734', '西安市梨', '61.16', '62.75', '陕西省西安市', '10734', '5', '100', '0', '陕西特产蒲城酥梨胜砀山梨新鲜水果促销脆甜冰爽5斤包邮 新鲜整箱', '180', '2018-05-08 16:32', '0', '梨', '59.72', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10735', '巴音郭楞蒙古自治州梨', '41.85', '51.82', '新疆维吾尔族自治区巴音郭楞蒙古自治州', '10735', '5', '100', '0', '新疆库尔勒香梨5斤一级新鲜水果梨子整箱顺丰包邮非砀山梨皇冠梨', '180', '2018-05-08 16:32', '0', '梨', '41.26', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10736', '中国梨', '57.26', '78.88', '中国大陆', '10736', '5', '100', '0', '新疆库尔勒香梨4kg100g以上/个 梨子水果', '180', '2018-05-08 16:32', '0', '梨', '43.20', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10737', '中国梨', '53.14', '69.96', '中国大陆', '10737', '5', '100', '0', '河北皇冠梨4个200g以上/个 新鲜水果 国产梨', '180', '2018-05-08 16:32', '0', '梨', '40.26', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10738', '徐州市梨', '70.56', '74.28', '江苏省徐州市', '10738', '5', '100', '0', '梨子水果批发包邮 新鲜 当季整箱 正宗砀山梨酥梨水晶皇冠梨', '180', '2018-05-08 16:32', '0', '梨', '67.15', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10739', '中国梨', '66.02', '75.18', '中国大陆', '10739', '5', '100', '0', '河北皇冠梨2个200g以上/个 梨子 新鲜水果', '180', '2018-05-08 16:32', '0', '梨', '61.89', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10740', '中国梨', '60.62', '69.10', '中国大陆', '10740', '4', '100', '0', '歌慕 美国进口红啤梨新鲜水果包邮 3斤装', '180', '2018-05-08 16:32', '0', '梨', '49.38', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10741', '中国梨', '67.36', '73.14', '中国大陆', '10741', '5', '100', '0', '新疆库尔勒精选香梨3kg120g以上/个 梨子 香酥梨 国产新鲜水果', '180', '2018-05-08 16:32', '0', '梨', '58.19', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10742', '中国梨', '48.49', '73.97', '中国大陆', '10742', '5', '100', '0', '河北皇冠梨2个200g以上/个', '180', '2018-05-08 16:32', '0', '梨', '42.07', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10743', '宿州市梨', '76.94', '79.64', '安徽省宿州市', '10743', '5', '100', '0', '美味连连 10斤新鲜梨子现摘整箱砀山酥梨批发雪梨新鲜水果', '180', '2018-05-08 16:32', '0', '梨', '44.03', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10744', '库尔勒市梨', '63.78', '74.56', '新疆维吾尔族自治区库尔勒市', '10744', '5', '100', '0', '新疆库尔勒香梨 现摘特产梨子新鲜水果整箱批发5斤拍2件约10斤', '180', '2018-05-08 16:32', '0', '梨', '63.59', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10745', '青岛市梨', '60.78', '62.32', '山东省青岛市', '10745', '5', '100', '0', '新鲜水果梨南水梨山东特产脆甜梨子莱阳可带皮吃非雪梨5斤包邮', '180', '2018-05-08 16:32', '0', '梨', '51.75', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10746', '临汾市梨', '78.91', '79.47', '山西省临汾市', '10746', '5', '100', '0', '山西隰县玉露香梨新鲜水果梨子整箱5斤赛库尔勒香梨砀山南国雪梨', '180', '2018-05-08 16:32', '0', '梨', '57.09', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10747', '石家庄市梨', '48.67', '63.76', '河北省石家庄市', '10747', '5', '100', '0', '赵县雪梨正宗雪花梨河北特产新鲜水果皇冠梨雪梨水晶梨10斤', '180', '2018-05-08 16:32', '0', '梨', '47.95', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10748', '中国梨', '70.31', '76.06', '中国大陆', '10748', '5', '100', '0', '山东丰水梨4个300g以上/个 新鲜水果 生梨', '180', '2018-05-08 16:32', '0', '梨', '43.41', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10749', '库尔勒市梨', '46.68', '49.33', '新疆维吾尔族自治区库尔勒市', '10749', '5', '100', '0', '新疆库尔勒香梨新鲜水果梨子整箱8斤 送1斤 实发9斤 送若羌灰枣', '180', '2018-05-08 16:32', '0', '梨', '45.33', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10750', '巴音郭楞蒙古自治州梨', '56.62', '78.21', '新疆维吾尔族自治区巴音郭楞蒙古自治州', '10750', '5', '100', '0', '新疆库尔勒特级香梨5斤新鲜水果特产整箱包邮非砀山酥梨皇冠梨子', '180', '2018-05-08 16:33', '0', '梨', '43.76', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10751', '徐州市梨', '47.90', '60.95', '江苏省徐州市', '10751', '5', '100', '0', '梨子砀山梨酥梨香梨雪梨贡梨皇冠梨批发当季水果包邮新鲜整箱10斤', '180', '2018-05-08 16:33', '0', '梨', '45.52', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10752', '库尔勒市梨', '47.37', '63.99', '新疆维吾尔族自治区库尔勒市', '10752', '5', '100', '0', '买一送一 齐峰缘新疆库尔勒香梨新鲜特产甜梨青梨子批发孕妇水果', '180', '2018-05-08 16:33', '0', '梨', '44.22', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10753', '石家庄市梨', '78.51', '79.61', '河北省石家庄市', '10753', '5', '100', '0', '果蜜集 皇冠梨新鲜梨子5斤包邮水果批发河北特产水晶梨鸭梨雪花梨', '180', '2018-05-08 16:33', '0', '梨', '53.01', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10754', '烟台市梨', '60.13', '61.04', '山东省烟台市', '10754', '5', '100', '0', '正宗莱阳特产丰水梨梨子新鲜水果脆甜非黄金梨秋月梨莱阳梨5斤装', '180', '2018-05-08 16:33', '0', '梨', '47.82', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10755', '宿州市梨', '62.87', '63.38', '安徽省宿州市', '10755', '5', '100', '0', '安徽正宗砀山酥梨砀山梨贡梨10斤非现摘水果新鲜梨子香梨雪梨包邮', '180', '2018-05-08 16:33', '0', '梨', '41.56', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10756', '宿州市梨', '51.40', '67.97', '安徽省宿州市', '10756', '5', '100', '0', '现摘新鲜酥梨10斤当季水果蜜梨砀山特产整箱梨子批发包邮', '180', '2018-05-08 16:33', '0', '梨', '50.08', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10757', '库尔勒市梨', '79.59', '79.70', '新疆维吾尔族自治区库尔勒市', '10757', '5', '100', '0', '新疆特产库尔勒香梨一级小梨子5斤孕妇新鲜水果整箱批发包邮', '180', '2018-05-08 16:33', '0', '梨', '65.16', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10758', '渭南市梨', '77.21', '78.52', '陕西省渭南市', '10758', '5', '100', '0', '太阳果 陕西蒲城贡梨5斤新鲜水果酥脆多汁梨子批发包邮', '180', '2018-05-08 16:33', '0', '梨', '61.89', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10759', '库尔勒市梨', '77.25', '77.29', '新疆维吾尔族自治区库尔勒市', '10759', '5', '100', '0', '升森水果 新疆库尔勒香梨 现摘特产梨子新鲜水果整箱批发包邮', '180', '2018-05-08 16:33', '0', '梨', '56.37', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10760', '临汾市梨', '74.11', '75.90', '山西省临汾市', '10760', '5', '100', '0', '隰县甜雪梨皇冠梨子5kg水果新鲜整箱10斤酥梨鸭梨贡梨香梨水晶梨', '180', '2018-05-08 16:33', '0', '梨', '50.80', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10761', '库尔勒市梨', '73.60', '74.44', '新疆维吾尔族自治区库尔勒市', '10761', '5', '100', '0', '新疆库尔勒香梨新鲜水果梨子整箱净重5斤坏果包赔 水果批发包邮', '180', '2018-05-08 16:33', '0', '梨', '66.93', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10762', '中国梨', '42.99', '49.66', '中国大陆', '10762', '5', '100', '0', '新疆库尔勒香梨500g100g以上/个', '180', '2018-05-08 16:33', '0', '梨', '42.42', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10763', '库尔勒市梨', '62.28', '64.02', '新疆维吾尔族自治区库尔勒市', '10763', '5', '100', '0', '新疆库尔勒香梨 现摘特产梨子新鲜水果整箱批发拍5斤送5斤 发10斤', '180', '2018-05-08 16:33', '0', '梨', '51.30', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10764', '库尔勒市梨', '44.28', '50.48', '新疆维吾尔族自治区库尔勒市', '10764', '5', '100', '0', '【鲜果来了】新疆库尔勒香梨公母梨梨子10', '180', '2018-05-08 16:33', '0', '梨', '42.86', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10765', '库尔勒市梨', '63.85', '76.28', '新疆维吾尔族自治区库尔勒市', '10765', '5', '100', '0', '库尔勒香梨新疆一级小梨子当季孕妇新鲜水果2.5斤整箱批发包邮', '180', '2018-05-08 16:33', '0', '梨', '46.01', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10766', '中国梨', '76.99', '78.67', '中国大陆', '10766', '5', '100', '0', '【洋果坊】比利时Truval啤梨6只装 进口梨 水果 单果160g以上', '180', '2018-05-08 16:33', '0', '梨', '63.47', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10767', '库尔勒市梨', '70.39', '70.95', '新疆维吾尔族自治区库尔勒市', '10767', '3', '100', '0', '新疆库尔勒香梨新鲜水果整箱批发约5包邮小香梨子 拍2件发10斤', '180', '2018-05-08 16:33', '0', '梨', '45.77', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10768', '烟台市梨', '62.91', '67.02', '山东省烟台市', '10768', '5', '100', '0', '甜 新鲜丰水梨 山东烟台莱阳梨 梨子水果秋月梨非南果梨10斤包邮', '180', '2018-05-08 16:33', '0', '梨', '44.77', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10769', '石家庄市梨', '71.61', '76.35', '河北省石家庄市', '10769', '5', '100', '0', '皇冠梨新鲜水果梨子整箱10斤批发包邮当季雪梨砀山梨酥梨香梨贡梨', '180', '2018-05-08 16:33', '0', '梨', '47.32', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10770', '中国梨', '58.07', '77.55', '中国大陆', '10770', '5', '100', '0', '库尔勒香梨1盒(6个/盒)100g以上/个', '180', '2018-05-08 16:33', '0', '梨', '40.19', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10771', '巴音郭楞蒙古自治州梨', '70.05', '72.50', '新疆维吾尔族自治区巴音郭楞蒙古自治州', '10771', '5', '100', '0', '香梨新疆库尔勒包邮水果批发新鲜整箱当季小香梨1250g梨子', '180', '2018-05-08 16:33', '0', '梨', '42.17', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10772', '库尔勒市梨', '49.95', '78.61', '新疆维吾尔族自治区库尔勒市', '10772', '5', '100', '0', '西域美农 新疆库尔勒香梨 当季时令新鲜水果批发包邮鲜果^@^', '180', '2018-05-08 16:33', '0', '梨', '47.58', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10773', '巴音郭楞蒙古自治州梨', '41.66', '61.98', '新疆维吾尔族自治区巴音郭楞蒙古自治州', '10773', '5', '100', '0', '【精选全母梨】新疆库尔勒香梨 新鲜水果梨子整箱10斤装顺丰包邮', '180', '2018-05-08 16:33', '0', '梨', '41.37', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10774', '徐州市梨', '49.24', '74.07', '江苏省徐州市', '10774', '5', '100', '0', '新鲜砀山酥梨10斤当即水果梨子整箱低价批发包邮梨', '180', '2018-05-08 16:33', '0', '梨', '48.46', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10775', '库尔勒市梨', '48.39', '64.33', '新疆维吾尔族自治区库尔勒市', '10775', '5', '100', '0', '齐峰缘新疆库尔勒香梨原产地直采新鲜脆梨新鲜孕妇水果', '180', '2018-05-08 16:33', '0', '梨', '42.70', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10776', '库尔勒市梨', '56.12', '77.89', '新疆维吾尔族自治区库尔勒市', '10776', '5', '100', '0', '【顺丰包邮】新疆库尔勒香梨 新鲜水果梨子精选整箱10斤非全母梨', '180', '2018-05-08 16:34', '0', '梨', '47.88', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10777', '中国提子', '66.54', '70.24', '中国大陆', '10777', '4', '100', '0', '源润鲜美国进口无籽黑提 黑提新鲜提子水果2斤包顺丰', '180', '2018-05-08 16:34', '0', '提子', '47.38', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10778', '中国提子', '69.08', '69.94', '中国大陆', '10778', '5', '100', '0', '智利无籽黑提1kg 新鲜水果 提子 无籽提子 提子葡萄', '180', '2018-05-08 16:34', '0', '提子', '68.41', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10779', '中国提子', '59.28', '62.18', '中国大陆', '10779', '5', '100', '0', '澳大利亚无籽黑提1kg 新鲜水果 提子 进口黑提 进口水果', '180', '2018-05-08 16:34', '0', '提子', '56.83', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10780', '中国提子', '56.76', '65.39', '中国大陆', '10780', '5', '100', '0', '智利红提1kg 新鲜水果 提子 提子葡萄 进口红提', '180', '2018-05-08 16:34', '0', '提子', '42.42', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10781', '中国提子', '61.31', '70.77', '中国大陆', '10781', '5', '100', '0', '澳洲无籽红提 2斤 新鲜提子进口无核提子 新鲜水果 进口水果', '180', '2018-05-08 16:34', '0', '提子', '49.12', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10782', '中国提子', '56.49', '76.82', '中国大陆', '10782', '5', '100', '0', '【易果生鲜】智利无籽黑提500g', '180', '2018-05-08 16:34', '0', '提子', '54.85', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10783', '中国提子', '47.90', '66.34', '中国大陆', '10783', '5', '100', '0', '果嫣南非无籽黑提 新鲜水果黑葡萄2斤装 无核脆甜提子顺丰包邮', '180', '2018-05-08 16:34', '0', '提子', '42.02', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10784', '中国提子', '58.50', '74.44', '中国大陆', '10784', '5', '100', '0', '澳大利亚无籽青提500g  提子 葡萄  进口水果 新鲜水果', '180', '2018-05-08 16:34', '0', '提子', '41.15', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10785', '中国提子', '68.53', '79.39', '中国大陆', '10785', '5', '100', '0', '澳大利亚无籽红提1kg 新鲜水果 提子 进口红提 进口水果', '180', '2018-05-08 16:34', '0', '提子', '54.46', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10786', '红河哈尼族彝族自治州提子', '56.99', '70.18', '云南省红河哈尼族彝族自治州', '10786', '3', '100', '0', '新鲜无籽夏黑葡萄孕妇水果非红提黑提子黑加仑醉金香巨峰葡萄3斤', '180', '2018-05-08 16:34', '0', '提子', '50.45', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10787', '中国提子', '59.70', '78.27', '中国大陆', '10787', '5', '100', '0', '智利红提250g', '180', '2018-05-08 16:34', '0', '提子', '57.29', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10788', '红河哈尼族彝族自治州提子', '61.63', '79.54', '云南省红河哈尼族彝族自治州', '10788', '5', '100', '0', '乐拉 阳光玫瑰葡萄新鲜日本晴王翠玉香印青提无籽提子3斤顺丰', '180', '2018-05-08 16:34', '0', '提子', '51.01', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10789', '中国提子', '52.28', '73.92', '中国大陆', '10789', '5', '100', '0', '云南夏黑葡萄1kg 新鲜水果 夏黑 云南水果 云南葡萄', '180', '2018-05-08 16:34', '0', '提子', '42.68', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10790', '中国提子', '71.42', '78.36', '中国大陆', '10790', '5', '100', '0', '智利青提1kg 提子 葡萄 新鲜水果 进口提子 进口青提', '180', '2018-05-08 16:34', '0', '提子', '46.29', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10791', '红河哈尼族彝族自治州提子', '79.53', '79.84', '云南省红河哈尼族彝族自治州', '10791', '5', '100', '0', '新鲜葡萄云南夏黑有机无籽红提黑加仑 孕妇新鲜水果宝宝辅食 3斤', '180', '2018-05-08 16:34', '0', '提子', '45.70', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10792', '中国提子', '74.51', '79.44', '中国大陆', '10792', '5', '100', '0', '云南夏黑葡萄500g', '180', '2018-05-08 16:34', '0', '提子', '47.66', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10793', '中国提子', '43.51', '54.14', '中国大陆', '10793', '5', '100', '0', '智利青提250g', '180', '2018-05-08 16:34', '0', '提子', '42.80', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10794', '中国提子', '64.18', '70.06', '中国大陆', '10794', '5', '100', '0', '澳大利亚无籽黑提400g', '180', '2018-05-08 16:34', '0', '提子', '63.08', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10795', '中国提子', '69.52', '76.57', '中国大陆', '10795', '5', '100', '0', '辽宁茉莉香葡萄500g 新鲜水果 葡萄 茉莉香 无籽葡萄', '180', '2018-05-08 16:34', '0', '提子', '55.66', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10796', '吐鲁番地区提子', '59.52', '64.25', '新疆维吾尔族自治区吐鲁番地区', '10796', '5', '100', '0', '预售新疆吐鲁番火焰无核白葡萄无籽提子4斤新鲜水果整箱批发包邮', '180', '2018-05-08 16:34', '0', '提子', '47.38', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10797', '中国提子', '46.73', '71.09', '中国大陆', '10797', '4', '100', '0', '澳洲进口无籽青提2斤青提子脆甜多汁青葡萄新鲜水果全国包顺丰', '180', '2018-05-08 16:34', '0', '提子', '42.81', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10798', '中国提子', '64.00', '67.49', '中国大陆', '10798', '5', '100', '0', '澳洲金手指黑提新鲜黑加仑无籽黑提子美人指葡萄水果2斤顺丰包邮', '180', '2018-05-08 16:34', '0', '提子', '59.91', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10799', '红河哈尼族彝族自治州提子', '54.53', '72.98', '云南省红河哈尼族彝族自治州', '10799', '5', '100', '0', '现摘速发无籽夏黑葡萄云南新鲜水果非红提黑提子黑加仑巨峰玫瑰香', '180', '2018-05-08 16:34', '0', '提子', '41.59', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10800', '青岛市提子', '59.33', '68.36', '山东省青岛市', '10800', '5', '100', '0', '现货新鲜无籽夏黑葡萄5斤 现摘时令孕妇水果红提子黑加仑巨峰包邮', '180', '2018-05-08 16:34', '0', '提子', '56.57', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10801', '红河哈尼族彝族自治州提子', '51.40', '66.66', '云南省红河哈尼族彝族自治州', '10801', '3', '100', '0', '新鲜无籽夏黑葡萄孕妇水果非红提黑提子黑加仑新疆大巨峰云南5斤', '180', '2018-05-08 16:34', '0', '提子', '50.65', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10802', '红河哈尼族彝族自治州提子', '52.99', '78.11', '云南省红河哈尼族彝族自治州', '10802', '5', '100', '0', '乐拉青幻 阳光玫瑰无籽新鲜香印青提提子葡萄9斤顺丰包邮', '180', '2018-05-08 16:34', '0', '提子', '49.91', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10803', '中国提子', '50.81', '68.52', '中国大陆', '10803', '4', '100', '0', '【阳光鲜果】澳洲金手指4斤美人指黑提无籽黑加仑提子新鲜水果', '180', '2018-05-08 16:34', '0', '提子', '50.44', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10804', '青岛市提子', '61.82', '70.54', '山东省青岛市', '10804', '5', '100', '0', '新鲜夏黑葡萄5斤 现摘当季水果无籽非红提子黑加仑新疆大巨峰包邮', '180', '2018-05-08 16:34', '0', '提子', '59.75', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10805', '中国提子', '45.06', '59.31', '中国大陆', '10805', '5', '100', '0', '满69减20智利红提500g 新鲜水果 提子 提子葡萄 进口红提', '180', '2018-05-08 16:35', '0', '提子', '41.07', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10806', '中国提子', '57.85', '62.28', '中国大陆', '10806', '5', '100', '0', '澳洲金手指葡萄新鲜水果黑加仑提子 黑手指蓝宝石水果2斤顺丰包邮', '180', '2018-05-08 16:35', '0', '提子', '47.28', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10807', '吐鲁番地区提子', '63.20', '70.33', '新疆维吾尔族自治区吐鲁番地区', '10807', '3', '100', '0', '预售新疆吐鲁番火焰无核白葡萄无籽提子4斤新鲜水果整箱批发包邮', '180', '2018-05-08 16:35', '0', '提子', '62.77', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10808', '中国提子', '67.14', '78.15', '中国大陆', '10808', '5', '100', '0', '智利无籽红提250g/盒', '180', '2018-05-08 16:35', '0', '提子', '41.02', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10809', '中国提子', '67.13', '70.77', '中国大陆', '10809', '5', '100', '0', '智利无籽黑提500g 新鲜水果 提子 无籽提子 提子葡萄', '180', '2018-05-08 16:35', '0', '提子', '66.83', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10810', '中国提子', '51.46', '72.04', '中国大陆', '10810', '5', '100', '0', '【易果生鲜】澳大利亚无籽黑提500g', '180', '2018-05-08 16:35', '0', '提子', '43.75', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10811', '中国提子', '56.71', '59.85', '中国大陆', '10811', '5', '100', '0', '澳大利亚无籽青提1kg  提子 葡萄 进口水果  新鲜水果', '180', '2018-05-08 16:35', '0', '提子', '50.79', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10812', '红河哈尼族彝族自治州提子', '41.45', '42.69', '云南省红河哈尼族彝族自治州', '10812', '5', '100', '0', '乐拉精品玄提 新鲜云南夏黑无籽葡萄无核黑提3斤孕妇水果顺丰空运', '180', '2018-05-08 16:35', '0', '提子', '40.51', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10813', '中国提子', '61.37', '75.66', '中国大陆', '10813', '5', '100', '0', '新疆夏黑葡萄500g', '180', '2018-05-08 16:35', '0', '提子', '50.17', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10814', '中国提子', '52.73', '71.96', '中国大陆', '10814', '5', '100', '0', '澳大利亚无籽红提250g', '180', '2018-05-08 16:35', '0', '提子', '45.28', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10815', '中国提子', '66.65', '70.20', '中国大陆', '10815', '5', '100', '0', '澳洲金手指黑提2斤葡萄无籽进口美人指非美国无子黑提子新鲜水果', '180', '2018-05-08 16:35', '0', '提子', '60.52', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10816', '红河哈尼族彝族自治州提子', '63.01', '63.40', '云南省红河哈尼族彝族自治州', '10816', '5', '100', '0', '购买送1.6斤 实发4斤 云南夏黑新鲜葡萄 无籽葡萄 新鲜水果', '180', '2018-05-08 16:35', '0', '提子', '60.05', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10817', '中国提子', '61.26', '66.01', '中国大陆', '10817', '5', '100', '0', '智利红提2斤 提子 葡萄 进口提子 新鲜水果', '180', '2018-05-08 16:35', '0', '提子', '57.16', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10818', '济南市提子', '47.00', '63.38', '山东省济南市', '10818', '5', '100', '0', '新鲜无籽红提新鲜水果进口红提提子无籽红提孕妇水果', '180', '2018-05-08 16:35', '0', '提子', '43.65', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10819', '中国提子', '47.40', '59.47', '中国大陆', '10819', '5', '100', '0', '澳大利亚无籽红提400g', '180', '2018-05-08 16:35', '0', '提子', '46.15', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10820', '楚雄彝族自治州提子', '50.27', '51.96', '云南省楚雄彝族自治州', '10820', '5', '100', '0', '新鲜提子云南新鲜夏黑无籽葡萄孕妇水果非黑加仑巨峰葡萄4斤包邮', '180', '2018-05-08 16:35', '0', '提子', '49.64', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10821', '中国提子', '48.99', '53.30', '中国大陆', '10821', '5', '100', '0', '秘鲁红提250g', '180', '2018-05-08 16:35', '0', '提子', '45.83', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10822', '中国提子', '62.10', '77.86', '中国大陆', '10822', '5', '100', '0', '澳洲无籽红提1盒(250g/盒)', '180', '2018-05-08 16:35', '0', '提子', '43.44', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10823', '中国提子', '70.16', '70.29', '中国大陆', '10823', '5', '100', '0', '智利无籽青提1盒(250g/盒)', '180', '2018-05-08 16:35', '0', '提子', '50.63', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10824', '中国提子', '50.51', '73.15', '中国大陆', '10824', '5', '100', '0', '本来生活 澳洲金手指无籽黑提约500g*2（两斤）黑提子 葡萄', '180', '2018-05-08 16:35', '0', '提子', '49.50', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10825', '中国提子', '45.95', '72.14', '中国大陆', '10825', '5', '100', '0', '澳洲金手指葡萄2斤装美人指黑提无籽黑加仑提子新鲜水果顺丰空运', '180', '2018-05-08 16:35', '0', '提子', '43.98', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10826', '青岛市提子', '76.47', '76.61', '山东省青岛市', '10826', '5', '100', '0', '新鲜弗雷无籽葡萄3斤 现摘孕妇水果玫瑰香红提子夏黑加仑巨峰', '180', '2018-05-08 16:35', '0', '提子', '65.17', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10827', '中国提子', '49.58', '54.39', '中国大陆', '10827', '5', '100', '0', '澳大利亚无籽红提500g 新鲜水果 进口红提 提子 无籽红提', '180', '2018-05-08 16:35', '0', '提子', '41.19', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10828', '红河哈尼族彝族自治州提子', '76.56', '77.05', '云南省红河哈尼族彝族自治州', '10828', '3', '100', '0', '新鲜无籽夏黑葡萄孕妇水果非红提新疆黑加仑现摘现发巨峰云南3斤', '180', '2018-05-08 16:35', '0', '提子', '54.43', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10829', '中国提子', '65.67', '70.38', '中国大陆', '10829', '5', '100', '0', '源润鲜澳大利亚美人指黑提进口金手指提子无籽棉花糖黑加仑2斤', '180', '2018-05-08 16:35', '0', '提子', '48.89', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10830', '中国提子', '77.21', '79.47', '中国大陆', '10830', '5', '100', '0', '美国品种金手指提子2斤无籽棉花糖黑加仑蓝宝石黑提新鲜(国产）', '180', '2018-05-08 16:35', '0', '提子', '46.62', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10831', '中国提子', '40.00', '56.67', '中国大陆', '10831', '5', '100', '0', '智利无籽黑提250g', '180', '2018-05-08 16:35', '0', '提子', '40.00', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10832', '中国提子', '57.09', '60.50', '中国大陆', '10832', '5', '100', '0', '果嫣 澳洲无籽红提 当季孕妇水果葡萄2斤装 新鲜无核提子顺丰包邮', '180', '2018-05-08 16:35', '0', '提子', '46.17', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10833', '中国提子', '48.10', '55.95', '中国大陆', '10833', '5', '100', '0', '智利青提500g 提子 葡萄 新鲜水果 进口提子 进口青提', '180', '2018-05-08 16:35', '0', '提子', '41.15', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10834', '中国提子', '77.12', '77.89', '中国大陆', '10834', '5', '100', '0', '澳大利亚无籽黑提500g 新鲜水果 提子 进口黑提 进口水果', '180', '2018-05-08 16:36', '0', '提子', '70.51', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10835', '中国提子', '69.25', '78.34', '中国大陆', '10835', '5', '100', '0', '缤果沃野 澳洲进口金手指黑提2斤无籽新鲜水果葡萄美人子黑加仑', '180', '2018-05-08 16:36', '0', '提子', '53.82', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10836', '楚雄彝族自治州提子', '50.42', '60.24', '云南省楚雄彝族自治州', '10836', '5', '100', '0', '东方红一号老树冰心甜夏黑无籽葡萄云南新鲜水果非黑加仑巨峰3斤', '180', '2018-05-08 16:36', '0', '提子', '48.57', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10837', '中国柚子', '79.22', '79.82', '中国大陆', '10837', '5', '100', '0', '【Dole都乐】泰国白肉大蜜柚2只 柚子 新鲜水果 单果1300左右', '180', '2018-05-08 16:36', '0', '柚子', '73.74', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10838', '中国柚子', '59.24', '63.82', '中国大陆', '10838', '5', '100', '0', '福建平和白心蜜柚1个1.25', '180', '2018-05-08 16:36', '0', '柚子', '43.46', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10839', '中国柚子', '47.76', '78.91', '中国大陆', '10839', '5', '100', '0', '金安达 埃及西柚大果8个装 葡萄柚新鲜进口当季水果非南非西柚', '180', '2018-05-08 16:36', '0', '柚子', '44.39', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10840', '怀化市柚子', '73.69', '79.72', '湖南省怀化市', '10840', '5', '100', '0', '湖南怀化新鲜水果洪江黄金贡柚当季手剥柚子象山青孕妇新鲜水果', '180', '2018-05-08 16:36', '0', '柚子', '41.53', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10841', '衢州市柚子', '45.99', '69.04', '浙江省衢州市', '10841', '5', '100', '0', '十八垅正宗衢州常山胡柚新鲜水果非西柚非葡萄柚 净重9.2斤装', '180', '2018-05-08 16:36', '0', '柚子', '43.73', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10842', '衢州市柚子', '77.57', '79.98', '浙江省衢州市', '10842', '5', '100', '0', '【常山胡柚旗舰店】胡柚 常山胡柚 新鲜水果 8斤装80', '180', '2018-05-08 16:36', '0', '柚子', '75.71', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10843', '中国柚子', '78.51', '78.80', '中国大陆', '10843', '5', '100', '0', '以色列红心柚1个400g以上/个', '180', '2018-05-08 16:36', '0', '柚子', '77.93', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10844', '中国柚子', '71.36', '74.48', '中国大陆', '10844', '5', '100', '0', '帝鸿农 南非西柚6个红心葡萄柚进口西柚单果270', '180', '2018-05-08 16:36', '0', '柚子', '51.87', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10845', '中国柚子', '52.31', '68.66', '中国大陆', '10845', '5', '100', '0', '台湾麻豆文旦柚1个380g以上/个', '180', '2018-05-08 16:36', '0', '柚子', '47.60', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10846', '中国柚子', '50.78', '72.88', '中国大陆', '10846', '3', '100', '0', '正宗泰国进口金柚2个装柚子青皮3kg/6斤蜜柚脆甜白柚热带新鲜水果', '180', '2018-05-08 16:36', '0', '柚子', '46.29', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10847', '中国柚子', '57.63', '62.57', '中国大陆', '10847', '5', '100', '0', '鲜蜂队 泰国青柚 泰柚进口金柚西施蜜柚白心青柚原装8个装16', '180', '2018-05-08 16:36', '0', '柚子', '41.47', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10848', '中国柚子', '47.40', '58.01', '中国大陆', '10848', '5', '100', '0', '鲜蜂队 泰国青柚 红心柚子红柚金柚脆爽多汁2个装约3.8', '180', '2018-05-08 16:36', '0', '柚子', '40.23', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10849', '衢州市柚子', '43.93', '69.21', '浙江省衢州市', '10849', '5', '100', '0', '常山胡柚9斤新鲜水果4.5kg衢州原产地胡柚时令水果 多省包邮', '180', '2018-05-08 16:36', '0', '柚子', '43.83', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10850', '中国柚子', '44.04', '78.00', '中国大陆', '10850', '5', '100', '0', '泰国进口青柚甜柚子 新鲜水果  白蜜柚2个装青皮柚  坏果包赔包邮', '180', '2018-05-08 16:36', '0', '柚子', '40.26', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10851', '衢州市柚子', '40.34', '65.47', '浙江省衢州市', '10851', '5', '100', '0', '十八垅正宗衢州常山胡柚 新鲜时令水果 非西柚非葡萄柚净重5斤', '180', '2018-05-08 16:36', '0', '柚子', '40.16', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10852', '中国柚子', '59.11', '72.77', '中国大陆', '10852', '1', '100', '0', '泰国进口青柚泰国柚子青蜜柚2个装单果2斤左右非红心琯溪蜜柚西施', '180', '2018-05-08 16:36', '0', '柚子', '40.56', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10853', '中国柚子', '76.78', '79.30', '中国大陆', '10853', '5', '100', '0', '卜卜蜜福建琯溪白心蜜柚1个1.25kg以上/个', '180', '2018-05-08 16:36', '0', '柚子', '51.13', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10854', '中国柚子', '50.28', '71.82', '中国大陆', '10854', '5', '100', '0', '福建琯溪白心蜜柚1个单果重约1200g', '180', '2018-05-08 16:36', '0', '柚子', '48.05', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10855', '中国柚子', '53.52', '79.44', '中国大陆', '10855', '5', '100', '0', '福建蜜柚组合1盒礼盒装680g以上/个', '180', '2018-05-08 16:36', '0', '柚子', '51.10', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10856', '中国柚子', '72.32', '72.92', '中国大陆', '10856', '5', '100', '0', '鲜蜂队 泰国青柚 进口柚子蜂蜜柚 白心柚4个装8', '180', '2018-05-08 16:36', '0', '柚子', '64.02', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10857', '中国柚子', '48.67', '77.75', '中国大陆', '10857', '5', '100', '0', 'GREENHOW 新鲜水果泰国青柚蜜柚白糖柚柚子2个4.5左右礼盒装包邮', '180', '2018-05-08 16:36', '0', '柚子', '42.04', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10858', '中国柚子', '49.27', '59.15', '中国大陆', '10858', '5', '100', '0', '福建平和红心蜜柚1个1.25', '180', '2018-05-08 16:36', '0', '柚子', '41.93', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10859', '中国柚子', '47.30', '59.90', '中国大陆', '10859', '5', '100', '0', '福建平和白心蜜柚1个1', '180', '2018-05-08 16:36', '0', '柚子', '45.12', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10860', '中国柚子', '68.19', '74.63', '中国大陆', '10860', '5', '100', '0', '鲜蜂队 泰国青柚 进口柚子 蜂蜜柚 糖白柚 2个装4.3', '180', '2018-05-08 16:37', '0', '柚子', '57.78', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10861', '中国柚子', '66.51', '67.80', '中国大陆', '10861', '5', '100', '0', '【两份减20】泰国青蜜柚1只大青柚泰国金柚进口柚子非以色列青柚', '180', '2018-05-08 16:37', '0', '柚子', '64.68', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10862', '中国柚子', '57.31', '63.89', '中国大陆', '10862', '4', '100', '0', '果百伦 青柚 2个装 约4斤左右 泰国青柚  蜂蜜柚 糖白柚MF', '180', '2018-05-08 16:37', '0', '柚子', '44.63', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10863', '中国柚子', '62.38', '74.84', '中国大陆', '10863', '5', '100', '0', '现货 新鲜泰国进口青柚当季蜜柚 柚香浓郁多汁爽口 1个装批发包邮', '180', '2018-05-08 16:37', '0', '柚子', '47.78', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10864', '中国柚子', '55.59', '67.82', '中国大陆', '10864', '5', '100', '0', '【阳哥】台湾进口红心柚西柚葡萄柚 6个装柚子时令新鲜水果', '180', '2018-05-08 16:37', '0', '柚子', '51.05', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10865', '衢州市柚子', '47.68', '74.09', '浙江省衢州市', '10865', '5', '100', '0', '【常山胡柚旗舰店】新鲜水果 常山胡柚 礼盒装16个 农家 小柚子', '180', '2018-05-08 16:37', '0', '柚子', '46.89', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10866', '中国柚子', '53.49', '74.78', '中国大陆', '10866', '5', '100', '0', '甜岛宝台湾葡萄柚1个200g以上/个', '180', '2018-05-08 16:37', '0', '柚子', '50.45', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10867', '衢州市柚子', '60.83', '64.53', '浙江省衢州市', '10867', '4', '100', '0', '常山胡柚小果10斤装【胡子村长】新鲜水果包邮特产可做柚茶', '180', '2018-05-08 16:37', '0', '柚子', '48.40', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10868', '中国柚子', '55.96', '77.24', '中国大陆', '10868', '5', '100', '0', '以色列西柚1个250g以上/个', '180', '2018-05-08 16:37', '0', '柚子', '40.43', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10869', '衢州市柚子', '49.42', '78.43', '浙江省衢州市', '10869', '5', '100', '0', '蜂之乡 新鲜常山胡柚5斤 新鲜水果水分充足柚子 5斤', '180', '2018-05-08 16:37', '0', '柚子', '48.08', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10870', '漳州市柚子', '68.95', '69.60', '福建省漳州市', '10870', '5', '100', '0', '野客红心肉蜜柚平和蜜柚新鲜水果现摘批发包邮密三红管琯溪5斤', '180', '2018-05-08 16:37', '0', '柚子', '66.02', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10871', '衢州市柚子', '70.29', '78.22', '浙江省衢州市', '10871', '5', '100', '0', '9个装常山胡柚L号2.5kg优级水果包邮 85', '180', '2018-05-08 16:37', '0', '柚子', '62.60', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10872', '衢州市柚子', '51.96', '75.94', '浙江省衢州市', '10872', '5', '100', '0', '常山胡柚新鲜水果10kg衢州原产地胡柚时令水果柚子 盒装多省包邮', '180', '2018-05-08 16:37', '0', '柚子', '50.84', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10873', '赣州市柚子', '62.84', '67.47', '江西省赣州市', '10873', '4', '100', '0', '买1送1 南康甜柚现摘新鲜红肉蜜柚 红心柚子当季新鲜水果10斤包邮', '180', '2018-05-08 16:37', '0', '柚子', '59.35', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10874', '漳州市柚子', '65.17', '79.94', '福建省漳州市', '10874', '5', '100', '0', '【浦甜】福建平和正宗琯溪红心红肉蜜柚4粒约12斤装 只发河北天津', '180', '2018-05-08 16:37', '0', '柚子', '61.56', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10875', '中国柚子', '69.85', '77.79', '中国大陆', '10875', '5', '100', '0', '【果王佳园】泰国大青柚2只泰国白蜜柚进口柚子新鲜柚子进口水果', '180', '2018-05-08 16:37', '0', '柚子', '60.83', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10876', '怀化市柚子', '42.05', '60.58', '湖南省怀化市', '10876', '5', '100', '0', '湖南怀化新鲜水果洪江黄金贡柚当季 手剥柚子非平和柚西柚礼盒装', '180', '2018-05-08 16:37', '0', '柚子', '40.80', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10877', '中国柚子', '74.93', '78.79', '中国大陆', '10877', '5', '100', '0', '泰国青柚白蜜柚子新鲜进口水果孕妇热带 4个装包邮 坏果包赔', '180', '2018-05-08 16:37', '0', '柚子', '41.15', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10878', '中国柚子', '78.60', '79.53', '中国大陆', '10878', '5', '100', '0', '优霸 泰国白蜜柚 2个大柚子 进口柚子白肉白心柚甜柚金柚新鲜水果', '180', '2018-05-08 16:37', '0', '柚子', '72.84', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10879', '衢州市柚子', '60.58', '72.15', '浙江省衢州市', '10879', '5', '100', '0', '2017常山胡柚8斤装胡柚常山胡柚柚子果径70', '180', '2018-05-08 16:37', '0', '柚子', '53.32', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10880', '中国柚子', '44.17', '79.20', '中国大陆', '10880', '5', '100', '0', '卜卜蜜福建琯溪红心蜜柚1个1.25kg以上/个', '180', '2018-05-08 16:37', '0', '柚子', '44.08', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10881', '衢州市柚子', '62.10', '67.06', '浙江省衢州市', '10881', '5', '100', '0', '【常山胡柚旗舰店】胡柚 常山胡柚浙江特产农家 90', '180', '2018-05-08 16:37', '0', '柚子', '47.45', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10882', '中国柚子', '76.43', '77.36', '中国大陆', '10882', '5', '100', '0', '甜岛宝台湾红宝石葡萄柚1个200g以上/个', '180', '2018-05-08 16:37', '0', '柚子', '63.08', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10883', '衢州市柚子', '43.60', '71.60', '浙江省衢州市', '10883', '5', '100', '0', '【常山胡柚旗舰店】胡柚 常山胡柚 新鲜胡柚 常山特产 9斤装包邮', '180', '2018-05-08 16:37', '0', '柚子', '42.81', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10884', '中国柚子', '78.54', '79.53', '中国大陆', '10884', '5', '100', '0', '以色列葡萄柚2个250g以上/个', '180', '2018-05-08 16:37', '0', '柚子', '51.63', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10885', '中国柚子', '70.30', '71.67', '中国大陆', '10885', '5', '100', '0', '以色列青柚2个300g以上/个', '180', '2018-05-08 16:38', '0', '柚子', '54.89', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10886', '中国柚子', '70.44', '73.24', '中国大陆', '10886', '5', '100', '0', '泰国进口金柚青皮柚子蜜柚新鲜热带当季水果饱满多汁1个装包邮', '180', '2018-05-08 16:38', '0', '柚子', '66.41', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10887', '衢州市柚子', '71.18', '79.41', '浙江省衢州市', '10887', '5', '100', '0', '常山胡柚8斤装4kg一级M水果70', '180', '2018-05-08 16:38', '0', '柚子', '54.34', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10888', '中国柚子', '41.54', '53.96', '中国大陆', '10888', '5', '100', '0', '泰国白蜜柚1个800g以上/个', '180', '2018-05-08 16:38', '0', '柚子', '40.52', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10889', '衢州市柚子', '52.36', '74.89', '浙江省衢州市', '10889', '5', '100', '0', '【江山】常山胡柚 新鲜水果 胡柚 柚子 净重4斤包邮', '180', '2018-05-08 16:38', '0', '柚子', '51.58', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10890', '中国柚子', '40.74', '69.47', '中国大陆', '10890', '5', '100', '0', '柚子水果新鲜泰国青柚金柚青蜜柚去火进口水果2个装包邮', '180', '2018-05-08 16:38', '0', '柚子', '40.17', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10891', '中国柚子', '48.49', '67.29', '中国大陆', '10891', '5', '100', '0', '歌慕 泰国进口青柚红蜜柚2个装 热带进口新鲜甜柚子水果包邮', '180', '2018-05-08 16:38', '0', '柚子', '43.53', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10892', '中国柚子', '47.44', '79.15', '中国大陆', '10892', '5', '100', '0', '以色列葡萄柚4个250g以上/个', '180', '2018-05-08 16:38', '0', '柚子', '46.04', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10893', '衢州市柚子', '79.36', '79.64', '浙江省衢州市', '10893', '5', '100', '0', '【常山胡柚旗舰店】新鲜 胡柚 常山胡柚 2个装 试吃9.9元包邮', '180', '2018-05-08 16:38', '0', '柚子', '78.32', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10894', '衢州市柚子', '46.93', '70.03', '浙江省衢州市', '10894', '5', '100', '0', '【常山胡柚旗舰店】胡柚 常山胡柚 5斤装 新鲜水果 浙江特产包邮', '180', '2018-05-08 16:38', '0', '柚子', '45.93', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10895', '漳州市柚子', '42.16', '63.73', '福建省漳州市', '10895', '5', '100', '0', '柚子皮  5斤 新房装修去味 新鲜水果 柚子  新车除味', '180', '2018-05-08 16:38', '0', '柚子', '41.56', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10896', '衢州市柚子', '49.13', '53.64', '浙江省衢州市', '10896', '5', '100', '0', '【常山胡柚旗舰店】胡柚 常山胡柚 新鲜胡柚 常山特产 20斤装', '180', '2018-05-08 16:38', '0', '柚子', '48.14', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10897', '玉林市芭乐', '52.77', '55.74', '广西壮族自治区玉林市', '10897', '5', '100', '0', '广西现摘番石榴芭乐水果5斤装 特产芭乐新鲜番石榴 清脆香甜 包邮', '180', '2018-05-08 16:38', '0', '芭乐', '52.34', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10898', '玉林市芭乐', '74.09', '74.73', '广西壮族自治区玉林市', '10898', '5', '100', '0', '广西珍珠番石榴白心白肉芭乐水果农家自产果园直供现发5斤装包邮', '180', '2018-05-08 16:38', '0', '芭乐', '53.45', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10899', '玉林市芭乐', '47.83', '62.67', '广西壮族自治区玉林市', '10899', '5', '100', '0', '高山新鲜珍珠番石榴红心白心搭配混装芭乐番石榴珍珠红肉果白肉果', '180', '2018-05-08 16:38', '0', '芭乐', '43.44', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10900', '中国芭乐', '59.99', '74.74', '中国大陆', '10900', '5', '100', '0', '福建漳州红心芭乐1盒(400g以上/盒) 新鲜水果 番石榴 芭乐', '180', '2018-05-08 16:38', '0', '芭乐', '51.26', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10901', '玉林市芭乐', '65.59', '65.72', '广西壮族自治区玉林市', '10901', '5', '100', '0', '广西现摘番石榴新鲜水果9斤装芭乐白心农家番石榴芭乐9斤清脆香', '180', '2018-05-08 16:38', '0', '芭乐', '51.33', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10902', '三亚市芭乐', '65.21', '65.83', '海南省三亚市', '10902', '5', '100', '0', '海南红心芭乐5斤装 红芯番石榴 红肉珍珠芭乐 应季新鲜水果特产', '180', '2018-05-08 16:38', '0', '芭乐', '60.00', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10903', '三亚市芭乐', '67.46', '67.97', '海南省三亚市', '10903', '5', '100', '0', '套海南特产芭乐果红心番石榴新鲜5斤现摘热带当季孕妇三亚水果', '180', '2018-05-08 16:38', '0', '芭乐', '45.44', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10904', '中国芭乐', '57.10', '79.70', '中国大陆', '10904', '5', '100', '0', '买一送一 齐峰缘 台湾进口芭乐水果新鲜红心芭乐番石榴珍珠果', '180', '2018-05-08 16:38', '0', '芭乐', '56.95', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10905', '玉林市芭乐', '76.67', '79.72', '广西壮族自治区玉林市', '10905', '5', '10', '1', '广西珍珠番石榴白心白肉芭乐水果农家自产果园直供现发8斤装包邮', '0', '2018-05-08 16:38', '1527590973233', '芭乐', '73.38', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10906', '玉林市芭乐', '56.77', '57.13', '广西壮族自治区玉林市', '10906', '5', '100', '0', '预售现摘现发番石榴芭乐珍珠白心番石榴新鲜水果 果园直供8斤装', '180', '2018-05-08 16:38', '0', '芭乐', '50.96', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10907', '茂名市芭乐', '51.12', '53.67', '广东省茂名市', '10907', '5', '100', '0', '现摘现发 红心番石榴  芭乐 新鲜水果5斤装包邮 广东当季特产', '180', '2018-05-08 16:38', '0', '芭乐', '48.95', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10908', '玉林市芭乐', '49.68', '50.54', '广西壮族自治区玉林市', '10908', '5', '100', '0', '现摘番石榴芭乐9斤装 广西新鲜水果 珍珠番石榴 时令水果果园', '180', '2018-05-08 16:38', '0', '芭乐', '43.14', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10909', '玉林市芭乐', '63.46', '75.99', '广西壮族自治区玉林市', '10909', '5', '100', '0', '预售红心番石榴 新鲜水果 果园直供芭乐3斤装 当季水果', '180', '2018-05-08 16:38', '0', '芭乐', '51.76', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10910', '玉林市芭乐', '71.20', '78.99', '广西壮族自治区玉林市', '10910', '5', '100', '0', '老夫老妻广西番石榴5斤包邮红心白心芭乐孕妇水果新鲜水果果园供', '180', '2018-05-08 16:38', '0', '芭乐', '54.82', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10911', '漳州市芭乐', '75.64', '76.32', '福建省漳州市', '10911', '5', '100', '0', '红心芭乐番石榴新鲜水果阿特果园5斤装包邮闽南应季现摘红巴乐果', '180', '2018-05-08 16:38', '0', '芭乐', '69.90', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10912', '漳州市芭乐', '47.81', '66.52', '福建省漳州市', '10912', '5', '100', '0', '福建农家特产果园现摘新鲜珍珠芭乐番石榴巴乐果5斤装包邮', '180', '2018-05-08 16:39', '0', '芭乐', '42.90', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10913', '玉林市芭乐', '58.09', '59.89', '广西壮族自治区玉林市', '10913', '5', '100', '0', '预售广西新鲜番石榴芭乐 农家特产 5斤装水果 现摘现发 清脆香甜', '180', '2018-05-08 16:39', '0', '芭乐', '43.33', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10914', '玉林市芭乐', '41.49', '53.70', '广西壮族自治区玉林市', '10914', '5', '100', '0', '广西番石榴红心芭乐5斤包邮新鲜水果孕妇低糖水果潘石榴农家特产', '180', '2018-05-08 16:39', '0', '芭乐', '41.00', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10915', '广州市芭乐', '44.91', '60.09', '广东省广州市', '10915', '5', '100', '0', '【果悟】广东番石榴水果新鲜包邮芭乐农家孕妇特产5斤装清脆香甜', '180', '2018-05-08 16:39', '0', '芭乐', '41.54', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10916', '玉林市芭乐', '53.86', '58.55', '广西壮族自治区玉林市', '10916', '5', '100', '0', '不新鲜包赔广西特产农家番石榴新鲜采摘5斤芭乐水果清脆香甜包邮', '180', '2018-05-08 16:39', '0', '芭乐', '49.02', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10917', '玉林市芭乐', '47.61', '68.59', '广西壮族自治区玉林市', '10917', '5', '100', '0', '广西现摘番石榴芭乐红心白心搭配共8斤装 新鲜水果 高山种植老树', '180', '2018-05-08 16:39', '0', '芭乐', '44.47', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10918', '玉林市芭乐', '53.41', '66.79', '广西壮族自治区玉林市', '10918', '5', '100', '0', '果园直供广西高山新鲜珍珠番石榴红心芭乐红肉热带水果清脆香甜', '180', '2018-05-08 16:39', '0', '芭乐', '44.84', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10919', '漳州市芭乐', '63.67', '79.16', '福建省漳州市', '10919', '5', '100', '0', '漳州特产新鲜红心芭乐5斤装热带水果番石榴多省包邮送酸梅粉', '180', '2018-05-08 16:39', '0', '芭乐', '48.72', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10920', '漳州市芭乐', '78.31', '78.39', '福建省漳州市', '10920', '5', '100', '0', '刘老根台湾红心芭乐5斤现摘 番石榴新鲜水果孕妇巴乐农家果园包邮', '180', '2018-05-08 16:39', '0', '芭乐', '75.07', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10921', '玉林市芭乐', '45.02', '77.27', '广西壮族自治区玉林市', '10921', '5', '100', '0', '广西番石榴新鲜水果5斤包邮现摘孕妇芭乐水果潘石榴脆口香甜', '180', '2018-05-08 16:39', '0', '芭乐', '44.61', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10922', '汕尾市芭乐', '75.37', '79.72', '广东省汕尾市', '10922', '5', '100', '0', '【现货】农家番石榴芭乐大果包邮当季水果现摘现发广东白心芭乐', '180', '2018-05-08 16:39', '0', '芭乐', '62.76', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10923', '中国芭乐', '74.03', '76.42', '中国大陆', '10923', '5', '100', '0', '释莲台红心芭乐 台湾红芭乐 番石榴 新鲜 红心芭乐  8', '180', '2018-05-08 16:39', '0', '芭乐', '60.51', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10924', '肇庆市芭乐', '74.66', '74.82', '广东省肇庆市', '10924', '2', '100', '0', '预售台湾白心芭乐番石榴新鲜水果包邮当季巴乐现摘现发特产5斤装', '180', '2018-05-08 16:39', '0', '芭乐', '54.88', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10925', '玉林市芭乐', '56.76', '79.36', '广西壮族自治区玉林市', '10925', '5', '100', '0', '广西红心芭乐番石榴新鲜水果特产5斤装包邮当季巴乐胭脂红潘石榴', '180', '2018-05-08 16:39', '0', '芭乐', '45.66', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10926', '玉林市芭乐', '56.74', '72.21', '广西壮族自治区玉林市', '10926', '5', '100', '0', '农家现摘番石榴芭乐白心3斤+红心2斤新鲜水果清脆香芭乐番石榴', '180', '2018-05-08 16:39', '0', '芭乐', '48.08', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10927', '玉林市芭乐', '48.84', '63.37', '广西壮族自治区玉林市', '10927', '5', '100', '0', '广西农家现摘番石榴芭乐红心白心6斤搭配  红心白心混装 清脆香甜', '180', '2018-05-08 16:39', '0', '芭乐', '44.21', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10928', '漳州市芭乐', '61.58', '76.45', '福建省漳州市', '10928', '4', '100', '0', '现摘现发 台湾进口芭乐水果新鲜红心芭乐番石榴珍珠红芭乐果包邮', '180', '2018-05-08 16:39', '0', '芭乐', '54.36', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10929', '漳州市芭乐', '77.26', '77.83', '福建省漳州市', '10929', '5', '100', '0', '【阳哥】新鲜芭乐水果4斤 番石榴 珍珠芭乐 番石榴', '180', '2018-05-08 16:39', '0', '芭乐', '65.12', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10930', '海口市芭乐', '44.57', '63.61', '海南省海口市', '10930', '4', '100', '0', '海南三亚水果海南水果水果新鲜水果番石榴芭乐果珍珠石榴5斤', '180', '2018-05-08 16:39', '0', '芭乐', '41.43', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10931', '汕头市芭乐', '79.48', '79.62', '广东省汕头市', '10931', '5', '100', '0', '台湾特产珍珠芭乐番石榴水果新鲜包邮当季5斤现摘现发蕃石榴水果', '180', '2018-05-08 16:39', '0', '芭乐', '76.31', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10932', '湛江市芭乐', '76.39', '76.71', '广东省湛江市', '10932', '5', '100', '0', '广东湛江廉江白心芭乐番石榴水果新鲜5斤装8', '180', '2018-05-08 16:39', '0', '芭乐', '70.49', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10933', '中国芭乐', '70.79', '79.17', '中国大陆', '10933', '5', '100', '0', '福建漳州芭乐1盒(400g以上/盒) 新鲜水果 番石榴 新鲜芭乐', '180', '2018-05-08 16:39', '0', '芭乐', '60.91', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10934', '珠海市芭乐', '60.73', '68.76', '广东省珠海市', '10934', '5', '100', '0', '农家果园现摘现发白肉珍珠芭乐白心番石榴特产甜脆孕妇新鲜水果', '180', '2018-05-08 16:39', '0', '芭乐', '46.26', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10935', '中国芭乐', '74.61', '76.79', '中国大陆', '10935', '5', '100', '0', '阳哥芭乐台湾进口水果新鲜红心芭乐番石榴4斤珍珠红芭乐果包邮', '180', '2018-05-08 16:39', '0', '芭乐', '65.20', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10936', '三亚市芭乐', '45.82', '51.96', '海南省三亚市', '10936', '5', '100', '0', '套海南红心番石榴原生果芭乐新鲜热带特产孕妇水果5斤批发包邮', '180', '2018-05-08 16:39', '0', '芭乐', '42.49', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10937', '玉林市芭乐', '60.20', '69.49', '广西壮族自治区玉林市', '10937', '5', '100', '0', '广西现摘番石榴芭乐6斤装 新鲜热带水果 高山种植老树 清脆香甜', '180', '2018-05-08 16:39', '0', '芭乐', '51.65', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10938', '玉林市芭乐', '61.05', '67.12', '广西壮族自治区玉林市', '10938', '5', '100', '0', '预售广西番石榴白心芭乐水果农家自产果园直供现发5斤装包邮', '180', '2018-05-08 16:39', '0', '芭乐', '56.96', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10939', '广州市芭乐', '69.90', '71.22', '广东省广州市', '10939', '5', '100', '0', '【幸康丰】农家现摘现发芭乐大果新鲜水果包邮广东白心番石榴5斤', '180', '2018-05-08 16:39', '0', '芭乐', '49.40', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10940', '海口市芭乐', '44.74', '50.84', '海南省海口市', '10940', '5', '100', '0', '【买一送一共发4斤】海南热带新鲜水果红心芭乐番石榴2斤 包邮', '180', '2018-05-08 16:39', '0', '芭乐', '40.80', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10941', '玉林市芭乐', '63.12', '79.39', '广西壮族自治区玉林市', '10941', '5', '100', '0', '果园直供现摘广西珍珠红心芭乐番石榴红肉新鲜热带水果5斤装', '180', '2018-05-08 16:39', '0', '芭乐', '60.14', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10942', '漳州市芭乐', '54.41', '56.08', '福建省漳州市', '10942', '5', '100', '0', '红心芭乐番石榴水果新鲜包邮红巴乐水果当季鲜果软芭乐红肉番石榴', '180', '2018-05-08 16:39', '0', '芭乐', '52.04', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10943', '汕尾市芭乐', '55.33', '58.98', '广东省汕尾市', '10943', '5', '100', '0', '齐峰缘_白心芭乐5斤装 广东汕尾番石榴新鲜应季特产水果白心芭乐', '180', '2018-05-08 16:40', '0', '芭乐', '41.20', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10944', '玉林市芭乐', '67.24', '71.06', '广西壮族自治区玉林市', '10944', '5', '100', '0', '广西高山现摘番石榴芭乐10斤装 新鲜热带水果 清脆香甜', '180', '2018-05-08 16:40', '0', '芭乐', '49.97', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10945', '玉林市芭乐', '62.41', '75.41', '广西壮族自治区玉林市', '10945', '5', '100', '0', '预售广西特产现摘番石榴白心芭乐5斤装新鲜水果当季热带水果清脆', '180', '2018-05-08 16:40', '0', '芭乐', '45.72', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10946', '广州市芭乐', '46.49', '50.94', '广东省广州市', '10946', '5', '100', '0', '【果美妙】红心芭乐5斤装现摘包邮广东新鲜水果珍珠胭脂红番石榴', '180', '2018-05-08 16:40', '0', '芭乐', '42.54', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10947', '玉林市芭乐', '46.65', '56.92', '广西壮族自治区玉林市', '10947', '5', '100', '0', '广西现摘农家红心番石榴新鲜水果5斤包邮新鲜当季番芭乐孕妇水果', '180', '2018-05-08 16:40', '0', '芭乐', '46.09', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10948', '漳州市芭乐', '41.97', '56.94', '福建省漳州市', '10948', '5', '100', '0', '福建红心芭乐番石榴5斤 新鲜水果潘巴乐胭脂红批发包邮非广西台湾', '180', '2018-05-08 16:40', '0', '芭乐', '40.23', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10949', '玉林市芭乐', '51.80', '66.38', '广西壮族自治区玉林市', '10949', '5', '100', '0', '广西现摘番石榴芭乐水果8斤装 芭乐新鲜番石榴水果 清脆香甜', '180', '2018-05-08 16:40', '0', '芭乐', '46.78', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10950', '漳州市芭乐', '47.51', '68.03', '福建省漳州市', '10950', '4', '100', '0', '农家果园直供现摘新鲜珍珠芭乐 番石榴 孕妇老人低糖水果5斤包邮', '180', '2018-05-08 16:40', '0', '芭乐', '45.32', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10951', '玉林市芭乐', '46.32', '60.08', '广西壮族自治区玉林市', '10951', '5', '100', '0', '高山种植番石榴 红心芭乐3斤装 新鲜水果 现摘现发 当季热带水果', '180', '2018-05-08 16:40', '0', '芭乐', '41.95', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10952', '玉林市芭乐', '69.48', '72.18', '广西壮族自治区玉林市', '10952', '5', '100', '0', '广西红心芭乐番石榴新鲜水果特产5斤装包邮当季巴乐胭脂红潘石榴', '180', '2018-05-08 16:40', '0', '芭乐', '51.41', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10953', '玉林市芭乐', '50.00', '71.96', '广西壮族自治区玉林市', '10953', '5', '100', '0', '预售现摘广西高山番石榴白心珍珠芭乐新鲜水果当季热带水果5斤装', '180', '2018-05-08 16:40', '0', '芭乐', '42.12', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10954', '中国芭乐', '70.07', '74.72', '中国大陆', '10954', '5', '100', '0', '福建漳州芭乐1盒(400g以上/盒)', '180', '2018-05-08 16:40', '0', '芭乐', '60.76', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10955', '玉林市芭乐', '54.30', '73.06', '广西壮族自治区玉林市', '10955', '5', '100', '0', '甜果爱 广西番石榴水果红心芭乐甜脆新鲜包邮5斤孕妇农家水果广西', '180', '2018-05-08 16:40', '0', '芭乐', '51.30', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10956', '厦门市芭乐', '73.51', '77.01', '福建省厦门市', '10956', '5', '100', '0', '刘老根台湾番石榴白心珍珠芭乐新鲜巴乐孕妇吃的水果当季5斤包邮', '180', '2018-05-08 16:40', '0', '芭乐', '59.09', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10957', '中国莲雾', '74.71', '75.81', '中国大陆', '10957', '5', '100', '0', '台湾进口新鲜水果 当季 蜜风铃 莲雾 黑珍珠 黑金刚 3斤装', '180', '2018-05-08 16:40', '0', '莲雾', '43.31', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10958', '三亚市莲雾', '42.47', '60.16', '海南省三亚市', '10958', '5', '100', '0', '顺丰空运3斤装现摘三亚黑金刚莲雾甜雾新鲜水果雾莲海南热带', '180', '2018-05-08 16:40', '0', '莲雾', '42.36', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10959', '中国莲雾', '74.71', '74.98', '中国大陆', '10959', '5', '100', '0', '东南亚进口水果新鲜泰国莲雾黑金刚莲雾果连雾1斤装', '180', '2018-05-08 16:40', '0', '莲雾', '63.26', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10960', '海口市莲雾', '78.97', '79.24', '海南省海口市', '10960', '4', '100', '0', '海南三亚水果 海南水果 新鲜水果海南莲雾新鲜黑金刚莲雾新鲜莲雾', '180', '2018-05-08 16:40', '0', '莲雾', '65.16', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10961', '中国莲雾', '43.54', '52.67', '中国大陆', '10961', '5', '100', '0', '乐拉 台湾新鲜巴掌莲雾果水果礼盒装清脆爽甜饱满多汁顺丰包邮', '180', '2018-05-08 16:40', '0', '莲雾', '41.91', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10962', '海口市莲雾', '71.60', '77.11', '海南省海口市', '10962', '5', '100', '0', '【第2件减10元】海南三亚新鲜水果黑金刚 莲雾果3斤 精选大果', '180', '2018-05-08 16:40', '0', '莲雾', '44.83', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10963', '三亚市莲雾', '68.22', '79.89', '海南省三亚市', '10963', '5', '100', '0', '海南三亚黑金刚莲雾 莲雾 水果黑珍珠热带新鲜水果越南雾莲果', '180', '2018-05-08 16:40', '0', '莲雾', '44.42', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10964', '三亚市莲雾', '42.67', '65.22', '海南省三亚市', '10964', '5', '100', '0', '4斤海南三亚新鲜水果 黑金刚莲雾 水果清甜多汁黑珍珠蜜风铃连', '180', '2018-05-08 16:40', '0', '莲雾', '41.88', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10965', '海口市莲雾', '43.17', '70.41', '海南省海口市', '10965', '5', '100', '0', '海南黑金刚莲雾热带水果特产新鲜南方当季水果农家现摘发货', '180', '2018-05-08 16:40', '0', '莲雾', '40.41', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10966', '中国莲雾', '48.51', '68.43', '中国大陆', '10966', '5', '100', '0', '【升森水果】新鲜水果 泰国黑金刚莲雾雾莲果进口热带非台湾连雾', '180', '2018-05-08 16:40', '0', '莲雾', '40.28', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10967', '三亚市莲雾', '65.49', '67.50', '海南省三亚市', '10967', '5', '100', '0', '海南新鲜莲雾 当季时令热带水果 黑金刚莲雾 脆甜 现摘3斤装空运', '180', '2018-05-08 16:40', '0', '莲雾', '47.12', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10968', '中国莲雾', '49.07', '55.98', '中国大陆', '10968', '5', '100', '0', '【升森水果】泰国黑金刚莲雾 进口新鲜水果 热带水果莲雾包邮', '180', '2018-05-08 16:40', '0', '莲雾', '40.86', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10969', '琼海市莲雾', '66.11', '76.28', '海南省琼海市', '10969', '5', '100', '0', '5斤装海南莲雾三亚树上熟黑金刚莲雾果水果一级越南黑金刚莲雾', '180', '2018-05-08 16:40', '0', '莲雾', '64.22', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10970', '海口市莲雾', '41.75', '67.14', '海南省海口市', '10970', '5', '100', '0', '套海南黑金刚莲雾新鲜热带水果三亚特产批发3斤包邮清甜大红现摘', '180', '2018-05-08 16:40', '0', '莲雾', '40.67', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10971', '三亚市莲雾', '48.04', '71.79', '海南省三亚市', '10971', '5', '100', '0', '5斤黑金刚莲雾 新鲜水果黑珍珠雾莲果热带当季水果', '180', '2018-05-08 16:40', '0', '莲雾', '43.44', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10972', '中国莲雾', '78.10', '79.68', '中国大陆', '10972', '5', '100', '0', '正宗黑金刚蜜风铃莲雾3斤新鲜孕妇水果胜海南泰国黑珍珠空运', '180', '2018-05-08 16:41', '0', '莲雾', '60.59', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10973', '三亚市莲雾', '54.31', '77.11', '海南省三亚市', '10973', '5', '100', '0', '海南三亚黑金刚莲雾 水果黑珍珠热带特产现摘新鲜水果雾莲果2斤', '180', '2018-05-08 16:41', '0', '莲雾', '42.94', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10974', '三亚市莲雾', '50.67', '60.83', '海南省三亚市', '10974', '4', '100', '0', '【直播减10元】5斤黑金刚莲雾水果新鲜海南三亚热带特产雾连果', '180', '2018-05-08 16:41', '0', '莲雾', '47.33', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10975', '海口市莲雾', '78.89', '79.96', '海南省海口市', '10975', '5', '100', '0', '【热带国度】海南三亚黑金刚莲雾3斤 雾莲果当季热带新鲜水果', '180', '2018-05-08 16:41', '0', '莲雾', '74.01', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10976', '三亚市莲雾', '78.22', '79.60', '海南省三亚市', '10976', '5', '100', '0', '海南特产红莲雾释迦水果4斤新鲜包邮5非台湾泰国黑金刚牛奶雾连2', '180', '2018-05-08 16:41', '0', '莲雾', '63.89', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10977', '三亚市莲雾', '50.38', '60.39', '海南省三亚市', '10977', '5', '100', '0', '5斤莲雾新鲜水果连雾莲果牛奶海南低价批发3非台湾10泰国黑金刚1', '180', '2018-05-08 16:41', '0', '莲雾', '48.82', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10978', '中国莲雾', '74.88', '79.28', '中国大陆', '10978', '5', '100', '0', '【4斤装】泰国进口黑金刚莲雾 雾莲果当季新鲜热带水果包邮', '180', '2018-05-08 16:41', '0', '莲雾', '41.47', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10979', '中国莲雾', '46.28', '55.02', '中国大陆', '10979', '5', '100', '0', '【升森水果】泰国黑金刚莲雾雾莲果新鲜水果 进口热带非台湾连雾', '180', '2018-05-08 16:41', '0', '莲雾', '40.17', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10980', '三亚市莲雾', '64.06', '67.95', '海南省三亚市', '10980', '5', '100', '0', 'GREENHOW 海南新鲜热带水果三亚黑金刚莲雾现摘大果3斤装顺丰包邮', '180', '2018-05-08 16:41', '0', '莲雾', '60.02', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10981', '三亚市莲雾', '60.98', '69.80', '海南省三亚市', '10981', '4', '100', '0', '【直播减10元】海南黑金刚莲雾水果5斤三亚热带特产新鲜黑珍珠', '180', '2018-05-08 16:41', '0', '莲雾', '41.23', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10982', '三亚市莲雾', '45.19', '73.49', '海南省三亚市', '10982', '5', '100', '0', '5斤黑金刚莲雾 水果新鲜黑珍珠蜜风铃莲雾果海南三亚特产雾莲果', '180', '2018-05-08 16:41', '0', '莲雾', '41.07', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10983', '中国莲雾', '71.56', '79.22', '中国大陆', '10983', '5', '100', '0', '顺丰空运 台湾进口黑金刚莲雾新鲜水果批发3斤包邮 清甜脆爽', '180', '2018-05-08 16:41', '0', '莲雾', '70.25', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10984', '南宁市莲雾', '75.60', '78.77', '广西壮族自治区南宁市', '10984', '5', '100', '0', '莲雾水果  5斤精选一级大果新鲜包邮牛奶红莲雾果越南雾莲黑金刚', '180', '2018-05-08 16:41', '0', '莲雾', '41.08', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10985', '三亚市莲雾', '51.91', '67.22', '海南省三亚市', '10985', '3', '100', '0', '海南三亚莲雾新鲜水果黑金刚莲雾果园现摘特产热带雾莲果5斤装', '180', '2018-05-08 16:41', '0', '莲雾', '41.86', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10986', '三亚市莲雾', '68.95', '75.72', '海南省三亚市', '10986', '5', '100', '0', '【买一送一共发4斤】海南黑金刚莲雾 非越南新鲜水果2斤多省包邮', '180', '2018-05-08 16:41', '0', '莲雾', '56.81', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10987', '三亚市莲雾', '65.39', '73.44', '海南省三亚市', '10987', '5', '100', '0', '莲雾水果新鲜黑金刚海南三亚热带直发现摘时令胜越南大红5斤包邮', '180', '2018-05-08 16:41', '0', '莲雾', '60.47', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10988', '三亚市莲雾', '48.53', '66.78', '海南省三亚市', '10988', '5', '100', '0', '海南特产莲雾水果3斤新鲜包邮5非泰国越南进口黑金刚黑珍珠雾连2', '180', '2018-05-08 16:41', '0', '莲雾', '46.79', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10989', '五指山市莲雾', '50.90', '75.30', '海南省五指山市', '10989', '5', '100', '0', '品质大果海南特产红莲雾4斤水果新鲜批发包邮当季整箱非黑金刚5', '180', '2018-05-08 16:41', '0', '莲雾', '49.21', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10990', '中国莲雾', '42.94', '70.86', '中国大陆', '10990', '5', '100', '0', '泰国黑金刚莲雾三亚2水果批发5斤新鲜包邮非海南黑金刚牛奶莲雾', '180', '2018-05-08 16:41', '0', '莲雾', '42.29', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10991', '三亚市莲雾', '74.32', '79.02', '海南省三亚市', '10991', '5', '100', '0', '果然亮 黑金刚莲雾水果5斤新鲜包邮批发新鲜当季整箱热带海南特产', '180', '2018-05-08 16:41', '0', '莲雾', '57.73', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10992', '中国莲雾', '48.67', '77.27', '中国大陆', '10992', '5', '100', '0', '台湾进口莲雾 黑珍珠莲雾 黑金刚莲雾 2斤装清甜多汁 发顺丰', '180', '2018-05-08 16:41', '0', '莲雾', '44.96', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10993', '三亚市莲雾', '71.76', '78.53', '海南省三亚市', '10993', '5', '100', '0', '1斤19.9元包邮海南三亚特产新鲜水果黑金刚莲雾热带水果雾莲果', '180', '2018-05-08 16:41', '0', '莲雾', '45.82', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10994', '中国莲雾', '70.85', '72.10', '中国大陆', '10994', '5', '100', '0', '升森 新鲜水果 泰国黑金刚莲雾当季进口热带水果包邮', '180', '2018-05-08 16:41', '0', '莲雾', '54.30', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10995', '中国莲雾', '62.44', '64.11', '中国大陆', '10995', '5', '100', '0', '【俏果缘】泰国进口黑金刚莲雾3斤 新鲜热带清甜多汁水果', '180', '2018-05-08 16:41', '0', '莲雾', '57.19', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10996', '乐东黎族自治县莲雾', '57.45', '72.11', '海南省乐东黎族自治县', '10996', '5', '100', '0', '淘乡甜海南莲雾黑金刚4.6斤单果110g以上当季新鲜水果整箱包邮', '180', '2018-05-08 16:41', '0', '莲雾', '55.52', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10997', '海口市莲雾', '64.28', '73.43', '海南省海口市', '10997', '5', '100', '0', '套海南黑金刚新鲜热带水果莲雾三亚特产5斤批发当季果园现摘包邮', '180', '2018-05-08 16:41', '0', '莲雾', '44.41', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10998', '中国莲雾', '63.60', '78.09', '中国大陆', '10998', '5', '100', '0', '莲雾水果 5斤新鲜顺丰包邮精选牛奶红莲雾果越南雾莲黑金刚非海南', '180', '2018-05-08 16:41', '0', '莲雾', '42.90', '爬虫抓取');
INSERT INTO `fruits` VALUES ('10999', '三亚市莲雾', '59.10', '64.45', '海南省三亚市', '10999', '5', '100', '0', '海南黑金刚莲雾热带水果特产5斤新鲜包邮南方当季牛奶大红雾莲果', '180', '2018-05-08 16:42', '0', '莲雾', '47.87', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11000', '三亚市莲雾', '73.10', '78.05', '海南省三亚市', '11000', '5', '100', '0', '【收藏送1斤】海南莲雾黑金刚大果当季热带水果批发包邮 新鲜', '180', '2018-05-08 16:42', '0', '莲雾', '72.44', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11001', '海口市莲雾', '56.87', '58.93', '海南省海口市', '11001', '5', '100', '0', '【买一送一共发3斤】海南三亚热带新鲜水果黑金刚莲雾果 清甜多汁', '180', '2018-05-08 16:42', '0', '莲雾', '49.50', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11002', '中国莲雾', '65.96', '72.84', '中国大陆', '11002', '5', '100', '0', '热带新鲜水果黑珍珠蜜风铃莲雾果越南特产雾莲果3斤黑金刚莲雾', '180', '2018-05-08 16:42', '0', '莲雾', '45.08', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11003', '三亚市莲雾', '41.31', '63.98', '海南省三亚市', '11003', '5', '100', '0', '凤凰湾三亚黑金刚大果莲雾当季新鲜水果空运3斤包邮损坏包赔', '180', '2018-05-08 16:42', '0', '莲雾', '40.17', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11004', '三亚市莲雾', '59.79', '60.81', '海南省三亚市', '11004', '5', '100', '0', '黑金刚莲雾当季热带水果 莲雾连雾现摘 新鲜包邮2斤孕妇宜吃', '180', '2018-05-08 16:42', '0', '莲雾', '49.17', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11005', '三亚市莲雾', '43.87', '72.72', '海南省三亚市', '11005', '5', '100', '0', '海南特产黑珍珠莲雾当季应季时令新鲜水果现摘现发2斤 多省包邮', '180', '2018-05-08 16:42', '0', '莲雾', '40.54', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11006', '南宁市莲雾', '57.47', '67.97', '广西壮族自治区南宁市', '11006', '5', '100', '0', '迎果恋黑金刚莲雾水果新鲜3斤水果批发包邮新鲜当季整箱莲雾', '180', '2018-05-08 16:42', '0', '莲雾', '44.70', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11007', '中国莲雾', '77.20', '78.32', '中国大陆', '11007', '5', '100', '0', '泰国黑金刚莲雾 水果新鲜5斤包邮 热带水果 雾莲果 海南莲雾', '180', '2018-05-08 16:42', '0', '莲雾', '63.76', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11008', '中国莲雾', '72.05', '77.93', '中国大陆', '11008', '4', '100', '0', '【买1送1】新鲜进口水果台湾莲雾 黑金刚莲雾蜜蜂铃5个装大果', '180', '2018-05-08 16:42', '0', '莲雾', '52.36', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11009', '中国莲雾', '46.18', '71.56', '中国大陆', '11009', '5', '100', '0', '【升森水果】泰国黑金刚莲雾 进口新鲜水果 热带水果莲雾包邮', '180', '2018-05-08 16:42', '0', '莲雾', '44.26', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11010', '三亚市莲雾', '43.66', '72.60', '海南省三亚市', '11010', '5', '100', '0', '3斤海南三亚莲雾水果新鲜当季连雾特产莲果5非台湾金刚牛奶黑金刚', '180', '2018-05-08 16:42', '0', '莲雾', '43.47', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11011', '三亚市莲雾', '48.67', '63.68', '海南省三亚市', '11011', '1', '100', '0', '4斤装海南莲雾新鲜水果红宝石莲雾果园现摘特产热带三亚雾莲果', '180', '2018-05-08 16:42', '0', '莲雾', '43.95', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11012', '海口市莲雾', '75.31', '78.85', '海南省海口市', '11012', '2', '100', '0', '海南黑金刚莲雾5斤装 新鲜热带水果牛奶莲雾中大果 坏果包赔', '180', '2018-05-08 16:42', '0', '莲雾', '64.25', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11013', '中国莲雾', '51.15', '52.95', '中国大陆', '11013', '5', '100', '0', '【叼食】泰国进口黑珍珠莲雾3斤(8', '180', '2018-05-08 16:42', '0', '莲雾', '42.44', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11014', '南宁市莲雾', '67.39', '77.22', '广西壮族自治区南宁市', '11014', '5', '100', '0', '迎果恋莲雾水果新鲜2斤包邮海南黑金刚莲雾水果批发新鲜当季整箱', '180', '2018-05-08 16:42', '0', '莲雾', '46.14', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11015', '中国莲雾', '79.71', '79.86', '中国大陆', '11015', '5', '100', '0', '莲雾水果 5斤新鲜包邮精选牛奶红莲雾果越南雾莲黑金刚非海南连雾', '180', '2018-05-08 16:42', '0', '莲雾', '79.36', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11016', '三亚市莲雾', '68.74', '70.30', '海南省三亚市', '11016', '3', '100', '0', '5斤装 泰国黑金刚莲雾新鲜果园现摘雾莲果热带水果包邮', '180', '2018-05-08 16:42', '0', '莲雾', '66.69', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11017', '桃', '41.88', '67.16', '山西省运城市', '11017', '5', '100', '0', '绿熊庄园水蜜桃桃子水果新鲜5斤孕妇水果硬桃脆桃非油桃', '180', '2018-05-08 16:42', '0', '桃', '40.40', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11018', '唐山市桃', '73.04', '73.59', '河北省唐山市', '11018', '5', '100', '0', '现货现摘水蜜桃水果新鲜桃子5斤批发包邮应季时令脆毛桃非油桃蟠', '180', '2018-05-08 16:42', '0', '桃', '67.13', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11019', '无锡市桃', '73.74', '76.62', '江苏省无锡市', '11019', '5', '100', '0', '正宗无锡阳山水蜜桃5两左右8只装当季桃子新鲜水果礼盒批发包邮', '180', '2018-05-08 16:42', '0', '桃', '48.98', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11020', '无锡市桃', '49.69', '67.07', '江苏省无锡市', '11020', '5', '100', '0', '【5两左右12只】正宗无锡阳山水蜜桃包邮新鲜水果非奉化水蜜桃子', '180', '2018-05-08 16:42', '0', '桃', '43.17', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11021', '无锡市桃', '59.86', '72.87', '江苏省无锡市', '11021', '4', '100', '0', '正宗无锡阳山水蜜桃精品特大8个装新鲜水蜜桃水果礼盒顺丰包邮', '180', '2018-05-08 16:42', '0', '桃', '44.42', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11022', '宜昌市桃', '56.81', '79.56', '湖北省宜昌市', '11022', '5', '100', '0', '现摘新鲜桃子水蜜桃红桃血桃脆桃毛桃5斤当季孕妇水果非油桃黄桃', '180', '2018-05-08 16:42', '0', '桃', '40.43', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11023', '鞍山市桃', '75.81', '79.30', '辽宁省鞍山市', '11023', '5', '100', '0', '现摘黄心油桃桃子水果新鲜包邮当季农家现货非水蜜桃黄桃毛桃子', '180', '2018-05-08 16:42', '0', '桃', '53.62', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11024', '无锡市桃', '61.77', '65.75', '江苏省无锡市', '11024', '5', '100', '0', '无锡阳山水蜜桃水果新鲜孕妇5', '180', '2018-05-08 16:42', '0', '桃', '59.34', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11025', '无锡市桃', '59.67', '78.32', '江苏省无锡市', '11025', '5', '100', '0', '阳山蜜露_正宗阳山水蜜桃 无锡特产新鲜水果桃子6两左右8个礼盒装', '180', '2018-05-08 16:42', '0', '桃', '58.86', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11026', '中国桃', '53.77', '68.72', '中国大陆', '11026', '5', '100', '0', 'GREENHOW 顺丰包邮现货新鲜水果北京水蜜桃孕妇桃子12颗6斤礼盒装', '180', '2018-05-08 16:42', '0', '桃', '46.17', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11027', '中国桃', '48.78', '76.44', '中国大陆', '11027', '5', '100', '0', '河北春雪水蜜桃4个150g以上/个 新鲜水果 水蜜桃 春雪', '180', '2018-05-08 16:42', '0', '桃', '40.96', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11028', '中国桃', '58.42', '58.67', '中国大陆', '11028', '5', '100', '0', '【现货】送一斤实发4斤  北京平谷大桃水蜜桃 桃子鲜桃 新鲜水果', '180', '2018-05-08 16:42', '0', '桃', '44.87', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11029', '无锡市桃', '64.14', '78.97', '江苏省无锡市', '11029', '5', '100', '0', '正宗阳山水蜜桃5两左右12个礼盒装 无锡时令新鲜水果桃子顺丰包邮', '180', '2018-05-08 16:43', '0', '桃', '52.75', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11030', '无锡市桃', '75.66', '76.91', '江苏省无锡市', '11030', '5', '100', '0', '无锡阳山水蜜桃新鲜现摘桃子5两左右12只礼盒装 孕妇当季水果顺丰', '180', '2018-05-08 16:43', '0', '桃', '46.70', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11031', '襄阳市桃', '66.63', '73.47', '湖北省襄阳市', '11031', '5', '100', '0', '现摘新鲜桃子水蜜桃红桃血桃脆桃毛桃5斤当季孕妇水果非油桃 预售', '180', '2018-05-08 16:43', '0', '桃', '57.96', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11032', '中国桃', '77.05', '79.66', '中国大陆', '11032', '5', '100', '0', '【顺丰包邮】 现货 北京水蜜桃 桃子新鲜水果12枚礼盒装', '180', '2018-05-08 16:43', '0', '桃', '49.54', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11033', '中国桃', '64.54', '78.79', '中国大陆', '11033', '5', '100', '0', '6月18号发货 绿养道北京平谷大桃蟠桃4斤装 水蜜桃子扁桃新鲜水果', '180', '2018-05-08 16:43', '0', '桃', '54.00', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11034', '运城市桃', '74.79', '78.61', '山西省运城市', '11034', '5', '100', '0', '山西黄油桃新鲜水果包邮当季水果现摘现发批发整箱现季大油桃5斤', '180', '2018-05-08 16:43', '0', '桃', '72.31', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11035', '运城市桃', '79.26', '79.34', '山西省运城市', '11035', '5', '100', '0', '现摘水蜜桃时令新鲜桃子脆桃当季水果新鲜毛桃5斤非油桃蟠桃', '180', '2018-05-08 16:43', '0', '桃', '45.11', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11036', '日照市桃', '73.13', '78.39', '山东省日照市', '11036', '5', '100', '0', '现货山东新鲜水果油桃5斤黄心孕妇水果当季水蜜桃子毛桃整箱批发', '180', '2018-05-08 16:43', '0', '桃', '46.25', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11037', '无锡市桃', '51.86', '55.33', '江苏省无锡市', '11037', '5', '100', '0', '正宗无锡阳山水蜜桃新鲜现摘5两左右12个礼盒装时令水果桃子顺丰', '180', '2018-05-08 16:43', '0', '桃', '49.24', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11038', '西安市桃', '67.67', '73.33', '陕西省西安市', '11038', '5', '100', '0', '应季新鲜水果桃子当季时令现摘水蜜桃5斤装 甜脆非油桃毛桃包邮', '180', '2018-05-08 16:43', '0', '桃', '66.71', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11039', '唐山市桃', '62.20', '69.20', '河北省唐山市', '11039', '5', '100', '0', '现货桃子水果现摘现发新鲜孕妇脆当季水蜜桃 非油桃毛桃5斤包邮', '180', '2018-05-08 16:43', '0', '桃', '40.23', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11040', '中国桃', '67.82', '76.25', '中国大陆', '11040', '5', '100', '0', '鲜万家 顺丰包邮现货新鲜当季应季水果北京水蜜桃桃子6斤礼盒装', '180', '2018-05-08 16:43', '0', '桃', '44.00', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11041', '唐山市桃', '53.79', '54.22', '河北省唐山市', '11041', '5', '100', '0', '现货现摘桃子水果新鲜油桃5斤批发包邮当季脆黄心桃非蟠桃水蜜桃', '180', '2018-05-08 16:43', '0', '桃', '53.02', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11042', '中国桃', '75.49', '79.93', '中国大陆', '11042', '5', '100', '0', '辽宁大连油桃2kg60g以上/个 新鲜水果 大连油桃 油桃', '180', '2018-05-08 16:43', '0', '桃', '45.13', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11043', '中国桃', '76.02', '76.23', '中国大陆', '11043', '5', '100', '0', '河北春雪水蜜桃2个150g以上/个', '180', '2018-05-08 16:43', '0', '桃', '55.54', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11044', '无锡市桃', '64.47', '67.00', '江苏省无锡市', '11044', '5', '100', '0', '正宗阳山水蜜桃无锡特产新鲜水果桃子奉化非5两左右现货12个孕妇', '180', '2018-05-08 16:43', '0', '桃', '49.64', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11045', '唐山市桃', '44.55', '72.01', '河北省唐山市', '11045', '5', '100', '0', '现摘现发桃子水果 新鲜现货5斤包邮当季水蜜桃孕妇毛桃非蟠桃脆桃', '180', '2018-05-08 16:43', '0', '桃', '42.54', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11046', '襄阳市桃', '64.72', '71.77', '湖北省襄阳市', '11046', '5', '100', '0', '顺丰包邮5斤 现摘新鲜桃子水蜜桃红桃血桃脆桃毛桃当季水果 预售', '180', '2018-05-08 16:43', '0', '桃', '63.04', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11047', '临沂市桃', '49.26', '75.39', '山东省临沂市', '11047', '5', '100', '0', '山东蒙阴水蜜桃5斤包邮 水果新鲜桃子孕妇现摘当季10大毛桃软蟠桃', '180', '2018-05-08 16:43', '0', '桃', '44.52', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11048', '临沂市桃', '57.49', '76.56', '山东省临沂市', '11048', '5', '100', '0', '桃子水果新鲜当季水果水蜜桃新鲜水果现摘蒙阴毛桃非油桃黄桃包邮', '180', '2018-05-08 16:43', '0', '桃', '49.03', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11049', '襄阳市桃', '55.98', '70.70', '湖北省襄阳市', '11049', '5', '100', '0', '桃子新鲜5斤现摘当季水果批发包邮孕妇水蜜桃毛桃脆桃非油桃黄桃', '180', '2018-05-08 16:43', '0', '桃', '49.42', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11050', '中国桃', '62.97', '78.20', '中国大陆', '11050', '5', '100', '0', '辽宁黄金油桃500g60g以上/个 新鲜水果 油桃 黄金油桃', '180', '2018-05-08 16:43', '0', '桃', '47.76', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11051', '襄阳市桃', '48.69', '77.80', '湖北省襄阳市', '11051', '5', '100', '0', '桃子水果 新鲜现货包邮5斤当季水蜜桃脆孕妇毛桃非10斤血桃油黄桃', '180', '2018-05-08 16:43', '0', '桃', '41.46', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11052', '唐山市桃', '59.10', '78.80', '河北省唐山市', '11052', '5', '100', '0', '现货桃子水果现摘现发新鲜孕妇脆桃当季水蜜桃 非油桃毛桃3斤包邮', '180', '2018-05-08 16:43', '0', '桃', '42.75', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11053', '中国桃', '62.08', '79.57', '中国大陆', '11053', '5', '100', '0', '辽宁大连油桃1kg60g以上/个 新鲜水果 大连油桃', '180', '2018-05-08 16:43', '0', '桃', '53.08', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11054', '唐山市桃', '47.81', '57.02', '河北省唐山市', '11054', '5', '100', '0', '现货 桃子水蜜桃4斤包邮现货蜜桃脆桃新鲜水果脆桃毛桃非油桃黄桃', '180', '2018-05-08 16:43', '0', '桃', '42.14', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11055', '无锡市桃', '68.28', '69.67', '江苏省无锡市', '11055', '5', '100', '0', '单身套餐5两左右4个装 正宗阳山水蜜桃 无锡特产 新鲜水果桃子', '180', '2018-05-08 16:43', '0', '桃', '50.44', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11056', '中国桃', '71.94', '79.72', '中国大陆', '11056', '5', '100', '0', '辽宁大连油桃300g(60g以上/个)', '180', '2018-05-08 16:43', '0', '桃', '49.68', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11057', '中国桃', '42.47', '75.39', '中国大陆', '11057', '5', '100', '0', '云伙计现摘油桃当季新鲜孕妇水果脆桃子5斤批发包邮非水蜜桃毛桃', '180', '2018-05-08 16:44', '0', '桃', '40.94', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11058', '西安市桃', '54.59', '63.19', '陕西省西安市', '11058', '5', '100', '0', '砀山黄桃新鲜水果现摘现发5斤包邮现季农家甜脆桃非毛桃水蜜桃子', '180', '2018-05-08 16:44', '0', '桃', '41.17', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11059', '中国桃', '48.93', '74.89', '中国大陆', '11059', '5', '100', '0', '北京平谷蟠桃500g60g以上/个 新鲜水果 蟠桃 桃子 新鲜蟠桃', '180', '2018-05-08 16:44', '0', '桃', '42.12', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11060', '中国桃', '64.83', '66.96', '中国大陆', '11060', '5', '100', '0', '辽宁大连油桃500g60g以上/个', '180', '2018-05-08 16:44', '0', '桃', '43.84', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11061', '中国桃', '68.56', '77.44', '中国大陆', '11061', '5', '100', '0', '现摘现发水蜜桃新鲜桃子毛桃当季时令软桃脆桃新鲜孕妇水果空运', '180', '2018-05-08 16:44', '0', '桃', '50.90', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11062', '运城市桃', '76.85', '79.40', '山西省运城市', '11062', '5', '100', '0', '云伙计 桃子5斤时令新鲜孕妇水果脆甜毛桃非水蜜桃油桃批发包邮', '180', '2018-05-08 16:44', '0', '桃', '59.21', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11063', '襄阳市桃', '65.71', '67.64', '湖北省襄阳市', '11063', '5', '100', '0', '现摘新鲜桃子水蜜桃红桃血桃脆桃毛桃当季孕妇水果5斤非油桃 预售', '180', '2018-05-08 16:44', '0', '桃', '51.01', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11064', '新乡市桃', '68.67', '71.90', '河南省新乡市', '11064', '5', '100', '0', '买送3斤共8斤 现摘现发桃子水果 新鲜 水蜜桃5斤脆桃硬桃 非油桃', '180', '2018-05-08 16:44', '0', '桃', '68.41', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11065', '临沂市桃', '55.33', '72.03', '山东省临沂市', '11065', '5', '100', '0', '预售 蒙阴黄桃新鲜蟠桃农家自种水果现摘现发非阳山五台水蜜桃3斤', '180', '2018-05-08 16:44', '0', '桃', '53.76', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11066', '南阳市桃', '51.79', '71.84', '河南省南阳市', '11066', '5', '100', '0', '血桃水果新鲜 5斤批发红心10非油桃桃子孕妇水蜜桃现货当季整箱', '180', '2018-05-08 16:44', '0', '桃', '41.09', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11067', '中国桃', '73.86', '77.23', '中国大陆', '11067', '5', '100', '0', '河北春雪水蜜桃8个150g以上/个 新鲜水果 春雪 水蜜桃', '180', '2018-05-08 16:44', '0', '桃', '57.84', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11068', '无锡市桃', '42.56', '57.04', '江苏省无锡市', '11068', '3', '100', '0', '正宗阳山水蜜桃无锡特产新鲜水果桃子奉化非5两左右现货12个礼盒', '180', '2018-05-08 16:44', '0', '桃', '41.40', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11069', '新乡市桃', '53.10', '66.84', '河南省新乡市', '11069', '5', '100', '0', '桃子水蜜桃5斤包邮 水果新鲜脆甜大桃蜜桃脆桃毛桃硬桃非油桃黄桃', '180', '2018-05-08 16:44', '0', '桃', '43.92', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11070', '临沂市桃', '42.19', '60.26', '山东省临沂市', '11070', '5', '100', '0', '预售 沂蒙山油桃新鲜桃子水蜜桃当季水果现摘现发5斤低价批发包邮', '180', '2018-05-08 16:44', '0', '桃', '40.55', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11071', '无锡市桃', '65.45', '68.74', '江苏省无锡市', '11071', '5', '100', '0', '买2送1 正宗水蜜桃水果新鲜桃子孕妇水蜜桃肉多现摘阳山水蜜桃', '180', '2018-05-08 16:44', '0', '桃', '65.44', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11072', '襄阳市桃', '57.93', '58.05', '湖北省襄阳市', '11072', '5', '100', '0', '【5月20号发货】现摘新鲜桃子当季水果脆桃水蜜桃湖北枣阳桃', '180', '2018-05-08 16:44', '0', '桃', '45.13', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11073', '唐山市桃', '66.26', '76.11', '河北省唐山市', '11073', '5', '100', '0', '水蜜桃新鲜水果现摘现发桃子甜蜜毛桃3斤装包邮批发非油桃蟠桃', '180', '2018-05-08 16:44', '0', '桃', '53.79', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11074', '新乡市桃', '41.39', '78.67', '河南省新乡市', '11074', '5', '100', '0', '【现货速发】现摘水蜜桃桃子水果 新鲜4斤 孕妇水果脆桃子非毛桃', '180', '2018-05-08 16:44', '0', '桃', '41.00', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11075', '武汉市桃', '68.93', '69.82', '湖北省武汉市', '11075', '5', '100', '0', '现摘新鲜桃子水蜜桃脆桃毛桃5斤当季孕妇水果非血桃油桃黄桃', '180', '2018-05-08 16:44', '0', '桃', '44.39', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11076', '无锡市桃', '76.88', '79.47', '江苏省无锡市', '11076', '5', '100', '0', '正宗无锡阳山水蜜桃5两12个礼盒装 时令新鲜水果桃子 顺丰空运', '180', '2018-05-08 16:44', '0', '桃', '57.56', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11077', '烟台市草莓', '47.23', '79.29', '山东省烟台市', '11077', '5', '100', '0', '白雪公主草莓现摘现发孕妇水果批发包邮新鲜当季整箱淡雪奶油草莓', '180', '2018-05-08 16:44', '0', '草莓', '41.90', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11078', '中国草莓', '71.12', '72.99', '中国大陆', '11078', '5', '100', '0', '辽宁丹东九九草莓1盒400g以上/盒', '180', '2018-05-08 16:44', '0', '草莓', '62.06', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11079', '丹东市草莓', '74.08', '77.21', '辽宁省丹东市', '11079', '5', '100', '0', '丹东九九红颜99牛奶奶油大草莓 新鲜孕妇水果3斤顺丰包邮现摘现发', '180', '2018-05-08 16:44', '0', '草莓', '49.91', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11080', '合肥市草莓', '52.20', '61.66', '安徽省合肥市', '11080', '1', '100', '0', '莓味道新鲜草莓水果花草莓蛋糕草莓甜品偏酸8盒江浙沪皖顺丰包邮', '180', '2018-05-08 16:44', '0', '草莓', '51.58', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11081', '中国草莓', '43.59', '52.36', '中国大陆', '11081', '5', '100', '0', '上海红霞草莓1盒(约400g/盒)', '180', '2018-05-08 16:44', '0', '草莓', '41.85', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11082', '济南市草莓', '61.89', '68.70', '山东省济南市', '11082', '5', '100', '0', '现摘现发新鲜草莓章姬奶油草莓新鲜孕妇小孩水果2斤顺丰快递包邮', '180', '2018-05-08 16:44', '0', '草莓', '50.84', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11083', '中国草莓', '59.48', '79.44', '中国大陆', '11083', '5', '100', '0', '丹东红颜草莓1盒(300g/盒)', '180', '2018-05-08 16:44', '0', '草莓', '51.85', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11084', '合肥市草莓', '69.89', '79.86', '安徽省合肥市', '11084', '1', '100', '0', '莓味道新鲜草莓水果花草莓蛋糕草莓甜品偏酸江浙沪皖306盒', '180', '2018-05-08 16:44', '0', '草莓', '48.57', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11085', '丹东市草莓', '77.33', '77.46', '辽宁省丹东市', '11085', '5', '100', '0', '甲午先生 现摘现发丹东99奶油草莓新鲜丹东牛奶草莓 儿童孕妇2斤', '180', '2018-05-08 16:45', '0', '草莓', '75.21', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11086', '中国草莓', '72.92', '76.67', '中国大陆', '11086', '5', '100', '0', '丹东草莓300g', '180', '2018-05-08 16:45', '0', '草莓', '61.15', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11087', '合肥市草莓', '44.63', '78.10', '安徽省合肥市', '11087', '5', '100', '0', '牛奶草莓新鲜顺丰包邮现摘现发水果批发红颜草莓奶油味双流冬草莓', '180', '2018-05-08 16:45', '0', '草莓', '42.93', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11088', '中国草莓', '57.86', '60.52', '中国大陆', '11088', '5', '100', '0', '湖北红颜草莓1盒250g以上/盒', '180', '2018-05-08 16:45', '0', '草莓', '47.11', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11089', '昆明市草莓', '43.57', '79.71', '云南省昆明市', '11089', '1', '100', '0', '莓味道新鲜草莓水果花草莓蛋糕草莓甜品偏酸合肥市区2盒包邮', '180', '2018-05-08 16:45', '0', '草莓', '42.16', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11090', '中国草莓', '45.98', '59.05', '中国大陆', '11090', '5', '100', '0', '聚鲜林新鲜红颜奶油草莓冬季巧克力甜草莓1盒装水果3盒起包邮顺丰', '180', '2018-05-08 16:45', '0', '草莓', '42.95', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11091', '徐州市草莓', '57.30', '70.60', '江苏省徐州市', '11091', '5', '100', '0', '草莓新鲜水果牛奶油巧克力大草梅3斤红颜非丹东9九礼盒顺丰包邮', '180', '2018-05-08 16:45', '0', '草莓', '44.10', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11092', '丹东市草莓', '69.21', '77.52', '辽宁省丹东市', '11092', '5', '100', '0', '甲午先生 丹东红颜99草莓 现摘奶油牛奶现摘九九草莓新鲜孕妇水果', '180', '2018-05-08 16:45', '0', '草莓', '41.89', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11093', '丹东市草莓', '54.11', '72.02', '辽宁省丹东市', '11093', '5', '100', '0', '漫泉河 5斤装 丹东草莓 红颜九九 牛奶草莓 99草莓 顺丰包邮', '180', '2018-05-08 16:45', '0', '草莓', '45.90', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11094', '合肥市草莓', '78.55', '78.82', '安徽省合肥市', '11094', '4', '100', '0', '牛奶草莓新鲜丹东99草莓丹东草莓牛奶奶油草莓顺丰包邮同城现发', '180', '2018-05-08 16:45', '0', '草莓', '49.77', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11095', '中国草莓', '74.32', '75.95', '中国大陆', '11095', '5', '100', '0', '西洋兔红颜草莓北京昌平兴寿草莓大果现摘现发700g尝鲜装顺丰包邮', '180', '2018-05-08 16:45', '0', '草莓', '54.96', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11096', '中国草莓', '56.47', '60.21', '中国大陆', '11096', '3', '100', '0', '爱蒂宝 情人节心形草莓水果脆皮巧克力礼盒送女友创意礼物', '180', '2018-05-08 16:45', '0', '草莓', '40.63', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11097', '丹东市草莓', '61.48', '77.08', '辽宁省丹东市', '11097', '5', '100', '0', '丹东草莓新鲜水果3斤礼盒装红颜奶油味丹东99草莓顺丰包邮现摘', '180', '2018-05-08 16:45', '0', '草莓', '60.13', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11098', '合肥市草莓', '75.05', '79.60', '安徽省合肥市', '11098', '5', '100', '0', '莓味道 新鲜草莓现货烘焙草莓鲜果蛋糕装饰新鲜水果 3盒全国包邮', '180', '2018-05-08 16:45', '0', '草莓', '65.75', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11099', '丹东市草莓', '51.48', '74.38', '辽宁省丹东市', '11099', '5', '100', '0', '美果汇 丹东99草莓 新鲜水果包邮 红颜草莓3斤', '180', '2018-05-08 16:45', '0', '草莓', '50.37', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11100', '中国草莓', '46.02', '47.66', '中国大陆', '11100', '5', '100', '0', '辽宁丹东九九草莓1盒400g以上/盒', '180', '2018-05-08 16:45', '0', '草莓', '42.71', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11101', '丹东市草莓', '65.56', '74.27', '辽宁省丹东市', '11101', '5', '100', '0', '【小鲜柚】丹东99草莓3斤装顺丰包邮辽宁九九红颜牛奶新鲜水果', '180', '2018-05-08 16:45', '0', '草莓', '56.97', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11102', '中国草莓', '65.45', '75.66', '中国大陆', '11102', '5', '100', '0', '新鲜草莓蛋糕装饰烘焙用水果鲜果双流冬草莓一盒350克4盒顺丰包邮', '180', '2018-05-08 16:45', '0', '草莓', '56.31', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11103', '昆明市草莓', '46.09', '47.97', '云南省昆明市', '11103', '1', '100', '0', '莓味道新鲜草莓水果花草莓蛋糕草莓甜品30盒偏酸江浙沪皖顺丰包邮', '180', '2018-05-08 16:45', '0', '草莓', '41.39', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11104', '潍坊市草莓', '74.77', '74.82', '山东省潍坊市', '11104', '5', '100', '0', '现摘现发新鲜草莓红颜非奶油草莓机新鲜孕妇水果3斤顺丰快递包邮', '180', '2018-05-08 16:45', '0', '草莓', '60.57', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11105', '中国草莓', '61.75', '70.53', '中国大陆', '11105', '5', '100', '0', '上海青浦红颜草莓1盒(300g/盒)', '180', '2018-05-08 16:45', '0', '草莓', '53.96', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11106', '合肥市草莓', '45.05', '50.47', '安徽省合肥市', '11106', '5', '100', '0', '【莓味道】奶油草莓新鲜水果巧克力牛奶红颜大草莓 4盒顺丰包邮', '180', '2018-05-08 16:46', '0', '草莓', '43.10', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11107', '铜川市草莓', '55.75', '68.43', '陕西省铜川市', '11107', '5', '100', '0', '枝纯新鲜现采摘巧克力草莓水果 蛋糕烘焙红颜2盒装草莓 玻璃温室', '180', '2018-05-08 16:46', '0', '草莓', '49.93', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11108', '中国草莓', '78.78', '78.98', '中国大陆', '11108', '5', '100', '0', '帝鸿农 双流草莓320g/盒夏季草莓4盒包邮新鲜水果过年营业', '180', '2018-05-08 16:46', '0', '草莓', '49.35', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11109', '丹东市草莓', '42.69', '73.32', '辽宁省丹东市', '11109', '5', '100', '0', '顺丰包邮水果丹东东港秸秆99草莓3斤 新鲜红颜草莓 九九牛奶草莓', '180', '2018-05-08 16:46', '0', '草莓', '41.11', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11110', '烟台市草莓', '48.83', '57.93', '山东省烟台市', '11110', '5', '100', '0', '白草莓新鲜奶油草莓牛奶水果非丹东99大草莓胜红颜日本淡雪礼盒装', '180', '2018-05-08 16:46', '0', '草莓', '41.42', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11111', '合肥市草莓', '42.08', '63.74', '安徽省合肥市', '11111', '5', '100', '0', '莓味道奶油草莓新鲜现摘巧克力鲜草莓水果新鲜牛奶草莓 全国包邮', '180', '2018-05-08 16:46', '0', '草莓', '40.93', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11112', '烟台市草莓', '58.30', '75.83', '山东省烟台市', '11112', '5', '100', '0', '现货淡雪日本白草莓白心公主奶油草莓现摘新鲜水果顺丰2斤包邮', '180', '2018-05-08 16:46', '0', '草莓', '48.82', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11113', '保定市草莓', '59.45', '77.35', '河北省保定市', '11113', '5', '100', '0', '大罐草莓罐头 蛋糕房烘焙专用草莓蛋糕牛奶新鲜草莓批发820g*12罐', '180', '2018-05-08 16:46', '0', '草莓', '44.58', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11114', '中国草莓', '58.29', '65.17', '中国大陆', '11114', '5', '100', '0', '爱蒂宝红颜草莓缤纷礼盒水果礼品送朋友新鲜定制聚会礼物潮', '180', '2018-05-08 16:46', '0', '草莓', '43.24', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11115', '无锡市草莓', '75.29', '78.83', '江苏省无锡市', '11115', '5', '100', '0', '红颜奶油草莓新鲜现摘同城水果非丹东99双流牛奶新鲜草莓3斤包邮', '180', '2018-05-08 16:46', '0', '草莓', '47.06', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11116', '中国草莓', '59.26', '71.61', '中国大陆', '11116', '5', '100', '0', '聚鲜林 新鲜四季草莓全年现货供应烘焙蛋糕甜点装饰酸草莓鲜果1盒', '180', '2018-05-08 16:46', '0', '草莓', '49.10', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11117', '广安市草莓', '62.61', '79.18', '四川省广安市', '11117', '5', '100', '0', '【上领顶】新鲜草莓1盒装新鲜水果 广东满4盒包邮', '180', '2018-05-08 16:46', '0', '草莓', '60.02', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11118', '丹东市草莓', '69.40', '72.95', '辽宁省丹东市', '11118', '5', '100', '0', '甲午先生 丹东99草莓3斤 奶油草莓新鲜丹东牛奶草莓九九 顺丰包邮', '180', '2018-05-08 16:46', '0', '草莓', '49.03', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11119', '丹东市草莓', '70.85', '79.05', '辽宁省丹东市', '11119', '5', '100', '0', '丹东99红颜草莓3斤新鲜水果奶油牛奶草莓东港马家岗九九秸秆草莓', '180', '2018-05-08 16:46', '0', '草莓', '42.95', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11120', '丹东市草莓', '47.00', '50.74', '辽宁省丹东市', '11120', '5', '100', '0', '丹东99草莓新鲜草莓奶油草莓巧克力孕妇红颜草莓牛奶现摘现发3斤', '180', '2018-05-08 16:46', '0', '草莓', '46.54', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11121', '成都市草莓', '56.04', '72.88', '四川省成都市', '11121', '5', '100', '0', '四川双流冬草莓奶油草莓新鲜水果丹东99新鲜草莓顺丰包邮现摘现发', '180', '2018-05-08 16:46', '0', '草莓', '40.01', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11122', '中国草莓', '71.84', '78.51', '中国大陆', '11122', '5', '100', '0', '广东红颜草莓1盒(250g以上/盒）', '180', '2018-05-08 16:46', '0', '草莓', '70.54', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11123', '合肥市草莓', '78.72', '79.53', '安徽省合肥市', '11123', '1', '100', '0', '莓味道新鲜草莓水果花草莓蛋糕草莓甜品偏酸500盒', '180', '2018-05-08 16:46', '0', '草莓', '69.47', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11124', '中国草莓', '63.51', '77.87', '中国大陆', '11124', '5', '100', '0', '榴星语牌冷冻草莓肉新鲜速冻草莓肉烘焙蛋糕牛奶油草莓果酱', '180', '2018-05-08 16:46', '0', '草莓', '61.74', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11125', '丹东市草莓', '66.47', '73.22', '辽宁省丹东市', '11125', '5', '100', '0', '甲午先生 丹东99现摘红颜草莓 3斤奶油牛奶九九新鲜草莓水果', '180', '2018-05-08 16:46', '0', '草莓', '48.21', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11126', '丹东市草莓', '54.94', '79.26', '辽宁省丹东市', '11126', '5', '100', '0', '新鲜牛奶草莓3斤红颜奶油丹东99草莓现摘水果礼盒装顺丰包邮', '180', '2018-05-08 16:46', '0', '草莓', '54.77', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11127', '中国草莓', '43.31', '52.41', '中国大陆', '11127', '5', '100', '0', '【易果生鲜】昌平小汤山红颜草莓1盒400g以上/盒', '180', '2018-05-08 16:46', '0', '草莓', '41.57', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11128', '成都市草莓', '40.40', '78.08', '四川省成都市', '11128', '5', '100', '0', '四川成都双流草莓320克X1 奶油草莓新鲜红颜草莓拍3盒包邮', '180', '2018-05-08 16:46', '0', '草莓', '40.27', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11129', '丹东市草莓', '43.97', '46.60', '辽宁省丹东市', '11129', '5', '100', '0', '现摘现发丹东99新鲜牛奶草莓农家大草莓鲜甜奶油草莓3斤顺丰包邮', '180', '2018-05-08 16:46', '0', '草莓', '41.11', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11130', '潍坊市草莓', '62.76', '74.13', '山东省潍坊市', '11130', '4', '100', '0', '新鲜红颜巧克力奶油牛奶冬草莓现摘现发非双流冬草苺3斤顺丰包邮', '180', '2018-05-08 16:47', '0', '草莓', '62.22', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11131', '丹东市草莓', '70.95', '73.39', '辽宁省丹东市', '11131', '5', '100', '0', '顺丰包邮水果丹东东港秸秆99草莓6斤 新鲜红颜草莓 九九牛奶草莓', '180', '2018-05-08 16:47', '0', '草莓', '41.77', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11132', '烟台市草莓', '40.65', '71.68', '山东省烟台市', '11132', '5', '100', '0', '白草莓新鲜孕妇水果当季奶油味2斤顺丰包邮现摘现发白雪公主草莓', '180', '2018-05-08 16:47', '0', '草莓', '40.22', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11133', '丹东市草莓', '46.53', '71.44', '辽宁省丹东市', '11133', '5', '100', '0', '丹东99草莓红颜牛奶草莓新鲜水果九九东港奶油味大草莓3斤包邮', '180', '2018-05-08 16:47', '0', '草莓', '44.61', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11134', '南充市草莓', '76.44', '78.10', '四川省南充市', '11134', '5', '100', '0', '草莓新鲜水果当季新鲜草莓现摘现发2盒顺丰批发包邮红颜奶油草莓', '180', '2018-05-08 16:47', '0', '草莓', '64.61', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11135', '中国草莓', '74.85', '75.99', '中国大陆', '11135', '5', '100', '0', '新鲜草莓速冻草莓冰冻草莓新鲜冷冻草莓水果大草莓多省3或5包包邮', '180', '2018-05-08 16:47', '0', '草莓', '61.87', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11136', '丹东市草莓', '41.68', '62.97', '辽宁省丹东市', '11136', '5', '100', '0', '【食在粮心】丹东99草莓新鲜丹东红颜马家岗九九草莓东港牛奶草莓', '180', '2018-05-08 16:47', '0', '草莓', '40.35', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11137', '中国西柚', '61.59', '71.62', '中国大陆', '11137', '5', '100', '0', '南非进口西柚 新鲜水果红心果肉葡萄柚包邮 5个装单果重250', '180', '2018-05-08 16:47', '0', '西柚', '51.94', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11138', '中国西柚', '66.50', '67.54', '中国大陆', '11138', '5', '100', '0', '以色列西柚红心葡萄柚子6个进口新鲜当季水果包邮孕妇非南非美国', '180', '2018-05-08 16:47', '0', '西柚', '48.15', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11139', '中国西柚', '55.08', '59.79', '中国大陆', '11139', '5', '100', '0', '成都当天到 南非西柚4斤新鲜水果红宝石葡萄红心柚子榨汁', '180', '2018-05-08 16:47', '0', '西柚', '54.30', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11140', '中国西柚', '46.45', '48.05', '中国大陆', '11140', '5', '100', '0', '优霸 以色列西柚8个葡萄柚红心柚子新鲜水果进口时令当季非 南非', '180', '2018-05-08 16:47', '0', '西柚', '44.78', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11141', '中国西柚', '61.54', '65.77', '中国大陆', '11141', '4', '100', '0', '南非进口西柚新鲜水果包邮 葡萄柚血柚子红心西柚大果8个装', '180', '2018-05-08 16:47', '0', '西柚', '54.93', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11142', '中国西柚', '41.79', '43.05', '中国大陆', '11142', '5', '100', '0', '树果悦浓 南非进口西柚6个装水果包邮新鲜红心肉葡萄柚坏果包赔', '180', '2018-05-08 16:47', '0', '西柚', '40.31', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11143', '中国西柚', '51.98', '58.62', '中国大陆', '11143', '5', '100', '0', '【丘峰宅】南非西柚红心进口葡萄柚新鲜水果批发6个包邮红西柚', '180', '2018-05-08 16:47', '0', '西柚', '48.08', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11144', '中国西柚', '76.56', '78.60', '中国大陆', '11144', '5', '100', '0', '源润鲜现货以色列西柚葡萄柚8个红心柚进口西柚新鲜水果坏果包赔', '180', '2018-05-08 16:47', '0', '西柚', '67.93', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11145', '中国西柚', '46.40', '64.05', '中国大陆', '11145', '5', '100', '0', '南非西柚葡萄柚4个装红心新鲜进口当季时令水果非以色列柚子包邮', '180', '2018-05-08 16:47', '0', '西柚', '44.13', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11146', '中国西柚', '65.80', '73.18', '中国大陆', '11146', '5', '100', '0', '鲜万家 顺丰包邮新鲜水果西柚葡萄柚红心西柚子6个装大果4斤左右', '180', '2018-05-08 16:47', '0', '西柚', '59.49', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11147', '中国西柚', '67.07', '77.88', '中国大陆', '11147', '5', '100', '0', '甜岛宝台湾葡萄柚4个200g以上/个 西柚 新鲜水果 柚子', '180', '2018-05-08 16:47', '0', '西柚', '49.04', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11148', '广州市西柚', '78.44', '79.26', '广东省广州市', '11148', '5', '100', '0', '【幸康丰】南非红心西柚6个新鲜包邮进口葡萄柚叶酸孕妇水果柚子', '180', '2018-05-08 16:47', '0', '西柚', '53.97', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11149', '中国西柚', '54.21', '78.17', '中国大陆', '11149', '5', '100', '0', '南非/以色列红心西柚 葡萄柚8个 新鲜水果包邮', '180', '2018-05-08 16:47', '0', '西柚', '41.23', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11150', '中国西柚', '57.74', '60.92', '中国大陆', '11150', '2', '100', '0', '新鲜红心西柚 葡萄柚 6个包邮 进口水果', '180', '2018-05-08 16:47', '0', '西柚', '50.06', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11151', '中国西柚', '65.84', '67.97', '中国大陆', '11151', '3', '100', '0', '以色列巨无霸西柚6个装', '180', '2018-05-08 16:47', '0', '西柚', '43.80', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11152', '中国西柚', '68.01', '69.35', '中国大陆', '11152', '5', '100', '0', '【佳利麦】 南非进口红心西柚水果新鲜包邮当季葡萄柚子坏果包赔', '180', '2018-05-08 16:47', '0', '西柚', '49.09', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11153', '中国西柚', '48.11', '51.49', '中国大陆', '11153', '5', '100', '0', '【小鲜柚】南非红西柚6只 单果重300g以上 红心葡萄柚新鲜水果', '180', '2018-05-08 16:47', '0', '西柚', '47.79', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11154', '中国西柚', '65.58', '75.44', '中国大陆', '11154', '4', '100', '0', '悠乐果南非红心西柚6个葡萄柚子孕妇水果新鲜水果批发包邮', '180', '2018-05-08 16:48', '0', '西柚', '40.24', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11155', '中国西柚', '53.32', '61.39', '中国大陆', '11155', '4', '100', '0', '【上领顶】南非进口西柚3.5斤装（5', '180', '2018-05-08 16:48', '0', '西柚', '48.00', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11156', '中国西柚', '74.32', '78.77', '中国大陆', '11156', '5', '100', '0', '葡萄柚以色列南非心西柚包邮 新鲜水果 6个装', '180', '2018-05-08 16:48', '0', '西柚', '69.85', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11157', '中国西柚', '65.72', '66.39', '中国大陆', '11157', '5', '100', '0', '以色列西柚4个装现摘现发红心西柚葡萄柚血柚新鲜包邮孕妇水果', '180', '2018-05-08 16:48', '0', '西柚', '65.56', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11158', '中国西柚', '59.94', '77.77', '中国大陆', '11158', '5', '100', '0', '【yqyq】南非红心西柚6个装 红西柚葡萄柚孕妈水果新鲜南非西柚', '180', '2018-05-08 16:48', '0', '西柚', '43.77', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11159', '中国西柚', '60.44', '77.95', '中国大陆', '11159', '5', '100', '0', '南非西柚葡萄柚8个装红心新鲜进口当季时令水果非以色列柚子包邮', '180', '2018-05-08 16:48', '0', '西柚', '56.73', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11160', '中国西柚', '70.58', '72.54', '中国大陆', '11160', '5', '100', '0', '【易果生鲜】甜岛宝台湾葡萄柚4个200g以上/个', '180', '2018-05-08 16:48', '0', '西柚', '41.19', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11161', '中国西柚', '58.31', '58.48', '中国大陆', '11161', '5', '100', '0', '果易购 埃及西柚6个 装 葡萄柚新鲜进口当季水果非南非西柚包邮', '180', '2018-05-08 16:48', '0', '西柚', '45.78', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11162', '中国西柚', '69.64', '71.17', '中国大陆', '11162', '5', '100', '0', '以色列红心西柚 葡萄柚新鲜水果6个', '180', '2018-05-08 16:48', '0', '西柚', '61.50', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11163', '中国西柚', '59.21', '60.44', '中国大陆', '11163', '5', '100', '0', '歌慕 南非进口西柚 新鲜水果葡萄柚血柚子红心西柚包邮 大果6个装', '180', '2018-05-08 16:48', '0', '西柚', '45.68', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11164', '中国西柚', '61.58', '73.21', '中国大陆', '11164', '5', '100', '0', '南非西柚葡萄柚6个装红心新鲜进口当季时令水果非以色列柚子包邮', '180', '2018-05-08 16:48', '0', '西柚', '46.18', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11165', '中国西柚', '47.65', '74.08', '中国大陆', '11165', '5', '100', '0', '树果悦浓 南非进口西柚8个装水果包邮新鲜红心肉葡萄柚 坏果包赔', '180', '2018-05-08 16:48', '0', '西柚', '42.07', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11166', '中国西柚', '63.73', '78.81', '中国大陆', '11166', '2', '100', '0', '新鲜红心西柚 葡萄柚 8个包邮进口水果', '180', '2018-05-08 16:48', '0', '西柚', '41.05', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11167', '中国西柚', '56.05', '59.01', '中国大陆', '11167', '4', '100', '0', '乡村铺子以色列西柚6个葡萄柚红心柚子新鲜水果进口时令当季 南非', '180', '2018-05-08 16:48', '0', '西柚', '48.36', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11168', '中国西柚', '52.89', '56.25', '中国大陆', '11168', '4', '100', '0', '源润鲜现货以色列西柚葡萄柚 6个 红心柚进口西柚新鲜水果', '180', '2018-05-08 16:48', '0', '西柚', '42.09', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11169', '中国西柚', '70.60', '76.19', '中国大陆', '11169', '5', '100', '0', '优霸 美国佛罗里达西柚8个葡萄柚红心进口当季新鲜水果南非以色列', '180', '2018-05-08 16:48', '0', '西柚', '62.65', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11170', '中国西柚', '63.50', '65.74', '中国大陆', '11170', '5', '100', '0', '以色列红心西柚 葡萄柚 新鲜水果8个', '180', '2018-05-08 16:48', '0', '西柚', '46.19', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11171', '中国西柚', '60.85', '70.35', '中国大陆', '11171', '5', '100', '0', '展卉 南非西柚6个新鲜皮薄多汁红心红肉柚子进口水果葡萄柚孕妇', '180', '2018-05-08 16:48', '0', '西柚', '52.01', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11172', '中国西柚', '51.09', '54.15', '中国大陆', '11172', '5', '100', '0', '葡萄柚以色列红心西柚包邮 新鲜水果 8个装150', '180', '2018-05-08 16:48', '0', '西柚', '47.23', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11173', '中国西柚', '69.52', '78.30', '中国大陆', '11173', '4', '100', '0', '以色列红心西柚葡萄柚6个新鲜进口水果包邮红肉柚子', '180', '2018-05-08 16:48', '0', '西柚', '61.16', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11174', '中国西柚', '57.32', '69.87', '中国大陆', '11174', '5', '100', '0', '炫果多 以色列西柚8个 新季红心葡萄柚进口新鲜南非柚子 坏果包赔', '180', '2018-05-08 16:48', '0', '西柚', '51.88', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11175', '中国西柚', '64.29', '77.13', '中国大陆', '11175', '5', '100', '0', '【果美妙】南非西柚6个大果装新鲜水果包邮进口葡萄柚新鲜西柚', '180', '2018-05-08 16:48', '0', '西柚', '51.81', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11176', '中国西柚', '79.07', '79.87', '中国大陆', '11176', '5', '100', '0', '歌慕 台湾红宝石西柚葡萄柚新鲜水果包邮 4个装', '180', '2018-05-08 16:48', '0', '西柚', '67.82', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11177', '中国西柚', '67.28', '69.73', '中国大陆', '11177', '5', '100', '0', '南非西柚8个进口葡萄柚红心柚子时令新鲜水果包邮批发非以色列', '180', '2018-05-08 16:49', '0', '西柚', '52.09', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11178', '中国西柚', '70.32', '73.14', '中国大陆', '11178', '5', '100', '0', '南非红心西柚新鲜包邮共发8个 葡萄柚孕妇水果进口柚子', '180', '2018-05-08 16:49', '0', '西柚', '56.16', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11179', '中国西柚', '67.99', '74.63', '中国大陆', '11179', '5', '100', '0', '微笑果园南非西柚6个单果220', '180', '2018-05-08 16:49', '0', '西柚', '62.95', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11180', '中国西柚', '63.13', '68.17', '中国大陆', '11180', '5', '100', '0', '果嫣南非西柚 红心西柚新鲜水果6个装 红果肉葡萄柚孕妇水果包邮', '180', '2018-05-08 16:49', '0', '西柚', '59.30', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11181', '中国西柚', '42.36', '78.89', '中国大陆', '11181', '5', '100', '0', '【Happygo】南非新鲜红宝石西柚6个 孕妇水果红西柚葡萄柚包邮', '180', '2018-05-08 16:49', '0', '西柚', '42.16', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11182', '中国西柚', '70.69', '75.45', '中国大陆', '11182', '5', '100', '0', '南非进口西柚 新鲜水果红心果肉葡萄柚批发包邮5个装单果250', '180', '2018-05-08 16:49', '0', '西柚', '40.96', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11183', '中国西柚', '41.90', '42.90', '中国大陆', '11183', '4', '100', '0', '洋果坊 南非西柚8只 柚子新鲜进口水果新季红心葡萄柚以色列西柚', '180', '2018-05-08 16:49', '0', '西柚', '41.58', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11184', '中国西柚', '47.60', '51.48', '中国大陆', '11184', '5', '100', '0', '以色列红心西柚葡萄柚8个进口红肉西柚新鲜水果包邮非南非西柚', '180', '2018-05-08 16:49', '0', '西柚', '47.19', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11185', '中国西柚', '44.93', '57.82', '中国大陆', '11185', '5', '100', '0', '【第二份1元】avomone 以色列红心西柚4个 葡萄柚进口新鲜水果', '180', '2018-05-08 16:49', '0', '西柚', '43.54', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11186', '中国西柚', '63.29', '65.26', '中国大陆', '11186', '5', '100', '0', '以色列西柚红心西柚葡萄柚进口红肉西柚新鲜水果包邮红柚柚子', '180', '2018-05-08 16:49', '0', '西柚', '60.32', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11187', '中国西柚', '48.43', '60.10', '中国大陆', '11187', '5', '100', '0', '树果悦浓 南非进口西柚4个装水果包邮新鲜红心肉葡萄柚 坏果包赔', '180', '2018-05-08 16:49', '0', '西柚', '47.84', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11188', '中国西柚', '70.56', '79.91', '中国大陆', '11188', '5', '100', '0', '收藏送2个 进口西柚4个 葡萄柚红心柚新鲜水果花果山包邮孕妇叶酸', '180', '2018-05-08 16:49', '0', '西柚', '41.73', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11189', '中国西柚', '44.39', '46.67', '中国大陆', '11189', '5', '100', '0', '南非进口西柚 新鲜红心柚子葡萄柚子蜜柚水果 300G*6粒包邮', '180', '2018-05-08 16:49', '0', '西柚', '43.66', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11190', '中国西柚', '69.86', '70.94', '中国大陆', '11190', '5', '100', '0', '以色列进口西柚葡萄柚8个新鲜水果包邮批发非台湾南非红心肉柚子', '180', '2018-05-08 16:49', '0', '西柚', '52.54', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11191', '中国西柚', '77.63', '78.58', '中国大陆', '11191', '5', '100', '0', '南非西柚6个进口葡萄柚红心柚子时令新鲜水果包邮批发非以色列', '180', '2018-05-08 16:49', '0', '西柚', '45.28', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11192', '中国西柚', '63.94', '76.42', '中国大陆', '11192', '4', '100', '0', '【老一生鲜】新鲜水果新鲜 西柚 葡萄柚 2只装/单果重约330g', '180', '2018-05-08 16:49', '0', '西柚', '60.31', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11193', '中国西柚', '70.75', '78.62', '中国大陆', '11193', '5', '100', '0', '以色列西柚 6个巨无霸单果350g+葡萄柚红心柚子进口新鲜水果南非', '180', '2018-05-08 16:49', '0', '西柚', '46.84', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11194', '中国西柚', '54.07', '55.88', '中国大陆', '11194', '5', '100', '0', 'yqyq南非红心西柚4个进口红西柚葡萄柚新鲜孕妈水果包邮南非西柚', '180', '2018-05-08 16:49', '0', '西柚', '49.42', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11195', '中国西柚', '64.77', '73.74', '中国大陆', '11195', '5', '100', '0', '南非以色列西柚葡萄柚6个红心进口当季新鲜水果柚子', '180', '2018-05-08 16:49', '0', '西柚', '52.94', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11196', '中国西柚', '78.40', '78.61', '中国大陆', '11196', '5', '100', '0', '以色列西柚葡萄柚6个红心进口当季新鲜水果柚子非南非', '180', '2018-05-08 16:49', '0', '西柚', '58.47', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11197', '茂名市荔枝', '55.90', '64.62', '广东省茂名市', '11197', '5', '100', '0', '新鲜荔枝妃子笑海南荔枝水果批发5斤包邮高州白糖罂桂味糯米糍', '180', '2018-05-08 16:49', '0', '荔枝', '44.31', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11198', '海口市荔枝', '76.23', '77.62', '海南省海口市', '11198', '5', '100', '0', '海南妃子笑荔枝新鲜水果5斤包邮当季现摘三亚白糖罂三月红非桂味', '180', '2018-05-08 16:49', '0', '荔枝', '49.26', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11199', '三亚市荔枝', '62.31', '71.05', '海南省三亚市', '11199', '5', '100', '0', '海南妃子笑荔枝新鲜水果5斤顺丰包邮当季桂味白糖罂现摘现发高州', '180', '2018-05-08 16:49', '0', '荔枝', '51.97', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11200', '茂名市荔枝', '52.53', '61.70', '广东省茂名市', '11200', '5', '100', '0', '现货荔枝新鲜当季水果妃子笑三月红白糖罂黑叶现摘现发5斤顺丰', '180', '2018-05-08 16:49', '0', '荔枝', '45.11', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11201', '海口市荔枝', '78.29', '78.92', '海南省海口市', '11201', '5', '100', '0', '预售新鲜荔枝三月红妃子笑非糯米糍当季孕妇时令水果现摘现发5斤', '180', '2018-05-08 16:49', '0', '荔枝', '50.53', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11202', '三亚市荔枝', '50.06', '76.74', '海南省三亚市', '11202', '5', '100', '0', '现货荔枝新鲜妃子笑海南5斤水果 小核味甜带酸个大肉厚顺丰空运', '180', '2018-05-08 16:50', '0', '荔枝', '50.03', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11203', '海口市荔枝', '59.57', '59.73', '海南省海口市', '11203', '4', '100', '0', '海南三亚 三亚荔枝 新鲜水果新鲜荔枝热带水果妃子笑荔枝 5斤顺丰', '180', '2018-05-08 16:50', '0', '荔枝', '55.16', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11204', '中国荔枝', '42.95', '60.69', '中国大陆', '11204', '5', '100', '0', '海南妃子笑荔枝1.5kg 空运直发 荔枝 新鲜水果 5月9日陆续发货', '180', '2018-05-08 16:50', '0', '荔枝', '40.59', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11205', '茂名市荔枝', '65.49', '78.40', '广东省茂名市', '11205', '2', '100', '0', '荔枝新鲜 妃子笑广东高州白糖罂桂味南山糯米糍5斤送1斤 包邮水果', '180', '2018-05-08 16:50', '0', '荔枝', '41.53', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11206', '三亚市荔枝', '69.61', '76.65', '海南省三亚市', '11206', '5', '100', '0', '海南荔枝新鲜水果批发包邮新鲜荔枝妃子笑当季热带3斤顺丰包邮', '180', '2018-05-08 16:50', '0', '荔枝', '60.36', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11207', '中国荔枝', '48.05', '73.51', '中国大陆', '11207', '5', '100', '0', '海南妃子笑荔枝2.5kg 新鲜水果5月16日开始陆续发货', '180', '2018-05-08 16:50', '0', '荔枝', '42.17', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11208', '茂名市荔枝', '71.46', '76.25', '广东省茂名市', '11208', '5', '100', '0', '预售 新鲜荔枝高州白糖罂新鲜水果妃子笑桂味荔枝 5斤顺丰包邮', '180', '2018-05-08 16:50', '0', '荔枝', '62.93', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11209', '海口市荔枝', '70.54', '79.27', '海南省海口市', '11209', '5', '100', '0', '海南妃子笑荔枝新鲜5斤顺丰空运包邮现摘现发糯米糯孕妇水果批发', '180', '2018-05-08 16:50', '0', '荔枝', '57.31', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11210', '海口市荔枝', '62.78', '70.79', '海南省海口市', '11210', '5', '100', '0', '【现货】海南新鲜荔枝妃子笑当季水果批发整箱白糖罂桂味荔枝包邮', '180', '2018-05-08 16:50', '0', '荔枝', '44.07', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11211', '茂名市荔枝', '71.95', '75.67', '广东省茂名市', '11211', '5', '100', '0', '送1斤 现摘现发高州新鲜荔枝妃子笑桂味糯米滋胜海南增城顺丰包邮', '180', '2018-05-08 16:50', '0', '荔枝', '43.25', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11212', '三亚市荔枝', '73.76', '74.76', '海南省三亚市', '11212', '5', '100', '0', 'GREENHOW 顺丰包邮新鲜水果海南三亚妃子笑荔枝现摘现发5斤大果', '180', '2018-05-08 16:50', '0', '荔枝', '62.00', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11213', '南宁市荔枝', '48.32', '61.29', '广西壮族自治区南宁市', '11213', '3', '100', '0', '新鲜妃子笑5斤顺丰包邮5月底发货时令水果乌叶妃子笑荔枝非桂味', '180', '2018-05-08 16:50', '0', '荔枝', '42.33', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11214', '海口市荔枝', '76.50', '77.56', '海南省海口市', '11214', '5', '100', '0', '海南大荔枝新鲜水果5斤妃子笑白糖罂荔枝王热带时令现摘顺丰包邮', '180', '2018-05-08 16:50', '0', '荔枝', '48.09', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11215', '三亚市荔枝', '53.16', '60.34', '海南省三亚市', '11215', '5', '100', '0', '荔枝新鲜海南当季水果整箱批发妃子笑5斤现摘正式发货顺丰包邮', '180', '2018-05-08 16:50', '0', '荔枝', '40.17', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11216', '茂名市荔枝', '57.35', '75.18', '广东省茂名市', '11216', '5', '100', '0', '野茗鲜2018新鲜荔枝广东高州现摘妃子笑白糖罂水果批发包邮5斤装', '180', '2018-05-08 16:50', '0', '荔枝', '46.99', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11217', '三亚市荔枝', '64.70', '74.79', '海南省三亚市', '11217', '5', '100', '0', '海南三亚荔枝5斤 妃子笑新鲜水果应季时令非白糖罂桂味黑叶无核', '180', '2018-05-08 16:50', '0', '荔枝', '46.93', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11218', '茂名市荔枝', '44.11', '74.24', '广东省茂名市', '11218', '5', '100', '0', '茂名高州白糖罂荔枝5斤顺丰冷链 新鲜荔枝水果不是非妃子笑桂味', '180', '2018-05-08 16:50', '0', '荔枝', '41.44', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11219', '海口市荔枝', '41.63', '49.84', '海南省海口市', '11219', '4', '100', '0', '【爆甜多汁】海南荔枝白糖罂当季新鲜水果果园直发黑叶妃子笑荔枝', '180', '2018-05-08 16:50', '0', '荔枝', '40.96', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11220', '海口市荔枝', '79.76', '79.91', '海南省海口市', '11220', '5', '100', '0', '海南妃子笑新鲜荔枝5斤水果顺丰空运包邮现货小核非南山桂味黑叶', '180', '2018-05-08 16:50', '0', '荔枝', '43.33', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11221', '茂名市荔枝', '63.10', '78.10', '广东省茂名市', '11221', '5', '100', '0', '新鲜荔枝白糖罂高州新鲜水果荔枝批发收藏下单共发5斤包邮空运', '180', '2018-05-08 16:50', '0', '荔枝', '50.04', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11222', '茂名市荔枝', '47.58', '55.53', '广东省茂名市', '11222', '5', '100', '0', '预售 高州白糖罂荔枝新鲜水果 现摘现发买4送1斤顺丰冷链包邮', '180', '2018-05-08 16:50', '0', '荔枝', '46.72', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11223', '茂名市荔枝', '69.82', '70.37', '广东省茂名市', '11223', '5', '100', '0', '妃子笑荔枝3斤海南当季新鲜水果顺丰空运包邮 非广东茂名孕妇营养', '180', '2018-05-08 16:50', '0', '荔枝', '50.89', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11224', '海口市荔枝', '42.54', '59.54', '海南省海口市', '11224', '5', '100', '0', '荔枝王海南大个荔枝王有机肥火山熔岩新鲜海口永兴荔枝王6月成熟', '180', '2018-05-08 16:50', '0', '荔枝', '42.30', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11225', '海口市荔枝', '64.22', '65.46', '海南省海口市', '11225', '5', '100', '0', '荔枝新鲜包邮当季海南妃子笑荔枝 2.5斤非白糖罂糯米糍荔枝 顺丰', '180', '2018-05-08 16:50', '0', '荔枝', '42.26', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11226', '海口市荔枝', '64.03', '74.19', '海南省海口市', '11226', '5', '100', '0', '荔枝新鲜5斤包邮 妃子笑荔枝海南新鲜水果当季非乌叶黑叶批发现摘', '180', '2018-05-08 16:50', '0', '荔枝', '45.41', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11227', '茂名市荔枝', '40.60', '75.33', '广东省茂名市', '11227', '5', '100', '0', '桂味荔枝新鲜广东高州水果5斤送1斤味道清甜核小肉厚顺丰空运', '180', '2018-05-08 16:51', '0', '荔枝', '40.01', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11228', '海口市荔枝', '57.43', '60.44', '海南省海口市', '11228', '5', '100', '0', '妃子笑荔枝海南有机肥种植生态果园荔枝海口火山岩地质荔枝园水果', '180', '2018-05-08 16:51', '0', '荔枝', '51.34', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11229', '琼海市荔枝', '45.30', '69.04', '海南省琼海市', '11229', '5', '100', '0', '粤品 新鲜高州白糖罂荔枝5斤装 农家果园现摘 非妃子笑桂味糯米糍', '180', '2018-05-08 16:51', '0', '荔枝', '41.60', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11230', '茂名市荔枝', '68.72', '76.95', '广东省茂名市', '11230', '5', '100', '0', '【预售】5斤装新鲜荔枝水果红荔枝广东白糖罂生鲜空运非妃子笑', '180', '2018-05-08 16:51', '0', '荔枝', '47.56', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11231', '海口市荔枝', '78.82', '79.33', '海南省海口市', '11231', '5', '100', '0', '【现摘现发】海南妃子笑糯米糍桂味荔枝新鲜当季孕妇水果顺丰5斤', '180', '2018-05-08 16:51', '0', '荔枝', '73.63', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11232', '海口市荔枝', '73.63', '79.94', '海南省海口市', '11232', '5', '100', '0', '现摘新鲜妃子笑荔枝5斤 海南三亚荔枝水果特产批发现发 顺丰包邮', '180', '2018-05-08 16:51', '0', '荔枝', '45.56', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11233', '海口市荔枝', '45.33', '75.28', '海南省海口市', '11233', '5', '100', '0', '荔枝新鲜包邮妃子笑荔枝水果批发包邮新鲜荔枝现货5斤海南妃子笑', '180', '2018-05-08 16:51', '0', '荔枝', '44.65', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11234', '深圳市荔枝', '45.61', '61.29', '广东省深圳市', '11234', '5', '100', '0', '糯米糍荔枝新鲜广东深圳南山水果5斤送1斤 个大核小味道清甜顺丰', '180', '2018-05-08 16:51', '0', '荔枝', '40.42', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11235', '三亚市荔枝', '64.37', '77.88', '海南省三亚市', '11235', '5', '100', '0', '五斤妃子笑荔枝海南三亚新鲜水果顺丰空运多省包邮非荔枝王', '180', '2018-05-08 16:51', '0', '荔枝', '56.83', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11236', '茂名市荔枝', '50.06', '72.81', '广东省茂名市', '11236', '5', '100', '0', '新鲜水果荔枝高州妃子笑白糖罂荔枝果园现摘当季水果5斤空运包邮', '180', '2018-05-08 16:51', '0', '荔枝', '45.02', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11237', '增城市荔枝', '47.25', '77.44', '广东省增城市', '11237', '5', '100', '0', '新鲜荔枝孕妇水果当季鲜甜大果正宗纯天然增城妃子笑2斤顺丰包邮', '180', '2018-05-08 16:51', '0', '荔枝', '45.51', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11238', '茂名市荔枝', '77.01', '79.32', '广东省茂名市', '11238', '5', '100', '0', '荔枝新鲜白糖罂广东高州水果5斤送1斤 同步成熟有海南妃子笑顺丰', '180', '2018-05-08 16:51', '0', '荔枝', '46.39', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11239', '茂名市荔枝', '59.85', '73.48', '广东省茂名市', '11239', '5', '100', '0', '广东茂名荔枝新鲜妃子笑当季热带水果桂味糯米糍顺丰现摘现发5斤', '180', '2018-05-08 16:51', '0', '荔枝', '40.37', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11240', '陵水黎族自治县荔枝', '43.94', '79.94', '海南省陵水黎族自治县', '11240', '5', '100', '0', '妃子笑荔枝3斤海南妃子笑荔枝新鲜时令水果非桂味白糖罂糯米糍', '180', '2018-05-08 16:51', '0', '荔枝', '41.80', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11241', '海口市荔枝', '63.72', '74.03', '海南省海口市', '11241', '5', '100', '0', '新鲜荔枝时令鲜荔枝3斤海南妃子笑新鲜荔枝非白糖罂桂味顺丰包邮', '180', '2018-05-08 16:51', '0', '荔枝', '40.88', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11242', '三亚市荔枝', '64.85', '68.98', '海南省三亚市', '11242', '5', '100', '0', '荔枝新鲜水果批发当季整箱妃子笑白糖罂孕妇应季时令非红毛丹5斤', '180', '2018-05-08 16:51', '0', '荔枝', '56.26', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11243', '中国荔枝', '67.04', '79.33', '中国大陆', '11243', '5', '100', '0', '顺丰空运现摘妃子笑荔枝广东桂味高州茂名糯米糍海南新鲜孕妇水果', '180', '2018-05-08 16:51', '0', '荔枝', '52.29', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11244', '海口市荔枝', '63.54', '67.43', '海南省海口市', '11244', '5', '100', '0', '海口火山荔枝 妃子笑荔枝海南新鲜水果空运包邮现摘发非黑叶无核', '180', '2018-05-08 16:51', '0', '荔枝', '46.40', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11245', '海口市荔枝', '58.59', '71.33', '海南省海口市', '11245', '4', '100', '0', '新鲜荔枝5斤现摘当季水果包邮海南妃子笑非高州白糖罂桂味糯米糍', '180', '2018-05-08 16:51', '0', '荔枝', '49.64', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11246', '玉林市荔枝', '76.85', '78.24', '广西壮族自治区玉林市', '11246', '5', '100', '0', '荔枝新鲜当季水果妃子笑 白糖罂 白蜡 桂味黑叶糯米糍现摘5斤包邮', '180', '2018-05-08 16:51', '0', '荔枝', '71.41', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11247', '海口市荔枝', '46.44', '74.21', '海南省海口市', '11247', '5', '100', '0', '海南妃子笑荔枝3斤装果园现摘直发 非桂味白糖罂黑叶荔枝', '180', '2018-05-08 16:51', '0', '荔枝', '44.94', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11248', '海口市荔枝', '56.11', '75.88', '海南省海口市', '11248', '5', '100', '0', '海南永兴荔枝王火山岩新鲜水果现摘现发非妃子笑白糖罂荔枝包邮', '180', '2018-05-08 16:51', '0', '荔枝', '42.98', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11249', '文昌市荔枝', '71.51', '72.76', '海南省文昌市', '11249', '1', '100', '0', '【热带国度】海南妃子笑荔枝现摘现发新鲜荔枝送2斤发5斤多省包邮', '180', '2018-05-08 16:51', '0', '荔枝', '51.47', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11250', '海口市荔枝', '55.07', '67.60', '海南省海口市', '11250', '5', '100', '0', '无核荔枝海南澄迈鸳鸯红无籽荔枝海口火山岩陆桥鲜荔枝5斤6月成熟', '180', '2018-05-08 16:51', '0', '荔枝', '41.79', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11251', '茂名市荔枝', '42.23', '48.68', '广东省茂名市', '11251', '5', '100', '0', '鲜荔枝新鲜当季广东茂名妃子笑白糖罂黑叶水果顺丰现摘现发5斤装', '180', '2018-05-08 16:52', '0', '荔枝', '41.08', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11252', '茂名市荔枝', '66.70', '77.86', '广东省茂名市', '11252', '5', '100', '0', '广东高州新鲜荔枝水果   5斤顺丰空运包邮 白糖罂 妃子笑 桂味', '180', '2018-05-08 16:52', '0', '荔枝', '46.11', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11253', '三亚市荔枝', '50.73', '67.74', '海南省三亚市', '11253', '4', '100', '0', '现摘现发 海南妃子笑荔枝 新鲜水果顺丰空运包邮桂味白糖罂糯米糍', '180', '2018-05-08 16:52', '0', '荔枝', '48.15', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11254', '三亚市荔枝', '44.60', '78.66', '海南省三亚市', '11254', '5', '100', '0', '荔枝水果批发包邮新鲜当季整箱妃子笑应季时令非红毛丹5斤', '180', '2018-05-08 16:52', '0', '荔枝', '41.96', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11255', '海口市荔枝', '57.02', '77.46', '海南省海口市', '11255', '5', '100', '0', '荔枝妃子笑 新鲜现摘小核荔枝5斤顺丰包邮5月10号发货非白糖罂', '180', '2018-05-08 16:52', '0', '荔枝', '42.65', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11256', '三亚市荔枝', '52.15', '61.33', '海南省三亚市', '11256', '5', '100', '0', '海南妃子笑荔枝5斤 新鲜应季水果顺丰空运包邮非桂味白糖罂糯米糍', '180', '2018-05-08 16:52', '0', '荔枝', '49.65', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11257', '三亚市石榴', '45.69', '71.31', '海南省三亚市', '11257', '3', '100', '0', '海南三亚 新鲜水果  芭乐 番石榴 5斤1份', '180', '2018-05-08 16:52', '0', '石榴', '43.40', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11258', '中国石榴', '63.70', '69.94', '中国大陆', '11258', '5', '100', '0', '四川会理石榴2个200g以上/个', '180', '2018-05-08 16:52', '0', '石榴', '55.89', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11259', '三亚市石榴', '43.82', '74.83', '海南省三亚市', '11259', '5', '100', '0', '海南部落 三亚新鲜水果 珍珠番石榴芭乐 10斤装 三亚发货空运包邮', '180', '2018-05-08 16:52', '0', '石榴', '42.05', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11260', '茂名市石榴', '48.33', '67.98', '广东省茂名市', '11260', '5', '100', '0', '广东番石榴新鲜芭乐果 高州特产果园现摘5斤孕妇水果特价包邮', '180', '2018-05-08 16:52', '0', '石榴', '44.04', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11261', '三亚市石榴', '69.17', '76.77', '海南省三亚市', '11261', '3', '100', '0', '海南三亚 新鲜水果 芭乐 番石榴 5斤1份', '180', '2018-05-08 16:52', '0', '石榴', '55.18', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11262', '三亚市石榴', '53.60', '75.57', '海南省三亚市', '11262', '5', '100', '0', '【南国屋】海南三亚新鲜水果番石榴芭乐珍珠石榴5斤 清脆清甜包邮', '180', '2018-05-08 16:52', '0', '石榴', '49.23', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11263', '海口市石榴', '63.65', '70.54', '海南省海口市', '11263', '5', '100', '0', '海南三亚水果 石榴 番石榴 芭乐 脆口甜度适中 5斤装 空运', '180', '2018-05-08 16:52', '0', '石榴', '44.33', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11264', '南宁市石榴', '79.81', '79.88', '广西壮族自治区南宁市', '11264', '5', '100', '0', '海南新鲜水果包邮石榴红心番石榴5斤珍珠红心芭乐果新鲜石榴', '180', '2018-05-08 16:52', '0', '石榴', '45.35', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11265', '西安市石榴', '67.62', '72.51', '陕西省西安市', '11265', '5', '100', '0', '尚可鲜临潼石榴新鲜甜水晶水果陕西特产非云南蒙自软籽包邮', '180', '2018-05-08 16:52', '0', '石榴', '59.03', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11266', '三亚市石榴', '57.23', '62.08', '海南省三亚市', '11266', '5', '100', '0', '三亚新款散装潘石榴芭乐3斤装空运海南石榴新鲜采摘海南水果', '180', '2018-05-08 16:52', '0', '石榴', '42.34', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11267', '茂名市石榴', '69.55', '71.85', '广东省茂名市', '11267', '5', '100', '0', '广东红心番石榴新鲜芭乐果 高州特产果园现摘软糯5斤孕妇水果包邮', '180', '2018-05-08 16:52', '0', '石榴', '65.48', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11268', '南宁市石榴', '71.83', '72.53', '广西壮族自治区南宁市', '11268', '5', '100', '0', '广西百香果热带水果新鲜鸡蛋果西番莲香甜酸爽3斤包邮', '180', '2018-05-08 16:52', '0', '石榴', '44.25', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11269', '中国石榴', '68.55', '70.31', '中国大陆', '11269', '5', '100', '0', '云南蒙自石榴2个225g以上/个', '180', '2018-05-08 16:52', '0', '石榴', '59.51', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11270', '西安市石榴', '64.07', '70.66', '陕西省西安市', '11270', '5', '100', '0', '正宗陕西红心石榴水果新鲜包邮10斤', '180', '2018-05-08 16:52', '0', '石榴', '62.02', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11271', '中国石榴', '74.47', '76.81', '中国大陆', '11271', '5', '100', '0', '爱尚果 广西红心芭乐番石榴新鲜水果特产装包邮当季巴乐胭脂脆甜', '180', '2018-05-08 16:52', '0', '石榴', '61.01', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11272', '中国石榴', '41.37', '65.23', '中国大陆', '11272', '5', '100', '0', '现货突尼斯软籽石榴2个超大果软子甜酸石榴新鲜水果非蒙自石榴', '180', '2018-05-08 16:52', '0', '石榴', '40.57', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11273', '三亚市石榴', '58.16', '73.15', '海南省三亚市', '11273', '5', '100', '0', '套海南白心番石榴新鲜白芯芭乐果农家现摘热带水果健康水果5斤', '180', '2018-05-08 16:52', '0', '石榴', '42.96', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11274', '玉林市石榴', '44.34', '56.70', '广西壮族自治区玉林市', '11274', '5', '100', '0', '坏果包赔广西百香果新鲜采摘包邮3斤大红果西番莲水果酸爽香甜', '180', '2018-05-08 16:52', '0', '石榴', '41.24', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11275', '三亚市石榴', '79.08', '79.71', '海南省三亚市', '11275', '5', '100', '0', '海南部落 三亚新鲜水果 珍珠番石榴芭乐 5斤装 三亚特产空运包邮', '180', '2018-05-08 16:53', '0', '石榴', '60.34', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11317', '攀枝花市枇杷', '71.40', '77.63', '四川省攀枝花市', '11317', '5', '100', '0', '龙泉大五星枇杷30个新鲜琵琶当应季孕妇水果四川攀枝花米易', '180', '2018-05-08 16:53', '0', '枇杷', '50.78', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11318', '眉山市枇杷', '79.34', '80.00', '四川省眉山市', '11318', '5', '100', '0', '四川枇杷果新鲜水果包邮应季琵琶果精品文宫大果当季孕妇比米易甜', '180', '2018-05-08 16:53', '0', '枇杷', '49.91', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11319', '成都市枇杷', '53.79', '61.66', '四川省成都市', '11319', '5', '100', '0', '四川攀枝花当季新鲜水果米易大五星土枇杷甜琵琶果包邮非蒙自云霄', '180', '2018-05-08 16:53', '0', '枇杷', '53.20', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11320', '攀枝花市枇杷', '49.22', '70.97', '四川省攀枝花市', '11320', '5', '100', '0', '26度果园 枇杷果新鲜水果包邮现货攀枝花米易非蒙自云霄琵琶果', '180', '2018-05-08 16:53', '0', '枇杷', '47.86', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11321', '攀枝花市枇杷', '58.78', '71.14', '四川省攀枝花市', '11321', '5', '100', '0', '现摘5斤大果 攀枝花米易枇杷果 新鲜水果包邮早春甜琵琶礼盒装', '180', '2018-05-08 16:53', '0', '枇杷', '56.24', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11322', '杭州市枇杷', '45.12', '59.01', '浙江省杭州市', '11322', '5', '100', '0', '顺丰空运 新鲜塘栖枇杷白沙枇杷水果4斤礼盒比四川莆田东山白玉甜', '180', '2018-05-08 16:53', '0', '枇杷', '41.00', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11323', '攀枝花市枇杷', '66.94', '69.06', '四川省攀枝花市', '11323', '5', '100', '0', '余小菜米易龙泉琵琶枇杷应季时令孕妇新鲜水果包邮5斤秒杀枇杷', '180', '2018-05-08 16:53', '0', '枇杷', '42.89', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11324', '宁波市枇杷', '46.27', '68.97', '浙江省宁波市', '11324', '5', '100', '0', '超甜宁海白枇杷果新鲜水果PK苏州东山白沙白玉枇杷琵琶果5斤顺丰', '180', '2018-05-08 16:53', '0', '枇杷', '43.56', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11325', '苏州市枇杷', '65.84', '79.93', '江苏省苏州市', '11325', '5', '100', '0', '新鲜时令水果 苏州东山白玉枇杷5斤装媲美西山青种枇杷', '180', '2018-05-08 16:53', '0', '枇杷', '59.94', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11326', '攀枝花市枇杷', '70.88', '72.91', '四川省攀枝花市', '11326', '5', '100', '0', '精选大五星枇杷新鲜琵琶果应季孕妇水果四川攀枝花米易龙泉云霄', '180', '2018-05-08 16:53', '0', '枇杷', '57.90', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11327', '中国枇杷', '66.71', '67.85', '中国大陆', '11327', '5', '100', '0', '云南蒙自枇杷1盒(约400g/盒)', '180', '2018-05-08 16:53', '0', '枇杷', '63.89', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11328', '红河哈尼族彝族自治州枇杷', '77.18', '77.44', '云南省红河哈尼族彝族自治州', '11328', '5', '100', '0', '云南蒙自枇杷 枇杷果新鲜水果 琵琶果非米易云霄 鲜枇杷果5斤包邮', '180', '2018-05-08 16:53', '0', '枇杷', '53.92', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11329', '苏州市枇杷', '75.72', '78.59', '江苏省苏州市', '11329', '5', '100', '0', '超甜 东山白玉枇杷苏州白沙果现摘新鲜水果pk云南蒙自5斤礼盒顺丰', '180', '2018-05-08 16:53', '0', '枇杷', '53.87', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11330', '攀枝花市枇杷', '72.93', '78.41', '四川省攀枝花市', '11330', '5', '100', '0', '【现摘现发】攀枝花米易甜枇杷新鲜水果琵琶果3斤包邮非蒙自枇杷', '180', '2018-05-08 16:53', '0', '枇杷', '67.67', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11331', '漳州市枇杷', '48.26', '64.53', '福建省漳州市', '11331', '5', '100', '0', '【 2份合并发3斤】果园现摘新鲜水果云霄枇杷果 特产甜琵琶包邮', '180', '2018-05-08 16:53', '0', '枇杷', '43.78', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11332', '昭通市枇杷', '47.32', '57.30', '云南省昭通市', '11332', '5', '100', '0', '现摘现货云南新鲜甜枇杷包邮蒙自大理琵琶果非四川攀枝花云霄米易', '180', '2018-05-08 16:53', '0', '枇杷', '41.41', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11333', '昭通市枇杷', '49.64', '71.55', '云南省昭通市', '11333', '5', '100', '0', '新鲜枇杷 云南昭通大五星枇杷水果非蒙自攀枝花米易枇杷果5斤包邮', '180', '2018-05-08 16:53', '0', '枇杷', '49.63', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11334', '攀枝花市枇杷', '55.46', '60.72', '四川省攀枝花市', '11334', '5', '100', '0', '精选超大五星枇杷5斤新鲜琵琶水果四川攀枝花米易龙泉云霄蒙自', '180', '2018-05-08 16:53', '0', '枇杷', '47.12', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11335', '漳州市枇杷', '56.97', '57.13', '福建省漳州市', '11335', '5', '100', '0', '顺丰包邮枇杷果新鲜水果包邮云霄枇杷非米易枇杷果琵琶果5斤+1斤', '180', '2018-05-08 16:53', '0', '枇杷', '41.26', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11336', '昭通市枇杷', '44.71', '55.84', '云南省昭通市', '11336', '5', '100', '0', '现摘现货云南新鲜甜枇杷5斤包邮蒙自大理琵琶果非四川攀枝花云霄', '180', '2018-05-08 16:53', '0', '枇杷', '41.57', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11337', '攀枝花市枇杷', '60.38', '72.93', '四川省攀枝花市', '11337', '5', '100', '0', '四川米易枇杷新鲜水果甜琵琶应季现摘顺丰孕妇3斤一级大果非蒙自', '180', '2018-05-08 16:53', '0', '枇杷', '57.26', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11338', '乐山市枇杷', '69.67', '71.37', '四川省乐山市', '11338', '5', '100', '0', '【现摘现发】 3斤25', '180', '2018-05-08 16:53', '0', '枇杷', '66.27', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11339', '成都市枇杷', '79.67', '79.70', '四川省成都市', '11339', '5', '100', '0', '四川枇杷果新鲜水果包邮大五星枇杷琵琶果水果非米易枇杷4斤大果', '180', '2018-05-08 16:53', '0', '枇杷', '52.67', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11340', '内江市枇杷', '54.79', '58.56', '四川省内江市', '11340', '5', '100', '0', '四川3斤鲜枇杷果新鲜水果批发包邮当季整箱孕妇非5斤米易云霄琵琶', '180', '2018-05-08 16:53', '0', '枇杷', '52.48', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11341', '成都市枇杷', '73.69', '76.57', '四川省成都市', '11341', '5', '100', '0', '四川枇杷新鲜水果甜琵琶大五星当季现摘包邮孕妇5斤非米易蒙自', '180', '2018-05-08 16:54', '0', '枇杷', '42.52', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11342', '中国枇杷', '57.53', '64.86', '中国大陆', '11342', '5', '100', '0', '四川攀枝花枇杷1盒(约400g/盒) 新鲜水果 新鲜枇杷', '180', '2018-05-08 16:54', '0', '枇杷', '51.97', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11343', '红河哈尼族彝族自治州枇杷', '68.24', '74.13', '云南省红河哈尼族彝族自治州', '11343', '5', '100', '0', '【现货】新鲜枇杷云南蒙自枇杷果高山枇杷水果 3斤', '180', '2018-05-08 16:54', '0', '枇杷', '61.66', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11344', '成都市枇杷', '72.54', '75.42', '四川省成都市', '11344', '5', '100', '0', '现摘3斤大果 四川高山枇杷 枇杷果新鲜水果包邮非攀枝花米易枇杷', '180', '2018-05-08 16:54', '0', '枇杷', '57.81', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11345', '成都市枇杷', '73.09', '78.44', '四川省成都市', '11345', '5', '100', '0', '四川枇杷果新鲜水果包邮5斤批发大五星琵琶果当季整箱胜米易云霄', '180', '2018-05-08 16:54', '0', '枇杷', '58.32', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11346', '攀枝花市枇杷', '77.42', '79.00', '四川省攀枝花市', '11346', '5', '100', '0', '四川汉源枇杷大五星枇杷果时令新鲜水果3斤装中大果包邮', '180', '2018-05-08 16:54', '0', '枇杷', '70.54', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11347', '成都市枇杷', '65.77', '74.26', '四川省成都市', '11347', '5', '100', '0', '四川龙泉枇杷果新鲜水果批发包邮大五星琵琶应季5斤非白玉米易', '180', '2018-05-08 16:54', '0', '枇杷', '61.62', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11348', '苏州市枇杷', '50.49', '59.87', '江苏省苏州市', '11348', '4', '100', '0', '森鲜维超甜苏州东山白玉枇杷白沙枇杷琵琶果现摘新鲜水果5斤礼盒', '180', '2018-05-08 16:54', '0', '枇杷', '46.31', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11349', '红河哈尼族彝族自治州枇杷', '66.27', '69.93', '云南省红河哈尼族彝族自治州', '11349', '5', '100', '0', '现货当季蒙自甜枇杷 枇杷果新鲜水果包邮 琵琶果3斤非5斤米易云霄', '180', '2018-05-08 16:54', '0', '枇杷', '51.67', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11350', '成都市枇杷', '75.94', '79.37', '四川省成都市', '11350', '5', '100', '0', '5斤四川龙泉新鲜大五星枇杷果孕妇水果琵琶果胜米易枇杷批发包邮', '180', '2018-05-08 16:54', '0', '枇杷', '66.04', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11351', '宁波市枇杷', '77.17', '79.19', '浙江省宁波市', '11351', '5', '100', '0', '宁海白新鲜枇杷果 水果白沙白玉枇杷 甜琵琶果农家特产3斤装 包邮', '180', '2018-05-08 16:54', '0', '枇杷', '55.72', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11352', '成都市枇杷', '44.61', '73.72', '四川省成都市', '11352', '5', '100', '0', '四川枇杷果新鲜水果3斤包邮大五星枇杷孕妇水果琵琶果水果非米易', '180', '2018-05-08 16:54', '0', '枇杷', '43.57', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11353', '攀枝花市枇杷', '42.78', '44.38', '四川省攀枝花市', '11353', '5', '100', '0', '精选大五星枇杷5斤四川龙泉新鲜琵琶现摘应季水果攀枝花米易云霄', '180', '2018-05-08 16:54', '0', '枇杷', '41.36', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11354', '苏州市枇杷', '76.49', '79.13', '江苏省苏州市', '11354', '4', '100', '0', '超甜大果苏州东山白玉枇杷果5斤礼盒装琵琶正宗白沙新鲜时令水果', '180', '2018-05-08 16:54', '0', '枇杷', '45.29', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11355', '中国枇杷', '68.96', '72.50', '中国大陆', '11355', '5', '100', '0', '歌慕 泰国进口龙宫果新鲜水果 进口龙贡果非新鲜龙眼 枇杷 车厘子', '180', '2018-05-08 16:54', '0', '枇杷', '67.51', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11356', '苏州市枇杷', '52.79', '60.64', '江苏省苏州市', '11356', '5', '100', '0', '苏州东山白玉枇杷5斤新鲜水果白沙枇杷果琵琶秒杀特大3斤塘栖云霄', '180', '2018-05-08 16:54', '0', '枇杷', '42.85', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11357', '成都市枇杷', '62.62', '74.91', '四川省成都市', '11357', '5', '100', '0', '5月下旬发45枚大果高山枇杷新鲜水果枇杷果包邮非攀枝花米易枇杷', '180', '2018-05-08 16:54', '0', '枇杷', '52.93', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11358', '漳州市枇杷', '67.53', '77.92', '福建省漳州市', '11358', '5', '100', '0', '现货新鲜水果云霄甜枇杷果园现摘福建特产琵琶2斤航空包邮', '180', '2018-05-08 16:54', '0', '枇杷', '60.27', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11359', '苏州市枇杷', '48.38', '49.99', '江苏省苏州市', '11359', '5', '100', '0', '苏州东山白玉白沙枇杷5斤新鲜水果超西山青种 江浙沪包邮', '180', '2018-05-08 16:54', '0', '枇杷', '43.89', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11360', '攀枝花市枇杷', '50.25', '61.58', '四川省攀枝花市', '11360', '5', '100', '0', '5斤包邮 枇杷果新鲜水果攀枝花米易枇杷琵琶果鲜枇杷 大五星枇杷', '180', '2018-05-08 16:54', '0', '枇杷', '43.34', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11361', '宁波市枇杷', '50.47', '59.26', '浙江省宁波市', '11361', '5', '100', '0', '超甜 宁海白枇杷果新鲜水果白沙白玉枇杷孕妇琵琶果5斤礼盒装顺丰', '180', '2018-05-08 16:54', '0', '枇杷', '46.65', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11362', '成都市枇杷', '67.33', '71.15', '四川省成都市', '11362', '5', '100', '0', '四川龙泉新鲜大五星枇杷果孕妇水果胜攀枝花米易枇杷5斤批发包邮', '180', '2018-05-08 16:54', '0', '枇杷', '59.49', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11363', '红河哈尼族彝族自治州枇杷', '45.60', '70.42', '云南省红河哈尼族彝族自治州', '11363', '4', '100', '0', '是顺丰航空包邮现货 枇杷果 云南蒙自甜枇杷 新鲜水果大琵琶5斤装', '180', '2018-05-08 16:54', '0', '枇杷', '40.89', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11364', '内江市枇杷', '73.59', '77.43', '四川省内江市', '11364', '5', '100', '0', '四川枇杷果新鲜水果批发包邮当季整箱孕妇非5斤蒙自云霄米易琵琶', '180', '2018-05-08 16:54', '0', '枇杷', '49.29', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11365', '昭通市枇杷', '75.33', '78.39', '云南省昭通市', '11365', '5', '100', '0', '现摘现发 新鲜枇杷5斤大果现货云南蒙自甜枇杷非四川攀枝花琵琶果', '180', '2018-05-08 16:54', '0', '枇杷', '63.09', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11366', '苏州市枇杷', '59.17', '76.10', '江苏省苏州市', '11366', '5', '100', '0', '两份送一斤苏州东山白玉白沙枇杷果应季新鲜水果白琵琶果鲜批把大', '180', '2018-05-08 16:55', '0', '枇杷', '57.51', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11367', '宜宾市枇杷', '70.93', '71.90', '四川省宜宾市', '11367', '5', '100', '0', '四川屏山大五星枇杷果新鲜水果包邮批发整箱应季琵琶果3斤+1斤', '180', '2018-05-08 16:55', '0', '枇杷', '51.03', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11368', '成都市枇杷', '45.48', '50.19', '四川省成都市', '11368', '5', '100', '0', '檬想四川龙泉新鲜大五星高山枇杷果孕妇水果胜攀枝花米易枇杷包邮', '180', '2018-05-08 16:55', '0', '枇杷', '44.55', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11369', '宜宾市枇杷', '77.42', '77.98', '四川省宜宾市', '11369', '5', '100', '0', '四川五星枇杷果新鲜水果包邮3斤非米易枇杷应季时令孕妇琵琶果', '180', '2018-05-08 16:55', '0', '枇杷', '46.84', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11370', '漳州市枇杷', '76.46', '79.92', '福建省漳州市', '11370', '4', '100', '0', '新鲜水果云霄枇杷果实现摘 福建特产甜枇杷 农产品包邮3斤', '180', '2018-05-08 16:55', '0', '枇杷', '57.88', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11371', '成都市枇杷', '69.05', '78.27', '四川省成都市', '11371', '5', '100', '0', '缤果沃野大五星枇杷3斤大果龙泉米易新鲜应当季孕妇水果琵琶果', '180', '2018-05-08 16:55', '0', '枇杷', '41.85', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11372', '苏州市枇杷', '42.78', '61.82', '江苏省苏州市', '11372', '5', '100', '0', '超甜 东山白玉枇杷苏州白沙果现摘新鲜水果pk云南蒙自5斤礼盒顺丰', '180', '2018-05-08 16:55', '0', '枇杷', '41.00', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11373', '杭州市枇杷', '76.96', '78.91', '浙江省杭州市', '11373', '5', '100', '0', '正宗白沙枇杷塘栖枇杷水果新鲜东山白玉蒙自农家琵琶果4斤装现货', '180', '2018-05-08 16:55', '0', '枇杷', '73.68', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11374', '红河哈尼族彝族自治州枇杷', '75.08', '76.15', '云南省红河哈尼族彝族自治州', '11374', '5', '100', '0', '【送1斤实发4斤】 云南蒙自枇杷果 琵琶果新鲜水果 3斤装', '180', '2018-05-08 16:55', '0', '枇杷', '52.21', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11375', '攀枝花市枇杷', '72.30', '79.92', '四川省攀枝花市', '11375', '5', '100', '0', '【现摘现发】攀枝花米易甜枇杷新鲜琵琶果水果3斤包邮非蒙自枇杷', '180', '2018-05-08 16:55', '0', '枇杷', '41.76', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11376', '攀枝花市枇杷', '48.42', '64.91', '四川省攀枝花市', '11376', '5', '100', '0', '四川攀枝花新鲜米易大五星枇杷果孕妇水果琵琶果胜蒙自枇杷包邮', '180', '2018-05-08 16:55', '0', '枇杷', '40.90', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11377', '中国李子', '49.56', '63.26', '中国大陆', '11377', '5', '100', '0', '智利红布林6个70g以上/个 进口水果 红布林 新鲜 水果 红李子', '180', '2018-05-08 16:55', '0', '李子', '44.22', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11378', '茂名市李子', '42.21', '68.01', '广东省茂名市', '11378', '5', '100', '0', '李子水果青李子酸脆李三月李新鲜非三华李孕妇水果现摘5斤包邮', '180', '2018-05-08 16:55', '0', '李子', '41.20', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11379', '宝鸡市李子', '62.06', '77.94', '陕西省宝鸡市', '11379', '5', '100', '0', '十八垅陕西黑布林黑巨李5斤装 新鲜孕妇水果非三排李子包邮', '180', '2018-05-08 16:55', '0', '李子', '40.97', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11380', '茂名市李子', '62.93', '69.16', '广东省茂名市', '11380', '5', '100', '0', '新鲜信宜钱排酸脆李子三月李孕妇水果青李子红心李三华李5斤装', '180', '2018-05-08 16:55', '0', '李子', '57.69', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11381', '昆明市李子', '48.52', '60.99', '云南省昆明市', '11381', '5', '100', '0', '李子水果新鲜包邮现摘应季脆三华李鸡血李非广西现摘现发2件5斤', '180', '2018-05-08 16:55', '0', '李子', '47.76', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11382', '中国李子', '69.86', '74.82', '中国大陆', '11382', '5', '100', '0', '鲜万家 现货顺丰包邮新鲜水果东北黑布林李子黑布朗李子5斤大果', '180', '2018-05-08 16:55', '0', '李子', '67.49', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11383', '茂名市李子', '66.04', '73.77', '广东省茂名市', '11383', '3', '100', '0', '现摘现发 新鲜红心三华李正宗信宜钱排三月李子3斤 孕妇应季水果', '180', '2018-05-08 16:55', '0', '李子', '47.13', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11384', '西安市李子', '71.21', '78.86', '陕西省西安市', '11384', '5', '100', '0', '【预售】陕西新鲜水果黑布林5斤黑布郎黑布仑脆红李黑李子红布林', '180', '2018-05-08 16:55', '0', '李子', '52.04', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11385', '喀什地区李子', '66.89', '72.89', '新疆维吾尔族自治区喀什地区', '11385', '5', '100', '0', '【果透】包邮 澳洲进口西梅 新鲜脆甜 当季水果', '180', '2018-05-08 16:55', '0', '李子', '40.44', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11386', '龙岩市李子', '66.11', '70.57', '福建省龙岩市', '11386', '5', '100', '0', '李子5斤大果新鲜水果青李子酸脆李三月李新鲜孕妇水果现摘', '180', '2018-05-08 16:55', '0', '李子', '49.52', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11387', '漳州市李子', '45.08', '79.64', '福建省漳州市', '11387', '5', '100', '0', '青李子脆李三月 新鲜时令孕妇水果酸爽非三华李4斤现摘', '180', '2018-05-08 16:55', '0', '李子', '42.84', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11388', '西安市李子', '45.63', '52.61', '陕西省西安市', '11388', '5', '100', '0', '【清景】陕西新鲜水果黑布林5斤黑布郎黑布仑脆红李黑李子红布林', '180', '2018-05-08 16:55', '0', '李子', '40.24', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11389', '肇庆市李子', '60.60', '66.36', '广东省肇庆市', '11389', '3', '100', '0', '五斤包邮 德庆三华李新鲜水果红心李子酸甜爽脆南华李孕妇开胃', '180', '2018-05-08 16:55', '0', '李子', '48.45', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11390', '中国李子', '63.08', '67.89', '中国大陆', '11390', '5', '100', '0', 'GREENHOW 现货顺丰包邮新鲜应季水果东北黑布朗黑布林李子5斤大果', '180', '2018-05-08 16:55', '0', '李子', '41.50', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11391', '中国李子', '62.45', '73.90', '中国大陆', '11391', '5', '100', '0', '智利雪花李6个70g以上/个 新鲜水果 进口水果 李子 进口李子', '180', '2018-05-08 16:55', '0', '李子', '47.42', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11392', '大连市李子', '44.46', '74.93', '辽宁省大连市', '11392', '5', '100', '0', '国产新鲜李子红布林李子酸甜水果李子新鲜水果李子水果3斤包邮', '180', '2018-05-08 16:56', '0', '李子', '40.29', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11393', '中国李子', '42.40', '76.39', '中国大陆', '11393', '5', '100', '0', '智利西梅500g', '180', '2018-05-08 16:56', '0', '李子', '42.26', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11394', '中国李子', '49.31', '53.18', '中国大陆', '11394', '5', '100', '0', '源润鲜智利恐龙蛋进口红布林玫瑰李新鲜孕妇水果2斤全国包顺丰', '180', '2018-05-08 16:56', '0', '李子', '42.19', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11395', '西安市李子', '50.65', '54.95', '陕西省西安市', '11395', '5', '100', '0', '黑布林李子新鲜水果黑李子陕西特产非四川三华李脆李5斤包邮', '180', '2018-05-08 16:56', '0', '李子', '47.14', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11396', '茂名市李子', '49.21', '79.96', '广东省茂名市', '11396', '5', '100', '0', '现货李子水果三月早李子酸脆青李子新鲜孕妇水果3斤装特大果包邮', '180', '2018-05-08 16:56', '0', '李子', '47.55', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11397', '中国李子', '66.34', '71.27', '中国大陆', '11397', '5', '100', '0', '广东三华李500g20g以上/个', '180', '2018-05-08 16:56', '0', '李子', '58.81', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11398', '中国李子', '77.89', '78.03', '中国大陆', '11398', '5', '100', '0', '血丝李恐龙蛋2斤红布林黑布林红肉黄肉李子新鲜孕妇水果顺丰空运', '180', '2018-05-08 16:56', '0', '李子', '68.70', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11399', '茂名市李子', '71.12', '74.79', '广东省茂名市', '11399', '5', '100', '0', '现货李子水果3斤青李子酸脆李 三月早李新鲜孕妇水果非三华李包邮', '180', '2018-05-08 16:56', '0', '李子', '41.36', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11400', '茂名市李子', '58.98', '69.69', '广东省茂名市', '11400', '5', '100', '0', '信宜钱排特产银妃三华李5斤装现摘孕妇新鲜水果大果当季红心李子', '180', '2018-05-08 16:56', '0', '李子', '42.09', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11401', '漳州市李子', '53.14', '57.36', '福建省漳州市', '11401', '5', '100', '0', '【送2斤】青李子新鲜孕妇水果酸脆李三月李非三华李共5斤现货包邮', '180', '2018-05-08 16:56', '0', '李子', '49.86', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11402', '漳州市李子', '64.10', '73.53', '福建省漳州市', '11402', '5', '100', '0', '李子水果脆李子新鲜现摘现发货三月李子孕妇水果青李非三华李包邮', '180', '2018-05-08 16:56', '0', '李子', '56.73', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11403', '大连市李子', '66.13', '72.97', '辽宁省大连市', '11403', '4', '100', '0', 'GREENHOW现货顺丰包邮新鲜水果红心李当季水果红布林李子5斤大果', '180', '2018-05-08 16:56', '0', '李子', '61.13', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11404', '成都市李子', '48.64', '62.01', '四川省成都市', '11404', '5', '100', '0', '5斤 四川李子水果新鲜5斤包邮清脆脱骨脆甜空心土李子非三月李子', '180', '2018-05-08 16:56', '0', '李子', '43.05', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11405', '茂名市李子', '61.02', '76.55', '广东省茂名市', '11405', '4', '100', '0', '现摘现货 新鲜红李子三华李3斤 广东信宜钱排红心李 当季孕妇水果', '180', '2018-05-08 16:56', '0', '李子', '49.67', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11406', '中国李子', '57.85', '61.58', '中国大陆', '11406', '5', '100', '0', '智利雪花李2个70g以上/个', '180', '2018-05-08 16:56', '0', '李子', '50.31', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11407', '玉林市李子', '67.78', '72.79', '广西壮族自治区玉林市', '11407', '5', '100', '0', '现货李子新鲜时令水果青李子酸脆李 三月早熟李米李 三华李', '180', '2018-05-08 16:56', '0', '李子', '65.93', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11408', '茂名市李子', '47.06', '64.37', '广东省茂名市', '11408', '5', '100', '0', '正宗钱排三华李红心李 新鲜水果 银妃李果园直发孕妇水果酸甜5斤', '180', '2018-05-08 16:56', '0', '李子', '40.58', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11409', '渭南市李子', '42.00', '71.56', '陕西省渭南市', '11409', '5', '100', '0', '黑布林李子陕西特产新鲜应季水果非四川三华脱骨脆李5斤包邮', '180', '2018-05-08 16:56', '0', '李子', '41.60', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11410', '中国李子', '45.15', '72.22', '中国大陆', '11410', '5', '100', '0', '智利黑布林2个70g以上/个', '180', '2018-05-08 16:56', '0', '李子', '40.66', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11411', '中国李子', '49.93', '61.10', '中国大陆', '11411', '2', '100', '0', '美国进口红布李 黑布李 李子 3斤发顺丰', '180', '2018-05-08 16:56', '0', '李子', '43.28', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11412', '茂名市李子', '78.35', '79.19', '广东省茂名市', '11412', '5', '100', '0', '大果现摘现发钱排银妃三华李子新鲜水果包邮5斤红心布林脆恐龙蛋', '180', '2018-05-08 16:56', '0', '李子', '42.31', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11413', '漳州市李子', '58.54', '69.09', '福建省漳州市', '11413', '5', '100', '0', '李子水果新鲜福建三月李酸脆青李三月李孕妇水果现摘现发', '180', '2018-05-08 16:56', '0', '李子', '42.11', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11414', '宝鸡市李子', '75.31', '76.76', '陕西省宝鸡市', '11414', '5', '100', '0', '天使芳菲 黑布林李子水果新鲜5斤包邮酸甜脆李非恐龙蛋西梅三华李', '180', '2018-05-08 16:56', '0', '李子', '50.00', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11415', '昭通市李子', '65.86', '74.90', '云南省昭通市', '11415', '5', '100', '0', '现摘新鲜水果云南昭通绥江半边红脱骨甜李子脆李5斤当季批发包邮', '180', '2018-05-08 16:56', '0', '李子', '57.56', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11416', '茂名市李子', '61.34', '61.52', '广东省茂名市', '11416', '5', '100', '0', '正宗银妃三华李水果广东信宜钱排新鲜现摘现发孕妇酸红心李子包邮', '180', '2018-05-08 16:56', '0', '李子', '56.90', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11417', '曲靖市李子', '71.42', '72.52', '云南省曲靖市', '11417', '5', '100', '0', '新鲜酸甜李子水果5斤现摘现发脆李子三月李孕妇水果酸脆青李子', '180', '2018-05-08 16:56', '0', '李子', '42.27', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11418', '茂名市李子', '58.43', '58.62', '广东省茂名市', '11418', '5', '100', '0', '正宗钱排三华李银妃2斤装 甜脆李子新鲜现摘现发红心李顺丰冷链', '180', '2018-05-08 16:57', '0', '李子', '44.79', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11419', '茂名市李子', '67.59', '71.69', '广东省茂名市', '11419', '5', '100', '0', '钱排三华李 芙蓉李子红心李子现摘新鲜孕妇水果3斤非顺丰包邮', '180', '2018-05-08 16:57', '0', '李子', '59.80', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11420', '渭南市李子', '43.96', '65.28', '陕西省渭南市', '11420', '5', '100', '0', '陕西黑布林李子新鲜水果当季现摘孕妇脆甜酸李非红心8斤批发包邮', '180', '2018-05-08 16:57', '0', '李子', '42.32', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11421', '肇庆市李子', '45.54', '66.97', '广东省肇庆市', '11421', '1', '100', '0', '现摘广东李子新鲜三华李水果孕妇开胃红心李红肉南华李酸脆李', '180', '2018-05-08 16:57', '0', '李子', '44.61', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11422', '宝鸡市李子', '54.38', '54.90', '陕西省宝鸡市', '11422', '5', '100', '0', '陕西黑布林李子水果新鲜酸甜黑李子非青脆红心李三华李5斤包邮', '180', '2018-05-08 16:57', '0', '李子', '54.12', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11423', '百色市李子', '41.80', '60.14', '广西壮族自治区百色市', '11423', '5', '100', '0', '钱排三华李 芙蓉李 李子红心李子现摘新鲜孕妇水果5斤非顺丰包邮', '180', '2018-05-08 16:57', '0', '李子', '41.76', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11424', '漳州市李子', '43.23', '79.32', '福建省漳州市', '11424', '5', '100', '0', '福建农家自种水果新鲜李子4斤包邮 四月李酸脆青李子坏果包赔', '180', '2018-05-08 16:57', '0', '李子', '43.15', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11425', '茂名市李子', '53.34', '55.28', '广东省茂名市', '11425', '5', '100', '0', '三华李水果信宜钱排银妃新鲜孕妇现摘现发包邮当季红心 李子3/5斤', '180', '2018-05-08 16:57', '0', '李子', '49.44', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11426', '成都市李子', '72.01', '76.40', '四川省成都市', '11426', '5', '100', '0', '四川青脆李子江安李脱骨李新鲜水果非脆红李现摘发货5斤包邮', '180', '2018-05-08 16:57', '0', '李子', '68.13', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11427', '茂名市李子', '56.00', '77.98', '广东省茂名市', '11427', '5', '100', '0', '新鲜信宜钱排酸脆李子三月李孕妇水果青李子红心李三华李3斤装', '180', '2018-05-08 16:57', '0', '李子', '48.25', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11428', '宝鸡市李子', '68.26', '74.42', '陕西省宝鸡市', '11428', '5', '100', '0', '红布林李子脆酸甜新鲜水果非黑布林青脆红心李三华李西梅5斤包邮', '180', '2018-05-08 16:57', '0', '李子', '56.81', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11429', '中国李子', '71.90', '73.41', '中国大陆', '11429', '5', '100', '0', '新疆西梅1盒(500g以上/盒)', '180', '2018-05-08 16:57', '0', '李子', '58.02', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11430', '中国李子', '79.43', '79.79', '中国大陆', '11430', '5', '100', '0', '智利红布林2个70g以上/个', '180', '2018-05-08 16:57', '0', '李子', '71.13', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11431', '南阳市李子', '78.42', '79.10', '河南省南阳市', '11431', '5', '100', '0', '西农缘红布林非智利雪花李黑李子恐龙蛋酸甜孕妇新鲜水果30颗包邮', '180', '2018-05-08 16:57', '0', '李子', '60.94', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11432', '西安市李子', '68.15', '71.96', '陕西省西安市', '11432', '5', '100', '0', '陕西黑布林 新鲜5斤现摘现发清脆李子孕妇脱骨脆李红布林水果包邮', '180', '2018-05-08 16:57', '0', '李子', '44.40', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11433', '中国李子', '65.37', '71.29', '中国大陆', '11433', '5', '100', '0', '智利西梅250g', '180', '2018-05-08 16:57', '0', '李子', '47.70', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11434', '茂名市李子', '72.64', '78.68', '广东省茂名市', '11434', '5', '100', '0', '正宗钱排三华李 新鲜水果 银妃红心李甜酸现摘孕妇当季水果3斤装', '180', '2018-05-08 16:57', '0', '李子', '53.76', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11435', '茂名市李子', '66.39', '71.08', '广东省茂名市', '11435', '5', '100', '0', '广东信宜钱排正宗银妃三华李大果水果新鲜现摘现发孕妇酸红心李子', '180', '2018-05-08 16:57', '0', '李子', '55.03', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11436', '茂名市李子', '50.27', '74.56', '广东省茂名市', '11436', '5', '100', '0', '现摘现发 新鲜红心三华李信宜钱排三月李子3斤 孕妇应季时令水果', '180', '2018-05-08 16:57', '0', '李子', '49.05', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11437', '中卫市西瓜', '72.47', '74.21', '宁夏回族自治区中卫市', '11437', '1', '100', '0', '正宗宁夏香山硒砂瓜富硒新鲜西瓜xishagua巨型沙瓤超甜原产地直发', '180', '2018-05-08 16:57', '0', '西瓜', '63.11', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11438', '宿州市西瓜', '46.75', '69.17', '安徽省宿州市', '11438', '5', '100', '0', '美味连连 第二件半价现摘西瓜1个4', '180', '2018-05-08 16:57', '0', '西瓜', '42.49', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11439', '三亚市西瓜', '61.22', '62.95', '海南省三亚市', '11439', '1', '100', '0', '海南三亚新鲜黑美人西瓜薄皮红瓤多汁 新鲜水果一个约5', '180', '2018-05-08 16:57', '0', '西瓜', '58.07', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11440', '中国西瓜', '73.74', '79.30', '中国大陆', '11440', '4', '100', '0', '【桃咏】南汇8424西瓜  新鲜水果 西瓜4只 单个6.5斤以上', '180', '2018-05-08 16:57', '0', '西瓜', '51.30', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11441', '中国西瓜', '69.23', '74.20', '中国大陆', '11441', '5', '100', '0', '国产麒麟瓜1个2.4kg以上/个', '180', '2018-05-08 16:58', '0', '西瓜', '53.21', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11442', '中国西瓜', '70.18', '73.26', '中国大陆', '11442', '5', '100', '0', '越南黑美人西瓜新鲜包邮当季水果非麒麟红瓤小西瓜1个装5', '180', '2018-05-08 16:58', '0', '西瓜', '63.50', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11443', '徐州市西瓜', '71.94', '76.99', '江苏省徐州市', '11443', '1', '100', '0', '新鲜西瓜水果现摘1个4', '180', '2018-05-08 16:58', '0', '西瓜', '61.82', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11444', '中国西瓜', '58.12', '59.19', '中国大陆', '11444', '5', '100', '0', '上海南汇8424西瓜黑籽 2个 约14', '180', '2018-05-08 16:58', '0', '西瓜', '45.51', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11445', '三亚市西瓜', '53.83', '77.03', '海南省三亚市', '11445', '3', '100', '0', '海南三亚新鲜黑美人西瓜薄皮红瓤多汁 新鲜水果一个约5', '180', '2018-05-08 16:58', '0', '西瓜', '44.26', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11446', '中国西瓜', '71.58', '73.78', '中国大陆', '11446', '4', '100', '0', '【桃咏】南汇8424西瓜 首批西瓜 新鲜水果 西瓜4只 单个5.5斤以上', '180', '2018-05-08 16:58', '0', '西瓜', '59.08', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11447', '中国西瓜', '73.86', '74.72', '中国大陆', '11447', '4', '100', '0', 'GREENHOW 顺丰包邮新鲜水果北京大兴庞各庄西瓜现摘现发7', '180', '2018-05-08 16:58', '0', '西瓜', '40.47', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11448', '中国西瓜', '77.89', '78.41', '中国大陆', '11448', '5', '100', '0', '海南特小凤西瓜1个900g以上/个 海鲜水果 瓜果 黄心西瓜', '180', '2018-05-08 16:58', '0', '西瓜', '77.86', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11449', '中国西瓜', '43.72', '47.75', '中国大陆', '11449', '5', '100', '0', '广西黑美人西瓜1个2.5kg以上/个 新鲜水果 黑美人瓜 西瓜', '180', '2018-05-08 16:58', '0', '西瓜', '43.51', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11450', '宿州市西瓜', '49.80', '64.16', '安徽省宿州市', '11450', '5', '100', '0', '美味连连 西瓜水果新鲜2', '180', '2018-05-08 16:58', '0', '西瓜', '49.67', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11451', '中国西瓜', '71.66', '76.36', '中国大陆', '11451', '5', '100', '0', '南汇8424西瓜黑籽非嫁接自然授粉不打农药4个装约28斤新鲜水果', '180', '2018-05-08 16:58', '0', '西瓜', '67.57', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11452', '中国西瓜', '68.07', '79.87', '中国大陆', '11452', '5', '100', '0', '海南金兰西瓜1个2kg以上/个', '180', '2018-05-08 16:58', '0', '西瓜', '54.45', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11453', '中国西瓜', '74.90', '78.66', '中国大陆', '11453', '5', '100', '0', '海南精品8424西瓜1个礼盒装4kg以上/个 新鲜水果 西瓜 8424', '180', '2018-05-08 16:58', '0', '西瓜', '57.84', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11454', '中国西瓜', '78.28', '79.00', '中国大陆', '11454', '5', '100', '0', '上海南汇西瓜8424西瓜14斤左右2个装西瓜水果南汇西瓜新鲜水果', '180', '2018-05-08 16:58', '0', '西瓜', '52.12', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11455', '宿州市西瓜', '42.34', '64.15', '安徽省宿州市', '11455', '5', '100', '0', '新鲜西瓜水果现摘1个5', '180', '2018-05-08 16:58', '0', '西瓜', '40.12', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11456', '济南市西瓜', '46.39', '56.91', '山东省济南市', '11456', '5', '100', '0', '尝鲜济南济阳仁风召文富硒西瓜2个新鲜水果黄瓤西瓜脆甜富硒食品', '180', '2018-05-08 16:58', '0', '西瓜', '40.75', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11457', '中国西瓜', '45.03', '70.38', '中国大陆', '11457', '3', '100', '0', '【桃咏】 南汇8424西瓜 新鲜水果 2个装约16斤', '180', '2018-05-08 16:58', '0', '西瓜', '41.23', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11458', '三亚市西瓜', '69.32', '74.73', '海南省三亚市', '11458', '5', '100', '0', '【易果生鲜】海南金兰西瓜1个2kg以上/个', '180', '2018-05-08 16:58', '0', '西瓜', '51.01', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11459', '中国西瓜', '68.08', '69.53', '中国大陆', '11459', '5', '100', '0', '密农人家  沙甜小西瓜 新鲜水果 汁甜味美 2', '180', '2018-05-08 16:58', '0', '西瓜', '58.75', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11460', '昆明市西瓜', '46.30', '75.07', '云南省昆明市', '11460', '4', '100', '0', '新鲜黑美人西瓜 薄皮  时令新鲜水果 一个重约5斤 XF', '180', '2018-05-08 16:58', '0', '西瓜', '43.23', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11461', '中国西瓜', '65.37', '69.61', '中国大陆', '11461', '4', '100', '0', '【桃咏】南汇8424西瓜  新鲜水果 4只装 单个5.5斤以上', '180', '2018-05-08 16:58', '0', '西瓜', '49.25', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11462', '三亚市西瓜', '62.89', '71.97', '海南省三亚市', '11462', '5', '100', '0', '海南麒麟西瓜新鲜西瓜水果新鲜麒麟瓜西瓜1个8', '180', '2018-05-08 16:58', '0', '西瓜', '61.34', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11463', '中国西瓜', '56.83', '69.09', '中国大陆', '11463', '4', '100', '0', '【桃咏】南汇8424西瓜 新鲜水果 西瓜1只 单个5斤以上', '180', '2018-05-08 16:58', '0', '西瓜', '42.53', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11464', '中国西瓜', '52.43', '66.11', '中国大陆', '11464', '5', '100', '0', '麒麟瓜1粒3kg以上', '180', '2018-05-08 16:58', '0', '西瓜', '40.01', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11465', '中国西瓜', '49.80', '79.07', '中国大陆', '11465', '1', '100', '0', '【桃咏】南汇8424西瓜 新鲜水果 2只装 单个5.5斤左右', '180', '2018-05-08 16:58', '0', '西瓜', '46.78', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11466', '中国西瓜', '47.58', '70.09', '中国大陆', '11466', '5', '100', '0', '越南进口特产黑美人西瓜新鲜应季时令水果鲜甜多汁5', '180', '2018-05-08 16:58', '0', '西瓜', '45.54', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11467', '中国西瓜', '71.10', '79.53', '中国大陆', '11467', '4', '100', '0', '绿妮 南汇8424西瓜 头藤瓜 新鲜 现摘现发 南汇特产 两只装约12斤', '180', '2018-05-08 16:59', '0', '西瓜', '52.91', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11468', '三亚市西瓜', '72.36', '74.06', '海南省三亚市', '11468', '5', '100', '0', '20斤一个很大的西瓜海南岛水果新鲜黑美人西瓜麒三亚热带产的大瓜', '180', '2018-05-08 16:59', '0', '西瓜', '40.87', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11469', '中国西瓜', '41.17', '55.31', '中国大陆', '11469', '5', '100', '0', '【易果生鲜】国产麒麟瓜1个2.4kg以上/个  西瓜', '180', '2018-05-08 16:59', '0', '西瓜', '40.50', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11470', '中国西瓜', '71.88', '77.60', '中国大陆', '11470', '5', '100', '0', '新鲜应季越南特产黑美人 西瓜 5', '180', '2018-05-08 16:59', '0', '西瓜', '64.14', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11471', '中国西瓜', '55.91', '76.68', '中国大陆', '11471', '5', '100', '0', '越南特产新鲜黑美人应季水果5', '180', '2018-05-08 16:59', '0', '西瓜', '44.30', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11472', '中国西瓜', '61.88', '76.25', '中国大陆', '11472', '5', '100', '0', '上海8424西瓜1个2.9kg以上/个', '180', '2018-05-08 16:59', '0', '西瓜', '45.78', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11473', '中国西瓜', '66.61', '70.08', '中国大陆', '11473', '5', '100', '0', '海南特小凤西瓜1个900g以上/个', '180', '2018-05-08 16:59', '0', '西瓜', '49.94', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11474', '宿州市西瓜', '67.06', '68.57', '安徽省宿州市', '11474', '5', '100', '0', '现摘新鲜西瓜水果1个装 8424两个合计10斤以上顺丰非麒麟甜王包邮', '180', '2018-05-08 16:59', '0', '西瓜', '40.52', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11475', '中国西瓜', '50.55', '65.12', '中国大陆', '11475', '5', '100', '0', '绿妮 南汇8424西瓜 头茬西瓜 现采现发 单只六斤装 两件包邮', '180', '2018-05-08 16:59', '0', '西瓜', '44.14', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11476', '中国西瓜', '62.04', '72.62', '中国大陆', '11476', '5', '100', '0', '北京大兴牛奶西瓜1个礼盒装1kg以上/个 新鲜水果 西瓜 牛奶西瓜', '180', '2018-05-08 16:59', '0', '西瓜', '40.22', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11477', '中国西瓜', '57.25', '62.95', '中国大陆', '11477', '5', '100', '0', '国产麒麟瓜1个2.4kg以上/个 麒麟西瓜 新鲜水果 西瓜', '180', '2018-05-08 16:59', '0', '西瓜', '46.63', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11478', '宿州市西瓜', '77.66', '77.84', '安徽省宿州市', '11478', '5', '100', '0', '美味连连 西瓜水果新鲜2个装10', '180', '2018-05-08 16:59', '0', '西瓜', '59.97', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11479', '中国西瓜', '51.98', '55.64', '中国大陆', '11479', '5', '100', '0', '南汇8424西瓜黑籽非嫁接自然授粉不打农药2个装约14斤新鲜水果', '180', '2018-05-08 16:59', '0', '西瓜', '41.58', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11480', '宿州市西瓜', '76.56', '76.84', '安徽省宿州市', '11480', '5', '100', '0', '美味连连 现摘新鲜西瓜水果7', '180', '2018-05-08 16:59', '0', '西瓜', '50.96', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11481', '中国西瓜', '71.96', '79.11', '中国大陆', '11481', '5', '100', '0', '海南特小凤西瓜1个1.25kg以上/个 海鲜水果 瓜果 黄心西瓜', '180', '2018-05-08 16:59', '0', '西瓜', '40.72', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11482', '中国西瓜', '59.31', '78.33', '中国大陆', '11482', '5', '100', '0', '广西黑美人西瓜1个2.5kg以上/个', '180', '2018-05-08 16:59', '0', '西瓜', '46.44', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11483', '中国西瓜', '56.68', '75.72', '中国大陆', '11483', '5', '100', '0', '海南金兰西瓜1个2kg以上/个 新鲜水果 西瓜 海南水果', '180', '2018-05-08 16:59', '0', '西瓜', '51.41', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11484', '中国西瓜', '60.24', '76.33', '中国大陆', '11484', '4', '100', '0', '帆儿庄园 黑美人西瓜汁多微甜新鲜水果 4到5斤装', '180', '2018-05-08 16:59', '0', '西瓜', '52.95', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11485', '中国西瓜', '51.38', '64.97', '中国大陆', '11485', '3', '100', '0', '优选山东迷你西瓜（1粒装）约1.3kg 新鲜水果 顺丰到家 品质保证', '180', '2018-05-08 16:59', '0', '西瓜', '51.34', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11486', '万宁市西瓜', '72.68', '73.92', '海南省万宁市', '11486', '5', '100', '0', '【易果生鲜】海南特小凤西瓜1个1.25kg以上/个', '180', '2018-05-08 16:59', '0', '西瓜', '42.84', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11487', '中国西瓜', '55.64', '71.81', '中国大陆', '11487', '5', '100', '0', '海南早春红玉西瓜1个1kg以上/个', '180', '2018-05-08 16:59', '0', '西瓜', '42.36', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11488', '济南市西瓜', '77.99', '79.89', '山东省济南市', '11488', '5', '100', '0', '保真现发现摘济南济阳仁风照文富硒西瓜6个新鲜水果黄瓤西瓜包邮', '180', '2018-05-08 16:59', '0', '西瓜', '69.09', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11489', '中国西瓜', '53.46', '62.29', '中国大陆', '11489', '5', '100', '0', '北京墨童西瓜1个2kg以上/个', '180', '2018-05-08 17:00', '0', '西瓜', '51.60', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11490', '中国西瓜', '66.77', '69.98', '中国大陆', '11490', '5', '100', '0', '汇客上海南汇西瓜4个装27斤左右8424西瓜南汇8424西瓜孕妇水果', '180', '2018-05-08 17:00', '0', '西瓜', '62.12', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11491', '中国西瓜', '67.28', '73.96', '中国大陆', '11491', '5', '100', '0', '海南早春红玉西瓜1个1kg以上/个 新鲜水果 西瓜 早春红玉', '180', '2018-05-08 17:00', '0', '西瓜', '44.80', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11492', '中国西瓜', '60.55', '71.84', '中国大陆', '11492', '5', '100', '0', '黑美人西瓜新鲜应季越南特产甜脆多汁时令水果坏果包赔5', '180', '2018-05-08 17:00', '0', '西瓜', '59.48', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11493', '中国西瓜', '52.05', '58.29', '中国大陆', '11493', '5', '100', '0', '怡然优果  上海南汇8424西瓜2个装 重约10', '180', '2018-05-08 17:00', '0', '西瓜', '42.55', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11494', '中国西瓜', '43.93', '52.34', '中国大陆', '11494', '5', '100', '0', '江苏灌云8424西瓜1个2.9kg以上/个', '180', '2018-05-08 17:00', '0', '西瓜', '41.47', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11495', '济南市西瓜', '41.87', '79.87', '山东省济南市', '11495', '5', '100', '0', '央视上榜正宗济南济阳仁风照文富硒黄瓤西瓜新鲜水果皮薄瓤脆', '180', '2018-05-08 17:00', '0', '西瓜', '41.11', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11496', '中卫市西瓜', '75.30', '77.11', '宁夏回族自治区中卫市', '11496', '4', '100', '0', '正宗宁夏中卫香山硒砂瓜富硒西瓜原产地直发包邮个大超甜沙瓤西瓜', '180', '2018-05-08 17:00', '0', '西瓜', '47.50', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11497', '三亚市菠萝', '61.25', '79.86', '海南省三亚市', '11497', '5', '100', '0', '【蒙斗兄弟】海南三亚冰糖心香水菠萝凤梨4个时令特产新鲜水果', '180', '2018-05-08 17:00', '0', '菠萝', '54.93', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11498', '红河哈尼族彝族自治州菠萝', '59.60', '60.59', '云南省红河哈尼族彝族自治州', '11498', '5', '100', '0', '云南河口蜜香菠萝10斤装现货当季新鲜水果热带特产菠萝包邮', '180', '2018-05-08 17:00', '0', '菠萝', '48.83', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11499', '中国菠萝', '61.72', '67.04', '中国大陆', '11499', '5', '100', '0', '泰国进口香水小菠萝新鲜水果去皮小凤梨迷你2斤顺丰包邮7', '180', '2018-05-08 17:00', '0', '菠萝', '41.00', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11500', '中国菠萝', '73.64', '79.59', '中国大陆', '11500', '5', '100', '0', 'GREENHOW 新鲜进口水果普吉岛特产泰国小菠萝凤梨10斤礼盒装包邮', '180', '2018-05-08 17:00', '0', '菠萝', '42.93', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11501', '三亚市菠萝', '79.36', '79.74', '海南省三亚市', '11501', '5', '100', '0', '【5斤装菠萝】海南水果三亚本地菠萝新鲜香水菠萝金菠萝非凤梨', '180', '2018-05-08 17:00', '0', '菠萝', '65.88', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11502', '红河哈尼族彝族自治州菠萝', '53.11', '63.06', '云南省红河哈尼族彝族自治州', '11502', '5', '100', '0', '拾蘑菇 云南河口小菠萝香水凤梨新鲜水果现摘现发甜脆多汁8斤包邮', '180', '2018-05-08 17:00', '0', '菠萝', '52.48', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11503', '三亚市菠萝', '75.63', '78.98', '海南省三亚市', '11503', '5', '100', '0', '【惠淘赠果】海南三亚热带新鲜水果菠萝蜜5斤切块包装 特香甜包邮', '180', '2018-05-08 17:00', '0', '菠萝', '65.24', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11504', '红河哈尼族彝族自治州菠萝', '52.65', '59.99', '云南省红河哈尼族彝族自治州', '11504', '5', '100', '0', '小饭团李简如云南红河香水小菠萝8斤 当季新鲜水果甜脆多汁非凤梨', '180', '2018-05-08 17:00', '0', '菠萝', '42.75', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11505', '玉林市菠萝', '60.72', '73.02', '广西壮族自治区玉林市', '11505', '5', '100', '0', '新鲜现摘甜心菠萝香水 菠萝  非凤梨 酸甜多汁营养水果小菠萝', '180', '2018-05-08 17:00', '0', '菠萝', '53.31', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11506', '红河哈尼族彝族自治州菠萝', '44.46', '57.86', '云南省红河哈尼族彝族自治州', '11506', '4', '100', '0', '云南河口特产小菠萝迷你小菠萝青皮美味多汁菠萝8斤新鲜水果', '180', '2018-05-08 17:00', '0', '菠萝', '43.66', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11507', '昆明市菠萝', '70.68', '79.78', '云南省昆明市', '11507', '5', '100', '0', '十六御 云南香水迷你小菠萝批发新鲜水果包邮非凤梨4斤装热带水果', '180', '2018-05-08 17:00', '0', '菠萝', '57.50', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11508', '红河哈尼族彝族自治州菠萝', '50.80', '65.91', '云南省红河哈尼族彝族自治州', '11508', '5', '100', '0', '新鲜水果云南迷你小菠萝8斤小凤梨热带水果 包邮', '180', '2018-05-08 17:00', '0', '菠萝', '44.98', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11509', '中国菠萝', '72.12', '74.94', '中国大陆', '11509', '5', '100', '0', '泰国小菠萝 香水小凤梨 迷你新鲜菠萝新鲜水果3斤12', '180', '2018-05-08 17:00', '0', '菠萝', '49.29', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11510', '广州市菠萝', '67.70', '70.17', '广东省广州市', '11510', '5', '100', '0', '徐闻香水小菠萝热带海南凤梨菠萝新鲜水果批发包邮当季整箱5斤', '180', '2018-05-08 17:00', '0', '菠萝', '44.61', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11511', '南宁市菠萝', '75.91', '79.77', '广西壮族自治区南宁市', '11511', '5', '100', '0', '菠萝 广西小菠萝新鲜水果包邮香水菠萝8斤包邮非泰国小菠萝', '180', '2018-05-08 17:00', '0', '菠萝', '52.25', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11512', '中国菠萝', '42.05', '64.15', '中国大陆', '11512', '5', '100', '0', '索鲜堂水果 泰国进口迷你香水小菠萝5斤【空运直邮】新鲜带皮凤梨', '180', '2018-05-08 17:00', '0', '菠萝', '40.86', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11513', '中国菠萝', '58.11', '76.04', '中国大陆', '11513', '5', '100', '0', '【Dole都乐】菲律宾都乐大金菠萝1只   单果约1500g', '180', '2018-05-08 17:01', '0', '菠萝', '45.89', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11514', '昆明市菠萝', '63.33', '66.82', '云南省昆明市', '11514', '5', '100', '0', '云南新鲜香水菠萝9斤 现摘现发 当季热带水果特产', '180', '2018-05-08 17:01', '0', '菠萝', '40.74', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11515', '昆明市菠萝', '69.96', '72.04', '云南省昆明市', '11515', '5', '100', '0', '云南甜脆菠萝大果手撕香水凤梨新鲜10斤水果批发包邮', '180', '2018-05-08 17:01', '0', '菠萝', '49.83', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11516', '南宁市菠萝', '44.11', '57.40', '广西壮族自治区南宁市', '11516', '5', '100', '0', '菠萝新鲜水果 广西香水小菠萝5斤包邮 非泰国小菠萝 非云南小菠萝', '180', '2018-05-08 17:01', '0', '菠萝', '40.66', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11517', '三亚市菠萝', '60.94', '73.27', '海南省三亚市', '11517', '5', '100', '0', '海南大菠萝非泰国小菠萝现摘香水菠萝新鲜水果包邮4个装凤梨除异', '180', '2018-05-08 17:01', '0', '菠萝', '46.01', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11518', '红河哈尼族彝族自治州菠萝', '61.83', '73.28', '云南省红河哈尼族彝族自治州', '11518', '5', '100', '0', '【送菠萝刀】云南河口香水菠萝大果8斤 蜜香凤梨新鲜水果批发包邮', '180', '2018-05-08 17:01', '0', '菠萝', '49.82', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11519', '湛江市菠萝', '56.78', '68.91', '广东省湛江市', '11519', '5', '100', '0', '徐闻现摘现发香菠萝迷你小菠萝新鲜水果包邮美味多汁8斤送菠萝刀', '180', '2018-05-08 17:01', '0', '菠萝', '44.84', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11520', '西双版纳傣族自治州菠萝', '53.95', '63.68', '云南省西双版纳傣族自治州', '11520', '5', '100', '0', '云南版纳凤梨 水果新鲜包邮当季无眼菠萝香水小波萝新鲜10斤包邮', '180', '2018-05-08 17:01', '0', '菠萝', '46.22', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11521', '中国菠萝', '44.99', '45.42', '中国大陆', '11521', '5', '100', '0', '【Dole都乐】菲律宾都乐无冠菠萝3只装 进口菠萝 单果约1100g', '180', '2018-05-08 17:01', '0', '菠萝', '43.20', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11522', '南宁市菠萝', '60.98', '71.56', '广西壮族自治区南宁市', '11522', '5', '100', '0', '小心柑儿 海南三亚新鲜冰糖心大菠萝4个时令水果香水小菠萝送刀', '180', '2018-05-08 17:01', '0', '菠萝', '54.40', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11523', '红河哈尼族彝族自治州菠萝', '78.45', '79.75', '云南省红河哈尼族彝族自治州', '11523', '5', '100', '0', '坏果包赔云南河口蜜香菠萝10斤特产新鲜水果非凤梨送菠萝刀', '180', '2018-05-08 17:01', '0', '菠萝', '49.07', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11524', '红河哈尼族彝族自治州菠萝', '61.85', '63.64', '云南省红河哈尼族彝族自治州', '11524', '4', '100', '0', '云南河口香水小菠萝 新鲜水果菠萝凤梨9斤装包邮送削皮刀坏果包赔', '180', '2018-05-08 17:01', '0', '菠萝', '55.77', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11525', '三亚市菠萝', '54.38', '68.09', '海南省三亚市', '11525', '5', '100', '0', '2个凤梨小菠萝菠萝新鲜水果5香水10当季批发整箱9波萝非泰国云南', '180', '2018-05-08 17:01', '0', '菠萝', '54.22', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11526', '南宁市菠萝', '79.25', '79.80', '广西壮族自治区南宁市', '11526', '5', '100', '0', '悦太 水果批发包邮低价新鲜香水波萝水果风梨5斤低价菠萝整箱热带', '180', '2018-05-08 17:01', '0', '菠萝', '76.92', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11527', '漳州市菠萝', '56.98', '65.04', '福建省漳州市', '11527', '4', '100', '0', '程溪菠萝新鲜香水大菠萝一粒试吃装750', '180', '2018-05-08 17:01', '0', '菠萝', '50.48', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11528', '南宁市菠萝', '49.50', '69.06', '广西壮族自治区南宁市', '11528', '5', '100', '0', '鲜之脉水果 泰国小菠萝凤梨迷你菠萝新鲜水果8斤装9', '180', '2018-05-08 17:01', '0', '菠萝', '44.46', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11529', '西双版纳傣族自治州菠萝', '54.26', '68.33', '云南省西双版纳傣族自治州', '11529', '5', '100', '0', '应季新鲜热带水果云南河口香水菠萝凤梨水果共发9斤装批发包邮', '180', '2018-05-08 17:01', '0', '菠萝', '42.29', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11530', '乐东黎族自治县菠萝', '48.03', '60.65', '海南省乐东黎族自治县', '11530', '5', '100', '0', '淘乡甜海南金菠萝凤梨单果2.3斤以上2粒装当季热带新鲜水果包邮', '180', '2018-05-08 17:01', '0', '菠萝', '42.70', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11531', '中国菠萝', '50.33', '64.27', '中国大陆', '11531', '4', '100', '0', '优霸 菲律宾菠萝 2个 无刺菠萝 进口新鲜水果 单果1100', '180', '2018-05-08 17:01', '0', '菠萝', '47.49', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11532', '中国菠萝', '59.24', '74.99', '中国大陆', '11532', '5', '100', '0', '【Dole都乐】菲律宾都乐大金菠萝两只进口6斤以上单果约1500g', '180', '2018-05-08 17:01', '0', '菠萝', '43.75', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11533', '红河哈尼族彝族自治州菠萝', '50.92', '74.11', '云南省红河哈尼族彝族自治州', '11533', '5', '100', '0', '送3斤整箱8斤云南香水菠萝当季水果新鲜包邮小菠萝非菠萝蜜凤梨', '180', '2018-05-08 17:01', '0', '菠萝', '48.66', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11534', '红河哈尼族彝族自治州菠萝', '60.05', '61.87', '云南省红河哈尼族彝族自治州', '11534', '5', '100', '0', '第2份0.1元第3份0.01元云南河口蜜香甜菠萝新鲜水果非凤梨包邮', '180', '2018-05-08 17:01', '0', '菠萝', '48.77', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11535', '红河哈尼族彝族自治州菠萝', '77.05', '79.00', '云南省红河哈尼族彝族自治州', '11535', '5', '100', '0', '云南特产香水菠萝新鲜当季水果批发包邮小菠萝8斤非凤梨菠萝蜜', '180', '2018-05-08 17:01', '0', '菠萝', '70.95', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11536', '湛江市菠萝', '59.74', '67.02', '广东省湛江市', '11536', '5', '100', '0', '移民汇湛江徐闻香水大菠萝台湾凤梨海南新鲜水果现摘包邮批发5斤', '180', '2018-05-08 17:01', '0', '菠萝', '52.55', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11537', '三亚市菠萝', '47.87', '63.99', '海南省三亚市', '11537', '5', '100', '0', '【自然成熟】海南三亚新鲜水果黄金凤梨菠萝金钻凤梨2个多省包邮', '180', '2018-05-08 17:02', '0', '菠萝', '45.64', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11538', '中国菠萝', '73.60', '77.73', '中国大陆', '11538', '5', '100', '0', '2斤装8', '180', '2018-05-08 17:02', '0', '菠萝', '65.25', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11539', '湛江市菠萝', '46.04', '65.97', '广东省湛江市', '11539', '5', '100', '0', '湛江徐闻小菠萝2.5KG现摘现发肉脆多汁香甜可口清香美味坏果包赔', '180', '2018-05-08 17:02', '0', '菠萝', '42.12', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11540', '中国菠萝', '59.33', '69.30', '中国大陆', '11540', '5', '100', '0', '泰国小菠萝8斤装 迷你新鲜小凤梨7', '180', '2018-05-08 17:02', '0', '菠萝', '46.76', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11541', '中国菠萝', '54.03', '64.74', '中国大陆', '11541', '5', '100', '0', '菲律宾进口凤梨2个(1kg以上/个) 菠萝新鲜水果批发包邮', '180', '2018-05-08 17:02', '0', '菠萝', '50.27', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11542', '中国菠萝', '48.10', '67.05', '中国大陆', '11542', '4', '100', '0', 'GREENHOW 新鲜进口水果泰国小菠萝凤梨普吉岛小菠萝5斤 包邮', '180', '2018-05-08 17:02', '0', '菠萝', '45.59', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11543', '红河哈尼族彝族自治州菠萝', '73.10', '74.71', '云南省红河哈尼族彝族自治州', '11543', '5', '100', '0', '云南特产香水菠萝大果10斤装 甜脆多汁手撕菠萝新鲜水果批发包邮', '180', '2018-05-08 17:02', '0', '菠萝', '46.80', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11544', '中国菠萝', '74.46', '77.18', '中国大陆', '11544', '5', '100', '0', '香水品种小菠萝新鲜水果胜泰国普吉岛香水迷你小菠萝凤梨8斤包邮', '180', '2018-05-08 17:02', '0', '菠萝', '68.71', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11545', '红河哈尼族彝族自治州菠萝', '79.44', '79.93', '云南省红河哈尼族彝族自治州', '11545', '5', '100', '0', '云南特产香水菠萝甜脆手撕菠萝8斤装新鲜热带应季水果批发包邮', '180', '2018-05-08 17:02', '0', '菠萝', '42.47', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11546', '中国菠萝', '55.51', '66.89', '中国大陆', '11546', '5', '100', '0', '【Dole都乐】菲律宾都乐无冠菠萝1只 进口水果 单果约1100g', '180', '2018-05-08 17:02', '0', '菠萝', '46.98', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11547', '中国菠萝', '69.30', '77.95', '中国大陆', '11547', '5', '100', '0', '【Dole都乐】菲律宾都乐无冠菠萝2只 进口水果 单果约1100g', '180', '2018-05-08 17:02', '0', '菠萝', '51.87', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11548', '三亚市菠萝', '58.58', '68.41', '海南省三亚市', '11548', '5', '100', '0', '海南金钻凤梨新鲜超甜水果非菠萝手撕坏果包赔4', '180', '2018-05-08 17:02', '0', '菠萝', '50.17', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11549', '红河哈尼族彝族自治州菠萝', '76.95', '78.43', '云南省红河哈尼族彝族自治州', '11549', '5', '100', '0', '坏果包赔云南河口蜜香菠萝10斤装特产新鲜水果凤梨送菠萝刀', '180', '2018-05-08 17:02', '0', '菠萝', '75.21', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11550', '文昌市菠萝', '40.17', '73.25', '海南省文昌市', '11550', '5', '100', '0', '海南菠萝新鲜水果三亚热带香水小菠萝树上熟金钻小波罗水果非泰国', '180', '2018-05-08 17:02', '0', '菠萝', '40.02', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11551', '昆明市菠萝', '76.06', '77.90', '云南省昆明市', '11551', '5', '100', '0', '【买一送一】送刀云南香水菠萝新鲜包邮水果批发非泰国小菠萝5斤', '180', '2018-05-08 17:02', '0', '菠萝', '74.33', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11552', '红河哈尼族彝族自治州菠萝', '66.16', '78.82', '云南省红河哈尼族彝族自治州', '11552', '5', '100', '0', '【第2件0.1元，第3件0元】云南甜脆菠萝蜜凤梨新鲜水果批发包邮', '180', '2018-05-08 17:02', '0', '菠萝', '49.19', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11553', '红河哈尼族彝族自治州菠萝', '46.40', '76.59', '云南省红河哈尼族彝族自治州', '11553', '5', '100', '0', '云南河口蜜香菠萝8斤装现货当季新鲜水果热带特产菠萝包邮', '180', '2018-05-08 17:02', '0', '菠萝', '41.99', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11554', '中国菠萝', '67.47', '74.11', '中国大陆', '11554', '5', '100', '0', '至冠 泰国去皮小菠萝普吉岛迷你小凤梨新鲜水果2斤真空装顺丰空运', '180', '2018-05-08 17:02', '0', '菠萝', '61.76', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11555', '湛江市菠萝', '46.33', '54.37', '广东省湛江市', '11555', '5', '100', '0', '湛江徐闻大菠萝2.5KG新鲜现摘现发肉脆清香美味香甜可口坏果包赔', '180', '2018-05-08 17:02', '0', '菠萝', '45.52', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11556', '三亚市菠萝', '74.68', '79.41', '海南省三亚市', '11556', '5', '100', '0', '海南发货！新鲜水果 菠萝 凤梨 金菠萝5斤装2', '180', '2018-05-08 17:02', '0', '菠萝', '52.17', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11557', '南宁市香蕉', '62.58', '74.55', '广西壮族自治区南宁市', '11557', '5', '100', '0', '[卓上精选]新鲜水果 10斤广西小米蕉批发帝王芭蕉5皇帝香蕉粉整箱', '180', '2018-05-08 17:02', '0', '香蕉', '61.15', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11558', '三亚市香蕉', '60.45', '75.21', '海南省三亚市', '11558', '3', '100', '0', '顺丰！海南三亚新鲜水果 皇帝蕉 小米焦 小芭蕉 香蕉3斤装', '180', '2018-05-08 17:02', '0', '香蕉', '41.01', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11559', '漳州市香蕉', '71.39', '73.86', '福建省漳州市', '11559', '5', '100', '0', '土楼红美人红皮香蕉火龙美人蕉厦门特色新鲜5斤红色的香蕉批发', '180', '2018-05-08 17:02', '0', '香蕉', '43.32', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11560', '南宁市香蕉', '71.52', '71.66', '广西壮族自治区南宁市', '11560', '5', '100', '0', '广西小米蕉鸡蕉新鲜banana酸甜皇帝蕉海南芭蕉香蕉新鲜水果5斤', '180', '2018-05-08 17:03', '0', '香蕉', '63.82', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11561', '漳州市香蕉', '58.91', '78.94', '福建省漳州市', '11561', '5', '100', '0', '新鲜水果天宝香蕉banana非小米蕉无催熟剂 自然熟5斤装包邮现摘甜', '180', '2018-05-08 17:03', '0', '香蕉', '42.74', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11562', '中国香蕉', '74.64', '75.31', '中国大陆', '11562', '5', '100', '0', '常瀛国产呀咪香蕉10根(切割蕉) 新鲜水果 国产香蕉', '180', '2018-05-08 17:03', '0', '香蕉', '52.44', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11563', '中国香蕉', '41.35', '59.43', '中国大陆', '11563', '5', '100', '0', '常瀛进口香蕉约1.5kg 新鲜水果 菲律宾香蕉', '180', '2018-05-08 17:03', '0', '香蕉', '40.65', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11564', '茂名市香蕉', '41.43', '43.36', '广东省茂名市', '11564', '5', '100', '0', '新鲜水果广东茂名小米蕉特产粉蕉芭蕉西贡蕉香甜5斤百世汇通包邮', '180', '2018-05-08 17:03', '0', '香蕉', '40.34', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11565', '中国香蕉', '43.30', '75.02', '中国大陆', '11565', '5', '100', '0', '海南香蕉1kg', '180', '2018-05-08 17:03', '0', '香蕉', '40.87', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11566', '三亚市香蕉', '76.49', '78.90', '海南省三亚市', '11566', '5', '100', '0', '空运6斤装海南三亚新鲜现摘皇帝蕉小米蕉粉蕉香蕉新鲜奶热带水果', '180', '2018-05-08 17:03', '0', '香蕉', '64.81', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11567', '中国香蕉', '45.04', '73.27', '中国大陆', '11567', '5', '100', '0', '国产香蕉5根500g', '180', '2018-05-08 17:03', '0', '香蕉', '41.04', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11568', '漳州市香蕉', '66.29', '67.28', '福建省漳州市', '11568', '5', '100', '0', '阳哥 新鲜土楼红香蕉水果美人蕉当季红皮香蕉红色火龙蕉3斤banana', '180', '2018-05-08 17:03', '0', '香蕉', '56.75', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11569', '南宁市香蕉', '40.97', '44.82', '广西壮族自治区南宁市', '11569', '5', '100', '0', '广西小米蕉 新鲜小鸡蕉鲜香蕉8斤装包邮 无催熟剂无保鲜剂水果', '180', '2018-05-08 17:03', '0', '香蕉', '40.35', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11570', '漳州市香蕉', '63.23', '66.70', '福建省漳州市', '11570', '5', '100', '0', '欢森 新鲜黄皮香蕉5斤福建土楼美人蕉 红香蕉水果火龙蕉banana', '180', '2018-05-08 17:03', '0', '香蕉', '45.39', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11571', '中国香蕉', '43.54', '63.37', '中国大陆', '11571', '5', '100', '0', '海南香蕉1kg  新鲜水果 海南水果 热带水果', '180', '2018-05-08 17:03', '0', '香蕉', '42.89', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11572', '南宁市香蕉', '55.96', '71.23', '广西壮族自治区南宁市', '11572', '5', '100', '0', '广西小米蕉鸡蕉新鲜banana酸甜皇帝蕉海南芭蕉香蕉水果带箱10斤', '180', '2018-05-08 17:03', '0', '香蕉', '48.36', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11573', '漳州市香蕉', '62.62', '74.56', '福建省漳州市', '11573', '1', '100', '0', '漳州米蕉5斤装果园直发无添加小米蕉香蕉苹果粉', '180', '2018-05-08 17:03', '0', '香蕉', '52.26', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11574', '南宁市香蕉', '73.66', '79.80', '广西壮族自治区南宁市', '11574', '5', '100', '0', '[卓上精选]新鲜水果 10斤海南大香蕉批发5一整箱广西特产当季低价', '180', '2018-05-08 17:03', '0', '香蕉', '65.37', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11575', '漳州市香蕉', '62.59', '77.21', '福建省漳州市', '11575', '5', '100', '0', '漳州天宝香蕉banana现摘新鲜香蕉坏果包赔孕妇水果青蕉无催熟剂', '180', '2018-05-08 17:03', '0', '香蕉', '54.81', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11576', '中国香蕉', '45.81', '49.65', '中国大陆', '11576', '5', '100', '0', '常瀛进口香蕉6根(单根袋装) 新鲜水果 菲律宾香蕉', '180', '2018-05-08 17:03', '0', '香蕉', '42.44', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11577', '漳州市香蕉', '76.15', '78.75', '福建省漳州市', '11577', '4', '100', '0', '天宝香蕉5斤装果园直发香蕉banan热带水果', '180', '2018-05-08 17:03', '0', '香蕉', '64.33', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11578', '漳州市香蕉', '55.53', '75.81', '福建省漳州市', '11578', '5', '100', '0', '漳州特产新鲜水果banana天宝香蕉无催熟剂孕妇农产品 3斤大根香蕉', '180', '2018-05-08 17:03', '0', '香蕉', '53.28', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11579', '南宁市香蕉', '49.72', '51.52', '广西壮族自治区南宁市', '11579', '5', '100', '0', '帆儿庄园 新鲜水果广西小米蕉鸡蕉香蕉banana批发 5斤装', '180', '2018-05-08 17:03', '0', '香蕉', '44.07', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11580', '厦门市香蕉', '75.58', '79.26', '福建省厦门市', '11580', '5', '100', '0', '【南国屋】福建土楼特产新鲜红皮香蕉孕妇宝宝营养水果5斤包邮', '180', '2018-05-08 17:03', '0', '香蕉', '66.66', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11581', '南宁市香蕉', '74.20', '76.14', '广西壮族自治区南宁市', '11581', '5', '100', '0', '【现摘现发】精选小米蕉广西香蕉新鲜水果小鸡蕉无添加剂非芭蕉', '180', '2018-05-08 17:03', '0', '香蕉', '48.30', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11582', '漳州市香蕉', '75.62', '79.42', '福建省漳州市', '11582', '5', '100', '0', '迎果恋红皮香蕉3斤香蕉新鲜水果批发包邮低价新鲜整箱当季小香蕉', '180', '2018-05-08 17:03', '0', '香蕉', '73.66', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11583', '中国香蕉', '65.40', '66.73', '中国大陆', '11583', '5', '100', '0', '【Dole都乐】菲律宾都乐高地蕉1把装 进口香蕉 单把700g以上', '180', '2018-05-08 17:04', '0', '香蕉', '62.87', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11584', '南宁市香蕉', '49.73', '59.78', '广西壮族自治区南宁市', '11584', '5', '100', '0', '【当天现割】精品香蕉新鲜自然熟孕妇宝宝辅食水果无催熟剂', '180', '2018-05-08 17:04', '0', '香蕉', '46.79', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11585', '三亚市香蕉', '50.48', '78.55', '海南省三亚市', '11585', '5', '100', '0', '【前200名拍下减10元】 现摘广东徐闻山地香蕉新鲜水果 坏果包赔', '180', '2018-05-08 17:04', '0', '香蕉', '49.47', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11586', '中国香蕉', '65.80', '70.68', '中国大陆', '11586', '5', '100', '0', '常瀛国产呀咪香蕉5根 新鲜水果 国产香蕉', '180', '2018-05-08 17:04', '0', '香蕉', '52.31', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11587', '中国香蕉', '64.74', '71.82', '中国大陆', '11587', '5', '100', '0', '常瀛进口整把香蕉约1.36kg 进口 新鲜水果 进口香蕉', '180', '2018-05-08 17:04', '0', '香蕉', '48.57', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11588', '漳州市香蕉', '63.89', '66.54', '福建省漳州市', '11588', '5', '100', '0', '欢森 红皮香蕉5斤福建土楼新鲜美人蕉 红香蕉水果火龙蕉banana', '180', '2018-05-08 17:04', '0', '香蕉', '53.55', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11589', '中国香蕉', '71.25', '79.65', '中国大陆', '11589', '5', '100', '0', '常瀛进口吖蜜芝麻蕉1kg 香蕉 新鲜水果', '180', '2018-05-08 17:04', '0', '香蕉', '62.06', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11590', '百色市香蕉', '68.05', '70.19', '广西壮族自治区百色市', '11590', '5', '100', '0', '芭蕉 西贡蕉 广西香蕉新鲜水果8斤包邮 非小米蕉皇帝蕉banana', '180', '2018-05-08 17:04', '0', '香蕉', '43.79', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11591', '漳州市香蕉', '71.84', '77.51', '福建省漳州市', '11591', '5', '100', '0', '欢森 红皮香蕉8根福建土楼新鲜美人蕉 红香蕉水果 非小米蕉banana', '180', '2018-05-08 17:04', '0', '香蕉', '69.62', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11592', '中国香蕉', '51.96', '53.51', '中国大陆', '11592', '5', '100', '0', '佳农超甜蕉750g', '180', '2018-05-08 17:04', '0', '香蕉', '47.67', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11593', '三亚市香蕉', '59.69', '63.19', '海南省三亚市', '11593', '5', '100', '0', '海南芭蕉三亚香蕉粉蕉海南应季新鲜水果3斤一把空运水果芭蕉新鲜', '180', '2018-05-08 17:04', '0', '香蕉', '49.93', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11594', '中国香蕉', '60.21', '60.27', '中国大陆', '11594', '5', '100', '0', '【逸恒食品】帝王蕉4斤 皇帝蕉小香蕉进口新鲜水果单把500g以上', '180', '2018-05-08 17:04', '0', '香蕉', '59.96', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11595', '漳州市香蕉', '77.21', '79.52', '福建省漳州市', '11595', '5', '100', '0', '迎果恋红皮香蕉红香蕉5斤装新鲜香蕉红美人香蕉现摘水果批发新鲜', '180', '2018-05-08 17:04', '0', '香蕉', '73.00', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11596', '漳州市香蕉', '50.47', '61.02', '福建省漳州市', '11596', '5', '100', '0', '悦太 水果批发包邮新鲜5斤香蕉一整箱当季农家低价红皮红美人香蕉', '180', '2018-05-08 17:04', '0', '香蕉', '43.55', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11597', '中国香蕉', '70.77', '71.43', '中国大陆', '11597', '5', '100', '0', '【Dole都乐】都乐菲律宾高地蕉3把装 品质进口香蕉 单把700g以上', '180', '2018-05-08 17:04', '0', '香蕉', '43.68', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11598', '中国香蕉', '50.03', '51.92', '中国大陆', '11598', '5', '100', '0', '【Dole都乐】都乐菲律宾高地蕉4把装 品质进口香蕉 单把700g以上', '180', '2018-05-08 17:04', '0', '香蕉', '46.02', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11599', '南宁市香蕉', '50.58', '71.41', '广西壮族自治区南宁市', '11599', '5', '100', '0', '8斤装 小米蕉 香蕉 皇帝蕉 新鲜水果 青香蕉  非海南粉蕉芭蕉', '180', '2018-05-08 17:04', '0', '香蕉', '40.92', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11600', '南宁市香蕉', '45.43', '78.17', '广西壮族自治区南宁市', '11600', '5', '100', '0', '【第2件0.1元】精选小米蕉广西现摘新鲜青皮热带banana自然催熟', '180', '2018-05-08 17:04', '0', '香蕉', '42.01', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11601', '漳州市香蕉', '67.22', '78.50', '福建省漳州市', '11601', '5', '100', '0', '果利园新鲜水果天宝香蕉果园直发无催熟剂banana香蕉非粉蕉包邮', '180', '2018-05-08 17:04', '0', '香蕉', '56.75', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11602', '中国香蕉', '41.17', '53.87', '中国大陆', '11602', '5', '100', '0', '【Dole都乐】菲律宾帝皇蕉1把装 进口香蕉banana小 单把约600克', '180', '2018-05-08 17:05', '0', '香蕉', '40.70', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11603', '南宁市香蕉', '51.31', '65.88', '广西壮族自治区南宁市', '11603', '5', '100', '0', '保丰岭粉蕉西贡蕉 8斤包邮新鲜青香蕉非红皮香蕉火龙蕉小米焦芭蕉', '180', '2018-05-08 17:05', '0', '香蕉', '45.34', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11604', '南宁市香蕉', '67.97', '77.53', '广西壮族自治区南宁市', '11604', '5', '100', '0', '果百伦 小米蕉8斤装 新鲜青香蕉 广西小米蕉 小鸡蕉 非泰蕉芭蕉', '180', '2018-05-08 17:05', '0', '香蕉', '63.64', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11605', '茂名市香蕉', '41.45', '63.97', '广东省茂名市', '11605', '5', '100', '0', '广东高州牛奶香蕉现砍小米香蕉帝王粉奶蕉非大芭蕉不催熟新鲜水果', '180', '2018-05-08 17:05', '0', '香蕉', '40.26', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11606', '玉林市香蕉', '64.44', '69.36', '广西壮族自治区玉林市', '11606', '5', '100', '0', '广西小米蕉新鲜水果banana酸甜农家特产粉蕉皇帝蕉芭蕉香蕉西贡蕉', '180', '2018-05-08 17:05', '0', '香蕉', '54.62', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11607', '中国香蕉', '62.65', '63.80', '中国大陆', '11607', '5', '100', '0', '菲律宾香蕉1kg', '180', '2018-05-08 17:05', '0', '香蕉', '55.07', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11608', '漳州市香蕉', '49.97', '60.29', '福建省漳州市', '11608', '5', '100', '0', '百年栗园原产地直供天宝香蕉新鲜采摘发货无催熟 5斤新鲜水果', '180', '2018-05-08 17:05', '0', '香蕉', '43.82', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11609', '中国香蕉', '77.21', '78.43', '中国大陆', '11609', '5', '100', '0', '苏洪鲜食 佳农 进口香蕉 约1kg 单根装 新鲜水果', '180', '2018-05-08 17:05', '0', '香蕉', '72.38', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11610', '南宁市香蕉', '76.02', '79.37', '广西壮族自治区南宁市', '11610', '5', '100', '0', '小米蕉 香蕉 新鲜 小米香蕉9斤小香蕉小鸡蕉青香蕉', '180', '2018-05-08 17:05', '0', '香蕉', '52.24', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11611', '海口市香蕉', '64.82', '79.86', '海南省海口市', '11611', '5', '100', '0', '【第2件半价】海南新鲜水果 新鲜芭蕉3斤 香甜软糯胜香蕉 包邮', '180', '2018-05-08 17:05', '0', '香蕉', '54.16', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11612', '中国香蕉', '40.21', '58.19', '中国大陆', '11612', '5', '100', '0', '【逸恒食品】进口banana菲律宾进口帝王蕉6斤小香蕉新鲜水果香蕉', '180', '2018-05-08 17:05', '0', '香蕉', '40.03', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11613', '中国香蕉', '44.55', '71.93', '中国大陆', '11613', '5', '100', '0', '【逸恒食品】精选单只香蕉礼盒装菲律宾进口水果新鲜 两盒共4.8斤', '180', '2018-05-08 17:05', '0', '香蕉', '43.99', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11614', '三亚市香蕉', '67.26', '71.36', '海南省三亚市', '11614', '5', '100', '0', '恋多滋 香蕉新鲜5斤海南特产小米焦水果批发包邮当季整箱皇帝蕉', '180', '2018-05-08 17:05', '0', '香蕉', '54.78', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11615', '南宁市香蕉', '63.15', '76.53', '广西壮族自治区南宁市', '11615', '5', '100', '0', '广西小米蕉鸡蕉新鲜banana酸甜米蕉皇帝蕉海南芭蕉香蕉新鲜水果', '180', '2018-05-08 17:05', '0', '香蕉', '59.37', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11616', '南宁市香蕉', '56.93', '78.37', '广西壮族自治区南宁市', '11616', '5', '100', '0', '广西超甜香蕉banana新鲜水果无催熟剂非米蕉西贡粉蕉现摘现发', '180', '2018-05-08 17:05', '0', '香蕉', '51.75', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11617', '中国杨桃', '47.79', '51.45', '中国大陆', '11617', '5', '100', '0', '【幸康丰】广东现摘现发杨桃5斤香甜多汁阳桃新鲜水果包邮大杨桃', '180', '2018-05-08 17:05', '0', '杨桃', '44.53', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11618', '中国杨桃', '43.69', '61.36', '中国大陆', '11618', '5', '100', '0', '广东潮汕杨桃1盒(2个) 新鲜水果 洋桃 国产水果', '180', '2018-05-08 17:05', '0', '杨桃', '43.35', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11619', '中国杨桃', '56.51', '68.21', '中国大陆', '11619', '5', '100', '0', '【幸康丰】杨桃香甜多汁广东现摘现发包邮新鲜水果红杨桃大杨桃', '180', '2018-05-08 17:05', '0', '杨桃', '41.42', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11620', '中国杨桃', '65.65', '77.18', '中国大陆', '11620', '5', '100', '0', '【果美妙】现摘现发杨桃2斤装广东产地包邮热带香甜阳桃新鲜水果', '180', '2018-05-08 17:05', '0', '杨桃', '47.24', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11621', '中国杨桃', '41.57', '76.91', '中国大陆', '11621', '5', '100', '0', '当季甜杨桃农家水果包邮新鲜5斤清甜新鲜杨桃大果', '180', '2018-05-08 17:05', '0', '杨桃', '40.53', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11622', '中国杨桃', '67.12', '70.70', '中国大陆', '11622', '5', '100', '0', '美瑞源福建漳州杨桃新鲜甜阳桃五敛子杨桃洋桃三廉子杨桃4粒包邮', '180', '2018-05-08 17:05', '0', '杨桃', '43.77', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11623', '中国杨桃', '64.90', '68.23', '中国大陆', '11623', '4', '100', '0', '海南三亚杨桃 空运3斤装农家特产时令半野生新鲜水果', '180', '2018-05-08 17:05', '0', '杨桃', '61.26', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11624', '中国杨桃', '72.72', '79.41', '中国大陆', '11624', '1', '100', '0', '海南杨桃', '180', '2018-05-08 17:06', '0', '杨桃', '44.48', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11625', '中国杨桃', '62.64', '78.02', '中国大陆', '11625', '5', '100', '0', '新鲜杨桃水果5斤装热带水果果园现摘五菱子口感清脆多省包', '180', '2018-05-08 17:06', '0', '杨桃', '49.66', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11626', '中国杨桃', '66.67', '70.46', '中国大陆', '11626', '5', '100', '0', '杨桃水果新鲜甜洋桃生鲜应季时令酸甜批发低价5斤包邮', '180', '2018-05-08 17:06', '0', '杨桃', '46.27', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11627', '中国杨桃', '66.16', '75.46', '中国大陆', '11627', '5', '100', '0', '杨桃水果5斤装包邮 农家五角星水果热带水果五菱子洋桃新鲜甜阳桃', '180', '2018-05-08 17:06', '0', '杨桃', '56.01', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11628', '中国杨桃', '40.01', '62.30', '中国大陆', '11628', '1', '100', '0', '百味果炫杨桃新鲜水果甜杨洋桃现摘现发5斤', '180', '2018-05-08 17:06', '0', '杨桃', '40.00', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11629', '中国杨桃', '76.68', '77.73', '中国大陆', '11629', '5', '100', '0', '台湾进口杨桃礼盒6斤台湾特产孕妇新鲜水果热带水果节日送礼团购', '180', '2018-05-08 17:06', '0', '杨桃', '56.46', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11630', '中国杨桃', '51.60', '64.23', '中国大陆', '11630', '5', '100', '0', '美绿之约果园现摘大果甜杨桃当季热带孕妇水果包邮洋桃新鲜5斤装', '180', '2018-05-08 17:06', '0', '杨桃', '50.08', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11631', '中国杨桃', '46.92', '52.81', '中国大陆', '11631', '5', '100', '0', '海南新鲜杨桃水果甜洋桃生鲜应季时令水果酸甜批发低价多省包邮', '180', '2018-05-08 17:06', '0', '杨桃', '42.85', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11632', '中国杨桃', '41.21', '55.49', '中国大陆', '11632', '5', '100', '0', '【现货】杨桃5斤装广东杨桃新鲜水果产地现摘现发农家新鲜甜阳桃', '180', '2018-05-08 17:06', '0', '杨桃', '40.43', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11633', '中国杨桃', '74.14', '78.55', '中国大陆', '11633', '5', '100', '0', '【果美妙】杨桃5斤装大果广东杨桃新鲜水果包邮新鲜阳桃产地采摘', '180', '2018-05-08 17:06', '0', '杨桃', '42.65', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11634', '中国杨桃', '75.89', '78.29', '中国大陆', '11634', '5', '100', '0', '【果美妙】杨桃2.5斤装新鲜采摘包邮热带水果营养多汁农家甜阳桃', '180', '2018-05-08 17:06', '0', '杨桃', '63.30', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11635', '中国杨桃', '56.77', '79.29', '中国大陆', '11635', '4', '100', '0', '5斤装海南三亚新鲜杨桃洋桃五棱子个大肉厚包邮新鲜水果', '180', '2018-05-08 17:06', '0', '杨桃', '47.49', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11636', '中国杨桃', '54.43', '57.87', '中国大陆', '11636', '4', '100', '0', '帝鸿农 杨桃2个阳桃洋桃热带水果新鲜水果', '180', '2018-05-08 17:06', '0', '杨桃', '42.07', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11637', '中国杨桃', '42.94', '43.35', '中国大陆', '11637', '5', '100', '0', '甜果爱 热带农家孕妇水果包邮新鲜12个装批发包邮现摘现发清甜', '180', '2018-05-08 17:06', '0', '杨桃', '40.26', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11638', '中国杨桃', '66.37', '75.14', '中国大陆', '11638', '4', '100', '0', '【送2斤】新鲜杨桃水果甜洋桃生鲜应季时令酸甜批发低价共5斤包邮', '180', '2018-05-08 17:06', '0', '杨桃', '59.52', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11639', '中国杨桃', '44.61', '50.42', '中国大陆', '11639', '3', '100', '0', '现摘杨桃3斤装6', '180', '2018-05-08 17:06', '0', '杨桃', '42.13', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11640', '中国杨桃', '68.93', '70.45', '中国大陆', '11640', '5', '100', '0', '刘老根杨桃5斤包邮新鲜水果农家洋桃特产现摘现发孕妇宝宝水果', '180', '2018-05-08 17:06', '0', '杨桃', '67.01', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11677', '中国红毛丹', '65.44', '75.03', '中国大陆', '11677', '3', '100', '0', '航空发货海南三亚陵水特产红毛丹新鲜时令热带水果毛荔枝3斤装', '180', '2018-05-08 17:06', '0', '红毛丹/毛荔枝', '40.86', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11678', '中国红毛丹', '44.53', '77.31', '中国大陆', '11678', '3', '100', '0', '歌慕 泰国进口红毛丹 毛荔枝东南亚当季新鲜热带水果包邮', '180', '2018-05-08 17:06', '0', '红毛丹/毛荔枝', '44.12', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11679', '中国红毛丹', '79.17', '79.88', '中国大陆', '11679', '3', '100', '0', '泰国红毛丹水新鲜包邮毛荔枝稀奇古怪水果3斤送1斤红牡丹非越南', '180', '2018-05-08 17:06', '0', '红毛丹/毛荔枝', '67.57', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11680', '中国红毛丹', '58.23', '78.09', '中国大陆', '11680', '3', '100', '0', '海南三亚 金镶玉树上熟红毛丹5斤 毛荔枝 新鲜水果海南红毛丹顺丰', '180', '2018-05-08 17:07', '0', '红毛丹/毛荔枝', '55.03', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11681', '中国红毛丹', '56.53', '77.36', '中国大陆', '11681', '5', '100', '0', '红毛丹新鲜水果海南毛荔枝应季毛丹非泰国水果4斤顺丰包邮', '180', '2018-05-08 17:07', '0', '红毛丹/毛荔枝', '49.83', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11682', '中国红毛丹', '50.39', '56.92', '中国大陆', '11682', '5', '100', '0', '现货泰国进口红毛丹 毛荔枝东南亚当季新鲜热带水果3斤顺丰速运', '180', '2018-05-08 17:07', '0', '红毛丹/毛荔枝', '41.07', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11683', '中国红毛丹', '45.36', '65.83', '中国大陆', '11683', '4', '100', '0', '红毛丹 1500g 新鲜红毛丹/毛荔枝应季水果1500g 顺丰 XF', '180', '2018-05-08 17:07', '0', '红毛丹/毛荔枝', '40.13', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11684', '中国红毛丹', '62.88', '63.86', '中国大陆', '11684', '5', '100', '0', '新鲜红毛丹  泰国红毛丹毛荔枝红皮果 非海南 热带应季水果5斤', '180', '2018-05-08 17:07', '0', '红毛丹/毛荔枝', '61.10', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11685', '中国红毛丹', '55.78', '63.98', '中国大陆', '11685', '5', '100', '0', '红毛丹新鲜水果红毛丹毛荔枝金镶玉树上熟空运', '180', '2018-05-08 17:07', '0', '红毛丹/毛荔枝', '49.08', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11686', '中国红毛丹', '75.84', '79.18', '中国大陆', '11686', '5', '100', '0', '【惠淘赠果】红毛丹水果 新鲜水果 红毛丹5斤装 毛荔枝', '180', '2018-05-08 17:07', '0', '红毛丹/毛荔枝', '73.45', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11687', '中国红毛丹', '57.96', '58.89', '中国大陆', '11687', '5', '91', '0', '【果透】包邮 5斤装泰国进口水果新鲜红毛丹 新鲜水果 毛荔枝', '180', '2018-05-08 17:07', '1526568076260', '红毛丹/毛荔枝', '47.12', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11688', '中国红毛丹', '72.48', '79.64', '中国大陆', '11688', '5', '100', '0', '帝鸿农 泰国红毛丹2斤 红毛果 毛荔枝 新鲜', '180', '2018-05-08 17:07', '0', '红毛丹/毛荔枝', '71.83', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11689', '中国红毛丹', '55.82', '75.50', '中国大陆', '11689', '4', '100', '0', '5斤装海南三亚红毛丹新鲜热带水果多汁毛荔枝精选', '180', '2018-05-08 17:07', '0', '红毛丹/毛荔枝', '46.92', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11690', '中国红毛丹', '70.48', '74.84', '中国大陆', '11690', '4', '100', '0', '7斤三亚红毛丹新鲜 金镶玉树上熟毛荔枝 海南新鲜水果特产', '180', '2018-05-08 17:07', '0', '红毛丹/毛荔枝', '69.58', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11691', '中国红毛丹', '71.39', '74.89', '中国大陆', '11691', '4', '100', '0', '优霸 泰国红毛丹 3斤 新鲜毛荔枝  泡沫箱冷链 进口新鲜水果', '180', '2018-05-08 17:07', '0', '红毛丹/毛荔枝', '59.31', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11692', '中国红毛丹', '76.74', '77.28', '中国大陆', '11692', '5', '100', '0', '鲜蜂队 泰国红毛丹 新鲜红毛丹/毛荔枝应季水果1500g 顺丰包邮', '180', '2018-05-08 17:07', '0', '红毛丹/毛荔枝', '49.71', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11693', '中国红毛丹', '78.35', '79.90', '中国大陆', '11693', '5', '100', '0', '泰国红毛丹3斤进口新鲜水果顺丰空运包邮应季孕妇营养 毛荔枝清甜', '180', '2018-05-08 17:07', '0', '红毛丹/毛荔枝', '59.29', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11694', '中国红毛丹', '79.52', '79.79', '中国大陆', '11694', '4', '100', '0', '5斤 海南三亚红毛丹新鲜毛荔枝金镶玉树上熟热带水果 包邮', '180', '2018-05-08 17:07', '0', '红毛丹/毛荔枝', '50.09', '爬虫抓取');
INSERT INTO `fruits` VALUES ('11695', '中国红毛丹', '77.60', '79.59', '中国大陆', '11695', '5', '99', '0', '【飞猴】泰国进口新鲜红毛丹毛荔枝2斤不常见稀奇古怪的水果', '180', '2018-05-08 17:07', '1527590948497', '红毛丹/毛荔枝', '45.29', '爬虫抓取');

-- ----------------------------
-- Table structure for `items`
-- ----------------------------
DROP TABLE IF EXISTS `items`;
CREATE TABLE `items` (
  `item_id` int(20) NOT NULL AUTO_INCREMENT,
  `orders_id` varchar(30) NOT NULL,
  `fruit_id` int(20) NOT NULL,
  `fruit_price` float(8,2) DEFAULT NULL,
  `fruit_name` varchar(20) DEFAULT NULL,
  `amount` int(4) NOT NULL COMMENT '数量',
  `count` float(10,2) NOT NULL COMMENT '小计',
  `com_states` int(11) DEFAULT '0' COMMENT '0默认未评价，1 为评价',
  PRIMARY KEY (`item_id`),
  KEY `fruit_id` (`fruit_id`),
  KEY `orders_id` (`orders_id`),
  CONSTRAINT `items_ibfk_2` FOREIGN KEY (`fruit_id`) REFERENCES `fruits` (`fruit_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `items_ibfk_3` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`orders_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of items
-- ----------------------------
INSERT INTO `items` VALUES ('29', '201712212136441', '10000', '70.50', '苹果', '1', '70.00', '1');
INSERT INTO `items` VALUES ('30', '201712212136441', '10006', '45.00', '百香果', '1', '45.00', '1');
INSERT INTO `items` VALUES ('31', '201712212157571', '10021', '60.00', '菠萝', '2', '120.00', '1');
INSERT INTO `items` VALUES ('32', '201712212200081', '10005', '89.80', '橙子', '2', '180.00', '1');
INSERT INTO `items` VALUES ('33', '201712221143481', '10010', '33.30', '蓝莓', '2', '67.00', '1');
INSERT INTO `items` VALUES ('34', '201712221143481', '10013', '89.22', '香蕉', '2', '178.00', '1');
INSERT INTO `items` VALUES ('35', '201712221143481', '10014', '212.50', '榴莲', '2', '425.00', '1');
INSERT INTO `items` VALUES ('36', '201712221143481', '10015', '178.00', '菠萝蜜', '2', '356.00', '1');
INSERT INTO `items` VALUES ('37', '201712221143481', '10020', '22.20', '柠檬', '6', '133.00', '1');
INSERT INTO `items` VALUES ('38', '201712221143481', '10023', '33.90', '枇杷', '2', '68.00', '1');
INSERT INTO `items` VALUES ('39', '201712221151201', '10008', '65.40', '桃子', '1', '65.00', '1');
INSERT INTO `items` VALUES ('40', '201712221151201', '10021', '60.00', '菠萝', '6', '360.00', '1');
INSERT INTO `items` VALUES ('41', '201712221151201', '10022', '25.50', '草莓', '21', '535.00', '1');
INSERT INTO `items` VALUES ('42', '201712222228231', '10006', '45.00', '百香果', '5', '225.00', '1');
INSERT INTO `items` VALUES ('43', '201712222228231', '10010', '33.30', '蓝莓', '3', '100.00', '1');
INSERT INTO `items` VALUES ('44', '201712222228231', '10018', '156.20', '释迦果/番荔枝', '3', '469.00', '1');
INSERT INTO `items` VALUES ('45', '201712222228231', '10023', '33.90', '枇杷', '1', '34.00', '1');
INSERT INTO `items` VALUES ('46', '201712222248391', '10020', '22.20', '柠檬', '1', '22.00', '1');
INSERT INTO `items` VALUES ('47', '201712232250471', '10012', '17.40', '葡萄', '1', '17.00', '1');
INSERT INTO `items` VALUES ('48', '201712232250471', '10018', '156.20', '释迦果/番荔枝', '2', '312.00', '1');
INSERT INTO `items` VALUES ('49', '201712232250471', '10019', '45.20', '车厘子/樱桃', '2', '90.00', '1');
INSERT INTO `items` VALUES ('50', '201712232250471', '10021', '60.00', '菠萝', '2', '120.00', '1');
INSERT INTO `items` VALUES ('51', '201712232250471', '10023', '33.90', '枇杷', '1', '34.00', '1');
INSERT INTO `items` VALUES ('52', '201712261523131', '10011', '30.20', '椰子', '1', '30.00', '1');
INSERT INTO `items` VALUES ('53', '201712261523131', '10019', '45.20', '车厘子/樱桃', '1', '45.00', '1');
INSERT INTO `items` VALUES ('54', '201712261523131', '10020', '22.20', '柠檬', '3', '67.00', '1');
INSERT INTO `items` VALUES ('55', '201712262006121', '10006', '45.00', '百香果', '1', '45.00', '1');
INSERT INTO `items` VALUES ('56', '201712262006121', '10018', '156.20', '释迦果/番荔枝', '1', '156.00', '1');
INSERT INTO `items` VALUES ('57', '201712222247501', '10020', '22.20', '柠檬', '1', '22.00', '1');
INSERT INTO `items` VALUES ('58', '201712222247501', '10021', '60.00', '菠萝', '1', '60.00', '1');
INSERT INTO `items` VALUES ('59', '201712301122021', '10008', '65.40', '桃子', '1', '65.00', '1');
INSERT INTO `items` VALUES ('60', '201712301438171', '10012', '17.40', '葡萄', '4', '70.00', '1');
INSERT INTO `items` VALUES ('61', '201712301438171', '10013', '89.22', '香蕉', '1', '89.00', '1');
INSERT INTO `items` VALUES ('62', '201801071308501', '10011', '30.20', '椰子', '1', '30.20', '1');
INSERT INTO `items` VALUES ('63', '201801071308501', '10012', '17.40', '葡萄', '3', '52.20', '1');
INSERT INTO `items` VALUES ('64', '201801071308501', '10013', '89.22', '香蕉', '4', '356.88', '1');
INSERT INTO `items` VALUES ('65', '201801071308501', '10019', '45.20', '车厘子/樱桃', '5', '226.00', '1');
INSERT INTO `items` VALUES ('66', '201801072046372', '10011', '30.20', '椰子', '1', '30.20', '0');
INSERT INTO `items` VALUES ('67', '201801072046372', '10019', '45.20', '车厘子/樱桃', '2', '90.40', '0');
INSERT INTO `items` VALUES ('68', '201801072046372', '10020', '22.20', '柠檬', '2', '44.40', '0');
INSERT INTO `items` VALUES ('69', '201801072046372', '10021', '60.00', '菠萝', '1', '60.00', '0');
INSERT INTO `items` VALUES ('70', '201801091603071', '10012', '17.40', '葡萄', '2', '34.80', '1');
INSERT INTO `items` VALUES ('71', '201801091603071', '10013', '89.22', '香蕉', '1', '89.22', '1');
INSERT INTO `items` VALUES ('72', '201801091603071', '10018', '156.20', '释迦果/番荔枝', '1', '156.20', '1');
INSERT INTO `items` VALUES ('73', '201801141800231', '10024', '19.90', '琯溪蜜柚', '1', '19.90', '1');
INSERT INTO `items` VALUES ('74', '201801141800231', '10025', '49.99', '新西兰车厘子樱桃 ', '1', '49.99', '1');
INSERT INTO `items` VALUES ('75', '201801141800231', '10026', '45.00', '进口红提', '1', '45.00', '1');
INSERT INTO `items` VALUES ('76', '201801141800231', '10027', '200.00', '华盛顿加力果', '1', '200.00', '1');
INSERT INTO `items` VALUES ('77', '201801141800231', '10028', '39.02', '青芒果', '1', '39.02', '1');
INSERT INTO `items` VALUES ('78', '201801152041171', '10024', '19.90', '琯溪蜜柚', '1', '19.90', '1');
INSERT INTO `items` VALUES ('79', '201801152041171', '10025', '49.99', '新西兰车厘子樱桃 ', '1', '49.99', '1');
INSERT INTO `items` VALUES ('80', '201801152041171', '10026', '45.00', '进口红提', '1', '45.00', '1');
INSERT INTO `items` VALUES ('81', '20180115232324987654321', '10008', '65.40', '桃子', '2', '130.80', '0');
INSERT INTO `items` VALUES ('82', '20180115232324987654321', '10026', '45.00', '进口红提', '5', '225.00', '0');
INSERT INTO `items` VALUES ('83', '201801152334515237353', '10016', '43.60', '甘蔗', '1', '43.60', '1');
INSERT INTO `items` VALUES ('84', '201801152334515237353', '10017', '100.00', '柚子', '1', '100.00', '1');
INSERT INTO `items` VALUES ('85', '201801152334515237353', '10018', '156.20', '释迦果', '1', '156.20', '0');
INSERT INTO `items` VALUES ('86', '201801152334515237353', '10019', '45.20', '车厘子', '1', '45.20', '0');
INSERT INTO `items` VALUES ('87', '2018011523540812323', '10003', '27.90', '火龙果', '1', '27.90', '0');
INSERT INTO `items` VALUES ('88', '2018011523540812323', '10016', '43.60', '甘蔗', '1', '43.60', '0');
INSERT INTO `items` VALUES ('89', '2018011523540812323', '10023', '33.90', '枇杷', '1', '33.90', '0');
INSERT INTO `items` VALUES ('90', '2018011523540812323', '10024', '19.90', '琯溪蜜柚', '1', '19.90', '0');
INSERT INTO `items` VALUES ('91', '2018011523540812323', '10025', '49.99', '新西兰车厘子樱桃 ', '1', '49.99', '0');
INSERT INTO `items` VALUES ('92', '20180116225644123456780', '10024', '19.90', '琯溪蜜柚', '1', '19.90', '0');
INSERT INTO `items` VALUES ('93', '201803122111271', '10012', '17.40', '葡萄', '3', '52.20', '1');
INSERT INTO `items` VALUES ('94', '201801042107451', '10012', '17.40', '葡萄', '2', '34.80', '1');
INSERT INTO `items` VALUES ('95', '201801042107451', '10013', '89.22', '香蕉', '5', '446.10', '1');
INSERT INTO `items` VALUES ('96', '201801042107451', '10019', '45.20', '车厘子', '5', '226.00', '1');
INSERT INTO `items` VALUES ('97', '201803122220081', '10019', '45.20', '车厘子', '1', '45.20', '1');
INSERT INTO `items` VALUES ('98', '201803122220081', '10047', '75.00', '车厘子', '2', '150.00', '1');
INSERT INTO `items` VALUES ('99', '201803122220081', '10048', '30.00', '鲜红大苹果', '1', '30.00', '1');
INSERT INTO `items` VALUES ('100', '201804301716311', '10007', '29.00', '石榴', '1', '29.00', '1');
INSERT INTO `items` VALUES ('101', '201804261403071', '10014', '212.50', '榴莲', '1', '212.50', '1');
INSERT INTO `items` VALUES ('102', '201804261403071', '10048', '30.00', '鲜红大苹果', '4', '120.00', '1');
INSERT INTO `items` VALUES ('103', '201804261403071', '10054', '35.50', '火龙果', '3', '106.50', '1');
INSERT INTO `items` VALUES ('104', '201805011402441', '10049', '45.00', '柿饼', '2', '90.00', '1');
INSERT INTO `items` VALUES ('105', '201805011402441', '10053', '27.50', '哈蜜瓜', '1', '27.50', '1');
INSERT INTO `items` VALUES ('106', '201805011147381', '10048', '30.00', '鲜红大苹果', '1', '30.00', '1');
INSERT INTO `items` VALUES ('107', '201804301644511', '10014', '212.50', '榴莲', '1', '212.50', '1');
INSERT INTO `items` VALUES ('108', '201804301644511', '10048', '30.00', '鲜红大苹果', '4', '120.00', '1');
INSERT INTO `items` VALUES ('109', '201804301644511', '10054', '35.50', '火龙果', '3', '106.50', '1');
INSERT INTO `items` VALUES ('110', '201804301641451', '10014', '212.50', '榴莲', '1', '212.50', '1');
INSERT INTO `items` VALUES ('111', '201804301641451', '10048', '30.00', '鲜红大苹果', '4', '120.00', '1');
INSERT INTO `items` VALUES ('112', '201804301641451', '10054', '35.50', '火龙果', '3', '106.50', '1');
INSERT INTO `items` VALUES ('113', '201805121852271', '10055', '42.80', '红蛇果', '7', '299.60', '1');
INSERT INTO `items` VALUES ('114', '201805121852271', '10056', '29.99', '麒麟瓜', '5', '149.95', '1');
INSERT INTO `items` VALUES ('115', '201805121907141', '10006', '45.00', '百香果', '4', '180.00', '1');
INSERT INTO `items` VALUES ('116', '201805121907141', '10009', '23.30', '芒果', '4', '93.20', '1');
INSERT INTO `items` VALUES ('117', '201805121936371', '10006', '45.00', '百香果', '4', '180.00', '1');
INSERT INTO `items` VALUES ('118', '201805121955221', '10009', '23.30', '芒果', '4', '93.20', '1');
INSERT INTO `items` VALUES ('119', '201712222230551', '10018', '156.20', '释迦果', '1', '156.20', '1');
INSERT INTO `items` VALUES ('120', '201712222230551', '10019', '45.20', '车厘子', '1', '45.20', '1');
INSERT INTO `items` VALUES ('121', '201712222230551', '10020', '22.20', '柠檬', '1', '22.20', '1');
INSERT INTO `items` VALUES ('122', '201712222230551', '10021', '60.00', '菠萝', '1', '60.00', '1');
INSERT INTO `items` VALUES ('123', '201805181050531', '10026', '45.00', '进口红提', '3', '135.00', '1');
INSERT INTO `items` VALUES ('124', '201805181050531', '10036', '21.90', '湖南冰糖橙', '3', '65.70', '1');
INSERT INTO `items` VALUES ('125', '201805181110541', '10009', '23.30', '芒果', '1', '23.30', '0');
INSERT INTO `items` VALUES ('126', '201805181110541', '10010', '33.30', '蓝莓', '1', '33.30', '0');
INSERT INTO `items` VALUES ('127', '201805181110541', '10474', '48.33', '成都市柠檬', '1', '48.33', '0');
INSERT INTO `items` VALUES ('128', '201805181311151', '10000', '70.50', '苹果', '2', '141.00', '0');
INSERT INTO `items` VALUES ('129', '201805181311151', '10001', '25.50', '猕猴桃', '1', '25.50', '1');
INSERT INTO `items` VALUES ('130', '201805181311151', '11687', '57.96', '中国红毛丹', '2', '115.92', '1');
INSERT INTO `items` VALUES ('131', '201805211047461', '10008', '65.40', '桃子', '9', '588.60', '1');
INSERT INTO `items` VALUES ('132', '201805211047461', '10010', '33.30', '蓝莓', '3', '99.90', '1');
INSERT INTO `items` VALUES ('133', '201805211047461', '10013', '89.22', '香蕉', '2', '178.44', '0');
INSERT INTO `items` VALUES ('134', '201805211047461', '11687', '57.96', '中国红毛丹', '3', '173.88', '0');
INSERT INTO `items` VALUES ('135', '201805211047461', '11695', '77.60', '中国红毛丹', '1', '77.60', '0');
INSERT INTO `items` VALUES ('136', '201805222108191', '10002', '17.60', '龙眼/桂圆', '1', '17.60', '0');
INSERT INTO `items` VALUES ('137', '201805222108191', '10003', '27.90', '火龙果', '1', '27.90', '0');
INSERT INTO `items` VALUES ('138', '201805222108191', '10013', '89.22', '香蕉', '1', '89.22', '0');
INSERT INTO `items` VALUES ('139', '201805222108191', '10169', '74.38', '中国牛油果', '1', '74.38', '0');
INSERT INTO `items` VALUES ('140', '201805222108191', '10486', '42.26', '中国椰青', '4', '169.04', '0');
INSERT INTO `items` VALUES ('141', '201805222107131', '10002', '17.60', '龙眼/桂圆', '1', '17.60', '0');
INSERT INTO `items` VALUES ('142', '201805222107131', '10003', '27.90', '火龙果', '1', '27.90', '0');
INSERT INTO `items` VALUES ('143', '201805222107131', '10013', '89.22', '香蕉', '1', '89.22', '0');
INSERT INTO `items` VALUES ('144', '201805222107131', '10169', '74.38', '中国牛油果', '1', '74.38', '0');
INSERT INTO `items` VALUES ('145', '201805222107131', '10486', '42.26', '中国椰青', '4', '169.04', '0');
INSERT INTO `items` VALUES ('146', '201805222316171', '10033', '20.90', '赣南脐橙', '2', '41.80', '0');
INSERT INTO `items` VALUES ('147', '201805222318101', '10160', '63.02', '中国牛油果', '2', '126.04', '0');
INSERT INTO `items` VALUES ('148', '201805222318101', '10169', '74.38', '中国牛油果', '2', '148.76', '0');
INSERT INTO `items` VALUES ('150', '201805222326441', '10001', '25.50', '猕猴桃', '1', '25.50', '0');
INSERT INTO `items` VALUES ('151', '201805222329531', '10007', '29.00', '石榴', '1', '29.00', '0');
INSERT INTO `items` VALUES ('152', '201805222344521', '10600', '54.30', '中国龙眼', '1', '54.30', '0');
INSERT INTO `items` VALUES ('153', '201805222347441', '10160', '63.02', '中国牛油果', '1', '63.02', '0');
INSERT INTO `items` VALUES ('154', '201805222349581', '10169', '74.38', '中国牛油果', '1', '74.38', '0');
INSERT INTO `items` VALUES ('155', '201805222351051', '10000', '70.50', '苹果', '3', '211.50', '0');
INSERT INTO `items` VALUES ('156', '201805222351051', '10001', '25.50', '猕猴桃', '2', '51.00', '0');
INSERT INTO `items` VALUES ('157', '201805222351051', '10474', '48.33', '成都市柠檬', '1', '48.33', '0');
INSERT INTO `items` VALUES ('158', '201805222351051', '11687', '57.96', '中国红毛丹', '3', '173.88', '0');
INSERT INTO `items` VALUES ('159', '201805230917321', '10002', '17.60', '龙眼/桂圆', '1', '17.60', '0');
INSERT INTO `items` VALUES ('160', '201805230917321', '10169', '74.38', '中国牛油果', '1', '74.38', '0');
INSERT INTO `items` VALUES ('161', '201805230918301', '10160', '63.02', '中国牛油果', '4', '252.08', '0');
INSERT INTO `items` VALUES ('162', '201805291821561', '10006', '45.00', '百香果', '1', '45.00', '1');
INSERT INTO `items` VALUES ('163', '201805302208305237353', '10002', '17.60', '龙眼/桂圆', '1', '17.60', '0');
INSERT INTO `items` VALUES ('164', '201805302208305237353', '10156', '72.48', '中国牛油果', '1', '72.48', '0');
INSERT INTO `items` VALUES ('165', '201805302208305237353', '10158', '58.05', '中国牛油果', '1', '58.05', '0');
INSERT INTO `items` VALUES ('166', '201805302208305237353', '10160', '63.02', '中国牛油果', '1', '63.02', '0');
INSERT INTO `items` VALUES ('167', '201805302208305237353', '10169', '74.38', '中国牛油果', '1', '74.38', '0');
INSERT INTO `items` VALUES ('168', '201805302208305237353', '10474', '48.33', '成都市柠檬', '1', '48.33', '0');
INSERT INTO `items` VALUES ('169', '201805302208305237353', '11695', '77.60', '中国红毛丹', '1', '77.60', '0');
INSERT INTO `items` VALUES ('170', '201805310908035237353', '10156', '72.48', '中国牛油果', '2', '144.96', '1');
INSERT INTO `items` VALUES ('171', '201805310908035237353', '10169', '74.38', '中国牛油果', '1', '74.38', '0');
INSERT INTO `items` VALUES ('172', '201805310908035237353', '11687', '57.96', '中国红毛丹', '1', '57.96', '1');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `orders_id` varchar(30) NOT NULL,
  `users_id` varchar(20) NOT NULL,
  `order_time` varchar(20) NOT NULL,
  `phone` varchar(11) DEFAULT NULL COMMENT '联系人',
  `address` varchar(100) DEFAULT NULL COMMENT '收货地址',
  `man` varchar(20) DEFAULT NULL COMMENT '收货人',
  `get_states` int(11) NOT NULL DEFAULT '0' COMMENT '收货状态 0 未收货， 1已收货',
  `out_states` int(2) NOT NULL DEFAULT '0' COMMENT '0未发货，1已发货',
  `express` varchar(20) DEFAULT NULL COMMENT '快递单号',
  `pay_states` int(2) NOT NULL DEFAULT '0' COMMENT '0未支付，1支付',
  `tempinfo` varchar(200) DEFAULT NULL COMMENT '订单信息临时储存信息，支付了将信息拆解到订到详情',
  `total` float(10,2) DEFAULT '0.00' COMMENT '总金额',
  `callnumber` int(2) NOT NULL DEFAULT '0' COMMENT '催单次数',
  `cancal_order` int(2) DEFAULT '0' COMMENT '取消订单 0为 不取消 1 为取消',
  `check_cancal_order` int(2) DEFAULT '0' COMMENT '管理员 审核状态 1 通过  0 不通过',
  PRIMARY KEY (`orders_id`),
  KEY `users_id` (`users_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `users` (`users_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('201712212136441', '1', '2017-11-21 21:36:44', '1577969158', '江西省吉安市沙村镇新华村4组', '一刀大师熊', '0', '1', '5015155546313170', '1', '10000,1a10006,1a', '115.50', '0', '0', '0');
INSERT INTO `orders` VALUES ('201712212157571', '1', '2017-11-21 21:57:57', '', '', '', '0', '1', '3215155690308311', '1', '10021,2a', '120.00', '9', '0', '0');
INSERT INTO `orders` VALUES ('201712212200081', '1', '2017-11-21 22:00:08', '1577969158', '江西省吉安市沙村镇新华村4组', '一刀大师熊', '1', '1', '4115155535239039', '1', '10005,2a', '179.60', '0', '0', '0');
INSERT INTO `orders` VALUES ('201712221143481', '1', '2017-10-22 11:43:48', '1577969158', '江西省吉安市沙村镇新华村4组', '一刀大师熊', '1', '1', '1215155535605843', '1', '10010,2a10013,2a10014,2a10015,2a10020,6a10023,2a', '1227.04', '0', '0', '0');
INSERT INTO `orders` VALUES ('201712221151201', '1', '2017-10-22 11:51:20', '1577969158', '江西省吉安市沙村镇新华村4组', '一刀大师熊', '0', '1', '6215155545069126', '1', '10008,1a10021,6a10022,21a', '960.90', '0', '0', '0');
INSERT INTO `orders` VALUES ('201712222228231', '1', '2017-10-22 22:28:23', '1577969158', '江西省吉安市沙村镇新华村4组', '一刀大师熊', '1', '1', '1115155535484388', '1', '10006,5a10010,3a10018,3a10023,1a', '827.40', '0', '0', '0');
INSERT INTO `orders` VALUES ('201712222230551', '1', '2017-9-22 22:30:55', '15779691583', '江西省高安市人才镇', '一刀大师熊', '0', '0', null, '1', '10018,1a10019,1a10020,1a10021,1a', '283.60', '0', '0', '0');
INSERT INTO `orders` VALUES ('201712222247501', '1', '2017-9-22 22:47:50', '1577969158', '江西省吉安市沙村镇新华村4组', '一刀大师熊', '1', '1', '3915155535170975', '1', '10020,1a10021,1a', '82.20', '0', '0', '0');
INSERT INTO `orders` VALUES ('201712222248391', '1', '2017-12-22 22:48:39', '1577969158', '江西省吉安市沙村镇新华村4组', '一刀大师熊', '1', '1', '1315170374765509', '1', '10020,1a', '22.20', '3', '0', '0');
INSERT INTO `orders` VALUES ('201712232250471', '1', '2017-8-23 22:50:47', '1577969158', '江西省吉安市沙村镇新华村4组', '一刀大师熊', '1', '0', '', '1', '10012,1a10018,2a10019,2a10021,2a10023,1a', '574.10', '2', '0', '0');
INSERT INTO `orders` VALUES ('201712261523131', '1', '2017-7-26 15:23:13', '1577969158', '江西省吉安市沙村镇新华村4组', '一刀大师熊', '0', '1', '6615155540316831', '1', '10011,1a10019,1a10020,3a', '142.00', '0', '0', '0');
INSERT INTO `orders` VALUES ('201712262006121', '1', '2017-5-26 20:06:12', '1577969158', '江西省吉安市沙村镇新华村4组', '一刀大师熊', '0', '1', '9515155544949533', '1', '10006,1a10018,1a', '201.20', '0', '0', '0');
INSERT INTO `orders` VALUES ('201712301122021', '1', '2017-8-30 11:22:02', '1577969158', '江西省吉安市沙村镇新华村4组', '一刀大师熊', '1', '1', '7815155535124711', '1', '10008,1a', '65.40', '0', '0', '0');
INSERT INTO `orders` VALUES ('201712301438171', '1', '2017-7-30 14:38:17', '1577969158', '江西省上饶市玉山县下镇*******号', '占柳剑', '1', '1', '0915155535432578', '1', '10012,4a10013,1a', '158.82', '0', '0', '0');
INSERT INTO `orders` VALUES ('201801042107451', '1', '2018-01-04 21:07:45', '1577969158', '江西省吉安市沙村镇新华村4组', '一刀大师熊', '0', '0', null, '1', '10012,2a10013,5a10019,5a', '706.90', '0', '0', '0');
INSERT INTO `orders` VALUES ('201801071308501', '1', '2018-01-07 13:08:50', '1577969158', '江西省吉安市沙村镇新华村4组', '一刀大师熊', '1', '1', '4315155534483160', '1', '10011,1a10012,3a10013,4a10019,5a', '665.28', '0', '0', '0');
INSERT INTO `orders` VALUES ('201801072046372', '2', '2018-01-07 20:46:37', '13544617029', '江西九江市洞庭湖庐山镇中龙街道110号', '拜仁必胜', '0', '1', '3915155535077114', '1', '10011,1a10019,2a10020,2a10021,1a', '225.00', '0', '0', '0');
INSERT INTO `orders` VALUES ('201801091603071', '1', '2018-01-09 16:03:07', '1577969158', '江西省吉安市沙村镇新华村4组', '一刀大师熊', '0', '1', '8115155535282578', '1', '10012,2a10013,1a10018,1a', '280.22', '0', '0', '0');
INSERT INTO `orders` VALUES ('201801141800231', '1', '2018-01-14 18:00:23', '1577969158', '江西省吉安市沙村镇新华村4组', '一刀大师熊', '0', '0', null, '1', '10024,1a10025,1a10026,1a10027,1a10028,1a', '353.91', '5', '0', '0');
INSERT INTO `orders` VALUES ('201801152041171', '1', '2018-01-15 20:41:17', '1577969158', '江西省吉安市沙村镇新华村4组', '一刀大师熊', '1', '1', '0215255278617423', '1', '10024,1a10025,1a10026,1a', '114.89', '10', '0', '0');
INSERT INTO `orders` VALUES ('20180115232324987654321', '987654321', '2018-01-15 23:23:24', '15779669158', '江西省吉安市泰和县澄江镇***8栋1楼', '萌萌哒购物狂', '0', '1', '0215166268611296', '1', '10008,2a10026,5a', '355.80', '0', '0', '0');
INSERT INTO `orders` VALUES ('201801152334515237353', '5237353', '2018-01-15 23:34:51', '15779669158', '江西省宜春市*********5栋单元楼5号', '冬天不冷', '1', '1', '3715276899071179', '1', '10016,1a10017,1a10018,1a10019,1a', '345.00', '10', '0', '0');
INSERT INTO `orders` VALUES ('2018011523540812323', '12323', '2018-01-15 23:54:08', '15779669158', '上海市市*********5栋单元楼5号', '爱因斯坦', '0', '0', null, '1', '10003,1a10016,1a10023,1a10024,1a10025,1a', '175.29', '0', '0', '0');
INSERT INTO `orders` VALUES ('20180116225624123456780', '123456780', '2018-01-16 22:56:24', null, null, null, '0', '0', null, '0', '10024,1a', '0.00', '0', '1', '1');
INSERT INTO `orders` VALUES ('20180116225640123456780', '123456780', '2018-01-16 22:56:40', null, null, null, '0', '0', null, '0', '10024,1a', '0.00', '0', '1', '1');
INSERT INTO `orders` VALUES ('20180116225644123456780', '123456780', '2018-01-16 22:56:44', '18770613510', '江西省吉安市泰和县澄江镇白凤大道427号', '依依', '0', '1', '4215167584529141', '1', '10024,1a', '19.90', '0', '0', '0');
INSERT INTO `orders` VALUES ('201803122111271', '1', '2018-03-12 21:11:27', '1577969158', '江西省吉安市沙村镇新华村4组', '一刀大师熊', '1', '1', '3715258698662968', '1', '10012,3a', '52.20', '0', '0', '0');
INSERT INTO `orders` VALUES ('201803122220081', '1', '2018-03-12 22:20:08', '1577969158', '江西省吉安市沙村镇新华村4组', '一刀大师熊', '1', '1', '2615246691872528', '1', '10019,1a10047,2a10048,1a', '225.20', '0', '0', '0');
INSERT INTO `orders` VALUES ('201804261403071', '1', '2018-04-26 14:03:07', '1577969158', '江西省吉安市沙村镇新华村4组', '一刀大师熊', '0', '0', null, '1', '10014,1a10048,4a10054,3a', '439.00', '0', '1', '1');
INSERT INTO `orders` VALUES ('201804301641451', '1', '2018-04-30 16:41:45', '15779691583', '江西省高安市人才镇', '一刀大师熊', '0', '0', null, '1', '10014,1a10048,4a10054,3a', '439.00', '0', '1', '1');
INSERT INTO `orders` VALUES ('201804301644511', '1', '2018-04-30 16:44:51', '15779691583', '江西省高安市人才镇', '一刀大师熊', '0', '0', null, '1', '10014,1a10048,4a10054,3a', '439.00', '2', '0', '0');
INSERT INTO `orders` VALUES ('201804301716311', '1', '2018-04-30 17:16:31', '1577969158', '江西省吉安市沙村镇新华村4组', '一刀大师熊', '1', '0', null, '1', '10007,1a', '29.00', '0', '1', '1');
INSERT INTO `orders` VALUES ('201805011147381', '1', '2018-05-01 11:47:38', '15779691583', '江西省高安市人才镇', '一刀大师熊', '1', '1', '7415258714555844', '1', '10048,1a', '30.00', '10', '0', '0');
INSERT INTO `orders` VALUES ('201805011402441', '1', '2018-05-01 14:02:44', '15779691583', '江西省高安市人才镇', '一刀大师熊', '0', '1', '0615258702980012', '1', '10049,2a10053,1a', '117.50', '0', '0', '0');
INSERT INTO `orders` VALUES ('201805121852271', '1', '2018-05-12 18:52:27', '15779691583', '江西省高安市人才镇', '一刀大师熊', '0', '0', null, '1', '10055,7a10056,5a', '449.55', '1', '1', '1');
INSERT INTO `orders` VALUES ('201805121907141', '1', '2018-05-12 19:07:14', '15779691583', '江西省高安市人才镇', '一刀大师熊', '0', '1', '2415266202613995', '1', '10006,4a10009,4a', '273.20', '0', '0', '0');
INSERT INTO `orders` VALUES ('201805121936371', '1', '2018-05-12 19:36:37', '15779691583', '江西省高安市人才镇', '一刀大师熊', '1', '0', null, '1', '10006,4a', '180.00', '0', '1', '1');
INSERT INTO `orders` VALUES ('201805121955221', '1', '2018-05-12 19:55:22', '', '', '', '1', '1', '1415266202584157', '1', '10009,4a', '93.20', '0', '0', '0');
INSERT INTO `orders` VALUES ('201805181050531', '1', '2018-05-18 10:50:53', '15779691583', '江西省高安市人才镇', '一刀大师熊', '1', '1', '4015266119137625', '1', '10026,3a10036,3a', '200.70', '0', '0', '0');
INSERT INTO `orders` VALUES ('201805181110541', '1', '2018-05-18 11:10:54', '15779691583', '江西省高安市人才镇', '一刀大师熊', '0', '1', '3315266202480631', '1', '10009,1a10010,1a10474,1a', '104.93', '0', '0', '0');
INSERT INTO `orders` VALUES ('201805181134271', '1', '2018-05-18 11:34:27', null, null, null, '0', '0', null, '0', '10000,1a10001,1a10009,1a10010,1a10474,2a11687,1a', '0.00', '0', '1', '1');
INSERT INTO `orders` VALUES ('201805181311151', '1', '2018-05-18 13:11:15', '15779691583', '江西省高安市人才镇', '一刀大师熊', '1', '1', '5815266202908399', '1', '10000,2a10001,1a11687,2a', '282.42', '0', '0', '0');
INSERT INTO `orders` VALUES ('201805181956171', '1', '2018-05-18 19:56:17', null, null, null, '0', '0', null, '0', '10008,9a10010,3a10013,1a11687,3a11695,1a', '0.00', '0', '1', '1');
INSERT INTO `orders` VALUES ('201805211047461', '1', '2018-05-21 10:47:46', '15779691583', '江西省高安市人才镇', '一刀大师熊', '1', '1', '2515268708924758', '1', '10008,9a10010,3a10013,2a11687,3a11695,1a', '1118.42', '0', '0', '0');
INSERT INTO `orders` VALUES ('201805222107131', '1', '2018-05-22 21:07:13', '', '', '', '0', '0', null, '1', '10002,1a10003,1a10013,1a10169,1a10486,4a', '378.14', '0', '0', '0');
INSERT INTO `orders` VALUES ('201805222108191', '1', '2018-05-22 21:08:19', '15779691583', '江西省高安市人才镇', '一刀大师熊', '0', '0', null, '1', '10002,1a10003,1a10013,1a10169,1a10486,4a', '378.14', '0', '0', '0');
INSERT INTO `orders` VALUES ('201805222316171', '1', '2018-05-22 23:16:17', '', '', '', '0', '0', null, '1', '10033,2a', '41.80', '0', '0', '0');
INSERT INTO `orders` VALUES ('201805222318101', '1', '2018-05-22 23:18:10', '15779691583', '江西省高安市人才镇', '一刀大师熊', '0', '0', null, '1', '10160,2a10169,2a', '274.80', '0', '0', '0');
INSERT INTO `orders` VALUES ('201805222323541', '1', '2018-05-22 23:23:54', '15779691583', '江西省高安市人才镇', '一刀大师熊', '0', '0', null, '1', '10000,1a', '70.50', '0', '0', '0');
INSERT INTO `orders` VALUES ('201805222326441', '1', '2018-05-22 23:26:44', '15779691583', '江西省高安市人才镇', '一刀大师熊', '0', '0', null, '1', '10001,1a', '25.50', '0', '0', '0');
INSERT INTO `orders` VALUES ('201805222329531', '1', '2018-05-22 23:29:53', '15779691583', '江西省高安市人才镇', '一刀大师熊', '0', '0', null, '1', '10007,1a', '29.00', '0', '0', '0');
INSERT INTO `orders` VALUES ('201805222344521', '1', '2018-05-22 23:44:52', '15779691583', '江西省高安市人才镇', '一刀大师熊', '0', '0', null, '1', '10600,1a', '54.30', '0', '0', '0');
INSERT INTO `orders` VALUES ('201805222347441', '1', '2018-05-22 23:47:44', '15779691583', '江西省高安市人才镇', '一刀大师熊', '0', '0', null, '1', '10160,1a', '63.02', '0', '0', '0');
INSERT INTO `orders` VALUES ('201805222349581', '1', '2018-05-22 23:49:58', '15779691583', '江西省高安市人才镇', '一刀大师熊', '0', '0', null, '1', '10169,1a', '74.38', '0', '0', '0');
INSERT INTO `orders` VALUES ('201805222351051', '1', '2018-05-22 23:51:05', '15779691583', '江西省高安市人才镇', '一刀大师熊', '0', '0', null, '1', '10000,3a10001,2a10474,1a11687,3a', '484.71', '0', '0', '0');
INSERT INTO `orders` VALUES ('201805230917321', '1', '2018-05-23 09:17:32', '15779691583', '江西省高安市人才镇', '一刀大师熊', '0', '0', null, '1', '10002,1a10169,1a', '91.98', '0', '0', '0');
INSERT INTO `orders` VALUES ('201805230918301', '1', '2018-05-23 09:18:30', '15779691583', '江西省高安市人才镇', '一刀大师熊', '0', '0', null, '1', '10160,4a', '252.08', '0', '1', '0');
INSERT INTO `orders` VALUES ('201805231522171', '1', '2018-05-23 15:22:17', null, null, null, '0', '0', null, '0', '10002,1a10003,1a10156,1a10158,1a10600,2a', '0.00', '0', '1', '1');
INSERT INTO `orders` VALUES ('201805291821561', '1', '2018-05-29 18:21:56', '15779691583', '江西省高安市人才镇', '一刀大师熊', '1', '1', '6915275893474438', '1', '10006,1a', '45.00', '0', '0', '0');
INSERT INTO `orders` VALUES ('201805302208305237353', '5237353', '2018-05-30 22:08:30', '15779669158', '江西省宜春市*********5栋单元楼5号', '冬天不冷', '1', '0', null, '1', '10002,1a10156,1a10158,1a10160,1a10169,1a10474,1a11695,1a', '411.46', '0', '1', '1');
INSERT INTO `orders` VALUES ('201805310908035237353', '5237353', '2018-05-31 09:08:03', '15779669158', '江西省宜春市*********5栋单元楼5号', '冬天不冷', '1', '1', '9315277289024205', '1', '10156,2a10169,1a11687,1a', '277.30', '0', '0', '0');

-- ----------------------------
-- Table structure for `recodement`
-- ----------------------------
DROP TABLE IF EXISTS `recodement`;
CREATE TABLE `recodement` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userid` varchar(10) NOT NULL,
  `fruit_id` varchar(10) NOT NULL,
  `looknum` int(10) NOT NULL DEFAULT '1' COMMENT '浏览次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of recodement
-- ----------------------------
INSERT INTO `recodement` VALUES ('3', '1', '10025', '10');
INSERT INTO `recodement` VALUES ('4', '1', '11325', '3');
INSERT INTO `recodement` VALUES ('5', '1', '11683', '2');
INSERT INTO `recodement` VALUES ('6', '1', '10036', '3');
INSERT INTO `recodement` VALUES ('7', '1', '10026', '5');
INSERT INTO `recodement` VALUES ('8', '1', '10009', '1');
INSERT INTO `recodement` VALUES ('9', '1', '10474', '3');
INSERT INTO `recodement` VALUES ('10', '1', '10001', '7');
INSERT INTO `recodement` VALUES ('11', '1', '10018', '1');
INSERT INTO `recodement` VALUES ('12', '1', '11687', '9');
INSERT INTO `recodement` VALUES ('13', '1', '10008', '4');
INSERT INTO `recodement` VALUES ('14', '1', '11258', '1');
INSERT INTO `recodement` VALUES ('15', '1', '10024', '1');
INSERT INTO `recodement` VALUES ('16', '1', '10012', '1');
INSERT INTO `recodement` VALUES ('17', '1', '11319', '1');
INSERT INTO `recodement` VALUES ('18', '1', '10013', '2');
INSERT INTO `recodement` VALUES ('19', '1', '10043', '1');
INSERT INTO `recodement` VALUES ('20', '1', '10010', '2');
INSERT INTO `recodement` VALUES ('21', '1', '10486', '2');
INSERT INTO `recodement` VALUES ('22', '1', '10002', '6');
INSERT INTO `recodement` VALUES ('23', '1', '10033', '3');
INSERT INTO `recodement` VALUES ('24', '1', '10600', '6');
INSERT INTO `recodement` VALUES ('25', '1', '10000', '2');
INSERT INTO `recodement` VALUES ('26', '1', '10006', '6');
INSERT INTO `recodement` VALUES ('27', '1', '10007', '1');
INSERT INTO `recodement` VALUES ('28', '1', '10160', '1');
INSERT INTO `recodement` VALUES ('29', '1', '11027', '1');
INSERT INTO `recodement` VALUES ('30', '5237353', '10160', '2');
INSERT INTO `recodement` VALUES ('31', '5237353', '10156', '1');
INSERT INTO `recodement` VALUES ('32', '5237353', '10017', '1');
INSERT INTO `recodement` VALUES ('33', '5237353', '10016', '1');
INSERT INTO `recodement` VALUES ('34', '5237353', '11687', '3');
INSERT INTO `recodement` VALUES ('35', '5237353', '11695', '1');

-- ----------------------------
-- Table structure for `slideconfig`
-- ----------------------------
DROP TABLE IF EXISTS `slideconfig`;
CREATE TABLE `slideconfig` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `type` int(2) NOT NULL COMMENT '对应的是diction数据',
  `byId` int(13) NOT NULL COMMENT '特殊编号',
  `picname` varchar(20) NOT NULL COMMENT '图片名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of slideconfig
-- ----------------------------
INSERT INTO `slideconfig` VALUES ('1', '2', '10009', '10009_ (1).png');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `users_id` varchar(20) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `user_pass` varchar(20) NOT NULL,
  `user_phone` varchar(11) NOT NULL,
  `user_address` varchar(200) DEFAULT NULL,
  `user_time` varchar(30) NOT NULL COMMENT '用户注册时间',
  `ban_states` int(3) NOT NULL DEFAULT '0' COMMENT '0默认为不禁用 ，1为禁用',
  `money` float(12,2) DEFAULT '0.00',
  PRIMARY KEY (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '一刀大师熊', '12', '15779691583', '江西省高安市人才镇', '2017-12-21 21:36:44', '0', '21.86');
INSERT INTO `users` VALUES ('12', '123-123', '123-123', '1', '1', '2018-05-01 11:19:46', '0', '0.00');
INSERT INTO `users` VALUES ('12323', '爱因斯坦', '1', '15779669158', '上海市市*********5栋单元楼5号', '2018-01-15 23:53:45', '0', '0.00');
INSERT INTO `users` VALUES ('123456780', '依依', '5237353yi', '18770613510', '江西省吉安市泰和县澄江镇白凤大道427号', '2018-01-16 22:48:14', '0', '0.00');
INSERT INTO `users` VALUES ('123456789', '思想导管', '1', '15779669158', '北京市密云市*********上海路1栋4号', '2018-01-15 22:41:40', '0', '0.00');
INSERT INTO `users` VALUES ('2', '拜仁必胜', '1', '13544617029', '江西九江市洞庭湖庐山镇中龙街道110号', '2017-12-26 18:36:44', '0', '0.00');
INSERT INTO `users` VALUES ('5237353', '冬天不冷', '123', '15779669158', '江西省宜春市*********5栋单元楼5号', '2018-01-15 22:36:56', '0', '134.16');
INSERT INTO `users` VALUES ('7654321', '大哥', '7654321.', '1', '天津', '2018-05-01 11:14:44', '0', '0.00');
INSERT INTO `users` VALUES ('987654321', '萌萌哒购物狂', '1', '15779669158', '江西省吉安市泰和县澄江镇***8栋1楼', '2018-01-15 23:22:59', '0', '0.00');

-- ----------------------------
-- Procedure structure for `auto_xiajia`
-- ----------------------------
DROP PROCEDURE IF EXISTS `auto_xiajia`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `auto_xiajia`()
BEGIN
	update fruits set fruit_states =1 where 
  (fruit_date-datediff(curdate(),str_to_date(substring(fruit_time,1, 10), '%Y-%m-%d')))< 1
	or fruit_amount = 0;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `cancal_order_isNotPay_moreThanOneHour`
-- ----------------------------
DROP PROCEDURE IF EXISTS `cancal_order_isNotPay_moreThanOneHour`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cancal_order_isNotPay_moreThanOneHour`()
BEGIN
	#订单未支付超过1小时默认订单失效 将..cancal_order =1 .check_cancal_order =1 
	update orders set cancal_order =1 ,check_cancal_order =1  where 
  (datediff(NOW(),str_to_date(order_time, '%Y-%m-%d %H:%i:%s')))> 1 and pay_states = 0;
	

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `delete_conversiont_senve_day`
-- ----------------------------
DROP PROCEDURE IF EXISTS `delete_conversiont_senve_day`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_conversiont_senve_day`()
BEGIN
	delete from conversation where sendtime < date_sub(curdate(),interval 7 day);
END
;;
DELIMITER ;

-- ----------------------------
-- Event structure for `auto_cancal_order`
-- ----------------------------
DROP EVENT IF EXISTS `auto_cancal_order`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `auto_cancal_order` ON SCHEDULE EVERY 1 HOUR STARTS '2016-05-30 12:06:00' ON COMPLETION NOT PRESERVE ENABLE DO call cancal_order_isNotPay_moreThanOneHour()
;;
DELIMITER ;

-- ----------------------------
-- Event structure for `auto_xiajia`
-- ----------------------------
DROP EVENT IF EXISTS `auto_xiajia`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `auto_xiajia` ON SCHEDULE EVERY 1 DAY STARTS '2016-05-30 23:40:00' ON COMPLETION NOT PRESERVE ENABLE DO call auto_xiajia()
;;
DELIMITER ;

-- ----------------------------
-- Event structure for `event_delete_conversition_seven_day`
-- ----------------------------
DROP EVENT IF EXISTS `event_delete_conversition_seven_day`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `event_delete_conversition_seven_day` ON SCHEDULE EVERY 1 DAY STARTS '2016-05-11 11:40:00' ON COMPLETION NOT PRESERVE ENABLE DO call delete_conversiont_senve_day()
;;
DELIMITER ;
