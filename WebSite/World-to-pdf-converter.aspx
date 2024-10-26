<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="World-to-pdf-converter.aspx.cs" Inherits="World_to_pdf_converter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <!DOCTYPE html>
    <style>
        .heading {
            font-weight: 600;
            font-size: 42px;
            line-height: 52px;
            color: #33333b;
            text-align: center;
        }

        .Subheading {
            max-width: 800px;
            margin: 8px auto 0;
            line-height: 32px;
            font-size: 22px;
            font-weight: 400;
            color: #47474f;
        }
    </style>
    <html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>Word to PDF Converter</title>
    </head>
    <body>
        <div class="container">
            <div style="display: flex; align-items: center; justify-content: center; flex-direction: column;">
                <h1 class="heading">Word to PDF Converter</h1>
                <h2 class="Subheading">Convert your WORD to PDF documents with incredible accuracy.</h2>
                <asp:FileUpload ID="fileUploadWord" CssClass="btn btn-primary btn-lg" runat="server" />
                <br />
                <asp:Button ID="btnConvertToPDF" runat="server" Text="Convert to PDF" CssClass="btn btn-primary btn-lg" OnClick="btnConvertToPDF_Click" />
                <br />
                <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label>
            </div>
        </div>
    </body>
    </html>
</asp:Content>

