USE [master]
GO
/****** Object:  Database [FoodManager]    Script Date: 07/10/2022 8:30:26 CH ******/
CREATE DATABASE [FoodManager]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FoodManager', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.DUYNGUYEN\MSSQL\DATA\FoodManager.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FoodManager_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.DUYNGUYEN\MSSQL\DATA\FoodManager_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FoodManager] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FoodManager].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FoodManager] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FoodManager] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FoodManager] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FoodManager] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FoodManager] SET ARITHABORT OFF 
GO
ALTER DATABASE [FoodManager] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [FoodManager] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FoodManager] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FoodManager] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FoodManager] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FoodManager] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FoodManager] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FoodManager] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FoodManager] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FoodManager] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FoodManager] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FoodManager] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FoodManager] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FoodManager] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FoodManager] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FoodManager] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FoodManager] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FoodManager] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FoodManager] SET  MULTI_USER 
GO
ALTER DATABASE [FoodManager] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FoodManager] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FoodManager] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FoodManager] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FoodManager] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FoodManager] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [FoodManager] SET QUERY_STORE = OFF
GO
USE [FoodManager]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 07/10/2022 8:30:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CateID] [int] IDENTITY(1,1) NOT NULL,
	[CateName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 07/10/2022 8:30:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [varchar](20) NULL,
	[TableID] [int] NULL,
	[DateCheckIn] [date] NOT NULL,
	[DateCheckOut] [date] NOT NULL,
	[status] [bit] NOT NULL,
	[total] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 07/10/2022 8:30:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderID] [int] NULL,
	[ProductID] [int] NULL,
	[Quantity] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 07/10/2022 8:30:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[NameProduct] [nvarchar](50) NULL,
	[Price] [int] NULL,
	[CateID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Table]    Script Date: 07/10/2022 8:30:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table](
	[TableId] [int] NOT NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TableId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 07/10/2022 8:30:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserName] [varchar](20) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Password] [varchar](20) NOT NULL,
	[Role] [varchar](10) NULL,
 CONSTRAINT [PK__User__1788CCACE7372385] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CateID], [CateName]) VALUES (1, N'MÓN KHAI VỊ')
