CREATE DATABASE wired_rooms_v1 COLLATE utf8_general_ci;

USE wired_rooms_v1;
SET FOREIGN_KEY_CHECKS = 0;

CREATE TABLE `users`
(
 `id`         bigint NOT NULL ,
 `email`      varchar(255) NOT NULL ,
 `name`       varchar(100) NOT NULL ,
 `avatar_url` varchar(255) NOT NULL ,
 `password`   varchar(60) NOT NULL ,
 `bio`        longtext NOT NULL ,
 `created_at` timestamp NOT NULL ,
 `updated_at` datetime NULL ,
 `deleted_at` datetime NULL ,

PRIMARY KEY (`id`)
);

CREATE TABLE `products`
(
 `id`          bigint NOT NULL ,
 `name`        varchar(100) NOT NULL ,
 `bio`         longtext NULL ,
 `price`       float NOT NULL ,
 `created_at`  timestamp NOT NULL ,
 `updated_at`  datetime NULL ,
 `image_path`  varchar(255) NOT NULL ,
 `stock`       int NOT NULL ,
 `featured`    tinyint NOT NULL ,
 `user_id`     bigint NOT NULL ,
 `category_id` bigint NOT NULL ,

PRIMARY KEY (`id`),
KEY `fkIdx_102` (`category_id`),
CONSTRAINT `FK_101` FOREIGN KEY `fkIdx_102` (`category_id`) REFERENCES `category` (`id`),
KEY `fkIdx_99` (`user_id`),
CONSTRAINT `FK_98` FOREIGN KEY `fkIdx_99` (`user_id`) REFERENCES `users` (`id`)
);


CREATE TABLE `category`
(
 `id`         bigint NOT NULL ,
 `name`       varchar(100) NOT NULL ,
 `weight`     int NOT NULL ,
 `created_at` timestamp NOT NULL ,
 `updated_at` datetime NULL ,

PRIMARY KEY (`id`)
);

CREATE TABLE `orders`
(
 `id`           bigint NOT NULL ,
 `state`        char(20) NOT NULL ,
 `created_at`   timestamp NOT NULL ,
 `products`     json NOT NULL ,
 `total_amount` float NOT NULL ,
 `user_id`      bigint NOT NULL ,

PRIMARY KEY (`id`),
KEY `fkIdx_106` (`user_id`),
CONSTRAINT `FK_105` FOREIGN KEY `fkIdx_106` (`user_id`) REFERENCES `users` (`id`)
);


CREATE TABLE `ratings`
(
 `id`         bigint NOT NULL ,
 `value`      tinyint NOT NULL ,
 `created_at` timestamp NOT NULL ,
 `rated_by`   bigint NOT NULL ,
 `product_id` bigint NOT NULL ,

PRIMARY KEY (`id`),
KEY `fkIdx_116` (`rated_by`),
CONSTRAINT `FK_115` FOREIGN KEY `fkIdx_116` (`rated_by`) REFERENCES `users` (`id`),
KEY `fkIdx_119` (`product_id`),
CONSTRAINT `FK_118` FOREIGN KEY `fkIdx_119` (`product_id`) REFERENCES `products` (`id`)
);

SET FOREIGN_KEY_CHECKS = 1;