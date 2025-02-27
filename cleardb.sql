USE [FootballLeague_1]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 7/11/2024 9:34:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Description] [ntext] NOT NULL,
	[Image] [image] NOT NULL,
	[CreateAt] [datetime] NOT NULL,
	[UpdateAt] [datetime] NULL,
	[DeleteAt] [datetime] NULL,
	[Status] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[LeagueId] [int] NULL,
 CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Card]    Script Date: 7/11/2024 9:34:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Card](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](50) NOT NULL,
	[Team_MemberId] [int] NOT NULL,
	[MatchId] [int] NOT NULL,
	[TeamId] [int] NOT NULL,
	[Card_Time] [int] NOT NULL,
 CONSTRAINT [PK_Match_Card] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 7/11/2024 9:34:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BlogId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Content] [ntext] NOT NULL,
	[CreateAt] [datetime] NOT NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 7/11/2024 9:34:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Content] [ntext] NOT NULL,
	[CreateAt] [datetime] NOT NULL,
	[UserId] [int] NOT NULL,
	[LeagueId] [int] NOT NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Goal]    Script Date: 7/11/2024 9:34:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Goal](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Goal_Time] [int] NOT NULL,
	[Team_MemberId] [int] NOT NULL,
	[MatchId] [int] NOT NULL,
	[TeamId] [int] NOT NULL,
 CONSTRAINT [PK_Match_Goal] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[League]    Script Date: 7/11/2024 9:34:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[League](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [ntext] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[Address] [nvarchar](255) NOT NULL,
	[TeamSize] [int] NOT NULL,
	[CreateAt] [datetime] NOT NULL,
	[UpdateAt] [datetime] NULL,
	[DeleteAt] [datetime] NULL,
	[UserId] [int] NOT NULL,
	[Image] [image] NOT NULL,
	[Type] [nvarchar](100) NOT NULL,
	[DateRegister] [date] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_League] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Match]    Script Date: 7/11/2024 9:34:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Match](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LeagueId] [int] NOT NULL,
	[HomeTeamId] [int] NOT NULL,
	[AwayTeamId] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](255) NOT NULL,
	[StartAt] [datetime] NOT NULL,
	[EndAt] [datetime] NOT NULL,
	[UpdateAt] [datetime] NULL,
	[ScoreHome] [int] NULL,
	[ScoreAway] [int] NULL,
 CONSTRAINT [PK_Match] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 7/11/2024 9:34:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Team]    Script Date: 7/11/2024 9:34:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Team](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ShortName] [varchar](10) NOT NULL,
	[Description] [ntext] NOT NULL,
	[TeamSize] [int] NOT NULL,
	[Image] [image] NOT NULL,
	[CreateAt] [date] NOT NULL,
	[UpdateAt] [date] NULL,
	[DeleteAt] [date] NULL,
	[IsActive] [bit] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_Team] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Team_League]    Script Date: 7/11/2024 9:34:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Team_League](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TeamId] [int] NOT NULL,
	[LeagueId] [int] NOT NULL,
	[RegisterAt] [datetime] NOT NULL,
	[Point] [int] NULL,
	[Status] [int] NULL,
	[Wins] [int] NOT NULL,
	[Loses] [int] NOT NULL,
	[Ties] [int] NOT NULL,
 CONSTRAINT [PK_Team_League] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Team_Member]    Script Date: 7/11/2024 9:34:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Team_Member](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Number] [int] NOT NULL,
	[TeamId] [int] NOT NULL,
 CONSTRAINT [PK_Team_Member] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransitionHistory]    Script Date: 7/11/2024 9:34:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransitionHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](255) NOT NULL,
	[CreateAt] [datetime] NOT NULL,
	[UpdateAt] [datetime] NULL,
	[WalletId] [int] NOT NULL,
 CONSTRAINT [PK_TransitionHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 7/11/2024 9:34:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Phone] [char](10) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreateAt] [date] NULL,
	[UpdateAt] [date] NULL,
	[DeleteAt] [date] NULL,
	[Image] [image] NULL,
	[RoleId] [int] NULL,
	[IsConfirm] [bit] NULL,
	[IsRequest] [bit] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserWallet]    Script Date: 7/11/2024 9:34:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserWallet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ammount] [money] NOT NULL,
	[CreateAt] [datetime] NOT NULL,
	[UpdateAt] [datetime] NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_UserWallet] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserWalletOrder]    Script Date: 7/11/2024 9:34:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserWalletOrder](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserWalletId] [int] NOT NULL,
	[Ammount] [money] NOT NULL,
	[CreateAt] [datetime] NOT NULL,
	[Status] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_UserWalletOrder] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (1, N'Customer')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (2, N'Admin')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (3, N'Owner')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [UserName], [Password], [FirstName], [LastName], [Phone], [Email], [IsActive], [CreateAt], [UpdateAt], [DeleteAt], [Image], [RoleId], [IsConfirm], [IsRequest]) VALUES (1, N'team1', N'12345', N'Xuan', N'Hung', N'123456789 ', N'hung@gmail.com', 1, CAST(N'2024-03-02' AS Date), NULL, NULL, NULL, 1, 1, 0)
