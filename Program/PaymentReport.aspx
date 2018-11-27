<%@ Page Title="Payment Report" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="PaymentReport.aspx.cs" Inherits="PaymentReport" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    


<body>
    <!-- Left Panel -->
    <aside id="left-panel" class="left-panel">
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
                        <asp:Button ID="btnLogOut" runat="server"  Text="Logout" ForeColor="#fb9678" CssClass="btn btn-link" />
                    
                    </li>

                        </ul>
                         
                        </div>
                    </div>

                  

                </div>
            </div>
        </header>
        <!-- /#header -->
        <!-- Content -->
        <div class="content">
            <!-- Animated -->
            <div class="animated fadeIn">
                <!-- Widgets  -->
                <div class="row">

                    



                    <div class="col-lg-3 col-md-6">
                        <div class="card" data-toggle="modal" data-target="#AddModal">
                            <div class="card-body">
                                <div class="stat-widget-five">
                                    <div class="stat-icon dib flat-color-1">
                                        <i class="fa fa-github-alt"></i>
                                    </div>
                                    <div class="stat-content">
                                        <div class="text-left dib">
                                           
                                            <div class="stat-heading">Add Animal</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6">
                        <div class="card">
                            <a href="AddOrganization.aspx"> 
                            <div class="card-body">
                                <div class="stat-widget-five">
                                    <div class="stat-icon col-2 dib flat-color-2">
                                        <i class="pe-7s-add-user"></i>
                                    </div>
                                    <div class="stat-content">
                                        <div class="text-left dib">
                                            
                                            <div class="stat-heading">Add Organization</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                                </a>
                        </div>
                       
                    </div>

                    <div class="col-lg-3 col-md-6">
                        <div class="card">
                             <a href="AddProgram.aspx"> 
                            <div class="card-body">
                                <div class="stat-widget-five">
                                    <div class="stat-icon dib flat-color-3">
                                        <i class="pe-7s-browser"></i>
                                    </div>
                                    <div class="stat-content">
                                        <div class="text-left dib">
                                           
                                            <div class="stat-heading">Add Program</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                                  </a>
                        </div>
                    </div>

                      <div class="col-lg-3 col-md-6">
                        <div class="card">
                             <a href="Program.aspx"> 
                            <div class="card-body">
                                <div class="stat-widget-five">
                                    <div class="stat-icon dib flat-color-4">
                                         <i class="pe-7s-browser"></i>
                                    </div>
                                    <div class="stat-content">
                                        <div class="text-left dib">
                                           
                                            <div class="stat-heading">View Programs</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                                  </a>
                        </div>
                    </div>

                  
                </div>
                <!-- /Widgets -->
                <!--  Traffic  -->
                <div class="card-body">
                                <h4 class="box-title">View Report Info</h4>
                            </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                            
                                <div class=" " >
                                                <script type="text/javascript">
  $(document).ready(function(){
  $('a[data-toggle="tab"]').on('show.bs.tab', function(e) {
    localStorage.setItem('activeTab', $(e.target).attr('href'));
  });
  var activeTab = localStorage.getItem('activeTab');
  if(activeTab){
    $('#myTab a[href="' + activeTab + '"]').tab('show');
  }
 });
