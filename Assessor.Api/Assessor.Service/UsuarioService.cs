using Assessor.Domain.Interface;
using Assessor.Infra.Configuration;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;

namespace Assessor.Service
{
    public class UsuarioService: IUsuarioService
    {
        private readonly IUsuarioRepository _repo;
        public UsuarioService(IUsuarioRepository repo)
        {
            _repo = repo;
        }

        public string GerarToken(string login, string senha)
        {
            var usuario = _repo.Get(x => x.Login == login && x.Senha == senha).FirstOrDefault();

            if (usuario == null)
                return null;

            var tokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.ASCII.GetBytes(SecretKey.Secret);
            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(new Claim[]
                {
                    new Claim(ClaimTypes.NameIdentifier, usuario.Login),
                    new Claim(ClaimTypes.Name, usuario.Nome),
                    new Claim(ClaimTypes.Sid, usuario.Id),
                    new Claim("Type", usuario.Papel)
                }),
                Expires = DateTime.UtcNow.AddDays(7),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
            };
            var tokenBase = tokenHandler.CreateToken(tokenDescriptor);
            var token = tokenHandler.WriteToken(tokenBase);

            return token;
        }
    }
}
