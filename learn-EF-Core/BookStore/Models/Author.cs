using System.Collections.Generic;
using BookStore.Auditable;

namespace BookStore.Models
{
    public class Author : IAuditable
    {
        public int AuthorId { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public ICollection<Book> PublishedWorks { get; set; } = new HashSet<Book>();
    }
}