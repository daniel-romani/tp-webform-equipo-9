<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="TPASPWebForm_equipo_9.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="padding-top: 50px; padding-bottom: 20px">
        <h1 style="color: #4E5861">Carrito</h1>
    </div>


    <% 
        List<Modelo.ItemShop> carrito = Session["Carrito"] as List<Modelo.ItemShop> ?? new List<Modelo.ItemShop>();

        if (carrito.Count == 0)
        {
    %>
    <div style="text-align: center;">
        <h1 id="empeza_el_carrito" style="color: #4E5861" runat="server">¡Empieza un carrito de compras!</h1>
        <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="currentColor" class="bi bi-bag-x-fill" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M10.5 3.5a2.5 2.5 0 0 0-5 0V4h5v-.5zm1 0V4H15v10a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V4h3.5v-.5a3.5 3.5 0 1 1 7 0zM6.854 8.146a.5.5 0 1 0-.708.708L7.293 10l-1.147 1.146a.5.5 0 0 0 .708.708L8 10.707l1.146 1.147a.5.5 0 0 0 .708-.708L8.707 10l1.147-1.146a.5.5 0 0 0-.708-.708L8 9.293 6.854 8.146z" />
        </svg>
        <hr />
        <asp:Button ID="btnRedirigir1" CssClass="btn btn-warning" runat="server" OnClick="btnRedirigir_Click" Text="&#x1F4E6; ¡Descubre muchas ofertas! &#x1F4E6;" />
    </div>

      <%}
        else
        {  %>
        
            <div style="padding-bottom: 10px">
                <asp:GridView ID="GridViewCarrito" runat="server" AutoGenerateColumns="false" CssClass="table table-striped" OnRowCommand="GridViewCarrito_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="ID" />
                        <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                        <asp:BoundField DataField="Precio" HeaderText="Precio" />
                         <asp:BoundField DataField="Total" HeaderText="Total" />
                        <asp:TemplateField HeaderText="Cantidad">
                            <ItemTemplate>
                                <asp:Label ID="LabelCantidad" runat="server" Text='<%# Eval("Cantidad") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="ButtonEliminar" runat="server" CssClass="btn btn-danger" Text="Eliminar" CommandName="Eliminar" CommandArgument='<%# Eval ("ID") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="ButtonAgregar" runat="server" CssClass="btn btn-danger" Text="Agregar" CommandName="Agregar" CommandArgument='<%#Eval ("ID") %>'  />
                        </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            <div style="padding-bottom: 30px">
                <div class="card" style="width: 18rem; background-color: #FFFFFF;">
                    <div class="card-body">
                        <h6 class="card-title">Resumen de compra</h6>
                        <hr />
                        <%decimal totalRecuperado = (decimal)(Session["TotalAcumulado"] ?? 0m); %>
                        <p class="card-subtitle mb-2 text-body-secondary" style="padding-top: 10px">
                            <strong><span style="color: #191919;font-size: 1.1em">Total:</span></strong>
                            <strong><span style="color: #198754; margin-left: auto; font-size: 1.1em; padding-left: 15px">$ <%=totalRecuperado%> </span> </strong>
                        </p>
                        <div  style="padding-top: 10px">
                            <asp:Button ID="btnContinuarCompra" CssClass="btn btn-success" runat="server" OnClick="btnRedirigirCompra_Click" Text="Continuar Compra" />
                        </div>
                    </div>
                </div>
            </div>
            <hr />

            <div style="text-align: center; padding-bottom: 80px">
                <h1 id="H1" style="color: #4E5861" runat="server">¿Estas pensando en otros productos?</h1>
                <hr />
                <asp:Button ID="btnRedirigir2" CssClass="btn btn-warning" runat="server" OnClick="btnRedirigir_Click" Text="&#x1F4E6; Descubrir nuevas ofertas &#x1F4E6;" />
            </div>
      <%}%>


    <br />

</asp:Content>
