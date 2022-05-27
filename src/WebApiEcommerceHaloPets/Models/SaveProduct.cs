using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WebApiEcommerceHaloPets.Models
{
    public class SaveProduct
    {
        public string nameproduct { get; set; }
        public string description { get; set; }
        public int price { get; set; }
        public int items { get; set; }
        public string nameImage { get; set; }

    }
}
