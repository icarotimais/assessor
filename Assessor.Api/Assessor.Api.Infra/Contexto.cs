
using Assessor.Domain.Entity;
using LinqToDB;
using LinqToDB.Configuration;
using LinqToDB.Data;
using System;
using System.Collections.Generic;
using System.Text;

namespace Assessor.Infra
{
    public class Contexto: DataConnection, IDisposable
    {
        public Contexto(LinqToDbConnectionOptions<Contexto> options)
        : base(options)
        {

        }

        public ITable<Usuario> Usuarios => GetTable<Usuario>();
    }
}
