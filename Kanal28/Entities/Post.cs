using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Kanal28.Entities
{
    public class Post
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Body { get; set; }
        public int AuthorId { get; set; }
        public DateTime AddedDate { get; set; }
        public string Keyword { get; set; }
        public string MetaDescription { get; set; }
        public string Thumbnail { get; set; }
        public bool CornerStone { get; set; }
        public int? CategoryId { get; set; }
        public bool Breaking { get; set; }
        public bool Published { get; set; }
        public int ViewCount { get; set; }
    }
}