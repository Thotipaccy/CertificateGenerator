<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewCertificate.aspx.cs" Inherits="CertificateGenerator.ViewCertificate" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Certificate of Good Standing</title>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=Roboto:wght@300;400;700&display=swap" rel="stylesheet" />
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
        }

        .certificate-container {
            width: 210mm;
            height: 297mm;
            padding: 15mm 20mm;
            margin: 20px auto;
            background-color: #fff;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
            position: relative;
            box-sizing: border-box;
            border: 10px double #1a237e;
            display: flex;
            flex-direction: column;
        }

        .header-image {
            width: 100%;
            max-height: 120px;
            object-fit: contain;
            margin-bottom: 10px;
        }

        .certificate-header {
            text-align: center;
            margin-bottom: 20px;
        }

        .directorate {
            font-size: 14pt;
            font-weight: bold;
            color: #1a237e;
            margin-top: 5px;
        }

        .contact-info {
            font-size: 9pt;
            color: #555;
            border-bottom: 2px solid #1a237e;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }

        .date-location {
            text-align: left;
            margin-bottom: 20px;
            font-size: 11pt;
        }

        .certificate-title {
            text-align: center;
            font-family: 'Playfair Display', serif;
            font-size: 24pt;
            text-decoration: underline;
            margin: 20px 0;
            font-weight: 700;
            color: #1a237e;
            text-transform: uppercase;
        }

        .certificate-body {
            font-size: 12pt;
            line-height: 1.6;
            text-align: justify;
            flex-grow: 1;
        }

        .student-details {
            margin-top: 15px;
            margin-left: 30px;
        }

        .detail-item {
            font-weight: bold;
            margin-bottom: 8px;
        }

        .bottom-section {
            display: flex;
            justify-content: space-between;
            align-items: flex-end;
            margin-top: 20px;
        }

        .qr-code {
            text-align: center;
            font-size: 8pt;
        }

        .qr-code img {
            width: 90px;
            height: 90px;
            margin-bottom: 5px;
        }

        .signature-section {
            text-align: center;
            width: 320px;
        }

        .signature-image {
            max-width: 180px;
            height: auto;
            margin-bottom: -5px; /* Reduced negative margin to avoid hiding the name */
            position: relative;
            z-index: 2;
        }

        .signature-line {
            border-top: 1px solid #000;
            padding-top: 5px;
            font-size: 11pt;
        }

        @media print {
            @page {
                size: A4;
                margin: 0;
            }
            body {
                background-color: #fff;
            }
            .certificate-container {
                margin: 0;
                box-shadow: none;
                border: 10px double #1a237e !important;
                height: 297mm;
                width: 210mm;
                -webkit-print-color-adjust: exact;
                print-color-adjust: exact;
            }
            .no-print {
                display: none;
            }
        }

        .no-print {
            text-align: center;
            margin: 20px;
        }

        .btn-print {
            padding: 10px 25px;
            background-color: #1a237e;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            transition: background 0.3s;
        }
        
        .btn-print:hover {
            background-color: #0d1240;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="no-print">
            <button type="button" class="btn-print" onclick="window.print();">Print Certificate</button>
            <a href="Certificates.aspx" class="btn btn-link" style="margin-left: 10px;">Back to List</a>
        </div>

        <div class="certificate-container">
            <img src="Content/Images/header.png" class="header-image" alt="AUCA Header" />
            
            <div class="certificate-header">
                <div class="directorate">Directorate for Admissions and Academic Records</div>
                <div class="contact-info">
                    Mobile Phone: (+250) 724 796 996 / 724 474 805 / 788 473 035<br />
                    Email: registrar@auca.ac.rw, || juvenal.nsengiyumva@auca.ac.rw
                </div>
            </div>

            <div class="date-location">
                Kigali, <asp:Literal ID="litCurrentDate" runat="server"></asp:Literal>
            </div>

            <div class="certificate-title">
                CERTIFICATE OF GOOD STANDING
            </div>

            <div class="certificate-body">
                I, the undersigned, <strong>Eng. Nsengiyumva Juvenal</strong>, Director for Admissions and Academic Records of the Adventist University of Central Africa, hereby certify that:
                <br /><br />
                <div style="text-align:center; font-size: 15pt; margin: 10px 0;">
                    <strong><asp:Literal ID="litStudentName" runat="server"></asp:Literal></strong>
                </div>
                Born on <strong><asp:Literal ID="litBornDate" runat="server"></asp:Literal></strong>, 
                has been a regular student of this University, registered under ID No. <strong><asp:Literal ID="litStudentID" runat="server"></asp:Literal></strong>, 
                From <strong><asp:Literal ID="litStudiedFrom" runat="server"></asp:Literal></strong> to <strong><asp:Literal ID="litStudiedTo" runat="server"></asp:Literal></strong>.
                
                <div class="student-details">
                    <div class="detail-item">Year: <asp:Literal ID="litYear" runat="server"></asp:Literal></div>
                    <div class="detail-item">Faculty: <asp:Literal ID="litFaculty" runat="server"></asp:Literal></div>
                    <div class="detail-item">Major: <asp:Literal ID="litMajor" runat="server"></asp:Literal></div>
                    <div class="detail-item">Academic year: <asp:Literal ID="litAcademicYear" runat="server"></asp:Literal></div>
                    <div class="detail-item">Validity: <asp:Literal ID="litValidity" runat="server"></asp:Literal></div>
                </div>
                <br />
                This certificate is issued for any legal or administrative purpose it may serve.
            </div>

            <div class="bottom-section">
                <div class="qr-code">
                    <img src="https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=<%= Server.UrlEncode(QRCodeUrl) %>" alt="QR Code" />
                    <br />Scan to verify validity
                </div>

                <div class="signature-section">
                    <img src="Content/Images/signature.png" class="signature-image" alt="Signature" />
                    <div class="signature-line">
                        <strong>Eng. Nsengiyumva Juvenal</strong><br />
                        Director for Admissions and Academic Records<br />
                        Adventist University of Central Africa
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
