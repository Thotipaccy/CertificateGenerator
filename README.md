# AUCA Certificate Generator

A professional web application built for the **Adventist University of Central Africa (AUCA)** to manage and generate official **Certificates of Good Standing**.

## 🚀 Features

- **Student Management Dashboard**: Search, add, edit, and delete student records from a centralized SQL Server database.
- **Official Certificate Generation**: Renders professional, academic certificates with university branding and director signatures.
- **Digital Verification (QR Code)**: Each certificate features a dynamic QR code that links to the digital version for instant authenticity verification.
- **Print Optimization**: Strict CSS rules ensure every certificate fits perfectly on a single A4 page with high-fidelity alignment.
- **Premium UI/UX**: Built with a custom Vanilla CSS design system (no Bootstrap) for a high-end, responsive professional aesthetic.
- **Smart Data Entry**: Includes specialized month-year pickers for academic date tracking.

## 🛠️ Technology Stack

- **Backend**: ASP.NET Web Forms (C# / .NET Framework 4.7.2)
- **Database**: SQL Server (T-SQL)
- **Frontend**: HTML5, Vanilla CSS3, JavaScript
- **API Integration**: QR Code Generation API (qrserver.com)

## 📋 Prerequisites

- **Visual Studio 2019/2022** with ASP.NET development workload.
- **SQL Server / SQL Server Express**.
- **IIS Express** (included with Visual Studio).

## ⚙️ Setup Instructions

1. **Database Setup**:
   - Execute the `SetupDatabase.sql` script in your SQL Server Management Studio (SSMS) to create the `AUCA_DB` and necessary tables.

2. **Configuration**:
   - Open `Web.config`.
   - Update the `DefaultConnection` connection string with your SQL Server instance details.
   - (Optional) Update the `DomainName` appSetting if you wish to test QR code redirection on a local network.

3. **Build & Run**:
   - Open the solution in Visual Studio.
   - Press `F5` or click **Start** to run the application.

## 📄 License

Internal Use Only - Adventist University of Central Africa.

---
*Developed with excellence for the AUCA Registrar's Office.*
