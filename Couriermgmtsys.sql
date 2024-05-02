--task 1
CREATE DATABASE CourierManagementSystem
Use CourierManagementSystem
Create table usertb
(UserID INT identity(1,1) not null PRIMARY KEY,
Name VARCHAR(255),
Email VARCHAR(255) UNIQUE, 
Password VARCHAR(255),
ContactNumber VARCHAR(20),
Address TEXT
)   
create table Courier
(CourierID INT identity (1,1)PRIMARY KEY,
SenderName VARCHAR(255),
SenderAddress TEXT,
ReceiverName VARCHAR(255),
ReceiverAddress TEXT,
Weight DECIMAL(5, 2),
Status VARCHAR(50),
TrackingNumber VARCHAR(20) UNIQUE,
DeliveryDate DATE)
ALTER TABLE Courier add DeliveryDate DATE
select*from Courier
select *from Employee
alter table courier add employeeId int;

alter table courier add constraint FK_Courier_Employee
foreign key (employeeId) references employee(employeeId);

alter table courier add ServiceID int;

alter table courier add constraint FK_Courier_servicesid
foreign key (ServiceID) references CourierServices(ServiceID);

alter table courier add userID int

alter table courier add constraint FK_usertbsid
FOREIGN KEY(userid) REFERENCES usertb(userid) 



Create table CourierServices
(ServiceID INT identity(1,1) not null PRIMARY KEY,
ServiceName VARCHAR(100),
Cost DECIMAL(8, 2))

create table Employee
(EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
Name VARCHAR(255),
Email VARCHAR(255) UNIQUE,
ContactNumber VARCHAR(20),
Role VARCHAR(50),
Salary DECIMAL(10, 2))

create table Location 
(LocationID INT identity (1,1) PRIMARY KEY,
LocationName VARCHAR(100),
Address TEXT); 

create table Payment 
(PaymentID INT identity(1,1) PRIMARY KEY,
CourierID INT,
LocationId INT,
Amount DECIMAL(10, 2),
PaymentDate DATE,
FOREIGN KEY (CourierID) REFERENCES Courier(CourierID),
FOREIGN KEY (LocationID) REFERENCES Location(LocationID));
-- adding userid as foreign constraint
alter table payment add userId int;
alter table payment add constraint FK_Payment
foreign key (userId) references [user](userId);
select *from Payment
SELECT* from usertb


EXEC sp_rename 'iPayment','Payment'-- named table wrongly

select *from usertb
insert into usertb values ('hari','ha@mail','qwe',123,'aqw')
insert into usertb values('reena','ra@mail','rwe',123,'rqw'),
('tony','ta@mail','twe',123,'tqw')
insert into usertb values ('john','jha@mail','tew',234,'tew')

--ALTER TABLE Courier
--DROP COLUMN deliverydate

SELECT* from Courier
insert into Courier values ('hari','qwe', 'rani','asd',2.1,'sent',2,'2024-04-26')
insert into Courier values ('vari','twe', 'teni','wsd',25,'out to deliver',3,'2024-04-28'),
('rory','ryt', 'reena','rqw',10,'delivered',4,'2024-04-27')
insert into Courier values( 'meena','yht','tina','ght',50,'delivered',6,'2024-04-29')
insert into Courier values( 'john doe','jkt','rana','pot',100,'sent',10,'2024-04-29')
insert into Courier values( 'john','jlt','paina','pkl',150,'out to deliver',8,'2024-04-30')
insert into Courier values ('hari','qwe', 'rani','asd',210,'sent',19,'2024-04-26',3,5)

insert into Courier values ('hari','qwe', 'rana','pot',100,'sent',9,'2024-04-29',4,4)


SELECT * from CourierServices
insert into CourierServices values('receive and deliver',$50)
insert into CourierServices values ('only delivery',$30),
('receive pack and deliver',$70)
insert into CourierServices values('express shipping',$500),
('express shipping outside country',$1000)


SELECT* from Employee
insert into Employee values('karim','wemail', 123, 'db admin',200000),
('mariam','eemail', 673, 'delivery person',20000),
('kiran','puemail', 1183, 'reception',15000)
insert into Employee values('ryan','hwjhjemail',7867,'manager',300000)

SELECT* from Location
insert into Location values('chennai','asd'),
('mumbai','wsd'),
('pune','rqw')
insert into [Location]values('chennai','asd')
--DELETE FROM [Location] WHERE LocationID between 4 and 9

SELECT* from Payment
alter TABLE payment
drop COLUMN paymentDate 
insert into Payment values(1,1,50,'2024-04-26'),
(2,2,70,'2024-04-28'),
(3,3,30,'2024-04-27')






 
 --task 2

-- 1. List all customers:
select * from usertb
select name from usertb

