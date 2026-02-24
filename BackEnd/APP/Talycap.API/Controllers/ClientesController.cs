using Microsoft.AspNetCore.Mvc;
using Talycap.API.Services;

namespace Talycap.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ClientesController : ControllerBase
    {
        private readonly IClienteService _clienteService;

        public ClientesController(IClienteService clienteService)
        {
            _clienteService = clienteService;
        }

        // GET: api/clientes/123456789
        [HttpGet("{identificacion}")]
        public async Task<IActionResult> GetCliente(string identificacion)
        {
            var cliente = await _clienteService.ConsultarClienteAsync(identificacion);

            if (cliente == null)
            {
                return NotFound(new { mensaje = "Cliente no encontrado." });
            }

            return Ok(cliente);
        }
    }
}
