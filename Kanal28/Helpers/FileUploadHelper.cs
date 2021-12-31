using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Kanal28.Helpers
{
    public static class FileUploadHelper
    {
        public static string UploadFile(HttpPostedFile file,HttpServerUtility httpServerUtility)
        {
            string url = $"/Uploaded/{file.FileName}";
            file.SaveAs(httpServerUtility.MapPath($"~{url}"));
            return url;
        }
    }
}