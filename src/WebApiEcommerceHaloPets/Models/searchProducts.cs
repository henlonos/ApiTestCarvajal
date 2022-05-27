using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WebApiEcommerceHaloPets.Models
{
    public class searchProducts
    {
        public int code { get; set; }
        public string productname { get; set; }
        public string description { get; set; }
        public int price { get; set; }

        public string nameimage { get; set; }

        public int stock { get; set; }
    }
}
