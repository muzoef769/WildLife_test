<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Payment.aspx.cs" Inherits="Payment" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">



    <asp:ScriptManager runat="server"></asp:ScriptManager>



    <!-- Left Panel -->
    <%--<aside id="left-panel" class="left-panel">
        <nav class="navbar navbar-expand-sm navbar-default">
            <div id="main-menu" class="main-menu collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li class="">
                         <a class="" href="Home.aspx"> <i class="menu-icon fa fa-laptop"></i>Home</a>
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
                   <li class="active">
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
        </header>--%>
    <!-- /#header -->
    <!-- Content -->

    <!-- /Widgets -->
    <!--  Traffic  -->
    <div class="card-body">
        <h4 class="box-title">View Payment Info</h4>
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
                                <a style="margin-right: 5px; color: black;" class="nav-link active" id="profile-tab" data-toggle="tab" href="#All" role="tab" aria-controls="profile" aria-selected="true">All Invoices</a>
                            </li>
                            <li class="nav-item ">
                                <a style="margin-right: 5px; color: black;" class="nav-link  " id="homee-tab" data-toggle="tab" href="#Outstanding" role="tab" aria-controls="homee" aria-selected="false">Outstanding Invoices</a>
                            </li>
                            <li class="nav-item ">
                                <a style="margin-right: 5px; color: black;" class="nav-link" id="home-tab" data-toggle="tab" href="#Fufilled" role="tab" aria-controls="home" aria-selected="false">Fulfilled Invoices</a>
                            </li>
                            <li class="nav-item ">
                                <a style="margin-right: 5px; color: black;" class="nav-link" id="cancel-tab" data-toggle="tab" href="#Canceled" role="tab" aria-controls="cancel" aria-selected="false">Canceled Invoices</a>
                            </li>



                        </ul>
                        <br />
                        <div class="ml-auto d-flex justify-content-end row">
                            <%--<asp:TextBox ID="txtYear" runat="server" class="form-control col-xl-3 col-lg-3 col-md-4 col-sm-6" Style="margin-right: 5px;" placeholder="Filter By Year (e.g. '2018')"></asp:TextBox>--%>
                            <asp:DropDownList ID="ddlYear" runat="server" class="form-control" OnSelectedIndexChanged="btnFilter_Click" AutoPostBack="true" AppendDataBoundItems="true" DataSourceID="SqlDataSource1" DataTextField="Column1" DataValueField="Column1">
                                <asp:ListItem Value="0">--Select Year--</asp:ListItem>
                            </asp:DropDownList>


                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:connString %>' SelectCommand="SELECT DISTINCT YEAR(DateCreated) from dbo.Invoice ORDER BY YEAR(DateCreated)"></asp:SqlDataSource>
                            <asp:Button ID="btnFilter" runat="server" class="btn btn-success col-xl-1 col-lg-2 col-md-2 col-sm-2" Style="margin-right: 5px;" Text="Filter By Year" OnClick="btnFilter_Click" />
                            <asp:Button runat="server" class="btn col-xl-2 col-md-2 col-lg-2 col-sm-2" Style="background-color: #fb9678; color: #fff; margin-right: 32px;" ID="dateClear" OnClick="dateClear_Click" Text="Clear" />
                        </div>
                        <div class="ml-auto d-flex justify-content-end row">
                            <asp:TextBox ID="txtInvoiceNum" runat="server" class="form-control col-xl-3 col-lg-3 col-md-4 col-sm-6" Style="margin-right: 5px;" placeholder="Search Invoice # (e.g. 'TEST123')" OnTextChanged="btnFilterNum_Click" AutoPostBack="true"></asp:TextBox>
                            <asp:Button ID="btnFilterNum" runat="server" class="btn btn-success col-xl-1 col-lg-2 col-md-2 col-sm-2" Style="margin-right: 5px;" Text="Search" OnClick="btnFilterNum_Click" />
                            <asp:Button runat="server" class="btn col-xl-2 col-md-2 col-lg-2 col-sm-2" Style="background-color: #fb9678; color: #fff; margin-right: 32px;" ID="btnClearNum" OnClick="btnClearNum_Click" Text="Clear" />
                        </div>

                    </div>
                    <br />
                    <div class="tab-content ">
                        <div id="Outstanding" class="tab-pane fade  ">
                            <div class="">
                                <div class="col-xl-12 col-lg-12 col-md-12 col-s-12">
                                    <div id="outInvoices" style="overflow-x: auto;">
                                        <br />
                                        <asp:UpdatePanel ID="outstandingPan" runat="server">
                                            <ContentTemplate>
                                                <asp:GridView ID="outInvGrid" HeaderStyle-ForeColor="black" runat="server" Class="  table table-condensed table-bordered table-hover AnimalCard" DataKeyNames="InvoiceID" OnRowUpdated="allInvGrid_RowUpdated" EnableSortingAndPagingCallbacks="false" AutoGenerateEditButton="True" AutoGenerateColumns="False" DataSourceID="outstandingSource" AllowPaging="True" AllowSorting="True">
                                                    <HeaderStyle ForeColor="#ffffff" BackColor="#00c292"></HeaderStyle>
                                                    <Columns>
                                                        <asp:BoundField DataField="InvoiceID" HeaderText="InvoiceID" SortExpression="InvoiceID" ReadOnly="true" Visible="False" />
                                                        <asp:TemplateField HeaderText="Invoice #" SortExpression="InvoiceNumber">
                                                            <EditItemTemplate>
                                                                <asp:TextBox ID="txtInvoiceNumOut" runat="server" Text='<%# Bind ("InvoiceNumber") %>'></asp:TextBox>
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblInvoiceNumOut" runat="server" Text='<%# Bind("InvoiceNumber") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Payment Type" SortExpression="PaymentType">
                                                            <EditItemTemplate>
                                                                <asp:DropDownList ID="ddlPayTypeOut" runat="server" SelectedValue='<%# Bind ("PaymentType") %>' OnSelectedIndexChanged="ddlPayTypeOut_SelectedIndexChanged" AutoPostBack="true">
                                                                    <asp:ListItem Value="TBD">TBD</asp:ListItem>
                                                                    <asp:ListItem Value="Cash">Cash</asp:ListItem>
                                                                    <asp:ListItem Value="Check">Check</asp:ListItem>
                                                                    <asp:ListItem Value="Credit/Debit">Credit/Debit</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblPayTypeOut" runat="server" Text='<%# Bind("PaymentType") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="DateCreated" HeaderText="Date Created" SortExpression="DateCreated" ReadOnly="true" dataformatstring="{0: MM/dd/yyyy}"/>
                                                        <asp:BoundField DataField="ProgramName" HeaderText="Program Name" SortExpression="ProgramName" ReadOnly="true" />
                                                        <asp:BoundField DataField="OrganizationName" HeaderText="Organization" SortExpression="OrganizationName" ReadOnly="true" />
                                                        <asp:BoundField DataField="TotalCost" HeaderText="Amount" DataFormatString="{0:C}" SortExpression="TotalCost" ReadOnly="true" />

                                                        <asp:TemplateField HeaderText="Payment Status" SortExpression="InvoiceStatus">
                                                            <EditItemTemplate>
                                                                <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind ("InvoiceStatus") %>' OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
                                                                    <asp:ListItem>Unpaid</asp:ListItem>
                                                                    <asp:ListItem>Paid</asp:ListItem>
                                                                    <asp:ListItem>Canceled</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("InvoiceStatus") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="outInvGrid" EventName="SelectedIndexChanged" />
                                                <asp:AsyncPostBackTrigger ControlID="ddlYear" EventName="SelectedIndexChanged" />

                                            </Triggers>
                                        </asp:UpdatePanel>
                                        <asp:SqlDataSource ID="outstandingSource" runat="server" ConnectionString="<%$ ConnectionStrings:connString %>"
                                            FilterExpression="Convert(DateCreated, 'System.String') LIKE '%{0}%'"
                                            SelectCommand="SELECT        Invoice.InvoiceID, Invoice.InvoiceNumber, Payment.PaymentType, Invoice.DateCreated, Program.ProgramName, Organization.OrganizationName, Invoice.TotalCost, Invoice.InvoiceStatus
                        
