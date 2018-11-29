<%@ Page Title="" Language="C#" MasterPageFile="~/VolunteerMasterPage.master" AutoEventWireup="true" CodeFile="VolunteerAddProgram.aspx.cs" Inherits="VolunteerAddProgram" %>



<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ScriptManager runat="server"></asp:ScriptManager>
    <script type="text/javascript">

        $(document).ready(function () {
            $("#home").removeClass('active');
            $("#program").addClass('active');

        });

        $(document).ready(function () {
            $('a[data-toggle="tab"]').on('show.bs.tab', function (e) {
                localStorage.setItem('activeTab', $(e.target).attr('href'));
            });
            var activeTab = localStorage.getItem('activeTab');
            if (activeTab) {
                $('#myTab a[href="' + activeTab + '"]').tab('show');
            }
        });

    </script>


    <%--Beginning container--%>
    <div class="card-body">
        <h3 class="box-title">Add Program</h3>
    </div>



    <div class="row" style="">

        <div class="SimpleContainer card col-sm-12 col-xs-12 col-md-3 col-lg-3 col-xl-3" style="z-index: 100;">
            <div class=" card-body text-left  rounded cart" style="">
                <h4>Programs

                <span class="price" style="color: black"><b><i class="fa fa-shopping-basket"></i>
                    <asp:Label ID="lblCartTotal" runat="server" Text="0"></asp:Label></b></span>

                </h4>
                <div id="programOne" runat="server" visible="false">
                    <p>
                        <a href="#">
                            <asp:Label ID="lblProgramOne" runat="server" Text="Program One"></asp:Label></a> <span class="price">
                                <asp:Label ID="lblProgramCostOne" runat="server" Text="70"></asp:Label></span>
                    </p>
                </div>
                <div id="programTwo" runat="server" visible="false">
                    <p>
                        <a href="#">
                            <asp:Label ID="lblProgramTwo" runat="server" Text="Program Two"></asp:Label></a> <span class="price">
                                <asp:Label ID="lblProgramCostTwo" runat="server" Text="70"></asp:Label></span>
                    </p>
                </div>
                <div id="programThree" runat="server" visible="false">
                    <p>
                        <a href="#">
                            <asp:Label ID="lblProgramThree" runat="server" Text="Program Three"></asp:Label></a> <span class="price">
                                <asp:Label ID="lblProgramCostThree" runat="server" Text="70"></asp:Label></span>
                    </p>
                </div>

                <hr>
                <p>
                    <asp:Label ID="lblSubtotal" runat="server" Text="Subtotal"></asp:Label>
                    <span class="price" style="color: black"><b>$
                    <asp:Label ID="lblSubtotalCost" runat="server" Text="0"></asp:Label></b></span>
                </p>

                <p>
                    <asp:Label ID="lblMileage" runat="server" Text="Mileage Cost"></asp:Label>
                    <span class="price" style="color: black"><b>$
                    <asp:Label ID="lblMileageCost" runat="server" Text="0"></asp:Label></b></span>
                </p>

                <p>

                    <asp:Label ID="lblTotalCost" runat="server" Text="Total Cost"></asp:Label>
                    <span class="price" style="color: black"><b>$
                    <asp:Label ID="lblTotalCostPrice" runat="server" Text="0"></asp:Label></b></span>
                </p>
            </div>
        </div>
        <div class="SimpleContainer card col-sm-12 col-xs-12 col-md-9 col-lg-9 col-xl-9" style="z-index: 100;">

            <div class="row p-2">
                <div class="col col-md-6">
                    <label for="txtOrgDrp" class="label-style">Organization</label>
                    <br>
                    <asp:DropDownList ID="drpOrganizationList" runat="server" CssClass="btn btn-default btn-sm dropdown-toggle" Style="background-color: whitesmoke;" AppendDataBoundItems="True" DataSourceID="SqlDataSource3"
                        DataTextField="OrganizationName" DataValueField="OrganizationID" OnSelectedIndexChanged="DrpOrganizationList_IndexChanged" AutoPostBack="true">

                        <asp:ListItem Text="Select an Organization"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:connString %>" SelectCommand="SELECT OrganizationName, OrganizationID FROM Organization"></asp:SqlDataSource>

                    <asp:RequiredFieldValidator ID="orgValidator"
                        runat="server" ControlToValidate="drpOrganizationList"
                        InitialValue="0" ErrorMessage="*" ForeColor="Red"
                        ValidationGroup="addProgram">
                    </asp:RequiredFieldValidator>
                </div>

                <div class="col col-md-6 ">
                    <asp:Label ID="lblInvoice" runat="server" Text="Invoice Number: "></asp:Label>
                    <asp:TextBox ID="txtInvoiceNumber" class="col col-md-6 form-control" Style="background-color: whitesmoke;" runat="server"></asp:TextBox>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                        runat="server" ControlToValidate="txtInvoiceNumber"
                        ErrorMessage="*" ForeColor="Red" ValidationGroup="addProgram">
                    </asp:RequiredFieldValidator>

                </div>
            </div>


            <div class="card">
                <div class="card-body">

                    <div class=" ">
                        <ul class="nav nav-tabs  col-xl-12 col-lg-12 col-md-12 col-s-12 " id="myTab" style="padding-left: 15px; border-bottom: none;" role="tablist">
                            <li class="nav-item ">
                                <a style="margin-right: 5px; color: black;" class="nav-link active" id="program-tab" data-toggle="tab" href="#ProgramInfo" role="tab" aria-controls="program" aria-selected="true">Program Information</a>
                            </li>
                            <li class="nav-item ">
                                <a style="margin-right: 5px; color: black;" class="nav-link  " id="contact-tab" data-toggle="tab" href="#ContactInfo" role="tab" aria-controls="contact" aria-selected="false">Contact Information</a>
                            </li>
                            <li class="nav-item " id="locationtab" runat="server">
                                <a style="margin-right: 5px; color: black;" class="nav-link" id="location-tab" data-toggle="tab" href="#ProgramLocation" role="tab" aria-controls="location" aria-selected="false">Program Location</a>
                            </li>



                        </ul>
                    </div>

                    <div class="tab-content ">

                        <div id="ProgramInfo" class="tab-pane fade show active">

                            <div class="card-body">
                                <div class="row mx-auto">
                                    <div class="col-md-4 mx-auto">
                                        <asp:Label ID="lblProgram" runat="server" Text="Select Program"></asp:Label>
                                        <br />
                                        <asp:DropDownList ID="drpProgramList" runat="server" CssClass="col col-md-2 col-md-4 col-md-6 col-md-8 form-control"
                                            Style="background-color: whitesmoke;" DataSourceID="SqlDataSource1"
                                            DataTextField="ProgramName" DataValueField="ProgramID" AppendDataBoundItems="True"
                                            OnSelectedIndexChanged="DrpProgramList_SelectedIndexChanged" AutoPostBack="true">
                                            <asp:ListItem Text="Program Name"></asp:ListItem>
                                        </asp:DropDownList>

                                        <asp:RequiredFieldValidator ID="prgValidator"
                                            runat="server" ControlToValidate="drpProgramList"
                                            InitialValue="0" ErrorMessage="*" ForeColor="Red"
                                            ValidationGroup="addProgram">
                                        </asp:RequiredFieldValidator>
                                    </div>

                                    <div class="col-md-4 mx-auto">
                                        <asp:Label ID="lblLocationType" runat="server" Text="Select Location Type"></asp:Label>
                                        <br />
                                        <asp:DropDownList ID="drpLocationTypeList" runat="server" CssClass="col col-md-2 col-md-4 col-md-6 col-md-8 form-control"
                                            Style="background-color: whitesmoke;" AutoPostBack="true"
                                            OnSelectedIndexChanged="drpLocationTypeList_SelectedIndexChanged">
                                            <asp:ListItem Text="Location Type"></asp:ListItem>
                                            <asp:ListItem Value="Onsite" Text="Onsite"></asp:ListItem>
                                            <asp:ListItem Value="Offsite" Text="Offsite"></asp:ListItem>
                                            <asp:ListItem Value="Online" Text="Online"></asp:ListItem>
                                        </asp:DropDownList>

                                        <asp:RequiredFieldValidator ID="locationValidator" runat="server"
                                            ControlToValidate="drpLocationTypeList" InitialValue="0"
                                            ErrorMessage="*" ForeColor="Red" ValidationGroup="addProgram">
                                        </asp:RequiredFieldValidator>

                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:connString %>"
                                            SelectCommand="SELECT [ProgramID], [ProgramName] FROM [Program]"></asp:SqlDataSource>

                                    </div>

                                    <div class="col-md-4 mx-auto">
                                        <asp:Label ID="lblDate" runat="server" Text="Date"></asp:Label>
                                        <br />
                                        <asp:TextBox ID="txtDatePicker" runat="server" ClientIDMode="Static" CssClass="col col-md-2 col-md-4 col-md-6 col-md-8 form-control" Enabled="false" Style="background-color: whitesmoke;" Width="100%"></asp:TextBox>
                                        <%--                                        <input runat="server" clientidmode="Static" class="btn" style="background-color: whitesmoke;" width="100%" type="date" id="datepicker">--%>
                                    </div>
                                </div>
                                <br />
                                <div class="row mx-auto">
                                    <div class="col-md-4 mx-auto">
                                        <asp:Label ID="lblProgramTime" runat="server" Text="Program Time"></asp:Label>
                                        <br />
                                        <asp:TextBox ID="txtProgramTime" runat="server" class="col col-md-2 col-md-4 col-md-6 col-md-8 form-control" Style="background-color: whitesmoke;" type="time" step="900" min="8:00" max="17:00"></asp:TextBox>
                                    </div>

                                    <div class="col-md-4 mx-auto">
                                        <asp:Label ID="lblAdults" runat="server" Text="Adults"></asp:Label>
                                        <br />
                                        <asp:TextBox ID="txtAdults" runat="server" class="col col-md-2 col-md-4 col-md-6 col-md-8 form-control" Style="background-color: whitesmoke;" Width="100%"></asp:TextBox>
                                    </div>

                                    <div class="col-md-4 mx-auto">
                                        <asp:Label ID="lblKids" runat="server" Text="Kids"></asp:Label>
                                        <asp:TextBox ID="txtKids" runat="server" class="col col-md-2 col-md-4 col-md-6 col-md-8 form-control" Style="background-color: whitesmoke;" Width="100%"></asp:TextBox>
                                    </div>
                                </div>
                                <br />
                                <div class="row mx-auto">
                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-10">
                                        <asp:Label ID="lblBirds" runat="server" Text="Birds"></asp:Label>
                                        <br />
                                        <asp:UpdatePanel ID="UpdateBirds" runat="server">
                                            <ContentTemplate>
                                                <div class="border" style="overflow-y: scroll; width: 200px; height: 200px">

                                                    <asp:CheckBoxList ID="CheckBoxList2" runat="server" DataSourceID="SqlDataSource4" DataTextField="AnimalName" DataValueField="AnimalID"></asp:CheckBoxList>

                                                </div>
                                                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:connString %>" SelectCommand="SELECT AnimalName, AnimalID FROM Animal Where AnimalType = 'Bird'"></asp:SqlDataSource>
                                                <br />
                                                <asp:Button ID="btnAllBirds" runat="server" Text="Select All" OnClick="BtnAllBirds_Click" />
                                                <br />
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="btnAllBirds" EventName="Click" />
                                            </Triggers>
                                        </asp:UpdatePanel>

                                    </div>

                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-10">
                                        <asp:UpdatePanel ID="UpdateReptiles" runat="server">
                                            <ContentTemplate>
                                                <asp:Label ID="lblReptiles" runat="server" Text="Reptiles"></asp:Label>
                                                <br />
                                                <div class="border" style="overflow-y: scroll; width: 175px; height: 200px">
                                                    <asp:CheckBoxList ID="CheckBoxList3" runat="server" DataSourceID="SqlDataSource5" DataTextField="AnimalName" DataValueField="AnimalID"></asp:CheckBoxList>
                                                </div>
                                                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:connString %>" SelectCommand="SELECT AnimalName, AnimalID FROM Animal Where AnimalType = 'Reptile'"></asp:SqlDataSource>
                                                <br />
                                                <asp:Button ID="btnAllReptiles" runat="server" Text="Select All" OnClick="BtnAllReptiles_Click" />
                                                <br />
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="btnAllReptiles" EventName="Click" />
                                            </Triggers>
                                        </asp:UpdatePanel>

                                    </div>

                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-10">
                                        <asp:Label ID="lblMammals" runat="server" Text="Mammals"></asp:Label>
                                        <br />
                                        <asp:UpdatePanel ID="UpdateMammals" runat="server">
                                            <ContentTemplate>
                                                <div class="border" style="overflow-y: scroll; width: 150px; height: 200px">
                                                    <asp:CheckBoxList ID="CheckBoxList4" runat="server" DataSourceID="SqlDataSource6" DataTextField="AnimalName" DataValueField="AnimalID"></asp:CheckBoxList>
                                                </div>
                                                <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:connString %>" SelectCommand="SELECT AnimalName, AnimalID FROM Animal Where AnimalType = 'Mammal'"></asp:SqlDataSource>
                                                <br />
                                                <asp:Button ID="btnAllMammals" runat="server" Text="Select All" OnClick="BtnAllMammals_Click" />
                                                <br />
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="btnAllMammals" EventName="Click" />
                                            </Triggers>
                                        </asp:UpdatePanel>

                                    </div>
                                </div>
                                <br />
                                <div class="row mx-auto">
                                    <div class="col-md-4 mx-auto">
                                        <asp:Label ID="lblGrade" runat="server" Text="Select Grade"></asp:Label>
                                        <br />
                                        <asp:DropDownList ID="drpAgeLevel" class="col col-md-2 col-md-4 col-md-6 col-md-8 form-control" Style="background-color: whitesmoke;" runat="server">
                                            <asp:ListItem>Grade Level</asp:ListItem>
                                            <asp:ListItem>1st Grade</asp:ListItem>
                                            <asp:ListItem>2nd Grade</asp:ListItem>
                                            <asp:ListItem>3rd Grade</asp:ListItem>
                                            <asp:ListItem>4th Grade</asp:ListItem>
                                            <asp:ListItem>5th Grade</asp:ListItem>
                                            <asp:ListItem>6th Grade</asp:ListItem>
                                            <asp:ListItem>7th Grade</asp:ListItem>
                                            <asp:ListItem>8th Grade</asp:ListItem>
                                            <asp:ListItem>9th Grade</asp:ListItem>
                                            <asp:ListItem>10th Grade</asp:ListItem>
                                            <asp:ListItem>11th Grade</asp:ListItem>
                                            <asp:ListItem>12th Grade</asp:ListItem>

                                            <asp:ListItem>Elementary School</asp:ListItem>
                                            <asp:ListItem>Middle School</asp:ListItem>
                                            <asp:ListItem>High School</asp:ListItem>
                                            <asp:ListItem>Familes</asp:ListItem>
                                            <asp:ListItem>Adults Only</asp:ListItem>
                                            <asp:ListItem>College/University</asp:ListItem>

                                        </asp:DropDownList>
                                    </div>

                                    <div class="col-md-4 mx-auto">
                                        <asp:Label ID="lblEducators" runat="server" Text="Select Educators"></asp:Label>
                                        <br />
                                        <div class="border" style="overflow-y: scroll; width: 200px; height: 200px">
                                            <asp:CheckBoxList ID="CheckBoxList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="name" DataValueField="UserID"></asp:CheckBoxList>
                                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:connString %>" SelectCommand="SELECT UserID, CONCAT(FirstName, ' ', LastName) as name FROM [User] "></asp:SqlDataSource>
                                        </div>
                                    </div>

                                    <div class="col-md-4 mx-auto">
                                        <asp:Label ID="lblNotes" runat="server" Text="Notes"></asp:Label>
                                        <br />
                                        <asp:TextBox ID="txtMiscNotes" runat="server" TextMode="MultiLine" Columns="20" Rows="3" style="resize: none"></asp:TextBox>
                                    </div>
                                </div>
                                <br />
                                <div class="row mx-auto">
                                    <div class="col-6 mx-auto text-center">
                                        <asp:Button ID="Button2" runat="server" CssClass="btn btn-success" Text="Add Program" OnClick="BtnAddProgram_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div id="ProgramLocation" class="tab-pane fade">

                            <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <asp:CheckBox ID="chkLocation" runat="server" Text="  Select if event is at organization" CssClass="label-style " AutoPostBack="true" OnCheckedChanged="chkLocation_CheckedChanged" />
                                            </div>
                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="col-md-4">
                                                <label for="txtStreet" class="label-style">Street</label>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <asp:TextBox ID="txtStreet" runat="server" class="form-control" Style="background-color: whitesmoke;"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-4">
                                                <label for="txtCity" class="label-style">City</label>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <asp:TextBox ID="txtCity" runat="server" class="form-control" Style="background-color: whitesmoke;"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-4">
                                                <label for="txtState" class="label-style">State</label>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <asp:DropDownList ID="drpState" runat="server" class="btn btn-block" Style="background-color: whitesmoke;">
                                                    <asp:ListItem Value="VA">Virginia</asp:ListItem>
                                                    <asp:ListItem Value="AL">Alabama</asp:ListItem>
                                                    <asp:ListItem Value="AK">Alaska</asp:ListItem>
                                                    <asp:ListItem Value="AZ">Arizona</asp:ListItem>
                                                    <asp:ListItem Value="AR">Arkansas</asp:ListItem>
                                                    <asp:ListItem Value="CA">California</asp:ListItem>
                                                    <asp:ListItem Value="CO">Colorado</asp:ListItem>
                                                    <asp:ListItem Value="CT">Connecticut</asp:ListItem>
                                                    <asp:ListItem Value="DC">District of Columbia</asp:ListItem>
                                                    <asp:ListItem Value="DE">Delaware</asp:ListItem>
                                                    <asp:ListItem Value="FL">Florida</asp:ListItem>
                                                    <asp:ListItem Value="GA">Georgia</asp:ListItem>
                                                    <asp:ListItem Value="HI">Hawaii</asp:ListItem>
                                                    <asp:ListItem Value="ID">Idaho</asp:ListItem>
                                                    <asp:ListItem Value="IL">Illinois</asp:ListItem>
                                                    <asp:ListItem Value="IN">Indiana</asp:ListItem>
                                                    <asp:ListItem Value="IA">Iowa</asp:ListItem>
                                                    <asp:ListItem Value="KS">Kansas</asp:ListItem>
                                                    <asp:ListItem Value="KY">Kentucky</asp:ListItem>
                                                    <asp:ListItem Value="LA">Louisiana</asp:ListItem>
                                                    <asp:ListItem Value="ME">Maine</asp:ListItem>
                                                    <asp:ListItem Value="MD">Maryland</asp:ListItem>
                                                    <asp:ListItem Value="MA">Massachusetts</asp:ListItem>
                                                    <asp:ListItem Value="MI">Michigan</asp:ListItem>
                                                    <asp:ListItem Value="MN">Minnesota</asp:ListItem>
                                                    <asp:ListItem Value="MS">Mississippi</asp:ListItem>
                                                    <asp:ListItem Value="MO">Missouri</asp:ListItem>
                                                    <asp:ListItem Value="MT">Montana</asp:ListItem>
                                                    <asp:ListItem Value="NE">Nebraska</asp:ListItem>
                                                    <asp:ListItem Value="NV">Nevada</asp:ListItem>
                                                    <asp:ListItem Value="NH">New Hampshire</asp:ListItem>
                                                    <asp:ListItem Value="NJ">New Jersey</asp:ListItem>
                                                    <asp:ListItem Value="NM">New Mexico</asp:ListItem>
                                                    <asp:ListItem Value="NY">New York</asp:ListItem>
                                                    <asp:ListItem Value="NC">North Carolina</asp:ListItem>
                                                    <asp:ListItem Value="ND">North Dakota</asp:ListItem>
                                                    <asp:ListItem Value="OH">Ohio</asp:ListItem>
                                                    <asp:ListItem Value="OK">Oklahoma</asp:ListItem>
                                                    <asp:ListItem Value="OR">Oregon</asp:ListItem>
                                                    <asp:ListItem Value="PA">Pennsylvania</asp:ListItem>
                                                    <asp:ListItem Value="RI">Rhode Island</asp:ListItem>
                                                    <asp:ListItem Value="SC">South Carolina</asp:ListItem>
                                                    <asp:ListItem Value="SD">South Dakota</asp:ListItem>
                                                    <asp:ListItem Value="TN">Tennessee</asp:ListItem>
                                                    <asp:ListItem Value="TX">Texas</asp:ListItem>
                                                    <asp:ListItem Value="UT">Utah</asp:ListItem>
                                                    <asp:ListItem Value="VT">Vermont</asp:ListItem>
                                                    <asp:ListItem Value="WA">Washington</asp:ListItem>
                                                    <asp:ListItem Value="WV">West Virginia</asp:ListItem>
                                                    <asp:ListItem Value="WI">Wisconsin</asp:ListItem>
                                                    <asp:ListItem Value="WY">Wyoming</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <label for="txtCounty" class="label-style">County</label>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <asp:TextBox ID="txtCounty" runat="server" class="form-control" Style="background-color: whitesmoke;"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <label for="txtCountry" class="label-style">Country</label>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <asp:DropDownList ID="drpCountry" runat="server" class="btn btn-block" Style="background-color: whitesmoke;">
                                                    <asp:ListItem>United States</asp:ListItem>
                                                    <asp:ListItem>Canada</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-4">
                                                <label for="txtZipCode" class="label-style">Zip Code</label>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <asp:TextBox ID="txtZipCode" runat="server" class="form-control" Style="background-color: whitesmoke;"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <label for="txtMileage" class="label-style">Mileage</label>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <asp:TextBox ID="txtMileage" runat="server" class="form-control" Style="background-color: whitesmoke;"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="button-container">
                                        </div>
                                    </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="drpContact" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </div>
                        <div id="ContactInfo" class="tab-pane fade">
                            <asp:UpdatePanel runat="server" ID="UpdatePanel2" UpdateMode="Always">
                                <ContentTemplate>
                                    <div class="card-body">
                                        <asp:UpdatePanel runat="server" ID="clientPanel">
                                            <ContentTemplate>
                                                <asp:DropDownList ID="drpContact" runat="server" class="btn" Style="background-color: whitesmoke;" OnSelectedIndexChanged="DrpContact_SelectedIndexChanged" AutoPostBack="True">
                                                    <asp:ListItem Text="Select a Contact"></asp:ListItem>
                                                </asp:DropDownList>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="drpOrganizationList" EventName="SelectedIndexChanged" />

                                            </Triggers>

                                        </asp:UpdatePanel>
                                        <br />
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label for="txtFirstName" class="label-style">First Name</label>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <asp:TextBox ID="txtFirstName" class="form-control" Style="background-color: whitesmoke;" runat="server"></asp:TextBox>

                                            </div>

                                        </div>


                                        <div class="row">
                                            <div class="col-md-6">
                                                <label for="txtLastName" class="label-style">Last Name</label>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <asp:TextBox ID="txtLastName" class="form-control" Style="background-color: whitesmoke;" runat="server"></asp:TextBox>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label for="txtEmail" class="label-style">Email Address</label>
                                            </div>
                                            <div class="form-group  col-md-6">
                                                <asp:TextBox ID="txtEmail" class="form-control" Style="background-color: whitesmoke;" runat="server"></asp:TextBox>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label for="txtPrimaryNumber" class="label-style">Primary Phone </label>
                                            </div>
                                            <div class="form-group  col-md-6">
                                                <asp:TextBox ID="txtPrimaryNumber" class="form-control" Style="background-color: whitesmoke;" runat="server"></asp:TextBox>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label for="txtSecondaryNumber" class="label-style">Secondary Phone </label>
                                            </div>
                                            <div class="form-group  col-md-6">
                                                <asp:TextBox ID="txtSecondaryNumber" class="form-control" Style="background-color: whitesmoke;" runat="server"></asp:TextBox>
                                            </div>

                                        </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="drpContact" EventName="SelectedIndexChanged" />

                                </Triggers>

                            </asp:UpdatePanel>
                        </div>
                    </div>
                </div>

                <div class="card-footer">
                    <div class="row">
                        <div class="col-md-3 mx-auto d-flex justify-content-center Spacing">
                            <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn  btn-block" Style="background-color: #fb9678; color: #fff;" OnClick="Clear" />
                        </div>
                        <div class="col-md-9 mx-auto d-flex justify-content-center Spacing">
                            <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-success btn-block" OnClick="SubmitProgram" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- end accordion -->
    <!-- end container -->
</asp:Content>
