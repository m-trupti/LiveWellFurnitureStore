<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="LiveWell.Products" Title="Products" MasterPageFile="~/Site.Master" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div>
        <hgroup class="title">
            <h1><%: Title %></h1>
            <h2>Explore our Wide Range of Products and bring home your very own comfort partner!</h2>
        </hgroup>
    </div>

    <asp:ListView ID="ListView1" runat="server">
        <LayoutTemplate>
            <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
        </LayoutTemplate>
        <ItemTemplate>
            <div style="border: 1px solid #ccc; padding: 10px; margin: 5px;">
                <h3><%# Eval("ProductName") %></h3>
                <p><%# Eval("Description") %></p>
                <p>Price: <%# Eval("Price", "{0:C}") %></p>
                <asp:Image ID="ProductImage" ImageUrl='<%# Eval("ImageUrl") %>' runat="server" Width="250" Height="250" ImageAlign="AbsMiddle" />
                <asp:HyperLink ID="ProductLink" NavigateUrl='<%# "ProductDetails.aspx?productId=" + Eval("ProductId") %>' Text="View Details" runat="server" />
            </div>
        </ItemTemplate>
    </asp:ListView>
</asp:Content>
