using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Drawing;
using System.IO;

public partial class Themes : System.Web.UI.Page
{
    private static double themeCost;
    public static Int32 id;
    System.Data.SqlClient.SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void btnAddProgram_Click(object sender, EventArgs e)
    {
        if (ddlAddProgramType.SelectedValue == "Online")
        {
            themeCost = 0.00;
        }
        if (ddlAddProgramType.SelectedValue == "Live")
        {
            themeCost = 250.00;
        }

        Programs newTheme = new Programs(
            txtAddProgramName.Text,
            ddlAddProgramType.SelectedValue,
            themeCost,
            Convert.ToInt32(txtAddProgramCapacity.Text),
            DateTime.Today,
            Session["UserFullName"].ToString());



        string addressInsert = "INSERT INTO Program (ProgramName, ProgramType, ProgramCost, Capacity, LastUpdated, LastUpdatedBy) VALUES (" +
            "@name, @type, @cost, @capacity, @LU, @LUB)";
        connection.Open();
        using (SqlCommand command = new SqlCommand(addressInsert, connection))
        {
            command.Parameters.AddWithValue("@name", newTheme.ProgramName1);
            command.Parameters.AddWithValue("@type", newTheme.ProgramType1);
            command.Parameters.AddWithValue("@cost", newTheme.ProgramCost1);
            command.Parameters.AddWithValue("@capacity", newTheme.Capacity1);
            command.Parameters.AddWithValue("@LU", newTheme.LastUpdated1);
            command.Parameters.AddWithValue("@LUB", newTheme.LastUpdatedBy1);

            command.ExecuteNonQuery();

        }





        GridView1.DataBind();
        txtAddProgramCapacity.Text = null;
        txtAddProgramName.Text = null;


    }

    protected void GridView1_RowDataBound1(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView1, "Select$" + e.Row.RowIndex);
            e.Row.ToolTip = "Click to select this row.";



        }
    }






    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);

        id = Convert.ToInt32(GridView1.SelectedValue.ToString());
        String strGetProgram = "SELECT [ProgramName], [ProgramType], [Capacity], [ProgramCost] FROM [Program] WHERE Program.ProgramID = @ProgramID";


        // CHECK FOR EXISTING USERNAMES IN USER RECORD
        using (SqlCommand getProgram = new SqlCommand(strGetProgram, connection))
        {
            connection.Open();

            //string btn = ((ImageButton)sender).ID;
            //string btnID = btn.ToString();
            //id = Convert.ToInt32(btnID.Substring(3));


            getProgram.Parameters.AddWithValue("@ProgramID", id);
            SqlDataReader reader = getProgram.ExecuteReader();

            // if the username exists, process will stop
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    txtEditName.Text = reader.GetString(0);
                    ddlEditType.SelectedValue = reader.GetString(1);

                    if (reader.IsDBNull(2))
                    {
                        txtEditCapacity.Text = null;
                    }
                    else
                    {
                        txtEditCapacity.Text = Convert.ToString(reader.GetInt32(2));
                    }



                }
            }
        }










    }


    protected void btnEditProgram_Click(object sender, EventArgs e)
    {
        int? capacity;
        id = Convert.ToInt32(GridView1.SelectedValue.ToString());

        if (ddlEditType.SelectedValue == "Online")
        {
            themeCost = 0.00;
        }
        if (ddlEditType.SelectedValue == "Live")
        {
            themeCost = 250.00;
        }
        if (txtEditCapacity.Text == "")
        {
            capacity = null;
        }
        else
        {

            capacity = Convert.ToInt32(txtEditCapacity.Text);

        }

        Programs newTheme2 = new Programs(id,
           txtEditName.Text,
           ddlEditType.SelectedValue,
           themeCost,
          Convert.ToInt32(capacity),
           DateTime.Today,
           Session["UserFullName"].ToString());



        string addressInsert = "UPDATE [Program] SET [ProgramName] = @ProgramName, [ProgramType] = @ProgramType, [Capacity] = @ProgramCapacity, [ProgramCost] = @ProgramCost, [LastUpdated] = @LU, [LastUpdatedBy] = @LUB WHERE Program.ProgramID = @ProgramID";
        connection.Open();
        using (SqlCommand command = new SqlCommand(addressInsert, connection))
        {

            command.Parameters.AddWithValue("@ProgramID", id);
            command.Parameters.AddWithValue("@ProgramName", newTheme2.ProgramName1);
            command.Parameters.AddWithValue("@ProgramType", newTheme2.ProgramType1);
            command.Parameters.AddWithValue("@ProgramCost", newTheme2.ProgramCost1);
            if (newTheme2.Capacity1 == 0)
            {
                command.Parameters.AddWithValue("@ProgramCapacity", DBNull.Value);
            }
            else
            {
                command.Parameters.AddWithValue("@ProgramCapacity", newTheme2.Capacity1);
            }

            command.Parameters.AddWithValue("@LU", newTheme2.LastUpdated1);
            command.Parameters.AddWithValue("@LUB", newTheme2.LastUpdatedBy1);

            command.ExecuteNonQuery();

        }





        GridView1.DataBind();





    }








}