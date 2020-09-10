using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace ProductRegister.Models
{
    public class Product
    {
        [Key]
        public int ProductId { get; set; }
        [Column(TypeName = "nvarchar(250)")]
        [Required(ErrorMessage = "This field is required.")]
        [DisplayName("Product Name")]
        public string ProductName { get; set; }
        [Column(TypeName = "varchar(10)")]
        [DisplayName("Product Code")]
        public string ProductCode { get; set; }
        [Column(TypeName = "varchar(100)")]
        public string Type { get; set; }
        [Column(TypeName = "varchar(100)")]
        [DisplayName("Category")]
        public string Category { get; set; }
    }
}
