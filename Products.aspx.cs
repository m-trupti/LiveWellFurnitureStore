using System;
using System.Web.UI;

namespace LiveWell
{
    public partial class Products : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ProductRepository productRepository = new ProductRepository();
                ListView1.DataSource = productRepository.GetProducts();
                ListView1.DataBind();
            }
        }
    }
}
