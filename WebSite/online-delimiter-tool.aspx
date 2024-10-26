<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="online-delimiter-tool.aspx.cs" Inherits="Tool" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <style>
        .workspace {
            display: flex;
            flex-direction: column;
            background-color: #f7f7f7;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-bottom: 20px;
            width: 100%;
        }

        .text-primary {
            font-size: 24px;
            margin-bottom: 15px;
            color: #007bff;
            text-align: center;
        }

        .linedwrap {
            display: flex;
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 5px;
            overflow: hidden;
            box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1);
            width: 100%;
        }

        .lines {
            background-color: #f1f1f1;
            border-right: 1px solid #ccc;
            padding: 10px;
            text-align: right;
            color: #666;
            font-family: 'Courier New', Courier, monospace;
        }

        .lineno {
            margin-bottom: 3px;
        }

        .linedtextarea {
            flex: 1;
            display: flex;
        }

        textarea.codearea {
            border: none;
            padding: 5px;
            font-family: 'Courier New', Courier, monospace;
            font-size: 14px;
            line-height: 1.7;
            width: 100%;
            height: 300px;
            box-sizing: border-box;
            resize: none;
            overflow: auto;
        }

        .btn-group {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            gap: 5px; /* Adds space between buttons and dropdown */
            width: 100%;
            height: 450px;
        }

        .copy {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            font-size: 12px;
            font-family: Arial, sans-serif;
            border-radius: 5px;
            cursor: pointer;
            text-align: center;
            height: 30px;
        }

            .copy:hover {
                background-color: #0056b3;
            }

        /* Container for buttons, centered vertically */
        .center-container {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100%; /* Takes full height to allow vertical centering */
        }
        /* Media Queries for responsiveness */
        @media (max-width: 768px) {
            .col-hack {
                width: 100%;
            }

            .workspace {
                width: 100%;
            }

            .col-xs-5 {
                width: 100%;
                margin-bottom: 20px;
            }

            .col-xs-2 {
                width: 100%;
            }
        }

        @media (min-width: 769px) {
            .col-xs-5 {
                width: 45%;
            }

            .col-xs-2 {
                width: 10%;
            }

            .center-container {
                height: auto; /* Adjust height when space is available */
                justify-content: center;
            }
        }
    </style>
    <script>
        function selectAllText() {
            var textBox = document.getElementById('<%= txtColumnData.ClientID %>');
            textBox.focus();
            textBox.select();
            document.execCommand("copy");
        }

        function selectAllTextDelimited() {
            var textBox = document.getElementById('<%= txtDelimitedData.ClientID %>');
            textBox.focus();
            textBox.select();
            document.execCommand("copy");
        }
    </script>
    <div class="col-md-12">
        <!-- First Container -->
        <div class="col-xs-5 col-hack">
            <div class="workspace vcenter">
                <h2 class="text-primary">Column Data Here...</h2>
                <div class="linedwrap">
                    <div class="lines">
                        <div class="codelines" id="lineNumbers">
                            <div class="lineno">1</div>
                            <div class="lineno">2</div>
                            <div class="lineno">3</div>
                            <div class="lineno">4</div>
                            <div class="lineno">5</div>
                        </div>
                    </div>
                    <div class="linedtextarea">
                        <textarea ID="txtColumnData" runat="server" TextMode="MultiLine" CssClass="codearea " oninput="updateLineNumbers()"></textarea>
                    </div>
                    <div class="copy" onclick="selectAllText()">Select</div>
                </div>
            </div>
        </div>
        <!-- Button Container -->
        <div class="col-xs-2 col-hack-sm">
            <div class="center-container">
                <div class="btn-group">
                    <asp:DropDownList ID="ddlDelimiter" runat="server" CssClass="form-control">
                        <asp:ListItem Text="," Value=","></asp:ListItem>
                        <asp:ListItem Text=";" Value=";"></asp:ListItem>
                        <asp:ListItem Text="|" Value="|"></asp:ListItem>
                        <asp:ListItem Text="Space" Value=" "></asp:ListItem>
                        <asp:ListItem Text="New Line" Value="\n"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:Button ID="btnConvert" runat="server" Text="Convert >>" CssClass="btn btn-primary btn-convert" OnClick="btnConvert_Click" />
                    <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn-danger btn-clear" OnClick="btnClear_Click" />
                </div>
            </div>
        </div>
        <!-- Second Container -->
        <div class="col-xs-5 col-hack">
            <div class="workspace vcenter">
                <h2 class="text-primary">Delimited Data Here...</h2>
                <div class="linedwrap">
                    <div class="lines">
                        <div class="codelines">
                            <div class="lineno">1</div>
                            <div class="lineno">2</div>
                            <div class="lineno">3</div>
                            <div class="lineno">4</div>
                            <div class="lineno">5</div>
                        </div>
                    </div>
                    <div class="linedtextarea">
                        <asp:TextBox ID="txtDelimitedData" runat="server" TextMode="MultiLine" CssClass="codearea scrollbars" Wrap="False"></asp:TextBox>
                    </div>
                    <div class="copy" onclick="selectAllTextDelimited()">Select</div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
