using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddAnimal : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void BtnAddAnimal(object sender, EventArgs e)
    {
        Animals animal = new Animals(null, null, 
            txtName.Text, drpAnimalType.SelectedValue, 
            drpStatus.SelectedValue, DateTime.Today,
            Session["UserFullName"].ToString());

    }
}