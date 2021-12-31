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
    public partial class ViewContent : VisitorPage
    {
        public Post Post { get; set; }
        public override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            var id = int.Parse(RouteData.Values["Id"].ToString());
            using (Repository repository = new Repository())
            {
                Post = repository.Posts.FirstOrDefault(p=>p.Id == id);
            }
            Title = $"{Post.Title} - {SEOConfig.SiteName}";
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
                return repository.Posts.Where(p=>p.Published).OrderByDescending(p=>p.AddedDate).Skip(randomSkip).Take(count).ToList();
            }
        }
    }
}