--2. List all orders for a specific customer:
SELECT * FROM Courier WHERE SenderName = 'hari'

--3. List all couriers:
SELECT* from Courier
--4. List all packages for a specific order:
SELECT * from courier 
SELECT * FROM Courier WHERE TrackingNumber = '2'

--5. List all deliveries for a specific courier:
SELECT * FROM Courier WHERE CourierID = '2'

--6. List all undelivered packages:
SELECT * FROM Courier WHERE Status != 'Delivered'
--7. List all packages that are scheduled for delivery today:
SELECT * FROM Courier WHERE cast(DeliveryDate  as date)= cast(getdate() as date)--'2024-04-29' getdate()

--8. List all packages with a specific status:
SELECT * FROM Courier WHERE Status = 'sent';

--9. Calculate the total number of packages for each courier.
SELECT CourierServices.ServiceID,CourierServices.ServiceName,
COUNT(Courier.CourierID) AS TotalCouriers
FROM  CourierServices
JOIN Courier ON CourierServices.ServiceID = Courier.ServiceID
GROUP BY CourierServices.ServiceID, CourierServices.ServiceName;
--10. Find the average delivery time for each courier
select c.courierID, AVG(DATEDIFF(DAY, P.PaymentDate, C.DeliveryDate)) AS AverageDelivery from Courier C
join Payment P on C.CourierID = P.CourierID
group by C.CourierID;
--11. List all packages with a specific weight range:
select * from courier 
where weight between 1 and 20;
--12. Retrieve employees whose names contain 'John'
select * from [usertb] 
where [Name] like '%John%'; 

--13. Retrieve all courier records with payments greater than $50. 
select courierid, amount from Payment where amount>50

--Task 3: GroupBy, Aggregate Functions, Having, Order By, where

--14. Find the total number of couriers handled by each employee. doubt add data
select e.employeeId,count(courierId) as totalCouriers from courier c 
join employee e 
on c.employeeId=e.employeeId 
group by e.employeeId;

--15. Calculate the total revenue generated by each location
SELECT LocationID, SUM(Amount) AS TotalRevenue
FROM Payment
GROUP BY LocationID;
--16. Find the total number of couriers delivered to each location.
select l.LocationName, COUNT(c.CourierID) AS TotalCouriersDelivered from Location l
join payment p
on l.LocationID = p.LocationId
join Courier c on p.CourierID=c.CourierID
where c.Status = 'delivered'
group by l.LocationID,l.LocationName;
--17. Find the courier with the highest average delivery time:
select top 1 c.courierID, AVG(DATEDIFF(DAY, P.PaymentDate, C.DeliveryDate)) AS AverageDelivery from Courier C
join Payment P on C.CourierID = P.CourierID
group by C.CourierID 
order by AverageDelivery desc;

--18. Find Locations with Total Payments Less Than a Certain Amount
select l.LocationID,l.LocationName, SUM(Amount) as TotalPayments from Payment p
join [LOCATION] l 
on l.LocationID=p.locationId
group by l.LocationID ,l.LocationName
having SUM(Amount) < 70;

--19. Calculate Total Payments per Location

select l.LocationID,l.LocationName, SUM(Amount) as TotalPayments from Payment p
join [LOCATION] l 
on l.LocationID=p.locationId
group by l.LocationID ,l.LocationName
having SUM(Amount) < 780;


--20. Retrieve couriers who have received payments totaling more than $1000 in a specific location (LocationID = X): add value
SELECT CourierID
FROM Payment
WHERE LocationID = 4
GROUP BY CourierID
HAVING SUM(Amount) >1000;


--21. Retrieve couriers who have received payments totaling more than $50 after a certain date (PaymentDate > 'YYYY-MM-DD'):
select CourierID from Payment
where PaymentDate > '2024-04-26'
group by CourierID
having SUM(Amount) > 50;
--22. Retrieve locations where the total amount received is more than $20 before a certain date (PaymentDate > 'YYYY-MM-DD') 
select LocationID
from Payment
where PaymentDate > '2024-04-29'
group by LocationID
having SUM(Amount) > 20;

--Task 4: Inner Join,Full Outer Join, Cross Join, Left Outer Join,Right Outer Join

--23. Retrieve Payments with Courier Information
select * from payment p 
join courier c 
on p.courierId = c.courierId;

--24. Retrieve Payments with Location Information
select * from payment p 
join [Location]l 
on p.courierId = l.LocationID;
--25. Retrieve Payments with Courier and Location Information
select * from payment p 
join location l 
on p.locationId = l.locationId 
join courier c 
on p.CourierID = l.LocationID;

--26. List all payments with courier details
select * from payment p 
join courier c 
on p.courierId = c.courierId;
--27. Total payments received for each courier
SELECT CourierID, SUM(Amount) AS TotalPaymentsReceived
FROM Payment
GROUP BY CourierID;

