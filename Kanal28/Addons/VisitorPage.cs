using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using Kanal28.Config;
using Kanal28.Helpers;
using Newtonsoft.Json;

namespace Kanal28.Addons
{
    public class VisitorPage:Page
    {
        protected HaberiumSEOConfig SEOConfig;
        public virtual void Page_Load(object sender,EventArgs e)
        {
            SEOConfig = JsonConvert.DeserializeObject<HaberiumSEOConfig>(ConfigHelper.ReadConfig("HaberiumSEO.json", Server));
        }
    }
}