INSERT [dbo].[Category] ([CateID], [CateName]) VALUES (2, N'MÓN CHÍNH')
INSERT [dbo].[Category] ([CateID], [CateName]) VALUES (3, N'MÓN LẨU')
INSERT [dbo].[Category] ([CateID], [CateName]) VALUES (4, N'Các loại thịt')
INSERT [dbo].[Category] ([CateID], [CateName]) VALUES (5, N'Các loại rau')
INSERT [dbo].[Category] ([CateID], [CateName]) VALUES (6, N'Thức uống')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [NameProduct], [Price], [CateID]) VALUES (1, N'Salad Nabe', 79000, 1)
INSERT [dbo].[Product] ([ProductID], [NameProduct], [Price], [CateID]) VALUES (2, N'Salad sốt phô mai cay', 69000, 1)
INSERT [dbo].[Product] ([ProductID], [NameProduct], [Price], [CateID]) VALUES (3, N'Salad sốt mè vàng', 69000, 1)
INSERT [dbo].[Product] ([ProductID], [NameProduct], [Price], [CateID]) VALUES (4, N'Khoai tây chiên', 29000, 1)
INSERT [dbo].[Product] ([ProductID], [NameProduct], [Price], [CateID]) VALUES (5, N'Bánh đa', 7000, 1)
INSERT [dbo].[Product] ([ProductID], [NameProduct], [Price], [CateID]) VALUES (6, N'Gà chiên giòn', 45000, 2)
INSERT [dbo].[Product] ([ProductID], [NameProduct], [Price], [CateID]) VALUES (7, N'Gà sốt teriyaki', 79000, 2)
INSERT [dbo].[Product] ([ProductID], [NameProduct], [Price], [CateID]) VALUES (8, N'Nạc nọng heo sốt teriyaki', 79000, 2)
INSERT [dbo].[Product] ([ProductID], [NameProduct], [Price], [CateID]) VALUES (9, N'Cá saba nướng', 12900, 2)
INSERT [dbo].[Product] ([ProductID], [NameProduct], [Price], [CateID]) VALUES (10, N'Cơm chiên xá xíu', 80000, 2)
INSERT [dbo].[Product] ([ProductID], [NameProduct], [Price], [CateID]) VALUES (11, N'Cơm chiên rau củ', 80000, 2)
INSERT [dbo].[Product] ([ProductID], [NameProduct], [Price], [CateID]) VALUES (12, N'Mì soba xào', 85000, 2)
INSERT [dbo].[Product] ([ProductID], [NameProduct], [Price], [CateID]) VALUES (13, N'Mì Undon xào', 85000, 2)
INSERT [dbo].[Product] ([ProductID], [NameProduct], [Price], [CateID]) VALUES (14, N'Lẩu Nabe', 299000, 3)
INSERT [dbo].[Product] ([ProductID], [NameProduct], [Price], [CateID]) VALUES (15, N'Lẩu tương miso', 249000, 3)
INSERT [dbo].[Product] ([ProductID], [NameProduct], [Price], [CateID]) VALUES (16, N'Lẩu kim chi', 279000, 3)
INSERT [dbo].[Product] ([ProductID], [NameProduct], [Price], [CateID]) VALUES (17, N'Bò viên ', 29000, 4)
INSERT [dbo].[Product] ([ProductID], [NameProduct], [Price], [CateID]) VALUES (18, N'Mộc', 29000, 4)
INSERT [dbo].[Product] ([ProductID], [NameProduct], [Price], [CateID]) VALUES (19, N'Ba chỉ bò Mỹ', 29000, 4)
INSERT [dbo].[Product] ([ProductID], [NameProduct], [Price], [CateID]) VALUES (20, N'Ba chỉ heo', 29000, 4)
INSERT [dbo].[Product] ([ProductID], [NameProduct], [Price], [CateID]) VALUES (21, N'Nạm bò', 29000, 4)
INSERT [dbo].[Product] ([ProductID], [NameProduct], [Price], [CateID]) VALUES (22, N'Bắp bò ', 29000, 4)
INSERT [dbo].[Product] ([ProductID], [NameProduct], [Price], [CateID]) VALUES (23, N'Rau thập cẩm', 35000, 5)
INSERT [dbo].[Product] ([ProductID], [NameProduct], [Price], [CateID]) VALUES (24, N'Nấm thập cẩm', 35000, 5)
INSERT [dbo].[Product] ([ProductID], [NameProduct], [Price], [CateID]) VALUES (25, N'Bắp', 18000, 5)
INSERT [dbo].[Product] ([ProductID], [NameProduct], [Price], [CateID]) VALUES (26, N'Nấm kim châm', 18000, 5)
INSERT [dbo].[Product] ([ProductID], [NameProduct], [Price], [CateID]) VALUES (27, N'Bắp cải', 15000, 5)
INSERT [dbo].[Product] ([ProductID], [NameProduct], [Price], [CateID]) VALUES (28, N'Cải cúc', 15000, 5)
INSERT [dbo].[Product] ([ProductID], [NameProduct], [Price], [CateID]) VALUES (29, N'Soda Việt Quất', 45000, 6)
INSERT [dbo].[Product] ([ProductID], [NameProduct], [Price], [CateID]) VALUES (30, N'Soda Chanh Đường', 45000, 6)
INSERT [dbo].[Product] ([ProductID], [NameProduct], [Price], [CateID]) VALUES (31, N'Ép cam', 39000, 6)
INSERT [dbo].[Product] ([ProductID], [NameProduct], [Price], [CateID]) VALUES (32, N'Trà đào cam sả', 49000, 6)
INSERT [dbo].[Product] ([ProductID], [NameProduct], [Price], [CateID]) VALUES (33, N'Nước suối', 10000, 6)
INSERT [dbo].[Product] ([ProductID], [NameProduct], [Price], [CateID]) VALUES (34, N'Heineken long', 22000, 6)
INSERT [dbo].[Product] ([ProductID], [NameProduct], [Price], [CateID]) VALUES (35, N'Tiger nâu lon', 20000, 6)
INSERT [dbo].[Product] ([ProductID], [NameProduct], [Price], [CateID]) VALUES (36, N'Volka men', 90000, 6)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
INSERT [dbo].[Table] ([TableId], [Status]) VALUES (1, 0)
INSERT [dbo].[Table] ([TableId], [Status]) VALUES (2, 0)
INSERT [dbo].[Table] ([TableId], [Status]) VALUES (3, 0)
INSERT [dbo].[Table] ([TableId], [Status]) VALUES (4, 0)
INSERT [dbo].[Table] ([TableId], [Status]) VALUES (5, 0)
INSERT [dbo].[Table] ([TableId], [Status]) VALUES (6, 0)
INSERT [dbo].[Table] ([TableId], [Status]) VALUES (7, 0)
INSERT [dbo].[Table] ([TableId], [Status]) VALUES (8, 0)
INSERT [dbo].[Table] ([TableId], [Status]) VALUES (9, 0)
INSERT [dbo].[Table] ([TableId], [Status]) VALUES (10, 0)
INSERT [dbo].[Table] ([TableId], [Status]) VALUES (11, 0)
INSERT [dbo].[Table] ([TableId], [Status]) VALUES (12, 0)
INSERT [dbo].[Table] ([TableId], [Status]) VALUES (13, 0)
INSERT [dbo].[Table] ([TableId], [Status]) VALUES (14, 0)
INSERT [dbo].[Table] ([TableId], [Status]) VALUES (15, 0)
INSERT [dbo].[Table] ([TableId], [Status]) VALUES (16, 0)
INSERT [dbo].[Table] ([TableId], [Status]) VALUES (17, 0)
INSERT [dbo].[Table] ([TableId], [Status]) VALUES (18, 0)
INSERT [dbo].[Table] ([TableId], [Status]) VALUES (19, 0)
INSERT [dbo].[Table] ([TableId], [Status]) VALUES (20, 0)
GO
INSERT [dbo].[User] ([UserName], [FullName], [Password], [Role]) VALUES (N'duynv', N'nguyenvanduy', N'1', N'A')
INSERT [dbo].[User] ([UserName], [FullName], [Password], [Role]) VALUES (N'nghia', N'phamducnghia', N'1', N'E')
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT (getdate()) FOR [DateCheckIn]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Table] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([TableID])
REFERENCES [dbo].[Table] ([TableId])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK__Order__UserID__31EC6D26] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserName])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK__Order__UserID__31EC6D26]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([CateID])
REFERENCES [dbo].[Category] ([CateID])
GO
USE [master]
GO
ALTER DATABASE [FoodManager] SET  READ_WRITE 
GO