--28. List payments made on a specific date 

SELECT *
FROM Payment
WHERE PaymentDate = '2024-04-26'
 
 --29. Get Courier Information for Each Payment
 SELECT *
FROM Payment P
left join Courier C ON P.CourierID = C.CourierID;
--30. Get Payment Details with Location
SELECT *
FROM Payment P
LEFT JOIN Location L ON P.LocationID = L.LocationID;



--31. Calculating Total Payments for Each Courier
SELECT CourierID, SUM(Amount) AS TotalPayments
FROM Payment
GROUP BY CourierID;

--32. List Payments Within a Date Range
SELECT * FROM Payment
WHERE PaymentDate BETWEEN '2024-04-26' AND '2024-04-29';

--33. Retrieve a list of all users and their corresponding courier records, including cases where there are no matches on either side
select * from [usertb] u  full outer join courier c 
on u.[Name] = c.SenderName;

--34. Retrieve a list of all couriers and their corresponding services, including cases where there are no matches on either side
SELECT *FROM usertb
FULL OUTER JOIN CourierServices ON usertb.UserID = CourierServices.ServiceID;

--35. Retrieve a list of all employees and their corresponding payments, including cases where there are no matches on either side
select Employeeid,name from Employee Ep --doubt
full outer join Payment p on ep.employeeId=p.paymentId
--36. List all users and all courier services, showing all possible combinations. 
select * from [usertb] u 
cross join courier c;

--37. List all employees and all locations, showing all possible combinations:
select * from employee 
cross join LOCATION;
--38. Retrieve a list of couriers and their corresponding sender information (if available)

select * from courier c
join [usertb] u 
on c.SenderName = u.[Name];


--39. Retrieve a list of couriers and their corresponding receiver information (if available):
select * from courier c
join [usertb] u 
on c.ReceiverName = u.[Name];
--40. Retrieve a list of couriers along with the courier service details (if available):
SELECT *
FROM Courier C left join CourierServices cs
ON C.ServiceID = CS.ServiceID;
select * from courier
select *from CourierServices
select* from Payment

--41. Retrieve a list of employees and the number of couriers assigned to each employee:
select e.[Name],c.courierId from employee e 
join Courier c
on e.EmployeeID = c.employeeId

--42. Retrieve a list of locations and the total payment amount received at each location:
select l.LocationID,l.LocationName, SUM(Amount) as TotalPayments from Payment p
join [LOCATION] l 
on l.LocationID=p.locationId
group by l.LocationID ,l.LocationName;

--43. Retrieve all couriers sent by the same sender (based on SenderName).

SELECT *
FROM Courier
WHERE SenderName IN (SELECT SenderName FROM Courier WHERE CourierID = CourierID);
--44. List all employees who share the same role.
select * , RANK() over (partition by [role] order by [Name]) as [Role] from EMPLOYEE;

--45. Retrieve all payments made for couriers sent from the same location.
select * from payment p 
join [location] l
on p.LocationId=l.LocationID
where LocationName = 'mumbai'

--46. Retrieve all couriers sent from the same location (based on SenderAddress). 
SELECT *
FROM Courier c1
JOIN Courier c2 ON cast(c1.SenderAddress as varchar) = cast(c2.SenderAddress as varchar)
WHERE c1.CourierID <> c2.CourierID





--47. List employees and the number of couriers they have delivered:
select * from employee e 
join courier c
on e.EmployeeID = c.employeeId
where [Status] = 'Delivered'

--48. Find couriers that were paid an amount greater than the cost of their respective courier services 
SELECT Courier.*
FROM Courier
JOIN Payment ON Courier.CourierID = Payment.CourierID
JOIN CourierServices ON Courier.ServiceID = CourierServices.ServiceID
WHERE Payment.Amount > CourierServices.Cost;


--49. Find couriers that have a weight greater than the average weight of all couriers
select * from courier where [weight] > (select avg(weight) from courier)

--50. Find the names of all employees who have a salary greater than the average salary:
select [Name] from employee where salary > (select Avg(Salary) from employee)

--51. Find the total cost of all courier services where the cost is less than the maximum cost 
SELECT SUM(Cost) AS TotalCost
FROM CourierServices
WHERE Cost < (SELECT MAX(Cost) FROM CourierServices)

--52. Find all couriers that have been paid for 
select * from courier c
join payment p
on c.CourierID = p.CourierID

--53. Find the locations where the maximum payment amount was made 
select top 1 LocationName,amount 
from [Location] l 
join PAYMENT p 
on p.LocationId = l.LocationID
order by Amount desc

--54. Find all couriers whose weight is greater than the weight of all couriers sent by a specific sender
select* from Courier
select max(weight) as MaxWeight from courier where SenderName = 'meena'






