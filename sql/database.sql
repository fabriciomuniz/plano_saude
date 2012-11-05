SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `plano_saude` ;
CREATE SCHEMA IF NOT EXISTS `plano_saude` DEFAULT CHARACTER SET utf8 ;
USE `plano_saude` ;

-- -----------------------------------------------------
-- Table `plano_saude`.`tb_contrato`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `plano_saude`.`tb_contrato` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `status` VARCHAR(255) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `plano_saude`.`tb_contrato`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `plano_saude`.`tb_contrato` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `status` VARCHAR(255) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `plano_saude`.`tb_dependente_status`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `plano_saude`.`tb_dependente_status` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `status` VARCHAR(255) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `plano_saude`.`tb_parentesco`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `plano_saude`.`tb_parentesco` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `descricao` VARCHAR(255) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `plano_saude`.`tb_dependente`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `plano_saude`.`tb_dependente` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `contrato_id` INT(10) UNSIGNED NOT NULL ,
  `status_id` INT(10) UNSIGNED NOT NULL ,
  `parentesco_id` INT(10) UNSIGNED NOT NULL ,
  `nome` VARCHAR(255) NULL DEFAULT NULL ,
  `data_nascimento` DATE NULL DEFAULT NULL ,
  `sexo` ENUM('M','F') NULL DEFAULT NULL ,
  `data` TIMESTAMP NULL DEFAULT NULL ,
  `data_cob` TIMESTAMP NULL DEFAULT NULL ,
  `motivo` TEXT NULL DEFAULT NULL ,
  `motivo_cob` TEXT NULL DEFAULT NULL ,
  `usuario` INT(10) UNSIGNED NULL DEFAULT NULL ,
  `usuario_cob` INT(10) UNSIGNED NULL DEFAULT NULL ,
  `respondido` ENUM('Y','N') NULL DEFAULT 'N' ,
  `tipo` ENUM('saude','dental') NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `FK_tb_regras_assistenciamedica_dependente_tb_regras_assiste_idx` (`contrato_id` ASC) ,
  INDEX `FK_tb_regras_assistenciamedica_dependente_tb_regras_assiste_idx1` (`status_id` ASC) ,
  INDEX `FK_tb_regras_assistenciamedica_dependente_tb_regras_assiste_idx2` (`parentesco_id` ASC) ,
  CONSTRAINT `FK_tb_regras_assistenciamedica_dependente_tb_regras_assistenc1`
    FOREIGN KEY (`contrato_id` )
    REFERENCES `plano_saude`.`tb_contrato` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tb_regras_assistenciamedica_dependente_tb_regras_assistenc2`
    FOREIGN KEY (`status_id` )
    REFERENCES `plano_saude`.`tb_dependente_status` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tb_regras_assistenciamedica_dependente_tb_regras_assistenc3`
    FOREIGN KEY (`parentesco_id` )
    REFERENCES `plano_saude`.`tb_parentesco` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 20
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `plano_saude`.`tb_plano_status`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `plano_saude`.`tb_plano_status` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `status` VARCHAR(255) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `plano_saude`.`tb_operadora_status`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `plano_saude`.`tb_operadora_status` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `status` VARCHAR(255) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `plano_saude`.`tb_operadora`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `plano_saude`.`tb_operadora` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `status_id` INT(10) UNSIGNED NOT NULL ,
  `razao_social` VARCHAR(255) NULL DEFAULT NULL ,
  `nome_fantasia` VARCHAR(255) NULL DEFAULT NULL ,
  `inscricao_estadual` BIGINT(15) UNSIGNED NULL DEFAULT NULL ,
  `inscricao_municipal` BIGINT(15) UNSIGNED NULL DEFAULT NULL ,
  `cnpj` BIGINT(14) UNSIGNED NULL DEFAULT NULL ,
  `telefone` BIGINT(10) UNSIGNED NULL DEFAULT NULL ,
  `fax` BIGINT(10) UNSIGNED NULL DEFAULT NULL ,
  `email` VARCHAR(255) NULL DEFAULT NULL ,
  `logradouro` VARCHAR(255) NULL DEFAULT NULL ,
  `numero` VARCHAR(20) NULL DEFAULT NULL ,
  `complemento` VARCHAR(200) NULL DEFAULT NULL ,
  `bairro` VARCHAR(200) NULL DEFAULT NULL ,
  `municipio` VARCHAR(200) NULL DEFAULT NULL ,
  `uf` CHAR(2) NULL DEFAULT NULL ,
  `cep` VARCHAR(10) NULL DEFAULT NULL ,
  `data` TIMESTAMP NULL DEFAULT NULL ,
  `data_cob` TIMESTAMP NULL DEFAULT NULL ,
  `motivo` TEXT NULL DEFAULT NULL ,
  `motivo_cob` TEXT NULL DEFAULT NULL ,
  `usuario` INT(10) UNSIGNED NULL DEFAULT NULL ,
  `usuario_cob` INT(10) UNSIGNED NULL DEFAULT NULL ,
  `respondido` ENUM('Y','N') NOT NULL DEFAULT 'N' ,
  PRIMARY KEY (`id`) ,
  INDEX `FK_tb_regras_assistenciamedica_operadora_tb_regras_assisten_idx1` (`status_id` ASC) ,
  CONSTRAINT `FK_operadora_status`
    FOREIGN KEY (`status_id` )
    REFERENCES `plano_saude`.`tb_operadora_status` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `plano_saude`.`tb_plano`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `plano_saude`.`tb_plano` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `operadora_id` INT(10) UNSIGNED NOT NULL ,
  `status_id` INT(10) UNSIGNED NOT NULL ,
  `nome` VARCHAR(255) NULL DEFAULT NULL ,
  `valor` FLOAT(10,2) UNSIGNED NULL DEFAULT NULL ,
  `data` TIMESTAMP NULL DEFAULT NULL ,
  `data_cob` TIMESTAMP NULL DEFAULT NULL ,
  `motivo` TEXT NULL DEFAULT NULL ,
  `motivo_cob` TEXT NULL DEFAULT NULL ,
  `usuario` INT(10) UNSIGNED NULL DEFAULT NULL ,
  `usuario_cob` INT(10) UNSIGNED NULL DEFAULT NULL ,
  `respondido` ENUM('Y','N') NULL DEFAULT 'N' ,
  `tipo` ENUM('saude','dental') NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `FK_tb_regras_assistenciamedica_plano_tb_regras_assistenciam_idx` (`status_id` ASC) ,
  INDEX `FK_tb_regras_assistenciamedica_plano_tb_regras_assistenciam_idx1` (`operadora_id` ASC) ,
  CONSTRAINT `FK_tb_regras_assistenciamedica_plano_tb_regras_assistenciamed`
    FOREIGN KEY (`status_id` )
    REFERENCES `plano_saude`.`tb_plano_status` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tb_regras_assistenciamedica_plano_tb_regras_assistenciamed1`
    FOREIGN KEY (`operadora_id` )
    REFERENCES `plano_saude`.`tb_operadora` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `plano_saude`.`tb_contrato_dependente_plano`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `plano_saude`.`tb_contrato_dependente_plano` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `contrato_id` INT(10) UNSIGNED NOT NULL ,
  `plano_id` INT(10) UNSIGNED NOT NULL ,
  `dependente_id` INT(10) UNSIGNED NOT NULL ,
  `tipo` ENUM('titular','dependente') NULL DEFAULT 'titular' ,
  PRIMARY KEY (`id`) ,
  INDEX `FK_tb_regras_assistenciamedica_contrato_tb_regras_assistenc_idx` (`plano_id` ASC) ,
  INDEX `FK_tb_regras_assistenciamedica_contrato_tb_regras_assistenc_idx1` (`contrato_id` ASC) ,
  INDEX `FK_tb_regras_assistenciamedica_items_contrato_tb_regras_ass_idx` (`dependente_id` ASC) ,
  CONSTRAINT `FK_tb_regras_assistenciamedica_contrato_tb_regras_assistencia4`
    FOREIGN KEY (`contrato_id` )
    REFERENCES `plano_saude`.`tb_contrato` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tb_regras_assistenciamedica_contrato_tb_regras_assistencia5`
    FOREIGN KEY (`plano_id` )
    REFERENCES `plano_saude`.`tb_plano` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tb_regras_assistenciamedica_items_contrato_tb_regras_assis1`
    FOREIGN KEY (`dependente_id` )
    REFERENCES `plano_saude`.`tb_dependente` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 53
DEFAULT CHARACTER SET = utf8;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
