<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Inventario.aspx.cs" Inherits="Inventario_Zapateria.Inventario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="Groove" HorizontalAlign="Center" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="Black">
        <Columns>
            <asp:BoundField DataField="modelo" HeaderText="Modelo" SortExpression="modelo" />
            <asp:BoundField DataField="descripcion" HeaderText="Descripcion" SortExpression="descripcion" />
            <asp:BoundField DataField="genero" HeaderText="Genero" SortExpression="genero" />
            <asp:BoundField DataField="estilo" HeaderText="Estilo" SortExpression="estilo" />
            <asp:BoundField DataField="color" HeaderText="Color" SortExpression="color" />
            <asp:BoundField DataField="talla" HeaderText="Talla" SortExpression="talla" />
        </Columns>
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#242121" />
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:InventarioZapateriaConnectionStringJoshua %>" SelectCommand="ZapatosSelect_usp" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>
