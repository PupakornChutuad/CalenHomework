USE [master]
GO
/****** Object:  Database [UPPart2]    Script Date: 4/4/2562 11:14:59 ******/
CREATE DATABASE [UPPart2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UPPart2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\UPPart2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'UPPart2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\UPPart2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [UPPart2] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UPPart2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UPPart2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UPPart2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UPPart2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UPPart2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UPPart2] SET ARITHABORT OFF 
GO
ALTER DATABASE [UPPart2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UPPart2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UPPart2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UPPart2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UPPart2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UPPart2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UPPart2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UPPart2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UPPart2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UPPart2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UPPart2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UPPart2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UPPart2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UPPart2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UPPart2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UPPart2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UPPart2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UPPart2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UPPart2] SET  MULTI_USER 
GO
ALTER DATABASE [UPPart2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UPPart2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UPPart2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UPPart2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [UPPart2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [UPPart2] SET QUERY_STORE = OFF
GO
USE [UPPart2]
GO
/****** Object:  Table [dbo].[File]    Script Date: 4/4/2562 11:14:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[File](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FilePath] [varchar](255) NULL,
	[Name] [varchar](max) NULL,
	[Day] [int] NULL,
	[Month] [int] NULL,
	[Year] [int] NULL,
 CONSTRAINT [PK_File] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[File] ON 

INSERT [dbo].[File] ([ID], [FilePath], [Name], [Day], [Month], [Year]) VALUES (1, N'Upload/933526d9-c398-4db7-b58b-745d2d16b24e.jpg', N'images.jpg', 3, 5, 2560)
INSERT [dbo].[File] ([ID], [FilePath], [Name], [Day], [Month], [Year]) VALUES (2, N'Upload/5c805ee5-c9db-47c3-842d-c380da9362bf.jpg', N'images.jpg', 3, 5, 2560)
INSERT [dbo].[File] ([ID], [FilePath], [Name], [Day], [Month], [Year]) VALUES (3, N'Upload/0014e6d7-75eb-42bf-ae4e-76b0ee554b5d.jpg', N'images.jpg', 3, 5, 2560)
INSERT [dbo].[File] ([ID], [FilePath], [Name], [Day], [Month], [Year]) VALUES (4, N'Upload/33fe27ae-6942-4dd0-aa4b-8112bf3c8a1b.jpg', N'Farm_Tour.jpg', 3, 4, 2562)
INSERT [dbo].[File] ([ID], [FilePath], [Name], [Day], [Month], [Year]) VALUES (5, N'Upload/bad942ae-a907-40f5-a12d-94a339c899d1.jpg', N'images.jpg', 3, 4, 2562)
INSERT [dbo].[File] ([ID], [FilePath], [Name], [Day], [Month], [Year]) VALUES (6, N'Upload/75d94967-6e54-431f-a86e-ec571f69e71a.jpg', N'images.jpg', 1, 1, 2557)
SET IDENTITY_INSERT [dbo].[File] OFF
/****** Object:  StoredProcedure [dbo].[CalendarDetail]    Script Date: 4/4/2562 11:15:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CalendarDetail]
	@day int,
	@month int,
	@year int
AS
BEGIN
	
	SET NOCOUNT ON;
	SELECT        FilePath, Name, Day, Month, Year, ID
FROM            [File]
WHERE        (Day = @day) AND (Month = @month) AND (Year = @year)
   
END
GO
/****** Object:  StoredProcedure [dbo].[InsertFile]    Script Date: 4/4/2562 11:15:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertFile]
	@Name varchar(MAX) ,
	@FilePath varChar(255),
	@day int ,
	@month int ,
	@year int 

AS
BEGIN
	
	SET NOCOUNT ON;
	INSERT        
	INTO [File](FilePath, Name, Day, Month, Year)
	VALUES  (@FilePath,@Name,@day,@month,@year)

  
END
GO
/****** Object:  StoredProcedure [dbo].[spCalendarByID]    Script Date: 4/4/2562 11:15:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCalendarByID]
	@id int 

AS
BEGIN

	SET NOCOUNT ON;
	SELECT         ID, title, Day, Month, Year
	FROM            Calendar
	WHERE        (ID = @id)
END
GO
USE [master]
GO
ALTER DATABASE [UPPart2] SET  READ_WRITE 
GO
