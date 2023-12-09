/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP TABLE IF EXISTS `food_types`;
CREATE TABLE `food_types` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `foods`;
CREATE TABLE `foods` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  PRIMARY KEY (`food_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `foods_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `food_types` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `like_res`;
CREATE TABLE `like_res` (
  `like_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `date_like` date DEFAULT NULL,
  PRIMARY KEY (`like_id`),
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `like_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `like_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurants` (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `user_id` int DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `arr_sub_id` varchar(255) DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `foods` (`food_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `rate_res`;
CREATE TABLE `rate_res` (
  `rate_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `date_rate` date DEFAULT NULL,
  PRIMARY KEY (`rate_id`),
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `rate_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `rate_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurants` (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `restaurants`;
CREATE TABLE `restaurants` (
  `res_id` int NOT NULL AUTO_INCREMENT,
  `res_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `sub_foods`;
CREATE TABLE `sub_foods` (
  `sub_id` int NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(255) DEFAULT NULL,
  `sub_price` float DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  PRIMARY KEY (`sub_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `sub_foods_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `foods` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `food_types` (`type_id`, `type_name`) VALUES
(1, 'A');
INSERT INTO `food_types` (`type_id`, `type_name`) VALUES
(2, 'B');
INSERT INTO `food_types` (`type_id`, `type_name`) VALUES
(3, 'C');
INSERT INTO `food_types` (`type_id`, `type_name`) VALUES
(4, 'D'),
(5, 'E');

INSERT INTO `foods` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(1, 'Bánh mì kẹp thịt', 'banh_mi.jpg', 4.99, 'Bánh mì kẹp thịt ngon', 1);
INSERT INTO `foods` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(2, 'Cơm gà', 'com_ga.jpg', 6.99, 'Cơm gà hấp dẫn', 2);
INSERT INTO `foods` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(3, 'Bún riêu cua', 'bun_rieu.jpg', 5.99, 'Bún riêu cua tươi ngon', 3);
INSERT INTO `foods` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(4, 'Hủ tiếu Nam Vang', 'hu_tieu.jpg', 7.49, 'Hủ tiếu Nam Vang ngon khó cưỡng', 4),
(5, 'Súp hấp', 'sup_hap.jpg', 3.99, 'Súp hấp thơm ngon', 5);

INSERT INTO `like_res` (`like_id`, `user_id`, `res_id`, `date_like`) VALUES
(1, 1, 1, '2023-01-01');
INSERT INTO `like_res` (`like_id`, `user_id`, `res_id`, `date_like`) VALUES
(2, 2, 2, '2023-01-02');
INSERT INTO `like_res` (`like_id`, `user_id`, `res_id`, `date_like`) VALUES
(3, 3, 1, '2023-01-03');
INSERT INTO `like_res` (`like_id`, `user_id`, `res_id`, `date_like`) VALUES
(4, 4, 1, '2023-01-05'),
(5, 5, 2, '2023-01-01'),
(6, 6, 1, '2023-01-01'),
(7, 7, 2, '2023-01-02'),
(8, 1, 3, '2023-01-09'),
(9, 6, 2, '2023-01-09'),
(10, 3, 2, '2023-01-09');

INSERT INTO `orders` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(1, 1, 2, 'ORDER001', '1');
INSERT INTO `orders` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(2, 1, 2, 'ORDER002', '1');


INSERT INTO `rate_res` (`rate_id`, `user_id`, `res_id`, `amount`, `date_rate`) VALUES
(1, 1, 1, 5, '2023-01-01');
INSERT INTO `rate_res` (`rate_id`, `user_id`, `res_id`, `amount`, `date_rate`) VALUES
(2, 2, 1, 4, '2023-01-02');
INSERT INTO `rate_res` (`rate_id`, `user_id`, `res_id`, `amount`, `date_rate`) VALUES
(3, 1, 2, 3, '2023-01-03');
INSERT INTO `rate_res` (`rate_id`, `user_id`, `res_id`, `amount`, `date_rate`) VALUES
(4, 2, 2, 2, '2023-01-04');

INSERT INTO `restaurants` (`res_id`, `res_name`, `image`, `description`) VALUES
(1, 'Sushi restaurant', 'sushi-restaurant.png', 'This is a sushi restaurant');
INSERT INTO `restaurants` (`res_id`, `res_name`, `image`, `description`) VALUES
(2, 'Pizza restaurant', 'pizza-restaurant.png', 'This is a pizza restaurant');
INSERT INTO `restaurants` (`res_id`, `res_name`, `image`, `description`) VALUES
(3, 'Seafood restaurant', 'seafood-restaurant.png', 'This is a seafood restaurant');

INSERT INTO `sub_foods` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(1, 'Pate', 1.99, 1);
INSERT INTO `sub_foods` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(2, 'Chà bông', 1.99, 1);


INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`) VALUES
(1, 'Long Phan', 'longphan@gmail.com', '12345678');
INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`) VALUES
(2, 'An Nguyen', 'annguyen@gmail.com', '12345679');
INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`) VALUES
(3, 'John Smith', 'johnsmith@gmail.com', 'password123');
INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`) VALUES
(4, 'Sarah Johnson', 'sarahjohnson@gmail.com', 'sarah1234'),
(5, 'Michael Brown', 'michaelbrown@gmail.com', 'securepass'),
(6, 'Emily Davis', 'emilydavis@gmail.com', 'password567'),
(7, 'David Wilson', 'davidwilson@gmail.com', 'davidpass');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;