﻿USE [master]
GO
/****** Object:  Database [Entertainment]    Script Date: 10/2/2021 9:07:34 PM ******/
CREATE DATABASE [Entertainment]
 GO

USE [Entertainment]

CREATE TABLE [dbo].[Agents](
	[AgentID] [varchar](8) NOT NULL,
	[AgentFirstName] [varchar](50) NOT NULL,
	[AgentLastName] [varchar](50) NOT NULL,
	[AgentStreetAddress] [varchar](50) NOT NULL,
	[AgentCity] [varchar](50) NOT NULL,
	[AgentState] [varchar](2) NOT NULL,
	[AgentZipCode] [varchar](10) NOT NULL,
	[AgentPhoneNumber] [varchar](10) NOT NULL,
	[DateHired] [date] NULL,
	[Salary] [money] NOT NULL,
	[CommissionRate] [decimal](5, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AgentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 10/2/2021 9:07:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [varchar](8) NOT NULL,
	[CustomerFirstName] [varchar](50) NOT NULL,
	[CustomerLastName] [varchar](50) NOT NULL,
	[CustomerStreetAddress] [varchar](50) NOT NULL,
	[CustomerCity] [varchar](50) NOT NULL,
	[CustomerState] [varchar](2) NOT NULL,
	[CustomerZipCode] [varchar](10) NOT NULL,
	[CustomerPhoneNumber] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Engagements]    Script Date: 10/2/2021 9:07:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Engagements](
	[EngagementNumber] [varchar](8) NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[StartTime] [time](0) NOT NULL,
	[StopTime] [time](0) NOT NULL,
	[ContractPrice] [money] NOT NULL,
	[CustomerID] [varchar](8) NULL,
	[AgentID] [varchar](8) NULL,
	[GroupID] [varchar](8) NULL,
PRIMARY KEY CLUSTERED 
(
	[EngagementNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group_By_Style]    Script Date: 10/2/2021 9:07:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group_By_Style](
	[StyleNameID] [varchar](8) NULL,
	[GroupID] [varchar](8) NULL,
	[StyleStrength] [decimal](1, 0) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group_Members]    Script Date: 10/2/2021 9:07:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group_Members](
	[GroupID] [varchar](8) NULL,
	[MemberID] [varchar](8) NULL,
	[Status] [decimal](1, 0) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 10/2/2021 9:07:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[GroupID] [varchar](8) NOT NULL,
	[StageName] [varchar](50) NOT NULL,
	[SSN] [varchar](11) NOT NULL,
	[GroupStreetAddress] [varchar](50) NOT NULL,
	[GroupCity] [varchar](50) NOT NULL,
	[GroupState] [varchar](2) NOT NULL,
	[GroupZipCode] [varchar](10) NOT NULL,
	[GroupPhoneNumber] [varchar](10) NOT NULL,
	[GroupPage] [varchar](50) NULL,
	[GroupEmail] [varchar](50) NULL,
	[DateEntered] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Musical_Preferences]    Script Date: 10/2/2021 9:07:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Musical_Preferences](
	[StyleNameID] [varchar](8) NULL,
	[CustomerID] [varchar](8) NULL,
	[PreferenceRating] [decimal](1, 0) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Musical_Style]    Script Date: 10/2/2021 9:07:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Musical_Style](
	[StyleNameID] [varchar](8) NOT NULL,
	[StyleName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StyleNameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Performers]    Script Date: 10/2/2021 9:07:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Performers](
	[MemberID] [varchar](8) NOT NULL,
	[MemberFirstName] [varchar](50) NOT NULL,
	[MemberLastName] [varchar](50) NOT NULL,
	[MemberPhoneNumber] [varchar](10) NOT NULL,
	[MemberGender] [varchar](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Engagements]  WITH CHECK ADD  CONSTRAINT [FK__Engagemen__Agent__37A5467C] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agents] ([AgentID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Engagements] CHECK CONSTRAINT [FK__Engagemen__Agent__37A5467C]
GO
ALTER TABLE [dbo].[Engagements]  WITH CHECK ADD  CONSTRAINT [FK__Engagemen__Custo__36B12243] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Engagements] CHECK CONSTRAINT [FK__Engagemen__Custo__36B12243]
GO
ALTER TABLE [dbo].[Engagements]  WITH CHECK ADD  CONSTRAINT [FK__Engagemen__Group__38996AB5] FOREIGN KEY([GroupID])
REFERENCES [dbo].[Groups] ([GroupID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Engagements] CHECK CONSTRAINT [FK__Engagemen__Group__38996AB5]
GO
ALTER TABLE [dbo].[Group_By_Style]  WITH CHECK ADD  CONSTRAINT [FK__Group_By___Group__30F848ED] FOREIGN KEY([GroupID])
REFERENCES [dbo].[Groups] ([GroupID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Group_By_Style] CHECK CONSTRAINT [FK__Group_By___Group__30F848ED]
GO
ALTER TABLE [dbo].[Group_By_Style]  WITH CHECK ADD  CONSTRAINT [FK__Group_By___Style__300424B4] FOREIGN KEY([StyleNameID])
REFERENCES [dbo].[Musical_Style] ([StyleNameID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Group_By_Style] CHECK CONSTRAINT [FK__Group_By___Style__300424B4]
GO
ALTER TABLE [dbo].[Group_Members]  WITH CHECK ADD  CONSTRAINT [FK__Group_Mem__Group__2D27B809] FOREIGN KEY([GroupID])
REFERENCES [dbo].[Groups] ([GroupID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Group_Members] CHECK CONSTRAINT [FK__Group_Mem__Group__2D27B809]
GO
ALTER TABLE [dbo].[Group_Members]  WITH CHECK ADD  CONSTRAINT [FK__Group_Mem__Membe__2E1BDC42] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Performers] ([MemberID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Group_Members] CHECK CONSTRAINT [FK__Group_Mem__Membe__2E1BDC42]
GO
ALTER TABLE [dbo].[Musical_Preferences]  WITH CHECK ADD  CONSTRAINT [FK__Musical_P__Custo__33D4B598] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Musical_Preferences] CHECK CONSTRAINT [FK__Musical_P__Custo__33D4B598]
GO
ALTER TABLE [dbo].[Musical_Preferences]  WITH CHECK ADD  CONSTRAINT [FK__Musical_P__Style__32E0915F] FOREIGN KEY([StyleNameID])
REFERENCES [dbo].[Musical_Style] ([StyleNameID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Musical_Preferences] CHECK CONSTRAINT [FK__Musical_P__Style__32E0915F]
GO
ALTER TABLE [dbo].[Agents]  WITH CHECK ADD CHECK  ((len([AgentPhoneNumber])=(8)))
GO
ALTER TABLE [dbo].[Agents]  WITH CHECK ADD CHECK  ((len([AgentZipCode])=(5)))
GO
ALTER TABLE [dbo].[Agents]  WITH CHECK ADD CHECK  (([CommissionRate]<=(100) OR [CommissionRate]>=(0)))
GO
ALTER TABLE [dbo].[Agents]  WITH CHECK ADD CHECK  (([Salary]>=(0)))
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD CHECK  ((len([CustomerZipCode])=(5)))
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD CHECK  ((len([CustomerPhoneNumber])=(8)))
GO
ALTER TABLE [dbo].[Engagements]  WITH CHECK ADD CHECK  (([ContractPrice]>=(0)))
GO
ALTER TABLE [dbo].[Group_By_Style]  WITH CHECK ADD CHECK  (([StyleStrength]=(1) OR [StyleStrength]<=(3)))
GO
ALTER TABLE [dbo].[Group_Members]  WITH CHECK ADD CHECK  (([Status]=(1) OR [Status]=(2)))
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD CHECK  ((len([GroupPhoneNumber])=(8)))
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD CHECK  ((len([GroupZipCode])=(5)))
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD CHECK  ((len([SSN])=(11)))
GO
ALTER TABLE [dbo].[Musical_Preferences]  WITH CHECK ADD CHECK  (([PreferenceRating]=(1) OR [PreferenceRating]<=(3)))
GO
ALTER TABLE [dbo].[Performers]  WITH CHECK ADD CHECK  ((len([MemberPhoneNumber])=(8)))
GO
ALTER TABLE [dbo].[Performers]  WITH CHECK ADD CHECK  (([MemberGender]='M' OR [MemberGender]='F'))
GO
USE [master]
GO
ALTER DATABASE [Entertainment] SET  READ_WRITE 
GO
