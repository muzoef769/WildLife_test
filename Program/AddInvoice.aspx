<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="AddInvoice.aspx.cs" Inherits="AddInvoice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>



<body>
    <!-- Left Panel -->
    <%--<aside id="left-panel" class="left-panel">
        <nav class="navbar navbar-expand-sm navbar-default">
            <div id="main-menu" class="main-menu collapse navbar-collapse">
                <ul class="nav navbar-nav">
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
        
                <!-- /Widgets -->
                <!--  Traffic  -->
                <div class="card-body">
                                <h4 class="box-title">Add Invoice</h4>
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
                        <div class="row mx-auto">
            
               <div class="col-xl-3 col-lg-3 col-md-3 col-s-12 ">
                    <asp:Label ID="lblInvoice" runat="server" Text="Invoice Number: "></asp:Label>
                 
                    <asp:TextBox ID="txtInvoice" runat="server" class="form-control"  style="background-color:whitesmoke;"></asp:TextBox>
                         </div>
             <div class="col-xl-6 col-lg-6 col-md-6 col-s-12">
                    <asp:Label ID="lblOrganization" runat="server" Text="Desired Organization: "></asp:Label>
                    <asp:DropDownList ID="drpInvoiceOrganization" runat="server" class="btn"  style="background-color:whitesmoke;" AutoPostBack="True" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="viewGridView" DataTextField="OrganizationName" DataValueField="OrganizationID"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WildlifeCenterConnectionString %>" SelectCommand="SELECT [OrganizationID], [OrganizationName] FROM [Organization]"></asp:SqlDataSource>
                     </div>

                         <div class="col-xl-3 col-lg-3 col-md-3 col-s-12 ">
                             <asp:Label  runat="server" Text="Program Invoices "></asp:Label>  <br />
                    <asp:DropDownList ID="ProgramListInvoice" runat="server" class="btn btn-block"  style="background-color:whitesmoke;"></asp:DropDownList>
                              </div>
                    
                

             <div class="col-xl-12 col-lg-12 col-md-12 col-s-12">
                 <br />
                    <asp:GridView ID="GridView5" runat="server" CssClass=" table table-condensed table-bordered table-hover AnimalCard" AutoPostBack="true">
                        <HeaderStyle ForeColor="Black" BackColor="#00c292"></HeaderStyle>
                    </asp:GridView>

              </div>
            </div>
        </div>
        <div class="row mx-auto">
            <div class="col-12">
                

                <asp:Button ID="btnAddProgram2Invoice"
                    runat="server"
                    Text="Add Program to Invoice"
                    CssClass="btn btn-block mx-auto d-flex justify-content-center btn-success"
                    UseSubmitBehavior="false"
                    CauseValidation="true"/>
              
            </div>
                    </div>
                   
                    <div class="col-md-4 mx-auto">
                       
                    </div>


                     
                </div>
            </div>


        </div>
                               
                            </div>
                            
                            <div class="card-body"></div>
                        </div>
                    </div><!-- /# column -->
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
        </footer>
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
                      --%>  </div>



                    </div>

                </div>
                <div class="modal-footer">
                    <%--                    <button type="button" data-toggle="modal" data-target="#EditModal" class="btn btn-secondary" data-dismiss="modal">Edit</button>--%>
                </div>
            </div>
        </div>
    </div>



</body>







</asp:Content>