using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PaymentReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


    }

    protected void btnOct_Click(object sender, EventArgs e)
    {
        SqlDataSource2.SelectParameters["month"].DefaultValue = "10";
        SqlDataSource3.SelectParameters["month"].DefaultValue = "10";
    }

    protected void btnJan_Click(object sender, EventArgs e)
    {
        SqlDataSource2.SelectParameters["month"].DefaultValue = "1";
        SqlDataSource3.SelectParameters["month"].DefaultValue = "1";
    }

    protected void btnFeb_Click(object sender, EventArgs e)
    {
        SqlDataSource2.SelectParameters["month"].DefaultValue = "2";
        SqlDataSource3.SelectParameters["month"].DefaultValue = "2";
    }

    protected void btnMar_Click(object sender, EventArgs e)
    {
        SqlDataSource2.SelectParameters["month"].DefaultValue = "3";
        SqlDataSource3.SelectParameters["month"].DefaultValue = "3";
    }

    protected void btnApr_Click(object sender, EventArgs e)
    {
        SqlDataSource2.SelectParameters["month"].DefaultValue = "4";
        SqlDataSource3.SelectParameters["month"].DefaultValue = "4";
    }

    protected void btnMay_Click(object sender, EventArgs e)
    {
        SqlDataSource2.SelectParameters["month"].DefaultValue = "5";
        SqlDataSource3.SelectParameters["month"].DefaultValue = "5";
    }

    protected void btnJun_Click(object sender, EventArgs e)
    {
        SqlDataSource2.SelectParameters["month"].DefaultValue = "6";
        SqlDataSource3.SelectParameters["month"].DefaultValue = "6";
    }

    protected void btnJul_Click(object sender, EventArgs e)
    {
        SqlDataSource2.SelectParameters["month"].DefaultValue = "7";
        SqlDataSource3.SelectParameters["month"].DefaultValue = "7";
    }

    protected void btnAug_Click(object sender, EventArgs e)
    {
        SqlDataSource2.SelectParameters["month"].DefaultValue = "8";
        SqlDataSource3.SelectParameters["month"].DefaultValue = "8";
    }

    protected void btnSep_Click(object sender, EventArgs e)
    {
        SqlDataSource2.SelectParameters["month"].DefaultValue = "9";
        SqlDataSource3.SelectParameters["month"].DefaultValue = "9";
    }

    protected void btnNov_Click(object sender, EventArgs e)
    {
        SqlDataSource2.SelectParameters["month"].DefaultValue = "11";
        SqlDataSource3.SelectParameters["month"].DefaultValue = "11";
    }

    protected void btnDec_Click(object sender, EventArgs e)
    {
        SqlDataSource2.SelectParameters["month"].DefaultValue = "12";
        SqlDataSource3.SelectParameters["month"].DefaultValue = "12";
    }


    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Verifies that the control is rendered */
    }

    protected void ExportToExcel(GridView grid)
    {
        Response.Clear();
        Response.Buffer = true;
        Response.ClearContent();
        Response.ClearHeaders();
        Response.Charset = "";
        string FileName = "PaymentReport" + DateTime.Now + ".xls";
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

    protected void Button1_Click(object sender, EventArgs e)
    {
        ExportToExcel(annualGrid);
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        ExportToExcel(monthGrid);
    }
}