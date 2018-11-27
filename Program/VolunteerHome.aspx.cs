using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Web.Configuration;
using System.Data.SqlClient;

public partial class VolunteerHome : System.Web.UI.Page
{

    System.Data.SqlClient.SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString);

    string ImageString;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnUser_Click(object sender, EventArgs e)
    {
        Response.Redirect("NewUser.aspx", false);
    }



    protected void btnAddModal_Click(object sender, EventArgs e)
    {


        Animals newAnimal = new Animals(
           "Red Falcon",
           "Buddy",
           txtAddName.Text,
           ddlAddType.SelectedValue.ToString(),
          ddlAddStatus.SelectedValue,
           DateTime.Today,
           "Staff"

           );

        FileUpload1.SaveAs(Server.MapPath("Images\\Animals\\" + FileUpload1.FileName));
        ImageString = "~\\Images\\Animals\\" + FileUpload1.FileName;

        string creatAnimal = "Insert into [dbo].[Animal] values (@Species, @ScientificName, @AnimalName, @AnimalType, @Status, @Image, @LastUpdated, @LastUpdatedBy)";
        SqlCommand addAnimal = new SqlCommand(creatAnimal, sc);
        sc.Open();
        addAnimal.Parameters.AddWithValue("@Species", newAnimal.getSpecies());
        addAnimal.Parameters.AddWithValue("@ScientificName", newAnimal.getScientificName());
        addAnimal.Parameters.AddWithValue("@AnimalName", newAnimal.getAnimalName());
        addAnimal.Parameters.AddWithValue("@AnimalType", newAnimal.getAnimalType());
        addAnimal.Parameters.AddWithValue("@Status", newAnimal.getStatus());
        addAnimal.Parameters.AddWithValue("@LastUpdated", newAnimal.getLastUpdated());
        addAnimal.Parameters.AddWithValue("@LastUpdatedBy", newAnimal.getLastUpdatedBy());
        addAnimal.Parameters.AddWithValue("@Image", ImageString);
        addAnimal.ExecuteNonQuery();

        txtAddName.Text = " ";


    }
}
