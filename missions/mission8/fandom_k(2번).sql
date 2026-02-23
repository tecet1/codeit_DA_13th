-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema fandom_k
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema fandom_k
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `fandom_k` DEFAULT CHARACTER SET utf8 ;
USE `fandom_k` ;

-- -----------------------------------------------------
-- Table `fandom_k`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fandom_k`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `gender` VARCHAR(1) NULL,
  `credit` INT NOT NULL DEFAULT 0,
  `created_at` DATETIME NOT NULL DEFAULT now(),
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fandom_k`.`artist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fandom_k`.`artist` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `gender` VARCHAR(1) NOT NULL,
  `created_at` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fandom_k`.`offerings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fandom_k`.`offerings` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `offer_name` VARCHAR(45) NOT NULL,
  `due_date` DATETIME NOT NULL,
  `goal_amount` INT NOT NULL,
  `current_amount` INT NOT NULL DEFAULT 0,
  `artist_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_offerings_artist1_idx` (`artist_id` ASC) VISIBLE,
  CONSTRAINT `fk_offerings_artist1`
    FOREIGN KEY (`artist_id`)
    REFERENCES `fandom_k`.`artist` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fandom_k`.`vote_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fandom_k`.`vote_category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `start_date` DATETIME NOT NULL,
  `end_date` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fandom_k`.`vote`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fandom_k`.`vote` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `artist_id` INT NOT NULL,
  `vote_category_id` INT NOT NULL,
  `vote_name` VARCHAR(45) NOT NULL,
  `amount` INT NOT NULL,
  `created_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_vote_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_vote_artist1_idx` (`artist_id` ASC) VISIBLE,
  INDEX `fk_vote_vote_category1_idx` (`vote_category_id` ASC) VISIBLE,
  CONSTRAINT `fk_vote_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `fandom_k`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vote_artist1`
    FOREIGN KEY (`artist_id`)
    REFERENCES `fandom_k`.`artist` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vote_vote_category1`
    FOREIGN KEY (`vote_category_id`)
    REFERENCES `fandom_k`.`vote_category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fandom_k`.`follows`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fandom_k`.`follows` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `artist_id` INT NOT NULL,
  `followed_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_follows_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_follows_artist1_idx` (`artist_id` ASC) VISIBLE,
  CONSTRAINT `fk_follows_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `fandom_k`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_follows_artist1`
    FOREIGN KEY (`artist_id`)
    REFERENCES `fandom_k`.`artist` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fandom_k`.`offering_sponsorship`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fandom_k`.`offering_sponsorship` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `offerings_id` INT NOT NULL,
  `created_at` DATETIME NOT NULL,
  `supported_amount` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_offering_sponsorship_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_offering_sponsorship_offerings1_idx` (`offerings_id` ASC) VISIBLE,
  CONSTRAINT `fk_offering_sponsorship_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `fandom_k`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_offering_sponsorship_offerings1`
    FOREIGN KEY (`offerings_id`)
    REFERENCES `fandom_k`.`offerings` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fandom_k`.`credit_transactions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fandom_k`.`credit_transactions` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `transaction_type` ENUM('CHARGE', 'USE', 'REFUND') NOT NULL,
  `amount` INT NOT NULL,
  `created_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_credit_transactions_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_credit_transactions_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `fandom_k`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
