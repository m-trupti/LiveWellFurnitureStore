using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LiveWell
{
        public class Product
        {
            public int ProductId { get; set; }
            public string ProductName { get; set; }
            public string Description { get; set; }
            public decimal Price { get; set; }  // Changed from long to decimal
            public string ImageUrl { get; set; }
            // Add more properties as needed
        }
}
