using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebApiEcommerceHaloPets.Interfaces;
using WebApiEcommerceHaloPets.Models;

namespace WebApiEcommerceHaloPets.Services
{
    public class validatingLogin : IValidatingLogin
    {

        private string connection = "Data Source=DESKTOP-5RU6TOV\\SQLEXPRESS;Initial Catalog=EcommerceHaloPets;User ID=sa; Password=123456;Trusted_Connection=true;MultipleActiveResultSets=true";
        private readonly Interfaces.ILogger _log;

        public validatingLogin(Interfaces.ILogger log)
        {
            _log = log;
        }
        public IEnumerable<ResponseLogin> response(Login login)
        {
            _log.register(new Models.Logger { exception = "", timestamp = DateTime.Now, level = "Information", logger = "Info", message = "validating login started", userId = 0 });

            using (IDbConnection db = new SqlConnection(connection))
            {
                try
                {
                    var procedure = "[dbo].[managerProducts]";
                    var values = new { option = "validatingLogin", userName = login.username, password = login.password };
                     var result =   db.Query<ResponseLogin>(procedure, values, commandType: CommandType.StoredProcedure);

                    _log.register(new Models.Logger { exception = "", timestamp = DateTime.Now, level = "Information", logger = "Info", message = "Validating login ended", userId = 0 });

                    return result;
                }
                catch (Exception ex)
                {
                    _log.register(new Models.Logger { exception = ex.ToString(), timestamp = DateTime.Now, level = "Error", logger = "Error", message = "Error Validating login ", userId = 0 });

                }
            }

            
            return Enumerable.Empty<ResponseLogin>() ;

        }
    }
}