FROM            Program INNER JOIN
                         NewProgram ON Program.ProgramID = NewProgram.ProgramID INNER JOIN
                         AssignInvoice ON NewProgram.NewProgramID = AssignInvoice.NewProgramID FULL OUTER JOIN
                         Invoice ON AssignInvoice.AssignInvoiceID = Invoice.InvoiceID FULL OUTER JOIN 
                         Payment ON Invoice.InvoiceID = Payment.InvoiceID LEFT OUTER JOIN
                         Organization ON Payment.OrganizationID = Organization.OrganizationID
WHERE InvoiceStatus = 'Unpaid'"
                                            UpdateCommandType="StoredProcedure"
                                            UpdateCommand="updatePaymentInvoice">
                                            <FilterParameters>
                                                <asp:ControlParameter Name="DateCreated" ControlID="ddlYear" PropertyName="SelectedValue" />
                                                <%--<asp:ControlParameter Name="InvoiceNumber" ControlID="txtInvoiceNum" PropertyName="Text" />--%>
                                            </FilterParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="InvoiceNumber" Type="String" />
                                                <asp:Parameter Name="InvoiceStatus" Type="String" />
                                                <asp:Parameter Name="InvoiceID" Type="String" />
                                                <asp:Parameter Name="PaymentType" Type="String" />
                                            </UpdateParameters>
                                            <DeleteParameters>
                                                <asp:Parameter Name="NewProgramID" Type="String" />
                                            </DeleteParameters>

                                        </asp:SqlDataSource>
                                        <br />
                                        <br />
                                        <asp:Button ID="btnOutstanding" class=" btn btn-success btn-block" runat="server" OnClick="Button2_Click" Text="Export To Excel"></asp:Button>
                                        <br />
                                        <br />

                                    </div>
                                </div>

                            </div>
                        </div>


                        <div id="Fufilled" class="tab-pane fade ">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-s-12">
                                <div id="paidInvoices" style="overflow-x: auto;">
                                    <br />
                                    <asp:UpdatePanel ID="paidPan" runat="server">
                                        <ContentTemplate>
                                            <asp:GridView ID="paidGrid" runat="server" Class="  table table-condensed table-bordered table-hover AnimalCard" HeaderStyle-ForeColor="black" DataKeyNames="InvoiceID" OnRowUpdated="allInvGrid_RowUpdated" AutoGenerateEditButton="True" AutoGenerateColumns="False" DataSourceID="paidSource" AllowPaging="True" AllowSorting="True">
                                                <HeaderStyle ForeColor="#ffffff" BackColor="#00c292"></HeaderStyle>
                                                <Columns>
                                                    <asp:BoundField DataField="InvoiceID" HeaderText="InvoiceID" SortExpression="InvoiceID" ReadOnly="true" Visible="False" />
                                                    <asp:TemplateField HeaderText="Invoice #" SortExpression="InvoiceNumber">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtInvoiceNumFul" runat="server" Text='<%# Bind ("InvoiceNumber") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblInvoiceNumFul" runat="server" Text='<%# Bind("InvoiceNumber") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Payment Type" SortExpression="PaymentType">
                                                        <EditItemTemplate>
                                                            <asp:DropDownList ID="ddlPayType" runat="server" SelectedValue='<%# Bind ("PaymentType") %>' OnSelectedIndexChanged="ddlPayType_SelectedIndexChanged" AutoPostBack="true">
                                                                <asp:ListItem Value="TBD">TBD</asp:ListItem>
                                                                <asp:ListItem Value="Cash">Cash</asp:ListItem>
                                                                <asp:ListItem Value="Check">Check</asp:ListItem>
                                                                <asp:ListItem Value="Credit/Debit">Credit/Debit</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPayType" runat="server" Text='<%# Bind("PaymentType") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="DateCreated" HeaderText="Date Created" SortExpression="DateCreated" ReadOnly="true" dataformatstring="{0: MM/dd/yyyy}"/>
                                                    <asp:BoundField DataField="ProgramName" HeaderText="Program Name" SortExpression="ProgramName" ReadOnly="true" />
                                                    <asp:BoundField DataField="OrganizationName" HeaderText="Organization" SortExpression="OrganizationName" ReadOnly="true" />
                                                    <asp:BoundField DataField="TotalCost" HeaderText="Amount" DataFormatString="{0:C}" SortExpression="TotalCost" ReadOnly="true" />
                                                    <asp:TemplateField HeaderText="Payment Status" SortExpression="InvoiceStatus">
                                                        <EditItemTemplate>
                                                            <asp:DropDownList ID="DropDownList2" runat="server" SelectedValue='<%# Bind ("InvoiceStatus") %>' OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" AutoPostBack="True">
                                                                <asp:ListItem>Unpaid</asp:ListItem>
                                                                <asp:ListItem>Paid</asp:ListItem>
                                                                <asp:ListItem>Canceled</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("InvoiceStatus") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="paidGrid" EventName="SelectedIndexChanged" />
                                            <asp:AsyncPostBackTrigger ControlID="ddlYear" EventName="SelectedIndexChanged" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                    <asp:SqlDataSource ID="paidSource" runat="server" ConnectionString="<%$ ConnectionStrings:connString %>"
                                        FilterExpression="Convert(DateCreated, 'System.String') LIKE '%{0}%'"
                                        SelectCommand="SELECT        Invoice.InvoiceID, Invoice.InvoiceNumber, Payment.PaymentType, Invoice.DateCreated, Program.ProgramName, Organization.OrganizationName, Invoice.TotalCost, Invoice.InvoiceStatus
                        
