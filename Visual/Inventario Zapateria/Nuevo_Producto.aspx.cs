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

            List<DropDownList> dropDowns = Panel1.Controls.OfType<DropDownList>().ToList();

            foreach (DropDownList ddl in dropDowns)
            {
                FillDropDownList(ddl, ddl.ID);
            }

        }

        public void Messagebox(string xMessage)
        {
            Response.Write("<script>alert('" + xMessage + "')</script>");
        }

        private void FillDropDownList(DropDownList dropDown, string key)
        {
            List<string> lista = new List<string>();
            lista.Add(key + "Hola");
            lista.Add(key + "Hola2");
            lista.Add(key + "Hola3");

            foreach (string t in lista)
            {
                ListItem li = new ListItem();
                li.Value = t;
                li.Text = t;
                dropDown.Items.Add(li);
            }
        }


        private void CreateNewShoe(int id)
        {
            List<string> fieldNameList = new List<string>();
            fieldNameList.Add("Linea");
            fieldNameList.Add("Estilo");
            fieldNameList.Add("Color");
            fieldNameList.Add("Talla");

            foreach (string fieldName in fieldNameList)
            {
                Label labelField = new Label();
                labelField.ID = fieldName + id.ToString();
                labelField.Text = fieldName + " : ";

                DropDownList dropList = new DropDownList();
                dropList.ID = fieldName + id.ToString();
                FillDropDownList(dropList, fieldName);


                Panel1.Controls.Add(labelField);
                Panel1.Controls.Add(dropList);

            }

            Label labelQuantity = new Label();
            labelQuantity.ID = "Cantidad" + id.ToString();
            labelQuantity.Text = "Cantidad : ";

            TextBox textBoxField = new TextBox();
            textBoxField.ID = "Cantidad" + id.ToString();

            Panel1.Controls.Add(labelQuantity);
            Panel1.Controls.Add(textBoxField);

        }

        protected void SaveShoe(object sender, EventArgs e)
        {
            List<DropDownList> dropDowns = Panel1.Controls.OfType<DropDownList>().ToList();
            List<TextBox> textBoxes = Panel1.Controls.OfType<TextBox>().ToList();

            int total = textBoxes.Count;
            string elements = "{ ";

            for (int i = 0; i < total; i++)
            {
                string shoe = "Modelo: " + textBoxModelo.Text + " ,Descripcion: " + TextBoxDescripcion.Text;
                for (int x = 0; i < 4; i++)
                {
                    shoe += " ," + dropDowns.First().ID + ": ";
                    shoe += dropDowns.First().SelectedValue;
                    dropDowns.RemoveAt(0);

                }
                shoe += " ,Cantidad: ";
                shoe += textBoxes.First().Text;
                textBoxes.RemoveAt(0);
                shoe += "  }";
                elements += shoe;

            }

            labelConsole.Text = elements;

            Messagebox(elements);
        }

        protected void addShoe(object sender, EventArgs e)
        {
            labelConsole.Text = "AddShoe";
        }


    }
}