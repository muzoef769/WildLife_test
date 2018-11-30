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
    //public string grdOrganizations;
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void grdOrganizations_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(grdOrganizations, "Select$" + e.Row.RowIndex);
            e.Row.ToolTip = "Click to select this row.";



        }

    }

    protected void grdOrganizations_SelectedIndexChanged(object sender, EventArgs e)
    {
        sc.Open();
        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
        id = Convert.ToInt32(grdOrganizations.SelectedValue.ToString());
        ViewState["OrgID"] = id;
        sc.Close();

        String queryOrg = "Select Organization.OrganizationName, Organization.AddressID from [dbo].[Organization] where Organization.OrganizationID = @OrganizationID";
        String queryAddress = "Select Address.Street, Address.City, Address.State, Address.County, Address.Country, Address.ZipCode from [dbo].[Address] where Address.AddressID = @AddressID";


        using (SqlCommand commOrg = new SqlCommand(queryOrg, sc))
        {
            sc.Open();


            commOrg.Parameters.AddWithValue("@OrganizationID", id);
            SqlDataReader reader = commOrg.ExecuteReader();

            // if the username exists, process will stop
            if (reader.HasRows)
            {
                while (reader.Read())
                {

                    txtEditOrg.Text = reader.GetString(0);
                    ViewState["aID"] = reader.GetInt32(1);

                }
            }
            sc.Close();
        }

        using (SqlCommand commAddress = new SqlCommand(queryAddress, sc))
        {
            sc.Open();


            commAddress.Parameters.AddWithValue("@AddressID", (Int32)ViewState["aID"]);
            SqlDataReader reader = commAddress.ExecuteReader();

            // if the username exists, process will stop
            if (reader.HasRows)
            {
                while (reader.Read())
                {

                    txtEditStreet.Text = reader.GetString(0);
                    txtEditCity.Text = reader.GetString(1);
                    drpEditState.SelectedValue = reader.GetString(2);
                    txtEditCounty.Text = reader.GetString(3);
                    txtEditCountry.Text = reader.GetString(4);
                    txtEditZip.Text = reader.GetString(5);

                }
            }
            sc.Close();
        }

    }


    protected void btnUpdate_Click(object sender, EventArgs e)
    {

        Organization org = new Organization(
            (Int32)ViewState["OrgID"],
            txtEditOrg.Text,
            DateTime.Now,
            (String)Session["UserFullName"]);

        Address address = new Address(
            (Int32)ViewState["aID"],
            txtEditStreet.Text,
            txtEditCity.Text,
            drpEditState.SelectedValue,
            txtEditCounty.Text,
            txtEditCountry.Text,
            txtEditZip.Text,
            DateTime.Now,
            (String)Session["UserFullName"]);



        string myQuery = "UPDATE [WildlifeCenter].[dbo].[Address] SET [Street] = @Street, [City] = @City, [County] = @County, [State] = @State, [ZipCode] = @ZipCode, [LastUpdated] = @LastUpdated, [LastUpdatedBy] = @LastUpdatedBy WHERE AddressID = @AddressID";

        using (SqlCommand myCommandAddress = new SqlCommand(myQuery, sc))
        {
            sc.Open();
            myCommandAddress.Parameters.AddWithValue("@AddressID", address.getAddressID());
            myCommandAddress.Parameters.AddWithValue("@Street", address.getStreetName());
            myCommandAddress.Parameters.AddWithValue("@City", address.getCity());
            myCommandAddress.Parameters.AddWithValue("@County", address.getCounty());
            myCommandAddress.Parameters.AddWithValue("@State", address.getCountry());
            myCommandAddress.Parameters.AddWithValue("@ZipCode", address.getZipCode());
            myCommandAddress.Parameters.AddWithValue("@LastUpdated", address.getLastUpdated());
            myCommandAddress.Parameters.AddWithValue("@LastUpdatedBy", address.getLastUpdatedBy());
            myCommandAddress.ExecuteNonQuery();
            grdOrganizations.DataBind();
            sc.Close();
        }



        string myQuery2 = "UPDATE [WildlifeCenter].[dbo].[Organization] SET [OrganizationName] = @OrganizationName, [LastUpdated] = @LastUpdated, [LastUpdatedBy] = @LastUpdatedBy WHERE OrganizationID = @OrganizationID";

        using (SqlCommand myCommandOrg = new SqlCommand(myQuery2, sc))
        {
            sc.Open();

            myCommandOrg.Parameters.AddWithValue("@OrganizationID", org.getOrgID());
            myCommandOrg.Parameters.AddWithValue("@OrganizationName", org.getOrgName());
            myCommandOrg.Parameters.AddWithValue("@LastUpdated", org.getLastUpdated());
            myCommandOrg.Parameters.AddWithValue("@LastUpdatedBy", org.getLastUpdatedBy());
            myCommandOrg.ExecuteNonQuery();
            grdOrganizations.DataBind();
            sc.Close();

        }






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
        SearchString = txtSearchAll.Text;
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
        SearchString = txtSearchAll.Text;
    }
    //protected void btnAddModal_Click(object sender, EventArgs e)
    //{
    //    Animals newAnimal = new Animals(
    //       "",
    //       "",
    //       txtAddName.Text,
    //       ddlAddType.SelectedValue.ToString(),
    //      ddlAddStatus.SelectedValue,
    //       DateTime.Today,
    //       Convert.ToString(Session["Username"])
    //       );

    //    FileUpload1.SaveAs(Server.MapPath("Images\\Animals\\" + FileUpload1.FileName));
    //    ImageString = "~\\Images\\Animals\\" + FileUpload1.FileName;
    //    string creatAnimal = "Insert into [dbo].[Animal] values (@Species, @ScientificName, @AnimalName, @AnimalType, @Status, @Image, @LastUpdated, @LastUpdatedBy)";
    //    SqlCommand addAnimal = new SqlCommand(creatAnimal, sc);
    //    sc.Open();
    //    addAnimal.Parameters.AddWithValue("@Species", DBNull.Value);
    //    addAnimal.Parameters.AddWithValue("@ScientificName", DBNull.Value);
    //    addAnimal.Parameters.AddWithValue("@AnimalName", newAnimal.getAnimalName());
    //    addAnimal.Parameters.AddWithValue("@AnimalType", newAnimal.getAnimalType());
    //    addAnimal.Parameters.AddWithValue("@Status", newAnimal.getStatus());
    //    addAnimal.Parameters.AddWithValue("@LastUpdated", newAnimal.getLastUpdated());
    //    addAnimal.Parameters.AddWithValue("@LastUpdatedBy", Session["UserFullName"]);
    //    addAnimal.Parameters.AddWithValue("@Image", ImageString);

    //    addAnimal.ExecuteNonQuery();

    //    txtAddName.Text = " ";

    //    grdOrganizations.DataBind();

    //}

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