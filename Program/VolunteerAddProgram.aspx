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

            <div class="card">
                <div class="card-body">

                    <div class=" ">
                        <ul class="nav nav-tabs  col-xl-12 col-lg-12 col-md-12 col-s-12 " id="myTab" style="padding-left: 15px; border-bottom: none;" role="tablist">

                            <li class="nav-item ">
                                <a style="margin-right: 5px; color: black;" class="nav-link  " id="contact-tab" data-toggle="tab" href="#OrganizationInformation" role="tab" aria-controls="contact" aria-selected="true">Organization Information</a>
                            </li>
                            <li class="nav-item " id="locationtab" runat="server">
                                <a style="margin-right: 5px; color: black;" class="nav-link" id="location-tab" data-toggle="tab" href="#ProgramLocation" role="tab" aria-controls="location" aria-selected="false">Program Location</a>
                            </li>



                        </ul>
                    </div>

                    <div class="tab-content ">
                        <div id="ContactInformation" class="tab-pane fade show active">
                            <div class="card-body">
                                <div class="row mx-auto">
                                    <div class="col-md-6">
                                        <asp:Label ID="lblInvoice" runat="server" Text="Invoice Number"></asp:Label>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txtInvoice" runat="server" class="form-control" Style="background-color: whitesmoke;"></asp:TextBox>
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                                        runat="server" ControlToValidate="txtInvoice"
                                        ErrorMessage="*" ForeColor="Red" ValidationGroup="addProgram">
                                    </asp:RequiredFieldValidator>
                                </div>
                                <div class="row mx-auto">
                                    <div class="col-md-6">
                                        <asp:Label ID="lblOrganization" runat="server" Text="Organization"></asp:Label>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:DropDownList ID="drpOrganizationList" runat="server" CssClass="btn btn-default btn-sm dropdown-toggle" Style="background-color: whitesmoke;" AppendDataBoundItems="True" DataSourceID="SqlDataSource3"
                                            DataTextField="OrganizationName" DataValueField="OrganizationID"  AutoPostBack="true">

                                            <asp:ListItem Text="Select an Organization"></asp:ListItem>
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
                                    <div class="col-md-6">
                                        <asp:Label ID="lblContact" runat="server" Text="Contact"></asp:Label>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:DropDownList ID="drpContact" runat="server" CssClass="btn"
                                            Style="background-color: whitesmoke;" AutoPostBack="true"
                                            >
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <div class="row mx-auto">
                                    <div class="col-md-6">
                                        <asp:Label ID="lblFirstName" runat="server" Text="First Name"></asp:Label>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txtFirstName" runat="server" class="form-control" Style="background-color: whitesmoke;"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row mx-auto">
                                    <div class="col-md-6">
                                        <asp:Label ID="lblLastName" runat="server" Text="Last Name"></asp:Label>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txtLastName" runat="server" class="form-control" Style="background-color: whitesmoke;"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row mx-auto">
                                    <div class="col-md-6">
                                        <asp:Label ID="lblEmail" runat="server" Text="Email Address"></asp:Label>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txtEmail" runat="server" class="form-control" Style="background-color: whitesmoke;"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row mx-auto">
                                    <div class="col-md-6">
                                        <asp:Label ID="lblPrimaryPhone" runat="server" Text="Primary Phone Number"></asp:Label>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txtPrimaryPhone" runat="server" class="form-control" Style="background-color: whitesmoke;"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row mx-auto">
                                    <div class="col-md-6">
                                        <asp:Label ID="lblSecondaryPhone" runat="server" Text="Secondary Phone Number"></asp:Label>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txtSecondaryPhone" runat="server" class="form-control" Style="background-color: whitesmoke;"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="card-footer">
            <div class="row">
                <%--<div class="col-md-3 mx-auto d-flex justify-content-center Spacing">
                    <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn  btn-block" Style="background-color: #fb9678; color: #fff;" OnClick="Clear" />
                </div>
                <div class="col-md-9 mx-auto d-flex justify-content-center Spacing">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-success btn-block" OnClick="SubmitProgram" />
                </div>--%>
            </div>
        </div>
    </div>

    <!-- end accordion -->
    <!-- end container -->
</asp:Content>
