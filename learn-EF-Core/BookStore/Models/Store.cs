using System.Collections.Generic;
using BookStore.Auditable;

namespace BookStore.Models
{
    public class Store : IAuditable
    {
        public int StoreId { get; set; }
        public string Name { get; set; }
        public Address Location { get; set; }
        public ICollection<Book> PublishedWorks { get; set; } = new HashSet<Book>();
    }
}