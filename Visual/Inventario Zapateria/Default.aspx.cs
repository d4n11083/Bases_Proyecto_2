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
            PanelProcessUpdate.Visible = false;
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
                GridView2.DataSource = SqlDataSource2;
                GridView2.DataBind();
                GridView2.Visible = true;
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

        protected void allowUpdate_Click(object sender, EventArgs e)
        {
            if (GridView1.SelectedDataKey != null)
            {
                if (PanelProcessUpdate.Visible)
                {
                    PanelProcessUpdate.Visible = false;
                }
                else
                {
                    PanelProcessUpdate.Visible = true;
                }


                TableCellCollection info = GridView1.SelectedRow.Cells;

                labelId.Text = info[0].Text;
                textBoxModelo.Text = info[1].Text;
                TextBoxDescripcion.Text = info[2].Text;
                textBoxQuant.Text = info[6].Text;


                LabelConsole.Text = info[0].Text;
            }
            else
            {
                Messagebox("Debe Seleccionar la fila a actualizar");
            }
        }

        private void updateRow()
        {
            SqlDataSourceUpdate.UpdateParameters["modelo"].DefaultValue  = textBoxModelo.Text;
            SqlDataSourceUpdate.UpdateParameters["id_Zapato"].DefaultValue = labelId.Text;
            SqlDataSourceUpdate.UpdateParameters["descripcion"].DefaultValue = TextBoxDescripcion.Text;
            SqlDataSourceUpdate.UpdateParameters["fk_color"].DefaultValue = ddlColour.SelectedValue;
            SqlDataSourceUpdate.UpdateParameters["fk_talla"].DefaultValue = ddlSize.SelectedValue;
            SqlDataSourceUpdate.UpdateParameters["fk_estilo"].DefaultValue = ddlStyle.SelectedValue;
            SqlDataSourceUpdate.UpdateParameters["fk_linea"].DefaultValue = ddlLine.SelectedValue;

            try
            {
                SqlDataSourceUpdate.Update();
            }
            catch (Exception except)
            {
                Messagebox("No se Pudo Actualizar: " + except);
            }

            Response.Redirect("default");

        }

        private bool checkFields()
        {
            bool isOk = true;
            string empyFields = " Por favor rellene los siguientes espacios vacios: ";

            if (textBoxModelo.Text == "")
            {
                isOk = false;
                empyFields += " Modelo ";
            }

            if (textBoxQuant.Text == "")
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

            if (TextBoxDescripcion.Text == "")
            {
                isOk = false;
                empyFields += " Descripcion ";
            }

            if (!isOk)
            {
                Messagebox(empyFields);
            }

            return isOk;
        }

        protected void updateRow_Click(object sender, EventArgs e)
        {
            LabelConsole.Text = textBoxModelo.Text;

            if (checkFields())
            {
                updateRow();
            }

        }


    }
}