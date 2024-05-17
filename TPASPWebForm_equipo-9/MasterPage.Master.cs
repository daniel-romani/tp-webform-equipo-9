using Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPASPWebForm_equipo_9
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        public Articulo articulo = null;
        public int articulosTotales = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Carrito"] == null)
            {
                Session["Carrito"] = new List<ItemShop>();
            }
            if (!IsPostBack)
            {
                CargarArticulosEnCarrito();
            }
        }

        public void CargarArticulosEnCarrito()
        {
            if (Session["Carrito"] != null)
            {
                List<ItemShop> carrito = (List<ItemShop>)Session["Carrito"];

                // Primero limpia la lista
                DropDownList1.Items.Clear();

                // Luego agrega los artículos de la lista a la DropDownList
                foreach (ItemShop item in carrito)
                {
                    ListItem listItem = new ListItem($"{item.Nombre} - ${item.Precio} ({item.Cantidad} en carrito)", item.ID.ToString());
                    DropDownList1.Items.Add(listItem);
                    articulosTotales += item.Cantidad;
                }
            }
        }

        protected void btnCarrito_Click(object sender, EventArgs e)
        {
            Response.Redirect("Carrito.aspx", false);
        }
    }


}