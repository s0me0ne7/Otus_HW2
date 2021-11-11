using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Otus_HW2
{
    [Table("clientproducts")]
    public class ClientProducts
    {
        [Key]
        [Column("id")]
        public long Id { get; set; }

        [Required]
        [Column("client_id")]
        public long ClientId { get; set; }

        [ForeignKey("ClientId")]
        public Clients Clients { get; set; } = null!;

        [Required]
        [Column("product_type_id")]
        public int ProductTypeId { get; set; }

        [ForeignKey("ProductTypeId")]
        public ProductTypes ProductTypes { get; set; } = null!;

    }
}
