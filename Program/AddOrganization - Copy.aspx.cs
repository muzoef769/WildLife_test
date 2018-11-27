using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;


public partial class AddOrganization : System.Web.UI.Page
{

    public int addressID;
    public int orgID;

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btnAddOrganization_Click(object sender, EventArgs e)
    {
        Address newAddress = new Address(
            txtStreet.Text,
            drpState.Text,
            txtCity.Text,
            txtCounty.Text,
            drpCountry.Text,
            txtZipCode.Text,
            "Organization",
            DateTime.Now,
            Session["UserFullName"].ToString());

        

        using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString))
        {
            string addressInsert = "INSERT INTO ADDRESS (Street, City, State, County, Country, ZipCode, AddressType, LastUpdated, LastUpdatedBy) VALUES (" +
                "@Street, @City, @State, @County, @Country, @ZipCode, @AddressType, @LastUpdated, @LastUpdatedBy)";
            connection.Open();
            using (SqlCommand command = new SqlCommand(addressInsert, connection))
            {
                command.Parameters.AddWithValue("@Street", newAddress.getStreetName());
                command.Parameters.AddWithValue("@City", newAddress.getCity());
                command.Parameters.AddWithValue("@State", newAddress.getState());
                command.Parameters.AddWithValue("@County", newAddress.getCounty());
                command.Parameters.AddWithValue("@Country", newAddress.getCountry());
                command.Parameters.AddWithValue("@ZipCode", newAddress.getZipCode());
                command.Parameters.AddWithValue("@AddressType", newAddress.getAddressType());
                command.Parameters.AddWithValue("@LastUpdated", newAddress.getLastUpdated());
                command.Parameters.AddWithValue("@LastUpdatedBy", newAddress.getLastUpdatedBy());

                command.ExecuteNonQuery();

            }

            string getAddressID = "SELECT AddressID FROM Address WHERE AddressID = (SELECT MAX(AddressID) FROM Address)";
            using (SqlCommand command = new SqlCommand(getAddressID, connection))
            {
                addressID = Convert.ToInt32(command.ExecuteScalar());
            }

            Organization newOrganization = new Organization(
                  txtOrgName.Text,
                  addressID,
                  DateTime.Now,
                  Session["UserFullName"].ToString()
                  );
            string organizationInsert = "INSERT INTO ORGANIZATION (OrganizationName, AddressID, LastUpdated, LastUpdatedBy) VALUES (@OrgName, @AddressID, @LastUpdated, @LastUpdatedBy)";

            using (SqlCommand command = new SqlCommand(organizationInsert, connection))
            {
                command.Parameters.AddWithValue("@OrgName", newOrganization.OrgName);
                command.Parameters.AddWithValue("@AddressID", newOrganization.AddressID);
                command.Parameters.AddWithValue("@LastUpdated", newOrganization.LastUpdated);
                command.Parameters.AddWithValue("@LastUpdatedBy", newOrganization.LastUpdatedBy);

                command.ExecuteNonQuery();
            }

            //Grabbing the associated OrganizationID from the Organization table
            string getOrgID = "SELECT OrganizationID FROM Organization WHERE OrganizationID = (SELECT MAX(OrganizationID) FROM Organization)";
            using (SqlCommand command = new SqlCommand(getOrgID, connection))
            {
                orgID = Convert.ToInt32(command.ExecuteScalar());
            }

            Contact newContact = new Contact(
                txtFirstName.Text,
                txtLastName.Text,
                txtEmail.Text,
                txtPrimaryPhone.Text,
                txtSecondaryPhone.Text,
                orgID,
                DateTime.Now,
                Session["UserFullName"].ToString());

            string newContactInsert = "INSERT INTO CONTACT (FirstName, LastName, Email, PrimaryPhoneNumber, SecondaryPhoneNumber, OrganizationID, LastUpdated, LastUpdatedBy) VALUES (@fName, @lName, @email, @primary, @secondary, @orgID, @lastUpdated, @lastUpdatedBy)";

            using (SqlCommand command = new SqlCommand(newContactInsert, connection))
            {
                command.Parameters.AddWithValue("@fName", newContact.getFirstName());
                command.Parameters.AddWithValue("@lName", newContact.getLastName());
                command.Parameters.AddWithValue("@email", newContact.getEmailName());
                command.Parameters.AddWithValue("@primary", newContact.getPrimaryNumber());
                command.Parameters.AddWithValue("@secondary", newContact.getSecondaryNumber());
                command.Parameters.AddWithValue("@orgID", newContact.getOrgID());
                command.Parameters.AddWithValue("@lastUpdated", newContact.getLastUpdated());
                command.Parameters.AddWithValue("@lastUpdatedBy", newContact.getLastUpdatedBy());

                command.ExecuteNonQuery();
            }
        }
        clearTextBox();

    }

    protected void btnReturn_Click(object sender, EventArgs e)
    {

        Server.Transfer("OrganizationView.aspx", true);

    }
    protected void clearTextBox()
    {
        txtOrgName.Text = null;
        txtStreet.Text = null;
        drpCountry.Text = null;
        drpState.Text = null;
        txtCity.Text = null;
        txtCounty.Text = null;
        txtZipCode.Text = null;
        txtFirstName.Text = null;
        txtLastName.Text = null;
        txtEmail.Text = null;
        txtPrimaryPhone.Text = null;
        txtSecondaryPhone.Text = null;
    }
}