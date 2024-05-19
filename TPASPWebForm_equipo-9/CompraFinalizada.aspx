<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CompraFinalizada.aspx.cs" Inherits="TPASPWebForm_equipo_9.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="text-align: center; padding-bottom: 80px; padding-top: 80px">
        <h1> &#x1F381 ¡Compra realizada con exito! &#x1F389</h1>
        <p>Gracias por su compra, atte: Equipo 9.</p>
    </div>
    <hr />

    <div style="text-align: center; padding-bottom: 80px">
        <h1 id="H1" style="color: #4E5861" runat="server">¿Estas pensando en otros productos?</h1>
        <hr />
        <asp:Button ID="btnRedirigir_default" CssClass="btn btn-warning" runat="server" OnClick="btnRedirigirDefault_Click" Text="&#x1F4E6; Descubrir nuevas ofertas &#x1F4E6;" />
    </div>

</asp:Content>
