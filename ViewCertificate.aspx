<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewCertificate.aspx.cs" Inherits="CertificateGenerator.ViewCertificate" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Certificate of Good Standing</title>
    <link href="https://fonts.googleapis.com/css2?family=Pinyon+Script&display=swap" rel="stylesheet" />
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Times New Roman', Times, serif;
            margin: 0;
            padding: 0;
            color: #000;
        }

        .certificate-container {
            width: 8.5in;
            height: 11in;
            padding: 0.31in 1in 1in 1in;
            margin: 20px auto;
            background-color: #fff;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
            position: relative;
            box-sizing: border-box;
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
            font-family: 'Edwardian Script ITC', 'Pinyon Script', cursive;
            font-size: 22pt;
            font-weight: bold;
            color: #000;
            margin-top: 5px;
        }

        .contact-info {
            font-family: 'Times New Roman', Times, serif;
            font-size: 10pt;
            color: #000;
            border-bottom: 0.75pt solid #000;
            padding-bottom: 8px;
            margin-bottom: 20px;
            line-height: 1.4;
        }

        .date-location {
            text-align: left;
            margin-bottom: 20px;
            font-size: 12pt;
        }

        .certificate-title {
            text-align: center;
            font-family: 'Times New Roman', Times, serif;
            font-size: 13.5pt;
            text-decoration: none;
            margin: 20px 0;
            font-weight: bold;
            color: #000;
            text-transform: uppercase;
        }

        .certificate-body {
            font-size: 12pt;
            line-height: 1.5;
            text-align: left;
            flex-grow: 1;
        }

        .cert-p {
            font-size: 12pt;
            line-height: 1.5;
            margin: 0 0 0 0;
        }

        .student-details {
            margin-top: 15px;
            margin-left: 0;
        }

        .detail-item {
            font-weight: normal;
            margin-bottom: 8px;
            line-height: 1.5;
        }

        .detail-item strong {
            font-weight: bold;
        }

        .bottom-section {
            display: flex;
            justify-content: space-between;
            align-items: flex-end;
            margin-top: 20px;
        }

        .qr-code {
            text-align: center;
            font-size: 11.5pt;
            width: 2.3in;
        }

        .qr-code img {
            width: 1.7in;
            height: 1.7in;
            margin-bottom: 5px;
        }

        .signature-section {
            text-align: left;
            width: 320px;
        }

        .signature-image {
            max-width: 220px;
            height: auto;
            margin-bottom: -15px;
            margin-left: 30px;
            position: relative;
            z-index: 2;
        }

        .signature-line {
            border-top: 1px solid #000;
            padding-top: 5px;
            font-size: 11.5pt;
            line-height: 1.4;
        }

        @media print {
            @page {
                size: letter;
                margin: 0;
            }
            body {
                background-color: #fff;
            }
            .certificate-container {
                margin: 0;
                box-shadow: none;
                border: none !important;
                height: 11in;
                width: 8.5in;
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
                    Mobile Phone : (+250)724 796 996 / 724 474 805/ 788 473 035<br />
                    Email: registrar@auca.ac.rw, ||  juvenal.nsengiyumva@auca.ac.rw 
                </div>
            </div>

            <div class="date-location">
                Kigali, <asp:Literal ID="litCurrentDate" runat="server"></asp:Literal>
            </div>

            <div class="certificate-title">
                CERTIFICATE OF GOOD STANDING
            </div>

            <div class="certificate-body">
                <p class="cert-p" style="margin-bottom: 15pt;">I, the undersigned, Eng. Nsengiyumva Juvenal, Director for Admissions and Academic Records of the Adventist University of Central Africa, hereby certify that:</p>
                
                <p class="cert-p" style="margin-bottom: 10pt;"><strong><asp:Literal ID="litStudentName" runat="server"></asp:Literal></strong>,</p>
                <p class="cert-p" style="margin-bottom: 10pt;">Born on <strong><asp:Literal ID="litBornDate" runat="server"></asp:Literal></strong></p>
                <p class="cert-p" style="margin-bottom: 10pt;">has been a regular student of this University, registered under ID No. <strong><asp:Literal ID="litStudentID" runat="server"></asp:Literal></strong>,</p>
                <p class="cert-p" style="margin-bottom: 15pt;">From <strong><asp:Literal ID="litStudiedFrom" runat="server"></asp:Literal></strong> to <strong><asp:Literal ID="litStudiedTo" runat="server"></asp:Literal></strong>.</p>
                
                <div class="student-details" style="margin-bottom: 15pt;">
                    <div class="detail-item">Year: <strong><asp:Literal ID="litYear" runat="server"></asp:Literal></strong></div>
                    <div class="detail-item">Faculty: <strong><asp:Literal ID="litFaculty" runat="server"></asp:Literal></strong></div>
                    <div class="detail-item">Major: <strong><asp:Literal ID="litMajor" runat="server"></asp:Literal></strong></div>
                    <div class="detail-item">Academic year: <strong><asp:Literal ID="litAcademicYear" runat="server"></asp:Literal></strong></div>
                    <div class="detail-item">Validity: <strong><asp:Literal ID="litValidity" runat="server"></asp:Literal></strong></div>
                </div>

                <p class="cert-p">This certificate is issued for any legal or administrative purpose it may serve</p>
            </div>

            <div class="bottom-section">
                <div class="signature-section">
                    <img src="Content/Images/signature.png" class="signature-image" alt="Signature" />
                    <div class="signature-line">
                        <strong>Eng. Nsengiyumva Juvenal</strong><br />
                        Director for Admissions and Academic Records<br />
                        Adventist University of Central Africa
                    </div>
                </div>

                <div class="qr-code">
                    <div id="qrCodeContainer"></div>
                    <br />Scan to verify my Validity
                </div>
            </div>
        </div>
    </form>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/qrcodejs/1.0.0/qrcode.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var qrUrl = '<%= QRCodeUrl.Replace("\'", "\\\'") %>';
            if (qrUrl && qrUrl.length > 0) {
                new QRCode(document.getElementById('qrCodeContainer'), {
                    text: qrUrl,
                    width: 150,
                    height: 150,
                    colorDark: '#000000',
                    colorLight: '#ffffff',
                    correctLevel: QRCode.CorrectLevel.L
                });
            }
        });
    </script>
</body>
</html>
