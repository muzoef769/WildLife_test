using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

// not needed anymore

public partial class Home : System.Web.UI.Page
{
    System.Data.SqlClient.SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString);

    string ImageString;
    protected void Page_Load(object sender, EventArgs e)
    {
        //lblCurrentMonth.Text = DateTime.Today.ToString("MM/dd/yyyy");

        System.Data.SqlClient.SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString);

        //if (Session["Username"] != null)
        //{


        //try
        //{

        //    sc.Open();
        //    System.Data.SqlClient.SqlCommand findType = new System.Data.SqlClient.SqlCommand();
        //    findType.Connection = sc;
        //    // SELECT PASSWORD STRING WHERE THE ENTERED USERNAME MATCHES
        //    findType.CommandText = "select [UserType] from [dbo].[User] where Username = @Username AND UserType = @UserType";

        //    findType.Parameters.AddWithValue("@Username", Session["Username"]);
        //    findType.Parameters.AddWithValue("@UserType", "Staff");


        //    SqlDataReader reader = findType.ExecuteReader(); // create a reader


        //    if (reader.HasRows) // if the username is an Admin, Create User button appears
        //    {
        //        while (reader.Read())
        //        {
        //            btnUser.Visible = true;
        //        }
        //    }
        //    sc.Close();
        //}
        //catch
        //{
        //    sc.Close();
        //    Response.Redirect("Error.aspx", false);
        //}
        //}

    }

    protected void btnUser_Click(object sender, EventArgs e)
    {
        Response.Redirect("NewUser.aspx", false);
    }



    protected void btnAddModal_Click(object sender, EventArgs e)
    {


        Animals newAnimal = new Animals(
           "",
           "",
           txtAddName.Text,
           ddlAddType.SelectedValue.ToString(),
          ddlAddStatus.SelectedValue,
           DateTime.Today,
           Convert.ToString(Session["Fullname"])
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

    protected void btnStatusUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            foreach (GridViewRow row in statusGridView.Rows)
            {
                CheckBox chkStatus = (row.Cells[3].FindControl("chkStatus") as CheckBox);
                String userName = (row.Cells[2].Text);
                if (chkStatus.Checked)
                {
                    updateRow(userName, "Approved");
                }
                //else
                //{
                //    updateRow(userName, "Not Approved");
                //}
            }
        }
        catch (Exception)
        {

        }
    }

    protected void updateRow(String userName, String MarkStatus)
    {
        sc.Close();
        string updateStatus = "UPDATE [dbo].[User] SET UserStatus = @MarkStatus WHERE Username = @Username";
        sc.Open();
        SqlCommand statusUpdate = new SqlCommand(updateStatus, sc);
        statusUpdate.Parameters.AddWithValue("@MarkStatus", MarkStatus);
        statusUpdate.Parameters.AddWithValue("@Username", userName);
        statusUpdate.ExecuteNonQuery();
        statusGridView.DataBind();

    }

    //protected void btnLogOut_Click(object sender, EventArgs e)
    //{
    //    Session.Clear();
    //    Response.Redirect("Default.aspx", true);
    //}
}