using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Otus_HW2
{
    [Table("product_type")]
    [Index(nameof(Name), IsUnique = true)]
    public class ProductTypes
    {   [Key]
        [Column("id")]
        public int Id { get; set; }

        [Required]
        [Column("name")]
        public string Name { get; set; } = null!;
    }
}
