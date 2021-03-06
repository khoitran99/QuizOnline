USE [master]
GO
/****** Object:  Database [OnlineQuiz]    Script Date: 7/1/2021 12:03:15 PM ******/
CREATE DATABASE [OnlineQuiz]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OnlineQuiz', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\OnlineQuiz.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OnlineQuiz_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\OnlineQuiz_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [OnlineQuiz] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OnlineQuiz].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OnlineQuiz] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OnlineQuiz] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OnlineQuiz] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OnlineQuiz] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OnlineQuiz] SET ARITHABORT OFF 
GO
ALTER DATABASE [OnlineQuiz] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OnlineQuiz] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OnlineQuiz] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineQuiz] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OnlineQuiz] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OnlineQuiz] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OnlineQuiz] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OnlineQuiz] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OnlineQuiz] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OnlineQuiz] SET  ENABLE_BROKER 
GO
ALTER DATABASE [OnlineQuiz] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OnlineQuiz] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OnlineQuiz] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OnlineQuiz] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OnlineQuiz] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OnlineQuiz] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OnlineQuiz] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OnlineQuiz] SET RECOVERY FULL 
GO
ALTER DATABASE [OnlineQuiz] SET  MULTI_USER 
GO
ALTER DATABASE [OnlineQuiz] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OnlineQuiz] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OnlineQuiz] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OnlineQuiz] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OnlineQuiz] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'OnlineQuiz', N'ON'
GO
ALTER DATABASE [OnlineQuiz] SET QUERY_STORE = OFF
GO
USE [OnlineQuiz]
GO
/****** Object:  Table [dbo].[question]    Script Date: 7/1/2021 12:03:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[question](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[question] [nvarchar](max) NOT NULL,
	[option1] [nvarchar](max) NOT NULL,
	[option2] [nvarchar](max) NOT NULL,
	[option3] [nvarchar](max) NOT NULL,
	[option4] [nvarchar](max) NOT NULL,
	[answers] [nvarchar](50) NOT NULL,
	[userID] [int] NOT NULL,
	[createdDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role]    Script Date: 7/1/2021 12:03:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[id] [int] NOT NULL,
	[name] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 7/1/2021 12:03:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](max) NOT NULL,
	[password] [nvarchar](max) NOT NULL,
	[roleID] [int] NOT NULL,
	[email] [nvarchar](max) NOT NULL,
	[createdDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[question] ON 

INSERT [dbo].[question] ([id], [question], [option1], [option2], [option3], [option4], [answers], [userID], [createdDate]) VALUES (1, N'Trong tiếng anh , bye bye là gì ? updated 14', N'Hi', N'Hello', N'tạm biệt', N'I love U', N'14', 15, CAST(N'2021-06-24' AS Date))
INSERT [dbo].[question] ([id], [question], [option1], [option2], [option3], [option4], [answers], [userID], [createdDate]) VALUES (2, N'Trong tiếng anh , Bạn bè là gì ?', N'Friend', N'Mother', N'Father', N'Teacher', N'1', 15, CAST(N'2021-06-24' AS Date))
INSERT [dbo].[question] ([id], [question], [option1], [option2], [option3], [option4], [answers], [userID], [createdDate]) VALUES (3, N'Trong tiếng anh , Máy tính nghĩa là gì ?', N'Wifi', N'Computer', N'House', N'Car', N'2', 15, CAST(N'2021-06-24' AS Date))
INSERT [dbo].[question] ([id], [question], [option1], [option2], [option3], [option4], [answers], [userID], [createdDate]) VALUES (4, N'Trong tiếng anh , Máy tính nghĩa là gì ?', N'Wifi', N'Computer', N'House', N'Car', N'2', 15, CAST(N'2021-06-24' AS Date))
INSERT [dbo].[question] ([id], [question], [option1], [option2], [option3], [option4], [answers], [userID], [createdDate]) VALUES (5, N'Trong tiếng việt , Worker nghĩa là gì ?', N'Công nhân', N'Giáo viên', N'Bác sĩ', N'Sinh viên', N'1', 15, CAST(N'2021-06-24' AS Date))
INSERT [dbo].[question] ([id], [question], [option1], [option2], [option3], [option4], [answers], [userID], [createdDate]) VALUES (6, N'Trong tiếng việt , question nghĩa là gì ?', N'Câu trả lời', N'Đoạn văn', N'Câu hỏi', N'Từ ngữ', N'3', 15, CAST(N'2021-06-24' AS Date))
INSERT [dbo].[question] ([id], [question], [option1], [option2], [option3], [option4], [answers], [userID], [createdDate]) VALUES (7, N'Câu sau dịch ra tiếng việt là gì . " I am a good student at FPT University "', N'Tôi là 1 sinh viên ở đại học FPT', N'Tôi là 1 người tốt ở đại học FPT', N'Tôi là 1 người bình thường ở đại học FPT', N'Tôi là 1 sinh viên tốt ở đại học FPT', N'4', 15, CAST(N'2021-06-24' AS Date))
INSERT [dbo].[question] ([id], [question], [option1], [option2], [option3], [option4], [answers], [userID], [createdDate]) VALUES (8, N'Điền đáp án đúng vào dấu ... . I am 22 years old , I am 4rd year .... at FPT University', N'teacher', N'student', N'worker', N'farmer', N'2', 15, CAST(N'2021-06-24' AS Date))
INSERT [dbo].[question] ([id], [question], [option1], [option2], [option3], [option4], [answers], [userID], [createdDate]) VALUES (9, N'Điền vào chỗ trống . I .... seen him since 2021', N'haven''t', N'didn''t', N'don''t', N'aren''t', N'1', 15, CAST(N'2021-06-24' AS Date))
INSERT [dbo].[question] ([id], [question], [option1], [option2], [option3], [option4], [answers], [userID], [createdDate]) VALUES (10, N'Ngày 4 tháng 7 là ngày gì ?', N'ngày bình thường', N'ngày không bình thường', N'ngày normal', N'ngày bình bình thường', N'1', 15, CAST(N'2021-06-24' AS Date))
INSERT [dbo].[question] ([id], [question], [option1], [option2], [option3], [option4], [answers], [userID], [createdDate]) VALUES (11, N'Trong tiếng anh , điện thoại nghĩa là gì ?', N'phone', N'phonenumber', N'number', N'all is incorrect', N'1', 16, CAST(N'2021-06-24' AS Date))
SET IDENTITY_INSERT [dbo].[question] OFF
INSERT [dbo].[role] ([id], [name]) VALUES (1, N'TEACHER')
INSERT [dbo].[role] ([id], [name]) VALUES (2, N'STUDENT')
SET IDENTITY_INSERT [dbo].[user] ON 

INSERT [dbo].[user] ([id], [username], [password], [roleID], [email], [createdDate]) VALUES (14, N'student', N'123456', 2, N'khoitvhe130007@gmail.com', CAST(N'2021-06-24' AS Date))
INSERT [dbo].[user] ([id], [username], [password], [roleID], [email], [createdDate]) VALUES (15, N'teacher', N'123456', 1, N'khoitvhe130007@fpt.edu.vn', CAST(N'2021-06-24' AS Date))
INSERT [dbo].[user] ([id], [username], [password], [roleID], [email], [createdDate]) VALUES (16, N'teacher1', N'123456', 1, N'khoitvhe130008@gmail.com', CAST(N'2021-06-24' AS Date))
SET IDENTITY_INSERT [dbo].[user] OFF
ALTER TABLE [dbo].[question]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[user] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[user]  WITH CHECK ADD FOREIGN KEY([roleID])
REFERENCES [dbo].[role] ([id])
ON DELETE CASCADE
GO
USE [master]
GO
ALTER DATABASE [OnlineQuiz] SET  READ_WRITE 
GO
