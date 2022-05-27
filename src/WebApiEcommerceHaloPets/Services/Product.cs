using Dapper;
using RestSharp;

using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using WebApiEcommerceHaloPets.Interfaces;
using WebApiEcommerceHaloPets.Models;

namespace WebApiEcommerceHaloPets.Services
{
    public class Product : IProduct
    {
        private string connection = "Data Source=DESKTOP-5RU6TOV\\SQLEXPRESS;Initial Catalog=EcommerceHaloPets;User ID=sa; Password=123456;Trusted_Connection=true;MultipleActiveResultSets=true";
        private const string _schema = "dbo";

        private readonly Interfaces.ILogger _log;

        public Product(Interfaces.ILogger log)
        {
            _log = log;
        }

        

        
        public IEnumerable<Models.Product> getMaxProduct()
        {
            _log.register(new Models.Logger { exception = "", timestamp = DateTime.Now, level = "Information", logger = "Info", message = "get Max Product started", userId = 0 });
            using (IDbConnection db = new SqlConnection(connection))
            {
                try
                {
                    var procedure = "[dbo].[managerProducts]";
                    var values = new { option = "getProductMax"};
                    var results = db.Query<Models.Product>(procedure, values, commandType: CommandType.StoredProcedure);
                    
                    _log.register(new Models.Logger { exception = "", timestamp = DateTime.Now, level = "Information", logger = "Info", message = "get Max Product ended", userId = 0 });

                    return results;

                }
                catch (Exception ex)
                {
                    _log.register(new Models.Logger { exception = ex.ToString(), timestamp = DateTime.Now, level = "Error", logger = "Error", message = "Error get  Max Product ", userId = 0 });

                }
            }
            return Enumerable.Empty<Models.Product>();
        }

        public IEnumerable<Models.Product> getMinProduct()
        {
            _log.register(new Models.Logger { exception = "", timestamp = DateTime.Now, level = "Information", logger = "Info", message = "get Min Product started", userId = 0 });

            using (IDbConnection db = new SqlConnection(connection))
            {
                try
                {
                    var procedure = "[dbo].[managerProducts]";
                    var values = new { option = "getProductMin" };
                    var results =  db.Query<Models.Product>(procedure, values, commandType: CommandType.StoredProcedure);

                    _log.register(new Models.Logger { exception = "", timestamp = DateTime.Now, level = "Information", logger = "Info", message = "get Min Product ended", userId = 0 });

                    return results;

                }
                catch (Exception ex)
                {
                    _log.register(new Models.Logger { exception = ex.ToString(), timestamp = DateTime.Now, level = "Error", logger = "Error", message = "Error get  Min Product ", userId = 0 });

                }
            }
            return  Enumerable.Empty<Models.Product>();
        }

        public IEnumerable<searchProducts> getProducts()
        {
            _log.register(new Models.Logger { exception = "", timestamp = DateTime.Now, level = "Information", logger = "Info", message = "get All Products started", userId = 0 });

            using (IDbConnection db = new SqlConnection(connection))
            {
                try
                {
                    var procedure = "[dbo].[managerProducts]";
                    var values = new { option = "searchProducts"};
                    var result =   db.Query<searchProducts>(procedure, values, commandType: CommandType.StoredProcedure);

                    _log.register(new Models.Logger { exception = "", timestamp = DateTime.Now, level = "Information", logger = "Info", message = "get All Product ended", userId = 0 });

                    return result;

                }
                catch (Exception ex)
                {
                    _log.register(new Models.Logger { exception = ex.ToString(), timestamp = DateTime.Now, level = "Error", logger = "Error", message = "Error get All Product ", userId = 0 });

                }

            }
            return Enumerable.Empty<searchProducts>();
        }

        public bool RegisterProduct(HttpRequest httpRequest)
        {

            _log.register(new Models.Logger { exception = "", timestamp = DateTime.Now, level = "Information", logger = "Info", message = "Register Product started", userId = 0 });

            var postedFile = httpRequest.Files["Image"];

            if (postedFile != null)
            {
                try
                {
                    string directory = @"C:\Devops\EcommerceHaloPets\src\assets\Imgs\";
                    if (!Directory.Exists(directory)) Directory.CreateDirectory(directory);
                    string fileName = directory + postedFile.FileName;
                    if (!File.Exists(fileName)) postedFile.SaveAs(fileName);

                    var saveProduct = new SaveProduct();
                    saveProduct.nameproduct = httpRequest.Params["nameproduct"];
                    saveProduct.description = httpRequest.Params["description"];
                    saveProduct.price = Convert.ToInt32(httpRequest.Params["price"]);
                    saveProduct.items = Convert.ToInt32(httpRequest.Params["items"]);
                    saveProduct.nameImage = fileName;

                    saveProducts(saveProduct);
                    _log.register(new Models.Logger { exception = "", timestamp = DateTime.Now, level = "Information", logger = "Info", message = "Save Product ended", userId = 0 });

                }
                catch (Exception ex)
                {
                    _log.register(new Models.Logger { exception = ex.ToString(), timestamp = DateTime.Now, level = "Error", logger = "Error", message = "Error Save  Product ", userId = 0 });


                }

            }

            return true;
        }

        public bool saveOrder(List<saveOrder> save)
        {
            _log.register(new Models.Logger { exception = "", timestamp = DateTime.Now, level = "Information", logger = "Info", message = "Save Order started", userId = 0 });

            using (IDbConnection db = new SqlConnection(connection))
            {
                try
                {
                    var procedure = "[dbo].[managerProducts]";

                    var valuesInit = new { option = "getCodeSale" };
                    var result =   db.Query(procedure, valuesInit, commandType: CommandType.StoredProcedure);

                    foreach(var r in result)
                    {
                        foreach (var s in save)
                        {
                            var values = new { option = "saveOrder", codeProduct = s.code, userId = s.userId, price = s.price, codeSale = Convert.ToInt32(r.codeSale) };
                            db.Query(procedure, values, commandType: CommandType.StoredProcedure);

                            _log.register(new Models.Logger { exception = "", timestamp = DateTime.Now, level = "Information", logger = "Info", message = "Save Order ended", userId = 0 });

                        }
                    }

                    return true;
                }
                catch (Exception ex)
                {
                    _log.register(new Models.Logger { exception = ex.ToString(), timestamp = DateTime.Now, level = "Error", logger = "Error", message = "Error Save Order Product ", userId = 0 });

                    return false;
                }

            }
        }

        public  bool saveProducts(SaveProduct product)
        {

            _log.register(new Models.Logger { exception = "", timestamp = DateTime.Now, level = "Information", logger = "Info", message = "Save Product started", userId = 0 });

            using (IDbConnection db = new SqlConnection(connection))
            {
                try
                {
                    var procedure = "[dbo].[managerProducts]";
                    var values = new { option = "registerProduct", nameproduct = product.nameproduct, description=product.description, price=product.price, items = product.items,nameImage = product.nameImage };
                    db.Query(procedure, values, commandType: CommandType.StoredProcedure);

                    _log.register(new Models.Logger { exception = "", timestamp = DateTime.Now, level = "Information", logger = "Info", message = "Save Product ended", userId = 0 });

                }
                catch (Exception ex)
                {
                    _log.register(new Models.Logger { exception = ex.ToString(), timestamp = DateTime.Now, level = "Error", logger = "Error", message = "Error Save Product ", userId = 0 });

                }
            }
            return true;
        }

  
    }
}
