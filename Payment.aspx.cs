using System;
using System.Web.UI;
using LiveWell; 

namespace LiveWell
{
    public partial class Payment : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Retrieve BillingDetails from the session
                BillingDetails billingDetails = Session["BillingDetails"] as BillingDetails;

                if (billingDetails != null)
                {
                    lblUsername.Text = "Username: " + billingDetails.Name;
                    lblAddress.Text = "Address: " + billingDetails.Address;
                    lblPhone.Text = "Phone: " + billingDetails.Phone;
                    lblEmail.Text = "Email: " + billingDetails.Email;
                    lblTotalAmount.Text = "Total Amount: " + billingDetails.TotalAmount.ToString("C");
                }
                else
                {
                    lblError.Text = "Billing information is missing.";
                    btnConfirmDetails.Visible = false;
                    userDetails.Visible = false;
                }
            }
        }

        protected void btnConfirmDetails_Click(object sender, EventArgs e)
        {
            // Toggle visibility on button click
            userDetails.Visible = false;
            paymentOptions.Visible = true;
        }

        protected void btnProceedToPayment_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(rblPaymentMethod.SelectedValue))
            {
                lblPaymentError.Text = "Please select a payment method.";
            }
            else
            {
                Session["SelectedPaymentMethod"] = rblPaymentMethod.SelectedValue;
                Response.Redirect("Confirmation.aspx");
            }
        }

        public class BillingDetails
        {
            public string Name { get; set; }
            public string Address { get; set; }
            public string Phone { get; set; }
            public string Email { get; set; }
            public decimal TotalAmount { get; set; }
        }
    }
}
