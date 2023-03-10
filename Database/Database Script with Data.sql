USE [master]
GO
/****** Object:  Database [AutoTimeTableDb]    Script Date: 14/06/2020 9:40:15 PM ******/
CREATE DATABASE [AutoTimeTableDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AutoTimeTableDb', FILENAME = N'D:\FYP Time Table Generator Desktop\Complate App\Database\AutoTimeTableDb.mdf' , SIZE = 4352KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'AutoTimeTableDb_log', FILENAME = N'D:\FYP Time Table Generator Desktop\Complate App\Database\AutoTimeTableDb_log.LDF' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [AutoTimeTableDb] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AutoTimeTableDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AutoTimeTableDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AutoTimeTableDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AutoTimeTableDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AutoTimeTableDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AutoTimeTableDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [AutoTimeTableDb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [AutoTimeTableDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AutoTimeTableDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AutoTimeTableDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AutoTimeTableDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AutoTimeTableDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AutoTimeTableDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AutoTimeTableDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AutoTimeTableDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AutoTimeTableDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [AutoTimeTableDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AutoTimeTableDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AutoTimeTableDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AutoTimeTableDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AutoTimeTableDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AutoTimeTableDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AutoTimeTableDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AutoTimeTableDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AutoTimeTableDb] SET  MULTI_USER 
GO
ALTER DATABASE [AutoTimeTableDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AutoTimeTableDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AutoTimeTableDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AutoTimeTableDb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [AutoTimeTableDb] SET DELAYED_DURABILITY = DISABLED 
GO
USE [AutoTimeTableDb]
GO
/****** Object:  Table [dbo].[CourseTable]    Script Date: 14/06/2020 9:40:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseTable](
	[CourseID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](350) NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_CourseTable_IsActive]  DEFAULT ((1)),
	[CrHrs] [int] NOT NULL,
	[RoomTypeID] [int] NOT NULL,
 CONSTRAINT [PK_CourseTable] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DayTable]    Script Date: 14/06/2020 9:40:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DayTable](
	[DayID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_DayTable_IsActive]  DEFAULT ((1)),
 CONSTRAINT [PK_DayTable] PRIMARY KEY CLUSTERED 
(
	[DayID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DayTimeSlotTable]    Script Date: 14/06/2020 9:40:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DayTimeSlotTable](
	[DayTimeSlotID] [int] IDENTITY(1,1) NOT NULL,
	[DayID] [int] NOT NULL,
	[SlotTitle] [nvarchar](50) NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[EndTime] [time](7) NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_DayTimeSlotTable_IsActive]  DEFAULT ((1)),
 CONSTRAINT [PK_DayTimeSlotTable] PRIMARY KEY CLUSTERED 
(
	[DayTimeSlotID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LabTable]    Script Date: 14/06/2020 9:40:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LabTable](
	[LabID] [int] IDENTITY(1,1) NOT NULL,
	[LabNo] [nvarchar](30) NOT NULL,
	[Capacity] [int] NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_LabTable_IsActive]  DEFAULT ((1)),
 CONSTRAINT [PK_LabTable] PRIMARY KEY CLUSTERED 
(
	[LabID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LectureSubjectTable]    Script Date: 14/06/2020 9:40:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LectureSubjectTable](
	[LectureSubjectID] [int] IDENTITY(1,1) NOT NULL,
	[SubjectTitle] [nvarchar](150) NOT NULL,
	[LectureID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_LectureSubjectTable_IsActive]  DEFAULT ((1)),
 CONSTRAINT [PK_LectureSubjectTable] PRIMARY KEY CLUSTERED 
(
	[LectureSubjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LectureTable]    Script Date: 14/06/2020 9:40:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LectureTable](
	[LectureID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](150) NOT NULL,
	[ContactNo] [nvarchar](50) NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_LectureTable_IsActive]  DEFAULT ((1)),
 CONSTRAINT [PK_LectureTable] PRIMARY KEY CLUSTERED 
(
	[LectureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProgramSemesterSubjectTable]    Script Date: 14/06/2020 9:40:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProgramSemesterSubjectTable](
	[ProgramSemesterSubjectID] [int] IDENTITY(1,1) NOT NULL,
	[SSTitle] [nvarchar](200) NOT NULL,
	[ProgramSemesterID] [int] NOT NULL,
	[LectureSubjectID] [int] NOT NULL,
	[IsSubjectActive] [bit] NOT NULL CONSTRAINT [DF_ProgramSemesterSubjectTable_IsSubjectActive]  DEFAULT ((1)),
 CONSTRAINT [PK_ProgramSemesterSubjectTable] PRIMARY KEY CLUSTERED 
(
	[ProgramSemesterSubjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProgramSemesterTable]    Script Date: 14/06/2020 9:40:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProgramSemesterTable](
	[ProgramSemesterID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
	[ProgramID] [int] NOT NULL,
	[SemesterID] [int] NOT NULL,
	[Capacity] [int] NULL CONSTRAINT [DF_ProgramSemesterTable_Capacity]  DEFAULT ((50)),
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_ProgramSemesterTable_IsActive]  DEFAULT ((1)),
	[SessionID] [int] NOT NULL CONSTRAINT [DF_ProgramSemesterTable_SessionID]  DEFAULT ((1)),
 CONSTRAINT [PK_ProgramSemesterTable] PRIMARY KEY CLUSTERED 
(
	[ProgramSemesterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProgramTable]    Script Date: 14/06/2020 9:40:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProgramTable](
	[ProgramID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_ProgrameTable_IsActive]  DEFAULT ((1)),
 CONSTRAINT [PK_ProgrameTable] PRIMARY KEY CLUSTERED 
(
	[ProgramID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RoomTable]    Script Date: 14/06/2020 9:40:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomTable](
	[RoomID] [int] IDENTITY(1,1) NOT NULL,
	[RoomNo] [nvarchar](10) NOT NULL,
	[Capacity] [int] NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_RoomTable_IsActive]  DEFAULT ((1)),
 CONSTRAINT [PK_RoomTable] PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RoomTypeTable]    Script Date: 14/06/2020 9:40:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomTypeTable](
	[RoomTypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_RoomTypeTable] PRIMARY KEY CLUSTERED 
(
	[RoomTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SectionTable]    Script Date: 14/06/2020 9:40:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SectionTable](
	[SectionID] [int] IDENTITY(1,1) NOT NULL,
	[SectionTitle] [nvarchar](150) NOT NULL,
	[ProgramSemesterID] [int] NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_SectionTable_IsActive]  DEFAULT ((1)),
	[SectionCapacity] [int] NOT NULL CONSTRAINT [DF_SectionTable_SectionCapacity]  DEFAULT ((40)),
 CONSTRAINT [PK_SectionTable] PRIMARY KEY CLUSTERED 
(
	[SectionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SemesterTable]    Script Date: 14/06/2020 9:40:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SemesterTable](
	[SemesterID] [int] IDENTITY(1,1) NOT NULL,
	[SemesterName] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_SemesterTable_IsActive]  DEFAULT ((1)),
 CONSTRAINT [PK_SemesterTable] PRIMARY KEY CLUSTERED 
(
	[SemesterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SessionTable]    Script Date: 14/06/2020 9:40:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SessionTable](
	[SessionID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_SessionTable_IsActive]  DEFAULT ((1)),
 CONSTRAINT [PK_SessionTable] PRIMARY KEY CLUSTERED 
(
	[SessionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TimeTableDetailsTable]    Script Date: 14/06/2020 9:40:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeTableDetailsTable](
	[TimeTableDetailID] [int] IDENTITY(1,1) NOT NULL,
	[TimeTableID] [int] NOT NULL,
	[ProgramSemesterSubjectID] [int] NOT NULL,
	[SubjectTitle] [nvarchar](400) NOT NULL,
	[RoomID] [int] NOT NULL,
	[LabID] [int] NOT NULL,
	[DayTimeSlotID] [int] NOT NULL,
	[LectureID] [int] NOT NULL,
	[DayID] [int] NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_TimeTableDetailsTable_IsActive]  DEFAULT ((1)),
	[SessionID] [int] NULL,
	[SessionTitle] [nvarchar](250) NULL,
 CONSTRAINT [PK_TimeTableDetailsTable] PRIMARY KEY CLUSTERED 
(
	[TimeTableDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TimeTblTable]    Script Date: 14/06/2020 9:40:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeTblTable](
	[TimeTableID] [int] NOT NULL,
	[SessionID] [int] NOT NULL,
	[ProgramSemesterID] [int] NOT NULL,
	[TimeTableTitle] [nvarchar](150) NOT NULL,
	[SemesterTitle] [nvarchar](200) NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_TimeTblTable_IsActive]  DEFAULT ((1)),
	[SessionTitle] [nvarchar](250) NULL,
 CONSTRAINT [PK_TimeTblTable] PRIMARY KEY CLUSTERED 
(
	[TimeTableID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserTable]    Script Date: 14/06/2020 9:40:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTable](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](150) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_UserTable] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[v_ProgramSemesterActiveList]    Script Date: 14/06/2020 9:40:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_ProgramSemesterActiveList]
AS
SELECT        dbo.ProgramSemesterTable.ProgramSemesterID, dbo.ProgramSemesterTable.Title, dbo.ProgramSemesterTable.IsActive AS ProgramSemesterIsActive, dbo.ProgramSemesterTable.ProgramID, 
                         dbo.ProgramTable.Name AS Program, dbo.ProgramTable.IsActive AS ProgramIsActive, dbo.ProgramSemesterTable.SemesterID, dbo.SemesterTable.SemesterName AS Semester, 
                         dbo.SemesterTable.IsActive AS SemesterIsActive, dbo.ProgramSemesterTable.Capacity, dbo.ProgramSemesterTable.SessionID, dbo.SessionTable.Title AS Session
FROM            dbo.ProgramSemesterTable INNER JOIN
                         dbo.ProgramTable ON dbo.ProgramSemesterTable.ProgramID = dbo.ProgramTable.ProgramID INNER JOIN
                         dbo.SemesterTable ON dbo.ProgramSemesterTable.SemesterID = dbo.SemesterTable.SemesterID INNER JOIN
                         dbo.SessionTable ON dbo.ProgramSemesterTable.SessionID = dbo.SessionTable.SessionID

GO
/****** Object:  View [dbo].[v_AllSemesterSections]    Script Date: 14/06/2020 9:40:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_AllSemesterSections]
AS
SELECT        dbo.SectionTable.SectionID, dbo.SectionTable.SectionTitle, dbo.SectionTable.ProgramSemesterID, dbo.v_ProgramSemesterActiveList.Title, dbo.SectionTable.IsActive
FROM            dbo.SectionTable INNER JOIN
                         dbo.v_ProgramSemesterActiveList ON dbo.SectionTable.ProgramSemesterID = dbo.v_ProgramSemesterActiveList.ProgramSemesterID

GO
/****** Object:  View [dbo].[v_AllSubjectsTeachers]    Script Date: 14/06/2020 9:40:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_AllSubjectsTeachers]
AS
SELECT        dbo.LectureSubjectTable.LectureSubjectID, dbo.LectureSubjectTable.SubjectTitle, dbo.LectureSubjectTable.LectureID, dbo.LectureTable.FullName, dbo.LectureSubjectTable.CourseID, dbo.CourseTable.Title, 
                         dbo.LectureSubjectTable.IsActive, dbo.CourseTable.CrHrs, dbo.CourseTable.RoomTypeID
FROM            dbo.CourseTable INNER JOIN
                         dbo.LectureSubjectTable ON dbo.CourseTable.CourseID = dbo.LectureSubjectTable.CourseID INNER JOIN
                         dbo.LectureTable ON dbo.LectureSubjectTable.LectureID = dbo.LectureTable.LectureID

GO
/****** Object:  View [dbo].[v_AllSemestersSubjects]    Script Date: 14/06/2020 9:40:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_AllSemestersSubjects]
AS
SELECT        dbo.ProgramSemesterSubjectTable.ProgramSemesterSubjectID, dbo.ProgramSemesterSubjectTable.SSTitle, dbo.ProgramSemesterSubjectTable.ProgramSemesterID, dbo.v_ProgramSemesterActiveList.Title, 
                         dbo.v_ProgramSemesterActiveList.ProgramSemesterIsActive, dbo.v_ProgramSemesterActiveList.ProgramID, dbo.v_ProgramSemesterActiveList.Program, dbo.v_ProgramSemesterActiveList.ProgramIsActive, 
                         dbo.v_ProgramSemesterActiveList.SemesterID, dbo.v_ProgramSemesterActiveList.Semester, dbo.v_ProgramSemesterActiveList.SemesterIsActive, dbo.v_ProgramSemesterActiveList.Capacity, 
                         dbo.ProgramSemesterSubjectTable.LectureSubjectID, dbo.v_AllSubjectsTeachers.SubjectTitle, dbo.v_AllSubjectsTeachers.LectureID, dbo.v_AllSubjectsTeachers.FullName, dbo.v_AllSubjectsTeachers.CourseID, 
                         dbo.v_AllSubjectsTeachers.IsActive AS SubjectIsActive, dbo.ProgramSemesterSubjectTable.IsSubjectActive, dbo.v_AllSubjectsTeachers.CrHrs, dbo.v_AllSubjectsTeachers.RoomTypeID
FROM            dbo.v_ProgramSemesterActiveList INNER JOIN
                         dbo.ProgramSemesterSubjectTable ON dbo.v_ProgramSemesterActiveList.ProgramSemesterID = dbo.ProgramSemesterSubjectTable.ProgramSemesterID INNER JOIN
                         dbo.v_AllSubjectsTeachers ON dbo.ProgramSemesterSubjectTable.LectureSubjectID = dbo.v_AllSubjectsTeachers.LectureSubjectID

GO
/****** Object:  View [dbo].[v_AllSemesterSectionSubjects]    Script Date: 14/06/2020 9:40:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_AllSemesterSectionSubjects]
AS
SELECT        AllSemesters.ProgramSemesterID, AllSemesters.Title, AllSemesters.SectionID, AllSemesters.SectionTitle, AllSemesters.IsActive, AllSemesters.Capacity, AllSubjects.ProgramSemesterSubjectID, AllSubjects.SSTitle, 
                         AllSubjects.Title AS ProgramSemester, AllSubjects.ProgramSemesterIsActive, AllSubjects.ProgramID, AllSubjects.Program, AllSubjects.ProgramIsActive, AllSubjects.SemesterID, AllSubjects.Semester, 
                         AllSubjects.SemesterIsActive, AllSubjects.LectureSubjectID, AllSubjects.SubjectTitle, AllSubjects.LectureID, AllSubjects.FullName, AllSubjects.CourseID, AllSubjects.SubjectIsActive, AllSubjects.IsSubjectActive, AllSubjects.CrHrs, 
                         AllSubjects.RoomTypeID, dbo.RoomTypeTable.TypeName, AllSemesters.SessionID, AllSemesters.SessionTitle
FROM            (SELECT        PS.ProgramSemesterID, PS.Title + (CASE ISNULL(ST.SectionTitle, '') WHEN '' THEN '' ELSE ' (' + ST.SectionTitle + ') ' END) AS Title, ST.SectionID, ST.SectionTitle, ST.IsActive, (CASE ISNULL(ST.SectionCapacity, 0) 
                                                    WHEN 0 THEN PS.Capacity ELSE ST.SectionCapacity END) AS Capacity, PS.SessionID, PS.SessionTitle
                          FROM            dbo.SectionTable AS ST RIGHT OUTER JOIN
                                                        (SELECT        ProgramSemesterID, Title, ProgramSemesterIsActive, ProgramID, Program, ProgramIsActive, SemesterID, Semester, SemesterIsActive, Capacity, SessionID, Session AS SessionTitle
                                                          FROM            dbo.v_ProgramSemesterActiveList
                                                          WHERE        (ProgramSemesterIsActive = 1) AND (ProgramIsActive = 1) AND (SemesterIsActive = 1)) AS PS ON ST.ProgramSemesterID = PS.ProgramSemesterID) AS AllSemesters INNER JOIN
                         dbo.v_AllSemestersSubjects AS AllSubjects ON AllSemesters.ProgramSemesterID = AllSubjects.ProgramSemesterID INNER JOIN
                         dbo.RoomTypeTable ON AllSubjects.RoomTypeID = dbo.RoomTypeTable.RoomTypeID

GO
/****** Object:  View [dbo].[v_AllActiveTimeSlots]    Script Date: 14/06/2020 9:40:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_AllActiveTimeSlots]
AS
SELECT        DTS.DayTimeSlotID, DTS.SlotTitle, DTS.StartTime, DTS.DayID, DT.Name, DTS.EndTime, DT.IsActive AS DayStatus, DTS.IsActive AS SlotStatus
FROM            dbo.DayTable AS DT INNER JOIN
                         dbo.DayTimeSlotTable AS DTS ON DT.DayID = DTS.DayID
WHERE        (DT.IsActive = 1) AND (DTS.IsActive = 1)

GO
/****** Object:  View [dbo].[v_AllSubjects]    Script Date: 14/06/2020 9:40:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_AllSubjects]
AS
SELECT        dbo.CourseTable.CourseID, dbo.CourseTable.Title, dbo.CourseTable.CrHrs, dbo.CourseTable.RoomTypeID, dbo.RoomTypeTable.TypeName, dbo.CourseTable.IsActive
FROM            dbo.RoomTypeTable INNER JOIN
                         dbo.CourseTable ON dbo.RoomTypeTable.RoomTypeID = dbo.CourseTable.RoomTypeID



GO
/****** Object:  View [dbo].[v_AllTimeSlots]    Script Date: 14/06/2020 9:40:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_AllTimeSlots]
AS
SELECT        dbo.DayTimeSlotTable.DayTimeSlotID, dbo.DayTimeSlotTable.SlotTitle, dbo.DayTimeSlotTable.StartTime, dbo.DayTimeSlotTable.DayID, dbo.DayTable.Name, dbo.DayTimeSlotTable.EndTime, 
                         dbo.DayTimeSlotTable.IsActive
FROM            dbo.DayTable INNER JOIN
                         dbo.DayTimeSlotTable ON dbo.DayTable.DayID = dbo.DayTimeSlotTable.DayID



GO
SET IDENTITY_INSERT [dbo].[CourseTable] ON 

INSERT [dbo].[CourseTable] ([CourseID], [Title], [IsActive], [CrHrs], [RoomTypeID]) VALUES (2, N'Information and Communication Technologies(CS)', 1, 3, 3)
INSERT [dbo].[CourseTable] ([CourseID], [Title], [IsActive], [CrHrs], [RoomTypeID]) VALUES (3, N'Calculus and Analytical Geometry', 1, 3, 3)
INSERT [dbo].[CourseTable] ([CourseID], [Title], [IsActive], [CrHrs], [RoomTypeID]) VALUES (4, N'Basic Electronics', 1, 3, 3)
INSERT [dbo].[CourseTable] ([CourseID], [Title], [IsActive], [CrHrs], [RoomTypeID]) VALUES (5, N'English Composition & Comprehension(ED)', 1, 3, 3)
INSERT [dbo].[CourseTable] ([CourseID], [Title], [IsActive], [CrHrs], [RoomTypeID]) VALUES (6, N'Programming Fundamentals(CS)', 1, 3, 4)
INSERT [dbo].[CourseTable] ([CourseID], [Title], [IsActive], [CrHrs], [RoomTypeID]) VALUES (7, N'Islamic Studies(CS)', 1, 2, 3)
INSERT [dbo].[CourseTable] ([CourseID], [Title], [IsActive], [CrHrs], [RoomTypeID]) VALUES (8, N'Object Oriented Programming', 1, 3, 4)
INSERT [dbo].[CourseTable] ([CourseID], [Title], [IsActive], [CrHrs], [RoomTypeID]) VALUES (9, N'Discrete Structure', 1, 3, 3)
INSERT [dbo].[CourseTable] ([CourseID], [Title], [IsActive], [CrHrs], [RoomTypeID]) VALUES (10, N'Technical and Business Writing', 1, 3, 3)
INSERT [dbo].[CourseTable] ([CourseID], [Title], [IsActive], [CrHrs], [RoomTypeID]) VALUES (11, N'Pakistan Studies', 1, 2, 3)
INSERT [dbo].[CourseTable] ([CourseID], [Title], [IsActive], [CrHrs], [RoomTypeID]) VALUES (12, N'Digital Logic Design(CS)', 1, 3, 4)
INSERT [dbo].[CourseTable] ([CourseID], [Title], [IsActive], [CrHrs], [RoomTypeID]) VALUES (13, N'Probability and Statistics ', 1, 3, 3)
INSERT [dbo].[CourseTable] ([CourseID], [Title], [IsActive], [CrHrs], [RoomTypeID]) VALUES (14, N'Data Structure', 1, 3, 3)
INSERT [dbo].[CourseTable] ([CourseID], [Title], [IsActive], [CrHrs], [RoomTypeID]) VALUES (15, N'Communication Skills', 1, 3, 3)
INSERT [dbo].[CourseTable] ([CourseID], [Title], [IsActive], [CrHrs], [RoomTypeID]) VALUES (16, N'Linear Algebra', 1, 3, 3)
INSERT [dbo].[CourseTable] ([CourseID], [Title], [IsActive], [CrHrs], [RoomTypeID]) VALUES (17, N'Operating Systems', 1, 3, 3)
INSERT [dbo].[CourseTable] ([CourseID], [Title], [IsActive], [CrHrs], [RoomTypeID]) VALUES (18, N'Analysis of Algorithms ', 1, 3, 3)
INSERT [dbo].[CourseTable] ([CourseID], [Title], [IsActive], [CrHrs], [RoomTypeID]) VALUES (19, N'Web Engineering ', 1, 3, 4)
INSERT [dbo].[CourseTable] ([CourseID], [Title], [IsActive], [CrHrs], [RoomTypeID]) VALUES (20, N'Multivariate Calculus ', 1, 3, 3)
INSERT [dbo].[CourseTable] ([CourseID], [Title], [IsActive], [CrHrs], [RoomTypeID]) VALUES (21, N'Computer Assembly Language Programming', 1, 3, 4)
INSERT [dbo].[CourseTable] ([CourseID], [Title], [IsActive], [CrHrs], [RoomTypeID]) VALUES (22, N'Visual Programming', 1, 3, 4)
INSERT [dbo].[CourseTable] ([CourseID], [Title], [IsActive], [CrHrs], [RoomTypeID]) VALUES (23, N'Numerical Computing', 1, 3, 3)
INSERT [dbo].[CourseTable] ([CourseID], [Title], [IsActive], [CrHrs], [RoomTypeID]) VALUES (24, N'Database-1', 1, 3, 4)
INSERT [dbo].[CourseTable] ([CourseID], [Title], [IsActive], [CrHrs], [RoomTypeID]) VALUES (25, N'Theory of Automate ', 1, 3, 3)
INSERT [dbo].[CourseTable] ([CourseID], [Title], [IsActive], [CrHrs], [RoomTypeID]) VALUES (26, N'Differential Equations', 1, 3, 3)
INSERT [dbo].[CourseTable] ([CourseID], [Title], [IsActive], [CrHrs], [RoomTypeID]) VALUES (27, N'Data Communication', 1, 3, 3)
INSERT [dbo].[CourseTable] ([CourseID], [Title], [IsActive], [CrHrs], [RoomTypeID]) VALUES (28, N'Human Resource Management ', 1, 3, 3)
INSERT [dbo].[CourseTable] ([CourseID], [Title], [IsActive], [CrHrs], [RoomTypeID]) VALUES (29, N'Financial Accounting', 1, 3, 3)
INSERT [dbo].[CourseTable] ([CourseID], [Title], [IsActive], [CrHrs], [RoomTypeID]) VALUES (30, N'Software Engineering-1', 1, 3, 4)
INSERT [dbo].[CourseTable] ([CourseID], [Title], [IsActive], [CrHrs], [RoomTypeID]) VALUES (31, N'Computer Network', 1, 3, 3)
INSERT [dbo].[CourseTable] ([CourseID], [Title], [IsActive], [CrHrs], [RoomTypeID]) VALUES (32, N'Computer Architecture', 1, 3, 3)
INSERT [dbo].[CourseTable] ([CourseID], [Title], [IsActive], [CrHrs], [RoomTypeID]) VALUES (33, N'Compiler Construction', 1, 3, 4)
INSERT [dbo].[CourseTable] ([CourseID], [Title], [IsActive], [CrHrs], [RoomTypeID]) VALUES (34, N'Database-II', 1, 3, 4)
INSERT [dbo].[CourseTable] ([CourseID], [Title], [IsActive], [CrHrs], [RoomTypeID]) VALUES (35, N'Human Computer Interaction', 1, 3, 3)
INSERT [dbo].[CourseTable] ([CourseID], [Title], [IsActive], [CrHrs], [RoomTypeID]) VALUES (36, N'Network and System Programming', 1, 3, 4)
INSERT [dbo].[CourseTable] ([CourseID], [Title], [IsActive], [CrHrs], [RoomTypeID]) VALUES (37, N'Professional Practices', 1, 3, 3)
INSERT [dbo].[CourseTable] ([CourseID], [Title], [IsActive], [CrHrs], [RoomTypeID]) VALUES (38, N'Software Engineering-II', 1, 3, 4)
INSERT [dbo].[CourseTable] ([CourseID], [Title], [IsActive], [CrHrs], [RoomTypeID]) VALUES (39, N'Software Project-I', 1, 3, 4)
INSERT [dbo].[CourseTable] ([CourseID], [Title], [IsActive], [CrHrs], [RoomTypeID]) VALUES (40, N'Digital Signal Processing', 1, 3, 3)
INSERT [dbo].[CourseTable] ([CourseID], [Title], [IsActive], [CrHrs], [RoomTypeID]) VALUES (41, N'Wireless Networks', 1, 3, 3)
INSERT [dbo].[CourseTable] ([CourseID], [Title], [IsActive], [CrHrs], [RoomTypeID]) VALUES (42, N'Artificial Intelligence', 1, 3, 3)
INSERT [dbo].[CourseTable] ([CourseID], [Title], [IsActive], [CrHrs], [RoomTypeID]) VALUES (43, N'Computer Graphics', 1, 3, 4)
INSERT [dbo].[CourseTable] ([CourseID], [Title], [IsActive], [CrHrs], [RoomTypeID]) VALUES (44, N'Advance Database System', 1, 3, 3)
INSERT [dbo].[CourseTable] ([CourseID], [Title], [IsActive], [CrHrs], [RoomTypeID]) VALUES (45, N'Software Project-II', 1, 3, 4)
INSERT [dbo].[CourseTable] ([CourseID], [Title], [IsActive], [CrHrs], [RoomTypeID]) VALUES (46, N'Telecommunication Systems', 1, 3, 3)
INSERT [dbo].[CourseTable] ([CourseID], [Title], [IsActive], [CrHrs], [RoomTypeID]) VALUES (47, N'Data & Network Security', 1, 3, 3)
INSERT [dbo].[CourseTable] ([CourseID], [Title], [IsActive], [CrHrs], [RoomTypeID]) VALUES (48, N'Web Fundamentals', 1, 3, 3)
INSERT [dbo].[CourseTable] ([CourseID], [Title], [IsActive], [CrHrs], [RoomTypeID]) VALUES (49, N'Fundamentals of Data Mining', 1, 3, 4)
INSERT [dbo].[CourseTable] ([CourseID], [Title], [IsActive], [CrHrs], [RoomTypeID]) VALUES (50, N'Event Driven Programming', 1, 3, 4)
INSERT [dbo].[CourseTable] ([CourseID], [Title], [IsActive], [CrHrs], [RoomTypeID]) VALUES (51, N'Cyber Security', 1, 3, 4)
INSERT [dbo].[CourseTable] ([CourseID], [Title], [IsActive], [CrHrs], [RoomTypeID]) VALUES (52, N'Operations Research', 1, 2, 3)
INSERT [dbo].[CourseTable] ([CourseID], [Title], [IsActive], [CrHrs], [RoomTypeID]) VALUES (53, N'Information Security', 1, 3, 3)
INSERT [dbo].[CourseTable] ([CourseID], [Title], [IsActive], [CrHrs], [RoomTypeID]) VALUES (54, N'Software Architecture Design', 1, 3, 3)
INSERT [dbo].[CourseTable] ([CourseID], [Title], [IsActive], [CrHrs], [RoomTypeID]) VALUES (55, N'IT Project Management', 1, 3, 3)
INSERT [dbo].[CourseTable] ([CourseID], [Title], [IsActive], [CrHrs], [RoomTypeID]) VALUES (56, N'IT Infrastructure', 1, 3, 3)
INSERT [dbo].[CourseTable] ([CourseID], [Title], [IsActive], [CrHrs], [RoomTypeID]) VALUES (57, N'Software Requirement Engineering', 1, 3, 3)
INSERT [dbo].[CourseTable] ([CourseID], [Title], [IsActive], [CrHrs], [RoomTypeID]) VALUES (58, N'Introduction to Database System', 1, 3, 4)
INSERT [dbo].[CourseTable] ([CourseID], [Title], [IsActive], [CrHrs], [RoomTypeID]) VALUES (59, N'Distributed Database System', 1, 3, 3)
SET IDENTITY_INSERT [dbo].[CourseTable] OFF
SET IDENTITY_INSERT [dbo].[DayTable] ON 

INSERT [dbo].[DayTable] ([DayID], [Name], [IsActive]) VALUES (1, N'MONDAY', 1)
INSERT [dbo].[DayTable] ([DayID], [Name], [IsActive]) VALUES (2, N'TUESDAY', 1)
INSERT [dbo].[DayTable] ([DayID], [Name], [IsActive]) VALUES (3, N'WEDNESDAY', 1)
INSERT [dbo].[DayTable] ([DayID], [Name], [IsActive]) VALUES (4, N'THURSDAY', 1)
INSERT [dbo].[DayTable] ([DayID], [Name], [IsActive]) VALUES (5, N'FRIDAY', 1)
INSERT [dbo].[DayTable] ([DayID], [Name], [IsActive]) VALUES (6, N'SATURDAY', 0)
INSERT [dbo].[DayTable] ([DayID], [Name], [IsActive]) VALUES (7, N'SUNDAY', 0)
SET IDENTITY_INSERT [dbo].[DayTable] OFF
SET IDENTITY_INSERT [dbo].[DayTimeSlotTable] ON 

INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (1, 1, N'08:00 AM-09:00 AM', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 0)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (2, 1, N'09:00 AM-10:00 AM', CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 0)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (3, 1, N'10:00 AM-11:00 AM', CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 0)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (4, 1, N'11:00 AM-12:00 PM', CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (5, 1, N'12:00 PM-01:00 PM', CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (6, 1, N'01:00 PM-02:00 PM', CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (7, 1, N'02:00 PM-03:00 PM', CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (8, 1, N'03:00 PM-04:00 PM', CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (9, 2, N'08:00 AM-09:00 AM', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 0)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (10, 2, N'09:00 AM-10:00 AM', CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 0)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (11, 2, N'10:00 AM-11:00 AM', CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 0)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (12, 2, N'11:00 AM-12:00 PM', CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (13, 2, N'12:00 PM-01:00 PM', CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (14, 2, N'01:00 PM-02:00 PM', CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (15, 2, N'02:00 PM-03:00 PM', CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (16, 2, N'03:00 PM-04:00 PM', CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (17, 3, N'08:00 AM-09:00 AM', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 0)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (18, 3, N'09:00 AM-10:00 AM', CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 0)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (19, 3, N'10:00 AM-11:00 AM', CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 0)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (20, 3, N'11:00 AM-12:00 PM', CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (21, 3, N'12:00 PM-01:00 PM', CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (22, 3, N'01:00 PM-02:00 PM', CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (23, 3, N'02:00 PM-03:00 PM', CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (24, 3, N'03:00 PM-04:00 PM', CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (25, 4, N'08:00 AM-09:00 AM', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 0)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (26, 4, N'09:00 AM-10:00 AM', CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 0)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (27, 4, N'10:00 AM-11:00 AM', CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 0)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (28, 4, N'11:00 AM-12:00 PM', CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (29, 4, N'12:00 PM-01:00 PM', CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (30, 4, N'01:00 PM-02:00 PM', CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (31, 4, N'02:00 PM-03:00 PM', CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (32, 4, N'03:00 PM-04:00 PM', CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (33, 5, N'08:00 AM-09:00 AM', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 0)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (34, 5, N'09:00 AM-10:00 AM', CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 0)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (35, 5, N'10:00 AM-11:00 AM', CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 0)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (36, 5, N'11:00 AM-12:00 PM', CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (37, 5, N'12:00 PM-01:00 PM', CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (38, 5, N'01:00 PM-02:00 PM', CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (39, 5, N'02:00 PM-03:00 PM', CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (40, 5, N'03:00 PM-04:00 PM', CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (41, 5, N'08:00 AM-08:48 AM', CAST(N'08:00:00' AS Time), CAST(N'08:48:00' AS Time), 0)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (42, 5, N'08:48 AM-09:36 AM', CAST(N'08:48:00' AS Time), CAST(N'09:36:00' AS Time), 0)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (43, 5, N'09:36 AM-10:24 AM', CAST(N'09:36:00' AS Time), CAST(N'10:24:00' AS Time), 0)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (44, 5, N'10:24 AM-11:12 AM', CAST(N'10:24:00' AS Time), CAST(N'11:12:00' AS Time), 0)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (45, 5, N'11:12 AM-12:00 PM', CAST(N'11:12:00' AS Time), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (46, 5, N'12:00 PM-12:48 PM', CAST(N'12:00:00' AS Time), CAST(N'12:48:00' AS Time), 0)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (47, 5, N'12:48 PM-01:36 PM', CAST(N'12:48:00' AS Time), CAST(N'13:36:00' AS Time), 0)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (48, 5, N'01:36 PM-02:24 PM', CAST(N'13:36:00' AS Time), CAST(N'14:24:00' AS Time), 0)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (49, 5, N'02:24 PM-03:12 PM', CAST(N'14:24:00' AS Time), CAST(N'15:12:00' AS Time), 0)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (50, 5, N'03:12 PM-04:00 PM', CAST(N'15:12:00' AS Time), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (51, 5, N'08:00 AM-09:00 AM', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 0)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (52, 5, N'09:00 AM-10:00 AM', CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 0)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (53, 5, N'10:00 AM-11:00 AM', CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 0)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (54, 5, N'11:00 AM-12:00 PM', CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (55, 5, N'12:00 PM-01:00 PM', CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (56, 5, N'01:00 PM-02:00 PM', CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (57, 5, N'02:00 PM-03:00 PM', CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (58, 5, N'03:00 PM-04:00 PM', CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (59, 1, N'09:00 AM-10:36 AM', CAST(N'09:00:00' AS Time), CAST(N'10:36:00' AS Time), 0)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (60, 1, N'10:36 AM-12:12 PM', CAST(N'10:36:00' AS Time), CAST(N'12:12:00' AS Time), 0)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (61, 1, N'12:12 PM-01:48 PM', CAST(N'12:12:00' AS Time), CAST(N'13:48:00' AS Time), 0)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (62, 1, N'01:48 PM-03:24 PM', CAST(N'13:48:00' AS Time), CAST(N'15:24:00' AS Time), 0)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (63, 1, N'03:24 PM-05:00 PM', CAST(N'15:24:00' AS Time), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (64, 1, N'09:30 AM-11:00 AM', CAST(N'09:30:00' AS Time), CAST(N'11:00:00' AS Time), 1)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (65, 1, N'11:00 AM-12:30 PM', CAST(N'11:00:00' AS Time), CAST(N'12:30:00' AS Time), 1)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (66, 1, N'12:30 PM-02:00 PM', CAST(N'12:30:00' AS Time), CAST(N'14:00:00' AS Time), 1)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (67, 1, N'02:00 PM-03:30 PM', CAST(N'14:00:00' AS Time), CAST(N'15:30:00' AS Time), 1)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (68, 1, N'03:30 PM-05:00 PM', CAST(N'15:30:00' AS Time), CAST(N'17:00:00' AS Time), 1)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (69, 2, N'09:30 AM-11:00 AM', CAST(N'09:30:00' AS Time), CAST(N'11:00:00' AS Time), 1)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (70, 2, N'11:00 AM-12:30 PM', CAST(N'11:00:00' AS Time), CAST(N'12:30:00' AS Time), 1)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (71, 2, N'12:30 PM-02:00 PM', CAST(N'12:30:00' AS Time), CAST(N'14:00:00' AS Time), 1)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (72, 2, N'02:00 PM-03:30 PM', CAST(N'14:00:00' AS Time), CAST(N'15:30:00' AS Time), 1)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (73, 2, N'03:30 PM-05:00 PM', CAST(N'15:30:00' AS Time), CAST(N'17:00:00' AS Time), 1)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (74, 3, N'09:30 AM-11:00 AM', CAST(N'09:30:00' AS Time), CAST(N'11:00:00' AS Time), 1)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (75, 3, N'11:00 AM-12:30 PM', CAST(N'11:00:00' AS Time), CAST(N'12:30:00' AS Time), 1)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (76, 3, N'12:30 PM-02:00 PM', CAST(N'12:30:00' AS Time), CAST(N'14:00:00' AS Time), 1)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (77, 3, N'02:00 PM-03:30 PM', CAST(N'14:00:00' AS Time), CAST(N'15:30:00' AS Time), 1)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (78, 3, N'03:30 PM-05:00 PM', CAST(N'15:30:00' AS Time), CAST(N'17:00:00' AS Time), 1)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (79, 4, N'09:30 AM-11:00 AM', CAST(N'09:30:00' AS Time), CAST(N'11:00:00' AS Time), 1)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (80, 4, N'11:00 AM-12:30 PM', CAST(N'11:00:00' AS Time), CAST(N'12:30:00' AS Time), 1)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (81, 4, N'12:30 PM-02:00 PM', CAST(N'12:30:00' AS Time), CAST(N'14:00:00' AS Time), 1)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (82, 4, N'02:00 PM-03:30 PM', CAST(N'14:00:00' AS Time), CAST(N'15:30:00' AS Time), 1)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (83, 4, N'03:30 PM-05:00 PM', CAST(N'15:30:00' AS Time), CAST(N'17:00:00' AS Time), 1)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (84, 5, N'09:30 AM-11:00 AM', CAST(N'09:30:00' AS Time), CAST(N'11:00:00' AS Time), 1)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (85, 5, N'11:00 AM-12:30 PM', CAST(N'11:00:00' AS Time), CAST(N'12:30:00' AS Time), 1)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (86, 5, N'12:30 PM-02:00 PM', CAST(N'12:30:00' AS Time), CAST(N'14:00:00' AS Time), 1)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (87, 5, N'02:00 PM-03:30 PM', CAST(N'14:00:00' AS Time), CAST(N'15:30:00' AS Time), 1)
INSERT [dbo].[DayTimeSlotTable] ([DayTimeSlotID], [DayID], [SlotTitle], [StartTime], [EndTime], [IsActive]) VALUES (88, 5, N'03:30 PM-05:00 PM', CAST(N'15:30:00' AS Time), CAST(N'17:00:00' AS Time), 1)
SET IDENTITY_INSERT [dbo].[DayTimeSlotTable] OFF
SET IDENTITY_INSERT [dbo].[LabTable] ON 

INSERT [dbo].[LabTable] ([LabID], [LabNo], [Capacity], [IsActive]) VALUES (1, N'LAB 1', 50, 0)
INSERT [dbo].[LabTable] ([LabID], [LabNo], [Capacity], [IsActive]) VALUES (2, N'LAB 2', 70, 1)
INSERT [dbo].[LabTable] ([LabID], [LabNo], [Capacity], [IsActive]) VALUES (3, N'LAB 3', 150, 1)
INSERT [dbo].[LabTable] ([LabID], [LabNo], [Capacity], [IsActive]) VALUES (4, N'LAB 4', 80, 0)
INSERT [dbo].[LabTable] ([LabID], [LabNo], [Capacity], [IsActive]) VALUES (5, N'LAB 5', 70, 0)
SET IDENTITY_INSERT [dbo].[LabTable] OFF
SET IDENTITY_INSERT [dbo].[LectureSubjectTable] ON 

INSERT [dbo].[LectureSubjectTable] ([LectureSubjectID], [SubjectTitle], [LectureID], [CourseID], [IsActive]) VALUES (2, N'Information and Communication Technologies(CS)(DR.AMJID)', 1, 2, 1)
INSERT [dbo].[LectureSubjectTable] ([LectureSubjectID], [SubjectTitle], [LectureID], [CourseID], [IsActive]) VALUES (3, N'Programming Fundamentals(CS)(DR.AMJID)', 1, 6, 1)
INSERT [dbo].[LectureSubjectTable] ([LectureSubjectID], [SubjectTitle], [LectureID], [CourseID], [IsActive]) VALUES (4, N'Computer Assembly Language Programming(DR.AMJID)', 1, 21, 1)
INSERT [dbo].[LectureSubjectTable] ([LectureSubjectID], [SubjectTitle], [LectureID], [CourseID], [IsActive]) VALUES (5, N'Cyber Security(DR.AMJID)', 1, 51, 1)
INSERT [dbo].[LectureSubjectTable] ([LectureSubjectID], [SubjectTitle], [LectureID], [CourseID], [IsActive]) VALUES (6, N'Islamic Studies(CS)(MR.HAMZA)', 2, 7, 1)
INSERT [dbo].[LectureSubjectTable] ([LectureSubjectID], [SubjectTitle], [LectureID], [CourseID], [IsActive]) VALUES (7, N'Calculus and Analytical Geometry(MR.JUNAID)', 3, 3, 1)
INSERT [dbo].[LectureSubjectTable] ([LectureSubjectID], [SubjectTitle], [LectureID], [CourseID], [IsActive]) VALUES (8, N'Discrete Structure(MR.JUNAID)', 3, 9, 1)
INSERT [dbo].[LectureSubjectTable] ([LectureSubjectID], [SubjectTitle], [LectureID], [CourseID], [IsActive]) VALUES (9, N'Linear Algebra(MR.JUNAID)', 3, 16, 1)
INSERT [dbo].[LectureSubjectTable] ([LectureSubjectID], [SubjectTitle], [LectureID], [CourseID], [IsActive]) VALUES (10, N'Multivariate Calculus (MR.JUNAID)', 3, 20, 1)
INSERT [dbo].[LectureSubjectTable] ([LectureSubjectID], [SubjectTitle], [LectureID], [CourseID], [IsActive]) VALUES (11, N'Basic Electronics(MR.SALMAN)', 4, 4, 1)
INSERT [dbo].[LectureSubjectTable] ([LectureSubjectID], [SubjectTitle], [LectureID], [CourseID], [IsActive]) VALUES (12, N'Data Structure(MR.SALMAN)', 4, 14, 1)
INSERT [dbo].[LectureSubjectTable] ([LectureSubjectID], [SubjectTitle], [LectureID], [CourseID], [IsActive]) VALUES (13, N'Compiler Construction(MR.SALMAN)', 4, 33, 1)
INSERT [dbo].[LectureSubjectTable] ([LectureSubjectID], [SubjectTitle], [LectureID], [CourseID], [IsActive]) VALUES (14, N'English Composition & Comprehension(ED)(DR.WAZIR KHAN)', 5, 5, 1)
INSERT [dbo].[LectureSubjectTable] ([LectureSubjectID], [SubjectTitle], [LectureID], [CourseID], [IsActive]) VALUES (15, N'Technical and Business Writing(DR.WAZIR KHAN)', 5, 10, 1)
INSERT [dbo].[LectureSubjectTable] ([LectureSubjectID], [SubjectTitle], [LectureID], [CourseID], [IsActive]) VALUES (16, N'Communication Skills(MR.IFTIKHAR)', 6, 15, 1)
INSERT [dbo].[LectureSubjectTable] ([LectureSubjectID], [SubjectTitle], [LectureID], [CourseID], [IsActive]) VALUES (17, N'Professional Practices(MR.IFTIKHAR)', 6, 37, 1)
INSERT [dbo].[LectureSubjectTable] ([LectureSubjectID], [SubjectTitle], [LectureID], [CourseID], [IsActive]) VALUES (18, N'Professional Practices(MR.ZIA UR REHMAN)', 7, 37, 0)
INSERT [dbo].[LectureSubjectTable] ([LectureSubjectID], [SubjectTitle], [LectureID], [CourseID], [IsActive]) VALUES (19, N'Object Oriented Programming(MR.ZIA UR REHMAN)', 7, 8, 1)
INSERT [dbo].[LectureSubjectTable] ([LectureSubjectID], [SubjectTitle], [LectureID], [CourseID], [IsActive]) VALUES (20, N'Database-1(MR.ZIA UR REHMAN)', 7, 24, 1)
INSERT [dbo].[LectureSubjectTable] ([LectureSubjectID], [SubjectTitle], [LectureID], [CourseID], [IsActive]) VALUES (21, N'Database-II(MR.ZIA UR REHMAN)', 7, 34, 1)
INSERT [dbo].[LectureSubjectTable] ([LectureSubjectID], [SubjectTitle], [LectureID], [CourseID], [IsActive]) VALUES (22, N'Pakistan Studies(MR.ALI KHAN)', 13, 11, 1)
INSERT [dbo].[LectureSubjectTable] ([LectureSubjectID], [SubjectTitle], [LectureID], [CourseID], [IsActive]) VALUES (23, N'Operating Systems(MR.SABIR SHAH)', 8, 17, 1)
INSERT [dbo].[LectureSubjectTable] ([LectureSubjectID], [SubjectTitle], [LectureID], [CourseID], [IsActive]) VALUES (24, N'Computer Architecture(MR.SABIR SHAH)', 8, 32, 1)
INSERT [dbo].[LectureSubjectTable] ([LectureSubjectID], [SubjectTitle], [LectureID], [CourseID], [IsActive]) VALUES (25, N'Network and System Programming(MR.SABIR SHAH)', 8, 36, 1)
INSERT [dbo].[LectureSubjectTable] ([LectureSubjectID], [SubjectTitle], [LectureID], [CourseID], [IsActive]) VALUES (26, N'Data & Network Security(MR.SABIR SHAH)', 8, 47, 1)
INSERT [dbo].[LectureSubjectTable] ([LectureSubjectID], [SubjectTitle], [LectureID], [CourseID], [IsActive]) VALUES (27, N'Theory of Automate (MR.FAIZAN)', 9, 25, 1)
INSERT [dbo].[LectureSubjectTable] ([LectureSubjectID], [SubjectTitle], [LectureID], [CourseID], [IsActive]) VALUES (28, N'Fundamentals of Data Mining(MR.FAIZAN)', 9, 49, 1)
INSERT [dbo].[LectureSubjectTable] ([LectureSubjectID], [SubjectTitle], [LectureID], [CourseID], [IsActive]) VALUES (29, N'Visual Programming(DR.YASIR)', 10, 22, 1)
INSERT [dbo].[LectureSubjectTable] ([LectureSubjectID], [SubjectTitle], [LectureID], [CourseID], [IsActive]) VALUES (30, N'Computer Graphics(DR.YASIR)', 10, 43, 1)
INSERT [dbo].[LectureSubjectTable] ([LectureSubjectID], [SubjectTitle], [LectureID], [CourseID], [IsActive]) VALUES (31, N'Digital Logic Design(CS)(DR.YASIR)', 10, 12, 1)
INSERT [dbo].[LectureSubjectTable] ([LectureSubjectID], [SubjectTitle], [LectureID], [CourseID], [IsActive]) VALUES (32, N'Analysis of Algorithms (MR.MUHAMMAD KHAN)', 11, 18, 1)
INSERT [dbo].[LectureSubjectTable] ([LectureSubjectID], [SubjectTitle], [LectureID], [CourseID], [IsActive]) VALUES (33, N'Computer Network(MR.MUHAMMAD KHAN)', 11, 31, 1)
INSERT [dbo].[LectureSubjectTable] ([LectureSubjectID], [SubjectTitle], [LectureID], [CourseID], [IsActive]) VALUES (34, N'Operations Research(MR.MUHAMMAD KHAN)', 11, 52, 1)
INSERT [dbo].[LectureSubjectTable] ([LectureSubjectID], [SubjectTitle], [LectureID], [CourseID], [IsActive]) VALUES (35, N'Web Engineering (MR.FARMAN)', 12, 19, 1)
INSERT [dbo].[LectureSubjectTable] ([LectureSubjectID], [SubjectTitle], [LectureID], [CourseID], [IsActive]) VALUES (36, N'Web Fundamentals(MR.FARMAN)', 12, 48, 1)
INSERT [dbo].[LectureSubjectTable] ([LectureSubjectID], [SubjectTitle], [LectureID], [CourseID], [IsActive]) VALUES (37, N'Software Engineering-1(DR.ASLAM)', 14, 30, 1)
INSERT [dbo].[LectureSubjectTable] ([LectureSubjectID], [SubjectTitle], [LectureID], [CourseID], [IsActive]) VALUES (38, N'Software Engineering-II(DR.ASLAM)', 14, 38, 1)
INSERT [dbo].[LectureSubjectTable] ([LectureSubjectID], [SubjectTitle], [LectureID], [CourseID], [IsActive]) VALUES (39, N'IT Project Management(DR.ASLAM)', 14, 55, 1)
INSERT [dbo].[LectureSubjectTable] ([LectureSubjectID], [SubjectTitle], [LectureID], [CourseID], [IsActive]) VALUES (40, N'Numerical Computing(DR.IMRAN ALI)', 15, 23, 1)
INSERT [dbo].[LectureSubjectTable] ([LectureSubjectID], [SubjectTitle], [LectureID], [CourseID], [IsActive]) VALUES (41, N'Digital Signal Processing(DR.IMRAN ALI)', 15, 40, 1)
INSERT [dbo].[LectureSubjectTable] ([LectureSubjectID], [SubjectTitle], [LectureID], [CourseID], [IsActive]) VALUES (42, N'Software Project-I(DR.WAQAR ALI)', 16, 39, 1)
INSERT [dbo].[LectureSubjectTable] ([LectureSubjectID], [SubjectTitle], [LectureID], [CourseID], [IsActive]) VALUES (43, N'Software Project-II(DR.WAQAR ALI)', 16, 45, 1)
INSERT [dbo].[LectureSubjectTable] ([LectureSubjectID], [SubjectTitle], [LectureID], [CourseID], [IsActive]) VALUES (44, N'Software Requirement Engineering(DR.WAQAR ALI)', 16, 57, 1)
INSERT [dbo].[LectureSubjectTable] ([LectureSubjectID], [SubjectTitle], [LectureID], [CourseID], [IsActive]) VALUES (45, N'Probability and Statistics (DR.ASAD KHAN)', 17, 13, 1)
INSERT [dbo].[LectureSubjectTable] ([LectureSubjectID], [SubjectTitle], [LectureID], [CourseID], [IsActive]) VALUES (46, N'Human Resource Management (DR.ASAD KHAN)', 17, 28, 1)
INSERT [dbo].[LectureSubjectTable] ([LectureSubjectID], [SubjectTitle], [LectureID], [CourseID], [IsActive]) VALUES (47, N'Data Communication(DR.SADRA REHMAN)', 18, 27, 1)
INSERT [dbo].[LectureSubjectTable] ([LectureSubjectID], [SubjectTitle], [LectureID], [CourseID], [IsActive]) VALUES (48, N'Human Computer Interaction(DR.SADRA REHMAN)', 18, 35, 1)
INSERT [dbo].[LectureSubjectTable] ([LectureSubjectID], [SubjectTitle], [LectureID], [CourseID], [IsActive]) VALUES (49, N'IT Infrastructure(DR.SADRA REHMAN)', 18, 56, 1)
INSERT [dbo].[LectureSubjectTable] ([LectureSubjectID], [SubjectTitle], [LectureID], [CourseID], [IsActive]) VALUES (50, N'Financial Accounting(DR.AZRA NAVEED)', 19, 29, 1)
INSERT [dbo].[LectureSubjectTable] ([LectureSubjectID], [SubjectTitle], [LectureID], [CourseID], [IsActive]) VALUES (51, N'Wireless Networks(MR.NADIA JAMSHID)', 20, 41, 1)
INSERT [dbo].[LectureSubjectTable] ([LectureSubjectID], [SubjectTitle], [LectureID], [CourseID], [IsActive]) VALUES (52, N'Information Security(MR.NADIA JAMSHID)', 20, 53, 1)
INSERT [dbo].[LectureSubjectTable] ([LectureSubjectID], [SubjectTitle], [LectureID], [CourseID], [IsActive]) VALUES (53, N'Artificial Intelligence(MR.MASOOM SHAH)', 21, 42, 1)
INSERT [dbo].[LectureSubjectTable] ([LectureSubjectID], [SubjectTitle], [LectureID], [CourseID], [IsActive]) VALUES (54, N'Software Architecture Design(MR.MASOOM SHAH)', 21, 54, 1)
INSERT [dbo].[LectureSubjectTable] ([LectureSubjectID], [SubjectTitle], [LectureID], [CourseID], [IsActive]) VALUES (55, N'Advance Database System(MR.ZIA UR REHMAN)', 7, 44, 1)
INSERT [dbo].[LectureSubjectTable] ([LectureSubjectID], [SubjectTitle], [LectureID], [CourseID], [IsActive]) VALUES (56, N'Telecommunication Systems(DR.NAVEED KHAN)', 22, 46, 1)
INSERT [dbo].[LectureSubjectTable] ([LectureSubjectID], [SubjectTitle], [LectureID], [CourseID], [IsActive]) VALUES (57, N'Event Driven Programming(DR.NAVEED KHAN)', 22, 50, 1)
INSERT [dbo].[LectureSubjectTable] ([LectureSubjectID], [SubjectTitle], [LectureID], [CourseID], [IsActive]) VALUES (58, N'Introduction to Database System(MR.ZIA UR REHMAN)', 7, 58, 1)
INSERT [dbo].[LectureSubjectTable] ([LectureSubjectID], [SubjectTitle], [LectureID], [CourseID], [IsActive]) VALUES (59, N'Distributed Database System(MR.ZIA UR REHMAN)', 7, 59, 1)
SET IDENTITY_INSERT [dbo].[LectureSubjectTable] OFF
SET IDENTITY_INSERT [dbo].[LectureTable] ON 

INSERT [dbo].[LectureTable] ([LectureID], [FullName], [ContactNo], [IsActive]) VALUES (1, N'DR.AMJID', N'0314-6562662', 1)
INSERT [dbo].[LectureTable] ([LectureID], [FullName], [ContactNo], [IsActive]) VALUES (2, N'MR.HAMZA', N'0314-9595956', 1)
INSERT [dbo].[LectureTable] ([LectureID], [FullName], [ContactNo], [IsActive]) VALUES (3, N'MR.JUNAID', N'0314-9898956', 1)
INSERT [dbo].[LectureTable] ([LectureID], [FullName], [ContactNo], [IsActive]) VALUES (4, N'MR.SALMAN', N'0314-6565658', 1)
INSERT [dbo].[LectureTable] ([LectureID], [FullName], [ContactNo], [IsActive]) VALUES (5, N'DR.WAZIR KHAN', N'0315-6565425', 1)
INSERT [dbo].[LectureTable] ([LectureID], [FullName], [ContactNo], [IsActive]) VALUES (6, N'MR.IFTIKHAR', N'0345-9575845', 1)
INSERT [dbo].[LectureTable] ([LectureID], [FullName], [ContactNo], [IsActive]) VALUES (7, N'MR.ZIA UR REHMAN', N'0335-6565252', 1)
INSERT [dbo].[LectureTable] ([LectureID], [FullName], [ContactNo], [IsActive]) VALUES (8, N'MR.SABIR SHAH', N'0345-8998585', 1)
INSERT [dbo].[LectureTable] ([LectureID], [FullName], [ContactNo], [IsActive]) VALUES (9, N'MR.FAIZAN', N'0335-8584558', 1)
INSERT [dbo].[LectureTable] ([LectureID], [FullName], [ContactNo], [IsActive]) VALUES (10, N'DR.YASIR', N'0312-6585425', 1)
INSERT [dbo].[LectureTable] ([LectureID], [FullName], [ContactNo], [IsActive]) VALUES (11, N'MR.MUHAMMAD KHAN', N'0312-8545251', 1)
INSERT [dbo].[LectureTable] ([LectureID], [FullName], [ContactNo], [IsActive]) VALUES (12, N'MR.FARMAN', N'0316-5525251', 1)
INSERT [dbo].[LectureTable] ([LectureID], [FullName], [ContactNo], [IsActive]) VALUES (13, N'MR.ALI KHAN', N'0316-4542115', 1)
INSERT [dbo].[LectureTable] ([LectureID], [FullName], [ContactNo], [IsActive]) VALUES (14, N'DR.ASLAM', N'0311-6562213', 1)
INSERT [dbo].[LectureTable] ([LectureID], [FullName], [ContactNo], [IsActive]) VALUES (15, N'DR.IMRAN ALI', N'0314-3076781', 1)
INSERT [dbo].[LectureTable] ([LectureID], [FullName], [ContactNo], [IsActive]) VALUES (16, N'DR.WAQAR ALI', N'0314-3076781', 1)
INSERT [dbo].[LectureTable] ([LectureID], [FullName], [ContactNo], [IsActive]) VALUES (17, N'DR.ASAD KHAN', N'0314-3076781', 1)
INSERT [dbo].[LectureTable] ([LectureID], [FullName], [ContactNo], [IsActive]) VALUES (18, N'DR.SADRA REHMAN', N'0314-3076781', 1)
INSERT [dbo].[LectureTable] ([LectureID], [FullName], [ContactNo], [IsActive]) VALUES (19, N'DR.AZRA NAVEED', N'0314-3076781', 1)
INSERT [dbo].[LectureTable] ([LectureID], [FullName], [ContactNo], [IsActive]) VALUES (20, N'MR.NADIA JAMSHID', N'0345-2613132', 1)
INSERT [dbo].[LectureTable] ([LectureID], [FullName], [ContactNo], [IsActive]) VALUES (21, N'MR.MASOOM SHAH', N'0314-3076781', 1)
INSERT [dbo].[LectureTable] ([LectureID], [FullName], [ContactNo], [IsActive]) VALUES (22, N'DR.NAVEED KHAN', N'0314-6565656', 1)
INSERT [dbo].[LectureTable] ([LectureID], [FullName], [ContactNo], [IsActive]) VALUES (23, N'MR.RAHEEL ALI', N'0314-6565656', 1)
INSERT [dbo].[LectureTable] ([LectureID], [FullName], [ContactNo], [IsActive]) VALUES (24, N'DR.WAQAR KHAN', N'0316-4665632', 1)
INSERT [dbo].[LectureTable] ([LectureID], [FullName], [ContactNo], [IsActive]) VALUES (25, N'DR.WALEED KHAN', N'0314-9665656', 1)
INSERT [dbo].[LectureTable] ([LectureID], [FullName], [ContactNo], [IsActive]) VALUES (26, N'DR.DILAWAR SHAH', N'0314-8989865', 1)
INSERT [dbo].[LectureTable] ([LectureID], [FullName], [ContactNo], [IsActive]) VALUES (27, N'MR.HIZBULLAH', N'0323-1636946', 1)
INSERT [dbo].[LectureTable] ([LectureID], [FullName], [ContactNo], [IsActive]) VALUES (28, N'MR.HABIB UR REHMAN', N'0315-6546546', 1)
INSERT [dbo].[LectureTable] ([LectureID], [FullName], [ContactNo], [IsActive]) VALUES (29, N'DR.JAMSHID', N'0315-4665656', 1)
INSERT [dbo].[LectureTable] ([LectureID], [FullName], [ContactNo], [IsActive]) VALUES (30, N'MR.ILYAS KHAN', N'0314-6556565', 1)
SET IDENTITY_INSERT [dbo].[LectureTable] OFF
SET IDENTITY_INSERT [dbo].[ProgramSemesterSubjectTable] ON 

INSERT [dbo].[ProgramSemesterSubjectTable] ([ProgramSemesterSubjectID], [SSTitle], [ProgramSemesterID], [LectureSubjectID], [IsSubjectActive]) VALUES (1, N'Information and Communication Technologies(CS)(DR.AMJID)', 1, 2, 1)
INSERT [dbo].[ProgramSemesterSubjectTable] ([ProgramSemesterSubjectID], [SSTitle], [ProgramSemesterID], [LectureSubjectID], [IsSubjectActive]) VALUES (2, N'Programming Fundamentals(CS)(DR.AMJID)', 1, 3, 1)
INSERT [dbo].[ProgramSemesterSubjectTable] ([ProgramSemesterSubjectID], [SSTitle], [ProgramSemesterID], [LectureSubjectID], [IsSubjectActive]) VALUES (5, N'Basic Electronics(MR.SALMAN)', 1, 11, 1)
INSERT [dbo].[ProgramSemesterSubjectTable] ([ProgramSemesterSubjectID], [SSTitle], [ProgramSemesterID], [LectureSubjectID], [IsSubjectActive]) VALUES (6, N'English Composition & Comprehension(ED)(DR.WAZIR KHAN)', 1, 14, 1)
INSERT [dbo].[ProgramSemesterSubjectTable] ([ProgramSemesterSubjectID], [SSTitle], [ProgramSemesterID], [LectureSubjectID], [IsSubjectActive]) VALUES (7, N'Calculus and Analytical Geometry(MR.JUNAID)', 1, 7, 1)
INSERT [dbo].[ProgramSemesterSubjectTable] ([ProgramSemesterSubjectID], [SSTitle], [ProgramSemesterID], [LectureSubjectID], [IsSubjectActive]) VALUES (8, N'Web Fundamentals(MR.FARMAN)', 3, 36, 1)
INSERT [dbo].[ProgramSemesterSubjectTable] ([ProgramSemesterSubjectID], [SSTitle], [ProgramSemesterID], [LectureSubjectID], [IsSubjectActive]) VALUES (9, N'Operating Systems(MR.SABIR SHAH)', 3, 23, 1)
INSERT [dbo].[ProgramSemesterSubjectTable] ([ProgramSemesterSubjectID], [SSTitle], [ProgramSemesterID], [LectureSubjectID], [IsSubjectActive]) VALUES (10, N'Digital Logic Design(CS)(DR.YASIR)', 3, 31, 1)
INSERT [dbo].[ProgramSemesterSubjectTable] ([ProgramSemesterSubjectID], [SSTitle], [ProgramSemesterID], [LectureSubjectID], [IsSubjectActive]) VALUES (11, N'Communication Skills(MR.IFTIKHAR)', 3, 16, 1)
INSERT [dbo].[ProgramSemesterSubjectTable] ([ProgramSemesterSubjectID], [SSTitle], [ProgramSemesterID], [LectureSubjectID], [IsSubjectActive]) VALUES (12, N'Multivariate Calculus (MR.JUNAID)', 3, 10, 1)
INSERT [dbo].[ProgramSemesterSubjectTable] ([ProgramSemesterSubjectID], [SSTitle], [ProgramSemesterID], [LectureSubjectID], [IsSubjectActive]) VALUES (13, N'Data Structure(MR.SALMAN)', 3, 12, 1)
INSERT [dbo].[ProgramSemesterSubjectTable] ([ProgramSemesterSubjectID], [SSTitle], [ProgramSemesterID], [LectureSubjectID], [IsSubjectActive]) VALUES (14, N'Introduction to Database System(MR.ZIA UR REHMAN)', 5, 58, 1)
INSERT [dbo].[ProgramSemesterSubjectTable] ([ProgramSemesterSubjectID], [SSTitle], [ProgramSemesterID], [LectureSubjectID], [IsSubjectActive]) VALUES (15, N'Theory of Automate (MR.FAIZAN)', 5, 27, 1)
INSERT [dbo].[ProgramSemesterSubjectTable] ([ProgramSemesterSubjectID], [SSTitle], [ProgramSemesterID], [LectureSubjectID], [IsSubjectActive]) VALUES (16, N'Software Engineering-II(DR.ASLAM)', 5, 38, 1)
INSERT [dbo].[ProgramSemesterSubjectTable] ([ProgramSemesterSubjectID], [SSTitle], [ProgramSemesterID], [LectureSubjectID], [IsSubjectActive]) VALUES (17, N'Data Communication(DR.SADRA REHMAN)', 5, 47, 1)
INSERT [dbo].[ProgramSemesterSubjectTable] ([ProgramSemesterSubjectID], [SSTitle], [ProgramSemesterID], [LectureSubjectID], [IsSubjectActive]) VALUES (18, N'Human Resource Management (DR.ASAD KHAN)', 5, 46, 1)
INSERT [dbo].[ProgramSemesterSubjectTable] ([ProgramSemesterSubjectID], [SSTitle], [ProgramSemesterID], [LectureSubjectID], [IsSubjectActive]) VALUES (19, N'Financial Accounting(DR.AZRA NAVEED)', 5, 50, 1)
INSERT [dbo].[ProgramSemesterSubjectTable] ([ProgramSemesterSubjectID], [SSTitle], [ProgramSemesterID], [LectureSubjectID], [IsSubjectActive]) VALUES (20, N'Network and System Programming(MR.SABIR SHAH)', 7, 25, 1)
INSERT [dbo].[ProgramSemesterSubjectTable] ([ProgramSemesterSubjectID], [SSTitle], [ProgramSemesterID], [LectureSubjectID], [IsSubjectActive]) VALUES (21, N'Artificial Intelligence(MR.MASOOM SHAH)', 7, 53, 1)
INSERT [dbo].[ProgramSemesterSubjectTable] ([ProgramSemesterSubjectID], [SSTitle], [ProgramSemesterID], [LectureSubjectID], [IsSubjectActive]) VALUES (22, N'Distributed Database System(MR.ZIA UR REHMAN)', 7, 59, 1)
INSERT [dbo].[ProgramSemesterSubjectTable] ([ProgramSemesterSubjectID], [SSTitle], [ProgramSemesterID], [LectureSubjectID], [IsSubjectActive]) VALUES (23, N'Data & Network Security(MR.SABIR SHAH)', 7, 26, 1)
INSERT [dbo].[ProgramSemesterSubjectTable] ([ProgramSemesterSubjectID], [SSTitle], [ProgramSemesterID], [LectureSubjectID], [IsSubjectActive]) VALUES (24, N'Professional Practices(MR.IFTIKHAR)', 7, 17, 1)
SET IDENTITY_INSERT [dbo].[ProgramSemesterSubjectTable] OFF
SET IDENTITY_INSERT [dbo].[ProgramSemesterTable] ON 

INSERT [dbo].[ProgramSemesterTable] ([ProgramSemesterID], [Title], [ProgramID], [SemesterID], [Capacity], [IsActive], [SessionID]) VALUES (1, N'2020-2024 BS-CS 1ST SEMESTER', 1, 1, 50, 1, 1)
INSERT [dbo].[ProgramSemesterTable] ([ProgramSemesterID], [Title], [ProgramID], [SemesterID], [Capacity], [IsActive], [SessionID]) VALUES (2, N'2020-2024 BS-CS 2ND SEMESTER', 1, 2, 50, 0, 1)
INSERT [dbo].[ProgramSemesterTable] ([ProgramSemesterID], [Title], [ProgramID], [SemesterID], [Capacity], [IsActive], [SessionID]) VALUES (3, N'2019-2023 BS-CS 3RD SEMESTER', 1, 3, 40, 1, 4)
INSERT [dbo].[ProgramSemesterTable] ([ProgramSemesterID], [Title], [ProgramID], [SemesterID], [Capacity], [IsActive], [SessionID]) VALUES (4, N'2019-2023 BS-CS 4TH SEMESTER', 1, 4, 50, 0, 4)
INSERT [dbo].[ProgramSemesterTable] ([ProgramSemesterID], [Title], [ProgramID], [SemesterID], [Capacity], [IsActive], [SessionID]) VALUES (5, N'2018-2022 BS-CS 5TH SEMESTER', 1, 5, 50, 1, 5)
INSERT [dbo].[ProgramSemesterTable] ([ProgramSemesterID], [Title], [ProgramID], [SemesterID], [Capacity], [IsActive], [SessionID]) VALUES (6, N'2018-2022 BS-CS 6TH SEMESTER', 1, 6, 50, 0, 5)
INSERT [dbo].[ProgramSemesterTable] ([ProgramSemesterID], [Title], [ProgramID], [SemesterID], [Capacity], [IsActive], [SessionID]) VALUES (7, N'2017-2021 BS-CS 7TH SEMESTER', 1, 7, 50, 1, 6)
INSERT [dbo].[ProgramSemesterTable] ([ProgramSemesterID], [Title], [ProgramID], [SemesterID], [Capacity], [IsActive], [SessionID]) VALUES (8, N'2017-2021 BS-CS 8TH SEMESTER', 1, 8, 50, 0, 6)
INSERT [dbo].[ProgramSemesterTable] ([ProgramSemesterID], [Title], [ProgramID], [SemesterID], [Capacity], [IsActive], [SessionID]) VALUES (9, N'2020-2024 BS-IT 1ST SEMESTER', 2, 1, 50, 1, 1)
INSERT [dbo].[ProgramSemesterTable] ([ProgramSemesterID], [Title], [ProgramID], [SemesterID], [Capacity], [IsActive], [SessionID]) VALUES (10, N'2020-2024 BS-IT 2ND SEMESTER', 2, 2, 50, 0, 1)
INSERT [dbo].[ProgramSemesterTable] ([ProgramSemesterID], [Title], [ProgramID], [SemesterID], [Capacity], [IsActive], [SessionID]) VALUES (11, N'2019-2023 BS-IT 3RD SEMESTER', 2, 3, 50, 1, 4)
INSERT [dbo].[ProgramSemesterTable] ([ProgramSemesterID], [Title], [ProgramID], [SemesterID], [Capacity], [IsActive], [SessionID]) VALUES (12, N'2019-2023 BS-IT 4TH SEMESTER', 2, 4, 50, 0, 4)
INSERT [dbo].[ProgramSemesterTable] ([ProgramSemesterID], [Title], [ProgramID], [SemesterID], [Capacity], [IsActive], [SessionID]) VALUES (13, N'2018-2022 BS-IT 5TH SEMESTER', 2, 5, 50, 1, 5)
INSERT [dbo].[ProgramSemesterTable] ([ProgramSemesterID], [Title], [ProgramID], [SemesterID], [Capacity], [IsActive], [SessionID]) VALUES (14, N'2018-2022 BS-IT 6TH SEMESTER', 2, 6, 50, 0, 5)
INSERT [dbo].[ProgramSemesterTable] ([ProgramSemesterID], [Title], [ProgramID], [SemesterID], [Capacity], [IsActive], [SessionID]) VALUES (15, N'2017-2021 BS-IT 7TH SEMESTER', 2, 7, 50, 1, 6)
INSERT [dbo].[ProgramSemesterTable] ([ProgramSemesterID], [Title], [ProgramID], [SemesterID], [Capacity], [IsActive], [SessionID]) VALUES (16, N'2017-2021 BS-IT 8TH SEMESTER', 2, 8, 50, 0, 6)
INSERT [dbo].[ProgramSemesterTable] ([ProgramSemesterID], [Title], [ProgramID], [SemesterID], [Capacity], [IsActive], [SessionID]) VALUES (17, N'2020-2024 BS-SE 1ST SEMESTER', 3, 1, 50, 1, 1)
INSERT [dbo].[ProgramSemesterTable] ([ProgramSemesterID], [Title], [ProgramID], [SemesterID], [Capacity], [IsActive], [SessionID]) VALUES (1009, N'2020-2024 BS-SE 2ND SEMESTER', 3, 2, 50, 0, 1)
INSERT [dbo].[ProgramSemesterTable] ([ProgramSemesterID], [Title], [ProgramID], [SemesterID], [Capacity], [IsActive], [SessionID]) VALUES (1010, N'2019-2023 BS-SE 3RD SEMESTER', 3, 3, 50, 1, 4)
INSERT [dbo].[ProgramSemesterTable] ([ProgramSemesterID], [Title], [ProgramID], [SemesterID], [Capacity], [IsActive], [SessionID]) VALUES (1011, N'2019-2023 BS-SE 4TH SEMESTER', 3, 4, 50, 0, 4)
INSERT [dbo].[ProgramSemesterTable] ([ProgramSemesterID], [Title], [ProgramID], [SemesterID], [Capacity], [IsActive], [SessionID]) VALUES (1012, N'2018-2022 BS-SE 5TH SEMESTER', 3, 5, 50, 1, 5)
INSERT [dbo].[ProgramSemesterTable] ([ProgramSemesterID], [Title], [ProgramID], [SemesterID], [Capacity], [IsActive], [SessionID]) VALUES (1013, N'2018-2022 BS-SE 6TH SEMESTER', 3, 6, 50, 0, 5)
INSERT [dbo].[ProgramSemesterTable] ([ProgramSemesterID], [Title], [ProgramID], [SemesterID], [Capacity], [IsActive], [SessionID]) VALUES (1014, N'2017-2021 BS-SE 7TH SEMESTER', 3, 7, 50, 1, 6)
INSERT [dbo].[ProgramSemesterTable] ([ProgramSemesterID], [Title], [ProgramID], [SemesterID], [Capacity], [IsActive], [SessionID]) VALUES (1015, N'2017-2021 BS-SE 8TH SEMESTER', 3, 8, 50, 0, 6)
SET IDENTITY_INSERT [dbo].[ProgramSemesterTable] OFF
SET IDENTITY_INSERT [dbo].[ProgramTable] ON 

INSERT [dbo].[ProgramTable] ([ProgramID], [Name], [IsActive]) VALUES (1, N'BS-CS', 1)
INSERT [dbo].[ProgramTable] ([ProgramID], [Name], [IsActive]) VALUES (2, N'BS-IT', 1)
INSERT [dbo].[ProgramTable] ([ProgramID], [Name], [IsActive]) VALUES (3, N'BS-SE', 1)
SET IDENTITY_INSERT [dbo].[ProgramTable] OFF
SET IDENTITY_INSERT [dbo].[RoomTable] ON 

INSERT [dbo].[RoomTable] ([RoomID], [RoomNo], [Capacity], [IsActive]) VALUES (1, N'ROOM 1', 60, 0)
INSERT [dbo].[RoomTable] ([RoomID], [RoomNo], [Capacity], [IsActive]) VALUES (2, N'ROOM 2', 70, 0)
INSERT [dbo].[RoomTable] ([RoomID], [RoomNo], [Capacity], [IsActive]) VALUES (3, N'ROOM 3', 60, 0)
INSERT [dbo].[RoomTable] ([RoomID], [RoomNo], [Capacity], [IsActive]) VALUES (4, N'ROOM 4', 40, 0)
INSERT [dbo].[RoomTable] ([RoomID], [RoomNo], [Capacity], [IsActive]) VALUES (5, N'ROOM 5', 65, 0)
INSERT [dbo].[RoomTable] ([RoomID], [RoomNo], [Capacity], [IsActive]) VALUES (6, N'ROOM 6', 70, 0)
INSERT [dbo].[RoomTable] ([RoomID], [RoomNo], [Capacity], [IsActive]) VALUES (7, N'ROOM 7', 70, 0)
INSERT [dbo].[RoomTable] ([RoomID], [RoomNo], [Capacity], [IsActive]) VALUES (8, N'ROOM 8', 100, 0)
INSERT [dbo].[RoomTable] ([RoomID], [RoomNo], [Capacity], [IsActive]) VALUES (9, N'ROOM 9', 100, 1)
INSERT [dbo].[RoomTable] ([RoomID], [RoomNo], [Capacity], [IsActive]) VALUES (10, N'ROOM 10', 100, 1)
SET IDENTITY_INSERT [dbo].[RoomTable] OFF
SET IDENTITY_INSERT [dbo].[RoomTypeTable] ON 

INSERT [dbo].[RoomTypeTable] ([RoomTypeID], [TypeName]) VALUES (3, N'Non Practical')
INSERT [dbo].[RoomTypeTable] ([RoomTypeID], [TypeName]) VALUES (4, N'Practical')
SET IDENTITY_INSERT [dbo].[RoomTypeTable] OFF
SET IDENTITY_INSERT [dbo].[SectionTable] ON 

INSERT [dbo].[SectionTable] ([SectionID], [SectionTitle], [ProgramSemesterID], [IsActive], [SectionCapacity]) VALUES (1, N'Section A', 1, 1, 50)
INSERT [dbo].[SectionTable] ([SectionID], [SectionTitle], [ProgramSemesterID], [IsActive], [SectionCapacity]) VALUES (2, N'Section B', 1, 1, 50)
INSERT [dbo].[SectionTable] ([SectionID], [SectionTitle], [ProgramSemesterID], [IsActive], [SectionCapacity]) VALUES (3, N'Section A', 13, 1, 45)
INSERT [dbo].[SectionTable] ([SectionID], [SectionTitle], [ProgramSemesterID], [IsActive], [SectionCapacity]) VALUES (4, N'Section B', 13, 1, 40)
SET IDENTITY_INSERT [dbo].[SectionTable] OFF
SET IDENTITY_INSERT [dbo].[SemesterTable] ON 

INSERT [dbo].[SemesterTable] ([SemesterID], [SemesterName], [IsActive]) VALUES (1, N'1st Semester', 1)
INSERT [dbo].[SemesterTable] ([SemesterID], [SemesterName], [IsActive]) VALUES (2, N'2nd Semester', 1)
INSERT [dbo].[SemesterTable] ([SemesterID], [SemesterName], [IsActive]) VALUES (3, N'3rd Semester', 1)
INSERT [dbo].[SemesterTable] ([SemesterID], [SemesterName], [IsActive]) VALUES (4, N'4th Semester', 1)
INSERT [dbo].[SemesterTable] ([SemesterID], [SemesterName], [IsActive]) VALUES (5, N'5th Semester', 1)
INSERT [dbo].[SemesterTable] ([SemesterID], [SemesterName], [IsActive]) VALUES (6, N'6th Semester', 1)
INSERT [dbo].[SemesterTable] ([SemesterID], [SemesterName], [IsActive]) VALUES (7, N'7th Semester', 1)
INSERT [dbo].[SemesterTable] ([SemesterID], [SemesterName], [IsActive]) VALUES (8, N'8th Semester', 1)
SET IDENTITY_INSERT [dbo].[SemesterTable] OFF
SET IDENTITY_INSERT [dbo].[SessionTable] ON 

INSERT [dbo].[SessionTable] ([SessionID], [Title], [IsActive]) VALUES (1, N'2020-2024', 1)
INSERT [dbo].[SessionTable] ([SessionID], [Title], [IsActive]) VALUES (2, N'2021-2025', 1)
INSERT [dbo].[SessionTable] ([SessionID], [Title], [IsActive]) VALUES (3, N'2022-2026', 1)
INSERT [dbo].[SessionTable] ([SessionID], [Title], [IsActive]) VALUES (4, N'2019-2023', 1)
INSERT [dbo].[SessionTable] ([SessionID], [Title], [IsActive]) VALUES (5, N'2018-2022', 1)
INSERT [dbo].[SessionTable] ([SessionID], [Title], [IsActive]) VALUES (6, N'2017-2021', 1)
INSERT [dbo].[SessionTable] ([SessionID], [Title], [IsActive]) VALUES (7, N'2016-2020', 1)
INSERT [dbo].[SessionTable] ([SessionID], [Title], [IsActive]) VALUES (8, N'2023-2017', 1)
SET IDENTITY_INSERT [dbo].[SessionTable] OFF
SET IDENTITY_INSERT [dbo].[TimeTableDetailsTable] ON 

INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2103, 1, 2, N'2020-2024 BS-CS 1ST SEMESTER (Section A)  Programming Fundamentals(CS)(DR.AMJID)', 0, 2, 64, 1, 1, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2104, 4, 16, N'2018-2022 BS-CS 5TH SEMESTER Software Engineering-II(DR.ASLAM)', 0, 2, 65, 14, 1, 1, 5, N'2018-2022')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2105, 4, 14, N'2018-2022 BS-CS 5TH SEMESTER Introduction to Database System(MR.ZIA UR REHMAN)', 0, 2, 66, 7, 1, 1, 5, N'2018-2022')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2106, 2, 2, N'2020-2024 BS-CS 1ST SEMESTER (Section B)  Programming Fundamentals(CS)(DR.AMJID)', 0, 2, 67, 1, 1, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2107, 1, 2, N'2020-2024 BS-CS 1ST SEMESTER (Section A)  Programming Fundamentals(CS)(DR.AMJID)', 0, 2, 68, 1, 1, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2108, 4, 16, N'2018-2022 BS-CS 5TH SEMESTER Software Engineering-II(DR.ASLAM)', 0, 2, 69, 14, 2, 1, 5, N'2018-2022')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2109, 3, 10, N'2019-2023 BS-CS 3RD SEMESTER Digital Logic Design(CS)(DR.YASIR)', 0, 2, 70, 10, 2, 1, 4, N'2019-2023')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2110, 4, 14, N'2018-2022 BS-CS 5TH SEMESTER Introduction to Database System(MR.ZIA UR REHMAN)', 0, 2, 71, 7, 2, 1, 5, N'2018-2022')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2111, 5, 20, N'2017-2021 BS-CS 7TH SEMESTER Network and System Programming(MR.SABIR SHAH)', 0, 2, 72, 8, 2, 1, 6, N'2017-2021')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2112, 5, 20, N'2017-2021 BS-CS 7TH SEMESTER Network and System Programming(MR.SABIR SHAH)', 0, 2, 73, 8, 2, 1, 6, N'2017-2021')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2113, 3, 10, N'2019-2023 BS-CS 3RD SEMESTER Digital Logic Design(CS)(DR.YASIR)', 0, 2, 74, 10, 3, 1, 4, N'2019-2023')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2114, 1, 2, N'2020-2024 BS-CS 1ST SEMESTER (Section A)  Programming Fundamentals(CS)(DR.AMJID)', 0, 2, 75, 1, 3, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2115, 2, 2, N'2020-2024 BS-CS 1ST SEMESTER (Section B)  Programming Fundamentals(CS)(DR.AMJID)', 0, 2, 76, 1, 3, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2116, 5, 20, N'2017-2021 BS-CS 7TH SEMESTER Network and System Programming(MR.SABIR SHAH)', 0, 2, 77, 8, 3, 1, 6, N'2017-2021')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2117, 3, 10, N'2019-2023 BS-CS 3RD SEMESTER Digital Logic Design(CS)(DR.YASIR)', 0, 2, 78, 10, 3, 1, 4, N'2019-2023')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2118, 4, 16, N'2018-2022 BS-CS 5TH SEMESTER Software Engineering-II(DR.ASLAM)', 0, 2, 79, 14, 4, 1, 5, N'2018-2022')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2119, 4, 14, N'2018-2022 BS-CS 5TH SEMESTER Introduction to Database System(MR.ZIA UR REHMAN)', 0, 2, 80, 7, 4, 1, 5, N'2018-2022')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2120, 2, 2, N'2020-2024 BS-CS 1ST SEMESTER (Section B)  Programming Fundamentals(CS)(DR.AMJID)', 0, 2, 81, 1, 4, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2121, 2, 1, N'2020-2024 BS-CS 1ST SEMESTER (Section B)  Information and Communication Technologies(CS)(DR.AMJID)', 9, 0, 64, 1, 1, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2122, 1, 6, N'2020-2024 BS-CS 1ST SEMESTER (Section A)  English Composition & Comprehension(ED)(DR.WAZIR KHAN)', 9, 0, 65, 5, 1, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2123, 3, 11, N'2019-2023 BS-CS 3RD SEMESTER Communication Skills(MR.IFTIKHAR)', 9, 0, 66, 6, 1, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2124, 2, 6, N'2020-2024 BS-CS 1ST SEMESTER (Section B)  English Composition & Comprehension(ED)(DR.WAZIR KHAN)', 9, 0, 67, 5, 1, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2125, 3, 13, N'2019-2023 BS-CS 3RD SEMESTER Data Structure(MR.SALMAN)', 9, 0, 68, 4, 1, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2126, 3, 0, N'Break', 9, 0, 68, 0, 1, 1, 0, N'')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2127, 2, 1, N'2020-2024 BS-CS 1ST SEMESTER (Section B)  Information and Communication Technologies(CS)(DR.AMJID)', 9, 0, 70, 1, 2, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2128, 3, 13, N'2019-2023 BS-CS 3RD SEMESTER Data Structure(MR.SALMAN)', 9, 0, 71, 4, 2, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2129, 3, 12, N'2019-2023 BS-CS 3RD SEMESTER Multivariate Calculus (MR.JUNAID)', 9, 0, 72, 3, 2, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2130, 1, 7, N'2020-2024 BS-CS 1ST SEMESTER (Section A)  Calculus and Analytical Geometry(MR.JUNAID)', 9, 0, 73, 3, 2, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2131, 2, 5, N'2020-2024 BS-CS 1ST SEMESTER (Section B)  Basic Electronics(MR.SALMAN)', 9, 0, 74, 4, 3, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2132, 2, 0, N'Break', 9, 0, 74, 0, 3, 1, 0, N'')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2133, 5, 23, N'2017-2021 BS-CS 7TH SEMESTER Data & Network Security(MR.SABIR SHAH)', 9, 0, 76, 8, 3, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2134, 4, 17, N'2018-2022 BS-CS 5TH SEMESTER Data Communication(DR.SADRA REHMAN)', 9, 0, 77, 18, 3, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2135, 2, 7, N'2020-2024 BS-CS 1ST SEMESTER (Section B)  Calculus and Analytical Geometry(MR.JUNAID)', 9, 0, 78, 3, 3, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2136, 3, 8, N'2019-2023 BS-CS 3RD SEMESTER Web Fundamentals(MR.FARMAN)', 9, 0, 79, 12, 4, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2137, 5, 21, N'2017-2021 BS-CS 7TH SEMESTER Artificial Intelligence(MR.MASOOM SHAH)', 9, 0, 80, 21, 4, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2138, 5, 0, N'Break', 9, 0, 80, 0, 4, 1, 0, N'')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2139, 3, 9, N'2019-2023 BS-CS 3RD SEMESTER Operating Systems(MR.SABIR SHAH)', 9, 0, 82, 8, 4, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2140, 5, 22, N'2017-2021 BS-CS 7TH SEMESTER Distributed Database System(MR.ZIA UR REHMAN)', 9, 0, 83, 7, 4, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2141, 1, 7, N'2020-2024 BS-CS 1ST SEMESTER (Section A)  Calculus and Analytical Geometry(MR.JUNAID)', 9, 0, 84, 3, 5, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2142, 3, 8, N'2019-2023 BS-CS 3RD SEMESTER Web Fundamentals(MR.FARMAN)', 9, 0, 85, 12, 5, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2143, 4, 15, N'2018-2022 BS-CS 5TH SEMESTER Theory of Automate (MR.FAIZAN)', 9, 0, 86, 9, 5, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2144, 4, 0, N'Break', 9, 0, 86, 0, 5, 1, 0, N'')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2145, 3, 12, N'2019-2023 BS-CS 3RD SEMESTER Multivariate Calculus (MR.JUNAID)', 9, 0, 88, 3, 5, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2146, 2, 5, N'2020-2024 BS-CS 1ST SEMESTER (Section B)  Basic Electronics(MR.SALMAN)', 10, 0, 88, 4, 5, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2147, 2, 7, N'2020-2024 BS-CS 1ST SEMESTER (Section B)  Calculus and Analytical Geometry(MR.JUNAID)', 10, 0, 87, 3, 5, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2148, 4, 19, N'2018-2022 BS-CS 5TH SEMESTER Financial Accounting(DR.AZRA NAVEED)', 10, 0, 86, 19, 5, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2149, 4, 15, N'2018-2022 BS-CS 5TH SEMESTER Theory of Automate (MR.FAIZAN)', 10, 0, 85, 9, 5, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2150, 4, 0, N'Break', 10, 0, 85, 0, 5, 1, 0, N'')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2151, 3, 11, N'2019-2023 BS-CS 3RD SEMESTER Communication Skills(MR.IFTIKHAR)', 10, 0, 83, 6, 4, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2152, 5, 23, N'2017-2021 BS-CS 7TH SEMESTER Data & Network Security(MR.SABIR SHAH)', 10, 0, 82, 8, 4, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2153, 1, 6, N'2020-2024 BS-CS 1ST SEMESTER (Section A)  English Composition & Comprehension(ED)(DR.WAZIR KHAN)', 10, 0, 81, 5, 4, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2154, 4, 15, N'2018-2022 BS-CS 5TH SEMESTER Theory of Automate (MR.FAIZAN)', 10, 0, 80, 9, 4, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2155, 5, 21, N'2017-2021 BS-CS 7TH SEMESTER Artificial Intelligence(MR.MASOOM SHAH)', 10, 0, 79, 21, 4, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2156, 5, 0, N'Break', 10, 0, 79, 0, 4, 1, 0, N'')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2157, 2, 7, N'2020-2024 BS-CS 1ST SEMESTER (Section B)  Calculus and Analytical Geometry(MR.JUNAID)', 10, 0, 77, 3, 3, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2158, 2, 1, N'2020-2024 BS-CS 1ST SEMESTER (Section B)  Information and Communication Technologies(CS)(DR.AMJID)', 10, 0, 76, 1, 3, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2159, 3, 9, N'2019-2023 BS-CS 3RD SEMESTER Operating Systems(MR.SABIR SHAH)', 10, 0, 75, 8, 3, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2160, 1, 5, N'2020-2024 BS-CS 1ST SEMESTER (Section A)  Basic Electronics(MR.SALMAN)', 10, 0, 74, 4, 3, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2161, 2, 5, N'2020-2024 BS-CS 1ST SEMESTER (Section B)  Basic Electronics(MR.SALMAN)', 10, 0, 73, 4, 2, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2162, 2, 0, N'Break', 10, 0, 73, 0, 2, 1, 0, N'')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2163, 1, 6, N'2020-2024 BS-CS 1ST SEMESTER (Section A)  English Composition & Comprehension(ED)(DR.WAZIR KHAN)', 10, 0, 71, 5, 2, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2164, 4, 19, N'2018-2022 BS-CS 5TH SEMESTER Financial Accounting(DR.AZRA NAVEED)', 10, 0, 70, 19, 2, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2165, 5, 21, N'2017-2021 BS-CS 7TH SEMESTER Artificial Intelligence(MR.MASOOM SHAH)', 10, 0, 69, 21, 2, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2166, 5, 22, N'2017-2021 BS-CS 7TH SEMESTER Distributed Database System(MR.ZIA UR REHMAN)', 10, 0, 68, 7, 1, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2167, 5, 24, N'2017-2021 BS-CS 7TH SEMESTER Professional Practices(MR.IFTIKHAR)', 10, 0, 67, 6, 1, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2168, 5, 0, N'Break', 10, 0, 67, 0, 1, 1, 0, N'')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2169, 1, 5, N'2020-2024 BS-CS 1ST SEMESTER (Section A)  Basic Electronics(MR.SALMAN)', 10, 0, 65, 4, 1, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2170, 5, 22, N'2017-2021 BS-CS 7TH SEMESTER Distributed Database System(MR.ZIA UR REHMAN)', 10, 0, 64, 7, 1, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2171, 4, 17, N'2018-2022 BS-CS 5TH SEMESTER Data Communication(DR.SADRA REHMAN)', 0, 2, 82, 18, 4, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2172, 3, 13, N'2019-2023 BS-CS 3RD SEMESTER Data Structure(MR.SALMAN)', 0, 2, 83, 4, 4, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2173, 4, 18, N'2018-2022 BS-CS 5TH SEMESTER Human Resource Management (DR.ASAD KHAN)', 0, 2, 84, 17, 5, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2174, 4, 0, N'Break', 0, 0, 84, 2, 5, 1, 0, N'')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2175, 3, 9, N'2019-2023 BS-CS 3RD SEMESTER Operating Systems(MR.SABIR SHAH)', 0, 2, 86, 8, 5, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2176, 1, 1, N'2020-2024 BS-CS 1ST SEMESTER (Section A)  Information and Communication Technologies(CS)(DR.AMJID)', 0, 2, 87, 1, 5, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2177, 5, 24, N'2017-2021 BS-CS 7TH SEMESTER Professional Practices(MR.IFTIKHAR)', 0, 2, 88, 6, 5, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2178, 4, 18, N'2018-2022 BS-CS 5TH SEMESTER Human Resource Management (DR.ASAD KHAN)', 0, 3, 88, 17, 5, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2179, 4, 19, N'2018-2022 BS-CS 5TH SEMESTER Financial Accounting(DR.AZRA NAVEED)', 0, 3, 87, 19, 5, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2180, 4, 0, N'Break', 0, 0, 87, 3, 5, 1, 0, N'')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2181, 4, 18, N'2018-2022 BS-CS 5TH SEMESTER Human Resource Management (DR.ASAD KHAN)', 0, 3, 85, 17, 5, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2182, 2, 6, N'2020-2024 BS-CS 1ST SEMESTER (Section B)  English Composition & Comprehension(ED)(DR.WAZIR KHAN)', 0, 3, 84, 5, 5, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2183, 1, 1, N'2020-2024 BS-CS 1ST SEMESTER (Section A)  Information and Communication Technologies(CS)(DR.AMJID)', 0, 3, 83, 1, 4, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2184, 1, 7, N'2020-2024 BS-CS 1ST SEMESTER (Section A)  Calculus and Analytical Geometry(MR.JUNAID)', 0, 3, 82, 3, 4, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2185, 5, 24, N'2017-2021 BS-CS 7TH SEMESTER Professional Practices(MR.IFTIKHAR)', 0, 3, 81, 6, 4, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2186, 5, 0, N'Break', 0, 0, 81, 3, 4, 1, 0, N'')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2187, 3, 12, N'2019-2023 BS-CS 3RD SEMESTER Multivariate Calculus (MR.JUNAID)', 0, 3, 79, 3, 4, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2188, 2, 6, N'2020-2024 BS-CS 1ST SEMESTER (Section B)  English Composition & Comprehension(ED)(DR.WAZIR KHAN)', 0, 3, 78, 5, 3, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2189, 5, 23, N'2017-2021 BS-CS 7TH SEMESTER Data & Network Security(MR.SABIR SHAH)', 0, 3, 77, 8, 3, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2190, 4, 17, N'2018-2022 BS-CS 5TH SEMESTER Data Communication(DR.SADRA REHMAN)', 0, 3, 76, 18, 3, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2191, 3, 8, N'2019-2023 BS-CS 3RD SEMESTER Web Fundamentals(MR.FARMAN)', 0, 3, 75, 12, 3, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2192, 3, 0, N'Break', 0, 0, 75, 3, 3, 1, 0, N'')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2193, 1, 5, N'2020-2024 BS-CS 1ST SEMESTER (Section A)  Basic Electronics(MR.SALMAN)', 0, 3, 73, 4, 2, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2194, 3, 11, N'2019-2023 BS-CS 3RD SEMESTER Communication Skills(MR.IFTIKHAR)', 0, 3, 72, 6, 2, 1, 1, N'2020-2024')
INSERT [dbo].[TimeTableDetailsTable] ([TimeTableDetailID], [TimeTableID], [ProgramSemesterSubjectID], [SubjectTitle], [RoomID], [LabID], [DayTimeSlotID], [LectureID], [DayID], [IsActive], [SessionID], [SessionTitle]) VALUES (2195, 1, 1, N'2020-2024 BS-CS 1ST SEMESTER (Section A)  Information and Communication Technologies(CS)(DR.AMJID)', 0, 3, 71, 1, 2, 1, 1, N'2020-2024')
SET IDENTITY_INSERT [dbo].[TimeTableDetailsTable] OFF
INSERT [dbo].[TimeTblTable] ([TimeTableID], [SessionID], [ProgramSemesterID], [TimeTableTitle], [SemesterTitle], [StartDate], [EndDate], [IsActive], [SessionTitle]) VALUES (1, 1, 1, N'2020-2024 BS-CS 1ST SEMESTER (Section A) ', N'2020-2024 BS-CS 1ST SEMESTER (Section A) ', CAST(N'2020-06-01' AS Date), CAST(N'2020-06-30' AS Date), 1, N'2020-2024')
INSERT [dbo].[TimeTblTable] ([TimeTableID], [SessionID], [ProgramSemesterID], [TimeTableTitle], [SemesterTitle], [StartDate], [EndDate], [IsActive], [SessionTitle]) VALUES (2, 1, 1, N'2020-2024 BS-CS 1ST SEMESTER (Section B) ', N'2020-2024 BS-CS 1ST SEMESTER (Section B) ', CAST(N'2020-06-01' AS Date), CAST(N'2020-06-30' AS Date), 1, N'2020-2024')
INSERT [dbo].[TimeTblTable] ([TimeTableID], [SessionID], [ProgramSemesterID], [TimeTableTitle], [SemesterTitle], [StartDate], [EndDate], [IsActive], [SessionTitle]) VALUES (3, 4, 3, N'2019-2023 BS-CS 3RD SEMESTER', N'2019-2023 BS-CS 3RD SEMESTER', CAST(N'2020-06-01' AS Date), CAST(N'2020-06-30' AS Date), 1, N'2019-2023')
INSERT [dbo].[TimeTblTable] ([TimeTableID], [SessionID], [ProgramSemesterID], [TimeTableTitle], [SemesterTitle], [StartDate], [EndDate], [IsActive], [SessionTitle]) VALUES (4, 5, 5, N'2018-2022 BS-CS 5TH SEMESTER', N'2018-2022 BS-CS 5TH SEMESTER', CAST(N'2020-06-01' AS Date), CAST(N'2020-06-30' AS Date), 1, N'2018-2022')
INSERT [dbo].[TimeTblTable] ([TimeTableID], [SessionID], [ProgramSemesterID], [TimeTableTitle], [SemesterTitle], [StartDate], [EndDate], [IsActive], [SessionTitle]) VALUES (5, 6, 7, N'2017-2021 BS-CS 7TH SEMESTER', N'2017-2021 BS-CS 7TH SEMESTER', CAST(N'2020-06-01' AS Date), CAST(N'2020-06-30' AS Date), 1, N'2017-2021')
ALTER TABLE [dbo].[UserTable] ADD  CONSTRAINT [DF_UserTable_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[CourseTable]  WITH CHECK ADD  CONSTRAINT [FK_CourseTable_RoomTypeTable] FOREIGN KEY([RoomTypeID])
REFERENCES [dbo].[RoomTypeTable] ([RoomTypeID])
GO
ALTER TABLE [dbo].[CourseTable] CHECK CONSTRAINT [FK_CourseTable_RoomTypeTable]
GO
ALTER TABLE [dbo].[DayTimeSlotTable]  WITH CHECK ADD  CONSTRAINT [FK_DayTimeSlotTable_DayTable] FOREIGN KEY([DayID])
REFERENCES [dbo].[DayTable] ([DayID])
GO
ALTER TABLE [dbo].[DayTimeSlotTable] CHECK CONSTRAINT [FK_DayTimeSlotTable_DayTable]
GO
ALTER TABLE [dbo].[LectureSubjectTable]  WITH CHECK ADD  CONSTRAINT [FK_LectureSubjectTable_CourseTable] FOREIGN KEY([CourseID])
REFERENCES [dbo].[CourseTable] ([CourseID])
GO
ALTER TABLE [dbo].[LectureSubjectTable] CHECK CONSTRAINT [FK_LectureSubjectTable_CourseTable]
GO
ALTER TABLE [dbo].[LectureSubjectTable]  WITH CHECK ADD  CONSTRAINT [FK_LectureSubjectTable_LectureTable] FOREIGN KEY([LectureID])
REFERENCES [dbo].[LectureTable] ([LectureID])
GO
ALTER TABLE [dbo].[LectureSubjectTable] CHECK CONSTRAINT [FK_LectureSubjectTable_LectureTable]
GO
ALTER TABLE [dbo].[ProgramSemesterSubjectTable]  WITH CHECK ADD  CONSTRAINT [FK_ProgramSemesterSubjectTable_LectureSubjectTable] FOREIGN KEY([LectureSubjectID])
REFERENCES [dbo].[LectureSubjectTable] ([LectureSubjectID])
GO
ALTER TABLE [dbo].[ProgramSemesterSubjectTable] CHECK CONSTRAINT [FK_ProgramSemesterSubjectTable_LectureSubjectTable]
GO
ALTER TABLE [dbo].[ProgramSemesterSubjectTable]  WITH CHECK ADD  CONSTRAINT [FK_ProgramSemesterSubjectTable_ProgramSemesterTable] FOREIGN KEY([ProgramSemesterID])
REFERENCES [dbo].[ProgramSemesterTable] ([ProgramSemesterID])
GO
ALTER TABLE [dbo].[ProgramSemesterSubjectTable] CHECK CONSTRAINT [FK_ProgramSemesterSubjectTable_ProgramSemesterTable]
GO
ALTER TABLE [dbo].[ProgramSemesterTable]  WITH CHECK ADD  CONSTRAINT [FK_ProgramSemesterTable_ProgramTable] FOREIGN KEY([ProgramID])
REFERENCES [dbo].[ProgramTable] ([ProgramID])
GO
ALTER TABLE [dbo].[ProgramSemesterTable] CHECK CONSTRAINT [FK_ProgramSemesterTable_ProgramTable]
GO
ALTER TABLE [dbo].[ProgramSemesterTable]  WITH CHECK ADD  CONSTRAINT [FK_ProgramSemesterTable_SemesterTable] FOREIGN KEY([SemesterID])
REFERENCES [dbo].[SemesterTable] ([SemesterID])
GO
ALTER TABLE [dbo].[ProgramSemesterTable] CHECK CONSTRAINT [FK_ProgramSemesterTable_SemesterTable]
GO
ALTER TABLE [dbo].[ProgramSemesterTable]  WITH CHECK ADD  CONSTRAINT [FK_ProgramSemesterTable_SessionTable] FOREIGN KEY([SessionID])
REFERENCES [dbo].[SessionTable] ([SessionID])
GO
ALTER TABLE [dbo].[ProgramSemesterTable] CHECK CONSTRAINT [FK_ProgramSemesterTable_SessionTable]
GO
ALTER TABLE [dbo].[SectionTable]  WITH CHECK ADD  CONSTRAINT [FK_SectionTable_ProgramSemesterTable] FOREIGN KEY([ProgramSemesterID])
REFERENCES [dbo].[ProgramSemesterTable] ([ProgramSemesterID])
GO
ALTER TABLE [dbo].[SectionTable] CHECK CONSTRAINT [FK_SectionTable_ProgramSemesterTable]
GO
ALTER TABLE [dbo].[TimeTableDetailsTable]  WITH CHECK ADD  CONSTRAINT [FK_TimeTableDetailsTable_DayTable] FOREIGN KEY([DayID])
REFERENCES [dbo].[DayTable] ([DayID])
GO
ALTER TABLE [dbo].[TimeTableDetailsTable] CHECK CONSTRAINT [FK_TimeTableDetailsTable_DayTable]
GO
ALTER TABLE [dbo].[TimeTableDetailsTable]  WITH CHECK ADD  CONSTRAINT [FK_TimeTableDetailsTable_DayTimeSlotTable] FOREIGN KEY([DayTimeSlotID])
REFERENCES [dbo].[DayTimeSlotTable] ([DayTimeSlotID])
GO
ALTER TABLE [dbo].[TimeTableDetailsTable] CHECK CONSTRAINT [FK_TimeTableDetailsTable_DayTimeSlotTable]
GO
ALTER TABLE [dbo].[TimeTableDetailsTable]  WITH NOCHECK ADD  CONSTRAINT [FK_TimeTableDetailsTable_LabTable] FOREIGN KEY([LabID])
REFERENCES [dbo].[LabTable] ([LabID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[TimeTableDetailsTable] NOCHECK CONSTRAINT [FK_TimeTableDetailsTable_LabTable]
GO
ALTER TABLE [dbo].[TimeTableDetailsTable]  WITH NOCHECK ADD  CONSTRAINT [FK_TimeTableDetailsTable_LectureTable] FOREIGN KEY([LectureID])
REFERENCES [dbo].[LectureTable] ([LectureID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[TimeTableDetailsTable] NOCHECK CONSTRAINT [FK_TimeTableDetailsTable_LectureTable]
GO
ALTER TABLE [dbo].[TimeTableDetailsTable]  WITH NOCHECK ADD  CONSTRAINT [FK_TimeTableDetailsTable_ProgramSemesterSubjectTable] FOREIGN KEY([ProgramSemesterSubjectID])
REFERENCES [dbo].[ProgramSemesterSubjectTable] ([ProgramSemesterSubjectID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[TimeTableDetailsTable] NOCHECK CONSTRAINT [FK_TimeTableDetailsTable_ProgramSemesterSubjectTable]
GO
ALTER TABLE [dbo].[TimeTableDetailsTable]  WITH NOCHECK ADD  CONSTRAINT [FK_TimeTableDetailsTable_RoomTable] FOREIGN KEY([RoomID])
REFERENCES [dbo].[RoomTable] ([RoomID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[TimeTableDetailsTable] NOCHECK CONSTRAINT [FK_TimeTableDetailsTable_RoomTable]
GO
ALTER TABLE [dbo].[TimeTableDetailsTable]  WITH CHECK ADD  CONSTRAINT [FK_TimeTableDetailsTable_TimeTblTable] FOREIGN KEY([TimeTableID])
REFERENCES [dbo].[TimeTblTable] ([TimeTableID])
GO
ALTER TABLE [dbo].[TimeTableDetailsTable] CHECK CONSTRAINT [FK_TimeTableDetailsTable_TimeTblTable]
GO
ALTER TABLE [dbo].[TimeTblTable]  WITH CHECK ADD  CONSTRAINT [FK_TimeTblTable_ProgramSemesterTable] FOREIGN KEY([ProgramSemesterID])
REFERENCES [dbo].[ProgramSemesterTable] ([ProgramSemesterID])
GO
ALTER TABLE [dbo].[TimeTblTable] CHECK CONSTRAINT [FK_TimeTblTable_ProgramSemesterTable]
GO
ALTER TABLE [dbo].[TimeTblTable]  WITH CHECK ADD  CONSTRAINT [FK_TimeTblTable_SessionTable] FOREIGN KEY([SessionID])
REFERENCES [dbo].[SessionTable] ([SessionID])
GO
ALTER TABLE [dbo].[TimeTblTable] CHECK CONSTRAINT [FK_TimeTblTable_SessionTable]
GO
/****** Object:  StoredProcedure [dbo].[AutoGenerateTimeTables]    Script Date: 14/06/2020 9:40:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[AutoGenerateTimeTables](@StartDate Date, @EndDate Date, @SessionID int, @Message nvarchar(100) output)
AS
BEGIN
-------------------- Here we are using Genetic Algorithem  ---------------------------------
-- Genetic Algorithm is 
	-- Optimization
	-- Based on Natural Phenomenon
	-- Nature inspired approach based on Darwin's Law of survival of the fittest
	-- of bio-isspired operators such as Pairing, Crossover and mutation
	-- Grequently used to find optimal or near-optimal solutions to difficult problems 
	-- Optimation is the process of making something better
-- Technology 
	--  Population
	--	Chromosomes
	--	Gene
-- Operators are
	--	Selection
	--	Crossover
	--	Mutation

--=========================================================================================================================
-- First Step (Here we are getting Chromosomes/Gene)
		--	Polulation is All Time Slots in Time Table
		--	Chromosomes is All Subjects
		--	Gene is one Subject
-- Get All Sujects -- All Subject here Chromosomes, and one subject is Gen
DECLARE @ALLSubjectSemesterTable Table(RowNo int, RepeatedRowNo int,ProgramSemesterID int,CrHrs int, ProgramSemesterSubjectID int,SSTitle nvarchar(300),Title nvarchar(200),RoomTypeID int,LectureID int)
DECLARE @SubjectSemesterTable Table(RowNo int,ProgramSemesterID int,CrHrs int, ProgramSemesterSubjectID int,SSTitle nvarchar(300),Title nvarchar(200),RoomTypeID int,LectureID int)

-- Get All Practical Class
DECLARE @PracticalSubjectTable Table(ProgramSemesterID int,CrHrs int, ProgramSemesterSubjectID int,SSTitle nvarchar(300),Title nvarchar(200),RoomTypeID int,LectureID int)
DECLARE @PracticalRandomSubjectTable Table(RowNo int,ProgramSemesterID int,CrHrs int, ProgramSemesterSubjectID int,SSTitle nvarchar(300),Title nvarchar(200),RoomTypeID int,LectureID int)

-- Get All Non Practical Class
DECLARE @NonPracticalSubjectTable Table(ProgramSemesterID int,CrHrs int, ProgramSemesterSubjectID int,SSTitle nvarchar(300),Title nvarchar(200),RoomTypeID int,LectureID int)
DECLARE @NonPracticalRandomSubjectTable Table(RowNo int,ProgramSemesterID int,CrHrs int, ProgramSemesterSubjectID int,SSTitle nvarchar(300),Title nvarchar(200),RoomTypeID int,LectureID int)

-- Get All Avalibale Slots -- Room and Lab Population
DECLARE @ALLRoomsSlots Table(RowNo int, DayTimeSlotID int,SlotTitle nvarchar(200),StartTime Time,EndTime Time,DayID int,DayTitle nvarchar(100),RoomID int,RoomNo nvarchar(200),Capacity int)
DECLARE @ALLLabsSlots Table(RowNo int, DayTimeSlotID int,SlotTitle nvarchar(200),StartTime Time,EndTime Time,DayID int,DayTitle nvarchar(100),LabID int,LabNo nvarchar(200),Capacity int)

Insert into @SubjectSemesterTable(RowNo,ProgramSemesterID,CrHrs,ProgramSemesterSubjectID,SSTitle,Title,RoomTypeID,LectureID) select Row_Number() over(Order By(SELECT 1)) as RowNo, ProgramSemesterID,CrHrs,ProgramSemesterSubjectID,SSTitle,Title,RoomTypeID,LectureID From v_AllSemesterSectionSubjects Order By NewID();

DECLARE @IndexNo int = 1;
DECLARE @RowNo int = 1;
DECLARE @CountRecord int = (Select Count(*) From @SubjectSemesterTable);
	WHILE @IndexNo <= @CountRecord
		BEGIN
			DECLARE @RepeatPrint AS INT = (SELECT CrHrs From @SubjectSemesterTable where RowNo = @IndexNo);
			DECLARE @CountCrHrs int = 1;
				WHILE @CountCrHrs <=@RepeatPrint
					BEGIN
						Insert into @ALLSubjectSemesterTable(RowNo,RepeatedRowNo,ProgramSemesterID,CrHrs,ProgramSemesterSubjectID,SSTitle,Title,RoomTypeID,LectureID) select @RowNo, RowNo, ProgramSemesterID,CrHrs,ProgramSemesterSubjectID,SSTitle,Title,RoomTypeID,LectureID From @SubjectSemesterTable WHERE RowNo = @IndexNo;
					SET @CountCrHrs = @CountCrHrs + 1;
					SET @RowNo = @RowNo + 1;
					END
		SET @IndexNo = @IndexNo + 1;
		END
-- Getting Practical Class
Insert into @PracticalSubjectTable(ProgramSemesterID,CrHrs,ProgramSemesterSubjectID,SSTitle,Title,RoomTypeID,LectureID) select ProgramSemesterID,CrHrs,ProgramSemesterSubjectID,SSTitle,Title,RoomTypeID,LectureID From @ALLSubjectSemesterTable WHERE RoomTypeID = 4  Order By NewID();
Insert into @PracticalRandomSubjectTable(RowNo,ProgramSemesterID,CrHrs,ProgramSemesterSubjectID,SSTitle,Title,RoomTypeID,LectureID) select ROW_NUMBER() over (Order By (Select 1)), ProgramSemesterID,CrHrs,ProgramSemesterSubjectID,SSTitle,Title,RoomTypeID,LectureID From @PracticalSubjectTable;

-- Getting Non Practical Class
Insert into @NonPracticalSubjectTable(ProgramSemesterID,CrHrs,ProgramSemesterSubjectID,SSTitle,Title,RoomTypeID,LectureID) select ProgramSemesterID,CrHrs,ProgramSemesterSubjectID,SSTitle,Title,RoomTypeID,LectureID From @ALLSubjectSemesterTable WHERE RoomTypeID = 3  Order By NewID();
Insert into @NonPracticalRandomSubjectTable(RowNo,ProgramSemesterID,CrHrs,ProgramSemesterSubjectID,SSTitle,Title,RoomTypeID,LectureID) select ROW_NUMBER() over (Order By (Select 1)), ProgramSemesterID,CrHrs,ProgramSemesterSubjectID,SSTitle,Title,RoomTypeID,LectureID From @NonPracticalSubjectTable;

-- Print All Semester Subjects
--=========================================================================================================================
-- Second Step (Here we are getting Population)
		--	Population is All Time Slots in Time Table

-- Getting All Rooms Time Slots  -- It's Room Slots Population
Insert into @ALLRoomsSlots(RowNo,DayTimeSlotID,SlotTitle,StartTime,EndTime,DayID,DayTitle,RoomID,RoomNo,Capacity)
SELECT Row_Number() over (Order By(SELECT 1))as RowNo,DayTimeSlotID,SlotTitle,StartTime,EndTime,DayID,Name,RoomID,RoomNo,Capacity  FROM v_AllActiveTimeSlots
CROSS JOIN (SELECT * FROM RoomTable where IsActive = 1) RT WHERE SlotStatus = 1
ORDER BY RT.RoomID

-- Getting All Labs Time Slots   -- It's Lab Slots Population
Insert into @ALLLabsSlots(RowNo,DayTimeSlotID,SlotTitle,StartTime,EndTime,DayID,DayTitle,LabID,LabNo,Capacity)
SELECT Row_Number() over (Order By(SELECT 1))as RowNo,DayTimeSlotID,SlotTitle,StartTime,EndTime,DayID,Name,LabID,LabNo,Capacity FROM v_AllActiveTimeSlots
CROSS JOIN (SELECT * FROM LabTable where IsActive = 1) LT WHERE SlotStatus = 1
ORDER BY LT.LabID

-- DECLARE Variables For Check Time Slots is Enough
DECLARE @AllPracticalClass int = (SELECT COUNT(*) FROM @PracticalRandomSubjectTable);
DECLARE @AllNonPracticalClass int = (SELECT COUNT(*) FROM @NonPracticalRandomSubjectTable);
DECLARE @TotalLabsTimeSlot int = (SELECT COUNT(*) FROM @ALLLabsSlots);
DECLARE @TotalRoomsTimeSlot int = (SELECT COUNT(*) FROM @ALLRoomsSlots);
DECLARE @RemainingSlotsLabs int =  @TotalLabsTimeSlot - @AllPracticalClass;
DECLARE @TotalNonPracticalTimeSlots int = @TotalRoomsTimeSlot + @RemainingSlotsLabs;
DECLARE @TotalTimeSlots int = @TotalRoomsTimeSlot + @TotalLabsTimeSlot
DECLARE @TotalClass int = @AllPracticalClass + @AllNonPracticalClass;

-- DECLARE Lab's Break Duration Variables
DECLARE @LabDefference float = 0;
DECLARE @SetLabDefference float = 0;
DECLARE @LabBreak int = 0;

-- DECLARE Room's Break Duration Variables
DECLARE @RoomDefference float = 0;
DECLARE @SetRoomDefference float = 0;
DECLARE @RoomBreak int = 0;

-- Checking Slots and Subjects that's Enough or Not
	IF @AllNonPracticalClass > @TotalNonPracticalTimeSlots
	BEGIN
		SET @Message = 'Please Add More Rooms Or Labs';
	return;
	END 
	ELSE IF @AllPracticalClass > @TotalLabsTimeSlot
	BEGIN
		SET @Message = 'Please Add More Labs';
	return;
	END 
	ELSE  
	BEGIN
		SET @Message = 'Labs or Rooms is Enough';
	END 

-- Initilization Slots Break Duration Variables
   IF @TotalTimeSlots = @TotalClass
   BEGIN
	SET @RoomBreak = 0;
	SET @LabBreak = 0;
   END
   ELSE IF @AllNonPracticalClass < @TotalRoomsTimeSlot OR @AllNonPracticalClass = @TotalRoomsTimeSlot
   BEGIN
     -- Set Room Break
	 SET @RoomDefference = @TotalRoomsTimeSlot - @AllNonPracticalClass;
	 SET @SetRoomDefference = @TotalRoomsTimeSlot / @RoomDefference;
	 --SET @RoomBreak = Cast(@SetRoomDefference as int) + 1;
	 SET @RoomBreak = Cast(@SetRoomDefference as int);
	 -- Set Lab Break
	 SET @LabDefference = @TotalLabsTimeSlot - @AllPracticalClass;
	 SET @SetLabDefference = @TotalLabsTimeSlot / @LabDefference;
	 --SET @LabBreak = Cast(@SetLabDefference as int) + 1;
	 SET @LabBreak = Cast(@SetLabDefference as int);

	 SET @Message = 'Both Lab Slots and Room Slots Break Varaible Initilize';

   END
   ELSE IF @AllNonPracticalClass > @TotalRoomsTimeSlot 
   BEGIN
     -- Set Room Break
	 SET @RoomDefference = @TotalNonPracticalTimeSlots - @AllNonPracticalClass;
	 SET @SetRoomDefference = @TotalNonPracticalTimeSlots / @RoomDefference;
	 SET @RoomBreak = Cast(@SetRoomDefference as int) + 1;
	 
	 -- Set Lab Break
	 SET @LabBreak = 0;
	  SET @Message = 'Only Room Slots Break Varaible Initilize';
   END

--============================================================================================================================
-- Generate Time Table Header and Details Tables are Polulation Table
DECLARE @TimeTableHeader Table(TimeTableID int,SessionID int,ProgramSemesterID int,TimeTableTitle nvarchar(200), SemesterTitle nvarchar(200) ,StartDate Date, EndDate Date, IsActive bit);
DECLARE @TimeTableDetails Table(TimeTableID int, ProgramSemesterSubjectID int, SubjectTitle nvarchar(400), RoomID int, LabID int, DayTimeSlotID int, LectureID int, DayID int, IsActive bit);

--=========================================================================================================================
-- 3rd Step (Here we are Operator)
	--  Here we are using Genetic Algorithm Operators
	-- Selection
	-- Crossover
	-- Mutation (This one we are not use but is also a part of Operators)

-- Declare Time Table Header Variables 
DECLARE @TimeTableTitle nvarchar(400);
DECLARE @SessionTitle nvarchar(150) = (SELECT TOP 1 Title FROM SessionTable WHERE SessionID = @SessionID);

-- Getting All Semester
DECLARE @AllSemesters Table(RowNo int,ProgramSemesterID int,Title nvarchar(300));
INSERT INTO @AllSemesters(RowNo, ProgramSemesterID,Title) (SELECT ROW_NUMBER() over(order by(Select 1)) ,ProgramSemesterID, Title FROM (SELECT ProgramSemesterID,Title FROM @ALLSubjectSemesterTable GROUP BY ProgramSemesterID,Title) ALFF)

-- Create Time Table for one by one Semester
DECLARE @CAllSemester int = (Select Count(*) FROM @AllSemesters);
DECLARE @OneByOneSemester int = 1;
	WHILE @OneByOneSemester <= @CAllSemester
	BEGIN
		-- Get SEMESTER HEADER
		DECLARE @ProgramSemesterID int = (SELECT TOP 1 ProgramSemesterID FROM @AllSemesters WHERE RowNo = @OneByOneSemester);
		DECLARE @Title nvarchar(200) = (SELECT TOP 1 Title FROM @AllSemesters WHERE RowNo = @OneByOneSemester);
		SET @TimeTableTitle = (SELECT Title FROM @AllSemesters WHERE RowNo = @OneByOneSemester) + ' - '+@SessionTitle;
		INSERT INTO @TimeTableHeader(TimeTableID,SessionID,ProgramSemesterID,TimeTableTitle, SemesterTitle ,StartDate, EndDate, IsActive)
		VALUES(@OneByOneSemester, @SessionID, @ProgramSemesterID,@TimeTableTitle,@Title,@StartDate, @EndDate,1);
	SET @OneByOneSemester = @OneByOneSemester + 1;
	END 

	SET @Message = 'Time Table Header Intilize';
	-- DECLARE Time Slot Validation Variables
	DECLARE @LabTimeSlotNo int = 1;
	DECLARE @RoomTimeSlotNo int = 1;
	-- DECLARE Time Slot Marks as Empty
	DECLARE @RoomBreakDurationNo int = 1;
	DECLARE @LabBreakDurationNo int = 1;

	-- Assign First Practical Class
	DECLARE @OneByOnePracticalSubject int  = 1;
	-- SELECTION/CROSSOVER OPERATOR
		WHILE @OneByOnePracticalSubject <= @AllPracticalClass 
		BEGIN

			SET @TimeTableTitle = (SELECT Title FROM @AllSemesters WHERE RowNo = @OneByOneSemester) + ' - '+@SessionTitle;
			DECLARE @LabDProgramSemesterID int = (SELECT TOP 1 ProgramSemesterID FROM @PracticalRandomSubjectTable WHERE RowNo = @OneByOnePracticalSubject);
			DECLARE @LabSemesterTitle nvarchar(150) = (SELECT TOP 1 Title FROM @PracticalRandomSubjectTable WHERE RowNo = @OneByOnePracticalSubject);
			DECLARE @LabTimeTableID int = (SELECT TOP 1 TimeTableID FROM @TimeTableHeader WHERE ProgramSemesterID = @LabDProgramSemesterID AND SemesterTitle = @LabSemesterTitle)
			DECLARE @LabProgramSemesterSubjectID int = (SELECT TOP 1 ProgramSemesterSubjectID FROM @PracticalRandomSubjectTable WHERE RowNo = @OneByOnePracticalSubject);
			DECLARE @LabSubjectTitle nvarchar(300)=  (SELECT TOP 1 Title + ' ' + SSTitle FROM @PracticalRandomSubjectTable WHERE RowNo = @OneByOnePracticalSubject);
			DECLARE @LabRoomTypeID int  =  (SELECT TOP 1 RoomTypeID FROM @PracticalRandomSubjectTable WHERE RowNo = @OneByOnePracticalSubject);
			DECLARE @LabLectureID int = (SELECT TOP 1 LectureID FROM @PracticalRandomSubjectTable WHERE RowNo = @OneByOnePracticalSubject);
			DECLARE @LabID int = 0;
			DECLARE @LabRoomID int = 0;
			DECLARE @LabDayID int = 0; 
			DECLARE @LabDayTimeSlotID int  = 0;
			DECLARE @LabIsActive bit = 1;
				SET @LabID  = (SELECT TOP 1 LabID FROM @ALLLabsSlots WHERE RowNo = @LabTimeSlotNo);
				SET @LabDayTimeSlotID = (SELECT TOP 1 DayTimeSlotID FROM @ALLLabsSlots WHERE RowNo = @LabTimeSlotNo);
				SET @LabDayID = (SELECT TOP 1 DayID FROM @ALLLabsSlots WHERE RowNo = @LabTimeSlotNo);
					IF @LabBreakDurationNo = @LabBreak
					BEGIN
						SET @LabTimeSlotNo = @LabTimeSlotNo + 2;
						SET @LabBreakDurationNo = 1;
					END
					ELSE
					BEGIN
						SET @LabTimeSlotNo = @LabTimeSlotNo + 1;
						SET @LabBreakDurationNo = @LabBreakDurationNo + 1;
					END
				 
				INSERT INTO @TimeTableDetails(TimeTableID, ProgramSemesterSubjectID, SubjectTitle, RoomID, LabID, DayTimeSlotID, LectureID, DayID, IsActive)
				Values(@LabTimeTableID,@LabProgramSemesterSubjectID,@LabSubjectTitle,0,@LabID,@LabDayTimeSlotID,@LabLectureID,@LabDayID,@LabIsActive);
		        IF @LabBreakDurationNo = 1
				BEGIN
					INSERT INTO @TimeTableDetails(TimeTableID, ProgramSemesterSubjectID, SubjectTitle, RoomID, LabID, DayTimeSlotID, LectureID, DayID, IsActive)
					Values(@LabTimeTableID,0,'Break',0,@LabID,@LabDayTimeSlotID,0,@LabDayID,@LabIsActive);
				END
		SET @OneByOnePracticalSubject = @OneByOnePracticalSubject + 1;
		END
		SET @Message = 'All Practical Time Table Details Intilize';

		-- Assign Non Practical Class
		DECLARE @OneByOneNonPracticalSubject int  = 1;
		-- SELECTION/CROSSOVER OPERATOR
		WHILE @OneByOneNonPracticalSubject <= @AllNonPracticalClass 
		BEGIN
			
			SET @TimeTableTitle = (SELECT Title FROM @AllSemesters WHERE RowNo = @OneByOneSemester) + ' - '+@SessionTitle;
			DECLARE @RoomDProgramSemesterID int = (SELECT TOP 1 ProgramSemesterID FROM @NonPracticalRandomSubjectTable WHERE RowNo = @OneByOneNonPracticalSubject);
			DECLARE @RoomSemesterTitle nvarchar(150) = (SELECT TOP 1 Title FROM @NonPracticalRandomSubjectTable WHERE RowNo = @OneByOneNonPracticalSubject);
			DECLARE @RoomTimeTableID int = (SELECT TOP 1 TimeTableID FROM @TimeTableHeader WHERE ProgramSemesterID = @RoomDProgramSemesterID AND SemesterTitle = @RoomSemesterTitle)
			DECLARE @RoomProgramSemesterSubjectID int = (SELECT TOP 1 ProgramSemesterSubjectID FROM @NonPracticalRandomSubjectTable WHERE RowNo = @OneByOneNonPracticalSubject);
			DECLARE @RoomSubjectTitle nvarchar(300)=  (SELECT TOP 1 Title + ' ' + SSTitle FROM @NonPracticalRandomSubjectTable WHERE RowNo = @OneByOneNonPracticalSubject);
			DECLARE @RoomTypeID int  =  (SELECT TOP 1 RoomTypeID FROM @NonPracticalRandomSubjectTable WHERE RowNo = @OneByOneNonPracticalSubject);
			DECLARE @RoomLectureID int = (SELECT TOP 1 LectureID FROM @NonPracticalRandomSubjectTable WHERE RowNo = @OneByOneNonPracticalSubject);
			DECLARE @RoomLabID int = 0;
			DECLARE @RoomID int = 0;
			DECLARE @RoomDayID int = 0; 
			DECLARE @RoomDayTimeSlotID int  = 0;
			DECLARE @RoomIsActive bit = 1;

			IF @RoomTimeSlotNo <= @TotalRoomsTimeSlot
			BEGIN
					SET @RoomID  = (SELECT TOP 1 RoomID FROM @ALLRoomsSlots WHERE RowNo = @RoomTimeSlotNo);
					SET @RoomDayTimeSlotID = (SELECT TOP 1 DayTimeSlotID FROM @ALLRoomsSlots WHERE RowNo = @RoomTimeSlotNo);
					SET @RoomDayID = (SELECT TOP 1 DayID FROM @ALLRoomsSlots WHERE RowNo = @RoomTimeSlotNo);
					
						IF @RoomBreakDurationNo = @RoomBreak
						BEGIN
							SET @RoomTimeSlotNo = @RoomTimeSlotNo + 2;
							SET @RoomBreakDurationNo = 1;
						END
						ELSE
						BEGIN
							SET @RoomTimeSlotNo = @RoomTimeSlotNo + 1;
							SET @RoomBreakDurationNo = @RoomBreakDurationNo + 1;
						END
			END
			ELSE
			BEGIN
					SET @RoomLabID  = (SELECT TOP 1 LabID FROM @ALLLabsSlots WHERE RowNo = @LabTimeSlotNo);
					SET @RoomDayTimeSlotID = (SELECT TOP 1 DayTimeSlotID FROM @ALLLabsSlots WHERE RowNo = @LabTimeSlotNo);
					SET @RoomDayID = (SELECT TOP 1 DayID FROM @ALLLabsSlots WHERE RowNo = @LabTimeSlotNo);
					IF @RoomBreakDurationNo = @RoomBreak
					BEGIN
						SET @LabTimeSlotNo = @LabTimeSlotNo + 2;
						SET @RoomBreakDurationNo = 1;
					END
					ELSE
					BEGIN
						SET @LabTimeSlotNo = @LabTimeSlotNo + 1;
						SET @RoomBreakDurationNo = @RoomBreakDurationNo + 1;
					END 
			END
			 
		    INSERT INTO @TimeTableDetails(TimeTableID, ProgramSemesterSubjectID, SubjectTitle, RoomID, LabID, DayTimeSlotID, LectureID, DayID, IsActive)
		    Values(@RoomTimeTableID,@RoomProgramSemesterSubjectID,@RoomSubjectTitle,@RoomID,@RoomLabID,@RoomDayTimeSlotID,@RoomLectureID,@RoomDayID,@RoomIsActive);
		          IF @RoomBreakDurationNo = 1
		    BEGIN
		    	INSERT INTO @TimeTableDetails(TimeTableID, ProgramSemesterSubjectID, SubjectTitle, RoomID, LabID, DayTimeSlotID, LectureID, DayID, IsActive)
		    	Values(@RoomTimeTableID,0,'Break',@RoomID,0,@RoomDayTimeSlotID,@RoomLabID,@RoomDayID,@RoomIsActive);
		    END
			

		SET @OneByOneNonPracticalSubject = @OneByOneNonPracticalSubject + 1;
		END
		SET @Message = 'All Non Practical Time Table Details Intilize';

	
	DELETE FROM TimeTableDetailsTable;
	DELETE FROM TimeTblTable;
	

	INSERT INTO TimeTblTable(TimeTableID ,SessionID ,ProgramSemesterID ,TimeTableTitle , SemesterTitle ,StartDate , EndDate , IsActive )
	SELECT TimeTableID ,SessionID ,ProgramSemesterID ,TimeTableTitle , SemesterTitle ,StartDate , EndDate , IsActive FROM @TimeTableHeader;
	INSERT INTO TimeTableDetailsTable(TimeTableID, ProgramSemesterSubjectID, SubjectTitle, RoomID, LabID , DayTimeSlotID, LectureID, DayID , IsActive)
	SELECT TimeTableID, ProgramSemesterSubjectID, SubjectTitle, RoomID, LabID , DayTimeSlotID, LectureID, DayID , IsActive FROM @TimeTableDetails
	SET @Message = 'Time Table Created Successfully';

END
GO
/****** Object:  StoredProcedure [dbo].[GenerateTimeTablesForAllSession]    Script Date: 14/06/2020 9:40:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GenerateTimeTablesForAllSession](@StartDate Date, @EndDate Date, @Message nvarchar(100) output)
AS
BEGIN
-------------------- Here we are using Genetic Algorithem  ---------------------------------
-- Genetic Algorithm is 
	-- Optimization
	-- Based on Natural Phenomenon
	-- Nature inspired approach based on Darwin's Law of survival of the fittest
	-- of bio-isspired operators such as Pairing, Crossover and mutation
	-- Grequently used to find optimal or near-optimal solutions to difficult problems 
	-- Optimation is the process of making something better
-- Technology 
	--  Population
	--	Chromosomes
	--	Gene
-- Operators are
	--	Selection
	--	Crossover
	--	Mutation

--=========================================================================================================================
-- First Step (Here we are getting Chromosomes/Gene)
		--	Polulation is All Time Slots in Time Table
		--	Chromosomes is All Subjects
		--	Gene is one Subject
-- Get All Sujects -- All Subject here Chromosomes, and one subject is Gen
DECLARE @ALLSubjectSemesterTable Table(RowNo int, RepeatedRowNo int,ProgramSemesterID int,CrHrs int, ProgramSemesterSubjectID int,SSTitle nvarchar(300),Title nvarchar(200),RoomTypeID int,LectureID int,SessionID int, SessionTitle NVARCHAR(200))
DECLARE @SubjectSemesterTable Table(RowNo int,ProgramSemesterID int,CrHrs int, ProgramSemesterSubjectID int,SSTitle nvarchar(300),Title nvarchar(200),RoomTypeID int,LectureID int,SessionID int, SessionTitle NVARCHAR(200))

-- Get All Practical Class
DECLARE @PracticalSubjectTable Table(ProgramSemesterID int,CrHrs int, ProgramSemesterSubjectID int,SSTitle nvarchar(300),Title nvarchar(200),RoomTypeID int,LectureID int,SessionID int, SessionTitle NVARCHAR(200))
DECLARE @PracticalRandomSubjectTable Table(RowNo int,ProgramSemesterID int,CrHrs int, ProgramSemesterSubjectID int,SSTitle nvarchar(300),Title nvarchar(200),RoomTypeID int,LectureID int,SessionID int, SessionTitle NVARCHAR(200))

-- Get All Non Practical Class
DECLARE @NonPracticalSubjectTable Table(ProgramSemesterID int,CrHrs int, ProgramSemesterSubjectID int,SSTitle nvarchar(300),Title nvarchar(200),RoomTypeID int,LectureID int,SessionID int, SessionTitle NVARCHAR(200))
DECLARE @NonPracticalRandomSubjectTable Table(RowNo int,ProgramSemesterID int,CrHrs int, ProgramSemesterSubjectID int,SSTitle nvarchar(300),Title nvarchar(200),RoomTypeID int,LectureID int,SessionID int, SessionTitle NVARCHAR(200))

-- Get All Avalibale Slots -- Room and Lab Population
DECLARE @ALLRoomsSlots Table(RowNo int, DayTimeSlotID int,SlotTitle nvarchar(200),StartTime Time,EndTime Time,DayID int,DayTitle nvarchar(100),RoomID int,RoomNo nvarchar(200),Capacity int)
DECLARE @ALLLabsSlots Table(RowNo int, DayTimeSlotID int,SlotTitle nvarchar(200),StartTime Time,EndTime Time,DayID int,DayTitle nvarchar(100),LabID int,LabNo nvarchar(200),Capacity int)

Insert into @SubjectSemesterTable(RowNo,ProgramSemesterID,CrHrs,ProgramSemesterSubjectID,SSTitle,Title,RoomTypeID,LectureID,SessionID,SessionTitle) select Row_Number() over(Order By(SELECT 1)) as RowNo, ProgramSemesterID,CrHrs,ProgramSemesterSubjectID,SSTitle,Title,RoomTypeID,LectureID,SessionID,SessionTitle From v_AllSemesterSectionSubjects Order By NewID();

DECLARE @IndexNo int = 1;
DECLARE @RowNo int = 1;
DECLARE @CountRecord int = (Select Count(*) From @SubjectSemesterTable);
	WHILE @IndexNo <= @CountRecord
		BEGIN
			DECLARE @RepeatPrint AS INT = (SELECT CrHrs From @SubjectSemesterTable where RowNo = @IndexNo);
			DECLARE @CountCrHrs int = 1;
				WHILE @CountCrHrs <=@RepeatPrint
					BEGIN
						Insert into @ALLSubjectSemesterTable(RowNo,RepeatedRowNo,ProgramSemesterID,CrHrs,ProgramSemesterSubjectID,SSTitle,Title,RoomTypeID,LectureID,SessionID,SessionTitle) select @RowNo, RowNo, ProgramSemesterID,CrHrs,ProgramSemesterSubjectID,SSTitle,Title,RoomTypeID,LectureID,SessionID,SessionTitle From @SubjectSemesterTable WHERE RowNo = @IndexNo;
					SET @CountCrHrs = @CountCrHrs + 1;
					SET @RowNo = @RowNo + 1;
					END
		SET @IndexNo = @IndexNo + 1;
		END
-- Getting Practical Class
INSERT INTO @PracticalSubjectTable(ProgramSemesterID,CrHrs,ProgramSemesterSubjectID,SSTitle,Title,RoomTypeID,LectureID,SessionID,SessionTitle) 
SELECT ProgramSemesterID,CrHrs,ProgramSemesterSubjectID,SSTitle,Title,RoomTypeID,LectureID,SessionID,SessionTitle From @ALLSubjectSemesterTable WHERE RoomTypeID = 4  Order By NewID();

INSERT INTO @PracticalRandomSubjectTable(RowNo,ProgramSemesterID,CrHrs,ProgramSemesterSubjectID,SSTitle,Title,RoomTypeID,LectureID,SessionID,SessionTitle) 
SELECT ROW_NUMBER() over (Order By (Select 1)), ProgramSemesterID,CrHrs,ProgramSemesterSubjectID,SSTitle,Title,RoomTypeID,LectureID,SessionID,SessionTitle From @PracticalSubjectTable;

-- Getting Non Practical Class
INSERT INTO @NonPracticalSubjectTable(ProgramSemesterID,CrHrs,ProgramSemesterSubjectID,SSTitle,Title,RoomTypeID,LectureID,SessionID,SessionTitle) 
SELECT ProgramSemesterID,CrHrs,ProgramSemesterSubjectID,SSTitle,Title,RoomTypeID,LectureID,SessionID,SessionTitle From @ALLSubjectSemesterTable WHERE RoomTypeID = 3  Order By NewID();

INSERT INTO @NonPracticalRandomSubjectTable(RowNo,ProgramSemesterID,CrHrs,ProgramSemesterSubjectID,SSTitle,Title,RoomTypeID,LectureID,SessionID,SessionTitle) 
SELECT ROW_NUMBER() over (Order By (Select 1)), ProgramSemesterID,CrHrs,ProgramSemesterSubjectID,SSTitle,Title,RoomTypeID,LectureID,SessionID,SessionTitle From @NonPracticalSubjectTable;

-- Print All Semester Subjects
--=========================================================================================================================
-- Second Step (Here we are getting Population)
		--	Population is All Time Slots in Time Table

-- Getting All Rooms Time Slots  -- It's Room Slots Population
INSERT INTO @ALLRoomsSlots(RowNo,DayTimeSlotID,SlotTitle,StartTime,EndTime,DayID,DayTitle,RoomID,RoomNo,Capacity)
SELECT Row_Number() over (Order By(SELECT 1))as RowNo,DayTimeSlotID,SlotTitle,StartTime,EndTime,DayID,Name,RoomID,RoomNo,Capacity  FROM v_AllActiveTimeSlots
CROSS JOIN (SELECT * FROM RoomTable where IsActive = 1) RT WHERE SlotStatus = 1
ORDER BY RT.RoomID

-- Getting All Labs Time Slots   -- It's Lab Slots Population
Insert into @ALLLabsSlots(RowNo,DayTimeSlotID,SlotTitle,StartTime,EndTime,DayID,DayTitle,LabID,LabNo,Capacity)
SELECT Row_Number() over (Order By(SELECT 1))as RowNo,DayTimeSlotID,SlotTitle,StartTime,EndTime,DayID,Name,LabID,LabNo,Capacity FROM v_AllActiveTimeSlots
CROSS JOIN (SELECT * FROM LabTable where IsActive = 1) LT WHERE SlotStatus = 1
ORDER BY LT.LabID

-- DECLARE Variables For Check Time Slots is Enough
DECLARE @AllPracticalClass int = (SELECT COUNT(*) FROM @PracticalRandomSubjectTable);
DECLARE @AllNonPracticalClass int = (SELECT COUNT(*) FROM @NonPracticalRandomSubjectTable);
DECLARE @TotalLabsTimeSlot int = (SELECT COUNT(*) FROM @ALLLabsSlots);
DECLARE @TotalRoomsTimeSlot int = (SELECT COUNT(*) FROM @ALLRoomsSlots);
DECLARE @RemainingSlotsLabs int =  @TotalLabsTimeSlot - @AllPracticalClass;
DECLARE @TotalNonPracticalTimeSlots int = @TotalRoomsTimeSlot + @RemainingSlotsLabs;
DECLARE @TotalTimeSlots int = @TotalRoomsTimeSlot + @TotalLabsTimeSlot
DECLARE @TotalClass int = @AllPracticalClass + @AllNonPracticalClass;

-- DECLARE Lab's Break Duration Variables
DECLARE @LabDefference float = 0;
DECLARE @SetLabDefference float = 0;
DECLARE @LabBreak int = 0;

-- DECLARE Room's Break Duration Variables
DECLARE @RoomDefference float = 0;
DECLARE @SetRoomDefference float = 0;
DECLARE @RoomBreak int = 0;

-- Checking Slots and Subjects that's Enough or Not
	IF @AllNonPracticalClass > @TotalNonPracticalTimeSlots
	BEGIN
		SET @Message = 'Please Add More Rooms Or Labs';
	return;
	END 
	ELSE IF @AllPracticalClass > @TotalLabsTimeSlot
	BEGIN
		SET @Message = 'Please Add More Labs';
	return;
	END 
	ELSE  
	BEGIN
		SET @Message = 'Labs or Rooms is Enough';
	END 

-- Initilization Slots Break Duration Variables
   IF @TotalTimeSlots = @TotalClass
   BEGIN
	SET @RoomBreak = 0;
	SET @LabBreak = 0;
   END
   ELSE IF @AllNonPracticalClass < @TotalRoomsTimeSlot OR @AllNonPracticalClass = @TotalRoomsTimeSlot
   BEGIN
     -- Set Room Break
	 SET @RoomDefference = @TotalRoomsTimeSlot - @AllNonPracticalClass;
	 SET @SetRoomDefference = @TotalRoomsTimeSlot / @RoomDefference;
	 --SET @RoomBreak = Cast(@SetRoomDefference as int) + 1;
	 SET @RoomBreak = Cast(@SetRoomDefference as int);
	 -- Set Lab Break
	 SET @LabDefference = @TotalLabsTimeSlot - @AllPracticalClass;
	 SET @SetLabDefference = @TotalLabsTimeSlot / @LabDefference;
	 --SET @LabBreak = Cast(@SetLabDefference as int) + 1;
	 SET @LabBreak = Cast(@SetLabDefference as int);

	 SET @Message = 'Both Lab Slots and Room Slots Break Varaible Initilize';

   END
   ELSE IF @AllNonPracticalClass > @TotalRoomsTimeSlot 
   BEGIN
     -- Set Room Break
	 SET @RoomDefference = @TotalNonPracticalTimeSlots - @AllNonPracticalClass;
	 SET @SetRoomDefference = @TotalNonPracticalTimeSlots / @RoomDefference;
	 SET @RoomBreak = Cast(@SetRoomDefference as int) + 1;
	 
	 -- Set Lab Break
	 SET @LabBreak = 0;
	  SET @Message = 'Only Room Slots Break Varaible Initilize';
   END

--============================================================================================================================
-- Generate Time Table Header and Details Tables are Polulation Table
DECLARE @TimeTableHeader Table(TimeTableID int,SessionID int,SessionTitle NVARCHAR(500), ProgramSemesterID int,TimeTableTitle nvarchar(200), SemesterTitle nvarchar(200) ,StartDate Date, EndDate Date, IsActive bit);
DECLARE @TimeTableDetails Table(TimeTableID int,SessionID int,SessionTitle NVARCHAR(500), ProgramSemesterSubjectID int, SubjectTitle nvarchar(400), RoomID int, LabID int, DayTimeSlotID int, LectureID int, DayID int, IsActive bit);

--=========================================================================================================================
-- 3rd Step (Here we are Operator)
	-- Here we are using Genetic Algorithm Operators
	-- Selection
	-- Crossover
	-- Mutation (This one we are not use but is also a part of Operators)

-- Declare Time Table Header Variables 
DECLARE @TimeTableTitle nvarchar(400);


-- Getting All Semester
DECLARE @AllSemesters Table(RowNo int,ProgramSemesterID int,Title nvarchar(300),SessionID int,SessionTitle NVARCHAR(500));
INSERT INTO @AllSemesters(RowNo, ProgramSemesterID,Title,SessionID,SessionTitle) (SELECT ROW_NUMBER() over(order by(Select 1)) ,ProgramSemesterID, Title, SessionID,SessionTitle FROM (SELECT ProgramSemesterID,Title,SessionID,SessionTitle FROM @ALLSubjectSemesterTable GROUP BY ProgramSemesterID,Title,SessionID,SessionTitle) ALFF)

-- Create Time Table for one by one Semester
DECLARE @CAllSemester int = (Select Count(*) FROM @AllSemesters);
DECLARE @OneByOneSemester int = 1;
	WHILE @OneByOneSemester <= @CAllSemester
	BEGIN
		-- Get SEMESTER HEADER
		DECLARE @SessionTitle nvarchar(150) = (SELECT TOP 1 SessionTitle FROM @AllSemesters WHERE RowNo = @OneByOneSemester);
		DECLARE @SessionID nvarchar(150) = (SELECT TOP 1 SessionID FROM @AllSemesters WHERE RowNo = @OneByOneSemester);
		DECLARE @ProgramSemesterID int = (SELECT TOP 1 ProgramSemesterID FROM @AllSemesters WHERE RowNo = @OneByOneSemester);
		DECLARE @Title nvarchar(200) = (SELECT TOP 1 Title FROM @AllSemesters WHERE RowNo = @OneByOneSemester);
		SET @TimeTableTitle = (SELECT Title FROM @AllSemesters WHERE RowNo = @OneByOneSemester); -- + ' - '+@SessionTitle;
		INSERT INTO @TimeTableHeader(TimeTableID,SessionID,SessionTitle,ProgramSemesterID,TimeTableTitle, SemesterTitle ,StartDate, EndDate, IsActive)
		VALUES(@OneByOneSemester, @SessionID,@SessionTitle, @ProgramSemesterID,@TimeTableTitle,@Title,@StartDate, @EndDate,1);
	SET @OneByOneSemester = @OneByOneSemester + 1;
	END 

	SET @Message = 'Time Table Header Intilize';
	-- DECLARE Time Slot Validation Variables
	DECLARE @LabTimeSlotNo int = 1;
	DECLARE @RoomTimeSlotNo int = 1;
	-- DECLARE Time Slot Marks as Empty
	DECLARE @RoomBreakDurationNo int = 1;
	DECLARE @LabBreakDurationNo int = 1;

	-- Assign First Practical Class
	DECLARE @OneByOnePracticalSubject int  = 1;
	-- SELECTION/CROSSOVER OPERATOR
		WHILE @OneByOnePracticalSubject <= @AllPracticalClass 
		BEGIN

			--DECLARE @SessionTitle nvarchar(150) = (SELECT TOP 1 SessionTitle FROM @AllSemesters WHERE RowNo = @OneByOneSemester);
			DECLARE @SubjectSessionTitle nvarchar(350) = (SELECT TOP 1 SessionTitle FROM @PracticalRandomSubjectTable WHERE RowNo = @OneByOnePracticalSubject);
			DECLARE @SubjectSessionID INT = (SELECT TOP 1 SessionID FROM @PracticalRandomSubjectTable WHERE RowNo = @OneByOnePracticalSubject);
			SET @TimeTableTitle = (SELECT Title FROM @AllSemesters WHERE RowNo = @OneByOneSemester);-- + ' - '+@SessionTitle;
			DECLARE @LabDProgramSemesterID int = (SELECT TOP 1 ProgramSemesterID FROM @PracticalRandomSubjectTable WHERE RowNo = @OneByOnePracticalSubject);
			DECLARE @LabSemesterTitle nvarchar(150) = (SELECT TOP 1 Title FROM @PracticalRandomSubjectTable WHERE RowNo = @OneByOnePracticalSubject);
			DECLARE @LabTimeTableID int = (SELECT TOP 1 TimeTableID FROM @TimeTableHeader WHERE ProgramSemesterID = @LabDProgramSemesterID AND SemesterTitle = @LabSemesterTitle)
			DECLARE @LabProgramSemesterSubjectID int = (SELECT TOP 1 ProgramSemesterSubjectID FROM @PracticalRandomSubjectTable WHERE RowNo = @OneByOnePracticalSubject);
			DECLARE @LabSubjectTitle nvarchar(300)=  (SELECT TOP 1 Title + ' ' + SSTitle FROM @PracticalRandomSubjectTable WHERE RowNo = @OneByOnePracticalSubject);
			DECLARE @LabRoomTypeID int  =  (SELECT TOP 1 RoomTypeID FROM @PracticalRandomSubjectTable WHERE RowNo = @OneByOnePracticalSubject);
			DECLARE @LabLectureID int = (SELECT TOP 1 LectureID FROM @PracticalRandomSubjectTable WHERE RowNo = @OneByOnePracticalSubject);
			DECLARE @LabID int = 0;
			DECLARE @LabRoomID int = 0;
			DECLARE @LabDayID int = 0; 
			DECLARE @LabDayTimeSlotID int  = 0;
			DECLARE @LabIsActive bit = 1;
				SET @LabID  = (SELECT TOP 1 LabID FROM @ALLLabsSlots WHERE RowNo = @LabTimeSlotNo);
				SET @LabDayTimeSlotID = (SELECT TOP 1 DayTimeSlotID FROM @ALLLabsSlots WHERE RowNo = @LabTimeSlotNo);
				SET @LabDayID = (SELECT TOP 1 DayID FROM @ALLLabsSlots WHERE RowNo = @LabTimeSlotNo);
					IF @LabBreakDurationNo = @LabBreak
					BEGIN
						SET @LabTimeSlotNo = @LabTimeSlotNo + 2;
						SET @LabBreakDurationNo = 1;
					END
					ELSE
					BEGIN
						SET @LabTimeSlotNo = @LabTimeSlotNo + 1;
						SET @LabBreakDurationNo = @LabBreakDurationNo + 1;
					END
				 
				INSERT INTO @TimeTableDetails(TimeTableID,SessionTitle,SessionID, ProgramSemesterSubjectID, SubjectTitle, RoomID, LabID, DayTimeSlotID, LectureID, DayID, IsActive)
				Values(@LabTimeTableID,@SubjectSessionTitle,@SubjectSessionID,@LabProgramSemesterSubjectID,@LabSubjectTitle,0,@LabID,@LabDayTimeSlotID,@LabLectureID,@LabDayID,@LabIsActive);
		        IF @LabBreakDurationNo = 1
				BEGIN
					INSERT INTO @TimeTableDetails(TimeTableID,SessionTitle,SessionID, ProgramSemesterSubjectID, SubjectTitle, RoomID, LabID, DayTimeSlotID, LectureID, DayID, IsActive)
					Values(@LabTimeTableID,'',0,0,'Break',0,@LabID,@LabDayTimeSlotID,0,@LabDayID,@LabIsActive);
				END
		SET @OneByOnePracticalSubject = @OneByOnePracticalSubject + 1;
		END
		SET @Message = 'All Practical Time Table Details Intilize';

		-- Assign Non Practical Class
		DECLARE @OneByOneNonPracticalSubject int  = 1;
		-- SELECTION/CROSSOVER OPERATOR
		WHILE @OneByOneNonPracticalSubject <= @AllNonPracticalClass 
		BEGIN
			
			SET @TimeTableTitle = (SELECT Title FROM @AllSemesters WHERE RowNo = @OneByOneSemester) + ' - '+@SessionTitle;
			DECLARE @RoomDProgramSemesterID int = (SELECT TOP 1 ProgramSemesterID FROM @NonPracticalRandomSubjectTable WHERE RowNo = @OneByOneNonPracticalSubject);
			DECLARE @RoomSemesterTitle nvarchar(150) = (SELECT TOP 1 Title FROM @NonPracticalRandomSubjectTable WHERE RowNo = @OneByOneNonPracticalSubject);
			DECLARE @RoomTimeTableID int = (SELECT TOP 1 TimeTableID FROM @TimeTableHeader WHERE ProgramSemesterID = @RoomDProgramSemesterID AND SemesterTitle = @RoomSemesterTitle)
			DECLARE @RoomProgramSemesterSubjectID int = (SELECT TOP 1 ProgramSemesterSubjectID FROM @NonPracticalRandomSubjectTable WHERE RowNo = @OneByOneNonPracticalSubject);
			DECLARE @RoomSubjectTitle nvarchar(300)=  (SELECT TOP 1 Title + ' ' + SSTitle FROM @NonPracticalRandomSubjectTable WHERE RowNo = @OneByOneNonPracticalSubject);
			DECLARE @RoomTypeID int  =  (SELECT TOP 1 RoomTypeID FROM @NonPracticalRandomSubjectTable WHERE RowNo = @OneByOneNonPracticalSubject);
			DECLARE @RoomLectureID int = (SELECT TOP 1 LectureID FROM @NonPracticalRandomSubjectTable WHERE RowNo = @OneByOneNonPracticalSubject);
			DECLARE @RoomLabID int = 0;
			DECLARE @RoomID int = 0;
			DECLARE @RoomDayID int = 0; 
			DECLARE @RoomDayTimeSlotID int  = 0;
			DECLARE @RoomIsActive bit = 1;

			IF @RoomTimeSlotNo <= @TotalRoomsTimeSlot
			BEGIN
					SET @RoomID  = (SELECT TOP 1 RoomID FROM @ALLRoomsSlots WHERE RowNo = @RoomTimeSlotNo);
					SET @RoomDayTimeSlotID = (SELECT TOP 1 DayTimeSlotID FROM @ALLRoomsSlots WHERE RowNo = @RoomTimeSlotNo);
					SET @RoomDayID = (SELECT TOP 1 DayID FROM @ALLRoomsSlots WHERE RowNo = @RoomTimeSlotNo);
					
						IF @RoomBreakDurationNo = @RoomBreak
						BEGIN
							SET @RoomTimeSlotNo = @RoomTimeSlotNo + 2;
							SET @RoomBreakDurationNo = 1;
						END
						ELSE
						BEGIN
							SET @RoomTimeSlotNo = @RoomTimeSlotNo + 1;
							SET @RoomBreakDurationNo = @RoomBreakDurationNo + 1;
						END
			END
			ELSE
			BEGIN
					SET @RoomLabID  = (SELECT TOP 1 LabID FROM @ALLLabsSlots WHERE RowNo = @LabTimeSlotNo);
					SET @RoomDayTimeSlotID = (SELECT TOP 1 DayTimeSlotID FROM @ALLLabsSlots WHERE RowNo = @LabTimeSlotNo);
					SET @RoomDayID = (SELECT TOP 1 DayID FROM @ALLLabsSlots WHERE RowNo = @LabTimeSlotNo);
					IF @RoomBreakDurationNo = @RoomBreak
					BEGIN
						SET @LabTimeSlotNo = @LabTimeSlotNo + 2;
						SET @RoomBreakDurationNo = 1;
					END
					ELSE
					BEGIN
						SET @LabTimeSlotNo = @LabTimeSlotNo + 1;
						SET @RoomBreakDurationNo = @RoomBreakDurationNo + 1;
					END 
			END
			 
		    INSERT INTO @TimeTableDetails(TimeTableID,SessionTitle,SessionID, ProgramSemesterSubjectID, SubjectTitle, RoomID, LabID, DayTimeSlotID, LectureID, DayID, IsActive)
		    Values(@RoomTimeTableID,@SubjectSessionTitle,@SubjectSessionID,@RoomProgramSemesterSubjectID,@RoomSubjectTitle,@RoomID,@RoomLabID,@RoomDayTimeSlotID,@RoomLectureID,@RoomDayID,@RoomIsActive);
		    IF @RoomBreakDurationNo = 1
		    BEGIN
		    	INSERT INTO @TimeTableDetails(TimeTableID,SessionTitle,SessionID, ProgramSemesterSubjectID, SubjectTitle, RoomID, LabID, DayTimeSlotID, LectureID, DayID, IsActive)
		    	Values(@RoomTimeTableID,'',0,0,'Break',@RoomID,0,@RoomDayTimeSlotID,@RoomLabID,@RoomDayID,@RoomIsActive);
		    END
			

		SET @OneByOneNonPracticalSubject = @OneByOneNonPracticalSubject + 1;
		END
		SET @Message = 'All Non Practical Time Table Details Intilize';

	
	DELETE FROM TimeTableDetailsTable;
	DELETE FROM TimeTblTable;
	

	INSERT INTO TimeTblTable(TimeTableID ,SessionID,SessionTitle,ProgramSemesterID ,TimeTableTitle , SemesterTitle ,StartDate , EndDate , IsActive )
	SELECT TimeTableID ,SessionID,SessionTitle ,ProgramSemesterID ,TimeTableTitle , SemesterTitle ,StartDate , EndDate , IsActive FROM @TimeTableHeader;
	INSERT INTO TimeTableDetailsTable(TimeTableID,SessionID,SessionTitle, ProgramSemesterSubjectID, SubjectTitle, RoomID, LabID , DayTimeSlotID, LectureID, DayID , IsActive)
	SELECT TimeTableID,SessionID,SessionTitle, ProgramSemesterSubjectID, SubjectTitle, RoomID, LabID , DayTimeSlotID, LectureID, DayID , IsActive FROM @TimeTableDetails
	SET @Message = 'Time Table Created Successfully';

END
GO
/****** Object:  StoredProcedure [dbo].[sp_PrintAllDaysTimeTablesOneByOne]    Script Date: 14/06/2020 9:40:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_PrintAllDaysTimeTablesOneByOne]
AS
BEGIN
	DECLARE @AllDaysTimeTable Table( [TimeTableID] int,
										 [DayTitle] nvarchar(300),
										 [LabRoomTitle] nvarchar(300),
										 [Slot1] nvarchar(300),
										 [Slot2] nvarchar(300),
									     [Slot3] nvarchar(300),
										 [Slot4] nvarchar(300),
										 [Slot5] nvarchar(300)
										 )

	--Getting All Rooms Slots    
	DECLARE @AllRoomsSlots Table(
		 TimeTableID INT, 
		 ProgramSemesterSubjectID INT,	
		 SubjectTitle nvarchar(500), 
		 RoomID INT,
		 RoomNo nvarchar(400), 
		 DayTimeSlotID INT,
		 SlotTitle nvarchar(400), 
		 DayTitle nvarchar(200),
		 LectureID int, 
		 DayID int )

	INSERT INTO @AllRoomsSlots(
		 TimeTableID, 
		 ProgramSemesterSubjectID,	
		 SubjectTitle, 
		 RoomID,
		 RoomNo, 
		 DayTimeSlotID,
		 SlotTitle, 
		 DayTitle,
		 LectureID, 
		 DayID) 
	SELECT * FROM (SELECT 
		TD.TimeTableID, 
		TD.ProgramSemesterSubjectID,	
		TD.SubjectTitle, 
		TD.RoomID,
		RT.RoomNo, 
		TD.DayTimeSlotID,
		ATS.SlotTitle, 
		ATS.Name,
		TD.LectureID, 
		TD.DayID 
		 FROM TimeTableDetailsTable TD
		INNER JOIN v_AllActiveTimeSlots ATS
		ON TD.DayTimeSlotID = ATS.DayTimeSlotID
		LEFT JOIN RoomTable RT
		ON TD.RoomID = RT.RoomID
		WHERE TD.DayID = 1 AND TD.RoomID > 0) ALLSlots

	--Getting All Labs Slots
    DECLARE @AllLabsSlots Table(
		 TimeTableID INT, 
		 ProgramSemesterSubjectID INT,	
		 SubjectTitle nvarchar(500), 
		 LabID INT,
		 LabNo nvarchar(400), 
		 DayTimeSlotID INT,
		 SlotTitle nvarchar(400), 
		 DayTitle nvarchar(200),
		 LectureID int, 
		 DayID int )

	INSERT INTO @AllLabsSlots(
		 TimeTableID, 
		 ProgramSemesterSubjectID,	
		 SubjectTitle, 
		 LabID,
		 LabNo,  
		 DayTimeSlotID,
		 SlotTitle, 
		 DayTitle,
		 LectureID, 
		 DayID) 
    SELECT * FROM (SELECT 
		TD.TimeTableID, 
		TD.ProgramSemesterSubjectID,	
		TD.SubjectTitle, 
		TD.LabID, 
		LT.LabNo,
		TD.DayTimeSlotID,
		ATS.SlotTitle, 
		ATS.Name,
		TD.LectureID, 
		TD.DayID 
		 FROM TimeTableDetailsTable TD
		INNER JOIN v_AllActiveTimeSlots ATS
		ON TD.DayTimeSlotID = ATS.DayTimeSlotID
		INNER JOIN LabTable LT
		ON TD.LabID = LT.LabID
		WHERE TD.DayID = 1 AND TD.LabID > 0) ALLSlots

    
	DECLARE @CountTotalDays int  = (SELECT COUNT(*) FROM DayTable Where IsActive = 1);
	DECLARE @AllDays Table (RowNo int, DayID int, DayTitle nvarchar(150))
	INSERT INTO @AllDays(RowNo, DayID, DayTitle) Select ROW_NUMBER() over (Order By(Select 1)), DayID, Name From DayTable where IsActive = 1
	
	DECLARE @GETTimeTableOneByOne int = 1;
	WHILE @GETTimeTableOneByOne <= @CountTotalDays
	BEGIN
		DECLARE @DayTimeTableTitle NVARCHAR(200) = (SELECT TOP 1 DayTitle FROM @AllDays WHERE RowNo = @GETTimeTableOneByOne)
		DECLARE @DayTimeTable Table( [TimeTableID] int,
										 [DayTitle] nvarchar(300),
										 [LabRoomTitle] nvarchar(300),
										 [Slot1] nvarchar(300),
										 [Slot2] nvarchar(300),
									     [Slot3] nvarchar(300),
										 [Slot4] nvarchar(300),
										 [Slot5] nvarchar(300)
										 )
    
		
		DECLARE @DayID int = (Select Top 1 DayID FROM @AllDays WHERE RowNo = @GETTimeTableOneByOne)
		DECLARE @DayTitle nvarchar(100) = (Select Top 1 DayTitle FROM @AllDays WHERE RowNo = @GETTimeTableOneByOne)

		
		--Clear Table
		DELETE FROM @DayTimeTable;

		--Getting Room Time Slot
		DECLARE @RoomTimeSlotTimeTable Table(RowNo int, SlotTitle nvarchar(200))
		--Clear Table
		DELETE FROM @RoomTimeSlotTimeTable;

		INSERT INTO @RoomTimeSlotTimeTable(RowNo,SlotTitle)  SELECT ROW_NUMBER() OVER (ORDER BY (SELECT 1)),RoomNo FROM (Select RoomID, RoomNo from @AllRoomsSlots Group By RoomID, RoomNo) AR
		
		--Getting Lab Time Slot
		DECLARE @LabTimeSlotTimeTable Table(RowNo int, SlotTitle nvarchar(200))
		--Clear Table
		DELETE FROM @LabTimeSlotTimeTable;

		INSERT INTO @LabTimeSlotTimeTable(RowNo,SlotTitle)  SELECT ROW_NUMBER() OVER (ORDER BY (SELECT 1)),LabNo FROM (Select LabNo from @AllLabsSlots Group By  LabNo) LR
		

		
		DECLARE @CountTotalRooms INT = (SELECT COUNT(*) FROM @RoomTimeSlotTimeTable);

		DECLARE @CreateRoomSlotOneByOne INT = 1;
		WHILE @CreateRoomSlotOneByOne <= @CountTotalRooms
		BEGIN
			DECLARE @TIMETITLE NVARCHAR(200) = (SELECT TOP 1 SlotTitle FROM @RoomTimeSlotTimeTable WHERE RowNo = @CreateRoomSlotOneByOne);
			INSERT INTO @DayTimeTable([TimeTableID],[DayTitle],[LabRoomTitle],[Slot1],[Slot2],[Slot3],[Slot4],[Slot5])
			VALUES(0,@DayTitle,@TIMETITLE,'Break','Break','Break','Break','Break')
			SET @CreateRoomSlotOneByOne = @CreateRoomSlotOneByOne + 1;
		END


		DECLARE @CountTotalLabs INT = (SELECT COUNT(*) FROM @LabTimeSlotTimeTable);

		DECLARE @CreateLabSlotOneByOne INT = 1;
		WHILE @CreateLabSlotOneByOne <= @CountTotalLabs
		BEGIN
			DECLARE @TIMETITLETITLE NVARCHAR(200) = (SELECT TOP 1 SlotTitle FROM @LabTimeSlotTimeTable WHERE RowNo = @CreateLabSlotOneByOne);
			INSERT INTO @DayTimeTable([TimeTableID],[DayTitle],[LabRoomTitle],[Slot1],[Slot2],[Slot3],[Slot4],[Slot5])
			VALUES(0,@DayTitle,@TIMETITLETITLE,'Break','Break','Break','Break','Break')
			SET @CreateLabSlotOneByOne = @CreateLabSlotOneByOne + 1;
		END

		
		-- Print Time Table Slots
		-- SELECT * FROM @DayTimeTable

	
		 DECLARE @DayTimeTableDetails Table(
									   RowNo int,
									   TimeTableID int,
									   ProgramSemesterSubjectID int, 
									   SubjectTitle nvarchar(400), 
									   RoomID int, 
									   LabID int, 
									   DayTimeSlotID int, 
									   SlotTitle nvarchar(200), 
									   DayTitle nvarchar(80), 
									   LectureID int, 
									   DayID int, 
									   IsActive bit);

         --Clear Table
		 DELETE FROM @DayTimeTableDetails;
		 -- Getting Semester Wise Subject
		 INSERT INTO @DayTimeTableDetails (
		                               RowNo, 
									   TimeTableID,
									   ProgramSemesterSubjectID, 
									   SubjectTitle, 
									   RoomID, 
									   LabID, 
									   DayTimeSlotID, 
									   SlotTitle,
									   DayTitle,
									   LectureID, 
									   DayID, 
									   IsActive)
		                         SELECT 
									   ROW_NUMBER() over(order by(Select 1)),
									   TTD.TimeTableID,
									   TTD.ProgramSemesterSubjectID, 
									   TTD.SubjectTitle, 
									   TTD.RoomID, 
									   TTD.LabID, 
									   TTD.DayTimeSlotID,
									   TTD.SlotTitle, 
									   TTD.Name,
									   TTD.LectureID, 
									   TTD.DayID, 
									   TTD.IsActive
									   FROM 
											(SELECT 
											TD.TimeTableID,
											TD.ProgramSemesterSubjectID, 
											TD.SubjectTitle, 
											TD.RoomID, 
											TD.LabID, 
											TD.DayTimeSlotID,
											ATS.SlotTitle, 
											ATS.Name,
											TD.LectureID, 
											TD.DayID, 
											TD.IsActive
											 FROM TimeTableDetailsTable TD
											INNER JOIN v_AllActiveTimeSlots ATS
											ON TD.DayTimeSlotID = ATS.DayTimeSlotID) TTD 
									   WHERE TTD.DayID = @DayID Order By DayTimeSlotID
			-- Print SELECT Semester Class 
			--SELECT * FROM @SemesterTimeTableDetails
			--DECLARE @TimeTableID int = (SELECT TOP 1 TimeTableID FROM @DayTimeTableDetails);
			DECLARE @TimeTableID int = @GETTimeTableOneByOne;
			UPDATE @DayTimeTable SET TimeTableID = @TimeTableID;

			DECLARE @LocationTitleTimeTable NVARCHAR(200);
			DECLARE @SemsterTitleTimeTable NVARCHAR(200);
			DECLARE @SubjectTitleTimeTable NVARCHAR(200);
			DECLARE @CountTimeSlotTimeTable int = (SELECT Count(*) FROM @DayTimeTableDetails);
			DECLARE @AddOnebyOne int  = 1;
			WHILE @AddOnebyOne <= @CountTimeSlotTimeTable
			BEGIN
			    DECLARE @GETProgramSemesterSubjectID int  = (SELECT Top 1 ProgramSemesterSubjectID FROM @DayTimeTableDetails WHERE RowNo = @AddOnebyOne AND IsActive = 1);
			    IF @GETProgramSemesterSubjectID > 0
				BEGIN

				SET @SubjectTitleTimeTable = (SELECT TOP 1 SubjectTitle FROM @DayTimeTableDetails WHERE  RowNo = @AddOnebyOne AND IsActive = 1);
			    DECLARE @GETRoomID int  = (SELECT Top 1 RoomID FROM @DayTimeTableDetails WHERE RowNo = @AddOnebyOne AND IsActive = 1);
			    DECLARE @GETLabID int  = (SELECT Top 1 LabID FROM @DayTimeTableDetails WHERE RowNo = @AddOnebyOne AND IsActive = 1);
			    
				DECLARE @GETRoomNo Nvarchar(100)  = (SELECT Top 1 RoomNo FROM RoomTable WHERE RoomID = @GETRoomID);
			    DECLARE @GETLabNo Nvarchar(100)  = (SELECT Top 1 LabNo FROM LabTable WHERE LabID = @GETLabID);
			    DECLARE @LRTitle NVARCHAR(300);
					IF @GETRoomID > 0
					BEGIN
						SET @LRTitle = @GETRoomNo;
					END
					ELSE
						SET @LRTitle = @GETLabNo;
					END
			    DECLARE @GETDayTimeSlotID int  = (SELECT Top 1 DayTimeSlotID FROM @DayTimeTableDetails WHERE RowNo = @AddOnebyOne AND IsActive = 1);
			    
				DECLARE @GETLectureID int  = (SELECT Top 1 LectureID FROM @DayTimeTableDetails WHERE RowNo = @AddOnebyOne AND IsActive = 1);
			    DECLARE @GETTimeSlotName nvarchar(200)  = (SELECT Top 1 SlotTitle FROM @DayTimeTableDetails WHERE RowNo = @AddOnebyOne AND IsActive = 1);
			    DECLARE @GETDayTitle nvarchar(100)  = (SELECT Top 1 DayTitle FROM @DayTimeTableDetails WHERE RowNo = @AddOnebyOne AND IsActive = 1);
					IF @GETRoomID > 0
					BEGIN
						SET @LocationTitleTimeTable = (Select TOP 1 RoomNo From RoomTable WHERE RoomID = @GETRoomID)
					END
					IF @GETLabID > 0
					BEGIN
						SET @LocationTitleTimeTable = (Select TOP 1 LabNo From LabTable WHERE LabID = @GETLabID)
					END
					
					SET @SubjectTitleTimeTable = @SubjectTitleTimeTable + '(' + @LocationTitleTimeTable + ')';

					DECLARE @Time_SlotTitle Nvarchar(100) = (SELECT TOP 1 SlotTitle FROM DayTimeSlotTable WHERE DayTimeSlotID = @GETDayTimeSlotID)
					SET @Time_SlotTitle = REPLACE(@Time_SlotTitle,' ','_')
					SET @Time_SlotTitle = REPLACE(@Time_SlotTitle,':','_')
					IF @Time_SlotTitle = '09_30_AM-11_00_AM'
					BEGIN
						UPDATE @DayTimeTable SET Slot1 =  @SubjectTitleTimeTable WHERE [LabRoomTitle]  = @LRTitle
					END
					ELSE IF @Time_SlotTitle = '11_00_AM-12_30_PM'
					BEGIN
						UPDATE @DayTimeTable SET Slot2 =  @SubjectTitleTimeTable WHERE [LabRoomTitle]  = @LRTitle
					END
					ELSE IF @Time_SlotTitle = '12_30_PM-02_00_PM'
					BEGIN
						UPDATE @DayTimeTable SET Slot3 =  @SubjectTitleTimeTable WHERE [LabRoomTitle]  = @LRTitle
					END
					ELSE IF @Time_SlotTitle = '02_00_PM-03_30_PM'
					BEGIN
						UPDATE @DayTimeTable SET Slot4 =  @SubjectTitleTimeTable WHERE [LabRoomTitle]  = @LRTitle
					END
					ELSE IF @Time_SlotTitle = '03_30_PM-05_00_PM'
					BEGIN
						UPDATE @DayTimeTable SET Slot5 =  @SubjectTitleTimeTable WHERE [LabRoomTitle]  = @LRTitle
					END
				
				 SET @AddOnebyOne = @AddOnebyOne + 1;
				END	
			SET @GETTimeTableOneByOne = @GETTimeTableOneByOne + 1;
	        
			INSERT INTO @AllDaysTimeTable([TimeTableID],[DayTitle],[LabRoomTitle],[Slot1],[Slot2],[Slot3],[Slot4],[Slot5])
			SELECT [TimeTableID],[DayTitle],[LabRoomTitle],[Slot1],[Slot2],[Slot3],[Slot4],[Slot5] FROM @DayTimeTable
	 END
	  SELECT * FROM @AllDaysTimeTable
			
END


GO
/****** Object:  StoredProcedure [dbo].[sp_PrintAllTimeTablesOneByOne]    Script Date: 14/06/2020 9:40:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_PrintAllTimeTablesOneByOne]
AS
BEGIN
	DECLARE @AllSemesterTimeTable Table( [TimeTableID] int,
										 [SEMESTER] nvarchar(300),
										 [TIME] nvarchar(300),
										 [MONDAY] nvarchar(300),
										 [TUESDAY] nvarchar(300),
									     [WEDNESDAY] nvarchar(300),
										 [THURSDAY] nvarchar(300),
										 [FRIDAY] nvarchar(300),
										 [SATURDAY] nvarchar(300),
										 [SUNDAY] nvarchar(300))


    DECLARE @CountTotalSemester int  = (SELECT COUNT(*) FROM TimeTblTable);
	DECLARE @GETTimeTableOneByOne int = 1;
	WHILE @GETTimeTableOneByOne <= @CountTotalSemester
	BEGIN
		DECLARE @SemesterTimeTableTitle NVARCHAR(200) = (SELECT TOP 1 TimeTableTitle FROM TimeTblTable WHERE TimeTableID = @GETTimeTableOneByOne)
		DECLARE @SemesterTimeTable Table([TimeTableID] int,
										 [SEMESTER] nvarchar(300),
										 [TIME] nvarchar(300),
										 [MONDAY] nvarchar(300),
										 [TUESDAY] nvarchar(300),
									     [WEDNESDAY] nvarchar(300),
										 [THURSDAY] nvarchar(300),
										 [FRIDAY] nvarchar(300),
										 [SATURDAY] nvarchar(300),
										 [SUNDAY] nvarchar(300))
        --Clear Table
		DELETE FROM @SemesterTimeTable;

		DECLARE @TimeSlotTimeTable Table(RowNo int, SlotTitle nvarchar(200))
		--Clear Table
		DELETE FROM @TimeSlotTimeTable;

		INSERT INTO @TimeSlotTimeTable(RowNo,SlotTitle)  SELECT ROW_NUMBER() OVER (ORDER BY (SELECT 1)),SlotTitle FROM (Select SlotTitle, StartTime ,EndTime from DayTimeSlotTable WHERE ISActive  = 1 Group By SlotTitle, StartTime ,EndTime) DTST ORDER BY StartTime
		DECLARE @COUNTTIMEROWSTIMETABLE INT = (SELECT COUNT(*) FROM @TimeSlotTimeTable);
		DECLARE @CREATESLOTSVARIABLE INT = 1;
		WHILE @CREATESLOTSVARIABLE <= @COUNTTIMEROWSTIMETABLE
		BEGIN
			DECLARE @TIMETITLE NVARCHAR(200) = (SELECT TOP 1 SlotTitle FROM @TimeSlotTimeTable WHERE RowNo = @CREATESLOTSVARIABLE);
			INSERT INTO @SemesterTimeTable([TimeTableID],[TIME],[MONDAY],[TUESDAY],[WEDNESDAY],[THURSDAY],[FRIDAY],[SATURDAY],[SUNDAY])
			VALUES(0,@TIMETITLE,'Break','Break','Break','Break','Break','Break','Break')
			SET @CREATESLOTSVARIABLE = @CREATESLOTSVARIABLE + 1;
		END

		-- Print Time Table Slots
		--SELECT * FROM @SemesterTimeTable

		DECLARE @SemesterTimeTableDetails Table(
									   RowNo int,
									   TimeTableID int,
									   ProgramSemesterSubjectID int, 
									   SubjectTitle nvarchar(400), 
									   RoomID int, 
									   LabID int, 
									   DayTimeSlotID int, 
									   SlotTitle nvarchar(200), 
									   DayTitle nvarchar(80), 
									   LectureID int, 
									   DayID int, 
									   IsActive bit);

         --Clear Table
		 DELETE FROM @SemesterTimeTableDetails;
		 -- Getting Semester Wise Subject
		 INSERT INTO @SemesterTimeTableDetails (
		                               RowNo, 
									   TimeTableID,
									   ProgramSemesterSubjectID, 
									   SubjectTitle, 
									   RoomID, 
									   LabID, 
									   DayTimeSlotID, 
									   SlotTitle,
									   DayTitle,
									   LectureID, 
									   DayID, 
									   IsActive)
		                         SELECT 
									   ROW_NUMBER() over(order by(Select 1)),
									   TTD.TimeTableID,
									   TTD.ProgramSemesterSubjectID, 
									   TTD.SubjectTitle, 
									   TTD.RoomID, 
									   TTD.LabID, 
									   TTD.DayTimeSlotID,
									   TTD.SlotTitle, 
									   TTD.Name,
									   TTD.LectureID, 
									   TTD.DayID, 
									   TTD.IsActive
									   FROM 
											(SELECT 
											TD.TimeTableID,
											TD.ProgramSemesterSubjectID, 
											TD.SubjectTitle, 
											TD.RoomID, 
											TD.LabID, 
											TD.DayTimeSlotID,
											ATS.SlotTitle, 
											ATS.Name,
											TD.LectureID, 
											TD.DayID, 
											TD.IsActive
											 FROM TimeTableDetailsTable TD
											INNER JOIN v_AllActiveTimeSlots ATS
											ON TD.DayTimeSlotID = ATS.DayTimeSlotID) TTD 
									   WHERE TTD.TimeTableID = @GETTimeTableOneByOne Order By DayTimeSlotID
			-- Print SELECT Semester Class 
			--SELECT * FROM @SemesterTimeTableDetails
			DECLARE @TimeTableID int = (SELECT TOP 1 TimeTableID FROM @SemesterTimeTableDetails);
			UPDATE @SemesterTimeTable SET TimeTableID = @TimeTableID;

			DECLARE @LocationTitleTimeTable NVARCHAR(200);
			DECLARE @SemsterTitleTimeTable NVARCHAR(200);
			DECLARE @SubjectTitleTimeTable NVARCHAR(200);
			DECLARE @CountTimeSlotTimeTable int = (SELECT Count(*) FROM @SemesterTimeTableDetails);
			DECLARE @AddOnebyOne int  = 1;
			WHILE @AddOnebyOne <= @CountTimeSlotTimeTable
			BEGIN
			    DECLARE @GETProgramSemesterSubjectID int  = (SELECT Top 1 ProgramSemesterSubjectID FROM @SemesterTimeTableDetails WHERE RowNo = @AddOnebyOne AND IsActive = 1);
			    IF @GETProgramSemesterSubjectID > 0
				BEGIN
				SET @SubjectTitleTimeTable = (SELECT TOP 1 SSTitle FROM ProgramSemesterSubjectTable WHERE ProgramSemesterSubjectID = @GETProgramSemesterSubjectID);
			    DECLARE @GETRoomID int  = (SELECT Top 1 RoomID FROM @SemesterTimeTableDetails WHERE RowNo = @AddOnebyOne AND IsActive = 1);
			    DECLARE @GETLabID int  = (SELECT Top 1 LabID FROM @SemesterTimeTableDetails WHERE RowNo = @AddOnebyOne AND IsActive = 1);
			    DECLARE @GETDayTimeSlotID int  = (SELECT Top 1 DayTimeSlotID FROM @SemesterTimeTableDetails WHERE RowNo = @AddOnebyOne AND IsActive = 1);
			    DECLARE @GETLectureID int  = (SELECT Top 1 LectureID FROM @SemesterTimeTableDetails WHERE RowNo = @AddOnebyOne AND IsActive = 1);
			    DECLARE @GETTimeSlotName nvarchar(200)  = (SELECT Top 1 SlotTitle FROM @SemesterTimeTableDetails WHERE RowNo = @AddOnebyOne AND IsActive = 1);
			    DECLARE @GETDayTitle nvarchar(100)  = (SELECT Top 1 DayTitle FROM @SemesterTimeTableDetails WHERE RowNo = @AddOnebyOne AND IsActive = 1);
					IF @GETRoomID > 0
					BEGIN
						SET @LocationTitleTimeTable = (Select TOP 1 RoomNo From RoomTable WHERE RoomID = @GETRoomID)
					END
					IF @GETLabID > 0
					BEGIN
						SET @LocationTitleTimeTable = (Select TOP 1 LabNo From LabTable WHERE LabID = @GETLabID)
					END
					
					SET @SubjectTitleTimeTable = @SubjectTitleTimeTable + ' \ ' + @LocationTitleTimeTable;

					IF @GETDayTitle = 'MONDAY'
					BEGIN
						UPDATE @SemesterTimeTable SET MONDAY =  @SubjectTitleTimeTable,SEMESTER = @SemesterTimeTableTitle WHERE [TIME]  = @GETTimeSlotName
					END
					ELSE IF @GETDayTitle = 'TUESDAY'
					BEGIN
						UPDATE @SemesterTimeTable SET TUESDAY =  @SubjectTitleTimeTable,SEMESTER = @SemesterTimeTableTitle WHERE [TIME]  = @GETTimeSlotName
					END
					ELSE IF @GETDayTitle = 'WEDNESDAY'
					BEGIN
						UPDATE @SemesterTimeTable SET WEDNESDAY =  @SubjectTitleTimeTable,SEMESTER = @SemesterTimeTableTitle WHERE [TIME]  = @GETTimeSlotName
					END
					ELSE IF @GETDayTitle = 'THURSDAY'
					BEGIN
						UPDATE @SemesterTimeTable SET THURSDAY =  @SubjectTitleTimeTable,SEMESTER = @SemesterTimeTableTitle WHERE [TIME]  = @GETTimeSlotName
					END
					ELSE IF @GETDayTitle = 'FRIDAY'
					BEGIN
						UPDATE @SemesterTimeTable SET FRIDAY =  @SubjectTitleTimeTable,SEMESTER = @SemesterTimeTableTitle WHERE [TIME]  = @GETTimeSlotName
					END
					ELSE IF @GETDayTitle = 'SATURDAY'
					BEGIN
						UPDATE @SemesterTimeTable SET SATURDAY =  @SubjectTitleTimeTable,SEMESTER = @SemesterTimeTableTitle WHERE [TIME]  = @GETTimeSlotName
					END
					ELSE IF @GETDayTitle = 'SUNDAY'
					BEGIN
						UPDATE @SemesterTimeTable SET SUNDAY =  @SubjectTitleTimeTable,SEMESTER = @SemesterTimeTableTitle WHERE [TIME]  = @GETTimeSlotName
					END
				END
			SET @AddOnebyOne = @AddOnebyOne + 1;
			END	
			SET @GETTimeTableOneByOne = @GETTimeTableOneByOne + 1;
	       INSERT INTO @AllSemesterTimeTable([TimeTableID],[SEMESTER],[TIME],[MONDAY],[TUESDAY],[WEDNESDAY],[THURSDAY],[FRIDAY],[SATURDAY],[SUNDAY])
								  SELECT [TimeTableID],[SEMESTER],[TIME],[MONDAY],[TUESDAY],[WEDNESDAY],[THURSDAY],[FRIDAY],[SATURDAY],[SUNDAY] FROM @SemesterTimeTable
	 END
	  SELECT * FROM @AllSemesterTimeTable
END
GO
/****** Object:  StoredProcedure [dbo].[sp_PrintTeacherWiseTimeTable]    Script Date: 14/06/2020 9:40:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_PrintTeacherWiseTimeTable]
AS
BEGIN
	DECLARE @AllTeacherTimeTable Table(		 [TEACHERID] INT,
										 [TEACHERNAME] nvarchar(300),
										 [TIME] nvarchar(300),
										 [MONDAY] nvarchar(300),
										 [TUESDAY] nvarchar(300),
									     [WEDNESDAY] nvarchar(300),
										 [THURSDAY] nvarchar(300),
										 [FRIDAY] nvarchar(300),
										 [SATURDAY] nvarchar(300),
										 [SUNDAY] nvarchar(300))


	
	DECLARE @AllTeachers Table(RowNo INT, LectureID INT,LectureName NVARCHAR(200));
	DELETE FROM @AllTeachers;
	INSERT INTO @AllTeachers(RowNo,LectureID,LectureName)
	 Select ROW_NUMBER() OVER (ORDER BY(SELECT 1)) RowNo,
			 TTD.LectureID,
			 TTD.FullName
			  FROM
			 (SELECT TD.LectureID,FullName FROM TimeTableDetailsTable TD 
			 INNER JOIN LectureTable LEC 
			 ON TD.LectureID = LEC.LectureID) TTD
			  WHERE TTD.LectureID > 0  GROUP BY TTD.LectureID, TTD.FullName

		      


    DECLARE @CountTotalTeacher int  = (SELECT COUNT(*) FROM @AllTeachers);

	DECLARE @GETTimeTableOneByOne int = 1;
	WHILE @GETTimeTableOneByOne <= @CountTotalTeacher
	BEGIN
		DECLARE @TeacherTimeTableTitle NVARCHAR(200) = (SELECT TOP 1 LectureName FROM @AllTeachers WHERE RowNo = @GETTimeTableOneByOne)
		DECLARE @TeacherTimeTable Table([TEACHERID] INT,
										 [TEACHERNAME] nvarchar(300),
										 [TIME] nvarchar(300),
										 [MONDAY] nvarchar(300),
										 [TUESDAY] nvarchar(300),
									     [WEDNESDAY] nvarchar(300),
										 [THURSDAY] nvarchar(300),
										 [FRIDAY] nvarchar(300),
										 [SATURDAY] nvarchar(300),
										 [SUNDAY] nvarchar(300))
        --Clear Table
		DELETE FROM @TeacherTimeTable;

		DECLARE @TimeSlotTimeTable Table(RowNo int, SlotTitle nvarchar(200))
		--Clear Table
		DELETE FROM @TimeSlotTimeTable;

		INSERT INTO @TimeSlotTimeTable(RowNo,SlotTitle)  SELECT ROW_NUMBER() OVER (ORDER BY (SELECT 1)),SlotTitle FROM (Select SlotTitle, StartTime ,EndTime from DayTimeSlotTable WHERE ISActive  = 1 Group By SlotTitle, StartTime ,EndTime) DTST ORDER BY StartTime
		DECLARE @COUNTTIMEROWSTIMETABLE INT = (SELECT COUNT(*) FROM @TimeSlotTimeTable);
		DECLARE @CREATESLOTSVARIABLE INT = 1;
		WHILE @CREATESLOTSVARIABLE <= @COUNTTIMEROWSTIMETABLE
		BEGIN
			DECLARE @TIMETITLE NVARCHAR(200) = (SELECT TOP 1 SlotTitle FROM @TimeSlotTimeTable WHERE RowNo = @CREATESLOTSVARIABLE);
			INSERT INTO @TeacherTimeTable([TEACHERID],[TEACHERNAME],[TIME],[MONDAY],[TUESDAY],[WEDNESDAY],[THURSDAY],[FRIDAY],[SATURDAY],[SUNDAY])
			VALUES(0,NULL,@TIMETITLE,'Break','Break','Break','Break','Break','Break','Break')
			SET @CREATESLOTSVARIABLE = @CREATESLOTSVARIABLE + 1;
		END

		-- Print Time Table Slots
		--SELECT * FROM @SemesterTimeTable

		DECLARE @TeacherTimeTableDetails Table(
									   RowNo int,
									   TimeTableID int,
									   ProgramSemesterSubjectID int, 
									   SubjectTitle nvarchar(400), 
									   RoomID int, 
									   LabID int, 
									   DayTimeSlotID int, 
									   SlotTitle nvarchar(200), 
									   DayTitle nvarchar(80), 
									   LectureID int,
									   LectureName NVARCHAR(200), 
									   DayID int, 
									   IsActive bit);

         --Clear Table
		 DELETE FROM @TeacherTimeTableDetails;
		 -- Getting Semester Wise Subject
		 INSERT INTO @TeacherTimeTableDetails (
		                               RowNo, 
									   TimeTableID,
									   ProgramSemesterSubjectID, 
									   SubjectTitle, 
									   RoomID, 
									   LabID, 
									   DayTimeSlotID, 
									   SlotTitle,
									   DayTitle,
									   LectureID, 
									   LectureName,
									   DayID, 
									   IsActive)
		                         SELECT 
									   ROW_NUMBER() over(order by(Select 1)),
									   TTD.TimeTableID,
									   TTD.ProgramSemesterSubjectID, 
									   TTD.SubjectTitle, 
									   TTD.RoomID, 
									   TTD.LabID, 
									   TTD.DayTimeSlotID,
									   TTD.SlotTitle, 
									   TTD.Name,
									   TTD.LectureID,
									   TTD.FullName, 
									   TTD.DayID, 
									   TTD.IsActive
									   FROM 
											(SELECT 
											TD.TimeTableID,
											TD.ProgramSemesterSubjectID, 
											TD.SubjectTitle, 
											TD.RoomID, 
											TD.LabID, 
											TD.DayTimeSlotID,
											ATS.SlotTitle, 
											ATS.Name,
											TD.LectureID,
											LEC.FullName, 
											TD.DayID, 
											TD.IsActive
											 FROM TimeTableDetailsTable TD
											INNER JOIN v_AllActiveTimeSlots ATS
											ON TD.DayTimeSlotID = ATS.DayTimeSlotID
											INNER JOIN LectureTable LEC 
											ON TD.LectureID = LEC.LectureID) TTD 
									   WHERE TTD.LectureID = @GETTimeTableOneByOne Order By DayTimeSlotID
			-- Print SELECT Semester Class 
			--SELECT * FROM @SemesterTimeTableDetails
			DECLARE @TeacherID INT = (SELECT TOP 1 LectureID FROM @TeacherTimeTableDetails);
			DECLARE @TeacherName NVARCHAR(200) = (SELECT TOP 1 LectureName FROM @TeacherTimeTableDetails);
			SET @TeacherName = @TeacherName + '- Time Table';
			UPDATE @TeacherTimeTable SET TEACHERID = @TeacherID, TEACHERNAME = @TeacherName;

			DECLARE @LocationTitleTimeTable NVARCHAR(200);
			DECLARE @SemsterTitleTimeTable NVARCHAR(200);
			DECLARE @SubjectTitleTimeTable NVARCHAR(200);
			DECLARE @CountTimeSlotTimeTable int = (SELECT Count(*) FROM @TeacherTimeTableDetails);
			DECLARE @AddOnebyOne int  = 1;
			WHILE @AddOnebyOne <= @CountTimeSlotTimeTable
			BEGIN
			    DECLARE @GETProgramSemesterSubjectID int  = (SELECT Top 1 ProgramSemesterSubjectID FROM @TeacherTimeTableDetails WHERE RowNo = @AddOnebyOne AND IsActive = 1);
			    IF @GETProgramSemesterSubjectID > 0
				BEGIN

				DECLARE @LectureSUBJECTID INT = (SELECT TOP 1 LectureSubjectID FROM ProgramSemesterSubjectTable WHERE ProgramSemesterSubjectID = @GETProgramSemesterSubjectID);
				SET @SubjectTitleTimeTable = (SELECT TOP 1 SubjectTitle FROM @TeacherTimeTableDetails WHERE RowNo = @AddOnebyOne AND IsActive = 1);
			    DECLARE @GETRoomID int  = (SELECT Top 1 RoomID FROM @TeacherTimeTableDetails WHERE RowNo = @AddOnebyOne AND IsActive = 1);
			    DECLARE @GETLabID int  = (SELECT Top 1 LabID FROM @TeacherTimeTableDetails WHERE RowNo = @AddOnebyOne AND IsActive = 1);
			    DECLARE @GETDayTimeSlotID int  = (SELECT Top 1 DayTimeSlotID FROM @TeacherTimeTableDetails WHERE RowNo = @AddOnebyOne AND IsActive = 1);
			    DECLARE @GETLectureID int  = (SELECT Top 1 LectureID FROM @TeacherTimeTableDetails WHERE RowNo = @AddOnebyOne AND IsActive = 1);
			    DECLARE @GETTimeSlotName nvarchar(200)  = (SELECT Top 1 SlotTitle FROM @TeacherTimeTableDetails WHERE RowNo = @AddOnebyOne AND IsActive = 1);
			    DECLARE @GETDayTitle nvarchar(100)  = (SELECT Top 1 DayTitle FROM @TeacherTimeTableDetails WHERE RowNo = @AddOnebyOne AND IsActive = 1);
					IF @GETRoomID > 0
					BEGIN
						SET @LocationTitleTimeTable = (Select TOP 1 RoomNo From RoomTable WHERE RoomID = @GETRoomID)
					END
					IF @GETLabID > 0
					BEGIN
						SET @LocationTitleTimeTable = (Select TOP 1 LabNo From LabTable WHERE LabID = @GETLabID)
					END
					
					SET @SubjectTitleTimeTable = @SubjectTitleTimeTable + ' \ ' + @LocationTitleTimeTable;

					IF @GETDayTitle = 'MONDAY'
					BEGIN
						UPDATE @TeacherTimeTable SET MONDAY =  @SubjectTitleTimeTable WHERE [TIME]  = @GETTimeSlotName
					END
					ELSE IF @GETDayTitle = 'TUESDAY'
					BEGIN
						UPDATE @TeacherTimeTable SET TUESDAY =  @SubjectTitleTimeTable WHERE [TIME]  = @GETTimeSlotName
					END
					ELSE IF @GETDayTitle = 'WEDNESDAY'
					BEGIN
						UPDATE @TeacherTimeTable SET WEDNESDAY =  @SubjectTitleTimeTable WHERE [TIME]  = @GETTimeSlotName
					END
					ELSE IF @GETDayTitle = 'THURSDAY'
					BEGIN
						UPDATE @TeacherTimeTable SET THURSDAY =  @SubjectTitleTimeTable WHERE [TIME]  = @GETTimeSlotName
					END
					ELSE IF @GETDayTitle = 'FRIDAY'
					BEGIN
						UPDATE @TeacherTimeTable SET FRIDAY =  @SubjectTitleTimeTable WHERE [TIME]  = @GETTimeSlotName
					END
					ELSE IF @GETDayTitle = 'SATURDAY'
					BEGIN
						UPDATE @TeacherTimeTable SET SATURDAY =  @SubjectTitleTimeTable WHERE [TIME]  = @GETTimeSlotName
					END
					ELSE IF @GETDayTitle = 'SUNDAY'
					BEGIN
						UPDATE @TeacherTimeTable SET SUNDAY =  @SubjectTitleTimeTable WHERE [TIME]  = @GETTimeSlotName
					END
				END
			SET @AddOnebyOne = @AddOnebyOne + 1;
			END	
			SET @GETTimeTableOneByOne = @GETTimeTableOneByOne + 1;
	       INSERT INTO @AllTeacherTimeTable([TEACHERID],[TEACHERNAME],[TIME],[MONDAY],[TUESDAY],[WEDNESDAY],[THURSDAY],[FRIDAY],[SATURDAY],[SUNDAY])
								  SELECT [TEACHERID],[TEACHERNAME],[TIME],[MONDAY],[TUESDAY],[WEDNESDAY],[THURSDAY],[FRIDAY],[SATURDAY],[SUNDAY] FROM @TeacherTimeTable
	 END
	  SELECT * FROM @AllTeacherTimeTable WHERE TEACHERNAME IS NOT NULL
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "DT"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DTS"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_AllActiveTimeSlots'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_AllActiveTimeSlots'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "SectionTable"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 187
               Right = 232
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "v_ProgramSemesterActiveList"
            Begin Extent = 
               Top = 17
               Left = 341
               Bottom = 197
               Right = 565
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 2370
         Width = 2475
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_AllSemesterSections'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_AllSemesterSections'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[46] 4[5] 2[13] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "AllSubjects"
            Begin Extent = 
               Top = 6
               Left = 270
               Bottom = 192
               Right = 503
            End
            DisplayFlags = 280
            TopColumn = 14
         End
         Begin Table = "RoomTypeTable"
            Begin Extent = 
               Top = 6
               Left = 541
               Bottom = 160
               Right = 711
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AllSemesters"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 232
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 30
         Width = 284
         Width = 2595
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 2370
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Outp' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_AllSemesterSectionSubjects'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'ut = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_AllSemesterSectionSubjects'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_AllSemesterSectionSubjects'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[49] 4[14] 2[21] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "v_ProgramSemesterActiveList"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 246
               Right = 262
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ProgramSemesterSubjectTable"
            Begin Extent = 
               Top = 6
               Left = 300
               Bottom = 232
               Right = 533
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "v_AllSubjectsTeachers"
            Begin Extent = 
               Top = 8
               Left = 606
               Bottom = 226
               Right = 784
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 20
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_AllSemestersSubjects'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_AllSemestersSubjects'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_AllSemestersSubjects'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[54] 4[5] 2[22] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "RoomTypeTable"
            Begin Extent = 
               Top = 39
               Left = 53
               Bottom = 171
               Right = 223
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CourseTable"
            Begin Extent = 
               Top = 0
               Left = 397
               Bottom = 207
               Right = 567
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_AllSubjects'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_AllSubjects'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[38] 4[5] 2[30] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "CourseTable"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 186
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "LectureSubjectTable"
            Begin Extent = 
               Top = 0
               Left = 295
               Bottom = 190
               Right = 472
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "LectureTable"
            Begin Extent = 
               Top = 0
               Left = 612
               Bottom = 174
               Right = 782
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_AllSubjectsTeachers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_AllSubjectsTeachers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "DayTable"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 164
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DayTimeSlotTable"
            Begin Extent = 
               Top = 0
               Left = 321
               Bottom = 183
               Right = 491
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_AllTimeSlots'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_AllTimeSlots'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[5] 2[17] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ProgramSemesterTable"
            Begin Extent = 
               Top = 12
               Left = 228
               Bottom = 202
               Right = 422
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ProgramTable"
            Begin Extent = 
               Top = 40
               Left = 9
               Bottom = 153
               Right = 179
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SemesterTable"
            Begin Extent = 
               Top = 7
               Left = 485
               Bottom = 153
               Right = 655
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SessionTable"
            Begin Extent = 
               Top = 23
               Left = 703
               Bottom = 136
               Right = 873
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 13
         Width = 284
         Width = 2670
         Width = 2445
         Width = 1590
         Width = 1500
         Width = 2175
         Width = 1950
         Width = 1500
         Width = 2595
         Width = 3210
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
  ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_ProgramSemesterActiveList'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'       GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_ProgramSemesterActiveList'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_ProgramSemesterActiveList'
GO
USE [master]
GO
ALTER DATABASE [AutoTimeTableDb] SET  READ_WRITE 
GO
