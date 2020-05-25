USE [db_beng12CW2]
GO
/****** Object:  Table [dbo].[tbl_posts]    Script Date: 05/25/2020 23:10:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_posts](
	[pid] [int] NOT NULL,
	[ptitle] [varchar](100) NULL,
	[pddate] [date] NULL,
	[pmessage] [varchar](500) NULL,
	[pdate] [date] NULL,
	[pstatus] [tinyint] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tbl_posts] ([pid], [ptitle], [pddate], [pmessage], [pdate], [pstatus]) VALUES (1, N'First Post', CAST(0x27410B00 AS Date), N'Hello,

Your message here.

Thanks you.', CAST(0x21410B00 AS Date), 1)
INSERT [dbo].[tbl_posts] ([pid], [ptitle], [pddate], [pmessage], [pdate], [pstatus]) VALUES (1, N'Second Message', CAST(0x27410B00 AS Date), N'Your message', CAST(0x21410B00 AS Date), 1)
INSERT [dbo].[tbl_posts] ([pid], [ptitle], [pddate], [pmessage], [pdate], [pstatus]) VALUES (1, N'New message', CAST(0x27410B00 AS Date), N'New notification', CAST(0x21410B00 AS Date), 1)
/****** Object:  Table [dbo].[tbl_login]    Script Date: 05/25/2020 23:10:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_login](
	[usr_name] [varchar](50) NOT NULL,
	[usr_pass] [varchar](50) NULL,
	[usr_type] [tinyint] NULL,
	[usr_status] [tinyint] NULL,
 CONSTRAINT [PK_tbl_login] PRIMARY KEY CLUSTERED 
(
	[usr_name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tbl_login] ([usr_name], [usr_pass], [usr_type], [usr_status]) VALUES (N'anne@xys.com', N'456', 1, 0)
INSERT [dbo].[tbl_login] ([usr_name], [usr_pass], [usr_type], [usr_status]) VALUES (N'dumindu@xyz.com', N'123', 1, 1)
INSERT [dbo].[tbl_login] ([usr_name], [usr_pass], [usr_type], [usr_status]) VALUES (N'pat@xyz.com', N'147', 3, 1)
INSERT [dbo].[tbl_login] ([usr_name], [usr_pass], [usr_type], [usr_status]) VALUES (N'sam@xys.com', N'789', 2, 1)
/****** Object:  StoredProcedure [dbo].[getUsers]    Script Date: 05/25/2020 23:10:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[getUsers]
AS
select usr_name,
CASE
WHEN usr_type=1 THEN 'Admin'
WHEN usr_type=2 THEN 'Placement Officer'
WHEN usr_type=3 THEN 'Student'
END AS usr_type
,
CASE
WHEN usr_status=1 THEN 'Active'
WHEN usr_status=0 THEN 'Inactive'
END AS usr_status 
from tbl_login
GO
