using Kanal28.DataAccess;
using Kanal28.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kanal28.Admin
{
    public partial class Posts : System.Web.UI.Page
    {
        public List<Post> AllPosts;
        protected async void Page_Load(object sender, EventArgs e)
        {
            GetPosts();


            if (!string.IsNullOrEmpty(Request.QueryString["delete"]) && ((Author)Session["INet_User"]).IsAdministrator)
            {
                await DeletePost(int.Parse(Request.QueryString["delete"]));
            }

            if (!string.IsNullOrEmpty(Request.QueryString["cornerStone"]) && ((Author)Session["INet_User"]).IsAdministrator)
            {
                await ToggleCornerStone(int.Parse(Request.QueryString["cornerStone"]));
            }

            if (!string.IsNullOrEmpty(Request.QueryString["breaking"]) && ((Author)Session["INet_User"]).IsAdministrator)
            {
                await ToggleBreaking(int.Parse(Request.QueryString["breaking"]));
            }

            if (!string.IsNullOrEmpty(Request.QueryString["draft"]) && ((Author)Session["INet_User"]).IsAdministrator)
            {
                await MakeDraft(int.Parse(Request.QueryString["draft"]));
            }

            if (!string.IsNullOrEmpty(Request.QueryString["QuickEditor"]) && !IsPostBack)
            {
                var postToEdit = AllPosts.FirstOrDefault(p => p.Id == int.Parse(Request.QueryString["QuickEditor"]));
                QuickEditor_Title.Text = postToEdit.Title;
                QuickEditor_MetaDescription.Text = postToEdit.MetaDescription;
                QuickEditor_Category.DataValueField = "Id";
                QuickEditor_Category.DataTextField = "Name";
                QuickEditor_Category.DataSource = GetCategories();
                QuickEditor_Category.SelectedValue = postToEdit.CategoryId.ToString();
                QuickEditor_Category.DataBind();
            }

        }

        public List<Category> GetCategories()
        {
            using (Repository repository = new Repository())
            {
                return repository.Categories.ToList();
            }
        }

        public async Task ToggleBreaking(int id)
        {
            using (Repository repository = new Repository())
            {
                var post = repository.Posts.FirstOrDefault(p => p.Id == id);
                post.Breaking = !post.Breaking;
                await repository.SaveChangesAsync();
            }
        }

        public async Task MakeDraft(int id)
        {
            using (Repository repository = new Repository())
            {
                var post = repository.Posts.FirstOrDefault(p => p.Id == id);
                post.Published = false;
                await repository.SaveChangesAsync();
            }
        }

        public async Task ToggleCornerStone(int id)
        {
            using (Repository repository = new Repository())
            {
                var post = repository.Posts.FirstOrDefault(p => p.Id == id);
                post.CornerStone = !post.CornerStone;
                await repository.SaveChangesAsync();
            }
        }

        public async Task DeletePost(int id)
        {
            using (Repository repository = new Repository())
            {
                repository.Posts.Remove(repository.Posts.FirstOrDefault(p => p.Id == id));
                await repository.SaveChangesAsync();
            }
        }

        public void GetPosts()
        {
            var authorId = ((Author)Session["INet_User"]).Id;
            if (((Author)Session["INet_User"]).IsAdministrator)
                AllPosts = new Repository().Posts.Where(p => p.Published == true).OrderByDescending(p => p.AddedDate).ToList();
            else
                AllPosts = new Repository().Posts.Where(p => p.Published == true && p.AuthorId == authorId).OrderByDescending(p => p.AddedDate).ToList();
        }

        public Author GetAuthorById(int id)
        {
            using (Repository repository = new Repository())
            {
                return repository.Authors.FirstOrDefault(p => p.Id == id);
            }
        }

        public Category GetCategoryById(int id)
        {
            using (Repository repository = new Repository())
            {
                return repository.Categories.FirstOrDefault(p => p.Id == id);
            }
        }

        protected async void SaveButton_Click(object sender, EventArgs e)
        {
            using (Repository repository = new Repository())
            {
                var postId = int.Parse(Request.QueryString["QuickEditor"]);
                var post = repository.Posts.FirstOrDefault(p => p.Id == postId);
                post.Title = QuickEditor_Title.Text;
                post.MetaDescription = QuickEditor_MetaDescription.Text;
                post.CategoryId = int.Parse(QuickEditor_Category.SelectedItem.Value);
                if (((Author)Session["INet_User"]).IsAdministrator || post.AuthorId == ((Author)Session["INet_User"]).Id)
                {
                    await repository.SaveChangesAsync();
                    Response.Redirect("/Admin/Posts.aspx", false);
                }
                else
                {
                    Response.Redirect("/Admin/Posts.aspx?AccessDenied=true");
                }
            }
        }
    }
}