FROM            Program INNER JOIN
                         NewProgram ON Program.ProgramID = NewProgram.ProgramID INNER JOIN
                         AssignInvoice ON NewProgram.NewProgramID = AssignInvoice.NewProgramID FULL OUTER JOIN
                         Invoice ON AssignInvoice.AssignInvoiceID = Invoice.InvoiceID FULL OUTER JOIN 
                         Payment ON Invoice.InvoiceID = Payment.InvoiceID LEFT OUTER JOIN
                         Organization ON Payment.OrganizationID = Organization.OrganizationID
WHERE InvoiceStatus = 'Paid'"
                                        UpdateCommandType="StoredProcedure"
                                        UpdateCommand="updatePaymentInvoice">
                                        <FilterParameters>
                                            <asp:ControlParameter Name="DateCreated" ControlID="ddlYear" PropertyName="SelectedValue" />
                                        </FilterParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="InvoiceNumber" Type="String" />
                                            <asp:Parameter Name="InvoiceStatus" Type="String" />
                                            <asp:Parameter Name="InvoiceID" Type="String" />
                                            <asp:Parameter Name="PaymentType" Type="String" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>

                                    <br />
                                    <br />
                                    <asp:Button ID="btnFulfilled" class=" btn btn-success btn-block" runat="server" OnClick="Button3_Click" Text="Export To Excel"></asp:Button>
                                    <br />
                                    <br />

                                </div>
                            </div>
                        </div>

                        <div id="All" class="tab-pane fade show active">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-s-12">
                                <div id="allInvoices" style="overflow-x: auto;">
                                    <br />
                                    <asp:UpdatePanel runat="server" ID="updateAllInvoices">
                                        <ContentTemplate>


                                            <asp:GridView ID="allInvGrid" runat="server" Class="  table table-condensed table-bordered table-hover AnimalCard" HeaderStyle-ForeColor="black" DataKeyNames="InvoiceID" AutoGenerateEditButton="True" OnRowUpdated="allInvGrid_RowUpdated" AutoGenerateColumns="False" DataSourceID="programSource" AllowPaging="True" AllowSorting="True">
                                                <HeaderStyle ForeColor="#ffffff" BackColor="#00c292"></HeaderStyle>
                                                <Columns>
                                                    <asp:BoundField DataField="InvoiceID" HeaderText="InvoiceID" SortExpression="InvoiceID" ReadOnly="true" Visible="False" />
                                                    <asp:TemplateField HeaderText="Invoice #" SortExpression="InvoiceNumber">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtInvoiceNumAll" runat="server" Text='<%# Bind ("InvoiceNumber") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblInvoiceNumAll" runat="server" Text='<%# Bind("InvoiceNumber") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Payment Type" SortExpression="PaymentType">
                                                        <EditItemTemplate>
                                                            <asp:DropDownList ID="ddlPayTypeAll" runat="server" SelectedValue='<%# Bind ("PaymentType") %>' OnSelectedIndexChanged="ddlPayTypeAll_SelectedIndexChanged" AutoPostBack="true">
                                                                <asp:ListItem Value="TBD">TBD</asp:ListItem>
                                                                <asp:ListItem Value="Cash">Cash</asp:ListItem>
                                                                <asp:ListItem Value="Check">Check</asp:ListItem>
                                                                <asp:ListItem Value="Credit/Debit">Credit/Debit</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPayTypeAll" runat="server" Text='<%# Bind("PaymentType") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="DateCreated" HeaderText="Date Created" SortExpression="DateCreated" ReadOnly="true" dataformatstring="{0: MM/dd/yyyy}"/>
                                                    <asp:BoundField DataField="ProgramName" HeaderText="Program Name" SortExpression="ProgramName" ReadOnly="true" />
                                                    <asp:BoundField DataField="OrganizationName" HeaderText="Organization" SortExpression="OrganizationName" ReadOnly="true" />
                                                    <asp:BoundField DataField="TotalCost" HeaderText="Amount" DataFormatString="{0:C}" SortExpression="TotalCost" ReadOnly="true" />
                                                    <asp:TemplateField HeaderText="Payment Status" SortExpression="InvoiceStatus">
                                                        <EditItemTemplate>
                                                            <asp:DropDownList ID="DropDownList3" runat="server" SelectedValue='<%# Bind ("InvoiceStatus") %>' OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged" AutoPostBack="True">
                                                                <asp:ListItem>Unpaid</asp:ListItem>
                                                                <asp:ListItem>Paid</asp:ListItem>
                                                                <asp:ListItem>Canceled</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("InvoiceStatus") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>

                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="ddlYear" EventName="SelectedIndexChanged" />
                                        </Triggers>
                                    </asp:UpdatePanel>


                                    <asp:SqlDataSource ID="programSource" runat="server" ConnectionString="<%$ ConnectionStrings:connString %>"
                                        FilterExpression="Convert(DateCreated, 'System.String') LIKE '%{0}%'"
                                        SelectCommand="SELECT        Invoice.InvoiceID, Invoice.InvoiceNumber, Payment.PaymentType, Invoice.DateCreated, Program.ProgramName, Organization.OrganizationName, Invoice.TotalCost, Invoice.InvoiceStatus
                        
