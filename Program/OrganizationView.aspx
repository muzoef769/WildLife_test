<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="OrganizationView.aspx.cs" EnableEventValidation="false" Inherits="OrganizationView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    
  

<body>
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
                            
                                <div class=" ml-auto d-flex justify-content-end row" >
          
                                  <asp:TextBox ID="txtSearchAll" Placeholder="Search by Organization Name"  Style="margin-right:5px;" class="form-control col-xl-3 col-lg-3 col-md-4 col-sm-6" runat="server" AutoPostBack="True"
                                    OnTextChanged="txtSearchAll_TextChanged"></asp:TextBox>
                                    <asp:Button ID="btnSearchAll" 
                                        runat="server" 
                                        Text="Search"
                                        CssClass="btn btn-success col-xl-1 col-lg-2 col-md-2 col-sm-2"
                                        Style ="margin-right: 5px;"
                                        OnClick ="btnSearchAll_Click"/>
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
                        Style="background-color:#fb9678;color: #fff; margin-right:47px;"
                        OnClick="btnClearAll_Click" />


        </div>
                                <br />
                             <div class="tab-content ">
            <div  class="">
                <div class="">

                    <div class="row mx-auto d-flex justify-content-center table-responsive">
                        <div class=" col-xl-12 col-lg-12 col-md-12 col-s-12 col-xs-12 ">
                           
                          
                             <div class="row mx-auto ">
            <div class="col-xl-12 col-lg-12 col-md-12 col-s-12">
                 <asp:GridView ID="grdOrganizations" HeaderStyle-ForeColor="black" Class =" table table-condensed table-bordered table-hover AnimalCard" runat="server" 
                     AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowSorting="True" RowStyle-CssClass="data-row" >
   
                  <Columns>
        <asp:BoundField DataField="OrganizationName"  HeaderText="Organization Name" SortExpression="OrganizationName" />
        <asp:BoundField DataField="Street" HeaderText="Street" SortExpression="Street" />
        <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
        <asp:BoundField DataField="County" HeaderText="County" SortExpression="County" />
        <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" SortExpression="Name" />
        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
        <asp:BoundField DataField="PrimaryPhoneNumber" HeaderText="Primary Phone"  SortExpression="PrimaryPhoneNumber" HeaderStyle-Width="200px" />
    </Columns>
                <HeaderStyle ForeColor="#ffffff" BackColor="#00c292"></HeaderStyle>
        
              </asp:GridView>
            </div>



            
        </div>
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connString %>" SelectCommand="SELECT Organization.OrganizationName, Address.Street, Address.State, Address.County, (Contact.FirstName + ' '+  Contact.LastName) AS Name, Contact.Email, Contact.PrimaryPhoneNumber
FROM            Address INNER JOIN
                         Organization ON Address.AddressID = Organization.AddressID INNER JOIN
                         Contact ON Organization.OrganizationID = Contact.OrganizationID"></asp:SqlDataSource>


                        </div>
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
     
        <!-- /.site-footer -->
    <%--</div>--%>
    <!-- /#right-panel -->

   

    <!--Local Stuff-->
    

       
    <div class="modal" id="AddModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
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
                            <asp:DropDownList ID="ddlAddStatus" runat="server" CssClass="form-control-plaintext attributeDropDown" BorderStyle="solid" AutoCompleteType="Disabled">
                                <asp:ListItem>Active</asp:ListItem>
                                <asp:ListItem>Inactive</asp:ListItem>
                                <asp:ListItem>Temporarily Inactive</asp:ListItem>
                            </asp:DropDownList>
                            <h4>Type: </h4>
                            <asp:DropDownList ID="ddlAddType" runat="server" CssClass="form-control-plaintext attributeDropDown" BorderStyle="solid" AutoCompleteType="Disabled">
                                <asp:ListItem>Bird</asp:ListItem>
                                <asp:ListItem>Mammal</asp:ListItem>
                                <asp:ListItem>Reptile</asp:ListItem>
                            </asp:DropDownList>
                            <h4>Name: </h4>
                            <asp:TextBox ID="txtAddName" runat="server" CssClass="form-control" AutoCompleteType="Disabled" ReadOnly="False"></asp:TextBox>
                            <h4>Add Image</h4>
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
                            <asp:Button ID="btnAddModal" runat="server" Text="Add" Class="btn btn-success FormButton" UseSubmitBehavior="false" OnClick="btnAddModal_Click"></asp:Button>
                        </div>



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


