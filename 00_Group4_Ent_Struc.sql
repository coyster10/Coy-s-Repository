USE [master]
GO
CREATE DATABASE [Entertainment]

GO

USE Entertainment

GO

CREATE TABLE Agents(
	AgentID NVARCHAR(8) NOT NULL PRIMARY KEY,
	AgentFirstName NVARCHAR(50) NOT NULL,
	AgentLastName NVARCHAR(50) NOT NULL,
	AgentStreetAddress NVARCHAR(50) NOT NULL,
	AgentCity NVARCHAR(50) NOT NULL,
	AgentState NVARCHAR (2) NOT NULL,
	AgentZipCode DECIMAL(10) NOT NULL,
	AgentPhoneNumber NVARCHAR (10) NOT NULL,
	DateHired DATETIME ,
	Salary MONEY NOT NULL,
	CommissionRate DECIMAL (7,2) NOT NULL);


CREATE TABLE Performers(
	MemberID NVARCHAR(8) NOT NULL PRIMARY KEY,
	MemberFirstName NVARCHAR(50) NOT NULL, 
	MemberLastName NVARCHAR(50) NOT NULL,
	MemberPhoneNumber NVARCHAR(10) NOT NULL,
	MemberGender NVARCHAR(1) NOT NULL );


CREATE TABLE Customers(
	CustomerID NVARCHAR(8) NOT NULL PRIMARY KEY,
	CustomerFirstName NVARCHAR(50) NOT NULL,
	CustomerLastName NVARCHAR(50) NOT NULL,
	CustomerStreetAddress NVARCHAR(50) NOT NULL,
	CustomerCity NVARCHAR(50) NOT NULL,
	CustomerState NVARCHAR(2) NOT NULL,
	CustomerZipCode DECIMAL(10) NOT NULL,
	CustomerPhoneNumber NVARCHAR(10) NOT NULL );


CREATE TABLE Groups(
	GroupID NVARCHAR(8) NOT NULL PRIMARY KEY,
	StageName NVARCHAR(50) NOT NULL,
	SSN NVARCHAR(11) NOT NULL,
	GroupStreetAddress NVARCHAR (50) NOT NULL,
	GroupCity NVARCHAR(50) NOT NULL,
	GroupState NVARCHAR(2) NOT NULL,
	GroupZipCode DECIMAL(10) NOT NULL,
	GroupPhoneNumber NVARCHAR(10) NOT NULL,
	GroupPage NVARCHAR(50) NULL,
	GroupEmail NVARCHAR(50) NULL,
	DateEntered DATETIME  NOT NULL );

CREATE TABLE Musical_Style(
	StyleNameID NVARCHAR(8) NOT NULL PRIMARY KEY,
	StyleName NVARCHAR(50) NOT NULL );
	
CREATE TABLE Group_Members(
	GroupID NVARCHAR(8) 
	REFERENCES Groups(GroupID),
	MemberID NVARCHAR(8)
	REFERENCES Performers(MemberID),
	Status DECIMAL(1) NOT NULL );

CREATE TABLE Group_By_Style(
	StyleNameID NVARCHAR(8) 
	REFERENCES Musical_Style(StyleNameID),
	GroupID NVARCHAR(8) 
	REFERENCES Groups(GroupID),
	StyleStrength DECIMAL(1) NOT NULL );

CREATE TABLE Musical_Preferences(
	StyleNameID NVARCHAR(8) 
	REFERENCES Musical_Style(StyleNameID),
	CustomerID NVARCHAR(8) 
	REFERENCES Customers(CustomerID),
	PreferenceRating DECIMAL(1) NOT NULL );


CREATE TABLE Engagements(
	EngagementNumber DECIMAL(8) NOT NULL PRIMARY KEY,
	StartDate DATETIME  NOT NULL,
	EndDate DATETIME  NOT NULL,
	StartTime DATETIME  NOT NULL,
	StopTime DATETIME  NOT NULL,
	ContractPrice MONEY  NOT NULL,
	CustomerID NVARCHAR (8) NOT NULL
	REFERENCES Customers(CustomerID),
	AgentID NVARCHAR (8) 
	REFERENCES Agents(AgentID),
	GroupID NVARCHAR (8) 
	REFERENCES Groups(GroupID));

ALTER TABLE [Engagements] DROP CONSTRAINT FK__Engagemen__Agent__37A5467C
ALTER TABLE [Engagements] DROP CONSTRAINT FK__Engagemen__Custo__36B12243
ALTER TABLE [Engagements] DROP CONSTRAINT FK__Engagemen__Group__38996AB5
ALTER TABLE [Engagements] ADD CONSTRAINT FK__Engagemen__Agent__37A5467C FOREIGN KEY(AgentID) REFERENCES Agents (AgentID) ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE [Engagements] ADD CONSTRAINT FK__Engagemen__Custo__36B12243 FOREIGN KEY(CustomerID) REFERENCES Customers (CustomerID) ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE [Engagements] ADD CONSTRAINT FK__Engagemen__Group__38996AB5 FOREIGN KEY(GroupID) REFERENCES Groups (GroupID) ON DELETE CASCADE ON UPDATE CASCADE

ALTER TABLE [Group_By_Style] DROP CONSTRAINT FK__Group_By___Group__30F848ED
ALTER TABLE [Group_By_Style] DROP CONSTRAINT FK__Group_By___Style__300424B4
ALTER TABLE [Group_By_Style] ADD CONSTRAINT FK__Group_By___Group__30F848ED FOREIGN KEY(GroupID) REFERENCES Groups (GroupID) ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE [Group_By_Style] ADD CONSTRAINT FK__Group_By___Style__300424B4 FOREIGN KEY(StyleNameID) REFERENCES Musical_Style (StyleNameID) ON DELETE CASCADE ON UPDATE CASCADE

ALTER TABLE [Group_Members] DROP CONSTRAINT FK__Group_Mem__Group__2D27B809
ALTER TABLE [Group_Members] DROP CONSTRAINT FK__Group_Mem__Membe__2E1BDC42
ALTER TABLE [Group_Members] ADD CONSTRAINT FK__Group_Mem__Group__2D27B809 FOREIGN KEY(GroupID) REFERENCES Groups (GroupID) ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE [Group_Members] ADD CONSTRAINT FK__Group_Mem__Membe__2E1BDC42 FOREIGN KEY(MemberID) REFERENCES Performers (MemberID) ON DELETE CASCADE ON UPDATE CASCADE

ALTER TABLE [Musical_Preferences] DROP CONSTRAINT FK__Musical_P__Custo__33D4B598
ALTER TABLE [Musical_Preferences] DROP CONSTRAINT FK__Musical_P__Style__32E0915F
ALTER TABLE [Musical_Preferences] ADD CONSTRAINT FK__Musical_P__Custo__33D4B598 FOREIGN KEY(CustomerID) REFERENCES Customers (CustomerID) ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE [Musical_Preferences] ADD CONSTRAINT FK__Musical_P__Style__32E0915F FOREIGN KEY(StyleNameID) REFERENCES Musical_Style (StyleNameID) ON DELETE CASCADE ON UPDATE CASCADE

GO
