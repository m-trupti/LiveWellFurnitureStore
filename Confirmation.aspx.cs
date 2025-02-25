using System;
using System.Web.UI;

namespace LiveWell
{
    public partial class Confirmation : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var billingDetails = Session["BillingDetails"] as BillingDetails;
                var paymentMethod = Session["SelectedPaymentMethod"] as string;

                if (billingDetails != null)
                {
                    lblName.Text = billingDetails.Name;
                    lblAddress.Text = billingDetails.Address;
                    lblPhone.Text = billingDetails.Phone;
                    lblEmail.Text = billingDetails.Email;
                    lblTotalAmount.Text = billingDetails.TotalAmount.ToString("C");
                }
                else
                {
                    lblError.Text = "Billing information is missing.";
                }

                if (!string.IsNullOrEmpty(paymentMethod))
                {
                    lblPaymentMethod.Text = paymentMethod;
                }
                else
                {
                    lblPaymentMethod.Text = "Payment Method: Not selected";
                }
            }
        }
    }
}
