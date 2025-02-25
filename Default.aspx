<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="LiveWell._Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <!--<h1><%: Title %>.</h1> -->
                <h1>Welcome to LiveWell Furniture Shop!</h1>
            </hgroup>
            <p>
                To view the entire range of Products we offer, click the Page Link:
                <a href="Products.aspx" title="Products">Products Page</a>.
                <!--To learn more about ASP.NET, visit <a href="http://asp.net" title="ASP.NET Website">http://asp.net</a>.
                The page features <mark>videos, tutorials, and samples</mark> to help you get the most from ASP.NET.
                If you have any questions about ASP.NET visit
                <a href="http://forums.asp.net/18.aspx" title="ASP.NET Forum">our forums</a>.
                -->
            </p>
            <p>
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/prodimages/ad2.png" OnClick="ImageButton1_Click" Height="450" Width="900" />
            </p>
        </div>
    </section>
</asp:Content>
