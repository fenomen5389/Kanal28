using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace Kanal28.Helpers
{
    public static class ConfigHelper
    {
        public static string ReadConfig(string fileName,HttpServerUtility server)
        {
            using (var reader = new StreamReader(server.MapPath($"~/Config/{fileName}")))
            {
                return reader.ReadToEnd();
            }
        }

        public static void WriteConfig(string fileName, string contents , HttpServerUtility server)
        {
            using (var reader = new StreamWriter(server.MapPath($"~/Config/{fileName}")))
            {
                reader.Write(contents);
            }
        }
    }
}