 create database bd;

 use bd;
CREATE TABLE `cart` (
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `favorite` (
  `favorite_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `history` (
  `history_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `ordering` (
  `ordering_id` int(11) NOT NULL,
  `order_number` int(11) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `status` text,
  `name_on_card` text,
  `card_number` text,
  `expiration_date` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE `poster` (
  `poster_id` int(11) NOT NULL,
  `image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `poster` (`poster_id`, `image`) VALUES
(4, 'storage_poster\\poster10.jpg'),
(5, 'storage_poster\\poster20.jpg'),
(6, 'storage_poster\\poster30.jpg');

DELETE FROM poster WHERE poster_id = 4;
DELETE FROM poster WHERE poster_id = 5;
DELETE FROM poster WHERE poster_id = 6;

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `product_name` text,
  `price` double(11,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `supplier` text NOT NULL,
  `image` text NOT NULL,
  `category` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `review` (
  `review_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL ,
  `product_id` int(11) DEFAULT NULL,
  `feedback` varchar(150) DEFAULT NULL,
  `rate` float(11,1) DEFAULT NULL,
  `review_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;








CREATE TABLE `shipping` (
  `shipping_id` int(11) NOT NULL,
  `address` text,
  `city` text,
  `country` text,
  `zip` text,
  `phone` text,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `gender` text NOT NULL,
  `age` int(11) NOT NULL,
  `image` text NOT NULL,
  `isAdmin` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




ALTER TABLE `cart`
  ADD PRIMARY KEY (`user_id`,`product_id`),
  ADD UNIQUE KEY `cart_constraint` (`user_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

ALTER TABLE `favorite`
  ADD PRIMARY KEY (`favorite_id`),
  ADD UNIQUE KEY `fav_constraint` (`user_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

ALTER TABLE `history`
  ADD PRIMARY KEY (`history_id`),
  ADD UNIQUE KEY `history_constraint` (`user_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

ALTER TABLE `ordering`
  ADD PRIMARY KEY (`ordering_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

ALTER TABLE `poster`
  ADD PRIMARY KEY (`poster_id`);


ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `review`
  ADD PRIMARY KEY (`review_id`),
  ADD UNIQUE KEY `review_constraint` (`user_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);
  
  

ALTER TABLE `shipping`
  ADD PRIMARY KEY (`shipping_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `favorite`
  MODIFY `favorite_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

ALTER TABLE `history`
  MODIFY `history_id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `ordering`
  MODIFY `ordering_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

ALTER TABLE `poster`
  MODIFY `poster_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

ALTER TABLE `review`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

ALTER TABLE `shipping`
  MODIFY `shipping_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;


ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

 ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `favorite`
   ADD CONSTRAINT `favorite_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `favorite_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `history`
   ADD CONSTRAINT `history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
   ADD CONSTRAINT `history_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

 ALTER TABLE `ordering`
 ADD CONSTRAINT `ordering_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
 ADD CONSTRAINT `ordering_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;


 ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
   ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

 ALTER TABLE `shipping`
  ADD CONSTRAINT `shipping_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `shipping_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
use bd;
INSERT INTO `product` (`id`, `product_name`, `price`, `quantity`, `supplier`, `image`, `category`) VALUES

(23, 'ALICE', 700, 700, 'shop.by', 'storage_product\\metalCutting.jpg', 'metalCutting'),
(24, 'ASTERIA', 1060.90, 676, 'shop.by', 'storage_product\\metalCutting10.jpg', 'metalCutting'),
(26, 'ESTELLA', 805, 676, 'shop.by', 'storage_product\\metalCutting11.jpg', 'metalCutting');
INSERT INTO `product` (`id`, `product_name`, `price`, `quantity`, `supplier`, `image`, `category`) VALUES
(35, 'VETTA', 700.00, 300, 'shop.by', 'storage_product\\woodworking20.jpg', 'woodworking'),
(36, 'VILDANA', 1099, 250, 'shop.by', 'storage_product\\woodworking30.jpg', 'woodworking'),
(37, 'VIKE', 800, 100, 'shop.by', 'storage_product\\woodworking40.jpg', 'woodworkingposter');
INSERT INTO `product` (`id`, `product_name`, `price`, `quantity`, `supplier`, `image`, `category`) VALUES

(19, 'VETTA ', 700, 300, 'shop.by', 'storage_product\\measuring4.jpg', 'measuring'),
(20, 'VILDANA', 1000, 300, 'shop.by', 'storage_product\\measuring5.jpg', 'measuring'),
(21, 'VIKE', 800, 300, 'shop.by', 'storage_product\\measuring6.jpg', 'measuring'),
(22, 'VANESSA', 750, 700, 'shop.by ', 'storage_product\\measuring7.jpg', 'measuring');

DELETE FROM product WHERE id = 23;
DELETE FROM product WHERE id = 24;
DELETE FROM product WHERE id = 21;
DELETE FROM product WHERE id = 22;

-- drop table product;
 -- use bd;
-- drop database bd;


