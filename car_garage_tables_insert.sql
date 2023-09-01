USE car_garage;
SHOW TABLES;

INSERT INTO Customer (CustomerID, Fname, Lname, Phone, Email)
VALUES
(1, 'John', 'Doe', '555-123-4567', 'john.doe@email.com'),
(2, 'Jane', 'Smith', '555-987-6543', 'jane.smith@email.com'),
(3, 'Bob', 'Johnson', '555-555-5555', 'bob.johnson@email.com'),
(4, 'Alice', 'Brown', '555-111-2222', 'alice.brown@email.com'),
(5, 'Chris', 'Davis', '555-888-9999', 'chris.davis@email.com'),
(6, 'Emily', 'White', '555-777-1234', 'emily.white@email.com'),
(7, 'Michael', 'Lee', '555-333-4444', 'michael.lee@email.com'),
(8, 'Sarah', 'Hall', '555-222-3333', 'sarah.hall@email.com'),
(9, 'David', 'Turner', '555-999-8888', 'david.turner@email.com'),
(10, 'Laura', 'Miller', '555-666-7777', 'laura.miller@email.com');


INSERT INTO Vehicle (Make, Model, Year, CustomerID)
VALUES
('Toyota', 'Camry', 2018, 6),
('Ford', 'F-150', 2020, 9),
('Honda', 'Civic', 2019, 10),
('Chevrolet', 'Malibu', 2017, 5),
('Nissan', 'Altima', 2018, 4),
('Hyundai', 'Sonata', 2020, 1),
('Kia', 'Sportage', 2019, 2),
('Toyota', 'Hilux', 2011, 7),
('Volkswagen', 'Golf', 2023, 4),
('Mitsubishi', 'L200', 2019, 5),
('Subaru', 'Outback', 2017, 8),
('BMW', 'X5', 2021, 2),
('Mercedes', 'C-Class', 2020, 3);


INSERT INTO Mechanic (Fname, Lname, Phone)
VALUES
('Mark', 'Smith', '555-111-2233'),
('Lisa', 'Johnson', '555-444-5566'),
('Robert', 'Davis', '555-777-8899'),
('Mary', 'Brown', '555-222-3344');


INSERT INTO Appointment (CustomerID, VehicleID, ServiceDate, MechanicID)
VALUES
(6, 1, '2023-09-01', 1),
(4, 5, '2023-09-02', 2),
(10, 3, '2023-09-03', 3),
(5, 4, '2023-09-04', 4),
(4, 9, '2023-09-04', 1),
(1, 6, '2023-09-04', 2),
(7, 8, '2023-09-07', 3),
(8, 11, '2023-09-07', 4),
(2, 7, '2023-09-09', 1),
(3, 13, '2023-09-10', 2),
(2, 12, '2023-09-13', 3),
(10, 3, '2023-09-13', 4),
(4, 5, '2023-09-13', 1),
(8, 11, '2023-09-14', 2),
(5, 4, '2023-09-15', 3),
(6, 1, '2023-09-16', 4),
(7, 4, '2023-09-17', 1),
(8,11, '2023-09-17', 2),
(9, 2, '2023-09-17', 3),
(4, 9, '2023-09-20', 4),
(2, 7, '2023-09-20', 1),
(7, 8, '2023-09-22', 2),
(6, 1, '2023-09-22', 2),
(4, 5, '2023-09-22', 3),
(10, 3, '2023-09-28', 1),
(5, 4, '2023-09-30', 1),
(4, 9, '2023-10-05', 1),
(8, 11, '2023-10-07', 3),
(5, 4, '2023-10-07', 1),
(6, 1, '2023-10-07', 2),
(7, 4, '2023-10-07', 1),
(8, 11, '2023-10-07', 4);



SELECT AppointmentID, c.Fname, c.Lname,v.Make, v.Model, ServiceDate, m.Fname FROM Appointment a 
	JOIN Customer c on a.CustomerID = c.CustomerID 
    JOIN Vehicle v on a.VehicleID = v.VehicleID 
    JOIN Mechanic m on a.MechanicID = m.MechanicID
    WHERE c.CustomerID = 5
    ORDER BY AppointmentID;



