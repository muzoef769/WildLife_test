<%@ Page Title="Animal Report" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="AnimalReport.aspx.cs" Inherits="AnimalReport" EnableEventValidation="false" %>

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
       



              <div class="">
                    <div class="row mr-auto " style="margin-left:8px; margin-bottom:10px;">
                        <ul class="nav nav-tabs  col-xl-12 col-lg-12 col-md-12 col-s-12 " style="padding-left: 15px; border-bottom: none;" id="myTab" role="tablist">
                            <li class="nav-item ">
                                <a style="margin-right: 5px; color: black;" class="nav-link active " id="homee-tab" data-toggle="tab" href="#All" role="tab" aria-controls="homee" aria-selected="true">All</a>
                            </li>
                            <li class="nav-item ">
                                <a style="margin-right: 5px; color: black;" class="nav-link" id="home-tab" data-toggle="tab" href="#Online" role="tab" aria-controls="home" aria-selected="false">Online</a>
                            </li>
                            <li class="nav-item ">
                                <a style="margin-right: 5px; color: black;" class="nav-link " id="profile-tab" data-toggle="tab" href="#Live" role="tab" aria-controls="profile" aria-selected="false">Live</a>
                            </li>

                        </ul>

                    </div>
                </div>
                


    



    <%--VIEW REPORT THROUGH GRIDVIEW--%>


  

    <asp:UpdatePanel ID="updateOnlinePanel" runat="server">
                                                <ContentTemplate>

              <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                               
                                <div class="tab-content">
                    <div id="All" class="tab-pane fade show active">
                        <div class="table-responsive row">



                            <div class="">
                    <div class="row mr-auto " style="margin-left:8px; margin-bottom:10px;">
                        <ul class="nav nav-tabs  col-xl-12 col-lg-12 col-md-12 col-s-12 " style="padding-left: 15px; border-bottom: none;"  role="tablist">
                            <li class="nav-item ">
                                <a style="margin-right: 5px; color: black;" class="nav-link active "  data-toggle="tab" href="#AllGeneral" role="tab" aria-controls="homee" aria-selected="true">General</a>
                            </li>
                            <li class="nav-item ">
                                <a style="margin-right: 5px; color: black;" class="nav-link"  data-toggle="tab" href="#AllAnimal" role="tab" aria-controls="home" aria-selected="false">Animal</a>
                            </li>
                            <li class="nav-item ">
                                <a style="margin-right: 5px; color: black;" class="nav-link "  data-toggle="tab" href="#AllMonthly" role="tab" aria-controls="profile" aria-selected="false">Monthly</a>
                            </li>
                                <li class="nav-item ">
                                <a style="margin-right: 5px; color: black;" class="nav-link "  data-toggle="tab" href="#AllAnnual" role="tab" aria-controls="profile" aria-selected="false">Annual</a>
                            </li>

                        </ul>

                    </div>
                </div>


                            <div class="col-12 mx-auto d-flex justify-content-center ">
                                  <div id="AllGeneral" class="tab-pane fade show active">

                                <div class="col-12">
                                    <div class="card   AnimalReportCard">
                                        <div class="card-body">
                                            <h5 class="card-title">General Animal Report</h5>
                                            <p>
                                                Detailed report of all animals and their associated information
                                            </p>
                                            <div class="col-md-12   Spacing">
                                                <label>Start Date </label>

                                                <asp:TextBox ID="txtAllStart" type="date" runat="server" class="form-control btn-block" Style="background-color: whitesmoke;"></asp:TextBox>
                                                
                                            </div>
                                            <div class="col-md-12   Spacing">
                                                <label>End Date </label>

                                                <asp:TextBox ID="txtAllEnd" type="date" runat="server" class="form-control btn-block" Style="background-color: whitesmoke;"></asp:TextBox>
                                            </div>
                                            <br />

                                            <br />
                                            <asp:LinkButton ID="Button2" runat="server" PostBackUrl="#scrollSpot"
                                                CssClass="btn btn-success"
                                                UseSubmitBehavior="false"
                                                CauseValidation="true"
                                                Text="Generate Report"
                                                OnClick="generateAllGeneral" />
                                        </div>
                                    </div>
                                </div>

                                      </div>
                                <%--END of SEARH BY DATE--%>

                                 <div id="AllAnimal" class="tab-pane fade  ">
                             <div class="col-12">
                                    <div class="card   AnimalReportCard">
                                        <div class="card-body">
                                            <h5 class="card-title">Animal Type Report</h5>
                                            <p>
                                                Detailed report of all animals by Animal Type
                                            </p>

                                            <br />
                                            <asp:DropDownList ID="drpAllType" runat="server" CssClass="btn  dropdown-toggle" Style="background-color: whitesmoke;">
                                                <asp:ListItem>Bird</asp:ListItem>
                                                <asp:ListItem>Mammal</asp:ListItem>
                                                <asp:ListItem>Reptile</asp:ListItem>
                                            </asp:DropDownList>
                                            <br />
                                            <br />

                                            <asp:LinkButton ID="Button3" runat="server" PostBackUrl="#scrollSpot"
                                                CssClass="btn btn-success"
                                                UseSubmitBehavior="false"
                                                CauseValidation="true"
                                                Text="Generate Report"
                                                OnClick="generateAllType" />
                                        </div>
                                    </div>
                                </div>
                                     </div>

                                <%--START OF MONTHLY ANIMAL REPORT--%>
                                <div id="AllMonthly" class="tab-pane fade  ">
                                <div class="col-12">
                                    <div class="card   AnimalReportCard">
                                        <div class="card-body">
                                            <h5 class="card-title">Monthly Animal Report</h5>
                                            <p>
                                                Monthly Animal Report displays all birds, mammals,
                            and reptiles that participated in a program for
                            the selected month.
                                            </p>
                                            <asp:DropDownList ID="drpAllMonthly" runat="server" CssClass="btn  dropdown-toggle" Style="background-color: whitesmoke;">
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
                                            <asp:LinkButton ID="Button4" runat="server" PostBackUrl="#scrollSpot"
                                                CssClass="btn btn-success"
                                                UseSubmitBehavior="false"
                                                CauseValidation="true"
                                                Text="Generate Report"
                                                OnClick="generateAllMonthReport" />
                                        </div>
                                    </div>
                                </div>
     </div>
                                <%--END OF MONTHLY ANIMAL REPORT--%>

                                <%--START OF ANNUAL ANIMAL REPORT--%>
                                    <div id="AllAnnual" class="tab-pane fade  ">
                                <div class="col-12">
                                    <div class="card   AnimalReportCard">
                                        <div class="card-body">
                                            <h5 class="card-title">Annual Animal Report</h5>
                                            <p>
                                                Annual Animal Report displays all birds, mammals,
                            and reptiles that participated in a program for
                            the selected year.
                                            </p>
                                            <asp:DropDownList ID="drpAllAnnually" runat="server" CssClass="btn  dropdown-toggle" Style="background-color: whitesmoke;">
                                                <asp:ListItem>2015</asp:ListItem>
                                                <asp:ListItem>2016</asp:ListItem>
                                                <asp:ListItem>2017</asp:ListItem>
                                                <asp:ListItem>2018</asp:ListItem>
                                            </asp:DropDownList>
                                            <br />
                                            <br />
                                            <asp:LinkButton ID="Button5" runat="server" PostBackUrl="#scrollSpot"
                                                CssClass="btn btn-success"
                                                UseSubmitBehavior="false"
                                                CauseValidation="true"
                                                Text="Generate Report"
                                                OnClick="generateAllAnnualReport" />
                                        </div>
                                    </div>
                                </div>
                            </div></div>



                            <%--VIEW REPORT THROUGH GRIDVIEW--%>


                        




                        </div>
                    </div>

                    <div id="Online" class="tab-pane fade">

                     
                        <div class="table-responsive row">



                            <div class="">
                    <div class="row mr-auto " style="margin-left:8px; margin-bottom:10px;">
                        <ul class="nav nav-tabs  col-xl-12 col-lg-12 col-md-12 col-s-12 " style="padding-left: 15px; border-bottom: none;"  role="tablist">
                            <li class="nav-item ">
                                <a style="margin-right: 5px; color: black;" class="nav-link active "  data-toggle="tab" href="#OnlineGeneral" role="tab" aria-controls="homee" aria-selected="true">General</a>
                            </li>
                            <li class="nav-item ">
                                <a style="margin-right: 5px; color: black;" class="nav-link"  data-toggle="tab" href="#OnlineAnimal" role="tab" aria-controls="home" aria-selected="false">Animal</a>
                            </li>
                            <li class="nav-item ">
                                <a style="margin-right: 5px; color: black;" class="nav-link "  data-toggle="tab" href="#OnlineMonthly" role="tab" aria-controls="profile" aria-selected="false">Monthly</a>
                            </li>
                                <li class="nav-item ">
                                <a style="margin-right: 5px; color: black;" class="nav-link "  data-toggle="tab" href="#OnlineAnnual" role="tab" aria-controls="profile" aria-selected="false">Annual</a>
                            </li>

                        </ul>

                    </div>
                </div>

                            <div class="col-12 mx-auto d-flex justify-content-center ">
                            
                                  <div id="OnlineGeneral" class="tab-pane fade show active">

                                <div class="col-12">
                                    <div class="card   AnimalReportCard">
                                        <div class="card-body">
                                            <h5 class="card-title">Online General Report</h5>
                                            <p>
                                                Detailed report of all animals and their associated information
                                            </p>
                                            <div class="col-md-12  Spacing">
                                                <label>Start Date </label>

                                                <asp:TextBox ID="txtOnlineStart" type="date" runat="server"  class="btn btn-block" Style="background-color: whitesmoke;"></asp:TextBox>
                                            </div>
                                            <div class="col-md-12  Spacing">
                                                <label>End Date </label>

                                                <asp:TextBox ID="txtOnlineEnd" type="date" runat="server"  class="btn btn-block" Style="background-color: whitesmoke;"></asp:TextBox>
                                            </div>
                                            <br />

                                            <br />
                                            
                                            <asp:Button ID="Button7" runat="server"
                                                CssClass="btn btn-success"
                                                UseSubmitBehavior="false"
                                                CauseValidation="true"
                                                Text="Generate Report"
                                                OnClick="generateOnlineGeneral"  />
                                        
                                                    
                                                    </div>
                                    </div>
                                </div>

                                      </div>
                                <%--END of SEARH BY DATE--%>

                                 <div id="OnlineAnimal" class="tab-pane fade  ">
                             <div class="col-12">
                                    <div class="card   AnimalReportCard">
                                        <div class="card-body">
                                            <h5 class="card-title">Online Type Report</h5>
                                            <p>
                                                Detailed report of all animals by Animal Type
                                            </p>

                                            <br />
                                            <asp:DropDownList ID="drpOnlineType" runat="server" CssClass="btn  dropdown-toggle" Style="background-color: whitesmoke;">
                                                <asp:ListItem>Bird</asp:ListItem>
                                                <asp:ListItem>Mammal</asp:ListItem>
                                                <asp:ListItem>Reptile</asp:ListItem>
                                            </asp:DropDownList>
                                            <br />
                                            <br />

                                            <asp:Button ID="Button8" runat="server"
                                                CssClass="btn btn-success"
                                                UseSubmitBehavior="false"
                                                CauseValidation="true"
                                                Text="Generate Report"
                                                OnClick="generateOnlineType" />
                                        </div>
                                    </div>
                                </div>
                                     </div>

                                <%--START OF MONTHLY ANIMAL REPORT--%>
                                <div id="OnlineMonthly" class="tab-pane fade  ">
                                <div class="col-12">
                                    <div class="card   AnimalReportCard">
                                        <div class="card-body ">
                                            <h5 class="card-title">Online Monthly Report</h5>
                                            <p>
                                                Monthly Animal Report displays all birds, mammals,
                            and reptiles that participated in a program for
                            the selected month.
                                            </p>
                                            <asp:DropDownList ID="drpOnlineMonthly" runat="server" CssClass="btn  dropdown-toggle" Style="background-color: whitesmoke;">
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
                                            <asp:Button ID="Button9" runat="server"
                                                CssClass="btn btn-success"
                                                UseSubmitBehavior="false"
                                                CauseValidation="true"
                                                Text="Generate Report"
                                                OnClick="generateOnlineMonthReport" />
                                        </div>
                                    </div>
                                </div>
     </div>
                                <%--END OF MONTHLY ANIMAL REPORT--%>

                                <%--START OF ANNUAL ANIMAL REPORT--%>
                                    <div id="OnlineAnnual" class="tab-pane fade  ">
                                <div class="col-12">
                                    <div class="card   AnimalReportCard">
                                        <div class="card-body">
                                            <h5 class="card-title">Online Annual Report</h5>
                                            <p>
                                                Annual Animal Report displays all birds, mammals,
                            and reptiles that participated in a program for
                            the selected year.
                                            </p>
                                            <asp:DropDownList ID="drpOnlineAnnually" runat="server" CssClass="btn  dropdown-toggle" Style="background-color: whitesmoke;">
                                                <asp:ListItem>2015</asp:ListItem>
                                                <asp:ListItem>2016</asp:ListItem>
                                                <asp:ListItem>2017</asp:ListItem>
                                                <asp:ListItem>2018</asp:ListItem>
                                            </asp:DropDownList>
                                            <br />
                                            <br />
                                            <asp:Button ID="Button10" runat="server"
                                                CssClass="btn btn-success"
                                                UseSubmitBehavior="false"
                                                CauseValidation="true"
                                                Text="Generate Report"
                                                OnClick="generateOnlineAnnualReport" />
                                        </div>
                                    </div>
                                </div>
                            </div>

                                </div>

                            <%--VIEW REPORT THROUGH GRIDVIEW--%>


                        




                        </div>









                        </div>
                  
                
                <div id="Live" class="tab-pane fade">
                        <div class="table-responsive row">



                            <div class="">
                    <div class="row mr-auto " style="margin-left:8px; margin-bottom:10px;">
                        <ul class="nav nav-tabs  col-xl-12 col-lg-12 col-md-12 col-s-12 " style="padding-left: 15px; border-bottom: none;"  role="tablist">
                            <li class="nav-item ">
                                <a style="margin-right: 5px; color: black;" class="nav-link active "  data-toggle="tab" href="#LiveGeneral" role="tab" aria-controls="homee" aria-selected="true">General</a>
                            </li>
                            <li class="nav-item ">
                                <a style="margin-right: 5px; color: black;" class="nav-link"  data-toggle="tab" href="#LiveAnimal" role="tab" aria-controls="home" aria-selected="false">Animal</a>
                            </li>
                            <li class="nav-item ">
                                <a style="margin-right: 5px; color: black;" class="nav-link "  data-toggle="tab" href="#LiveMonthly" role="tab" aria-controls="profile" aria-selected="false">Monthly</a>
                            </li>
                                <li class="nav-item ">
                                <a style="margin-right: 5px; color: black;" class="nav-link "  data-toggle="tab" href="#LiveAnnual" role="tab" aria-controls="profile" aria-selected="false">Annual</a>
                            </li>

                        </ul>

                    </div>
                </div>


                            <div class="col-12 mx-auto d-flex justify-content-center ">
                                  <div id="LiveGeneral" class="tab-pane fade show active">

                                <div class="col-12">
                                    <div class="card   AnimalReportCard">
                                        <div class="card-body">
                                        <h5 class="card-title">Live General Report</h5>
                                        <p>
                                            Detailed report of all animals and their associated information
                                        </p>
                                        <div class="col-md-12   Spacing">
                                            <label>Start Date </label>

                                            <asp:TextBox ID="txtLiveStart" type="date" runat="server"  class="btn btn-block" Style="background-color: whitesmoke;"></asp:TextBox>
                                        </div>
                                        <div class="col-md-12  Spacing">
                                            <label>End Date </label>

                                            <asp:TextBox ID="txtLiveEnd" type="date" runat="server"  class="btn btn-block" Style="background-color: whitesmoke;"></asp:TextBox>
                                        </div>
                                        <br />

                                        <br />
                                        <asp:Button ID="Button1" runat="server"
                                            CssClass="btn btn-success"
                                            UseSubmitBehavior="false"
                                            CauseValidation="true"
                                            Text="Generate Report"
                                            OnClick="generateLiveGeneral" />
                                    </div>
                                    </div>
                                </div>

                                      </div>
                                <%--END of SEARH BY DATE--%>

                                 <div id="LiveAnimal" class="tab-pane fade  ">
                             <div class="col-12">
                                    <div class="card   AnimalReportCard">
                                        <div class="card-body">
                                        <h5 class="card-title">Live Type Report</h5>
                                        <p>
                                            Detailed report of all animals by Animal Type
                                        </p>

                                        <br />
                                        <asp:DropDownList ID="drpLiveType" runat="server" CssClass="btn  dropdown-toggle" Style="background-color: whitesmoke;">
                                            <asp:ListItem>Bird</asp:ListItem>
                                            <asp:ListItem>Mammal</asp:ListItem>
                                            <asp:ListItem>Reptile</asp:ListItem>
                                        </asp:DropDownList>
                                        <br />
                                        <br />

                                        <asp:Button ID="Button6" runat="server"
                                            CssClass="btn btn-success"
                                            UseSubmitBehavior="false"
                                            CauseValidation="true"
                                            Text="Generate Report"
                                            OnClick="generateLiveType" />
                                    </div>
                                    </div>
                                </div>
                                     </div>

                                <%--START OF MONTHLY ANIMAL REPORT--%>
                                <div id="LiveMonthly" class="tab-pane fade  ">
                                <div class="col-12">
                                    <div class="card   AnimalReportCard">
                                        <div class="card-body ">
                                        <h5 class="card-title">Live Monthly Report</h5>
                                        <p>
                                            Monthly Animal Report displays all birds, mammals,
                            and reptiles that participated in a program for
                            the selected month.
                                        </p>
                                        <asp:DropDownList ID="drpLiveMonthly" runat="server" CssClass="btn  dropdown-toggle" Style="background-color: whitesmoke;">
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
                                        <asp:Button ID="Button11" runat="server"
                                            CssClass="btn btn-success"
                                            UseSubmitBehavior="false"
                                            CauseValidation="true"
                                            Text="Generate Report"
                                            OnClick="generateLiveMonthReport" />
                                    </div>
                                    </div>
                                </div>
     </div>
                                <%--END OF MONTHLY ANIMAL REPORT--%>

                                <%--START OF ANNUAL ANIMAL REPORT--%>
                                    <div id="LiveAnnual" class="tab-pane fade  ">
                                <div class="col-12">
                                    <div class="card   AnimalReportCard">
                                        <div class="card-body">
                                        <h5 class="card-title">Live Annual Report</h5>
                                        <p>
                                            Annual Animal Report displays all birds, mammals,
                            and reptiles that participated in a program for
                            the selected year.
                                        </p>
                                        <asp:DropDownList ID="drpLiveAnnually" runat="server" CssClass="btn  dropdown-toggle" Style="background-color: whitesmoke;">
                                            <asp:ListItem>2015</asp:ListItem>
                                            <asp:ListItem>2016</asp:ListItem>
                                            <asp:ListItem>2017</asp:ListItem>
                                            <asp:ListItem>2018</asp:ListItem>
                                        </asp:DropDownList>
                                        <br />
                                        <br />
                                        <asp:Button ID="Button12" runat="server"
                                            CssClass="btn btn-success"
                                            UseSubmitBehavior="false"
                                            CauseValidation="true"
                                            Text="Generate Report"
                                            OnClick="generateLiveAnnualReport" />
                                    </div>
                                    </div>
                                </div>
                            </div></div>



                            <%--VIEW REPORT THROUGH GRIDVIEW--%>


                        




                        </div>
                    </div>





















                        <%--VIEW REPORT THROUGH GRIDVIEW--%>





                    
                </div>


            </div>

                                <div class=" ">

            <div class=" mx-auto  ">
                <div class="card-body align-content-center">
                    <div class="row align-content-center">
                       
                        <div class="table-responsive PaymentContainer  " style="background-color: transparent; padding-top: 0% !important;">
        <div class="row mx-auto ">
            <div class="col-xl-12 col-lg-12 col-md-12 col-s-12 ">
                <div class="col-xl-12 col-lg-12 col-md-12 col-s-12">
                    <asp:GridView ID="grdViewReport" Class=" table table-condensed table-bordered table-hover AnimalCard" AllowSorting="true" OnSorting="grdViewReport_Sorting" runat="server">
                         <HeaderStyle ForeColor="#ffffff" BackColor="#00c292"></HeaderStyle>
                    </asp:GridView>
                </div>
            </div>
        </div>
        <br />
        <div class="row mx-auto">
            
        </div>
    </div>
                                </div>
                        
                 


                     
                </div>
            </div>


        </div>
                                
                            </div>
                            
                        
                    </div><!-- /# column -->
                </div> 

    
</ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="Button7" EventName="Click" />
                                                    <asp:AsyncPostBackTrigger ControlID="Button8" EventName="Click" />
                                                    <asp:AsyncPostBackTrigger ControlID="Button9" EventName="Click" />
                                                    <asp:AsyncPostBackTrigger ControlID="Button10" EventName="Click" />
                                                    <asp:AsyncPostBackTrigger ControlID="Button1" EventName="Click" />
                                                    <asp:AsyncPostBackTrigger ControlID="Button6" EventName="Click" />
                                                    <asp:AsyncPostBackTrigger ControlID="Button11" EventName="Click" />
                                                    <asp:AsyncPostBackTrigger ControlID="Button12" EventName="Click" />
                                                </Triggers>
                                            </asp:UpdatePanel>
    <div class="col-12">
                <asp:Button ID="btnExportToExcel"
                    runat="server"
                    Text="Export To Excel"
                    CssClass="btn btn-block mx-auto d-flex justify-content-center btn-success"
                    
                    OnClick="btnExportToExcel_Click" />
                <br />
            </div>
    <%--END OF ANNUAL ANIMAL REPORT CARD--%>
</asp:Content>



