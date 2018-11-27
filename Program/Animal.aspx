﻿<%@ Page Title="Animal" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Animal.aspx.cs" Inherits="Animal" EnableEventValidation = "false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    
  

<body>
    <!-- Left Panel -->
    <aside id="left-panel" class="left-panel">
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
                    
                     <li class="active">
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
                                <h4 class="box-title">View Animal Info</h4>
                            </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                            
                                <div class=" " >
          
                                     <div class=" ml-auto d-flex justify-content-end row" Style=" margin-right:16px;">
                     <asp:TextBox  Placeholder=" Search by Animal" runat="server" ></asp:TextBox> <br class="d-md-none" />
                    <asp:Button
                        ID="btnSearchAll"
                        runat="server" 
                        CssClass="btn btn-success col-xl-1 col-lg-2 col-md-2 col-sm-2"
                        Text="Search"
                         Style="margin-right:5px;"
                        />
                                         <br class="d-md-none" />
                

                </div>

        </div>
                                <br />
                             <div class="tab-content ">
            <div  class="">
                <div class="">

                    <div class="row mx-auto d-flex justify-content-center table-responsive">
                        <div class=" col-xl-12 col-lg-12 col-md-12 col-s-12 col-xs-12 ">
                           
                          
                             <div class="row mx-auto ">
            <div class="col-xl-12 col-lg-12 col-md-12 col-s-12">
                <asp:GridView ID="GridView1" runat="server" HeaderStyle-ForeColor="black" ItemStyle-ForeColor="black" AutoGenerateColumns="False" DataKeyNames="AnimalID"
                    Class="  table table-condensed table-bordered table-hover AnimalCard" DataSourceID="AnimalSQL" BackColor="White" HorizontalAlign="Left"
                    OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowSorting="True" OnRowDataBound="GridView1_RowDataBound1">

                  

                    <Columns>
                        <asp:BoundField DataField="AnimalID" HeaderText="AnimalID" InsertVisible="False" ReadOnly="True" SortExpression="AnimalID" Visible="False" />
                        <asp:BoundField DataField="AnimalName" HeaderText="AnimalName" SortExpression="AnimalName" />
                        <asp:BoundField DataField="AnimalType" HeaderText="AnimalType" SortExpression="AnimalType" />
                        <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                        <asp:BoundField DataField="Image" HeaderText="Image" SortExpression="Image" InsertVisible="False" Visible="False" />
                        <asp:BoundField DataField="TotalKids" HeaderText="TotalKids" ReadOnly="True" SortExpression="TotalKids" />
                        <asp:BoundField DataField="TotalAdults" HeaderText="TotalAdults" ReadOnly="True" SortExpression="TotalAdults" />
                        <asp:BoundField DataField="TotalPeople" HeaderText="TotalPeople" ReadOnly="True" SortExpression="TotalPeople" />
                        <asp:BoundField DataField="TotalPrograms" HeaderText="TotalPrograms" SortExpression="TotalPrograms" ReadOnly="True" />
                        <asp:ImageField DataImageUrlField="Image" >
