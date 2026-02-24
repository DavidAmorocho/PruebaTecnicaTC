namespace Talycap.API.DTOs
{
    public class ClienteDTO
    {
        public string Identificacion { get; set; }
        public string NombreCompleto { get; set; }
        public string Email { get; set; }
        public DateTime FechaNacimiento { get; set; }
        public string Telefono { get; set; }
    }
}
