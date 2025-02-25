using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LiveWell
{
    public partial class Cart : System.Web.UI.Page
    {
        private string connectionString = "Server=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Database1.mdf;Integrated Security=True;Connect Timeout=30;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<CartItem> cartItems = GetCartItems();
                GenerateCartTable(cartItems);
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

        private void GenerateCartTable(List<CartItem> cartItems)
        {
            RepeaterCartItems.DataSource = cartItems;
            RepeaterCartItems.DataBind();
        }

        protected void btnProceedToBilling_Click(object sender, EventArgs e)
        {
            List<CartItem> cartItems = GetCartItems();
            if (cartItems.Count > 0)
            {
                Response.Redirect("Billing.aspx");
            }
        }

        protected void btnUpdateCart_Click(object sender, EventArgs e)
        {
            List<CartItem> cartItems = GetCartItems();

            foreach (RepeaterItem item in RepeaterCartItems.Items)
            {
                TextBox txtQuantity = (TextBox)item.FindControl("txtQuantity");
                int quantity;
                int productId = int.Parse(((Button)item.FindControl("btnRemove")).CommandArgument);

                if (int.TryParse(txtQuantity.Text, out quantity))
                {
                    var cartItem = cartItems.Find(ci => ci.ProductId == productId);
                    if (cartItem != null)
                    {
                        cartItem.Quantity = quantity;
                    }
                }
            }

            Session["CartItems"] = cartItems;
            GenerateCartTable(cartItems); // Re-bind the repeater to reflect updates
        }

        protected void btnRemove_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandArgument != null)
            {
                int productId;
                if (int.TryParse(e.CommandArgument.ToString(), out productId))
                {
                    List<CartItem> cartItems = GetCartItems();
                    RemoveItem(cartItems, productId);
                    GenerateCartTable(cartItems);
                }
                else
                {
                    // Handle invalid ProductId scenario
                    // lblError.Text = "Invalid product ID.";
                }
            }
        }

        public void AddItem(int productId, int quantity)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT ProductName, Price, ImageUrl FROM Products WHERE ProductId = @ProductId";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@ProductId", productId);
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        string productName = reader["ProductName"].ToString();
                        decimal price = (decimal)reader["Price"];
                        string imageUrl = reader["ImageUrl"].ToString();

                        List<CartItem> cartItems = GetCartItems();
                        var existingItem = cartItems.Find(ci => ci.ProductId == productId);
                        if (existingItem != null)
                        {
                            existingItem.Quantity += quantity; // Update quantity if item exists
                        }
                        else
                        {
                            cartItems.Add(new CartItem
                            {
                                ProductId = productId,
                                ProductName = productName,
                                Price = price,
                                ImageUrl = imageUrl,
                                Quantity = quantity
                            });
                        }

                        Session["CartItems"] = cartItems;
                    }
                    else
                    {
                        throw new ArgumentException("Product not found.");
                    }
                }
            }
        }

        public void RemoveItem(List<CartItem> cartItems, int productId)
        {
            var itemToRemove = cartItems.Find(item => item.ProductId == productId);
            if (itemToRemove != null)
            {
                cartItems.Remove(itemToRemove);
                Session["CartItems"] = cartItems;  // Update session after removal
            }
            else
            {
                throw new ArgumentException("Product not found in the cart.");
            }
        }

        public void ProceedToBilling(List<CartItem> cartItems)
        {
            if (cartItems.Count == 0)
            {
                throw new InvalidOperationException("Cart is empty. Please add items before proceeding to billing.");
            }

            Response.Redirect("Billing.aspx");
        }
    }
}
