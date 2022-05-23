CREATE SCHEMA IF NOT EXISTS IRCTC;
USE IRCTC;

CREATE TABLE IF NOT EXISTS `IRCTC`.`Customer` (
  `CustomerID` INT NOT NULL,
  `CustomerName` VARCHAR(45) NOT NULL,
  `CustomerAge` TINYINT(2) NOT NULL,
  `CustomerGender` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CustomerID`),
  UNIQUE INDEX `CustomerID_UNIQUE` (`CustomerID` ASC) VISIBLE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `IRCTC`.`Train` (
  `TrainNumber` INT NOT NULL,
  `TrainName` VARCHAR(45) NOT NULL,
  `TrainSource` VARCHAR(45) NOT NULL,
  `TrainDestination` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`TrainNumber`),
  UNIQUE INDEX `TrainNumber_UNIQUE` (`TrainNumber` ASC) VISIBLE,
  UNIQUE INDEX `TrainName_UNIQUE` (`TrainName` ASC) VISIBLE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `IRCTC`.`Ticket` (
  `TicketId` INT NOT NULL AUTO_INCREMENT,
  `TicketCustomerId` INT NOT NULL,
  PRIMARY KEY (`TicketId`),
  UNIQUE INDEX `TicketId_UNIQUE` (`TicketId` ASC) VISIBLE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `IRCTC`.`ReservedTicket` (
  `TrainNumber` INT NOT NULL,
  `SeatNumberAndCoach` VARCHAR(45) NOT NULL,
  `ReservedTicketCustomerId` INT NOT NULL,
  `ReservedTicketDOJ` DATETIME NOT NULL,
  `ReservedTicketPrice` DECIMAL NOT NULL,
  `ReservedTicketId` INT NOT NULL,
  UNIQUE INDEX `SeatNumberAndCoach_UNIQUE` (`SeatNumberAndCoach` ASC) VISIBLE,
  UNIQUE INDEX `ReservedTicketCustomerId_UNIQUE` (`ReservedTicketCustomerId` ASC) VISIBLE,
  UNIQUE INDEX `ReservedTicketId_UNIQUE` (`ReservedTicketId` ASC) VISIBLE,
  PRIMARY KEY (`ReservedTicketId`),
  CONSTRAINT `fk_ReservedTicket_TrainNumber`
    FOREIGN KEY (`TrainNumber`)
    REFERENCES `IRCTC`.`Train` (`TrainNumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ReservedTicket_CustomerID`
    FOREIGN KEY (`ReservedTicketCustomerId`)
    REFERENCES `IRCTC`.`Customer` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ReservedTicket_TicketID`
    FOREIGN KEY (`ReservedTicketId`)
    REFERENCES `IRCTC`.`Ticket` (`TicketId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `IRCTC`.`UnReservedTicket` (
  `UnReservedTicketId` INT NOT NULL,
  `UnReservedCustomerID` INT NOT NULL,
  UNIQUE INDEX `UnReservedTicketId_UNIQUE` (`UnReservedTicketId` ASC) VISIBLE,
  INDEX `fk_UnReservedTicket_CustomerID_idx` (`UnReservedCustomerID` ASC) VISIBLE,
  PRIMARY KEY (`UnReservedTicketId`),
  CONSTRAINT `fk_UnReservedTicket_CustomerID`
    FOREIGN KEY (`UnReservedCustomerID`)
    REFERENCES `IRCTC`.`Customer` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_UnReservedTicket_TicketID`
    FOREIGN KEY (`UnReservedTicketId`)
    REFERENCES `IRCTC`.`Ticket` (`TicketId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;