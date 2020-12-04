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
        <asp:Button ID="btnUpdate" runat="server" Text="Actualizar Seleccionado" OnClick="allowUpdate_Click" />

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="Groove" HorizontalAlign="Center" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="Black" AllowPaging="True" AllowSorting="True" DataKeyNames="id_Zapato">
        <Columns>

            <asp:BoundField DataField="id_Zapato" HeaderText="id_Zapato" InsertVisible="False" ReadOnly="True" SortExpression="id_Zapato" />
            <asp:BoundField DataField="modelo" HeaderText="modelo" SortExpression="modelo" />
            <asp:BoundField DataField="descripcion" HeaderText="descripcion" SortExpression="descripcion" />
            <asp:BoundField DataField="genero" HeaderText="genero" SortExpression="genero" />
            <asp:BoundField DataField="estilo" HeaderText="estilo" SortExpression="estilo" />
            <asp:BoundField DataField="color" HeaderText="color" SortExpression="color" />
            <asp:BoundField DataField="talla" HeaderText="talla" SortExpression="talla" />
            <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" />
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
        <SelectParameters>
            <asp:Parameter DefaultValue="NULL" Name="id_Zapato" Type="DBNull" />
        </SelectParameters>
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

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:InventarioZapateriaConnectionStringJoshua2 %>" SelectCommand="buscarZapatosporColor" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBoxSearch" Name="color" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

    </asp:Panel>
    </div>
   
    <div class="col-md-3"></div>

    <asp:Panel ID="PanelProcessUpdate" runat="server">

    <div class="row mb-2" >
    

    <div style="height: 57px; margin-top: 13px" class="col-md-2" >
        <asp:Label ID="labelId" runat="server" Text="Id"></asp:Label>
        <asp:Label ID="labelModelo" runat="server" Text="Modelo"></asp:Label>
        <asp:TextBox ID="textBoxModelo" runat="server"></asp:TextBox>
        <asp:Label ID="labelDescripcion" runat="server" Text="Descripción"></asp:Label>
        <asp:TextBox ID="TextBoxDescripcion" runat="server"></asp:TextBox>
        <asp:Label ID="labelQuantity" runat="server" Text="Cantidad: "></asp:Label>
        <asp:TextBox ID="textBoxQuant" runat="server"></asp:TextBox>
        <asp:Button ID="btnProcessUpdate" runat="server" Text="Procesar Update" OnClick="updateRow_Click" OnClientClick="updateRow_Click" />
        
        <asp:SqlDataSource ID="SqlDataSourceUpdate" runat="server" ConnectionString="<%$ ConnectionStrings:InventarioZapateriaConnectionStringJoshua %>" SelectCommand="ZapatosSelect_usp" SelectCommandType="StoredProcedure" UpdateCommand="ZapatosUpdate_usp" UpdateCommandType="StoredProcedure" OnDataBinding="updateRow_Click">
            <SelectParameters>
                <asp:Parameter DefaultValue="" Name="id_Zapato" Type="Int32" />
            </SelectParameters>
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
    </div>

    <div class="col-md-1"></div>

    <asp:Panel ID="Panel1" runat="server" updatemode="Always" class="col-md-6">

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

    </asp:Panel>
    </div>
    </asp:Panel>
    

    <asp:Label ID="LabelConsole" runat="server" Text="Label"></asp:Label>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="true" Visible="false">
        </asp:GridView>




</asp:Content>
