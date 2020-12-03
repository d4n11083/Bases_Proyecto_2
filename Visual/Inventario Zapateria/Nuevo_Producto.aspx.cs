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

        private void Messagebox(string xMessage)
        {
            Response.Write("<script>alert('" + xMessage + "')</script>");
        }

        private bool checkFields()
        {
            bool isOk = true;
            string empyFields = " Por favor rellene los siguientes espacios vacios: ";

            if( textBoxModelo.Text == "")
            {
                isOk = false;
                empyFields += " Modelo ";
            }

            if( textBoxQuant.Text == "")
            {
                isOk = false;
                empyFields += " Cantidad ";
            }

            int i;
            if (!int.TryParse(textBoxQuant.Text, out i))
            {
                empyFields += " En Cantidad solo se pueden colocar números ";
                isOk = false;
            }

            if ( TextBoxDescripcion.Text == "")
            {
                isOk = false;
                empyFields += " Descripcion ";
            }

            if( !isOk)
            {
                Messagebox(empyFields);
            }

            return isOk;
        }

        protected void addShoe(object sender, EventArgs e)
        {

            if (checkFields())
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
}