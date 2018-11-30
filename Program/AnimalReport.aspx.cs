using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.IO;

public partial class AnimalReport : System.Web.UI.Page
{
    static int Month;
    protected void Page_Load(object sender, EventArgs e)
    {










    }
    protected void generateAllGeneral(object sender, EventArgs e)
    {


        using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString))
        {
            connection.Open();
            string sql = "SELECT Animal.AnimalName, COUNT(NewProgram.NewProgramID) AS TotalPrograms FROM Animal INNER JOIN AssignAnimal ON Animal.AnimalID = AssignAnimal.AnimalID INNER JOIN NewProgram ON AssignAnimal.NewProgramID = NewProgram.NewProgramID WHERE NewProgram.DateCompleted BETWEEN '" + txtAllStart.Text + "' AND '" + txtAllEnd.Text + "' GROUP BY Animal.AnimalName";
            using (SqlDataAdapter sda = new SqlDataAdapter(sql, connection))
            {
                DataSet data = new DataSet();
                sda.Fill(data);
                this.grdViewReport.DataSource = data;
                grdViewReport.DataBind();
            }
        }

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
        string FileName = prefix + "Report" + DateTime.Now + ".xls";
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
    protected void generateAllAnnualReport(object sender, EventArgs e)
    {
        using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString))
        {
            connection.Open();
            string sql = "SELECT Animal.AnimalName, Animal.AnimalType, Animal.Status, SUM(ISNULL(NewProgram.TotalKids, '0')) AS TotalKids, SUM(ISNULL(NewProgram.TotalAdults, '0')) AS TotalAdults, SUM(ISNULL(NewProgram.TotalPeople, '0')) AS TotalPeople, COUNT(AssignAnimal.AssignAnimalID) AS TotalPrograms FROM Animal LEFT OUTER JOIN AssignAnimal ON Animal.AnimalID = AssignAnimal.AnimalID LEFT OUTER JOIN NewProgram ON AssignAnimal.NewProgramID = NewProgram.NewProgramID WHERE YEAR(NewProgram.DateCompleted) = " + drpAllAnnually.SelectedValue + "GROUP BY Animal.AnimalName, Animal.AnimalType, Animal.Status";
            using (SqlDataAdapter sda = new SqlDataAdapter(sql, connection))
            {
                DataSet data = new DataSet();
                sda.Fill(data);
                this.grdViewReport.DataSource = data;
                grdViewReport.DataBind();
            }
        }
    }
    protected void generateAllMonthReport(object sender, EventArgs e)
    {
        using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString))
        {
            connection.Open();
            string sql = "SELECT Animal.AnimalName, Animal.AnimalType, Animal.Status, SUM(ISNULL(NewProgram.TotalKids, '0')) AS TotalKids, SUM(ISNULL(NewProgram.TotalAdults, '0')) AS TotalAdults, SUM(ISNULL(NewProgram.TotalPeople, '0')) AS TotalPeople, COUNT(AssignAnimal.AssignAnimalID) AS TotalPrograms FROM Animal LEFT OUTER JOIN AssignAnimal ON Animal.AnimalID = AssignAnimal.AnimalID LEFT OUTER JOIN NewProgram ON AssignAnimal.NewProgramID = NewProgram.NewProgramID WHERE MONTH(NewProgram.DateCompleted) = " + drpAllMonthly.SelectedValue + "GROUP BY Animal.AnimalName, Animal.AnimalType, Animal.Status";
            using (SqlDataAdapter sda = new SqlDataAdapter(sql, connection))
            {
                DataSet data = new DataSet();
                sda.Fill(data);
                this.grdViewReport.DataSource = data;
                grdViewReport.DataBind();
            }
        }
    }
    protected void generateAllType(object sender, EventArgs e)
    {
        using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString))
        {
            connection.Open();
            string sql = "SELECT Animal.AnimalName, Animal.AnimalType, Animal.Status, SUM(ISNULL(NewProgram.TotalKids, '0')) AS TotalKids, SUM(ISNULL(NewProgram.TotalAdults, '0')) AS TotalAdults, SUM(ISNULL(NewProgram.TotalPeople, '0')) AS TotalPeople, COUNT(AssignAnimal.AssignAnimalID) AS TotalPrograms FROM Animal LEFT OUTER JOIN AssignAnimal ON Animal.AnimalID = AssignAnimal.AnimalID LEFT OUTER JOIN NewProgram ON AssignAnimal.NewProgramID = NewProgram.NewProgramID WHERE Animal.AnimalType = '" + drpAllType.SelectedValue + "' GROUP BY Animal.AnimalName, Animal.AnimalType, Animal.Status";
            using (SqlDataAdapter sda = new SqlDataAdapter(sql, connection))
            {
                DataSet data = new DataSet();
                sda.Fill(data);
                this.grdViewReport.DataSource = data;
                grdViewReport.DataBind();
            }
        }
    }

    protected void generateOnlineGeneral(object sender, EventArgs e)
    {
        using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString))
        {
            connection.Open();
            string sql = "SELECT Animal.AnimalName, Animal.AnimalType, SUM(ISNULL(NewProgram.TotalKids, '0')) AS TotalKids, SUM(ISNULL(NewProgram.TotalAdults, '0')) AS TotalAdults, SUM(NewProgram.TotalKids + NewProgram.TotalAdults) AS TotalPeople, COUNT(ISNULL(Program.ProgramID, '0')) AS 'Online Programs' FROM Program INNER JOIN NewProgram ON Program.ProgramID = NewProgram.ProgramID RIGHT OUTER JOIN Animal LEFT OUTER JOIN AssignAnimal ON Animal.AnimalID = AssignAnimal.AnimalID ON NewProgram.NewProgramID = AssignAnimal.NewProgramID WHERE Program.ProgramType = 'Online' AND NewProgram.DateCompleted BETWEEN '" + txtOnlineStart.Text + "' AND '" + txtOnlineEnd.Text + "' GROUP BY Animal.AnimalName, Animal.AnimalType ORDER BY Animal.AnimalType, AnimalName";
            using (SqlDataAdapter sda = new SqlDataAdapter(sql, connection))
            {
                DataSet data = new DataSet();
                sda.Fill(data);
                this.grdViewReport.DataSource = data;
                grdViewReport.DataBind();
            }
        }

    }


    protected void generateOnlineAnnualReport(object sender, EventArgs e)
    {
        using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString))
        {
            connection.Open();
            string sql = "SELECT Animal.AnimalName, Animal.AnimalType, Animal.Status, SUM(ISNULL(NewProgram.TotalKids, '0')) AS TotalKids, SUM(ISNULL(NewProgram.TotalAdults, '0')) AS TotalAdults, SUM(ISNULL(NewProgram.TotalPeople, '0')) AS TotalPeople, COUNT(AssignAnimal.AssignAnimalID) AS TotalPrograms FROM Animal LEFT OUTER JOIN AssignAnimal ON Animal.AnimalID = AssignAnimal.AnimalID LEFT OUTER JOIN NewProgram ON AssignAnimal.NewProgramID = NewProgram.NewProgramID LEFT OUTER JOIN Program ON NewProgram.ProgramID = Program.ProgramID WHERE YEAR(NewProgram.DateCompleted) = " + drpOnlineAnnually.SelectedValue + "AND Program.ProgramType = 'Online' GROUP BY Animal.AnimalName, Animal.AnimalType, Animal.Status";
            using (SqlDataAdapter sda = new SqlDataAdapter(sql, connection))
            {
                DataSet data = new DataSet();
                sda.Fill(data);
                this.grdViewReport.DataSource = data;
                grdViewReport.DataBind();
            }
        }
    }

    protected void generateOnlineMonthReport(object sender, EventArgs e)
    {
        using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString))
        {
            connection.Open();
            string sql = "SELECT Animal.AnimalName, Animal.AnimalType, Animal.Status, SUM(ISNULL(NewProgram.TotalKids, '0')) AS TotalKids, SUM(ISNULL(NewProgram.TotalAdults, '0')) AS TotalAdults, SUM(ISNULL(NewProgram.TotalPeople, '0')) AS TotalPeople, COUNT(AssignAnimal.AssignAnimalID) AS TotalPrograms FROM Animal LEFT OUTER JOIN AssignAnimal ON Animal.AnimalID = AssignAnimal.AnimalID LEFT OUTER JOIN NewProgram ON AssignAnimal.NewProgramID = NewProgram.NewProgramID LEFT OUTER JOIN Program ON NewProgram.ProgramID = Program.ProgramID WHERE MONTH(NewProgram.DateCompleted) = " + drpOnlineMonthly.SelectedValue + "AND Program.ProgramType = 'Online' GROUP BY Animal.AnimalName, Animal.AnimalType, Animal.Status";
            using (SqlDataAdapter sda = new SqlDataAdapter(sql, connection))
            {
                DataSet data = new DataSet();
                sda.Fill(data);
                this.grdViewReport.DataSource = data;
                grdViewReport.DataBind();
            }
        }
    }

    protected void generateOnlineType(object sender, EventArgs e)
    {
        using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString))
        {
            connection.Open();
            string sql = "SELECT Animal.AnimalName, Animal.AnimalType, Animal.Status, SUM(ISNULL(NewProgram.TotalKids, '0')) AS TotalKids, SUM(ISNULL(NewProgram.TotalAdults, '0')) AS TotalAdults, SUM(ISNULL(NewProgram.TotalPeople, '0')) AS TotalPeople, COUNT(AssignAnimal.AssignAnimalID) AS TotalPrograms FROM Animal LEFT OUTER JOIN AssignAnimal ON Animal.AnimalID = AssignAnimal.AnimalID LEFT OUTER JOIN NewProgram ON AssignAnimal.NewProgramID = NewProgram.NewProgramID LEFT OUTER JOIN Program ON NewProgram.ProgramID = Program.ProgramID WHERE Animal.AnimalType = '" + drpOnlineType.SelectedValue + "' AND Program.ProgramType = 'Online' GROUP BY Animal.AnimalName, Animal.AnimalType, Animal.Status";
            using (SqlDataAdapter sda = new SqlDataAdapter(sql, connection))
            {
                DataSet data = new DataSet();
                sda.Fill(data);
                this.grdViewReport.DataSource = data;
                grdViewReport.DataBind();
            }
        }
    }


    protected void generateLiveGeneral(object sender, EventArgs e)
    {
        using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString))
        {
            connection.Open();
            string sql = "SELECT Animal.AnimalName, Animal.AnimalType, SUM(ISNULL(NewProgram.TotalKids, '0')) AS TotalKids, SUM(ISNULL(NewProgram.TotalAdults, '0')) AS TotalAdults, SUM(NewProgram.TotalKids + NewProgram.TotalAdults) AS TotalPeople, COUNT(ISNULL(Program.ProgramID, '0')) AS 'Live Programs' FROM Program INNER JOIN NewProgram ON Program.ProgramID = NewProgram.ProgramID INNER JOIN Animal INNER JOIN AssignAnimal ON Animal.AnimalID = AssignAnimal.AnimalID ON NewProgram.NewProgramID = AssignAnimal.NewProgramID LEFT OUTER JOIN Program ON NewProgram.ProgramID = Program.ProgramID WHERE Program.ProgramType = 'Live' AND NewProgram.DateCompleted BETWEEN '" + txtLiveStart.Text + "' AND '" + txtLiveEnd.Text + "' GROUP BY Animal.AnimalName, Animal.AnimalType ORDER BY Animal.AnimalType, AnimalName";
            using (SqlDataAdapter sda = new SqlDataAdapter(sql, connection))
            {
                DataSet data = new DataSet();
                sda.Fill(data);
                this.grdViewReport.DataSource = data;
                grdViewReport.DataBind();
            }
        }

    }


    protected void generateLiveAnnualReport(object sender, EventArgs e)
    {
        using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString))
        {
            connection.Open();
            string sql = "SELECT Animal.AnimalName, Animal.AnimalType, Animal.Status, SUM(ISNULL(NewProgram.TotalKids, '0')) AS TotalKids, SUM(ISNULL(NewProgram.TotalAdults, '0')) AS TotalAdults, SUM(ISNULL(NewProgram.TotalPeople, '0')) AS TotalPeople, COUNT(AssignAnimal.AssignAnimalID) AS TotalPrograms FROM Animal LEFT OUTER JOIN AssignAnimal ON Animal.AnimalID = AssignAnimal.AnimalID LEFT OUTER JOIN NewProgram ON AssignAnimal.NewProgramID = NewProgram.NewProgramID LEFT OUTER JOIN Program ON NewProgram.ProgramID = Program.ProgramID WHERE YEAR(NewProgram.DateCompleted) = " + drpLiveAnnually.SelectedValue + "AND Program.ProgramType = 'Live' GROUP BY Animal.AnimalName, Animal.AnimalType, Animal.Status";
            using (SqlDataAdapter sda = new SqlDataAdapter(sql, connection))
            {
                DataSet data = new DataSet();
                sda.Fill(data);
                this.grdViewReport.DataSource = data;
                grdViewReport.DataBind();
            }
        }
    }

    protected void generateLiveMonthReport(object sender, EventArgs e)
    {
        using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString))
        {
            connection.Open();
            string sql = "SELECT Animal.AnimalName, Animal.AnimalType, Animal.Status, SUM(ISNULL(NewProgram.TotalKids, '0')) AS TotalKids, SUM(ISNULL(NewProgram.TotalAdults, '0')) AS TotalAdults, SUM(ISNULL(NewProgram.TotalPeople, '0')) AS TotalPeople, COUNT(AssignAnimal.AssignAnimalID) AS TotalPrograms FROM Animal LEFT OUTER JOIN AssignAnimal ON Animal.AnimalID = AssignAnimal.AnimalID LEFT OUTER JOIN NewProgram ON AssignAnimal.NewProgramID = NewProgram.NewProgramID LEFT OUTER JOIN Program ON NewProgram.ProgramID = Program.ProgramID WHERE MONTH(NewProgram.DateCompleted) = " + drpLiveMonthly.SelectedValue + "AND Program.ProgramType = 'Live' GROUP BY Animal.AnimalName, Animal.AnimalType, Animal.Status";
            using (SqlDataAdapter sda = new SqlDataAdapter(sql, connection))
            {
                DataSet data = new DataSet();
                sda.Fill(data);
                this.grdViewReport.DataSource = data;
                grdViewReport.DataBind();
            }
        }
    }

    protected void generateLiveType(object sender, EventArgs e)
    {
        using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString))
        {
            connection.Open();
            string sql = "SELECT Animal.AnimalName, Animal.AnimalType, Animal.Status, SUM(ISNULL(NewProgram.TotalKids, '0')) AS TotalKids, SUM(ISNULL(NewProgram.TotalAdults, '0')) AS TotalAdults, SUM(ISNULL(NewProgram.TotalPeople, '0')) AS TotalPeople, COUNT(AssignAnimal.AssignAnimalID) AS TotalPrograms FROM Animal LEFT OUTER JOIN AssignAnimal ON Animal.AnimalID = AssignAnimal.AnimalID LEFT OUTER JOIN NewProgram ON AssignAnimal.NewProgramID = NewProgram.NewProgramID LEFT OUTER JOIN Program ON NewProgram.ProgramID = Program.ProgramID WHERE Animal.AnimalType = '" + drpLiveType.SelectedValue + "' AND Program.ProgramType = 'Live' GROUP BY Animal.AnimalName, Animal.AnimalType, Animal.Status";
            using (SqlDataAdapter sda = new SqlDataAdapter(sql, connection))
            {
                DataSet data = new DataSet();
                sda.Fill(data);
                this.grdViewReport.DataSource = data;
                grdViewReport.DataBind();
            }
        }
    }

    protected void grdViewReport_Sorting(object sender, GridViewSortEventArgs e)
    {
        DataTable dataTable = ViewState["dtbl"] as DataTable;
        if (dataTable != null)
        {
            DataView dataView = new DataView(dataTable);
            dataView.Sort = e.SortExpression + " " + ConvertSortDirection(e.SortDirection);
            grdViewReport.DataSource = dataView;
            grdViewReport.DataBind();
        }
    }
    private string ConvertSortDirection(SortDirection sortDirection)
    {
        string newSortDirection = String.Empty;
        switch (sortDirection)
        {
            case SortDirection.Ascending:
                newSortDirection = "ASC";
                break;
            case SortDirection.Descending:
                newSortDirection = "DESC";
                break;
        }

        return newSortDirection;
    }

    protected void btnExportToExcel_Click(object sender, EventArgs e)
    {
        ExportToExcel(grdViewReport, "Animal");
    }
}
