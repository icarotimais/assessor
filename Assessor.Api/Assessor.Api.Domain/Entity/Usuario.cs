using LinqToDB.Mapping;
using System;
using System.Collections.Generic;
using System.Text;

namespace Assessor.Domain.Entity
{
    [Table(Name = "usuario")]
    public class Usuario
    {
        [Column(Name = "id"), PrimaryKey]
        public string Id { get; set; }
        [Column(Name = "login")]
        public string Login { get; set; }
        [Column(Name = "senha")]
        public string Senha { get; set; }
        [Column(Name = "nome")]
        public string Nome { get; set; }
        [Column(Name = "sobrenome")]
        public string Sobrenome { get; set; }
        [Column(Name = "papel")]
        public string Papel { get; set; }
    }
}
