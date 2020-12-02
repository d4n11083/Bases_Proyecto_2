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

        private void addAtribute(string key, string Value)
        {
            LabelConsole.Text = " Anadir:  " + Value + " a " + key;
        }

        protected void BtnAddStyle_Click(object sender, EventArgs e)
        {
            addAtribute("Estilos", TextBoxStyleAdd.Text);
        }

        protected void BtnAddColour_Click(object sender, EventArgs e)
        {
            addAtribute("Colores", TextBoxColourAdd.Text);

        }

        protected void BtnAddSize_Click(object sender, EventArgs e)
        {
            addAtribute("Tallas", TextBoxSizeAdd.Text);

        }

        protected void BtnAddLine_Click(object sender, EventArgs e)
        {
            addAtribute("Lineas", TextBoxLineAdd.Text);

        }
    }
}