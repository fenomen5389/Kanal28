using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Kanal28.Entities
{
    public class Author
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string VisibleName { get; set; }
        public string Email { get; set; }
        public byte[] PasswordHash { get; set; }
        public byte[] PasswordSalt { get; set; }
        public string Biography { get; set; }
        public bool IsAdministrator { get; set; }
    }
}