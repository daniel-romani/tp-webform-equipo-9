using Modelo;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace TPASPWebForm_equipo_9
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        public List<Articulo> listaArticulos = new List<Articulo>();
        private string categoriaSeleccionada;
        private string marcaSeleccionada;
        protected bool mostrarFiltrado = false;
        public Articulo articuloSeleccionado = new Articulo();
        public int id;
       
       

        public List<Articulo> listaFiltrada { get; set; }

        private void CargarComponentes()
        {
            ArticuloNegocio negocio = new ArticuloNegocio();
            try
            {
                listaArticulos = negocio.listar();
                AgruparImagenes();
                EliminarRepetidos();
            }
            catch (Exception ex)
            {
                System.Console.WriteLine(ex.Message);    
                throw;
            }
        }

        private List<Articulo> EncontrarRepetidos()
        {
            var articulosAgregados = new HashSet<int>();
            List<Articulo> repetidos = new List<Articulo>();
            foreach (Articulo articulo in listaArticulos)
            {
                if (!articulosAgregados.Contains(articulo.ID))
                {
                    articulosAgregados.Add(articulo.ID);
                }
                else
                {
                    repetidos.Add(articulo);
                }
            }
            return repetidos;
        }
        private void AgruparImagenes()
        {
            List<Articulo> repetidos = EncontrarRepetidos();
            foreach (Articulo articulo in listaArticulos)
            {
                foreach (Articulo repetido in repetidos)
                {
                    if (repetido.ID == articulo.ID)
                    {
                        articulo.Imagenes.Add(repetido.Imagenes[0]);
                    }
                }
            }
        }
        private void EliminarRepetidos()
        {
            List<Articulo> repetidos = EncontrarRepetidos();
            foreach (Articulo repetido in repetidos)
            {
                listaArticulos.Remove(repetido);
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            CargarComponentes();

            if (!IsPostBack)
            {
                repeaterArticulos.DataSource = listaArticulos;
                repeaterArticulos.DataBind();

                //Carga las DropDownList
                CategoriaNegocio categoriaNegocio = new CategoriaNegocio();
                List<Categoria> categorias = categoriaNegocio.listar();
                dropDownCategoria.DataTextField = "Descripcion";
                dropDownCategoria.DataValueField = "Id";
                dropDownCategoria.DataSource = categorias;
                dropDownCategoria.DataBind();
                //ddlCategoria.Items.Insert(0, new ListItem("<Selecciona Categoria>", ""));
                dropDownCategoria.Items.Insert(0, new ListItem("<Selecciona Categoria>", string.Empty));


                MarcaNegocio marcaNegocio = new MarcaNegocio();
                List<Marca> marcas = marcaNegocio.listar();
                dropDownMarca.DataTextField = "Descripcion";
                dropDownMarca.DataValueField = "Id";
                dropDownMarca.DataSource = marcas;
                dropDownMarca.DataBind();
                //ddlMarcas.Items.Insert(0, new ListItem("<Selecciona Marca>", ""));
                dropDownMarca.Items.Insert(0, new ListItem("<Selecciona Marca>", string.Empty));
            }

        }

        protected void dropDownCategoria_SelectedIndexChanged(object sender, EventArgs e)
        {
            categoriaSeleccionada = dropDownCategoria.SelectedValue;
        }
        protected void dropDownMarca_SelectedIndexChanged(object sender, EventArgs e)
        {
            marcaSeleccionada = dropDownMarca.SelectedValue;
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            dropDownCategoria.SelectedIndex = 0;
            dropDownMarca.SelectedIndex = 0;
        }
        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            listaFiltrada = new List<Articulo>();

            try
            {
                //Lista filtrada solo por Marcas
                if (categoriaSeleccionada == null && marcaSeleccionada != null)
                {
                    foreach (Articulo item in listaArticulos)
                    {
                        if (item.Marca.Id == int.Parse(marcaSeleccionada))
                        {
                            listaFiltrada.Add(item);
                        }
                    }
                    mostrarFiltrado = true;
                }

                //Lista filtrada solo por Categorias
                else if (categoriaSeleccionada != null && marcaSeleccionada == null)
                {
                    foreach (Articulo item in listaArticulos)
                    {
                        if (item.Categoria.Id == int.Parse(categoriaSeleccionada))
                        {
                            listaFiltrada.Add(item);
                        }
                    }
                    mostrarFiltrado = true;
                }
                //Lista filtrada por ambas condiciones
                else if (categoriaSeleccionada != null && marcaSeleccionada != null)
                {
                    foreach (Articulo item in listaArticulos)
                    {
                        if (item.Categoria.Id == int.Parse(categoriaSeleccionada) && item.Marca.Id == int.Parse(marcaSeleccionada))
                        {
                            listaFiltrada.Add(item);
                        }
                    }
                    mostrarFiltrado = true;
                }
                else if (string.IsNullOrEmpty(categoriaSeleccionada) && string.IsNullOrEmpty(marcaSeleccionada))
                {
                    mostrarFiltrado = false;
                    return;
                }


                repeaterArticulosFiltrados.DataSource = listaFiltrada;
                repeaterArticulosFiltrados.DataBind();
            }
            catch (Exception ex)
            {
                System.Console.WriteLine(ex.Message);
            }

        }
        
        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            decimal Acumulado = 0;
            System.Console.WriteLine("Agregando Item a carrito");
            List<Articulo> listaarticulo = new List<Articulo>();
            ArticuloNegocio articuloNegocio = new ArticuloNegocio();
            listaarticulo = articuloNegocio.listar();
            Articulo articulo = new Articulo();

            string str_id = ((System.Web.UI.WebControls.Button)sender).CommandArgument;
            int ID = int.Parse(str_id);

            // Verifica si el artículo ya está en el carrito
            List<ItemShop> carrito = (List<ItemShop>)Session["Carrito"];
            //Busca un elemento dentro de la lista donde cohincida el Id para encontrar repetidos.
            ItemShop itemExistente = carrito.FirstOrDefault(item => item.ID == ID);
            //En caso de que hayan repetidos, itemExistente queda distinto a null, por lo que solo se incrementa la cantidad
            if (itemExistente != null)
            {

                // Si el artículo ya está en el carrito, incrementa la cantidad
                itemExistente.Cantidad += 1;
            }
            else
            {
                // Si devuelve null, el item no se encuentra en la lista, por lo que crea uno.
                ItemShop nuevoItem = new ItemShop();
                nuevoItem = getArticuloCarrito(ID);

                carrito.Add(nuevoItem);
                articulo = listaarticulo.Find(item => item.ID == ID);
                WebForm2.AgregarArticuloCarrito(articulo);
            }
             Acumulado = CalcularTotalAcumulado(carrito, listaarticulo);

            // Actualiza el carrito con cada click
            Session["Carrito"] = carrito;
            Session["TotalAcumulado"] = Acumulado;

            // creo un objeto master (la Master Page) y llamo a su funcion 
            MasterPage master = (MasterPage)this.Master;
            master.CargarArticulosEnCarrito();
        }

       

        public ItemShop getArticuloCarrito(int ID)
        {
            ItemShop itemFiltrado = new ItemShop();

            foreach(Articulo item in listaArticulos)
            {
                if(item.ID == ID)
                {
                    itemFiltrado.ID = item.ID;
                    itemFiltrado.Nombre = item.Nombre;
                    itemFiltrado.Precio = item.Precio;
                    itemFiltrado.Cantidad = 1;
                    return itemFiltrado;
                }
            }
            
            return null;

        }

        public Articulo getArticulo(int ID)
        {
            foreach (Articulo item in listaArticulos)
            {
                if (item.ID == ID)
                { 
                    return item;
                }
            }

            return null;

        }

        protected void btnDetalle_Click(object sender, EventArgs e)
        {
            System.Console.WriteLine("Entro a Detalle_Click");

            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal1();", true);

            string str_id = ((System.Web.UI.WebControls.Button)sender).CommandArgument;
            int ID = int.Parse(str_id);

            articuloSeleccionado = getArticulo(ID);

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
        
        
    }
}