<ControlStyle Height="50px" Width="50px"></ControlStyle>
                        </asp:ImageField>
                    </Columns>

 <HeaderStyle ForeColor="Black" BackColor="#00c292"></HeaderStyle>
                </asp:GridView>
            </div>



            
        </div>
    
    <asp:SqlDataSource
        ID="AnimalSQL"
        runat="server"
        ConflictDetection="CompareAllValues"
        ConnectionString="<%$ ConnectionStrings:WildlifeCenterConnectionString %>"
        DeleteCommand="DELETE FROM [Animal] WHERE [AnimalID] = @original_AnimalID AND [AnimalName] = @original_AnimalName AND [AnimalType] = @original_AnimalType AND [Status] = @original_Status AND [LastUpdated] = @original_LastUpdated AND [LastUpdatedBy] = @original_LastUpdatedBy"
        InsertCommand="INSERT INTO [Animal] ([AnimalName], [AnimalType], [Status], [LastUpdated], [LastUpdatedBy]) VALUES (@AnimalName, @AnimalType, @Status, @LastUpdated, @LastUpdatedBy)"
        OldValuesParameterFormatString="original_{0}"
        SelectCommand="SELECT Animal.AnimalID, Animal.AnimalName, Animal.AnimalType, Animal.Status, Animal.Image, SUM(ISNULL(NewProgram.TotalKids, '0')) AS TotalKids, SUM(ISNULL(NewProgram.TotalAdults, '0')) AS TotalAdults, SUM(ISNULL(NewProgram.TotalPeople, '0')) AS TotalPeople, COUNT(AssignAnimal.AssignAnimalID) AS TotalPrograms FROM Animal LEFT OUTER JOIN AssignAnimal ON Animal.AnimalID = AssignAnimal.AnimalID LEFT OUTER JOIN NewProgram ON AssignAnimal.NewProgramID = NewProgram.NewProgramID GROUP BY Animal.AnimalID, Animal.AnimalName, Animal.AnimalType, Animal.Status, Animal.LastUpdatedBy, Animal.Image"
        UpdateCommand="UPDATE [Animal] SET [AnimalName] = @AnimalName, [AnimalType] = @AnimalType, [Status] = @Status, [LastUpdated] = @LastUpdated, [LastUpdatedBy] = @LastUpdatedBy WHERE [AnimalID] = @original_AnimalID AND [AnimalName] = @original_AnimalName AND [AnimalType] = @original_AnimalType AND [Status] = @original_Status AND [LastUpdated] = @original_LastUpdated AND [LastUpdatedBy] = @original_LastUpdatedBy">
        <DeleteParameters>
            <asp:Parameter Name="original_AnimalID" Type="Int32" />
            <asp:Parameter Name="original_AnimalName" Type="String" />
            <asp:Parameter Name="original_AnimalType" Type="String" />
            <asp:Parameter Name="original_Status" Type="String" />
            <asp:Parameter DbType="Date" Name="original_LastUpdated" />
            <asp:Parameter Name="original_LastUpdatedBy" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="AnimalName" Type="String" />
            <asp:Parameter Name="AnimalType" Type="String" />
            <asp:Parameter Name="Status" Type="String" />
            <asp:Parameter DbType="Date" Name="LastUpdated" />
            <asp:Parameter Name="LastUpdatedBy" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="AnimalName" Type="String" />
            <asp:Parameter Name="AnimalType" Type="String" />
            <asp:Parameter Name="Status" Type="String" />
            <asp:Parameter DbType="Date" Name="LastUpdated" />
            <asp:Parameter Name="LastUpdatedBy" Type="String" />
            <asp:Parameter Name="original_AnimalID" Type="Int32" />
            <asp:Parameter Name="original_AnimalName" Type="String" />
            <asp:Parameter Name="original_AnimalType" Type="String" />
            <asp:Parameter Name="original_Status" Type="String" />
            <asp:Parameter DbType="Date" Name="original_LastUpdated" />
            <asp:Parameter Name="original_LastUpdatedBy" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>


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

    <div class="modal" id="EditModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Edit Animal</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body p-4" id="resultEdit">


                   

                    <div class="row  ">

                        <div class=" col-md-8">
                            
                            
                            <h4>Animal Status: </h4>
                            <asp:DropDownList ID="ddlEditStatus" runat="server" CssClass="form-control-plaintext attributeDropDown">
                               <asp:ListItem>Active</asp:ListItem>
                                <asp:ListItem>Inactive</asp:ListItem>
                                <asp:ListItem>Temporarily Inactive</asp:ListItem>
                            </asp:DropDownList>
                            <h4>Type: </h4>
                            <asp:DropDownList ID="ddlEditType" runat="server" CssClass="form-control-plaintext attributeDropDown">
                                <asp:ListItem>Bird</asp:ListItem>
                                <asp:ListItem>Mammal</asp:ListItem>
                                <asp:ListItem>Reptile</asp:ListItem>
                            </asp:DropDownList>
                            <h4>Name: </h4>
                            <asp:TextBox ID="txtEditName" runat="server" class="form-control" ReadOnly="false"></asp:TextBox>
                           
                        </div>
                        <!-- End  Description -->


                    </div>
                    <div class="row">
                        <br>
                    </div>
                    <div class="row">

                        <div class="col-md-2">
                            <asp:Button ID="btnUpdate" runat="server" Text="Update" Class="btn btn-success FormButton" UseSubmitBehavior="false" OnClick="btnUpdate_Click"></asp:Button>
                        </div>

                        

                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <div class="col-md-3">
                           <button data-toggle="modal" data-target="#AnimalModal" data-dismiss="modal" class="btn btn-secondary" type="submit">Return</button>
                        </div>
                
                
                
                </div>
            </div>
        </div>
    </div>

    <div class="modal" id="AnimalModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Animal Options</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body p-4" id="resultOptions">



                    <div class="row  ">

                        <div class=" col-md-8">
                           
                        </div>
                        <!-- End  Description -->


                    </div>
                    <div class="row">
                        <br>
                    <div class="col-md-2">
                          <button data-toggle="modal" data-target="#ProgramModal" data-dismiss="modal" class="btn btn-success" type="submit">View Animal Program Details</button>
                        </div>
                    
                    </div>
                    <br />
                        <br />
                        
                        
                    <div class="row">
                        
                        <div class="col-md-2">
                            <button data-toggle="modal" data-target="#EditModal" data-dismiss="modal" class="btn btn-success" type="submit">Edit Animal</button>
                        </div>
         <script type="text/javascript">
            function openModal() {
           $('#AnimalModal').modal('show');
              }
         </script>

                    </div>

                </div>
               
            </div>
        </div>
    </div>

     <div class="modal" id="ProgramModal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Program Details</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body p-4" id="resultPrograms">



                    
                            <div class="table-responsive ">
        <div class="row mx-auto d-flex">
      
            <div class="col-xl-6 col-lg-12  col-md-12 col-s-12 ">
                            <asp:GridView ID="GridView3" runat="server" Visible="True" HorizontalAlign="Center" Class=" AnimalCard table table-bordered table-hover" BackColor="White">
                </asp:GridView>
                        </div>
                       


                    </div>
                   
        

                    </div>

                </div>
               <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <div class="col-md-3">
                           <button data-toggle="modal" data-target="#AnimalModal" data-dismiss="modal" class="btn btn-secondary" type="submit">Return</button>
                        </div>
               
               
               
               </div>
            </div>
        </div>
    </div>

    
</body>

    

</asp:Content>