using Modelo;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

namespace TPASPWebForm_equipo_9
{
    public partial class WebForm2 : System.Web.UI.Page
    {
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
            GridViewCarrito.Columns[0].Visible = false;
            GridViewCarrito.DataBind();
        }
        
        protected void GridViewCarrito_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            MasterPage master = this.Master as MasterPage;
            if (e.CommandName == "Eliminar")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                
                EliminarArticulosEnCarrito(id);
                CargarCarrito();
                
            }
            if (e.CommandName == "Agregar")
            {

                ArticuloNegocio articuloNegocio = new ArticuloNegocio();
                List<Articulo> listaArticulo = articuloNegocio.listar();
                int id = Convert.ToInt32(e.CommandArgument);

                List<ItemShop> carrito = (List<ItemShop>)Session["Carrito"];

                var articulo = carrito.FirstOrDefault(a => a.ID == id);

                articulo.Cantidad += 1;

                decimal totalAcumulado = CalcularTotalAcumulado(carrito, listaArticulo);

                Session["Carrito"] = carrito;
                Session["TotalAcumulado"] = totalAcumulado;

                CargarCarrito();


            }

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

            
            ArticuloNegocio articuloNegocio = new ArticuloNegocio();
            List<Articulo> listaArticulo = articuloNegocio.listar();

            if (Session["Carrito"] != null)
            {
                
                List<ItemShop> carrito = (List<ItemShop>)Session["Carrito"];

                
                ItemShop itemAEliminar = carrito.FirstOrDefault(item => item.ID == articuloID);

                if (itemAEliminar != null)
                {
                    
                    itemAEliminar.Cantidad -= 1;

                    
                    if (itemAEliminar.Cantidad <= 0)
                    {
                        carrito.Remove(itemAEliminar);
                    }

                  
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
            ResetCarrito();
            Response.Redirect("CompraFinalizada.aspx");
        }
        private void ResetCarrito()
        {
            Session["Carrito"] = null;
        }

    }
}