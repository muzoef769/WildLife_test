using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SimpleReport : System.Web.UI.Page
{
    private string SearchString = "";

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Verifies that the control is rendered */
    }

    protected void exportMonthly_Click(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        Response.Clear();
        Response.Buffer = true;
        string FileName = "SimpleReport" + DateTime.Now + ".xls";
        Response.AddHeader("content-disposition", "attachment;filename=" + FileName);
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        using (StringWriter sw = new StringWriter())
        {
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            offsiteGrid.AllowPaging = false;
            onlineGrid.AllowPaging = false;
            onsiteGrid.AllowPaging = false;
            totProgramsGrid.AllowPaging = false;
            totKidsGrid.AllowPaging = false;
            totAdultsGrid.AllowPaging = false;
            totPeopleGrid.AllowPaging = false;
            foreach (System.Web.UI.WebControls.TableCell cell in offsiteGrid.HeaderRow.Cells)
            {
                dt.Columns.Add(cell.Text);
            }
            foreach (GridViewRow row in offsiteGrid.Rows)
            {
                dt.Rows.Add();
                for (int j = 0; j < row.Cells.Count; j++)
                {
                    dt.Rows[dt.Rows.Count - 1][j] = row.Cells[j].Text;
                }
            }
            foreach (GridViewRow row in onlineGrid.Rows)
            {
                dt.Rows.Add();
                for (int j = 0; j < row.Cells.Count; j++)
                {
                    dt.Rows[dt.Rows.Count - 1][j] = row.Cells[j].Text;
                }
            }
            foreach (GridViewRow row in onsiteGrid.Rows)
            {
                dt.Rows.Add();
                for (int j = 0; j < row.Cells.Count; j++)
                {
                    dt.Rows[dt.Rows.Count - 1][j] = row.Cells[j].Text;
                }
            }
            foreach (GridViewRow row in totProgramsGrid.Rows)
            {
                dt.Rows.Add();
                for (int j = 0; j < row.Cells.Count; j++)
                {
                    dt.Rows[dt.Rows.Count - 1][j] = row.Cells[j].Text;
                }
            }
            foreach (GridViewRow row in totKidsGrid.Rows)
            {
                dt.Rows.Add();
                for (int j = 0; j < row.Cells.Count; j++)
                {
                    dt.Rows[dt.Rows.Count - 1][j] = row.Cells[j].Text;
                }
            }
            foreach (GridViewRow row in totAdultsGrid.Rows)
            {
                dt.Rows.Add();
                for (int j = 0; j < row.Cells.Count; j++)
                {
                    dt.Rows[dt.Rows.Count - 1][j] = row.Cells[j].Text;
                }
            }
            foreach (GridViewRow row in totPeopleGrid.Rows)
            {
                dt.Rows.Add();
                for (int j = 0; j < row.Cells.Count; j++)
                {
                    dt.Rows[dt.Rows.Count - 1][j] = row.Cells[j].Text;
                }
            }

            GridView gridView = new GridView();
            gridView.DataSource = dt;
            gridView.DataBind();
            gridView.GridLines = GridLines.Both;
            gridView.HeaderStyle.Font.Bold = true;
            gridView.RenderControl(hw);
            string style = @"<style> .textmode { } </style>";
            Response.Write(style);
            Response.Output.Write(sw.ToString());
            Response.Flush();
            Response.End();
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Clear();
        Response.Buffer = true;
        Response.ClearContent();
        Response.ClearHeaders();
        Response.Charset = "";
        string FileName = "AnimalCounts" + DateTime.Now + ".xls";
        StringWriter strwritter = new StringWriter();
        HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.ContentType = "application/vnd.ms-excel";
        Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
        animalGrid.Width = 100;
        animalGrid.GridLines = GridLines.Both;
        animalGrid.HeaderStyle.Font.Bold = true;
        animalGrid.RenderControl(htmltextwrtter);
        Response.Write(strwritter.ToString());
        Response.End();
    }
    protected void dateFilter_Click(object sender, EventArgs e)
    {
        DateTime start = Convert.ToDateTime(startDate.Value);
        DateTime end = Convert.ToDateTime(endDate.Value);

        SqlDataSource48.SelectCommand = "Select distinct AnimalName, count(aa.NewProgramID) as 'Programs', sum(TotalPeople) as 'TotalPeople' from dbo.AssignAnimal aa left outer join dbo.Animal a on a.AnimalID=aa.AnimalID inner join dbo.NewProgram np on np.NewProgramID = aa.NewProgramID WHERE np.DateCompleted >='" + start + "' and np.DateCompleted <='" + end + "' group by AnimalName";
        animalGrid.DataBind();
    }
    //public string HighlightText(string InputTxt)
    //{
    //    string Search_Str = txtYear.Text;
    //    // Setup the regular expression and add the Or operator.
    //    Regex RegExp = new Regex(Search_Str.Replace(" ", "|").Trim(), RegexOptions.IgnoreCase);
    //    // Highlight keywords by calling the
    //    //delegate each time a keyword is found.
    //    return RegExp.Replace(InputTxt, new MatchEvaluator(ReplaceKeyWords));
    //}

    public string ReplaceKeyWords(Match m)
    {
        return ("<span class=highlight>" + m.Value + "</span>");
    }
    //protected void btnFilter_Click(object sender, EventArgs e)
    //{
    //    //  Set the value of the SearchString so it gets
    //    SearchString = Convert.ToString(txtYear.Text);
    //}

    //protected void dateClear_Click(object sender, EventArgs e)
    //{
    //    //  Simple clean up text to return the Gridview to it's default state
    //    txtYear.Text = "";
    //    SearchString = "";
    //    offsiteGrid.DataBind();
    //    onsiteGrid.DataBind();
    //    onlineGrid.DataBind();
    //    totAdultsGrid.DataBind();
    //    totKidsGrid.DataBind();
    //    totPeopleGrid.DataBind();
    //    totProgramsGrid.DataBind();

    //}

    protected void ddlYearFilter_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void dateClear_Click(object sender, EventArgs e)
    {
        startDate.Value = "";
        endDate.Value = "";
        SqlDataSource48.SelectCommand = "Select distinct AnimalName, count(aa.NewProgramID) as 'Programs', sum(TotalPeople) as 'TotalPeople' from dbo.AssignAnimal aa left outer join dbo.Animal a on a.AnimalID=aa.AnimalID inner join dbo.NewProgram np on np.NewProgramID = aa.NewProgramID group by AnimalName";
        animalGrid.DataBind();
    }

}