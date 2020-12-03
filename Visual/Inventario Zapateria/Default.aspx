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

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="Groove" HorizontalAlign="Center" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="Black" AllowPaging="True" AllowSorting="True">
        <Columns>
            <asp:BoundField DataField="modelo" HeaderText="modelo" SortExpression="modelo" />
            <asp:BoundField DataField="descripcion" HeaderText="descripcion" SortExpression="descripcion" />
            <asp:BoundField DataField="genero" HeaderText="genero" SortExpression="genero" />
            <asp:BoundField DataField="estilo" HeaderText="estilo" SortExpression="estilo" />
            <asp:BoundField DataField="color" HeaderText="color" SortExpression="color" />
            <asp:BoundField DataField="talla" HeaderText="talla" SortExpression="talla" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:InventarioZapateriaConnectionStringJoshua %>" SelectCommand="ZapatosSelect_usp" SelectCommandType="StoredProcedure" DeleteCommand="ZapatosDelete_usp" DeleteCommandType="StoredProcedure" UpdateCommand="ZapatosUpdate_usp" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="id_Zapato" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="id_Zapato" Type="Int32" />
            <asp:Parameter Name="modelo" Type="String" />
            <asp:Parameter Name="descripcion" Type="String" />
            <asp:Parameter Name="fk_color" Type="Int32" />
            <asp:Parameter Name="fk_talla" Type="Int32" />
            <asp:Parameter Name="fk_estilo" Type="Int32" />
            <asp:Parameter Name="fk_linea" Type="Int32" />
        </UpdateParameters>
        </asp:SqlDataSource>



    </asp:Panel>

    </div>
    
    <asp:Label ID="LabelConsole" runat="server" Text="Label"></asp:Label>


</asp:Content>
