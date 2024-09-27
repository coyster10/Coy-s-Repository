--1. Create an agent phone list
SELECT AgentFirstName+ AgentLastName AS AgentName, AgentPhoneNumber FROM Agents ORDER BY AgentName ASC;

--2. Create a list of customers by city
SELECT CustomerFirstName+ CustomerLastName AS CustomerName, CustomerCity FROM Customers ORDER BY CustomerCity ASC;

--3. Create a list of when an agent received their first review (180 days after being hired)
SELECT AgentFirstName+AgentLastName AS AgentName, DATEADD(DAY, 180, DateHired)  AS FirstReview 
FROM Agents;

--4. Create a report of the net price per contract that lists our fee (contract price * our fee (12%)) and the net amount per contract (contract price - (contract price * our fee (12%)) 
SELECT EngagementNumber, ContractPrice *0.12 AS Fee, (ContractPrice-(ContractPrice*0.12)) AS NetAmount FROM Engagements;

--5. Create a report of all engagements that last more than 3 days
SELECT * FROM Engagements WHERE DATEDIFF(DAY, StartDate, EndDate) >3;

--6. Create a report of all October engagments that occured in 2017
SELECT EngagementNumber, StartDate, EndDate 
FROM Engagements
WHERE StartDate >= '2017-10-01' AND StartDate <= '2017-10-31'  
ORDER BY StartDate ASC;

--7. Create a report of all October engagements that occured between noon and five pm
SELECT AgentID, GroupID, CustomerID, EngagementNumber, StartDate, EndDate, StartTime, StopTime, ContractPrice 
FROM Engagements
WHERE StartDate >= '2017/10/01' AND StartDate <= '2017/10/31' AND StartTime >= '12:00'  AND StopTime <= '17:00'

--8. Create a list of all customers and the groups they have booked
SELECT DISTINCT Customers.CustomerID, CustomerFirstName + CustomerLastName AS CustomerName, StageName, Groups.GroupID
FROM Customers
FULL JOIN Engagements ON Customers.CustomerID = Engagements.CustomerID
FULL JOIN Groups ON Groups.GroupID = Engagements.GroupID
WHERE Groups.GroupID IS NOT NULL AND Customers.CustomerID IS NOT NULL 
ORDER BY Customers.CustomerID

--9. Create a list of all agents that have no contracts
SELECT DISTINCT Agents.AgentID, AgentFirstName + AgentLastName AS AgentName, AgentStreetAddress,	AgentCity,	AgentState,	AgentZipCode, AgentPhoneNumber, DateHired, Salary, CommissionRate
FROM Agents
FULL JOIN Engagements ON Agents.AgentID = Engagements.AgentID
WHERE Engagements.EngagementNumber IS NULL

--10. Create a list of all customers with no bookings
SELECT DISTINCT Customers.CustomerID, CustomerFirstName + CustomerLastName AS CustomerName, CustomerStreetAddress, CustomerCity, CustomerState, CustomerZipCode, CustomerPhoneNumber
FROM Customers
FULL JOIN Engagements ON Customers.CustomerID = Engagements.CustomerID
WHERE Engagements.EngagementNumber IS NULL
ORDER BY Customers.CustomerID

--11. Create a list of all performers that have never been booked
SELECT DISTINCT Performers.MemberID, MemberFirstName, MemberLastName, MemberPhoneNumber, MemberGender
FROM Performers
FULL JOIN Group_Members ON Group_Members.MemberID = Performers.MemberID
FULL JOIN Groups ON Groups.GroupID = Group_Members.GroupID
FULL JOIN Engagements ON Engagements.GroupID = Groups.GroupID
WHERE Engagements.EngagementNumber IS NULL
ORDER BY Performers.MemberID

--12. Create a list of each customers last booking 
SELECT Engagements.CustomerID, CustomerFirstName + CustomerLastName AS CustomerName, MAX(StartDate) AS LastBooked
FROM Customers
FULL JOIN Engagements ON Engagements.CustomerID = Customers.CustomerID
FULL JOIN Groups ON Groups.GroupID = Engagements.GroupID
WHERE Engagements.CustomerID IS NOT NULL
Group BY Engagements.CustomerID, CustomerFirstName, CustomerLastName

--13. Create a list of customers who like country or country rock
SELECT Customers.CustomerID, CustomerFirstName + CustomerLastName AS CustomerName, StyleName, PreferenceRating
FROM Customers
FULL JOIN Musical_Preferences ON Musical_Preferences.CustomerID = Customers.CustomerID
FULL JOIN Musical_Style ON Musical_Style.StyleNameID = Musical_Preferences.StyleNameID
WHERE StyleName = 'country' OR StyleName = 'country rock'
ORDER BY Customers.CustomerID

--14. Create a report of the number of engagements each group has performed for us
SELECT Engagements.GroupID, Groups.StageName, COUNT(EngagementNumber) AS Performances FROM Groups
INNER JOIN Engagements ON Groups.GroupID=Engagements.GroupID
GROUP BY Engagements.GroupID, Groups.StageName
ORDER BY Engagements.GroupID

--15. Create a report of the average agent salary
SELECT AgentID, AgentFirstName + AgentLastName AS AgentName, AVG(Salary) as AverageAgentSalary
FROM Agents
GROUP BY AgentID, AgentFirstName + AgentLastName, AgentLastName

--16. Show our earliest October engagment in 2017
SELECT TOP 1 MIN(StartDate) AS StarDate,  MIN(StartTime) AS EarliestOctEngagment, EngagementNumber
FROM Engagements 
WHERE MONTH(StartDate) = 10 AND DAY(StartDate) = 1
GROUP BY EngagementNumber

--17. Show the value of our October 2017 bookings
SELECT SUM(ContractPrice) AS ValueOfOctoberBookings
FROM Engagements 
WHERE MONTH(StartDate) = 10 OR MONTH(EndDate)=10 

--18. Create a report of our agent sales and commissions. Report should have agent full name, the total contract proce for that agent, and the earned commission for that agent
SELECT Agents.AgentID, AgentFirstName + AgentLastName AS AgentName, SUM(ContractPrice) AS TotalContractPrice, SUM(CommissionRate*ContractPrice) AS EarnedCommission  
FROM Agents
INNER JOIN Engagements ON Agents.AgentID=Engagements.AgentID
GROUP BY Agents.AgentID, AgentFirstName, AgentLastName,CommissionRate
ORDER BY Agents.AgentID

--19. Show only those agents who have a commission greater than $1000
SELECT AgentFirstName + AgentLastName AS AgentFullName, SUM(ContractPrice) AS TotalContractPrice, SUM(CommissionRate*ContractPrice) AS EarnedCommission  
FROM Agents
INNER JOIN Engagements ON Agents.AgentID=Engagements.AgentID
GROUP BY AgentFirstName, AgentLastName, CommissionRate
HAVING SUM(CommissionRate*ContractPrice) > 1000
ORDER BY AgentFirstName, AgentLastName

 
