using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SimpleReport : System.Web.UI.Page
{
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
}