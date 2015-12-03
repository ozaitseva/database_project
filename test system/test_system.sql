CREATE DATABASE TEST_SYSTEM;
USE TEST_SYSTEM;
CREATE TABLE `Users` (
	`id` int NOT NULL AUTO_INCREMENT,
	`Login` TEXT(30) NOT NULL,
	`Password` TEXT(20) NOT NULL,
	`id_filial` int NOT NULL,
	`id_type` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Type` (
	`id` int NOT NULL AUTO_INCREMENT,
	`role` TEXT(20) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Filials` (
	`id` int NOT NULL AUTO_INCREMENT,
	`Name` TEXT(30) NOT NULL,
	`Location` TEXT(100) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Results` (
	`id` int NOT NULL AUTO_INCREMENT,
	`id_user` int NOT NULL,
	`mod1_res` int(3) NOT NULL,
	`mod2_res` int(3) NOT NULL,
	`mod3_res` int(3) NOT NULL,
	`total` int(3) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Question` (
	`id` int NOT NULL AUTO_INCREMENT,
	`question_text` TEXT NOT NULL,
	`weight_coefficient` int(2) NOT NULL,
	`test_id` int NOT NULL,
	`mod_id` int NOT NULL,
	`image_id` int NOT NULL,
	`answer_type` TEXT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Answer_free_text` (
	`id` int NOT NULL AUTO_INCREMENT,
	`id_question` int NOT NULL,
	`answer_file` TEXT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Standart_answers` (
	`id` int NOT NULL AUTO_INCREMENT,
	`id_question` int NOT NULL,
	`answer_text` TEXT(100) NOT NULL,
	`is_right_answer` bit NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Module` (
	`id` int NOT NULL AUTO_INCREMENT,
	`name` TEXT(50) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Test` (
	`id` int NOT NULL AUTO_INCREMENT,
	`variant` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Answer_user` (
	`id` int NOT NULL AUTO_INCREMENT,
	`user_id` int NOT NULL,
	`test_id` int NOT NULL,
	`question_id` int NOT NULL,
	`answer_id_free` int NOT NULL,
	`answer_id_st` int NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `Users` ADD CONSTRAINT `Users_fk0` FOREIGN KEY (`id_filial`) REFERENCES `Filials`(`id`);

ALTER TABLE `Users` ADD CONSTRAINT `Users_fk1` FOREIGN KEY (`id_type`) REFERENCES `Type`(`id`);

ALTER TABLE `Results` ADD CONSTRAINT `Results_fk0` FOREIGN KEY (`id_user`) REFERENCES `Users`(`id`);

ALTER TABLE `Question` ADD CONSTRAINT `Question_fk0` FOREIGN KEY (`test_id`) REFERENCES `Test`(`id`);

ALTER TABLE `Question` ADD CONSTRAINT `Question_fk1` FOREIGN KEY (`mod_id`) REFERENCES `Module`(`id`);

ALTER TABLE `Answer_free_text` ADD CONSTRAINT `Answer_free_text_fk0` FOREIGN KEY (`id_question`) REFERENCES `Question`(`id`);

ALTER TABLE `Standart_answers` ADD CONSTRAINT `Standart_answers_fk0` FOREIGN KEY (`id_question`) REFERENCES `Question`(`id`);

ALTER TABLE `Answer_user` ADD CONSTRAINT `Answer_user_fk0` FOREIGN KEY (`user_id`) REFERENCES `Users`(`id`);

ALTER TABLE `Answer_user` ADD CONSTRAINT `Answer_user_fk1` FOREIGN KEY (`test_id`) REFERENCES `Test`(`id`);

ALTER TABLE `Answer_user` ADD CONSTRAINT `Answer_user_fk2` FOREIGN KEY (`question_id`) REFERENCES `Question`(`id`);

ALTER TABLE `Answer_user` ADD CONSTRAINT `Answer_user_fk3` FOREIGN KEY (`answer_id_free`) REFERENCES `Answer_free_text`(`id`);

ALTER TABLE `Answer_user` ADD CONSTRAINT `Answer_user_fk4` FOREIGN KEY (`answer_id_st`) REFERENCES `Standart_answers`(`id`);
