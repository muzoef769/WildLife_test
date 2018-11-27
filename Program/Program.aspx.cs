using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Text.RegularExpressions;

public partial class Program : System.Web.UI.Page
{
    System.Data.SqlClient.SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString);
    public static Int32 id;
    private string SearchString = "";
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void redirectProgram(object sender, EventArgs e)
    {
        Response.Redirect("AddProgram.aspx");
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

        string AnimalList = " SELECT Animal.AnimalName, Animal.AnimalType FROM Animal INNER JOIN AssignAnimal ON Animal.AnimalID = AssignAnimal.AnimalID WHERE AssignAnimal.NewProgramID = @NewProgramID";



        SqlCommand cmd3 = sc.CreateCommand();
        cmd3.CommandType = CommandType.Text;
        cmd3.CommandText = AnimalList;
        cmd3.Parameters.AddWithValue("@NewProgramID", id);
        SqlDataAdapter da3 = new SqlDataAdapter(cmd3);
        DataTable dt3 = new DataTable();
        da3.Fill(dt3);
        GridView2.DataSource = dt3;
        GridView2.DataBind();
    }

    protected void GridView5_SelectedIndexChanged(object sender, EventArgs e)
    {

        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
        id = Convert.ToInt32(GridView5.SelectedValue.ToString());

        string AnimalList = " SELECT Animal.AnimalName, Animal.AnimalType FROM Animal INNER JOIN AssignAnimal ON Animal.AnimalID = AssignAnimal.AnimalID WHERE AssignAnimal.NewProgramID = @NewProgramID";



        SqlCommand cmd3 = sc.CreateCommand();
        cmd3.CommandType = CommandType.Text;
        cmd3.CommandText = AnimalList;
        cmd3.Parameters.AddWithValue("@NewProgramID", id);
        SqlDataAdapter da3 = new SqlDataAdapter(cmd3);
        DataTable dt3 = new DataTable();
        da3.Fill(dt3);
        GridView2.DataSource = dt3;
        GridView2.DataBind();
    }

    protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
    {


        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
        id = Convert.ToInt32(GridView3.SelectedValue.ToString());

        string AnimalList = " SELECT Animal.AnimalName, Animal.AnimalType FROM Animal INNER JOIN AssignAnimal ON Animal.AnimalID = AssignAnimal.AnimalID WHERE AssignAnimal.NewProgramID = @NewProgramID";



        SqlCommand cmd3 = sc.CreateCommand();
        cmd3.CommandType = CommandType.Text;
        cmd3.CommandText = AnimalList;
        cmd3.Parameters.AddWithValue("@NewProgramID", id);
        SqlDataAdapter da3 = new SqlDataAdapter(cmd3);
        DataTable dt3 = new DataTable();
        da3.Fill(dt3);
        GridView2.DataSource = dt3;
        GridView2.DataBind();
    }

    protected void GridView4_SelectedIndexChanged(object sender, EventArgs e)
    {


        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
        id = Convert.ToInt32(GridView4.SelectedValue.ToString());

        string AnimalList = " SELECT Animal.AnimalName, Animal.AnimalType FROM Animal INNER JOIN AssignAnimal ON Animal.AnimalID = AssignAnimal.AnimalID WHERE AssignAnimal.NewProgramID = @NewProgramID";



        SqlCommand cmd3 = sc.CreateCommand();
        cmd3.CommandType = CommandType.Text;
        cmd3.CommandText = AnimalList;
        cmd3.Parameters.AddWithValue("@NewProgramID", id);
        SqlDataAdapter da3 = new SqlDataAdapter(cmd3);
        DataTable dt3 = new DataTable();
        da3.Fill(dt3);
        GridView2.DataSource = dt3;
        GridView2.DataBind();
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
    }

    protected void btnClearAll_Click(object sender, EventArgs e)
    {
        //  Simple clean up text to return the Gridview to it's default state
        txtSearchAll.Text = "";
        SearchString = "";
        GridView5.DataBind();
    }

    protected void txtSearchAll_TextChanged(object sender, EventArgs e)
    {
        SearchString = txtSearchAll.Text;
    }

}