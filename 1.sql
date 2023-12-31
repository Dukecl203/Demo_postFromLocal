USE [master]
GO
/****** Object:  Database [GlobalBrandAssignment]    Script Date: 11/6/2023 10:38:56 PM ******/
CREATE DATABASE [GlobalBrandAssignment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GlobalBrandAssignment', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\GlobalBrandAssignment.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GlobalBrandAssignment_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\GlobalBrandAssignment_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [GlobalBrandAssignment] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GlobalBrandAssignment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GlobalBrandAssignment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GlobalBrandAssignment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GlobalBrandAssignment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GlobalBrandAssignment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GlobalBrandAssignment] SET ARITHABORT OFF 
GO
ALTER DATABASE [GlobalBrandAssignment] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GlobalBrandAssignment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GlobalBrandAssignment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GlobalBrandAssignment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GlobalBrandAssignment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GlobalBrandAssignment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GlobalBrandAssignment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GlobalBrandAssignment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GlobalBrandAssignment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GlobalBrandAssignment] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GlobalBrandAssignment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GlobalBrandAssignment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GlobalBrandAssignment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GlobalBrandAssignment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GlobalBrandAssignment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GlobalBrandAssignment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GlobalBrandAssignment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GlobalBrandAssignment] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GlobalBrandAssignment] SET  MULTI_USER 
GO
ALTER DATABASE [GlobalBrandAssignment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GlobalBrandAssignment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GlobalBrandAssignment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GlobalBrandAssignment] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GlobalBrandAssignment] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GlobalBrandAssignment] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [GlobalBrandAssignment] SET QUERY_STORE = ON
GO
ALTER DATABASE [GlobalBrandAssignment] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [GlobalBrandAssignment]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/6/2023 10:38:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](50) NULL,
	[image] [text] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 11/6/2023 10:38:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[order_date] [date] NULL,
	[total] [float] NULL,
	[notes] [nvarchar](200) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 11/6/2023 10:38:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[detail_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[product_id] [int] NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/6/2023 10:38:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [nvarchar](50) NULL,
	[price] [float] NULL,
	[stock] [int] NULL,
	[category_id] [int] NULL,
	[img] [ntext] NULL,
	[description] [nvarchar](1000) NULL,
	[create_date] [date] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/6/2023 10:38:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NULL,
	[email] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[address] [nvarchar](50) NULL,
	[gender] [bit] NULL,
	[phone] [nchar](11) NULL,
	[role_id] [varchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([category_id], [category_name], [image]) VALUES (1, N'Men', N'images/banner-02.jpg')
INSERT [dbo].[Category] ([category_id], [category_name], [image]) VALUES (2, N'Women', N'images/banner-01.jpg')
INSERT [dbo].[Category] ([category_id], [category_name], [image]) VALUES (3, N'Shoes', N'https://i.pinimg.com/564x/c9/19/b5/c919b5c574149cb1ad6062df0bd350dd.jpg')
INSERT [dbo].[Category] ([category_id], [category_name], [image]) VALUES (4, N'Bag', N'https://i.pinimg.com/564x/cf/fd/35/cffd35c4d147f581b3763917bc8cfd24.jpg')
INSERT [dbo].[Category] ([category_id], [category_name], [image]) VALUES (5, N'Watches', N'https://i.pinimg.com/564x/9f/56/b5/9f56b5491605223f1bd2b177b867c462.jpg')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([order_id], [user_id], [order_date], [total], [notes]) VALUES (1, 9, CAST(N'2023-08-15' AS Date), 134, N'please carefully')
INSERT [dbo].[Order] ([order_id], [user_id], [order_date], [total], [notes]) VALUES (2, 9, CAST(N'2023-10-23' AS Date), 54, N'please carefully')
INSERT [dbo].[Order] ([order_id], [user_id], [order_date], [total], [notes]) VALUES (3, 2, CAST(N'2023-11-05' AS Date), 60, N'')
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [price], [quantity]) VALUES (1, 1, 2, 80, 1)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [price], [quantity]) VALUES (2, 1, 5, 18, 3)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [price], [quantity]) VALUES (3, 2, 3, 18, 3)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [price], [quantity]) VALUES (4, 3, 6, 20, 3)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (1, N'Esprit Ruffle Shirt', 100, 80, 2, N'images/product-01.jpg', N'Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.', CAST(N'2023-03-08' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (2, N'Herschel supply', 80, 99, 2, N'images/product-02.jpg', N'Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.', CAST(N'2023-03-08' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (3, N'Classic Trench Coat', 18, 86, 2, N'images/product-02.jpg', N'Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.', CAST(N'2023-03-08' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (4, N'Front Pocket Jumper', 67, 50, 2, N'images/product-05.jpg', N'Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.', CAST(N'2023-03-08' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (5, N'Shirt in Stretch Cotton', 18, 77, 2, N'images/product-07.jpg', N'Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.', CAST(N'2023-03-08' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (6, N'Pieces Metallic Printed', 20, 67, 2, N'images/product-08.jpg', N'Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.', CAST(N'2023-03-08' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (7, N'Femme T-Shirt In Stripe', 29, 90, 2, N'images/product-10.jpg', N'Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.', CAST(N'2023-03-08' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (8, N'T-Shirt with Sleeve', 79, 90, 2, N'images/product-13.jpg', N'Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.', CAST(N'2023-03-08' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (9, N'Only Check Trouser', 30, 80, 1, N'images/product-03.jpg', N'Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.', CAST(N'2023-03-08' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (10, N'Herschel supply', 20, 100, 1, N'images/product-11.jpg', N'Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.', CAST(N'2023-03-08' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (11, N'Vintage Inspired Classic', 19, 200, 5, N'images/product-06.jpg', N'Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.', CAST(N'2023-03-08' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (12, N'Mini Silver Mesh Watch', 20, 200, 5, N'images/product-15.jpg', N'Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.', CAST(N'2023-03-08' AS Date))
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([user_id], [username], [email], [password], [address], [gender], [phone], [role_id]) VALUES (1, N'abc', N'abc@gmail.com', N'123', N'Ho Chi Minh', 1, N'0987654321 ', N'US')
INSERT [dbo].[Users] ([user_id], [username], [email], [password], [address], [gender], [phone], [role_id]) VALUES (2, N'admin', N'admin@gmail.com', N'123', N'Ha Noi', 1, N'0123456789 ', N'AD')
INSERT [dbo].[Users] ([user_id], [username], [email], [password], [address], [gender], [phone], [role_id]) VALUES (5, N'student1', N'abc@gmail.com', N'123', N'Ha Noi', 1, N'0123456789 ', N'US')
INSERT [dbo].[Users] ([user_id], [username], [email], [password], [address], [gender], [phone], [role_id]) VALUES (6, N'student1', N'abc@gmail.com', N'123', N'Ha Noi', 1, N'0123456789 ', N'US')
INSERT [dbo].[Users] ([user_id], [username], [email], [password], [address], [gender], [phone], [role_id]) VALUES (7, N'student1', N'abc@gmail.com', N'123', N'Ha Noi', 1, N'0123456789 ', N'US')
INSERT [dbo].[Users] ([user_id], [username], [email], [password], [address], [gender], [phone], [role_id]) VALUES (8, N'student1', N'abc@gmail.com', N'123', N'Ha Noi', 1, N'0123456789 ', N'US')
INSERT [dbo].[Users] ([user_id], [username], [email], [password], [address], [gender], [phone], [role_id]) VALUES (9, N'caa', N'abc@gmail.com', N'123', N'Ha Noi', 1, N'0123456789 ', N'US')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([order_id])
REFERENCES [dbo].[Order] ([order_id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
USE [master]
GO
ALTER DATABASE [GlobalBrandAssignment] SET  READ_WRITE 
GO
