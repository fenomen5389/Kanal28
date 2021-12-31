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
    public partial class Authors : System.Web.UI.Page
    {
        public List<Author> AllAuthors { get; set; }
        protected async void Page_Load(object sender, EventArgs e)
        {
            GetAuthors();
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["Edit"]))
                {
                    var id = int.Parse(Request.QueryString["Edit"]);
                    var author = AllAuthors.FirstOrDefault(p => p.Id == id);
                    AuthorEditor_FirstName.Text = author.FirstName;
                    AuthorEditor_LastName.Text = author.LastName;
                    AuthorEditor_Email.Text = author.Email;
                    AuthorEditor_Biography.Text = author.Biography;
                    AuthorEditor_VisibleName.Text = author.VisibleName;
                }

                if (!string.IsNullOrEmpty(Request.QueryString["Delete"]))
                {
                    var id = int.Parse(Request.QueryString["Delete"]);
                    using (Repository repository = new Repository())
                    {
                        var author = repository.Authors.FirstOrDefault(p => p.Id == id);
                        repository.Authors.Remove(author);
                        await repository.SaveChangesAsync().ContinueWith(p =>
                        {
                            Response.Redirect("/Admin/Authors.aspx");
                        });
                    }
                }
            }
        }

        public void GetAuthors()
        {
            using (Repository repository = new Repository())
            {
                AllAuthors = repository.Authors.ToList();
                return;
            }
        }

        protected async void SaveButton_Click(object sender, EventArgs e)
        {
            using (Repository repository = new Repository())
            {
                var id = int.Parse(Request.QueryString["Edit"]);
                var author = repository.Authors.FirstOrDefault(p => p.Id == id);
                author.FirstName = AuthorEditor_FirstName.Text;
                author.LastName = AuthorEditor_LastName.Text;
                author.Email = AuthorEditor_Email.Text;
                author.Biography = AuthorEditor_Biography.Text;
                author.VisibleName = AuthorEditor_VisibleName.Text;
                await repository.SaveChangesAsync().ContinueWith(result =>
                {
                    Response.Redirect("/Admin/Authors.aspx");
                });
            }
        }

        protected async void AddButton_Click(object sender, EventArgs e)
        {
            using (Repository repository = new Repository())
            {
                var author = new Author();
                author.FirstName = NewAuthor_FirstName.Text;
                author.LastName= NewAuthor_LastName.Text;
                author.Email= NewAuthor_Email.Text;
                author.Biography= NewAuthor_Biography.Text;

                var password = PasswordHelper.GenerateRandomPassword();
                byte[] passwordHash, passwordSalt;
                PasswordHelper.HashPassword(password,out passwordHash,out passwordSalt);
                author.PasswordSalt = passwordSalt;
                author.PasswordHash = passwordHash;
                author.VisibleName = NewAuthor_VisibleName.Text;

                repository.Authors.Add(author);
                await repository.SaveChangesAsync().ContinueWith(result =>
                {
                    Response.Redirect($"/Admin/Authors.aspx?ShowPassword={HttpUtility.UrlEncode(password)}");
                });
            }
        }
    }
}