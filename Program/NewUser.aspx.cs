using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NewUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblStatus.Text = null;
        lblUserStatus.Text = " ";

    }

    protected void btnCreate_Click(object sender, EventArgs e)
    {

        Page.Validate();
        if (userType.SelectedIndex < 1)
        {
            reqType.IsValid = false;
            lblUserStatus.Text = "Choose a type";
        }
        if (Page.IsValid)
        {
            //COMMIT VALUES
            //try
            {
                // connect to PBKDF2 database
                System.Data.SqlClient.SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString);

                ViewState["password"] = HttpUtility.HtmlEncode(txtConfirmPw.Value);

                String strGetUser = "Select UserID from [dbo].[User] where Username = @Username";

                // CHECK FOR EXISTING USERNAMES IN USER RECORD
                using (SqlCommand getUser = new SqlCommand(strGetUser, sc))
                {
                    sc.Open();
                    getUser.Parameters.AddWithValue("@Username", HttpUtility.HtmlEncode(txtUsername.Text));
                    SqlDataReader reader = getUser.ExecuteReader();

                    // if the username exists, process will stop
                    if (reader.HasRows)
                    {
                        txtUsername.Text = null;
                        lblUserStatus.Text = "Username Already Exists!";

                    }

                    // if the username doesn't exist, it will show failure
                    else
                    {
                        sc.Close();

                        // INSERT USER RECORD
                        String strCreateUser = "insert into[dbo].[User] values(@FirstName, @LastName, @Username, @UserType, @LastUpdated, @LastUpdatedBy)";
                        using (SqlCommand createUser = new SqlCommand(strCreateUser, sc))
                        {

                            sc.Open();
                            createUser.Parameters.AddWithValue("@FirstName", HttpUtility.HtmlEncode(txtFirstName.Text));
                            createUser.Parameters.AddWithValue("@LastName", HttpUtility.HtmlEncode(txtLastName.Text));
                            createUser.Parameters.AddWithValue("@Username", HttpUtility.HtmlEncode(txtUsername.Text));
                            createUser.Parameters.AddWithValue("@UserType", HttpUtility.HtmlEncode(userType.SelectedValue));
                            createUser.Parameters.AddWithValue("@LastUpdated", DateTime.Today);
                            createUser.Parameters.AddWithValue("@LastUpdatedBy", HttpUtility.HtmlEncode(Session["Username"].ToString()));
                            createUser.ExecuteNonQuery();
                            sc.Close();


                        }


                        // INSERT PASSWORD RECORD AND CONNECT TO USER
                        String strSetPass = "insert into [dbo].[Password] values((select max(UserID) from [dbo].[User]), @Username, @Password)";
                        using (SqlCommand setPass = new SqlCommand(strSetPass, sc))
                        {
                            //try
                            //{
                            sc.Open();
                            setPass.Parameters.AddWithValue("@Username", HttpUtility.HtmlEncode(txtUsername.Text));
                            setPass.Parameters.AddWithValue("@Password", PasswordHash.HashPassword(ViewState["password"].ToString())); // hash entered password
                            setPass.ExecuteNonQuery();
                            sc.Close();
                            // Message in the Modal
                            lblStatus.Text = "User Created!";
                            // Modal popup when submitted
                            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "ModalView", "<script>$(function() { $('#newModal').modal('show'); });</script>", false);
                            //}
                            //catch
                            //{
                            //    lblUserStatus.Text = "Error Submiting Password";
                            //    sc.Close();
                            //}

                            // Reset Fields
                            txtUsername.Text = null;
                            txtFirstName.Text = null;
                            txtLastName.Text = null;
                            lblUserStatus.Text = " ";

                        }

                    }
                    sc.Close();
                }
            }
        }
    }
}