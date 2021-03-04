using Assessor.Domain.Interface;
using LinqToDB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;

namespace Assessor.Infra.Repository
{
    public class Repository<T> : IRepository<T> where T : class
    {
        private readonly Contexto _context;
        public Repository(Contexto context)
        {
            _context = context;
        }

        public bool Delete(Expression<Func<T, bool>> expres)
        {
            return _context.GetTable<T>().Where(expres).Delete() > 0 ? true : false;
        }

        public Boolean Delete(T entidade)
        {
            return _context.Delete(entidade) > 0;
        }

        public IEnumerable<T> Get()
        {
            return _context.GetTable<T>().ToList();
        }

        public IQueryable<T> Get(Expression<Func<T, bool>> expres)
        {
            return _context.GetTable<T>().Where(expres);
        }

        public bool Save(T entidade)
        {
            return _context.Insert(entidade) > 0 ? true : false;
        }

        public bool SaveList(List<T> entidades)
        {
            try
            {
                foreach (var entidade in entidades)
                {
                    _context.Insert(entidade);
                }
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }

        public bool Update(T entidade)
        {
            return _context.Update(entidade) > 0 ? true : false;
        }
    }
}
