# AUCA Certificate Generator - Database Configuration Guide

This guide provides step-by-step instructions on how to set up the SQL Server database for the Certificate Generator application.

## Prerequisites
- Microsoft SQL Server (2016 or later)
- SQL Server Management Studio (SSMS)

---

## Step 1: Execute the Database Setup Script
Open SQL Server Management Studio, connect to your database instance, and execute the following SQL script to create the database, tables, and seed initial student records:

```sql
-- 1. Create the Database
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'AUCA_DB')
BEGIN
    CREATE DATABASE AUCA_DB;
END
GO

USE AUCA_DB;
GO

-- 2. Create the CertificateOfAttendance Table
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

-- 3. Insert Sample Academic Records
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
```

---

## Step 2: Configure the Connection String
Update the connection string in the `Web.config` file to point to your local SQL Server instance:

1. Open `Web.config` in the root of the project.
2. Locate the `<connectionStrings>` tag.
3. Update the `connectionString` attribute of the `DefaultConnection` element:

```xml
<connectionStrings>
  <add name="DefaultConnection" 
       connectionString="Data Source=YOUR_SERVER_NAME;Initial Catalog=AUCA_DB;Integrated Security=True;TrustServerCertificate=True" 
       providerName="System.Data.SqlClient" />
</connectionStrings>
```
*Note: Replace `YOUR_SERVER_NAME` with your actual SQL Server host/instance name (e.g., `(localdb)\MSSQLLocalDB` or `DESKTOP-K0H6TJ3\SQLEXPRESS`).*

---

## Database Fields Description

| Column Name | Data Type | Description |
| :--- | :--- | :--- |
| **StudentID** | `nvarchar(100)` | Unique Student ID (Primary Key) |
| **StudentName** | `nvarchar(255)` | Student's full name |
| **BornDate** | `datetime` | Student's date of birth |
| **StudiedFrom** | `nvarchar(100)` | Start date of studies (Month & Year) |
| **StudiedTo** | `nvarchar(100)` | End date of studies (or 'Date' if ongoing) |
| **Year** | `nvarchar(50)` | Current academic year level (e.g., One, Two) |
| **Faculty** | `nvarchar(255)` | Faculty name |
| **Major** | `nvarchar(255)` | Student's academic major |
| **AcademicYear** | `nvarchar(100)` | Range of academic years enrolled |
| **ApprovedBy** | `nvarchar(255)` | Officer signing the certificate |
| **Status** | `nvarchar(100)` | Enrolment status (Active, Completed, etc.) |
| **Comment** | `nvarchar(max)` | Administrative footnotes/comments |
