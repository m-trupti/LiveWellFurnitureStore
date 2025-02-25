<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="LiveWell.ProductDetails" Title="Product Details" MasterPageFile="~/Site.Master" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <!DOCTYPE html>
    <div>
        <hgroup class="title">
            <h1><%: Title %></h1>
            <h2>Product Details</h2>
        </hgroup>

        <div>
            <h3 id="ProductNameLabel" runat="server"></h3>
            <p id="DescriptionLabel" runat="server"></p>
            <p>Price: <asp:Label ID="PriceLabel" runat="server"></asp:Label></p>
            <asp:Image ID="ProductImage" runat="server" Width="250" Height="250" ImageAlign="AbsMiddle" />
            <asp:TextBox ID="txtQuantity" runat="server" Text="1" Width="50" />
            <asp:Button ID="btnAddToCart" runat="server" Text="Add to Cart" OnClick="btnAddToCart_Click" />
            <asp:HyperLink ID="lnkBackToProducts" runat="server" NavigateUrl="Products.aspx" Text="Back to Products" />
        </div>
    </div>
</asp:Content>
