<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="TPASPWebForm_equipo_9.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1 style="color: #4E5861">Carrito de compras</h1>

    <div style="text-align: center;">
        <h1 id="empeza_el_carrito" style="color: #4E5861" runat="server">¡Empieza un carrito de compras!</h1>
        <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="currentColor" class="bi bi-bag-x-fill" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M10.5 3.5a2.5 2.5 0 0 0-5 0V4h5v-.5zm1 0V4H15v10a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V4h3.5v-.5a3.5 3.5 0 1 1 7 0zM6.854 8.146a.5.5 0 1 0-.708.708L7.293 10l-1.147 1.146a.5.5 0 0 0 .708.708L8 10.707l1.146 1.147a.5.5 0 0 0 .708-.708L8.707 10l1.147-1.146a.5.5 0 0 0-.708-.708L8 9.293 6.854 8.146z" />
        </svg>
        <asp:Button ID="btnRedirigir" CssClass="btn btn-primary" runat="server" OnClick="btnRedirigir_Click" Text="Descubrir Productos" />
    </div>

    <div class="card" style="width: 18rem; background-color: darkgray;">
        <div class="card-body">
            <h5 class="card-title">Resumen de compra</h5>
            <p class="card-subtitle mb-2 text-body-secondary">Aquí verás los importes de tu compra una vez que agregues productos.</p>

        </div>
    </div>
            
    <br />


</asp:Content>
