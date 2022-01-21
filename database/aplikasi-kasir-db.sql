/*
 Navicat Premium Data Transfer

 Source Server         : local-db
 Source Server Type    : PostgreSQL
 Source Server Version : 130002
 Source Host           : localhost:5432
 Source Catalog        : aplikasi-kasir-db
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 130002
 File Encoding         : 65001

 Date: 21/01/2022 22:38:23
*/


-- ----------------------------
-- Sequence structure for category_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."category_id_seq";
CREATE SEQUENCE "public"."category_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 987654321
START 1
CACHE 1;
ALTER SEQUENCE "public"."category_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for order_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."order_id_seq";
CREATE SEQUENCE "public"."order_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."order_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for product_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."product_id_seq";
CREATE SEQUENCE "public"."product_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 987654321
START 1
CACHE 1;
ALTER SEQUENCE "public"."product_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for shopping_chart_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."shopping_chart_id_seq";
CREATE SEQUENCE "public"."shopping_chart_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 987654321
START 1
CACHE 1;
ALTER SEQUENCE "public"."shopping_chart_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS "public"."category";
CREATE TABLE "public"."category" (
  "category_id" int8 NOT NULL,
  "category_name" varchar(50) COLLATE "pg_catalog"."default",
  "created_by" int8,
  "created_on" timestamp(6),
  "last_modified_by" int8,
  "last_modified_on" timestamp(6),
  "is_deleted" bool
)
;
ALTER TABLE "public"."category" OWNER TO "postgres";

-- ----------------------------
-- Records of category
-- ----------------------------
BEGIN;
INSERT INTO "public"."category" VALUES (3, 'Makanan', 1, '2021-04-24 17:41:16.341', 1, '2021-04-24 17:41:16.341', 'f');
INSERT INTO "public"."category" VALUES (4, 'Minuman', 1, '2021-04-24 17:41:25.43', 1, '2021-04-24 17:41:25.43', 'f');
INSERT INTO "public"."category" VALUES (5, 'Cemilan', 1, '2021-04-24 17:41:30.232', 1, '2021-04-24 17:41:30.232', 'f');
COMMIT;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS "public"."orders";
CREATE TABLE "public"."orders" (
  "order_id" int8 NOT NULL,
  "total" numeric,
  "order_product" text COLLATE "pg_catalog"."default"
)
;
ALTER TABLE "public"."orders" OWNER TO "postgres";

