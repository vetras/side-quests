using Microsoft.EntityFrameworkCore;
using SamuraiApp.domain;

namespace SamuraiApp.Data
{
    public class SamuraiContext : DbContext
    {
        public DbSet<Samurai> Samurais { get; set; }
        public DbSet<Quote> Quotes { get; set; }
        public DbSet<Clan> Clans { get; set; }

        private const string ConnectionString = @"Server=127.0.0.1,1433;
                                                   Database=samuraiApp;
                                                   User Id=SA;
                                                   Password=<Samur41AppStrongP@ssw0rd>
                                                ";

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(ConnectionString);
        }
    }
}