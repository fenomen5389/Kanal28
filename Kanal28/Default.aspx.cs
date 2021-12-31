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
    public partial class Default : VisitorPage
    {
        public Repository Repository;
        public List<Post> Posts;
        public override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            Repository = new Repository();
            this.GetPosts();

            Title = SEOConfig.HomepageTitle;
        }

        public List<Post> GetCornerStonePosts()
        {
            return Repository.Posts.Where(p => p.CornerStone && p.Published).OrderByDescending(p=>p.AddedDate).ToList();
        }

        public Author GetAuthorById(int id)
        {
            return Repository.Authors.FirstOrDefault(p => p.Id == id);
        }

        public Category GetCategoryById(int id)
        {
            return Repository.Categories.FirstOrDefault(p => p.Id == id);
        }

        public List<Category> GetCategories()
        {
            return Repository.Categories.ToList();
        }

        private void GetPosts()
        {
            Posts = Repository.Posts.Where(p=>p.Published).OrderByDescending(p => p.AddedDate).ToList();
        }
    }
}