-- ----------------------------
-- Records of orders
-- ----------------------------
BEGIN;
INSERT INTO "public"."orders" VALUES (42, 59000, '[{"shoppingChartId":28,"total":2,"price":20000,"product":{"productId":2,"productName":"Bakso Urat","productPhoto":"bakso.jpeg","productCode":"MKN-001","productPrice":10000,"category":{"categoryId":3,"categoryName":"Makanan","createdBy":1,"createdOn":"Apr 24, 2021, 5:41:16 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:41:16 PM","isDeleted":false},"createdBy":1,"createdOn":"Apr 24, 2021, 5:42:57 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:42:57 PM","isDeleted":false}},{"shoppingChartId":30,"total":1,"price":4000,"product":{"productId":12,"productName":"Keripik Ubi","productPhoto":"keripik-ubi.jpeg","productCode":"CML-002","productPrice":4000,"category":{"categoryId":5,"categoryName":"Cemilan","createdBy":1,"createdOn":"Apr 24, 2021, 5:41:30 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:41:30 PM","isDeleted":false},"createdBy":1,"createdOn":"Apr 24, 2021, 5:46:45 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:46:45 PM","isDeleted":false}},{"shoppingChartId":31,"total":1,"price":5000,"product":{"productId":37,"productName":"Keripik Tales","productPhoto":"keripik-tales.jpeg","productCode":"CML-004","productPrice":5000,"category":{"categoryId":5,"categoryName":"Cemilan","createdBy":1,"createdOn":"Apr 24, 2021, 5:41:30 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:41:30 PM","isDeleted":false},"createdBy":1,"createdOn":"Apr 24, 2021, 6:26:46 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 6:26:46 PM","isDeleted":false}},{"shoppingChartId":32,"total":1,"price":4000,"product":{"productId":11,"productName":"Keripik Singkong","productPhoto":"keripik-singkong.jpeg","productCode":"CML-001","productPrice":4000,"category":{"categoryId":5,"categoryName":"Cemilan","createdBy":1,"createdOn":"Apr 24, 2021, 5:41:30 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:41:30 PM","isDeleted":false},"createdBy":1,"createdOn":"Apr 24, 2021, 5:46:37 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:46:37 PM","isDeleted":false}},{"shoppingChartId":33,"total":1,"price":5000,"product":{"productId":13,"productName":"Keripik Kentang","productPhoto":"keripik-kentang.jpeg","productCode":"CML-003","productPrice":5000,"category":{"categoryId":5,"categoryName":"Cemilan","createdBy":1,"createdOn":"Apr 24, 2021, 5:41:30 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:41:30 PM","isDeleted":false},"createdBy":1,"createdOn":"Apr 24, 2021, 5:46:57 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:46:57 PM","isDeleted":false}},{"shoppingChartId":29,"total":2,"price":12000,"product":{"productId":10,"productName":"Air Mineral","productPhoto":"air-mineral.jpeg","productCode":"MNM-003","productPrice":6000,"category":{"categoryId":4,"categoryName":"Minuman","createdBy":1,"createdOn":"Apr 24, 2021, 5:41:25 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:41:25 PM","isDeleted":false},"createdBy":1,"createdOn":"Apr 24, 2021, 5:46:12 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:46:12 PM","isDeleted":false}},{"shoppingChartId":34,"total":1,"price":6000,"product":{"productId":9,"productName":"Jus Jeruk","productPhoto":"es-jeruk.jpeg","productCode":"MNM-002","productPrice":6000,"category":{"categoryId":4,"categoryName":"Minuman","createdBy":1,"createdOn":"Apr 24, 2021, 5:41:25 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:41:25 PM","isDeleted":false},"createdBy":1,"createdOn":"Apr 24, 2021, 5:45:54 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:45:54 PM","isDeleted":false}},{"shoppingChartId":35,"total":1,"price":3000,"product":{"productId":8,"productName":"Es Teh","productPhoto":"es-teh.jpeg","productCode":"MNM-001","productPrice":3000,"category":{"categoryId":4,"categoryName":"Minuman","createdBy":1,"createdOn":"Apr 24, 2021, 5:41:25 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:41:25 PM","isDeleted":false},"createdBy":1,"createdOn":"Apr 24, 2021, 5:45:34 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:45:34 PM","isDeleted":false}}]');
INSERT INTO "public"."orders" VALUES (43, 59000, '[{"shoppingChartId":28,"total":2,"price":20000,"product":{"productId":2,"productName":"Bakso Urat","productPhoto":"bakso.jpeg","productCode":"MKN-001","productPrice":10000,"category":{"categoryId":3,"categoryName":"Makanan","createdBy":1,"createdOn":"Apr 24, 2021, 5:41:16 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:41:16 PM","isDeleted":false},"createdBy":1,"createdOn":"Apr 24, 2021, 5:42:57 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:42:57 PM","isDeleted":false}},{"shoppingChartId":30,"total":1,"price":4000,"product":{"productId":12,"productName":"Keripik Ubi","productPhoto":"keripik-ubi.jpeg","productCode":"CML-002","productPrice":4000,"category":{"categoryId":5,"categoryName":"Cemilan","createdBy":1,"createdOn":"Apr 24, 2021, 5:41:30 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:41:30 PM","isDeleted":false},"createdBy":1,"createdOn":"Apr 24, 2021, 5:46:45 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:46:45 PM","isDeleted":false}},{"shoppingChartId":31,"total":1,"price":5000,"product":{"productId":37,"productName":"Keripik Tales","productPhoto":"keripik-tales.jpeg","productCode":"CML-004","productPrice":5000,"category":{"categoryId":5,"categoryName":"Cemilan","createdBy":1,"createdOn":"Apr 24, 2021, 5:41:30 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:41:30 PM","isDeleted":false},"createdBy":1,"createdOn":"Apr 24, 2021, 6:26:46 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 6:26:46 PM","isDeleted":false}},{"shoppingChartId":32,"total":1,"price":4000,"product":{"productId":11,"productName":"Keripik Singkong","productPhoto":"keripik-singkong.jpeg","productCode":"CML-001","productPrice":4000,"category":{"categoryId":5,"categoryName":"Cemilan","createdBy":1,"createdOn":"Apr 24, 2021, 5:41:30 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:41:30 PM","isDeleted":false},"createdBy":1,"createdOn":"Apr 24, 2021, 5:46:37 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:46:37 PM","isDeleted":false}},{"shoppingChartId":33,"total":1,"price":5000,"product":{"productId":13,"productName":"Keripik Kentang","productPhoto":"keripik-kentang.jpeg","productCode":"CML-003","productPrice":5000,"category":{"categoryId":5,"categoryName":"Cemilan","createdBy":1,"createdOn":"Apr 24, 2021, 5:41:30 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:41:30 PM","isDeleted":false},"createdBy":1,"createdOn":"Apr 24, 2021, 5:46:57 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:46:57 PM","isDeleted":false}},{"shoppingChartId":29,"total":2,"price":12000,"product":{"productId":10,"productName":"Air Mineral","productPhoto":"air-mineral.jpeg","productCode":"MNM-003","productPrice":6000,"category":{"categoryId":4,"categoryName":"Minuman","createdBy":1,"createdOn":"Apr 24, 2021, 5:41:25 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:41:25 PM","isDeleted":false},"createdBy":1,"createdOn":"Apr 24, 2021, 5:46:12 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:46:12 PM","isDeleted":false}},{"shoppingChartId":34,"total":1,"price":6000,"product":{"productId":9,"productName":"Jus Jeruk","productPhoto":"es-jeruk.jpeg","productCode":"MNM-002","productPrice":6000,"category":{"categoryId":4,"categoryName":"Minuman","createdBy":1,"createdOn":"Apr 24, 2021, 5:41:25 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:41:25 PM","isDeleted":false},"createdBy":1,"createdOn":"Apr 24, 2021, 5:45:54 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:45:54 PM","isDeleted":false}},{"shoppingChartId":35,"total":1,"price":3000,"product":{"productId":8,"productName":"Es Teh","productPhoto":"es-teh.jpeg","productCode":"MNM-001","productPrice":3000,"category":{"categoryId":4,"categoryName":"Minuman","createdBy":1,"createdOn":"Apr 24, 2021, 5:41:25 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:41:25 PM","isDeleted":false},"createdBy":1,"createdOn":"Apr 24, 2021, 5:45:34 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:45:34 PM","isDeleted":false}}]');
INSERT INTO "public"."orders" VALUES (44, 10000, '[{"shoppingChartId":36,"total":1,"price":10000,"product":{"productId":2,"productName":"Bakso Urat","productPhoto":"bakso.jpeg","productCode":"MKN-001","productPrice":10000,"category":{"categoryId":3,"categoryName":"Makanan","createdBy":1,"createdOn":"Apr 24, 2021, 5:41:16 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:41:16 PM","isDeleted":false},"createdBy":1,"createdOn":"Apr 24, 2021, 5:42:57 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:42:57 PM","isDeleted":false}}]');
INSERT INTO "public"."orders" VALUES (45, 28000, '[{"shoppingChartId":37,"total":2,"price":22000,"product":{"productId":6,"productName":"Ketoprak","productPhoto":"ketoprak.jpeg","productCode":"MKN-005","productPrice":11000,"category":{"categoryId":3,"categoryName":"Makanan","createdBy":1,"createdOn":"Apr 24, 2021, 5:41:16 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:41:16 PM","isDeleted":false},"createdBy":1,"createdOn":"Apr 24, 2021, 5:44:28 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:44:28 PM","isDeleted":false}},{"shoppingChartId":38,"total":1,"price":6000,"product":{"productId":7,"productName":"Tahu Gejrot","productPhoto":"tahu-gejrot.jpeg","productCode":"MKN-006","productPrice":6000,"category":{"categoryId":3,"categoryName":"Makanan","createdBy":1,"createdOn":"Apr 24, 2021, 5:41:16 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:41:16 PM","isDeleted":false},"createdBy":1,"createdOn":"Apr 24, 2021, 5:45:00 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:45:00 PM","isDeleted":false}}]');
INSERT INTO "public"."orders" VALUES (46, 0, '[]');
INSERT INTO "public"."orders" VALUES (47, 22000, '[{"shoppingChartId":43,"total":1,"price":12000,"product":{"productId":3,"productName":"Mie Ayam","productPhoto":"mie-ayam.jpeg","productCode":"MKN-002","productPrice":12000,"category":{"categoryId":3,"categoryName":"Makanan","createdBy":1,"createdOn":"Apr 24, 2021, 5:41:16 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:41:16 PM","isDeleted":false},"createdBy":1,"createdOn":"Apr 24, 2021, 5:43:13 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:43:13 PM","isDeleted":false}},{"shoppingChartId":44,"total":1,"price":10000,"product":{"productId":2,"productName":"Bakso Urat","productPhoto":"bakso.jpeg","productCode":"MKN-001","productPrice":10000,"category":{"categoryId":3,"categoryName":"Makanan","createdBy":1,"createdOn":"Apr 24, 2021, 5:41:16 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:41:16 PM","isDeleted":false},"createdBy":1,"createdOn":"Apr 24, 2021, 5:42:57 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:42:57 PM","isDeleted":false}}]');
INSERT INTO "public"."orders" VALUES (48, 22000, '[{"shoppingChartId":46,"total":1,"price":10000,"product":{"productId":2,"productName":"Bakso Urat","productPhoto":"bakso.jpeg","productCode":"MKN-001","productPrice":10000,"category":{"categoryId":3,"categoryName":"Makanan","createdBy":1,"createdOn":"Apr 24, 2021, 5:41:16 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:41:16 PM","isDeleted":false},"createdBy":1,"createdOn":"Apr 24, 2021, 5:42:57 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:42:57 PM","isDeleted":false}},{"shoppingChartId":47,"total":1,"price":12000,"product":{"productId":3,"productName":"Mie Ayam","productPhoto":"mie-ayam.jpeg","productCode":"MKN-002","productPrice":12000,"category":{"categoryId":3,"categoryName":"Makanan","createdBy":1,"createdOn":"Apr 24, 2021, 5:41:16 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:41:16 PM","isDeleted":false},"createdBy":1,"createdOn":"Apr 24, 2021, 5:43:13 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:43:13 PM","isDeleted":false}}]');
INSERT INTO "public"."orders" VALUES (49, 20000, '[{"shoppingChartId":48,"total":2,"price":20000,"product":{"productId":2,"productName":"Bakso Urat","productPhoto":"bakso.jpeg","productCode":"MKN-001","productPrice":10000,"category":{"categoryId":3,"categoryName":"Makanan","createdBy":1,"createdOn":"Apr 24, 2021, 5:41:16 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:41:16 PM","isDeleted":false},"createdBy":1,"createdOn":"Apr 24, 2021, 5:42:57 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:42:57 PM","isDeleted":false}}]');
INSERT INTO "public"."orders" VALUES (50, 44000, '[{"shoppingChartId":50,"total":2,"price":24000,"product":{"productId":3,"productName":"Mie Ayam","productPhoto":"mie-ayam.jpeg","productCode":"MKN-002","productPrice":12000,"category":{"categoryId":3,"categoryName":"Makanan","createdBy":1,"createdOn":"Apr 24, 2021, 5:41:16 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:41:16 PM","isDeleted":false},"createdBy":1,"createdOn":"Apr 24, 2021, 5:43:13 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:43:13 PM","isDeleted":false}},{"shoppingChartId":49,"total":2,"price":20000,"product":{"productId":2,"productName":"Bakso Urat","productPhoto":"bakso.jpeg","productCode":"MKN-001","productPrice":10000,"category":{"categoryId":3,"categoryName":"Makanan","createdBy":1,"createdOn":"Apr 24, 2021, 5:41:16 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:41:16 PM","isDeleted":false},"createdBy":1,"createdOn":"Apr 24, 2021, 5:42:57 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:42:57 PM","isDeleted":false}}]');
INSERT INTO "public"."orders" VALUES (51, 34000, '[{"shoppingChartId":51,"total":1,"price":12000,"product":{"productId":3,"productName":"Mie Ayam","productPhoto":"mie-ayam.jpeg","productCode":"MKN-002","productPrice":12000,"category":{"categoryId":3,"categoryName":"Makanan","createdBy":1,"createdOn":"Apr 24, 2021, 5:41:16 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:41:16 PM","isDeleted":false},"createdBy":1,"createdOn":"Apr 24, 2021, 5:43:13 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:43:13 PM","isDeleted":false}},{"shoppingChartId":52,"total":2,"price":22000,"product":{"productId":6,"productName":"Ketoprak","productPhoto":"ketoprak.jpeg","productCode":"MKN-005","productPrice":11000,"category":{"categoryId":3,"categoryName":"Makanan","createdBy":1,"createdOn":"Apr 24, 2021, 5:41:16 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:41:16 PM","isDeleted":false},"createdBy":1,"createdOn":"Apr 24, 2021, 5:44:28 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:44:28 PM","isDeleted":false}}]');
INSERT INTO "public"."orders" VALUES (52, 53000, '[{"shoppingChartId":53,"total":2,"price":8000,"product":{"productId":11,"productName":"Keripik Singkong","productPhoto":"keripik-singkong.jpeg","productCode":"CML-001","productPrice":4000,"category":{"categoryId":5,"categoryName":"Cemilan","createdBy":1,"createdOn":"Apr 24, 2021, 5:41:30 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:41:30 PM","isDeleted":false},"createdBy":1,"createdOn":"Apr 24, 2021, 5:46:37 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:46:37 PM","isDeleted":false}},{"shoppingChartId":54,"total":1,"price":3000,"product":{"productId":8,"productName":"Es Teh","productPhoto":"es-teh.jpeg","productCode":"MNM-001","productPrice":3000,"category":{"categoryId":4,"categoryName":"Minuman","createdBy":1,"createdOn":"Apr 24, 2021, 5:41:25 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:41:25 PM","isDeleted":false},"createdBy":1,"createdOn":"Apr 24, 2021, 5:45:34 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:45:34 PM","isDeleted":false}},{"shoppingChartId":55,"total":2,"price":24000,"product":{"productId":3,"productName":"Mie Ayam","productPhoto":"mie-ayam.jpeg","productCode":"MKN-002","productPrice":12000,"category":{"categoryId":3,"categoryName":"Makanan","createdBy":1,"createdOn":"Apr 24, 2021, 5:41:16 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:41:16 PM","isDeleted":false},"createdBy":1,"createdOn":"Apr 24, 2021, 5:43:13 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:43:13 PM","isDeleted":false}},{"shoppingChartId":56,"total":1,"price":18000,"product":{"productId":4,"productName":"Seblak","productPhoto":"seblak.jpeg","productCode":"MKN-003","productPrice":18000,"category":{"categoryId":3,"categoryName":"Makanan","createdBy":1,"createdOn":"Apr 24, 2021, 5:41:16 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:41:16 PM","isDeleted":false},"createdBy":1,"createdOn":"Apr 24, 2021, 5:43:37 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:43:37 PM","isDeleted":false}}]');
INSERT INTO "public"."orders" VALUES (53, 18000, '[{"shoppingChartId":57,"total":1,"price":12000,"product":{"productId":3,"productName":"Mie Ayam","productPhoto":"mie-ayam.jpeg","productCode":"MKN-002","productPrice":12000,"category":{"categoryId":3,"categoryName":"Makanan","createdBy":1,"createdOn":"Apr 24, 2021, 5:41:16 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:41:16 PM","isDeleted":false},"createdBy":1,"createdOn":"Apr 24, 2021, 5:43:13 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:43:13 PM","isDeleted":false}},{"shoppingChartId":58,"total":1,"price":6000,"product":{"productId":10,"productName":"Air Mineral","productPhoto":"air-mineral.jpeg","productCode":"MNM-003","productPrice":6000,"category":{"categoryId":4,"categoryName":"Minuman","createdBy":1,"createdOn":"Apr 24, 2021, 5:41:25 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:41:25 PM","isDeleted":false},"createdBy":1,"createdOn":"Apr 24, 2021, 5:46:12 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:46:12 PM","isDeleted":false}}]');
INSERT INTO "public"."orders" VALUES (54, 9000, '[{"shoppingChartId":59,"total":1,"price":6000,"product":{"productId":10,"productName":"Air Mineral","productPhoto":"air-mineral.jpeg","productCode":"MNM-003","productPrice":6000,"category":{"categoryId":4,"categoryName":"Minuman","createdBy":1,"createdOn":"Apr 24, 2021, 5:41:25 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:41:25 PM","isDeleted":false},"createdBy":1,"createdOn":"Apr 24, 2021, 5:46:12 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:46:12 PM","isDeleted":false}},{"shoppingChartId":60,"total":1,"price":3000,"product":{"productId":8,"productName":"Es Teh","productPhoto":"es-teh.jpeg","productCode":"MNM-001","productPrice":3000,"category":{"categoryId":4,"categoryName":"Minuman","createdBy":1,"createdOn":"Apr 24, 2021, 5:41:25 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:41:25 PM","isDeleted":false},"createdBy":1,"createdOn":"Apr 24, 2021, 5:45:34 PM","lastModifiedBy":1,"lastModifiedOn":"Apr 24, 2021, 5:45:34 PM","isDeleted":false}}]');
COMMIT;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS "public"."product";
CREATE TABLE "public"."product" (
  "product_id" int8 NOT NULL,
  "product_name" varchar(50) COLLATE "pg_catalog"."default",
  "product_photo" text COLLATE "pg_catalog"."default",
  "product_price" numeric,
  "category_id" int8,
  "created_by" int8,
  "created_on" timestamp(6),
  "last_modified_by" int8,
  "last_modified_on" timestamp(6),
  "is_deleted" bool,
  "product_code" varchar(15) COLLATE "pg_catalog"."default"
)
;
ALTER TABLE "public"."product" OWNER TO "postgres";

