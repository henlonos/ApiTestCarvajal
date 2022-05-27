using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebApiEcommerceHaloPets.Interfaces;

namespace WebApiEcommerceHaloPets.Services
{
    public class Logger : ILogger
    {
        private string connection = "Data Source=DESKTOP-5RU6TOV\\SQLEXPRESS;Initial Catalog=EcommerceHaloPets;User ID=sa; Password=123456;Trusted_Connection=true;MultipleActiveResultSets=true";

        public void register(Models.Logger log)
        {
            using (IDbConnection db = new SqlConnection(connection))
            {
                try
                {
                    var procedure = "[dbo].[managerProducts]";
                    var values = new { option = "RegisterLogger",timestamp=log.timestamp,level=log.level,logger=log.logger,message=log.message,userId=log.userId,exception=log.exception };
                    db.Query(procedure, values, commandType: CommandType.StoredProcedure);


                }
                catch (Exception ex)
                {

                }
            }
        }
    }
}
