using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;
using System.Web.SessionState;

public partial class Default : System.Web.UI.Page
{
    System.Data.SqlClient.SqlConnection myConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString);
    // SqlConnection myConnection = new SqlConnection("server=localhost;database=WildlifeCenter;Trusted_Connection=True");
    //NEED TO EDIT THIS CODE WHEN ON AWS
    public String userType;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            txtStatus.ForeColor = Color.Transparent;
            //txtStatus.Visible = false;
            btnLogin.Enabled = true;
            txtUsername.Enabled = true;
            txtPassword.Enabled = true;

        }


    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString);

        sc.Open();
        System.Data.SqlClient.SqlCommand findPass = new System.Data.SqlClient.SqlCommand();
        findPass.Connection = sc;
        // SELECT PASSWORD STRING WHERE THE ENTERED USERNAME MATCHES
        findPass.CommandText = "select PasswordHash from [dbo].[Password] where Username = @Username";
        findPass.Parameters.Add(new SqlParameter("@Username", txtUsername.Text));

        SqlDataReader reader = findPass.ExecuteReader(); // create a reader

        System.Data.SqlClient.SqlCommand getVolunteer = new System.Data.SqlClient.SqlCommand();

        if (reader.HasRows) // if the username exists, it will continue
        {


            while (reader.Read()) // this will read the single record that matches the entered username
            {
                string storedHash = reader["PasswordHash"].ToString(); // store the database password into this variable

                if (PasswordHash.ValidatePassword(txtPassword.Text, storedHash)) // if the entered password matches what is stored, it will show success
                {
                    // Clear Fields
                    txtStatus.ForeColor = Color.White;
                    txtStatus.Text = "Success!";
                    //txtStatus.Visible = true;
                    btnLogin.Enabled = false;

                    txtUsername.Enabled = false;
                    txtPassword.Enabled = false;
                    Session["Username"] = txtUsername.Text;
                    Session["UserFullName"] = findFullName(txtUsername.Text);


                    getVolunteer.Connection = sc;

                    getVolunteer.CommandText = "SELECT UserType, UserStatus from [dbo].[User] where Username = @Username and UserType = @UserType and UserStatus = @UserStatus";
                    getVolunteer.Parameters.AddWithValue("@Username", txtUsername.Text);
                    getVolunteer.Parameters.AddWithValue("UserType", "Volunteer");
                    getVolunteer.Parameters.AddWithValue("UserStatus", "Active");

                    SqlDataReader volunteerReader = getVolunteer.ExecuteReader();

                    System.Data.SqlClient.SqlCommand getStaff = new System.Data.SqlClient.SqlCommand();
                    getStaff.Connection = sc;

                    getStaff.CommandText = "SELECT UserType, UserStatus from [dbo].[User] where Username = @Username and UserType = @UserType and UserStatus = @UserStatus";
                    getStaff.Parameters.AddWithValue("@Username", txtUsername.Text);
                    getStaff.Parameters.AddWithValue("UserType", "Staff");
                    getStaff.Parameters.AddWithValue("UserStatus", "Active");

                    SqlDataReader staffReader = getStaff.ExecuteReader();

                    if (volunteerReader.HasRows)
                    {
                        while (volunteerReader.Read())
                        {
                            Response.Redirect("VolunteerProgram.aspx", false);
                        }

                    }
                    else if (staffReader.HasRows)
                    {
                        while (staffReader.Read())
                        {
                            Response.Redirect("Manage.aspx", false);
                        }
                    }
                    else
                    {
                        Response.Redirect("Error.aspx", false);
                    }

                    volunteerReader.Close();
                    staffReader.Close();




                }
                else
                {
                    txtStatus.ForeColor = Color.White;
                    txtStatus.Text = "Password is wrong.";
                    //txtStatus.Visible = true;
                }
            }

        }
        else
        {
            txtStatus.Text = "Username does not exist.";
            txtStatus.ForeColor = Color.White ;
            //txtStatus.Visible = true;
        }
        reader.Close();


    }

    protected void lnkCreate_Click(object sender, EventArgs e)
    {
        Response.Redirect("createUser.aspx", false);
    }

    protected void txtStatus_TextChanged(object sender, EventArgs e)
    {
        if (txtStatus.Equals("Username does not exist."))
        {
            txtUsername.Text = null;
            txtPassword.Text = null;
        }

    }
    protected void btnRegister_Click(object sender, EventArgs e)
    {

        //Page.Validate();

        //if (Page.IsValid)
        //{
        //    COMMIT VALUES
        try
        {

            ViewState["password"] = txtConfirmPassword.Value;

            String strGetUser = "Select UserID from [dbo].[User] where Username = @Username";

            // CHECK FOR EXISTING USERNAMES IN USER RECORD
            using (SqlCommand getUser = new SqlCommand(strGetUser, myConnection))
            {
                myConnection.Open();
                getUser.Parameters.AddWithValue("@Username", txtNewUsername.Text);
                SqlDataReader reader = getUser.ExecuteReader();

                // if the username exists, process will stop
                if (reader.HasRows)
                {

                    txtNewUsername.Text = null;
                    txtNewUsername.Text = "Username Already Exists!";


                }

                // if the username doesn't exist
                else
                {
                    myConnection.Close();
                    Users newUser = new Users(
                    txtNewUsername.Text,
                    txtFirstName.Text,
                    txtLastName.Text,
                    rdoPosition.SelectedValue,
                    "Not Approved",
                    DateTime.Now,
                    txtNewUsername.Text,
                    txtEmail.Text
                    );

                    String myQuery = "INSERT INTO [WildlifeCenter].[dbo].[User] (FirstName, LastName, Username, UserType, UserStatus, LastUpdated, LastUpdatedBy, Email) VALUES (@firstName, @lastName, @userName, @userType, @status, @lastUpdated, @lastUpdatedBy, @email)";

                    try
                    {
                        myConnection.Open();

                        SqlCommand myCommand = new SqlCommand(myQuery, myConnection);
                        myCommand.Parameters.AddWithValue("@firstName", newUser.getFirstName());
                        myCommand.Parameters.AddWithValue("@lastName", newUser.getLastName());
                        myCommand.Parameters.AddWithValue("@userName", newUser.getUserName());
                        myCommand.Parameters.AddWithValue("@userType", newUser.getUserType());
                        myCommand.Parameters.AddWithValue("@status", newUser.getStatus());
                        myCommand.Parameters.AddWithValue("@lastUpdated", newUser.getLastUpdated());
                        myCommand.Parameters.AddWithValue("@lastUpdatedBy", newUser.getLastUpdatedBy());
                        myCommand.Parameters.AddWithValue("@email", newUser.getEmail());

                        myCommand.ExecuteNonQuery();


                    }
                    catch (Exception E)
                    {

                    }

                    try
                    {

                        myConnection.Close();

                        Password newPassword = new Password(
                            newUser.getUserID(),
                            txtNewUsername.Text,
                            "PBKDF2");

                        String myQuery3 = "INSERT INTO [WildlifeCenter].[dbo].[Password] (UserId, Username, PasswordHash) VALUES ((SELECT MAX([UserID]) FROM [WildlifeCenter].[dbo].[User]), @Username, @PasswordHash)";

                        myConnection.Open();

                        SqlCommand myCommand3 = new SqlCommand(myQuery3, myConnection);
                        //myCommand3.Parameters.AddWithValue("@UserID", newPassword.getUserID());
                        myCommand3.Parameters.AddWithValue("@Username", newPassword.getUserName());
                        myCommand3.Parameters.AddWithValue("@PasswordHash", PasswordHash.HashPassword(txtNewPassword.Value));


                        myCommand3.ExecuteNonQuery();
                    }
                    catch (Exception E)
                    {
                        txtNewUsername.Text = E.ToString();
                    }

                }
            }
        }

        catch (Exception E)
        {

        }
        finally
        {
            myConnection.Close();
            txtFirstName.Text = null;
            txtLastName.Text = null;
            txtNewUsername.Text = null;
            txtNewPassword.Value = null;
            txtConfirmPassword.Value = null;
            rdoPosition.Text = null;
            txtEmail.Text = null;
        }
    }
    protected string findFullName(string username)
        {
            using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString))
            {
                string query = "SELECT FirstName + ' ' + LastName as FullName FROM dbo.[User] where Username = '" + username + "'";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    string fullName = Convert.ToString(command.ExecuteScalar());
                    return fullName;

                }
            }
        }
    protected void PasswordReset(object sender, EventArgs e)
    {
       Server.Transfer("PasswordReset.aspx", false);
    }


}