INSERT [dbo].[User] ([Id], [UserName], [Password], [FirstName], [LastName], [Phone], [Email], [IsActive], [CreateAt], [UpdateAt], [DeleteAt], [Image], [RoleId], [IsConfirm], [IsRequest]) VALUES (2, N'chugiai', N'123', N'Chu ', N'San', N'123456789 ', N'chusan@gmail.com', 1, CAST(N'2024-03-02' AS Date), NULL, NULL, NULL, 3, 1, 0)
INSERT [dbo].[User] ([Id], [UserName], [Password], [FirstName], [LastName], [Phone], [Email], [IsActive], [CreateAt], [UpdateAt], [DeleteAt], [Image], [RoleId], [IsConfirm], [IsRequest]) VALUES (4, N'admin', N'12345', N'Admin', N'admin', N'123456788 ', N'admin@gmail.com', 1, CAST(N'2024-03-02' AS Date), NULL, NULL, NULL, 2, 1, 0)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Team_League] ADD  CONSTRAINT [DEFAULT_Team_League_Wins]  DEFAULT ((0)) FOR [Wins]
GO
ALTER TABLE [dbo].[Team_League] ADD  CONSTRAINT [DEFAULT_Team_League_Loses]  DEFAULT ((0)) FOR [Loses]
GO
ALTER TABLE [dbo].[Team_League] ADD  CONSTRAINT [DEFAULT_Team_League_Ties]  DEFAULT ((0)) FOR [Ties]
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD  CONSTRAINT [FK_Blog_League] FOREIGN KEY([LeagueId])
REFERENCES [dbo].[League] ([Id])
GO
ALTER TABLE [dbo].[Blog] CHECK CONSTRAINT [FK_Blog_League]
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD  CONSTRAINT [FK_Blog_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Blog] CHECK CONSTRAINT [FK_Blog_User]
GO
ALTER TABLE [dbo].[Card]  WITH CHECK ADD  CONSTRAINT [FK_Match_Card_Match] FOREIGN KEY([MatchId])
REFERENCES [dbo].[Match] ([Id])
GO
ALTER TABLE [dbo].[Card] CHECK CONSTRAINT [FK_Match_Card_Match]
GO
ALTER TABLE [dbo].[Card]  WITH CHECK ADD  CONSTRAINT [FK_Match_Card_Team_Member] FOREIGN KEY([Team_MemberId])
REFERENCES [dbo].[Team_Member] ([Id])
GO
ALTER TABLE [dbo].[Card] CHECK CONSTRAINT [FK_Match_Card_Team_Member]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Blog] FOREIGN KEY([BlogId])
REFERENCES [dbo].[Blog] ([Id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Blog]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_User]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_League] FOREIGN KEY([LeagueId])
REFERENCES [dbo].[League] ([Id])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_League]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_User]
GO
ALTER TABLE [dbo].[Goal]  WITH CHECK ADD  CONSTRAINT [FK_Match_Goal_Match] FOREIGN KEY([MatchId])
REFERENCES [dbo].[Match] ([Id])
GO
ALTER TABLE [dbo].[Goal] CHECK CONSTRAINT [FK_Match_Goal_Match]
GO
ALTER TABLE [dbo].[Goal]  WITH CHECK ADD  CONSTRAINT [FK_Match_Goal_Team] FOREIGN KEY([TeamId])
REFERENCES [dbo].[Team] ([Id])
GO
ALTER TABLE [dbo].[Goal] CHECK CONSTRAINT [FK_Match_Goal_Team]
GO
ALTER TABLE [dbo].[Goal]  WITH CHECK ADD  CONSTRAINT [FK_Match_Goal_Team_Member] FOREIGN KEY([Team_MemberId])
REFERENCES [dbo].[Team_Member] ([Id])
GO
ALTER TABLE [dbo].[Goal] CHECK CONSTRAINT [FK_Match_Goal_Team_Member]
GO
ALTER TABLE [dbo].[League]  WITH CHECK ADD  CONSTRAINT [FK_League_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[League] CHECK CONSTRAINT [FK_League_User]
GO
ALTER TABLE [dbo].[Match]  WITH CHECK ADD  CONSTRAINT [FK_Match_League] FOREIGN KEY([LeagueId])
REFERENCES [dbo].[League] ([Id])
GO
ALTER TABLE [dbo].[Match] CHECK CONSTRAINT [FK_Match_League]
GO
ALTER TABLE [dbo].[Match]  WITH CHECK ADD  CONSTRAINT [FK_Match_Team] FOREIGN KEY([HomeTeamId])
REFERENCES [dbo].[Team] ([Id])
GO
ALTER TABLE [dbo].[Match] CHECK CONSTRAINT [FK_Match_Team]
GO
ALTER TABLE [dbo].[Match]  WITH CHECK ADD  CONSTRAINT [FK_Match_Team1] FOREIGN KEY([HomeTeamId])
REFERENCES [dbo].[Team] ([Id])
GO
ALTER TABLE [dbo].[Match] CHECK CONSTRAINT [FK_Match_Team1]
GO
ALTER TABLE [dbo].[Team]  WITH CHECK ADD  CONSTRAINT [FK_Team_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Team] CHECK CONSTRAINT [FK_Team_User]
GO
ALTER TABLE [dbo].[Team_League]  WITH CHECK ADD  CONSTRAINT [FK_Team_League_League] FOREIGN KEY([LeagueId])
REFERENCES [dbo].[League] ([Id])
GO
ALTER TABLE [dbo].[Team_League] CHECK CONSTRAINT [FK_Team_League_League]
GO
ALTER TABLE [dbo].[Team_League]  WITH CHECK ADD  CONSTRAINT [FK_Team_League_Team] FOREIGN KEY([TeamId])
REFERENCES [dbo].[Team] ([Id])
GO
ALTER TABLE [dbo].[Team_League] CHECK CONSTRAINT [FK_Team_League_Team]
GO
ALTER TABLE [dbo].[Team_Member]  WITH CHECK ADD  CONSTRAINT [FK_Team_Member_Team] FOREIGN KEY([TeamId])
REFERENCES [dbo].[Team] ([Id])
GO
ALTER TABLE [dbo].[Team_Member] CHECK CONSTRAINT [FK_Team_Member_Team]
GO
ALTER TABLE [dbo].[TransitionHistory]  WITH CHECK ADD  CONSTRAINT [FK_TransitionHistory_UserWallet] FOREIGN KEY([WalletId])
REFERENCES [dbo].[UserWallet] ([Id])
GO
ALTER TABLE [dbo].[TransitionHistory] CHECK CONSTRAINT [FK_TransitionHistory_UserWallet]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
ALTER TABLE [dbo].[UserWallet]  WITH CHECK ADD  CONSTRAINT [FK_UserWallet_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[UserWallet] CHECK CONSTRAINT [FK_UserWallet_User]
GO
ALTER TABLE [dbo].[UserWalletOrder]  WITH CHECK ADD  CONSTRAINT [FK_UserWalletOrder_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[UserWalletOrder] CHECK CONSTRAINT [FK_UserWalletOrder_User]
GO
ALTER TABLE [dbo].[UserWalletOrder]  WITH CHECK ADD  CONSTRAINT [FK_UserWalletOrder_UserWallet] FOREIGN KEY([UserWalletId])
REFERENCES [dbo].[UserWallet] ([Id])
GO
ALTER TABLE [dbo].[UserWalletOrder] CHECK CONSTRAINT [FK_UserWalletOrder_UserWallet]
GO
