<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="AddProgram - Copy.aspx.cs" Inherits="AddProgram" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">

    <asp:ScriptManager runat="server"></asp:ScriptManager>

    <%--Beginning container--%>
 
   <body>
    <!-- Left Panel -->
    <aside id="left-panel" class="left-panel">
        <nav class="navbar navbar-expand-sm navbar-default">
            <div id="main-menu" class="main-menu collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li class="">
                        <a href="Home.aspx"><i class="menu-icon fa fa-laptop"></i>Home</a>
                    </li>
                     <li class="menu-item-has-children dropdown ">
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
                     <li class="active">
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



                                <div class="row">

                

                      <div class="col-lg-6 col-md-6">
                        <div class="card">
                             <a href="Program.aspx"> 
                            <div class="card-body">
                                
                                <div class=" AnimalReportCard text-left" style="padding-left:15px; padding-top:15px; padding-bottom:5px;">
            <h4>Cart 

                <span class="price" style="color: black"><i class="fa fa-shopping-cart"></i><b>
                    <asp:Label ID="lblCartTotal" runat="server" Text="0"></asp:Label></b></span>

            </h4>
            <div id ="programOne"  runat="server" visible="false">
            <p><a href="#"><asp:Label ID ="lblProgramOne" runat="server" Text="Program One"></asp:Label></a> <span class="price">
                <asp:Label ID="lblProgramCostOne" runat="server" Text="70"></asp:Label></span></p>
                </div>
            <div id ="programTwo"  runat="server" visible="false">
            <p><a href="#"><asp:Label ID ="lblProgramTwo" runat="server" Text="Program Two"></asp:Label></a> <span class="price">
                <asp:Label ID="lblProgramCostTwo" runat="server" Text="70"></asp:Label></span></p>
                </div>
            <div id="programThree"  runat="server" visible="false">
            <p><a href="#"><asp:Label ID ="lblProgramThree" runat="server" Text="Program Three"></asp:Label></a> <span class="price">
                <asp:Label ID="lblProgramCostThree" runat="server" Text="70"></asp:Label></span></p>
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
                                  </a>
                        </div>
                    </div>

                  
                </div>


                <!-- /Widgets -->
                <!--  Traffic  -->
                <div class="card-body">
                                <h4 class="box-title">Add Program Info</h4>
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
                    <a style=" margin-right:5px; color:black;"class="nav-link active " id="homee-tab" data-toggle="tab" href="#Program" role="tab" aria-controls="homee" aria-selected="true">Program Info</a>
                </li>
                <li class="nav-item ">
                    <a style=" margin-right:5px; color:black;" class="nav-link " id="profile-tab" data-toggle="tab" href="#Contact" role="tab" aria-controls="profile" aria-selected="false">Contact Info</a>
                </li>
                <li class="nav-item ">
                    <a style=" margin-right:5px; color:black;"class="nav-link" id="home-tab" data-toggle="tab" href="#programLoc" role="tab" aria-controls="home" aria-selected="false">Program Location</a>
                </li>
                
               
               
            </ul>
                                    <br />
                           

        </div>
                                <br />


                                <div class="row mx-auto d-flex justify-content-center ">



                   <div class="col-md-4 text-center">
                    <label for="txtOrgDrp" class="label-style">Organization</label> <br>
                   
                                                
                    <asp:DropDownList ID="drpOrganizationList" runat="server"  CssClass="btn btn-default btn-sm dropdown-toggle" style="background-color:whitesmoke;" AppendDataBoundItems="True" DataSourceID="SqlDataSource3" DataTextField="OrganizationName" DataValueField="OrganizationID" OnSelectedIndexChanged="DrpOrganizationList_IndexChanged" AutoPostBack="true">

                        <asp:ListItem Text="Select an Organization" ></asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:connString %>" SelectCommand="SELECT OrganizationName, OrganizationID FROM Organization"></asp:SqlDataSource>

                       </div>


                     <div class="col-4 ">
            <div class="d-flex justify-content-center "> 
   <a href="AddOrganization.aspx" id="btnAddOrg" class=" btn btn-success" runat="server" onclick="btnAddOrg_Click">Add Organization</a>
       </div>
        </div>


                    <div class=" col-md-4">
                        <asp:Label ID="lblInvoice" runat="server" Text="Invoice Number: "></asp:Label>
                         <asp:TextBox ID ="txtInvoiceNumber"  class="form-control"  style="background-color:whitesmoke;" runat="server" ></asp:TextBox>
                  
                    </div>

                      </div>

                             <div class="tab-content ">
            <div id="Program" class="tab-pane fade show active ">
                <div class="">

                    <div class="row mx-auto d-flex justify-content-center ">
                        <div class=" col-xl-12 col-lg-12 col-md-12 col-s-12 col-xs-12 ">
                        
                            <div class="card-body">
                            <div class="row">
                                <div class="col-md-4 ">
                                       <label>Select Program </label>
                                    <asp:DropDownList ID="drpProgramList" runat="server" CssClass="btn  dropdown-toggle" style="background-color:whitesmoke;" DataSourceID="SqlDataSource1" DataTextField="ProgramName" DataValueField="ProgramID" AppendDataBoundItems="True" OnSelectedIndexChanged="DrpProgramList_SelectedIndexChanged" AutoPostBack="true">

                                        <asp:ListItem Text="Program Name"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                 </div>
                            <br />
                            <div class="row">
                                
                                <div class="col-md-4">
                                       <label>Select a Location Type </label>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connString %>" SelectCommand="SELECT [ProgramID], [ProgramName] FROM [Program]"></asp:SqlDataSource>

                                    <asp:DropDownList ID="drpLocationTypeList" runat="server" CssClass="btn  dropdown-toggle" style="background-color:whitesmoke;" AutoPostBack="true" OnSelectedIndexChanged="drpLocationTypeList_SelectedIndexChanged">
                                        <asp:ListItem Text="Location Type"></asp:ListItem>
                                        <asp:ListItem Value="Onsite" Text="Onsite"></asp:ListItem>
                                        <asp:ListItem Value="Offsite" Text="Offsite"></asp:ListItem>
                                        <asp:ListItem Value="Online" Text="Online"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-4 mx-auto  Spacing">
                                   <label>Date </label>

                                    <input runat="server" clientidmode="Static" class="btn"  style="background-color:whitesmoke;" width="100%" type="date" id="datepicker">
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-4 mx-auto  Spacing">
                                    <label>Program Time: </label> &nbsp&nbsp <br />
                                    <asp:TextBox ID="programTime" runat="server" class="btn"  style="background-color:whitesmoke;" type="time" step="900" min="8:00" max="17:00"></asp:TextBox>


                                </div>



                                <div class="col-md-4 mx-auto  Spacing">
                                    <label>Adults </label>
                                    <asp:TextBox ID="txtAdults" runat="server"  class="form-control"  style="background-color:whitesmoke;" Width="100%"></asp:TextBox>

                                </div>


                                <div class="col-md-4 mx-auto  Spacing">
                                    <label>Children </label>
                                    <asp:TextBox ID="txtKids" runat="server"  class="form-control"  style="background-color:whitesmoke;" Width="100%" ></asp:TextBox>


                                </div>
                            </div>
                            <br />
                            <div class="row">

                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-10">
                                    <label>Birds </label>
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


                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-10">
                                    <asp:UpdatePanel ID="UpdateReptiles" runat="server">
                                        <ContentTemplate>
                                            <label>Reptiles </label>
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

                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-10">
                                     <label>Mammals </label>
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
                                <br />
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-4 mx-auto Spacing">

                                    <label>Select Grade </label>




                                    <asp:DropDownList ID="drpAgeLevel" class="btn" style="background-color:whitesmoke;" runat="server">
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

                                <div class="col-md-4 mx-auto Spacing">
                                     <label>Select Educators </label>
                                    <div class="border" style="overflow-y: scroll; width: 200px; height: 200px">
                                        <asp:CheckBoxList ID="CheckBoxList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="name" DataValueField="UserID"></asp:CheckBoxList>
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:connString %>" SelectCommand="SELECT UserID, CONCAT(FirstName, ' ', LastName) as name FROM [User] "></asp:SqlDataSource>
                                    </div>
                                </div>

                                <div class="col-md-4 mx-auto Spacing">
                                     <label>Notes </label>
                                    <textarea id="txtMiscNotes" runat="server" cols="20" rows="3"></textarea>
                                </div>


                                <br />
                                <br />

                            </div>
                            <br />
                            <div class="row">
                                <div class="col-6  mx-auto  text-center">
                                    <asp:Button ID="Button2" runat="server" CssClass="btn btn-success" Text="Add Program" OnClick="BtnAddProgram_Click" />

                                </div>
                            </div>

                        </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="Contact" class="tab-pane fade">
                <div class="card-body">
                        <div class="container-fluid" style="padding-top: 20px;">
                            <asp:UpdatePanel runat="server" ID="clientPanel">
                                <ContentTemplate>
                                    <asp:DropDownList ID="drpContact" runat="server"  class="btn"  style="background-color:whitesmoke;" OnSelectedIndexChanged="DrpContact_SelectedIndexChanged" AutoPostBack="True">
                                        <asp:ListItem Text="Select a Contact"></asp:ListItem>
                                    </asp:DropDownList>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="drpOrganizationList" EventName="SelectedIndexChanged" />

                                </Triggers>

                            </asp:UpdatePanel>
                            <br />


                            <asp:UpdatePanel runat="server" ID="UpdatePanel2" UpdateMode="Always">
                                <ContentTemplate>
                                    <div class="main-container">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label for="txtFirstName" class="label-style">First Name</label>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <asp:TextBox ID="txtFirstName"  class="form-control"  style="background-color:whitesmoke;" runat="server"></asp:TextBox>

                                            </div>

                                        </div>


                                        <div class="row">
                                            <div class="col-md-6">
                                                <label for="txtLastName" class="label-style">Last Name</label>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <asp:TextBox ID="txtLastName"  class="form-control"  style="background-color:whitesmoke;" runat="server"></asp:TextBox>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label for="txtEmail" class="label-style">Email Address</label>
                                            </div>
                                            <div class="form-group  col-md-6">
                                                <asp:TextBox ID="txtEmail"  class="form-control"  style="background-color:whitesmoke;" runat="server"></asp:TextBox>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label for="txtPrimaryNumber" class="label-style">Primary Phone </label>
                                            </div>
                                            <div class="form-group  col-md-6">
                                                <asp:TextBox ID="txtPrimaryNumber"  class="form-control"  style="background-color:whitesmoke;" runat="server"></asp:TextBox>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label for="txtSecondaryNumber" class="label-style">Secondary Phone </label>
                                            </div>
                                            <div class="form-group  col-md-6">
                                                <asp:TextBox ID="txtSecondaryNumber" class="form-control"  style="background-color:whitesmoke;"  runat="server"></asp:TextBox>
                                            </div>

                                        </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="drpContact" EventName="SelectedIndexChanged" />

                                </Triggers>

                            </asp:UpdatePanel>
                            <div class="button-container">
                            </div>

                        </div>

                    </div>
            </div>
            <div id="programLoc" runat="server" class="tab-pane fade">
                <div class="card-body" >
                    <div class="container-fluid" style="padding-top: 20px;">

                        <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
                            <ContentTemplate>
                                <div class="main-container">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <label for="txtStreet" class="label-style">Street</label>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <asp:TextBox ID="txtStreet" runat="server" class="btn"  style="background-color:whitesmoke;" ></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-4">
                                            <label for="txtCity" class="label-style">City</label>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <asp:TextBox ID="txtCity" runat="server" class="btn"  style="background-color:whitesmoke;"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-4">
                                            <label for="txtState" class="label-style">State</label>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <asp:TextBox ID="txtState" runat="server" class="btn"  style="background-color:whitesmoke;"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <label for="txtCounty" class="label-style">County</label>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <asp:TextBox ID="txtCounty" runat="server" class="btn"  style="background-color:whitesmoke;"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <label for="txtCountry" class="label-style">Country</label>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <asp:TextBox ID="txtCountry" runat="server" class="btn"  style="background-color:whitesmoke;"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-4">
                                            <label for="txtZipCode" class="label-style">Zip Code</label>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <asp:TextBox ID="txtZipCode" runat="server" class="btn"  style="background-color:whitesmoke;"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <label for="txtMileage" class="label-style">Mileage</label>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <asp:TextBox ID="txtMileage" runat="server" class="btn"  style="background-color:whitesmoke;"></asp:TextBox>
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





