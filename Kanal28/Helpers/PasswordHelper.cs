using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Security;

namespace Kanal28.Helpers
{
    public static class PasswordHelper
    {
        public static string GenerateRandomPassword()
        {
            return Membership.GeneratePassword(8, 2);
        }

        public static void HashPassword(string password, out byte[] passwordHash, out byte[] passwordSalt)
        {
            using (var hmac = new HMACSHA512())
            {
                passwordSalt = hmac.Key;
                passwordHash = hmac.ComputeHash(Encoding.UTF8.GetBytes(password));
            }
        }

        public static bool VerifyPassword(string password, byte[] passwordSalt, byte[] passwordHash)
        {
            using (var hmac = new HMACSHA512(passwordSalt))
            {
                var key = hmac.ComputeHash(Encoding.UTF8.GetBytes(password));
                for (int i = 0; i < key.Length; i++)
                {
                    if(passwordHash[i] != key[i])
                    {
                        return false;
                    }
                }
                return true;
            }
        }
    }
}