INSERT INTO ServiceRecord (VehicleID, ServiceDate, Description, TotalCost, MechanicID)
VALUES
(2, '2023-08-15', 'Oil Change', 50.00,1),
(1, '2023-08-16', 'Brake Inspection', 75.00,2),
(6, '2023-08-17', 'Transmission Service', 120.00,3),
(4, '2023-08-18', 'Tire Rotation', 40.00,4),
(5, '2023-08-19', 'Engine Diagnostic', 60.00,1),
(7, '2023-08-20', 'AC System Repair', 200.00,2),
(7, '2023-08-21', 'Suspension Alignment', 80.00,2),
(8, '2023-08-22', 'Spark Plug Replacement', 45.00,4),
(9, '2023-08-23', 'Battery Replacement', 90.00,4),
(12, '2023-08-24', 'Brake Pad Replacement', 110.00,1),
(11, '2023-08-25', 'Oil Change', 50.00,1),
(12, '2023-08-26', 'Brake Inspection', 75.00,3),
(13, '2023-08-27', 'Transmission Service', 120.00,2),
(1, '2023-08-28', 'Tire Rotation', 40.00,2),
(2, '2023-08-29', 'Engine Diagnostic', 60.00,4),
(8, '2023-08-30', 'AC System Repair', 200.00,3),
(8, '2023-08-31', 'Suspension Alignment', 80.00,3),
(8, '2023-09-01', 'Spark Plug Replacement', 45.00,3),
(6, '2023-09-02', 'Battery Replacement', 90.00,1),
(7, '2023-09-03', 'Brake Pad Replacement', 110.00,2),
(8, '2023-09-04', 'Oil Change', 50.00,1),
(3, '2023-09-05', 'Brake Inspection', 75.00,3),
(10, '2023-09-06', 'Transmission Service', 120.00,4),
(11, '2023-09-07', 'Tire Rotation', 40.00,4),
(12, '2023-09-08', 'Engine Diagnostic', 60.00,1),
(13, '2023-09-09', 'AC System Repair', 200.00,4),
(1, '2023-09-10', 'Suspension Alignment', 80.00,2),
(2, '2023-09-11', 'Spark Plug Replacement', 45.00,1),
(3, '2023-09-12', 'Battery Replacement', 90.00,2),
(4, '2023-09-13', 'Brake Pad Replacement', 110.00,3),
(9, '2023-09-14', 'Transmission Overhaul', 500.00,1),
(6, '2023-09-15', 'Engine Rebuild', 700.00,4),
(7, '2023-09-16', 'Major Suspension Work', 350.00,4),
(9, '2023-09-17', 'Complete Brake System', 400.00,4),
(9, '2023-09-18', 'Transmission Rebuild', 550.00,4),
(9, '2023-09-19', 'Engine Replacement', 800.00,4),
(11, '2023-09-20', 'Full Exhaust System', 300.00,1),
(12, '2023-09-21', 'Electrical Repairs', 250.00,2),
(3, '2023-09-22', 'Fuel System Service', 180.00,1),
(5, '2023-09-23', 'AC System Recharge', 120.00,3);



INSERT INTO Part (Name, Description, Price)
VALUES
('Oil Filter', 'High-quality oil filter for engine', 9.99),
('Brake Pads', 'Front brake pads for various vehicles', 39.99),
('Transmission Fluid', 'Synthetic transmission fluid', 19.99),
('Tire', 'All-season tire for passenger vehicles', 79.99),
('Spark Plugs', 'Spark plugs for improved ignition', 7.99),
('Battery', '12V car battery with high cranking power', 89.99),
('Suspension Kit', 'Complete suspension kit for smoother ride', 199.99),
('Air Filter', 'Replacement air filter for clean airflow', 12.99),
('Alternator', 'Alternator for electrical charging', 59.99),
('Exhaust System', 'Performance exhaust system for cars', 299.99),
('Radiator', 'High-efficiency radiator for cooling', 49.99),
('Fuel Pump', 'Fuel pump assembly for consistent flow', 29.99),
('Wheel Bearing', 'Front wheel bearing kit', 18.99),
('Headlight Bulb', 'Halogen headlight bulb for better visibility', 6.99),
('Power Steering Pump', 'Power steering pump for easy steering', 54.99),
('Brake Rotors', 'Front brake rotors for improved braking', 34.99),
('Cabin Air Filter', 'Cabin air filter for clean interior air', 14.99),
('Thermostat', 'Engine thermostat for temperature control', 8.99),
('Serpentine Belt', 'Serpentine belt for multiple accessories', 19.99),
('Oxygen Sensor', 'Oxygen sensor for improved fuel efficiency', 24.99);



INSERT INTO Inventory (PartID, Quantity)
VALUES
(1, 100),
(2, 50),
(3, 75),
(4, 120),
(5, 200),
(6, 80),
(7, 30),
(8, 150),
(9, 60),
(10, 25),
(11, 90),
(12, 40),
(13, 70),
(14, 180),
(15, 95),
(16, 55),
(17, 110),
(18, 85),
(19, 45),
(20, 70);



INSERT INTO ServiceRecordPart (ServiceRecordID, PartID, Quantity)
VALUES
(1, 1, 1),
(3, 5, 1),
(2, 2, 1),
(5, 4, 2),
(4, 3, 1),
(8, 6, 1),
(7, 7, 1),
(6, 12, 2),
(11, 9, 1),
(9, 10, 4),
(10, 15, 2),
(12, 14, 1),
(13, 13, 3),
(14, 12, 1),
(17, 11, 1),
(18, 16, 5),
(16, 17, 1),
(15, 18, 1),
(22, 19, 1),
(21, 20, 3),
(19, 8, 1),
(27, 9, 1),
(26, 10, 2),
(25, 11, 1),
(24, 12, 1),
(23, 13, 1),
(30, 14, 6),
(29, 2, 1),
(28, 18, 1),
(35, 4, 1),
(34, 5, 4),
(33, 17, 1),
(32, 1, 1),
(31, 4, 4),
(37, 12, 1),
(36, 17, 1),
(40, 20, 2),
(39, 5, 2),
(38, 2, 1),
(22,15,1);

