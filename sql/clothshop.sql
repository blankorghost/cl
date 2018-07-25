/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : clothshop

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-06-25 10:30:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) NOT NULL COMMENT '管理员账号',
  `password` varchar(255) NOT NULL COMMENT '密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('1', 'sq', '123');
INSERT INTO `t_admin` VALUES ('2', '邹代发', '123456');
INSERT INTO `t_admin` VALUES ('3', 'daleyzou', '123456');

-- ----------------------------
-- Table structure for t_adminreply
-- ----------------------------
DROP TABLE IF EXISTS `t_adminreply`;
CREATE TABLE `t_adminreply` (
  `ar_id` int(11) NOT NULL AUTO_INCREMENT,
  `ar_adminid` int(11) DEFAULT NULL,
  `ar_adminname` varchar(255) DEFAULT NULL,
  `ar_rid` int(11) DEFAULT NULL,
  `ar_content` text,
  `ar_time` datetime DEFAULT NULL,
  PRIMARY KEY (`ar_id`),
  KEY `fka1` (`ar_adminid`),
  KEY `fka2` (`ar_rid`),
  CONSTRAINT `fka1` FOREIGN KEY (`ar_adminid`) REFERENCES `t_admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fka2` FOREIGN KEY (`ar_rid`) REFERENCES `t_reply` (`r_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_adminreply
-- ----------------------------

-- ----------------------------
-- Table structure for t_announcement
-- ----------------------------
DROP TABLE IF EXISTS `t_announcement`;
CREATE TABLE `t_announcement` (
  `a_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告编号',
  `a_title` varchar(50) NOT NULL COMMENT '公告标题',
  `a_content` text NOT NULL COMMENT '公告内容',
  `a_time` datetime NOT NULL COMMENT '发布时间',
  `a_settop` int(11) DEFAULT '0' COMMENT '是否置顶（值1为置顶）',
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_announcement
-- ----------------------------
INSERT INTO `t_announcement` VALUES ('1', '双11 潮流商城全场9折！', '又到一年一度的双11，潮流商城为庆祝双11，全场商品9折出售！', '2017-06-22 00:00:00', '0');

-- ----------------------------
-- Table structure for t_companyinfo
-- ----------------------------
DROP TABLE IF EXISTS `t_companyinfo`;
CREATE TABLE `t_companyinfo` (
  `c_name` varchar(255) NOT NULL COMMENT '公司名称',
  `c_adress` varchar(255) NOT NULL COMMENT '公司地址',
  `c_owner` varchar(255) NOT NULL COMMENT '公司所有人',
  `c_contact` int(11) NOT NULL COMMENT '联系电话',
  `c_email` varchar(50) NOT NULL COMMENT '邮箱',
  `c_bankname` varchar(255) NOT NULL COMMENT '银行户名',
  `c_bankurl` varchar(255) NOT NULL COMMENT '银行卡号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_companyinfo
-- ----------------------------

-- ----------------------------
-- Table structure for t_count
-- ----------------------------
DROP TABLE IF EXISTS `t_count`;
CREATE TABLE `t_count` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_sid` int(11) NOT NULL,
  PRIMARY KEY (`c_id`),
  KEY `fk11` (`c_sid`),
  CONSTRAINT `fk11` FOREIGN KEY (`c_sid`) REFERENCES `t_shopinfos` (`si_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_count
-- ----------------------------

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `o_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单编号',
  `o_userid` int(255) NOT NULL COMMENT '用户id',
  `o_shopname` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `o_shopid` int(11) NOT NULL COMMENT '商品id',
  `o_shopprice` double(10,0) NOT NULL COMMENT '价格',
  `o_nums` int(255) DEFAULT '1' COMMENT '数量',
  `o_time` datetime NOT NULL COMMENT '时间',
  `o_name` varchar(255) NOT NULL COMMENT '收货人姓名',
  `o_adress` varchar(255) NOT NULL COMMENT '收货地址',
  `o_phone` varchar(255) NOT NULL COMMENT '联系电话',
  `o_youbian` int(255) NOT NULL COMMENT '邮编',
  `o_payway` varchar(255) DEFAULT NULL COMMENT '支付方式',
  `o_carryway` varchar(255) DEFAULT NULL COMMENT '送货方式',
  `o_memo` varchar(255) DEFAULT NULL COMMENT '备注',
  `o_status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`o_id`),
  KEY `fk2` (`o_userid`),
  KEY `fk3` (`o_shopid`),
  CONSTRAINT `fk2` FOREIGN KEY (`o_userid`) REFERENCES `t_users` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk3` FOREIGN KEY (`o_shopid`) REFERENCES `t_shopinfos` (`si_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('4', '4', null, '7', '11', '1', '2017-06-23 18:02:19', '王五', '根据用户id查询该用户的所有订单', '18882070554', '610225', null, null, null, '4');
INSERT INTO `t_order` VALUES ('5', '3', null, '3', '11', '1', '2017-06-23 18:16:17', '打了一走', '发电公司对方感受到', '18882070554', '610225', null, null, null, '4');
INSERT INTO `t_order` VALUES ('6', '2', null, '33', '185', '1', '2017-06-23 00:00:00', '454', '42', '4222', '4242', null, null, '4242', '4');
INSERT INTO `t_order` VALUES ('7', '2', null, '41', '130', '1', '2017-06-23 00:00:00', '123', '123', '123', '123', null, null, '123', '0');
INSERT INTO `t_order` VALUES ('8', '2', null, '41', '130', '1', '2017-06-24 00:00:00', '123', '123', '123', '123', null, null, '123', '0');
INSERT INTO `t_order` VALUES ('9', '2', null, '41', '130', '1', '2017-06-24 00:00:00', '444', '444', '444', '444', null, null, '4444', '0');
INSERT INTO `t_order` VALUES ('10', '2', null, '45', '180', '1', '2017-06-24 00:00:00', 'sq', '123', '123', '123', null, null, '12313', '0');
INSERT INTO `t_order` VALUES ('11', '2', null, '45', '180', '1', '2017-06-24 00:00:00', 'asf', 'asdf', 'afasf', '444', null, null, '444', '0');
INSERT INTO `t_order` VALUES ('12', '15', null, '42', '120', '1', '2017-06-24 00:00:00', 'www', '123', '123', '123', null, null, '123', '4');

-- ----------------------------
-- Table structure for t_picture
-- ----------------------------
DROP TABLE IF EXISTS `t_picture`;
CREATE TABLE `t_picture` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_path` varchar(200) DEFAULT NULL COMMENT '图片路径',
  `p_sid` int(11) DEFAULT NULL COMMENT '关联商品id',
  `p_type` int(255) DEFAULT NULL COMMENT '图片类型  0',
  PRIMARY KEY (`p_id`),
  KEY `fk9` (`p_sid`),
  CONSTRAINT `fk9` FOREIGN KEY (`p_sid`) REFERENCES `t_shopinfos` (`si_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_picture
-- ----------------------------

-- ----------------------------
-- Table structure for t_reply
-- ----------------------------
DROP TABLE IF EXISTS `t_reply`;
CREATE TABLE `t_reply` (
  `r_id` int(20) NOT NULL AUTO_INCREMENT,
  `r_userid` int(20) DEFAULT NULL COMMENT '评论用户id',
  `r_username` varchar(255) DEFAULT NULL COMMENT '评论用户昵称',
  `r_shopid` int(11) DEFAULT NULL COMMENT '评论商品id',
  `r_content` varchar(255) DEFAULT NULL COMMENT '评论内容',
  `r_time` datetime DEFAULT NULL COMMENT '评论时间',
  PRIMARY KEY (`r_id`),
  KEY `fk4` (`r_userid`),
  KEY `fk5` (`r_shopid`),
  KEY `fka4` (`r_username`),
  CONSTRAINT `fk4` FOREIGN KEY (`r_userid`) REFERENCES `t_users` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk5` FOREIGN KEY (`r_shopid`) REFERENCES `t_shopinfos` (`si_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fka4` FOREIGN KEY (`r_username`) REFERENCES `t_users` (`u_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_reply
-- ----------------------------
INSERT INTO `t_reply` VALUES ('1', '3', '333', '2', 'aaaaa', '2017-06-23 00:00:00');
INSERT INTO `t_reply` VALUES ('2', '3', '333', '2', 'sdas ', '2017-06-23 00:00:00');
INSERT INTO `t_reply` VALUES ('4', '4', '我', '8', '12312312', '2017-06-23 00:00:00');
INSERT INTO `t_reply` VALUES ('6', '15', '888', '42', '123213', '2017-06-24 00:00:00');
INSERT INTO `t_reply` VALUES ('7', '2', '444', '33', '不错', '2017-06-24 00:00:00');

-- ----------------------------
-- Table structure for t_shopcart
-- ----------------------------
DROP TABLE IF EXISTS `t_shopcart`;
CREATE TABLE `t_shopcart` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '购物车编号',
  `c_shopid` int(11) NOT NULL COMMENT '商品id',
  `c_userid` int(11) NOT NULL COMMENT '用户id',
  `c_num` int(11) NOT NULL DEFAULT '1' COMMENT '数量',
  `c_time` datetime NOT NULL COMMENT '时间',
  PRIMARY KEY (`c_id`),
  KEY `fk6` (`c_userid`),
  KEY `fk7` (`c_shopid`),
  CONSTRAINT `fk6` FOREIGN KEY (`c_userid`) REFERENCES `t_users` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk7` FOREIGN KEY (`c_shopid`) REFERENCES `t_shopinfos` (`si_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_shopcart
-- ----------------------------
INSERT INTO `t_shopcart` VALUES ('1', '41', '2', '1', '2017-06-24 00:00:00');
INSERT INTO `t_shopcart` VALUES ('2', '41', '2', '1', '2017-06-24 00:00:00');
INSERT INTO `t_shopcart` VALUES ('3', '41', '2', '1', '2017-06-24 00:00:00');
INSERT INTO `t_shopcart` VALUES ('4', '45', '2', '1', '2017-06-24 00:00:00');
INSERT INTO `t_shopcart` VALUES ('5', '32', '2', '1', '2017-06-24 00:00:00');
INSERT INTO `t_shopcart` VALUES ('6', '25', '2', '1', '2017-06-24 00:00:00');
INSERT INTO `t_shopcart` VALUES ('7', '45', '2', '1', '2017-06-24 00:00:00');
INSERT INTO `t_shopcart` VALUES ('8', '45', '2', '1', '2017-06-24 00:00:00');
INSERT INTO `t_shopcart` VALUES ('9', '47', '2', '1', '2017-06-24 00:00:00');
INSERT INTO `t_shopcart` VALUES ('10', '46', '2', '1', '2017-06-24 00:00:00');
INSERT INTO `t_shopcart` VALUES ('11', '42', '15', '1', '2017-06-24 00:00:00');

-- ----------------------------
-- Table structure for t_shopinfos
-- ----------------------------
DROP TABLE IF EXISTS `t_shopinfos`;
CREATE TABLE `t_shopinfos` (
  `si_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `si_name` varchar(50) NOT NULL COMMENT '商品名称',
  `si_typeid` int(11) NOT NULL COMMENT '商品所属类别id',
  `si_typename` varchar(255) NOT NULL COMMENT '商品所属类名名称',
  `si_time` datetime DEFAULT NULL COMMENT '商品发布时间',
  `si_photo` varchar(255) DEFAULT NULL COMMENT '列表图',
  `si_bigphoto` varchar(255) DEFAULT NULL COMMENT '大图',
  `si_price` double NOT NULL COMMENT '单价',
  `si_allnum` int(11) NOT NULL COMMENT '总数',
  `si_salenum` int(11) DEFAULT '0' COMMENT '已售数量',
  `si_content` text NOT NULL COMMENT '商品介绍',
  `si_remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `si_count` double NOT NULL DEFAULT '1' COMMENT '折扣',
  PRIMARY KEY (`si_id`),
  KEY `fk8` (`si_typeid`),
  KEY `fk22` (`si_typename`),
  CONSTRAINT `fk22` FOREIGN KEY (`si_typename`) REFERENCES `t_shoptype` (`st_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk8` FOREIGN KEY (`si_typeid`) REFERENCES `t_shoptype` (`st_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_shopinfos
-- ----------------------------
INSERT INTO `t_shopinfos` VALUES ('1', '纯棉质T恤', '3', 'T恤', '2017-06-20 10:25:30', '/img/txu01.jpg', null, '88', '12', '0', 'T恤', 'T恤', '1');
INSERT INTO `t_shopinfos` VALUES ('2', '印纹白色T恤', '3', 'T恤', '2017-06-20 10:25:30', '/img/txu10.jpg', '', '87', '12', '0', 'T恤', 'T恤', '1');
INSERT INTO `t_shopinfos` VALUES ('3', 'X花纹T恤', '3', 'T恤', '2017-06-20 10:25:30', '/img/txu20.jpg', '', '90', '12', '0', 'T恤', 'T恤', '1');
INSERT INTO `t_shopinfos` VALUES ('4', '两件装背心', '3', 'T恤', '2017-06-20 10:25:30', '/img/txu30.jpg', '', '95', '12', '0', 'T恤', 'T恤', '1');
INSERT INTO `t_shopinfos` VALUES ('5', '束身T恤', '3', 'T恤', '2017-06-20 10:25:30', '/img/txu40.jpg', '', '89', '12', '0', 'T恤', 'T恤', '1');
INSERT INTO `t_shopinfos` VALUES ('6', '宽松休闲T恤', '3', 'T恤', '2017-06-20 10:25:30', '/img/txu50.jpg', '', '93', '12', '0', 'T恤', 'T恤', '1');
INSERT INTO `t_shopinfos` VALUES ('7', '多色相间T恤', '3', 'T恤', '2017-06-20 10:25:30', '/img/txu60.jpg', '', '101', '12', '0', 'T恤', 'T恤', '1');
INSERT INTO `t_shopinfos` VALUES ('8', '圆领纯色T恤', '3', 'T恤', '2017-06-20 10:25:30', '/img/txu70.jpg', '', '81', '12', '0', 'T恤', 'T恤', '1');
INSERT INTO `t_shopinfos` VALUES ('9', '暖系小生T恤', '3', 'T恤', '2017-06-20 10:25:30', '/img/txu80.jpg', '', '110', '12', '0', 'T恤', 'T恤', '1');
INSERT INTO `t_shopinfos` VALUES ('10', '修身浅色系衬衫', '4', '衬衫', '2017-06-20 10:25:30', '/img/chenyi00.jpg', '', '75', '12', '0', '衬衫', '衬衫', '1');
INSERT INTO `t_shopinfos` VALUES ('11', '竖条纹衬衫', '4', '衬衫', '2017-06-20 10:25:30', '/img/chenyi10.jpg', '', '95', '12', '0', '衬衫', '衬衫', '1');
INSERT INTO `t_shopinfos` VALUES ('12', '竖条纹纯白衬衫', '4', '衬衫', '2017-06-20 10:25:30', '/img/chenyi20.jpg', '', '82', '12', '0', '衬衫', '衬衫', '1');
INSERT INTO `t_shopinfos` VALUES ('13', '贴身显色衬衫', '4', '衬衫', '2017-06-20 10:25:30', '/img/chenyi30.jpg', '', '96', '12', '0', '衬衫', '衬衫', '1');
INSERT INTO `t_shopinfos` VALUES ('14', '多色衬衫', '4', '衬衫', '2017-06-20 10:25:30', '/img/chenyi40.jpg', '', '101', '12', '0', '衬衫', '衬衫', '1');
INSERT INTO `t_shopinfos` VALUES ('15', '宽松居家衬衫', '4', '衬衫', '2017-06-20 10:25:30', '/img/chenyi50.jpg', '', '78', '12', '0', '衬衫', '衬衫', '1');
INSERT INTO `t_shopinfos` VALUES ('16', '密集条纹衬衫', '4', '衬衫', '2017-06-20 10:25:30', '/img/chenyi60.jpg', '', '87', '12', '0', '衬衫', '衬衫', '1');
INSERT INTO `t_shopinfos` VALUES ('17', '霸气外露衬衫', '4', '衬衫', '2017-06-20 10:25:30', '/img/chenyi70.jpg', '', '92', '12', '0', '衬衫', '衬衫', '1');
INSERT INTO `t_shopinfos` VALUES ('18', '深蓝间白竖纹衬衫', '4', '衬衫', '2017-06-20 10:25:30', '/img/chenyi80.jpg', '', '90', '12', '0', '衬衫', '衬衫', '1');
INSERT INTO `t_shopinfos` VALUES ('19', '韩版紧身牛仔', '4', '衬衫', '2017-06-20 10:25:30', '/img/chenyi90.jpg', '', '99', '12', '0', '衬衫', '衬衫', '1');
INSERT INTO `t_shopinfos` VALUES ('20', '九分时尚牛仔', '2', '牛仔', '2017-06-20 10:25:30', '/img/niuzai00.jpg', '', '88', '12', '0', '牛仔', '牛仔', '1');
INSERT INTO `t_shopinfos` VALUES ('21', '青黑牛仔', '2', '牛仔', '2017-06-20 10:25:30', '/img/niuzai10.jpg', '', '85', '12', '0', '牛仔', '牛仔', '1');
INSERT INTO `t_shopinfos` VALUES ('22', '时尚牛仔', '2', '牛仔', '2017-06-20 10:25:30', '/img/niuzai20.jpg', '', '98', '12', '0', '牛仔', '牛仔', '1');
INSERT INTO `t_shopinfos` VALUES ('23', '时尚牛仔', '2', '牛仔', '2017-06-20 10:25:30', '/img/niuzai30.jpg', '', '102', '12', '0', '牛仔', '牛仔', '1');
INSERT INTO `t_shopinfos` VALUES ('24', '时尚牛仔', '2', '牛仔', '2017-06-20 10:25:30', '/img/niuzai40.jpg', '', '108', '12', '0', '牛仔', '牛仔', '1');
INSERT INTO `t_shopinfos` VALUES ('25', '时尚牛仔', '2', '牛仔', '2017-06-20 10:25:30', '/img/niuzai50.jpg', '', '110', '12', '0', '牛仔', '牛仔', '1');
INSERT INTO `t_shopinfos` VALUES ('26', '时尚牛仔', '2', '牛仔', '2017-06-20 10:25:30', '/img/niuzai60.jpg', '', '120', '12', '0', '牛仔', '牛仔', '1');
INSERT INTO `t_shopinfos` VALUES ('27', '时尚牛仔', '2', '牛仔', '2017-06-20 10:25:30', '/img/niuzai70.jpg', '', '105', '12', '0', '牛仔', '牛仔', '1');
INSERT INTO `t_shopinfos` VALUES ('28', '时尚牛仔', '2', '牛仔', '2017-06-20 10:25:30', '/img/niuzai80.jpg', '', '99', '12', '0', '牛仔', '牛仔', '1');
INSERT INTO `t_shopinfos` VALUES ('29', '时尚牛仔', '2', '牛仔', '2017-06-20 10:25:30', '/img/niuzai90.jpg', '', '158', '12', '0', '牛仔', '牛仔', '1');
INSERT INTO `t_shopinfos` VALUES ('30', '男装上衣', '1', '上衣', '2017-06-20 10:25:30', '/img/shangyi00.jpg', '', '250', '12', '0', '上衣', '上衣', '1');
INSERT INTO `t_shopinfos` VALUES ('31', '时尚外衣', '1', '上衣', '2017-06-20 10:25:30', '/img/shangyi10.jpg', '', '200', '12', '0', '上衣', '上衣', '1');
INSERT INTO `t_shopinfos` VALUES ('32', '印花潮流上衣', '1', '上衣', '2017-06-20 10:25:30', '/img/shangyi20.jpg', '', '168', '12', '0', '上衣', '上衣', '1');
INSERT INTO `t_shopinfos` VALUES ('33', '纯色上衣', '1', '上衣', '2017-06-20 10:25:30', '/img/shangyi30.jpg', '', '185', '12', '0', '上衣', '上衣', '1');
INSERT INTO `t_shopinfos` VALUES ('35', '仿古风上衣', '1', '上衣', '2017-06-20 10:25:30', '/img/shangyi40.jpg', '', '199', '12', '0', '上衣', '上衣', '1');
INSERT INTO `t_shopinfos` VALUES ('36', '修身风衣', '1', '上衣', '2017-06-20 10:25:30', '/img/shangyi50.jpg', '', '172', '12', '0', '上衣', '上衣', '1');
INSERT INTO `t_shopinfos` VALUES ('37', '时尚牛仔外衣', '1', '上衣', '2017-06-20 10:25:30', '/img/shangyi60.jpg', '', '150', '12', '0', '上衣', '上衣', '1');
INSERT INTO `t_shopinfos` VALUES ('38', '男装上衣', '1', '上衣', '2017-06-20 10:25:30', '/img/shangyi70.jpg', '', '112', '12', '0', '上衣', '上衣', '1');
INSERT INTO `t_shopinfos` VALUES ('39', '男装上衣', '1', '上衣', '2017-06-20 10:25:30', '/img/shangyi80.jpg', '', '109', '12', '0', '上衣', '上衣', '1');
INSERT INTO `t_shopinfos` VALUES ('40', '黑白图块上衣', '1', '上衣', '2017-06-20 10:25:30', '/img/shangyi90.jpg', '', '120', '12', '0', '上衣', '上衣', '1');
INSERT INTO `t_shopinfos` VALUES ('41', '白色上衣', '1', '上衣', '2017-06-20 10:25:30', '/img/u14.jpg', '', '130', '12', '0', '上衣', '上衣', '1');
INSERT INTO `t_shopinfos` VALUES ('42', '类衬衫T恤', '3', 'T恤', '2017-06-20 10:25:30', '/img/u16.jpg', '', '120', '12', '0', 'T恤', 'T恤', '1');
INSERT INTO `t_shopinfos` VALUES ('43', '黑色酷炫风衣', '1', '上衣', '2017-06-20 10:25:30', '/img/u20.jpg', '', '150', '12', '0', '上衣', '上衣', '1');
INSERT INTO `t_shopinfos` VALUES ('44', '黑色中裤', '2', '牛仔', '2017-06-20 10:25:30', '/img/u22.jpg', '', '90', '12', '0', '裤子', '裤子', '1');
INSERT INTO `t_shopinfos` VALUES ('45', '小清新T恤', '3', 'T恤', '2017-06-20 10:25:30', '/img/u34.jpg', '', '180', '12', '0', 'T恤', 'T恤', '1');
INSERT INTO `t_shopinfos` VALUES ('46', '圆领净色T恤', '3', 'T恤', '2017-06-20 10:25:30', '/img/u35.jpg', '', '180', '12', '0', 'T恤', 'T恤', '1');
INSERT INTO `t_shopinfos` VALUES ('47', '圆领净色T恤', '3', 'T恤', '2017-06-20 10:25:30', '/img/u191.jpg', '', '180', '12', '0', 'T恤', 'T恤', '1');
INSERT INTO `t_shopinfos` VALUES ('48', 'smsmsms', '1', '上衣', '2017-06-23 00:00:00', '/img/u16.jpg', null, '99', '12', '0', '上衣', '上衣', '0');

-- ----------------------------
-- Table structure for t_shoptype
-- ----------------------------
DROP TABLE IF EXISTS `t_shoptype`;
CREATE TABLE `t_shoptype` (
  `st_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品分类编号',
  `st_name` varchar(255) NOT NULL COMMENT '商品类别名称',
  PRIMARY KEY (`st_id`),
  KEY `st_name` (`st_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_shoptype
-- ----------------------------
INSERT INTO `t_shoptype` VALUES ('3', 'T恤');
INSERT INTO `t_shoptype` VALUES ('1', '上衣');
INSERT INTO `t_shoptype` VALUES ('2', '牛仔');
INSERT INTO `t_shoptype` VALUES ('4', '衬衫');

-- ----------------------------
-- Table structure for t_userinfos
-- ----------------------------
DROP TABLE IF EXISTS `t_userinfos`;
CREATE TABLE `t_userinfos` (
  `ui_mid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户信息编号',
  `ui_id` int(11) NOT NULL COMMENT '用户id',
  `ui_state` varchar(50) DEFAULT NULL COMMENT '用户状态(可用/封禁)',
  `ui_realname` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `ui_code` int(11) DEFAULT NULL COMMENT '身份证号码',
  `ui_sex` varchar(20) DEFAULT NULL COMMENT '性别',
  `ui_email` varchar(50) NOT NULL COMMENT '邮箱地址',
  `ui_address` varchar(100) NOT NULL COMMENT '收货地址',
  `ui_phone` varchar(13) NOT NULL COMMENT '电话号码',
  `ui_postcod` int(10) DEFAULT NULL COMMENT '收货地邮编',
  `ui_admin` int(11) DEFAULT '0' COMMENT '用户是否为管理员',
  PRIMARY KEY (`ui_mid`),
  KEY `ui_id` (`ui_id`),
  CONSTRAINT `userinfo` FOREIGN KEY (`ui_id`) REFERENCES `t_users` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of t_userinfos
-- ----------------------------
INSERT INTO `t_userinfos` VALUES ('1', '5', 'inuse', '张三', '4', '', 'qeqwee', '四川省成都市双流县学府路一段24号', '18882070554', '0', '0');
INSERT INTO `t_userinfos` VALUES ('2', '14', 'inuse', '444', '2', null, '45', '四川省成都市双流县学府路一段24号', '18882070554', '0', '0');
INSERT INTO `t_userinfos` VALUES ('3', '3', 'inuse', '333', '3', null, '333', '四川省成都市双流县学府路一段24号', '18882070554', '0', '0');
INSERT INTO `t_userinfos` VALUES ('4', '4', 'inuse', 'qwe', '4', null, 'qeqwee', '四川省成都市双流县学府路一段24号', '18882070554', '0', '0');
INSERT INTO `t_userinfos` VALUES ('5', '2', null, 'ad沙发上', null, null, '1154385852@qq.com', '四川省成都市双流县学府路一段24号', '18882070554', null, '0');
INSERT INTO `t_userinfos` VALUES ('6', '6', 'inuse', '王五', '4', '', 'qeqwee', '四川省成都市双流县学府路一段24号', '18882070554', '0', '0');
INSERT INTO `t_userinfos` VALUES ('7', '7', 'inuse', '1123', '4', '', 'qeqwee', '四川省成都市双流县学府路一段24号', '18882070554', '0', '0');
INSERT INTO `t_userinfos` VALUES ('8', '8', 'inuse', '用户1', '4', '', 'qeqwee', '四川省成都市双流县学府路一段24号', '18882070554', '0', '0');
INSERT INTO `t_userinfos` VALUES ('9', '9', 'inuse', '用户二', '4', '', 'qeqwee', '四川省成都市双流县学府路一段24号', '18882070554', '0', '0');
INSERT INTO `t_userinfos` VALUES ('10', '10', 'inuse', '用户3', '4', '', 'qeqwee', '四川省成都市双流县学府路一段24号', '18882070554', '0', '0');
INSERT INTO `t_userinfos` VALUES ('11', '11', 'inuse', '用户4', '4', '', 'qeqwee', '四川省成都市双流县学府路一段24号', '18882070554', '0', '0');
INSERT INTO `t_userinfos` VALUES ('12', '12', 'inuse', '用户5', '4', '', 'qeqwee', '四川省成都市双流县学府路一段24号', '18882070554', '0', '0');
INSERT INTO `t_userinfos` VALUES ('13', '13', 'inuse', '用户6', '4', '', 'qeqwee', '四川省成都市双流县学府路一段24号', '18882070554', '0', '0');
INSERT INTO `t_userinfos` VALUES ('14', '14', 'inuse', '用户7', '4', '', 'qeqwee', '四川省成都市双流县学府路一段24号', '18882070554', '0', '0');
INSERT INTO `t_userinfos` VALUES ('15', '15', 'inuse', '888', '15', null, 'qeqwee', '四川省成都市双流县学府路一段24', '18882070554', '0', '0');
INSERT INTO `t_userinfos` VALUES ('16', '16', 'inuse', '666', '16', null, 'qeqwee', '四川省成都市双流县学府路一段24', '18882070554', '0', '0');
INSERT INTO `t_userinfos` VALUES ('17', '17', 'inuse', '777', '17', null, 'qeqwee', '四川省成都市双流县学府路一段24', '18882070554', '0', '0');
INSERT INTO `t_userinfos` VALUES ('18', '18', 'inuse', '无影', '18', null, '58695213456@qq.com', '成都信息工程大学', '15869324568', '0', '0');

-- ----------------------------
-- Table structure for t_users
-- ----------------------------
DROP TABLE IF EXISTS `t_users`;
CREATE TABLE `t_users` (
  `u_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `u_name` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '用户昵称',
  `u_password` varchar(255) NOT NULL COMMENT '用户密码',
  `u_registertime` datetime NOT NULL COMMENT '用户注册时间',
  `u_lasttime` datetime DEFAULT NULL COMMENT '用户最后登录时间',
  PRIMARY KEY (`u_id`),
  KEY `u_name` (`u_name`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1 COMMENT='用户表';

-- ----------------------------
-- Records of t_users
-- ----------------------------
INSERT INTO `t_users` VALUES ('2', '444', '123456', '2017-06-22 00:00:00', '2017-06-22 00:00:00');
INSERT INTO `t_users` VALUES ('3', '333', '333', '2017-06-22 00:00:00', '2017-06-22 00:00:00');
INSERT INTO `t_users` VALUES ('4', '我', '111111', '2017-06-23 00:00:00', '2017-06-23 00:00:00');
INSERT INTO `t_users` VALUES ('5', '张三', '123456', '2017-06-24 17:44:05', '2017-06-23 17:44:12');
INSERT INTO `t_users` VALUES ('6', '李四', '123456', '2017-06-23 17:44:27', '2017-06-23 17:44:31');
INSERT INTO `t_users` VALUES ('7', '王五', '123456', '2017-06-23 17:44:49', '2017-06-23 17:44:52');
INSERT INTO `t_users` VALUES ('8', '用户1', '123456', '2017-06-23 17:44:52', '2017-06-23 17:44:52');
INSERT INTO `t_users` VALUES ('9', '用户二', '123456', '2017-06-23 17:44:52', '2017-06-23 17:44:52');
INSERT INTO `t_users` VALUES ('10', '用户3', '123456', '2017-06-23 17:44:52', '2017-06-23 17:44:52');
INSERT INTO `t_users` VALUES ('11', '用户4', '123456', '2017-06-23 17:44:52', '2017-06-23 17:44:52');
INSERT INTO `t_users` VALUES ('12', '用户5', '123456', '2017-06-23 17:44:52', '2017-06-23 17:44:52');
INSERT INTO `t_users` VALUES ('13', '用户6', '123456', '2017-06-23 17:44:52', '2017-06-23 17:44:52');
INSERT INTO `t_users` VALUES ('14', '用户7', '123456', '2017-06-23 17:44:52', '2017-06-23 17:44:52');
INSERT INTO `t_users` VALUES ('15', '888', '888', '2017-06-24 00:00:00', '2017-06-24 00:00:00');
INSERT INTO `t_users` VALUES ('16', '666', '666', '2017-06-24 00:00:00', '2017-06-24 00:00:00');
INSERT INTO `t_users` VALUES ('17', '777', '777', '2017-06-24 00:00:00', '2017-06-24 00:00:00');
INSERT INTO `t_users` VALUES ('18', '无影', '123456', '2017-06-24 00:00:00', '2017-06-24 00:00:00');
