-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema staffload
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema staffload
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `staffload` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `staffload` ;

-- -----------------------------------------------------
-- Table `staffload`.`faculty`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `staffload`.`faculty` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(128) NOT NULL,
  `short_name` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `staffload`.`specialty`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `staffload`.`specialty` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(128) NOT NULL,
  `faculty_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `specialty_to_faculty_idx` (`faculty_id` ASC),
  CONSTRAINT `specialty_to_faculty`
    FOREIGN KEY (`faculty_id`)
    REFERENCES `staffload`.`faculty` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `staffload`.`okr`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `staffload`.`okr` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `staffload`.`stream`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `staffload`.`stream` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(32) NOT NULL,
  `specialty_id` INT NOT NULL,
  `okr_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `stream_to_specialty_idx` (`specialty_id` ASC),
  INDEX `stream_to_okr_idx` (`okr_id` ASC),
  CONSTRAINT `stream_to_specialty`
    FOREIGN KEY (`specialty_id`)
    REFERENCES `staffload`.`specialty` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `stream_to_okr`
    FOREIGN KEY (`okr_id`)
    REFERENCES `staffload`.`okr` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '		';


-- -----------------------------------------------------
-- Table `staffload`.`group`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `staffload`.`group` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(16) NOT NULL,
  `stream_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `group_to_stream_idx` (`stream_id` ASC),
  CONSTRAINT `group_to_stream`
    FOREIGN KEY (`stream_id`)
    REFERENCES `staffload`.`stream` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `staffload`.`position`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `staffload`.`position` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `staffload`.`academic_degree`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `staffload`.`academic_degree` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `staffload`.`academic_title`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `staffload`.`academic_title` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `staffload`.`teacher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `staffload`.`teacher` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `last_name` VARCHAR(45) NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `middle_name` VARCHAR(45) NULL,
  `position_id` INT NOT NULL,
  `academic_degree_id` INT NULL,
  `academic_title_id` INT NULL,
  `wage_rate_percentage` INT NOT NULL,
  `does_combine_jobs` TINYINT(1) NOT NULL,
  `specialty_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `teacher_to_position_idx` (`position_id` ASC),
  INDEX `teacher_to_academic_degree_idx` (`academic_degree_id` ASC),
  INDEX `teacher_to_academic_title_idx` (`academic_title_id` ASC),
  INDEX `teacher_to_specialty_idx` (`specialty_id` ASC),
  CONSTRAINT `teacher_to_position`
    FOREIGN KEY (`position_id`)
    REFERENCES `staffload`.`position` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `teacher_to_academic_degree`
    FOREIGN KEY (`academic_degree_id`)
    REFERENCES `staffload`.`academic_degree` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `teacher_to_academic_title`
    FOREIGN KEY (`academic_title_id`)
    REFERENCES `staffload`.`academic_title` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `teacher_to_specialty`
    FOREIGN KEY (`specialty_id`)
    REFERENCES `staffload`.`specialty` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `staffload`.`discipline`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `staffload`.`discipline` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(128) NOT NULL,
  `specialty_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `discipline_to_specialty_idx` (`specialty_id` ASC),
  CONSTRAINT `discipline_to_specialty`
    FOREIGN KEY (`specialty_id`)
    REFERENCES `staffload`.`specialty` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `staffload`.`studies_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `staffload`.`studies_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(64) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `staffload`.`studies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `staffload`.`studies` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `studies_type_id` INT NOT NULL,
  `hours_budget_x10` INT NULL,
  `hours_contract_x10` INT NULL,
  `discipline_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `studies_to_studies_type_idx` (`studies_type_id` ASC),
  INDEX `studies_to_discipline_idx` (`discipline_id` ASC),
  CONSTRAINT `studies_to_studies_type`
    FOREIGN KEY (`studies_type_id`)
    REFERENCES `staffload`.`studies_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `studies_to_discipline`
    FOREIGN KEY (`discipline_id`)
    REFERENCES `staffload`.`discipline` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `staffload`.`load`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `staffload`.`load` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `teacher_id` INT NOT NULL,
  `discipline_id` INT NOT NULL,
  `stream_id` INT NOT NULL,
  `academic_year` VARCHAR(16) NOT NULL,
  `semester` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `load_to_teacher_idx` (`teacher_id` ASC),
  INDEX `load_to_discipline_idx` (`discipline_id` ASC),
  INDEX `load_to_stream_idx` (`stream_id` ASC),
  CONSTRAINT `load_to_teacher`
    FOREIGN KEY (`teacher_id`)
    REFERENCES `staffload`.`teacher` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `load_to_discipline`
    FOREIGN KEY (`discipline_id`)
    REFERENCES `staffload`.`discipline` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `load_to_stream`
    FOREIGN KEY (`stream_id`)
    REFERENCES `staffload`.`stream` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `staffload`.`faculty`
-- -----------------------------------------------------
START TRANSACTION;
USE `staffload`;
INSERT INTO `staffload`.`faculty` (`id`, `name`, `short_name`) VALUES (1, 'Факультет прикладної математики', 'ФПМ');

COMMIT;


-- -----------------------------------------------------
-- Data for table `staffload`.`specialty`
-- -----------------------------------------------------
START TRANSACTION;
USE `staffload`;
INSERT INTO `staffload`.`specialty` (`id`, `name`, `faculty_id`) VALUES (1, 'програмна інженерія', 1);
INSERT INTO `staffload`.`specialty` (`id`, `name`, `faculty_id`) VALUES (2, 'комп\'ютерна інженерія', 1);
INSERT INTO `staffload`.`specialty` (`id`, `name`, `faculty_id`) VALUES (3, 'прикладна математика', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `staffload`.`okr`
-- -----------------------------------------------------
START TRANSACTION;
USE `staffload`;
INSERT INTO `staffload`.`okr` (`id`, `name`) VALUES (1, 'бакалавр');
INSERT INTO `staffload`.`okr` (`id`, `name`) VALUES (2, 'магістр');
INSERT INTO `staffload`.`okr` (`id`, `name`) VALUES (3, 'спеціаліст');

COMMIT;


-- -----------------------------------------------------
-- Data for table `staffload`.`stream`
-- -----------------------------------------------------
START TRANSACTION;
USE `staffload`;
INSERT INTO `staffload`.`stream` (`id`, `name`, `specialty_id`, `okr_id`) VALUES (1, 'КП-3x', 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `staffload`.`group`
-- -----------------------------------------------------
START TRANSACTION;
USE `staffload`;
INSERT INTO `staffload`.`group` (`id`, `name`, `stream_id`) VALUES (1, 'КП-31', 1);
INSERT INTO `staffload`.`group` (`id`, `name`, `stream_id`) VALUES (2, 'КП-32', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `staffload`.`position`
-- -----------------------------------------------------
START TRANSACTION;
USE `staffload`;
INSERT INTO `staffload`.`position` (`id`, `name`) VALUES (1, 'асистент');
INSERT INTO `staffload`.`position` (`id`, `name`) VALUES (2, 'викладач');
INSERT INTO `staffload`.`position` (`id`, `name`) VALUES (3, 'старший викладач');
INSERT INTO `staffload`.`position` (`id`, `name`) VALUES (4, 'доцент');
INSERT INTO `staffload`.`position` (`id`, `name`) VALUES (5, 'професор');
INSERT INTO `staffload`.`position` (`id`, `name`) VALUES (6, 'завідувач кафедри');
INSERT INTO `staffload`.`position` (`id`, `name`) VALUES (7, 'декан');

COMMIT;


-- -----------------------------------------------------
-- Data for table `staffload`.`academic_degree`
-- -----------------------------------------------------
START TRANSACTION;
USE `staffload`;
INSERT INTO `staffload`.`academic_degree` (`id`, `name`) VALUES (1, 'кандидат наук');
INSERT INTO `staffload`.`academic_degree` (`id`, `name`) VALUES (2, 'доктор наук');

COMMIT;


-- -----------------------------------------------------
-- Data for table `staffload`.`academic_title`
-- -----------------------------------------------------
START TRANSACTION;
USE `staffload`;
INSERT INTO `staffload`.`academic_title` (`id`, `name`) VALUES (1, 'старший дослідник');
INSERT INTO `staffload`.`academic_title` (`id`, `name`) VALUES (2, 'доцент');
INSERT INTO `staffload`.`academic_title` (`id`, `name`) VALUES (3, 'професор');

COMMIT;


-- -----------------------------------------------------
-- Data for table `staffload`.`teacher`
-- -----------------------------------------------------
START TRANSACTION;
USE `staffload`;
INSERT INTO `staffload`.`teacher` (`id`, `last_name`, `first_name`, `middle_name`, `position_id`, `academic_degree_id`, `academic_title_id`, `wage_rate_percentage`, `does_combine_jobs`, `specialty_id`) VALUES (1, 'Невдащенко', 'Максим', 'Валентинович', 3, NULL, NULL, 100, 0, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `staffload`.`discipline`
-- -----------------------------------------------------
START TRANSACTION;
USE `staffload`;
INSERT INTO `staffload`.`discipline` (`id`, `name`, `specialty_id`) VALUES (1, 'Об\'єктно-орієнтоване програмування', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `staffload`.`studies_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `staffload`;
INSERT INTO `staffload`.`studies_type` (`id`, `name`) VALUES (1, 'лекції');
INSERT INTO `staffload`.`studies_type` (`id`, `name`) VALUES (2, 'практичні заняття (семінари)');
INSERT INTO `staffload`.`studies_type` (`id`, `name`) VALUES (3, 'лабораторні заняття');
INSERT INTO `staffload`.`studies_type` (`id`, `name`) VALUES (4, 'екзамени');
INSERT INTO `staffload`.`studies_type` (`id`, `name`) VALUES (5, 'заліки');
INSERT INTO `staffload`.`studies_type` (`id`, `name`) VALUES (6, 'контрольні роботи');
INSERT INTO `staffload`.`studies_type` (`id`, `name`) VALUES (7, 'курсові проекти');
INSERT INTO `staffload`.`studies_type` (`id`, `name`) VALUES (8, 'курсові роботи');
INSERT INTO `staffload`.`studies_type` (`id`, `name`) VALUES (9, 'РГР, РР, ГР');
INSERT INTO `staffload`.`studies_type` (`id`, `name`) VALUES (10, 'ДКР');
INSERT INTO `staffload`.`studies_type` (`id`, `name`) VALUES (11, 'реферати');
INSERT INTO `staffload`.`studies_type` (`id`, `name`) VALUES (12, 'консультації');

COMMIT;


-- -----------------------------------------------------
-- Data for table `staffload`.`studies`
-- -----------------------------------------------------
START TRANSACTION;
USE `staffload`;
INSERT INTO `staffload`.`studies` (`id`, `studies_type_id`, `hours_budget_x10`, `hours_contract_x10`, `discipline_id`) VALUES (1, 1, 360, NULL, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `staffload`.`load`
-- -----------------------------------------------------
START TRANSACTION;
USE `staffload`;
INSERT INTO `staffload`.`load` (`id`, `teacher_id`, `discipline_id`, `stream_id`, `academic_year`, `semester`) VALUES (1, 1, 1, 1, '2016/2017', 2);

COMMIT;

