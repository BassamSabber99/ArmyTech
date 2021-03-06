USE [ArmyTechTask]
GO
/****** Object:  Table [dbo].[CareerField]    Script Date: 23/05/2021 12:36:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CareerField](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_CareerField] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CompanyJob]    Script Date: 23/05/2021 12:36:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyJob](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[JobArrangement] [int] NOT NULL,
 CONSTRAINT [PK_CompanyJob] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee]    Script Date: 23/05/2021 12:36:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[BirthGovernorateId] [int] NOT NULL,
	[BirthNeighborhoodId] [int] NOT NULL,
	[CareerFieldId] [int] NULL,
	[Address] [nvarchar](max) NULL,
	[CompanyJobId] [int] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EmployeeQualification]    Script Date: 23/05/2021 12:36:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeQualification](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[QualificationId] [int] NOT NULL,
	[EmployeeId] [int] NOT NULL,
 CONSTRAINT [PK_EmployeeQualification] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Governorate]    Script Date: 23/05/2021 12:36:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Governorate](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Governorate_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Neighborhood]    Script Date: 23/05/2021 12:36:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Neighborhood](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[GovernorateId] [int] NOT NULL,
 CONSTRAINT [PK_Neighborhood_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Qualification]    Script Date: 23/05/2021 12:36:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Qualification](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Qualification] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[CareerField] ON 

GO
INSERT [dbo].[CareerField] ([ID], [Name]) VALUES (1, N'هندسي')
GO
INSERT [dbo].[CareerField] ([ID], [Name]) VALUES (2, N'تنميه ادارية')
GO
INSERT [dbo].[CareerField] ([ID], [Name]) VALUES (3, N'مكتبيه')
GO
INSERT [dbo].[CareerField] ([ID], [Name]) VALUES (4, N'علوم')
GO
SET IDENTITY_INSERT [dbo].[CareerField] OFF
GO
SET IDENTITY_INSERT [dbo].[CompanyJob] ON 

GO
INSERT [dbo].[CompanyJob] ([ID], [Name], [JobArrangement]) VALUES (1, N'مدير عام', 1)
GO
INSERT [dbo].[CompanyJob] ([ID], [Name], [JobArrangement]) VALUES (2, N'مدير ادارة', 2)
GO
INSERT [dbo].[CompanyJob] ([ID], [Name], [JobArrangement]) VALUES (3, N'رئيس قسم', 3)
GO
INSERT [dbo].[CompanyJob] ([ID], [Name], [JobArrangement]) VALUES (4, N'مهندس', 4)
GO
INSERT [dbo].[CompanyJob] ([ID], [Name], [JobArrangement]) VALUES (5, N'عامل خدمات', 5)
GO
SET IDENTITY_INSERT [dbo].[CompanyJob] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

GO
INSERT [dbo].[Employee] ([ID], [Name], [BirthGovernorateId], [BirthNeighborhoodId], [CareerFieldId], [Address], [CompanyJobId]) VALUES (1, N'محمد ابراهيم', 1, 1, 1, NULL, 1)
GO
INSERT [dbo].[Employee] ([ID], [Name], [BirthGovernorateId], [BirthNeighborhoodId], [CareerFieldId], [Address], [CompanyJobId]) VALUES (2, N'محمود السعيد', 1, 2, 1, NULL, 2)
GO
INSERT [dbo].[Employee] ([ID], [Name], [BirthGovernorateId], [BirthNeighborhoodId], [CareerFieldId], [Address], [CompanyJobId]) VALUES (3, N'محمد احمد محمود', 2, 4, NULL, NULL, 3)
GO
INSERT [dbo].[Employee] ([ID], [Name], [BirthGovernorateId], [BirthNeighborhoodId], [CareerFieldId], [Address], [CompanyJobId]) VALUES (4, N'كريم سعيد', 2, 3, NULL, NULL, 4)
GO
INSERT [dbo].[Employee] ([ID], [Name], [BirthGovernorateId], [BirthNeighborhoodId], [CareerFieldId], [Address], [CompanyJobId]) VALUES (5, N'احمد مجدي محمود', 4, 5, NULL, NULL, 5)
GO
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[EmployeeQualification] ON 

GO
INSERT [dbo].[EmployeeQualification] ([ID], [QualificationId], [EmployeeId]) VALUES (1, 2, 1)
GO
INSERT [dbo].[EmployeeQualification] ([ID], [QualificationId], [EmployeeId]) VALUES (2, 5, 1)
GO
INSERT [dbo].[EmployeeQualification] ([ID], [QualificationId], [EmployeeId]) VALUES (3, 1, 2)
GO
INSERT [dbo].[EmployeeQualification] ([ID], [QualificationId], [EmployeeId]) VALUES (4, 3, 3)
GO
INSERT [dbo].[EmployeeQualification] ([ID], [QualificationId], [EmployeeId]) VALUES (5, 7, 5)
GO
SET IDENTITY_INSERT [dbo].[EmployeeQualification] OFF
GO
SET IDENTITY_INSERT [dbo].[Governorate] ON 

GO
INSERT [dbo].[Governorate] ([ID], [Name]) VALUES (1, N'محافظة القاهرة')
GO
INSERT [dbo].[Governorate] ([ID], [Name]) VALUES (2, N'محافظة الدقهليه')
GO
INSERT [dbo].[Governorate] ([ID], [Name]) VALUES (3, N'محافظة الغربيه')
GO
INSERT [dbo].[Governorate] ([ID], [Name]) VALUES (4, N'محافظة الاسكندريه')
GO
SET IDENTITY_INSERT [dbo].[Governorate] OFF
GO
SET IDENTITY_INSERT [dbo].[Neighborhood] ON 

GO
INSERT [dbo].[Neighborhood] ([ID], [Name], [GovernorateId]) VALUES (1, N'حي مدينة نصر', 1)
GO
INSERT [dbo].[Neighborhood] ([ID], [Name], [GovernorateId]) VALUES (2, N'حي مصر الجديده', 1)
GO
INSERT [dbo].[Neighborhood] ([ID], [Name], [GovernorateId]) VALUES (3, N'حي المنصورة', 2)
GO
INSERT [dbo].[Neighborhood] ([ID], [Name], [GovernorateId]) VALUES (4, N'حي نبروه', 2)
GO
INSERT [dbo].[Neighborhood] ([ID], [Name], [GovernorateId]) VALUES (5, N'حي المنتزه', 4)
GO
INSERT [dbo].[Neighborhood] ([ID], [Name], [GovernorateId]) VALUES (6, N'حي العامريه', 4)
GO
SET IDENTITY_INSERT [dbo].[Neighborhood] OFF
GO
SET IDENTITY_INSERT [dbo].[Qualification] ON 

GO
INSERT [dbo].[Qualification] ([ID], [Name]) VALUES (1, N'بكالوريوس هندسه')
GO
INSERT [dbo].[Qualification] ([ID], [Name]) VALUES (2, N'بكالوريوس حاسبات ومعلومات')
GO
INSERT [dbo].[Qualification] ([ID], [Name]) VALUES (3, N'بكالوريوس تجاره')
GO
INSERT [dbo].[Qualification] ([ID], [Name]) VALUES (4, N'ليسانس اداب')
GO
INSERT [dbo].[Qualification] ([ID], [Name]) VALUES (5, N'ثانويه عامه')
GO
INSERT [dbo].[Qualification] ([ID], [Name]) VALUES (6, N'ثانوي صناعي')
GO
INSERT [dbo].[Qualification] ([ID], [Name]) VALUES (7, N'دبلوم صناعي')
GO
SET IDENTITY_INSERT [dbo].[Qualification] OFF
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_CareerField] FOREIGN KEY([CareerFieldId])
REFERENCES [dbo].[CareerField] ([ID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_CareerField]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_CompanyJob] FOREIGN KEY([CompanyJobId])
REFERENCES [dbo].[CompanyJob] ([ID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_CompanyJob]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Governorate] FOREIGN KEY([BirthGovernorateId])
REFERENCES [dbo].[Governorate] ([ID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Governorate]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Neighborhood] FOREIGN KEY([BirthNeighborhoodId])
REFERENCES [dbo].[Neighborhood] ([ID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Neighborhood]
GO
ALTER TABLE [dbo].[EmployeeQualification]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeQualification_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([ID])
GO
ALTER TABLE [dbo].[EmployeeQualification] CHECK CONSTRAINT [FK_EmployeeQualification_Employee]
GO
ALTER TABLE [dbo].[EmployeeQualification]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeQualification_Qualification] FOREIGN KEY([QualificationId])
REFERENCES [dbo].[Qualification] ([ID])
GO
ALTER TABLE [dbo].[EmployeeQualification] CHECK CONSTRAINT [FK_EmployeeQualification_Qualification]
GO
ALTER TABLE [dbo].[Neighborhood]  WITH CHECK ADD  CONSTRAINT [FK_Neighborhood_Governorate1] FOREIGN KEY([GovernorateId])
REFERENCES [dbo].[Governorate] ([ID])
GO
ALTER TABLE [dbo].[Neighborhood] CHECK CONSTRAINT [FK_Neighborhood_Governorate1]
GO
