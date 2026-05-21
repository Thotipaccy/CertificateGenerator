# AUCA Academic Certificate Generator & Verification System

An enterprise-grade, high-fidelity ASP.NET Web Forms application designed for the **Adventist University of Central Africa (AUCA)** to manage student academic records, generate pixel-perfect **Certificates of Good Standing**, and offer seamless mobile QR-code verification.

This project was refined to fulfill strict academic standards, matching the layout, dimensions, typography, and styling of the official AUCA Word template down to the letter, while introducing a modern verification gateway.

---

## 🌟 Key Features

### 1. High-Fidelity Certificate Generation
*   **Exact Font Preservation**: Built with `Times New Roman` (12pt default) as the core document body font and `Edwardian Script ITC` (24pt) for the Directorate headers, backed up by Google Fonts `Pinyon Script` for cross-platform rendering compatibility.
*   **Layout Compliance**: Configured to standard **Letter size (8.5in x 11in)** with correct margin bounds (`top: 0.31in, left/right/bottom: 1in`).
*   **No Faux Double Borders**: Replaced outdated box frames with a clean, borderless container matching the authentic document layout.
*   **Correct Alignment**: Swapped the bottom signature block to the **left** side and the verification QR code block to the **right** side.
*   **Consistent Formatting**: Ensures labels (e.g. `Year:`, `Faculty:`, `Academic year:`) remain in standard weight, while student credentials and database values are emphasized in **bold**.

### 2. Intelligent Data Entry (Month-Year Pickers)
*   Equipped with specialized HTML5 month inputs (`TextMode="Month"`) in the management dashboard for `Studied From` and `Studied To` fields.
*   Prevents full-date clutter by restricting user entry to **Month & Year** (e.g., *January 2026*).
*   Handles active students seamlessly—if `Studied To` is left empty, the system automatically marks it as "**Date**" in the database and certificate printout.

### 3. Public Mobile QR-Code Verification System
*   **The Localhost Redirection Problem**: Standard local developments generate QR links pointing to `localhost` or local IPs, making them unscannable by mobile phones on external cellular networks.
*   **The Solution**: The system generates a public URL pointing to a static, serverless verification landing page:
    `https://thotipaccy.github.io/CertificateGenerator/verify.html`
*   **State Transmission**: Certificate data (Student ID, Name, Date of Birth, Faculty, Major, Study Period, Validity, and Academic Year) is safely encoded as query parameters in the QR code.
*   **Verification Gate**: When scanned by a smartphone, it loads a beautiful, responsive, secure portal showing an official verification badge with authentic student records, guaranteeing document integrity without requiring public API database exposures.

---

## 🛠️ Technology Stack
*   **Core Framework**: ASP.NET Web Forms (C# / .NET Framework 4.7.2)
*   **Database Engine**: Microsoft SQL Server (T-SQL)
*   **Design & Styling**: Pure Vanilla CSS3 (Custom Design System, No Bloated Frameworks)
*   **Verification Client**: HTML5, Vanilla JavaScript, CSS3 Grid, SVG Animations
*   **External API**: QR Code API Integration (`qrserver.com`)

---

## 📋 Directory Structure

*   `Default.aspx` / `Site.Master`: Application main landing and navigation shell.
*   `Certificates.aspx`: Manage and search the database table of generated student certificates.
*   `StudentForm.aspx`: Form interface to add or edit student details, with custom month inputs.
*   `ViewCertificate.aspx`: High-fidelity print-optimized certificate matching the official template.
*   `verify.html`: Responsive mobile verification portal hosted publicly on GitHub Pages.
*   `SetupDatabase.sql`: Database creation and sample record seeding script.
*   `DatabaseGuide.md`: Detailed setup instructions for SQL database and connection string setups.

---

## ⚙️ Setting Up the System

### 1. Configure the SQL Server Database
1.  Open **SQL Server Management Studio (SSMS)**.
2.  Open and run the `SetupDatabase.sql` file. This creates the `AUCA_DB` database, the `CertificateOfAttendance` table, and seeds three test records.
3.  For alternative approaches and column descriptions, see [DatabaseGuide.md](file:///c:/Users/THOTI/Desktop/Auca%20notes/Dot%20Net/CertificateGenerator/DatabaseGuide.md).

### 2. Update Web.config Connection Details
Open `Web.config` in the project root folder and change the connection string to match your local SQL Server instance:
```xml
<connectionStrings>
  <add name="DefaultConnection" 
       connectionString="Data Source=YOUR_SQL_SERVER_INSTANCE;Initial Catalog=AUCA_DB;Integrated Security=True;TrustServerCertificate=True" 
       providerName="System.Data.SqlClient" />
</connectionStrings>
```

### 3. Build and Run in Visual Studio
1.  Double-click the `CertificateGenerator.slnx` (or `CertificateGenerator.csproj`) to open the solution in Visual Studio.
2.  Restore NuGet packages if prompted.
3.  Press **F5** or click **Start (IIS Express)** to launch the portal.

---

## 🖨️ Printing & Exporting Instructions
For optimal printing directly from the web browser:
1.  Open any student certificate using the **[Generate]** button on the dashboard.
2.  Click the blue **Print Certificate** button.
3.  In the browser Print dialog:
    *   **Destination**: Save as PDF or select your printer.
    *   **Layout**: Portrait.
    *   **Paper Size**: Letter.
    *   **Margins**: None (our CSS handles A4/Letter margins natively).
    *   **Headers & Footers**: Uncheck/Disable.
    *   **Background Graphics**: Check/Enable.

---

*Refined with academic excellence for the Adventist University of Central Africa (AUCA).*
