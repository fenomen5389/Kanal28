using Kanal28.DataAccess;
using Kanal28.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kanal28.Admin
{
    public partial class Login : System.Web.UI.Page
    {
        public bool LoginError = false;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            var password = Password.Text;
            var email = Email.Text;

            using (Repository repository = new Repository())
            {
                var userToLogin = repository.Authors.FirstOrDefault(p => p.Email == email);
                if (userToLogin != null)
                {
                    if (PasswordHelper.VerifyPassword(password, userToLogin.PasswordSalt, userToLogin.PasswordHash))
                    {
                        Session["INet_User"] = userToLogin;
                        Response.Redirect("/Admin/");
                    }
                    else
                    {
                        LoginError = true;
                    }
                }
                else
                {
                    LoginError = true;
                }
            }
        }
    }
}