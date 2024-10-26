<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Converter.aspx.cs" Inherits="Converter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>PDF to Word Converter</title>
    </head>
    <body>
        <div class="container">
            <div style="display:flex;align-items:center;justify-content:center;flex-direction:column;">
            <h1 style="color:black;font:italic;font-weight:600">PDF to Word Converter</h1>
            <asp:FileUpload ID="fileUploadPDF" CssClass="btn btn-primary btn-lg" runat="server" Style ="display : no" />
                
            <br />
            <asp:Button ID="btnConvert" runat="server" Text="Convert to Word" CssClass="btn btn-primary btn-lg" OnClick="btnConvert_Click" />
            <br />
            <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label>
                </div>
        </div>
    </body>
    </html>
</asp:Content>

