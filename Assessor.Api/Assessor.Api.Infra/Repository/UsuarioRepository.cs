
using Assessor.Domain.Entity;
using Assessor.Domain.Interface;
using System;
using System.Collections.Generic;
using System.Text;

namespace Assessor.Infra.Repository
{
    public class UsuarioRepository: Repository<Usuario>, IUsuarioRepository
    {
        private readonly Contexto _ctx;
        public UsuarioRepository(Contexto ctx) :base(ctx)
        {
            _ctx = ctx;
        }
    }
}
