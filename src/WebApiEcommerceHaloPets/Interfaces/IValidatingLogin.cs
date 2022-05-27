using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebApiEcommerceHaloPets.Models;

namespace WebApiEcommerceHaloPets.Interfaces
{
    public interface IValidatingLogin
    {
        IEnumerable<ResponseLogin> response(Login login);
    }
}
