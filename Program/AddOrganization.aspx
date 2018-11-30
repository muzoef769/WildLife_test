<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="AddOrganization.aspx.cs" Inherits="AddOrganization" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">

    <asp:ScriptManager runat="server"></asp:ScriptManager>

    <script>
        $(document).ready(function () {
            $("#home").removeClass('active');
            $("#org").addClass('active');

        });
    </script>


    <%--Beginning container--%>

    <div class="card-body">
        <h3 class="box-title">Add Organization Info</h3>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">

                    <div class=" ">
                        <script type="text/javascript">
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
                        <ul class="nav nav-tabs  col-xl-12 col-lg-12 col-md-12 col-s-12 " id="myTab" style="padding-left: 15px; border-bottom: none;" role="tablist">
                            <li class="nav-item ">
                                <a style="margin-right: 5px; color: black;" class="nav-link active " id="homee-tab" data-toggle="tab" href="#Address" role="tab" aria-controls="homee" aria-selected="true">Address</a>
                            </li>
                            <li class="nav-item ">
                                <a style="margin-right: 5px; color: black;" class="nav-link " id="profile-tab" data-toggle="tab" href="#Contact" role="tab" aria-controls="profile" aria-selected="false">Contact Info</a>
                            </li>
                        </ul>
                        <br />

                    </div>
                    <br />

                    <div class="row" style="margin-left: 5px;">
                        <div class="col-md-5">
                            <label class="label-style font-weight-bold">Organization Name</label>
                        </div>
                        <div class="form-group col-md-6">

                            <asp:TextBox ID="txtOrgName" runat="server" class="form-control" Style="background-color: whitesmoke; margin-left: -8px;"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="OrgValidator" runat="server" ControlToValidate="txtOrgName" ErrorMessage="*" ForeColor="Red" ValidationGroup="addOrg"></asp:RequiredFieldValidator>

                    </div>
                    <hr />
                    <div class="tab-content ">
                        <div id="Address" class="tab-pane fade show active ">
                            <div class="">
                                <div class="card-body">



                                    <div class="row">
                                        <div class="col-md-5">
                                            <label for="txtStreet" class="label-style">Organization Address</label>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <asp:TextBox ID="txtStreet" runat="server" class="form-control" Style="background-color: whitesmoke;"></asp:TextBox>

                                        </div>
                                        <asp:RequiredFieldValidator ID="streetValidator" runat="server" ControlToValidate="txtStreet" ErrorMessage="*" ForeColor="Red" ValidationGroup="addOrg"></asp:RequiredFieldValidator>

                                    </div>


                                    <div class="row">
                                        <div class="col-md-5">
                                            <label for="dropCountry" class="label-style">Country</label>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <asp:DropDownList ID="drpCountry" runat="server" CssClass="btn  dropdown-toggle" Style="background-color: whitesmoke;">
                                                <asp:ListItem>United States</asp:ListItem>
                                                <asp:ListItem>Canada</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>



                                    <div class="row">
                                        <div class="col-md-5">
                                            <label for="txtState" class="label-style">State</label>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <asp:DropDownList ID="drpState" runat="server" CssClass="btn  dropdown-toggle" Style="background-color: whitesmoke;">
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
                                        <div class="col-md-5">
                                            <label for="txtCity" class="label-style">City</label>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <asp:TextBox ID="txtCity" runat="server" class="form-control" Style="background-color: whitesmoke;"></asp:TextBox>

                                        </div>
                                        <asp:RequiredFieldValidator ID="OrgCityValidator" runat="server" ControlToValidate="txtCity" ErrorMessage="*" ForeColor="Red" ValidationGroup="addOrg"></asp:RequiredFieldValidator>

                                    </div>

                                    <div class="row">
                                        <div class="col-md-5">
                                            <label for="txtCounty" class="label-style">County</label>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <asp:TextBox ID="txtCounty" runat="server" class="form-control" Style="background-color: whitesmoke;"></asp:TextBox>

                                        </div>
                                        <asp:RequiredFieldValidator ID="OrgCountyValidator" runat="server" ControlToValidate="txtCounty" ErrorMessage="*" ForeColor="Red" ValidationGroup="addOrg"></asp:RequiredFieldValidator>

                                    </div>

                                    <div class="row">
                                        <div class="col-md-5">
                                            <label for="txtZipCode" class="label-style">Zip Code</label>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <asp:TextBox ID="txtZipCode" runat="server" class="form-control" Style="background-color: whitesmoke;"></asp:TextBox>

                                        </div>
                                        <asp:RequiredFieldValidator ID="OrgZipValidator" runat="server" ControlToValidate="txtZipCode" ErrorMessage="*" ForeColor="Red" ValidationGroup="addOrg"></asp:RequiredFieldValidator>

                                    </div>
                                    <br />
                                    <div class="row">
                                        <div class="form-group col-12">
                                            <button id="btnReturn" type="button" class="btn btn-success btn-block" style="color: white;" onclick="javascript:history.go(-1)">Return</button>
                                        </div>
                                        <%--                                                        <div class="col-md-6 text-right mx-auto Spacing">
                                                            <button id="btnNext" type="button" class="btn btn-success" style="color: white;">Next</button>
                                                        </div>--%>
                                    </div>



                                </div>

                            </div>
                        </div>
                        <div id="Contact" class="tab-pane fade">
                            <div class="card-body">


                                <%--  <div class="container-fluid" style="padding-top: 0px;">--%>

                                <%-- <div class="row">
                                    <div class="col-md-6 text-center mx-auto">

                                        <br />
                                    </div>
                                </div>--%>

                                <div class="row">
                                    <div class="col-md-5">
                                        <label for="txtFirstName" class="label-style">First Name</label>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <asp:TextBox ID="txtFirstName" runat="server" class="form-control" Style="background-color: whitesmoke;"></asp:TextBox>

                                    </div>
                                    <asp:RequiredFieldValidator ID="conFirstValidator" runat="server" ControlToValidate="txtFirstName" ErrorMessage="*" ForeColor="Red" ValidationGroup="addOrg"></asp:RequiredFieldValidator>

                                </div>

                                <div class="row">
                                    <div class="col-md-5">
                                        <label for="txtLastName" class="label-style">Last Name</label>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <asp:TextBox ID="txtLastName" runat="server" class="form-control" Style="background-color: whitesmoke;"></asp:TextBox>

                                    </div>
                                    <asp:RequiredFieldValidator ID="conLastValidator" runat="server" ControlToValidate="txtLastName" ErrorMessage="*" ForeColor="Red" ValidationGroup="addOrg"></asp:RequiredFieldValidator>

                                </div>

                                <div class="row">
                                    <div class="col-md-5">
                                        <label for="txtEmail" class="label-style">Email</label>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <asp:TextBox ID="txtEmail" runat="server" class="form-control" Style="background-color: whitesmoke;"></asp:TextBox>

                                    </div>
                                    <asp:RequiredFieldValidator ID="conEmailValidator" runat="server" ControlToValidate="txtEmail" ErrorMessage="*" ForeColor="Red" ValidationGroup="addOrg"></asp:RequiredFieldValidator>

                                </div>

                                <div class="row">
                                    <div class="col-md-5">
                                        <label for="txtPrimaryPhone" class="label-style">Primary Phone</label>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <asp:TextBox ID="txtPrimaryPhone" runat="server" class="form-control" Style="background-color: whitesmoke;"></asp:TextBox>

                                    </div>
                                    <asp:RequiredFieldValidator ID="conPrimaryValidator" runat="server" ControlToValidate="txtPrimaryPhone" ErrorMessage="*" ForeColor="Red" ValidationGroup="addOrg"></asp:RequiredFieldValidator>

                                </div>

                                <div class="row">
                                    <div class="col-md-5">
                                        <label for="txtSecondaryPhone" class="label-style">Secondary Phone</label>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <asp:TextBox ID="txtSecondaryPhone" runat="server" class="form-control" Style="background-color: whitesmoke;"></asp:TextBox>
                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="form-group col-12">
                                        <asp:Button ID="btnAddOrganization" runat="server" Text="Add Organization" Style="color: white;" CssClass=" btn btn-block btn-success" OnClick="btnAddOrganization_Click" CausesValidation="true" ValidationGroup="addOrg" />
                                    </div>

                                    <%--</div>--%>
                                </div>
                            </div>


                        </div>
                    </div>


                </div>
                <!-- /# column -->
            </div>
            <!--  /Traffic -->
            <div class="clearfix"></div>
            <!-- Orders -->


            <!-- /.orders -->
            <!-- To Do and Live Chat -->



            <!-- /To Do and Live Chat -->
            <!-- Calender Chart Weather  -->



            <!-- /Calender Chart Weather -->
            <!-- Modal - Calendar - Add New Event -->


            <!-- /#event-modal -->
            <!-- Modal - Calendar - Add Category -->


            <!-- /#add-category -->
        </div>
        <!-- .animated -->
    </div>
    
    
    <div class="clearfix"></div>
    <!-- Footer -->




    <!--Local Stuff-->




    <div class="modal" id="ProgramDetailsModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content" style="width: 100% !important;">
                <div class="modal-header" style="background-color: whitesmoke">
                    <h5 class="modal-title"></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body p-4" id="resultPrograms" style="background-color: #ffffff">

                    <div class=" ">
                        <div class="row d-flex justify-content-center ">

                            <div class="col-xl-6 col-lg-12 text-left col-md-12 col-s-12 Spacing">
                                <label><b>Animals Involved</b> </label>
                                <asp:GridView ID="GridView2" runat="server" Visible="True" Class="table table-condensed table-bordered table-hover" BackColor="White" RowStyle-CssClass="data-row">

                                    <HeaderStyle ForeColor="Black" BackColor="#339933"></HeaderStyle>
                                </asp:GridView>
                            </div>


                            <script type="text/javascript">
                                function openModal() {
                                    $('#ProgramDetailsModal').modal('show');
                                }
                            </script>

                            <div class="col-xl-6 col-lg-12  col-md-12 col-s-12 Spacing">
                                <div class="col-md-4  ">
                                    <label><b>Notes </b></label>
                                    <br />
                                    <textarea runat="server" cols="23" rows="10"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer" style="background-color: whitesmoke">
                    <button type="button" class="btn btn-success " data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>


    <div class="modal" id="AddModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog " role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Add Animal</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body p-4" id="resultAdd">



                    <div class="row  ">

                        <div class=" col-md-8">
                            <h4>Animal Status: </h4>
                            <asp:DropDownList ID="ddlAddStatus" runat="server" CssClass="form-control-plaintext attributeDropDown" AutoCompleteType="Disabled">
                                <asp:ListItem>Active</asp:ListItem>
                                <asp:ListItem>Inactive</asp:ListItem>
                                <asp:ListItem>Temporarily Inactive</asp:ListItem>
                            </asp:DropDownList>
                            <h4>Type: </h4>
                            <asp:DropDownList ID="ddlAddType" runat="server" CssClass="form-control-plaintext attributeDropDown" AutoCompleteType="Disabled">
                                <asp:ListItem>Bird</asp:ListItem>
                                <asp:ListItem>Mammal</asp:ListItem>
                                <asp:ListItem>Reptile</asp:ListItem>
                            </asp:DropDownList>
                            <h4>Name: </h4>
                            <asp:TextBox ID="txtAddName" runat="server" CssClass="form-control" AutoCompleteType="Disabled" ReadOnly="False"></asp:TextBox>
                            <h4>Add Image: </h4>
                            <asp:FileUpload ID="FileUpload1" runat="server" />
                            <br>
                        </div>
                        <!-- End  Description -->


                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(function () {

            $('#btnNext').click(function (e) {
                e.preventDefault();
                $('#myTab a[href="#Contact"]').tab('show');
            })

        })
    </script>


</asp:Content>

