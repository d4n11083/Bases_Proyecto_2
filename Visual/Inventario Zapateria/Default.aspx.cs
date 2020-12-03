using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Inventario_Zapateria
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void Messagebox(string xMessage)
        {
            Response.Write("<script>alert('" + xMessage + "')</script>");
        }

        private bool checkField(TextBox textbox, bool checkIfNumber, string textBoxName)
        {
            bool isOk = true;
            string message = " Debe ingresar un valor: ";

            if (checkIfNumber)
            {
                int i;
                if (!int.TryParse(textbox.Text, out i))
                {
                    message = " En este espacio solo se pueden colocar números: ";
                    isOk = false;
                }
            }

            if (textbox.Text == String.Empty)
            {
                isOk = false;
                message += textBoxName;
            }


            if (!isOk)
            {
                Messagebox(message);
            }

            return isOk;
        }

        private void searchBy(string data, string key)
        {
            LabelConsole.Text = " Buscar " + data + " por " + key;
        }

        protected void btnSearchID_Click(object sender, EventArgs e)
        {
            if (checkField(TextBoxSearch, true, "Busqueda por Id"))
            {
                searchBy(TextBoxSearch.Text, btnSearchID.ID);
            }
        }

        protected void btnSearchModel_Click(object sender, EventArgs e)
        {
            if( checkField( TextBoxSearch, false, "Busqueda por Modelo" ))
            {
                searchBy(TextBoxSearch.Text, btnSearchModel.ID);
            }
        }

        protected void btnSearchStyle_Click(object sender, EventArgs e)
        {
            if( checkField( TextBoxSearch, false, "Busqueda por Estilo" ))
            {
                searchBy(TextBoxSearch.Text, btnSearchStyle.ID);
            }
        }

        protected void btnSearchColour_Click(object sender, EventArgs e)
        {
            if( checkField( TextBoxSearch, false, "Busqueda por Color" ))
            {
                searchBy(TextBoxSearch.Text, btnSearchColour.ID);
            }
        }

        protected void btnSearchSize_Click(object sender, EventArgs e)
        {
            if (checkField(TextBoxSearch, true, "Busqueda por Talla"))
            {
                searchBy(TextBoxSearch.Text, btnSearchSize.ID);
            }
        }

        protected void btnSearchLine_Click(object sender, EventArgs e)
        {
            if (checkField(TextBoxSearch, false, "Busqueda por Linea"))
            {
                searchBy(TextBoxSearch.Text, btnSearchLine.ID);
            }
        }
    }
}