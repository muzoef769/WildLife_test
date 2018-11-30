using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Payment : System.Web.UI.Page
{
    private string SearchString = "";

    protected void Page_Load(object sender, EventArgs e)
    {

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
        string FileName = prefix + "Invoices" + DateTime.Now + ".xls";
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
        // Hides the first column in the grid (zero-based index)
        outInvGrid.HeaderRow.Cells[0].Visible = false;

        // Loop through the rows and hide the cell in the first column
        for (int i = 0; i < outInvGrid.Rows.Count; i++)
        {
            GridViewRow row = outInvGrid.Rows[i];
            row.Cells[0].Visible = false;
        }

        ExportToExcel(allInvGrid, "All");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        // Hides the first column in the grid (zero-based index)
        paidGrid.HeaderRow.Cells[0].Visible = false;

        // Loop through the rows and hide the cell in the first column
        for (int i = 0; i < paidGrid.Rows.Count; i++)
        {
            GridViewRow row = paidGrid.Rows[i];
            row.Cells[0].Visible = false;
        }

        ExportToExcel(outInvGrid, "Outstanding");
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        // Hides the first column in the grid (zero-based index)
        allInvGrid.HeaderRow.Cells[0].Visible = false;

        // Loop through the rows and hide the cell in the first column
        for (int i = 0; i < allInvGrid.Rows.Count; i++)
        {
            GridViewRow row = allInvGrid.Rows[i];
            row.Cells[0].Visible = false;
        }

        ExportToExcel(paidGrid, "Fulfilled");
    }

    protected void btnFilter_Click(object sender, EventArgs e)
    {
        //  Set the value of the SearchString so it gets
        SearchString = ddlYear.SelectedValue;
    }

    public string ReplaceKeyWords(Match m)
    {
        return ("<span class=highlight>" + m.Value + "</span>");
    }

    protected void dateClear_Click(object sender, EventArgs e)
    {
        //  Simple clean up text to return the Gridview to it's default state
        SearchString = "";
        allInvGrid.DataBind();
        outInvGrid.DataBind();
        paidGrid.DataBind();
        canceledInvGrid.DataBind();

    }

    protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList ddl = (DropDownList)sender;
        GridViewRow row = (GridViewRow)ddl.NamingContainer;
        DropDownList ddlPaymentType = (row.Cells[2].FindControl("ddlPayTypeAll") as DropDownList);

        if (ddl.SelectedItem.Text == "Unpaid")
        {
            ddlPaymentType.SelectedValue = "TBD";
        }
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList ddl = (DropDownList)sender;
        GridViewRow row = (GridViewRow)ddl.NamingContainer;
        DropDownList ddlPaymentType = (row.Cells[2].FindControl("ddlPayTypeOut") as DropDownList);

        if (ddl.SelectedItem.Text == "Unpaid")
        {
            ddlPaymentType.SelectedValue = "TBD";
        }
        
    }

    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList ddl = (DropDownList)sender;
        GridViewRow row = (GridViewRow)ddl.NamingContainer;
        DropDownList ddlPaymentType = (row.Cells[2].FindControl("ddlPayType") as DropDownList);

        if (ddl.SelectedItem.Text == "Unpaid")
        {
            ddlPaymentType.SelectedValue = "TBD";
        }
        
    }

    protected void allInvGrid_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        allInvGrid.DataBind();
        outInvGrid.DataBind();
        paidGrid.DataBind();
        canceledInvGrid.DataBind();
    }

    protected void ddlPayTypeOut_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList ddl = (DropDownList)sender;
        GridViewRow row = (GridViewRow)ddl.NamingContainer;
        DropDownList ddlPaymentType = (row.Cells[7].FindControl("DropDownList1") as DropDownList);

        if (ddlPaymentType.SelectedItem.Text == "Unpaid")
        {
            ddl.SelectedValue = "TBD";
        }
    }

    protected void ddlPayType_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList ddl = (DropDownList)sender;
        GridViewRow row = (GridViewRow)ddl.NamingContainer;
        DropDownList ddlPaymentType = (row.Cells[7].FindControl("DropDownList2") as DropDownList);

        if (ddlPaymentType.SelectedItem.Text == "Unpaid")
        {
            ddl.SelectedValue = "TBD";
        }
    }

    protected void ddlPayTypeAll_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList ddl = (DropDownList)sender;
        GridViewRow row = (GridViewRow)ddl.NamingContainer;
        DropDownList ddlPaymentType = (row.Cells[7].FindControl("DropDownList3") as DropDownList);

        if (ddlPaymentType.SelectedItem.Text == "Unpaid")
        {
            ddl.SelectedValue = "TBD";
        }
    }

    protected void btnCanceled_Click(object sender, EventArgs e)
    {
        // Hides the first column in the grid (zero-based index)
        canceledInvGrid.HeaderRow.Cells[0].Visible = false;

        // Loop through the rows and hide the cell in the first column
        for (int i = 0; i < canceledInvGrid.Rows.Count; i++)
        {
            GridViewRow row = canceledInvGrid.Rows[i];
            row.Cells[0].Visible = false;
        }

        ExportToExcel(canceledInvGrid, "Canceled");
    }

    protected void btnFilterNum_Click(object sender, EventArgs e)
    {
        string invNum = txtInvoiceNum.Text;

        outstandingSource.SelectCommand = "SELECT Invoice.InvoiceID, Invoice.InvoiceNumber, Payment.PaymentType, Format(Invoice.DateCreated, 'MM/dd/yyyy') as 'DateCreated', Program.ProgramName, Organization.OrganizationName, Invoice.TotalCost, Invoice.InvoiceStatus " +
            "FROM Program INNER JOIN NewProgram ON Program.ProgramID = NewProgram.ProgramID INNER JOIN AssignInvoice ON NewProgram.NewProgramID = AssignInvoice.NewProgramID FULL OUTER JOIN Invoice ON AssignInvoice.AssignInvoiceID = Invoice.InvoiceID " +
            "FULL OUTER JOIN Payment ON Invoice.InvoiceID = Payment.InvoiceID LEFT OUTER JOIN Organization ON Payment.OrganizationID = Organization.OrganizationID WHERE InvoiceStatus = 'Unpaid' AND InvoiceNumber LIKE '%" + invNum + "%'";
        programSource.SelectCommand = "SELECT Invoice.InvoiceID, Invoice.InvoiceNumber, Payment.PaymentType, Format(Invoice.DateCreated, 'MM/dd/yyyy') as 'DateCreated', Program.ProgramName, Organization.OrganizationName, Invoice.TotalCost, Invoice.InvoiceStatus " +
            "FROM Program INNER JOIN NewProgram ON Program.ProgramID = NewProgram.ProgramID INNER JOIN AssignInvoice ON NewProgram.NewProgramID = AssignInvoice.NewProgramID FULL OUTER JOIN Invoice ON AssignInvoice.AssignInvoiceID = Invoice.InvoiceID " +
            "FULL OUTER JOIN Payment ON Invoice.InvoiceID = Payment.InvoiceID LEFT OUTER JOIN Organization ON Payment.OrganizationID = Organization.OrganizationID WHERE InvoiceStatus != 'Canceled' AND InvoiceNumber LIKE '%" + invNum + "%'";
        paidSource.SelectCommand = "SELECT Invoice.InvoiceID, Invoice.InvoiceNumber, Payment.PaymentType, Format(Invoice.DateCreated, 'MM/dd/yyyy') as 'DateCreated', Program.ProgramName, Organization.OrganizationName, Invoice.TotalCost, Invoice.InvoiceStatus " +
            "FROM Program INNER JOIN NewProgram ON Program.ProgramID = NewProgram.ProgramID INNER JOIN AssignInvoice ON NewProgram.NewProgramID = AssignInvoice.NewProgramID FULL OUTER JOIN Invoice ON AssignInvoice.AssignInvoiceID = Invoice.InvoiceID " +
            "FULL OUTER JOIN Payment ON Invoice.InvoiceID = Payment.InvoiceID LEFT OUTER JOIN Organization ON Payment.OrganizationID = Organization.OrganizationID WHERE InvoiceStatus = 'Paid' AND InvoiceNumber LIKE '%" + invNum + "%'";
        Sqldatasource92.SelectCommand = "SELECT Invoice.InvoiceID, Invoice.InvoiceNumber, Payment.PaymentType, Format(Invoice.DateCreated, 'MM/dd/yyyy') as 'DateCreated', Program.ProgramName, Organization.OrganizationName, Invoice.TotalCost, Invoice.InvoiceStatus " +
            "FROM Program INNER JOIN NewProgram ON Program.ProgramID = NewProgram.ProgramID INNER JOIN AssignInvoice ON NewProgram.NewProgramID = AssignInvoice.NewProgramID FULL OUTER JOIN Invoice ON AssignInvoice.AssignInvoiceID = Invoice.InvoiceID " +
            "FULL OUTER JOIN Payment ON Invoice.InvoiceID = Payment.InvoiceID LEFT OUTER JOIN Organization ON Payment.OrganizationID = Organization.OrganizationID WHERE InvoiceStatus = 'Canceled' AND InvoiceNumber LIKE '%" + invNum + "%'";



    }

    protected void btnClearNum_Click(object sender, EventArgs e)
    {
        //  Simple clean up text to return the Gridview to it's default state
        txtInvoiceNum.Text = "";
        SearchString = "";
        allInvGrid.DataBind();
        outInvGrid.DataBind();
        paidGrid.DataBind();
        canceledInvGrid.DataBind();
    }
}