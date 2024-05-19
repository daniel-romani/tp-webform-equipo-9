using Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class CarritoManager
    {
        private List<Articulo> _carrito;
        private int CantidadArticulos;
        public CarritoManager()
        {
            _carrito = new List<Articulo>();
        }

        public void AgregarArticulo(Articulo articulo)
        {
            _carrito.Add(articulo);
        }

        public void EliminarArticulo(int id)
        {
            var articulo = _carrito.FirstOrDefault(a => a.ID == id);
            if (articulo != null)
            {
                _carrito.Remove(articulo);
            }
        }

        public List<Articulo> ObtenerArticulos()
        {
            return _carrito;
        }
    }
}
