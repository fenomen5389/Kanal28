using Kanal28.Addons;
using Kanal28.DataAccess;
using Kanal28.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kanal28.Admin
{
    public partial class Admin : AdminMasterPage
    {
        public List<Post> WaitingPosts { get; set; }
        protected override void Page_Load()
        {
            base.Page_Load();

            WaitingPosts = new Repository().Posts.Where(p=>!p.Published).ToList();
        }

        protected void LogoutButton_Click(object sender, EventArgs e)
        {
            Session["logged"] = null;
            Response.Redirect("/Admin/Login.aspx");
        }
    }
}