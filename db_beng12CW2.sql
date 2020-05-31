USE [db_beng12CW2]
GO
/****** Object:  Table [dbo].[tbl_student]    Script Date: 05/31/2020 19:52:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_student](
	[std_id] [char](8) NOT NULL,
	[std_name] [varchar](50) NULL,
	[std_address] [varchar](100) NULL,
	[std_email] [varchar](50) NULL,
	[std_phone] [char](11) NULL,
	[std_dob] [date] NULL,
	[std_gender] [tinyint] NULL,
	[std_status] [tinyint] NULL,
 CONSTRAINT [PK_tbl_student] PRIMARY KEY CLUSTERED 
(
	[std_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tbl_student] ([std_id], [std_name], [std_address], [std_email], [std_phone], [std_dob], [std_gender], [std_status]) VALUES (N'STD00001', N'Dumindu Pahalawatta', N'Kandy', N'dumindu@xyz.com', N'077-4567891', CAST(0xC3150B00 AS Date), 1, 1)
INSERT [dbo].[tbl_student] ([std_id], [std_name], [std_address], [std_email], [std_phone], [std_dob], [std_gender], [std_status]) VALUES (N'STD00002', N'Anne Marry', N'Colombo', N'anne@xyz.com', N'071-7894565', CAST(0x751D0B00 AS Date), 0, 1)
/****** Object:  Table [dbo].[tbl_posts]    Script Date: 05/31/2020 19:52:39 ******/
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
/****** Object:  Table [dbo].[tbl_login]    Script Date: 05/31/2020 19:52:39 ******/
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
INSERT [dbo].[tbl_login] ([usr_name], [usr_pass], [usr_type], [usr_status]) VALUES (N'anne@xys.com', N'456', 1, 1)
INSERT [dbo].[tbl_login] ([usr_name], [usr_pass], [usr_type], [usr_status]) VALUES (N'dumindu@xyz.com', N'123', 1, 1)
INSERT [dbo].[tbl_login] ([usr_name], [usr_pass], [usr_type], [usr_status]) VALUES (N'pat@xyz.com', N'147', 3, 1)
INSERT [dbo].[tbl_login] ([usr_name], [usr_pass], [usr_type], [usr_status]) VALUES (N'sam@xys.com', N'789', 2, 0)
/****** Object:  StoredProcedure [dbo].[getUsers]    Script Date: 05/31/2020 19:52:37 ******/
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
/****** Object:  StoredProcedure [dbo].[gerStudents]    Script Date: 05/31/2020 19:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[gerStudents]
 AS
 select std_id,std_name,std_address,std_email,std_phone,std_dob,
CASE
WHEN std_gender=1 THEN 'Male'
WHEN std_gender=0 THEN 'FeMale'
END AS std_gender
 from tbl_student where std_status=1
GO
