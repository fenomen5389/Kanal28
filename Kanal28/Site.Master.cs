using Kanal28.DataAccess;
using Kanal28.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kanal28
{
    public partial class Site : System.Web.UI.MasterPage
    {
        Repository Repository;
        protected void Page_Load(object sender, EventArgs e)
        {
            Repository = new Repository();
        }

        public List<Category> GetCategories()
        {
            return Repository.Categories.ToList();
        }
    }
}