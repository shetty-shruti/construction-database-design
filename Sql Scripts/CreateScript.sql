-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Customer` (
  `Id` BIGINT(30) NOT NULL AUTO_INCREMENT,
  `First_Name` VARCHAR(45) NOT NULL,
  `Last_Name` VARCHAR(45) NOT NULL,
  `Age` VARCHAR(100) NOT NULL,
  `Email_Id` VARCHAR(45) NOT NULL,
  `Phone_Number` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Accounts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Accounts` (
  `Account_Number` VARCHAR(45) NOT NULL,
  `Account_Name` VARCHAR(45) NULL,
  `Customer_Id` BIGINT(30) NOT NULL,
  PRIMARY KEY (`Account_Number`),
  INDEX `fk_Accounts_Customer_idx` (`Customer_Id` ASC),
  UNIQUE INDEX `Account_Id_UNIQUE` (`Account_Number` ASC),
  CONSTRAINT `fk_Accounts_Customer`
    FOREIGN KEY (`Customer_Id`)
    REFERENCES `mydb`.`Customer` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Orders` (
  `Order_Id` INT NOT NULL AUTO_INCREMENT,
  `Customer_Id` BIGINT(30) NOT NULL,
  `Flat_Id` INT NOT NULL,
  `Order_status` VARCHAR(45) NULL,
  PRIMARY KEY (`Order_Id`),
  INDEX `fk_Orders_Customer1_idx` (`Customer_Id` ASC),
  UNIQUE INDEX `Order_Id_UNIQUE` (`Order_Id` ASC),
  CONSTRAINT `fk_Orders_Customer1`
    FOREIGN KEY (`Customer_Id`)
    REFERENCES `mydb`.`Customer` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Buildings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Buildings` (
  `Building_id` INT NOT NULL AUTO_INCREMENT,
  `Building_Name` VARCHAR(45) NOT NULL,
  `No_Of_Floors` INT NOT NULL,
  `Flats_Per_Floor` INT NOT NULL,
  `Street` VARCHAR(45) NOT NULL,
  `City` VARCHAR(45) NOT NULL,
  `State` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Building_id`),
  UNIQUE INDEX `No_Of_Floors_UNIQUE` (`No_Of_Floors` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Flats`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Flats` (
  `Flat_Id` INT NOT NULL AUTO_INCREMENT,
  `Flat_No` INT NOT NULL,
  `Order_Id` INT NULL,
  `Building_id` INT NOT NULL,
  `Floor_No` VARCHAR(45) NULL,
  `Flat_Cost_Price` DOUBLE NOT NULL,
  `Flat_Selling_Price` DOUBLE NOT NULL,
  `Flat_Booked_Status` VARCHAR(10) NULL,
  INDEX `fk_Flats_Orders1_idx` (`Order_Id` ASC),
  INDEX `fk_Flats_Buildings1_idx` (`Building_id` ASC),
  PRIMARY KEY (`Flat_Id`),
  CONSTRAINT `fk_Flats_Orders1`
    FOREIGN KEY (`Order_Id`)
    REFERENCES `mydb`.`Orders` (`Order_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Flats_Buildings1`
    FOREIGN KEY (`Building_id`)
    REFERENCES `mydb`.`Buildings` (`Building_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Employees` (
  `Employee_Id` INT NOT NULL AUTO_INCREMENT,
  `First_Name` VARCHAR(45) NOT NULL,
  `Last_Name` VARCHAR(45) NOT NULL,
  `Age` VARCHAR(10) NOT NULL,
  `Email_id` VARCHAR(45) NULL,
  `Phone_No` VARCHAR(45) NULL,
  `Date_Of_Birth` VARCHAR(45) NOT NULL,
  `Salary` DOUBLE NOT NULL,
  PRIMARY KEY (`Employee_Id`),
  UNIQUE INDEX `Employee_Id_UNIQUE` (`Employee_Id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Builds`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Builds` (
  `Build_Id` INT NOT NULL AUTO_INCREMENT,
  `Employee_Id` INT NOT NULL,
  `Building_id` INT NOT NULL,
  `Construction_Status` VARCHAR(45) NULL,
  `Floors_Completed` INT NULL,
  INDEX `fk_Employees_has_Buildings_Buildings1_idx` (`Building_id` ASC),
  INDEX `fk_Employees_has_Buildings_Employees1_idx` (`Employee_Id` ASC),
  PRIMARY KEY (`Build_Id`),
  CONSTRAINT `fk_Employees_has_Buildings_Employees1`
    FOREIGN KEY (`Employee_Id`)
    REFERENCES `mydb`.`Employees` (`Employee_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Employees_has_Buildings_Buildings1`
    FOREIGN KEY (`Building_id`)
    REFERENCES `mydb`.`Buildings` (`Building_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Payment_Status_Master`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Payment_Status_Master` (
  `Status_id` INT NOT NULL,
  `Status_Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Status_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Payments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Payments` (
  `Payment_id` INT NOT NULL AUTO_INCREMENT,
  `Payment_Date` DATETIME(6) NOT NULL,
  `Status_id` INT NOT NULL,
  `Order_Id` INT NOT NULL,
  `Account_Number` VARCHAR(45) NULL,
  `Payment_Amount` DOUBLE NULL,
  PRIMARY KEY (`Payment_id`, `Order_Id`),
  UNIQUE INDEX `Payment_id_UNIQUE` (`Payment_id` ASC),
  INDEX `fk_Payments_Payment_Status_Master1_idx` (`Status_id` ASC),
  INDEX `fk_Payments_Orders1_idx` (`Order_Id` ASC),
  INDEX `fk_Payments_Accounts1_idx` (`Account_Number` ASC),
  CONSTRAINT `fk_Payments_Payment_Status_Master1`
    FOREIGN KEY (`Status_id`)
    REFERENCES `mydb`.`Payment_Status_Master` (`Status_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Payments_Orders1`
    FOREIGN KEY (`Order_Id`)
    REFERENCES `mydb`.`Orders` (`Order_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Payments_Accounts1`
    FOREIGN KEY (`Account_Number`)
    REFERENCES `mydb`.`Accounts` (`Account_Number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Invoices` (
  `Invoice_Id` INT NOT NULL AUTO_INCREMENT,
  `Payment_id` INT NOT NULL,
  PRIMARY KEY (`Invoice_Id`),
  UNIQUE INDEX `Invoice_Id_UNIQUE` (`Invoice_Id` ASC),
  INDEX `fk_Invoices_Payments1_idx` (`Payment_id` ASC),
  CONSTRAINT `fk_Invoices_Payments1`
    FOREIGN KEY (`Payment_id`)
    REFERENCES `mydb`.`Payments` (`Payment_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TransactionType`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TransactionType` (
  `Transaction_Id` INT NOT NULL,
  `Type_Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Transaction_Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Financial_Transaction`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Financial_Transaction` (
  `Financial_Transaction_id` INT NOT NULL AUTO_INCREMENT,
  `Invoice_Id` INT NULL,
  `Transaction_Id` INT NOT NULL,
  `Payment_id` INT NOT NULL,
  PRIMARY KEY (`Financial_Transaction_id`),
  INDEX `fk_Financial_Transaction_Invoices1_idx` (`Invoice_Id` ASC),
  INDEX `fk_Financial_Transaction_TransactionType1_idx` (`Transaction_Id` ASC),
  INDEX `fk_Financial_Transaction_Payments1_idx` (`Payment_id` ASC),
  UNIQUE INDEX `Financial_Transaction_id_UNIQUE` (`Financial_Transaction_id` ASC),
  CONSTRAINT `fk_Financial_Transaction_Invoices1`
    FOREIGN KEY (`Invoice_Id`)
    REFERENCES `mydb`.`Invoices` (`Invoice_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Financial_Transaction_TransactionType1`
    FOREIGN KEY (`Transaction_Id`)
    REFERENCES `mydb`.`TransactionType` (`Transaction_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Financial_Transaction_Payments1`
    FOREIGN KEY (`Payment_id`)
    REFERENCES `mydb`.`Payments` (`Payment_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Authorizes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Authorizes` (
  `Authorization_id` INT NOT NULL AUTO_INCREMENT,
  `Payment_id` INT NOT NULL,
  `Employee_Id` INT NOT NULL,
  INDEX `fk_Payments_has_Employees_Employees1_idx` (`Employee_Id` ASC),
  INDEX `fk_Payments_has_Employees_Payments1_idx` (`Payment_id` ASC),
  PRIMARY KEY (`Authorization_id`, `Payment_id`),
  UNIQUE INDEX `Authorization_id_UNIQUE` (`Authorization_id` ASC),
  CONSTRAINT `fk_Payments_has_Employees_Payments1`
    FOREIGN KEY (`Payment_id`)
    REFERENCES `mydb`.`Payments` (`Payment_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Payments_has_Employees_Employees1`
    FOREIGN KEY (`Employee_Id`)
    REFERENCES `mydb`.`Employees` (`Employee_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Manufacturer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Manufacturer` (
  `Manufacturer_Id` INT NOT NULL AUTO_INCREMENT,
  `Manufacturer_Name` VARCHAR(45) NULL,
  PRIMARY KEY (`Manufacturer_Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Equipments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Equipments` (
  `Equipment_id` INT NOT NULL AUTO_INCREMENT,
  `Equipment_Name` VARCHAR(45) NULL,
  `Quantity` INT NOT NULL,
  `Brand` VARCHAR(45) NOT NULL,
  `Price` DOUBLE NOT NULL,
  PRIMARY KEY (`Equipment_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Equipments_has_Manufacturer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Equipments_has_Manufacturer` (
  `Id` INT NOT NULL,
  `Equipment_id` INT NOT NULL,
  `Manufacturer_Id` INT NOT NULL,
  INDEX `fk_Equipments_has_Manufacturer_Manufacturer1_idx` (`Manufacturer_Id` ASC),
  INDEX `fk_Equipments_has_Manufacturer_Equipments1_idx` (`Equipment_id` ASC),
  PRIMARY KEY (`Id`, `Equipment_id`, `Manufacturer_Id`),
  CONSTRAINT `fk_Equipments_has_Manufacturer_Equipments1`
    FOREIGN KEY (`Equipment_id`)
    REFERENCES `mydb`.`Equipments` (`Equipment_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Equipments_has_Manufacturer_Manufacturer1`
    FOREIGN KEY (`Manufacturer_Id`)
    REFERENCES `mydb`.`Manufacturer` (`Manufacturer_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Equipment_order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Equipment_order` (
  `Equipment_Order_id` INT NOT NULL AUTO_INCREMENT,
  `Employee_Id` INT NOT NULL,
  `Quantity` INT NOT NULL,
  `Equipments_has_Manufacturer_Id` INT NOT NULL,
  INDEX `fk_Manufacturer_has_Employees_Employees1_idx` (`Employee_Id` ASC),
  PRIMARY KEY (`Equipment_Order_id`),
  INDEX `fk_Equipment_order_Equipments_has_Manufacturer1_idx` (`Equipments_has_Manufacturer_Id` ASC),
  CONSTRAINT `fk_Manufacturer_has_Employees_Employees1`
    FOREIGN KEY (`Employee_Id`)
    REFERENCES `mydb`.`Employees` (`Employee_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Equipment_order_Equipments_has_Manufacturer1`
    FOREIGN KEY (`Equipments_has_Manufacturer_Id`)
    REFERENCES `mydb`.`Equipments_has_Manufacturer` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Address` (
  `Address_Id` INT NOT NULL AUTO_INCREMENT,
  `Flat_No` INT NULL,
  `Building_Id` INT NULL,
  `Customer_Id` BIGINT(30) NOT NULL,
  PRIMARY KEY (`Address_Id`),
  UNIQUE INDEX `Address_Id_UNIQUE` (`Address_Id` ASC),
  INDEX `fk_Address_Customer1_idx` (`Customer_Id` ASC),
  CONSTRAINT `fk_Address_Customer1`
    FOREIGN KEY (`Customer_Id`)
    REFERENCES `mydb`.`Customer` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
