USE [master]
GO
/****** Object:  Database [miaowsys]    Script Date: 2013/7/14 20:56:48 ******/
CREATE DATABASE [miaowsys]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'miaowsys', FILENAME = N'D:\Database\miaowsys.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'miaowsys_log', FILENAME = N'D:\Database\miaowsys_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [miaowsys] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [miaowsys].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [miaowsys] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [miaowsys] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [miaowsys] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [miaowsys] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [miaowsys] SET ARITHABORT OFF 
GO
ALTER DATABASE [miaowsys] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [miaowsys] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [miaowsys] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [miaowsys] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [miaowsys] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [miaowsys] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [miaowsys] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [miaowsys] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [miaowsys] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [miaowsys] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [miaowsys] SET  DISABLE_BROKER 
GO
ALTER DATABASE [miaowsys] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [miaowsys] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [miaowsys] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [miaowsys] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [miaowsys] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [miaowsys] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [miaowsys] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [miaowsys] SET RECOVERY FULL 
GO
ALTER DATABASE [miaowsys] SET  MULTI_USER 
GO
ALTER DATABASE [miaowsys] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [miaowsys] SET DB_CHAINING OFF 
GO
ALTER DATABASE [miaowsys] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [miaowsys] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [miaowsys]
GO
/****** Object:  Table [dbo].[m_group_info]    Script Date: 2013/7/14 20:56:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_group_info](
	[group_id] [nvarchar](50) NOT NULL,
	[user_id] [nvarchar](50) NOT NULL,
	[group_name] [nvarchar](100) NULL,
	[group_type_id] [nvarchar](50) NOT NULL,
	[created_time] [datetime] NOT NULL,
	[updated_time] [datetime] NULL,
	[deleted] [int] NULL,
	[deleted_time] [datetime] NULL,
 CONSTRAINT [PK_m_group_info] PRIMARY KEY CLUSTERED 
(
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[m_group_type_info]    Script Date: 2013/7/14 20:56:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_group_type_info](
	[group_type_id] [nvarchar](50) NOT NULL,
	[group_type_name] [nvarchar](100) NOT NULL,
	[created_time] [datetime] NOT NULL,
	[updated_time] [datetime] NULL,
	[deleted] [int] NULL,
	[deleted_time] [datetime] NULL,
 CONSTRAINT [PK_m_group_type_info] PRIMARY KEY CLUSTERED 
(
	[group_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[m_msg_info]    Script Date: 2013/7/14 20:56:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_msg_info](
	[user_id] [int] NULL,
	[msg_id] [int] NULL,
	[content] [ntext] NULL,
	[type] [int] NULL,
	[commented_count] [int] NULL,
	[comment_count] [int] NULL,
	[transferred_count] [int] NULL,
	[transfer_count] [int] NULL,
	[time_t] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[m_msg_msg_relation]    Script Date: 2013/7/14 20:56:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_msg_msg_relation](
	[reference_id] [int] NULL,
	[reference _msg_id] [int] NULL,
	[referenced_id] [int] NULL,
	[referenced _msg_id] [int] NULL,
	[type] [int] NULL,
	[time_t] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[m_profile_info]    Script Date: 2013/7/14 20:56:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_profile_info](
	[profile_id] [nvarchar](40) NOT NULL,
	[user_id] [nvarchar](40) NOT NULL,
	[profile_image_url] [nvarchar](100) NOT NULL,
	[createdtime] [datetime] NOT NULL,
 CONSTRAINT [PK_m_profile_info] PRIMARY KEY CLUSTERED 
(
	[profile_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[m_tag_info]    Script Date: 2013/7/14 20:56:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_tag_info](
	[tag_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [nvarchar](40) NULL,
	[tags] [nvarchar](50) NULL,
	[createdtime] [datetime] NULL,
 CONSTRAINT [PK_m_tag_info] PRIMARY KEY CLUSTERED 
(
	[tag_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[m_user_index_info]    Script Date: 2013/7/14 20:56:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_user_index_info](
	[user_id] [int] NOT NULL,
	[user_name] [nvarchar](40) NOT NULL,
	[msg_count] [int] NULL,
	[fans_count] [int] NULL,
	[follow_count] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[m_user_info]    Script Date: 2013/7/14 20:56:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[m_user_info](
	[user_id] [nvarchar](40) NOT NULL,
	[profile_id] [int] NOT NULL,
	[user_name] [nvarchar](40) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[oldpassword] [nvarchar](50) NULL,
	[email] [nvarchar](50) NOT NULL,
	[gender] [char](1) NOT NULL,
	[createdtime] [datetime] NOT NULL,
	[updatedtime] [datetime] NULL,
	[remark] [nvarchar](200) NULL,
	[location] [nvarchar](100) NOT NULL,
	[netaddress] [nvarchar](50) NOT NULL,
	[state] [int] NOT NULL,
	[user_sexual_orientation] [char](1) NULL,
	[user_relationship_status] [char](1) NULL,
	[birthday] [datetime] NULL,
	[blood_type] [char](2) NULL,
	[blogs_url] [nvarchar](100) NULL,
	[MSN] [nvarchar](100) NULL,
	[QQ] [nchar](10) NULL,
 CONSTRAINT [PK_m_user_info] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[m_user_msg_index]    Script Date: 2013/7/14 20:56:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_user_msg_index](
	[user_id] [int] NULL,
	[author_id] [int] NULL,
	[msg_id] [int] NULL,
	[time_t] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[m_user_relation]    Script Date: 2013/7/14 20:56:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_user_relation](
	[user_id] [int] NULL,
	[follow_id] [int] NULL,
	[type] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sys_actions]    Script Date: 2013/7/14 20:56:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_actions](
	[action_Id] [nvarchar](50) NOT NULL,
	[action_display_name] [nvarchar](40) NOT NULL,
	[action_name] [nvarchar](40) NOT NULL,
	[created_time] [datetime] NOT NULL,
	[updated_time] [datetime] NULL,
	[remark] [nvarchar](200) NULL,
	[admin_id] [nvarchar](50) NOT NULL,
	[deleted] [int] NOT NULL,
 CONSTRAINT [PK_dbo.sys_actions] PRIMARY KEY CLUSTERED 
(
	[action_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sys_admin_logs]    Script Date: 2013/7/14 20:56:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_admin_logs](
	[admin_id] [nvarchar](40) NOT NULL,
	[log_id] [nvarchar](40) NOT NULL,
	[log_title] [nvarchar](100) NOT NULL,
	[page_url] [nvarchar](200) NOT NULL,
	[referrer_url] [nvarchar](200) NULL,
	[created_time] [datetime] NOT NULL,
	[updated_time] [datetime] NULL,
	[remark] [nvarchar](200) NOT NULL,
	[deleted] [int] NOT NULL,
	[type_Id] [int] NOT NULL,
	[netaddress] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_sys_logs] PRIMARY KEY CLUSTERED 
(
	[admin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sys_administrator]    Script Date: 2013/7/14 20:56:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_administrator](
	[admin_id] [nvarchar](50) NOT NULL,
	[display_name] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[old_pasword] [nvarchar](50) NULL,
	[email] [nvarchar](50) NOT NULL,
	[enabled] [int] NOT NULL,
	[created_time] [datetime] NOT NULL,
	[updated_time] [datetime] NULL,
	[deleted] [int] NULL,
 CONSTRAINT [PK_sys_administrator] PRIMARY KEY CLUSTERED 
(
	[admin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sys_controller_action]    Script Date: 2013/7/14 20:56:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_controller_action](
	[controller_action_id] [nvarchar](50) NOT NULL,
	[controller_id] [uniqueidentifier] NOT NULL,
	[action_id] [nvarchar](50) NOT NULL,
	[created_time] [datetime] NOT NULL,
	[updated_time] [datetime] NULL,
	[remark] [nvarchar](200) NULL,
	[admin_Id] [nvarchar](50) NOT NULL,
	[deleted] [int] NOT NULL,
 CONSTRAINT [PK_dbo.sys_controller_action] PRIMARY KEY CLUSTERED 
(
	[controller_action_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sys_controllers]    Script Date: 2013/7/14 20:56:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_controllers](
	[controllers_id] [nvarchar](50) NOT NULL,
	[controller_display_name] [nvarchar](50) NOT NULL,
	[controller_name] [nvarchar](50) NOT NULL,
	[action_name] [nvarchar](50) NOT NULL,
	[target_blank] [int] NOT NULL,
	[created_time] [datetime] NOT NULL,
	[updated_time] [datetime] NULL,
	[remark] [nvarchar](200) NULL,
	[admin_id] [nvarchar](50) NOT NULL,
	[deleted] [int] NOT NULL,
 CONSTRAINT [PK_dbo.sys_controllers] PRIMARY KEY CLUSTERED 
(
	[controllers_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sys_logs]    Script Date: 2013/7/14 20:56:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_logs](
	[log_id] [nvarchar](50) NOT NULL,
	[log_title] [nchar](10) NOT NULL,
	[time] [datetime] NOT NULL,
	[thread] [nvarchar](100) NOT NULL,
	[messages] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_sys_logs_1] PRIMARY KEY CLUSTERED 
(
	[log_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sys_role_admin]    Script Date: 2013/7/14 20:56:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_role_admin](
	[role_sys_admin_id] [nvarchar](50) NOT NULL,
	[admin_id] [nvarchar](50) NOT NULL,
	[role_id] [nvarchar](50) NOT NULL,
	[created_time] [datetime] NOT NULL,
	[updated_time] [datetime] NULL,
	[remark] [nvarchar](200) NULL,
	[deleted] [int] NOT NULL,
 CONSTRAINT [PK_sys_role_admin] PRIMARY KEY CLUSTERED 
(
	[role_sys_admin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sys_role_controller_action]    Script Date: 2013/7/14 20:56:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_role_controller_action](
	[role_controller_action_id] [nvarchar](50) NOT NULL,
	[role_id] [nvarchar](50) NOT NULL,
	[controller_action_id] [nvarchar](50) NOT NULL,
	[created_time] [datetime] NOT NULL,
	[updated_time] [datetime] NULL,
	[remark] [nvarchar](200) NULL,
	[admin_id] [nvarchar](50) NOT NULL,
	[deleted] [int] NOT NULL,
 CONSTRAINT [PK_sys_controller_action] PRIMARY KEY CLUSTERED 
(
	[role_controller_action_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sys_roles]    Script Date: 2013/7/14 20:56:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_roles](
	[role_id] [nvarchar](40) NOT NULL,
	[role_name] [nvarchar](50) NOT NULL,
	[system_id] [nvarchar](50) NOT NULL,
	[created_time] [datetime] NOT NULL,
	[updated_time] [datetime] NOT NULL,
	[remark] [nvarchar](200) NULL,
	[deleted] [int] NOT NULL,
	[admin_id] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_sys_roles] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'小组编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_group_info', @level2type=N'COLUMN',@level2name=N'group_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创组用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_group_info', @level2type=N'COLUMN',@level2name=N'user_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'小组名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_group_info', @level2type=N'COLUMN',@level2name=N'group_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'小组类型编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_group_info', @level2type=N'COLUMN',@level2name=N'group_type_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_group_info', @level2type=N'COLUMN',@level2name=N'created_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_group_info', @level2type=N'COLUMN',@level2name=N'updated_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'伪删除（0显示；1不显示）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_group_info', @level2type=N'COLUMN',@level2name=N'deleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'伪删除时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_group_info', @level2type=N'COLUMN',@level2name=N'deleted_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'小组表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_group_info'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'小组类型编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_group_type_info', @level2type=N'COLUMN',@level2name=N'group_type_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'小组类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_group_type_info', @level2type=N'COLUMN',@level2name=N'group_type_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_group_type_info', @level2type=N'COLUMN',@level2name=N'created_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_group_type_info', @level2type=N'COLUMN',@level2name=N'updated_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'伪删除（0显示；1不显示）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_group_type_info', @level2type=N'COLUMN',@level2name=N'deleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'伪删除时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_group_type_info', @level2type=N'COLUMN',@level2name=N'deleted_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'小组类型表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_group_type_info'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发消息用户编号（联合主键）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_msg_info', @level2type=N'COLUMN',@level2name=N'user_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'消息编号（联合主键）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_msg_info', @level2type=N'COLUMN',@level2name=N'msg_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'消息内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_msg_info', @level2type=N'COLUMN',@level2name=N'content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'消息类型（0，原创；1，评论；2，转发）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_msg_info', @level2type=N'COLUMN',@level2name=N'type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'评论过数量（只增不减，删除评论不影响此值，可以作为评论多页显示的页码）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_msg_info', @level2type=N'COLUMN',@level2name=N'commented_count'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'保留的评论数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_msg_info', @level2type=N'COLUMN',@level2name=N'comment_count'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'转发过数量（只增不减，删除转发不影响此值，可以作为转发多页显示的页码）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_msg_info', @level2type=N'COLUMN',@level2name=N'transferred_count'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'保留的转发数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_msg_info', @level2type=N'COLUMN',@level2name=N'transfer_count'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发布时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_msg_info', @level2type=N'COLUMN',@level2name=N'time_t'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户文章表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_msg_info'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'引用消息用户编号（联合主键）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_msg_msg_relation', @level2type=N'COLUMN',@level2name=N'reference_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'引用消息编号（联合主键）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_msg_msg_relation', @level2type=N'COLUMN',@level2name=N'reference _msg_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'消息发布者编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_msg_msg_relation', @level2type=N'COLUMN',@level2name=N'referenced_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'被引用消息编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_msg_msg_relation', @level2type=N'COLUMN',@level2name=N'referenced _msg_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作类型(1,评论；2，转发)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_msg_msg_relation', @level2type=N'COLUMN',@level2name=N'type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发布时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_msg_msg_relation', @level2type=N'COLUMN',@level2name=N'time_t'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户文章关系表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_msg_msg_relation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_profile_info', @level2type=N'COLUMN',@level2name=N'user_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'头像路径 /30 、/50、/80' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_profile_info', @level2type=N'COLUMN',@level2name=N'profile_image_url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户头像表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_profile_info'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标签编号主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_tag_info', @level2type=N'COLUMN',@level2name=N'tag_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_tag_info', @level2type=N'COLUMN',@level2name=N'user_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标签（多个以英文逗号 ","隔开）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_tag_info', @level2type=N'COLUMN',@level2name=N'tags'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_tag_info', @level2type=N'COLUMN',@level2name=N'createdtime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标签表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_tag_info'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户编号（联合主键）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_user_index_info', @level2type=N'COLUMN',@level2name=N'user_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_user_index_info', @level2type=N'COLUMN',@level2name=N'user_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发布消息数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_user_index_info', @level2type=N'COLUMN',@level2name=N'msg_count'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'粉丝数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_user_index_info', @level2type=N'COLUMN',@level2name=N'fans_count'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关注对象数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_user_index_info', @level2type=N'COLUMN',@level2name=N'follow_count'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户索引表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_user_index_info'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户编号（主键）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_user_info', @level2type=N'COLUMN',@level2name=N'user_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'头像编号（联合主键）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_user_info', @level2type=N'COLUMN',@level2name=N'profile_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名称（真实）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_user_info', @level2type=N'COLUMN',@level2name=N'user_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_user_info', @level2type=N'COLUMN',@level2name=N'password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户老密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_user_info', @level2type=N'COLUMN',@level2name=N'oldpassword'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邮箱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_user_info', @level2type=N'COLUMN',@level2name=N'email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'性别（m 男；w 女；n 中性；z 双性）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_user_info', @level2type=N'COLUMN',@level2name=N'gender'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_user_info', @level2type=N'COLUMN',@level2name=N'createdtime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_user_info', @level2type=N'COLUMN',@level2name=N'updatedtime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_user_info', @level2type=N'COLUMN',@level2name=N'remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态类型（0，正常；1，暂时禁止；2，永久封号）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_user_info', @level2type=N'COLUMN',@level2name=N'state'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'性取向（m 男；w 女；z 双性）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_user_info', @level2type=N'COLUMN',@level2name=N'user_sexual_orientation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'感情状态（s 单身；p 求交往；h 暗恋中；a 暧昧中；e 订婚；m 已婚；s''s 分局；d 离异；b 丧偶）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_user_info', @level2type=N'COLUMN',@level2name=N'user_relationship_status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'诞辰' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_user_info', @level2type=N'COLUMN',@level2name=N'birthday'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'血型（入库数据必为大写字母）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_user_info', @level2type=N'COLUMN',@level2name=N'blood_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'博客地址（"http://user博客地址" ）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_user_info', @level2type=N'COLUMN',@level2name=N'blogs_url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'MSN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_user_info', @level2type=N'COLUMN',@level2name=N'MSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'QQ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_user_info', @level2type=N'COLUMN',@level2name=N'QQ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户信息表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_user_info'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户编号（联合主键）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_user_msg_index', @level2type=N'COLUMN',@level2name=N'user_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'消息发布者编号（可能是被关注者，也可能是自己）（联合主键）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_user_msg_index', @level2type=N'COLUMN',@level2name=N'author_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'消息编号(由消息发布者的msg_count自增)（联合主键）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_user_msg_index', @level2type=N'COLUMN',@level2name=N'msg_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发布时间/排序（必须是消息元数据产生时间）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_user_msg_index', @level2type=N'COLUMN',@level2name=N'time_t'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户消息索引表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_user_msg_index'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户编号（联合主键）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_user_relation', @level2type=N'COLUMN',@level2name=N'user_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'被关注者编号（联合主键）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_user_relation', @level2type=N'COLUMN',@level2name=N'follow_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关系类型（0，粉丝；1，关注）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_user_relation', @level2type=N'COLUMN',@level2name=N'type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户关系表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_user_relation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'动作编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_actions', @level2type=N'COLUMN',@level2name=N'action_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'动作显示名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_actions', @level2type=N'COLUMN',@level2name=N'action_display_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'动作名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_actions', @level2type=N'COLUMN',@level2name=N'action_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_actions', @level2type=N'COLUMN',@level2name=N'created_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_actions', @level2type=N'COLUMN',@level2name=N'updated_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'说明时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_actions', @level2type=N'COLUMN',@level2name=N'remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理员编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_actions', @level2type=N'COLUMN',@level2name=N'admin_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'伪删除（0 显示；1 不显示）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_actions', @level2type=N'COLUMN',@level2name=N'deleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'动作表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_actions'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理员编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_admin_logs', @level2type=N'COLUMN',@level2name=N'admin_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日志编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_admin_logs', @level2type=N'COLUMN',@level2name=N'log_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_admin_logs', @level2type=N'COLUMN',@level2name=N'log_title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'页面地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_admin_logs', @level2type=N'COLUMN',@level2name=N'page_url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'引用页面' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_admin_logs', @level2type=N'COLUMN',@level2name=N'referrer_url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_admin_logs', @level2type=N'COLUMN',@level2name=N'created_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_admin_logs', @level2type=N'COLUMN',@level2name=N'updated_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_admin_logs', @level2type=N'COLUMN',@level2name=N'remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'伪删除（0 显示；1 不显示）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_admin_logs', @level2type=N'COLUMN',@level2name=N'deleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型编号 并不为int型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_admin_logs', @level2type=N'COLUMN',@level2name=N'type_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'admin日志表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_admin_logs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理员编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_administrator', @level2type=N'COLUMN',@level2name=N'admin_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'显示名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_administrator', @level2type=N'COLUMN',@level2name=N'display_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_administrator', @level2type=N'COLUMN',@level2name=N'password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'旧密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_administrator', @level2type=N'COLUMN',@level2name=N'old_pasword'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邮箱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_administrator', @level2type=N'COLUMN',@level2name=N'email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否激活（0未激活；1激活）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_administrator', @level2type=N'COLUMN',@level2name=N'enabled'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_administrator', @level2type=N'COLUMN',@level2name=N'created_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_administrator', @level2type=N'COLUMN',@level2name=N'updated_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'伪删除（0 显示；1不显示）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_administrator', @level2type=N'COLUMN',@level2name=N'deleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理员表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_administrator'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'控制器动作表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_controller_action'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'控制器编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_controllers', @level2type=N'COLUMN',@level2name=N'controllers_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'控制器显示名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_controllers', @level2type=N'COLUMN',@level2name=N'controller_display_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'控制器名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_controllers', @level2type=N'COLUMN',@level2name=N'controller_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'动作名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_controllers', @level2type=N'COLUMN',@level2name=N'action_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'打开类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_controllers', @level2type=N'COLUMN',@level2name=N'target_blank'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_controllers', @level2type=N'COLUMN',@level2name=N'created_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_controllers', @level2type=N'COLUMN',@level2name=N'updated_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_controllers', @level2type=N'COLUMN',@level2name=N'remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理员编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_controllers', @level2type=N'COLUMN',@level2name=N'admin_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'伪删除（0 显示；1不显示）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_controllers', @level2type=N'COLUMN',@level2name=N'deleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'控制器表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_controllers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_logs', @level2type=N'COLUMN',@level2name=N'log_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日志标题（简短描述）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_logs', @level2type=N'COLUMN',@level2name=N'log_title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_logs', @level2type=N'COLUMN',@level2name=N'time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'线程' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_logs', @level2type=N'COLUMN',@level2name=N'thread'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'消息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_logs', @level2type=N'COLUMN',@level2name=N'messages'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统日志表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_logs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色权限编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role_admin', @level2type=N'COLUMN',@level2name=N'role_sys_admin_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理员编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role_admin', @level2type=N'COLUMN',@level2name=N'admin_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role_admin', @level2type=N'COLUMN',@level2name=N'role_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role_admin', @level2type=N'COLUMN',@level2name=N'created_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role_admin', @level2type=N'COLUMN',@level2name=N'updated_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role_admin', @level2type=N'COLUMN',@level2name=N'remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'伪删除（0 显示；1不显示）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role_admin', @level2type=N'COLUMN',@level2name=N'deleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色管理表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role_admin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色控制器动作编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role_controller_action', @level2type=N'COLUMN',@level2name=N'role_controller_action_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role_controller_action', @level2type=N'COLUMN',@level2name=N'role_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'控制器动作编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role_controller_action', @level2type=N'COLUMN',@level2name=N'controller_action_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role_controller_action', @level2type=N'COLUMN',@level2name=N'created_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role_controller_action', @level2type=N'COLUMN',@level2name=N'updated_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role_controller_action', @level2type=N'COLUMN',@level2name=N'remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理员编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role_controller_action', @level2type=N'COLUMN',@level2name=N'admin_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'伪删除（0 显示；1不显示）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role_controller_action', @level2type=N'COLUMN',@level2name=N'deleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色控制器动作表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role_controller_action'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_roles', @level2type=N'COLUMN',@level2name=N'role_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_roles', @level2type=N'COLUMN',@level2name=N'role_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_roles', @level2type=N'COLUMN',@level2name=N'system_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_roles', @level2type=N'COLUMN',@level2name=N'created_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_roles', @level2type=N'COLUMN',@level2name=N'updated_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_roles', @level2type=N'COLUMN',@level2name=N'remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'伪删除（0 显示；1不显示）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_roles', @level2type=N'COLUMN',@level2name=N'deleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理员编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_roles', @level2type=N'COLUMN',@level2name=N'admin_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_roles'
GO
USE [master]
GO
ALTER DATABASE [miaowsys] SET  READ_WRITE 
GO
