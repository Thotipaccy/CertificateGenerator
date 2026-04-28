-- Create Database
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'AUCA_DB')
BEGIN
    CREATE DATABASE AUCA_DB;
END
GO

USE AUCA_DB;
GO

-- Create Table
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CertificateOfAttendance]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[CertificateOfAttendance](
        [StudentName] [nvarchar](255) NULL,
        [BornDate] [datetime] NULL,
        [StudentID] [nvarchar](100) NOT NULL PRIMARY KEY,
        [StudiedFrom] [nvarchar](100) NULL,
        [StudiedTo] [nvarchar](100) NULL,
        [Year] [nvarchar](50) NULL,
        [Faculty] [nvarchar](255) NULL,
        [Major] [nvarchar](255) NULL,
        [AcademicYear] [nvarchar](100) NULL,
        [ApprovedBy] [nvarchar](255) NULL,
        [Comment] [nvarchar](max) NULL,
        [Status] [nvarchar](100) NULL
    ) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
END
GO

-- Insert Sample Data
IF NOT EXISTS (SELECT 1 FROM [dbo].[CertificateOfAttendance] WHERE StudentID = '2025SEN349')
BEGIN
    INSERT INTO [dbo].[CertificateOfAttendance] 
    (StudentName, BornDate, StudentID, StudiedFrom, StudiedTo, [Year], Faculty, Major, AcademicYear, ApprovedBy, Status)
    VALUES 
    ('Tuyizere Dieudonne', '2006-06-12', '2025SEN349', 'January 2026', 'Date', 'One', 'Information Technology', 'Software Engineering', '2025-2026', 'Eng. Nsengiyumva Juvenal', 'Active'),
    ('Alice Mutoni', '2005-08-20', '2025BIT112', 'September 2025', 'Date', 'Two', 'Business Administration', 'Accounting', '2025-2026', 'Eng. Nsengiyumva Juvenal', 'Active'),
    ('John Doe', '2004-12-15', '2024BIT005', 'September 2024', 'August 2025', 'Graduated', 'Information Technology', 'Network Security', '2024-2025', 'Eng. Nsengiyumva Juvenal', 'Completed');
END
GO
