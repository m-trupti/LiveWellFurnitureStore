<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="LiveWell.About" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1><%: Title %>.</h1>
        <h2>Your one stop Furniture Shop.</h2>
    </hgroup>

    <article>
        <p>        
            We provide a wide variety of Furniture.
        </p>

        <p>        
            From Cedar to Teak Wood,
        </p>

        <p>        
            and from Bean Bags to Love Seats, you name it, we have it!
        </p>
    </article>

    <aside>
        <h3>Inspiration</h3>
        <p>        
            We are inspired by the thought of great comfort at best prices.
        </p>
        <ul>
            <li><a runat="server" href="~/">Home</a></li>
            <li><a runat="server" href="~/About.aspx">About</a></li>
            <li><a runat="server" href="~/Contact.aspx">Contact</a></li>
        </ul>
    </aside>
</asp:Content>