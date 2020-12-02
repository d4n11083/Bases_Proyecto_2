<%@ Page Title="Nuevo Producto" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Nuevo_Producto.aspx.cs" Inherits="Inventario_Zapateria.Nuevo_Producto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div style="height: 57px; margin-top: 13px" >

        <asp:Label ID="labelModelo" runat="server" Text="Modelo"></asp:Label>
        <asp:TextBox ID="textBoxModelo" runat="server"></asp:TextBox>
        <asp:Label ID="labelDescripcion" runat="server" Text="Descripción"></asp:Label>
        <asp:TextBox ID="TextBoxDescripcion" runat="server"></asp:TextBox>

    </div>

    <asp:Panel ID="Panel1" runat="server" updatemode="Always">

        <asp:Label ID="labelLine" runat="server" Text="Linea: "></asp:Label>
        <asp:DropDownList ID="ddlLine"  runat="server"></asp:DropDownList>

        <asp:Label ID="labelStyle" runat="server" Text="Estilo: "></asp:Label>
        <asp:DropDownList ID="ddlStyle" runat="server"></asp:DropDownList>

        <asp:Label ID="labelColour" runat="server" Text="Color: "></asp:Label>
        <asp:DropDownList ID="ddlColour" runat="server"></asp:DropDownList>

        <asp:Label ID="labelSize" runat="server" Text="Talla: "></asp:Label>
        <asp:DropDownList ID="ddlSize" runat="server"></asp:DropDownList>

        <asp:Label ID="labelQuantity" runat="server" Text="Cantidad: "></asp:Label>
        <asp:TextBox ID="textBoxQuant" runat="server"></asp:TextBox>

    </asp:Panel>



    <div>
    <asp:Button ID="SaveButton" runat="server" OnClick="SaveShoe" onClientClick="SaveShoe" Text="Guardar" />
    <asp:Button ID="AddButton" runat="server" OnClick="addShoe" OnClientClick="addShoe" Text="  +  " />

    <asp:Label ID="labelConsole" runat="server" ></asp:Label>
    </div>
    

</asp:Content>
