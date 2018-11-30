using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Text.RegularExpressions;
using System.Web;
using System.Drawing;

public partial class Program : System.Web.UI.Page
{
    System.Data.SqlClient.SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString);
    public static Int32 id;
    private string SearchString = "";



    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            ViewState["direction"] = 0;
        }
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
        sc.Open();
        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
        id = Convert.ToInt32(GridView1.SelectedValue.ToString());
        ViewState["NewProgramID"] = id;

        string notes = "SELECT np.MiscNotes from NewProgram np WHERE NewProgramID = @NewProgramID";
        SqlCommand noteCommand = sc.CreateCommand();
        noteCommand.CommandType = CommandType.Text;
        noteCommand.CommandText = notes;
        noteCommand.Parameters.AddWithValue("@NewProgramID", id);

        txtNotes.Text = Convert.ToString(noteCommand.ExecuteScalar());

        string AnimalList = " SELECT Animal.AnimalName, Animal.AnimalType FROM Animal INNER JOIN AssignAnimal ON Animal.AnimalID = AssignAnimal.AnimalID WHERE AssignAnimal.NewProgramID = @NewProgramID";

        SqlCommand cmd3 = sc.CreateCommand();
        cmd3.CommandType = CommandType.Text;
        cmd3.CommandText = AnimalList;
        cmd3.Parameters.AddWithValue("@NewProgramID", id);
        SqlDataAdapter da3 = new SqlDataAdapter(cmd3);
        DataTable dt3 = new DataTable();
        da3.Fill(dt3);
        ViewState["modalDataTable"] = dt3;
        GridView2.DataSource = dt3;
        GridView2.DataBind();
    }




    protected void GridView5_RowDataBound1(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView5, "Select$" + e.Row.RowIndex);
            e.Row.ToolTip = "Click to select this row.";



        }

    }


    protected void GridView5_SelectedIndexChanged(object sender, EventArgs e)
    {
        sc.Open();
        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
        id = Convert.ToInt32(GridView5.SelectedValue.ToString());
        ViewState["NewProgramID"] = id;

        string notes = "SELECT np.MiscNotes from NewProgram np WHERE NewProgramID = @NewProgramID";
        SqlCommand noteCommand = sc.CreateCommand();
        noteCommand.CommandType = CommandType.Text;
        noteCommand.CommandText = notes;
        noteCommand.Parameters.AddWithValue("@NewProgramID", id);

        txtNotes.Text = Convert.ToString(noteCommand.ExecuteScalar());

        String programString = "SELECT Program.ProgramName FROM Program INNER JOIN NewProgram ON NewProgram.ProgramID = Program.ProgramID WHERE NewProgram.NewProgramID = @NewProgramID";
        SqlCommand commProgramName = sc.CreateCommand();
        commProgramName.CommandType = CommandType.Text;
        commProgramName.CommandText = programString;

        commProgramName.Parameters.AddWithValue("@NewProgramID", id);
        
        String progName = Convert.ToString(commProgramName.ExecuteScalar());
        
        ViewState["pName"] = progName;
        pName.Text = (String)ViewState["pName"];
        sc.Close();



        String AnimalList = " SELECT Animal.AnimalName, Animal.AnimalType FROM Animal INNER JOIN AssignAnimal ON Animal.AnimalID = AssignAnimal.AnimalID WHERE AssignAnimal.NewProgramID = @NewProgramID";


        SqlCommand cmd3 = sc.CreateCommand();
        cmd3.CommandType = CommandType.Text;
        cmd3.CommandText = AnimalList;
        cmd3.Parameters.AddWithValue("@NewProgramID", id);
        SqlDataAdapter da3 = new SqlDataAdapter(cmd3);
        DataTable dt3 = new DataTable();
        da3.Fill(dt3);
        ViewState["modalDataTable"] = dt3;
        GridView2.DataSource = dt3;
        GridView2.DataBind();
    }




    protected void GridView3_RowDataBound1(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView3, "Select$" + e.Row.RowIndex);
            e.Row.ToolTip = "Click to select this row.";



        }

    }

    protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
    {
        sc.Open();

        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
        id = Convert.ToInt32(GridView3.SelectedValue.ToString());
        ViewState["NewProgramID"] = id;

        string notes = "SELECT np.MiscNotes from NewProgram np WHERE NewProgramID = @NewProgramID";
        SqlCommand noteCommand = sc.CreateCommand();
        noteCommand.CommandType = CommandType.Text;
        noteCommand.CommandText = notes;
        noteCommand.Parameters.AddWithValue("@NewProgramID", id);

        txtNotes.Text = Convert.ToString(noteCommand.ExecuteScalar());

        string AnimalList = " SELECT Animal.AnimalName, Animal.AnimalType FROM Animal INNER JOIN AssignAnimal ON Animal.AnimalID = AssignAnimal.AnimalID WHERE AssignAnimal.NewProgramID = @NewProgramID";



        SqlCommand cmd3 = sc.CreateCommand();
        cmd3.CommandType = CommandType.Text;
        cmd3.CommandText = AnimalList;
        cmd3.Parameters.AddWithValue("@NewProgramID", id);
        SqlDataAdapter da3 = new SqlDataAdapter(cmd3);
        DataTable dt3 = new DataTable();
        da3.Fill(dt3);
        ViewState["modalDataTable"] = dt3;
        GridView2.DataSource = dt3;
        GridView2.DataBind();
    }



    protected void GridView4_RowDataBound1(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView4, "Select$" + e.Row.RowIndex);
            e.Row.ToolTip = "Click to select this row.";



        }

    }

    protected void GridView4_SelectedIndexChanged(object sender, EventArgs e)
    {
        sc.Open();
        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
        id = Convert.ToInt32(GridView4.SelectedValue.ToString());
        ViewState["NewProgramID"] = id;

        string notes = "SELECT np.MiscNotes from NewProgram np WHERE NewProgramID = @NewProgramID";
        SqlCommand noteCommand = sc.CreateCommand();
        noteCommand.CommandType = CommandType.Text;
        noteCommand.CommandText = notes;
        noteCommand.Parameters.AddWithValue("@NewProgramID", id);

        txtNotes.Text = Convert.ToString(noteCommand.ExecuteScalar());

        string AnimalList = " SELECT Animal.AnimalName, Animal.AnimalType FROM Animal INNER JOIN AssignAnimal ON Animal.AnimalID = AssignAnimal.AnimalID WHERE AssignAnimal.NewProgramID = @NewProgramID";



        SqlCommand cmd3 = sc.CreateCommand();
        cmd3.CommandType = CommandType.Text;
        cmd3.CommandText = AnimalList;
        cmd3.Parameters.AddWithValue("@NewProgramID", id);
        SqlDataAdapter da3 = new SqlDataAdapter(cmd3);
        DataTable dt3 = new DataTable();
        da3.Fill(dt3);
        ViewState["modalDataTable"] = dt3;
        GridView2.DataSource = dt3;
        GridView2.DataBind();
    }

    public string HighlightText(string InputTxt)
    {
        string Search_Str = HttpUtility.HtmlEncode(txtSearchAll.Text);
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
        SearchString = HttpUtility.HtmlEncode(txtSearchAll.Text);
    }


    protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView2.PageIndex = e.NewPageIndex;
        GridView2.DataBind();

    }

    protected void GridView2_Sorting(object sender, GridViewSortEventArgs e)
    {
        DataTable dataTable = (DataTable)ViewState["modalDataTable"];

        if (dataTable != null)
        {
            DataView dataView = new DataView(dataTable);
            dataView.Sort = e.SortExpression + " " + ConvertSortDirectionToSql(e.SortDirection);

            GridView2.DataSource = dataView;
            GridView2.DataBind();
        }
    }

    private string ConvertSortDirectionToSql(SortDirection sortDirection)
    {
        string newSortDirection = String.Empty;

        switch ((Int32)ViewState["direction"])
        {
            case 0:
                newSortDirection = "DESC";
                ViewState["direction"] = 1;

                break;

            case 1:
                newSortDirection = "ASC";
                ViewState["direction"] = 0;
                break;
        }

        return newSortDirection;
    }


    protected void btnSaveNotes_Click(object sender, EventArgs e)
    {
        sc.Open();
        string newNotes = txtNotes.Text;

        Int32 newID = Convert.ToInt32(ViewState["NewProgramID"]);
        string update = "UPDATE dbo.NewProgram set MiscNotes = @newNotes where NewProgramID = @NewProgramID";

        SqlCommand updateNotes = sc.CreateCommand();
        updateNotes.CommandType = CommandType.Text;
        updateNotes.CommandText = update;
        updateNotes.Parameters.AddWithValue("@NewProgramID", newID);
        updateNotes.Parameters.AddWithValue("@newNotes", newNotes);

        updateNotes.ExecuteNonQuery();

    }
}