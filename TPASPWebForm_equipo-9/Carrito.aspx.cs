using Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPASPWebForm_equipo_9
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        public List<ItemShop> carrito;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRedirigir_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx", false);
        }
    }
}