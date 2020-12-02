<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Inventario_Zapateria._Default" %>



<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row mb-2" >


    <asp:Panel ID="PanelSearch" runat="server"  class="col-md-2" Height="202px"  BackColor="Silver">
        <asp:Label ID="LabelSearch" runat="server" Text="Buscar Por" BackColor="Gray"></asp:Label>
        <br />
        <asp:LinkButton ID="btnSearchID" runat="server" OnClick="btnSearchID_Click">Identificador</asp:LinkButton>
        <br />
        <asp:LinkButton ID="btnSearchModel" runat="server" OnClick="btnSearchModel_Click">Modelo</asp:LinkButton>
        <br />
        <asp:LinkButton ID="btnSearchStyle" runat="server" OnClick="btnSearchStyle_Click" >Estilo</asp:LinkButton>
        <br />
        <asp:LinkButton ID="btnSearchColour" runat="server" OnClick="btnSearchColour_Click">Color</asp:LinkButton>
        <br />
        <asp:LinkButton ID="btnSearchSize" runat="server" OnClick="btnSearchSize_Click">Talla</asp:LinkButton>
        <br />
        <asp:LinkButton ID="btnSearchLine" runat="server" OnClick="btnSearchLine_Click">Linea</asp:LinkButton>
        <br />
        <br />
        <asp:TextBox ID="TextBoxSearch" runat="server" class="col-md-12"></asp:TextBox>

    </asp:Panel>

    <div class="col-md-1"></div>

    <asp:Panel ID="PanelShoeData" runat="server" class="col-md-8" BackColor="#CCCCCC">
        <asp:Label ID="LabelShoeData" runat="server" Text="Inventario"></asp:Label>

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



    </asp:Panel>

    </div>
    
    <asp:Label ID="LabelConsole" runat="server" Text="Label"></asp:Label>


</asp:Content>