</script> 
            <ul class="nav nav-tabs  col-xl-12 col-lg-12 col-md-12 col-s-12 " id="myTab" style=" padding-left:15px; border-bottom:none;"  role="tablist">
                <li class="nav-item ">
                    <a style=" margin-right:5px; color:black;"class="nav-link active " id="homee-tab" data-toggle="tab" href="#Monthly" role="tab" aria-controls="homee" aria-selected="true">Monthly</a>
                </li>
                <li class="nav-item ">
                    <a style=" margin-right:5px; color:black;" class="nav-link " id="profile-tab" data-toggle="tab" href="#Annual" role="tab" aria-controls="profile" aria-selected="false">Annual</a>
                </li>
                
               
               
            </ul>
                                    <br />
                           

        </div>
                                <br />
                             <div class="tab-content ">
            <div id="Monthly" class="tab-pane fade show active ">
                <div class="">

                    <div class="row mx-auto d-flex justify-content-center table-responsive">
                        <div class=" col-xl-12 col-lg-12 col-md-12 col-s-12 col-xs-12 ">
                        <div id="programTotals" class="row table-responsive" overflow-x: hidden;">
                                        <div class="col-md-12  table  table-bordered table-hover ">
                                          <asp:gridview id="monthGrid" runat="server" headerstyle-forecolor="black" class="  table table-condensed table-bordered table-hover AnimalCard" autogeneratecolumns="False" datasourceid="SqlDataSource2" enablesortingandpagingcallbacks="true" allowpaging="True" allowsorting="True">
                     <HeaderStyle ForeColor="Black" BackColor="#00c292"></HeaderStyle>
                        <Columns>
                            <asp:BoundField DataField="DateCreated" HeaderText="Date Created" SortExpression="DateCreated" />
                            <asp:BoundField DataField="InvoiceNumber" HeaderText="Invoice #" SortExpression="InvoiceNumber" />
                            <asp:BoundField DataField="OrganizationName" HeaderText="Organization" SortExpression="OrganizationName" />
                            <asp:BoundField DataField="PaymentType" HeaderText="Payment Type" SortExpression="PaymentType" />
                            <asp:BoundField DataField="TotalCost" DataFormatString="${0:###,###,###.00}" HeaderText="Amount" SortExpression="TotalCost" />

                        </Columns>

                      
                    </asp:gridview>
                    
                  <asp:gridview id="GridView1" class="  table table-condensed table-bordered table-hover AnimalCard" runat="server" headerstyle-forecolor="black" autogeneratecolumns="False" datasourceid="SqlDataSource3" enablesortingandpagingcallbacks="true" allowpaging="True" allowsorting="True">
                  <HeaderStyle ForeColor="Black" BackColor="#00c292"></HeaderStyle>
                    <Columns>
                        <asp:BoundField DataField="TotalAmount" DataFormatString="${0:###,###,###.00}" HeaderText="Total Amount" SortExpression="TotalAmount" />
                    </Columns>
                  
                </asp:gridview>

                <asp:sqldatasource id="SqlDataSource2" runat="server" connectionstring="<%$ ConnectionStrings:connString %>" selectcommand="SELECT i.[InvoiceNumber], Format(DateCreated, 'MM/dd/yyyy') as 'DateCreated', o.[OrganizationName], p.[PaymentType], i.[TotalCost] FROM [Payment] p inner join [Organization] o on p.OrganizationID = o.OrganizationID inner join [Invoice] i on i.InvoiceID = p.InvoiceID WHERE MONTH(i.[DateCreated]) = @month ORDER BY DateCreated ">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="month" Type="Int32" />
                    </SelectParameters>
                </asp:sqldatasource>
                <asp:sqldatasource id="SqlDataSource3" runat="server" connectionstring="<%$ ConnectionStrings:connString %>" selectcommand="SELECT SUM([TotalCost]) as 'TotalAmount' FROM dbo.[Invoice] WHERE MONTH([DateCreated]) = @month">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="month" Type="Int32" />
                    </SelectParameters>
                </asp:sqldatasource>
                                        </div>
                                      <div class="row ">
            <div class="col-md-12">
                <asp:button id="Button2" class=" btn btn-success btn-block mx-auto d-flex justify-content-center" text="Export To Excel" runat="server" onclick="Button2_Click"></asp:button>
            </div>
        </div>
                             <br />
                                    </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="Annual" class="tab-pane fade">
                <div id="" class="row table-responsive" >
                                   <div id="ann" class=" col-xl-12 col-lg-12 col-md-12 col-s-12 col-xs-12  ">

                <asp:gridview id="annualGrid" runat="Server" class="   table table-condensed table-bordered table-hover AnimalCard" headerstyle-forecolor="black" autogeneratecolumns="False" datasourceid="SqlDataSource1" enablesortingandpagingcallbacks="true" allowpaging="True" allowsorting="True">
                     <HeaderStyle ForeColor="Black" BackColor="#00c292"></HeaderStyle>
                    <Columns>
                        <asp:BoundField DataField="DateCreated" HeaderText="Date Created" SortExpression="DateCreated" />
                        <asp:BoundField DataField="InvoiceNumber" HeaderText="Invoice #" SortExpression="InvoiceNumber" />
                        <asp:BoundField DataField="OrganizationName" HeaderText="Organization" SortExpression="OrganizationName" />
                        <asp:BoundField DataField="PaymentType" HeaderText="Payment Type" SortExpression="PaymentType" />
                        <asp:BoundField DataField="TotalCost" DataFormatString="${0:###,###,###.00}" HeaderText="Amount" SortExpression="TotalCost" />
                    </Columns>
                    
                </asp:gridview>
                <asp:sqldatasource id="SqlDataSource1" runat="server" connectionstring="<%$ ConnectionStrings:connString %>"
                    selectcommand="SELECT i.[InvoiceNumber], Format(DateCreated, 'MM/dd/yyyy') as 'DateCreated', o.[OrganizationName], p.[PaymentType], i.[TotalCost] FROM [Payment] p inner join [Organization] o on p.OrganizationID = o.OrganizationID inner join [Invoice] i on i.InvoiceID = p.InvoiceID ORDER BY DateCreated "></asp:sqldatasource>

                <div class="row ">
                    <div class="col-md-12">
                        <asp:button id="Button3" class=" btn btn-success btn-block mx-auto d-flex justify-content-center" runat="server" text="Export To Excel" onclick="Button1_Click"></asp:button>
                       
                        
                    </div>
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
    </div>
    <!-- /#right-panel -->

   

    <!--Local Stuff-->
    

       

    <div class="modal" id="ProgramDetailsModal" tabindex="-1" role="dialog"> 
        <div class="modal-dialog" role="document" >
            <div class="modal-content" style="width:100% !important;">
                <div class="modal-header" style="background-color: whitesmoke">
                    <h5 class="modal-title"></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body p-4" id="resultPrograms" style="background-color:#ffffff">

                    <div class=" ">
                        <div class="row d-flex justify-content-center ">

                            <div class="col-xl-6 col-lg-12 text-left col-md-12 col-s-12 Spacing">
                                 <label><b>Animals Involved</b> </label>
                                <asp:GridView ID="GridView2" runat="server" Visible="True"  Class="table table-condensed table-bordered table-hover" BackColor="White" >
                                    
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
                                     <label><b>Notes </b></label> <br />
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

