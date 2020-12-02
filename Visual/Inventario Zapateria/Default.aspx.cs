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

        private void searchBy(string data, string key)
        {
            LabelConsole.Text = " Buscar " + data + " por " + key;
        }

        protected void btnSearchID_Click(object sender, EventArgs e)
        {
            searchBy(TextBoxSearch.Text, btnSearchID.ID);

        }

        protected void btnSearchModel_Click(object sender, EventArgs e)
        {
            searchBy(TextBoxSearch.Text, btnSearchModel.ID);
        }

        protected void btnSearchStyle_Click(object sender, EventArgs e)
        {
            searchBy(TextBoxSearch.Text, btnSearchStyle.ID);
        }

        protected void btnSearchColour_Click(object sender, EventArgs e)
        {
            searchBy(TextBoxSearch.Text, btnSearchColour.ID);
        }

        protected void btnSearchSize_Click(object sender, EventArgs e)
        {
            searchBy(TextBoxSearch.Text, btnSearchSize.ID);
        }

        protected void btnSearchLine_Click(object sender, EventArgs e)
        {
            searchBy(TextBoxSearch.Text, btnSearchLine.ID);
        }
    }
}