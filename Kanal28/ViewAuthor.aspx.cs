using Kanal28.Addons;
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
    public partial class ViewAuthor : VisitorPage
    {
        public Author Author { get; set; }
        public List<Post> Posts { get; set; }
        public override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender,e);
            var authorId = int.Parse(RouteData.Values["Id"].ToString());
            Author = new Repository().Authors.FirstOrDefault(p=>p.Id == authorId);
            Posts = new Repository().Posts.Where(p=>p.AuthorId == authorId).ToList();
            Title = $"{Author.VisibleName} - {SEOConfig.SiteName}";
        }
    }
}