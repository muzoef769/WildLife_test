<%@ Page Title="Add Program" Language="C#" MasterPageFile="~/VolunteerMasterPage.master" AutoEventWireup="true" CodeFile="VolunteerAddProgram.aspx.cs" Inherits="VolunteerAddProgram" %>



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
                    <asp:Label ID="lblMileage1" runat="server" Text="Mileage Cost"></asp:Label>
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

            <div class="card">
                <div class="card-body">

                    <div class=" ">
                        <ul class="nav nav-tabs  col-xl-12 col-lg-12 col-md-12 col-s-12 " id="myTab" style="padding-left: 15px; border-bottom: none;" role="tablist">

                            <li class="nav-item ">
                                <a style="margin-right: 5px; color: black;" class="nav-link active" id="organization-tab" data-toggle="tab" href="#OrganizationInformation" role="tab" aria-controls="org" aria-selected="true">Organization Information</a>
                            </li>
                            <li class="nav-item ">
                                <a style="margin-right: 5px; color: black;" class="nav-link" id="program-tab" data-toggle="tab" href="#ProgramInformation" role="tab" aria-controls="program" aria-selected="false">Program Information</a>
                            </li>
                            <li class="nav-item ">
                                <a style="margin-right: 5px; color: black;" class="nav-link" id="more-tab" data-toggle="tab" href="#MoreInformation" role="tab" aria-controls="more" aria-selected="false">More Information</a>
                            </li>
                            <li class="nav-item ">
                                <a style="margin-right: 5px; color: black;" class="nav-link" id="animal-tab" data-toggle="tab" href="#AnimalInformation" role="tab" aria-controls="animal" aria-selected="false">Animal Information</a>
                            </li>
                            <asp:UpdatePanel runat="server" ID="UpdatePanelTabs" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <li class="nav-item " id="locationtab" runat="server">
                                        <a style="margin-right: 5px; color: black;" class="nav-link" id="location-tab" data-toggle="tab" href="#ProgramLocation" role="tab" aria-controls="location" aria-selected="false">Program Location</a>
                                    </li>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="drpProgramType" EventName="SelectedIndexChanged" />
                                    <asp:AsyncPostBackTrigger ControlID="drpLocationTypeList" EventName="SelectedIndexChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </ul>
                    </div>

                    <div class="tab-content ">
                        <div id="OrganizationInformation" class="tab-pane fade show active">
                            <div class="card-body">
                                <div class="row mx-auto">
                                    <div class="col-md-4">
                                        <asp:Label ID="lblInvoice" runat="server" Text="Invoice Number"></asp:Label>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <asp:TextBox ID="txtInvoice" runat="server" class="form-control" Style="background-color: whitesmoke;"></asp:TextBox>
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                                        runat="server" ControlToValidate="txtInvoice"
                                        ErrorMessage="*" ForeColor="Red" ValidationGroup="addProgram">
                                    </asp:RequiredFieldValidator>
                                </div>

                                <div class="row mx-auto">
                                    <div class="col-md-4">
                                        <asp:Label ID="lblOrganization" runat="server" Text="Organization"></asp:Label>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <asp:DropDownList ID="drpOrganizationList" runat="server" CssClass="form-control" Style="background-color: whitesmoke;" AppendDataBoundItems="True" DataSourceID="SqlDataSource3"
                                            DataTextField="OrganizationName" DataValueField="OrganizationID" AutoPostBack="true" OnSelectedIndexChanged="DrpOrganizationList_IndexChanged">
                                            <asp:ListItem Text="Select Organization"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:connString %>" SelectCommand="SELECT OrganizationName, OrganizationID FROM Organization"></asp:SqlDataSource>
                                        <asp:RequiredFieldValidator ID="orgValidator"
                                            runat="server" ControlToValidate="drpOrganizationList"
                                            InitialValue="0" ErrorMessage="*" ForeColor="Red"
                                            ValidationGroup="addProgram">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="row mx-auto">
                                    <div class="col-md-4">
                                        <asp:Label ID="lblContact" runat="server" Text="Contact"></asp:Label>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <asp:UpdatePanel runat="server" ID="clientPanel">
                                            <ContentTemplate>
                                                <asp:DropDownList ID="drpContact" runat="server" CssClass="form-control"
                                                    Style="background-color: whitesmoke;"
                                                    OnSelectedIndexChanged="DrpContact_SelectedIndexChanged"
                                                    AutoPostBack="true">
                                                    <asp:ListItem>Select Contact</asp:ListItem>
                                                </asp:DropDownList>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="drpOrganizationList" EventName="SelectedIndexChanged" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </div>
                                </div>

                                <asp:UpdatePanel ID="UpdatePanel12" runat="server" UpdateMode="Always">
                                    <ContentTemplate>
                                        <div class="row mx-auto">
                                            <div class="col-md-4">
                                                <asp:Label ID="lblFirstName" runat="server" Text="First Name"></asp:Label>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <asp:TextBox ID="txtFirstName" runat="server" class="form-control" Style="background-color: whitesmoke;"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="row mx-auto">
                                            <div class="col-md-4">
                                                <asp:Label ID="lblLastName" runat="server" Text="Last Name"></asp:Label>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <asp:TextBox ID="txtLastName" runat="server" class="form-control" Style="background-color: whitesmoke;"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row mx-auto">
                                            <div class="col-md-4">
                                                <asp:Label ID="lblEmail" runat="server" Text="Email Address"></asp:Label>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" class="form-control" Style="background-color: whitesmoke;"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="row mx-auto">
                                            <div class="col-md-4">
                                                <asp:Label ID="lblPrimaryPhone" runat="server" Text="Primary Phone Number"></asp:Label>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <asp:TextBox ID="txtPrimaryPhone" runat="server" TextMode="Phone" class="form-control" Style="background-color: whitesmoke;"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row mx-auto">
                                            <div class="col-md-4">
                                                <asp:Label ID="lblSecondaryPhone" runat="server" Text="Secondary Phone Number"></asp:Label>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <asp:TextBox ID="txtSecondaryPhone" runat="server" TextMode="Phone" class="form-control" Style="background-color: whitesmoke;"></asp:TextBox>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="drpContact" EventName="SelectedIndexChanged" />
                                    </Triggers>
                                </asp:UpdatePanel>

                                <%-- START Button Group - Back/Next Tab--%>
                                <div class="row mx-auto">
                                    <div class="btn-group col-md-4">
                                    </div>
                                    <div class="btn-group col-md-4">
                                        <asp:Button ID="btnNext1" runat="server" Text="Next" CssClass="btn btn-primary btn-md btn-block" />
                                    </div>
                                </div>
                                <%-- END Button Group - Back/Next Tab--%>
                            </div>
                        </div>

                        <div id="ProgramInformation" class="tab-pane fade">
                            <div class="card-body">
                                <div class="row mx-auto">
                                    <div class="col-md-4">
                                        <asp:Label ID="lblProgramType" runat="server" Text="Program Type"></asp:Label>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <asp:DropDownList ID="drpProgramType" runat="server" CssClass="form-control" Style="background-color: whitesmoke;"
                                            OnSelectedIndexChanged="drpProgramType_SelectedIndexChanged" AutoPostBack="true">
                                            <asp:ListItem>Select Program Type</asp:ListItem>
                                            <asp:ListItem>Live</asp:ListItem>
                                            <asp:ListItem>Online</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <div class="row mx-auto">
                                            <div class="col-md-4">
                                                <asp:Label ID="lblProgramName" runat="server" Text="Program Name"></asp:Label>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <asp:DropDownList ID="drpProgramList" runat="server" CssClass="form-control"
                                                    Style="background-color: whitesmoke;"
                                                    OnSelectedIndexChanged="drpProgramList_SelectedIndexChanged"
                                                    AutoPostBack="true">
                                                    <asp:ListItem>Select Program Name</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="drpProgramType" EventName="SelectedIndexChanged" />
                                    </Triggers>
                                </asp:UpdatePanel>

                                <asp:UpdatePanel ID="UpdatedPanel12" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <div class="row mx-auto">
                                            <div class="col-md-4">
                                                <asp:Label ID="lblDate" runat="server" Text="Program Date"></asp:Label>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <asp:TextBox ID="txtProgramDate" runat="server" TextMode="Date" CssClass="form-control" Style="background-color: whitesmoke;"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row mx-auto">
                                            <div class="col-md-4">
                                                <asp:Label ID="lblProgramTime" runat="server" Text="Program Time"></asp:Label>
                                            </div>
                                            <div class=" form-group col-md-4">
                                                <asp:TextBox ID="txtProgramTime" runat="server" TextMode="Time" CssClass="form-control" Style="background-color: whitesmoke;"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="row mx-auto">
                                            <div class="col-md-4">
                                                <asp:Label ID="lblLocationType" runat="server" Text="Location Type"></asp:Label>
                                            </div>
                                            <div class=" form-group col-md-4">
                                                <asp:DropDownList ID="drpLocationTypeList" runat="server" CssClass="form-control" Style="background-color: whitesmoke;"
                                                    OnSelectedIndexChanged="drpLocationTypeList_SelectedIndexChanged" AutoPostBack="true">
                                                    <asp:ListItem>Select Location Type</asp:ListItem>
                                                    <asp:ListItem>OnSite</asp:ListItem>
                                                    <asp:ListItem>OffSite</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>

                                        <div class="row mx-auto">
                                            <div class="col-md-4">
                                                <asp:Label ID="lblMileage" runat="server" Text="Mileage"></asp:Label>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <asp:TextBox ID="txtMileage" runat="server" CssClass="form-control" Style="background-color: whitesmoke;"></asp:TextBox>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="drpProgramType" EventName="SelectedIndexChanged" />
                                        <asp:AsyncPostBackTrigger ControlID="drpProgramList" EventName="SelectedIndexChanged" />
                                        <asp:AsyncPostBackTrigger ControlID="drpLocationTypeList" EventName="SelectedIndexChanged" />
                                    </Triggers>
                                </asp:UpdatePanel>


                                <%-- START Button Group - Back/Next Tab--%>
                                <div class="row mx-auto">
                                    <div class="btn-group col-md-4">
                                        <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btn btn-primary btn-md btn-block" />
                                    </div>
                                    <div class="btn-group col-md-4">
                                    </div>
                                    <div class="btn-group col-md-4">
                                        <asp:Button ID="btnNext2" runat="server" Text="Next" CssClass="btn btn-primary btn-md btn-block" />
                                    </div>
                                </div>
                                <%-- END Button Group - Back/Next Tab--%>
                            </div>
                        </div>

                        <div id="MoreInformation" class="tab-pane fade">
                            <div class="card-body">
                                <div class="row mx-auto">
                                    <div class="col-md-4">
                                        <asp:Label ID="lblEducators" runat="server" Text="Select Educator"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="border" style="overflow-y: scroll; width: 100%; height: 200px">
                                            <asp:CheckBoxList ID="CheckBoxList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="name" DataValueField="UserID"></asp:CheckBoxList>
                                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:connString %>" SelectCommand="SELECT UserID, CONCAT(FirstName, ' ', LastName) as name FROM [User] "></asp:SqlDataSource>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mx-auto">
                                    <div class="col-md-4">
                                        <asp:Label ID="lblGrade" runat="server" Text="Select Grade"></asp:Label>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <asp:DropDownList ID="drpAgeLevel" class="form-control" Style="background-color: whitesmoke;" runat="server">
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
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row mx-auto">
                                    <div class="col-md-4">
                                        <asp:Label ID="lblAdult" runat="server" Text="Adult(s)"></asp:Label>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <asp:TextBox ID="txtAdult" runat="server" CssClass="form-control" Style="background-color: whitesmoke;"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row mx-auto">
                                    <div class="col-md-4">
                                        <asp:Label ID="lblKid" runat="server" Text="Kid(s)"></asp:Label>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <asp:TextBox ID="txtKid" runat="server" CssClass="form-control" Style="background-color: whitesmoke;"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row mx-auto">
                                    <div class="col-md-4">
                                        <asp:Label ID="lblNotes" runat="server" Text="Notes"></asp:Label>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <asp:TextBox ID="txtNotes" runat="server" TextMode="MultiLine" Cssstyle="form-control" Style="resize: inherit; min-height: 150px; min-width: 100%;"></asp:TextBox>
                                    </div>
                                </div>
                                <%-- START Button Group - Back/Next Tab--%>
                                <div class="row mx-auto">
                                    <div class="btn-group col-md-4">
                                        <asp:Button ID="btnBack3" runat="server" Text="Back" CssClass="btn btn-primary btn-md btn-block" />
                                    </div>
                                    <div class="btn-group col-md-4">
                                        <asp:Button ID="btnNext3" runat="server" Text="Next" CssClass="btn btn-primary btn-md btn-block" />
                                    </div>
                                </div>
                                <%-- END Button Group - Back/Next Tab--%>
                            </div>
                        </div>

                        <div id="AnimalInformation" class="tab-pane fade">
                            <div class="card-body">
                                <div class="row mx-auto">
                                    <div class="col-md-4">
                                        <asp:Label ID="lblBird" runat="server" Text="Birds"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblMammal" runat="server" Text="Mammals"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblReptile" runat="server" Text="Reptiles"></asp:Label>
                                    </div>

                                </div>
                                <div class="row mx-auto">
                                    <div class="col-md-4">
                                        <asp:UpdatePanel ID="UpdateBirds" runat="server">
                                            <ContentTemplate>
                                                <div class="border" style="overflow-y: scroll; width: 100px; height: 200px">

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

                                    <div class="col-md-4">
                                        <asp:UpdatePanel ID="UpdateMammals" runat="server">
                                            <ContentTemplate>
                                                <div class="border" style="overflow-y: scroll; width: 100px; height: 200px">
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

                                    <div class="col-md-4">
                                        <asp:UpdatePanel ID="UpdateReptiles" runat="server">
                                            <ContentTemplate>
                                                <div class="border" style="overflow-y: scroll; width: 100px; height: 200px">
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
                                </div>
                                <br />
                                <%-- START Button Group - Back/Next Tab--%>
                                <div class="row mx-auto">
                                    <div class="btn-group col-md-4">
                                        <asp:Button ID="btnBack4" runat="server" Text="Back" CssClass="btn btn-primary btn-md btn-block" />
                                    </div>

                                    <div class="btn-group col-md-4">
                                        <asp:Button ID="btnNext4" runat="server" Text="Next" CssClass="btn btn-primary btn-md btn-block" />
                                    </div>
                                </div>
                                <%-- END Button Group - Back/Next Tab--%>
                            </div>
                        </div>

                        <div id="ProgramLocation" class="tab-pane fade">
                            <div class="card-body">
                                <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
                                    <ContentTemplate>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <asp:CheckBox ID="chkLocation" runat="server" Text="Select if event is at Organization" CssClass="label-style " AutoPostBack="true" OnCheckedChanged="chkLocation_CheckedChanged" />
                                            </div>
                                        </div>
                                        <div class="row mx-auto">
                                            <div class="col-md-4">
                                                <asp:Label ID="lblStreet" runat="server" Text="Street"></asp:Label>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <asp:TextBox ID="txtStreet" runat="server" class="form-control" Style="background-color: whitesmoke;"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="row mx-auto">
                                            <div class="col-md-4">
                                                <asp:Label ID="lblCity" runat="server" Text="City"></asp:Label>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <asp:TextBox ID="txtCity" runat="server" class="form-control" Style="background-color: whitesmoke;"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="row mx-auto">
                                            <div class="col-md-4">
                                                <asp:Label ID="lblState" runat="server" Text="State"></asp:Label>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <asp:DropDownList ID="drpState" runat="server" class="form-control" Style="background-color: whitesmoke;">
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
                                        <div class="row mx-auto">
                                            <div class="col-md-4">
                                                <asp:Label ID="lblCounty" runat="server" Text="County"></asp:Label>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <asp:TextBox ID="txtCounty" runat="server" class="form-control" Style="background-color: whitesmoke;"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row mx-auto">
                                            <div class="col-md-4">
                                                <asp:Label ID="lblCountry" runat="server" Text="Country"></asp:Label>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <asp:DropDownList ID="drpCountry" runat="server" class="form-control" Style="background-color: whitesmoke;">
                                                    <asp:ListItem>United States</asp:ListItem>
                                                    <asp:ListItem>Canada</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>

                                        <div class="row mx-auto">
                                            <div class="col-md-4">
                                                <asp:Label ID="lblZipCode" runat="server" Text="Zipcode"></asp:Label>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <asp:TextBox ID="txtZipCode" runat="server" class="form-control" Style="background-color: whitesmoke;"></asp:TextBox>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="drpContact" />
                                    </Triggers>
                                </asp:UpdatePanel>

                                <%-- START Button Group - Back/Next Tab--%>
                                <div class="row mx-auto">
                                    <div class="btn-group col-md-4">
                                        <asp:Button ID="btnBack5" runat="server" Text="Back" CssClass="btn btn-primary btn-md btn-block" />
                                    </div>
                                    <div class="btn-group col-md-4">
                                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary btn-md btn-block" />
                                    </div>
                                </div>
                                <%-- END Button Group - Back/Next Tab--%>
                            </div>
                        </div>
                    </div>
                    <div class="btn-group col-md-4">
                        <asp:Button ID="btnSubmit1" runat="server" Text="Submit Program" CssClass="btn btn-primary btn-md btn-block" OnClick="SubmitProgram" />
                    </div>

                </div>
            </div>
        </div>
    </div>
</asp:Content>
