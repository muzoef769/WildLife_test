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
    protected void SearchByDate(object sender, EventArgs e)
    {
        using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString))
        {
            connection.Open();
            string sql = "SELECT Animal.AnimalName, Animal.AnimalType, Animal.Status, SUM(ISNULL(NewProgram.TotalKids, '0')) AS TotalKids, SUM(ISNULL(NewProgram.TotalAdults, '0')) AS TotalAdults, SUM(ISNULL(NewProgram.TotalPeople, '0')) AS TotalPeople, COUNT(AssignAnimal.AssignAnimalID) AS TotalPrograms FROM Animal LEFT OUTER JOIN AssignAnimal ON Animal.AnimalID = AssignAnimal.AnimalID LEFT OUTER JOIN NewProgram ON AssignAnimal.NewProgramID = NewProgram.NewProgramID GROUP BY Animal.AnimalName, Animal.AnimalType, Animal.Status";
            using (SqlDataAdapter sda = new SqlDataAdapter(sql, connection))
            {
                DataSet data = new DataSet();
                sda.Fill(data);
                this.grdViewReport.DataSource = data;
                grdViewReport.DataBind();
            }
        }

    }
    protected void ExportToExcel(object sender, EventArgs e)
    {
        Response.Clear();
        Response.Buffer = true;
        Response.ClearContent();
        Response.ClearHeaders();
        Response.Charset = "";
        string FileName = "Vithal" + DateTime.Now + ".xls";
        StringWriter strwritter = new StringWriter();
        HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.ContentType = "application/vnd.ms-excel";
        Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
        grdViewReport.GridLines = GridLines.Both;
        grdViewReport.HeaderStyle.Font.Bold = true;
        grdViewReport.RenderControl(htmltextwrtter);
        Response.Write(strwritter.ToString());
        Response.End();
    }
    public override void VerifyRenderingInServerForm(Control control)
    {
        //required to avoid the runtime error "  
        //Control 'GridView1' of type 'GridView' must be placed inside a form tag with runat=server."  
    }
    protected void generateAnnualReport(object sender, EventArgs e)
    {
        using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString))
        {
            connection.Open();
            string sql = "SELECT Animal.AnimalName, Animal.AnimalType, Animal.Status, SUM(ISNULL(NewProgram.TotalKids, '0')) AS TotalKids, SUM(ISNULL(NewProgram.TotalAdults, '0')) AS TotalAdults, SUM(ISNULL(NewProgram.TotalPeople, '0')) AS TotalPeople, COUNT(AssignAnimal.AssignAnimalID) AS TotalPrograms FROM Animal LEFT OUTER JOIN AssignAnimal ON Animal.AnimalID = AssignAnimal.AnimalID LEFT OUTER JOIN NewProgram ON AssignAnimal.NewProgramID = NewProgram.NewProgramID WHERE YEAR(NewProgram.DateCompleted) = " + drpYearList.SelectedValue + "GROUP BY Animal.AnimalName, Animal.AnimalType, Animal.Status";
            using (SqlDataAdapter sda = new SqlDataAdapter(sql, connection))
            {
                DataSet data = new DataSet();
                sda.Fill(data);
                this.grdViewReport.DataSource = data;
                grdViewReport.DataBind();
            }
        }
    }
    protected void generateMonthReport(object sender, EventArgs e)
    {
        using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString))
        {
            connection.Open();
            string sql = "SELECT Animal.AnimalName, Animal.AnimalType, Animal.Status, SUM(ISNULL(NewProgram.TotalKids, '0')) AS TotalKids, SUM(ISNULL(NewProgram.TotalAdults, '0')) AS TotalAdults, SUM(ISNULL(NewProgram.TotalPeople, '0')) AS TotalPeople, COUNT(AssignAnimal.AssignAnimalID) AS TotalPrograms FROM Animal LEFT OUTER JOIN AssignAnimal ON Animal.AnimalID = AssignAnimal.AnimalID LEFT OUTER JOIN NewProgram ON AssignAnimal.NewProgramID = NewProgram.NewProgramID WHERE MONTH(NewProgram.DateCompleted) = " + drpMonthList.SelectedValue + "GROUP BY Animal.AnimalName, Animal.AnimalType, Animal.Status";
            using (SqlDataAdapter sda = new SqlDataAdapter(sql, connection))
            {
                DataSet data = new DataSet();
                sda.Fill(data);
                this.grdViewReport.DataSource = data;
                grdViewReport.DataBind();
            }
        }
    }
    protected void AnimalType(object sender, EventArgs e)
    {
        using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString))
        {
            connection.Open();
            string sql = "SELECT Animal.AnimalName, Animal.AnimalType, Animal.Status, SUM(ISNULL(NewProgram.TotalKids, '0')) AS TotalKids, SUM(ISNULL(NewProgram.TotalAdults, '0')) AS TotalAdults, SUM(ISNULL(NewProgram.TotalPeople, '0')) AS TotalPeople, COUNT(AssignAnimal.AssignAnimalID) AS TotalPrograms FROM Animal LEFT OUTER JOIN AssignAnimal ON Animal.AnimalID = AssignAnimal.AnimalID LEFT OUTER JOIN NewProgram ON AssignAnimal.NewProgramID = NewProgram.NewProgramID WHERE Animal.AnimalType = '" + drpAnimalTypeReport.SelectedValue + "' GROUP BY Animal.AnimalName, Animal.AnimalType, Animal.Status";
            using (SqlDataAdapter sda = new SqlDataAdapter(sql, connection))
            {
                DataSet data = new DataSet();
                sda.Fill(data);
                this.grdViewReport.DataSource = data;
                grdViewReport.DataBind();
            }
        }
    }
    protected void btnLogOut_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("Default.aspx", true);
    }
}