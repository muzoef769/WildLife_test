<%@ Page Title="Organizations" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="OrganizationView.aspx.cs" EnableEventValidation="false" Inherits="OrganizationView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">




    <!-- Left Panel -->
    <%--<aside id="left-panel" class="left-panel">
        <nav class="navbar navbar-expand-sm navbar-default">
            <div id="main-menu" class="main-menu collapse navbar-collapse">
                <ul class="nav navbar-nav" >
                    <li class="">
                        <a href="Home.aspx"><i class="menu-icon fa fa-laptop"></i>Home</a>
                    </li>
                     <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-bar-chart-o"></i>Reports</a>
                        <ul class="sub-menu children dropdown-menu">                           
                            <li><i class="fa fa-github-alt"></i><a href="AnimalReport.aspx">Animal Report</a></li>
                            <li><i class="fa fa-book"></i><a href="SimpleReport.aspx">Simple Report</a></li>
                            <li><i class="fa fa-dollar"></i><a href="PaymentReport.aspx">Payments Report</a></li>
                          
                        </ul>
                    </li>
                     <li class="">
                         <a class="" href="Animal.aspx"> <i class="menu-icon fa fa-github-alt"></i>Animals</a>
                    </li>
                   <li class="">
                        <a class="" href="Payment.aspx"><i class="menu-icon fa fa-dollar"></i>Payments</a>
                    </li>
                     <li class="">
                        <a class="" href="Program.aspx"><i class="menu-icon pe-7s-browser"></i>Programs</a>
                    </li>
                     <li class="active">
                        <a class="" href="OrganizationView.aspx"><i class="menu-icon pe-7s-id"></i>Organizations</a>
                    </li>
                    
                </ul>
            </div><!-- /.navbar-collapse -->
        </nav>
    </aside>
    <!-- /#left-panel -->
    <!-- Right Panel -->
    <div id="right-panel" class="right-panel">
        <!-- Header-->
        <header id="header" class="header">
            <div class="top-left">
                <div class="navbar-header">
                    <a id="menuToggle" class="menutoggle"><i class="fa fa-bars" style="margin-right: 10px; margin-left: -10px;"></i></a>
                   <a class="navbar-brand" href="Home.aspx">Wildlife Center of Virginia | <span style="color: #00c292;"> <%:Session["UserFullName"]%> </span></a>
           
                </div>
            </div>
            <div class="top-right">
                <div class="header-menu">
                    <div class="header-left">
                  
                        <div class="dropdown for-notification">
                            <ul style="list-style-type: none;">
                             <li class="nav-item">
                        <a class="nav-link" style="color: dimgrey;" href="#">Staff</a>
                    </li>
                                </ul>
                        </div>

                        <div class="dropdown for-notification">
                            
                                <ul style="list-style-type: none;">
                        <li class="nav-item">
                        <asp:Button ID="btnLogOut" runat="server"  Text="Logout" ForeColor="#fb9678" CssClass="btn btn-link" />
                    
                    </li>

                        </ul>
                         
                        </div>
                    </div>

                  

                </div>
            </div>
        </header>--%>
    <!-- /#header -->
    <!-- Content -->

    <!-- /Widgets -->
    <!--  Traffic  -->
    <div class="card-body">
        <h4 class="box-title">View Organization Info</h4>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">

                    <div class=" ml-auto d-flex justify-content-end row">

                        <asp:TextBox ID="txtSearchAll" Placeholder="Search by Organization Name" Style="margin-right: 5px;" class="form-control col-xl-3 col-lg-3 col-md-4 col-sm-6" runat="server" AutoPostBack="True"></asp:TextBox>
                        <asp:Button ID="btnSearchAll"
                            runat="server"
                            Text="Search"
                            CssClass="btn btn-success col-xl-1 col-lg-2 col-md-2 col-sm-2"
                            Style="margin-right: 5px;"
                            OnClick="btnSearchAll_Click" />
                        <%--                    <asp:Button
                        ID="btnSearchAll"
                        runat="server" 
                        CssClass="btn btn-success col-xl-1 col-lg-2 col-md-2 col-sm-2"
                        Text="Search"
                        Style="margin-right:5px;"
                        OnClick="btnSearchAll_Click"
                        role ="button"
                        AutoPostBack ="false"/>--%>
                        <asp:Button
                            ID="btnClearAll"
                            CssClass="btn col-xl-1 col-lg-2 col-md-2 col-sm-2"
                            runat="server"
                            Text="Clear"
                            Style="background-color: #fb9678; color: #fff; margin-right: 47px;"
                            OnClick="btnClearAll_Click" />


                    </div>
                    <br />
                    <div class="tab-content ">
                        <div class="">
                            <div class="">

                                <div class="row mx-auto d-flex justify-content-center table-responsive">
                                    <div class=" col-xl-12 col-lg-12 col-md-12 col-s-12 col-xs-12 ">


                                        <div class="row mx-auto ">
                                            <div class="col-xl-12 col-lg-12 col-md-12 col-s-12" style="cursor:pointer;">
                                                <asp:GridView ID="grdOrganizations" HeaderStyle-ForeColor="black" Class=" table table-condensed table-bordered table-hover AnimalCard" DataKeyNames="OrganizationID"
                                                    runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowSorting="True" RowStyle-CssClass="data-row" 
                                                    OnRowDataBound="grdOrganizations_RowDataBound" OnSelectedIndexChanged="grdOrganizations_SelectedIndexChanged" >

                                                    <Columns>
                                                        <asp:BoundField DataField="OrganizationName" HeaderText="Organization Name" SortExpression="OrganizationName" />
                                                        <asp:BoundField DataField="Street" HeaderText="Street" SortExpression="Street" />
                                                        <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                                                        <asp:BoundField DataField="County" HeaderText="County" SortExpression="County" />
                                                        <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" SortExpression="Name" />
                                                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                                                        <asp:BoundField DataField="PrimaryPhoneNumber" HeaderText="Primary Phone" SortExpression="PrimaryPhoneNumber" HeaderStyle-Width="200px" />
                                                        <asp:BoundField DataField="OrganizationID" HeaderText="OrganzationID" InsertVisible="False" ReadOnly="True" SortExpression="OrganizationID" Visible="false" />
                                                    </Columns>
                                                    <HeaderStyle ForeColor="#ffffff" BackColor="#00c292"></HeaderStyle>

                                                </asp:GridView>
                                            </div>




                                        </div>

                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connString %>" SelectCommand="SELECT Organization.OrganizationName, Address.Street, Address.State, Address.County, (Contact.FirstName + ' '+  Contact.LastName) AS Name, Contact.Email, Contact.PrimaryPhoneNumber, Organization.OrganizationID 
                                            FROM Address INNER JOIN Organization ON Address.AddressID = Organization.AddressID INNER JOIN Contact ON Organization.OrganizationID = Contact.OrganizationID"></asp:SqlDataSource>


                                    </div>
                                </div>
                            </div>
                        </div>



                    </div>
                </div>

                <div class="card-body"></div>
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

    <!-- /.content -->
    <div class="clearfix"></div>
    <!-- Footer -->

    <!-- /.site-footer -->
    <%--</div>--%>
    <!-- /#right-panel -->



    <!--Local Stuff-->


    <div class="modal" id="EditModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header" style="background-color: whitesmoke">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                    <h3 class="modal-title" style="font-family: 'Open Sans',sans-serif">Edit Organization</h3>

                </div>
                <div class="modal-body p-4 ml-4" id="resultedit">

                    <div class="row">

                        <div class="col-md-5">
                            <label for="txtEditOrg" class="label-style">Organization Name: </label>
                        </div>
                        <div class="form-group col-md-6">
                            <asp:TextBox ID="txtEditOrg" runat="server" CssClass="form-control border-dark border-secondary" Style="background-color: whitesmoke;" AutoCompleteType="Disabled" ReadOnly="False"></asp:TextBox>
                        </div>

                        <%--<div class="col-md-5">
                            <label for="ddlEditPrimary" class="label-style">Primary Contact: </label>
                        </div>
                        <div class="form-group col-md-6">
                            <asp:DropDownList ID="ddlEditPrimary" runat="server" CssClass="btn btn-block border-secondary" Style="background-color: whitesmoke;"
                                BorderStyle="solid" AutoCompleteType="Disabled">
                                
                            </asp:DropDownList>
                        </div>--%>


                        <div class="col-md-5">
                            <label for="txtEditStreet" class="label-style">Street: </label>
                        </div>
                        <div class="form-group col-md-6">
                            <asp:TextBox ID="txtEditStreet" runat="server" CssClass="form-control border-dark border-secondary" Style="background-color: whitesmoke;" AutoCompleteType="Disabled" ReadOnly="False"></asp:TextBox>
                        </div>


                        <div class="col-md-5">
                            <label for="txtEditCity" class="label-style">City: </label>
                        </div>
                        <div class="form-group col-md-6">
                            <asp:TextBox ID="txtEditCity" runat="server" CssClass="form-control border-dark border-secondary" Style="background-color: whitesmoke;" AutoCompleteType="Disabled" ReadOnly="False"></asp:TextBox>
                        </div>


                        <div class="col-md-5">
                            <label for="drpEditState" class="label-style">State: </label>
                        </div>
                        <div class="form-group col-md-6">
                            <asp:DropDownList ID="drpEditState" runat="server" CssClass="btn border border-dark dropdown-toggle" Style="background-color: whitesmoke;">
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


                        <div class="col-md-5">
                            <label for="txtEditCounty" class="label-style">County: </label>
                        </div>
                        <div class="form-group col-md-6">
                            <asp:TextBox ID="txtEditCounty" runat="server" CssClass="form-control border-dark border-secondary" Style="background-color: whitesmoke;" AutoCompleteType="Disabled" ReadOnly="False"></asp:TextBox>
                        </div>


                        <div class="col-md-5">
                            <label for="txtEditCountry" class="label-style">Country: </label>
                        </div>
                        <div class="form-group col-md-6">
                            <asp:TextBox ID="txtEditCountry" runat="server" CssClass="form-control border-dark border-secondary" Style="background-color: whitesmoke;" AutoCompleteType="Disabled" ReadOnly="False"></asp:TextBox>
                        </div>


                        <div class="col-md-5">
                            <label for="txtEditZip" class="label-style">Zip Code: </label>
                        </div>
                        <div class="form-group col-md-6">
                            <asp:TextBox ID="txtEditZip" runat="server" CssClass="form-control border-dark border-secondary" Style="background-color: whitesmoke;" AutoCompleteType="Disabled" ReadOnly="False"></asp:TextBox>
                        </div>

                        
                        

                       

                    </div>








                    <div class="row">
                        <br>
                    </div>
                    <div class="row">
                    </div>
                </div>
            <div class="modal-footer" style="background-color: whitesmoke">
                <div class="row">

                    <div class="col text-right">
                        <asp:Button ID="btnUpdate" runat="server" Text="Update" Class="btn btn-success FormButton" UseSubmitBehavior="false" OnClick="btnUpdate_Click" ></asp:Button>
                    </div>
                    <script type="text/javascript">
                                function openModal() {
                                    $('#EditModal').modal('show');
                                }
                        </script>


                </div>

            </div>






        </div>
    </div>
    </div>




</asp:Content>


