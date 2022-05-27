using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using WebApiEcommerceHaloPets.Models;

namespace WebApiEcommerceHaloPets.Interfaces
{
    public interface IProduct
    {
        bool RegisterProduct( HttpRequest httpRequest) ;

        IEnumerable<searchProducts> getProducts();

        bool saveOrder(List<saveOrder> save);

        IEnumerable<Product> getMaxProduct();

        IEnumerable<Product> getMinProduct();


    }
}
