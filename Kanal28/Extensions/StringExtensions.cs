using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Web;

namespace Kanal28.Extensions
{
    public static class StringExtensions
    {
        public static string ToEnglish(this string text)
        {
            Encoding.RegisterProvider(CodePagesEncodingProvider.Instance);
            Encoding srcEncoding = Encoding.UTF8;
            Encoding destEncoding = Encoding.GetEncoding(1252); // Latin alphabet

            text = destEncoding.GetString(Encoding.Convert(srcEncoding, destEncoding, srcEncoding.GetBytes(text)));

            string normalizedString = text.Normalize(NormalizationForm.FormD);
            StringBuilder result = new StringBuilder();

            for (int i = 0; i < normalizedString.Length; i++)
            {
                if (!CharUnicodeInfo.GetUnicodeCategory(normalizedString[i]).Equals(UnicodeCategory.NonSpacingMark))
                {
                    result.Append(normalizedString[i]);
                }
            }

            return result.ToString();
        }

        public static string ConvertUrlFriendly(this string text)
        {
            text = text.ToLower();
            Encoding.RegisterProvider(CodePagesEncodingProvider.Instance);
            Encoding srcEncoding = Encoding.UTF8;
            Encoding destEncoding = Encoding.GetEncoding(1252); // Latin alphabet

            text = destEncoding.GetString(Encoding.Convert(srcEncoding, destEncoding, srcEncoding.GetBytes(text)));

            string normalizedString = text.Normalize(NormalizationForm.FormD);
            StringBuilder result = new StringBuilder();

            for (int i = 0; i < normalizedString.Length; i++)
            {
                switch (normalizedString[i])
                {
                    case ' ':
                        result.Append("-");
                        continue;
                    case '"':
                        result.Append("");
                        continue;
                    case ':':
                        result.Append("");
                        continue;
                    case '?':
                        result.Append("");
                        continue;
                    case '#':
                        result.Append("");
                        continue;
                    case '!':
                        result.Append("");
                        continue;
                    case '@':
                        result.Append("");
                        continue;
                    case '/':
                        result.Append("");
                        continue;
                    case '\\':
                        result.Append("");
                        continue;
                    case '\'':
                        result.Append("");
                        continue;
                    case '(':
                        result.Append("");
                        continue;
                    case ')':
                        result.Append("");
                        continue;
                    case '-':
                        result.Append("");
                        continue;
                    case '.':
                        result.Append("");
                        continue;
                    case ',':
                        result.Append("");
                        continue;
                    case '+':
                        result.Append("");
                        continue;
                }

                if (!CharUnicodeInfo.GetUnicodeCategory(normalizedString[i]).Equals(UnicodeCategory.NonSpacingMark))
                {
                    result.Append(normalizedString[i]);
                }
            }

            return result.ToString();
        }
    }

}