FROM            Program INNER JOIN
                         NewProgram ON Program.ProgramID = NewProgram.ProgramID INNER JOIN
                         AssignInvoice ON NewProgram.NewProgramID = AssignInvoice.NewProgramID FULL OUTER JOIN
                         Invoice ON AssignInvoice.AssignInvoiceID = Invoice.InvoiceID FULL OUTER JOIN 
                         Payment ON Invoice.InvoiceID = Payment.InvoiceID LEFT OUTER JOIN
                         Organization ON Payment.OrganizationID = Organization.OrganizationID
                                WHERE InvoiceStatus != 'Canceled'"
                                        UpdateCommandType="StoredProcedure"
                                        UpdateCommand="updatePaymentInvoice">
                                        <FilterParameters>
                                            <asp:ControlParameter Name="DateCreated" ControlID="ddlYear" PropertyName="SelectedValue" />
                                        </FilterParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="InvoiceNumber" Type="String" />
                                            <asp:Parameter Name="InvoiceStatus" Type="String" />
                                            <asp:Parameter Name="InvoiceID" Type="String" />
                                            <asp:Parameter Name="PaymentType" Type="String" />
                                        </UpdateParameters>

                                    </asp:SqlDataSource>

                                    <br />

                                    <asp:Button ID="btnAll" class=" btn btn-success btn-block" runat="server" OnClick="Button1_Click" Text="Export To Excel"></asp:Button>
                                    <br />
                                    <br />

                                </div>
                            </div>
                        </div>

                        <div id="Canceled" class="tab-pane fade">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-s-12">
                                <div id="canceledInv" style="overflow-x: auto;">
                                    <br />
                                    <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                                        <ContentTemplate>


                                            <asp:GridView ID="canceledInvGrid" runat="server" Class="  table table-condensed table-bordered table-hover AnimalCard" HeaderStyle-ForeColor="black" DataKeyNames="InvoiceID" AutoGenerateEditButton="True" OnRowUpdated="allInvGrid_RowUpdated" AutoGenerateColumns="False" DataSourceID="Sqldatasource92" AllowPaging="True" AllowSorting="True">
                                                <HeaderStyle ForeColor="#ffffff" BackColor="#00c292"></HeaderStyle>
                                                <Columns>
                                                    <asp:BoundField DataField="InvoiceID" HeaderText="InvoiceID" SortExpression="InvoiceID" ReadOnly="true" Visible="False" />
                                                    <asp:TemplateField HeaderText="Invoice #" SortExpression="InvoiceNumber">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtInvoiceNumCan" runat="server" Text='<%# Bind ("InvoiceNumber") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblInvoiceNumCan" runat="server" Text='<%# Bind("InvoiceNumber") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Payment Type" SortExpression="PaymentType">
                                                        <EditItemTemplate>
                                                            <asp:DropDownList ID="ddlPayTypeAll" runat="server" SelectedValue='<%# Bind ("PaymentType") %>' OnSelectedIndexChanged="ddlPayTypeAll_SelectedIndexChanged" AutoPostBack="true">
                                                                <asp:ListItem Value="TBD">TBD</asp:ListItem>
                                                                <asp:ListItem Value="Cash">Cash</asp:ListItem>
                                                                <asp:ListItem Value="Check">Check</asp:ListItem>
                                                                <asp:ListItem Value="Credit/Debit">Credit/Debit</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPayTypeAll" runat="server" Text='<%# Bind("PaymentType") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="DateCreated" HeaderText="Date Created" SortExpression="DateCreated" ReadOnly="true" dataformatstring="{0: MM/dd/yyyy}"/>
                                                    <asp:BoundField DataField="ProgramName" HeaderText="Program Name" SortExpression="ProgramName" ReadOnly="true" />
                                                    <asp:BoundField DataField="OrganizationName" HeaderText="Organization" SortExpression="OrganizationName" ReadOnly="true" />
                                                    <asp:BoundField DataField="TotalCost" HeaderText="Amount" DataFormatString="{0:C}" SortExpression="TotalCost" ReadOnly="true" />
                                                    <asp:TemplateField HeaderText="Payment Status" SortExpression="InvoiceStatus">
                                                        <EditItemTemplate>
                                                            <asp:DropDownList ID="DropDownList3" runat="server" SelectedValue='<%# Bind ("InvoiceStatus") %>' OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged" AutoPostBack="True">
                                                                <asp:ListItem>Unpaid</asp:ListItem>
                                                                <asp:ListItem>Paid</asp:ListItem>
                                                                <asp:ListItem>Canceled</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("InvoiceStatus") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>

                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="ddlYear" EventName="SelectedIndexChanged" />
                                        </Triggers>
                                    </asp:UpdatePanel>


                                    <asp:SqlDataSource ID="Sqldatasource92" runat="server" ConnectionString="<%$ ConnectionStrings:connString %>"
                                        FilterExpression="Convert(DateCreated, 'System.String') LIKE '%{0}%'"
                                        SelectCommand="SELECT        Invoice.InvoiceID, Invoice.InvoiceNumber, Payment.PaymentType, Invoice.DateCreated, Program.ProgramName, Organization.OrganizationName, Invoice.TotalCost, Invoice.InvoiceStatus
                        
