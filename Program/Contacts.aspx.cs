using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;

public partial class Contacts : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString))
        {
            connection.Open();
            string sql = "SELECT OrganizationID, OrganizationName FROM Organization";
            using (SqlCommand command = new SqlCommand(sql, connection))
            {
                SqlDataAdapter da = new SqlDataAdapter(command);
                DataSet ds = new DataSet();
                da.Fill(ds);
                drpOrganizationList.DataTextField = ds.Tables[0].Columns["OrganizationName"].ToString();
                drpOrganizationList.DataValueField = ds.Tables[0].Columns["OrganizationID"].ToString();  
                drpOrganizationList.DataSource = ds.Tables[0];
                drpOrganizationList.DataBind();
            }
        }
    }
    protected void submitContact(object sender, EventArgs e)
    {
        Contact addContact = new Contact(txtFirstName.Text, txtLastName.Text,
            txtEmail.Text, txtPrimaryPhone.Text, txtSecondaryPhone.Text,
            Int32.Parse(drpOrganizationList.SelectedValue), DateTime.Now,"");

        using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString))
        {
            connection.Open();
            string sql = "INSERT INTO Contact(FirstName, LastName, Email, PrimaryPhoneNumber," +
                "SecondaryPhoneNumber, OrganizationID, LastUpdated, LastUpdatedBy) VALUES (@FirstName," +
                "@LastName, @Email, @PhoneNumber1, @PhoneNumber2, @OrgID, @LU, @LUB)";
            using (SqlCommand command = new SqlCommand(sql, connection))
            {
                command.Parameters.AddWithValue("@FirstName", addContact.getFirstName());
                command.Parameters.AddWithValue("@LastName", addContact.getLastName());
                command.Parameters.AddWithValue("@Email", addContact.getEmailName());
                command.Parameters.AddWithValue("@PhoneNumber1", addContact.getPrimaryNumber());
                command.Parameters.AddWithValue("PhoneNumber2", addContact.getSecondaryNumber());
                command.Parameters.AddWithValue("@OrgID", addContact.getOrgID());
                command.Parameters.AddWithValue("@LU", addContact.getLastUpdated());
                command.Parameters.AddWithValue("@LUB", Session["UserFullName"]);
            }
        }
    }

}