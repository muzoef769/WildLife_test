using System;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manage : System.Web.UI.Page
{
    System.Data.SqlClient.SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString);



    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {


            foreach (GridViewRow row in allGridView.Rows)
            {
                DropDownList ddl = (row.Cells[5].FindControl("ddlStatus") as DropDownList);
                String status = (row.Cells[4].Text);

                if (status == "Active")
                {
                    ddlStatus.SelectedValue = "Active";



                }

                if (status == "Inactive")
                {
                    ddlStatus.SelectedValue = "Inactive";


                }

                if (status == "Temporarily Inactive")
                {
                    ddlStatus.SelectedValue = "Temporarily Inactive";

                }

                if (status == "Not Approved")
                {
                    ddlStatus.SelectedValue = "Not Approved";

                }

                allGridView.Columns[4].Visible = false;
                ddl.DataBind();

            }


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
        string updateStatus = "UPDATE [dbo].[User] SET UserStatus = @MarkStatus WHERE Username = @Username";
        sc.Open();
        SqlCommand statusUpdate = new SqlCommand(updateStatus, sc);
        statusUpdate.Parameters.AddWithValue("@MarkStatus", MarkStatus);
        statusUpdate.Parameters.AddWithValue("@Username", userName);
        statusUpdate.ExecuteNonQuery();
        volGridView.DataBind();
        Page.DataBind();

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
        Page.DataBind();

    }


    protected void Unnamed_SelectedIndexChanged(object sender, EventArgs e)
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
        Page.DataBind();

    }
}