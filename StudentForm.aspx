<%@ Page Title="Manage Student" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StudentForm.aspx.cs" Inherits="CertificateGenerator.StudentForm" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/CertificateGenerator.css" rel="stylesheet" />

    <div class="main-container">
        <h2>
            <asp:Literal ID="litTitle" runat="server" Text="Add New Student"></asp:Literal>
        </h2>

        <div class="form-row">
            <div class="form-col">
                <label>Student ID</label>
                <asp:TextBox ID="txtStudentID" runat="server" CssClass="input-field full-width" Placeholder="e.g. 2025SEN349"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvID" runat="server" ControlToValidate="txtStudentID" ErrorMessage="ID is required" CssClass="error-message" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
            <div class="form-col">
                <label>Student Full Name</label>
                <asp:TextBox ID="txtStudentName" runat="server" CssClass="input-field full-width" Placeholder="Full Name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtStudentName" ErrorMessage="Name is required" CssClass="error-message" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-row">
            <div class="form-col">
                <label>Born Date</label>
                <asp:TextBox ID="txtBornDate" runat="server" CssClass="input-field full-width" TextMode="Date"></asp:TextBox>
            </div>
            <div class="form-col">
                <label>Studied From</label>
                <asp:TextBox ID="txtStudiedFrom" runat="server" CssClass="input-field full-width" TextMode="Month"></asp:TextBox>
            </div>
            <div class="form-col">
                <label>Studied To</label>
                <asp:TextBox ID="txtStudiedTo" runat="server" CssClass="input-field full-width" TextMode="Month"></asp:TextBox>
            </div>
        </div>

        <div class="form-row">
            <div class="form-col">
                <label>Year (e.g. One)</label>
                <asp:TextBox ID="txtYear" runat="server" CssClass="input-field full-width"></asp:TextBox>
            </div>
            <div class="form-col">
                <label>Faculty</label>
                <asp:TextBox ID="txtFaculty" runat="server" CssClass="input-field full-width"></asp:TextBox>
            </div>
            <div class="form-col">
                <label>Major</label>
                <asp:TextBox ID="txtMajor" runat="server" CssClass="input-field full-width"></asp:TextBox>
            </div>
        </div>

        <div class="form-row">
            <div class="form-col">
                <label>Academic Year (Validity)</label>
                <asp:TextBox ID="txtAcademicYear" runat="server" CssClass="input-field full-width" Placeholder="e.g. 2025-2026"></asp:TextBox>
            </div>
            <div class="form-col">
                <label>Approved By</label>
                <asp:TextBox ID="txtApprovedBy" runat="server" CssClass="input-field full-width" Placeholder="Eng. Nsengiyumva Juvenal"></asp:TextBox>
            </div>
        </div>

        <div class="form-group">
            <label>Comment</label>
            <asp:TextBox ID="txtComment" runat="server" CssClass="input-field full-width" TextMode="MultiLine" Rows="3"></asp:TextBox>
        </div>

        <div style="margin-top: 30px;">
            <asp:Button ID="btnSave" runat="server" Text="Save Student" CssClass="btn-custom btn-primary-custom" OnClick="btnSave_Click" />
            <a href="Certificates.aspx" class="btn-custom" style="background: #e0e0e0; color: #333; margin-left: 10px;">Cancel</a>
        </div>
    </div>
</asp:Content>
