using Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using System.Net;

namespace TPASPWebForm_equipo_9
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        private static CarritoManager carritoManager = new CarritoManager();

        public List<ItemShop> carrito;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarCarrito();
            }
        }

        protected void btnRedirigir_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx", false);
        }
        
        private void CargarCarrito()
        {
            GridViewCarrito.DataSource = carritoManager.ObtenerArticulos();
            GridViewCarrito.DataBind();
        }

        protected void GridViewCarrito_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Eliminar")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                carritoManager.EliminarArticulo(id);
                CargarCarrito();
            }

        }
        public static void AgregarArticuloCarrito (Articulo articulo)
        {
            carritoManager.AgregarArticulo(articulo);
           
        }
       
    }
}