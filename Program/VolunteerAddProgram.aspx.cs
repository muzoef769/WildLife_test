using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;

public partial class VolunteerAddProgram : System.Web.UI.Page
{
    public double Find_ProgramCost;
    public static int programID;
    double programCost;
    public double mileageCost;
    public double totalCost;
    protected void Page_Load(object sender, EventArgs e)
    {


    }

    protected void DrpOrganizationList_IndexChanged(object sender, EventArgs e)
    {
        if (drpOrganizationList.SelectedIndex > 0)
        {

            DataTable contactList = new DataTable();
            using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString))
            {
                connection.Open();
                SqlDataAdapter adapter = new SqlDataAdapter("Select ContactID, CONCAT(FirstName,' ',LastName) as Name from Contact Where OrganizationID =" + drpOrganizationList.SelectedValue, connection);

                adapter.Fill(contactList);

                drpContact.DataSource = contactList;
                drpContact.DataTextField = "Name";
                drpContact.DataValueField = "ContactID";
                drpContact.DataBind();
                drpContact.Items.Insert(0, new ListItem("Contacts", String.Empty));
                drpContact.SelectedIndex = 0;


            }
        }
        else
        {
            drpContact.Items.Clear();
            drpContact.Items.Insert(0, new ListItem("Contacts", String.Empty));
            drpContact.SelectedIndex = 0;
            txtFirstName.Text = null;
            txtLastName.Text = null;
            txtEmail.Text = null;
            txtPrimaryPhone.Text = null;
            txtSecondaryPhone.Text = null;
        }

    }

    protected void DrpContact_SelectedIndexChanged(object sender, EventArgs e)
    {

        if (drpContact.SelectedIndex > 0)
        {
            using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString))
            {

                string retrieveContact = "Select FirstName, LastName, Email, PrimaryPhoneNumber, SecondaryPhoneNumber from Contact where ContactID = @contactID";

                try
                {
                    connection.Open();
                    String getProgramID = "SELECT ProgramID FROM Program WHERE ProgramName = @ProgramName";
                    SqlCommand getIDCommand = new SqlCommand(getProgramID, connection);
                    getIDCommand.Parameters.AddWithValue("@ProgramName", drpProgramList.SelectedValue);
                    getIDCommand.ExecuteNonQuery();
                    connection.Close();

                }
                catch (Exception)
                {

                }


                using (SqlCommand command = new SqlCommand(retrieveContact, connection))
                {
                    connection.Open();

                    command.Parameters.AddWithValue("@ContactID", drpContact.SelectedValue);
                    SqlDataReader reader = command.ExecuteReader();

                    // if the username exists, process will stop
                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {

                            txtFirstName.Text = reader.GetString(0);
                            txtLastName.Text = reader.GetString(1);
                            txtEmail.Text = reader.GetString(2);
                            txtPrimaryPhone.Text = reader.GetString(3);
                            txtSecondaryPhone.Text = reader.GetString(4);
                        }
                    }
                    connection.Close();
                }
            }

        }

        else
        {

            txtFirstName.Text = null;
            txtLastName.Text = null;
            txtEmail.Text = null;
            txtPrimaryPhone.Text = null;
            txtSecondaryPhone.Text = null;

        }
    }


    protected void BtnAllBirds_Click(object sender, EventArgs e)
    {
        if (HttpUtility.HtmlEncode(btnAllBirds.Text) == "Select All")
        {
            foreach (ListItem bird in CheckBoxList2.Items)
            {
                bird.Selected = true;
            }
            btnAllBirds.Text = "Deselect All";

        }
        else
        {
            foreach (ListItem bird in CheckBoxList2.Items)
            {
                bird.Selected = false;
            }
            btnAllBirds.Text = "Select All";
        }
    }

    protected void BtnAllReptiles_Click(object sender, EventArgs e)
    {
        if (HttpUtility.HtmlEncode(btnAllReptiles.Text) == "Select All")
        {
            foreach (ListItem reptile in CheckBoxList3.Items)
            {
                reptile.Selected = true;
            }
            btnAllReptiles.Text = "Deselect All";

        }
        else
        {
            foreach (ListItem reptile in CheckBoxList3.Items)
            {
                reptile.Selected = false;
            }
            btnAllReptiles.Text = "Select All";
        }
    }

    protected void BtnAllMammals_Click(object sender, EventArgs e)
    {
        if (HttpUtility.HtmlEncode(btnAllMammals.Text) == "Select All")
        {
            foreach (ListItem mammal in CheckBoxList4.Items)
            {
                mammal.Selected = true;
            }
            btnAllMammals.Text = "Deselect All";

        }
        else
        {
            foreach (ListItem mammal in CheckBoxList4.Items)
            {
                mammal.Selected = false;
            }
            btnAllMammals.Text = "Select All";
        }
    }

    protected void chkLocation_CheckedChanged(object sender, EventArgs e)
    {
        if (chkLocation.Checked)
        {
            using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString))
            {

                connection.Open();
                string locationQuery = "Select Address.* FROM Address INNER JOIN Organization ON Address.AddressID = Organization.AddressID WHERE OrganizationID = @OrganizationID";
                SqlCommand locationCommand = new SqlCommand(locationQuery, connection);

                locationCommand.Parameters.AddWithValue("@OrganizationID", drpOrganizationList.SelectedValue);
                SqlDataReader locationReader = locationCommand.ExecuteReader();

                if (locationReader.HasRows)
                {
                    while (locationReader.Read())
                    {
                        txtStreet.Text = locationReader.GetString(1);
                        txtCity.Text = locationReader.GetString(2);
                        drpState.Text = locationReader.GetString(3);
                        txtCounty.Text = locationReader.GetString(4);
                        drpCountry.Text = locationReader.GetString(5);
                        txtZipCode.Text = locationReader.GetString(6);
                    }
                }

            }
        }
        else
        {
            txtStreet.Text = null;
            txtCity.Text = null;
            drpState.Text = null;
            txtCounty.Text = null;
            drpCountry.Text = null;
            txtZipCode.Text = null;
        }
    }

    protected void drpProgramType_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (drpProgramType.SelectedValue == "Online")
        {
            locationtab.Visible = false;
            lblLocationType.Visible = false;
            drpLocationTypeList.Visible = false;
            lblMileage.Visible = false;
            txtMileage.Visible = false;

            DataTable programList = new DataTable();
            string onlineProgram = "SELECT ProgramID, ProgramName FROM Program WHERE UPPER(ProgramType) = 'ONLINE'";
            using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString))
            {
                connection.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(onlineProgram, connection);

                adapter.Fill(programList);

                drpProgramList.DataSource = programList;
                drpProgramList.DataTextField = "ProgramName";
                drpProgramList.DataValueField = "ProgramID";
                drpProgramList.DataBind();
            }
        }
        else
        {
            locationtab.Visible = true;
            lblLocationType.Visible = true;
            drpLocationTypeList.Visible = true;
            lblMileage.Visible = true;
            txtMileage.Visible = true;

            DataTable programList1 = new DataTable();
            string liveProgram = "SELECT ProgramID, ProgramName FROM Program WHERE UPPER(ProgramType) = 'LIVE'";
            using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString))
            {
                connection.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(liveProgram, connection);

                adapter.Fill(programList1);

                drpProgramList.DataSource = programList1;
                drpProgramList.DataTextField = "ProgramName";
                drpProgramList.DataValueField = "ProgramID";
                drpProgramList.DataBind();
            }
        }
    }

    protected void drpProgramList_SelectedIndexChanged(object sender, EventArgs e)
    {
        string value = drpProgramList.SelectedValue;
        if (drpProgramList.SelectedValue == "13" || drpProgramList.SelectedValue == "14" || drpProgramList.SelectedValue == "15" || drpProgramList.SelectedValue == "16" || drpProgramList.SelectedValue == "17" || drpProgramList.SelectedValue == "18")
        {
            drpLocationTypeList.SelectedValue = "OffSite";
            drpLocationTypeList.Enabled = false;
        }
        else
        {
            drpLocationTypeList.Enabled = true;
        }
    }

    protected void drpLocationTypeList_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (drpLocationTypeList.SelectedValue == "OffSite")
        {
            lblMileage.Visible = true;
            txtMileage.Visible = true;
            locationtab.Visible = true;
        }
        if (drpLocationTypeList.SelectedValue == "OnSite")
        {
            locationtab.Visible = false;
            lblMileage.Visible = false;
            txtMileage.Visible = false;
        }
    }

    protected void SubmitProgram(object sender, EventArgs e)
    {

        using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString))
        {
            connection.Open();
            string grabOrganization = "SELECT AddressID FROM Organization WHERE OrganizationID = @Organization_ID";
            SqlCommand cmd1 = connection.CreateCommand();
            cmd1.CommandType = CommandType.Text;
            cmd1.CommandText = grabOrganization;
            cmd1.Parameters.AddWithValue("@Organization_ID", drpOrganizationList.SelectedValue);


            int AddressID_from_Organization = Convert.ToInt32(cmd1.ExecuteScalar());

            NewProgram addNewProgram = new NewProgram(Int32.Parse(txtKid.Text), Int32.Parse(txtAdult.Text),
                Int32.Parse(txtKid.Text) + Int32.Parse(txtAdult.Text), drpAgeLevel.SelectedValue, "Completed",
                DateTime.Parse(txtProgramTime.Text), DateTime.Parse(txtProgramDate.Text), txtNotes.Text, drpLocationTypeList.SelectedValue,
                Convert.ToInt32(drpProgramList.SelectedValue), DateTime.Today, Session["UserFullName"].ToString());

            string grabNewProgramID = "SELECT NewProgramID FROM NewProgram WHERE NewProgramID = (SELECT MAX(NewProgramID) FROM NewProgram)";
            SqlCommand cmd2 = connection.CreateCommand();
            cmd2.CommandType = CommandType.Text;
            cmd2.CommandText = grabNewProgramID;

            int Find_NewProgramID = Convert.ToInt32(cmd2.ExecuteScalar());

            string grabProgramCost = "SELECT ProgramCost FROM Program WHERE ProgramID = @Program_ID";
            SqlCommand cmd3 = connection.CreateCommand();
            cmd3.CommandType = CommandType.Text;
            cmd3.CommandText = grabProgramCost;
            cmd3.Parameters.AddWithValue("@Program_ID", drpProgramList.SelectedValue);
            if (drpLocationTypeList.SelectedValue == "OffSite")
            {
                Find_ProgramCost = Convert.ToInt32(cmd3.ExecuteScalar());
                Find_ProgramCost += Convert.ToInt32(txtMileage.Text) * .57;

            }
            else
            {
               Find_ProgramCost = Convert.ToInt32(cmd3.ExecuteScalar());
            }
            

            string insertIntoNewProgram = "INSERT INTO NewProgram([TotalKids], [TotalAdults]," +
               "[TotalPeople], [AgeLevel], [NewProgramStatus], [TimeSlot]," +
               "[DateCompleted], [LocationType], [MiscNotes], [ProgramID], [AddressID],[LastUpdated], [LastUpdatedBy]) VALUES (" +
               "@kid, @adult, @totalPeople, @age, @status, @time, @complete," +
               "@location, @miscNotes, @programid, @addressid, @LU, @LUB)";
            using (SqlCommand command = new SqlCommand(insertIntoNewProgram, connection))
            {
                command.Parameters.AddWithValue("@kid", addNewProgram.getNumKids());
                command.Parameters.AddWithValue("@adult", addNewProgram.getNumAdults());
                command.Parameters.AddWithValue("@totalpeople", addNewProgram.getTotalPeople());
                command.Parameters.AddWithValue("@age", addNewProgram.getAgeLevel());
                command.Parameters.AddWithValue("@status", addNewProgram.getProgramStatus());
                command.Parameters.AddWithValue("@time", addNewProgram.getTimeSlot());
                command.Parameters.AddWithValue("@complete", addNewProgram.getDateCompleted());
                command.Parameters.AddWithValue("@location", addNewProgram.getLocationType());
                command.Parameters.AddWithValue("@miscNotes", addNewProgram.getMiscNotes());
                command.Parameters.AddWithValue("@programid", addNewProgram.getProgramID());
                command.Parameters.AddWithValue("@addressid", AddressID_from_Organization);
                command.Parameters.AddWithValue("@LU", addNewProgram.getLastUpdated());
                command.Parameters.AddWithValue("@LUB", addNewProgram.getLastUpdatedBy());

                command.ExecuteNonQuery();
            }


            List<int> UserList = new List<int>();
            for (int i = 0; i < CheckBoxList1.Items.Count; i++)
            {
                if (CheckBoxList1.Items[i].Selected)
                {
                    UserList.Add(Convert.ToInt32(CheckBoxList1.Items[i].Value));
                }
            }
            
            string assignUser = "Insert into AssignUser([UserID], [NewProgramID], [LastUpdated], [LastUpdatedBy])VALUES (" +
                   "@UserID, @NewProgramID, @LastUpdated, @LastUpdatedBy)";
            foreach (int user in UserList)
            {
                using (SqlCommand command = new SqlCommand(assignUser, connection))
                {
                    command.Parameters.AddWithValue("@UserID", user);
                    command.Parameters.AddWithValue("@NewProgramID", Find_NewProgramID);
                    command.Parameters.AddWithValue("@LastUpdated", DateTime.Today);
                    command.Parameters.AddWithValue("@LastUpdatedBy", Session["UserFullName"].ToString());

                    command.ExecuteNonQuery();

                }
            }

            List<int> AnimalList = new List<int>();


            for (int i = 0; i < CheckBoxList2.Items.Count; i++)
            {
                if (CheckBoxList2.Items[i].Selected)
                {
                    AnimalList.Add(Convert.ToInt32(CheckBoxList2.Items[i].Value));
                }
            }


            for (int i = 0; i < CheckBoxList3.Items.Count; i++)
            {
                if (CheckBoxList3.Items[i].Selected)
                {
                    AnimalList.Add(Convert.ToInt32(CheckBoxList3.Items[i].Value));
                }
            }

            for (int i = 0; i < CheckBoxList4.Items.Count; i++)
            {
                if (CheckBoxList4.Items[i].Selected)
                {
                    AnimalList.Add(Convert.ToInt32(CheckBoxList4.Items[i].Value));
                }
            }

            string assignAnimals = "INSERT INTO AssignAnimal([AnimalID], [NewProgramID], [LastUpdated], [LastUpdatedBy])VALUES (" +
                   "@AnimalID, @NewProgramID, @LastUpdated, @LastUpdatedBy)";

            foreach (int animal in AnimalList)
            {
                using (SqlCommand command = new SqlCommand(assignAnimals, connection))
                {
                    command.Parameters.AddWithValue("@AnimalID", animal);
                    command.Parameters.AddWithValue("@NewProgramID", Find_NewProgramID);
                    command.Parameters.AddWithValue("@LastUpdated", DateTime.Today);
                    command.Parameters.AddWithValue("@LastUpdatedBy", Session["UserFullName"].ToString()); ///Need to change this

                    command.ExecuteNonQuery();

                }
            }

            if (drpContact.SelectedIndex == 0)
            {

                string insertContact = "INSERT INTO Contact([FirstName], [LastName], [Email], [PrimaryPhoneNumber],[SecondaryPhoneNumber], [OrganizationID], [LastUpdated], [LastUpdatedBy]) VALUES (" +
               "@FirstName, @LastName, @Email, @Primary, @Secondary, @orgID, @LastUpdated, @LastUpdatedBy)";

                using (SqlCommand command = new SqlCommand(insertContact, connection))
                {


                    command.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
                    command.Parameters.AddWithValue("@LastName", txtLastName.Text);
                    command.Parameters.AddWithValue("@Email", txtEmail.Text);
                    command.Parameters.AddWithValue("@Primary", txtPrimaryPhone.Text);
                    command.Parameters.AddWithValue("@Secondary", txtSecondaryPhone.Text);
                    command.Parameters.AddWithValue("@orgID", drpOrganizationList.SelectedValue);
                    command.Parameters.AddWithValue("@LastUpdated", DateTime.Today);
                    command.Parameters.AddWithValue("@LastUpdatedBy", Session["UserFullName"].ToString());

                    command.ExecuteNonQuery();

                }
            }

            if (drpLocationTypeList.SelectedValue == "OffSite")
            {
                Invoice newInvoice = new Invoice(txtInvoice.Text, Find_ProgramCost, Convert.ToDateTime(txtProgramDate.Text), "Unpaid", DateTime.Today, Session["UserFullName"].ToString(), Convert.ToInt32(txtMileage.Text));
                string invoiceInsert = "Insert into Invoice([InvoiceNumber], [TotalCost], [DateCreated], [InvoiceStatus], [LastUpdated], [LastUpdatedBy], [TotalMileage]) VALUES (" +
                   "@InvoiceNumber, @TotalCost, @DateCreated, @InvoiceStatus, @LastUpdated, @LastUpdatedBy, @Mileage)";

                using (SqlCommand command = new SqlCommand(invoiceInsert, connection))
                {


                    command.Parameters.AddWithValue("@InvoiceNumber", newInvoice.getInvoiceNumber());
                    command.Parameters.AddWithValue("@TotalCost", newInvoice.getTotal());
                    command.Parameters.AddWithValue("@DateCreated", newInvoice.getDateCreated());
                    command.Parameters.AddWithValue("@InvoiceStatus", newInvoice.getInvoiceStatus());
                    command.Parameters.AddWithValue("@LastUpdated", newInvoice.getLastUpdated());
                    command.Parameters.AddWithValue("@LastUpdatedBy", newInvoice.getLastUpdatedBy());
                    command.Parameters.AddWithValue("@Mileage", newInvoice.getMileage());
                    command.ExecuteNonQuery();
                }
            }
            else
            {
                Invoice newInvoice = new Invoice(txtInvoice.Text, Find_ProgramCost, Convert.ToDateTime(txtProgramDate.Text), "Unpaid", DateTime.Today, Session["UserFullName"].ToString(), 0);

                string invoiceInsert = "Insert into Invoice([InvoiceNumber], [TotalCost], [DateCreated], [InvoiceStatus], [LastUpdated], [LastUpdatedBy], [TotalMileage]) VALUES (" +
                       "@InvoiceNumber, @TotalCost, @DateCreated, @InvoiceStatus, @LastUpdated, @LastUpdatedBy, @Mileage)";

                using (SqlCommand command = new SqlCommand(invoiceInsert, connection))
                {


                    command.Parameters.AddWithValue("@InvoiceNumber", newInvoice.getInvoiceNumber());
                    command.Parameters.AddWithValue("@TotalCost", newInvoice.getTotal());
                    command.Parameters.AddWithValue("@DateCreated", newInvoice.getDateCreated());
                    command.Parameters.AddWithValue("@InvoiceStatus", newInvoice.getInvoiceStatus());
                    command.Parameters.AddWithValue("@LastUpdated", newInvoice.getLastUpdated());
                    command.Parameters.AddWithValue("@LastUpdatedBy", newInvoice.getLastUpdatedBy());
                    command.Parameters.AddWithValue("@Mileage", newInvoice.getMileage());
                    command.ExecuteNonQuery();

                }
            }
            string grabInvoiceID = "Select InvoiceID from Invoice where InvoiceID = (Select Max(InvoiceID) from Invoice)";
            SqlCommand cmd4 = connection.CreateCommand();
            cmd4.CommandType = CommandType.Text;
            cmd4.CommandText = grabInvoiceID;

            int Find_InvoiceID = Convert.ToInt32(cmd4.ExecuteScalar());

            string assignInvoice = "Insert into AssignInvoice([InvoiceID], [NewProgramID], [LastUpdated], [LastUpdatedBy])VALUES (" +
                  "@InvoiceID, @NewProgramID, @LastUpdated, @LastUpdatedBy)";



            using (SqlCommand command = new SqlCommand(assignInvoice, connection))
            {
                command.Parameters.AddWithValue("@InvoiceID", Find_InvoiceID);
                command.Parameters.AddWithValue("@NewProgramID", Find_NewProgramID);
                command.Parameters.AddWithValue("@LastUpdated", DateTime.Today);
                command.Parameters.AddWithValue("@LastUpdatedBy", Session["UserFullName"].ToString()); ///Need to change this

                command.ExecuteNonQuery();
            }
            int orgID;
            string findOrgID = "SELECT OrganizationID from Organization where OrganizationName = @selectedOrg";
            using (SqlCommand command = new SqlCommand(findOrgID, connection))
            {
                command.Parameters.AddWithValue("@selectedOrg", drpOrganizationList.SelectedItem.Text);
                orgID = Convert.ToInt32(command.ExecuteScalar());
            }

            string insertIntoPayment = "Insert into Payment([PaymentType],[OrganizationID],[InvoiceID],[LastUpdated],[LastUpdatedBy]) VALUES (@paymentType, @organizationID, @invoiceID, @lastUpdated, @lastUpdatedBy)";
            using (SqlCommand command = new SqlCommand(insertIntoPayment, connection))
            {
                command.Parameters.AddWithValue("@paymentType", "TBD");
                command.Parameters.AddWithValue("@organizationID", orgID);
                command.Parameters.AddWithValue("@invoiceID", Find_InvoiceID);
                command.Parameters.AddWithValue("@lastUpdated", DateTime.Today);
                command.Parameters.AddWithValue("@lastUpdatedBy", Session["UserFullName"].ToString());

                command.ExecuteNonQuery();
            }
        }
    }

}