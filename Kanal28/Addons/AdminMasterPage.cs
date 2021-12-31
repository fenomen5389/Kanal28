using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace Kanal28.Addons
{
    public class AdminMasterPage:MasterPage
    {
        protected virtual void Page_Load()
        {
            CheckAuthentication();
        }

        private void CheckAuthentication()
        {
            if (Session["INet_User"] == null)
            {
                Response.Redirect("/Admin/Login.aspx");
            }
        }
    }
}