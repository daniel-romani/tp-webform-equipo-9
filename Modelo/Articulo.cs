using System.Collections.Generic;

namespace Modelo
{
    public class Articulo
    {
        public int ID { get; set; }
        public int Cantidad { get; set; }
        public string Codigo { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public Marca Marca { get; set; }  //contendria la id, la descripcion y alguna posible funcion
        public Categoria Categoria { get; set; } //contendria la id, la descripcion y alguna posible funcion
        public decimal Precio { get; set; }
        public Imagen Imagen { get; set; } //contendria la conexion de id con id de articulo, la url y alguna posible funcion.

        public List<string> Imagenes;

        public int id_a_incrementar { get; set; }
    }
}
