using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using System.Web.Http.Cors;
using WebApiEcommerceHaloPets.Interfaces;
using WebApiEcommerceHaloPets.Models;
using WebApiEcommerceHaloPets.Services;

namespace WebApiEcommerceHaloPets.Controllers
{
    [EnableCors(origins:"*",headers:"*",methods:"*")]
    [AllowAnonymous]
    [RoutePrefix("api/register")]
    public class ProductController : ApiController
    {
        private string connection = "Data Source=DESKTOP-5RU6TOV\\SQLEXPRESS;Initial Catalog=EcommerceHaloPets;User ID=sa; Password=123456;Trusted_Connection=true;MultipleActiveResultSets=true";

        private readonly IProduct _product;
        private readonly ILogger _log;

        public ProductController(IProduct product, ILogger log)
        {
            _product = product;
            _log = log;
        }



        /// <summary>
        /// Register the new products for this send a FormData with the product image and it is received by HttpContext.Current.Request
        /// </summary>
        /// <remarks>Awesomeness!</remarks>
        /// <response code="200">Product created</response>
        [HttpPost]
        [Route("registerProduct")]
        public IHttpActionResult RegisterProduct()
        {
            _log.register(new Models.Logger { exception = "", timestamp = DateTime.Now, level = "Information", logger = "Info", message = "Controller Product registerProduct started", userId = 0 });
            var httpRequest = HttpContext.Current.Request;
            return Ok(_product.RegisterProduct(httpRequest));
        }

        /// <summary>
        /// Get all products available in stock
        /// </summary>
        /// <remarks>Awesomeness!</remarks>
        /// <response code="200">Product created</response>
        [HttpGet]
        [Route("getAll")]
        public IHttpActionResult GetAll()
        {
            _log.register(new Models.Logger { exception = "", timestamp = DateTime.Now, level = "Information", logger = "Info", message = "Controller Product get ALL started", userId = 0 });
            return Ok(_product.getProducts());
        }



        /// <summary>
        /// saves orders sent from the shopping cart receives a List  of object Model.saveOrder
        /// </summary>
        /// <remarks>Awesomeness!</remarks>
        /// <response code="200">Product created</response>

        [HttpPost]
        [Route("saveOrder")]
        public IHttpActionResult SaveOrder(List<saveOrder> save)
        {
            _log.register(new Models.Logger { exception = "", timestamp = DateTime.Now, level = "Information", logger = "Info", message = "Controller Product SaveOrder started", userId = 0 });
            _product.saveOrder(save);
            
            return Ok();
        }

        /// <summary>
        /// Retrieve the best-selling product in the Halo Pets store
        /// </summary>
        /// <remarks>Awesomeness!</remarks>
        /// <response code="200">Product created</response>

        [HttpGet]
        [Route("maxProduct")]
        public IHttpActionResult BestSellingProduct()
        {
            _log.register(new Models.Logger { exception = "", timestamp = DateTime.Now, level = "Information", logger = "Info", message = "Controller Product maxProduct started", userId = 0 });
            return Ok(_product.getMaxProduct());
        }


        /// <summary>
        /// Retrieve the lowest-selling product in the Halo Pets store
        /// </summary>
        /// <remarks>Awesomeness!</remarks>
        /// <response code="200">Product created</response>

        [HttpGet]
        [Route("minProduct")]
        public IHttpActionResult LesserSoldProduct()
        {
            _log.register(new Models.Logger { exception = "", timestamp = DateTime.Now, level = "Information", logger = "Info", message = "Controller Product minProduct started", userId = 0 });
            return Ok(_product.getMinProduct());
        }
    }
}
