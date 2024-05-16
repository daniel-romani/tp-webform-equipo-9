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
                <asp:DropDownList ID="Categoria" CssClass="form-select" runat="server"></asp:DropDownList>
                <h5 style="color: #4E5861">Marca</h5>
                <asp:DropDownList ID="Marca" CssClass="form-select" runat="server"></asp:DropDownList>
            </div>
            <div class="col">
                <asp:Button ID="btnFiltrar" Text="Filtrar articulos" runat="server" />

                <br /> <%--Quitar br despues de acomodar el padding--%>
                <br />

                <asp:Button ID="btnReset" Text="Limpiar filtros" runat="server" />
            </div>
        </div>

        <hr />
        <div class="row row-cols-1 row-cols-md-3 g-4">
            <div class="card mb-3" style="max-width: 540px;">
                <div class="row g-0">
                    <div class="col-md-4">
                        <img src="..." class="img-fluid rounded-start" alt="...">
                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                            <h5 class="card-title">Nombre Articulo</h5>
                            <p class="card-text">Descripcion Articulo</p>
                            <p class="card-text"><small class="text-body-secondary">Precio</small></p>
                            <asp:Button ID="Button1" Text="Ver detalle" runat="server" />
                            <asp:Button ID="Button2" Text="Agregar al carrito" runat="server" /> <%--Dejar para el final de la implementacion, quiza no llegamos--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </div>

    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    ...
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>


    <div class="modal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Modal title</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>Modal body text goes here.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
