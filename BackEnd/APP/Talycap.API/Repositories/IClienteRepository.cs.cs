using Talycap.API.Models;

namespace Talycap.API.Repositories
{
    public interface IClienteRepository
    {
        Task<Cliente?> ObtenerPorIdentificacionAsync(string identificacion);
    }
}
