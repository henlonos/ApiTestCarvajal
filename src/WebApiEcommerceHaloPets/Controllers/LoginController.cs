using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using WebApiEcommerceHaloPets.Interfaces;
using WebApiEcommerceHaloPets.Models;
using WebApiEcommerceHaloPets.Services;

namespace WebApiEcommerceHaloPets.Controllers
{
    [EnableCors(origins:"*",headers:"*",methods:"*")]
    [AllowAnonymous]
    [RoutePrefix("api/login")]
    public class LoginController : ApiController
    {
        /// <summary>
        /// permite obtener todos los valores con el metodo get y retorna un Ienumerable de string
        /// </summary>
        /// <returns></returns>
        // GET api/values

        private readonly IValidatingLogin _loggin;
        private readonly ILogger _log;
      
        public LoginController(IValidatingLogin login,ILogger log)
        {
            _loggin = login;
            _log = log;
            
        }



        /// <summary>
        /// Authenticate in store Halo pets for userName and password
        /// </summary>
        /// <remarks>Awesomeness!</remarks>
        /// <response code="200">Product created</response>
        [HttpPost]
        [Route("authenticate")]
        public IHttpActionResult Authenticate( Login  login)
        {
            _log.register(new Models.Logger { exception = "", timestamp = DateTime.Now, level = "Information", logger = "Info", message = "Controller Login started", userId = 0 });

            return Ok(_loggin.response(login));
        }

    }
}
