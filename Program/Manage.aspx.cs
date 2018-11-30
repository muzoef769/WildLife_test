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

    }
    protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DropDownList ddl = (e.Row.FindControl("ddlStatus") as DropDownList);

            ddl.DataBind();

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
                String userName = (row.Cells[0].Text);
                if (chkStatus.Checked)
                {
                    updateRow(userName, "Active");
                }

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
                String userName = (row.Cells[0].Text);
                if (chkStatus.Checked)
                {
                    updateRow(userName, "Active");
                }

            }
        }
        catch (Exception)
        {

        }
    }

    protected void updateRow2(String userName, String MarkStatus)
    {
        sc.Close();
        string updateStatus = "UPDATE [dbo].[User] SET UserStatus = @MarkStatus, LastUpdated = @LastUpdated, LastUpdatedBy = @LastUpdatedBy WHERE Username = @Username";
        sc.Open();
        SqlCommand statusUpdate = new SqlCommand(updateStatus, sc);
        statusUpdate.Parameters.AddWithValue("@MarkStatus", MarkStatus);
        statusUpdate.Parameters.AddWithValue("@Username", userName);
        statusUpdate.Parameters.AddWithValue("@LastUpdated", DateTime.Now);
        statusUpdate.Parameters.AddWithValue("@LastUpdatedBy", Session["UserFullName"].ToString());
        statusUpdate.ExecuteNonQuery();
        staffGridView.DataBind();
        volGridView.DataBind();
        allGridView.DataBind();
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


    //private DataSet GetData(string query)
    //{
    //    string conString = ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
    //    SqlCommand cmd = new SqlCommand(query);
    //    using (SqlConnection con = new SqlConnection(conString))
    //    {
    //        using (SqlDataAdapter sda = new SqlDataAdapter())
    //        {
    //            cmd.Connection = con;
    //            sda.SelectCommand = cmd;
    //            using (DataSet ds = new DataSet())
    //            {
    //                sda.Fill(ds);
    //                return ds;
    //            }
    //        }
    //    }
    //}
}