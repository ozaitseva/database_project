CREATE DATABASE TEST_SYSTEM;
USE TEST_SYSTEM;
CREATE TABLE `Users` (
	`id` int NOT NULL AUTO_INCREMENT,
	`Login` TEXT(30) NOT NULL,
	`Password` TEXT(20) NOT NULL,
	`id_type` int NOT NULL,
	`status` TEXT(20) NOT NULL,
	`level_id` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Type` (
	`id` int NOT NULL AUTO_INCREMENT,
	`role` TEXT(20) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Results` (
	`id` int NOT NULL AUTO_INCREMENT,
	`id_user` int NOT NULL,
	`total` int(3) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Question` (
	`id` int NOT NULL AUTO_INCREMENT,
	`question_text` TEXT NOT NULL,
	`weight_coefficient` int(2) NOT NULL,
	`test_id` int NOT NULL,
	`mod_id` int NOT NULL,
	`addition` blob NOT NULL,
	`answer_type` TEXT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Answer_free` (
	`id` int NOT NULL AUTO_INCREMENT,
	`id_question` int NOT NULL,
	`answer_file` blob NOT NULL,
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

CREATE TABLE `Subtest` (
	`id` int NOT NULL AUTO_INCREMENT,
	`variant` int NOT NULL,
	`test_id` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Answer_user` (
	`id` int NOT NULL AUTO_INCREMENT,
	`user_id` int NOT NULL,
	`subtest_id` int NOT NULL,
	`question_id` int NOT NULL,
	`answer_id_free` int NOT NULL,
	`answer_id_st` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Test` (
	`id` int NOT NULL AUTO_INCREMENT,
	`variant` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Module_res` (
	`id` int NOT NULL AUTO_INCREMENT,
	`mod_id` int NOT NULL,
	`res` int(3) NOT NULL,
	`res_id` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `System_of_estimates` (
	`id` int NOT NULL AUTO_INCREMENT,
	`level` int NOT NULL,
	`mark_min` int NOT NULL,
	`mark_max` int NOT NULL,
	`test_id` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Results_subtest` (
	`id` int NOT NULL AUTO_INCREMENT,
	`id_user` int NOT NULL,
	`subtest_id` int NOT NULL,
	`total` int(3) NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `Users` ADD CONSTRAINT `Users_fk0` FOREIGN KEY (`id_type`) REFERENCES `Type`(`id`);

ALTER TABLE `Users` ADD CONSTRAINT `Users_fk1` FOREIGN KEY (`level_id`) REFERENCES `System_of_estimates`(`id`);

ALTER TABLE `Results` ADD CONSTRAINT `Results_fk0` FOREIGN KEY (`id_user`) REFERENCES `Users`(`id`);

ALTER TABLE `Question` ADD CONSTRAINT `Question_fk0` FOREIGN KEY (`test_id`) REFERENCES `Subtest`(`id`);

ALTER TABLE `Question` ADD CONSTRAINT `Question_fk1` FOREIGN KEY (`mod_id`) REFERENCES `Module`(`id`);

ALTER TABLE `Answer_free` ADD CONSTRAINT `Answer_free_fk0` FOREIGN KEY (`id_question`) REFERENCES `Question`(`id`);

ALTER TABLE `Standart_answers` ADD CONSTRAINT `Standart_answers_fk0` FOREIGN KEY (`id_question`) REFERENCES `Question`(`id`);

ALTER TABLE `Subtest` ADD CONSTRAINT `Subtest_fk0` FOREIGN KEY (`test_id`) REFERENCES `Test`(`id`);

ALTER TABLE `Answer_user` ADD CONSTRAINT `Answer_user_fk0` FOREIGN KEY (`user_id`) REFERENCES `Users`(`id`);

ALTER TABLE `Answer_user` ADD CONSTRAINT `Answer_user_fk1` FOREIGN KEY (`subtest_id`) REFERENCES `Subtest`(`id`);

ALTER TABLE `Answer_user` ADD CONSTRAINT `Answer_user_fk2` FOREIGN KEY (`question_id`) REFERENCES `Question`(`id`);

ALTER TABLE `Answer_user` ADD CONSTRAINT `Answer_user_fk3` FOREIGN KEY (`answer_id_free`) REFERENCES `Answer_free`(`id`);

ALTER TABLE `Answer_user` ADD CONSTRAINT `Answer_user_fk4` FOREIGN KEY (`answer_id_st`) REFERENCES `Standart_answers`(`id`);

ALTER TABLE `Module_res` ADD CONSTRAINT `Module_res_fk0` FOREIGN KEY (`mod_id`) REFERENCES `Module`(`id`);

ALTER TABLE `Module_res` ADD CONSTRAINT `Module_res_fk1` FOREIGN KEY (`res_id`) REFERENCES `Results_subtest`(`id`);

ALTER TABLE `System_of_estimates` ADD CONSTRAINT `System_of_estimates_fk0` FOREIGN KEY (`test_id`) REFERENCES `Test`(`id`);

ALTER TABLE `Results_subtest` ADD CONSTRAINT `Results_subtest_fk0` FOREIGN KEY (`id_user`) REFERENCES `Users`(`id`);

ALTER TABLE `Results_subtest` ADD CONSTRAINT `Results_subtest_fk1` FOREIGN KEY (`subtest_id`) REFERENCES `Subtest`(`id`);
