using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LiveWell
{
    public class BillingDetails
    {
        public string Name { get; set; }
        public string Address { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public decimal TotalAmount { get; set; }
    }
}
