/*
 Navicat Premium Dump SQL

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50744 (5.7.44-log)
 Source Host           : localhost:3306
 Source Schema         : ims_db

 Target Server Type    : MySQL
 Target Server Version : 50744 (5.7.44-log)
 File Encoding         : 65001

 Date: 27/04/2025 20:19:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (8, 'ims_customers', '客户信息表', NULL, NULL, 'ImsCustomers', 'crud', '', 'com.ruoyi.ims', 'ims', 'customers', '客户信息', 'suyl', '0', '/', NULL, 'admin', '2025-04-07 20:02:07', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (9, 'ims_inventory', '库存信息表', NULL, NULL, 'ImsInventory', 'crud', 'element-ui', 'com.ruoyi.ims', 'ims', 'inventory', '库存信息', 'suyl', '0', '/', '{}', 'admin', '2025-04-07 20:02:07', '', '2025-04-07 20:03:59', NULL);
INSERT INTO `gen_table` VALUES (10, 'ims_inventory_changes', '库存变动记录表', NULL, NULL, 'ImsInventoryChanges', 'crud', 'element-ui', 'com.ruoyi.ims', 'ims', 'changes', '库存变动记录', 'suyl', '0', '/', '{\"parentMenuId\":0}', 'admin', '2025-04-07 20:02:07', '', '2025-04-07 20:06:25', NULL);
INSERT INTO `gen_table` VALUES (11, 'ims_products', '商品信息表', NULL, NULL, 'ImsProducts', 'crud', 'element-ui', 'com.ruoyi.ims', 'ims', 'products', '商品信息', 'suyl', '0', '/', '{}', 'admin', '2025-04-07 20:02:07', '', '2025-04-07 20:06:41', NULL);
INSERT INTO `gen_table` VALUES (12, 'ims_purchases', '采购信息表', NULL, NULL, 'ImsPurchases', 'crud', 'element-ui', 'com.ruoyi.ims', 'ims', 'purchases', '采购信息', 'suyl', '0', '/', '{}', 'admin', '2025-04-07 20:02:07', '', '2025-04-07 20:07:10', NULL);
INSERT INTO `gen_table` VALUES (13, 'ims_sales', '销售信息表', NULL, NULL, 'ImsSales', 'crud', 'element-ui', 'com.ruoyi.ims', 'ims', 'sales', '销售信息', 'suyl', '0', '/', '{}', 'admin', '2025-04-07 20:02:07', '', '2025-04-07 20:07:34', NULL);
INSERT INTO `gen_table` VALUES (14, 'ims_suppliers', '供应商信息表', NULL, NULL, 'ImsSuppliers', 'crud', '', 'com.ruoyi.ims', 'ims', 'suppliers', '供应商信息', 'suyl', '0', '/', NULL, 'admin', '2025-04-07 20:02:07', '', NULL, NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint(20) NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 75 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (38, 8, 'customer_id', '客户的唯一标识符', 'int(11)', 'Long', 'customerId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-04-07 20:02:07', '', NULL);
INSERT INTO `gen_table_column` VALUES (39, 8, 'customer_name', '客户名称', 'varchar(255)', 'String', 'customerName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2025-04-07 20:02:07', '', NULL);
INSERT INTO `gen_table_column` VALUES (40, 8, 'contact_person', '联系人姓名', 'varchar(100)', 'String', 'contactPerson', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-04-07 20:02:07', '', NULL);
INSERT INTO `gen_table_column` VALUES (41, 8, 'contact_number', '联系电话', 'varchar(20)', 'String', 'contactNumber', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-04-07 20:02:07', '', NULL);
INSERT INTO `gen_table_column` VALUES (42, 8, 'address', '客户地址', 'varchar(255)', 'String', 'address', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-04-07 20:02:07', '', NULL);
INSERT INTO `gen_table_column` VALUES (43, 9, 'inventory_id', '库存记录的唯一标识符', 'int(11)', 'Long', 'inventoryId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-04-07 20:02:07', '', '2025-04-07 20:03:59');
INSERT INTO `gen_table_column` VALUES (44, 9, 'product_id', '商品，关联ims_products表的product_id', 'int(11)', 'Long', 'productId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 2, 'admin', '2025-04-07 20:02:07', '', '2025-04-07 20:03:59');
INSERT INTO `gen_table_column` VALUES (45, 9, 'quantity', '当前库存数量', 'int(11)', 'Long', 'quantity', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-04-07 20:02:07', '', '2025-04-07 20:03:59');
INSERT INTO `gen_table_column` VALUES (46, 9, 'last_updated', '最后更新时间', 'timestamp', 'Date', 'lastUpdated', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 4, 'admin', '2025-04-07 20:02:07', '', '2025-04-07 20:03:59');
INSERT INTO `gen_table_column` VALUES (47, 10, 'change_id', '库存变动记录的唯一标识符', 'int(11)', 'Long', 'changeId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-04-07 20:02:07', '', '2025-04-07 20:06:25');
INSERT INTO `gen_table_column` VALUES (48, 10, 'product_id', '商品，关联ims_products表的product_id', 'int(11)', 'Long', 'productId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 2, 'admin', '2025-04-07 20:02:07', '', '2025-04-07 20:06:25');
INSERT INTO `gen_table_column` VALUES (49, 10, 'change_date', '变动日期', 'date', 'Date', 'changeDate', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 3, 'admin', '2025-04-07 20:02:07', '', '2025-04-07 20:06:25');
INSERT INTO `gen_table_column` VALUES (50, 10, 'change_type', '变动类型（采购入库、销售出库等）', 'varchar(50)', 'String', 'changeType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'ims_change_type', 4, 'admin', '2025-04-07 20:02:07', '', '2025-04-07 20:06:25');
INSERT INTO `gen_table_column` VALUES (51, 10, 'quantity_change', '变动数量', 'int(11)', 'Long', 'quantityChange', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-04-07 20:02:07', '', '2025-04-07 20:06:25');
INSERT INTO `gen_table_column` VALUES (52, 10, 'reference_id', '关联的采购或销售记录的ID', 'int(11)', 'Long', 'referenceId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2025-04-07 20:02:07', '', '2025-04-07 20:06:25');
INSERT INTO `gen_table_column` VALUES (53, 11, 'product_id', '商品的唯一标识符', 'int(11)', 'Long', 'productId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-04-07 20:02:07', '', '2025-04-07 20:06:41');
INSERT INTO `gen_table_column` VALUES (54, 11, 'product_name', '商品名称', 'varchar(255)', 'String', 'productName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2025-04-07 20:02:07', '', '2025-04-07 20:06:41');
INSERT INTO `gen_table_column` VALUES (55, 11, 'category', '商品所属类别', 'varchar(100)', 'String', 'category', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', 'ims_product_type', 3, 'admin', '2025-04-07 20:02:07', '', '2025-04-07 20:06:41');
INSERT INTO `gen_table_column` VALUES (56, 11, 'unit_price', '商品单价', 'decimal(10,2)', 'BigDecimal', 'unitPrice', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-04-07 20:02:07', '', '2025-04-07 20:06:41');
INSERT INTO `gen_table_column` VALUES (57, 11, 'description', '商品描述', 'text', 'String', 'description', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 5, 'admin', '2025-04-07 20:02:07', '', '2025-04-07 20:06:41');
INSERT INTO `gen_table_column` VALUES (58, 12, 'purchase_id', '采购记录的唯一标识符', 'int(11)', 'Long', 'purchaseId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-04-07 20:02:07', '', '2025-04-07 20:07:10');
INSERT INTO `gen_table_column` VALUES (59, 12, 'product_id', '采购的商品，关联ims_products表的product_id', 'int(11)', 'Long', 'productId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 2, 'admin', '2025-04-07 20:02:07', '', '2025-04-07 20:07:10');
INSERT INTO `gen_table_column` VALUES (60, 12, 'supplier_id', '供应商，关联ims_suppliers表的supplier_id', 'int(11)', 'Long', 'supplierId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 3, 'admin', '2025-04-07 20:02:07', '', '2025-04-07 20:07:10');
INSERT INTO `gen_table_column` VALUES (61, 12, 'purchase_date', '采购日期', 'date', 'Date', 'purchaseDate', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 4, 'admin', '2025-04-07 20:02:07', '', '2025-04-07 20:07:10');
INSERT INTO `gen_table_column` VALUES (62, 12, 'quantity', '采购数量', 'int(11)', 'Long', 'quantity', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-04-07 20:02:07', '', '2025-04-07 20:07:10');
INSERT INTO `gen_table_column` VALUES (63, 12, 'total_amount', '采购总金额', 'decimal(10,2)', 'BigDecimal', 'totalAmount', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2025-04-07 20:02:07', '', '2025-04-07 20:07:10');
INSERT INTO `gen_table_column` VALUES (64, 13, 'sale_id', '销售记录的唯一标识符', 'int(11)', 'Long', 'saleId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-04-07 20:02:07', '', '2025-04-07 20:07:35');
INSERT INTO `gen_table_column` VALUES (65, 13, 'product_id', '销售的商品，关联ims_products表的product_id', 'int(11)', 'Long', 'productId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 2, 'admin', '2025-04-07 20:02:07', '', '2025-04-07 20:07:35');
INSERT INTO `gen_table_column` VALUES (66, 13, 'customer_id', '客户，关联ims_customers表的customer_id', 'int(11)', 'Long', 'customerId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 3, 'admin', '2025-04-07 20:02:07', '', '2025-04-07 20:07:35');
INSERT INTO `gen_table_column` VALUES (67, 13, 'sale_date', '销售日期', 'date', 'Date', 'saleDate', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 4, 'admin', '2025-04-07 20:02:07', '', '2025-04-07 20:07:35');
INSERT INTO `gen_table_column` VALUES (68, 13, 'quantity', '销售数量', 'int(11)', 'Long', 'quantity', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-04-07 20:02:07', '', '2025-04-07 20:07:35');
INSERT INTO `gen_table_column` VALUES (69, 13, 'total_amount', '销售总金额', 'decimal(10,2)', 'BigDecimal', 'totalAmount', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2025-04-07 20:02:07', '', '2025-04-07 20:07:35');
INSERT INTO `gen_table_column` VALUES (70, 14, 'supplier_id', '供应商的唯一标识符', 'int(11)', 'Long', 'supplierId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-04-07 20:02:07', '', NULL);
INSERT INTO `gen_table_column` VALUES (71, 14, 'supplier_name', '供应商名称', 'varchar(255)', 'String', 'supplierName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2025-04-07 20:02:07', '', NULL);
INSERT INTO `gen_table_column` VALUES (72, 14, 'contact_person', '联系人姓名', 'varchar(100)', 'String', 'contactPerson', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-04-07 20:02:07', '', NULL);
INSERT INTO `gen_table_column` VALUES (73, 14, 'contact_number', '联系电话', 'varchar(20)', 'String', 'contactNumber', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-04-07 20:02:07', '', NULL);
INSERT INTO `gen_table_column` VALUES (74, 14, 'address', '供应商地址', 'varchar(255)', 'String', 'address', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-04-07 20:02:07', '', NULL);

-- ----------------------------
-- Table structure for ims_customers
-- ----------------------------
DROP TABLE IF EXISTS `ims_customers`;
CREATE TABLE `ims_customers`  (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '客户的唯一标识符',
  `customer_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '客户名称',
  `contact_person` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '联系人姓名',
  `contact_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '联系电话',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '客户地址',
  PRIMARY KEY (`customer_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '客户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ims_customers
-- ----------------------------
INSERT INTO `ims_customers` VALUES (1, '李四', '小飞2', '18909091111', '驻马店汝南');
INSERT INTO `ims_customers` VALUES (2, '2', '2', '2', '2');

-- ----------------------------
-- Table structure for ims_inventory
-- ----------------------------
DROP TABLE IF EXISTS `ims_inventory`;
CREATE TABLE `ims_inventory`  (
  `inventory_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '库存记录的唯一标识符',
  `product_id` int(11) NOT NULL COMMENT '商品，关联ims_products表的product_id',
  `quantity` int(11) NOT NULL COMMENT '当前库存数量',
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`inventory_id`) USING BTREE,
  UNIQUE INDEX `product_id`(`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '库存信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ims_inventory
-- ----------------------------
INSERT INTO `ims_inventory` VALUES (1, 1, 1862, '2025-04-27 16:35:09');
INSERT INTO `ims_inventory` VALUES (4, 2, 23014, '2025-04-27 16:38:00');

-- ----------------------------
-- Table structure for ims_inventory_changes
-- ----------------------------
DROP TABLE IF EXISTS `ims_inventory_changes`;
CREATE TABLE `ims_inventory_changes`  (
  `change_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '库存变动记录的唯一标识符',
  `product_id` int(11) NOT NULL COMMENT '商品，关联ims_products表的product_id',
  `change_date` date NOT NULL COMMENT '变动日期',
  `change_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '变动类型（采购入库、销售出库等）',
  `quantity_change` int(11) NOT NULL COMMENT '变动数量',
  `reference_id` int(11) NULL DEFAULT NULL COMMENT '关联的采购或销售记录的ID',
  PRIMARY KEY (`change_id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '库存变动记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ims_inventory_changes
-- ----------------------------
INSERT INTO `ims_inventory_changes` VALUES (3, 1, '2025-04-11', 'cgrk', 2000, 1);
INSERT INTO `ims_inventory_changes` VALUES (4, 1, '2025-04-11', 'xsck', 150, 1);
INSERT INTO `ims_inventory_changes` VALUES (5, 1, '2025-04-11', 'cgrk', 12, 1);
INSERT INTO `ims_inventory_changes` VALUES (6, 1, '2025-04-27', 'cgrk', 2, 1);
INSERT INTO `ims_inventory_changes` VALUES (7, 1, '2025-04-27', 'xsck', 2, 1);
INSERT INTO `ims_inventory_changes` VALUES (8, 2, '2025-04-27', 'cgrk', 23014, 1);

-- ----------------------------
-- Table structure for ims_products
-- ----------------------------
DROP TABLE IF EXISTS `ims_products`;
CREATE TABLE `ims_products`  (
  `product_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品的唯一标识符',
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '商品名称',
  `category` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '商品所属类别',
  `unit_price` decimal(10, 2) NOT NULL COMMENT '商品单价',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '商品描述',
  PRIMARY KEY (`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '商品信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ims_products
-- ----------------------------
INSERT INTO `ims_products` VALUES (1, '小米15', 'sj', 4999.00, '旗舰');
INSERT INTO `ims_products` VALUES (2, 'Redmi Note 14', 'sj', 1999.00, '一代神机');

-- ----------------------------
-- Table structure for ims_purchases
-- ----------------------------
DROP TABLE IF EXISTS `ims_purchases`;
CREATE TABLE `ims_purchases`  (
  `purchase_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '采购记录的唯一标识符',
  `product_id` int(11) NOT NULL COMMENT '采购的商品，关联ims_products表的product_id',
  `supplier_id` int(11) NOT NULL COMMENT '供应商，关联ims_suppliers表的supplier_id',
  `purchase_date` date NOT NULL COMMENT '采购日期',
  `quantity` int(11) NOT NULL COMMENT '采购数量',
  `total_amount` decimal(10, 2) NOT NULL COMMENT '采购总金额',
  PRIMARY KEY (`purchase_id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE,
  INDEX `supplier_id`(`supplier_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '采购信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ims_purchases
-- ----------------------------
INSERT INTO `ims_purchases` VALUES (1, 1, 1, '2025-04-24', 12, 1.00);
INSERT INTO `ims_purchases` VALUES (2, 1, 1, '2025-04-30', 2222, 1.00);
INSERT INTO `ims_purchases` VALUES (3, 1, 1, '2025-04-01', 222, 1.00);
INSERT INTO `ims_purchases` VALUES (4, 1, 1, '2025-04-01', 222, 1.00);
INSERT INTO `ims_purchases` VALUES (5, 1, 1, '2025-04-01', 222, 1.00);
INSERT INTO `ims_purchases` VALUES (6, 1, 1, '2025-04-01', 222, 1.00);
INSERT INTO `ims_purchases` VALUES (7, 1, 1, '2025-04-01', 222, 1.00);
INSERT INTO `ims_purchases` VALUES (8, 1, 1, '2025-04-01', 222, 1.00);
INSERT INTO `ims_purchases` VALUES (9, 1, 1, '2025-04-01', 222, 1.00);
INSERT INTO `ims_purchases` VALUES (10, 1, 1, '2025-04-01', 2000, 200000.00);
INSERT INTO `ims_purchases` VALUES (11, 1, 1, '2025-04-02', 12, 12000.00);
INSERT INTO `ims_purchases` VALUES (12, 1, 1, '2025-04-16', 2, 2.00);
INSERT INTO `ims_purchases` VALUES (13, 2, 2, '2025-04-30', 23014, 123698.00);

-- ----------------------------
-- Table structure for ims_sales
-- ----------------------------
DROP TABLE IF EXISTS `ims_sales`;
CREATE TABLE `ims_sales`  (
  `sale_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '销售记录的唯一标识符',
  `product_id` int(11) NOT NULL COMMENT '销售的商品，关联ims_products表的product_id',
  `customer_id` int(11) NOT NULL COMMENT '客户，关联ims_customers表的customer_id',
  `sale_date` date NOT NULL COMMENT '销售日期',
  `quantity` int(11) NOT NULL COMMENT '销售数量',
  `total_amount` decimal(10, 2) NOT NULL COMMENT '销售总金额',
  PRIMARY KEY (`sale_id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE,
  INDEX `customer_id`(`customer_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '销售信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ims_sales
-- ----------------------------
INSERT INTO `ims_sales` VALUES (1, 1, 1, '2025-04-01', 212, 1.00);
INSERT INTO `ims_sales` VALUES (2, 1, 1, '2025-04-01', 21, 1.00);
INSERT INTO `ims_sales` VALUES (3, 1, 1, '2025-04-01', 21, 1.00);
INSERT INTO `ims_sales` VALUES (4, 1, 1, '2025-04-01', 21, 1.00);
INSERT INTO `ims_sales` VALUES (5, 1, 1, '2025-04-01', 150, 2000.00);
INSERT INTO `ims_sales` VALUES (6, 1, 1, '2025-04-30', 2, 2.00);

-- ----------------------------
-- Table structure for ims_suppliers
-- ----------------------------
DROP TABLE IF EXISTS `ims_suppliers`;
CREATE TABLE `ims_suppliers`  (
  `supplier_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '供应商的唯一标识符',
  `supplier_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '供应商名称',
  `contact_person` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '联系人姓名',
  `contact_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '联系电话',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '供应商地址',
  PRIMARY KEY (`supplier_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '供应商信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ims_suppliers
-- ----------------------------
INSERT INTO `ims_suppliers` VALUES (1, '大飞商贸2', '大飞2', '18909091111', '河南驻马店');
INSERT INTO `ims_suppliers` VALUES (2, '2', '2', '2', '2');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(13) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(13) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(13) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(13) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(7) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(12) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(10) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(13) NOT NULL COMMENT '开始时间',
  `end_time` bigint(13) NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(2) NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2025-04-07 19:36:24', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2025-04-07 19:36:24', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2025-04-07 19:36:24', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'false', 'Y', 'admin', '2025-04-07 19:36:24', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2025-04-07 19:36:24', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2025-04-07 19:36:24', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-04-07 19:36:23', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-04-07 19:36:23', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-04-07 19:36:23', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-04-07 19:36:23', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-04-07 19:36:23', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-04-07 19:36:23', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-04-07 19:36:23', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-04-07 19:36:23', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-04-07 19:36:23', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-04-07 19:36:23', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 108 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2025-04-07 19:36:24', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-04-07 19:36:24', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-04-07 19:36:24', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2025-04-07 19:36:24', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2025-04-07 19:36:24', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2025-04-07 19:36:24', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2025-04-07 19:36:24', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2025-04-07 19:36:24', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2025-04-07 19:36:24', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2025-04-07 19:36:24', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2025-04-07 19:36:24', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2025-04-07 19:36:24', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2025-04-07 19:36:24', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2025-04-07 19:36:24', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2025-04-07 19:36:24', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2025-04-07 19:36:24', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2025-04-07 19:36:24', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-04-07 19:36:24', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-04-07 19:36:24', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-04-07 19:36:24', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-04-07 19:36:24', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2025-04-07 19:36:24', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-04-07 19:36:24', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-04-07 19:36:24', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-04-07 19:36:24', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-04-07 19:36:24', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-04-07 19:36:24', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2025-04-07 19:36:24', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2025-04-07 19:36:24', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 0, '手机', 'sj', 'ims_product_type', NULL, 'default', 'N', '0', 'admin', '2025-04-07 19:58:43', 'admin', '2025-04-07 19:59:06', NULL);
INSERT INTO `sys_dict_data` VALUES (101, 1, '手机配件', 'sjpj', 'ims_product_type', NULL, 'default', 'N', '0', 'admin', '2025-04-07 19:58:56', 'admin', '2025-04-07 20:00:20', NULL);
INSERT INTO `sys_dict_data` VALUES (102, 3, '电脑平板', 'dnpb', 'ims_product_type', NULL, 'default', 'N', '0', 'admin', '2025-04-07 19:59:36', 'admin', '2025-04-07 20:00:30', NULL);
INSERT INTO `sys_dict_data` VALUES (103, 2, '智能穿戴', 'zncd', 'ims_product_type', NULL, 'default', 'N', '0', 'admin', '2025-04-07 19:59:53', 'admin', '2025-04-07 20:00:24', NULL);
INSERT INTO `sys_dict_data` VALUES (104, 4, '电视', 'ds', 'ims_product_type', NULL, 'default', 'N', '0', 'admin', '2025-04-07 20:00:04', 'admin', '2025-04-07 20:00:36', NULL);
INSERT INTO `sys_dict_data` VALUES (105, 5, '空调', 'kt', 'ims_product_type', NULL, 'default', 'N', '0', 'admin', '2025-04-07 20:00:12', 'admin', '2025-04-07 20:00:41', NULL);
INSERT INTO `sys_dict_data` VALUES (106, 1, '采购入库', 'cgrk', 'ims_change_type', NULL, 'success', 'N', '0', 'admin', '2025-04-07 20:05:44', 'admin', '2025-04-11 20:57:24', NULL);
INSERT INTO `sys_dict_data` VALUES (107, 2, '销售出库', 'xsck', 'ims_change_type', NULL, 'primary', 'N', '0', 'admin', '2025-04-07 20:05:57', 'admin', '2025-04-11 20:57:40', NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2025-04-07 19:36:23', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2025-04-07 19:36:23', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2025-04-07 19:36:23', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2025-04-07 19:36:23', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2025-04-07 19:36:23', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2025-04-07 19:36:23', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2025-04-07 19:36:23', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2025-04-07 19:36:23', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2025-04-07 19:36:23', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2025-04-07 19:36:23', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '商品类别', 'ims_product_type', '0', 'admin', '2025-04-07 19:58:00', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (101, '变动类型', 'ims_change_type', '0', 'admin', '2025-04-07 20:05:26', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2025-04-07 19:36:24', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2025-04-07 19:36:24', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2025-04-07 19:36:24', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status`) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 181 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (1, 'admin', '192.168.1.114', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-19 22:45:27');
INSERT INTO `sys_logininfor` VALUES (2, 'admin', '192.168.1.114', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-19 23:57:24');
INSERT INTO `sys_logininfor` VALUES (3, 'admin', '192.168.1.114', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-19 23:59:12');
INSERT INTO `sys_logininfor` VALUES (4, 'admin', '192.168.1.114', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '1', '验证码错误', '2025-04-20 00:24:01');
INSERT INTO `sys_logininfor` VALUES (5, 'admin', '192.168.1.114', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-20 00:24:06');
INSERT INTO `sys_logininfor` VALUES (6, 'admin', '192.168.1.114', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '1', '验证码错误', '2025-04-20 00:54:33');
INSERT INTO `sys_logininfor` VALUES (7, 'admin', '192.168.1.114', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '1', '验证码错误', '2025-04-20 00:55:07');
INSERT INTO `sys_logininfor` VALUES (8, 'admin', '192.168.1.114', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '1', '验证码错误', '2025-04-20 00:55:14');
INSERT INTO `sys_logininfor` VALUES (9, 'admin', '192.168.1.114', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-20 00:55:18');
INSERT INTO `sys_logininfor` VALUES (10, 'admin', '192.168.1.114', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-20 01:19:44');
INSERT INTO `sys_logininfor` VALUES (11, 'admin', '192.168.1.114', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-20 10:45:46');
INSERT INTO `sys_logininfor` VALUES (12, 'admin', '192.168.1.114', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-20 10:46:06');
INSERT INTO `sys_logininfor` VALUES (13, 'admin', '192.168.1.114', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-20 10:48:55');
INSERT INTO `sys_logininfor` VALUES (14, 'admin', '192.168.1.114', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-20 10:49:31');
INSERT INTO `sys_logininfor` VALUES (15, 'admin', '192.168.1.114', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-20 10:49:58');
INSERT INTO `sys_logininfor` VALUES (16, 'admin', '192.168.1.114', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-20 10:51:17');
INSERT INTO `sys_logininfor` VALUES (17, 'admin', '192.168.1.114', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-20 10:55:49');
INSERT INTO `sys_logininfor` VALUES (18, 'admin', '192.168.1.114', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-04-20 11:00:41');
INSERT INTO `sys_logininfor` VALUES (19, 'admin', '192.168.1.114', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-20 11:00:47');
INSERT INTO `sys_logininfor` VALUES (20, 'admin', '192.168.1.114', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-20 11:00:55');
INSERT INTO `sys_logininfor` VALUES (21, 'admin', '192.168.1.114', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-20 11:01:24');
INSERT INTO `sys_logininfor` VALUES (22, 'admin', '192.168.1.114', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-20 11:07:10');
INSERT INTO `sys_logininfor` VALUES (23, 'admin', '192.168.1.114', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-20 11:13:00');
INSERT INTO `sys_logininfor` VALUES (24, 'admin', '192.168.1.114', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-20 11:19:58');
INSERT INTO `sys_logininfor` VALUES (25, 'admin', '192.168.1.114', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-20 11:23:45');
INSERT INTO `sys_logininfor` VALUES (26, 'admin', '192.168.1.114', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-20 11:27:11');
INSERT INTO `sys_logininfor` VALUES (27, 'admin', '192.168.1.114', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-20 11:51:25');
INSERT INTO `sys_logininfor` VALUES (28, 'admin', '192.168.1.114', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-20 11:52:17');
INSERT INTO `sys_logininfor` VALUES (29, 'admin', '192.168.1.114', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-20 11:53:32');
INSERT INTO `sys_logininfor` VALUES (30, 'admin', '192.168.1.114', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-20 11:55:46');
INSERT INTO `sys_logininfor` VALUES (31, 'admin', '192.168.1.114', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-20 12:02:47');
INSERT INTO `sys_logininfor` VALUES (32, 'admin', '192.168.1.114', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-20 12:04:53');
INSERT INTO `sys_logininfor` VALUES (33, 'admin', '192.168.1.114', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-20 12:11:12');
INSERT INTO `sys_logininfor` VALUES (34, 'admin', '192.168.1.114', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-20 12:12:01');
INSERT INTO `sys_logininfor` VALUES (35, 'admin', '192.168.1.114', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-20 12:12:59');
INSERT INTO `sys_logininfor` VALUES (36, 'admin', '192.168.1.114', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-20 12:14:19');
INSERT INTO `sys_logininfor` VALUES (37, 'admin', '192.168.1.114', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-20 12:15:58');
INSERT INTO `sys_logininfor` VALUES (38, 'admin', '192.168.1.114', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '1', '验证码已失效', '2025-04-20 12:22:33');
INSERT INTO `sys_logininfor` VALUES (39, 'admin', '192.168.1.114', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '1', '验证码错误', '2025-04-20 12:22:37');
INSERT INTO `sys_logininfor` VALUES (40, 'admin', '192.168.1.114', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-20 12:25:09');
INSERT INTO `sys_logininfor` VALUES (41, 'admin', '192.168.1.114', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-20 12:28:14');
INSERT INTO `sys_logininfor` VALUES (42, 'admin', '192.168.1.114', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-20 12:33:09');
INSERT INTO `sys_logininfor` VALUES (43, 'admin', '192.168.1.114', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '1', '验证码错误', '2025-04-20 12:34:36');
INSERT INTO `sys_logininfor` VALUES (44, 'admin', '192.168.1.114', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-20 12:34:40');
INSERT INTO `sys_logininfor` VALUES (45, 'admin', '192.168.1.114', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-20 12:37:14');
INSERT INTO `sys_logininfor` VALUES (46, 'admin', '192.168.1.114', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '1', '验证码错误', '2025-04-20 12:37:37');
INSERT INTO `sys_logininfor` VALUES (47, 'admin', '192.168.1.114', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '1', '验证码错误', '2025-04-20 12:37:41');
INSERT INTO `sys_logininfor` VALUES (48, 'admin', '192.168.1.114', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-20 12:37:49');
INSERT INTO `sys_logininfor` VALUES (49, 'admin', '192.168.1.114', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-20 12:40:10');
INSERT INTO `sys_logininfor` VALUES (50, 'admin', '192.168.1.114', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '1', '验证码错误', '2025-04-20 12:40:54');
INSERT INTO `sys_logininfor` VALUES (51, 'admin', '192.168.1.114', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-20 12:40:58');
INSERT INTO `sys_logininfor` VALUES (52, 'admin', '192.168.1.114', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-20 12:52:36');
INSERT INTO `sys_logininfor` VALUES (53, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-20 21:02:22');
INSERT INTO `sys_logininfor` VALUES (54, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-20 21:25:23');
INSERT INTO `sys_logininfor` VALUES (55, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-20 21:26:20');
INSERT INTO `sys_logininfor` VALUES (56, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-20 21:29:46');
INSERT INTO `sys_logininfor` VALUES (57, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-20 21:31:32');
INSERT INTO `sys_logininfor` VALUES (58, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-20 21:32:23');
INSERT INTO `sys_logininfor` VALUES (59, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-20 21:35:00');
INSERT INTO `sys_logininfor` VALUES (60, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-20 21:36:15');
INSERT INTO `sys_logininfor` VALUES (61, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-22 22:26:33');
INSERT INTO `sys_logininfor` VALUES (62, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-22 22:27:01');
INSERT INTO `sys_logininfor` VALUES (63, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-22 22:39:46');
INSERT INTO `sys_logininfor` VALUES (64, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-22 22:41:07');
INSERT INTO `sys_logininfor` VALUES (65, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-22 22:41:20');
INSERT INTO `sys_logininfor` VALUES (66, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-22 22:42:43');
INSERT INTO `sys_logininfor` VALUES (67, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-22 22:59:08');
INSERT INTO `sys_logininfor` VALUES (68, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-22 23:02:13');
INSERT INTO `sys_logininfor` VALUES (69, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-22 23:11:33');
INSERT INTO `sys_logininfor` VALUES (70, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-22 23:12:25');
INSERT INTO `sys_logininfor` VALUES (71, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-22 23:14:19');
INSERT INTO `sys_logininfor` VALUES (72, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-22 23:19:56');
INSERT INTO `sys_logininfor` VALUES (73, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-22 23:20:55');
INSERT INTO `sys_logininfor` VALUES (74, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-22 23:21:27');
INSERT INTO `sys_logininfor` VALUES (75, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-22 23:22:00');
INSERT INTO `sys_logininfor` VALUES (76, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-22 23:23:16');
INSERT INTO `sys_logininfor` VALUES (77, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-22 23:34:05');
INSERT INTO `sys_logininfor` VALUES (78, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-22 23:40:27');
INSERT INTO `sys_logininfor` VALUES (79, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-22 23:42:18');
INSERT INTO `sys_logininfor` VALUES (80, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-22 23:42:55');
INSERT INTO `sys_logininfor` VALUES (81, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-22 23:43:16');
INSERT INTO `sys_logininfor` VALUES (82, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-22 23:57:38');
INSERT INTO `sys_logininfor` VALUES (83, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-23 00:05:29');
INSERT INTO `sys_logininfor` VALUES (84, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-23 00:07:44');
INSERT INTO `sys_logininfor` VALUES (85, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-23 00:17:05');
INSERT INTO `sys_logininfor` VALUES (86, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-23 00:21:47');
INSERT INTO `sys_logininfor` VALUES (87, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-23 00:26:45');
INSERT INTO `sys_logininfor` VALUES (88, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-23 00:27:28');
INSERT INTO `sys_logininfor` VALUES (89, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-23 00:30:55');
INSERT INTO `sys_logininfor` VALUES (90, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-23 00:32:12');
INSERT INTO `sys_logininfor` VALUES (91, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-23 00:32:44');
INSERT INTO `sys_logininfor` VALUES (92, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-23 00:42:03');
INSERT INTO `sys_logininfor` VALUES (93, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-23 00:42:47');
INSERT INTO `sys_logininfor` VALUES (94, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-23 00:46:47');
INSERT INTO `sys_logininfor` VALUES (95, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-23 00:47:24');
INSERT INTO `sys_logininfor` VALUES (96, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-23 00:50:23');
INSERT INTO `sys_logininfor` VALUES (97, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-23 00:57:07');
INSERT INTO `sys_logininfor` VALUES (98, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-23 00:59:08');
INSERT INTO `sys_logininfor` VALUES (99, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-23 01:00:12');
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-23 01:03:35');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-23 01:04:28');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-23 01:04:29');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-23 01:07:54');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-23 01:08:42');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-24 23:51:53');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-25 00:06:46');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-25 00:07:46');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-25 00:22:03');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-25 00:24:12');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-25 00:25:17');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-25 00:29:21');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-25 00:31:25');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-25 00:32:35');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-25 00:34:47');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-25 00:35:24');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-25 00:36:47');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-25 00:37:45');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-26 00:12:10');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-26 00:13:15');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-26 00:14:15');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-26 00:23:41');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-26 00:26:20');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-26 00:28:12');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-26 00:31:46');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-26 00:38:39');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-26 00:44:03');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-26 00:47:49');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-26 22:45:44');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-26 22:52:07');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-26 22:53:47');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-26 22:54:28');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-26 22:55:44');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-26 22:58:44');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-26 22:59:36');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-26 23:00:28');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-26 23:01:14');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-26 23:04:27');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-26 23:06:26');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-26 23:07:05');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-26 23:07:36');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-26 23:08:42');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-26 23:09:52');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-26 23:13:25');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-26 23:14:19');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-26 23:18:34');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-26 23:20:13');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-26 23:21:08');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-26 23:23:18');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-26 23:25:01');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2025-04-26 23:28:13');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2025-04-26 23:48:36');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-26 23:50:22');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2025-04-26 23:52:36');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-26 23:56:17');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2025-04-27 00:02:42');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2025-04-27 00:11:18');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2025-04-27 00:30:42');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2025-04-27 00:32:39');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2025-04-27 00:45:33');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-27 16:11:49');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-27 16:29:57');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-27 16:30:29');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-27 16:30:48');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-27 16:35:20');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-27 16:35:32');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-27 16:37:34');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-27 16:38:08');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-27 19:36:18');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-27 19:36:56');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-27 19:42:28');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-27 19:45:56');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-27 19:47:10');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2025-04-27 19:47:27');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-27 19:54:20');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2025-04-27 19:54:38');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-27 19:56:46');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-27 19:58:40');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2025-04-27 20:06:35');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-27 20:11:18');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2025-04-27 20:18:36');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '路由名称',
  `is_frame` int(1) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2042 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 21, 'system', NULL, '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2025-04-07 19:36:23', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 22, 'monitor', NULL, '', '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2025-04-07 19:36:23', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 23, 'tool', NULL, '', '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2025-04-07 19:36:23', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 24, 'http://ruoyi.vip', NULL, '', '', 0, 0, 'M', '1', '1', '', 'guide', 'admin', '2025-04-07 19:36:23', 'admin', '2025-04-07 19:45:02', '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2025-04-07 19:36:23', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2025-04-07 19:36:23', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2025-04-07 19:36:23', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2025-04-07 19:36:23', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2025-04-07 19:36:23', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2025-04-07 19:36:23', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2025-04-07 19:36:23', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2025-04-07 19:36:23', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2025-04-07 19:36:23', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2025-04-07 19:36:23', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2025-04-07 19:36:23', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2025-04-07 19:36:23', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2025-04-07 19:36:23', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2025-04-07 19:36:23', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2025-04-07 19:36:23', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2025-04-07 19:36:23', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2025-04-07 19:36:23', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2025-04-07 19:36:23', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2025-04-07 19:36:23', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2025-04-07 19:36:23', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '库存变动记录', 0, 6, 'changes', 'ims/changes/index', NULL, '', 1, 1, 'C', '0', '0', 'ims:changes:list', '#', 'admin', '2025-04-07 20:13:22', '', NULL, '库存变动记录菜单');
INSERT INTO `sys_menu` VALUES (2001, '库存变动记录查询', 2000, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ims:changes:query', '#', 'admin', '2025-04-07 20:13:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2002, '库存变动记录新增', 2000, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ims:changes:add', '#', 'admin', '2025-04-07 20:13:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '库存变动记录修改', 2000, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ims:changes:edit', '#', 'admin', '2025-04-07 20:13:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '库存变动记录删除', 2000, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ims:changes:remove', '#', 'admin', '2025-04-07 20:13:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '库存变动记录导出', 2000, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ims:changes:export', '#', 'admin', '2025-04-07 20:13:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '客户信息', 0, 1, 'customers', 'ims/customers/index', NULL, '', 1, 0, 'C', '0', '0', 'ims:customers:list', '#', 'admin', '2025-04-07 20:13:31', '', NULL, '客户信息菜单');
INSERT INTO `sys_menu` VALUES (2007, '客户信息查询', 2006, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ims:customers:query', '#', 'admin', '2025-04-07 20:13:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2008, '客户信息新增', 2006, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ims:customers:add', '#', 'admin', '2025-04-07 20:13:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2009, '客户信息修改', 2006, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ims:customers:edit', '#', 'admin', '2025-04-07 20:13:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2010, '客户信息删除', 2006, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ims:customers:remove', '#', 'admin', '2025-04-07 20:13:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '客户信息导出', 2006, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ims:customers:export', '#', 'admin', '2025-04-07 20:13:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '库存信息', 0, 0, 'inventory', 'ims/inventory/index', NULL, '', 1, 1, 'C', '0', '0', 'ims:inventory:list', '#', 'admin', '2025-04-07 20:13:36', 'admin', '2025-04-11 21:32:32', '库存信息菜单');
INSERT INTO `sys_menu` VALUES (2013, '库存信息查询', 2012, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ims:inventory:query', '#', 'admin', '2025-04-07 20:13:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2014, '库存信息新增', 2012, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ims:inventory:add', '#', 'admin', '2025-04-07 20:13:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, '库存信息修改', 2012, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ims:inventory:edit', '#', 'admin', '2025-04-07 20:13:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, '库存信息删除', 2012, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ims:inventory:remove', '#', 'admin', '2025-04-07 20:13:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '库存信息导出', 2012, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ims:inventory:export', '#', 'admin', '2025-04-07 20:13:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '商品信息', 0, 3, 'products', 'ims/products/index', NULL, '', 1, 0, 'C', '0', '0', 'ims:products:list', '#', 'admin', '2025-04-07 20:13:42', '', NULL, '商品信息菜单');
INSERT INTO `sys_menu` VALUES (2019, '商品信息查询', 2018, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ims:products:query', '#', 'admin', '2025-04-07 20:13:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2020, '商品信息新增', 2018, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ims:products:add', '#', 'admin', '2025-04-07 20:13:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2021, '商品信息修改', 2018, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ims:products:edit', '#', 'admin', '2025-04-07 20:13:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2022, '商品信息删除', 2018, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ims:products:remove', '#', 'admin', '2025-04-07 20:13:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2023, '商品信息导出', 2018, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ims:products:export', '#', 'admin', '2025-04-07 20:13:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2024, '采购信息', 0, 4, 'purchases', 'ims/purchases/index', NULL, '', 1, 0, 'C', '0', '0', 'ims:purchases:list', '#', 'admin', '2025-04-07 20:13:47', '', NULL, '采购信息菜单');
INSERT INTO `sys_menu` VALUES (2025, '采购信息查询', 2024, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ims:purchases:query', '#', 'admin', '2025-04-07 20:13:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2026, '采购信息新增', 2024, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ims:purchases:add', '#', 'admin', '2025-04-07 20:13:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2027, '采购信息修改', 2024, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ims:purchases:edit', '#', 'admin', '2025-04-07 20:13:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2028, '采购信息删除', 2024, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ims:purchases:remove', '#', 'admin', '2025-04-07 20:13:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2029, '采购信息导出', 2024, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ims:purchases:export', '#', 'admin', '2025-04-07 20:13:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2030, '销售信息', 0, 5, 'sales', 'ims/sales/index', NULL, '', 1, 0, 'C', '0', '0', 'ims:sales:list', '#', 'admin', '2025-04-07 20:13:52', '', NULL, '销售信息菜单');
INSERT INTO `sys_menu` VALUES (2031, '销售信息查询', 2030, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ims:sales:query', '#', 'admin', '2025-04-07 20:13:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2032, '销售信息新增', 2030, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ims:sales:add', '#', 'admin', '2025-04-07 20:13:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2033, '销售信息修改', 2030, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ims:sales:edit', '#', 'admin', '2025-04-07 20:13:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2034, '销售信息删除', 2030, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ims:sales:remove', '#', 'admin', '2025-04-07 20:13:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2035, '销售信息导出', 2030, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ims:sales:export', '#', 'admin', '2025-04-07 20:13:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2036, '供应商信息', 0, 2, 'suppliers', 'ims/suppliers/index', NULL, '', 1, 0, 'C', '0', '0', 'ims:suppliers:list', '#', 'admin', '2025-04-07 20:13:57', '', NULL, '供应商信息菜单');
INSERT INTO `sys_menu` VALUES (2037, '供应商信息查询', 2036, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ims:suppliers:query', '#', 'admin', '2025-04-07 20:13:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2038, '供应商信息新增', 2036, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ims:suppliers:add', '#', 'admin', '2025-04-07 20:13:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2039, '供应商信息修改', 2036, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ims:suppliers:edit', '#', 'admin', '2025-04-07 20:13:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2040, '供应商信息删除', 2036, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ims:suppliers:remove', '#', 'admin', '2025-04-07 20:13:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2041, '供应商信息导出', 2036, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ims:suppliers:export', '#', 'admin', '2025-04-07 20:13:57', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2025-04-07 19:36:24', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2025-04-07 19:36:24', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(20) NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type`) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status`) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 211 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '4', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2025-04-07 19:44:56', 22);
INSERT INTO `sys_oper_log` VALUES (101, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-04-07 19:36:23\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-07 19:45:02', 25);
INSERT INTO `sys_oper_log` VALUES (102, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"ims_inventory_changes,ims_inventory,ims_customers,ims_suppliers,ims_sales,ims_purchases,ims_products\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-07 19:49:54', 250);
INSERT INTO `sys_oper_log` VALUES (103, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"customers\",\"className\":\"ImsCustomers\",\"columns\":[{\"capJavaField\":\"CustomerId\",\"columnComment\":\"客户的唯一标识符\",\"columnId\":1,\"columnName\":\"customer_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-07 19:49:54\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"customerId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CustomerName\",\"columnComment\":\"客户名称\",\"columnId\":2,\"columnName\":\"customer_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-07 19:49:54\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"customerName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ContactPerson\",\"columnComment\":\"联系人姓名\",\"columnId\":3,\"columnName\":\"contact_person\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-07 19:49:54\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"contactPerson\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ContactNumber\",\"columnComment\":\"联系电话\",\"columnId\":4,\"columnName\":\"contact_number\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-07 19:49:54\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isI', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-07 19:54:14', 43);
INSERT INTO `sys_oper_log` VALUES (104, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"inventory\",\"className\":\"ImsInventory\",\"columns\":[{\"capJavaField\":\"InventoryId\",\"columnComment\":\"库存记录的唯一标识符\",\"columnId\":6,\"columnName\":\"inventory_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-07 19:49:54\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"inventoryId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ProductId\",\"columnComment\":\"商品，关联ims_products表的product_id\",\"columnId\":7,\"columnName\":\"product_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-07 19:49:54\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"productId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Quantity\",\"columnComment\":\"当前库存数量\",\"columnId\":8,\"columnName\":\"quantity\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-07 19:49:54\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"quantity\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"LastUpdated\",\"columnComment\":\"最后更新时间\",\"columnId\":9,\"columnName\":\"last_updated\",\"columnType\":\"timestamp\",\"createBy\":\"admin\",\"createTime\":\"2025-04-07 19:49:54\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-07 19:55:20', 20);
INSERT INTO `sys_oper_log` VALUES (105, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"changes\",\"className\":\"ImsInventoryChanges\",\"columns\":[{\"capJavaField\":\"ChangeId\",\"columnComment\":\"库存变动记录的唯一标识符\",\"columnId\":10,\"columnName\":\"change_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-07 19:49:54\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"changeId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ProductId\",\"columnComment\":\"商品，关联ims_products表的product_id\",\"columnId\":11,\"columnName\":\"product_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-07 19:49:54\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"productId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ChangeDate\",\"columnComment\":\"变动日期\",\"columnId\":12,\"columnName\":\"change_date\",\"columnType\":\"date\",\"createBy\":\"admin\",\"createTime\":\"2025-04-07 19:49:54\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"changeDate\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ChangeType\",\"columnComment\":\"变动类型（采购入库、销售出库等）\",\"columnId\":13,\"columnName\":\"change_type\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-07 19:49:54\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-07 19:55:36', 29);
INSERT INTO `sys_oper_log` VALUES (106, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"商品类别\",\"dictType\":\"ims_product_type\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-07 19:58:00', 164);
INSERT INTO `sys_oper_log` VALUES (107, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"手机\",\"dictSort\":0,\"dictType\":\"ims_product_type\",\"dictValue\":\"01\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-07 19:58:43', 18);
INSERT INTO `sys_oper_log` VALUES (108, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"手机配件\",\"dictSort\":0,\"dictType\":\"ims_product_type\",\"dictValue\":\"02\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-07 19:58:57', 12);
INSERT INTO `sys_oper_log` VALUES (109, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-04-07 19:58:43\",\"default\":false,\"dictCode\":100,\"dictLabel\":\"手机\",\"dictSort\":0,\"dictType\":\"ims_product_type\",\"dictValue\":\"sj\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-07 19:59:06', 14);
INSERT INTO `sys_oper_log` VALUES (110, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-04-07 19:58:56\",\"default\":false,\"dictCode\":101,\"dictLabel\":\"手机配件\",\"dictSort\":0,\"dictType\":\"ims_product_type\",\"dictValue\":\"sjpj\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-07 19:59:18', 14);
INSERT INTO `sys_oper_log` VALUES (111, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"电脑平板\",\"dictSort\":0,\"dictType\":\"ims_product_type\",\"dictValue\":\"dnpb\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-07 19:59:36', 18);
INSERT INTO `sys_oper_log` VALUES (112, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"智能穿戴\",\"dictSort\":0,\"dictType\":\"ims_product_type\",\"dictValue\":\"zncd\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-07 19:59:53', 15);
INSERT INTO `sys_oper_log` VALUES (113, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"电视\",\"dictSort\":0,\"dictType\":\"ims_product_type\",\"dictValue\":\"ds\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-07 20:00:04', 15);
INSERT INTO `sys_oper_log` VALUES (114, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"空调\",\"dictSort\":0,\"dictType\":\"ims_product_type\",\"dictValue\":\"kt\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-07 20:00:12', 14);
INSERT INTO `sys_oper_log` VALUES (115, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-04-07 19:58:56\",\"default\":false,\"dictCode\":101,\"dictLabel\":\"手机配件\",\"dictSort\":1,\"dictType\":\"ims_product_type\",\"dictValue\":\"sjpj\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-07 20:00:20', 13);
INSERT INTO `sys_oper_log` VALUES (116, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-04-07 19:59:53\",\"default\":false,\"dictCode\":103,\"dictLabel\":\"智能穿戴\",\"dictSort\":2,\"dictType\":\"ims_product_type\",\"dictValue\":\"zncd\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-07 20:00:24', 14);
INSERT INTO `sys_oper_log` VALUES (117, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-04-07 19:59:36\",\"default\":false,\"dictCode\":102,\"dictLabel\":\"电脑平板\",\"dictSort\":3,\"dictType\":\"ims_product_type\",\"dictValue\":\"dnpb\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-07 20:00:30', 13);
INSERT INTO `sys_oper_log` VALUES (118, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-04-07 20:00:04\",\"default\":false,\"dictCode\":104,\"dictLabel\":\"电视\",\"dictSort\":4,\"dictType\":\"ims_product_type\",\"dictValue\":\"ds\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-07 20:00:36', 12);
INSERT INTO `sys_oper_log` VALUES (119, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-04-07 20:00:12\",\"default\":false,\"dictCode\":105,\"dictLabel\":\"空调\",\"dictSort\":5,\"dictType\":\"ims_product_type\",\"dictValue\":\"kt\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-07 20:00:41', 12);
INSERT INTO `sys_oper_log` VALUES (120, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/1,2,3,4,5,6,7', '127.0.0.1', '内网IP', '[1,2,3,4,5,6,7]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-07 20:01:56', 34);
INSERT INTO `sys_oper_log` VALUES (121, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"ims_suppliers,ims_sales,ims_purchases,ims_products,ims_inventory_changes,ims_inventory,ims_customers\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-07 20:02:07', 195);
INSERT INTO `sys_oper_log` VALUES (122, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"inventory\",\"className\":\"ImsInventory\",\"columns\":[{\"capJavaField\":\"InventoryId\",\"columnComment\":\"库存记录的唯一标识符\",\"columnId\":43,\"columnName\":\"inventory_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-07 20:02:07\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"inventoryId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ProductId\",\"columnComment\":\"商品，关联ims_products表的product_id\",\"columnId\":44,\"columnName\":\"product_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-07 20:02:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"productId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Quantity\",\"columnComment\":\"当前库存数量\",\"columnId\":45,\"columnName\":\"quantity\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-07 20:02:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"quantity\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"LastUpdated\",\"columnComment\":\"最后更新时间\",\"columnId\":46,\"columnName\":\"last_updated\",\"columnType\":\"timestamp\",\"createBy\":\"admin\",\"createTime\":\"2025-04-07 20:02:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-07 20:03:59', 42);
INSERT INTO `sys_oper_log` VALUES (123, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"changes\",\"className\":\"ImsInventoryChanges\",\"columns\":[{\"capJavaField\":\"ChangeId\",\"columnComment\":\"库存变动记录的唯一标识符\",\"columnId\":47,\"columnName\":\"change_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-07 20:02:07\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"changeId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ProductId\",\"columnComment\":\"商品，关联ims_products表的product_id\",\"columnId\":48,\"columnName\":\"product_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-07 20:02:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"productId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ChangeDate\",\"columnComment\":\"变动日期\",\"columnId\":49,\"columnName\":\"change_date\",\"columnType\":\"date\",\"createBy\":\"admin\",\"createTime\":\"2025-04-07 20:02:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"changeDate\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ChangeType\",\"columnComment\":\"变动类型（采购入库、销售出库等）\",\"columnId\":50,\"columnName\":\"change_type\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-07 20:02:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-07 20:04:29', 27);
INSERT INTO `sys_oper_log` VALUES (124, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"变动类型\",\"dictType\":\"ims_change_type\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-07 20:05:26', 9);
INSERT INTO `sys_oper_log` VALUES (125, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"采购入库\",\"dictSort\":1,\"dictType\":\"ims_change_type\",\"dictValue\":\"cgrk\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-07 20:05:44', 12);
INSERT INTO `sys_oper_log` VALUES (126, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"销售出库\",\"dictSort\":2,\"dictType\":\"ims_change_type\",\"dictValue\":\"csck\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-07 20:05:57', 10);
INSERT INTO `sys_oper_log` VALUES (127, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-04-07 20:05:57\",\"default\":false,\"dictCode\":107,\"dictLabel\":\"销售出库\",\"dictSort\":2,\"dictType\":\"ims_change_type\",\"dictValue\":\"xsck\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-07 20:06:05', 11);
INSERT INTO `sys_oper_log` VALUES (128, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"changes\",\"className\":\"ImsInventoryChanges\",\"columns\":[{\"capJavaField\":\"ChangeId\",\"columnComment\":\"库存变动记录的唯一标识符\",\"columnId\":47,\"columnName\":\"change_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-07 20:02:07\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"changeId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2025-04-07 20:04:29\",\"usableColumn\":false},{\"capJavaField\":\"ProductId\",\"columnComment\":\"商品，关联ims_products表的product_id\",\"columnId\":48,\"columnName\":\"product_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-07 20:02:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"productId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2025-04-07 20:04:29\",\"usableColumn\":false},{\"capJavaField\":\"ChangeDate\",\"columnComment\":\"变动日期\",\"columnId\":49,\"columnName\":\"change_date\",\"columnType\":\"date\",\"createBy\":\"admin\",\"createTime\":\"2025-04-07 20:02:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"changeDate\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2025-04-07 20:04:29\",\"usableColumn\":false},{\"capJavaField\":\"ChangeType\",\"columnComment\":\"变动类型（采购入库、销售出库等）\",\"columnId\":50,\"columnName\":\"change_type\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-07 20:02:07\",\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-07 20:06:25', 23);
INSERT INTO `sys_oper_log` VALUES (129, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"products\",\"className\":\"ImsProducts\",\"columns\":[{\"capJavaField\":\"ProductId\",\"columnComment\":\"商品的唯一标识符\",\"columnId\":53,\"columnName\":\"product_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-07 20:02:07\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"productId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ProductName\",\"columnComment\":\"商品名称\",\"columnId\":54,\"columnName\":\"product_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-07 20:02:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"productName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Category\",\"columnComment\":\"商品所属类别\",\"columnId\":55,\"columnName\":\"category\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-07 20:02:07\",\"dictType\":\"ims_product_type\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"category\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UnitPrice\",\"columnComment\":\"商品单价\",\"columnId\":56,\"columnName\":\"unit_price\",\"columnType\":\"decimal(10,2)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-07 20:02:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-07 20:06:41', 19);
INSERT INTO `sys_oper_log` VALUES (130, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"purchases\",\"className\":\"ImsPurchases\",\"columns\":[{\"capJavaField\":\"PurchaseId\",\"columnComment\":\"采购记录的唯一标识符\",\"columnId\":58,\"columnName\":\"purchase_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-07 20:02:07\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"purchaseId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ProductId\",\"columnComment\":\"采购的商品，关联ims_products表的product_id\",\"columnId\":59,\"columnName\":\"product_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-07 20:02:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"productId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SupplierId\",\"columnComment\":\"供应商，关联ims_suppliers表的supplier_id\",\"columnId\":60,\"columnName\":\"supplier_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-07 20:02:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"supplierId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PurchaseDate\",\"columnComment\":\"采购日期\",\"columnId\":61,\"columnName\":\"purchase_date\",\"columnType\":\"date\",\"createBy\":\"admin\",\"createTime\":\"2025-04-07 20:02:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-07 20:07:10', 20);
INSERT INTO `sys_oper_log` VALUES (131, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"sales\",\"className\":\"ImsSales\",\"columns\":[{\"capJavaField\":\"SaleId\",\"columnComment\":\"销售记录的唯一标识符\",\"columnId\":64,\"columnName\":\"sale_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-07 20:02:07\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"saleId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ProductId\",\"columnComment\":\"销售的商品，关联ims_products表的product_id\",\"columnId\":65,\"columnName\":\"product_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-07 20:02:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"productId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CustomerId\",\"columnComment\":\"客户，关联ims_customers表的customer_id\",\"columnId\":66,\"columnName\":\"customer_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-07 20:02:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"customerId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SaleDate\",\"columnComment\":\"销售日期\",\"columnId\":67,\"columnName\":\"sale_date\",\"columnType\":\"date\",\"createBy\":\"admin\",\"createTime\":\"2025-04-07 20:02:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInser', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-07 20:07:35', 23);
INSERT INTO `sys_oper_log` VALUES (132, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"ims_customers,ims_inventory,ims_inventory_changes,ims_products,ims_purchases,ims_sales,ims_suppliers\"}', NULL, 0, NULL, '2025-04-07 20:08:44', 1315);
INSERT INTO `sys_oper_log` VALUES (133, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2042', '127.0.0.1', '内网IP', '2042', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2025-04-07 20:15:53', 12);
INSERT INTO `sys_oper_log` VALUES (134, '库存信息', 1, 'com.ruoyi.ims.controller.ImsInventoryController.add()', 'POST', 1, 'admin', '研发部门', '/ims/inventory', '127.0.0.1', '内网IP', '{\"lastUpdated\":\"2025-04-09\",\"params\":{},\"quantity\":2}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'product_id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\96449\\IdeaProjects\\ruoyi-final\\ruoyi-admin\\target\\classes\\mapper\\ims\\ImsInventoryMapper.xml]\r\n### The error may involve com.ruoyi.ims.mapper.ImsInventoryMapper.insertImsInventory-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into ims_inventory          ( quantity,             last_updated )           values ( ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'product_id\' doesn\'t have a default value\n; Field \'product_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'product_id\' doesn\'t have a default value', '2025-04-11 19:04:27', 213);
INSERT INTO `sys_oper_log` VALUES (135, '库存信息', 1, 'com.ruoyi.ims.controller.ImsInventoryController.add()', 'POST', 1, 'admin', '研发部门', '/ims/inventory', '127.0.0.1', '内网IP', '{\"lastUpdated\":\"2025-04-09\",\"params\":{},\"quantity\":2}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'product_id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\96449\\IdeaProjects\\ruoyi-final\\ruoyi-admin\\target\\classes\\mapper\\ims\\ImsInventoryMapper.xml]\r\n### The error may involve com.ruoyi.ims.mapper.ImsInventoryMapper.insertImsInventory-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into ims_inventory          ( quantity,             last_updated )           values ( ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'product_id\' doesn\'t have a default value\n; Field \'product_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'product_id\' doesn\'t have a default value', '2025-04-11 19:04:32', 5);
INSERT INTO `sys_oper_log` VALUES (136, '商品信息', 1, 'com.ruoyi.ims.controller.ImsProductsController.add()', 'POST', 1, 'admin', '研发部门', '/ims/products', '127.0.0.1', '内网IP', '{\"category\":\"sj\",\"params\":{},\"productId\":1,\"productName\":\"小米15\",\"unitPrice\":4999}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-11 19:05:30', 18);
INSERT INTO `sys_oper_log` VALUES (137, '采购信息', 1, 'com.ruoyi.ims.controller.ImsPurchasesController.add()', 'POST', 1, 'admin', '研发部门', '/ims/purchases', '127.0.0.1', '内网IP', '{\"params\":{},\"purchaseDate\":\"2025-04-02\",\"quantity\":2,\"totalAmount\":10000}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'product_id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\96449\\IdeaProjects\\ruoyi-final\\ruoyi-admin\\target\\classes\\mapper\\ims\\ImsPurchasesMapper.xml]\r\n### The error may involve com.ruoyi.ims.mapper.ImsPurchasesMapper.insertImsPurchases-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into ims_purchases          ( purchase_date,             quantity,             total_amount )           values ( ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'product_id\' doesn\'t have a default value\n; Field \'product_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'product_id\' doesn\'t have a default value', '2025-04-11 19:06:06', 8);
INSERT INTO `sys_oper_log` VALUES (138, '采购信息', 1, 'com.ruoyi.ims.controller.ImsPurchasesController.add()', 'POST', 1, 'admin', '研发部门', '/ims/purchases', '127.0.0.1', '内网IP', '{\"params\":{},\"purchaseDate\":\"2025-04-02\",\"quantity\":2,\"totalAmount\":10000}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'product_id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\96449\\IdeaProjects\\ruoyi-final\\ruoyi-admin\\target\\classes\\mapper\\ims\\ImsPurchasesMapper.xml]\r\n### The error may involve com.ruoyi.ims.mapper.ImsPurchasesMapper.insertImsPurchases-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into ims_purchases          ( purchase_date,             quantity,             total_amount )           values ( ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'product_id\' doesn\'t have a default value\n; Field \'product_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'product_id\' doesn\'t have a default value', '2025-04-11 19:06:10', 4);
INSERT INTO `sys_oper_log` VALUES (139, '采购信息', 1, 'com.ruoyi.ims.controller.ImsPurchasesController.add()', 'POST', 1, 'admin', '研发部门', '/ims/purchases', '127.0.0.1', '内网IP', '{\"params\":{},\"productId\":1,\"purchaseDate\":\"2025-04-15\",\"quantity\":1,\"totalAmount\":222}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'supplier_id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\96449\\IdeaProjects\\ruoyi-final\\ruoyi-admin\\target\\classes\\mapper\\ims\\ImsPurchasesMapper.xml]\r\n### The error may involve com.ruoyi.ims.mapper.ImsPurchasesMapper.insertImsPurchases-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into ims_purchases          ( product_id,                          purchase_date,             quantity,             total_amount )           values ( ?,                          ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'supplier_id\' doesn\'t have a default value\n; Field \'supplier_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'supplier_id\' doesn\'t have a default value', '2025-04-11 19:48:06', 232);
INSERT INTO `sys_oper_log` VALUES (140, '采购信息', 1, 'com.ruoyi.ims.controller.ImsPurchasesController.add()', 'POST', 1, 'admin', '研发部门', '/ims/purchases', '127.0.0.1', '内网IP', '{\"params\":{},\"productId\":1,\"purchaseDate\":\"2025-04-15\",\"quantity\":1,\"totalAmount\":222}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'supplier_id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\96449\\IdeaProjects\\ruoyi-final\\ruoyi-admin\\target\\classes\\mapper\\ims\\ImsPurchasesMapper.xml]\r\n### The error may involve com.ruoyi.ims.mapper.ImsPurchasesMapper.insertImsPurchases-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into ims_purchases          ( product_id,                          purchase_date,             quantity,             total_amount )           values ( ?,                          ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'supplier_id\' doesn\'t have a default value\n; Field \'supplier_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'supplier_id\' doesn\'t have a default value', '2025-04-11 19:58:15', 239);
INSERT INTO `sys_oper_log` VALUES (141, '供应商信息', 1, 'com.ruoyi.ims.controller.ImsSuppliersController.add()', 'POST', 1, 'admin', '研发部门', '/ims/suppliers', '127.0.0.1', '内网IP', '{\"address\":\"河南驻马店\",\"contactNumber\":\"18909091111\",\"contactPerson\":\"大飞\",\"params\":{},\"supplierId\":1,\"supplierName\":\"大飞商贸\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-11 19:59:54', 21);
INSERT INTO `sys_oper_log` VALUES (142, '采购信息', 1, 'com.ruoyi.ims.controller.ImsPurchasesController.add()', 'POST', 1, 'admin', '研发部门', '/ims/purchases', '127.0.0.1', '内网IP', '{\"params\":{},\"productId\":1,\"purchaseDate\":\"2025-04-16\",\"purchaseId\":1,\"quantity\":2,\"supplierId\":1,\"totalAmount\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-11 20:00:17', 9);
INSERT INTO `sys_oper_log` VALUES (143, '采购信息', 1, 'com.ruoyi.ims.controller.ImsPurchasesController.add()', 'POST', 1, 'admin', '研发部门', '/ims/purchases', '127.0.0.1', '内网IP', '{\"params\":{},\"productId\":1,\"purchaseDate\":\"2025-04-01\",\"quantity\":222,\"supplierId\":1,\"totalAmount\":1}', NULL, 1, 'nested exception is org.apache.ibatis.executor.ExecutorException: No setter found for the keyProperty \'id\' in com.ruoyi.ims.domain.ImsPurchases.', '2025-04-11 20:13:52', 190);
INSERT INTO `sys_oper_log` VALUES (144, '采购信息', 1, 'com.ruoyi.ims.controller.ImsPurchasesController.add()', 'POST', 1, 'admin', '研发部门', '/ims/purchases', '127.0.0.1', '内网IP', '{\"params\":{},\"productId\":1,\"purchaseDate\":\"2025-04-01\",\"quantity\":222,\"supplierId\":1,\"totalAmount\":1}', NULL, 1, 'nested exception is org.apache.ibatis.executor.ExecutorException: No setter found for the keyProperty \'id\' in com.ruoyi.ims.domain.ImsPurchases.', '2025-04-11 20:13:58', 11);
INSERT INTO `sys_oper_log` VALUES (145, '采购信息', 1, 'com.ruoyi.ims.controller.ImsPurchasesController.add()', 'POST', 1, 'admin', '研发部门', '/ims/purchases', '127.0.0.1', '内网IP', '{\"params\":{},\"productId\":1,\"purchaseDate\":\"2025-04-01\",\"purchaseId\":4,\"quantity\":222,\"supplierId\":1,\"totalAmount\":1}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'+= 222,\n            last_updated = \'2025-04-11 20:15:00.149\' \n        where prod\' at line 2\r\n### The error may exist in file [C:\\Users\\96449\\IdeaProjects\\ruoyi-final\\ruoyi-admin\\target\\classes\\mapper\\ims\\ImsInventoryMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: update ims_inventory          SET quantity += ?,             last_updated = ?          where product_id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'+= 222,\n            last_updated = \'2025-04-11 20:15:00.149\' \n        where prod\' at line 2\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'+= 222,\n            last_updated = \'2025-04-11 20:15:00.149\' \n        where prod\' at line 2', '2025-04-11 20:15:00', 270);
INSERT INTO `sys_oper_log` VALUES (146, '采购信息', 1, 'com.ruoyi.ims.controller.ImsPurchasesController.add()', 'POST', 1, 'admin', '研发部门', '/ims/purchases', '127.0.0.1', '内网IP', '{\"params\":{},\"productId\":1,\"purchaseDate\":\"2025-04-01\",\"purchaseId\":5,\"quantity\":222,\"supplierId\":1,\"totalAmount\":1}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'quantity_change\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\96449\\IdeaProjects\\ruoyi-final\\ruoyi-admin\\target\\classes\\mapper\\ims\\ImsInventoryChangesMapper.xml]\r\n### The error may involve com.ruoyi.ims.mapper.ImsInventoryChangesMapper.insertImsInventoryChanges-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into ims_inventory_changes          ( product_id,             change_date,             change_type,                          reference_id )           values ( ?,             ?,             ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'quantity_change\' doesn\'t have a default value\n; Field \'quantity_change\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'quantity_change\' doesn\'t have a default value', '2025-04-11 20:15:51', 36);
INSERT INTO `sys_oper_log` VALUES (147, '采购信息', 1, 'com.ruoyi.ims.controller.ImsPurchasesController.add()', 'POST', 1, 'admin', '研发部门', '/ims/purchases', '127.0.0.1', '内网IP', '{\"params\":{},\"productId\":1,\"purchaseDate\":\"2025-04-01\",\"purchaseId\":6,\"quantity\":222,\"supplierId\":1,\"totalAmount\":1}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'quantity_change\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\96449\\IdeaProjects\\ruoyi-final\\ruoyi-admin\\target\\classes\\mapper\\ims\\ImsInventoryChangesMapper.xml]\r\n### The error may involve com.ruoyi.ims.mapper.ImsInventoryChangesMapper.insertImsInventoryChanges-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into ims_inventory_changes          ( product_id,             change_date,             change_type,                          reference_id )           values ( ?,             ?,             ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'quantity_change\' doesn\'t have a default value\n; Field \'quantity_change\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'quantity_change\' doesn\'t have a default value', '2025-04-11 20:15:52', 15);
INSERT INTO `sys_oper_log` VALUES (148, '采购信息', 1, 'com.ruoyi.ims.controller.ImsPurchasesController.add()', 'POST', 1, 'admin', '研发部门', '/ims/purchases', '127.0.0.1', '内网IP', '{\"params\":{},\"productId\":1,\"purchaseDate\":\"2025-04-01\",\"purchaseId\":7,\"quantity\":222,\"supplierId\":1,\"totalAmount\":1}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'quantity_change\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\96449\\IdeaProjects\\ruoyi-final\\ruoyi-admin\\target\\classes\\mapper\\ims\\ImsInventoryChangesMapper.xml]\r\n### The error may involve com.ruoyi.ims.mapper.ImsInventoryChangesMapper.insertImsInventoryChanges-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into ims_inventory_changes          ( product_id,             change_date,             change_type,                          reference_id )           values ( ?,             ?,             ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'quantity_change\' doesn\'t have a default value\n; Field \'quantity_change\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'quantity_change\' doesn\'t have a default value', '2025-04-11 20:15:56', 16);
INSERT INTO `sys_oper_log` VALUES (149, '采购信息', 1, 'com.ruoyi.ims.controller.ImsPurchasesController.add()', 'POST', 1, 'admin', '研发部门', '/ims/purchases', '127.0.0.1', '内网IP', '{\"params\":{},\"productId\":1,\"purchaseDate\":\"2025-04-01\",\"purchaseId\":8,\"quantity\":222,\"supplierId\":1,\"totalAmount\":1}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'quantity_change\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\96449\\IdeaProjects\\ruoyi-final\\ruoyi-admin\\target\\classes\\mapper\\ims\\ImsInventoryChangesMapper.xml]\r\n### The error may involve com.ruoyi.ims.mapper.ImsInventoryChangesMapper.insertImsInventoryChanges-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into ims_inventory_changes          ( product_id,             change_date,             change_type,                          reference_id )           values ( ?,             ?,             ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'quantity_change\' doesn\'t have a default value\n; Field \'quantity_change\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'quantity_change\' doesn\'t have a default value', '2025-04-11 20:17:09', 13);
INSERT INTO `sys_oper_log` VALUES (150, '采购信息', 1, 'com.ruoyi.ims.controller.ImsPurchasesController.add()', 'POST', 1, 'admin', '研发部门', '/ims/purchases', '127.0.0.1', '内网IP', '{\"params\":{},\"productId\":1,\"purchaseDate\":\"2025-04-01\",\"purchaseId\":9,\"quantity\":222,\"supplierId\":1,\"totalAmount\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-11 20:17:19', 35);
INSERT INTO `sys_oper_log` VALUES (151, '客户信息', 1, 'com.ruoyi.ims.controller.ImsCustomersController.add()', 'POST', 1, 'admin', '研发部门', '/ims/customers', '127.0.0.1', '内网IP', '{\"address\":\"驻马店汝南\",\"contactNumber\":\"18909091111\",\"contactPerson\":\"小飞\",\"customerId\":1,\"customerName\":\"李四\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-11 20:20:33', 21);
INSERT INTO `sys_oper_log` VALUES (152, '销售信息', 1, 'com.ruoyi.ims.controller.ImsSalesController.add()', 'POST', 1, 'admin', '研发部门', '/ims/sales', '127.0.0.1', '内网IP', '{\"customerId\":1,\"params\":{},\"productId\":1,\"quantity\":21,\"saleDate\":\"2025-04-01\",\"totalAmount\":1}', NULL, 1, 'nested exception is org.apache.ibatis.executor.ExecutorException: No setter found for the keyProperty \'sale_id\' in com.ruoyi.ims.domain.ImsSales.', '2025-04-11 20:39:34', 64);
INSERT INTO `sys_oper_log` VALUES (153, '销售信息', 1, 'com.ruoyi.ims.controller.ImsSalesController.add()', 'POST', 1, 'admin', '研发部门', '/ims/sales', '127.0.0.1', '内网IP', '{\"customerId\":1,\"params\":{},\"productId\":1,\"quantity\":21,\"saleDate\":\"2025-04-01\",\"totalAmount\":1}', NULL, 1, 'nested exception is org.apache.ibatis.executor.ExecutorException: No setter found for the keyProperty \'sale_id\' in com.ruoyi.ims.domain.ImsSales.', '2025-04-11 20:39:38', 16);
INSERT INTO `sys_oper_log` VALUES (154, '销售信息', 1, 'com.ruoyi.ims.controller.ImsSalesController.add()', 'POST', 1, 'admin', '研发部门', '/ims/sales', '127.0.0.1', '内网IP', '{\"customerId\":1,\"params\":{},\"productId\":1,\"quantity\":21,\"saleDate\":\"2025-04-01\",\"totalAmount\":1}', NULL, 1, 'nested exception is org.apache.ibatis.executor.ExecutorException: No setter found for the keyProperty \'sale_id\' in com.ruoyi.ims.domain.ImsSales.', '2025-04-11 20:40:03', 15);
INSERT INTO `sys_oper_log` VALUES (155, '销售信息', 1, 'com.ruoyi.ims.controller.ImsSalesController.add()', 'POST', 1, 'admin', '研发部门', '/ims/sales', '127.0.0.1', '内网IP', '{\"customerId\":1,\"params\":{},\"productId\":1,\"quantity\":21,\"saleDate\":\"2025-04-01\",\"saleId\":4,\"totalAmount\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-11 20:40:12', 51);
INSERT INTO `sys_oper_log` VALUES (156, '采购信息', 1, 'com.ruoyi.ims.controller.ImsPurchasesController.add()', 'POST', 1, 'admin', '研发部门', '/ims/purchases', '127.0.0.1', '内网IP', '{\"params\":{},\"productId\":1,\"purchaseDate\":\"2025-04-01\",\"purchaseId\":10,\"quantity\":2000,\"supplierId\":1,\"totalAmount\":200000}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-11 20:55:00', 82);
INSERT INTO `sys_oper_log` VALUES (157, '销售信息', 1, 'com.ruoyi.ims.controller.ImsSalesController.add()', 'POST', 1, 'admin', '研发部门', '/ims/sales', '127.0.0.1', '内网IP', '{\"customerId\":1,\"params\":{},\"productId\":1,\"quantity\":150,\"saleDate\":\"2025-04-01\",\"saleId\":5,\"totalAmount\":2000}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-11 20:55:27', 37);
INSERT INTO `sys_oper_log` VALUES (158, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-04-07 20:05:44\",\"default\":false,\"dictCode\":106,\"dictLabel\":\"采购入库\",\"dictSort\":1,\"dictType\":\"ims_change_type\",\"dictValue\":\"cgrk\",\"isDefault\":\"N\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-11 20:57:24', 17);
INSERT INTO `sys_oper_log` VALUES (159, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-04-07 20:05:57\",\"default\":false,\"dictCode\":107,\"dictLabel\":\"销售出库\",\"dictSort\":2,\"dictType\":\"ims_change_type\",\"dictValue\":\"xsck\",\"isDefault\":\"N\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-11 20:57:31', 14);
INSERT INTO `sys_oper_log` VALUES (160, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-04-07 20:05:57\",\"default\":false,\"dictCode\":107,\"dictLabel\":\"销售出库\",\"dictSort\":2,\"dictType\":\"ims_change_type\",\"dictValue\":\"xsck\",\"isDefault\":\"N\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-11 20:57:40', 14);
INSERT INTO `sys_oper_log` VALUES (161, '库存变动记录', 3, 'com.ruoyi.ims.controller.ImsInventoryChangesController.remove()', 'DELETE', 1, 'admin', '研发部门', '/ims/changes/1', '127.0.0.1', '内网IP', '[1]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-11 21:12:44', 28);
INSERT INTO `sys_oper_log` VALUES (162, '库存变动记录', 3, 'com.ruoyi.ims.controller.ImsInventoryChangesController.remove()', 'DELETE', 1, 'admin', '研发部门', '/ims/changes/2', '127.0.0.1', '内网IP', '[2]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-11 21:12:46', 15);
INSERT INTO `sys_oper_log` VALUES (163, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"ims/inventory/index\",\"createTime\":\"2025-04-07 20:13:36\",\"icon\":\"#\",\"isCache\":\"1\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"库存信息\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"inventory\",\"perms\":\"ims:inventory:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-11 21:32:32', 35);
INSERT INTO `sys_oper_log` VALUES (164, '采购信息', 1, 'com.ruoyi.ims.controller.ImsPurchasesController.add()', 'POST', 1, 'admin', '研发部门', '/ims/purchases', '127.0.0.1', '内网IP', '{\"params\":{},\"productId\":1,\"purchaseDate\":\"2025-04-02\",\"purchaseId\":11,\"quantity\":12,\"supplierId\":1,\"totalAmount\":12000}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-11 21:33:40', 51);
INSERT INTO `sys_oper_log` VALUES (165, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/avatar', '192.168.1.114', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2025/04/20/LYYPAPLdRUqee8638259220b293e9fa78f5e95cd68fd_20250420124129A001.png\",\"code\":200}', 0, NULL, '2025-04-20 12:41:31', 2924);
INSERT INTO `sys_oper_log` VALUES (166, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', '研发部门', '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"productName\":\"小米15\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 22:59:49', 15);
INSERT INTO `sys_oper_log` VALUES (167, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', '研发部门', '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"productName\":\"小米15\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 23:00:39', 9);
INSERT INTO `sys_oper_log` VALUES (168, '商品信息', 1, 'com.ruoyi.ims.controller.ImsProductsController.add()', 'POST', 1, 'admin', '研发部门', '/ims/products', '127.0.0.1', '内网IP', '{\"category\":\"sj\",\"description\":\"一代神机\",\"params\":{},\"productId\":2,\"productName\":\"Redmi Note 14\",\"unitPrice\":1999}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 23:02:01', 16);
INSERT INTO `sys_oper_log` VALUES (169, '商品信息', 2, 'com.ruoyi.ims.controller.ImsProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/ims/products', '127.0.0.1', '内网IP', '{\"category\":\"sj\",\"description\":\"旗舰\",\"params\":{},\"productId\":1,\"productName\":\"小米15\",\"unitPrice\":4999}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 23:02:50', 9);
INSERT INTO `sys_oper_log` VALUES (170, '商品信息', 2, 'com.ruoyi.ims.controller.ImsProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/ims/products', '127.0.0.1', '内网IP', '{\"category\":\"sj\",\"description\":\"一代神机\",\"params\":{},\"productId\":2,\"productName\":\"Redmi Note 14\",\"unitPrice\":1999}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 23:04:35', 7);
INSERT INTO `sys_oper_log` VALUES (171, '商品信息', 2, 'com.ruoyi.ims.controller.ImsProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/ims/products', '127.0.0.1', '内网IP', '{\"category\":\"sj\",\"description\":\"旗舰\",\"params\":{},\"productId\":1,\"productName\":\"小米15\",\"unitPrice\":4999}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-26 23:23:39', 5);
INSERT INTO `sys_oper_log` VALUES (172, '商品信息', 3, 'com.ruoyi.ims.controller.ImsProductsController.remove()', 'DELETE', 1, 'admin', '研发部门', '/ims/products/1', '127.0.0.1', '内网IP', '[1]', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ims_db`.`ims_inventory_changes`, CONSTRAINT `ims_inventory_changes_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `ims_products` (`product_id`))\r\n### The error may exist in file [C:\\Users\\96449\\IdeaProjects\\ruoyi-final\\ruoyi-admin\\target\\classes\\mapper\\ims\\ImsProductsMapper.xml]\r\n### The error may involve com.ruoyi.ims.mapper.ImsProductsMapper.deleteImsProductsByProductIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from ims_products where product_id in           (               ?          )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ims_db`.`ims_inventory_changes`, CONSTRAINT `ims_inventory_changes_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `ims_products` (`product_id`))\n; Cannot delete or update a parent row: a foreign key constraint fails (`ims_db`.`ims_inventory_changes`, CONSTRAINT `ims_inventory_changes_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `ims_products` (`product_id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ims_db`.`ims_inventory_changes`, CONSTRAINT `ims_inventory_changes_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `ims_products` (`product_id`))', '2025-04-26 23:27:29', 136);
INSERT INTO `sys_oper_log` VALUES (173, '商品信息', 3, 'com.ruoyi.ims.controller.ImsProductsController.remove()', 'DELETE', 1, 'admin', '研发部门', '/ims/products/1', '127.0.0.1', '内网IP', '[1]', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ims_db`.`ims_inventory_changes`, CONSTRAINT `ims_inventory_changes_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `ims_products` (`product_id`))\r\n### The error may exist in file [C:\\Users\\96449\\IdeaProjects\\ruoyi-final\\ruoyi-admin\\target\\classes\\mapper\\ims\\ImsProductsMapper.xml]\r\n### The error may involve com.ruoyi.ims.mapper.ImsProductsMapper.deleteImsProductsByProductIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from ims_products where product_id in           (               ?          )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ims_db`.`ims_inventory_changes`, CONSTRAINT `ims_inventory_changes_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `ims_products` (`product_id`))\n; Cannot delete or update a parent row: a foreign key constraint fails (`ims_db`.`ims_inventory_changes`, CONSTRAINT `ims_inventory_changes_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `ims_products` (`product_id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ims_db`.`ims_inventory_changes`, CONSTRAINT `ims_inventory_changes_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `ims_products` (`product_id`))', '2025-04-26 23:27:39', 5);
INSERT INTO `sys_oper_log` VALUES (174, '商品信息', 1, 'com.ruoyi.ims.controller.ImsProductsController.add()', 'POST', 1, 'admin', '研发部门', '/ims/products', '127.0.0.1', '内网IP', '{\"category\":\"\",\"description\":\"\",\"params\":{},\"productName\":\"\",\"supplierName\":\"1\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'product_name\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\96449\\IdeaProjects\\ruoyi-final\\ruoyi-admin\\target\\classes\\mapper\\ims\\ImsProductsMapper.xml]\r\n### The error may involve com.ruoyi.ims.mapper.ImsProductsMapper.insertImsProducts-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into ims_products          ( category,                          description )           values ( ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'product_name\' doesn\'t have a default value\n; Field \'product_name\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'product_name\' doesn\'t have a default value', '2025-04-27 00:21:59', 7);
INSERT INTO `sys_oper_log` VALUES (175, '商品信息', 1, 'com.ruoyi.ims.controller.ImsProductsController.add()', 'POST', 1, 'admin', '研发部门', '/ims/products', '127.0.0.1', '内网IP', '{\"params\":{},\"supplierName\":\"1\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in file [C:\\Users\\96449\\IdeaProjects\\ruoyi-final\\ruoyi-admin\\target\\classes\\mapper\\ims\\ImsProductsMapper.xml]\r\n### The error may involve com.ruoyi.ims.mapper.ImsProductsMapper.insertImsProducts-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into ims_products\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1', '2025-04-27 00:22:53', 9);
INSERT INTO `sys_oper_log` VALUES (176, '商品信息', 1, 'com.ruoyi.ims.controller.ImsProductsController.add()', 'POST', 1, 'admin', '研发部门', '/ims/products', '127.0.0.1', '内网IP', '{\"params\":{},\"supplierName\":\"1\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in file [C:\\Users\\96449\\IdeaProjects\\ruoyi-final\\ruoyi-admin\\target\\classes\\mapper\\ims\\ImsProductsMapper.xml]\r\n### The error may involve com.ruoyi.ims.mapper.ImsProductsMapper.insertImsProducts-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into ims_products\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1', '2025-04-27 00:22:56', 5);
INSERT INTO `sys_oper_log` VALUES (177, '采购信息', 1, 'com.ruoyi.ims.controller.ImsPurchasesController.add()', 'POST', 1, 'admin', '研发部门', '/ims/purchases', '127.0.0.1', '内网IP', '{\"params\":{},\"purchaseDate\":\"2025-04-08\",\"quantity\":1,\"supplierName\":\"1\",\"totalAmount\":1}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'product_id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\96449\\IdeaProjects\\ruoyi-final\\ruoyi-admin\\target\\classes\\mapper\\ims\\ImsPurchasesMapper.xml]\r\n### The error may involve com.ruoyi.ims.mapper.ImsPurchasesMapper.insertImsPurchases-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into ims_purchases          ( purchase_date,             quantity,             total_amount )           values ( ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'product_id\' doesn\'t have a default value\n; Field \'product_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'product_id\' doesn\'t have a default value', '2025-04-27 00:25:58', 28);
INSERT INTO `sys_oper_log` VALUES (178, '采购信息', 1, 'com.ruoyi.ims.controller.ImsPurchasesController.add()', 'POST', 1, 'admin', '研发部门', '/ims/purchases', '127.0.0.1', '内网IP', '{\"params\":{},\"purchaseDate\":\"2025-04-08\",\"quantity\":1,\"supplierName\":\"1\",\"totalAmount\":1}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'product_id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\96449\\IdeaProjects\\ruoyi-final\\ruoyi-admin\\target\\classes\\mapper\\ims\\ImsPurchasesMapper.xml]\r\n### The error may involve com.ruoyi.ims.mapper.ImsPurchasesMapper.insertImsPurchases-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into ims_purchases          ( purchase_date,             quantity,             total_amount )           values ( ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'product_id\' doesn\'t have a default value\n; Field \'product_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'product_id\' doesn\'t have a default value', '2025-04-27 00:28:17', 6);
INSERT INTO `sys_oper_log` VALUES (179, '采购信息', 1, 'com.ruoyi.ims.controller.ImsPurchasesController.add()', 'POST', 1, 'admin', '研发部门', '/ims/purchases', '127.0.0.1', '内网IP', '{\"params\":{},\"purchaseDate\":\"2025-04-02\",\"quantity\":1,\"supplierName\":\"1\",\"totalAmount\":1}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'product_id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\96449\\IdeaProjects\\ruoyi-final\\ruoyi-admin\\target\\classes\\mapper\\ims\\ImsPurchasesMapper.xml]\r\n### The error may involve com.ruoyi.ims.mapper.ImsPurchasesMapper.insertImsPurchases-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into ims_purchases          ( purchase_date,             quantity,             total_amount )           values ( ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'product_id\' doesn\'t have a default value\n; Field \'product_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'product_id\' doesn\'t have a default value', '2025-04-27 00:28:30', 3);
INSERT INTO `sys_oper_log` VALUES (180, '采购信息', 2, 'com.ruoyi.ims.controller.ImsPurchasesController.edit()', 'PUT', 1, 'admin', '研发部门', '/ims/purchases', '127.0.0.1', '内网IP', '{\"params\":{},\"productId\":1,\"purchaseDate\":\"2025-04-02\",\"quantity\":1,\"supplierId\":1,\"supplierName\":\"1\",\"totalAmount\":1}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2025-04-27 00:29:06', 10);
INSERT INTO `sys_oper_log` VALUES (181, '采购信息', 2, 'com.ruoyi.ims.controller.ImsPurchasesController.edit()', 'PUT', 1, 'admin', '研发部门', '/ims/purchases', '127.0.0.1', '内网IP', '{\"params\":{},\"productId\":1,\"purchaseDate\":\"2025-04-02\",\"quantity\":1,\"supplierId\":1,\"supplierName\":\"1\",\"totalAmount\":1}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2025-04-27 00:29:18', 4);
INSERT INTO `sys_oper_log` VALUES (182, '采购信息', 2, 'com.ruoyi.ims.controller.ImsPurchasesController.edit()', 'PUT', 1, 'admin', '研发部门', '/ims/purchases', '127.0.0.1', '内网IP', '{\"params\":{},\"productId\":1,\"purchaseDate\":\"2025-04-02\",\"quantity\":12,\"supplierId\":1,\"supplierName\":\"1\",\"totalAmount\":1}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2025-04-27 00:30:08', 10);
INSERT INTO `sys_oper_log` VALUES (183, '采购信息', 2, 'com.ruoyi.ims.controller.ImsPurchasesController.edit()', 'PUT', 1, 'admin', '研发部门', '/ims/purchases', '127.0.0.1', '内网IP', '{\"params\":{},\"productId\":1,\"purchaseDate\":\"2025-04-02\",\"quantity\":22,\"supplierId\":1,\"totalAmount\":222}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2025-04-27 00:30:59', 5);
INSERT INTO `sys_oper_log` VALUES (184, '采购信息', 2, 'com.ruoyi.ims.controller.ImsPurchasesController.edit()', 'PUT', 1, 'admin', '研发部门', '/ims/purchases', '127.0.0.1', '内网IP', '{\"params\":{},\"purchaseDate\":\"2025-04-09\",\"purchaseId\":1,\"quantity\":11,\"supplierId\":1,\"totalAmount\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 00:32:35', 6);
INSERT INTO `sys_oper_log` VALUES (185, '采购信息', 2, 'com.ruoyi.ims.controller.ImsPurchasesController.edit()', 'PUT', 1, 'admin', '研发部门', '/ims/purchases', '127.0.0.1', '内网IP', '{\"params\":{},\"purchaseDate\":\"2025-04-27\",\"purchaseId\":1,\"quantity\":22,\"supplierId\":1,\"totalAmount\":223}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 00:34:04', 5);
INSERT INTO `sys_oper_log` VALUES (186, '采购信息', 2, 'com.ruoyi.ims.controller.ImsPurchasesController.edit()', 'PUT', 1, 'admin', '研发部门', '/ims/purchases', '127.0.0.1', '内网IP', '{\"params\":{},\"purchaseDate\":\"2025-04-28\",\"purchaseId\":1,\"quantity\":11111,\"supplierId\":1,\"totalAmount\":1111}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 00:39:46', 5);
INSERT INTO `sys_oper_log` VALUES (187, '采购信息', 2, 'com.ruoyi.ims.controller.ImsPurchasesController.edit()', 'PUT', 1, 'admin', '研发部门', '/ims/purchases', '127.0.0.1', '内网IP', '{\"params\":{},\"productId\":1,\"productName\":\"小米15\",\"purchaseDate\":\"2025-04-01\",\"purchaseId\":2,\"quantity\":2222,\"supplierId\":1,\"supplierName\":\"大飞商贸\",\"totalAmount\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 00:41:07', 5);
INSERT INTO `sys_oper_log` VALUES (188, '采购信息', 2, 'com.ruoyi.ims.controller.ImsPurchasesController.edit()', 'PUT', 1, 'admin', '研发部门', '/ims/purchases', '127.0.0.1', '内网IP', '{\"params\":{},\"purchaseDate\":\"2025-04-29\",\"purchaseId\":1,\"quantity\":222,\"supplierId\":1,\"totalAmount\":222}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 00:41:39', 7);
INSERT INTO `sys_oper_log` VALUES (189, '采购信息', 2, 'com.ruoyi.ims.controller.ImsPurchasesController.edit()', 'PUT', 1, 'admin', '研发部门', '/ims/purchases', '127.0.0.1', '内网IP', '{\"params\":{},\"purchaseDate\":\"2025-04-29\",\"purchaseId\":1,\"quantity\":1,\"supplierId\":1,\"totalAmount\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 00:43:46', 8);
INSERT INTO `sys_oper_log` VALUES (190, '采购信息', 1, 'com.ruoyi.ims.controller.ImsPurchasesController.add()', 'POST', 1, 'admin', '研发部门', '/ims/purchases', '127.0.0.1', '内网IP', '{\"params\":{},\"productId\":1,\"purchaseDate\":\"2025-04-16\",\"purchaseId\":12,\"quantity\":2,\"supplierId\":1,\"totalAmount\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 00:45:26', 29);
INSERT INTO `sys_oper_log` VALUES (191, '采购信息', 2, 'com.ruoyi.ims.controller.ImsPurchasesController.edit()', 'PUT', 1, 'admin', '研发部门', '/ims/purchases', '127.0.0.1', '内网IP', '{\"params\":{},\"productId\":1,\"productName\":\"小米15\",\"purchaseDate\":\"2025-04-29\",\"purchaseId\":1,\"quantity\":12,\"supplierId\":1,\"supplierName\":\"大飞商贸\",\"totalAmount\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 16:24:25', 23);
INSERT INTO `sys_oper_log` VALUES (192, '采购信息', 2, 'com.ruoyi.ims.controller.ImsPurchasesController.edit()', 'PUT', 1, 'admin', '研发部门', '/ims/purchases', '127.0.0.1', '内网IP', '{\"params\":{},\"productId\":1,\"productName\":\"小米15\",\"purchaseDate\":\"2025-04-30\",\"purchaseId\":2,\"quantity\":2222,\"supplierId\":1,\"supplierName\":\"大飞商贸\",\"totalAmount\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 16:24:50', 10);
INSERT INTO `sys_oper_log` VALUES (193, '客户信息', 2, 'com.ruoyi.ims.controller.ImsCustomersController.edit()', 'PUT', 1, 'admin', '研发部门', '/ims/customers', '127.0.0.1', '内网IP', '{\"address\":\"驻马店汝南\",\"contactNumber\":\"18909091111\",\"contactPerson\":\"小飞2\",\"customerId\":1,\"customerName\":\"李四\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 16:30:01', 12);
INSERT INTO `sys_oper_log` VALUES (194, '客户信息', 1, 'com.ruoyi.ims.controller.ImsCustomersController.add()', 'POST', 1, 'admin', '研发部门', '/ims/customers', '127.0.0.1', '内网IP', '{\"address\":\"2\",\"contactNumber\":\"2\",\"contactPerson\":\"2\",\"customerId\":2,\"customerName\":\"2\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 16:30:23', 10);
INSERT INTO `sys_oper_log` VALUES (195, '供应商信息', 2, 'com.ruoyi.ims.controller.ImsSuppliersController.edit()', 'PUT', 1, 'admin', '研发部门', '/ims/suppliers', '127.0.0.1', '内网IP', '{\"address\":\"河南驻马店\",\"contactNumber\":\"18909091111\",\"contactPerson\":\"大飞2\",\"params\":{},\"supplierId\":1,\"supplierName\":\"大飞商贸2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 16:30:36', 10);
INSERT INTO `sys_oper_log` VALUES (196, '供应商信息', 1, 'com.ruoyi.ims.controller.ImsSuppliersController.add()', 'POST', 1, 'admin', '研发部门', '/ims/suppliers', '127.0.0.1', '内网IP', '{\"address\":\"2\",\"contactNumber\":\"2\",\"contactPerson\":\"2\",\"params\":{},\"supplierId\":2,\"supplierName\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 16:30:43', 10);
INSERT INTO `sys_oper_log` VALUES (197, '销售信息', 2, 'com.ruoyi.ims.controller.ImsSalesController.edit()', 'PUT', 1, 'admin', '研发部门', '/ims/sales', '127.0.0.1', '内网IP', '{\"customerId\":1,\"customerName\":\"李四\",\"params\":{},\"productId\":1,\"productName\":\"小米15\",\"quantity\":212,\"saleDate\":\"2025-04-01\",\"saleId\":1,\"totalAmount\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 16:34:03', 9);
INSERT INTO `sys_oper_log` VALUES (198, '销售信息', 1, 'com.ruoyi.ims.controller.ImsSalesController.add()', 'POST', 1, 'admin', '研发部门', '/ims/sales', '127.0.0.1', '内网IP', '{\"customerId\":1,\"params\":{},\"productId\":1,\"quantity\":2,\"totalAmount\":2}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'sale_date\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\96449\\IdeaProjects\\ruoyi-final\\ruoyi-admin\\target\\classes\\mapper\\ims\\ImsSalesMapper.xml]\r\n### The error may involve com.ruoyi.ims.mapper.ImsSalesMapper.insertImsSales-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into ims_sales          ( product_id,             customer_id,                          quantity,             total_amount )           values ( ?,             ?,                          ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'sale_date\' doesn\'t have a default value\n; Field \'sale_date\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'sale_date\' doesn\'t have a default value', '2025-04-27 16:34:19', 77);
INSERT INTO `sys_oper_log` VALUES (199, '销售信息', 1, 'com.ruoyi.ims.controller.ImsSalesController.add()', 'POST', 1, 'admin', '研发部门', '/ims/sales', '127.0.0.1', '内网IP', '{\"customerId\":1,\"params\":{},\"productId\":1,\"quantity\":2,\"totalAmount\":2}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'sale_date\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\96449\\IdeaProjects\\ruoyi-final\\ruoyi-admin\\target\\classes\\mapper\\ims\\ImsSalesMapper.xml]\r\n### The error may involve com.ruoyi.ims.mapper.ImsSalesMapper.insertImsSales-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into ims_sales          ( product_id,             customer_id,                          quantity,             total_amount )           values ( ?,             ?,                          ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'sale_date\' doesn\'t have a default value\n; Field \'sale_date\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'sale_date\' doesn\'t have a default value', '2025-04-27 16:34:22', 5);
INSERT INTO `sys_oper_log` VALUES (200, '销售信息', 1, 'com.ruoyi.ims.controller.ImsSalesController.add()', 'POST', 1, 'admin', '研发部门', '/ims/sales', '127.0.0.1', '内网IP', '{\"customerId\":1,\"params\":{},\"productId\":1,\"quantity\":2,\"totalAmount\":2}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'sale_date\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\96449\\IdeaProjects\\ruoyi-final\\ruoyi-admin\\target\\classes\\mapper\\ims\\ImsSalesMapper.xml]\r\n### The error may involve com.ruoyi.ims.mapper.ImsSalesMapper.insertImsSales-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into ims_sales          ( product_id,             customer_id,                          quantity,             total_amount )           values ( ?,             ?,                          ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'sale_date\' doesn\'t have a default value\n; Field \'sale_date\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'sale_date\' doesn\'t have a default value', '2025-04-27 16:34:29', 5);
INSERT INTO `sys_oper_log` VALUES (201, '销售信息', 1, 'com.ruoyi.ims.controller.ImsSalesController.add()', 'POST', 1, 'admin', '研发部门', '/ims/sales', '127.0.0.1', '内网IP', '{\"customerId\":1,\"params\":{},\"productId\":1,\"quantity\":2,\"saleDate\":\"2025-04-30\",\"saleId\":6,\"totalAmount\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 16:35:09', 26);
INSERT INTO `sys_oper_log` VALUES (202, '采购信息', 1, 'com.ruoyi.ims.controller.ImsPurchasesController.add()', 'POST', 1, 'admin', '研发部门', '/ims/purchases', '127.0.0.1', '内网IP', '{\"params\":{},\"productId\":2,\"purchaseDate\":\"2025-04-30\",\"purchaseId\":13,\"quantity\":23014,\"supplierId\":2,\"totalAmount\":123698}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 16:37:59', 17);
INSERT INTO `sys_oper_log` VALUES (203, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"roleId\":3,\"roleKey\":\"cg\",\"roleName\":\"cg\",\"roleSort\":0,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 20:11:51', 53);
INSERT INTO `sys_oper_log` VALUES (204, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"roleId\":4,\"roleKey\":\"xs\",\"roleName\":\"xs\",\"roleSort\":0,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 20:12:00', 11);
INSERT INTO `sys_oper_log` VALUES (205, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"roleId\":5,\"roleKey\":\"pd\",\"roleName\":\"pd\",\"roleSort\":0,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 20:12:11', 15);
INSERT INTO `sys_oper_log` VALUES (206, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-04-27 20:11:51\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"roleId\":3,\"roleKey\":\"cg\",\"roleName\":\"采购\",\"roleSort\":0,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 20:12:34', 19);
INSERT INTO `sys_oper_log` VALUES (207, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-04-27 20:12:00\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"roleId\":4,\"roleKey\":\"xs\",\"roleName\":\"销售\",\"roleSort\":0,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 20:12:42', 15);
INSERT INTO `sys_oper_log` VALUES (208, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-04-27 20:12:11\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"roleId\":5,\"roleKey\":\"pd\",\"roleName\":\"盘点\",\"roleSort\":0,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 20:12:50', 14);
INSERT INTO `sys_oper_log` VALUES (209, '角色管理', 3, 'com.ruoyi.web.controller.system.SysRoleController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/role/5', '127.0.0.1', '内网IP', '[5]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 20:15:41', 24);
INSERT INTO `sys_oper_log` VALUES (210, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', '研发部门', '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":true,\"avatar\":\"/profile/avatar/2025/04/20/LYYPAPLdRUqee8638259220b293e9fa78f5e95cd68fd_20250420124129A001.png\",\"createBy\":\"admin\",\"createTime\":\"2025-04-07 19:36:23\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"研发部门\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{\"@type\":\"java.util.HashMap\"},\"parentId\":101,\"status\":\"0\"},\"deptId\":103,\"email\":\"admin@163.com\",\"loginDate\":\"2025-04-27 19:58:41\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"管理员\",\"params\":{\"@type\":\"java.util.HashMap\"},\"phonenumber\":\"15888888888\",\"remark\":\"管理员\",\"roles\":[{\"admin\":true,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{\"@type\":\"java.util.HashMap\"},\"roleId\":1,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"roleSort\":1,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"userId\":1,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 20:17:50', 19);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2025-04-07 19:36:23', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2025-04-07 19:36:23', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2025-04-07 19:36:23', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2025-04-07 19:36:23', '', NULL, '普通角色');
INSERT INTO `sys_role` VALUES (3, '采购', 'cg', 0, '1', 1, 1, '0', '0', 'admin', '2025-04-27 20:11:51', 'admin', '2025-04-27 20:12:34', NULL);
INSERT INTO `sys_role` VALUES (4, '销售', 'xs', 0, '1', 1, 1, '0', '0', 'admin', '2025-04-27 20:12:00', 'admin', '2025-04-27 20:12:42', NULL);
INSERT INTO `sys_role` VALUES (5, '盘点', 'pd', 0, '1', 1, 1, '0', '2', 'admin', '2025-04-27 20:12:11', 'admin', '2025-04-27 20:12:50', NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '管理员', '00', 'admin@163.com', '15888888888', '0', '/profile/avatar/2025/04/20/LYYPAPLdRUqee8638259220b293e9fa78f5e95cd68fd_20250420124129A001.png', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2025-04-27 20:18:36', 'admin', '2025-04-07 19:36:23', '', '2025-04-27 20:18:36', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2025-04-07 19:36:23', 'admin', '2025-04-07 19:36:23', '', NULL, '测试员');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

SET FOREIGN_KEY_CHECKS = 1;
