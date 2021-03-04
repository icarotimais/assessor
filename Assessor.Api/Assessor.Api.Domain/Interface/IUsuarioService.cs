using System;
using System.Collections.Generic;
using System.Text;

namespace Assessor.Domain.Interface
{
    public interface IUsuarioService
    {
        string GerarToken(string username, string password);
    }
}
