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
        System.Data.SqlClient.SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString);
    }

    protected void btnUser_Click(object sender, EventArgs e)
    {
        Response.Redirect("NewUser.aspx", false);
    }

    protected void btnAddModal_Click(object sender, EventArgs e)
    {


        Animals newAnimal = new Animals(
           HttpUtility.HtmlEncode(""),
           HttpUtility.HtmlEncode(""),
           HttpUtility.HtmlEncode(txtAddName.Text),
           HttpUtility.HtmlEncode(ddlAddType.SelectedValue),
           HttpUtility.HtmlEncode(ddlAddStatus.SelectedValue),
           DateTime.Today,
           HttpUtility.HtmlEncode(Session["UserFullName"].ToString()));

        FileUpload1.SaveAs(Server.MapPath("Images\\Animals\\" + FileUpload1.FileName));
        ImageString = HttpUtility.HtmlEncode("~\\Images\\Animals\\") + FileUpload1.FileName;

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
}