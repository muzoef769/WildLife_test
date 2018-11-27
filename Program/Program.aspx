<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Program.aspx.cs" Inherits="Program" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    
    <script>$("button").click(function () {
            var columns_container = $(".dynamic-columns");
            if (!columns_container.hasClass("expanded")) {
                $(".dynamic-columns .col:first").removeClass("col-xs-2");
                $(".dynamic-columns .col:first").addClass("col-xs-1");

                $(".dynamic-columns .col:last-child").removeClass("col-xs-8");
                $(".dynamic-columns .col:last-child").addClass("col-xs-9");
                columns_container.toggleClass("expanded");
            }
            else {
                $(".dynamic-columns .col:first").removeClass("col-xs-1");
                $(".dynamic-columns .col:first").addClass("col-xs-2");

                $(".dynamic-columns .col:last-child").removeClass("col-xs-9");
                $(".dynamic-columns .col:last-child").addClass("col-xs-8");
                columns_container.toggleClass("expanded");
            }
        });</script>




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
        </header>--%>
        <!-- /#header -->
        <!-- Content -->
        <div class="content">
            <!-- Animated -->
            <div class="animated fadeIn">
                <!-- Widgets  -->
                <div class="row">

                    <div class="col-lg-4 col-md-6">
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

                    <div class="col-lg-4 col-md-6">
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

                    <div class="col-lg-4 col-md-6">
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

                    

                  
                </div>
                <!-- /Widgets -->
                <!--  Traffic  -->
                <div class="card-body">
                                <h4 class="box-title">View Program Info</h4>
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
            <ul class="nav nav-tabs  col-xl-12 col-lg-12 col-md-12 col-s-12 " id="myTab" style=" padding-left:15px; border-bottom:none;" id="myTab" role="tablist">
                <li class="nav-item ">
                    <a style=" margin-right:5px; color:black;"class="nav-link active " id="homee-tab" data-toggle="tab" href="#All" role="tab" aria-controls="homee" aria-selected="true">All</a>
                </li>
                <li class="nav-item ">
                    <a style=" margin-right:5px; color:black;"class="nav-link" id="home-tab" data-toggle="tab" href="#Online" role="tab" aria-controls="home" aria-selected="false">Online</a>
                </li>
                <li class="nav-item ">
                    <a style=" margin-right:5px; color:black;" class="nav-link " id="profile-tab" data-toggle="tab" href="#OnSite" role="tab" aria-controls="profile" aria-selected="false">OnSite</a>
                </li>
                <li class="nav-item ">
                    <a style=" margin-right:5px; color:black;" class="nav-link  " id="contact-tab" data-toggle="tab" href="#OffSite" role="tab" aria-controls="contact" aria-selected="false">OffSite</a>
                </li>
               
            </ul>
                                    <br />
                                     <div class=" ml-auto d-flex justify-content-end row" Style=" margin-right:16px;">
                    <asp:TextBox ID="txtSearchAll" Placeholder=" Program Name" runat="server" type="text" Style="margin-right:5px;" class="form-control col-xl-3 col-lg-3 col-md-4 col-sm-6" AutoPostBack="True"
                                    OnTextChanged="txtSearchAll_TextChanged"></asp:TextBox> <br class="d-md-none" />
                    <asp:Button
                        ID="btnSearchAll"
                        runat="server" 
                        CssClass="btn btn-success col-xl-1 col-lg-2 col-md-2 col-sm-2"
                        Text="Search"
                         Style="margin-right:5px;"
                        OnClick="btnSearchAll_Click"/>
                                         <br class="d-md-none" />
                    <asp:Button
                        ID="btnClearAll"
                        CssClass="btn col-xl-1 col-md-2 col-lg-2 col-sm-2"
                        runat="server"
                        Text="Clear"
                        Style="background-color:#fb9678;color: #fff; margin-right:5px;"
                        OnClick="btnClearAll_Click" />

                </div>

        </div>
                                <br />
                             <div class="tab-content ">
            <div id="All" class="tab-pane fade show active ">
                <div class="">

                    <div class="row mx-auto d-flex justify-content-center table-responsive">
                        <div class=" col-xl-12 col-lg-12 col-md-12 col-s-12 col-xs-12 ">
                             <asp:GridView ID="GridView5" runat="server"
                                HeaderStyle-ForeColor="Black" DateKeyNames="NewProgramID"
                                ItemStyle-ForeColor="black" AutoGenerateColumns="False" CssClass="  table table-condensed table-bordered table-hover AnimalCard"
                                DataSourceID="SqlDataSource1" BackColor="White" HorizontalAlign="Left "
                                AllowSorting="True" OnRowDataBound="GridView1_RowDataBound1" OnSelectedIndexChanged="GridView5_SelectedIndexChanged">

                                <Columns>

                                    <asp:BoundField DataField="ProgramName" HeaderText="Program Name" SortExpression="ProgramName" />
                                    <asp:BoundField DataField="ProgramCost" HeaderText="Program Cost" SortExpression="ProgramCost" DataFormatString="${0:###,###,###.00}" />
                                    <asp:BoundField DataField="LocationType" HeaderText="Location" SortExpression="LocationType" />
                                    <asp:BoundField DataField="TotalPeople" HeaderText="Total People" SortExpression="TotalPeople" />
                                    <asp:BoundField DataField="DateCompleted" HeaderText="Date Completed" SortExpression="DateCompleted" />

                                    <asp:BoundField DataField="NewProgramID" HeaderText="NewProgramID" InsertVisible="False" ReadOnly="True" SortExpression="NewProgramID" Visible="false" />

                                </Columns>
                               <HeaderStyle ForeColor="#ffffff" BackColor="#00c292"></HeaderStyle>
                            </asp:GridView>
                          
                            <asp:SqlDataSource
                                ID="SqlDataSource1"
                                runat="server"
                                FilterExpression="ProgramName LIKE '%{0}%'"
                                ConflictDetection="CompareAllValues"
                                ConnectionString="<%$ ConnectionStrings:connString %>"
                                DeleteCommand="DELETE FROM [Program] WHERE [ProgramID] = @original_ProgramID AND [ProgramName] = @original_ProgramName AND [ProgramType] = @original_ProgramType AND [ProgramCost] = @original_ProgramCost AND [Capacity] = @orginial_Capacity AND [LastUpdated] = @original_LastUpdated AND [LastUpdatedBy] = @original_LastUpdatedBy"
                                InsertCommand="INSERT INTO [Program] ([ProgramName], [ProgramType], [ProgramCost], [Capacity], [LastUpdated], [LastUpdatedBy]) VALUES (@AnimalName, @AnimalType, @ProgramCost, @Capacity, @LastUpdated, @LastUpdatedBy)"
                                OldValuesParameterFormatString="original_{0}"
                                SelectCommand="SELECT Program.ProgramName, Program.ProgramCost, NewProgram.LocationType, NewProgram.TotalPeople, Format(NewProgram.DateCompleted, 'MM/dd/yyyy') as 'DateCompleted', NewProgram.NewProgramID FROM Program INNER JOIN NewProgram ON Program.ProgramID = NewProgram.ProgramID ORDER BY NewProgram.DateCompleted DESC"
                                UpdateCommand="UPDATE [Program] SET [ProgramName] = @ProgramName1 AND [ProgramType] = @ProgramType1 AND [ProgramCost] = @ProgramCost1 AND [Capacity] = @Capacity1 AND [LastUpdated] = @LastUpdated1 AND [LastUpdatedBy] = @LastUpdatedBy1 WHERE [ProgramID] = @ProgramID2 AND [ProgramName] = @ProgramName2 AND [ProgramType] = @ProgramType2 AND [ProgramCost] = @ProgramCost2 AND [Capacity] = @Capacity2 AND [LastUpdated] = @LastUpdated2 AND [LastUpdatedBy] = @LastUpdatedBy2">
                                <FilterParameters>
                                    <asp:ControlParameter Name="ProgramName" ControlID="txtSearchAll" PropertyName="Text" />
                                </FilterParameters>
                                <DeleteParameters>
                                    <asp:Parameter Name="original_ProgramID" Type="Int32" />
                                    <asp:Parameter Name="original_ProgramName" Type="String" />
                                    <asp:Parameter Name="original_ProgramType" />
                                    <asp:Parameter Name="original_ProgramCost" Type="Double" />
                                    <asp:Parameter Name="orginial_Capacity" />
                                    <asp:Parameter Name="original_LastUpdated" DbType="Date" />
                                    <asp:Parameter Name="original_LastUpdatedBy" Type="String" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="AnimalName" />
                                    <asp:Parameter Name="AnimalType" />
                                    <asp:Parameter Name="ProgramCost" Type="Double" />
                                    <asp:Parameter Name="Capacity" Type="Int32" />
                                    <asp:Parameter Name="LastUpdated" DbType="Date" />
                                    <asp:Parameter Name="LastUpdatedBy" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="ProgramName1" Type="String" />
                                    <asp:Parameter Name="ProgramType1" Type="String" />
                                    <asp:Parameter Name="ProgramCost1" Type="Double" />
                                    <asp:Parameter Name="Capacity1" Type="Int32" />
                                    <asp:Parameter Name="LastUpdated1" DbType="Date" />
                                    <asp:Parameter Name="LastUpdatedBy1" Type="String" />
                                    <asp:Parameter Name="ProgramID2" Type="Int32" />
                                    <asp:Parameter Name="ProgramName2" Type="String" />
                                    <asp:Parameter Name="ProgramType2" Type="String" />
                                    <asp:Parameter Name="ProgramCost2" Type="Double" />
                                    <asp:Parameter Name="Capacity2" Type="Int32" />
                                    <asp:Parameter Name="LastUpdated2" DbType="Date" />
                                    <asp:Parameter Name="LastUpdatedBy2" Type="String" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                </div>
            </div>
            <div id="Online" class="tab-pane fade">
                <div class="table-responsive">

                    <div class="row mx-auto d-flex justify-content-center ">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-s-12">
                            <asp:GridView ID="GridView1" runat="server"
                                HeaderStyle-ForeColor="black" DataKeyNames="NewProgramID"
                                ItemStyle-ForeColor="black" AutoGenerateColumns="False" CssClass="  table table-condensed table-bordered table-hover AnimalCard"
                                DataSourceID="ProgramSQL" BackColor="White" HorizontalAlign="Left"
                                AllowSorting="True" OnRowDataBound="GridView1_RowDataBound1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">

                                <Columns>

                                    <asp:BoundField DataField="ProgramName" HeaderText="Program Name" SortExpression="ProgramName" />
                                    <asp:BoundField DataField="ProgramCost" HeaderText="Program Cost" SortExpression="ProgramCost" DataFormatString="${0:###,###,###.00}" />
                                    <asp:BoundField DataField="LocationType" HeaderText="Location" SortExpression="LocationType" />
                                    <asp:BoundField DataField="TotalPeople" HeaderText="Total People" SortExpression="TotalPeople" />
                                    <asp:BoundField DataField="DateCompleted" HeaderText="Date Completed" SortExpression="DateCompleted" />

                                    <asp:BoundField DataField="NewProgramID" HeaderText="NewProgramID" InsertVisible="False" ReadOnly="True" SortExpression="NewProgramID" Visible="false" />

                                </Columns>
                              <HeaderStyle ForeColor="Black" BackColor="#00c292"></HeaderStyle>
                            </asp:GridView>

                            <asp:SqlDataSource
                                ID="ProgramSQL"
                                runat="server"
                                ConflictDetection="CompareAllValues"
                                ConnectionString="<%$ ConnectionStrings:connString %>"
                                DeleteCommand="DELETE FROM [Program] WHERE [ProgramID] = @original_ProgramID AND [ProgramName] = @original_ProgramName AND [ProgramType] = @original_ProgramType AND [ProgramCost] = @original_ProgramCost AND [Capacity] = @orginial_Capacity AND [LastUpdated] = @original_LastUpdated AND [LastUpdatedBy] = @original_LastUpdatedBy"
                                InsertCommand="INSERT INTO [Program] ([ProgramName], [ProgramType], [ProgramCost], [Capacity], [LastUpdated], [LastUpdatedBy]) VALUES (@AnimalName, @AnimalType, @ProgramCost, @Capacity, @LastUpdated, @LastUpdatedBy)"
                                OldValuesParameterFormatString="original_{0}"
                                SelectCommand="SELECT Program.ProgramName, Program.ProgramCost, NewProgram.LocationType, NewProgram.TotalPeople, Format(NewProgram.DateCompleted, 'MM/dd/yyyy') as 'DateCompleted', NewProgram.NewProgramID FROM Program INNER JOIN NewProgram ON Program.ProgramID = NewProgram.ProgramID WHERE upper(NewProgram.LocationType)='ONLINE' ORDER BY NewProgram.DateCompleted DESC"
                                UpdateCommand="UPDATE [Program] SET [ProgramName] = @ProgramName1 AND [ProgramType] = @ProgramType1 AND [ProgramCost] = @ProgramCost1 AND [Capacity] = @Capacity1 AND [LastUpdated] = @LastUpdated1 AND [LastUpdatedBy] = @LastUpdatedBy1 WHERE [ProgramID] = @ProgramID2 AND [ProgramName] = @ProgramName2 AND [ProgramType] = @ProgramType2 AND [ProgramCost] = @ProgramCost2 AND [Capacity] = @Capacity2 AND [LastUpdated] = @LastUpdated2 AND [LastUpdatedBy] = @LastUpdatedBy2">
                                <DeleteParameters>
                                    <asp:Parameter Name="original_ProgramID" Type="Int32" />
                                    <asp:Parameter Name="original_ProgramName" Type="String" />
                                    <asp:Parameter Name="original_ProgramType" />
                                    <asp:Parameter Name="original_ProgramCost" Type="Double" />
                                    <asp:Parameter Name="orginial_Capacity" />
                                    <asp:Parameter Name="original_LastUpdated" DbType="Date" />
                                    <asp:Parameter Name="original_LastUpdatedBy" Type="String" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="AnimalName" />
                                    <asp:Parameter Name="AnimalType" />
                                    <asp:Parameter Name="ProgramCost" Type="Double" />
                                    <asp:Parameter Name="Capacity" Type="Int32" />
                                    <asp:Parameter Name="LastUpdated" DbType="Date" />
                                    <asp:Parameter Name="LastUpdatedBy" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="ProgramName1" Type="String" />
                                    <asp:Parameter Name="ProgramType1" Type="String" />
                                    <asp:Parameter Name="ProgramCost1" Type="Double" />
                                    <asp:Parameter Name="Capacity1" Type="Int32" />
                                    <asp:Parameter Name="LastUpdated1" DbType="Date" />
                                    <asp:Parameter Name="LastUpdatedBy1" Type="String" />
                                    <asp:Parameter Name="ProgramID2" Type="Int32" />
                                    <asp:Parameter Name="ProgramName2" Type="String" />
                                    <asp:Parameter Name="ProgramType2" Type="String" />
                                    <asp:Parameter Name="ProgramCost2" Type="Double" />
                                    <asp:Parameter Name="Capacity2" Type="Int32" />
                                    <asp:Parameter Name="LastUpdated2" DbType="Date" />
                                    <asp:Parameter Name="LastUpdatedBy2" Type="String" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                </div>
            </div>
            <div id="OnSite" class="tab-pane fade">
                <div class="table-responsive">
                    <div class="row mx-auto d-flex justify-content-center">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-s-12">
                            <asp:GridView ID="GridView3" runat="server"
                                HeaderStyle-ForeColor="Black" DateKeyNames="NewProgramID"
                                ItemStyle-ForeColor="black" AutoGenerateColumns="False" CssClass="  table table-condensed table-bordered table-hover AnimalCard"
                                DataSourceID="ProgramSQL1" BackColor="White" HorizontalAlign="Left"
                                AllowSorting="True" OnRowDataBound="GridView1_RowDataBound1" OnSelectedIndexChanged="GridView3_SelectedIndexChanged">

                                <Columns>

                                    <asp:BoundField DataField="ProgramName" HeaderText="Program Name" SortExpression="ProgramName" />
                                    <asp:BoundField DataField="ProgramCost" HeaderText="Program Cost" SortExpression="ProgramCost" DataFormatString="${0:###,###,###.00}" />
                                    <asp:BoundField DataField="LocationType" HeaderText="Location" SortExpression="LocationType" />
                                    <asp:BoundField DataField="TotalPeople" HeaderText="Total People" SortExpression="TotalPeople" />
                                    <asp:BoundField DataField="DateCompleted" HeaderText="Date Completed" SortExpression="DateCompleted" />

                                    <asp:BoundField DataField="NewProgramID" HeaderText="NewProgramID" InsertVisible="False" ReadOnly="True" SortExpression="NewProgramID" Visible="false" />

                                </Columns>
                               <HeaderStyle ForeColor="Black" BackColor="#00c292"></HeaderStyle>
                            </asp:GridView>

                            <asp:SqlDataSource
                                ID="ProgramSQL1"
                                runat="server"
                                ConflictDetection="CompareAllValues"
                                ConnectionString="<%$ ConnectionStrings:connString %>"
                                DeleteCommand="DELETE FROM [Program] WHERE [ProgramID] = @original_ProgramID AND [ProgramName] = @original_ProgramName AND [ProgramType] = @original_ProgramType AND [ProgramCost] = @original_ProgramCost AND [Capacity] = @orginial_Capacity AND [LastUpdated] = @original_LastUpdated AND [LastUpdatedBy] = @original_LastUpdatedBy"
                                InsertCommand="INSERT INTO [Program] ([ProgramName], [ProgramType], [ProgramCost], [Capacity], [LastUpdated], [LastUpdatedBy]) VALUES (@AnimalName, @AnimalType, @ProgramCost, @Capacity, @LastUpdated, @LastUpdatedBy)"
                                OldValuesParameterFormatString="original_{0}"
                                SelectCommand="SELECT Program.ProgramName, Program.ProgramCost, NewProgram.LocationType, NewProgram.TotalPeople, Format(NewProgram.DateCompleted, 'MM/dd/yyyy') as 'DateCompleted', NewProgram.NewProgramID FROM Program INNER JOIN NewProgram ON Program.ProgramID = NewProgram.ProgramID WHERE upper(NewProgram.LocationType)='ONSITE' ORDER BY NewProgram.DateCompleted DESC"
                                UpdateCommand="UPDATE [Program] SET [ProgramName] = @ProgramName1 AND [ProgramType] = @ProgramType1 AND [ProgramCost] = @ProgramCost1 AND [Capacity] = @Capacity1 AND [LastUpdated] = @LastUpdated1 AND [LastUpdatedBy] = @LastUpdatedBy1 WHERE [ProgramID] = @ProgramID2 AND [ProgramName] = @ProgramName2 AND [ProgramType] = @ProgramType2 AND [ProgramCost] = @ProgramCost2 AND [Capacity] = @Capacity2 AND [LastUpdated] = @LastUpdated2 AND [LastUpdatedBy] = @LastUpdatedBy2">

                                <DeleteParameters>
                                    <asp:Parameter Name="original_ProgramID" Type="Int32" />
                                    <asp:Parameter Name="original_ProgramName" Type="String" />
                                    <asp:Parameter Name="original_ProgramType" />
                                    <asp:Parameter Name="original_ProgramCost" Type="Double" />
                                    <asp:Parameter Name="orginial_Capacity" />
                                    <asp:Parameter Name="original_LastUpdated" DbType="Date" />
                                    <asp:Parameter Name="original_LastUpdatedBy" Type="String" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="AnimalName" />
                                    <asp:Parameter Name="AnimalType" />
                                    <asp:Parameter Name="ProgramCost" Type="Double" />
                                    <asp:Parameter Name="Capacity" Type="Int32" />
                                    <asp:Parameter Name="LastUpdated" DbType="Date" />
                                    <asp:Parameter Name="LastUpdatedBy" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="ProgramName1" Type="String" />
                                    <asp:Parameter Name="ProgramType1" Type="String" />
                                    <asp:Parameter Name="ProgramCost1" Type="Double" />
                                    <asp:Parameter Name="Capacity1" Type="Int32" />
                                    <asp:Parameter Name="LastUpdated1" DbType="Date" />
                                    <asp:Parameter Name="LastUpdatedBy1" Type="String" />
                                    <asp:Parameter Name="ProgramID2" Type="Int32" />
                                    <asp:Parameter Name="ProgramName2" Type="String" />
                                    <asp:Parameter Name="ProgramType2" Type="String" />
                                    <asp:Parameter Name="ProgramCost2" Type="Double" />
                                    <asp:Parameter Name="Capacity2" Type="Int32" />
                                    <asp:Parameter Name="LastUpdated2" DbType="Date" />
                                    <asp:Parameter Name="LastUpdatedBy2" Type="String" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                </div>
            </div>
            <div id="OffSite" class="tab-pane fade">
                <div class="table-responsive">
                    <div class="row mx-auto d-flex justify-content-center">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-s-12">
                            <asp:GridView ID="GridView4" runat="server"
                                HeaderStyle-ForeColor="Black" DateKeyNames="NewProgramID"
                                ItemStyle-ForeColor="black" AutoGenerateColumns="False" CssClass="  table table-condensed table-bordered table-hover AnimalCard"
                                DataSourceID="ProgramSQL2" BackColor="White" HorizontalAlign="Left"
                                AllowSorting="True" OnRowDataBound="GridView1_RowDataBound1" OnSelectedIndexChanged="GridView4_SelectedIndexChanged">

                                <Columns>

                                    <asp:BoundField DataField="ProgramName" HeaderText="Program Name" SortExpression="ProgramName" />
                                    <asp:BoundField DataField="ProgramCost" HeaderText="Program Cost" SortExpression="ProgramCost" DataFormatString="${0:###,###,###.00}" />
                                    <asp:BoundField DataField="LocationType" HeaderText="Location" SortExpression="LocationType" />
                                    <asp:BoundField DataField="TotalPeople" HeaderText="Total People" SortExpression="TotalPeople" />
                                    <asp:BoundField DataField="DateCompleted" HeaderText="Date Completed" SortExpression="DateCompleted" />

                                    <asp:BoundField DataField="NewProgramID" HeaderText="NewProgramID" InsertVisible="False" ReadOnly="True" SortExpression="NewProgramID" Visible="false" />

                                </Columns>
                               <HeaderStyle ForeColor="Black" BackColor="#00c292"></HeaderStyle>
                            </asp:GridView>

                            <asp:SqlDataSource
                                ID="ProgramSQL2"
                                runat="server"
                                ConflictDetection="CompareAllValues"
                                ConnectionString="<%$ ConnectionStrings:connString %>"
                                DeleteCommand="DELETE FROM [Program] WHERE [ProgramID] = @original_ProgramID AND [ProgramName] = @original_ProgramName AND [ProgramType] = @original_ProgramType AND [ProgramCost] = @original_ProgramCost AND [Capacity] = @orginial_Capacity AND [LastUpdated] = @original_LastUpdated AND [LastUpdatedBy] = @original_LastUpdatedBy"
                                InsertCommand="INSERT INTO [Program] ([ProgramName], [ProgramType], [ProgramCost], [Capacity], [LastUpdated], [LastUpdatedBy]) VALUES (@AnimalName, @AnimalType, @ProgramCost, @Capacity, @LastUpdated, @LastUpdatedBy)"
                                OldValuesParameterFormatString="original_{0}"
                                SelectCommand="SELECT Program.ProgramName, Program.ProgramCost, NewProgram.LocationType, NewProgram.TotalPeople, Format(NewProgram.DateCompleted, 'MM/dd/yyyy') as 'DateCompleted', NewProgram.NewProgramID FROM Program INNER JOIN NewProgram ON Program.ProgramID = NewProgram.ProgramID WHERE upper(NewProgram.LocationType)='OFFSITE' ORDER BY NewProgram.DateCompleted DESC"
                                UpdateCommand="UPDATE [Program] SET [ProgramName] = @ProgramName1 AND [ProgramType] = @ProgramType1 AND [ProgramCost] = @ProgramCost1 AND [Capacity] = @Capacity1 AND [LastUpdated] = @LastUpdated1 AND [LastUpdatedBy] = @LastUpdatedBy1 WHERE [ProgramID] = @ProgramID2 AND [ProgramName] = @ProgramName2 AND [ProgramType] = @ProgramType2 AND [ProgramCost] = @ProgramCost2 AND [Capacity] = @Capacity2 AND [LastUpdated] = @LastUpdated2 AND [LastUpdatedBy] = @LastUpdatedBy2">

                                <DeleteParameters>
                                    <asp:Parameter Name="original_ProgramID" Type="Int32" />
                                    <asp:Parameter Name="original_ProgramName" Type="String" />
                                    <asp:Parameter Name="original_ProgramType" />
                                    <asp:Parameter Name="original_ProgramCost" Type="Double" />
                                    <asp:Parameter Name="orginial_Capacity" />
                                    <asp:Parameter Name="original_LastUpdated" DbType="Date" />
                                    <asp:Parameter Name="original_LastUpdatedBy" Type="String" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="AnimalName" />
                                    <asp:Parameter Name="AnimalType" />
                                    <asp:Parameter Name="ProgramCost" Type="Double" />
                                    <asp:Parameter Name="Capacity" Type="Int32" />
                                    <asp:Parameter Name="LastUpdated" DbType="Date" />
                                    <asp:Parameter Name="LastUpdatedBy" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="ProgramName1" Type="String" />
                                    <asp:Parameter Name="ProgramType1" Type="String" />
                                    <asp:Parameter Name="ProgramCost1" Type="Double" />
                                    <asp:Parameter Name="Capacity1" Type="Int32" />
                                    <asp:Parameter Name="LastUpdated1" DbType="Date" />
                                    <asp:Parameter Name="LastUpdatedBy1" Type="String" />
                                    <asp:Parameter Name="ProgramID2" Type="Int32" />
                                    <asp:Parameter Name="ProgramName2" Type="String" />
                                    <asp:Parameter Name="ProgramType2" Type="String" />
                                    <asp:Parameter Name="ProgramCost2" Type="Double" />
                                    <asp:Parameter Name="Capacity2" Type="Int32" />
                                    <asp:Parameter Name="LastUpdated2" DbType="Date" />
                                    <asp:Parameter Name="LastUpdatedBy2" Type="String" />
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
    <%--</div>--%>
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