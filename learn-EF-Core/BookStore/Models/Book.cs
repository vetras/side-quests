using System;
using System.Collections.Generic;
using BookStore.Auditable;

namespace BookStore.Models
{
    public class Book : IAuditable
    {
        public int BookId { get; set; }
        public string Title { get; set; }
        public string ISBN { get; set; }
        public DateTime ReleaseDate { get; set; }
        public ICollection<Author> Authors { get; set; } = new HashSet<Author>();
    }
}