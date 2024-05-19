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
            List<ItemShop> carrito = (List<ItemShop>)Session["Carrito"];
            GridViewCarrito.DataSource = carrito;
            GridViewCarrito.DataBind();
        }
        
        protected void GridViewCarrito_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            MasterPage master = this.Master as MasterPage;
            if (e.CommandName == "Eliminar")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                carritoManager.EliminarArticulo(id);
                
                EliminarArticulosEnCarrito(id);
                CargarCarrito();
                
            }

        }

        public static void AgregarArticuloCarrito (Articulo articulo)
        {
            carritoManager.AgregarArticulo(articulo);
           
        }


        public decimal CalcularTotalAcumulado(List<ItemShop> carrito, List<Articulo> listaarticulo)
        {
            decimal totalAcumulado = 0;
            foreach (var itemExistente in carrito)
            {

                var articulo = listaarticulo.FirstOrDefault(a => a.ID == itemExistente.ID);

                if (articulo != null)
                {
                    decimal subtotal = articulo.Precio * itemExistente.Cantidad;
                    totalAcumulado += subtotal;
                }
            }

            return totalAcumulado;
        }

       

        public void EliminarArticulosEnCarrito(int articuloID)
        {
            List<Articulo> listaArticulo = new List<Articulo>();
            ArticuloNegocio articuloNegocio = new ArticuloNegocio();
            listaArticulo = articuloNegocio.listar();

            if (Session["Carrito"] != null)
            {
                List<ItemShop> carrito = (List<ItemShop>)Session["Carrito"];


                ItemShop itemAEliminar = carrito.FirstOrDefault(item => item.ID == articuloID);
                if (itemAEliminar != null)
                {

                    carrito.Remove(itemAEliminar);

                    decimal totalAcumulado = CalcularTotalAcumulado(carrito, listaArticulo);
                    Session["Carrito"] = carrito;
                    Session["TotalAcumulado"] = totalAcumulado;
                    

                }
            }

            MasterPage master = (MasterPage)this.Master;
            master.CargarArticulosEnCarrito();


        }

        protected void btnRedirigirCompra_Click(object sender, EventArgs e)
        {
            Response.Redirect("CompraFinalizada.aspx");
        }

    }
}