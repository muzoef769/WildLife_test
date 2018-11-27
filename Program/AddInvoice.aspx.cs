using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;

public partial class AddInvoice : System.Web.UI.Page
{
    SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString);
    public int getNewProgramID;
    public string findInvoiceID;
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void viewGridView(object sender, EventArgs e)
    {
        int id = Int32.Parse(drpInvoiceOrganization.SelectedValue);

        string sql = "SELECT NewProgram.DateCompleted, NewProgram.TimeSlot, NewProgram.NewProgramID,NewProgram.NewProgramStatus, Program.ProgramName, NewProgram.LastUpdatedBy FROM Address INNER JOIN Organization ON Address.AddressID = Organization.AddressID INNER JOIN NewProgram ON Address.AddressID = NewProgram.AddressID INNER JOIN Program ON NewProgram.ProgramID = Program.ProgramID WHERE (Organization.OrganizationID = CAST(@Org_ID as int))";

        SqlCommand command = sc.CreateCommand();

        command.CommandType = CommandType.Text;
        command.Parameters.AddWithValue("@Org_ID", id);
        command.CommandText = sql;

        SqlDataAdapter da = new SqlDataAdapter(command);
        DataTable dt = new DataTable();
        da.Fill(dt);
        GridView5.DataSource = dt;
        GridView5.DataBind();
        using (SqlCommand cmd = new SqlCommand(sql))
        {
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@Org_ID", id);
            cmd.Connection = sc;
            sc.Open();
            ProgramListInvoice.DataSource = cmd.ExecuteReader();
            ProgramListInvoice.DataTextField = "ProgramName";
            ProgramListInvoice.DataValueField = "NewProgramID";
            ProgramListInvoice.DataBind();
        }
        sc.Close();
    }
    protected void AddProgram(object sender, EventArgs e)
    {
        //Invoice ID, New ProgramID, DateCreated, InvoiceStatus, LastUpdated, LUB
        Invoice addInvoice = new Invoice(txtInvoice.Text, 150, DateTime.Now, "Incomplete", DateTime.Now, Session["UserFullName"].ToString(), 100);

        using (SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString))
        {
            sc.Open();
            string sql = "INSERT INTO Invoice(InvoiceNumber, TotalCost, DateCreated, InvoiceStatus, LastUpdated, LastUpdatedBy) VALUES (@Invoice, @Cost, @Date, @Status, @LU, @LUB)";
            using (SqlCommand command = new SqlCommand(sql, sc))
            {
                command.Parameters.AddWithValue("@Invoice", addInvoice.getInvoiceNumber());
                command.Parameters.AddWithValue("@Cost", addInvoice.getTotal());
                command.Parameters.AddWithValue("@Date", addInvoice.getDateCreated());
                command.Parameters.AddWithValue("@Status", addInvoice.getInvoiceStatus());
                command.Parameters.AddWithValue("@LU", addInvoice.getLastUpdated());
                command.Parameters.AddWithValue("@LUB", addInvoice.getLastUpdatedBy());

                command.ExecuteNonQuery();
            }
        }



        using (SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString))
        {
            sc.Open();

            SqlCommand findInvoiceID = new SqlCommand("SELECT MAX(InvoiceID) FROM Invoice", sc);
            int findID = Convert.ToInt32(findInvoiceID.ExecuteScalar());

            AssignInvoice invoice1 = new AssignInvoice(findID, Int32.Parse(drpInvoiceOrganization.SelectedValue), DateTime.Now, Session["UserFullName"].ToString());

            string sql1 = "INSERT INTO AssignInvoice(InvoiceID, NewProgramID, LastUpdated, LastUpdatedBy) VALUES (@ID, @ID2, @LU, @LUB)";
            using (SqlCommand command = new SqlCommand(sql1, sc))
            {
                command.Parameters.AddWithValue("@ID", invoice1.InvoiceID1);
                command.Parameters.AddWithValue("ID2", invoice1.NewProgramID1);
                command.Parameters.AddWithValue("LU", invoice1.LastUpdated1);
                command.Parameters.AddWithValue("@LUB", invoice1.LastUpdatedBy1);
            }
        }

    }

    protected void GridView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        e.Row.Cells[2].Visible = false;
    }
    protected void btnLogOut_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("Default.aspx", true);
    }
}