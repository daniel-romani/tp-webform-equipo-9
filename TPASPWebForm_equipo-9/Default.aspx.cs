using Modelo;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace TPASPWebForm_equipo_9
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        public List<Articulo> listaArticulos = new List<Articulo>();

        private void CargarComponentes()
        {
            ArticuloNegocio negocio = new ArticuloNegocio();
            try
            {
                listaArticulos = negocio.listar();
                //AgruparImagenes();
                //EliminarRepetidos();
            }
            catch (Exception ex)
            {
                System.Console.WriteLine(ex.Message);    
                throw;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }
    }
}