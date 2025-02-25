using System;
using System.Web.UI;

namespace LiveWell
{
    public partial class ProductDetails : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string productIdParam = Request.QueryString["productId"];
                int productId;

                // Use a separate line to declare and parse the integer
                if (!string.IsNullOrEmpty(productIdParam) && int.TryParse(productIdParam, out productId))
                {
                    ProductRepository productRepository = new ProductRepository();
                    Product product = productRepository.GetProductById(productId);

                    if (product != null)
                    {
                        Title = product.ProductName;
                        ProductNameLabel.InnerText = product.ProductName;
                        DescriptionLabel.InnerText = product.Description;
                        PriceLabel.Text = product.Price.ToString("C");
                        ProductImage.ImageUrl = product.ImageUrl;
                    }
                    else
                    {
                        // Handle case where product is not found
                        ProductNameLabel.InnerText = "Product not found";
                        DescriptionLabel.InnerText = "";
                        PriceLabel.Text = "";
                        ProductImage.ImageUrl = "";
                    }
                }
                else
                {
                    // Handle case where no product ID is provided or parsing fails
                    ProductNameLabel.InnerText = "No product specified";
                    DescriptionLabel.InnerText = "";
                    PriceLabel.Text = "";
                    ProductImage.ImageUrl = "";
                }
            }
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            string productIdParam = Request.QueryString["productId"];
            int productId;

            if (int.TryParse(productIdParam, out productId))
            {
                int quantity = int.Parse(txtQuantity.Text);  // Get quantity from the TextBox
                Cart cartPage = new Cart();
                cartPage.AddItem(productId, quantity); // Update method to pass quantity
                // Optionally, display a message that item was added successfully
            }
            else
            {
                // Handle invalid product ID
                Response.Write("Invalid product ID.");
            }
        }
    }
}

