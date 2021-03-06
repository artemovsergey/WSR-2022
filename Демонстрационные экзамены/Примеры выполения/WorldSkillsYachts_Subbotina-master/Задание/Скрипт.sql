/****** Object:  Table [dbo].[Accessory]    Script Date: 12.04.2021 13:03:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accessory](
	[Accessory_ID] [int] IDENTITY(1,1) NOT NULL,
	[AccName] [nvarchar](50) NOT NULL,
	[DescriptionOfAccessory] [nvarchar](100) NOT NULL,
	[Price] [money] NOT NULL,
	[VAT] [varchar](6) NOT NULL,
	[Inventory] [int] NOT NULL,
	[OrderLevel] [int] NOT NULL,
	[OrderBatch] [int] NOT NULL,
	[Partner_ID] [int] NULL,
 CONSTRAINT [PK_Accessory] PRIMARY KEY CLUSTERED 
(
	[Accessory_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Boats]    Script Date: 12.04.2021 13:03:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Boats](
	[boat_ID] [int] IDENTITY(1,1) NOT NULL,
	[Model] [nvarchar](50) NOT NULL,
	[BoatType] [nvarchar](30) NOT NULL,
	[NumberOfRowers] [int] NOT NULL,
	[Mast] [bit] NOT NULL,
	[Colour] [nvarchar](30) NOT NULL,
	[Wood] [nvarchar](20) NOT NULL,
	[BasePrice] [money] NOT NULL,
	[VAT] [varchar](4) NOT NULL,
 CONSTRAINT [PK_Boats] PRIMARY KEY CLUSTERED 
(
	[boat_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contract]    Script Date: 12.04.2021 13:03:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contract](
	[Contract_ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
	[DepositPayed] [money] NOT NULL,
	[Order_ID] [int] NULL,
	[ContractTotalPrice] [money] NOT NULL,
	[ContracTotalPrice_inclVAT] [money] NOT NULL,
	[ProductionProcess] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Contract] PRIMARY KEY CLUSTERED 
(
	[Contract_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 12.04.2021 13:03:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Customer_ID] [int] IDENTITY(1,1) NOT NULL,
	[FistName] [nvarchar](50) NOT NULL,
	[FamilyName] [nvarchar](50) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[OrganisationName] [nvarchar](100) NULL,
	[Address] [nvarchar](150) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[Phone] [nchar](20) NOT NULL,
	[DocumentNumber] [nvarchar](10) NOT NULL,
	[DocumentName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Customer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detail]    Script Date: 12.04.2021 13:03:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detail](
	[Detail_ID] [int] IDENTITY(1,1) NOT NULL,
	[Accessory_ID] [int] NULL,
	[Order_ID] [int] NULL,
 CONSTRAINT [PK_Detail] PRIMARY KEY CLUSTERED 
(
	[Detail_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fit]    Script Date: 12.04.2021 13:03:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fit](
	[Fit_ID] [int] IDENTITY(1,1) NOT NULL,
	[Accessory_ID] [int] NULL,
	[Boat_ID] [int] NULL,
 CONSTRAINT [PK_Fit] PRIMARY KEY CLUSTERED 
(
	[Fit_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 12.04.2021 13:03:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[Invoice_ID] [int] IDENTITY(1,1) NOT NULL,
	[Contract_ID] [int] NULL,
	[Settled] [bit] NOT NULL,
	[Sum] [money] NOT NULL,
	[Sum_inclVAT] [money] NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[Invoice_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 12.04.2021 13:03:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Order_ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
	[Salesperson_ID] [int] NULL,
	[Customer_ID] [int] NULL,
	[Boat_ID] [int] NULL,
	[DeliveryAddress] [nvarchar](150) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Order_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partner]    Script Date: 12.04.2021 13:03:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partner](
	[Partner_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](150) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Partner] PRIMARY KEY CLUSTERED 
(
	[Partner_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 12.04.2021 13:03:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Role_ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleTitle] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Role_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Salesperson]    Script Date: 12.04.2021 13:03:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salesperson](
	[SalesPerson_ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[FamilyName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Salesperson] PRIMARY KEY CLUSTERED 
(
	[SalesPerson_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 12.04.2021 13:03:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[User_ID] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Role_ID] [int] NULL,
	[RegisteredDate] [date] NOT NULL,
	[IsBlocked] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Accessory] ON 

INSERT [dbo].[Accessory] ([Accessory_ID], [AccName], [DescriptionOfAccessory], [Price], [VAT], [Inventory], [OrderLevel], [OrderBatch], [Partner_ID]) VALUES (1, N'Черпак', N'Деревянный черпак, красный', 2500.0000, N'18,00%', 10, 5, 5, 11)
INSERT [dbo].[Accessory] ([Accessory_ID], [AccName], [DescriptionOfAccessory], [Price], [VAT], [Inventory], [OrderLevel], [OrderBatch], [Partner_ID]) VALUES (2, N'Весло малое', N'малое весло, дубовое', 3000.0000, N'18,00%', 15, 10, 10, 10)
INSERT [dbo].[Accessory] ([Accessory_ID], [AccName], [DescriptionOfAccessory], [Price], [VAT], [Inventory], [OrderLevel], [OrderBatch], [Partner_ID]) VALUES (3, N'Весло среднее', N'Среднее весло, дубовое', 4000.0000, N'18,00%', 20, 10, 20, 11)
INSERT [dbo].[Accessory] ([Accessory_ID], [AccName], [DescriptionOfAccessory], [Price], [VAT], [Inventory], [OrderLevel], [OrderBatch], [Partner_ID]) VALUES (4, N'Весло большое', N'Большое весло, дубовое', 6000.0000, N'18,00%', 18, 10, 20, 13)
INSERT [dbo].[Accessory] ([Accessory_ID], [AccName], [DescriptionOfAccessory], [Price], [VAT], [Inventory], [OrderLevel], [OrderBatch], [Partner_ID]) VALUES (5, N'Зонтик', N'Большой красный зонтик', 4800.0000, N'18,00%', 25, 5, 15, 15)
INSERT [dbo].[Accessory] ([Accessory_ID], [AccName], [DescriptionOfAccessory], [Price], [VAT], [Inventory], [OrderLevel], [OrderBatch], [Partner_ID]) VALUES (6, N'Тент', N'Синий тент', 3000.0000, N'18,00%', 20, 10, 20, 11)
INSERT [dbo].[Accessory] ([Accessory_ID], [AccName], [DescriptionOfAccessory], [Price], [VAT], [Inventory], [OrderLevel], [OrderBatch], [Partner_ID]) VALUES (7, N'Холодильник', N'Холодильник на солнечной энергии', 30000.0000, N'18,00%', 3, 1, 5, 10)
INSERT [dbo].[Accessory] ([Accessory_ID], [AccName], [DescriptionOfAccessory], [Price], [VAT], [Inventory], [OrderLevel], [OrderBatch], [Partner_ID]) VALUES (8, N'Спасжилет Ж', N'Спасательный жилет для женщин', 6000.0000, N'18,00%', 25, 20, 50, 12)
INSERT [dbo].[Accessory] ([Accessory_ID], [AccName], [DescriptionOfAccessory], [Price], [VAT], [Inventory], [OrderLevel], [OrderBatch], [Partner_ID]) VALUES (9, N'Спасжилет М', N'Спасательный жилет для мужчин', 8000.0000, N'18,00%', 45, 20, 50, 12)
INSERT [dbo].[Accessory] ([Accessory_ID], [AccName], [DescriptionOfAccessory], [Price], [VAT], [Inventory], [OrderLevel], [OrderBatch], [Partner_ID]) VALUES (10, N'Спасжилет Д', N'Спасательный жилет для детей', 4000.0000, N'18,00%', 15, 10, 25, 11)
INSERT [dbo].[Accessory] ([Accessory_ID], [AccName], [DescriptionOfAccessory], [Price], [VAT], [Inventory], [OrderLevel], [OrderBatch], [Partner_ID]) VALUES (11, N'Стандартный вахтенный журнал', N'Вахтенный журнал, 100 стр', 3000.0000, N'18,00%', 25, 10, 25, 14)
INSERT [dbo].[Accessory] ([Accessory_ID], [AccName], [DescriptionOfAccessory], [Price], [VAT], [Inventory], [OrderLevel], [OrderBatch], [Partner_ID]) VALUES (12, N'Вахтенный журнал Люкс', N'Вахтенный журнал, деревянная обложка', 4500.0000, N'18,00%', 15, 10, 25, 13)
INSERT [dbo].[Accessory] ([Accessory_ID], [AccName], [DescriptionOfAccessory], [Price], [VAT], [Inventory], [OrderLevel], [OrderBatch], [Partner_ID]) VALUES (13, N'Парусный спорт для спортсменов', N'Учебник по парусному спорту', 1000.0000, N'18,00%', 12, 10, 20, 15)
INSERT [dbo].[Accessory] ([Accessory_ID], [AccName], [DescriptionOfAccessory], [Price], [VAT], [Inventory], [OrderLevel], [OrderBatch], [Partner_ID]) VALUES (14, N'Кепка', N'Капитанская кепка, синяя', 1700.0000, N'18,00%', 24, 20, 20, 14)
SET IDENTITY_INSERT [dbo].[Accessory] OFF
GO
SET IDENTITY_INSERT [dbo].[Boats] ON 

INSERT [dbo].[Boats] ([boat_ID], [Model], [BoatType], [NumberOfRowers], [Mast], [Colour], [Wood], [BasePrice], [VAT]) VALUES (101, N'RB Стандарт', N'Шлюпка', 1, 0, N'Зеленый', N'Ель', 60000.0000, N'18%')
INSERT [dbo].[Boats] ([boat_ID], [Model], [BoatType], [NumberOfRowers], [Mast], [Colour], [Wood], [BasePrice], [VAT]) VALUES (201, N'SB Стандарт', N'Парусная лодка', 0, 1, N'Белый', N'Ель', 280000.0000, N'18%')
INSERT [dbo].[Boats] ([boat_ID], [Model], [BoatType], [NumberOfRowers], [Mast], [Colour], [Wood], [BasePrice], [VAT]) VALUES (202, N'SB Юниор', N'Парусная лодка', 0, 1, N'Красный', N'Сосна', 165000.0000, N'18%')
INSERT [dbo].[Boats] ([boat_ID], [Model], [BoatType], [NumberOfRowers], [Mast], [Colour], [Wood], [BasePrice], [VAT]) VALUES (301, N'G Эконом', N'Галера', 6, 0, N'Черный', N'Сосна', 550000.0000, N'18%')
INSERT [dbo].[Boats] ([boat_ID], [Model], [BoatType], [NumberOfRowers], [Mast], [Colour], [Wood], [BasePrice], [VAT]) VALUES (302, N'G Люкс', N'Галера', 8, 0, N'Синий', N'Дуб', 750000.0000, N'18%')
INSERT [dbo].[Boats] ([boat_ID], [Model], [BoatType], [NumberOfRowers], [Mast], [Colour], [Wood], [BasePrice], [VAT]) VALUES (303, N'G Супер Люкс', N'Галера', 12, 1, N'Коричневый', N'Дуб', 1080000.0000, N'18%')
SET IDENTITY_INSERT [dbo].[Boats] OFF
GO
SET IDENTITY_INSERT [dbo].[Contract] ON 

INSERT [dbo].[Contract] ([Contract_ID], [Date], [DepositPayed], [Order_ID], [ContractTotalPrice], [ContracTotalPrice_inclVAT], [ProductionProcess]) VALUES (10, CAST(N'2015-05-04' AS Date), 96500.0000, 1, 289200.0000, 358608.0000, N'75% готовности')
INSERT [dbo].[Contract] ([Contract_ID], [Date], [DepositPayed], [Order_ID], [ContractTotalPrice], [ContracTotalPrice_inclVAT], [ProductionProcess]) VALUES (11, CAST(N'2015-06-15' AS Date), 250000.0000, 2, 744600.0000, 922884.0000, N'75% готовности')
INSERT [dbo].[Contract] ([Contract_ID], [Date], [DepositPayed], [Order_ID], [ContractTotalPrice], [ContracTotalPrice_inclVAT], [ProductionProcess]) VALUES (12, CAST(N'2015-09-01' AS Date), 22000.0000, 3, 66000.0000, 81840.0000, N'Отделка лодки')
INSERT [dbo].[Contract] ([Contract_ID], [Date], [DepositPayed], [Order_ID], [ContractTotalPrice], [ContracTotalPrice_inclVAT], [ProductionProcess]) VALUES (13, CAST(N'2015-10-10' AS Date), 99000.0000, 4, 294900.0000, 365466.0000, N'50% готовности')
INSERT [dbo].[Contract] ([Contract_ID], [Date], [DepositPayed], [Order_ID], [ContractTotalPrice], [ContracTotalPrice_inclVAT], [ProductionProcess]) VALUES (14, CAST(N'2015-10-10' AS Date), 56000.0000, 5, 171000.0000, 211830.0000, N'Отделка лодки')
INSERT [dbo].[Contract] ([Contract_ID], [Date], [DepositPayed], [Order_ID], [ContractTotalPrice], [ContracTotalPrice_inclVAT], [ProductionProcess]) VALUES (15, CAST(N'2015-11-01' AS Date), 195000.0000, 6, 577800.0000, 716052.0000, N'25% готовности')
INSERT [dbo].[Contract] ([Contract_ID], [Date], [DepositPayed], [Order_ID], [ContractTotalPrice], [ContracTotalPrice_inclVAT], [ProductionProcess]) VALUES (16, CAST(N'2015-03-31' AS Date), 385000.0000, 7, 1154400.0000, 1430868.0000, N'Начато производство')
INSERT [dbo].[Contract] ([Contract_ID], [Date], [DepositPayed], [Order_ID], [ContractTotalPrice], [ContracTotalPrice_inclVAT], [ProductionProcess]) VALUES (17, CAST(N'2015-05-04' AS Date), 257000.0000, 8, 768600.0000, 952644.0000, N'Работы не начаты')
SET IDENTITY_INSERT [dbo].[Contract] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([Customer_ID], [FistName], [FamilyName], [DateOfBirth], [OrganisationName], [Address], [City], [email], [Phone], [DocumentNumber], [DocumentName]) VALUES (111, N'Александр', N'Порков', CAST(N'1986-05-31' AS Date), N'ООО "Венчур капитал"', N'Невский пр., дю43', N'Санкт-Петребург', N'c.bargue@kaarinacruises.fi', N'+7 (915) 142-67-10  ', N'PP6036589', N'Паспорт РФ')
INSERT [dbo].[Customer] ([Customer_ID], [FistName], [FamilyName], [DateOfBirth], [OrganisationName], [Address], [City], [email], [Phone], [DocumentNumber], [DocumentName]) VALUES (112, N'Евгения', N'Сатова', CAST(N'1972-08-01' AS Date), N'ООО "Калипсо"', N'Судостроителей, д. 3', N'Санкт-петербург', N'hanna.hentonen@doublehh.com', N'+7 925 145-18-83    ', N'PK5533478', N'паспорт РФ')
INSERT [dbo].[Customer] ([Customer_ID], [FistName], [FamilyName], [DateOfBirth], [OrganisationName], [Address], [City], [email], [Phone], [DocumentNumber], [DocumentName]) VALUES (113, N'Михаил', N'Буревой', CAST(N'1960-05-03' AS Date), N'', N'ул. Ленина, 15', N'Москва', N'bjorn.bengtson@amundsen.fi', N'+7 916 341-43-20    ', N'452639129', N'Загранпаспорт')
INSERT [dbo].[Customer] ([Customer_ID], [FistName], [FamilyName], [DateOfBirth], [OrganisationName], [Address], [City], [email], [Phone], [DocumentNumber], [DocumentName]) VALUES (114, N'Наталья', N'Поздникова', CAST(N'1953-07-24' AS Date), N'', N'Вишневая улица, ', N'Ростов-на-дону', N'mattim11@hotmail.com', N'+7 926 284-49-80    ', N'PH5663289', N'Паспорт РФ')
INSERT [dbo].[Customer] ([Customer_ID], [FistName], [FamilyName], [DateOfBirth], [OrganisationName], [Address], [City], [email], [Phone], [DocumentNumber], [DocumentName]) VALUES (115, N'Арсений', N'Витарсо', CAST(N'1982-03-01' AS Date), N'ООО "Вартовские пряжи"', N'Проспект Жукова, 1', N'Новосибирск', N'arton@hjauoy.fi', N'+7 915 254-37-86    ', N'562197341', N'Загранпаспорт')
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Detail] ON 

INSERT [dbo].[Detail] ([Detail_ID], [Accessory_ID], [Order_ID]) VALUES (1, 14, 1)
INSERT [dbo].[Detail] ([Detail_ID], [Accessory_ID], [Order_ID]) VALUES (2, 3, 1)
INSERT [dbo].[Detail] ([Detail_ID], [Accessory_ID], [Order_ID]) VALUES (3, 9, 1)
INSERT [dbo].[Detail] ([Detail_ID], [Accessory_ID], [Order_ID]) VALUES (4, 8, 1)
INSERT [dbo].[Detail] ([Detail_ID], [Accessory_ID], [Order_ID]) VALUES (5, 1, 2)
INSERT [dbo].[Detail] ([Detail_ID], [Accessory_ID], [Order_ID]) VALUES (6, 4, 2)
INSERT [dbo].[Detail] ([Detail_ID], [Accessory_ID], [Order_ID]) VALUES (7, 4, 2)
INSERT [dbo].[Detail] ([Detail_ID], [Accessory_ID], [Order_ID]) VALUES (8, 5, 2)
INSERT [dbo].[Detail] ([Detail_ID], [Accessory_ID], [Order_ID]) VALUES (9, 12, 2)
INSERT [dbo].[Detail] ([Detail_ID], [Accessory_ID], [Order_ID]) VALUES (10, 14, 2)
INSERT [dbo].[Detail] ([Detail_ID], [Accessory_ID], [Order_ID]) VALUES (11, 1, 3)
INSERT [dbo].[Detail] ([Detail_ID], [Accessory_ID], [Order_ID]) VALUES (12, 3, 3)
INSERT [dbo].[Detail] ([Detail_ID], [Accessory_ID], [Order_ID]) VALUES (13, 8, 3)
INSERT [dbo].[Detail] ([Detail_ID], [Accessory_ID], [Order_ID]) VALUES (14, 3, 4)
INSERT [dbo].[Detail] ([Detail_ID], [Accessory_ID], [Order_ID]) VALUES (15, 8, 4)
INSERT [dbo].[Detail] ([Detail_ID], [Accessory_ID], [Order_ID]) VALUES (16, 9, 4)
INSERT [dbo].[Detail] ([Detail_ID], [Accessory_ID], [Order_ID]) VALUES (17, 10, 4)
INSERT [dbo].[Detail] ([Detail_ID], [Accessory_ID], [Order_ID]) VALUES (18, 13, 4)
INSERT [dbo].[Detail] ([Detail_ID], [Accessory_ID], [Order_ID]) VALUES (19, 14, 4)
INSERT [dbo].[Detail] ([Detail_ID], [Accessory_ID], [Order_ID]) VALUES (20, 1, 5)
INSERT [dbo].[Detail] ([Detail_ID], [Accessory_ID], [Order_ID]) VALUES (21, 10, 5)
INSERT [dbo].[Detail] ([Detail_ID], [Accessory_ID], [Order_ID]) VALUES (22, 13, 5)
INSERT [dbo].[Detail] ([Detail_ID], [Accessory_ID], [Order_ID]) VALUES (23, 1, 6)
INSERT [dbo].[Detail] ([Detail_ID], [Accessory_ID], [Order_ID]) VALUES (24, 4, 6)
INSERT [dbo].[Detail] ([Detail_ID], [Accessory_ID], [Order_ID]) VALUES (25, 6, 6)
INSERT [dbo].[Detail] ([Detail_ID], [Accessory_ID], [Order_ID]) VALUES (26, 9, 6)
INSERT [dbo].[Detail] ([Detail_ID], [Accessory_ID], [Order_ID]) VALUES (27, 9, 6)
INSERT [dbo].[Detail] ([Detail_ID], [Accessory_ID], [Order_ID]) VALUES (28, 9, 6)
INSERT [dbo].[Detail] ([Detail_ID], [Accessory_ID], [Order_ID]) VALUES (29, 12, 6)
INSERT [dbo].[Detail] ([Detail_ID], [Accessory_ID], [Order_ID]) VALUES (30, 14, 6)
INSERT [dbo].[Detail] ([Detail_ID], [Accessory_ID], [Order_ID]) VALUES (31, 1, 7)
INSERT [dbo].[Detail] ([Detail_ID], [Accessory_ID], [Order_ID]) VALUES (32, 4, 7)
INSERT [dbo].[Detail] ([Detail_ID], [Accessory_ID], [Order_ID]) VALUES (33, 4, 7)
INSERT [dbo].[Detail] ([Detail_ID], [Accessory_ID], [Order_ID]) VALUES (34, 5, 7)
INSERT [dbo].[Detail] ([Detail_ID], [Accessory_ID], [Order_ID]) VALUES (35, 7, 7)
INSERT [dbo].[Detail] ([Detail_ID], [Accessory_ID], [Order_ID]) VALUES (36, 9, 7)
INSERT [dbo].[Detail] ([Detail_ID], [Accessory_ID], [Order_ID]) VALUES (37, 9, 7)
INSERT [dbo].[Detail] ([Detail_ID], [Accessory_ID], [Order_ID]) VALUES (38, 9, 7)
INSERT [dbo].[Detail] ([Detail_ID], [Accessory_ID], [Order_ID]) VALUES (39, 11, 7)
INSERT [dbo].[Detail] ([Detail_ID], [Accessory_ID], [Order_ID]) VALUES (40, 11, 7)
INSERT [dbo].[Detail] ([Detail_ID], [Accessory_ID], [Order_ID]) VALUES (41, 14, 7)
INSERT [dbo].[Detail] ([Detail_ID], [Accessory_ID], [Order_ID]) VALUES (42, 1, 8)
INSERT [dbo].[Detail] ([Detail_ID], [Accessory_ID], [Order_ID]) VALUES (43, 4, 8)
INSERT [dbo].[Detail] ([Detail_ID], [Accessory_ID], [Order_ID]) VALUES (44, 4, 8)
INSERT [dbo].[Detail] ([Detail_ID], [Accessory_ID], [Order_ID]) VALUES (45, 6, 8)
INSERT [dbo].[Detail] ([Detail_ID], [Accessory_ID], [Order_ID]) VALUES (46, 8, 8)
INSERT [dbo].[Detail] ([Detail_ID], [Accessory_ID], [Order_ID]) VALUES (47, 8, 8)
INSERT [dbo].[Detail] ([Detail_ID], [Accessory_ID], [Order_ID]) VALUES (48, 9, 8)
INSERT [dbo].[Detail] ([Detail_ID], [Accessory_ID], [Order_ID]) VALUES (49, 9, 8)
INSERT [dbo].[Detail] ([Detail_ID], [Accessory_ID], [Order_ID]) VALUES (50, 12, 8)
INSERT [dbo].[Detail] ([Detail_ID], [Accessory_ID], [Order_ID]) VALUES (51, 14, 8)
SET IDENTITY_INSERT [dbo].[Detail] OFF
GO
SET IDENTITY_INSERT [dbo].[Fit] ON 

INSERT [dbo].[Fit] ([Fit_ID], [Accessory_ID], [Boat_ID]) VALUES (1, 1, 101)
INSERT [dbo].[Fit] ([Fit_ID], [Accessory_ID], [Boat_ID]) VALUES (2, 1, 201)
INSERT [dbo].[Fit] ([Fit_ID], [Accessory_ID], [Boat_ID]) VALUES (3, 1, 202)
INSERT [dbo].[Fit] ([Fit_ID], [Accessory_ID], [Boat_ID]) VALUES (4, 1, 301)
INSERT [dbo].[Fit] ([Fit_ID], [Accessory_ID], [Boat_ID]) VALUES (5, 1, 302)
INSERT [dbo].[Fit] ([Fit_ID], [Accessory_ID], [Boat_ID]) VALUES (6, 1, 303)
INSERT [dbo].[Fit] ([Fit_ID], [Accessory_ID], [Boat_ID]) VALUES (7, 2, 101)
INSERT [dbo].[Fit] ([Fit_ID], [Accessory_ID], [Boat_ID]) VALUES (8, 2, 201)
INSERT [dbo].[Fit] ([Fit_ID], [Accessory_ID], [Boat_ID]) VALUES (9, 2, 202)
INSERT [dbo].[Fit] ([Fit_ID], [Accessory_ID], [Boat_ID]) VALUES (10, 3, 101)
INSERT [dbo].[Fit] ([Fit_ID], [Accessory_ID], [Boat_ID]) VALUES (11, 3, 201)
INSERT [dbo].[Fit] ([Fit_ID], [Accessory_ID], [Boat_ID]) VALUES (12, 3, 202)
INSERT [dbo].[Fit] ([Fit_ID], [Accessory_ID], [Boat_ID]) VALUES (13, 3, 301)
INSERT [dbo].[Fit] ([Fit_ID], [Accessory_ID], [Boat_ID]) VALUES (14, 3, 302)
INSERT [dbo].[Fit] ([Fit_ID], [Accessory_ID], [Boat_ID]) VALUES (15, 3, 303)
INSERT [dbo].[Fit] ([Fit_ID], [Accessory_ID], [Boat_ID]) VALUES (16, 4, 303)
INSERT [dbo].[Fit] ([Fit_ID], [Accessory_ID], [Boat_ID]) VALUES (17, 5, 303)
INSERT [dbo].[Fit] ([Fit_ID], [Accessory_ID], [Boat_ID]) VALUES (18, 6, 101)
INSERT [dbo].[Fit] ([Fit_ID], [Accessory_ID], [Boat_ID]) VALUES (19, 6, 301)
INSERT [dbo].[Fit] ([Fit_ID], [Accessory_ID], [Boat_ID]) VALUES (20, 6, 302)
INSERT [dbo].[Fit] ([Fit_ID], [Accessory_ID], [Boat_ID]) VALUES (21, 6, 303)
INSERT [dbo].[Fit] ([Fit_ID], [Accessory_ID], [Boat_ID]) VALUES (22, 7, 303)
INSERT [dbo].[Fit] ([Fit_ID], [Accessory_ID], [Boat_ID]) VALUES (23, 8, 101)
INSERT [dbo].[Fit] ([Fit_ID], [Accessory_ID], [Boat_ID]) VALUES (24, 8, 201)
INSERT [dbo].[Fit] ([Fit_ID], [Accessory_ID], [Boat_ID]) VALUES (25, 8, 202)
INSERT [dbo].[Fit] ([Fit_ID], [Accessory_ID], [Boat_ID]) VALUES (26, 8, 301)
INSERT [dbo].[Fit] ([Fit_ID], [Accessory_ID], [Boat_ID]) VALUES (27, 8, 302)
INSERT [dbo].[Fit] ([Fit_ID], [Accessory_ID], [Boat_ID]) VALUES (28, 8, 303)
INSERT [dbo].[Fit] ([Fit_ID], [Accessory_ID], [Boat_ID]) VALUES (29, 9, 101)
INSERT [dbo].[Fit] ([Fit_ID], [Accessory_ID], [Boat_ID]) VALUES (30, 9, 201)
INSERT [dbo].[Fit] ([Fit_ID], [Accessory_ID], [Boat_ID]) VALUES (31, 9, 202)
INSERT [dbo].[Fit] ([Fit_ID], [Accessory_ID], [Boat_ID]) VALUES (32, 9, 301)
INSERT [dbo].[Fit] ([Fit_ID], [Accessory_ID], [Boat_ID]) VALUES (33, 9, 302)
INSERT [dbo].[Fit] ([Fit_ID], [Accessory_ID], [Boat_ID]) VALUES (34, 9, 303)
INSERT [dbo].[Fit] ([Fit_ID], [Accessory_ID], [Boat_ID]) VALUES (35, 10, 101)
INSERT [dbo].[Fit] ([Fit_ID], [Accessory_ID], [Boat_ID]) VALUES (36, 10, 202)
INSERT [dbo].[Fit] ([Fit_ID], [Accessory_ID], [Boat_ID]) VALUES (37, 10, 202)
INSERT [dbo].[Fit] ([Fit_ID], [Accessory_ID], [Boat_ID]) VALUES (38, 10, 301)
INSERT [dbo].[Fit] ([Fit_ID], [Accessory_ID], [Boat_ID]) VALUES (39, 10, 302)
INSERT [dbo].[Fit] ([Fit_ID], [Accessory_ID], [Boat_ID]) VALUES (40, 10, 303)
INSERT [dbo].[Fit] ([Fit_ID], [Accessory_ID], [Boat_ID]) VALUES (41, 11, 201)
INSERT [dbo].[Fit] ([Fit_ID], [Accessory_ID], [Boat_ID]) VALUES (42, 11, 202)
INSERT [dbo].[Fit] ([Fit_ID], [Accessory_ID], [Boat_ID]) VALUES (43, 11, 301)
INSERT [dbo].[Fit] ([Fit_ID], [Accessory_ID], [Boat_ID]) VALUES (44, 11, 302)
INSERT [dbo].[Fit] ([Fit_ID], [Accessory_ID], [Boat_ID]) VALUES (45, 11, 303)
INSERT [dbo].[Fit] ([Fit_ID], [Accessory_ID], [Boat_ID]) VALUES (46, 12, 201)
INSERT [dbo].[Fit] ([Fit_ID], [Accessory_ID], [Boat_ID]) VALUES (47, 12, 202)
INSERT [dbo].[Fit] ([Fit_ID], [Accessory_ID], [Boat_ID]) VALUES (48, 12, 301)
INSERT [dbo].[Fit] ([Fit_ID], [Accessory_ID], [Boat_ID]) VALUES (49, 12, 302)
INSERT [dbo].[Fit] ([Fit_ID], [Accessory_ID], [Boat_ID]) VALUES (50, 12, 303)
INSERT [dbo].[Fit] ([Fit_ID], [Accessory_ID], [Boat_ID]) VALUES (51, 13, 201)
INSERT [dbo].[Fit] ([Fit_ID], [Accessory_ID], [Boat_ID]) VALUES (52, 13, 202)
INSERT [dbo].[Fit] ([Fit_ID], [Accessory_ID], [Boat_ID]) VALUES (53, 14, 101)
INSERT [dbo].[Fit] ([Fit_ID], [Accessory_ID], [Boat_ID]) VALUES (54, 14, 202)
INSERT [dbo].[Fit] ([Fit_ID], [Accessory_ID], [Boat_ID]) VALUES (55, 14, 202)
INSERT [dbo].[Fit] ([Fit_ID], [Accessory_ID], [Boat_ID]) VALUES (56, 14, 301)
INSERT [dbo].[Fit] ([Fit_ID], [Accessory_ID], [Boat_ID]) VALUES (57, 14, 302)
INSERT [dbo].[Fit] ([Fit_ID], [Accessory_ID], [Boat_ID]) VALUES (58, 14, 303)
SET IDENTITY_INSERT [dbo].[Fit] OFF
GO
SET IDENTITY_INSERT [dbo].[Invoice] ON 

INSERT [dbo].[Invoice] ([Invoice_ID], [Contract_ID], [Settled], [Sum], [Sum_inclVAT], [Date]) VALUES (11, 10, 1, 96400.0000, 17352.0000, CAST(N'2014-05-06' AS Date))
INSERT [dbo].[Invoice] ([Invoice_ID], [Contract_ID], [Settled], [Sum], [Sum_inclVAT], [Date]) VALUES (12, 10, 1, 120000.0000, 21600.0000, CAST(N'2014-07-06' AS Date))
INSERT [dbo].[Invoice] ([Invoice_ID], [Contract_ID], [Settled], [Sum], [Sum_inclVAT], [Date]) VALUES (13, 10, 1, 72799.8000, 13103.9600, CAST(N'2014-09-06' AS Date))
INSERT [dbo].[Invoice] ([Invoice_ID], [Contract_ID], [Settled], [Sum], [Sum_inclVAT], [Date]) VALUES (14, 11, 1, 248200.2000, 44676.0400, CAST(N'2014-06-17' AS Date))
INSERT [dbo].[Invoice] ([Invoice_ID], [Contract_ID], [Settled], [Sum], [Sum_inclVAT], [Date]) VALUES (15, 11, 1, 496399.8000, 89351.9600, CAST(N'2014-09-18' AS Date))
INSERT [dbo].[Invoice] ([Invoice_ID], [Contract_ID], [Settled], [Sum], [Sum_inclVAT], [Date]) VALUES (16, 12, 1, 22000.2000, 3960.0400, CAST(N'2014-09-06' AS Date))
INSERT [dbo].[Invoice] ([Invoice_ID], [Contract_ID], [Settled], [Sum], [Sum_inclVAT], [Date]) VALUES (17, 12, 1, 43999.8000, 7919.9600, CAST(N'2014-11-12' AS Date))
INSERT [dbo].[Invoice] ([Invoice_ID], [Contract_ID], [Settled], [Sum], [Sum_inclVAT], [Date]) VALUES (18, 13, 1, 98299.8000, 17693.9600, CAST(N'2014-10-20' AS Date))
INSERT [dbo].[Invoice] ([Invoice_ID], [Contract_ID], [Settled], [Sum], [Sum_inclVAT], [Date]) VALUES (19, 13, 1, 196600.2000, 35388.0400, CAST(N'2015-01-02' AS Date))
INSERT [dbo].[Invoice] ([Invoice_ID], [Contract_ID], [Settled], [Sum], [Sum_inclVAT], [Date]) VALUES (20, 14, 1, 57000.0000, 10260.0000, CAST(N'2014-10-21' AS Date))
INSERT [dbo].[Invoice] ([Invoice_ID], [Contract_ID], [Settled], [Sum], [Sum_inclVAT], [Date]) VALUES (21, 14, 1, 57000.0000, 10260.0000, CAST(N'2014-12-15' AS Date))
INSERT [dbo].[Invoice] ([Invoice_ID], [Contract_ID], [Settled], [Sum], [Sum_inclVAT], [Date]) VALUES (22, 14, 1, 57000.0000, 10260.0000, CAST(N'2015-02-15' AS Date))
INSERT [dbo].[Invoice] ([Invoice_ID], [Contract_ID], [Settled], [Sum], [Sum_inclVAT], [Date]) VALUES (23, 15, 1, 192600.0000, 34668.0000, CAST(N'2015-11-01' AS Date))
INSERT [dbo].[Invoice] ([Invoice_ID], [Contract_ID], [Settled], [Sum], [Sum_inclVAT], [Date]) VALUES (24, 15, 1, 128400.0000, 23112.0000, CAST(N'2015-01-02' AS Date))
INSERT [dbo].[Invoice] ([Invoice_ID], [Contract_ID], [Settled], [Sum], [Sum_inclVAT], [Date]) VALUES (25, 15, 1, 128400.0000, 23112.0000, CAST(N'2015-03-15' AS Date))
INSERT [dbo].[Invoice] ([Invoice_ID], [Contract_ID], [Settled], [Sum], [Sum_inclVAT], [Date]) VALUES (26, 15, 0, 128400.0000, 23112.0000, CAST(N'2015-05-05' AS Date))
INSERT [dbo].[Invoice] ([Invoice_ID], [Contract_ID], [Settled], [Sum], [Sum_inclVAT], [Date]) VALUES (27, 16, 1, 384799.8000, 69263.9600, CAST(N'2015-04-01' AS Date))
INSERT [dbo].[Invoice] ([Invoice_ID], [Contract_ID], [Settled], [Sum], [Sum_inclVAT], [Date]) VALUES (28, 16, 0, 384799.8000, 69263.9600, CAST(N'2015-05-02' AS Date))
INSERT [dbo].[Invoice] ([Invoice_ID], [Contract_ID], [Settled], [Sum], [Sum_inclVAT], [Date]) VALUES (29, 16, 0, 384800.4000, 69264.0700, CAST(N'2015-06-15' AS Date))
INSERT [dbo].[Invoice] ([Invoice_ID], [Contract_ID], [Settled], [Sum], [Sum_inclVAT], [Date]) VALUES (30, 17, 1, 256200.0000, 46116.0000, CAST(N'2015-05-04' AS Date))
INSERT [dbo].[Invoice] ([Invoice_ID], [Contract_ID], [Settled], [Sum], [Sum_inclVAT], [Date]) VALUES (31, 17, 0, 128100.0000, 23058.0000, CAST(N'2015-06-12' AS Date))
INSERT [dbo].[Invoice] ([Invoice_ID], [Contract_ID], [Settled], [Sum], [Sum_inclVAT], [Date]) VALUES (32, 17, 0, 128100.0000, 23058.0000, CAST(N'2015-07-12' AS Date))
INSERT [dbo].[Invoice] ([Invoice_ID], [Contract_ID], [Settled], [Sum], [Sum_inclVAT], [Date]) VALUES (33, 17, 0, 128100.0000, 23058.0000, CAST(N'2015-08-12' AS Date))
INSERT [dbo].[Invoice] ([Invoice_ID], [Contract_ID], [Settled], [Sum], [Sum_inclVAT], [Date]) VALUES (34, 17, 0, 128100.0000, 23058.0000, CAST(N'2015-09-12' AS Date))
SET IDENTITY_INSERT [dbo].[Invoice] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Order_ID], [Date], [Salesperson_ID], [Customer_ID], [Boat_ID], [DeliveryAddress], [City]) VALUES (1, CAST(N'2015-05-04' AS Date), 100, 111, 201, N'  Санкт-Петербург, порт', N'Санкт-Петербург')
INSERT [dbo].[Order] ([Order_ID], [Date], [Salesperson_ID], [Customer_ID], [Boat_ID], [DeliveryAddress], [City]) VALUES (2, CAST(N'2015-06-06' AS Date), 100, 112, 302, N'Кронштадт', N'Кронштадт')
INSERT [dbo].[Order] ([Order_ID], [Date], [Salesperson_ID], [Customer_ID], [Boat_ID], [DeliveryAddress], [City]) VALUES (3, CAST(N'2015-08-12' AS Date), 102, 113, 101, N'Москва, Северный порт', N'Москва')
INSERT [dbo].[Order] ([Order_ID], [Date], [Salesperson_ID], [Customer_ID], [Boat_ID], [DeliveryAddress], [City]) VALUES (4, CAST(N'2015-09-23' AS Date), 101, 115, 201, N'Санкт-Петербург, порт', N'Санкт-Петербург')
INSERT [dbo].[Order] ([Order_ID], [Date], [Salesperson_ID], [Customer_ID], [Boat_ID], [DeliveryAddress], [City]) VALUES (5, CAST(N'2015-10-04' AS Date), 103, 114, 202, N'Казань', N'Казнь')
INSERT [dbo].[Order] ([Order_ID], [Date], [Salesperson_ID], [Customer_ID], [Boat_ID], [DeliveryAddress], [City]) VALUES (6, CAST(N'2015-10-20' AS Date), 100, 115, 301, N'Ростов-на-Дону', N'Ростов-на-Дону')
INSERT [dbo].[Order] ([Order_ID], [Date], [Salesperson_ID], [Customer_ID], [Boat_ID], [DeliveryAddress], [City]) VALUES (7, CAST(N'2015-01-02' AS Date), 102, 111, 303, N'Калининград', N'калининград')
INSERT [dbo].[Order] ([Order_ID], [Date], [Salesperson_ID], [Customer_ID], [Boat_ID], [DeliveryAddress], [City]) VALUES (8, CAST(N'2015-02-15' AS Date), 102, 112, 302, N'Санкт-Петербург', N'Санкт-Петербург')
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[Partner] ON 

INSERT [dbo].[Partner] ([Partner_ID], [Name], [Address], [City]) VALUES (10, N'ООО"Мемфис"', N'испания, Барселона', N'Барселона')
INSERT [dbo].[Partner] ([Partner_ID], [Name], [Address], [City]) VALUES (11, N'ООО "Рога и копыта"', N'Сакт-петербург, Невский проспект, 41', N'Санкт-Петербург')
INSERT [dbo].[Partner] ([Partner_ID], [Name], [Address], [City]) VALUES (12, N'ЗАО "Онский сталелитейный завод', N'Онск, ул. Ленина, д 12', N'Онск')
INSERT [dbo].[Partner] ([Partner_ID], [Name], [Address], [City]) VALUES (13, N'ООО "Верфь"', N'Санкт-Петербург, Северная верфь', N'Санкт-Петербург')
INSERT [dbo].[Partner] ([Partner_ID], [Name], [Address], [City]) VALUES (14, N'ООО "Призманти"', N'Саратов, ул. Советская, д. 87', N'Саратов')
INSERT [dbo].[Partner] ([Partner_ID], [Name], [Address], [City]) VALUES (15, N'ООО "Кабель интрудшекн"', N'г. Москва, Войковская ул., д. 13А', N'Москва')
INSERT [dbo].[Partner] ([Partner_ID], [Name], [Address], [City]) VALUES (16, N'ООО "Картова елице"', N'г. Владивосток, ул. Карелии, д.2', N'Владивосток')
SET IDENTITY_INSERT [dbo].[Partner] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Role_ID], [RoleTitle]) VALUES (1, N'Administrator')
INSERT [dbo].[Role] ([Role_ID], [RoleTitle]) VALUES (2, N'Manager')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Salesperson] ON 

INSERT [dbo].[Salesperson] ([SalesPerson_ID], [FirstName], [FamilyName]) VALUES (100, N'Игорь', N'Авторасков')
INSERT [dbo].[Salesperson] ([SalesPerson_ID], [FirstName], [FamilyName]) VALUES (101, N'Екатерина', N'Иванова')
INSERT [dbo].[Salesperson] ([SalesPerson_ID], [FirstName], [FamilyName]) VALUES (102, N'Яна', N'Свиридова')
INSERT [dbo].[Salesperson] ([SalesPerson_ID], [FirstName], [FamilyName]) VALUES (103, N'Нина', N'Пацкирова')
SET IDENTITY_INSERT [dbo].[Salesperson] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([User_ID], [Login], [Password], [Role_ID], [RegisteredDate], [IsBlocked]) VALUES (1, N'admin', N'admin', 1, CAST(N'2021-04-11' AS Date), 0)
INSERT [dbo].[User] ([User_ID], [Login], [Password], [Role_ID], [RegisteredDate], [IsBlocked]) VALUES (2, N'manager', N'manager', 2, CAST(N'2021-04-11' AS Date), 0)
INSERT [dbo].[User] ([User_ID], [Login], [Password], [Role_ID], [RegisteredDate], [IsBlocked]) VALUES (3, N'test', N'test1', 1, CAST(N'2021-03-11' AS Date), 0)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_RegisteredDate]  DEFAULT (getdate()) FOR [RegisteredDate]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Blocked]  DEFAULT ((0)) FOR [IsBlocked]
GO
ALTER TABLE [dbo].[Accessory]  WITH CHECK ADD  CONSTRAINT [FK_Accessory_Partner] FOREIGN KEY([Partner_ID])
REFERENCES [dbo].[Partner] ([Partner_ID])
GO
ALTER TABLE [dbo].[Accessory] CHECK CONSTRAINT [FK_Accessory_Partner]
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_Contract_Order] FOREIGN KEY([Order_ID])
REFERENCES [dbo].[Order] ([Order_ID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_Contract_Order]
GO
ALTER TABLE [dbo].[Detail]  WITH CHECK ADD  CONSTRAINT [FK_Detail_Accessory] FOREIGN KEY([Accessory_ID])
REFERENCES [dbo].[Accessory] ([Accessory_ID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Detail] CHECK CONSTRAINT [FK_Detail_Accessory]
GO
ALTER TABLE [dbo].[Detail]  WITH CHECK ADD  CONSTRAINT [FK_Detail_Order] FOREIGN KEY([Order_ID])
REFERENCES [dbo].[Order] ([Order_ID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Detail] CHECK CONSTRAINT [FK_Detail_Order]
GO
ALTER TABLE [dbo].[Fit]  WITH CHECK ADD  CONSTRAINT [FK_Fit_Accessory] FOREIGN KEY([Accessory_ID])
REFERENCES [dbo].[Accessory] ([Accessory_ID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Fit] CHECK CONSTRAINT [FK_Fit_Accessory]
GO
ALTER TABLE [dbo].[Fit]  WITH CHECK ADD  CONSTRAINT [FK_Fit_Boats] FOREIGN KEY([Boat_ID])
REFERENCES [dbo].[Boats] ([boat_ID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Fit] CHECK CONSTRAINT [FK_Fit_Boats]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Contract] FOREIGN KEY([Contract_ID])
REFERENCES [dbo].[Contract] ([Contract_ID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Contract]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Boats] FOREIGN KEY([Boat_ID])
REFERENCES [dbo].[Boats] ([boat_ID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Boats]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([Customer_ID])
REFERENCES [dbo].[Customer] ([Customer_ID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Salesperson] FOREIGN KEY([Salesperson_ID])
REFERENCES [dbo].[Salesperson] ([SalesPerson_ID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Salesperson]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([Role_ID])
REFERENCES [dbo].[Role] ([Role_ID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO