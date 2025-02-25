<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="LiveWell.Payment" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>Payment Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
        }
        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0px 0px 10px #aaa;
            margin-top: 50px;
        }
        .header, .footer {
            background-color: #333;
            color: white;
            padding: 10px;
            text-align: center;
        }
        .content {
            padding: 20px;
        }
        .content h3 {
            margin-top: 0;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-control {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
        }
        .btn {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #45a049;
        }
        .hidden {
            display: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            <h1>Payment Gateway</h1>
        </div>
        <div class="container">
            <div class="content">
                <div id="userDetails" runat="server">
                    <h2>User Details</h2>
                    <p><asp:Label ID="lblUsername" runat="server" Font-Bold="True"></asp:Label></p>
                    <p><asp:Label ID="lblAddress" runat="server"></asp:Label></p>
                    <p><asp:Label ID="lblPhone" runat="server"></asp:Label></p>
                    <p><asp:Label ID="lblEmail" runat="server"></asp:Label></p>
                    <p><asp:Label ID="lblTotalAmount" runat="server" Font-Bold="True"></asp:Label></p>
                    <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label><br />
                    <asp:Button ID="btnConfirmDetails" runat="server" Text="Confirm Details" CssClass="btn" OnClick="btnConfirmDetails_Click" />
                </div>

                <div id="paymentOptions" runat="server">
                    <h3>Select Payment Method:</h3>
                    <asp:RadioButtonList ID="rblPaymentMethod" runat="server">
                        <asp:ListItem Text="Cash on Delivery (COD)" Value="COD"></asp:ListItem>
                        <asp:ListItem Text="NetBanking" Value="NetBanking"></asp:ListItem>
                        <asp:ListItem Text="Credit/Debit Card" Value="Card"></asp:ListItem>
                        <asp:ListItem Text="UPI" Value="UPI"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:Button ID="btnProceedToPayment" runat="server" Text="Proceed to Payment" CssClass="btn" OnClick="btnProceedToPayment_Click" />
                    <asp:Label ID="lblPaymentError" runat="server" ForeColor="Red"></asp:Label><br />
                </div>
            </div>
        </div>
        <div class="footer">
            <p>&copy; <%: DateTime.Now.Year %> Your Company. All rights reserved.</p>
        </div>
    </form>
</body>
</html>
