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
using System.Text.RegularExpressions;
using System.IO;

public partial class OrganizationView : System.Web.UI.Page
{

    System.Data.SqlClient.SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString);
    public static Int32 id;
    private string SearchString = "";
    string ImageString;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnAddOrg_Click(object sender, EventArgs e)
    {

        Server.Transfer("AddOrganization.aspx", true);
    }

    public string HighlightText(string InputTxt)
    {
        string Search_Str = txtSearchAll.Text;
        // Setup the regular expression and add the Or operator.
        Regex RegExp = new Regex(Search_Str.Replace(" ", "|").Trim(), RegexOptions.IgnoreCase);
        // Highlight keywords by calling the
        //delegate each time a keyword is found.
        return RegExp.Replace(InputTxt, new MatchEvaluator(ReplaceKeyWords));
    }

    public string ReplaceKeyWords(Match m)
    {
        return ("<span class=highlight>" + m.Value + "</span>");
    }

    protected void btnSearchAll_Click(object sender, EventArgs e)
    {
        //  Set the value of the SearchString so it gets
        SearchString = HttpUtility.HtmlEncode(txtSearchAll.Text);
        grdOrganizations.DataSourceID = null;
        using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString))
        {
            connection.Open();
            string sql = "SELECT Organization.OrganizationName, Address.Street, Address.State, Address.County, CONCAT(Contact.FirstName + ' ', Contact.LastName) as Name, Contact.Email, Contact.PrimaryPhoneNumber FROM Address INNER JOIN Organization ON Address.AddressID = Organization.AddressID INNER JOIN Contact ON Organization.OrganizationID = Contact.OrganizationID WHERE Organization.OrganizationName LIKE '%" + SearchString + "%'";
            using (SqlDataAdapter sda = new SqlDataAdapter(sql, connection))
            {
                DataSet data = new DataSet();
                sda.Fill(data);
                this.grdOrganizations.DataSource = data;
                grdOrganizations.DataBind();
            }
        }

    }

    protected void btnClearAll_Click(object sender, EventArgs e)
    {
        //  Simple clean up text to return the Gridview to it's default state
        txtSearchAll.Text = "";
        SearchString = "";
        try
        {
            using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString))
            {
                connection.Open();
                string sql = "SELECT Organization.OrganizationName, Address.Street, Address.State, Address.County, CONCAT(Contact.FirstName + ' ', Contact.LastName) as Name, Contact.Email, Contact.PrimaryPhoneNumber FROM Address INNER JOIN Organization ON Address.AddressID = Organization.AddressID INNER JOIN Contact ON Organization.OrganizationID = Contact.OrganizationID";
                using (SqlDataAdapter sda = new SqlDataAdapter(sql, connection))
                {
                    DataSet data = new DataSet();
                    sda.Fill(data);
                    this.grdOrganizations.DataSource = data;
                    grdOrganizations.DataBind();
                }
            }
        }
        catch (Exception E)
        {

        }
    }

    protected void txtSearchAll_TextChanged(object sender, EventArgs e)
    {
        SearchString = HttpUtility.HtmlEncode(txtSearchAll.Text);
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
           HttpUtility.HtmlEncode(Session["Username"].ToString())
           );

        FileUpload1.SaveAs(Server.MapPath("Images\\Animals\\" + HttpUtility.HtmlEncode(FileUpload1.FileName)));
        ImageString = "~\\Images\\Animals\\" + HttpUtility.HtmlEncode(FileUpload1.FileName);
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

        grdOrganizations.DataBind();

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
        string FileName = prefix + "Organizations" + DateTime.Now + ".xls";
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
    protected void orgButton_Click(object sender, EventArgs e)
    {
        ExportToExcel(grdOrganizations, "");
    }
}