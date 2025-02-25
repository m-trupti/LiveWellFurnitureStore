<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Billing.aspx.cs" Inherits="LiveWell.Billing" Title="Billing" MasterPageFile="~/Site.Master" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div class="billing-container">
        <h1><%: Title %></h1>
        <h2>Your Billing Summary</h2>

        <asp:GridView ID="GridViewBilling" runat="server" AutoGenerateColumns="False" ShowFooter="True">
        <Columns>
            <asp:BoundField DataField="ProductName" HeaderText="Product Name" ItemStyle-CssClass="gridview-column-spacing" HeaderStyle-CssClass="gridview-header-spacing" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" ItemStyle-CssClass="gridview-column-spacing" HeaderStyle-CssClass="gridview-header-spacing" />
            <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="{0:C}" ItemStyle-CssClass="gridview-column-spacing" HeaderStyle-CssClass="gridview-header-spacing" />
            <asp:TemplateField HeaderText="Total">
                <ItemTemplate>
                    <asp:Label ID="lblTotal" runat="server" CssClass="gridview-column-spacing">
                        <%# Convert.ToDecimal(Eval("Price")) * Convert.ToInt32(Eval("Quantity")) %>
                    </asp:Label>
                </ItemTemplate>
                <HeaderStyle CssClass="gridview-header-spacing" />
            </asp:TemplateField>
        </Columns>
        <FooterStyle CssClass="footer-style" />
        <HeaderStyle CssClass="header-style" />
        <PagerStyle CssClass="pager-style" />
        <RowStyle CssClass="row-style" />
        <SelectedRowStyle CssClass="selected-row-style" />
        <SortedAscendingCellStyle CssClass="sorted-ascending-cell-style" />
        <SortedAscendingHeaderStyle CssClass="sorted-ascending-header-style" />
        <SortedDescendingCellStyle CssClass="sorted-descending-cell-style" />
        <SortedDescendingHeaderStyle CssClass="sorted-descending-header-style" />
</asp:GridView>


        <asp:Label ID="lblTotalAmount" runat="server" Text="Total Amount: " CssClass="total-amount"></asp:Label>

       <!-- Payment Form -->
        <div class="payment-form">
            <h3>Enter Your Details to Complete Payment</h3>
            <div class="form-group">
                <asp:Label ID="lblName" runat="server" Text="Name:" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="lblAddress" runat="server" Text="Address:" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="lblPhone" runat="server" Text="Phone:" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="lblEmail" runat="server" Text="Email:" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <asp:Button ID="btnPrintAndPay" runat="server" Text="Print Bill and Proceed to Payment" OnClick="btnPrintAndPay_Click" CssClass="btn btn-primary" />
        </div>

    </div>
</asp:Content>
