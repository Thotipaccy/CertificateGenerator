<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CertificateGenerator._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>
        <div class="jumbotron text-center bg-light p-5 shadow-sm rounded">
            <h1 class="display-4 text-primary">AUCA Certificate Generator</h1>
            <p class="lead mt-3">Official system for generating Certificates of Good Standing for students of the Adventist University of Central Africa.</p>
            <hr class="my-4">
            <p>Quickly search for student records and generate professional, printable certificates with digital verification QR codes.</p>
            <a class="btn btn-primary btn-lg mt-3" href="Certificates.aspx" role="button">Generate Certificates &raquo;</a>
        </div>

        <div class="row mt-5 text-center">
            <div class="col-md-4">
                <div class="card h-100 border-0 shadow-sm">
                    <div class="card-body">
                        <h3 class="h5 text-secondary">Secure Records</h3>
                        <p>Direct integration with the university's academic records database for accurate data.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card h-100 border-0 shadow-sm">
                    <div class="card-body">
                        <h3 class="h5 text-secondary">Premium Design</h3>
                        <p>Professional layout with official branding, elegant typography, and signature fields.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card h-100 border-0 shadow-sm">
                    <div class="card-body">
                        <h3 class="h5 text-secondary">Print Ready</h3>
                        <p>Optimized for A4 printing with high-resolution assets and digital verification.</p>
                    </div>
                </div>
            </div>
        </div>
    </main>

</asp:Content>
