﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TPASPWebForm_equipo_9.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--Carrousel inicial de ofertas, completamente visual y estetico. Se probo el funcionamiento--%>
    <div style="background-color: #F60001; padding-top: 20px; padding-bottom: 30px">
        <div id="carousel" class="carousel slide" data-bs-theme="dark" data-bs-ride="carousel" data-bs-pause="false">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img style="object-fit: contain; width: auto; height: 300px" src="https://i.gyazo.com/94b95b5ae21059200e892f050ba822a3.png" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img style="object-fit: contain; width: auto; height: 300px" src="https://i.gyazo.com/a0ad38194283c93925d8f3f81662858d.png" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img style="object-fit: contain; width: auto; height: 300px" src="https://i.gyazo.com/5b7836e0725f93332d5d2cec61eab235.png" class="d-block w-100" alt="...">
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
            <%-- Muestra la lista de articulos --%>
       <% if (listaFiltrada != null && listaFiltrada.Count > 0)
          {%>
                <asp:Repeater ID="repeaterArticulosFiltrados" runat="server">
                    <ItemTemplate>
                        <div class="card mb-3 mx-1" style="max-width: 400px; background-color: #FFFFFF">
                            <div class="row g-0">
                                <div class="col-md-4">
                                    <img src="<%# Eval("Imagen") %>" onerror="this.src='https://png.pngtree.com/png-vector/20210604/ourmid/pngtree-gray-network-placeholder-png-image_3416659.jpg'" class="img-fluid rounded-start" alt="...">
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body">
                                        <h5 class="card-title"><%# Eval("Nombre") %></h5>
                                        <p class="card-text"><%# Eval("Descripcion") %></p>
                                        <strong><span style="color: #198754; margin-left: auto; font-size: 1.1em;">$ <%# Eval("Precio") %></span> </strong>
                                        <p class="card-text"><small class="text-body-secondary"></small></p>
                                        <hr />
                                        <asp:Button ID="btnDetalle" Text="Ver detalle" runat="server" OnClick="btnDetalle_Click" CommandArgument='<%# Eval("ID") %>' CssClass="btn btn-secondary me-3" />
                                        <asp:Button ID="btnAgregarArticulo" Text="Comprar" runat="server" OnClick="btnAgregar_Click" CommandArgument='<%# Eval("ID") %>' CssClass="btn btn-success" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
      <%  }
          else
          {
          %>
            <h1>No hay artículos para filtrar...</h1>
        <%
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
                    <h1 class="modal-title fs-5" id="Articulo" style="max-width: 90%; word-wrap: break-word;">"<%= articuloSeleccionado.Nombre %>"</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" style="overflow-y: auto">
                    <%--Se carga el carrousel de imagenes--%>
                    <div style="background-color: #bebebe">
                    <div id="carouselExample" class="carousel slide" data-bs-theme="dark">
                        <div class="carousel-indicators">
                              <%for(int i = 0; i < articuloSeleccionado.Imagenes.Count; i++)
                              {
                                    if(i == 0)
                                    {%>
                                        <button type="button" data-bs-target="#carouselExample" data-bs-slide-to="<%=i %>" class="active" aria-current="true" aria-label="Slide <%=i+1 %>"></button>
                                     <%
                                    }
                                    else
                                    { %>
                                        <button type="button" data-bs-target="#carouselExample" data-bs-slide-to="<%=i %>" aria-label="Slide <%=i+1 %>"></button>
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
                                            <img style="object-fit: contain; width: 400px; height: 400px" src="<%=articuloSeleccionado.Imagenes[i] %>"  onerror="this.src='https://png.pngtree.com/png-vector/20210604/ourmid/pngtree-gray-network-placeholder-png-image_3416659.jpg'" class="d-block w-100" alt="...">
                                        </div>
                                     <%
                                    }
                                    else
                                    { %>
                                        <div class="carousel-item">
                                            <img style="object-fit: contain; width: 400px; height: 400px" src="<%=articuloSeleccionado.Imagenes[i] %>"  onerror="this.src='https://png.pngtree.com/png-vector/20210604/ourmid/pngtree-gray-network-placeholder-png-image_3416659.jpg'" class="d-block w-100" alt="...">
                                        </div>
                                    <%
                                    }
                              }%>
                        </div>
                        </div>
                        <hr />
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
                    <div class="texto-contenedor">
                        <p style="font-size: 1.2em;"><strong>Descripción</strong></p>
                        <p style="font-size: 1.1em;"> <%= articuloSeleccionado.Descripcion %></p>
                    </div>

                </div>
                <div class="modal-footer">
                    <div class="precio">
                        <p>
                            <strong><span style="color: #191919; font-size: 1.1em">Precio:</span></strong>
                            <strong><span style="color: #198754; font-size: 1.1em; padding-left: 10px">$ <%= articuloSeleccionado.Precio %></span></strong>
                        </p>
                    </div>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
