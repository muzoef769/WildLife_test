using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manage : System.Web.UI.Page
{

    System.Data.SqlClient.SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString);



    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!IsPostBack)
        //{
        //    foreach (GridViewRow row in allGridView.Rows)
        //    {
        //        DropDownList ddl = (row.Cells[5].FindControl("ddlStatus") as DropDownList);
        //        String status = (row.Cells[5].Text);


        //        if (status == "Active")
        //        {
        //            ddlStatus.SelectedValue = "Active";

        //        }

        //        if (status == "Inactive")
        //        {
        //            ddlStatus.SelectedValue = "Inactive";


        //        }

        //        if (status == "Temporarily Inactive")
        //        {
        //            ddlStatus.SelectedValue = "Temporarily Inactive";

        //        }

        //        if (status == "Not Approved")
        //        {
        //            ddlStatus.SelectedValue = "Not Approved";

        //        }

        //        allGridView.Columns[4].Visible = false;
        //        ddl.DataBind();
        //    }
        //}


    }
    protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //Find the DropDownList in the Row.
            DropDownList ddl = (e.Row.FindControl("ddlStatus") as DropDownList);
            //ddl.DataSource = GetData("SELECT DISTINCT UserStatus FROM [dbo].[User]");
            //ddl.DataTextField = "UserStatus";
            //ddl.DataValueField = "UserStatus";
            ddl.DataBind();

            //Add Default Item in the DropDownList.
            //ddl.Items.Insert(0, new ListItem("Inactive"));
            //ddl.Items.Insert(1, new ListItem("Temporarily Inactive"));

            //Select the Status of User in DropDownList.
            string status = (e.Row.FindControl("lblStatus") as Label).Text;

            if (status == "Active")
            {

                ddl.Items.FindByValue(status).Selected = true;

            }

            if (status == "Inactive")
            {

                ddl.Items.FindByValue(status).Selected = true;


            }

            if (status == "Temporarily Inactive")
            {

                ddl.Items.FindByValue(status).Selected = true;

            }

            if (status == "Not Approved")
            {

                ddl.Items.FindByValue(status).Selected = true;

            }


            //ddl.Items.FindByValue(status).Selected = true;
        }
    }

    protected void btnStatusUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            foreach (GridViewRow row in volGridView.Rows)
            {
                CheckBox chkStatus = (row.Cells[3].FindControl("chkStatus") as CheckBox);
                String userName = (row.Cells[2].Text);
                if (chkStatus.Checked)
                {
                    updateRow(userName, "Active");
                }
                //else
                //{
                //    updateRow(userName, "Not Approved");
                //}
            }
        }
        catch (Exception)
        {

        }
    }

    protected void updateRow(String userName, String MarkStatus)
    {
        sc.Close();
        //string updateStatus = "UPDATE [dbo].[User] SET UserStatus = @MarkStatus WHERE Username = @Username";
        string updateStatus = "UPDATE [dbo].[User] SET UserStatus = @MarkStatus, LastUpdated = @LastUpdated, LastUpdatedBy = @LastUpdatedBy WHERE Username = @Username";
        sc.Open();
        SqlCommand statusUpdate = new SqlCommand(updateStatus, sc);
        statusUpdate.Parameters.AddWithValue("@MarkStatus", MarkStatus);
        statusUpdate.Parameters.AddWithValue("@Username", userName);
        statusUpdate.Parameters.AddWithValue("@LastUpdated", DateTime.Now);
        statusUpdate.Parameters.AddWithValue("@LastUpdatedBy", Session["UserFullName"].ToString());
        statusUpdate.ExecuteNonQuery();
        volGridView.DataBind();
        staffGridView.DataBind();
        allGridView.DataBind();

    }


    protected void btnStatusUpdate2_Click(object sender, EventArgs e)
    {
        try
        {
            foreach (GridViewRow row in staffGridView.Rows)
            {
                CheckBox chkStatus = (row.Cells[3].FindControl("chkStatus") as CheckBox);
                String userName = (row.Cells[2].Text);
                if (chkStatus.Checked)
                {
                    updateRow2(userName, "Active");
                }
                //else
                //{
                //    updateRow(userName, "Not Approved");
                //}
            }
        }
        catch (Exception)
        {

        }
    }

    protected void updateRow2(String userName, String MarkStatus)
    {
        sc.Close();
        string updateStatus = "UPDATE [dbo].[User] SET UserStatus = @MarkStatus WHERE Username = @Username";
        sc.Open();
        SqlCommand statusUpdate = new SqlCommand(updateStatus, sc);
        statusUpdate.Parameters.AddWithValue("@MarkStatus", MarkStatus);
        statusUpdate.Parameters.AddWithValue("@Username", userName);
        statusUpdate.ExecuteNonQuery();
        staffGridView.DataBind();
        volGridView.DataBind();
        allGridView.DataBind();
    }

    protected void updateRow3(String userName, String MarkStatus)
    {
        sc.Close();
        string updateStatus = "UPDATE [dbo].[User] SET UserStatus = @MarkStatus WHERE Username = @Username";
        sc.Open();
        SqlCommand statusUpdate = new SqlCommand(updateStatus, sc);
        statusUpdate.Parameters.AddWithValue("@MarkStatus", MarkStatus);
        statusUpdate.Parameters.AddWithValue("@Username", userName);
        statusUpdate.ExecuteNonQuery();
        allGridView.DataBind();
        volGridView.DataBind();
        staffGridView.DataBind();


    }


    protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        //try
        //{

        DropDownList ddl = (DropDownList)sender;
        GridViewRow row = (GridViewRow)ddl.NamingContainer;
        String userName = (row.Cells[0].Text);

        updateRow3(userName, ddl.SelectedValue);


        //}
        //catch (Exception)
        //{

        //}
    }

    private DataSet GetData(string query)
    {
        string conString = ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
        SqlCommand cmd = new SqlCommand(query);
        using (SqlConnection con = new SqlConnection(conString))
        {
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                cmd.Connection = con;
                sda.SelectCommand = cmd;
                using (DataSet ds = new DataSet())
                {
                    sda.Fill(ds);
                    return ds;
                }
            }
        }
    }
}