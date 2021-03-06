/****** Object:  ForeignKey [FK_User_ID]    Script Date: 05/06/2010 02:14:53 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_ID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tasks]'))
ALTER TABLE [dbo].[Tasks] DROP CONSTRAINT [FK_User_ID]
GO
/****** Object:  Table [dbo].[Tasks]    Script Date: 05/06/2010 02:14:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tasks]') AND type in (N'U'))
DROP TABLE [dbo].[Tasks]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 05/06/2010 02:14:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
DROP TABLE [dbo].[Users]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 05/06/2010 02:14:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[SignupDate] [datetime] NOT NULL,
	[OpenId] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Email] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK__Users__ID] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[Users] ON
INSERT [dbo].[Users] ([Id], [Name], [SignupDate], [OpenId], [Email]) VALUES (1, N'ripper234.com', CAST(0x00009D6E001C5264 AS DateTime), N'http://ripper234.com/', NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  Table [dbo].[Tasks]    Script Date: 05/06/2010 02:14:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tasks]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Tasks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Text] [nvarchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[DueDate] [date] NOT NULL,
	[IsDone] [tinyint] NOT NULL,
	[Importance] [tinyint] NOT NULL,
	[PriorityInDay] [tinyint] NOT NULL,
	[Deleted] [tinyint] NOT NULL,
 CONSTRAINT [PK__Tasks__ID] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[Tasks] ON
INSERT [dbo].[Tasks] ([Id], [UserId], [Text], [CreationDate], [DueDate], [IsDone], [Importance], [PriorityInDay], [Deleted]) VALUES (20, 1, N'Deploy Kuzando', CAST(0x00009D6E001C5840 AS DateTime), CAST(0xC9320B00 AS Date), 0, 0, 1, 0)
INSERT [dbo].[Tasks] ([Id], [UserId], [Text], [CreationDate], [DueDate], [IsDone], [Importance], [PriorityInDay], [Deleted]) VALUES (21, 1, N'Party', CAST(0x00009D6E001C677C AS DateTime), CAST(0xCA320B00 AS Date), 0, 0, 2, 0)
SET IDENTITY_INSERT [dbo].[Tasks] OFF
/****** Object:  ForeignKey [FK_User_ID]    Script Date: 05/06/2010 02:14:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_ID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tasks]'))
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_User_ID] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_ID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tasks]'))
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_User_ID]
GO
