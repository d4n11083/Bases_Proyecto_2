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
        <asp:DropDownList ID="ddlLine"  runat="server"  DataSourceID="SqlDataSourceline" DataTextField="genero" 
            DataValueField="id_Linea" AppendDataBoundItems="true"></asp:DropDownList>

        <asp:SqlDataSource ID="SqlDataSourceLine" runat="server" ConnectionString="<%$ ConnectionStrings:InventarioZapateriaConnectionStringJoshua %>" SelectCommand="LineasSelect_usp" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter DefaultValue="NULL" Name="id_Linea" Type="DBNull" />
            </SelectParameters>
        </asp:SqlDataSource>



        <asp:Label ID="labelStyle" runat="server" Text="Estilo: "></asp:Label>
        <asp:DropDownList ID="ddlStyle" runat="server" DataSourceID="SqlDataSourceStyle" DataTextField="estilo" DataValueField="id_Estilo"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSourceStyle" runat="server" ConnectionString="<%$ ConnectionStrings:InventarioZapateriaConnectionStringJoshua %>" SelectCommand="EstilosSelect_usp" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter DefaultValue="NULL" Name="id_Estilo" Type="DBNull" />
            </SelectParameters>
        </asp:SqlDataSource>



        <asp:Label ID="labelColour" runat="server" Text="Color: "></asp:Label>
        <asp:DropDownList ID="ddlColour" runat="server" DataSourceID="SqlDataSourceColour" DataTextField="color" DataValueField="id_Color"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSourceColour" runat="server" ConnectionString="<%$ ConnectionStrings:InventarioZapateriaConnectionStringJoshua %>" SelectCommand="ColoresSelect_usp" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter DefaultValue="NULL" Name="id_Color" Type="DBNull" />
            </SelectParameters>
        </asp:SqlDataSource>



        <asp:Label ID="labelSize" runat="server" Text="Talla: "></asp:Label>
        <asp:DropDownList ID="ddlSize" runat="server" DataSourceID="SqlDataSourceSize" DataTextField="talla" DataValueField="id_Talla"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSourceSize" runat="server" ConnectionString="<%$ ConnectionStrings:InventarioZapateriaConnectionStringJoshua %>" SelectCommand="TallasSelect_usp" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter DefaultValue="NULL" Name="id_Talla" Type="DBNull" />
            </SelectParameters>
        </asp:SqlDataSource>



        <asp:Label ID="labelQuantity" runat="server" Text="Cantidad: "></asp:Label>
        <asp:TextBox ID="textBoxQuant" runat="server"></asp:TextBox>

    </asp:Panel>



    <div>
    <asp:Button ID="SaveButton" runat="server" OnClick="SaveShoe" onClientClick="SaveShoe" Text="Guardar" />
    <asp:Button ID="AddButton" runat="server" OnClick="addShoe" OnClientClick="addShoe" Text="  +  " />

    <asp:Label ID="labelConsole" runat="server" ></asp:Label>
    <asp:SqlDataSource ID="SqlDataSourceShoes" runat="server" ConnectionString="<%$ ConnectionStrings:InventarioZapateriaConnectionStringJoshua %>" InsertCommand="ZapatosInsert_usp" InsertCommandType="StoredProcedure" SelectCommand="ZapatosSelect_usp" SelectCommandType="StoredProcedure" >
        <InsertParameters>
            <asp:Parameter Name="modelo" Type="String" />
            <asp:Parameter Name="descripcion" Type="String" />
            <asp:Parameter Name="fk_color" Type="Int32" />
            <asp:Parameter Name="fk_talla" Type="Int32" />
            <asp:Parameter Name="fk_estilo" Type="Int32" />
            <asp:Parameter Name="fk_linea" Type="Int32" />
        </InsertParameters>
        </asp:SqlDataSource>
    </div>
    

</asp:Content>
