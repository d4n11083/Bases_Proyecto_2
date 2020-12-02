<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Tablas_Atributos.aspx.cs" Inherits="Inventario_Zapateria.Tablas_Atributos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   
     <div class="row mb-2" >
     
    <asp:Panel ID="PanelStyle" class="col-md-6" runat="server" BackColor="#CCFFCC">
        <asp:Label ID="LabelstyleTable" runat="server" Text="Estilos"></asp:Label>
        <br />

        <asp:GridView ID="GridViewStyle" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="Groove" HorizontalAlign="Center" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSourceStyle" ForeColor="Black">
            <Columns>
                <asp:BoundField DataField="id_Estilo" HeaderText="id_Estilo" SortExpression="id_Estilo" />
                <asp:BoundField DataField="estilo" HeaderText="estilo" SortExpression="estilo" />
                <asp:BoundField DataField="disponible" HeaderText="disponible" SortExpression="disponible" />
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
        <asp:SqlDataSource ID="SqlDataSourceStyle" runat="server" ConnectionString="<%$ ConnectionStrings:InventarioZapateriaConnectionStringJoshua %>" SelectCommand="SELECT * FROM [Estilos]"></asp:SqlDataSource>

        <br />
        <asp:TextBox ID="TextBoxStyleAdd" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="BtnAddStyle" runat="server" Text="Agregar Estilo" OnClick="BtnAddStyle_Click" />
    </asp:Panel>
    
         <div class="col-md-1"></div>

    <asp:Panel ID="PanelColour" class="col-md-6" runat="server" BackColor="#CCCCFF">
        <asp:Label ID="LabelColour" runat="server" Text="Colores"></asp:Label>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="Groove" HorizontalAlign="Center" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSourceColour" ForeColor="Black">
            <Columns>
                <asp:BoundField DataField="id_Color" HeaderText="id_Color" SortExpression="id_Color" />
                <asp:BoundField DataField="color" HeaderText="color" SortExpression="color" />
                <asp:BoundField DataField="disponible" HeaderText="disponible" SortExpression="disponible" />
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
        <asp:SqlDataSource ID="SqlDataSourceColour" runat="server" ConnectionString="<%$ ConnectionStrings:InventarioZapateriaConnectionStringJoshua %>" SelectCommand="SELECT * FROM [Colores]"></asp:SqlDataSource>
        
        <br />
        <asp:TextBox ID="TextBoxColourAdd" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="BtnAddColour" runat="server" Text="Agregar Color" OnClick="BtnAddColour_Click" />
    </asp:Panel>

    </div>

    <div class="row mb-2" ></div>

    <div class="row mb-2" >
     
    <asp:Panel ID="PanelSize" runat="server" class="col-md-6"  BackColor="#FFCCCC">
        <asp:Label ID="LabelSize" runat="server" Text="Tallas"></asp:Label>
        <br />
        <asp:GridView ID="GridViewSize" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="Groove" HorizontalAlign="Center" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSourceSize" ForeColor="Black">
            <Columns>
                <asp:BoundField DataField="id_Talla" HeaderText="id_Talla" SortExpression="id_Talla" />
                <asp:BoundField DataField="Talla" HeaderText="Talla" SortExpression="Talla" />
                <asp:BoundField DataField="disponible" HeaderText="disponible" SortExpression="disponible" />
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
        <asp:SqlDataSource ID="SqlDataSourceSize" runat="server" ConnectionString="<%$ ConnectionStrings:InventarioZapateriaConnectionStringJoshua %>" SelectCommand="SELECT * FROM [Tallas]"></asp:SqlDataSource>
        
        <br />
        <asp:TextBox ID="TextBoxSizeAdd" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="BtnAddSize" runat="server" Text="Agregar Talla" OnClick="BtnAddSize_Click" />
    </asp:Panel>
    <div class="col-md-1"></div>
    <asp:Panel ID="PanelLine" runat="server" class="col-md-6"  BackColor="#FFFFCC">
        <asp:Label ID="LabelLine" runat="server" Text="Linea"></asp:Label>
        <br />
        <asp:GridView ID="GridViewLine" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="Groove" HorizontalAlign="Center" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSourceLine" ForeColor="Black">
            <Columns>
                <asp:BoundField DataField="id_Linea" HeaderText="id_Linea" SortExpression="id_Linea" />
                <asp:BoundField DataField="genero" HeaderText="genero" SortExpression="genero" />
                <asp:BoundField DataField="disponible" HeaderText="disponible" SortExpression="disponible" />
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
        <asp:SqlDataSource ID="SqlDataSourceLine" runat="server" ConnectionString="<%$ ConnectionStrings:InventarioZapateriaConnectionStringJoshua %>" SelectCommand="SELECT * FROM [Lineas]"></asp:SqlDataSource>
        
        <br />
        <asp:TextBox ID="TextBoxLineAdd" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="BtnAddLine" runat="server" Text="Agregar Linea" OnClick="BtnAddLine_Click" />
    </asp:Panel>

    </div>
    <asp:Label ID="LabelConsole" runat="server" Text=""></asp:Label>


</asp:Content>
