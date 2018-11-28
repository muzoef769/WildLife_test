using System;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class AddAnimal : System.Web.UI.Page
{
    public string ImageString;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void BtnAddAnimal(object sender, EventArgs e)
    {
        FileUpload1.SaveAs(Server.MapPath("Images\\Animals\\" + FileUpload1.FileName));
        ImageString = "~\\Images\\Animals\\" + FileUpload1.FileName;
        Animals animal = new Animals(null, null, 
            txtName.Text, drpAnimalType.SelectedValue, 
            drpStatus.SelectedValue, DateTime.Today,
            Session["UserFullName"].ToString(), ImageString);

        string insertIntoAnimal = "INSERT INTO Animal(Species, ScientifcName, AnimalName, AnimalType, Status, Image, LastUpdated, LastUpdatedBy) VALUES" +
            "(@Species, @Scientific, @Animal, @AnimalType, @Status, @Image, @LastUpdated, @LUB)";
        using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString))
        {
            connection.Open();
            using(SqlCommand command = new SqlCommand(insertIntoAnimal, connection))
            {
                command.Parameters.AddWithValue("@Species", animal.getSpecies());
                command.Parameters.AddWithValue("@ScientifcName", animal.getScientificName());
                command.Parameters.AddWithValue("@Animal", animal.getAnimalName());
                command.Parameters.AddWithValue("@AnimalType", animal.getAnimalType());
                command.Parameters.AddWithValue("@Status", animal.getStatus());
                command.Parameters.AddWithValue("@Image", animal.getImage());
                command.Parameters.AddWithValue("@LastUpdated", animal.getLastUpdated());
                command.Parameters.AddWithValue("@LUB", animal.getLastUpdatedBy());

                command.ExecuteNonQuery();

            }
        }
    }
}