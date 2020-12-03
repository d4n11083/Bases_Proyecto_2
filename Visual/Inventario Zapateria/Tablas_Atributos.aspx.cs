using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Inventario_Zapateria
{
    public partial class Tablas_Atributos : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void Messagebox(string xMessage)
        {
            Response.Write("<script>alert('" + xMessage + "')</script>");
        }

        private bool checkField( TextBox textbox, bool checkIfNumber, string textBoxName)
        {
            bool isOk = true;
            string message = " Debe ingresar un valor: ";

            if( checkIfNumber)
            {
                int i;
                if (!int.TryParse(textbox.Text, out i))
                {
                    message = " En este espacio solo se pueden colocar números: ";
                    isOk = false;
                }
            }

            if( textbox.Text == String.Empty)
            {
                isOk = false;
                message += textBoxName;
            }


            if( !isOk)
            {
                Messagebox(message);
            }

            return isOk;
        }

        protected void BtnAddStyle_Click(object sender, EventArgs e)
        {
            if( checkField(TextBoxStyleAdd, false, "Estilo"))
            {
                SqlDataSourceStyle.InsertParameters["estilo"].DefaultValue = TextBoxStyleAdd.Text;
                SqlDataSourceStyle.Insert();
                Response.Redirect("Tablas_Atributos");
                LabelConsole.Text = TextBoxStyleAdd.Text + " agregado en Estilos";
            }


        }

        protected void BtnAddColour_Click(object sender, EventArgs e)
        {
            if (checkField(TextBoxColourAdd, false, "Color"))
            {
                SqlDataSourceColour.InsertParameters["color"].DefaultValue = TextBoxColourAdd.Text;
                SqlDataSourceColour.Insert();
                Response.Redirect("Tablas_Atributos");
                LabelConsole.Text = TextBoxColourAdd.Text + " agregado en Colores";
            }

        }

        protected void BtnAddSize_Click(object sender, EventArgs e)
        {
            if (checkField(TextBoxStyleAdd, true, "Talla"))
            {
                SqlDataSourceSize.InsertParameters["talla"].DefaultValue = TextBoxSizeAdd.Text;
                SqlDataSourceSize.Insert();
                Response.Redirect("Tablas_Atributos");
                LabelConsole.Text = TextBoxSizeAdd.Text + " agregado en Tallas";
            }
        }

        protected void BtnAddLine_Click(object sender, EventArgs e)
        {
            if( checkField(TextBoxLineAdd, false, "Linea") ){
                SqlDataSourceLine.InsertParameters["genero"].DefaultValue = TextBoxLineAdd.Text;
                SqlDataSourceLine.Insert();
                Response.Redirect("Tablas_Atributos");
                LabelConsole.Text = TextBoxLineAdd.Text + " agregado en Lineas";
            }
        }
    }
}