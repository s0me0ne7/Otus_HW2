using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Otus_HW2
{
    [Table("clients")]
    [Index(nameof(Email), IsUnique = true)]
    public class Clients
    {
        [Key]
        [Column("id")]
        public long Id { get; set; }

        [Required]
        [Column("first_name")]
        public string FirstName { get; set; } = null!;

        [Required]
        [Column("last_name")]
        public string LastName { get; set; } = null!;

        [Column("second_name")]
        public string? SecondName { get; set; }

        [Required]
        [Column("email")]
        public string Email { get; set; } = null!;
    }
}
