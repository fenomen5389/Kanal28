using Kanal28.DataAccess;
using Kanal28.Entities;
using Kanal28.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kanal28.Admin
{
    public partial class Editor : System.Web.UI.Page
    {
        public Post CurrentPost { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["Id"]))
            {
                int postId = int.Parse(Request.QueryString["Id"]);
                CurrentPost = GetPostById(postId);
            }
            else
            {
                CurrentPost = new Post() { AddedDate=DateTime.Now };
            }
            PrepareInterface();
        }

        public void PrepareInterface()
        {
            HaberiumEditor_Breaking.InputAttributes.Add("class", "custom-control-input");
            HaberiumEditor_CornerStone.InputAttributes.Add("class", "custom-control-input");
            if (!IsPostBack)
            {
                HaberiumEditor_Category.DataSource = GetCategories();
                HaberiumEditor_Category.DataValueField = "Id";
                HaberiumEditor_Category.DataTextField = "Name";
                HaberiumEditor_Category.DataBind();
                HaberiumEditor_Title.Text = CurrentPost.Title;
                HaberiumEditor_Body.Text = CurrentPost.Body;
                HaberiumEditor_MetaDescription.Text = CurrentPost.MetaDescription;
                HaberiumEditor_Keyword.Text = CurrentPost.Keyword;
                HaberiumEditor_Breaking.Checked = CurrentPost.Breaking;
                HaberiumEditor_CornerStone.Checked = CurrentPost.CornerStone;
                HaberiumEditor_Category.SelectedValue = CurrentPost.CategoryId.ToString();
            }
            else
            {

            }
        }

        public Post GetPostById(int postId)
        {
            using (Repository repository = new Repository())
            {
                return repository.Posts.FirstOrDefault(p => p.Id == postId);
            }
        }

        public List<Category> GetCategories()
        {
            using (Repository repository = new Repository())
            {
                return repository.Categories.ToList();
            }
        } 

        protected async void HaberiumEditor_Save_Click(object sender, EventArgs e)
        {
            if (CurrentPost.Id != 0)
            {
                using (Repository repository = new Repository())
                {
                    var post = repository.Posts.FirstOrDefault(p => p.Id == CurrentPost.Id);
                    post.Title = HaberiumEditor_Title.Text;
                    post.Body = HaberiumEditor_Body.Text;
                    post.MetaDescription = HaberiumEditor_MetaDescription.Text;
                    if (HaberiumEditor_ThumbnailUploader.HasFile)
                        post.Thumbnail = FileUploadHelper.UploadFile(HaberiumEditor_ThumbnailUploader.PostedFile, Server);
                    post.Keyword = HaberiumEditor_Keyword.Text;
                    post.CornerStone = HaberiumEditor_CornerStone.Checked;
                    post.Breaking = HaberiumEditor_Breaking.Checked;
                    post.CategoryId = int.Parse(HaberiumEditor_Category.SelectedItem.Value);
                    post.AuthorId = ((Author)Session["INet_User"]).Id;
                    await repository.SaveChangesAsync().ContinueWith(p =>
                    {
                        Response.Redirect(Request.Url.ToString());
                    });
                }
            }
            else
            {
                using (Repository repository = new Repository())
                {
                    CurrentPost.Title = HaberiumEditor_Title.Text;
                    CurrentPost.Body = HaberiumEditor_Body.Text;
                    CurrentPost.MetaDescription = HaberiumEditor_MetaDescription.Text;
                    if (HaberiumEditor_ThumbnailUploader.HasFile)
                        CurrentPost.Thumbnail = FileUploadHelper.UploadFile(HaberiumEditor_ThumbnailUploader.PostedFile, Server);
                    CurrentPost.Keyword = HaberiumEditor_Keyword.Text;
                    CurrentPost.CornerStone = HaberiumEditor_CornerStone.Checked;
                    CurrentPost.Breaking = HaberiumEditor_Breaking.Checked;
                    CurrentPost.CategoryId = int.Parse(HaberiumEditor_Category.SelectedValue);
                    CurrentPost.AuthorId = ((Author)Session["INet_User"]).Id;
                    var post = repository.Posts.Add(CurrentPost);
                    await repository.SaveChangesAsync().ContinueWith(p =>
                    {
                        Response.Redirect($"/Admin/Editor.aspx?Id={post.Id}");
                    });
                }
            }
        }
    }
}