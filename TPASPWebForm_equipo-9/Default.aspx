<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TPASPWebForm_equipo_9.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container my-5">

        <br />

        <div class="row align-items-center">
            <div class="col">
                <h1 style="color: #4E5861">Compra desde casa!</h1>
            </div>
            <div class="col">
                <h5 style="color: #4E5861">Tu destino para descubrir, elegir y comprar...</h5>
            </div>
        </div>

        <br />

        <div class="row align-items-center">
            <div class="col">
                <h5 style="color: #4E5861">Categoria</h5>
                <asp:DropDownList ID="dropDownCategoria" CssClass="form-select" runat="server" OnSelectedIndexChanged="dropDownCategoria_SelectedIndexChanged"></asp:DropDownList>
                <h5 style="color: #4E5861">Marca</h5>
                <asp:DropDownList ID="dropDownMarca" CssClass="form-select" runat="server" OnSelectedIndexChanged="dropDownMarca_SelectedIndexChanged"></asp:DropDownList>
            </div>
            <div class="col">
                <asp:Button ID="btnFiltrar" Text="Filtrar articulos" runat="server" OnClick="btnFiltrar_Click" />

                <br /> <%--Quitar br despues de acomodar el padding--%>
                <br />

                <asp:Button ID="btnReset" Text="Limpiar filtros" runat="server" OnClick="btnReset_Click" />
            </div>
        </div>

        <hr />
        <div class="row row-cols-1 row-cols-md-3 g-4">
        <%-- Decide si mostrar una lista filtrada o la lista completa --%> 
        <% if (mostrarFiltrado)
            {
                if (listaFiltrada.Count > 0 && listaFiltrada != null)
                {%>
                    <asp:Repeater ID="repeaterArticulosFiltrados" runat="server">
                        <ItemTemplate>
                            <div class="card mb-3" style="max-width: 540px;">
                                <div class="row g-0">
                                    <div class="col-md-4">
                                        <img src="<%# Eval("Imagen") %>" class="img-fluid rounded-start" alt="...">
                                    </div>
                                    <div class="col-md-8">
                                        <div class="card-body">
                                            <h5 class="card-title"><%# Eval("Nombre") %></h5>
                                            <p class="card-text"><%# Eval("Descripcion") %></p>
                                            <p class="card-text"><small class="text-body-secondary"><%# Eval("Precio") %></small></p>
                                            <asp:Button ID="btnDetalle" Text="Ver detalle" runat="server" OnClick="btnDetalle_Click" CommandArgument='<%# Eval("ID") %>' />
                                            <asp:Button ID="btnAgregarArticulo" Text="Agregar al carrito" runat="server" OnClick="btnAgregar_Click" CommandArgument='<%# Eval("ID") %>' />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
               <% }
                   else
                   {
                    %>
                    <h1>No hay artículos para filtrar...</h1>
                    <%
                            }
                        }
                        else
                        {
                            if (listaArticulos.Count > 0 && listaArticulos != null)
                            {%>
                    <asp:Repeater ID="repeaterArticulos" runat="server">
                        <ItemTemplate>
                            <div class="card mb-3" style="max-width: 540px;">
                                <div class="row g-0">
                                    <div class="col-md-4">
                                        <img src="<%# Eval("Imagen") %>" class="img-fluid rounded-start" alt="...">
                                    </div>
                                    <div class="col-md-8">
                                        <div class="card-body">
                                            <h5 class="card-title"><%# Eval("Nombre") %></h5>
                                            <p class="card-text"><%# Eval("Descripcion") %></p>
                                            <p class="card-text"><small class="text-body-secondary"><%# Eval("Precio") %></small></p>
                                            <asp:Button ID="btnDetalle" Text="Ver detalle" runat="server" OnClick="btnDetalle_Click" CommandArgument='<%# Eval("ID") %>' />
                                            <asp:Button ID="btnAgregarArticulo" Text="Agregar al carrito" runat="server" OnClick="btnAgregar_Click" CommandArgument='<%# Eval("ID") %>' />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
               <% }
                   else
                   {
                    %>
                    <h1>No hay artículos para filtrar...</h1>
                    <%
                            }
                        } %>
           </div>
                
    </div>

    <script type="text/javascript">
        function openModal1() {
            var myModal = new bootstrap.Modal(document.getElementById('articleModal'), { keyboard: false });
            myModal.show();
        }
    </script>

    <div class="modal fade" id="articleModal" tabindex="-1" aria-labelledby="Articulo" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="Articulo">"<%= articuloSeleccionado.Nombre %>"</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <%--Se carga el carrousel de imagenes--%>
                    <div id="carouselExample" class="carousel slide">
                        <div class="carousel-inner">
                            <%for(int i = 0; i < articuloSeleccionado.Imagenes.Count; i++)
                              {
                                    if(i == 0)
                                    {%>
                                        <div class="carousel-item active">
                                            <img src="<%=articuloSeleccionado.Imagenes[i] %>" class="d-block w-100" alt="...">
                                        </div>
                                     <%
                                    }
                                    else
                                    { %>
                                        <div class="carousel-item">
                                            <img src="<%=articuloSeleccionado.Imagenes[i] %>" class="d-block w-100" alt="...">
                                        </div>
                                    <%
                                    }
                              }%>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>
                    <%--Muestra la descripcion y el precio--%>
                    <p><%= articuloSeleccionado.Descripcion %></p>
                    <p><%= articuloSeleccionado.Precio %></p>
                </div>
                <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        
                        <%--Me esta tirando error por null, asi que habria que revisarlo para que pase bien las cosas--%>
                        <%--<asp:Button ID="btnAgregarArticulo" Text="Agregar al carrito" runat="server" OnClick="btnAgregar_Click" CommandArgument="<%= articuloSeleccionado.ID %>" />--%>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
