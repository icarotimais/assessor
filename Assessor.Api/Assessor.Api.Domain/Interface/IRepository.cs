using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;

namespace Assessor.Domain.Interface
{
    public interface IRepository<T> where T : class
    {
        IEnumerable<T> Get();
        IQueryable<T> Get(Expression<Func<T, bool>> expres);
        bool Save(T entidade);
        bool Delete(Expression<Func<T, bool>> expres);
        bool Update(T entidade);
        bool Delete(T entidade);
        bool SaveList(List<T> entidades);
    }
}
