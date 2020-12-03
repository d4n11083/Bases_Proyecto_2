using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;



namespace Inventario_Zapateria
{
    public partial class Nuevo_Producto : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void Messagebox(string xMessage)
        {
            Response.Write("<script>alert('" + xMessage + "')</script>");
        }

        protected void addShoe(object sender, EventArgs e)
        {
            SqlDataSourceShoes.InsertParameters["modelo"].DefaultValue = textBoxModelo.Text;
            SqlDataSourceShoes.InsertParameters["descripcion"].DefaultValue = TextBoxDescripcion.Text;
            SqlDataSourceShoes.InsertParameters["fk_color"].DefaultValue = ddlColour.SelectedValue;
            SqlDataSourceShoes.InsertParameters["fk_talla"].DefaultValue = ddlSize.SelectedValue;
            SqlDataSourceShoes.InsertParameters["fk_estilo"].DefaultValue = ddlStyle.SelectedValue;
            SqlDataSourceShoes.InsertParameters["fk_linea"].DefaultValue = ddlLine.SelectedValue;
            SqlDataSourceShoes.Insert();

            Messagebox("Elemento anadido");
            Response.Redirect("Nuevo_Producto");

        }


    }
}