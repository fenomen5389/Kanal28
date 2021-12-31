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
    public partial class ViewCategory : VisitorPage
    {
        public Repository Repository;
        public Category Category { get; set; }
        public List<Post> Posts { get; set; }
        public override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            Repository = new Repository();
            var id = int.Parse(RouteData.Values["Id"].ToString());
            using (Repository repository = new Repository())
            {
                Category = repository.Categories.FirstOrDefault(p => p.Id == id);
            }
            Title = $"{Category.Name} - {SEOConfig.SiteName}";

            Posts = Repository.Posts.Where(p=>p.CategoryId == id).OrderByDescending(p=>p.AddedDate).ToList();
        }

        public Author GetAuthorById(int id)
        {
            return Repository.Authors.FirstOrDefault(p => p.Id == id);
        }

        public List<Post> GetMostPopularPosts(int count)
        {
            using (Repository repository = new Repository())
            {
                return repository.Posts.OrderByDescending(p => p.ViewCount).Take(count).ToList();
            }
        }

        public List<Post> GetRandomPosts(int count)
        {
            using (Repository repository = new Repository())
            {
                var posts = repository.Posts;
                var randomSkip = 0;
                try
                {
                    randomSkip = new Random().Next(0, posts.Count() - count);
                }
                catch
                {
                    randomSkip = 0;
                }
                return repository.Posts.Where(p => p.Published).OrderByDescending(p => p.AddedDate).Skip(randomSkip).Take(count).ToList();
            }
        }
    }
}