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

        protected void BtnAddStyle_Click(object sender, EventArgs e)
        {

            SqlDataSourceStyle.InsertParameters["estilo"].DefaultValue = TextBoxStyleAdd.Text;
            SqlDataSourceStyle.Insert();
            Response.Redirect("Tablas_Atributos");
            LabelConsole.Text = TextBoxStyleAdd.Text + " agregado en Estilos";

        }

        protected void BtnAddColour_Click(object sender, EventArgs e)
        {
            SqlDataSourceColour.InsertParameters["color"].DefaultValue = TextBoxColourAdd.Text;
            SqlDataSourceColour.Insert();
            Response.Redirect("Tablas_Atributos");
            LabelConsole.Text = TextBoxColourAdd.Text + " agregado en Colores";

        }

        protected void BtnAddSize_Click(object sender, EventArgs e)
        {
            SqlDataSourceSize.InsertParameters["talla"].DefaultValue = TextBoxSizeAdd.Text;
            SqlDataSourceSize.Insert();
            Response.Redirect("Tablas_Atributos");
            LabelConsole.Text = TextBoxSizeAdd.Text + " agregado en Tallas";

        }

        protected void BtnAddLine_Click(object sender, EventArgs e)
        {
            SqlDataSourceLine.InsertParameters["genero"].DefaultValue = TextBoxLineAdd.Text;
            SqlDataSourceLine.Insert();
            Response.Redirect("Tablas_Atributos");
            LabelConsole.Text = TextBoxLineAdd.Text + " agregado en Lineas";

        }
    }
}