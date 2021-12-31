using Kanal28.Config;
using Kanal28.Helpers;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace Kanal28.Addons
{
    public class AdminPage:Page
    {
        protected HaberiumSEOConfig SEOConfig;

        public AdminPage()
        {
            SEOConfig = JsonConvert.DeserializeObject<HaberiumSEOConfig>(ConfigHelper.ReadConfig("HaberiumSEOConfig.json", Server));
        }
    }
}