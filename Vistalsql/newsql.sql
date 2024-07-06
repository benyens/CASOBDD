

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`USUARIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`USUARIO` (
  `id` INT NOT NULL,
  `nombre_usuario` VARCHAR(50) NULL DEFAULT NULL,
  `seguidores` INT NULL DEFAULT NULL,
  `siguiendo` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `mydb`.`ARTISTA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ARTISTA` (
  `id` INT NULL DEFAULT NULL,
  `nombre` VARCHAR(50) NULL DEFAULT NULL,
  `descripcion` VARCHAR(100) NULL DEFAULT NULL,
  `oyentes_mensuales` INT NULL DEFAULT NULL,
  `verificado` TINYINT NULL DEFAULT NULL,
  `siguiendo` TINYINT NULL DEFAULT NULL,
  `USUARIO_id` INT NOT NULL,
  PRIMARY KEY (`id`, `USUARIO_id`),
  INDEX `fk_ARTISTA_USUARIO1_idx` (`USUARIO_id` ASC) VISIBLE,
  CONSTRAINT `fk_ARTISTA_USUARIO1`
    FOREIGN KEY (`USUARIO_id`)
    REFERENCES `mydb`.`USUARIO` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`PLAYLIST`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PLAYLIST` (
  `id` INT NULL DEFAULT NULL,
  `nombre` VARCHAR(50) NULL DEFAULT NULL,
  `fecha_creacion` DATE NULL DEFAULT NULL,
  `es_publica` TINYINT NULL DEFAULT NULL,
  `USUARIO_id` INT NOT NULL,
  PRIMARY KEY (`id`, `USUARIO_id`),
  INDEX `fk_PLAYLIST_USUARIO1_idx` (`USUARIO_id` ASC) VISIBLE,
  CONSTRAINT `fk_PLAYLIST_USUARIO1`
    FOREIGN KEY (`USUARIO_id`)
    REFERENCES `mydb`.`USUARIO` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`ALBUM`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ALBUM` (
  `id` INT NULL DEFAULT NULL,
  `nombre` VARCHAR(50) NULL DEFAULT NULL,
  `fecha_lanzamiento` DATE NULL DEFAULT NULL,
  `ARTISTA_id` INT NOT NULL,
  `ARTISTA_USUARIO_id` INT NOT NULL,
  PRIMARY KEY (`id`, `ARTISTA_id`, `ARTISTA_USUARIO_id`),
  INDEX `fk_ALBUM_ARTISTA1_idx` (`ARTISTA_id` ASC, `ARTISTA_USUARIO_id` ASC) VISIBLE,
  CONSTRAINT `fk_ALBUM_ARTISTA1`
    FOREIGN KEY (`ARTISTA_id` , `ARTISTA_USUARIO_id`)
    REFERENCES `mydb`.`ARTISTA` (`id` , `USUARIO_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`CANCION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CANCION` (
  `id` INT NULL DEFAULT NULL,
  `nombre` VARCHAR(50) NULL DEFAULT NULL,
  `duracion` INT NULL DEFAULT NULL,
  `veces_escuchada` INT NULL DEFAULT NULL,
  `me_gusta` TINYINT NULL DEFAULT NULL,
  `descargado` TINYINT NULL DEFAULT NULL,
  `PLAYLIST_id` INT NOT NULL,
  `PLAYLIST_USUARIO_id` INT NOT NULL,
  `ALBUM_id` INT NOT NULL,
  `USUARIO_id` INT NOT NULL,
  PRIMARY KEY (`id`, `PLAYLIST_id`, `PLAYLIST_USUARIO_id`, `ALBUM_id`, `USUARIO_id`),
  INDEX `fk_CANCION_PLAYLIST1_idx` (`PLAYLIST_id` ASC, `PLAYLIST_USUARIO_id` ASC) VISIBLE,
  INDEX `fk_CANCION_ALBUM1_idx` (`ALBUM_id` ASC) VISIBLE,
  INDEX `fk_CANCION_USUARIO1_idx` (`USUARIO_id` ASC) VISIBLE,
  CONSTRAINT `fk_CANCION_PLAYLIST1`
    FOREIGN KEY (`PLAYLIST_id` , `PLAYLIST_USUARIO_id`)
    REFERENCES `mydb`.`PLAYLIST` (`id` , `USUARIO_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CANCION_ALBUM1`
    FOREIGN KEY (`ALBUM_id`)
    REFERENCES `mydb`.`ALBUM` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CANCION_USUARIO1`
    FOREIGN KEY (`USUARIO_id`)
    REFERENCES `mydb`.`USUARIO` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`POPULARES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`POPULARES` (
  `id_cancion` INT NULL DEFAULT NULL,
  `ARTISTA_id` INT NOT NULL,
  `ARTISTA_USUARIO_id` INT NOT NULL,
  PRIMARY KEY (`id_cancion`, `ARTISTA_id`, `ARTISTA_USUARIO_id`),
  INDEX `fk_POPULARES_ARTISTA1_idx` (`ARTISTA_id` ASC, `ARTISTA_USUARIO_id` ASC) VISIBLE,
  CONSTRAINT ``
    FOREIGN KEY (`id_cancion`)
    REFERENCES `mydb`.`Cancion` (`id`),
  CONSTRAINT `fk_POPULARES_ARTISTA1`
    FOREIGN KEY (`ARTISTA_id` , `ARTISTA_USUARIO_id`)
    REFERENCES `mydb`.`ARTISTA` (`id` , `USUARIO_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`PODCAST`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PODCAST` (
  `id` INT NULL DEFAULT NULL,
  `nombre` VARCHAR(50) NULL DEFAULT NULL,
  `seguido` TINYINT NULL DEFAULT NULL,
  `descripcion` VARCHAR(255) NULL DEFAULT NULL,
  `calificacion` FLOAT NULL DEFAULT 0.0,
  `USUARIO_id` INT NOT NULL,
  PRIMARY KEY (`id`, `USUARIO_id`),
  INDEX `fk_PODCAST_USUARIO1_idx` (`USUARIO_id` ASC) VISIBLE,
  CONSTRAINT `fk_PODCAST_USUARIO1`
    FOREIGN KEY (`USUARIO_id`)
    REFERENCES `mydb`.`USUARIO` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`CANAL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CANAL` (
  `id` INT NULL DEFAULT NULL,
  `nombre` VARCHAR(50) NULL DEFAULT NULL,
  `PODCAST_id` INT NOT NULL,
  PRIMARY KEY (`id`, `PODCAST_id`),
  INDEX `fk_CANAL_PODCAST1_idx` (`PODCAST_id` ASC) VISIBLE,
  CONSTRAINT `fk_CANAL_PODCAST1`
    FOREIGN KEY (`PODCAST_id`)
    REFERENCES `mydb`.`PODCAST` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`EPISODIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`EPISODIO` (
  `id` INT NULL DEFAULT NULL,
  `nombre` VARCHAR(50) NULL DEFAULT NULL,
  `duracion` INT NULL DEFAULT NULL,
  `descripcion` VARCHAR(50) NULL DEFAULT NULL,
  `descargado` TINYINT NULL DEFAULT NULL,
  `agregado` TINYINT NULL DEFAULT NULL,
  `fecha_publicacion` DATE NULL DEFAULT NULL,
  `PODCAST_id` INT NOT NULL,
  PRIMARY KEY (`id`, `PODCAST_id`),
  INDEX `fk_EPISODIO_PODCAST1_idx` (`PODCAST_id` ASC) VISIBLE,
  CONSTRAINT `fk_EPISODIO_PODCAST1`
    FOREIGN KEY (`PODCAST_id`)
    REFERENCES `mydb`.`PODCAST` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`GENERO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`GENERO` (
  `id` INT NULL DEFAULT NULL,
  `nombre` VARCHAR(50) NULL DEFAULT NULL,
  `PLAYLIST_id` INT NOT NULL,
  `PLAYLIST_USUARIO_id` INT NOT NULL,
  PRIMARY KEY (`id`, `PLAYLIST_id`, `PLAYLIST_USUARIO_id`),
  INDEX `fk_GENERO_PLAYLIST1_idx` (`PLAYLIST_id` ASC, `PLAYLIST_USUARIO_id` ASC) VISIBLE,
  CONSTRAINT `fk_GENERO_PLAYLIST1`
    FOREIGN KEY (`PLAYLIST_id` , `PLAYLIST_USUARIO_id`)
    REFERENCES `mydb`.`PLAYLIST` (`id` , `USUARIO_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`GENERO_PODCAST`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`GENERO_PODCAST` (
  `nombre_genero` INT NULL DEFAULT NULL,
  `PODCAST_id` INT NOT NULL,
  PRIMARY KEY (`PODCAST_id`),
  INDEX `fk_GENERO_PODCAST_PODCAST1_idx` (`PODCAST_id` ASC) VISIBLE,
  CONSTRAINT `fk_GENERO_PODCAST_PODCAST1`
    FOREIGN KEY (`PODCAST_id`)
    REFERENCES `mydb`.`PODCAST` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
