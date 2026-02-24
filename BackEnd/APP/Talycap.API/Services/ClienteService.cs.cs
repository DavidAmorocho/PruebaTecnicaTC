using Talycap.API.DTOs;
using Talycap.API.Repositories;

namespace Talycap.API.Services
{
    public class ClienteService : IClienteService
    {
        private readonly IClienteRepository _repository;

        public ClienteService(IClienteRepository repository)
        {
            _repository = repository;
        }

        public async Task<ClienteDTO?> ConsultarClienteAsync(string identificacion)
        {
            var clienteDb = await _repository.ObtenerPorIdentificacionAsync(identificacion);

            if (clienteDb == null) return null;

            // Mapeo manual de Entity a DTO
            return new ClienteDTO
            {
                Identificacion = clienteDb.Identificacion,
                NombreCompleto = $"{clienteDb.Nombre} {clienteDb.Apellido}",
                Email = clienteDb.Email,
                FechaNacimiento = clienteDb.FechaNacimiento,
                Telefono = clienteDb.Telefono,
            };
        }
    }
}
