<%@ Page Title="Manage Certificates" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Certificates.aspx.cs" Inherits="CertificateGenerator.Certificates" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/CertificateGenerator.css" rel="stylesheet" />
    
    <div class="main-container">
        <h2>Certificate Management</h2>
        
        <div class="search-section">
            <asp:TextBox ID="txtSearch" runat="server" CssClass="input-field" Placeholder="Search by Student Name or ID..."></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn-custom btn-primary-custom" OnClick="btnSearch_Click" />
            <asp:HyperLink ID="lnkAdd" runat="server" NavigateUrl="~/StudentForm.aspx" CssClass="btn-custom btn-success-custom">
                + Add New Student
            </asp:HyperLink>
        </div>

        <asp:GridView ID="gvStudents" runat="server" CssClass="custom-table" AutoGenerateColumns="False" DataKeyNames="StudentID" 
            OnRowCommand="gvStudents_RowCommand" AllowPaging="True" PageSize="5" OnPageIndexChanging="gvStudents_PageIndexChanging">
            <Columns>
                <asp:BoundField DataField="StudentID" HeaderText="Student ID" />
                <asp:BoundField DataField="StudentName" HeaderText="Name" />
                <asp:BoundField DataField="Faculty" HeaderText="Faculty" />
                <asp:BoundField DataField="Major" HeaderText="Major" />
                <asp:BoundField DataField="AcademicYear" HeaderText="Academic Year" />
                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnGenerate" runat="server" CommandName="Generate" CommandArgument='<%# Eval("StudentID") %>' CssClass="action-link">
                            [Generate]
                        </asp:LinkButton>
                        <asp:LinkButton ID="btnEdit" runat="server" CommandName="EditStudent" CommandArgument='<%# Eval("StudentID") %>' CssClass="action-link">
                            [Edit]
                        </asp:LinkButton>
                        <asp:LinkButton ID="btnDelete" runat="server" CommandName="DeleteStudent" CommandArgument='<%# Eval("StudentID") %>' CssClass="action-link delete" OnClientClick="return confirm('Are you sure you want to delete this record?');">
                            [Delete]
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <PagerStyle CssClass="pagination-style" />
            <EmptyDataTemplate>
                <div style="padding: 20px; color: #777;">No students found.</div>
            </EmptyDataTemplate>
        </asp:GridView>
    </div>
</asp:Content>