FROM            Program INNER JOIN
                         NewProgram ON Program.ProgramID = NewProgram.ProgramID INNER JOIN
                         AssignInvoice ON NewProgram.NewProgramID = AssignInvoice.NewProgramID FULL OUTER JOIN
                         Invoice ON AssignInvoice.AssignInvoiceID = Invoice.InvoiceID FULL OUTER JOIN 
                         Payment ON Invoice.InvoiceID = Payment.InvoiceID LEFT OUTER JOIN
                         Organization ON Payment.OrganizationID = Organization.OrganizationID
                                WHERE InvoiceStatus = 'Canceled'"
                                        UpdateCommandType="StoredProcedure"
                                        UpdateCommand="updatePaymentInvoice">
                                        <FilterParameters>
                                            <asp:ControlParameter Name="DateCreated" ControlID="ddlYear" PropertyName="SelectedValue" />
                                        </FilterParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="InvoiceNumber" Type="String" />
                                            <asp:Parameter Name="InvoiceStatus" Type="String" />
                                            <asp:Parameter Name="InvoiceID" Type="String" />
                                            <asp:Parameter Name="PaymentType" Type="String" />
                                        </UpdateParameters>

                                    </asp:SqlDataSource>

                                    <br />

                                    <asp:Button ID="btnCanceled" class=" btn btn-success btn-block" runat="server" OnClick="btnCanceled_Click" Text="Export To Excel"></asp:Button>
                                    <br />
                                    <br />

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
    <%--       </div>
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
                                <asp:GridView ID="GridView2" runat="server" Visible="True" Class="table table-condensed table-bordered table-hover" BackColor="White">

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

