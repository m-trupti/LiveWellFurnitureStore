/*using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace LiveWell
{
    public partial class Billing : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Load cart items from session
                List<CartItem> cartItems = GetCartItems();

                if (cartItems.Count == 0)
                {
                    lblTotalAmount.Text = "Your cart is empty.";
                    GridViewBilling.Visible = false;
                }
                else
                {
                    // Bind cart items to GridView
                    BindCart(cartItems);

                    // Calculate and display total amount
                    decimal totalAmount = CalculateTotalAmount(cartItems);
                    lblTotalAmount.Text = string.Format("Overall Total Bill: {0:C}", totalAmount);
                }
            }
        }


       private List<CartItem> GetCartItems()
       {
           List<CartItem> cartItems = Session["CartItems"] as List<CartItem>;
           if (cartItems == null)
           {
               cartItems = new List<CartItem>();
           }
           return cartItems;
       }


        private void BindCart(List<CartItem> cartItems)
        {
            GridViewBilling.DataSource = cartItems;
            GridViewBilling.DataBind();
        }

        private decimal CalculateTotalAmount(List<CartItem> cartItems)
        {
            decimal totalAmount = 0;
            foreach (var item in cartItems)
            {
                totalAmount += item.Price * item.Quantity;
            }
            return totalAmount;
        }
        public void CompleteBilling()
        {
            // Clear the cart from the session
            Session["CartItems"] = null;
        }

        protected void btnPrintAndPay_Click(object sender, EventArgs e)
{
    string name = txtName.Text;
    string address = txtAddress.Text;
    string phone = txtPhone.Text;
    string email = txtEmail.Text;
    decimal totalAmount = CalculateTotalAmount(cartItems);

    if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(address) || string.IsNullOrEmpty(phone) || string.IsNullOrEmpty(email))
    {
        // Display error message if any field is empty
        // You can use a Label or other control to show error messages
        Response.Write("<script>alert('Please fill out all fields.');</script>");
        return;
    }

    // Save billing details to session or handle as needed
    Session["BillingDetails"] = new { Name = name, Address = address, Phone = phone, Email = email, TotalAmount = totalAmount };

    // Redirect to Payment.aspx with total amount and username
    Response.Redirect($"Payment.aspx?totalAmount={totalAmount}&username={Server.UrlEncode(name)}");
}

        private void ProcessPayment(string name, string address, string phone, string email, decimal totalAmount)
        {
            // Implement payment processing logic here
            // This could involve redirecting to a payment gateway or processing payment directly
            // For example, you might use PayPal, Stripe, or another payment provider
        }
    }
}
*/
using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using LiveWell;


namespace LiveWell
{
    public partial class Billing : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Load cart items from session
                List<CartItem> cartItems = GetCartItems();

                if (cartItems.Count == 0)
                {
                    lblTotalAmount.Text = "Your cart is empty.";
                    GridViewBilling.Visible = false;
                }
                else
                {
                    // Bind cart items to GridView
                    BindCart(cartItems);

                    // Calculate and display total amount
                    decimal totalAmount = CalculateTotalAmount(cartItems);
                    lblTotalAmount.Text = string.Format("Overall Total Bill: {0:C}", totalAmount);
                }
            }
        }

        private List<CartItem> GetCartItems()
        {
            List<CartItem> cartItems = Session["CartItems"] as List<CartItem>;
            if (cartItems == null)
            {
                cartItems = new List<CartItem>();
            }
            return cartItems;
        }

        private void BindCart(List<CartItem> cartItems)
        {
            GridViewBilling.DataSource = cartItems;
            GridViewBilling.DataBind();
        }

        private decimal CalculateTotalAmount(List<CartItem> cartItems)
        {
            decimal totalAmount = 0;
            foreach (var item in cartItems)
            {
                totalAmount += item.Price * item.Quantity;
            }
            return totalAmount;
        }

        public void CompleteBilling()
        {
            // Clear the cart from the session
            Session["CartItems"] = null;
        }

protected void btnPrintAndPay_Click(object sender, EventArgs e)
{
    string name = txtName.Text;
    string address = txtAddress.Text;
    string phone = txtPhone.Text;
    string email = txtEmail.Text;

    // Retrieve the cart items
    List<CartItem> cartItems = GetCartItems();

    // Calculate the total amount
    decimal totalAmount = CalculateTotalAmount(cartItems);

    // Check if any of the required fields are empty
    if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(address) || string.IsNullOrEmpty(phone) || string.IsNullOrEmpty(email))
    {
        Response.Write("<script>alert('Please fill out all fields.');</script>");
        return;
    }

    BillingDetails billingDetails = new BillingDetails
    {
        Name = name,
        Address = address,
        Phone = phone,
        Email = email,
        TotalAmount = totalAmount
    };

    Session["BillingDetails"] = billingDetails;

    Response.Redirect("Payment.aspx");
}


        private void ProcessPayment(string name, string address, string phone, string email, decimal totalAmount)
        {
            // Implement payment processing logic here
            // This could involve redirecting to a payment gateway or processing payment directly
            // For example, you might use PayPal, Stripe, or another payment provider
        }
    }
}
