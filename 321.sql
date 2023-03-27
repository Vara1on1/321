USE [master]
GO
/****** Object:  Database [PcAcc]    Script Date: 27.03.2023 10:59:33 ******/
CREATE DATABASE [PcAcc]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PcAcc', FILENAME = N'C:\Users\311-5(student)\PcAcc.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PcAcc_log', FILENAME = N'C:\Users\311-5(student)\PcAcc_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PcAcc] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PcAcc].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PcAcc] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PcAcc] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PcAcc] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PcAcc] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PcAcc] SET ARITHABORT OFF 
GO
ALTER DATABASE [PcAcc] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PcAcc] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PcAcc] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PcAcc] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PcAcc] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PcAcc] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PcAcc] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PcAcc] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PcAcc] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PcAcc] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PcAcc] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PcAcc] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PcAcc] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PcAcc] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PcAcc] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PcAcc] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PcAcc] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PcAcc] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PcAcc] SET  MULTI_USER 
GO
ALTER DATABASE [PcAcc] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PcAcc] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PcAcc] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PcAcc] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PcAcc] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PcAcc] SET QUERY_STORE = OFF
GO
USE [PcAcc]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [PcAcc]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 27.03.2023 10:59:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[Clients_name] [nchar](10) NOT NULL,
	[Clients_Password] [nchar](10) NULL,
	[ClientsRole] [int] NULL,
	[idClients] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[idClients] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 27.03.2023 10:59:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Orders_id] [int] NOT NULL,
	[Orders_date] [nchar](10) NULL,
	[OrdersStatus] [nchar](10) NULL,
	[ClientsId] [int] NULL,
	[IdWorkers] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Orders_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 27.03.2023 10:59:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[IdProduct] [int] NOT NULL,
	[Dicriptions] [nvarchar](50) NULL,
	[Price] [nvarchar](50) NULL,
	[NameProduct] [nvarchar](50) NULL,
	[TypeIdFk] [int] NULL,
	[Articul] [varchar](50) NULL,
 CONSTRAINT [PK_PcAccess] PRIMARY KEY CLUSTERED 
(
	[IdProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductsSettings]    Script Date: 27.03.2023 10:59:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductsSettings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductIdFk] [int] NULL,
	[IdSetting] [int] NULL,
	[Value] [nvarchar](50) NULL,
 CONSTRAINT [PK_Settings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 27.03.2023 10:59:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[IdRole] [int] NOT NULL,
	[StatusRole] [nchar](10) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[IdRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Settings]    Script Date: 27.03.2023 10:59:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Settings](
	[IdSetting] [int] IDENTITY(1,1) NOT NULL,
	[NameSetting] [nvarchar](max) NULL,
 CONSTRAINT [PK_Settings_1] PRIMARY KEY CLUSTERED 
(
	[IdSetting] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeProduct]    Script Date: 27.03.2023 10:59:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeProduct](
	[IdType] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nchar](10) NOT NULL,
 CONSTRAINT [PK_TypeProduct] PRIMARY KEY CLUSTERED 
(
	[IdType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Workers]    Script Date: 27.03.2023 10:59:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Workers](
	[Workers_Name] [nvarchar](50) NOT NULL,
	[Workers_Exp] [nvarchar](50) NULL,
	[WorkersId] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Workers] PRIMARY KEY CLUSTERED 
(
	[WorkersId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF_Role_IdRole]  DEFAULT ((0)) FOR [IdRole]
GO
ALTER TABLE [dbo].[Clients]  WITH CHECK ADD  CONSTRAINT [FK_Clients_Role] FOREIGN KEY([ClientsRole])
REFERENCES [dbo].[Role] ([IdRole])
GO
ALTER TABLE [dbo].[Clients] CHECK CONSTRAINT [FK_Clients_Role]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Clients] FOREIGN KEY([ClientsId])
REFERENCES [dbo].[Clients] ([idClients])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Clients]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Workers1] FOREIGN KEY([IdWorkers])
REFERENCES [dbo].[Workers] ([WorkersId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Workers1]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_ProductsSettings_TypeProduct] FOREIGN KEY([TypeIdFk])
REFERENCES [dbo].[TypeProduct] ([IdType])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_ProductsSettings_TypeProduct]
GO
ALTER TABLE [dbo].[ProductsSettings]  WITH CHECK ADD  CONSTRAINT [FK_ProductsSettings_Settings] FOREIGN KEY([IdSetting])
REFERENCES [dbo].[Settings] ([IdSetting])
GO
ALTER TABLE [dbo].[ProductsSettings] CHECK CONSTRAINT [FK_ProductsSettings_Settings]
GO
ALTER TABLE [dbo].[ProductsSettings]  WITH CHECK ADD  CONSTRAINT [FK_Settings_ProductsSettings] FOREIGN KEY([ProductIdFk])
REFERENCES [dbo].[Products] ([IdProduct])
GO
ALTER TABLE [dbo].[ProductsSettings] CHECK CONSTRAINT [FK_Settings_ProductsSettings]
GO
USE [master]
GO
ALTER DATABASE [PcAcc] SET  READ_WRITE 
GO
