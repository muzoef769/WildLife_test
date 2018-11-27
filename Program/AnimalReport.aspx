<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="AnimalReport.aspx.cs" Inherits="AnimalReport" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <script>
        $(document).ready(function () {
            
            $("#report").addClass('active');
            

        });
    </script>


        <!-- Left Panel -->
        <%--<aside id="left-panel" class="left-panel">
        <nav class="navbar navbar-expand-sm navbar-default">
            <div id="main-menu" class="main-menu collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li class="">
                        <a href="Home.aspx"><i class="menu-icon fa fa-laptop"></i>Home</a>
                    </li>
                     <li class="menu-item-has-children dropdown active">
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
                     <li class="">
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
                        <asp:Button ID="btnLogOut" runat="server"  Text="Logout" ForeColor="#fb9678" CssClass="btn btn-link" OnClick="btnLogOut_Click"/>
                    
                    </li>

                        </ul>
                         
                        </div>
                    </div>

                  

                </div>
            </div>
        </header>--%>
        <!-- /#header -->
        <!-- Content -->
       



                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">General Animal Report</h5>
                                <p>
                                    Detailed report of all animals and their associated information
                                </p>
                                <%-- <asp:TextBox ID="txtStartDate" runat="server" Cssclass="form-control" TextMode="Date"></asp:TextBox>--%>
                                <br />
                                <br />
                                <br />
                                <asp:Button ID="btnSearchByDate" runat="server"
                                    CssClass="btn btn-success"
                                    UseSubmitBehavior="false"
                                    CauseValidation="true"
                                    Text="Generate Report"
                                    OnClick="SearchByDate" />
                            </div>

                        </div>
                    </div>

                    <div class="col-lg-6 col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Animal Type Report</h5>
                                <p>
                                    Detailed report of all animals by Animal Type
                                </p>

                                <br />
                                <asp:DropDownList ID="drpAnimalTypeReport" runat="server" CssClass="form-control-sm ">
                                    <asp:ListItem>Bird</asp:ListItem>
                                    <asp:ListItem>Mammal</asp:ListItem>
                                    <asp:ListItem>Reptile</asp:ListItem>
                                </asp:DropDownList>
                                <br />
                                <br />

                                <asp:Button ID="Button1" runat="server"
                                    CssClass="btn btn-success"
                                    UseSubmitBehavior="false"
                                    CauseValidation="true"
                                    Text="Generate Report"
                                    OnClick="AnimalType" />
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-6 col-md-6">
                        <div class="card">
                            <div class="card-body ">
                                <h5 class="card-title">Monthly Animal Report</h5>
                                <p>
                                    Monthly Animal Report displays all birds, mammals,
                            and reptiles that participated in a program for
                            the selected month.
                                </p>
                                <asp:DropDownList ID="drpMonthList" runat="server" CssClass="form-control-sm">
                                    <asp:ListItem Value="1">January</asp:ListItem>
                                    <asp:ListItem Value="2">February</asp:ListItem>
                                    <asp:ListItem Value="3">March</asp:ListItem>
                                    <asp:ListItem Value="4">April</asp:ListItem>
                                    <asp:ListItem Value="5">May</asp:ListItem>
                                    <asp:ListItem Value="6">June</asp:ListItem>
                                    <asp:ListItem Value="7">July</asp:ListItem>
                                    <asp:ListItem Value="8">August</asp:ListItem>
                                    <asp:ListItem Value="9">September</asp:ListItem>
                                    <asp:ListItem Value="10">October</asp:ListItem>
                                    <asp:ListItem Value="11">November</asp:ListItem>
                                    <asp:ListItem Value="12">December</asp:ListItem>
                                </asp:DropDownList>
                                <br />
                                <br />
                                <asp:Button ID="btnGenerateMonthReport" runat="server"
                                    CssClass="btn btn-success"
                                    UseSubmitBehavior="false"
                                    CauseValidation="true"
                                    Text="Generate Report"
                                    OnClick="generateMonthReport" />
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-6 col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Annual Animal Report</h5>
                                <p>
                                    Annual Animal Report displays all birds, mammals,
                            and reptiles that participated in a program for
                            the selected year.
                                </p>
                                <asp:DropDownList ID="drpYearList" runat="server" CssClass="form-control-sm ">
                                    <asp:ListItem>2015</asp:ListItem>
                                    <asp:ListItem>2016</asp:ListItem>
                                    <asp:ListItem>2017</asp:ListItem>
                                    <asp:ListItem>2018</asp:ListItem>
                                </asp:DropDownList>
                                <br />
                                <br />
                                <asp:Button ID="btnGenerateAnnualReport" runat="server"
                                    CssClass="btn btn-success"
                                    UseSubmitBehavior="false"
                                    CauseValidation="true"
                                    Text="Generate Report"
                                    OnClick="generateAnnualReport"
                                    href="#" />
                            </div>
                        </div>
                    </div>


                </div>
                <!-- /Widgets -->
                <!--  Traffic  -->
                <div class="card-body">
                    <h4 class="box-title">View Animal Info </h4>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">

                                <div class=" ">

                                    <div class=" mx-auto  ">
                                        <div class="card-body align-content-center">
                                            <div class="row align-content-center">
                                            </div>
                                            <div class="mx-auto table-responsive">
                                                <div class="row mx-auto ">
                                                    <div class="col-xl-12 col-lg-12 col-md-12 col-s-12 col-xs-12 ">
                                                        <div class="col-xl-12 col-lg-12 col-md-12 col-s-12 col-xs-12">
                                                            <asp:GridView ID="grdViewReport" Class=" table table-condensed table-bordered table-hover AnimalCard" runat="server">
                                                                <HeaderStyle ForeColor="#ffffff" BackColor="#00c292"></HeaderStyle>
                                                            </asp:GridView>
                                                        </div>
                                                    </div>
                                                </div>
                                                <br />
                                                <div class="row mx-auto">
                                                    <div class="col-12">
                                                        <asp:Button ID="btnExportToExcel"
                                                            runat="server"
                                                            Text="Export To Excel"
                                                            CssClass="btn btn-block mx-auto d-flex justify-content-center btn-success"
                                                            UseSubmitBehavior="false"
                                                            CauseValidation="true"
                                                            OnClick="ExportToExcel" />

                                                    </div>
                                                </div>
                                            </div>

                                            



                                        </div>
                                    </div>


                                </div>
                                <%--  <asp:Button ID="btnStatusUpdate" class="btn btn-success btn-block" runat="server" Text="Update Status" OnClick="btnStatusUpdate_Click" />--%>
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
       <%--     </div>
            <!-- .animated -->
        </div>
        <!-- /.content -->
        <div class="clearfix"></div>
        <!-- Footer -->
        <footer class="site-footer">
            <div class="footer-inner bg-white">
                <div class="row">
                    <div class="col-sm-6">
                        Wildlife Center of Virginia
                    </div>

                </div>
            </div>
        </footer>--%>
        <!-- /.site-footer -->
        <%--</div>--%>
        <!-- /#right-panel -->



        <!--Local Stuff-->


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
                        <div class="row">
                            <br>
                        </div>
                        <div class="row">

                            <div class="col-md-2">
                                <%-- <asp:Button ID="btnAddModal" runat="server" Text="Add" Class="btn btn-primary LoginButton FormButton" UseSubmitBehavior="false" OnClick="btnAddModal_Click"></asp:Button>
                                --%>
                            </div>



                        </div>

                    </div>
                    <div class="modal-footer">
                        <%--                    <button type="button" data-toggle="modal" data-target="#EditModal" class="btn btn-secondary" data-dismiss="modal">Edit</button>--%>
                    </div>
                </div>
            </div>
        </div>











</asp:Content>

