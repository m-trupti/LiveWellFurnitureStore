<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="LiveWell.Cart" Title="Cart" MasterPageFile="~/Site.Master" %>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="MainContent">
    <div>
        <h1><%: Title %></h1>
        <h2>Your Shopping Cart</h2>
    </div>

    <asp:Repeater ID="RepeaterCartItems" runat="server">
        <HeaderTemplate>
            <table class="cart-table">
                <thead>
                    <tr>
                        <th>Product Name</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Total</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td><%# Eval("ProductName") %></td>
                <td><asp:TextBox ID="txtQuantity" runat="server" Text='<%# Eval("Quantity") %>' /></td>
                <td><%# Eval("Price", "{0:C}") %></td>
                <td><%# Convert.ToDecimal(Eval("Price")) * Convert.ToInt32(Eval("Quantity")) %></td>
                <td>
                    <asp:Button ID="btnRemove" runat="server" Text="Remove" CommandArgument='<%# Eval("ProductId") %>' OnCommand="btnRemove_Command" />
                </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
                </tbody>
            </table>
            <asp:Button ID="btnUpdateCart" runat="server" Text="Update Cart" OnClick="btnUpdateCart_Click" />
        </FooterTemplate>
    </asp:Repeater>

    <asp:Button ID="btnProceedToBilling" runat="server" Text="Proceed to Billing" OnClick="btnProceedToBilling_Click" />
    <asp:HyperLink ID="lnkBackToProducts" runat="server" NavigateUrl="Products.aspx" Text="Back to Products" />
</asp:Content>
