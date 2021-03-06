USE [master]
GO
/****** Object:  Database [Shirokov_Autoservice]    Script Date: 24.11.2021 21:00:27 ******/
CREATE DATABASE [Shirokov_Autoservice]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Shirokov_Autoservice', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER2019\MSSQL\DATA\Shirokov_Autoservice.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Shirokov_Autoservice_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER2019\MSSQL\DATA\Shirokov_Autoservice_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Shirokov_Autoservice] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Shirokov_Autoservice].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Shirokov_Autoservice] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Shirokov_Autoservice] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Shirokov_Autoservice] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Shirokov_Autoservice] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Shirokov_Autoservice] SET ARITHABORT OFF 
GO
ALTER DATABASE [Shirokov_Autoservice] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Shirokov_Autoservice] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Shirokov_Autoservice] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Shirokov_Autoservice] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Shirokov_Autoservice] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Shirokov_Autoservice] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Shirokov_Autoservice] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Shirokov_Autoservice] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Shirokov_Autoservice] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Shirokov_Autoservice] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Shirokov_Autoservice] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Shirokov_Autoservice] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Shirokov_Autoservice] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Shirokov_Autoservice] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Shirokov_Autoservice] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Shirokov_Autoservice] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Shirokov_Autoservice] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Shirokov_Autoservice] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Shirokov_Autoservice] SET  MULTI_USER 
GO
ALTER DATABASE [Shirokov_Autoservice] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Shirokov_Autoservice] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Shirokov_Autoservice] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Shirokov_Autoservice] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Shirokov_Autoservice] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Shirokov_Autoservice] SET QUERY_STORE = OFF
GO
USE [Shirokov_Autoservice]
GO
/****** Object:  Table [dbo].[AttachedProduct]    Script Date: 24.11.2021 21:00:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttachedProduct](
	[MainProductID] [int] NOT NULL,
	[AttachedProductID] [int] NOT NULL,
 CONSTRAINT [PK_AttachedProduct] PRIMARY KEY CLUSTERED 
(
	[MainProductID] ASC,
	[AttachedProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 24.11.2021 21:00:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Patromimic] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Birthday] [date] NOT NULL,
	[Email] [nvarchar](255) NULL,
	[RegistrationDate] [datetime2](7) NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GenderCode] [nchar](1) NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientService]    Script Date: 24.11.2021 21:00:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientService](
	[ID] [int] NOT NULL,
	[ClientID] [int] NOT NULL,
	[ServiceID] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[Comment] [nvarchar](max) NULL,
 CONSTRAINT [PK_ClientService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentBvService]    Script Date: 24.11.2021 21:00:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentBvService](
	[ID] [int] NOT NULL,
	[ClientServiceID] [int] NOT NULL,
	[DocumntPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_DocumentBvService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 24.11.2021 21:00:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[Code] [nchar](1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 24.11.2021 21:00:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[StartDate] [date] NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 24.11.2021 21:00:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Cost] [money] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[MainImagePath] [nvarchar](1000) NULL,
	[IsActive] [bit] NOT NULL,
	[ManufacturerId] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductPhoto]    Script Date: 24.11.2021 21:00:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductPhoto](
	[Id] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NULL,
 CONSTRAINT [PK_ProductPhoto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSale]    Script Date: 24.11.2021 21:00:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSale](
	[ID] [int] NOT NULL,
	[SaleDate] [datetime] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ClientServiceID] [int] NULL,
 CONSTRAINT [PK_ProductSale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 24.11.2021 21:00:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[Title] [nvarchar](100) NOT NULL,
	[MainImagePath] [nvarchar](1000) NULL,
	[DurationSecond] [nvarchar](50) NULL,
	[Cost] [money] NOT NULL,
	[Discount] [nvarchar](50) NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServicePhoto]    Script Date: 24.11.2021 21:00:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServicePhoto](
	[ID] [int] NOT NULL,
	[ServiceID] [int] NOT NULL,
	[Photopath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ServicePhoto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 24.11.2021 21:00:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[ID] [int] NOT NULL,
	[Title] [nvarchar](30) NOT NULL,
	[Color] [nchar](6) NOT NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagOFClient]    Script Date: 24.11.2021 21:00:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagOFClient](
	[ClientID] [int] NOT NULL,
	[TagID] [int] NOT NULL,
 CONSTRAINT [PK_TagOFClient] PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC,
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([FirstName], [LastName], [Patromimic], [Phone], [Birthday], [Email], [RegistrationDate], [ID], [GenderCode]) VALUES (N'Мишина', N'Иветта', N'Андреевна', N'7(3926)244-81-96 ', CAST(N'2002-10-05' AS Date), N'aukjan@yahoo.com', CAST(N'2016-01-24T00:00:00.0000000' AS DateTime2), 1, NULL)
INSERT [dbo].[Client] ([FirstName], [LastName], [Patromimic], [Phone], [Birthday], [Email], [RegistrationDate], [ID], [GenderCode]) VALUES (N'Медведев', N'Святослав', N'Юлианович', N'7(3520)435-21-20 ', CAST(N'1972-10-04' AS Date), N'hllam@comcast.net', CAST(N'2018-10-13T00:00:00.0000000' AS DateTime2), 2, NULL)
INSERT [dbo].[Client] ([FirstName], [LastName], [Patromimic], [Phone], [Birthday], [Email], [RegistrationDate], [ID], [GenderCode]) VALUES (N'Блохин', N'Пантелеймон', N'Феликсович', N'7(9524)556-48-98 ', CAST(N'1978-03-06' AS Date), N'balchen@comcast.net', CAST(N'2018-02-14T00:00:00.0000000' AS DateTime2), 3, NULL)
INSERT [dbo].[Client] ([FirstName], [LastName], [Patromimic], [Phone], [Birthday], [Email], [RegistrationDate], [ID], [GenderCode]) VALUES (N'Горбачёва', N'Никки', N'Еремеевна', N'7(94)789-69-20 ', CAST(N'1987-04-21' AS Date), N'chinthaka@att.net', CAST(N'2018-08-16T00:00:00.0000000' AS DateTime2), 4, NULL)
INSERT [dbo].[Client] ([FirstName], [LastName], [Patromimic], [Phone], [Birthday], [Email], [RegistrationDate], [ID], [GenderCode]) VALUES (N'Архипова', N'Прасковья', N'Валерьевна', N'7(86)540-10-21 ', CAST(N'1979-01-09' AS Date), N'cgcra@live.com', CAST(N'2018-07-23T00:00:00.0000000' AS DateTime2), 5, NULL)
INSERT [dbo].[Client] ([FirstName], [LastName], [Patromimic], [Phone], [Birthday], [Email], [RegistrationDate], [ID], [GenderCode]) VALUES (N'Суворова', N'Божена', N'Анатольевна', N'7(347)895-86-57 ', CAST(N'1981-03-09' AS Date), N'attwood@aol.com', CAST(N'2016-01-28T00:00:00.0000000' AS DateTime2), 6, NULL)
INSERT [dbo].[Client] ([FirstName], [LastName], [Patromimic], [Phone], [Birthday], [Email], [RegistrationDate], [ID], [GenderCode]) VALUES (N'Белозёрова', N'Диана', N'Антоновна', N'7(9900)174-59-87 ', CAST(N'1989-02-27' AS Date), N'dialworld@aol.com', CAST(N'2017-01-30T00:00:00.0000000' AS DateTime2), 7, NULL)
INSERT [dbo].[Client] ([FirstName], [LastName], [Patromimic], [Phone], [Birthday], [Email], [RegistrationDate], [ID], [GenderCode]) VALUES (N'Дементьева', N'Эдита', N'Онисимовна', N'7(198)922-28-76 ', CAST(N'1975-09-17' AS Date), N'frosal@hotmail.com', CAST(N'2018-11-24T00:00:00.0000000' AS DateTime2), 8, NULL)
INSERT [dbo].[Client] ([FirstName], [LastName], [Patromimic], [Phone], [Birthday], [Email], [RegistrationDate], [ID], [GenderCode]) VALUES (N'Блинов', N'Евгений', N'Мэлсович', N'7(0852)321-82-64 ', CAST(N'1994-01-05' AS Date), N'moxfulder@outlook.com', CAST(N'2017-05-07T00:00:00.0000000' AS DateTime2), 9, NULL)
INSERT [dbo].[Client] ([FirstName], [LastName], [Patromimic], [Phone], [Birthday], [Email], [RegistrationDate], [ID], [GenderCode]) VALUES (N'Морозов', N'Наум', N'Валерьянович', N'7(636)050-96-13 ', CAST(N'1985-07-04' AS Date), N'salesgeek@mac.com', CAST(N'2016-05-02T00:00:00.0000000' AS DateTime2), 10, NULL)
INSERT [dbo].[Client] ([FirstName], [LastName], [Patromimic], [Phone], [Birthday], [Email], [RegistrationDate], [ID], [GenderCode]) VALUES (N'Попова', N'Харита', N'Якуновна', N'7(335)386-81-06 ', CAST(N'1997-12-16' AS Date), N'firstpr@verizon.net', CAST(N'2016-07-05T00:00:00.0000000' AS DateTime2), 11, NULL)
INSERT [dbo].[Client] ([FirstName], [LastName], [Patromimic], [Phone], [Birthday], [Email], [RegistrationDate], [ID], [GenderCode]) VALUES (N'Крюков', N'Наум', N'Ильяович', N'7(81)657-88-92 ', CAST(N'1993-11-17' AS Date), N'floxy@hotmail.com', CAST(N'2017-02-01T00:00:00.0000000' AS DateTime2), 12, NULL)
INSERT [dbo].[Client] ([FirstName], [LastName], [Patromimic], [Phone], [Birthday], [Email], [RegistrationDate], [ID], [GenderCode]) VALUES (N'Крюкова', N'Авигея', N'Святославовна', N'7(499)318-88-53 ', CAST(N'2000-08-10' AS Date), N'simone@gmail.com', CAST(N'2018-01-03T00:00:00.0000000' AS DateTime2), 13, NULL)
INSERT [dbo].[Client] ([FirstName], [LastName], [Patromimic], [Phone], [Birthday], [Email], [RegistrationDate], [ID], [GenderCode]) VALUES (N'Беляева', N'Сабрина', N'Федосеевна', N'7(6580)534-32-58 ', CAST(N'1972-07-26' AS Date), N'agapow@gmail.com', CAST(N'2017-06-14T00:00:00.0000000' AS DateTime2), 14, NULL)
INSERT [dbo].[Client] ([FirstName], [LastName], [Patromimic], [Phone], [Birthday], [Email], [RegistrationDate], [ID], [GenderCode]) VALUES (N'Андреева', N'Патрисия', N'Валерьевна', N'7(9648)953-81-26 ', CAST(N'1993-11-18' AS Date), N'jigsaw@aol.com', CAST(N'2016-07-17T00:00:00.0000000' AS DateTime2), 15, NULL)
INSERT [dbo].[Client] ([FirstName], [LastName], [Patromimic], [Phone], [Birthday], [Email], [RegistrationDate], [ID], [GenderCode]) VALUES (N'Горшкова', N'Марта', N'Иосифовна', N'7(544)650-59-03 ', CAST(N'2001-02-13' AS Date), N'gbacon@mac.com', CAST(N'2016-08-04T00:00:00.0000000' AS DateTime2), 16, NULL)
INSERT [dbo].[Client] ([FirstName], [LastName], [Patromimic], [Phone], [Birthday], [Email], [RegistrationDate], [ID], [GenderCode]) VALUES (N'Орлова', N'Влада', N'Мартыновна', N'7(2506)433-38-35 ', CAST(N'1990-06-26' AS Date), N'rnelson@yahoo.ca', CAST(N'2016-03-21T00:00:00.0000000' AS DateTime2), 17, NULL)
INSERT [dbo].[Client] ([FirstName], [LastName], [Patromimic], [Phone], [Birthday], [Email], [RegistrationDate], [ID], [GenderCode]) VALUES (N'Ершов', N'Глеб', N'Федорович', N'7(2608)298-40-82 ', CAST(N'1970-06-14' AS Date), N'sjava@aol.com', CAST(N'2016-09-14T00:00:00.0000000' AS DateTime2), 18, NULL)
INSERT [dbo].[Client] ([FirstName], [LastName], [Patromimic], [Phone], [Birthday], [Email], [RegistrationDate], [ID], [GenderCode]) VALUES (N'Быкова', N'Тала', N'Георгьевна', N'7(13)915-53-53 ', CAST(N'2000-02-22' AS Date), N'ganter@optonline.net', CAST(N'2016-08-13T00:00:00.0000000' AS DateTime2), 19, NULL)
INSERT [dbo].[Client] ([FirstName], [LastName], [Patromimic], [Phone], [Birthday], [Email], [RegistrationDate], [ID], [GenderCode]) VALUES (N'Новиков', N'Адриан', N'Аркадьевич', N'7(70)572-33-62 ', CAST(N'1974-01-15' AS Date), N'multiplx@verizon.net', CAST(N'2018-11-23T00:00:00.0000000' AS DateTime2), 20, NULL)
INSERT [dbo].[Client] ([FirstName], [LastName], [Patromimic], [Phone], [Birthday], [Email], [RegistrationDate], [ID], [GenderCode]) VALUES (N'Филатов', N'Аристарх', N'Дмитриевич', N'7(696)235-29-24 ', CAST(N'1989-05-29' AS Date), N'hampton@att.net', CAST(N'2017-01-11T00:00:00.0000000' AS DateTime2), 21, NULL)
INSERT [dbo].[Client] ([FirstName], [LastName], [Patromimic], [Phone], [Birthday], [Email], [RegistrationDate], [ID], [GenderCode]) VALUES (N'Анисимова', N'Тамара', N'Витальевна', N'7(66)128-04-10 ', CAST(N'1988-06-16' AS Date), N'schwaang@mac.com', CAST(N'2016-02-25T00:00:00.0000000' AS DateTime2), 22, NULL)
INSERT [dbo].[Client] ([FirstName], [LastName], [Patromimic], [Phone], [Birthday], [Email], [RegistrationDate], [ID], [GenderCode]) VALUES (N'Кудряшов', N'Аверкий', N'Константинович', N'7(88)732-96-30 ', CAST(N'1991-07-26' AS Date), N'nanop@msn.com', CAST(N'2018-03-08T00:00:00.0000000' AS DateTime2), 23, NULL)
INSERT [dbo].[Client] ([FirstName], [LastName], [Patromimic], [Phone], [Birthday], [Email], [RegistrationDate], [ID], [GenderCode]) VALUES (N'Колобов', N'Орест', N'Юлианович', N'7(1680)508-58-26 ', CAST(N'2001-07-14' AS Date), N'parkes@verizon.net', CAST(N'2017-01-01T00:00:00.0000000' AS DateTime2), 24, NULL)
INSERT [dbo].[Client] ([FirstName], [LastName], [Patromimic], [Phone], [Birthday], [Email], [RegistrationDate], [ID], [GenderCode]) VALUES (N'Кузьмина', N'Дэнна', N'Витальевна', N'7(9940)977-45-73 ', CAST(N'1993-08-24' AS Date), N'nichoj@mac.com', CAST(N'2016-03-27T00:00:00.0000000' AS DateTime2), 25, NULL)
INSERT [dbo].[Client] ([FirstName], [LastName], [Patromimic], [Phone], [Birthday], [Email], [RegistrationDate], [ID], [GenderCode]) VALUES (N'Александров', N'Станислав', N'Эдуардович', N'7(18)164-05-12 ', CAST(N'1981-07-04' AS Date), N'bigmauler@aol.com', CAST(N'2018-11-08T00:00:00.0000000' AS DateTime2), 26, NULL)
INSERT [dbo].[Client] ([FirstName], [LastName], [Patromimic], [Phone], [Birthday], [Email], [RegistrationDate], [ID], [GenderCode]) VALUES (N'Андреев', N'Станислав', N'Максович', N'7(02)993-91-28 ', CAST(N'1975-10-10' AS Date), N'budinger@mac.com', CAST(N'2017-12-26T00:00:00.0000000' AS DateTime2), 27, NULL)
INSERT [dbo].[Client] ([FirstName], [LastName], [Patromimic], [Phone], [Birthday], [Email], [RegistrationDate], [ID], [GenderCode]) VALUES (N'Дроздов', N'Вольдемар', N'Артемович', N'7(307)456-99-05 ', CAST(N'1976-02-07' AS Date), N'smpeters@me.com', CAST(N'2017-07-18T00:00:00.0000000' AS DateTime2), 28, NULL)
INSERT [dbo].[Client] ([FirstName], [LastName], [Patromimic], [Phone], [Birthday], [Email], [RegistrationDate], [ID], [GenderCode]) VALUES (N'Абрамов', N'Станислав', N'Филатович', N'7(6545)478-87-79 ', CAST(N'1989-05-18' AS Date), N'solomon@att.net', CAST(N'2016-12-08T00:00:00.0000000' AS DateTime2), 29, NULL)
INSERT [dbo].[Client] ([FirstName], [LastName], [Patromimic], [Phone], [Birthday], [Email], [RegistrationDate], [ID], [GenderCode]) VALUES (N'Гусева', N'Роза', N'Дмитриевна', N'7(23)064-51-84 ', CAST(N'1999-02-13' AS Date), N'martyloo@live.com', CAST(N'2017-12-12T00:00:00.0000000' AS DateTime2), 30, NULL)
INSERT [dbo].[Client] ([FirstName], [LastName], [Patromimic], [Phone], [Birthday], [Email], [RegistrationDate], [ID], [GenderCode]) VALUES (N'Лазарев', N'Алексей', N'Богданович', N'7(0055)737-37-48 ', CAST(N'1977-03-10' AS Date), N'claesjac@me.com', CAST(N'2017-01-02T00:00:00.0000000' AS DateTime2), 31, NULL)
INSERT [dbo].[Client] ([FirstName], [LastName], [Patromimic], [Phone], [Birthday], [Email], [RegistrationDate], [ID], [GenderCode]) VALUES (N'Большаков', N'Вадим', N'Данилович', N'7(386)641-13-37 ', CAST(N'1970-05-15' AS Date), N'uncle@gmail.com', CAST(N'2018-08-04T00:00:00.0000000' AS DateTime2), 32, NULL)
INSERT [dbo].[Client] ([FirstName], [LastName], [Patromimic], [Phone], [Birthday], [Email], [RegistrationDate], [ID], [GenderCode]) VALUES (N'Ефремов', N'Витольд', N'Авксентьевич', N'7(93)922-14-03 ', CAST(N'1975-12-02' AS Date), N'kwilliams@yahoo.ca', CAST(N'2018-04-09T00:00:00.0000000' AS DateTime2), 33, NULL)
INSERT [dbo].[Client] ([FirstName], [LastName], [Patromimic], [Phone], [Birthday], [Email], [RegistrationDate], [ID], [GenderCode]) VALUES (N'Игнатов', N'Захар', N'Павлович', N'7(578)574-73-36 ', CAST(N'1998-10-07' AS Date), N'dieman@icloud.com', CAST(N'2017-11-10T00:00:00.0000000' AS DateTime2), 34, NULL)
INSERT [dbo].[Client] ([FirstName], [LastName], [Patromimic], [Phone], [Birthday], [Email], [RegistrationDate], [ID], [GenderCode]) VALUES (N'Калашников', N'Артур', N'Юрьевич', N'7(147)947-47-21 ', CAST(N'1972-12-13' AS Date), N'oevans@aol.com', CAST(N'2017-08-20T00:00:00.0000000' AS DateTime2), 35, NULL)
INSERT [dbo].[Client] ([FirstName], [LastName], [Patromimic], [Phone], [Birthday], [Email], [RegistrationDate], [ID], [GenderCode]) VALUES (N'Овчинникова', N'Лаура', N'Еремеевна', N'7(85)829-33-79 ', CAST(N'1992-04-03' AS Date), N'carcus@yahoo.ca', CAST(N'2018-11-24T00:00:00.0000000' AS DateTime2), 36, NULL)
INSERT [dbo].[Client] ([FirstName], [LastName], [Patromimic], [Phone], [Birthday], [Email], [RegistrationDate], [ID], [GenderCode]) VALUES (N'Голубев', N'Иосиф', N'Тимофеевич', N'7(78)972-73-11 ', CAST(N'1982-05-06' AS Date), N'smcnabb@att.net', CAST(N'2018-08-18T00:00:00.0000000' AS DateTime2), 37, NULL)
INSERT [dbo].[Client] ([FirstName], [LastName], [Patromimic], [Phone], [Birthday], [Email], [RegistrationDate], [ID], [GenderCode]) VALUES (N'Галкин', N'Эрик', N'Онисимович', N'7(759)873-77-39 ', CAST(N'1975-01-18' AS Date), N'snunez@verizon.net', CAST(N'2016-07-19T00:00:00.0000000' AS DateTime2), 38, NULL)
INSERT [dbo].[Client] ([FirstName], [LastName], [Patromimic], [Phone], [Birthday], [Email], [RegistrationDate], [ID], [GenderCode]) VALUES (N'Некрасов', N'Варлам', N'Михайлович', N'7(019)258-06-35 ', CAST(N'2000-11-12' AS Date), N'dogdude@verizon.net', CAST(N'2017-12-03T00:00:00.0000000' AS DateTime2), 39, NULL)
INSERT [dbo].[Client] ([FirstName], [LastName], [Patromimic], [Phone], [Birthday], [Email], [RegistrationDate], [ID], [GenderCode]) VALUES (N'Федотов', N'Осип', N'Анатольевич', N'7(590)702-33-06 ', CAST(N'1971-04-13' AS Date), N'breegster@hotmail.com', CAST(N'2018-07-23T00:00:00.0000000' AS DateTime2), 40, NULL)
INSERT [dbo].[Client] ([FirstName], [LastName], [Patromimic], [Phone], [Birthday], [Email], [RegistrationDate], [ID], [GenderCode]) VALUES (N'Смирнов', N'Мартын', N'Арсеньевич', N'7(6251)589-02-43 ', CAST(N'1996-06-25' AS Date), N'haddawy@live.com', CAST(N'2017-02-07T00:00:00.0000000' AS DateTime2), 41, NULL)
INSERT [dbo].[Client] ([FirstName], [LastName], [Patromimic], [Phone], [Birthday], [Email], [RegistrationDate], [ID], [GenderCode]) VALUES (N'Копылов', N'Касьян', N'Робертович', N'7(5774)679-82-06 ', CAST(N'1983-08-04' AS Date), N'crobles@sbcglobal.net', CAST(N'2018-03-18T00:00:00.0000000' AS DateTime2), 42, NULL)
INSERT [dbo].[Client] ([FirstName], [LastName], [Patromimic], [Phone], [Birthday], [Email], [RegistrationDate], [ID], [GenderCode]) VALUES (N'Дмитриева', N'Элина', N'Даниловна', N'7(787)140-48-84 ', CAST(N'1988-12-10' AS Date), N'vmalik@live.com', CAST(N'2017-02-11T00:00:00.0000000' AS DateTime2), 43, NULL)
INSERT [dbo].[Client] ([FirstName], [LastName], [Patromimic], [Phone], [Birthday], [Email], [RegistrationDate], [ID], [GenderCode]) VALUES (N'Бирюкова', N'Инара', N'Улебовна', N'7(098)346-50-58 ', CAST(N'1978-07-21' AS Date), N'smpeters@hotmail.com', CAST(N'2017-10-01T00:00:00.0000000' AS DateTime2), 44, NULL)
INSERT [dbo].[Client] ([FirstName], [LastName], [Patromimic], [Phone], [Birthday], [Email], [RegistrationDate], [ID], [GenderCode]) VALUES (N'Васильев', N'Оскар', N'Богданович', N'7(585)801-94-29 ', CAST(N'1971-01-30' AS Date), N'miturria@verizon.net', CAST(N'2017-05-28T00:00:00.0000000' AS DateTime2), 45, NULL)
INSERT [dbo].[Client] ([FirstName], [LastName], [Patromimic], [Phone], [Birthday], [Email], [RegistrationDate], [ID], [GenderCode]) VALUES (N'Киселёв', N'Устин', N'Яковлевич', N'7(83)334-52-76 ', CAST(N'1985-01-08' AS Date), N'dalamb@verizon.net', CAST(N'2018-06-21T00:00:00.0000000' AS DateTime2), 46, NULL)
INSERT [dbo].[Client] ([FirstName], [LastName], [Patromimic], [Phone], [Birthday], [Email], [RegistrationDate], [ID], [GenderCode]) VALUES (N'Кузьмин', N'Леонтий', N'Валерьянович', N'7(1340)148-90-68 ', CAST(N'2000-05-05' AS Date), N'msloan@hotmail.com', CAST(N'2017-10-12T00:00:00.0000000' AS DateTime2), 47, NULL)
INSERT [dbo].[Client] ([FirstName], [LastName], [Patromimic], [Phone], [Birthday], [Email], [RegistrationDate], [ID], [GenderCode]) VALUES (N'Ефимова', N'Магда', N'Платоновна', N'7(9261)386-15-92 ', CAST(N'1995-08-16' AS Date), N'rbarreira@me.com', CAST(N'2017-08-01T00:00:00.0000000' AS DateTime2), 48, NULL)
INSERT [dbo].[Client] ([FirstName], [LastName], [Patromimic], [Phone], [Birthday], [Email], [RegistrationDate], [ID], [GenderCode]) VALUES (N'Воронова', N'Изабелла', N'Вячеславовна', N'7(17)433-44-98 ', CAST(N'1999-09-24' AS Date), N'kildjean@sbcglobal.net', CAST(N'2017-12-21T00:00:00.0000000' AS DateTime2), 49, NULL)
INSERT [dbo].[Client] ([FirstName], [LastName], [Patromimic], [Phone], [Birthday], [Email], [RegistrationDate], [ID], [GenderCode]) VALUES (N'Волков', N'Людвиг', N'Витальевич', N'7(8459)592-05-58 ', CAST(N'1977-12-27' AS Date), N'jrkorson@msn.com', CAST(N'2016-04-27T00:00:00.0000000' AS DateTime2), 50, NULL)
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Замена жидкости в кондиционере', N'Услуги автосервисаКондиционер.jpg', N'8 час.', 3040.0000, N'25  ', 1)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Мойка колес', N'Услуги автосервисаШиномонтаж.jpg', N'570 мин.', 3490.0000, N'0', 2)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Ремонт и замена коллектора', N'Услуги автосервисаВыхлопная система.jpg', N'150 мин.', 2770.0000, N'15  ', 3)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Замена актуатора сцепления', N'Услуги автосервисаСцепление.jpg', N'330 мин.', 4100.0000, N'15  ', 4)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Замена жидкости ГУР', N'Услуги автосервисаГУР.png', N'9 час.', 2380.0000, N'20  ', 5)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Заправка кондиционеров', N'Услуги автосервисаКондиционер.jpg', N'2 час.', 4860.0000, N'5  ', 6)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Замена масла в вариаторе', N'Услуги автосервисаВариатор.jpg', N'2 час.', 4720.0000, N'5  ', 7)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Ремонт двигателя', N'Услуги автосервисаДвигатель.png', N'4 час.', 2470.0000, N'25  ', 8)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Замена заднего сальника АКПП', N'Услуги автосервисаАКПП.jpg', N'390 мин.', 1510.0000, N'25  ', 9)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Покраска', N'Услуги автосервисаДополнительные услуги.png', N'2 час.', 2370.0000, N'15  ', 10)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Замена прокладки впускного-выпуского коллектора', N'Услуги автосервисаВыхлопная система.jpg', N'3 час.', 2980.0000, N'0', 11)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Диагностика работы двигателя', N'Услуги автосервисаДвигатель.png', N'150 мин.', 2760.0000, N'10  ', 12)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Установка сигнализации', N'Услуги автосервисаЭлектрика.png', N'4 час.', 1760.0000, N'0', 13)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Замена компрессора кондиционера', N'Услуги автосервисаКондиционер.jpg', N'270 мин.', 2720.0000, N'10  ', 14)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Замена ремня привода ГУР', N'Услуги автосервисаГУР.png', N'10 час.', 3350.0000, N'0', 15)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Замена тормозных колодок', N'Услуги автосервисаТехническое обслуживание.png', N'8 час.', 4260.0000, N'5  ', 16)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Замена масла', N'Услуги автосервисаТехническое обслуживание.png', N'510 мин.', 1430.0000, N'25  ', 17)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Замена цепи ГРМ', N'Услуги автосервисаДвигатель.png', N'6 час.', 4570.0000, N'20  ', 18)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Замена бензонасоса', N'Услуги автосервисаТопливная система.png', N'4 час.', 1780.0000, N'10  ', 19)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Ремонт приводного вала', N'Услуги автосервисаrulevoe-upravlenie-avtomobilya.jpg', N'210 мин.', 4520.0000, N'5  ', 20)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Замена подшипника компрессора кондиционера', N'Услуги автосервисаКондиционер.jpg', N'330 мин.', 1110.0000, N'20  ', 21)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Снятие и установка колес', N'Услуги автосервисаШиномонтаж.jpg', N'390 мин.', 3130.0000, N'0', 22)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Замена лямбда зонда', N'Услуги автосервисаВыхлопная система.jpg', N'270 мин.', 770.0000, N'5  ', 23)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Замена привода в сборе', N'Услуги автосервисаtransmission.jpg', N'8 час.', 3890.0000, N'15  ', 24)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Замена трубки кондиционера', N'Услуги автосервисаКондиционер.jpg', N'3 час.', 2810.0000, N'15  ', 25)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Замена ремня кондиционера', N'Услуги автосервисаКондиционер.jpg', N'8 час.', 4650.0000, N'0', 26)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Замена охлаждающей жидкости', N'Услуги автосервисаТехническое обслуживание.png', N'210 мин.', 1590.0000, N'0', 27)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Замена троса сцепления', N'Услуги автосервисаСцепление.jpg', N'8 час.', 4460.0000, N'5  ', 28)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Замена масла в МКПП', N'Услуги автосервисаКПП.png', N'9 час.', 4490.0000, N'20  ', 29)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Замена рулевой рейки', N'Услуги автосервисаrulevoe-upravlenie-avtomobilya.jpg', N'570 мин.', 4840.0000, N'25  ', 30)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Ремонт дисков', N'Услуги автосервисаШиномонтаж.jpg', N'270 мин.', 3860.0000, N'10  ', 31)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Замена масла заднего редуктора (моста)', N'Услуги автосервисаtransmission.jpg', N'7 час.', 840.0000, N'25  ', 32)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Замена подшипника задней ступицы', N'Услуги автосервисаtransmission.jpg', N'270 мин.', 1860.0000, N'25  ', 33)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Восстановление рулевых реек', N'Услуги автосервисаПодвеска.png', N'2 час.', 1020.0000, N'20  ', 34)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Замена рулевой тяги', N'Услуги автосервисаrulevoe-upravlenie-avtomobilya.jpg', N'3 час.', 570.0000, N'0', 35)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Ремонт и замена гидроблока АКПП', N'Услуги автосервисаАКПП.jpg', N'270 мин.', 2040.0000, N'0', 36)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Замена масла раздаточной коробки', N'Услуги автосервисаtransmission.jpg', N'510 мин.', 2070.0000, N'0', 37)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Диагностика кондиционера', N'Услуги автосервисаКондиционер.jpg', N'10 час.', 2590.0000, N'10  ', 38)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Ремонт и замена катализатора', N'Услуги автосервисаВыхлопная система.jpg', N'270 мин.', 500.0000, N'25  ', 39)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Замена гофры глушителя', N'Услуги автосервисаВыхлопная система.jpg', N'270 мин.', 760.0000, N'25  ', 40)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Замена ремня ГРМ', N'Услуги автосервисаДвигатель.png', N'150 мин.', 4630.0000, N'25  ', 41)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Ремонт редуктора', N'Услуги автосервисаКПП.png', N'8 час.', 870.0000, N'15  ', 42)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Замена электромагнитного клапана без снятия ТНВД', N'Услуги автосервисаdiz.jpg', N'450 мин.', 4610.0000, N'10  ', 43)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Вулканизация шин', N'Услуги автосервисаШиномонтаж.jpg', N'330 мин.', 540.0000, N'20  ', 44)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Ремонт стартера', N'Услуги автосервисаЭлектрика.png', N'8 час.', 2680.0000, N'0', 45)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Ремонт коробки передач', N'Услуги автосервисаКПП.png', N'450 мин.', 1850.0000, N'25  ', 46)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Жидкостная промывка топливной системы', N'Услуги автосервисаТопливная система.png', N'6 час.', 3620.0000, N'15  ', 47)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Ремонт генератора', N'Услуги автосервисаЭлектрика.png', N'210 мин.', 1700.0000, N'20  ', 48)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Замена масла АКПП', N'Услуги автосервисаАКПП.jpg', N'450 мин.', 2430.0000, N'25  ', 49)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Диагностика трансмиссии', N'Услуги автосервисаtransmission.jpg', N'2 час.', 2790.0000, N'20  ', 50)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Монтаж и снятие шин с диска', N'Услуги автосервисаШиномонтаж.jpg', N'10 час.', 3990.0000, N'15  ', 51)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Замена подшипника передней ступицы', N'Услуги автосервисаtransmission.jpg', N'330 мин.', 4020.0000, N'15  ', 52)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Замена главного цилиндра сцепления', N'Услуги автосервисаСцепление.jpg', N'150 мин.', 4910.0000, N'5  ', 53)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Установка автомагнитолы', N'Услуги автосервисаЭлектрика.png', N'270 мин.', 3210.0000, N'0', 54)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Диагностика рулевых тяг', N'Услуги автосервисаrulevoe-upravlenie-avtomobilya.jpg', N'3 час.', 1680.0000, N'5  ', 55)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Замена радиатора кондиционера', N'Услуги автосервисаКондиционер.jpg', N'9 час.', 1770.0000, N'0', 56)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Замена тормозной жидкости', N'Услуги автосервисаТехническое обслуживание.png', N'6 час.', 2200.0000, N'10  ', 57)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Ремонт рулевого управления', N'Услуги автосервисаПодвеска.png', N'2 час.', 3440.0000, N'20  ', 58)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Замена заднего редуктора', N'Услуги автосервисаtransmission.jpg', N'330 мин.', 2240.0000, N'25  ', 59)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Дефектация CVT', N'Услуги автосервисаВариатор.jpg', N'3 час.', 1830.0000, N'5  ', 60)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Замена карданного вала', N'Услуги автосервисаtransmission.jpg', N'2 час.', 4450.0000, N'0', 61)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Замена сцепления', N'Услуги автосервисаКПП.png', N'330 мин.', 4320.0000, N'0', 62)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Установка системы автозапуска', N'Услуги автосервисаЭлектрика.png', N'9 час.', 3620.0000, N'0', 63)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Замена опоры АКПП', N'Услуги автосервисаАКПП.jpg', N'5 час.', 2540.0000, N'10  ', 64)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Ремонт бензонасоса', N'Услуги автосервисаТопливная система.png', N'210 мин.', 500.0000, N'15  ', 65)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Замена масла переднего редуктора (моста)', N'Услуги автосервисаtransmission.jpg', N'9 час.', 3950.0000, N'5  ', 66)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Ремонт подвесного подшипника', N'Услуги автосервисаtransmission.jpg', N'7 час.', 4440.0000, N'25  ', 68)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Тестирование форсунок (стенд)', N'Услуги автосервисаТопливная система.png', N'6 час.', 1600.0000, N'0', 69)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Диагностика сцепления', N'Услуги автосервисаСцепление.jpg', N'6 час.', 4210.0000, N'20  ', 70)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Замена ступицы в сборе', N'Услуги автосервисаtransmission.jpg', N'150 мин.', 4250.0000, N'20  ', 71)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Антибактериальная обработка кондиционера', N'Услуги автосервисаКондиционер.jpg', N'450 мин.', 4580.0000, N'20  ', 72)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Ремонт глушителя', N'Услуги автосервисаВыхлопная система.jpg', N'150 мин.', 2100.0000, N'25  ', 73)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Диагностика рулевого редуктора', N'Услуги автосервисаrulevoe-upravlenie-avtomobilya.jpg', N'3 час.', 2930.0000, N'10  ', 74)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Диагностика подвески', N'Услуги автосервисаПодвеска.png', N'330 мин.', 1460.0000, N'0', 75)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Замена свечей', N'Услуги автосервисаТехническое обслуживание.png', N'2 час.', 2240.0000, N'10  ', 76)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Диагностика инжектора', N'Услуги автосервисаТопливная система.png', N'330 мин.', 3390.0000, N'5  ', 78)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Комплексная диагностика автомобиля', N'Услуги автосервисаТехническое обслуживание.png', N'10 час.', 1120.0000, N'0', 79)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Ремонт раздаточной коробки', N'Услуги автосервисаКПП.png', N'10 час.', 3610.0000, N'5  ', 80)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Удаление катализатора', N'Услуги автосервисаДополнительные услуги.png', N'510 мин.', 1930.0000, N'10  ', 81)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Снятие/установка форсунок', N'Услуги автосервисаdiz.jpg', N'5 час.', 1470.0000, N'25  ', 82)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Развал-схождение', N'Услуги автосервисаПодвеска.png', N'3 час.', 3890.0000, N'0', 83)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Замена выжимного подшипника', N'Услуги автосервисаСцепление.jpg', N'10 час.', 2250.0000, N'5  ', 84)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Чистка форсунок ультразвуком', N'Услуги автосервисаТопливная система.png', N'4 час.', 3920.0000, N'5  ', 85)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Ремонт компрессора кондиционера', N'Услуги автосервисаКондиционер.jpg', N'150 мин.', 4760.0000, N'25  ', 86)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Замена цилиндра сцепления', N'Услуги автосервисаСцепление.jpg', N'8 час.', 810.0000, N'25  ', 87)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Ремонт подвески (ходовой)', N'Услуги автосервисаПодвеска.png', N'3 час.', 680.0000, N'5  ', 88)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Замена фильтров', N'Услуги автосервисаТехническое обслуживание.png', N'210 мин.', 530.0000, N'15  ', 89)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Кузовной ремонт', N'Услуги автосервисаДополнительные услуги.png', N'150 мин.', 2750.0000, N'5  ', 90)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Замена прокладки приемной трубки', N'Услуги автосервисаВыхлопная система.jpg', N'570 мин.', 4680.0000, N'20  ', 91)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Диагностика выхлопной системы автомобиля', N'Услуги автосервисаВыхлопная система.jpg', N'3 час.', 2550.0000, N'25  ', 92)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Балансировка колес', N'Услуги автосервисаШиномонтаж.jpg', N'390 мин.', 4690.0000, N'25  ', 93)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Ремонт автоэлектрики', N'Услуги автосервисаЭлектрика.png', N'450 мин.', 4230.0000, N'10  ', 94)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'ТО с сохранением гарантии', N'Услуги автосервисаТехническое обслуживание.png', N'270 мин.', 4300.0000, N'20  ', 95)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Ремонт карданного вала', N'Услуги автосервисаtransmission.jpg', N'210 мин.', 780.0000, N'5  ', 96)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Ремонт сцепления', N'Услуги автосервисаКПП.png', N'10 час.', 3290.0000, N'25  ', 97)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Замена кулисы АКПП', N'Услуги автосервисаАКПП.jpg', N'6 час.', 3250.0000, N'10  ', 98)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Ремонт кронштейна глушителя', N'Услуги автосервисаВыхлопная система.jpg', N'570 мин.', 1410.0000, N'0', 99)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Замена сальника привода', N'Услуги автосервисаtransmission.jpg', N'570 мин.', 3820.0000, N'15  ', 100)
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Замена пыльника шруса', N'Услуги автосервисаrulevoe-upravlenie-avtomobilya.jpg', N'5 час.', 4730.0000, N'0', 101)
GO
INSERT [dbo].[Service] ([Title], [MainImagePath], [DurationSecond], [Cost], [Discount], [id]) VALUES (N'Замена маховика', N'Услуги автосервисаСцепление.jpg', N'10 час.', 2400.0000, N'25  ', 102)
SET IDENTITY_INSERT [dbo].[Service] OFF
GO
ALTER TABLE [dbo].[AttachedProduct]  WITH CHECK ADD  CONSTRAINT [FK_AttachedProduct_Product] FOREIGN KEY([MainProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AttachedProduct] CHECK CONSTRAINT [FK_AttachedProduct_Product]
GO
ALTER TABLE [dbo].[AttachedProduct]  WITH CHECK ADD  CONSTRAINT [FK_AttachedProduct_Product1] FOREIGN KEY([AttachedProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AttachedProduct] CHECK CONSTRAINT [FK_AttachedProduct_Product1]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_Gender1] FOREIGN KEY([GenderCode])
REFERENCES [dbo].[Gender] ([Code])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_Gender1]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_Client]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_DocumentBvService1] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[DocumentBvService] ([ID])
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_DocumentBvService1]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([id])
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_Service]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Manufacturer] FOREIGN KEY([ManufacturerId])
REFERENCES [dbo].[Manufacturer] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Manufacturer]
GO
ALTER TABLE [dbo].[ProductPhoto]  WITH CHECK ADD  CONSTRAINT [FK_ProductPhoto_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductPhoto] CHECK CONSTRAINT [FK_ProductPhoto_Product]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_ClientService] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientService] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_ClientService]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Product]
GO
ALTER TABLE [dbo].[ServicePhoto]  WITH CHECK ADD  CONSTRAINT [FK_ServicePhoto_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([id])
GO
ALTER TABLE [dbo].[ServicePhoto] CHECK CONSTRAINT [FK_ServicePhoto_Service]
GO
ALTER TABLE [dbo].[TagOFClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOFClient_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[TagOFClient] CHECK CONSTRAINT [FK_TagOFClient_Client]
GO
ALTER TABLE [dbo].[TagOFClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOFClient_Tag] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tag] ([ID])
GO
ALTER TABLE [dbo].[TagOFClient] CHECK CONSTRAINT [FK_TagOFClient_Tag]
GO
USE [master]
GO
ALTER DATABASE [Shirokov_Autoservice] SET  READ_WRITE 
GO
