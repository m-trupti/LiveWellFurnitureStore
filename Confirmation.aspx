<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Confirmation.aspx.cs" Inherits="LiveWell.Confirmation" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>Order Confirmation</title>
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
        .content h2 {
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
        .error {
            color: red;
        }
    </style>
    <script type="text/javascript">
        function printPage() {
            window.print();
        }
</script>
<style type="text/css" media="print">
    .header, .footer, .no-print {
        display: none;
    }

    .container {
        width: 100%;
        margin: 0;
        padding: 0;
        box-shadow: none;
    }
    .form-group {
        margin-bottom: 10px;
    }
</style>

</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            <h1>Order Confirmation</h1>
        </div>
        <div class="container">
            <div class="content">
                <h2>Order Summary</h2>
                <div class="form-group">
                    <label for="lblName">Name:</label>
                    <asp:Label ID="lblName" runat="server" CssClass="form-control"></asp:Label>
                </div>
                <div class="form-group">
                    <label for="lblAddress">Address:</label>
                    <asp:Label ID="lblAddress" runat="server" CssClass="form-control"></asp:Label>
                </div>
                <div class="form-group">
                    <label for="lblPhone">Phone:</label>
                    <asp:Label ID="lblPhone" runat="server" CssClass="form-control"></asp:Label>
                </div>
                <div class="form-group">
                    <label for="lblEmail">Email:</label>
                    <asp:Label ID="lblEmail" runat="server" CssClass="form-control"></asp:Label>
                </div>
                <div class="form-group">
                    <label for="lblTotalAmount">Total Amount:</label>
                    <asp:Label ID="lblTotalAmount" runat="server" CssClass="form-control"></asp:Label>
                </div>
                <div class="form-group">
                <label for="lblPaymentMethod">Payment Method:</label>
                <asp:Label ID="lblPaymentMethod" runat="server" CssClass="form-control"></asp:Label>
                </div>
                <asp:Label ID="lblError" runat="server" CssClass="error"></asp:Label>
                <div class="form-group">
                    <asp:Button ID="btnBackToHome" runat="server" Text="Back to Home" CssClass="btn" PostBackUrl="~/Default.aspx" />
                </div>
                <div class="form-group">
                <asp:Button ID="btnPrint" runat="server" Text="Print Confirmation" CssClass="btn btn-primary" OnClientClick="printPage(); return false;" />
                </div>
            </div>
        </div>
        <div class="footer">
            <p>&copy; <%: DateTime.Now.Year %> Your Company. All rights reserved.</p>
        </div>
    </form>
</body>
</html>
