create database if not exists car_garage;
-- SHOW DATABASES;
use car_garage;
-- SHOW TABLES;
-- DROP DATABASE car_garage;
 
CREATE TABLE Customer (
	CustomerID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Fname VARCHAR(45) NOT NULL,
    Lname VARCHAR(45) NOT NULL,
    Phone VARCHAR(20) NOT NULL,
    Email VARCHAR(45)
);
-- DESC Customer;


CREATE TABLE Vehicle (
	VehicleID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Make VARCHAR(45),
    Model VARCHAR(45),
    Year CHAR(4),
    CustomerID INT NOT NULL,
    CONSTRAINT FK_Vehicle_Customer FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
		ON UPDATE CASCADE
);
-- DESC Vehicle;


CREATE TABLE Mechanic (
	MechanicID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Fname VARCHAR(45) NOT NULL,
    Lname VARCHAR(45) NOT NULL,
    Phone VARCHAR(20) NOT NULL
);


CREATE TABLE Appointment (
	AppointmentID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    CustomerID INT NOT NULL,
    VehicleID INT NOT NULL,
    ServiceDate DATE NOT NULL,
    MechanicID INT NOT NULL,
    CONSTRAINT FK_App_Customer FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID) ON UPDATE CASCADE,
    CONSTRAINT FK_App_Vehicle FOREIGN KEY (VehicleID) REFERENCES Vehicle(VehicleID) ON UPDATE CASCADE,
    CONSTRAINT FK_App_Mechanic FOREIGN KEY (MechanicID) REFERENCES Mechanic(MechanicID)
);
-- DESC Appointment;


CREATE TABLE ServiceRecord(
	ServiceRecordID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    VehicleID INT NOT NULL,
    ServiceDate DATE NOT NULL,
    Description VARCHAR(255),
    TotalCost FLOAT NOT NULL,
    MechanicID INT NOT NULL,
    CONSTRAINT FK_ServiceRec_Vehicle FOREIGN KEY (VehicleID) REFERENCES Vehicle(VehicleID),
    CONSTRAINT FK_ServiceRec_Mechanic FOREIGN KEY (MechanicID) REFERENCES Mechanic(MechanicID)
);
-- DESC ServiceRecord;


CREATE TABLE Part(
	PartID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Name VARCHAR(45) NOT NULL,
    Description VARCHAR(255) NOT NULL,
    Price FLOAT NOT NULL
);


CREATE TABLE Inventory(
	InventoryID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    PartID INT NOT NULL,
    Quantity INT NOT NULL,
    CONSTRAINT FK_Inventory_Part FOREIGN KEY (PartID) REFERENCES Part(PartID) 
);

CREATE TABLE ServiceRecordPart(
	ServiceRecordPartID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    ServiceRecordID INT NOT NULL,
    PartID INT NOT NULL,
    Quantity INT NOT NULL,
    CONSTRAINT FK_ServiceRecPart_ServiceRec FOREIGN KEY (ServiceRecordID) REFERENCES ServiceRecord(ServiceRecordID),
    CONSTRAINT FK_ServiceRecPart_Part FOREIGN KEY (PartID) REFERENCES Part(PartID)
);

-- Update para realização de soma do valor do Serviço com as peças usadas
UPDATE ServiceRecord SR
JOIN (
    SELECT SRP.ServiceRecordID, SUM(P.Price * SRP.Quantity) AS NewTotalCost
    FROM ServiceRecordPart SRP
    JOIN Part P ON SRP.PartID = P.PartID
    GROUP BY SRP.ServiceRecordID
) AS CostCalculation ON SR.ServiceRecordID = CostCalculation.ServiceRecordID
SET SR.TotalCost = SR.TotalCost + CostCalculation.NewTotalCost;