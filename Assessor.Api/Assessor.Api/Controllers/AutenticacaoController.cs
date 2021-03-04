using Assessor.Api.Model;
using Assessor.Domain.Interface;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Assessor.Api.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class AutenticacaoController: ControllerBase
    {
        private readonly IUsuarioService _svc;
        public AutenticacaoController(IUsuarioService svc)
        {
            _svc = svc;
        }

        [HttpPost]
        [Route("")]
        [AllowAnonymous]
        public async Task<ActionResult> Login([FromBody] UsuarioViewModel model)
        {
            var token = _svc.GerarToken(model.Login, model.senha);

            if (token == null)
                return NotFound(new { message = "Usuário ou senha inválidos" });


            return Ok(token);
        }
    }
}
