using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace Kanal28
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            SetRoutes(RouteTable.Routes);
        }

        private void SetRoutes(RouteCollection routes)
        {
            routes.MapPageRoute("Haber İçeriği", "{Title}/{Id}","~/ViewContent.aspx");
            routes.MapPageRoute("Kategori Haberleri", "kategori/{Title}/{Id}","~/ViewCategory.aspx");
            routes.MapPageRoute("Yazarlar", "yazarlar","~/Authors.aspx");
            routes.MapPageRoute("Yazar Sayfası", "Yazar/{Name}/{Id}","~/ViewAuthor.aspx");

        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}