using Talycap.API.DTOs;

namespace Talycap.API.Services
{
    public interface IClienteService
    {
        Task<ClienteDTO?> ConsultarClienteAsync(string identificacion);
    }
}
