using Microsoft.EntityFrameworkCore;
using Talycap.API.Models;

namespace Talycap.API.Repositories
{
        public class ClienteRepository : IClienteRepository
        {
            private readonly ApplicationDbContext _context;

            public ClienteRepository(ApplicationDbContext context)
            {
                _context = context;
            }

            public async Task<Cliente?> ObtenerPorIdentificacionAsync(string identificacion)
            {
            try
            {
                // Consumiendo el Procedimiento Almacenado con EF Core
                var cliente = await _context.Clientes
                    .FromSqlInterpolated($"EXEC sp_ObtenerClientePorIdentificacion {identificacion}")
                    .ToListAsync();

                return cliente.FirstOrDefault();
            }
            catch (Exception ex)
            {

                throw;
            }

            }
        }
}
