using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WebApiEcommerceHaloPets.Models
{
    public  class saveOrder
    {
        public int code { get; set; }
        public string nameproduct { get; set; }
        public string nameimage { get; set; }
        public int price { get; set; }
       public int userId { get; set; }


    }
}
