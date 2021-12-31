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
    public partial class Authors : System.Web.UI.Page
    {
        public List<Author> AllAuthors { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            using (Repository repository = new Repository())
            {
                AllAuthors = repository.Authors.ToList();
            }
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