using System.ComponentModel.DataAnnotations;

namespace Talycap.API.Models
{
    public class Cliente
    {
        [Key]
        public int Id { get; set; }
        public string Identificacion { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Email { get; set; }
        public DateTime FechaNacimiento { get; set; }
        public string Telefono { get; set; }
    }
}
