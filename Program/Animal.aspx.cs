

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Configuration;
using System.Drawing;
using System.IO;

public partial class Animal : System.Web.UI.Page
{
    System.Data.SqlClient.SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString);

    private string SearchString = "";
    public static Int32 id;
    string ImageString;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {




        }




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
           "Staff"




           );
        
        FileUpload1.SaveAs(Server.MapPath("Images\\Animals\\" + FileUpload1.FileName));
        ImageString = "~\\Images\\Animals\\" + FileUpload1.FileName;
        string creatAnimal = "Insert into [dbo].[Animal] values (@Species, @ScientificName, @AnimalName, @AnimalType, @Status, @Image, @LastUpdated, @LastUpdatedBy)";
        SqlCommand addAnimal = new SqlCommand(creatAnimal, sc);
        sc.Open();
        addAnimal.Parameters.AddWithValue("@Species", DBNull.Value);
        addAnimal.Parameters.AddWithValue("@ScientificName", DBNull.Value);
        addAnimal.Parameters.AddWithValue("@AnimalName", newAnimal.getAnimalName());
        addAnimal.Parameters.AddWithValue("@AnimalType", newAnimal.getAnimalType());
        addAnimal.Parameters.AddWithValue("@Status", newAnimal.getStatus());
        addAnimal.Parameters.AddWithValue("@LastUpdated", newAnimal.getLastUpdated());
        addAnimal.Parameters.AddWithValue("@LastUpdatedBy", Session["UserFullName"]);
        addAnimal.Parameters.AddWithValue("@Image", ImageString);
        
        addAnimal.ExecuteNonQuery();

        txtAddName.Text = " ";

        GridView1.DataBind();




    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {


        //string AnimalProgram = "SELECT Animal.AnimalName, SUM(NewProgram.TotalKids) AS TotalKids, SUM(NewProgram.TotalAdults) AS TotalAdults, SUM(NewProgram.TotalPeople) AS TotalPeople, COUNT(NewProgram.ProgramID) AS 'Total Programs' " +
        //    "FROM AssignAnimal INNER JOIN  NewProgram ON AssignAnimal.NewProgramID = NewProgram.NewProgramID INNER JOIN  Animal ON AssignAnimal.AnimalID = Animal.AnimalID INNER JOIN  Program ON NewProgram.ProgramID = Program.ProgramID WHERE AssignAnimal.AnimalID = @AnimalID GROUP BY Animal.AnimalName";


        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);

        id = Convert.ToInt32(GridView1.SelectedValue.ToString());




        //SqlCommand cmd = sc.CreateCommand();
        //cmd.CommandType = CommandType.Text;
        //cmd.CommandText = AnimalProgram;
        //cmd.Parameters.AddWithValue("@AnimalID", id);
        //SqlDataAdapter da = new SqlDataAdapter(cmd);
        //DataTable dt = new DataTable();
        //da.Fill(dt);
        //GridView2.DataSource = dt;
        //GridView2.DataBind();

        string programInfo = "SELECT Animal.AnimalName, Program.ProgramName, Program.ProgramType, format(Program.ProgramCost,'C','en-us') as [Cost], Convert(CHAR(10),[NewProgram].[DateCompleted],101) as [Date] FROM Animal INNER JOIN AssignAnimal ON Animal.AnimalID = AssignAnimal.AnimalID INNER JOIN NewProgram ON AssignAnimal.NewProgramID = NewProgram.NewProgramID INNER JOIN Program ON NewProgram.ProgramID = Program.ProgramID WHERE AssignAnimal.AnimalID = @AnimalID";



        SqlCommand cmd2 = sc.CreateCommand();
        cmd2.CommandType = CommandType.Text;
        cmd2.CommandText = programInfo;
        cmd2.Parameters.AddWithValue("@AnimalID", id);
        SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
        DataTable dt2 = new DataTable();
        da2.Fill(dt2);
        GridView3.DataSource = dt2;
        GridView3.DataBind();



        //GridView2.Visible = true;
        GridView3.Visible = true;

        String strGetAnimal = "Select Status, AnimalType, AnimalName from [dbo].[Animal] where AnimalID = @AnimalID";


        // CHECK FOR EXISTING USERNAMES IN USER RECORD
        using (SqlCommand getAnimal = new SqlCommand(strGetAnimal, sc))
        {
            sc.Open();

            //string btn = ((ImageButton)sender).ID;
            //string btnID = btn.ToString();
            //id = Convert.ToInt32(btnID.Substring(3));


            getAnimal.Parameters.AddWithValue("@AnimalID", id);
            SqlDataReader reader = getAnimal.ExecuteReader();

            // if the username exists, process will stop
            if (reader.HasRows)
            {
                while (reader.Read())
                {

                    ddlEditStatus.SelectedValue = reader.GetString(0);
                    ddlEditType.Text = reader.GetString(1);

                    txtEditName.Text = reader.GetString(2);
                }
            }
        }
    }
    protected void GridView1_RowDataBound1(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView1, "Select$" + e.Row.RowIndex);
            e.Row.ToolTip = "Click to select this row.";



        }
    }


    protected void btnUpdate_Click(object sender, EventArgs e)
    {

        Animals newAnimal2 = new Animals(id,
            txtEditName.Text,
            "",
            "",


            ddlEditType.SelectedValue.ToString(),
            ddlEditStatus.SelectedValue.ToString());


        string myQuery = "UPDATE [WildlifeCenter].[dbo].[Animal] SET [Species] = @Species,[ScientificName] = @ScientificName, [AnimalName] = @AnimalName, [AnimalType] = @AnimalType, [Status] = @Status, [LastUpdatedBy] = @LastUpdatedBy WHERE AnimalID = @AnimalID";




        sc.Open();

        SqlCommand myCommand = new SqlCommand(myQuery, sc);
        myCommand.Parameters.AddWithValue("@AnimalID", newAnimal2.getAnimalID());
        myCommand.Parameters.AddWithValue("@Species", DBNull.Value);
        myCommand.Parameters.AddWithValue("@ScientificName", DBNull.Value);
        myCommand.Parameters.AddWithValue("@AnimalName", newAnimal2.getAnimalName());
        myCommand.Parameters.AddWithValue("@AnimalType", newAnimal2.getAnimalType());
        myCommand.Parameters.AddWithValue("@Status", newAnimal2.getStatus());
        myCommand.Parameters.AddWithValue("@LastUpdated", newAnimal2.getLastUpdated());
        myCommand.Parameters.AddWithValue("@LastUpdatedBy", Session["UserFullName"]);
        myCommand.ExecuteNonQuery();

        sc.Close();
        GridView1.DataBind();


    }
    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Verifies that the control is rendered */
    }

    protected void ExportToExcel(GridView grid, string prefix)
    {
        Response.Clear();
        Response.Buffer = true;
        Response.ClearContent();
        Response.ClearHeaders();
        Response.Charset = "";
        string FileName = prefix + "Animals" + DateTime.Now + ".xls";
        StringWriter strwritter = new StringWriter();
        HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.ContentType = "application/vnd.ms-excel";
        Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
        grid.GridLines = GridLines.Both;
        grid.HeaderStyle.Font.Bold = true;
        grid.RenderControl(htmltextwrtter);
        Response.Write(strwritter.ToString());
        Response.End();
    }

    protected void animalButton_Click(object sender, EventArgs e)
    {
        ExportToExcel(GridView1, "");
    }


    protected void btnSearchAll_Click(object sender, EventArgs e)
    {
        //  Set the value of the SearchString so it gets
        SearchString = txtSearchAnimal.Text;
        GridView1.DataSourceID = null;
        using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString))
        {
            connection.Open();
            string sql = "SELECT Animal.AnimalID, Animal.AnimalName, Animal.AnimalType, Animal.Status, Animal.Image, SUM(ISNULL(NewProgram.TotalKids, '0')) AS TotalKids, SUM(ISNULL(NewProgram.TotalAdults, '0')) AS TotalAdults, SUM(ISNULL(NewProgram.TotalPeople, '0')) AS TotalPeople, COUNT(AssignAnimal.AssignAnimalID) AS TotalPrograms FROM Animal LEFT OUTER JOIN AssignAnimal ON Animal.AnimalID = AssignAnimal.AnimalID LEFT OUTER JOIN NewProgram ON AssignAnimal.NewProgramID = NewProgram.NewProgramID WHERE Animal.AnimalName LIKE '" + SearchString + "%' GROUP BY Animal.AnimalID, Animal.AnimalName, Animal.AnimalType, Animal.Status, Animal.LastUpdatedBy, Animal.Image";
            using (SqlDataAdapter sda = new SqlDataAdapter(sql, connection))
            {
                DataSet data = new DataSet();
                sda.Fill(data);
                this.GridView1.DataSource = data;
                GridView1.DataBind();
            }
        }



    }


    protected void txtSearchAll_TextChanged(object sender, EventArgs e)
    {
        SearchString = txtSearchAnimal.Text;
    }


    

    protected void Unnamed2_Click(object sender, EventArgs e)
    {

        GridView1.DataSourceID = null;
        GridView1.DataSourceID = "AnimalSQL";
        GridView1.DataBind();
        txtSearchAnimal.Text = null;




    }
}




















