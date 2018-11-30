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

    //    protected void BtnAddOrg_Click(object sender, EventArgs e)
    //    {

    //        Response.Redirect("VolunteerAddOrganization.aspx", true);
    //    }

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

    protected void DrpProgramList_SelectedIndexChanged(object sender, EventArgs e)
    {

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

    //    protected void SubmitProgram(object sender, EventArgs e)
    //    {

    //        using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString))
    //        {

    //            connection.Open();
    //            Address address = new Address(txtStreet.Text, drpState.SelectedValue, txtCity.Text, txtCounty.Text, drpCountry.SelectedValue, txtZipCode.Text, "Program Location", DateTime.Today, "Raina");
    //            int newAddressID;

    //            if (drpLocationTypeList.SelectedValue == "Onsite")
    //            {
    //                string insertIntoAddress = "Insert into Address([Street], [City], [State], [County], [Country], [ZipCode], [AddressType], [LastUpdated], [LastUpdatedBy]) VALUES (" +
    //                "@street, @city, @state, @county, @country, @zipCode, @addressType, @LU, @LUB)";
    //                using (SqlCommand command = new SqlCommand(insertIntoAddress, connection))
    //                {
    //                    command.Parameters.AddWithValue("@street", "1800 S Delphine Ave");
    //                    command.Parameters.AddWithValue("@city", "Waynesboro");
    //                    command.Parameters.AddWithValue("@state", "Virginia");
    //                    command.Parameters.AddWithValue("@county", "Waynesboro");
    //                    command.Parameters.AddWithValue("@country", "USA");
    //                    command.Parameters.AddWithValue("@zipCode", "22980");
    //                    command.Parameters.AddWithValue("@addressType", "Program");
    //                    command.Parameters.AddWithValue("@LU", address.getLastUpdated());
    //                    command.Parameters.AddWithValue("@LUB", Session["UserFullName"]);
    //                    command.ExecuteNonQuery();
    //                }


    //                string findAddressID = "Select AddressID from Address where AddressID = (Select Max(AddressID) from Address)";
    //                using (SqlCommand command = new SqlCommand(findAddressID, connection))
    //                {

    //                    newAddressID = Convert.ToInt32(command.ExecuteScalar());

    //                }
    //            }
    //            else
    //            {
    //                string insertIntoAddress = "Insert into Address([Street], [City], [State], [County], [Country], [ZipCode], [AddressType], [LastUpdated], [LastUpdatedBy]) VALUES (" +
    //                    "@street, @city, @state, @county, @country, @zipCode, @addressType, @LU, @LUB)";
    //                using (SqlCommand command = new SqlCommand(insertIntoAddress, connection))
    //                {
    //                    command.Parameters.AddWithValue("@street", address.getStreetName());
    //                    command.Parameters.AddWithValue("@city", address.getCity());
    //                    command.Parameters.AddWithValue("@state", address.getState());
    //                    command.Parameters.AddWithValue("@county", address.getCounty());
    //                    command.Parameters.AddWithValue("@country", address.getCounty());
    //                    command.Parameters.AddWithValue("@zipCode", address.getZipCode());
    //                    command.Parameters.AddWithValue("@addressType", address.getAddressType());
    //                    command.Parameters.AddWithValue("@LU", address.getLastUpdated());
    //                    command.Parameters.AddWithValue("@LUB", Session["UserFullName"]);
    //                    command.ExecuteNonQuery();
    //                }


    //                string findAddressID = "Select AddressID from Address where AddressID = (Select Max(AddressID) from Address)";
    //                using (SqlCommand command = new SqlCommand(findAddressID, connection))
    //                {

    //                    newAddressID = Convert.ToInt32(command.ExecuteScalar());

    //                }
    //            }

    //            for (int j = 0; j < NewProgram.programList.Count; j++)
    //            {
    //                string insertIntoNewProgram = "INSERT INTO NewProgram([TotalKids], [TotalAdults]," +
    //               "[TotalPeople], [AgeLevel], [TotalMileage], [NewProgramStatus], [TimeSlot]," +
    //               "[DateCompleted], [LocationType], [MiscNotes], [ProgramID], [AddressID],[LastUpdated], [LastUpdatedBy]) VALUES (" +
    //               "@kid, @adult, @totalPeople, @age, @mileage, @status, @time, @complete," +
    //               "@location, @miscNotes, @programid, @addressid, @LU, @LUB)";

    //                using (SqlCommand command = new SqlCommand(insertIntoNewProgram, connection))
    //                {
    //                    command.Parameters.AddWithValue("@kid", NewProgram.programList[j].getNumKids());
    //                    command.Parameters.AddWithValue("@adult", NewProgram.programList[j].getNumAdults());
    //                    command.Parameters.AddWithValue("@totalpeople", NewProgram.programList[j].getTotalPeople());
    //                    command.Parameters.AddWithValue("@age", NewProgram.programList[j].getAgeLevel());
    //                    command.Parameters.AddWithValue("@mileage", NewProgram.programList[j].getTotalMileage());
    //                    command.Parameters.AddWithValue("@status", NewProgram.programList[j].getProgramStatus());
    //                    command.Parameters.AddWithValue("@time", NewProgram.programList[j].getTimeSlot());
    //                    command.Parameters.AddWithValue("@complete", NewProgram.programList[j].getDateCompleted());
    //                    command.Parameters.AddWithValue("@location", NewProgram.programList[j].getLocationType());
    //                    command.Parameters.AddWithValue("@miscNotes", NewProgram.programList[j].getMiscNotes());
    //                    command.Parameters.AddWithValue("@programid", NewProgram.programList[j].getProgramID());
    //                    command.Parameters.AddWithValue("@addressid", newAddressID);
    //                    command.Parameters.AddWithValue("@LU", NewProgram.programList[j].getLastUpdated());
    //                    command.Parameters.AddWithValue("@LUB", Session["UserFullName"]);

    //                    command.ExecuteNonQuery();
    //                }
    //                int newProgramID;
    //                string findProgramID = "Select NewProgramID from NewProgram where NewProgramID = (Select Max(NewProgramID) from NewProgram)";
    //                using (SqlCommand command = new SqlCommand(findProgramID, connection))
    //                {

    //                    newProgramID = Convert.ToInt32(command.ExecuteScalar());
    //                }


    //                List<int> AnimalList = new List<int>();


    //                for (int i = 0; i < CheckBoxList2.Items.Count; i++)
    //                {
    //                    if (CheckBoxList2.Items[i].Selected)
    //                    {
    //                        AnimalList.Add(Convert.ToInt32(CheckBoxList2.Items[i].Value));
    //                    }
    //                }


    //                for (int i = 0; i < CheckBoxList3.Items.Count; i++)
    //                {
    //                    if (CheckBoxList3.Items[i].Selected)
    //                    {
    //                        AnimalList.Add(Convert.ToInt32(CheckBoxList3.Items[i].Value));
    //                    }
    //                }

    //                for (int i = 0; i < CheckBoxList4.Items.Count; i++)
    //                {
    //                    if (CheckBoxList4.Items[i].Selected)
    //                    {
    //                        AnimalList.Add(Convert.ToInt32(CheckBoxList4.Items[i].Value));
    //                    }
    //                }

    //                string assignAnimals = "Insert into AssignAnimal([AnimalID], [NewProgramID], [LastUpdated], [LastUpdatedBy])VALUES (" +
    //                   "@AnimalID, @NewProgramID, @LastUpdated, @LastUpdatedBy)";


    //                foreach (int animal in AnimalList)
    //                {
    //                    using (SqlCommand command = new SqlCommand(assignAnimals, connection))
    //                    {
    //                        command.Parameters.AddWithValue("@AnimalID", animal);
    //                        command.Parameters.AddWithValue("@NewProgramID", newProgramID);
    //                        command.Parameters.AddWithValue("@LastUpdated", DateTime.Today);
    //                        command.Parameters.AddWithValue("@LastUpdatedBy", Session["UserFullName"]);

    //                        command.ExecuteNonQuery();

    //                    }
    //                }

    //                List<int> UserList = new List<int>();
    //                for (int i = 0; i < CheckBoxList1.Items.Count; i++)
    //                {
    //                    if (CheckBoxList1.Items[i].Selected)
    //                    {
    //                        UserList.Add(Convert.ToInt32(CheckBoxList1.Items[i].Value));
    //                    }
    //                }

    //                string assignUser = "Insert into AssignUser([UserID], [NewProgramID], [LastUpdated], [LastUpdatedBy])VALUES (" +
    //                   "@UserID, @NewProgramID, @LastUpdated, @LastUpdatedBy)";


    //                foreach (int user in UserList)
    //                {
    //                    using (SqlCommand command = new SqlCommand(assignUser, connection))
    //                    {
    //                        command.Parameters.AddWithValue("@UserID", user);
    //                        command.Parameters.AddWithValue("@NewProgramID", newProgramID);
    //                        command.Parameters.AddWithValue("@LastUpdated", DateTime.Today);
    //                        command.Parameters.AddWithValue("@LastUpdatedBy", Session["UserFullName"]);

    //                        command.ExecuteNonQuery();

    //                    }
    //                }

    //                if (drpContact.SelectedIndex == 0)
    //                {

    //                    string insertContact = "Insert into Contact([FirstName], [LastName], [Email], [PrimaryPhoneNumber],[SecondaryPhoneNumber], [OrganizationID], [LastUpdated], [LastUpdatedBy])VALUES (" +
    //                   "@FirstName, @LastName, @Email, @Primary, @Secondary, @orgID, @LastUpdated, @LastUpdatedBy)";

    //                    using (SqlCommand command = new SqlCommand(insertContact, connection))
    //                    {


    //                        command.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
    //                        command.Parameters.AddWithValue("@LastName", txtLastName.Text);
    //                        command.Parameters.AddWithValue("@Email", txtEmail.Text);
    //                        command.Parameters.AddWithValue("@Primary", txtPrimaryPhone.Text);
    //                        command.Parameters.AddWithValue("@Secondary", txtSecondaryPhone.Text);
    //                        command.Parameters.AddWithValue("@orgID", drpOrganizationList.SelectedValue);
    //                        command.Parameters.AddWithValue("@LastUpdated", DateTime.Today);
    //                        command.Parameters.AddWithValue("@LastUpdatedBy", Session["UserFullName"]);

    //                        command.ExecuteNonQuery();

    //                    }

    //                }

    //            }
    //            connection.Close();
    //        }

    //        int miles;
    //        if (locationtab.Visible == true)
    //        {
    //            miles = Convert.ToInt32(txtMileage.Text);
    //            mileageCost = miles * .57;
    //            lblMileageCost.Text = mileageCost.ToString();
    //        }
    //        else
    //        {
    //            miles = 0;
    //        }
    //        NewProgram.programList.Clear();



    //        for (int z = 0; z < NewProgram.programList.Count; z++)
    //        {

    //            if (z == 0)
    //            {
    //                totalCost += 250;
    //            }

    //            if (z == 1)
    //            {
    //                totalCost += 160;
    //            }


    //            if (z == 2)
    //            {

    //                totalCost += 160;
    //            }

    //        }

    //        double totalReal;
    //        totalReal = Convert.ToDouble(lblSubtotalCost.Text) + mileageCost;
    //        lblTotalCostPrice.Text = totalReal.ToString();
    //        NewProgram.programList.Clear();

    //    }

    //    protected void BtnAddProgram_Click(object sender, EventArgs e)
    //    {
    //        NewProgram.btnCount++;
    //        programID = Convert.ToInt32(drpOrganizationList.SelectedValue); /*Grab ProgramID*/
    //        int totalPeople;
    //        totalPeople = Convert.ToInt32(txtAdults.Text) + Convert.ToInt32(txtKids.Text);

    //        if (drpLocationTypeList.SelectedValue == "Onsite")
    //        {
    //            if (totalPeople < 20)
    //            {
    //                programCost = 100.00;
    //            }
    //            else
    //            {
    //                programCost = totalPeople * 5.00;
    //            }
    //        }

    //        else if (drpLocationTypeList.SelectedValue == "Online")
    //        {
    //            programCost = 0.00;
    //        }
    //        else if (drpLocationTypeList.SelectedValue == "Offsite")
    //        {
    //            if (NewProgram.btnCount == 0)
    //            {
    //                programCost = 250.00;
    //            }
    //            else
    //            {
    //                programCost = 160.00;
    //            }
    //        }
    //        NewProgram newProgram = new NewProgram(Int32.Parse(txtKids.Text), Int32.Parse(txtAdults.Text),
    //                totalPeople, drpAgeLevel.SelectedValue, "Completed", Convert.ToDateTime(txtProgramTime.Text),
    //                Convert.ToDateTime(txtDatePicker.Text), txtMiscNotes.Text, drpLocationTypeList.SelectedValue,
    //                programID, DateTime.Now, "Raina", programCost);


    //        NewProgram.programList.Add(newProgram);


    //        drpAgeLevel.SelectedValue = null;
    //        txtAdults.Text = null;
    //        txtKids.Text = null;
    //        txtMiscNotes.Text = null;
    //        drpLocationTypeList.SelectedValue = null;
    //        drpProgramList.SelectedValue = null;
    //        NewProgram.baseCost = 250 + (160 * (NewProgram.programList.Count - 1));

    //        string location = NewProgram.programList[0].getLocationType();
    //        if (location == "Offsite" && NewProgram.btnCount >= 1)
    //        //{
    //        //    txtDatePicker.Enabled = true;


    //            drpOrganizationList.Enabled = false;
    //            //drpLocationTypeList.SelectedIndex = 2;
    //            //drpLocationTypeList.Enabled = false;
    //        }

    //        for (int z = 0; z < NewProgram.programList.Count; z++)
    //        {

    //            if (z == 0)
    //            {
    //                lblProgramCostOne.Text = Convert.ToString(NewProgram.programList[z].getPrgCost());
    //                totalCost += NewProgram.programList[z].getPrgCost();
    //                programOne.Visible = true;
    //                programTwo.Visible = false;
    //                programThree.Visible = false;
    //            }

    //            if (z == 1)
    //            {
    //                lblProgramCostTwo.Text = Convert.ToString(NewProgram.programList[z].getPrgCost());
    //                totalCost += NewProgram.programList[z].getPrgCost();
    //                programTwo.Visible = true;

    //            }


    //            if (z == 2)
    //            {
    //                lblProgramCostThree.Text = Convert.ToString(NewProgram.programList[z].getPrgCost());
    //                totalCost += NewProgram.programList[z].getPrgCost();
    //                programThree.Visible = true;
    //            }
    //        }


    //        lblCartTotal.Text = Convert.ToString(NewProgram.programList.Count);


    //        lblSubtotalCost.Text = totalCost.ToString();
    //        totalCost += mileageCost;
    //        lblTotalCostPrice.Text = totalCost.ToString();
    //        NewProgram.btnCount += 1;

    //    }

    //protected void drpLocationTypeList_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    string locationType = drpLocationTypeList.SelectedValue;
    //    if (locationType == "Onsite" || locationType == "Online")
    //    {
    //        locationtab.Visible = false;
    //    }
    //    else
    //    {
    //        locationtab.Visible = true;
    //    }
    //}

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

    //    protected void Clear(object sender, EventArgs e)
    //    {
    //        NewProgram.programList.Clear();
    //        NewProgram.btnCount = 0;

    //    }

    //}

    protected void drpProgramType_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(drpProgramType.SelectedValue == "Online")
        {
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
}