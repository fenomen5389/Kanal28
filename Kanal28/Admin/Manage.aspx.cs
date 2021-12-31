using Kanal28.Config;
using Kanal28.Helpers;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kanal28.Admin
{
    public partial class Manage : System.Web.UI.Page
    {
        HaberiumSEOConfig SEOConfig;
        protected void Page_Load(object sender, EventArgs e)
        {
            var seoData = JsonConvert.DeserializeObject<HaberiumSEOConfig>(ConfigHelper.ReadConfig("HaberiumSEO.json", Server));
            SEOConfig = seoData;

            if (!IsPostBack)
            {
                SiteName.Text = seoData.SiteName;
                SiteDescription.Text = seoData.SiteDescription;
                SiteCanonicalUrl.Text = seoData.SiteCanonicalUrl;
                SiteOwner.Text = seoData.SiteOwner;
                YoutubePage.Text = seoData.YoutubePage;
                FacebookPage.Text = seoData.FacebookPage;
                HomepageTitle.Text = seoData.HomepageTitle;
            }
        }

        protected void SaveSEO_Click(object sender, EventArgs e)
        {
            SEOConfig.SiteName = SiteName.Text;
            SEOConfig.SiteCanonicalUrl = SiteCanonicalUrl.Text;
            SEOConfig.SiteDescription = SiteDescription.Text;
            SEOConfig.SiteOwner = SiteOwner.Text;
            SEOConfig.FacebookPage = FacebookPage.Text;
            SEOConfig.YoutubePage = YoutubePage.Text;
            SEOConfig.HomepageTitle = HomepageTitle.Text;
            var json = JsonConvert.SerializeObject(SEOConfig);
            ConfigHelper.WriteConfig("HaberiumSEO.json", json, Server);
        }
    }
}