-- ----------------------------
-- Records of product
-- ----------------------------
BEGIN;
INSERT INTO "public"."product" VALUES (11, 'Keripik Singkong', 'keripik-singkong.jpeg', 4000, 5, 1, '2021-04-24 17:46:37.194', 1, '2021-04-24 17:46:37.194', 'f', 'CML-001');
INSERT INTO "public"."product" VALUES (13, 'Keripik Kentang', 'keripik-kentang.jpeg', 5000, 5, 1, '2021-04-24 17:46:57.155', 1, '2021-04-24 17:46:57.155', 'f', 'CML-003');
INSERT INTO "public"."product" VALUES (37, 'Keripik Tales', 'keripik-tales.jpeg', 5000, 5, 1, '2021-04-21 18:26:46.144', 1, '2021-04-24 18:26:46.144', 'f', 'CML-004');
INSERT INTO "public"."product" VALUES (3, 'Mie Ayam', 'mie-ayam.jpeg', 12000, 3, 1, '2021-04-24 17:43:13.502', 1, '2021-04-24 17:43:13.502', 'f', 'MKN-002');
INSERT INTO "public"."product" VALUES (2, 'Bakso Urat', 'bakso.jpeg', 10000, 3, 1, '2021-04-24 17:42:57.071', 1, '2021-04-24 17:42:57.071', 'f', 'MKN-001');
INSERT INTO "public"."product" VALUES (7, 'Tahu Gejrot', 'tahu-gejrot.jpeg', 6000, 3, 1, '2021-04-24 17:45:00.47', 1, '2021-04-24 17:45:00.47', 'f', 'MKN-006');
INSERT INTO "public"."product" VALUES (6, 'Ketoprak', 'ketoprak.jpeg', 11000, 3, 1, '2021-04-24 17:44:28.074', 1, '2021-04-24 17:44:28.074', 'f', 'MKN-005');
INSERT INTO "public"."product" VALUES (5, 'Tahu Telur', 'tahu-telur.jpeg', 15000, 3, 1, '2021-04-24 17:44:03.897', 1, '2021-04-24 17:44:03.897', 'f', 'MKN-004');
INSERT INTO "public"."product" VALUES (4, 'Seblak', 'seblak.jpeg', 18000, 3, 1, '2021-04-24 17:43:37.921', 1, '2021-04-24 17:43:37.921', 'f', 'MKN-003');
INSERT INTO "public"."product" VALUES (10, 'Air Mineral', 'air-mineral.jpeg', 6000, 4, 1, '2021-04-24 17:46:12.929', 1, '2021-04-24 17:46:12.929', 'f', 'MNM-003');
INSERT INTO "public"."product" VALUES (8, 'Es Teh', 'es-teh.jpeg', 3000, 4, 1, '2021-04-24 17:45:34.883', 1, '2021-04-24 17:45:34.883', 'f', 'MNM-001');
INSERT INTO "public"."product" VALUES (9, 'Jus Jeruk', 'es-jeruk.jpeg', 6000, 4, 1, '2021-04-24 17:45:54.534', 1, '2021-04-24 17:45:54.534', 'f', 'MNM-002');
COMMIT;

