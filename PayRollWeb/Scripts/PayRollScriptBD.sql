USE [Nomina]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 16/10/2022 05:54:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] NOT NULL,
	[Name] [varchar](80) NOT NULL,
	[SocialSecurity] [varchar](25) NULL,
	[Address] [varchar](200) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Loans]    Script Date: 16/10/2022 05:54:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loans](
	[Id] [int] NOT NULL,
	[Employee] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[Amount] [money] NOT NULL,
	[Balance] [money] NOT NULL,
 CONSTRAINT [PK_Loans] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PayRoll]    Script Date: 16/10/2022 05:54:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PayRoll](
	[Id] [int] NOT NULL,
	[Employee] [int] NOT NULL,
	[Salary] [money] NOT NULL,
 CONSTRAINT [PK_PayRoll] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PayRollDetail]    Script Date: 16/10/2022 05:54:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PayRollDetail](
	[Id] [int] NOT NULL,
	[ExtraDay] [money] NULL,
	[Advancement] [money] NULL,
	[Loan] [int] NULL,
	[Incentive] [money] NULL,
	[Holidays] [money] NULL,
	[Bonus] [money] NULL,
	[Date] [datetime] NOT NULL,
	[PayRoll] [int] NOT NULL,
 CONSTRAINT [PK_PayRollDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Loans]  WITH CHECK ADD  CONSTRAINT [FK_Loans_Employee] FOREIGN KEY([Employee])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[Loans] CHECK CONSTRAINT [FK_Loans_Employee]
GO
ALTER TABLE [dbo].[PayRoll]  WITH CHECK ADD  CONSTRAINT [FK_PayRoll_Employee] FOREIGN KEY([Employee])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[PayRoll] CHECK CONSTRAINT [FK_PayRoll_Employee]
GO
ALTER TABLE [dbo].[PayRollDetail]  WITH CHECK ADD  CONSTRAINT [FK_PayRollDetail_Loans] FOREIGN KEY([Loan])
REFERENCES [dbo].[Loans] ([Id])
GO
ALTER TABLE [dbo].[PayRollDetail] CHECK CONSTRAINT [FK_PayRollDetail_Loans]
GO
ALTER TABLE [dbo].[PayRollDetail]  WITH CHECK ADD  CONSTRAINT [FK_PayRollDetail_PayRoll] FOREIGN KEY([PayRoll])
REFERENCES [dbo].[PayRoll] ([Id])
GO
ALTER TABLE [dbo].[PayRollDetail] CHECK CONSTRAINT [FK_PayRollDetail_PayRoll]
GO
