using System;
using System.Linq;
using System.Sec;
using System.Security.Principal;
using BookStore.Auditable;
using BookStore.Models;
using Microsoft.EntityFrameworkCore;

namespace BookStore
{
    public class StoreDbContext : DbContext
    {
        public DbSet<Store> Stores { get; private set; }

        public StoreDbContext(string connectionString) : base(BuildOptionsFrom(connectionString))
        {
        }

        public StoreDbContext(DbContextOptions options) : base(options)
        {
        }

        private static StoreDbContext BuildOptionsFrom(string connectionString)
        {
            return new DbContextOptionsBuilder()
                   .UseSqlServer(connectionString)
                   .Options;
        }

        public Func<DateTime> TimestampProvider { get; set; } = () => DateTime.UtcNow;

        public Func<string> GetCurrentUserName { get; set; } = () => WindowsIdentity.GetCurrent().Name;

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            var auditableEntities = modelBuilder.Model.GetEntityTypes().Where(x => typeof(IAuditable).IsAssignableFrom(x.ClrType));

            foreach (var entity in auditableEntities)
            {
                entity.AddProperty(AuditableConstants.ColumnNames.CreatedBy, typeof(string));
                entity.AddProperty(AuditableConstants.ColumnNames.CreatedAt, typeof(DateTime));
                entity.AddProperty(AuditableConstants.ColumnNames.UpdatedBy, typeof(string));
                entity.AddProperty(AuditableConstants.ColumnNames.UpdatedAt, typeof(DateTime?));
            }

            base.OnModelCreating(modelBuilder);
        }

        public override int SaveChanges()
        {
            var modifiedEntities = ChangeTracker.Entries().Where(e => e.State == EntityState.Added || e.State == EntityState.Modified);

            foreach (var entity in modifiedEntities)
            {
                if (entity.Entity is IAuditable)
                {
                    if (entity.State == EntityState.Added)
                    {
                        entity.Property(AuditableConstants.ColumnNames.CreatedBy).CurrentValue = GetCurrentUserName();
                        entity.Property(AuditableConstants.ColumnNames.CreatedAt).CurrentValue = TimestampProvider();
                    }
                    else
                    {
                        entity.Property(AuditableConstants.ColumnNames.UpdatedBy).CurrentValue = GetCurrentUserName();
                        entity.Property(AuditableConstants.ColumnNames.UpdatedAt).CurrentValue = TimestampProvider();
                    }
                }
            }

            return base.SaveChanges();
        }
    }
}

}