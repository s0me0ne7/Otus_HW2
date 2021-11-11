using Microsoft.EntityFrameworkCore;

namespace Otus_HW2
{
    public class BaseContext : DbContext
    {
        public DbSet<Clients> Clients { get; set; }
        public DbSet<ClientProducts> ClientProducts { get; set; }
        public DbSet<ProductTypes> ProductTypes { get; set; }

        public BaseContext()
        {
            Database.EnsureCreated();
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseNpgsql("Host=localhost;UserName=postgres;Password=KoT091288;Database=postgres;");
        }
    }
}