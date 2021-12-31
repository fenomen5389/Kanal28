using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Kanal28.DataAccess;
using Kanal28.Entities;
using Kanal28.Helpers;

namespace Kanal28.Admin
{
    public partial class Profile : System.Web.UI.Page
    {
        public List<Author> AllAuthors { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            using (Repository repository = new Repository())
            {
                AllAuthors = repository.Authors.ToList();
            }

            if (!IsPostBack)
            {
                var author = AllAuthors.FirstOrDefault(p => p.Id == ((Author)Session["INet_User"]).Id);
                Author_FirstName.Text = author.FirstName;
                Author_LastName.Text = author.LastName;
                Author_Email.Text = author.Email;
                Author_Biography.Text = author.Biography;
                Author_VisibleName.Text = author.VisibleName;
            }
        }

        protected async void Author_Save_Click(object sender, EventArgs e)
        {
            using (Repository repository = new Repository())
            {
                var id = ((Author)Session["INet_User"]).Id;
                var author = repository.Authors.FirstOrDefault(p => p.Id == id);
                author.FirstName = Author_FirstName.Text;
                author.LastName = Author_LastName.Text;
                author.Email = Author_Email.Text;
                author.Biography = Author_Biography.Text;
                author.VisibleName = Author_VisibleName.Text;
                Session["INet_User"] = author;
                await repository.SaveChangesAsync().ContinueWith(result =>
                {
                    Response.Redirect("/Admin/Profile.aspx");
                });
            }
        }
    }
}