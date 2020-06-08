/*
SQLyog Community v13.1.5  (64 bit)
MySQL - 5.6.40 : Database - wsimcpsn_shopnow
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`wsimcpsn_shopnow` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `wsimcpsn_shopnow`;

/*Table structure for table `Customer_Authentication` */

DROP TABLE IF EXISTS `Customer_Authentication`;

CREATE TABLE `Customer_Authentication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `accessToken` text NOT NULL,
  `idToken` text NOT NULL,
  `refreshToken` text,
  `status` varchar(15) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `Student` */

DROP TABLE IF EXISTS `Student`;

CREATE TABLE `Student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

/*Table structure for table `address` */

DROP TABLE IF EXISTS `address`;

CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerId` int(11) NOT NULL,
  `type_billing_shipping` varchar(250) NOT NULL,
  `firstName` varchar(200) NOT NULL,
  `lastName` varchar(200) NOT NULL,
  `address1` varchar(250) NOT NULL,
  `address2` varchar(250) DEFAULT NULL,
  `address3` varchar(250) DEFAULT NULL,
  `city` varchar(200) NOT NULL,
  `state` varchar(200) NOT NULL,
  `country` varchar(200) NOT NULL,
  `phoneNumber` varchar(100) NOT NULL,
  `isPrimary` int(11) NOT NULL,
  `pincode` int(20) DEFAULT NULL,
  `email_address` varchar(100) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL DEFAULT '-1',
  `modified_by` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  KEY `fk_created_by` (`created_by`),
  KEY `fk_modified_by` (`modified_by`),
  CONSTRAINT `fk_created_by` FOREIGN KEY (`created_by`) REFERENCES `customers` (`id`),
  CONSTRAINT `fk_modified_by` FOREIGN KEY (`modified_by`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=457 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `username` varchar(36) NOT NULL,
  `password` varchar(36) NOT NULL,
  `isadmin` varchar(50) DEFAULT NULL,
  `emailid` text NOT NULL,
  `isactive` int(2) NOT NULL,
  `is_external` int(11) NOT NULL,
  `image` varchar(250) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Table structure for table `attributes` */

DROP TABLE IF EXISTS `attributes`;

CREATE TABLE `attributes` (
  `id` int(11) NOT NULL,
  `att_group_name` varchar(200) NOT NULL,
  `status` varchar(200) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE` (`att_group_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `attributes_value` */

DROP TABLE IF EXISTS `attributes_value`;

CREATE TABLE `attributes_value` (
  `id` bigint(255) NOT NULL,
  `att_group_id` int(11) NOT NULL,
  `att_value` varchar(200) NOT NULL,
  `status` varchar(200) NOT NULL,
  `color_code` varchar(50) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE_ATT_VAL` (`att_value`),
  KEY `fk_att` (`att_group_id`),
  CONSTRAINT `fk_att` FOREIGN KEY (`att_group_id`) REFERENCES `attributes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `banners` */

DROP TABLE IF EXISTS `banners`;

CREATE TABLE `banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `image` varchar(300) NOT NULL,
  `status` varchar(50) NOT NULL,
  `show_homepage` varchar(100) NOT NULL,
  `product_ids` text,
  `products` text,
  `deal` text,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Table structure for table `best_product` */

DROP TABLE IF EXISTS `best_product`;

CREATE TABLE `best_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `type` int(11) DEFAULT NULL,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Table structure for table `cart_items` */

DROP TABLE IF EXISTS `cart_items`;

CREATE TABLE `cart_items` (
  `CartItemId` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` varchar(50) NOT NULL,
  `UserId` int(11) NOT NULL,
  `CheckedOut` binary(1) NOT NULL DEFAULT '0',
  `ProductId` int(11) NOT NULL,
  `VendorId` varchar(45) NOT NULL,
  `Quantity` int(100) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`CartItemId`),
  UNIQUE KEY `ProductId` (`ProductId`,`UserId`,`device_id`),
  KEY `fk_userid` (`UserId`),
  KEY `fk_create` (`created_by`),
  KEY `fk_modify` (`modified_by`),
  CONSTRAINT `fk_create` FOREIGN KEY (`created_by`) REFERENCES `customers` (`id`),
  CONSTRAINT `fk_modify` FOREIGN KEY (`modified_by`) REFERENCES `customers` (`id`),
  CONSTRAINT `fk_product_id_cart` FOREIGN KEY (`ProductId`) REFERENCES `products` (`id`),
  CONSTRAINT `fk_userid` FOREIGN KEY (`UserId`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=695 DEFAULT CHARSET=latin1;

/*Table structure for table `cart_promocode` */

DROP TABLE IF EXISTS `cart_promocode`;

CREATE TABLE `cart_promocode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `promocode_id` int(11) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `promo_id` (`device_id`,`user_id`,`promocode_id`),
  KEY `fk_create_promo` (`created_by`),
  KEY `fk_modify_promo` (`modified_by`),
  CONSTRAINT `fk_create_promo` FOREIGN KEY (`created_by`) REFERENCES `customers` (`id`),
  CONSTRAINT `fk_modify_promo` FOREIGN KEY (`modified_by`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=299 DEFAULT CHARSET=latin1;

/*Table structure for table `cat_mapping` */

DROP TABLE IF EXISTS `cat_mapping`;

CREATE TABLE `cat_mapping` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `category` varchar(200) DEFAULT NULL,
  `sub_category` varchar(200) DEFAULT NULL,
  `child` varchar(200) DEFAULT NULL,
  `vendor_id` int(50) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=319 DEFAULT CHARSET=utf8;

/*Table structure for table `categories` */

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `parent_id` varchar(50) NOT NULL DEFAULT '0',
  `image` varchar(500) NOT NULL,
  `status` varchar(50) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

/*Table structure for table `color_code_main` */

DROP TABLE IF EXISTS `color_code_main`;

CREATE TABLE `color_code_main` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `color_name` varchar(50) DEFAULT NULL,
  `color_code` varchar(50) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=989 DEFAULT CHARSET=latin1;

/*Table structure for table `couriers` */

DROP TABLE IF EXISTS `couriers`;

CREATE TABLE `couriers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courier_name` varchar(250) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_vendor_id` (`vendor_id`),
  CONSTRAINT `fk_vendor_id` FOREIGN KEY (`vendor_id`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Table structure for table `customer_notifications` */

DROP TABLE IF EXISTS `customer_notifications`;

CREATE TABLE `customer_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notification_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `mobile_number` varchar(20) DEFAULT NULL,
  `cust_noti_schedule` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT '-1',
  `modified_by` int(11) DEFAULT '-1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Table structure for table `customer_order_address` */

DROP TABLE IF EXISTS `customer_order_address`;

CREATE TABLE `customer_order_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `address1` varchar(200) NOT NULL,
  `address2` varchar(200) DEFAULT NULL,
  `address3` varchar(200) DEFAULT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `pincode` int(20) NOT NULL,
  `phoneNumber` varchar(500) NOT NULL,
  `email_address` varchar(200) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_create_order_add` (`created_by`),
  KEY `fk_modify_order_add` (`modified_by`),
  CONSTRAINT `fk_create_order_add` FOREIGN KEY (`created_by`) REFERENCES `customers` (`id`),
  CONSTRAINT `fk_modify_order_add` FOREIGN KEY (`modified_by`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=233 DEFAULT CHARSET=latin1;

/*Table structure for table `customer_order_details` */

DROP TABLE IF EXISTS `customer_order_details`;

CREATE TABLE `customer_order_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `order_number` varchar(200) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `price` float DEFAULT NULL,
  `expected_date_of_delivery` date DEFAULT NULL,
  `delivery_status_code` varchar(200) DEFAULT NULL,
  `vendor_product_id` varchar(200) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `discounts` float DEFAULT NULL,
  `promocodes` varchar(50) DEFAULT NULL,
  `shipping_charge` float DEFAULT '0',
  `effective_price` float DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `productId` (`product_id`),
  KEY `user_id` (`customer_id`),
  KEY `fk_create_order_detail` (`created_by`),
  KEY `fk_modify_order_detail` (`modified_by`),
  CONSTRAINT `fk_create_order_detail` FOREIGN KEY (`created_by`) REFERENCES `customers` (`id`),
  CONSTRAINT `fk_modify_order_detail` FOREIGN KEY (`modified_by`) REFERENCES `customers` (`id`),
  CONSTRAINT `order_id` FOREIGN KEY (`order_id`) REFERENCES `customer_orders` (`order_id`),
  CONSTRAINT `productId` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `user_id` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=342 DEFAULT CHARSET=latin1;

/*Table structure for table `customer_orders` */

DROP TABLE IF EXISTS `customer_orders`;

CREATE TABLE `customer_orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_number` varchar(100) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `order_status_code` varchar(100) DEFAULT NULL,
  `date_of_placed_order` timestamp NULL DEFAULT NULL,
  `date_of_order_paid` timestamp NULL DEFAULT NULL,
  `payment_status` varchar(100) DEFAULT NULL,
  `mode_of_payment` varchar(100) DEFAULT NULL,
  `payment_gateway` varchar(200) DEFAULT NULL,
  `transaction_id` varchar(200) DEFAULT NULL,
  `authorization_id` varchar(100) DEFAULT NULL,
  `sub_total` float DEFAULT NULL,
  `tax` float DEFAULT NULL,
  `shipping` float DEFAULT NULL,
  `grand_total` float DEFAULT NULL,
  `delivery_address_id` int(11) DEFAULT NULL,
  `billing_address_id` int(11) DEFAULT NULL,
  `promocode` varchar(200) DEFAULT NULL,
  `discounts` float DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `delivery_address_id` (`delivery_address_id`),
  KEY `billing_address_id` (`billing_address_id`),
  KEY `cust_id` (`customer_id`),
  KEY `fk_create_order` (`created_by`),
  KEY `fk_modify_order` (`modified_by`),
  CONSTRAINT `billing_address_id` FOREIGN KEY (`billing_address_id`) REFERENCES `customer_order_address` (`id`),
  CONSTRAINT `cust_id` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `delivery_address_id` FOREIGN KEY (`delivery_address_id`) REFERENCES `customer_order_address` (`id`),
  CONSTRAINT `fk_create_order` FOREIGN KEY (`created_by`) REFERENCES `customers` (`id`),
  CONSTRAINT `fk_modify_order` FOREIGN KEY (`modified_by`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=latin1;

/*Table structure for table `customer_orders11` */

DROP TABLE IF EXISTS `customer_orders11`;

CREATE TABLE `customer_orders11` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `customer_payment_id` float DEFAULT NULL,
  `order_status_code` varchar(200) DEFAULT NULL,
  `date_of_placed_order` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `total_order_price` float DEFAULT NULL,
  `date_of_order_paid` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `coupon_used_details` varchar(100) DEFAULT NULL,
  `delivery_address` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `customer_payment_methods` */

DROP TABLE IF EXISTS `customer_payment_methods`;

CREATE TABLE `customer_payment_methods` (
  `payment_method_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `payment_method_code` varchar(100) DEFAULT NULL,
  `name_on_card` varchar(100) DEFAULT NULL,
  `card_number` int(100) NOT NULL,
  `expiry_month` int(11) DEFAULT NULL,
  `expiry_year` year(4) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`payment_method_id`),
  UNIQUE KEY `customer_id` (`customer_id`,`card_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `customers` */

DROP TABLE IF EXISTS `customers`;

CREATE TABLE `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(150) DEFAULT NULL,
  `last_name` varchar(200) DEFAULT NULL,
  `password` varchar(200) NOT NULL,
  `email` varchar(300) NOT NULL,
  `phone_number` varchar(500) DEFAULT NULL,
  `google_id` varchar(500) DEFAULT NULL,
  `image` longblob,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(50) DEFAULT '2',
  `subscribed` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT '-1',
  `modified_by` int(11) DEFAULT '-1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE Email` (`email`),
  UNIQUE KEY `UNIQUE Phone_Number` (`phone_number`)
) ENGINE=InnoDB AUTO_INCREMENT=339 DEFAULT CHARSET=latin1;

/*Table structure for table `deal_detail` */

DROP TABLE IF EXISTS `deal_detail`;

CREATE TABLE `deal_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deal_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

/*Table structure for table `deals` */

DROP TABLE IF EXISTS `deals`;

CREATE TABLE `deals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `image` varchar(500) NOT NULL DEFAULT '0',
  `status` varchar(50) NOT NULL DEFAULT '1',
  `show_homepage` varchar(100) NOT NULL DEFAULT '0',
  `product_ids` text NOT NULL,
  `start_date` varchar(100) DEFAULT NULL,
  `end_date` varchar(100) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT '-1',
  `modified_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` int(11) DEFAULT '-1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Table structure for table `fashion_products` */

DROP TABLE IF EXISTS `fashion_products`;

CREATE TABLE `fashion_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fashion_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT '-1',
  `modified_by` int(11) DEFAULT '-1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unic` (`fashion_id`,`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=latin1;

/*Table structure for table `fashion_trends` */

DROP TABLE IF EXISTS `fashion_trends`;

CREATE TABLE `fashion_trends` (
  `fashion_id` int(50) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) DEFAULT NULL,
  `keywords` text,
  `image` varchar(500) DEFAULT NULL,
  `instragramid` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT '-1',
  `modified_by` int(11) DEFAULT '-1',
  PRIMARY KEY (`fashion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

/*Table structure for table `lookup` */

DROP TABLE IF EXISTS `lookup`;

CREATE TABLE `lookup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `type` varchar(500) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

/*Table structure for table `notifications` */

DROP TABLE IF EXISTS `notifications`;

CREATE TABLE `notifications` (
  `notification_id` int(11) NOT NULL AUTO_INCREMENT,
  `notification_name` varchar(100) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `notification_schedule` datetime DEFAULT CURRENT_TIMESTAMP,
  `message` text,
  `notification_state` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT '-1',
  `modified_by` int(11) DEFAULT '-1',
  PRIMARY KEY (`notification_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

/*Table structure for table `order_details` */

DROP TABLE IF EXISTS `order_details`;

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(500) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_description` varchar(1000) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `payment_status` varchar(50) DEFAULT NULL,
  `order_Date_Time` datetime DEFAULT CURRENT_TIMESTAMP,
  `expected_date_of_delivery` date DEFAULT NULL,
  `delivery_status_code` varchar(50) DEFAULT NULL,
  `delivery_address` varchar(300) DEFAULT NULL,
  `vendorId` varchar(100) DEFAULT NULL,
  `vendor_product_id` varchar(100) DEFAULT NULL,
  `quantity` int(100) DEFAULT NULL,
  `mode_of_payment` varchar(20) DEFAULT NULL,
  `transaction_id` varchar(200) DEFAULT NULL,
  `authorization_id` varchar(200) DEFAULT NULL,
  `discounts` decimal(20,2) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `order_status` varchar(500) DEFAULT NULL,
  `payment_gateway` varchar(50) DEFAULT NULL,
  `order_number` varchar(500) NOT NULL,
  `tax` float DEFAULT NULL,
  `shipping` float DEFAULT NULL,
  `promocode` varchar(20) DEFAULT NULL,
  `sub_total` float DEFAULT NULL,
  `grand_total` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;

/*Table structure for table `order_tracking` */

DROP TABLE IF EXISTS `order_tracking`;

CREATE TABLE `order_tracking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) DEFAULT NULL,
  `courier_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `tracking_number` int(11) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `expected_date_of_delivery` datetime DEFAULT NULL,
  `plan_id` int(11) DEFAULT NULL,
  `actual_date_of_delivery` datetime DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id1` (`order_id`),
  KEY `vendor` (`vendor_id`),
  KEY `courier` (`courier_id`),
  CONSTRAINT `courier` FOREIGN KEY (`courier_id`) REFERENCES `couriers` (`id`),
  CONSTRAINT `order_id1` FOREIGN KEY (`order_id`) REFERENCES `customer_orders` (`order_id`),
  CONSTRAINT `vendor` FOREIGN KEY (`vendor_id`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=latin1;

/*Table structure for table `pincodes` */

DROP TABLE IF EXISTS `pincodes`;

CREATE TABLE `pincodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pincode` int(255) NOT NULL,
  `city` varchar(250) NOT NULL,
  `state` varchar(250) NOT NULL,
  `country` varchar(250) NOT NULL,
  `zone` varchar(250) NOT NULL,
  `is_metro` tinyint(1) NOT NULL,
  `is_RoI_A` tinyint(1) DEFAULT NULL,
  `is_RoI_B` tinyint(1) DEFAULT NULL,
  `is_special_destination` tinyint(1) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

/*Table structure for table `product_attributes` */

DROP TABLE IF EXISTS `product_attributes`;

CREATE TABLE `product_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `att_group_id` int(11) NOT NULL,
  `att_group_val_id` bigint(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `stock` varchar(200) DEFAULT NULL,
  `price_change` int(11) DEFAULT NULL,
  `status` varchar(200) NOT NULL,
  `product_url` varchar(500) DEFAULT NULL,
  `original_product_id` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `combine_key` (`att_group_id`,`att_group_val_id`,`original_product_id`),
  KEY `fk_att_val_id` (`att_group_val_id`),
  CONSTRAINT `fk_att_grp_id` FOREIGN KEY (`att_group_id`) REFERENCES `attributes` (`id`),
  CONSTRAINT `fk_att_val_id` FOREIGN KEY (`att_group_val_id`) REFERENCES `attributes_value` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3533 DEFAULT CHARSET=latin1;

/*Table structure for table `product_brand` */

DROP TABLE IF EXISTS `product_brand`;

CREATE TABLE `product_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

/*Table structure for table `product_image` */

DROP TABLE IF EXISTS `product_image`;

CREATE TABLE `product_image` (
  `id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL,
  `image` varchar(400) CHARACTER SET utf8 DEFAULT NULL,
  `size` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `product_offers` */

DROP TABLE IF EXISTS `product_offers`;

CREATE TABLE `product_offers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `offer_name` varchar(200) NOT NULL,
  `product_id` int(11) NOT NULL,
  `vendor_id` varchar(50) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Table structure for table `product_option_group` */

DROP TABLE IF EXISTS `product_option_group`;

CREATE TABLE `product_option_group` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `option_name` varchar(255) NOT NULL,
  `status` int(2) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` int(11) DEFAULT NULL,
  `created_by` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

/*Table structure for table `product_option_value` */

DROP TABLE IF EXISTS `product_option_value`;

CREATE TABLE `product_option_value` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `value` text NOT NULL,
  `group_id` int(4) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(4) DEFAULT NULL,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

/*Table structure for table `product_options` */

DROP TABLE IF EXISTS `product_options`;

CREATE TABLE `product_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `opt_group_val_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(500) CHARACTER SET utf8mb4 NOT NULL,
  `description` text CHARACTER SET utf8mb4 NOT NULL,
  `regular_price` float NOT NULL,
  `sale_price` float NOT NULL,
  `category_id` int(50) NOT NULL,
  `stock` varchar(50) NOT NULL,
  `image` varchar(500) DEFAULT NULL,
  `product_url` text NOT NULL,
  `vendor_product_id` varchar(500) NOT NULL,
  `similar_product_id` varchar(800) DEFAULT NULL,
  `recommended_product_id` varchar(500) DEFAULT NULL,
  `do_not_display` varchar(200) NOT NULL DEFAULT '0',
  `parent_id` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(200) NOT NULL,
  `vendor_id` varchar(45) NOT NULL,
  `keyword` varchar(4000) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `brand` (`brand_id`),
  CONSTRAINT `brand` FOREIGN KEY (`brand_id`) REFERENCES `product_brand` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `products_family` */

DROP TABLE IF EXISTS `products_family`;

CREATE TABLE `products_family` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` varchar(50) DEFAULT NULL,
  `product_family_id` int(11) DEFAULT NULL,
  `group_id` int(50) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vendor_product_id` (`product_family_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Table structure for table `promocodes` */

DROP TABLE IF EXISTS `promocodes`;

CREATE TABLE `promocodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `promocode` varchar(500) NOT NULL,
  `start_time` varchar(100) NOT NULL,
  `end_time` varchar(100) NOT NULL,
  `status` int(11) NOT NULL,
  `promo_value` float NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `promo_value_type` varchar(100) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Table structure for table `refund` */

DROP TABLE IF EXISTS `refund`;

CREATE TABLE `refund` (
  `refund_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `order_number` varchar(100) DEFAULT NULL,
  `refund_grant_total` float DEFAULT NULL,
  `date_of_order_cancelled` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `refund_status` varchar(50) DEFAULT NULL,
  `refund_type` varchar(50) DEFAULT NULL,
  `refund_account_number` varchar(50) DEFAULT NULL,
  `date_of_refund` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `product_id` varchar(50) DEFAULT NULL,
  `order_cancel_reason` varchar(50) DEFAULT 'cancel',
  `discounts` decimal(10,2) DEFAULT '0.00',
  `shipping` float DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`refund_id`,`date_of_refund`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=latin1;

/*Table structure for table `return_table` */

DROP TABLE IF EXISTS `return_table`;

CREATE TABLE `return_table` (
  `return_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` varchar(50) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `refund_id` int(11) DEFAULT NULL,
  `return_status` varchar(50) DEFAULT NULL,
  `date_of_return_request` datetime DEFAULT CURRENT_TIMESTAMP,
  `return_option` varchar(50) DEFAULT NULL,
  `order_return_reason` varchar(100) DEFAULT NULL,
  `pickup_date` datetime DEFAULT NULL,
  `return_condition` varchar(100) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`return_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Table structure for table `shipping_categories` */

DROP TABLE IF EXISTS `shipping_categories`;

CREATE TABLE `shipping_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courier_id` int(11) NOT NULL,
  `category_name` varchar(250) NOT NULL,
  `weight` varchar(250) NOT NULL,
  `intra_city` float DEFAULT NULL,
  `intra_zone` float DEFAULT NULL,
  `metro_to_metro` float DEFAULT NULL,
  `roi_A` float DEFAULT NULL,
  `roi_B` float DEFAULT NULL,
  `special_destination` float DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_courier_id` (`courier_id`),
  CONSTRAINT `fk_courier_id` FOREIGN KEY (`courier_id`) REFERENCES `couriers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Table structure for table `similar_products` */

DROP TABLE IF EXISTS `similar_products`;

CREATE TABLE `similar_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `similar_product_id` int(11) NOT NULL,
  `confidence_score` float NOT NULL,
  `product_vendor_id` int(11) NOT NULL,
  `similar_product_vendor_id` int(11) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT '-1',
  `modified_by` int(11) DEFAULT '-1',
  PRIMARY KEY (`id`),
  KEY `fk_similar_pid` (`product_id`),
  KEY `fk_similar_pid_respective` (`similar_product_id`),
  KEY `fk_main_vendor_id` (`product_vendor_id`),
  KEY `fk_similar_vendor_id` (`similar_product_vendor_id`),
  CONSTRAINT `fk_main_vendor_id` FOREIGN KEY (`product_vendor_id`) REFERENCES `admin` (`id`),
  CONSTRAINT `fk_similar_pid` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `fk_similar_pid_respective` FOREIGN KEY (`similar_product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `fk_similar_vendor_id` FOREIGN KEY (`similar_product_vendor_id`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

/*Table structure for table `similar_products_sample` */

DROP TABLE IF EXISTS `similar_products_sample`;

CREATE TABLE `similar_products_sample` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `similar_product_id` int(11) NOT NULL,
  `confidence_score` float NOT NULL,
  `product_vendor_id` int(11) NOT NULL,
  `similar_product_vendor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sample_fk1` (`product_id`),
  KEY `sample_fk2` (`similar_product_id`),
  KEY `sample_fk3` (`product_vendor_id`),
  KEY `sample_fk4` (`similar_product_vendor_id`),
  CONSTRAINT `sample_fk1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `sample_fk2` FOREIGN KEY (`similar_product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `sample_fk3` FOREIGN KEY (`product_vendor_id`) REFERENCES `admin` (`id`),
  CONSTRAINT `sample_fk4` FOREIGN KEY (`similar_product_vendor_id`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30477 DEFAULT CHARSET=latin1;

/*Table structure for table `top_picks` */

DROP TABLE IF EXISTS `top_picks`;

CREATE TABLE `top_picks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

/*Table structure for table `vendor_address` */

DROP TABLE IF EXISTS `vendor_address`;

CREATE TABLE `vendor_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) NOT NULL,
  `type_billing_shipping` varchar(250) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `address1` varchar(250) DEFAULT NULL,
  `address2` varchar(250) DEFAULT NULL,
  `address3` varchar(250) DEFAULT NULL,
  `city` varchar(250) DEFAULT NULL,
  `state` varchar(250) DEFAULT NULL,
  `country` varchar(250) DEFAULT NULL,
  `pincode` int(11) DEFAULT NULL,
  `phone_number` varchar(250) DEFAULT NULL,
  `isPrimary` tinyint(1) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vendor_id` (`vendor_id`),
  CONSTRAINT `vendor_id` FOREIGN KEY (`vendor_id`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Table structure for table `wish_list` */

DROP TABLE IF EXISTS `wish_list`;

CREATE TABLE `wish_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(100) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_wish` (`product_id`),
  KEY `fk_create_wish1` (`created_by`),
  KEY `fk_customer_id1` (`customer_id`),
  KEY `fk_modify_wish1` (`modified_by`),
  CONSTRAINT `fk_create_wish1` FOREIGN KEY (`created_by`) REFERENCES `customers` (`id`),
  CONSTRAINT `fk_customer_id1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `fk_modify_wish1` FOREIGN KEY (`modified_by`) REFERENCES `customers` (`id`),
  CONSTRAINT `fk_product_id1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=306 DEFAULT CHARSET=latin1;

/* Procedure structure for procedure `abc` */

/*!50003 DROP PROCEDURE IF EXISTS  `abc` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `abc`()
BEGIN
#select * from products limit 1;
insert into Student (name) values("ajay");
	END */$$
DELIMITER ;

/* Procedure structure for procedure `abctest` */

/*!50003 DROP PROCEDURE IF EXISTS  `abctest` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `abctest`(in spid int(11),IN proid INT(11),IN similarid INT(11),IN confidence_score float(10),IN pro_vendor_id INT(11),IN similar_vendor_id INT(11),IN stype INT(11),OUT insProductID varchar(256))
BEGIN
 
if spid=0 then  
 
IF NOT EXISTS(select id from products where id=proid) THEN
       SET insProductID = 'product_id not valid';
 
        
elseIF NOT EXISTS (SELECT id FROM products WHERE id=similarid) THEN
            SET insProductID = 'similar product id not valid';
     
  
 elseIF NOT EXISTS (SELECT id FROM products WHERE vendor_id=pro_vendor_id and id=proid) THEN
            SET insProductID = 'product vendor_id not valid';
  
 elseIF NOT EXISTS (SELECT id FROM products WHERE vendor_id=similar_vendor_id and id=similarid) THEN
            SET insProductID = 'similar product vendor id not valid';
          
  ELSEIF EXISTS (SELECT id FROM similar_products WHERE product_id=proid and similar_product_id=similarid and type=stype) THEN
            SET insProductID = 'product_id and similar_product_is of same type presant so not insert into table'; 
 
 
           
   
  else 
  SET insProductID = 'final';
  end if;
  
        if  insProductID = 'final' then
        
		INSERT INTO similar_products  (product_id,similar_product_id,confidence_score,product_vendor_id,similar_product_vendor_id,type) VALUES(proid,similarid,confidence_score,pro_vendor_id,similar_vendor_id,stype);
         SET insProductID = 'product insert successful';
        end if;

else

   
  
   IF NOT EXISTS(SELECT id FROM products WHERE id=proid) THEN
       SET insProductID = 'product_id not valid';
       
   ELSEIF NOT EXISTS (SELECT id FROM similar_products WHERE id=spid AND product_id=proid AND TYPE=stype) THEN
            SET insProductID = 'id not valid for update';  
 
        
    ELSEIF NOT EXISTS (SELECT id FROM products WHERE id=similarid) THEN
            SET insProductID = 'similar product id not valid';
     
  
     ELSEIF NOT EXISTS (SELECT id FROM products WHERE vendor_id=pro_vendor_id AND id=proid) THEN
            SET insProductID = 'product vendor_id not valid';
  
     ELSEIF NOT EXISTS (SELECT id FROM products WHERE vendor_id=similar_vendor_id AND id=similarid) THEN
            SET insProductID = 'similar product vendor id not valid';
      
     ELSE 
       SET insProductID = 'final';
  END IF;
  
        IF  insProductID = 'final' THEN
     
	update  similar_products set  product_id=proid,similar_product_id=similarid,confidence_score=confidence_score,product_vendor_id=pro_vendor_id,similar_product_vendor_id=similar_vendor_id,type=stype,modified_date=NOW() where id=spid and product_id=proid and type=stype;
         
         SET insProductID = 'product update successful';
         
        END IF;

end if;
	
END */$$
DELIMITER ;

/* Procedure structure for procedure `customer_notification` */

/*!50003 DROP PROCEDURE IF EXISTS  `customer_notification` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `customer_notification`(IN cust_Noti_id INT(11),IN Noti_id VARCHAR(200),IN Cust_id INT(11),IN Not_schedule DATETIME, OUT insProductID VARCHAR(100))
BEGIN
	
	DECLARE iSstatus VARCHAR(100) DEFAULT 0;
	DECLARE cust_name VARCHAR(100);
	DECLARE cust_mobile VARCHAR(100);
	
IF cust_Noti_id=0 THEN  
	
	IF NOT EXISTS(SELECT id FROM customers WHERE id=Cust_id ) THEN 	
		SET  insProductID ='customer not valid';
	 
	 ELSEIF NOT EXISTS(SELECT id FROM customers WHERE id=Cust_id AND STATUS=1) THEN
		SET  insProductID ='customer not conform in if';
	 
	 ELSEIF NOT EXISTS(SELECT id FROM customers WHERE id=Cust_id AND subscribed=1) THEN
		SET  insProductID ='customer not susbriction for notification in if';
		
	  elseIF NOT EXISTS(SELECT notification_id FROM notifications WHERE notification_id=Noti_id) THEN 	 		
		SET  insProductID ='notification_id not valid';
	
	 ELSE
	
		 
	 SELECT phone_number INTO @cust_mobile FROM customers WHERE id=Cust_id ;
	 		  
	 INSERT IGNORE INTO customer_notifications (notification_id,customer_id,mobile_number,cust_noti_schedule,status)VALUES(Noti_id,Cust_id,@cust_mobile,Not_schedule,1);
	 SET insProductID='insert notification sucessful';

	END IF;
	
	
ELSE
	
	
	 IF NOT EXISTS(SELECT notification_id FROM notifications WHERE notification_id=Noti_id) THEN 	 		
	 SET  insProductID ='notification_id not valid';
	 
	 ELSEIF NOT EXISTS(SELECT id FROM customer_notifications WHERE id= cust_Noti_id) THEN 	 
	 SET  insProductID ='customer notification id not valid';
	 
	
	
	 ELSEIF NOT EXISTS(SELECT id FROM customers WHERE id=Cust_id ) THEN 	 
	 SET  insProductID ='customer not valid';
	 
	 ELSEIF NOT EXISTS(SELECT id FROM customers WHERE id=Cust_id AND STATUS=1) THEN 
	 SET  insProductID ='customer not conform in else';
	 
	 ELSEIF NOT EXISTS(SELECT id FROM customers WHERE id=Cust_id AND subscribed=1) THEN 
	 SET  insProductID ='customer not susbriction for notification';
	
	
	ELSE
		 
	 SELECT phone_number INTO @cust_mobile FROM customers WHERE id=Cust_id ;	   
	 UPDATE customer_notifications SET notification_id=Noti_id,customer_id=Cust_id,mobile_number=@cust_mobile,cust_noti_schedule=Not_schedule,modified_date=NOW() WHERE notification_id=Noti_id;
	 SET insProductID='update notification sucessful';

	END IF;
		
END IF;
	
	

	END */$$
DELIMITER ;

/* Procedure structure for procedure `fashion` */

/*!50003 DROP PROCEDURE IF EXISTS  `fashion` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `fashion`(IN fid INT(11),IN pname varchar(256),IN keywords varchar(256),IN pimage varchar(256),IN instragramid varchar(256),IN fstatus int(11),OUT insProductID1 VARCHAR(256))
BEGIN
 
 DECLARE fashionID INT DEFAULT 0; 
 
 
 
IF fid=0 THEN  
 
	
  
		INSERT INTO fashion_trends (name,keywords,image,instragramid,status) VALUES(pNAME,keywords,pimage,instragramid,fstatus);
		select fashion_id into @fashionID from fashion_trends  order by fashion_id desc limit 1;
		SET insProductID1 = concat('fashion_id insert successful ~ ',@fashionID);
      

ELSE
        
	 
         UPDATE fashion_trends SET NAME=pNAME,keywords=keywords,image=pimage,instragramid=instragramid,status=fstatus,modified_date=now() WHERE fashion_id=fid;
         
         SET insProductID1 = 'fashion_id update successful';

END IF;
	
END */$$
DELIMITER ;

/* Procedure structure for procedure `notification` */

/*!50003 DROP PROCEDURE IF EXISTS  `notification` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `notification`(IN Noti_id INT(11),IN Not_name VARCHAR(200),IN Not_type INT(11),in Not_schedule datetime,IN Message VARCHAR(500),IN Not_state VARCHAR(255), OUT insProductID varchar(100))
BEGIN
	
	
IF Noti_id=0 THEN  
	
	
			  
	 INSERT INTO notifications (notification_name,TYPE,notification_schedule,message,notification_state)VALUE(Not_name,Not_type,Not_schedule,Message,Not_state);
	 set insProductID='insert notification sucessful';

	
	
	
else
	
	
	 IF NOT EXISTS(SELECT notification_id FROM notifications WHERE notification_id=Noti_id) THEN 	 		
	 SET  insProductID ='notification_id not valid';
	
	
	
	
	ELSE
		 
		   
	 update notifications set notification_name=Not_name,TYPE=Not_type,notification_schedule=Not_schedule,message=Message,notification_state=Not_state,modified_date=NOW() where notification_id=Noti_id;
	 SET insProductID='update notification sucessful';

	END IF;
		
END IF;
	
	

	END */$$
DELIMITER ;

/* Procedure structure for procedure `productInsUpdate` */

/*!50003 DROP PROCEDURE IF EXISTS  `productInsUpdate` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `productInsUpdate`(IN catName VARCHAR(256),IN subCatName VARCHAR(200),IN child_cat VARCHAR(200),IN prodName VARCHAR(500),IN productBrand VARCHAR(255),IN description TEXT,IN regularPrice FLOAT, IN salePrice FLOAT, IN stock_i VARCHAR(50), IN image VARCHAR(500),IN prodUrl VARCHAR(300),IN productID VARCHAR(500),IN vendorID VARCHAR(50),IN parentId VARCHAR(50),IN similarProductId VARCHAR(500), OUT insProductID INT)
BEGIN

DECLARE iCatID INT DEFAULT 0;
DECLARE iParentID INT DEFAULT 0;
DECLARE iSubCat VARCHAR(200);
DECLARE iPID INT DEFAULT 0;
DECLARE POSITION INT DEFAULT 0 ;
DECLARE variant_product_id VARCHAR(200);
DECLARE iVariant INT;
DECLARE iVariantID INT;
DECLARE iStockTrue INT;
DECLARE iDisplay INT;
DECLARE iBrandID INT;

SET @iDisplay = 0;

SELECT id INTO @iParentID FROM categories WHERE LOWER(NAME) = LOWER(catName);

IF NOT EXISTS (SELECT id FROM categories WHERE LOWER(NAME) = LOWER(catName)) THEN
INSERT INTO categories(NAME,parent_id,image,STATUS) VALUES (catName,0,image,1);
SELECT id INTO @iParentID FROM categories WHERE id= LAST_INSERT_ID();
END IF;

SELECT sub_category INTO @iSubCat FROM cat_mapping WHERE LOWER(category) = LOWER(catName) AND LOWER(child) = LOWER(child_cat) AND vendor_id = vendorID;
SELECT id INTO @iCatID FROM categories WHERE LOWER(NAME) = LOWER(@iSubCat) AND parent_id = @iParentID;

IF (stock_i = 'false')  THEN
SET @iDisplay = 1;
END IF;

IF NOT EXISTS (SELECT id FROM categories WHERE LOWER(NAME) = LOWER(@iSubCat) AND parent_id = @iParentID) THEN
INSERT INTO categories(NAME,parent_id,image,STATUS) VALUES (@iSubCat,@iParentID,image,1);
SELECT id INTO @iCatID FROM categories WHERE id= LAST_INSERT_ID();
END IF;        

SELECT id INTO @iCatID FROM categories WHERE LOWER(NAME) = LOWER(@iSubCat) AND parent_id = @iParentID;

IF NOT EXISTS (SELECT id FROM product_brand WHERE LOWER(NAME) = LOWER(productBrand)) THEN
insert into product_brand(name,created_by,modified_by) values (productBrand,-1,-1);
SELECT id INTO @iBrandID FROM product_brand WHERE id= LAST_INSERT_ID();
END IF; 

SELECT id INTO @iBrandID FROM product_brand WHERE LOWER(NAME) = LOWER(productBrand);

INSERT INTO products(NAME,description,brand_id,regular_price,sale_price,category_id,stock,image,product_url,vendor_product_id,vendor_id,do_not_display,parent_id,similar_product_id,STATUS) VALUES (prodName,description,@iBrandID,regularPrice,salePrice,@iCatID,stock_i,image,prodUrl,productID,vendorID,@iDisplay,0,similarProductId,1) ON DUPLICATE KEY UPDATE NAME = prodName, description = description, brand_id = @iBrandID, regular_price = regularPrice, sale_price = salePrice, category_id = @iCatID, stock = stock_i, image = image, product_url = prodUrl, vendor_product_id = productID, vendor_id = vendorID, do_not_display = @iDisplay, parent_id = 0, similar_product_id = similarProductId, STATUS = 1;


END */$$
DELIMITER ;

/* Procedure structure for procedure `product_attr` */

/*!50003 DROP PROCEDURE IF EXISTS  `product_attr` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `product_attr`(IN att_grp_id INT(11),IN att_val_id BIGINT(255),IN productID VARCHAR(50),IN active_ID VARCHAR(50),IN vendorID VARCHAR(50),IN prodURL VARCHAR(500),IN stock_i VARCHAR(50),IN price INT(11))
BEGIN

	DECLARE iGAttrID INT DEFAULT 0;
	DECLARE iAttrValID INT DEFAULT 0;
	DECLARE pId INT DEFAULT 0;
	DECLARE activeId INT DEFAULT 0;
	
	#select id into @iGAttrID from attributes where att_key_hbase = att_grp_id and status = '1';
	#SELECT id INTO @iAttrValID FROM attributes_value WHERE att_value_hbase_key = att_val_id AND STATUS = '1';
	#SELECT id INTO @activeId FROM products WHERE vendor_product_id = active_ID AND vendor_id = vendorID;
	#SELECT id INTO @pId FROM products WHERE vendor_product_id = productID and vendor_id = vendorID;
	
	IF active_ID = productID THEN
		SELECT id INTO @activeId FROM products WHERE vendor_product_id = active_ID AND vendor_id = vendorID;
		INSERT INTO product_attributes (att_group_id,att_group_val_id,product_id,stock,price_change,STATUS,product_url,original_product_id) VALUES (att_grp_id,att_val_id,@activeId,stock_i,price,'1',prodURL,@activeId) ON DUPLICATE KEY UPDATE att_group_id = att_grp_id, att_group_val_id = att_val_id, product_id = @activeId, stock = stock, price_change = price, STATUS = '1', product_url = prodURL, original_product_id = @activeId;
	ELSE
		SELECT id INTO @activeId FROM products WHERE vendor_product_id = active_ID AND vendor_id = vendorID;
		SELECT id INTO @pId FROM products WHERE vendor_product_id = productID AND vendor_id = vendorID;
		INSERT INTO product_attributes (att_group_id,att_group_val_id,product_id,stock,price_change,STATUS,product_url,original_product_id) VALUES (att_grp_id,att_val_id,@activeId,stock_i,price,'1',prodURL,@pId) ON DUPLICATE KEY UPDATE att_group_id = att_grp_id, att_group_val_id = att_val_id, product_id = @activeId, stock = stock, price_change = price, STATUS = '1', product_url = prodURL, original_product_id = @pId;
	END IF;	

END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
