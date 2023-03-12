/*
 Navicat Premium Data Transfer

 Source Server         : java
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : aaaab

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 09/12/2022 10:34:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for clothing
-- ----------------------------
DROP TABLE IF EXISTS `clothing`;
CREATE TABLE `clothing`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `subtitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `size` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` double(255, 2) NULL DEFAULT NULL,
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clothing
-- ----------------------------
INSERT INTO `clothing` VALUES (1, '针织衫', '秋季上新', '咖啡色', 'M', 199.11, '5.jpg');
INSERT INTO `clothing` VALUES (2, '休闲裤', '显瘦百搭', '静雅黑', 'S', 329.22, '1.jpg');
INSERT INTO `clothing` VALUES (3, '衬衫', '立领衬衫外套', '黑色', 'XL', 88.33, '4.jpg');
INSERT INTO `clothing` VALUES (4, '雪纺衫', '宽松慵懒', '藏青色', 'L', 359.44, '2.jpg');
INSERT INTO `clothing` VALUES (5, '卫衣', '新款时尚', '杏色', 'XXL', 209.00, '7.jpg');
INSERT INTO `clothing` VALUES (6, '连衣裙', '气质名媛', '暗粉色', 'M', 729.00, '3.jpg');
INSERT INTO `clothing` VALUES (7, '外套', '轻薄短款', '米白色', 'M', 1399.00, '9.jpg');
INSERT INTO `clothing` VALUES (8, '半身裙', '遮肉高腰', '卡其色', 'S', 349.00, '6.jpg');
INSERT INTO `clothing` VALUES (9, '西装', '职业商务款', '黑白色', 'S', 1000.00, '9.jpg');
INSERT INTO `clothing` VALUES (10, '下装', '高腰显瘦阔腿', '蓝咖', 'L', 328.00, '10.jpg');
INSERT INTO `clothing` VALUES (11, '羽绒服', '明星同款', '蓝色', 'L', 2850.11, '11.jpg');

-- ----------------------------
-- Table structure for information
-- ----------------------------
DROP TABLE IF EXISTS `information`;
CREATE TABLE `information`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `shippingAddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `mobilePhoneNumber` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of information
-- ----------------------------
INSERT INTO `information` VALUES (1, 1, 'admin', '南宁', '110110110110');
INSERT INTO `information` VALUES (2, 1, '老黄', '北海', '119119119119');
INSERT INTO `information` VALUES (3, 2, '张三', '内蒙古', '121121121121');
INSERT INTO `information` VALUES (4, 2, '王子', '中南明珠', '1111111111111');
INSERT INTO `information` VALUES (5, 3, '帅哥', '非洲', '548949549549');
INSERT INTO `information` VALUES (6, 3, '王五', '美国', '56459459459');
INSERT INTO `information` VALUES (7, 3, '梅西', '阿根廷', '6656456456');
INSERT INTO `information` VALUES (8, 2, '小三', '圣地亚哥', '11451423336');

-- ----------------------------
-- Table structure for order_
-- ----------------------------
DROP TABLE IF EXISTS `order_`;
CREATE TABLE `order_`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(255) NULL DEFAULT NULL,
  `createDate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `iid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_
-- ----------------------------
INSERT INTO `order_` VALUES (1, 1, '2022/11/30 14:46:18 ', '未发货', 2);
INSERT INTO `order_` VALUES (2, 2, '2022/11/30 14:47:11 ', '未发货', 3);
INSERT INTO `order_` VALUES (3, 2, '2022/11/30 14:47:29 ', '未发货', 4);
INSERT INTO `order_` VALUES (4, 3, '2022/11/30 14:48:29 ', '未发货', 7);

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oid` int(255) NULL DEFAULT NULL,
  `pid` int(255) NULL DEFAULT NULL,
  `num` int(250) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES (1, 1, 4, 2);
INSERT INTO `orderitem` VALUES (2, 1, 6, 3);
INSERT INTO `orderitem` VALUES (3, 1, 2, 1);
INSERT INTO `orderitem` VALUES (4, 2, 7, 1);
INSERT INTO `orderitem` VALUES (5, 2, 9, 2);
INSERT INTO `orderitem` VALUES (6, 2, 11, 3);
INSERT INTO `orderitem` VALUES (7, 3, 5, 1);
INSERT INTO `orderitem` VALUES (8, 3, 1, 2);
INSERT INTO `orderitem` VALUES (9, 3, 4, 5);
INSERT INTO `orderitem` VALUES (10, 4, 7, 1);
INSERT INTO `orderitem` VALUES (11, 4, 10, 1);
INSERT INTO `orderitem` VALUES (12, 4, 11, 4);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `role` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '123', '管理员');
INSERT INTO `user` VALUES (2, '张三', '333', '会员');
INSERT INTO `user` VALUES (3, '李四', '444', '会员');

SET FOREIGN_KEY_CHECKS = 1;
