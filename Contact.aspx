<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="LiveWell.Contact" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1><%: Title %>.</h1>
        <h2>Your contact page.</h2>
    </hgroup>

    <section class="contact">
        <header>
            <h3>Phone:</h3>
        </header>
        <p>
            <span class="label">Main:</span>
            <span>+91 89834 48109</span>
        </p>
        <!--<p>
            <span class="label">After Hours:</span>
            <span>425.555.0199</span> 
        </p> -->
    </section>

    <section class="contact">
        <header>
            <h3>Email:</h3>
        </header>
        <p>
            <span class="label">Support:</span>
            <span><a href="mailto:Support@example.com">Support@LiveWell.com</a></span>
        </p>
        <p>
            <span class="label">Marketing:</span>
            <span><a href="mailto:Marketing@example.com">Marketing@LiveWell.com</a></span>
        </p>
        <p>
            <span class="label">General Queries:</span>
            <span><a href="mailto:General@example.com">Faqs@LiveWell.com</a></span>
        </p>
    </section>

    <section class="contact">
        <header>
            <h3>Address:</h3>
        </header>
        <p>
            Shop 77, Thakur Village<br />
            Kandivali East, Mumbai 400101
        </p>
    </section>
</asp:Content>