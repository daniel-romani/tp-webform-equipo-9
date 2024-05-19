<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TPASPWebForm_equipo_9.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--Carrousel inicial de ofertas, completamente visual y estetico. Se probo el funcionamiento--%>
    <div style="background-color: #F60001;">
        <div id="carousel" class="carousel slide" data-bs-theme="dark" data-bs-ride="carousel" data-bs-pause="false">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img style="object-fit: contain; width: auto; height: 300px" src="https://i.gyazo.com/345f03cb15751fe1241a25224227bf08.png" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img style="object-fit: contain; width: auto; height: 300px" src="https://i.gyazo.com/27c4abd8145462db657642970728e8de.png" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img style="object-fit: contain; width: auto; height: 300px" src="https://i.gyazo.com/e983abd5baa22d6389adc954d6cba476.png" class="d-block w-100" alt="...">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carousel" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carousel" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </div>

    <div class="container my-5">
        <hr />
        <br />
        <div class="row align-items-center">
            <div class="col">
                <h1 style="color: #333333">Compra desde casa!</h1>
                <h5 style="color: #333333">Tu destino para descubrir, elegir y comprar...</h5>
            </div>
        </div>
        <br />

        <div class="row align-items-center">
            <div class="col">
                <h5 style="color: #333333">Categoria</h5>
                <asp:DropDownList ID="dropDownCategoria" CssClass="form-select" runat="server" OnSelectedIndexChanged="dropDownCategoria_SelectedIndexChanged"></asp:DropDownList>

            </div>
            <div class="col">
                <h5 style="color: #333333">Marca</h5>
                <asp:DropDownList ID="dropDownMarca" CssClass="form-select" runat="server" OnSelectedIndexChanged="dropDownMarca_SelectedIndexChanged"></asp:DropDownList>
            </div>
            <div class="col">
                <br />
                <asp:Button ID="btnReset" Text="Limpiar filtros" runat="server" OnClick="btnReset_Click" CssClass="btn btn-secondary me-5 ms-5" />
                <asp:Button ID="btnFiltrar" Text="Filtrar articulos" runat="server" OnClick="btnFiltrar_Click" CssClass="btn btn-primary" />
            </div>
        </div>
        <br />
        <hr />
        <br />
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
                                    <asp:Button ID="btnDetalle" Text="Ver detalle" runat="server" OnClick="btnDetalle_Click" CommandArgument='<%# Eval("ID") %>' CssClass="me-2" />
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
                    <div class="card mb-3 mx-1" style="max-width: 400px; background-color: #FFFFFF">
                        <div class="row g-0">
                            <div class="col-md-4">
                                <img src="<%# Eval("Imagen") %>" class="img-fluid rounded-start" alt="...">
                            </div>
                            <div class="col-md-8">
                                <div class="card-body">
                                    <h5 class="card-title"><%# Eval("Nombre") %></h5>
                                    <p class="card-text"><%# Eval("Descripcion") %></p>
                                    <p class="card-text"><small class="text-body-secondary"><%# Eval("Precio") %></small></p>
                                    <asp:Button ID="btnDetalle" Text="Ver detalle" runat="server" OnClick="btnDetalle_Click" CommandArgument='<%# Eval("ID") %>' CssClass="btn btn-secondary me-3" />
                                    <asp:Button ID="btnAgregarArticulo" Text="Comprar" runat="server" OnClick="btnAgregar_Click" CommandArgument='<%# Eval("ID") %>' CssClass="btn btn-success" />
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
                }%>
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
                    <div id="carouselExample" class="carousel slide" data-bs-theme="dark">
                        <div class="carousel-indicators">
                              <%for(int i = 0; i < articuloSeleccionado.Imagenes.Count; i++)
                              {
                                    if(i == 0)
                                    {%>
                                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="<%=i %>" class="active" aria-current="true" aria-label="Slide <%=i+1 %>"></button>
                                     <%
                                    }
                                    else
                                    { %>
                                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="<%=i %>" aria-label="Slide <%=i+1 %>"></button>
                                    <%
                                    }
                              }%>
                        </div>
                        <div class="carousel-inner">
                            <%for(int i = 0; i < articuloSeleccionado.Imagenes.Count; i++)
                              {
                                    if(i == 0)
                                    {%>
                                        <div class="carousel-item active">
                                            <img style="object-fit: contain; width: 400px; height: 400px" src="<%=articuloSeleccionado.Imagenes[i] %>" class="d-block w-100" alt="...">
                                        </div>
                                     <%
                                    }
                                    else
                                    { %>
                                        <div class="carousel-item">
                                            <img style="object-fit: contain; width: 400px; height: 400px" src="<%=articuloSeleccionado.Imagenes[i] %>" class="d-block w-100" alt="...">
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
