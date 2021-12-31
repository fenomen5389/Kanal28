using Kanal28.Entities;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace Kanal28.DataAccess
{
    public class Repository:DbContext
    {
        public Repository():base(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=Kanal28;Integrated Security=True;Connect Timeout=30;")
        {

        }
        public DbSet<Post> Posts { get; set; }
        public DbSet<Author> Authors { get; set; }
        public DbSet<Category> Categories { get; set; }
    }
}