using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;

public partial class AddProgram : System.Web.UI.Page
{
    public static int programID;
    double programCost;
    public double mileageCost;
    public double totalCost;
    public double totalReal;
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
            txtPrimaryNumber.Text = null;
            txtSecondaryNumber.Text = null;
        }

    }

    protected void BtnAddOrg_Click(object sender, EventArgs e)
    {

        Server.Transfer("AddOrganization.aspx", true);
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
                            txtPrimaryNumber.Text = reader.GetString(3);
                            txtSecondaryNumber.Text = reader.GetString(4);



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
            txtPrimaryNumber.Text = null;
            txtSecondaryNumber.Text = null;

        }
    }

    protected void DrpProgramList_SelectedIndexChanged(object sender, EventArgs e)
    {
        string value = drpProgramList.SelectedValue;
        if (value == "19" || value == "20" || value == "21" || value == "22" || value == "23" || value == "24" || value == "25" || value == "26" || value == "27" || value == "28")
        {

            drpLocationTypeList.Enabled = false;
            drpLocationTypeList.Items.Add(("Online"));
            drpLocationTypeList.SelectedValue = "Online";
            txtMileage.Visible = false;
            programLoc.Visible = false;
        }
        else
        {
            drpLocationTypeList.Enabled = true;
            drpLocationTypeList.Items.Remove(drpLocationTypeList.Items.FindByValue("Online"));
            drpLocationTypeList.SelectedIndex = 0;
            txtMileage.Visible = true;
        }

        if (value == "13" || value == "14" || value == "15" || value == "16" || value == "17" || value == "18")
        {
            drpLocationTypeList.SelectedValue = "Offsite";
            drpLocationTypeList.Enabled = false;
        }

        if (value == "1" || value == "2" || value == "3" || value == "4" || value == "5" || value == "6" || value == "7" || value == "8" || value == "9" || value == "10" || value == "11" || value == "12")
        {

            drpLocationTypeList.Items.Remove(drpLocationTypeList.Items.FindByValue("Online"));
        }
        else
        {
            drpLocationTypeList.Items.Add(("Online"));
           
        }
    }

    protected void BtnAllBirds_Click(object sender, EventArgs e)
    {
        if (btnAllBirds.Text == "Select All")
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
        if (btnAllReptiles.Text == "Select All")
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
        if (btnAllMammals.Text == "Select All")
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

    protected void SubmitProgram(object sender, EventArgs e)
    {

        using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString))
        {

            connection.Open();
            Address address = new Address(txtStreet.Text, txtState.Text, txtCity.Text, txtCounty.Text, txtCountry.Text, txtZipCode.Text, "Program Location", DateTime.Today, Session["UserFullName"].ToString());
            int newAddressID;

            if (drpLocationTypeList.SelectedValue == "Onsite")
            {
                string insertIntoAddress = "Insert into Address([Street], [City], [State], [County], [Country], [ZipCode], [AddressType], [LastUpdated], [LastUpdatedBy]) VALUES (" +
                "@street, @city, @state, @county, @country, @zipCode, @addressType, @LU, @LUB)";
                using (SqlCommand command = new SqlCommand(insertIntoAddress, connection))
                {
                    command.Parameters.AddWithValue("@street", "1800 S Delphine Ave");
                    command.Parameters.AddWithValue("@city", "Waynesboro");
                    command.Parameters.AddWithValue("@state", "Virginia");
                    command.Parameters.AddWithValue("@county", "Waynesboro");
                    command.Parameters.AddWithValue("@country", "USA");
                    command.Parameters.AddWithValue("@zipCode", "22980");
                    command.Parameters.AddWithValue("@addressType", "Program");
                    command.Parameters.AddWithValue("@LU", address.getLastUpdated());
                    command.Parameters.AddWithValue("@LUB", address.getLastUpdatedBy());
                    command.ExecuteNonQuery();
                }


                string findAddressID = "Select AddressID from Address where AddressID = (Select Max(AddressID) from Address)";
                using (SqlCommand command = new SqlCommand(findAddressID, connection))
                {

                    newAddressID = Convert.ToInt32(command.ExecuteScalar());

                }
            }
            else
            {
                string insertIntoAddress = "Insert into Address([Street], [City], [State], [County], [Country], [ZipCode], [AddressType], [LastUpdated], [LastUpdatedBy]) VALUES (" +
                    "@street, @city, @state, @county, @country, @zipCode, @addressType, @LU, @LUB)";
                using (SqlCommand command = new SqlCommand(insertIntoAddress, connection))
                {
                    command.Parameters.AddWithValue("@street", address.getStreetName());
                    command.Parameters.AddWithValue("@city", address.getCity());
                    command.Parameters.AddWithValue("@state", address.getState());
                    command.Parameters.AddWithValue("@county", address.getCounty());
                    command.Parameters.AddWithValue("@country", address.getCounty());
                    command.Parameters.AddWithValue("@zipCode", address.getZipCode());
                    command.Parameters.AddWithValue("@addressType", address.getAddressType());
                    command.Parameters.AddWithValue("@LU", address.getLastUpdated());
                    command.Parameters.AddWithValue("@LUB", address.getLastUpdatedBy());
                    command.ExecuteNonQuery();
                }


                string findAddressID = "Select AddressID from Address where AddressID = (Select Max(AddressID) from Address)";
                using (SqlCommand command = new SqlCommand(findAddressID, connection))
                {

                    newAddressID = Convert.ToInt32(command.ExecuteScalar());

                }




            }

            for (int j = 0; j < NewProgram.programList.Count; j++)
            {
                string insertIntoNewProgram = "INSERT INTO NewProgram([TotalKids], [TotalAdults]," +
               "[TotalPeople], [AgeLevel], [TotalMileage], [NewProgramStatus], [TimeSlot]," +
               "[DateCompleted], [LocationType], [MiscNotes], [ProgramID], [AddressID],[LastUpdated], [LastUpdatedBy]) VALUES (" +
               "@kid, @adult, @totalPeople, @age, @mileage, @status, @time, @complete," +
               "@location, @miscNotes, @programid, @addressid, @LU, @LUB)";

                using (SqlCommand command = new SqlCommand(insertIntoNewProgram, connection))
                {
                    command.Parameters.AddWithValue("@kid", NewProgram.programList[j].getNumKids());
                    command.Parameters.AddWithValue("@adult", NewProgram.programList[j].getNumAdults());
                    command.Parameters.AddWithValue("@totalpeople", NewProgram.programList[j].getTotalPeople());
                    command.Parameters.AddWithValue("@age", NewProgram.programList[j].getAgeLevel());
                    command.Parameters.AddWithValue("@mileage", NewProgram.programList[j].getTotalMileage());
                    command.Parameters.AddWithValue("@status", NewProgram.programList[j].getProgramStatus());
                    command.Parameters.AddWithValue("@time", NewProgram.programList[j].getTimeSlot());
                    command.Parameters.AddWithValue("@complete", NewProgram.programList[j].getDateCompleted());
                    command.Parameters.AddWithValue("@location", NewProgram.programList[j].getLocationType());
                    command.Parameters.AddWithValue("@miscNotes", NewProgram.programList[j].getMiscNotes());
                    command.Parameters.AddWithValue("@programid", NewProgram.programList[j].getProgramID());
                    command.Parameters.AddWithValue("@addressid", newAddressID);
                    command.Parameters.AddWithValue("@LU", NewProgram.programList[j].getLastUpdated());
                    command.Parameters.AddWithValue("@LUB", NewProgram.programList[j].getLastUpdatedBy());

                    command.ExecuteNonQuery();
                }
                int newProgramID;
                string findProgramID = "Select NewProgramID from NewProgram where NewProgramID = (Select Max(NewProgramID) from NewProgram)";
                using (SqlCommand command = new SqlCommand(findProgramID, connection))
                {

                    newProgramID = Convert.ToInt32(command.ExecuteScalar());
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

                string assignAnimals = "Insert into AssignAnimal([AnimalID], [NewProgramID], [LastUpdated], [LastUpdatedBy])VALUES (" +
                   "@AnimalID, @NewProgramID, @LastUpdated, @LastUpdatedBy)";


                foreach (int animal in AnimalList)
                {
                    using (SqlCommand command = new SqlCommand(assignAnimals, connection))
                    {
                        command.Parameters.AddWithValue("@AnimalID", animal);
                        command.Parameters.AddWithValue("@NewProgramID", newProgramID);
                        command.Parameters.AddWithValue("@LastUpdated", DateTime.Today);
                        command.Parameters.AddWithValue("@LastUpdatedBy", Session["UserFullName"].ToString()); ///Need to change this

                        command.ExecuteNonQuery();

                    }
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
                        command.Parameters.AddWithValue("@NewProgramID", newProgramID);
                        command.Parameters.AddWithValue("@LastUpdated", DateTime.Today);
                        command.Parameters.AddWithValue("@LastUpdatedBy", Session["UserFullName"].ToString()); ///Need to change this

                        command.ExecuteNonQuery();

                    }
                }

                if (drpContact.SelectedIndex == 0)
                {

                    string insertContact = "Insert into Contact([FirstName], [LastName], [Email], [PrimaryPhoneNumber],[SecondaryPhoneNumber], [OrganizationID], [LastUpdated], [LastUpdatedBy])VALUES (" +
                   "@FirstName, @LastName, @Email, @Primary, @Secondary, @orgID, @LastUpdated, @LastUpdatedBy)";

                    using (SqlCommand command = new SqlCommand(insertContact, connection))
                    {


                        command.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
                        command.Parameters.AddWithValue("@LastName", txtLastName.Text);
                        command.Parameters.AddWithValue("@Email", txtEmail.Text);
                        command.Parameters.AddWithValue("@Primary", txtPrimaryNumber.Text);
                        command.Parameters.AddWithValue("@Secondary", txtSecondaryNumber.Text);
                        command.Parameters.AddWithValue("@orgID", drpOrganizationList.SelectedValue);
                        command.Parameters.AddWithValue("@LastUpdated", DateTime.Today);
                        command.Parameters.AddWithValue("@LastUpdatedBy", Session["UserFullName"].ToString());

                        command.ExecuteNonQuery();

                    }

                }

            }

            int miles;
            if (programLoc.Visible == true)
            {
                miles = Convert.ToInt32(txtMileage.Text);
                mileageCost = miles * .57;
                lblMileageCost.Text = mileageCost.ToString();
            }
            else
            {
                miles = 0;
            }

            totalReal = Convert.ToDouble(lblSubtotalCost.Text) + mileageCost;
        lblTotalCostPrice.Text = totalReal.ToString();
             Invoice newInvoice = new Invoice(txtInvoiceNumber.Text, totalReal, Convert.ToDateTime(datepicker.Value), "Incompleted", DateTime.Today, "Raina", 100);

        string invoiceInsert = "Insert into Invoice([InvoiceNumber], [TotalCost], [DateCreated], [InvoiceStatus], [LastUpdated], [LastUpdatedBy])VALUES (" +
               "@InvoiceNumber, @TotalCost, @DateCreated, @InvoiceStatus, @LastUpdated, @LastUpdatedBy)";

        using (SqlCommand command = new SqlCommand(invoiceInsert, connection))
        {


            command.Parameters.AddWithValue("@InvoiceNumber", newInvoice.getInvoiceNumber());
            command.Parameters.AddWithValue("@TotalCost", newInvoice.getTotal());
            command.Parameters.AddWithValue("@DateCreated", newInvoice.getDateCreated());
            command.Parameters.AddWithValue("@InvoiceStatus", newInvoice.getInvoiceStatus());
            command.Parameters.AddWithValue("@LastUpdated", newInvoice.getLastUpdated());
            command.Parameters.AddWithValue("@LastUpdatedBy", newInvoice.getLastUpdatedBy());

            command.ExecuteNonQuery();

        }


            int newProgramID2;
            string findProgramID2 = "Select NewProgramID from NewProgram where NewProgramID = (Select Max(NewProgramID) from NewProgram)";
            using (SqlCommand command = new SqlCommand(findProgramID2, connection))
            {

                newProgramID2 = Convert.ToInt32(command.ExecuteScalar());
            }

            int invoiceID;
            string findInvoiceID = "Select InvoiceID from Invoice where InvoiceID = (Select Max(InvoiceID) from Invoice)";
            using (SqlCommand command = new SqlCommand(findInvoiceID, connection))
            {

                invoiceID = Convert.ToInt32(command.ExecuteScalar());
            }
            string assignInvoice = "Insert into AssignInvoice([InvoiceID], [NewProgramID], [LastUpdated], [LastUpdatedBy])VALUES (" +
                  "@InvoiceID, @NewProgramID, @LastUpdated, @LastUpdatedBy)";


            
                using (SqlCommand command = new SqlCommand(assignInvoice, connection))
                {
                    command.Parameters.AddWithValue("@InvoiceID", invoiceID);
                    command.Parameters.AddWithValue("@NewProgramID", newProgramID2);
                    command.Parameters.AddWithValue("@LastUpdated", DateTime.Today);
                    command.Parameters.AddWithValue("@LastUpdatedBy", "Raina"); ///Need to change this

                    command.ExecuteNonQuery();

                }

            //INSERT INTO THE PAYMENT TABLE
            int orgID;
            string findOrgID = "SELECT OrganizationID from Organization where OrganizationName = @selectedOrg";
            using (SqlCommand command = new SqlCommand(findOrgID, connection))
            {
                command.Parameters.AddWithValue("@selectedOrg", Convert.ToString(drpOrganizationList.SelectedItem.Text));
                orgID = Convert.ToInt32(command.ExecuteScalar());
            }

            string insertIntoPayment = "Insert into Payment([PaymentType],[OrganizationID],[InvoiceID],[LastUpdated],[LastUpdatedBy]) VALUES (@paymentType, @organizationID, @invoiceID, @lastUpdated, @lastUpdatedBy)";
            using (SqlCommand command = new SqlCommand(insertIntoPayment, connection))
            {
                command.Parameters.AddWithValue("@paymentType", "TBD");
                command.Parameters.AddWithValue("@organizationID", orgID);
                command.Parameters.AddWithValue("@invoiceID", invoiceID);
                command.Parameters.AddWithValue("@lastUpdated", DateTime.Today);
                command.Parameters.AddWithValue("@lastUpdatedBy", Session["UserFullName"]);

                command.ExecuteNonQuery();
            }
            //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>


            connection.Close();
        }

       


        //lblSubtotalCost.Text = totalCost.ToString();

        //NewProgram.programList.Clear();



        for (int z = 0; z < NewProgram.programList.Count; z++)
        {

            if (z == 0)
            {
                //    lblProgramCostOne.Text = Convert.ToString(NewProgram.programList[z].getPrgCost());
                totalCost += 250;
                //    programOne.Visible = true;
                //    programTwo.Visible = false;
                //    programThree.Visible = false;
            }

            if (z == 1)
            {
                //    lblProgramCostTwo.Text = Convert.ToString(NewProgram.programList[z].getPrgCost());
                //    totalCost += NewProgram.programList[z].getPrgCost();
                //    programTwo.Visible = true;
                totalCost += 160;
            }


            if (z == 2)
            {
                //    lblProgramCostThree.Text = Convert.ToString(NewProgram.programList[z].getPrgCost());
                //    totalCost += NewProgram.programList[z].getPrgCost();
                //    programThree.Visible = true;
                totalCost += 160;
            }


            //lblSubtotalCost.Text = totalCost.ToString();


        }
        //totalCost = totalCost + mileageCost;
        //lblTotalCostPrice.Text = totalCost.ToString();
      
      
        NewProgram.programList.Clear();
        NewProgram.btnCount = 0;




    }

    protected void BtnAddProgram_Click(object sender, EventArgs e)
    {

        programID = Convert.ToInt32(drpOrganizationList.SelectedValue); /*Grab ProgramID*/

        int totalPeople;
        totalPeople = Convert.ToInt32(txtAdults.Text) + Convert.ToInt32(txtKids.Text);

        if (drpLocationTypeList.SelectedValue == "Onsite")
        {
            if (totalPeople < 20)
            {
                programCost = 100.00;
            }
            else
            {
                programCost = totalPeople * 5.00;
            }
        }

        else if (drpLocationTypeList.SelectedValue == "Online")
        {
            programCost = 0.00;
        }
        else if (drpLocationTypeList.SelectedValue == "Offsite")
        {
            if (NewProgram.btnCount == 0)
            {
                programCost = 250.00;
            }
            else
            {
                programCost = 160.00;
            }
        }
        NewProgram newProgram = new NewProgram(Int32.Parse(txtKids.Text), Int32.Parse(txtAdults.Text),
                totalPeople, drpAgeLevel.SelectedValue, "Completed", Convert.ToDateTime(programTime.Text),
                Convert.ToDateTime(datepicker.Value), txtMiscNotes.Value, drpLocationTypeList.SelectedValue,
                programID, DateTime.Now, Session["UserFullName"].ToString(), programCost);

        NewProgram.programList.Add(newProgram);





        drpAgeLevel.SelectedValue = null;
        txtAdults.Text = null;
        txtKids.Text = null;
        txtMiscNotes.InnerText = null;
        drpLocationTypeList.SelectedValue = null;
        drpProgramList.SelectedValue = null;
        NewProgram.baseCost = 250 + (160 * (NewProgram.programList.Count - 1));




        string location = NewProgram.programList[0].getLocationType();
        if (location == "Offsite" && NewProgram.btnCount == 0)
        {
            datepicker.Disabled = true;


            drpOrganizationList.Enabled = false;
            drpLocationTypeList.SelectedIndex = 2;
            drpLocationTypeList.Enabled = false;
        }
        //if (NewProgram.btnCount == 1)
        //{
        //    lblProgramCostTwo.Visible = false;
        //    lblProgramCostThree.Visible = false;
        //}
        for (int z = 0; z < NewProgram.programList.Count; z++)
        {

            if (z == 0)
            {
                lblProgramCostOne.Text = NewProgram.programList[z].getPrgCost().ToString("C");
                totalCost += NewProgram.programList[z].getPrgCost();
                programOne.Visible = true;
                programTwo.Visible = false;
                programThree.Visible = false;
            }

            if (z == 1)
            {
                lblProgramCostTwo.Text = NewProgram.programList[z].getPrgCost().ToString("C");
                totalCost += NewProgram.programList[z].getPrgCost();
                programTwo.Visible = true;

            }


            if (z == 2)
            {
                lblProgramCostThree.Text = NewProgram.programList[z].getPrgCost().ToString("C");
                totalCost += NewProgram.programList[z].getPrgCost();
                programThree.Visible = true;
            }
        }


        lblCartTotal.Text = Convert.ToString(NewProgram.programList.Count);
        //lblProgramCostOne.Text = NewProgram.programList
        //lblProgramCostTwo.Text = Convert.ToString(programCost);
        //lblProgramCostThree.Text = Convert.ToString(programCost);


        lblSubtotalCost.Text = totalCost.ToString();
        totalCost += mileageCost;
        lblTotalCostPrice.Text = totalCost.ToString();
        NewProgram.btnCount += 1;

    }

    protected void drpLocationTypeList_SelectedIndexChanged(object sender, EventArgs e)
    {
        string locationType = drpLocationTypeList.SelectedValue;
        if (locationType == "Onsite" || locationType == "Online")
        {
            programLoc.Visible = false;
        }
        else
        {
            programLoc.Visible = true;
        }
    }

    protected void Clear(object sender, EventArgs e)
    {
        NewProgram.programList.Clear();
        lblCartTotal.Text = Convert.ToString(NewProgram.programList.Count);
        NewProgram.btnCount = 0;
         programCost =0.0;
     mileageCost =0.0;
        lblMileageCost.Text = Convert.ToString(mileageCost);
     totalCost =0.0;
    totalReal =0.0;
        lblSubtotalCost.Text = totalCost.ToString();
    lblTotalCostPrice.Text = totalCost.ToString();
        if (lblProgramOne.Visible==true)
        {
            lblProgramOne.Visible = false;
            lblProgramCostOne.Visible = false;
        }

        if (lblProgramTwo.Visible == true)
        {
            lblProgramOne.Visible = false;
            lblProgramCostOne.Visible = false;
            lblProgramTwo.Visible = false;
            lblProgramCostTwo.Visible = false;
        }


        if (lblProgramThree.Visible == true)
        {
            lblProgramOne.Visible = false;
            lblProgramCostOne.Visible = false;
            lblProgramTwo.Visible = false;
            lblProgramCostTwo.Visible = false;
            lblProgramThree.Visible = false;
            lblProgramCostThree.Visible = false;
        }

    }
}