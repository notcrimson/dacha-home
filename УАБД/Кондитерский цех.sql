USE [master]
GO
/****** Object:  Database [Кондитерский цех]    Script Date: 10/8/2020 5:34:16 PM ******/
CREATE DATABASE [Кондитерский цех]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Кондитерский цех', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Кондитерский цех.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Кондитерский цех_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Кондитерский цех_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Кондитерский цех] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Кондитерский цех].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Кондитерский цех] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Кондитерский цех] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Кондитерский цех] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Кондитерский цех] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Кондитерский цех] SET ARITHABORT OFF 
GO
ALTER DATABASE [Кондитерский цех] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Кондитерский цех] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Кондитерский цех] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Кондитерский цех] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Кондитерский цех] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Кондитерский цех] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Кондитерский цех] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Кондитерский цех] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Кондитерский цех] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Кондитерский цех] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Кондитерский цех] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Кондитерский цех] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Кондитерский цех] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Кондитерский цех] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Кондитерский цех] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Кондитерский цех] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Кондитерский цех] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Кондитерский цех] SET RECOVERY FULL 
GO
ALTER DATABASE [Кондитерский цех] SET  MULTI_USER 
GO
ALTER DATABASE [Кондитерский цех] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Кондитерский цех] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Кондитерский цех] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Кондитерский цех] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Кондитерский цех] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Кондитерский цех', N'ON'
GO
ALTER DATABASE [Кондитерский цех] SET QUERY_STORE = OFF
GO
USE [Кондитерский цех]
GO
/****** Object:  Table [dbo].[Заказ]    Script Date: 10/8/2020 5:34:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заказ](
	[Номер] [int] NOT NULL,
	[Дата] [date] NOT NULL,
	[Наименование заказа] [varchar](50) NOT NULL,
	[Изделие] [varchar](50) NOT NULL,
	[Заказчик] [varchar](20) NOT NULL,
	[Ответственный менеджер] [varchar](20) NULL,
	[Стоимость] [smallmoney] NULL,
	[Плановая дата завершения] [date] NULL,
	[Примеры работ] [image] NULL,
 CONSTRAINT [PK_Заказ] PRIMARY KEY CLUSTERED 
(
	[Номер] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Изделие]    Script Date: 10/8/2020 5:34:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Изделие](
	[Наименование] [varchar](50) NOT NULL,
	[Размеры] [int] NOT NULL,
 CONSTRAINT [PK_Изделие] PRIMARY KEY CLUSTERED 
(
	[Наименование] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ингредиент]    Script Date: 10/8/2020 5:34:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ингредиент](
	[Артикул] [int] NOT NULL,
	[Наименование] [varchar](50) NOT NULL,
	[Единица измерения] [varchar](50) NOT NULL,
	[Количество] [int] NOT NULL,
	[Основной поставщик] [varchar](50) NULL,
	[Изображение] [image] NULL,
	[Тип Ингредиента] [varchar](50) NOT NULL,
	[Закупочная цена] [smallmoney] NOT NULL,
	[ГОСТ] [varchar](50) NULL,
	[Фасовка] [varchar](50) NULL,
	[Характеристика] [varchar](50) NULL,
 CONSTRAINT [PK_Ингредиент] PRIMARY KEY CLUSTERED 
(
	[Артикул] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Оборудование]    Script Date: 10/8/2020 5:34:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Оборудование](
	[Маркировка] [varchar](50) NOT NULL,
	[Тип оборудования] [varchar](50) NOT NULL,
	[Характеристики] [varchar](50) NULL,
 CONSTRAINT [PK_Оборудование] PRIMARY KEY CLUSTERED 
(
	[Маркировка] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Пользователь]    Script Date: 10/8/2020 5:34:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Пользователь](
	[Логин] [varchar](20) NOT NULL,
	[Пароль] [varchar](20) NOT NULL,
	[Роль] [varchar](20) NOT NULL,
	[ФИО] [varchar](50) NULL,
	[Фото] [image] NULL,
 CONSTRAINT [PK_Пользователь] PRIMARY KEY CLUSTERED 
(
	[Логин] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Поставщик]    Script Date: 10/8/2020 5:34:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Поставщик](
	[Наименование] [varchar](50) NOT NULL,
	[Адрес] [varchar](50) NULL,
	[Срок доставки] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Поставщик] PRIMARY KEY CLUSTERED 
(
	[Наименование] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Спецификация ингредиенты]    Script Date: 10/8/2020 5:34:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Спецификация ингредиенты](
	[Изделие] [varchar](50) NOT NULL,
	[Ингредиент] [int] NOT NULL,
	[Количество] [int] NOT NULL,
 CONSTRAINT [PK_Спецификация ингредиенты] PRIMARY KEY CLUSTERED 
(
	[Изделие] ASC,
	[Ингредиент] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Спецификация операции]    Script Date: 10/8/2020 5:34:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Спецификация операции](
	[Изделие] [varchar](50) NOT NULL,
	[Операция] [varchar](50) NOT NULL,
	[Порядковый номер] [int] NOT NULL,
	[Тип оборудования] [varchar](50) NULL,
	[Время на операцию] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Спецификация операции] PRIMARY KEY CLUSTERED 
(
	[Изделие] ASC,
	[Операция] ASC,
	[Порядковый номер] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Спецификация полуфабрикаты]    Script Date: 10/8/2020 5:34:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Спецификация полуфабрикаты](
	[Изделие] [varchar](50) NOT NULL,
	[Полуфабрикат] [varchar](50) NOT NULL,
	[Количество] [int] NOT NULL,
 CONSTRAINT [PK_Спецификация полуфабрикаты] PRIMARY KEY CLUSTERED 
(
	[Изделие] ASC,
	[Полуфабрикат] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Спецификация украшения для торта]    Script Date: 10/8/2020 5:34:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Спецификация украшения для торта](
	[Изделие] [varchar](50) NOT NULL,
	[Украшение для торта] [int] NOT NULL,
	[Количество] [int] NOT NULL,
 CONSTRAINT [PK_Спецификация украшения для торта] PRIMARY KEY CLUSTERED 
(
	[Изделие] ASC,
	[Украшение для торта] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Тип оборудования]    Script Date: 10/8/2020 5:34:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Тип оборудования](
	[Тип оборудования] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Тип оборудования] PRIMARY KEY CLUSTERED 
(
	[Тип оборудования] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Украшения для торта]    Script Date: 10/8/2020 5:34:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Украшения для торта](
	[Артикул] [int] NOT NULL,
	[Наименование] [varchar](50) NOT NULL,
	[Единица измерения] [varchar](50) NOT NULL,
	[Количество] [int] NOT NULL,
	[Основной поставщик] [varchar](50) NULL,
	[Изображение] [image] NULL,
	[Тип украшения для торта] [varchar](50) NOT NULL,
	[Закупочная цена] [smallmoney] NOT NULL,
	[Вес] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Украшения для торта] PRIMARY KEY CLUSTERED 
(
	[Артикул] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Заказ]  WITH CHECK ADD  CONSTRAINT [FK_Заказ_Изделие] FOREIGN KEY([Изделие])
REFERENCES [dbo].[Изделие] ([Наименование])
GO
ALTER TABLE [dbo].[Заказ] CHECK CONSTRAINT [FK_Заказ_Изделие]
GO
ALTER TABLE [dbo].[Заказ]  WITH CHECK ADD  CONSTRAINT [FK_Заказ_Пользователь] FOREIGN KEY([Заказчик])
REFERENCES [dbo].[Пользователь] ([Логин])
GO
ALTER TABLE [dbo].[Заказ] CHECK CONSTRAINT [FK_Заказ_Пользователь]
GO
ALTER TABLE [dbo].[Заказ]  WITH CHECK ADD  CONSTRAINT [FK_Заказ_Пользователь1] FOREIGN KEY([Ответственный менеджер])
REFERENCES [dbo].[Пользователь] ([Логин])
GO
ALTER TABLE [dbo].[Заказ] CHECK CONSTRAINT [FK_Заказ_Пользователь1]
GO
ALTER TABLE [dbo].[Ингредиент]  WITH CHECK ADD  CONSTRAINT [FK_Ингредиент_Поставщик] FOREIGN KEY([Основной поставщик])
REFERENCES [dbo].[Поставщик] ([Наименование])
GO
ALTER TABLE [dbo].[Ингредиент] CHECK CONSTRAINT [FK_Ингредиент_Поставщик]
GO
ALTER TABLE [dbo].[Оборудование]  WITH CHECK ADD  CONSTRAINT [FK_Оборудование_Тип оборудования] FOREIGN KEY([Тип оборудования])
REFERENCES [dbo].[Тип оборудования] ([Тип оборудования])
GO
ALTER TABLE [dbo].[Оборудование] CHECK CONSTRAINT [FK_Оборудование_Тип оборудования]
GO
ALTER TABLE [dbo].[Спецификация ингредиенты]  WITH CHECK ADD  CONSTRAINT [FK_Спецификация ингредиенты_Изделие] FOREIGN KEY([Изделие])
REFERENCES [dbo].[Изделие] ([Наименование])
GO
ALTER TABLE [dbo].[Спецификация ингредиенты] CHECK CONSTRAINT [FK_Спецификация ингредиенты_Изделие]
GO
ALTER TABLE [dbo].[Спецификация ингредиенты]  WITH CHECK ADD  CONSTRAINT [FK_Спецификация ингредиенты_Ингредиент] FOREIGN KEY([Ингредиент])
REFERENCES [dbo].[Ингредиент] ([Артикул])
GO
ALTER TABLE [dbo].[Спецификация ингредиенты] CHECK CONSTRAINT [FK_Спецификация ингредиенты_Ингредиент]
GO
ALTER TABLE [dbo].[Спецификация операции]  WITH CHECK ADD  CONSTRAINT [FK_Спецификация операции_Изделие] FOREIGN KEY([Изделие])
REFERENCES [dbo].[Изделие] ([Наименование])
GO
ALTER TABLE [dbo].[Спецификация операции] CHECK CONSTRAINT [FK_Спецификация операции_Изделие]
GO
ALTER TABLE [dbo].[Спецификация полуфабрикаты]  WITH CHECK ADD  CONSTRAINT [FK_Спецификация полуфабрикаты_Изделие] FOREIGN KEY([Изделие])
REFERENCES [dbo].[Изделие] ([Наименование])
GO
ALTER TABLE [dbo].[Спецификация полуфабрикаты] CHECK CONSTRAINT [FK_Спецификация полуфабрикаты_Изделие]
GO
ALTER TABLE [dbo].[Спецификация полуфабрикаты]  WITH CHECK ADD  CONSTRAINT [FK_Спецификация полуфабрикаты_Изделие1] FOREIGN KEY([Полуфабрикат])
REFERENCES [dbo].[Изделие] ([Наименование])
GO
ALTER TABLE [dbo].[Спецификация полуфабрикаты] CHECK CONSTRAINT [FK_Спецификация полуфабрикаты_Изделие1]
GO
ALTER TABLE [dbo].[Спецификация украшения для торта]  WITH CHECK ADD  CONSTRAINT [FK_Спецификация украшения для торта_Изделие] FOREIGN KEY([Изделие])
REFERENCES [dbo].[Изделие] ([Наименование])
GO
ALTER TABLE [dbo].[Спецификация украшения для торта] CHECK CONSTRAINT [FK_Спецификация украшения для торта_Изделие]
GO
ALTER TABLE [dbo].[Спецификация украшения для торта]  WITH CHECK ADD  CONSTRAINT [FK_Спецификация украшения для торта_Украшения для торта] FOREIGN KEY([Украшение для торта])
REFERENCES [dbo].[Украшения для торта] ([Артикул])
GO
ALTER TABLE [dbo].[Спецификация украшения для торта] CHECK CONSTRAINT [FK_Спецификация украшения для торта_Украшения для торта]
GO
USE [master]
GO
ALTER DATABASE [Кондитерский цех] SET  READ_WRITE 
GO
