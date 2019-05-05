-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE Database IF NOT EXISTS `Peliculas`;
USE `Peliculas` ;

-- -----------------------------------------------------
-- Table `mydb`.`Direccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Peliculas`.`Direccion` (
  `Id_direccion` INT NOT NULL,
  `Colonia` VARCHAR(30) NULL,
  `Calle` VARCHAR(45) NULL,
  `numero` VARCHAR(45) NULL,
  PRIMARY KEY (`Id_direccion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Peliculas`.`Usuarios` (
  `Id_usuarios` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Ap` VARCHAR(45) NULL,
  `Am` VARCHAR(45) NULL,
  `Correo` VARCHAR(45) NULL,
  `Telefono` VARCHAR(45) NULL,
  `Estado_entrega` VARCHAR(45) NULL,
  `Pin` VARCHAR(45) NULL,
  `Id_direccion` INT NOT NULL,
  PRIMARY KEY (`Id_usuarios`),
  INDEX `fk_Usuarios_Direccion1_idx` (`Id_direccion` ASC) VISIBLE,
  CONSTRAINT `fk_Usuarios_Direccion` 
    FOREIGN KEY (`Id_direccion`)
    REFERENCES `Peliculas`.`Direccion` (`Id_direccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Administrador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Peliculas`.`Administrador` (
  `Id_administrador` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Ap` VARCHAR(45) NULL,
  `Am` VARCHAR(45) NULL,
  `Correo` VARCHAR(45) NULL,
  `Pin` VARCHAR(45) NULL,
  PRIMARY KEY (`Id_administrador`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Entradas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Peliculas`.`Entradas` (
  `Id_entradas` INT NOT NULL,
  `Entrada` DATE NULL,
  `Salida` DATE NULL,
  PRIMARY KEY (`Id_entradas`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pelicula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Peliculas`.`Pelicula` (
  `Id_pelicula` INT NULL,
  `Titulo` VARCHAR(45) NULL,
  `Director` VARCHAR(45) NULL,
  `Año` INT NULL,
  `Detalles` VARCHAR(45) NULL,
  `Clasificacion` VARCHAR(45) NULL,
  `Genero` VARCHAR(45) NULL,
  `Disponible` VARCHAR(45) NULL,
  `img` VARCHAR(60) NULL,
  PRIMARY KEY (`Id_pelicula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Renta_o_venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Peliculas`.`Renta_o_venta` (
  `Id_renta_o_venta` INT NOT NULL,
  `Tipo_renta_o_venta` VARCHAR(45) NULL,
  `Numero ejemplar` INT NULL,
  `Costo` FLOAT NULL,
  `Id_pelicula` INT NULL,
  PRIMARY KEY (`Id_renta_o_venta`),
  INDEX `fk_Detalle_pedido_Libro1_idx` (`Id_pelicula` ASC) VISIBLE,
  CONSTRAINT `fk_Detalle_pedido_Libro1`
    FOREIGN KEY (`Id_pelicula`)
    REFERENCES `Peliculas`.`Pelicula` (`Id_pelicula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Peliculas`.`Pedido` (
  `Id_pedido` INT NOT NULL,
  `Fecha_actual` DATE NULL,
  `Fecha_entrega_pelicula_en_caso_de_renta` DATE NULL,
  `Estado_de_pelicula` VARCHAR(45) NULL,
  `Id_usuarios` INT NULL,
  `Id_renta_o_venta` INT NOT NULL,
  `Estado_de_entriego_en_caso_de_renta` VARCHAR(45) NULL,
  PRIMARY KEY (`Id_pedido`),
  INDEX `fk_Pedido_Usuarios1_idx` (`Id_usuarios` ASC) VISIBLE,
  INDEX `fk_Pedido_Renta_o_venta1_idx` (`Id_renta_o_venta` ASC) VISIBLE,
  CONSTRAINT `fk_Pedido_Usuarios1`
    FOREIGN KEY (`Id_usuarios`)
    REFERENCES `Peliculas`.`Usuarios` (`Id_usuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_Renta_o_venta1`
    FOREIGN KEY (`Id_renta_o_venta`)
    REFERENCES `Peliculas`.`Renta_o_venta` (`Id_renta_o_venta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Historial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Peliculas`.`Historial` (
  `Id_historial` INT NULL,
  `Id_administrador` INT NOT NULL,
  `Id_entradas` INT NOT NULL,
  PRIMARY KEY (`Id_historial`),
  INDEX `fk_Historial_Administrador_idx` (`Id_administrador` ASC) VISIBLE,
  INDEX `fk_Historial_Entradas1_idx` (`Id_entradas` ASC) VISIBLE,
  CONSTRAINT `fk_Historial_Administrador`
    FOREIGN KEY (`Id_administrador`)
    REFERENCES `Peliculas`.`Administrador` (`Id_administrador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Historial_Entradas1`
    FOREIGN KEY (`Id_entradas`)
    REFERENCES `Peliculas`.`Entradas` (`Id_entradas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Total_pagar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Peliculas`.`Total_pagar` (
  `Id_total_pagar` INT NOT NULL,
  `Id_pedido` INT NOT NULL,
  `Estado_de_pago` VARCHAR(45) NULL,
  PRIMARY KEY (`Id_total_pagar`),
  INDEX `fk_Total_pagar_Pedido1_idx` (`Id_pedido` ASC) VISIBLE,
  CONSTRAINT `fk_Total_pagar_Pedido1`
    FOREIGN KEY (`Id_pedido`)
    REFERENCES `Peliculas`.`Pedido` (`Id_pedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Peliculas`.`Cliente` (
  `Id_cliente` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Usuario` VARCHAR(45) NULL,
  `Password` VARCHAR(45) NULL,
  `Ap` VARCHAR(45) NULL,
  `Am` VARCHAR(45) NULL,
  `Correo` VARCHAR(45) NULL,
  `Telefono` VARCHAR(45) NULL,
  `Estado_entrega` VARCHAR(45) NULL,
  `Id_direccion` INT NOT NULL,
  `Id_total_pagar` INT NOT NULL,
  `Id_renta_o_venta` INT NOT NULL,
  'Id_pelicula' INT not NULL,
  PRIMARY KEY (`Id_cliente`),
 CONSTRAINT `fk_Detalle_pedido_Libro1`
    FOREIGN KEY (`Id_pelicula`)
    REFERENCES `Peliculas`.`Pelicula` (`Id_pelicula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION),
FOREIGN KEY (`Id_total_pagar`)
    REFERENCES `Peliculas`.`Total_pagar` (`Id_total_pagar`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION),
FOREIGN KEY (`Id_renta_o_venta`)
    REFERENCES `Peliculas`.`Renta_o_venta` (`Id_renta_o_venta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION),
  CONSTRAINT `fk_Usuarios_Direccion` 
    FOREIGN KEY (`Id_direccion`)
    REFERENCES `Peliculas`.`Direccion` (`Id_direccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION) 
ENGINE = InnoDB;