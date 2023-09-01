USE car_garage;
-- Queries 

-- Selecionar clientes com modelos de carros anteriores ao ano de 2020.
SELECT CONCAT(Fname,' ',Lname) AS Name, Make, Model, Year FROM Customer c, Vehicle h 
	Where c.CustomerID = h.CustomerID AND Year < 2020 
    ORDER BY Year DESC;
    
-- Informações de mecânicos que realizaram mais de 10 serviços
SELECT m.MechanicID, Fname, Lname, Count(*) AS num_ervices FROM Mechanic m, ServiceRecord sr 
	WHERE m.MechanicID = sr.MechanicID 
    GROUP BY m.MechanicID
    HAVING Count(*) > 10;
    
    
-- Resumo dos serviços executados, com data, serviço, peças e total
SELECT c.Fname, v.Make, v.Model, sr.ServiceDate, sr.Description, p.Name, srp.Quantity, p.Price, sr.TotalCost FROM 
	Customer c, Vehicle v, ServiceRecord sr, ServiceRecordPart srp, Part p 
    WHERE c.CustomerID = v.CustomerID AND 
    v.VehicleID = sr.VehicleID AND 
    sr.ServiceRecordID = srp.ServiceRecordID AND
    srp.PartID = p.PartID
    ORDER BY ServiceDate;

-- Checagem de estoque com junção de tabelas estoque e peças
SELECT PartID, Name, Quantity, Description, Price FROM Inventory
	LEFT JOIN Part USING(PartID);
    


