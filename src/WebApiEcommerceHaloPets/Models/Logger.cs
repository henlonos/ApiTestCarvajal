using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WebApiEcommerceHaloPets.Models
{
    public class Logger
    {
        public DateTime timestamp { get; set; }

        public string level { get; set; }
        public string logger { get; set; }

        public string message { get; set; }

        public int userId { get; set; }
        
        public string exception { get; set; }

        

    }
}