-- ----------------------------
-- Table structure for shopping_chart
-- ----------------------------
DROP TABLE IF EXISTS "public"."shopping_chart";
CREATE TABLE "public"."shopping_chart" (
  "shopping_chart_id" int8 NOT NULL,
  "total" int4,
  "price" numeric,
  "product_id" int8
)
;
ALTER TABLE "public"."shopping_chart" OWNER TO "postgres";

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."category_id_seq"', 40, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."order_id_seq"', 55, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."product_id_seq"', 38, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."shopping_chart_id_seq"', 61, true);

-- ----------------------------
-- Primary Key structure for table category
-- ----------------------------
ALTER TABLE "public"."category" ADD CONSTRAINT "category_pkey" PRIMARY KEY ("category_id");

-- ----------------------------
-- Primary Key structure for table orders
-- ----------------------------
ALTER TABLE "public"."orders" ADD CONSTRAINT "order_pkey" PRIMARY KEY ("order_id");

-- ----------------------------
-- Primary Key structure for table product
-- ----------------------------
ALTER TABLE "public"."product" ADD CONSTRAINT "zakat_pkey" PRIMARY KEY ("product_id");

-- ----------------------------
-- Foreign Keys structure for table product
-- ----------------------------
ALTER TABLE "public"."product" ADD CONSTRAINT "fkhfsvfenlyr7pbuqih4rd14dk3" FOREIGN KEY ("category_id") REFERENCES "public"."category" ("category_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Primary Key structure for table shopping_chart
-- ----------------------------
ALTER TABLE "public"."shopping_chart" ADD CONSTRAINT "shopping_chart_pkey" PRIMARY KEY ("shopping_chart_id");

-- ----------------------------
-- Foreign Keys structure for table shopping_chart
-- ----------------------------
ALTER TABLE "public"."shopping_chart" ADD CONSTRAINT "fk6oxh1a6l4io9qbh2gai9g0raa" FOREIGN KEY ("product_id") REFERENCES "public"."product" ("product_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
