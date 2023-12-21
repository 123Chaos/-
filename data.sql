/*
 Navicat Premium Data Transfer

 Source Server         : familyAPP
 Source Server Type    : MySQL
 Source Server Version : 80032
 Source Host           : localhost:3306
 Source Schema         : demo

 Target Server Type    : MySQL
 Target Server Version : 80032
 File Encoding         : 65001

 Date: 28/11/2023 08:48:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for qw_breath_rate
-- ----------------------------
DROP TABLE IF EXISTS `qw_breath_rate`;
CREATE TABLE `qw_breath_rate`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `spaceId` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '空间id',
  `value` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '呼吸频率值',
  `time` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '时间',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '方舟临时加的呼吸频率记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qw_breath_rate
-- ----------------------------

-- ----------------------------
-- Table structure for qw_devices
-- ----------------------------
DROP TABLE IF EXISTS `qw_devices`;
CREATE TABLE `qw_devices`  (
  `deviceId` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '华为设备id',
  `deviceName` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '设备名称',
  `prodId` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '产品id',
  `model` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '设备型号',
  `sn` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '设备SN',
  `protType` int NULL DEFAULT NULL COMMENT '协议类型:1: WiFi2: Z-Wave3: ZigBee4: BLE 5PLC',
  `status` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '在线状态',
  `spaceId` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '华为空间id',
  `dataTimeStamp` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '上报时间',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '华为全屋设备' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qw_devices
-- ----------------------------

-- ----------------------------
-- Table structure for qw_devices_img
-- ----------------------------
DROP TABLE IF EXISTS `qw_devices_img`;
CREATE TABLE `qw_devices_img`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `model` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '设备型号',
  `url` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '设备图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qw_devices_img
-- ----------------------------

-- ----------------------------
-- Table structure for qw_devices_services
-- ----------------------------
DROP TABLE IF EXISTS `qw_devices_services`;
CREATE TABLE `qw_devices_services`  (
  `deviceId` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '设备id',
  `serviceId` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '服务id',
  `serviceType` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '服务类型'
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '设备服务' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qw_devices_services
-- ----------------------------

-- ----------------------------
-- Table structure for qw_devices_services_characteristics
-- ----------------------------
DROP TABLE IF EXISTS `qw_devices_services_characteristics`;
CREATE TABLE `qw_devices_services_characteristics`  (
  `deviceId` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '设备id',
  `serviceId` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '服务id',
  `characteristicName` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '特性名',
  `characteristicValue` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '特性值',
  `timeStamp` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '设备服务特性' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qw_devices_services_characteristics
-- ----------------------------

-- ----------------------------
-- Table structure for qw_scenes
-- ----------------------------
DROP TABLE IF EXISTS `qw_scenes`;
CREATE TABLE `qw_scenes`  (
  `scenarioId` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '华为场景id',
  `scenarioName` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '华为场景名称',
  `type` int NULL DEFAULT NULL COMMENT '类型1手动2自动3混合',
  `editAble` tinyint(1) NULL DEFAULT NULL COMMENT 'true1可以编辑false0不可以编辑',
  `status` int NULL DEFAULT NULL COMMENT '0关闭1开启',
  `spaceId` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '空间Id',
  `icon` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '图标',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`scenarioId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '华为全屋场景' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qw_scenes
-- ----------------------------

-- ----------------------------
-- Table structure for ss_account
-- ----------------------------
DROP TABLE IF EXISTS `ss_account`;
CREATE TABLE `ss_account`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `phone` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `hospital_id` int NULL DEFAULT NULL COMMENT '医院id',
  `department_id` int NULL DEFAULT NULL COMMENT '角色为科室管理员的科室id',
  `addTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '账户信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ss_account
-- ----------------------------

-- ----------------------------
-- Table structure for ss_alarm_event
-- ----------------------------
DROP TABLE IF EXISTS `ss_alarm_event`;
CREATE TABLE `ss_alarm_event`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `hospital_id` int NULL DEFAULT NULL COMMENT '医院id',
  `department_id` int NULL DEFAULT NULL COMMENT '科室id',
  `sickroom_id` int NULL DEFAULT NULL COMMENT '病房id',
  `disease_id` int NULL DEFAULT NULL COMMENT '病患id',
  `content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '事件内容',
  `time` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '时间',
  `status` int NULL DEFAULT 0 COMMENT '0未处理1已处理2忽略',
  `remark` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '预警告警事件' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_alarm_event
-- ----------------------------

-- ----------------------------
-- Table structure for ss_bimface_access_token
-- ----------------------------
DROP TABLE IF EXISTS `ss_bimface_access_token`;
CREATE TABLE `ss_bimface_access_token`  (
  `id` int NULL DEFAULT NULL,
  `content` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'token',
  `expire_time` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '过期时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_bimface_access_token
-- ----------------------------

-- ----------------------------
-- Table structure for ss_bimface_fileid_model
-- ----------------------------
DROP TABLE IF EXISTS `ss_bimface_fileid_model`;
CREATE TABLE `ss_bimface_fileid_model`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `fileId` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '模型id',
  `x` double(30, 20) NULL DEFAULT NULL COMMENT 'x',
  `y` double(30, 20) NULL DEFAULT NULL COMMENT 'y',
  `z` double(30, 20) NULL DEFAULT NULL COMMENT 'z',
  `device_type_id` int NULL DEFAULT NULL COMMENT '设备类型id',
  `object_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '模型构件id',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_bimface_fileid_model
-- ----------------------------

-- ----------------------------
-- Table structure for ss_bimface_view_token
-- ----------------------------
DROP TABLE IF EXISTS `ss_bimface_view_token`;
CREATE TABLE `ss_bimface_view_token`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `fileId` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '模型ID',
  `content` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'token',
  `expire_time` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '过期时间',
  `camera_state` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '模型视角设置',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_bimface_view_token
-- ----------------------------

-- ----------------------------
-- Table structure for ss_body_warn_set
-- ----------------------------
DROP TABLE IF EXISTS `ss_body_warn_set`;
CREATE TABLE `ss_body_warn_set`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `type_id` int NULL DEFAULT NULL COMMENT '体征类型id',
  `min` double(10, 2) NULL DEFAULT NULL,
  `max` double(10, 2) NULL DEFAULT NULL,
  `min1` double(10, 2) NULL DEFAULT NULL,
  `max1` double(10, 2) NULL DEFAULT NULL,
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '体征告警设置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_body_warn_set
-- ----------------------------

-- ----------------------------
-- Table structure for ss_body_warn_set_type
-- ----------------------------
DROP TABLE IF EXISTS `ss_body_warn_set_type`;
CREATE TABLE `ss_body_warn_set_type`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '体征类型' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_body_warn_set_type
-- ----------------------------

-- ----------------------------
-- Table structure for ss_device_type
-- ----------------------------
DROP TABLE IF EXISTS `ss_device_type`;
CREATE TABLE `ss_device_type`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '设备名称',
  `img_url` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '设备图片',
  `explain` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '设备说明',
  `factory` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '设备厂家',
  `type` int NULL DEFAULT NULL COMMENT '1运动健康2体征检测3环境监测4智能家居5其他',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '设备类型' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_device_type
-- ----------------------------

-- ----------------------------
-- Table structure for ss_disease
-- ----------------------------
DROP TABLE IF EXISTS `ss_disease`;
CREATE TABLE `ss_disease`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int NULL DEFAULT NULL COMMENT '用户id',
  `relationship_id` int NULL DEFAULT NULL COMMENT '与用户关系id',
  `name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `avatar` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT 'http://113.108.129.90:9999/files/1653357811924txhiqrh577.png' COMMENT '头像',
  `sex` int NULL DEFAULT NULL COMMENT '1男2女',
  `birthday` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '出生日期（自动计算年龄）',
  `cardType_id` int NULL DEFAULT NULL COMMENT '证件类型ID，',
  `id_no` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `nationality_id` int NULL DEFAULT NULL COMMENT '民族id',
  `marriage_id` int NULL DEFAULT NULL COMMENT '婚姻状态id',
  `address` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '地址',
  `job` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '工作单位',
  `job_state_id` int NULL DEFAULT NULL COMMENT '工作状态id',
  `medical_pay_id` int NULL DEFAULT NULL COMMENT '医疗支付方式',
  `default` int NULL DEFAULT 0 COMMENT '默认1是0否',
  `state` int NULL DEFAULT 2 COMMENT '状态1停用2启用',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '病患信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_disease
-- ----------------------------

-- ----------------------------
-- Table structure for ss_disease_cardtype
-- ----------------------------
DROP TABLE IF EXISTS `ss_disease_cardtype`;
CREATE TABLE `ss_disease_cardtype`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '对应互联网医院id',
  `name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '病患亲友类型' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_disease_cardtype
-- ----------------------------

-- ----------------------------
-- Table structure for ss_disease_cf
-- ----------------------------
DROP TABLE IF EXISTS `ss_disease_cf`;
CREATE TABLE `ss_disease_cf`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `disease_id` int NULL DEFAULT NULL COMMENT '病患id',
  `doctor_id` int NULL DEFAULT NULL COMMENT '医生id',
  `wz_id` int NULL DEFAULT NULL COMMENT '问诊id',
  `complain` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '主诉',
  `case_history` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '病史',
  `sensitive_history` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '过敏史',
  `diagnosis` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '诊断',
  `days` int NULL DEFAULT NULL COMMENT '用药天数',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '处方记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_disease_cf
-- ----------------------------

-- ----------------------------
-- Table structure for ss_disease_cf_medicine
-- ----------------------------
DROP TABLE IF EXISTS `ss_disease_cf_medicine`;
CREATE TABLE `ss_disease_cf_medicine`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cf_id` int NULL DEFAULT NULL COMMENT '处方id',
  `medicine_id` int NULL DEFAULT NULL COMMENT '药品id',
  `medicine_name` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '药名名称',
  `medicine_specifications` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '药品规格',
  `medicine_use` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用法',
  `medicine_type` int NULL DEFAULT NULL COMMENT '1西药2中成药',
  `dosage` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '剂量',
  `frequency` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '频次',
  `count` int NULL DEFAULT NULL COMMENT '数量',
  `price` double(10, 2) NULL DEFAULT NULL COMMENT '单价',
  `all_money` double(12, 2) NULL DEFAULT NULL COMMENT '总价',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '处方药物' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_disease_cf_medicine
-- ----------------------------

-- ----------------------------
-- Table structure for ss_disease_image_report
-- ----------------------------
DROP TABLE IF EXISTS `ss_disease_image_report`;
CREATE TABLE `ss_disease_image_report`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `disease_id` int NULL DEFAULT NULL COMMENT '病患id',
  `name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '名称',
  `date` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '日期',
  `img_arr` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '图片数组字符串',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '影像报告' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_disease_image_report
-- ----------------------------

-- ----------------------------
-- Table structure for ss_disease_relationship
-- ----------------------------
DROP TABLE IF EXISTS `ss_disease_relationship`;
CREATE TABLE `ss_disease_relationship`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '对应互联网医院Id',
  `name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '病患亲友类型' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_disease_relationship
-- ----------------------------

-- ----------------------------
-- Table structure for ss_disease_tj_report
-- ----------------------------
DROP TABLE IF EXISTS `ss_disease_tj_report`;
CREATE TABLE `ss_disease_tj_report`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `disease_id` int NULL DEFAULT NULL COMMENT '病患id',
  `name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '名称',
  `date` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '日期',
  `img_arr` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '图片数组字符串',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '体检报告' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_disease_tj_report
-- ----------------------------

-- ----------------------------
-- Table structure for ss_disease_wz
-- ----------------------------
DROP TABLE IF EXISTS `ss_disease_wz`;
CREATE TABLE `ss_disease_wz`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `disease_id` int NULL DEFAULT NULL COMMENT '病患id',
  `doctor_id` int NULL DEFAULT NULL COMMENT '医生id',
  `status` int NULL DEFAULT 0 COMMENT '状态：0未问诊1结束问诊',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '诊断时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '问诊记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_disease_wz
-- ----------------------------

-- ----------------------------
-- Table structure for ss_doctor
-- ----------------------------
DROP TABLE IF EXISTS `ss_doctor`;
CREATE TABLE `ss_doctor`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `hospital_id` int NULL DEFAULT NULL COMMENT '医院id',
  `department_id` int NULL DEFAULT NULL COMMENT '部门',
  `name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `avatar` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '头像',
  `sex` int NULL DEFAULT NULL COMMENT '1男2女',
  `province` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '省',
  `city` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '市',
  `county` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '区',
  `job` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '工作单位',
  `linkphone` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `id_no` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `special` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '擅长',
  `zcnm` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '职称',
  `online_status` int NULL DEFAULT 0 COMMENT '接诊平台：0未开通1已开通',
  `password` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT 'e10adc3949ba59abbe56e057f20f883e' COMMENT '密码：默认123465',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '医护信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_doctor
-- ----------------------------

-- ----------------------------
-- Table structure for ss_health_advice
-- ----------------------------
DROP TABLE IF EXISTS `ss_health_advice`;
CREATE TABLE `ss_health_advice`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `type` int NULL DEFAULT NULL COMMENT '1睡眠2压力3心率4血压5血氧6体温7血糖',
  `min` double(10, 1) NULL DEFAULT NULL COMMENT '低临界值',
  `max` double(10, 1) NULL DEFAULT NULL COMMENT '高临界值',
  `min1` double(10, 1) NULL DEFAULT NULL,
  `max1` double(10, 1) NULL DEFAULT NULL,
  `content1` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '建议1',
  `content2` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '建议2',
  `content3` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '建议3',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '健康建议' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_health_advice
-- ----------------------------

-- ----------------------------
-- Table structure for ss_health_education
-- ----------------------------
DROP TABLE IF EXISTS `ss_health_education`;
CREATE TABLE `ss_health_education`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `hospital_id` int NULL DEFAULT 0 COMMENT '医院id',
  `title` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '标题',
  `type_id` int NULL DEFAULT NULL COMMENT '类型id',
  `logo` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'logo',
  `describe` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '描述简介',
  `video_url` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '视频url',
  `status` int NULL DEFAULT 0 COMMENT '0禁用1启用',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '健康宣教' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_health_education
-- ----------------------------

-- ----------------------------
-- Table structure for ss_health_education_type
-- ----------------------------
DROP TABLE IF EXISTS `ss_health_education_type`;
CREATE TABLE `ss_health_education_type`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '设备名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '健康宣教类型' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_health_education_type
-- ----------------------------

-- ----------------------------
-- Table structure for ss_health_education_zan
-- ----------------------------
DROP TABLE IF EXISTS `ss_health_education_zan`;
CREATE TABLE `ss_health_education_zan`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int NULL DEFAULT NULL COMMENT '用户id',
  `education_arr` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '健康教育id字符串数组',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_health_education_zan
-- ----------------------------

-- ----------------------------
-- Table structure for ss_hospital
-- ----------------------------
DROP TABLE IF EXISTS `ss_hospital`;
CREATE TABLE `ss_hospital`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '名称',
  `address` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '地址',
  `logo` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'logo',
  `img` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '图片',
  `longitude` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '经度',
  `latitude` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '纬度',
  `contacts` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `contacts_phone` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '医院' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_hospital
-- ----------------------------

-- ----------------------------
-- Table structure for ss_hospital_department
-- ----------------------------
DROP TABLE IF EXISTS `ss_hospital_department`;
CREATE TABLE `ss_hospital_department`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `hospital_id` int NULL DEFAULT NULL COMMENT '机构场所id',
  `name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '名称',
  `contacts` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `contacts_phone` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '医院' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_hospital_department
-- ----------------------------

-- ----------------------------
-- Table structure for ss_hw_at
-- ----------------------------
DROP TABLE IF EXISTS `ss_hw_at`;
CREATE TABLE `ss_hw_at`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `disease_id` int NULL DEFAULT NULL,
  `client_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `access_token` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `refresh_token` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `expires_in` int NULL DEFAULT NULL,
  `scope` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  `time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '华为toC的AT' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_hw_at
-- ----------------------------

-- ----------------------------
-- Table structure for ss_hw_fat_scale
-- ----------------------------
DROP TABLE IF EXISTS `ss_hw_fat_scale`;
CREATE TABLE `ss_hw_fat_scale`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `disease_id` int NULL DEFAULT NULL COMMENT '病患id',
  `weight` double(10, 2) NULL DEFAULT NULL COMMENT '体重',
  `bmi` double(10, 2) NULL DEFAULT NULL COMMENT 'BMI',
  `muscle` double(10, 2) NULL DEFAULT NULL COMMENT '肌肉量',
  `basic` double(10, 2) NULL DEFAULT NULL COMMENT '基础代谢',
  `water` double(10, 2) NULL DEFAULT NULL COMMENT '水分',
  `fat_grade` double(10, 2) NULL DEFAULT NULL COMMENT '内脏脂肪等级',
  `bone_salt` double(10, 2) NULL DEFAULT NULL COMMENT '骨盐量',
  `protein` double(10, 2) NULL DEFAULT NULL COMMENT '蛋白质率',
  `body_score` double(10, 2) NULL DEFAULT NULL COMMENT '身体得分',
  `body_age` int NULL DEFAULT NULL COMMENT '身体年龄',
  `fat_rate` double(10, 2) NULL DEFAULT NULL COMMENT '脂肪率',
  `overall` double(10, 2) NULL DEFAULT NULL COMMENT '整体阻抗',
  `water_rate` double(10, 2) NULL DEFAULT NULL COMMENT '水分率',
  `bone_mass` double(10, 2) NULL DEFAULT NULL COMMENT '骨骼肌质量',
  `advice` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '建议',
  `time` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '检测时间',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '华为一体脂秤' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_hw_fat_scale
-- ----------------------------

-- ----------------------------
-- Table structure for ss_hw_pbj
-- ----------------------------
DROP TABLE IF EXISTS `ss_hw_pbj`;
CREATE TABLE `ss_hw_pbj`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sickroom_id` int NULL DEFAULT NULL COMMENT '病房id',
  `device_no` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '设备号',
  `disease_id` int NULL DEFAULT NULL COMMENT '病患id',
  `time` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '上传时间',
  `total_time` int NULL DEFAULT NULL COMMENT '运动总时长',
  `distance` double(20, 2) NULL DEFAULT NULL COMMENT '运动距离',
  `calories` double(20, 2) NULL DEFAULT NULL COMMENT '消耗热量',
  `avg_pace` double(20, 2) NULL DEFAULT NULL COMMENT '平均配速',
  `avg_speed` double(20, 2) NULL DEFAULT NULL COMMENT '平均速度',
  `rate` int NULL DEFAULT NULL COMMENT '平均心率',
  `data_source` int NULL DEFAULT NULL COMMENT '数据来源 1手动 2app或设备',
  `step_frequency` double(20, 2) NULL DEFAULT NULL COMMENT '平均步频',
  `step` int NULL DEFAULT NULL COMMENT '步数',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '华为一跑步机' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_hw_pbj
-- ----------------------------

-- ----------------------------
-- Table structure for ss_hw_warning
-- ----------------------------
DROP TABLE IF EXISTS `ss_hw_warning`;
CREATE TABLE `ss_hw_warning`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sickroom_id` int NULL DEFAULT NULL COMMENT '病房id',
  `type` int NULL DEFAULT 0 COMMENT '0华为按钮1用户点击',
  `state` int NULL DEFAULT NULL COMMENT '0告警解除1告警',
  `add_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '华为一键告警记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_hw_warning
-- ----------------------------

-- ----------------------------
-- Table structure for ss_hw_watch_blood_glucose
-- ----------------------------
DROP TABLE IF EXISTS `ss_hw_watch_blood_glucose`;
CREATE TABLE `ss_hw_watch_blood_glucose`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `disease_id` int NULL DEFAULT NULL COMMENT '病患id',
  `level` double(10, 2) NULL DEFAULT NULL COMMENT '血糖',
  `measure_time` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '血糖测量时机',
  `advice` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '建议',
  `time` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '检测时间',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '华为一手表-血糖' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_hw_watch_blood_glucose
-- ----------------------------

-- ----------------------------
-- Table structure for ss_hw_watch_blood_pressure
-- ----------------------------
DROP TABLE IF EXISTS `ss_hw_watch_blood_pressure`;
CREATE TABLE `ss_hw_watch_blood_pressure`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `disease_id` int NULL DEFAULT NULL COMMENT '病患id',
  `high_press` double(10, 2) NULL DEFAULT NULL COMMENT '高压',
  `low_press` double(10, 2) NULL DEFAULT NULL COMMENT '低压',
  `beat` double(10, 2) NULL DEFAULT NULL COMMENT '脉搏',
  `advice` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '建议',
  `time` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '检测时间',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '华为一手表-血压' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_hw_watch_blood_pressure
-- ----------------------------

-- ----------------------------
-- Table structure for ss_hw_watch_calories
-- ----------------------------
DROP TABLE IF EXISTS `ss_hw_watch_calories`;
CREATE TABLE `ss_hw_watch_calories`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `disease_id` int NULL DEFAULT NULL COMMENT '病患id',
  `calories_sum` int NULL DEFAULT NULL COMMENT '当日消耗卡路里',
  `advice` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '建议',
  `time` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '检测时间',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '华为-卡路里' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_hw_watch_calories
-- ----------------------------

-- ----------------------------
-- Table structure for ss_hw_watch_distance
-- ----------------------------
DROP TABLE IF EXISTS `ss_hw_watch_distance`;
CREATE TABLE `ss_hw_watch_distance`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `disease_id` int NULL DEFAULT NULL COMMENT '病患id',
  `distance_sum` int NULL DEFAULT NULL COMMENT '距离',
  `advice` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '建议',
  `time` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '检测时间',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '华为-跑步距离' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_hw_watch_distance
-- ----------------------------

-- ----------------------------
-- Table structure for ss_hw_watch_exercise_intensity
-- ----------------------------
DROP TABLE IF EXISTS `ss_hw_watch_exercise_intensity`;
CREATE TABLE `ss_hw_watch_exercise_intensity`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `disease_id` int NULL DEFAULT NULL COMMENT '病患id',
  `exercise_intensity` int NULL DEFAULT NULL COMMENT '运动强度',
  `advice` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '建议',
  `time` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '检测时间',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '华为-运动强度' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_hw_watch_exercise_intensity
-- ----------------------------

-- ----------------------------
-- Table structure for ss_hw_watch_oxygen
-- ----------------------------
DROP TABLE IF EXISTS `ss_hw_watch_oxygen`;
CREATE TABLE `ss_hw_watch_oxygen`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `disease_id` int NULL DEFAULT NULL COMMENT '病患id',
  `day_max` double(10, 2) NULL DEFAULT NULL COMMENT '当日血氧最大值',
  `day_min` double(10, 2) NULL DEFAULT NULL COMMENT '当日血氧最小值',
  `day_avg` double(10, 2) NULL DEFAULT NULL COMMENT '当日血氧平均值',
  `day_last` double(10, 2) NULL DEFAULT NULL COMMENT '当日血氧最后测量值',
  `advice` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '建议',
  `time` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '检测时间',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '华为一手表-血氧' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_hw_watch_oxygen
-- ----------------------------

-- ----------------------------
-- Table structure for ss_hw_watch_press
-- ----------------------------
DROP TABLE IF EXISTS `ss_hw_watch_press`;
CREATE TABLE `ss_hw_watch_press`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `disease_id` int NULL DEFAULT NULL COMMENT '病患id',
  `press` double(10, 2) NULL DEFAULT NULL COMMENT '压力',
  `grade` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '等级',
  `advice` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '建议',
  `time` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '检测时间',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '华为一手表-压力' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_hw_watch_press
-- ----------------------------

-- ----------------------------
-- Table structure for ss_hw_watch_rate
-- ----------------------------
DROP TABLE IF EXISTS `ss_hw_watch_rate`;
CREATE TABLE `ss_hw_watch_rate`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `disease_id` int NULL DEFAULT NULL COMMENT '病患id',
  `day_max` double(10, 2) NULL DEFAULT NULL COMMENT '每日最大心率',
  `day_min` double(10, 2) NULL DEFAULT NULL COMMENT '每日最小心率',
  `day_avg` double(10, 2) NULL DEFAULT NULL COMMENT '每日平均静息心率',
  `min_avg` double(10, 2) NULL DEFAULT NULL COMMENT '每分钟平均心率',
  `now_rate` double(10, 2) NULL DEFAULT NULL COMMENT '实时心率',
  `advice` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '建议',
  `time` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '检测时间',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '华为一手表-心率' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_hw_watch_rate
-- ----------------------------

-- ----------------------------
-- Table structure for ss_hw_watch_sleep
-- ----------------------------
DROP TABLE IF EXISTS `ss_hw_watch_sleep`;
CREATE TABLE `ss_hw_watch_sleep`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `disease_id` int NULL DEFAULT NULL COMMENT '病患id',
  `eyes_time` int NULL DEFAULT NULL COMMENT '快速眼球转动时间',
  `deep_sleep` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '深睡时长',
  `light_sleep` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '浅睡时长',
  `awake_hours` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '清醒时长',
  `total_sleep` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '睡眠总时长',
  `awake_times` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '清醒次数',
  `sleep_hours` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '入睡时间',
  `wake_hours` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '醒来时间',
  `score` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '得分',
  `night_time` double(20, 2) NULL DEFAULT NULL COMMENT '夜间睡眠时长',
  `advice` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '建议',
  `time` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '检测时间',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '华为一手表-睡眠' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_hw_watch_sleep
-- ----------------------------

-- ----------------------------
-- Table structure for ss_hw_watch_step
-- ----------------------------
DROP TABLE IF EXISTS `ss_hw_watch_step`;
CREATE TABLE `ss_hw_watch_step`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `device_id` int NULL DEFAULT NULL COMMENT '设备id',
  `device_no` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '设备号',
  `disease_id` int NULL DEFAULT NULL COMMENT '病患id',
  `step_sum` int NULL DEFAULT NULL COMMENT '今日步数',
  `advice` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '建议',
  `time` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '检测时间',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '华为-手表-步数' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_hw_watch_step
-- ----------------------------

-- ----------------------------
-- Table structure for ss_hw_watch_temperature
-- ----------------------------
DROP TABLE IF EXISTS `ss_hw_watch_temperature`;
CREATE TABLE `ss_hw_watch_temperature`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `disease_id` int NULL DEFAULT NULL COMMENT '病患id',
  `temperature` double(5, 1) NULL DEFAULT NULL COMMENT '体温',
  `time` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '检测时间',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '华为一手表-体温' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_hw_watch_temperature
-- ----------------------------

-- ----------------------------
-- Table structure for ss_job_state
-- ----------------------------
DROP TABLE IF EXISTS `ss_job_state`;
CREATE TABLE `ss_job_state`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '工作状态' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_job_state
-- ----------------------------

-- ----------------------------
-- Table structure for ss_jp_fall_sensor
-- ----------------------------
DROP TABLE IF EXISTS `ss_jp_fall_sensor`;
CREATE TABLE `ss_jp_fall_sensor`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sickroom_id` int NULL DEFAULT NULL COMMENT '病房id',
  `device_no` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '设备mac',
  `disease_id` int NULL DEFAULT NULL COMMENT '病患id',
  `msgId` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '消息id',
  `fallStatus` int NULL DEFAULT NULL COMMENT '是否摔倒；1-摔倒，2-非摔倒，0-缺省',
  `timeOutStatus` int NULL DEFAULT NULL COMMENT '是否超时；1-超时，2-非超时，0-缺省',
  `timeOutDuration` int NULL DEFAULT NULL COMMENT '设定的超时滞留时长 单位秒',
  `add_time` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '推送时间',
  `status` int NULL DEFAULT 0 COMMENT '0未处理1已处理',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '箭牌摔倒数据' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_jp_fall_sensor
-- ----------------------------

-- ----------------------------
-- Table structure for ss_jp_health_seat
-- ----------------------------
DROP TABLE IF EXISTS `ss_jp_health_seat`;
CREATE TABLE `ss_jp_health_seat`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sickroom_id` int NULL DEFAULT NULL COMMENT '病房id',
  `device_no` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '设备mac',
  `disease_id` int NULL DEFAULT NULL COMMENT '病患id',
  `msgId` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '消息id',
  `duration` int NULL DEFAULT NULL COMMENT '如厕时长 单位秒',
  `heartBeat` double(5, 1) NULL DEFAULT NULL COMMENT '心搏',
  `heartRate` double(5, 1) NULL DEFAULT NULL COMMENT '心率',
  `heartRateMax` double(5, 1) NULL DEFAULT NULL COMMENT '最大心率',
  `heartRateMin` double(5, 1) NULL DEFAULT NULL COMMENT '最小心率',
  `legTemperature` double(5, 1) NULL DEFAULT NULL COMMENT '腿温',
  `respiratoryRate` double(5, 1) NULL DEFAULT NULL COMMENT '呼吸率',
  `add_time` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '推送时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '箭牌健康座圈数据' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_jp_health_seat
-- ----------------------------

-- ----------------------------
-- Table structure for ss_jp_uroscopy
-- ----------------------------
DROP TABLE IF EXISTS `ss_jp_uroscopy`;
CREATE TABLE `ss_jp_uroscopy`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sickroom_id` int NULL DEFAULT NULL COMMENT '病房id',
  `device_no` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '设备mac',
  `disease_id` int NULL DEFAULT NULL COMMENT '病患id',
  `msgId` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '消息id',
  `date` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '检测时间',
  `ca` double(5, 1) NULL DEFAULT NULL COMMENT '尿钙',
  `glu` double(5, 1) NULL DEFAULT NULL COMMENT '尿糖',
  `ntt` double(5, 1) NULL DEFAULT NULL COMMENT '尿亚硝酸盐',
  `ph` double(5, 1) NULL DEFAULT NULL COMMENT '酸碱度',
  `pro` double(5, 1) NULL DEFAULT NULL COMMENT '尿蛋白',
  `uro` double(5, 1) NULL DEFAULT NULL COMMENT '尿胆原',
  `add_time` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '推送时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '箭牌尿检数据' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_jp_uroscopy
-- ----------------------------

-- ----------------------------
-- Table structure for ss_kh_order
-- ----------------------------
DROP TABLE IF EXISTS `ss_kh_order`;
CREATE TABLE `ss_kh_order`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `hospital_id` int NULL DEFAULT NULL COMMENT '所属医院id',
  `FREGNO` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `FPNAME` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `FMOBILE` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '患者手机号',
  `FIDNO` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `SEX` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '性别',
  `AGE` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `FSTATUS` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '订单状态',
  `FOPDT` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '订单申请时间',
  `FREGDATE` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '订单预约日期',
  `FTIME` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '订单预约时段',
  `FEE` double(20, 2) NULL DEFAULT NULL COMMENT '金额',
  `FXMNAME` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '项目名称',
  `FPAYSTATUS` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '支付状态',
  `FDOCNM` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '护士姓名',
  `FDPTNM` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '科室名称',
  `FGOTIME` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '护士出发时间',
  `FARRIVETIME` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '护士到达患者家时间',
  `FIMG1` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '护士到达患者家图片',
  `FIMG2` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '护理记录图片',
  `FBACKTIME` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '护士回到医院时间',
  `WJXCMG` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '现场评估量表',
  `WJZQTYS` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '知情同意书量表',
  `WJHLJL` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '护理记录量表',
  `ADRR` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '地址',
  `ZHIBEI` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '耗材自备情况',
  `JISHUFEE` double(20, 2) NULL DEFAULT NULL COMMENT '技术费',
  `XMFEE` double(20, 2) NULL DEFAULT NULL COMMENT '项目费（出诊费）',
  `HAOCAIFEE` double(20, 2) NULL DEFAULT NULL COMMENT '耗材费',
  `HAOCAI` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '耗材',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '互联网医院订单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_kh_order
-- ----------------------------

-- ----------------------------
-- Table structure for ss_lookafter_project
-- ----------------------------
DROP TABLE IF EXISTS `ss_lookafter_project`;
CREATE TABLE `ss_lookafter_project`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `hospital_id` int NULL DEFAULT NULL COMMENT '医院id',
  `name` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '名称',
  `type_id` int NULL DEFAULT NULL COMMENT '类型',
  `introduce` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '介绍',
  `appointment_desc` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '预约须知',
  `fee_desc` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '费用须知',
  `out_fee` double(10, 2) NULL DEFAULT NULL COMMENT '出诊费',
  `technology_fee` double(10, 2) NULL DEFAULT NULL COMMENT '技术费',
  `consumable_fee` double(10, 2) NULL DEFAULT NULL COMMENT '耗材费',
  `total_money` double(10, 2) NULL DEFAULT NULL COMMENT '总金额',
  `status` int NULL DEFAULT 0 COMMENT '0启用1禁用',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '看护项目' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_lookafter_project
-- ----------------------------

-- ----------------------------
-- Table structure for ss_lookafter_project_type
-- ----------------------------
DROP TABLE IF EXISTS `ss_lookafter_project_type`;
CREATE TABLE `ss_lookafter_project_type`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '看护项目类型' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_lookafter_project_type
-- ----------------------------

-- ----------------------------
-- Table structure for ss_marriage
-- ----------------------------
DROP TABLE IF EXISTS `ss_marriage`;
CREATE TABLE `ss_marriage`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '婚姻状态' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_marriage
-- ----------------------------

-- ----------------------------
-- Table structure for ss_medical_pay
-- ----------------------------
DROP TABLE IF EXISTS `ss_medical_pay`;
CREATE TABLE `ss_medical_pay`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '医疗支付方式' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_medical_pay
-- ----------------------------

-- ----------------------------
-- Table structure for ss_medicine
-- ----------------------------
DROP TABLE IF EXISTS `ss_medicine`;
CREATE TABLE `ss_medicine`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `hospital_id` int NULL DEFAULT NULL COMMENT '医院id',
  `name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '药品名称',
  `code` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '编码',
  `type` int NULL DEFAULT NULL COMMENT '1西药2中成药',
  `img` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '图片',
  `factory` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '厂家',
  `specifications` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '规格',
  `use` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用法',
  `price` double(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `count` int NULL DEFAULT NULL COMMENT '数量',
  `status` int NULL DEFAULT 0 COMMENT '0启用1禁用',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '药品' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_medicine
-- ----------------------------

-- ----------------------------
-- Table structure for ss_msg
-- ----------------------------
DROP TABLE IF EXISTS `ss_msg`;
CREATE TABLE `ss_msg`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `hospital_id` int NULL DEFAULT 0 COMMENT '医院id',
  `title` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '内容',
  `status` int NULL DEFAULT 0 COMMENT '0未发布1发布',
  `add_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '消息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_msg
-- ----------------------------

-- ----------------------------
-- Table structure for ss_nationality
-- ----------------------------
DROP TABLE IF EXISTS `ss_nationality`;
CREATE TABLE `ss_nationality`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '民族' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_nationality
-- ----------------------------

-- ----------------------------
-- Table structure for ss_nurse
-- ----------------------------
DROP TABLE IF EXISTS `ss_nurse`;
CREATE TABLE `ss_nurse`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `hospital_id` int NULL DEFAULT NULL COMMENT '医院id',
  `department_id` int NULL DEFAULT NULL COMMENT '部门id',
  `name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `avatar` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '头像',
  `sex` int NULL DEFAULT NULL COMMENT '1男2女',
  `province` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '省',
  `city` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '市',
  `county` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '区',
  `job` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '工作单位',
  `linkphone` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `id_no` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `special` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '擅长',
  `zcnm` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '职称',
  `on_duty_status` int NULL DEFAULT 0 COMMENT '1值班0未',
  `online_status` int NULL DEFAULT 0 COMMENT '看护服务：0未开通1已开通',
  `password` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT 'e10adc3949ba59abbe56e057f20f883e' COMMENT '密码 默认：123456',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '医护信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_nurse
-- ----------------------------

-- ----------------------------
-- Table structure for ss_order_logistics_type
-- ----------------------------
DROP TABLE IF EXISTS `ss_order_logistics_type`;
CREATE TABLE `ss_order_logistics_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '物流类型' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_order_logistics_type
-- ----------------------------

-- ----------------------------
-- Table structure for ss_order_lookafter
-- ----------------------------
DROP TABLE IF EXISTS `ss_order_lookafter`;
CREATE TABLE `ss_order_lookafter`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `hospital_id` int NULL DEFAULT NULL COMMENT '医院id',
  `no` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `project_id` int NULL DEFAULT NULL COMMENT '项目id',
  `yy_date` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '预约日期',
  `yy_time` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '预约时间段',
  `disease_desc` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '病情描述',
  `nurse_id` int NULL DEFAULT NULL COMMENT '护士id',
  `user_id` int NULL DEFAULT NULL COMMENT '用户id',
  `disease_id` int NULL DEFAULT NULL COMMENT '病患id',
  `linkman` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `linkphone` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `address` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '地址',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  `money` double(10, 2) NULL DEFAULT NULL COMMENT '金额',
  `pay_money` double(10, 2) NULL DEFAULT NULL COMMENT '实付金额',
  `transaction_no` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '交易号',
  `status_id` int NULL DEFAULT NULL COMMENT '订单状态id',
  `refund_reason` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '退款理由',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '看护订单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_order_lookafter
-- ----------------------------

-- ----------------------------
-- Table structure for ss_order_lookafter_status
-- ----------------------------
DROP TABLE IF EXISTS `ss_order_lookafter_status`;
CREATE TABLE `ss_order_lookafter_status`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '看护订单状态' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_order_lookafter_status
-- ----------------------------

-- ----------------------------
-- Table structure for ss_order_wz
-- ----------------------------
DROP TABLE IF EXISTS `ss_order_wz`;
CREATE TABLE `ss_order_wz`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `hospital_id` int NULL DEFAULT NULL COMMENT '医院id',
  `no` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `cf_id` int NULL DEFAULT NULL COMMENT '处方id',
  `doctor_id` int NULL DEFAULT NULL COMMENT '医生id',
  `disease_id` int NULL DEFAULT NULL COMMENT '病患id',
  `user_id` int NULL DEFAULT NULL COMMENT '用户id',
  `linkman` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `linkphone` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `address` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '地址',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  `money` double(10, 2) NULL DEFAULT NULL COMMENT '金额',
  `pay_money` double(10, 2) NULL DEFAULT NULL COMMENT '实付金额',
  `transaction_no` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '交易号',
  `status_id` int NULL DEFAULT NULL COMMENT '订单状态id',
  `refund_reason` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '退款理由',
  `logistics_type_id` int NULL DEFAULT NULL COMMENT '物流类型',
  `logistics_no` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '物流单号',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '问诊订单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_order_wz
-- ----------------------------

-- ----------------------------
-- Table structure for ss_order_wz_status
-- ----------------------------
DROP TABLE IF EXISTS `ss_order_wz_status`;
CREATE TABLE `ss_order_wz_status`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '问诊订单状态' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_order_wz_status
-- ----------------------------

-- ----------------------------
-- Table structure for ss_rc
-- ----------------------------
DROP TABLE IF EXISTS `ss_rc`;
CREATE TABLE `ss_rc`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `device_id` int NULL DEFAULT NULL COMMENT '设备id',
  `device_no` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '设备号',
  `disease_id` int NULL DEFAULT NULL COMMENT '病患id',
  `frq` double(10, 2) NULL DEFAULT NULL COMMENT '频率，单位：HZ',
  `amp` double(10, 2) NULL DEFAULT NULL COMMENT '幅度，单位：mm',
  `time` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '震颤时刻',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '帕金森数据' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_rc
-- ----------------------------

-- ----------------------------
-- Table structure for ss_room_examination
-- ----------------------------
DROP TABLE IF EXISTS `ss_room_examination`;
CREATE TABLE `ss_room_examination`  (
  `Id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `hospitalId` int NULL DEFAULT NULL COMMENT '医院id',
  `sickRoomId` int NULL DEFAULT NULL COMMENT '房间id',
  `RoomUserId` int NULL DEFAULT NULL COMMENT '小屋用户id',
  `DeviceSn` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '设备sn',
  `TestTime` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '体检时间',
  `Bo` double(5, 1) NULL DEFAULT NULL COMMENT '血氧',
  `BoPulse` double(5, 1) NULL DEFAULT NULL COMMENT '血氧脉率',
  `BoTestTime` bigint NULL DEFAULT NULL COMMENT '血氧检测时间',
  `BloodSugar` double(5, 1) NULL DEFAULT NULL COMMENT '血糖',
  `BloodSugarType` int NULL DEFAULT NULL COMMENT '血糖类型(1 空腹，2 餐后 3随机血糖',
  `BloodSugarTestTime` bigint NULL DEFAULT NULL COMMENT '血糖检测时间',
  `BodyTemperature` double(5, 1) NULL DEFAULT NULL COMMENT '耳温（体温）',
  `BodyTemperatureTestTime` bigint NULL DEFAULT NULL COMMENT '体温检测时间',
  `Chol` double(5, 1) NULL DEFAULT NULL COMMENT '总胆固醇',
  `CholTestTime` bigint NULL DEFAULT NULL COMMENT '总胆固醇检测时间',
  `Dbp` double(5, 1) NULL DEFAULT NULL COMMENT '血压舒张压',
  `Sbp` double(5, 1) NULL DEFAULT NULL COMMENT '血压收缩压',
  `Pulse` int NULL DEFAULT NULL COMMENT '血压心率',
  `BloodPressureTestTime` bigint NULL DEFAULT NULL COMMENT '血压检测时间',
  `HeartRate` double(5, 1) NULL DEFAULT NULL COMMENT '心率',
  `HeartRateTestTime` bigint NULL DEFAULT NULL COMMENT '心率检测时间',
  `Height` double(5, 1) NULL DEFAULT NULL COMMENT '身高',
  `Weight` double(5, 1) NULL DEFAULT NULL COMMENT '体重',
  `Bmi` double(5, 1) NULL DEFAULT NULL COMMENT '身体质量指数',
  `HeightWeightTestTime` bigint NULL DEFAULT NULL COMMENT '身高体重检测时间',
  `Uric` double(5, 1) NULL DEFAULT NULL COMMENT '尿酸',
  `UricTestTime` bigint NULL DEFAULT NULL COMMENT '尿酸检测时间',
  `LDbp` double(5, 1) NULL DEFAULT NULL COMMENT '左臂舒张压',
  `LSbp` double(5, 1) NULL DEFAULT NULL COMMENT '左臂收缩压',
  `LPulse` double(5, 1) NULL DEFAULT NULL COMMENT '左臂心率',
  `LBloodPressureTestTime` bigint NULL DEFAULT NULL COMMENT '左臂血压检测时间',
  `BecgAdvice_img` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '心电图结果图片',
  `Ecg12_img` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '心电12结果图片',
  `EcgResult` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '心电结果',
  `EcgTestTime` bigint NULL DEFAULT NULL COMMENT '心电检测时间',
  `Hemoglobin` double(5, 1) NULL DEFAULT NULL COMMENT '血红蛋白',
  `HemoglobinTestTime` bigint NULL DEFAULT NULL COMMENT '血红蛋白检测时间',
  `BloodFatChol` double(5, 1) NULL DEFAULT NULL COMMENT '总胆固醇',
  `BloodFatHdl` double(5, 1) NULL DEFAULT NULL COMMENT '高密度脂蛋白',
  `BloodFatLdl` double(5, 1) NULL DEFAULT NULL COMMENT '低密度脂蛋白',
  `BloodFatTriglycerides` double(5, 1) NULL DEFAULT NULL COMMENT '甘油三酯',
  `BloodFatTestTime` bigint NULL DEFAULT NULL COMMENT '血脂检测时间',
  `Fat` double(5, 1) NULL DEFAULT NULL COMMENT '脂肪率',
  `Bmr` double(5, 1) NULL DEFAULT NULL COMMENT '基础代谢率',
  `MoistureContent` double(5, 1) NULL DEFAULT NULL COMMENT '水分含量',
  `FatTestTime` bigint NULL DEFAULT NULL COMMENT '脂肪检测时间',
  `Waistline` double(5, 1) NULL DEFAULT NULL COMMENT '腰围',
  `Hipline` double(5, 1) NULL DEFAULT NULL COMMENT '臀围',
  `Whr` double(5, 1) NULL DEFAULT NULL COMMENT '腰臀比',
  `WHRTestTime` bigint NULL DEFAULT NULL COMMENT '腰臀比检测时间',
  `Urinalysis` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '尿常规',
  `UrinalysisTestTime` bigint NULL DEFAULT NULL COMMENT '尿常规检测时间',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '体检数据' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_room_examination
-- ----------------------------

-- ----------------------------
-- Table structure for ss_room_suggest
-- ----------------------------
DROP TABLE IF EXISTS `ss_room_suggest`;
CREATE TABLE `ss_room_suggest`  (
  `ExaminationId` int NULL DEFAULT NULL COMMENT '体检id',
  `PhysicalItemName` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '体检项目名称',
  `PhysicalItemParentName` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '体检项目父级名称',
  `PhysicalItemParmName` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '体检项目参数配置名称',
  `PhysicalItemUnits` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '检测项目单位',
  `ReferenceValue` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '参考范围',
  `SpecialhandleStatus` int NULL DEFAULT NULL COMMENT '是否特殊处理状态（1-- 特殊处理（字符型），0-- 不特殊处理（数值型））',
  `ReviewCycle` int NULL DEFAULT NULL COMMENT '检测周期',
  `Status` int NULL DEFAULT NULL COMMENT '状态（1--正常，0--异常）',
  `TypeSpecialPar` double(10, 2) NULL DEFAULT NULL COMMENT '特殊处理状态下的检测值',
  `TypeParameter` double(10, 2) NULL DEFAULT NULL COMMENT '检测值',
  `TestTime` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '检测时间',
  `SportSuggestContent` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '运动建议',
  `KnowledgeSuggestContent` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '健康常识',
  `CompositeSuggestContent` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '综合建议',
  `HealthSuggestContent` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '养生建议',
  `DrinkSuggestContent` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '饮食建议'
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '体检建议' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_room_suggest
-- ----------------------------

-- ----------------------------
-- Table structure for ss_room_user
-- ----------------------------
DROP TABLE IF EXISTS `ss_room_user`;
CREATE TABLE `ss_room_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `hospitalId` int NULL DEFAULT NULL COMMENT '场所机构id',
  `FullName` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `Sex` int NULL DEFAULT NULL COMMENT '1男2女',
  `IdCard` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '证号',
  `Mobile` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `NationalityId` int NULL DEFAULT NULL COMMENT '民族id',
  `BirthDay` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '出生日期',
  `HeadImg` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '身份证头像',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '健康小屋用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_room_user
-- ----------------------------

-- ----------------------------
-- Table structure for ss_rx
-- ----------------------------
DROP TABLE IF EXISTS `ss_rx`;
CREATE TABLE `ss_rx`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `device_id` int NULL DEFAULT NULL COMMENT '设备id',
  `device_no` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '设备号',
  `disease_id` int NULL DEFAULT NULL COMMENT '病患id',
  `averageFreezedDuration` int NULL DEFAULT NULL COMMENT '平均冻结时长,单位秒',
  `belongDate` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '数据归属日期(格 式:yyyyMMdd)',
  `maxFreezedDuration` int NULL DEFAULT NULL COMMENT '最长冻结时长,单位秒',
  `maxFreezedLevel` int NULL DEFAULT NULL COMMENT '最长冻结时间等级(1/无,2/很 短,3/短,4/长,5/非常长)',
  `maxHappendAt` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '最长冻结发生时间(时间戳)',
  `moveStatus` int NULL DEFAULT NULL COMMENT '当日是否有活动(1/有,0/无)',
  `totalFreezedCount` int NULL DEFAULT NULL COMMENT '总计冻结发生次数',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '帕金森数据' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_rx
-- ----------------------------

-- ----------------------------
-- Table structure for ss_sickroom
-- ----------------------------
DROP TABLE IF EXISTS `ss_sickroom`;
CREATE TABLE `ss_sickroom`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `hospital_id` int NULL DEFAULT NULL COMMENT '医院id',
  `department_id` int NULL DEFAULT NULL COMMENT '科室id',
  `type` int NULL DEFAULT 1 COMMENT '1医院病房2家庭病房3健康小屋',
  `name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '名称',
  `img` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '图片',
  `province` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '省',
  `city` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '市',
  `county` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '区',
  `longitude` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '经度',
  `latitude` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '纬度',
  `address` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '地址',
  `fileId` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '模型id',
  `spaceId` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '全屋空间id',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '病房信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_sickroom
-- ----------------------------

-- ----------------------------
-- Table structure for ss_sickroom_bed
-- ----------------------------
DROP TABLE IF EXISTS `ss_sickroom_bed`;
CREATE TABLE `ss_sickroom_bed`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sickroom_id` int NULL DEFAULT NULL COMMENT '病房id',
  `device_no` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '设备号',
  `disease_id` int NULL DEFAULT NULL COMMENT '病患id',
  `ppmInfoAlarmMode` int NULL DEFAULT NULL COMMENT '病人位置监控模式',
  `ppmInfoAlarmStatus` int NULL DEFAULT NULL COMMENT '病人离床报警',
  `transportInfoBrakePosition` int NULL DEFAULT NULL COMMENT '刹车状态',
  `frameArticulationInfoHeadRailsPosition` int NULL DEFAULT NULL COMMENT '头部护栏位置',
  `frameArticulationInfoFootRailsPosition` int NULL DEFAULT NULL COMMENT '脚部护栏位置',
  `surfaceInfoSurfaceMode` int NULL DEFAULT NULL COMMENT '床垫信息',
  `therapyInfoRotationTherapy` int NULL DEFAULT NULL COMMENT '连续翻身',
  `therapyInfoPercussionTherapy` int NULL DEFAULT NULL COMMENT '叩击治疗',
  `therapyInfoVibrationTherapy` int NULL DEFAULT NULL COMMENT '振动治疗',
  `frameArticulationInfoHobAngleInDegrees` double(5, 1) NULL DEFAULT NULL COMMENT '床头角度',
  `scaleInfoPatientWeightInKg` double(7, 2) NULL DEFAULT NULL COMMENT '实时病人体重',
  `scaleInfoPatientDetected` int NULL DEFAULT NULL COMMENT '床上是否有病人',
  `time` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '检测时间',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '病床' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_sickroom_bed
-- ----------------------------

-- ----------------------------
-- Table structure for ss_sickroom_device
-- ----------------------------
DROP TABLE IF EXISTS `ss_sickroom_device`;
CREATE TABLE `ss_sickroom_device`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sickroom_id` int NULL DEFAULT NULL COMMENT '病房id',
  `device_type_id` int NULL DEFAULT NULL COMMENT '设备类型',
  `code` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '编码',
  `xa_state` int NULL DEFAULT 0 COMMENT '0-未知,1_升级中,3_离 床,4_在床,5_光纤故障,6_离线, 10_传感器负荷',
  `yh_state` int NULL DEFAULT 0 COMMENT '药盒设备状态//0：设备离线//5：回复补药完成指令//6：处理按计划或提前计划取药完成指令//7：正在补药//8：正在出药//11：处理提前计划取药指令//12：药筒未安装到位//13：取消药筒卡药异常//17：处理语音下发成功指令//18：处理语音下发失败//33：下发最新脱机计划//37：脱机服药计划日志处理//99：设备上线',
  `hw_warning_state` int NULL DEFAULT 0 COMMENT '华为一键告警设备0离线 1在线',
  `zkxz_state` int NULL DEFAULT 0 COMMENT '中科新知心晓设备0离线1在线',
  `remark` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '其他备注',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '病房设备关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_sickroom_device
-- ----------------------------

-- ----------------------------
-- Table structure for ss_sickroom_disease
-- ----------------------------
DROP TABLE IF EXISTS `ss_sickroom_disease`;
CREATE TABLE `ss_sickroom_disease`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `hospital_id` int NULL DEFAULT NULL COMMENT '医院id',
  `department_id` int NULL DEFAULT NULL COMMENT '科室id',
  `sickroom_id` int NULL DEFAULT NULL COMMENT '病房id',
  `disease_id` int NULL DEFAULT NULL COMMENT '病患id',
  `doctor_id` int NULL DEFAULT NULL COMMENT '医生id',
  `nurse_id` int NULL DEFAULT NULL COMMENT '护士id',
  `user_id` int NULL DEFAULT NULL COMMENT '用户id',
  `status` int NULL DEFAULT 1 COMMENT '0申请1申请通过2申请驳回3入住4出房',
  `remark` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  `weight` double(10, 2) NULL DEFAULT NULL COMMENT '体重',
  `temperature` double(10, 1) NULL DEFAULT NULL COMMENT '体温',
  `rate` int NULL DEFAULT NULL COMMENT '心率',
  `high_blood_pressure` int NULL DEFAULT NULL COMMENT '高压',
  `low_blood_pressure` int NULL DEFAULT NULL COMMENT '低压',
  `blood_glucose` double(10, 1) NULL DEFAULT NULL COMMENT '血糖',
  `oxygen` int NULL DEFAULT NULL COMMENT '血氧',
  `breath_rate` int NULL DEFAULT NULL COMMENT '呼吸率',
  `call_status` int NULL DEFAULT 0 COMMENT '呼叫0未1呼叫',
  `fall_status` int NULL DEFAULT 0 COMMENT '跌倒0未1跌倒',
  `bed_status` int NULL DEFAULT 0 COMMENT '0离床1在床2坠床',
  `dd_status` int NULL DEFAULT 0 COMMENT '输液点滴状态0未输液1输液中',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '出入院' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_sickroom_disease
-- ----------------------------

-- ----------------------------
-- Table structure for ss_sickroom_environment
-- ----------------------------
DROP TABLE IF EXISTS `ss_sickroom_environment`;
CREATE TABLE `ss_sickroom_environment`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sickroom_id` int NULL DEFAULT NULL COMMENT '病房id',
  `device_no` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '设备号sn',
  `temperature` double(10, 2) NULL DEFAULT NULL COMMENT '温度',
  `RH` double(10, 2) NULL DEFAULT NULL COMMENT '湿度',
  `LX` double(10, 2) NULL DEFAULT NULL COMMENT '光照强度',
  `CO2eq` double(10, 2) NULL DEFAULT NULL COMMENT '二氧化碳浓度',
  `PM25` double(10, 2) NULL DEFAULT NULL COMMENT 'PM2.5浓度',
  `PM10` double(10, 2) NULL DEFAULT NULL COMMENT 'PM10浓度',
  `CH2O` double(10, 2) NULL DEFAULT NULL COMMENT '甲醛浓度',
  `TVOC` double(10, 2) NULL DEFAULT NULL COMMENT 'TVOC浓度',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '新生智能-环境监测记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_sickroom_environment
-- ----------------------------

-- ----------------------------
-- Table structure for ss_user
-- ----------------------------
DROP TABLE IF EXISTS `ss_user`;
CREATE TABLE `ss_user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `phone` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `password` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '密码',
  `status` int NULL DEFAULT 0 COMMENT '状态1禁用0启用',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户列表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_user
-- ----------------------------

-- ----------------------------
-- Table structure for ss_wms_environment
-- ----------------------------
DROP TABLE IF EXISTS `ss_wms_environment`;
CREATE TABLE `ss_wms_environment`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `sickroom_id` int NULL DEFAULT NULL COMMENT '房间id',
  `device_id` int NULL DEFAULT NULL COMMENT '设备id',
  `name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '地址名称',
  `device_no` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '设备号',
  `PM25` double(10, 2) NULL DEFAULT NULL COMMENT 'PM2.5',
  `PM10` double(10, 2) NULL DEFAULT NULL COMMENT 'PM10',
  `noise` double(10, 2) NULL DEFAULT NULL COMMENT '噪声',
  `temperature` double(10, 2) NULL DEFAULT NULL COMMENT '气温',
  `RH` double(10, 2) NULL DEFAULT NULL COMMENT '湿度',
  `wind_speed` double(10, 2) NULL DEFAULT NULL COMMENT '风速',
  `wind_force` double(10, 2) NULL DEFAULT NULL COMMENT '风力',
  `wind_direction` double(10, 2) NULL DEFAULT NULL COMMENT '风向',
  `TSP` double(10, 2) NULL DEFAULT NULL COMMENT 'TSP',
  `atmospheric_pressure` double(10, 2) NULL DEFAULT NULL COMMENT '气压',
  `time` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '检测时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '健康小屋环境监测' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_wms_environment
-- ----------------------------

-- ----------------------------
-- Table structure for ss_xsa_alarm
-- ----------------------------
DROP TABLE IF EXISTS `ss_xsa_alarm`;
CREATE TABLE `ss_xsa_alarm`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sickroom_id` int NULL DEFAULT NULL COMMENT '病房id',
  `deviceNo` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '设备号',
  `msgId` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '消息 ID',
  `alarmType` int NULL DEFAULT NULL COMMENT '告警类型',
  `tips` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '告警简介',
  `desc` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '告警描述',
  `currentValue` int NULL DEFAULT NULL COMMENT '当前值',
  `configValue` int NULL DEFAULT NULL COMMENT '配置值',
  `happenAt` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '发生时间',
  `currentAt` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '当前时间',
  `lastTime` int NULL DEFAULT NULL COMMENT '持续时间',
  `status` int NULL DEFAULT 0 COMMENT '0未处理1已处理',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '信尚安告警数据' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_xsa_alarm
-- ----------------------------

-- ----------------------------
-- Table structure for ss_xsa_msgtype_2
-- ----------------------------
DROP TABLE IF EXISTS `ss_xsa_msgtype_2`;
CREATE TABLE `ss_xsa_msgtype_2`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `device_id` int NULL DEFAULT NULL COMMENT '设备id',
  `deviceNo` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '设备号',
  `disease_id` int NULL DEFAULT NULL COMMENT '病患id',
  `avgHeart` int NULL DEFAULT NULL COMMENT '每分钟心率值',
  `avgBreath` int NULL DEFAULT NULL COMMENT '每分钟呼吸值',
  `totalMotion` int NULL DEFAULT NULL COMMENT '每分钟体动值',
  `networkState` int NULL DEFAULT NULL COMMENT '0_在线数据 1_离线数据',
  `add_time` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '发送时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '尚信安床垫每分钟心率呼吸数据' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_xsa_msgtype_2
-- ----------------------------

-- ----------------------------
-- Table structure for ss_xsa_state
-- ----------------------------
DROP TABLE IF EXISTS `ss_xsa_state`;
CREATE TABLE `ss_xsa_state`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `device_id` int NULL DEFAULT NULL COMMENT '设备id',
  `deviceNo` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '设备号',
  `disease_id` int NULL DEFAULT NULL COMMENT '病患id',
  `state` int NULL DEFAULT NULL,
  `status` int NULL DEFAULT 0 COMMENT '0未处理1已处理',
  `time` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '信尚安告警数据' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_xsa_state
-- ----------------------------

-- ----------------------------
-- Table structure for ss_yh_baseinfo
-- ----------------------------
DROP TABLE IF EXISTS `ss_yh_baseinfo`;
CREATE TABLE `ss_yh_baseinfo`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sickroom_id` int NULL DEFAULT NULL COMMENT '病房id',
  `device_no` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '设备sn',
  `gridId` int NULL DEFAULT NULL COMMENT '格子',
  `flag` int NULL DEFAULT NULL COMMENT '药格是否有效  0 表示有效  1表示无效',
  `drugName` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '药名',
  `num` int NULL DEFAULT NULL COMMENT '数量',
  `add_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '药盒基本信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_yh_baseinfo
-- ----------------------------

-- ----------------------------
-- Table structure for ss_yh_remind
-- ----------------------------
DROP TABLE IF EXISTS `ss_yh_remind`;
CREATE TABLE `ss_yh_remind`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sickroom_id` int NULL DEFAULT NULL COMMENT '病房',
  `time` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '时间',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_yh_remind
-- ----------------------------

-- ----------------------------
-- Table structure for ss_yh_save_medicine
-- ----------------------------
DROP TABLE IF EXISTS `ss_yh_save_medicine`;
CREATE TABLE `ss_yh_save_medicine`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sickroom_id` int NULL DEFAULT NULL COMMENT '药盒id',
  `device_no` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'sn码即code码',
  `gridId` int NULL DEFAULT NULL COMMENT '格子id',
  `drugName` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '药品名称',
  `num` int NULL DEFAULT NULL COMMENT '数量',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '药盒存药' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_yh_save_medicine
-- ----------------------------

-- ----------------------------
-- Table structure for ss_yh_take_medicine
-- ----------------------------
DROP TABLE IF EXISTS `ss_yh_take_medicine`;
CREATE TABLE `ss_yh_take_medicine`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sickroom_id` int NULL DEFAULT NULL COMMENT '病房id',
  `device_no` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'sn码即code',
  `add_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '药盒取药' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_yh_take_medicine
-- ----------------------------

-- ----------------------------
-- Table structure for ss_yh_take_medicine_list
-- ----------------------------
DROP TABLE IF EXISTS `ss_yh_take_medicine_list`;
CREATE TABLE `ss_yh_take_medicine_list`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `take_medicine_id` int NULL DEFAULT NULL COMMENT '取药id',
  `gridId` int NULL DEFAULT NULL COMMENT '格子id',
  `drugName` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '药品名称',
  `num` int NULL DEFAULT NULL COMMENT '数量',
  `add_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '药盒取药详情' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_yh_take_medicine_list
-- ----------------------------

-- ----------------------------
-- Table structure for ss_zkxz_xx
-- ----------------------------
DROP TABLE IF EXISTS `ss_zkxz_xx`;
CREATE TABLE `ss_zkxz_xx`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `device_id` int NULL DEFAULT NULL COMMENT '设备id',
  `device_no` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '设备号',
  `disease_id` int NULL DEFAULT NULL COMMENT '病患id',
  `work` int NULL DEFAULT 0 COMMENT '工作状态0关闭1打开',
  `pulserate` double(10, 2) NULL DEFAULT NULL COMMENT '心率值',
  `breathrate` int NULL DEFAULT NULL COMMENT '呼吸值',
  `status` int NULL DEFAULT 0 COMMENT '0离枕1在床2体动中3运算中4未打开工作状态',
  `bodymove_lvl` int NULL DEFAULT NULL COMMENT '体动级别0无体动1小体动2正常体动3大体动',
  `bodymove` int NULL DEFAULT NULL COMMENT '体动次数',
  `signalLineStatus` int NULL DEFAULT 0 COMMENT '0正常采集2数据信号弱',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '中科新知心晓设备数据' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_zkxz_xx
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
