<%@ Page Title="Programs" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Program.aspx.cs" Inherits="Program" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ScriptManager runat="server"></asp:ScriptManager>
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

    <%--<!-- Content -->
    <div class="content">
        <!-- Animated -->
        <div class="animated fadeIn">--%>
    <!-- Widgets  -->
    <%--<div class="row">

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




            </div>--%>
    <!-- /Widgets -->
    <!--  Traffic  -->
    <div class="card-body">
        <h4 class="box-title">View Program Info</h4>

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
                                <a style="margin-right: 5px; color: black;" class="nav-link active " id="homee-tab" data-toggle="tab" href="#All" role="tab" aria-controls="homee" aria-selected="true">All</a>
                            </li>
                            <li class="nav-item ">
                                <a style="margin-right: 5px; color: black;" class="nav-link" id="home-tab" data-toggle="tab" href="#Online" role="tab" aria-controls="home" aria-selected="false">Online</a>
                            </li>
                            <li class="nav-item ">
                                <a style="margin-right: 5px; color: black;" class="nav-link " id="profile-tab" data-toggle="tab" href="#OnSite" role="tab" aria-controls="profile" aria-selected="false">Onsite</a>
                            </li>
                            <li class="nav-item ">
                                <a style="margin-right: 5px; color: black;" class="nav-link  " id="contact-tab" data-toggle="tab" href="#OffSite" role="tab" aria-controls="contact" aria-selected="false">Offsite</a>
                            </li>

                        </ul>
                        <br />
                        <div class=" ml-auto d-flex justify-content-end row" style="margin-right: 16px;">
                        </div>

                    </div>
                    <br />
                    <div class="tab-content ">
                        <div id="All" class="tab-pane fade show active ">
                            <div class="">
                                <asp:TextBox ID="txtSearchAll" Placeholder=" Program Name or Location" runat="server" type="text" Style="margin-right: 5px;" class="form-control col-xl-3 col-lg-3 col-md-4 col-sm-6" AutoPostBack="True"
                                OnTextChanged="txtSearchAll_TextChanged"></asp:TextBox>
                            <br class="d-md-none" />
                            <asp:Button
                                ID="btnSearchAll"
                                runat="server"
                                CssClass="btn btn-success col-xl-1 col-lg-2 col-md-2 col-sm-2"
                                Text="Search"
                                Style="margin-right: 5px;"
                                OnClick="btnSearchAll_Click" />
                            <br class="d-md-none" />
                            <asp:Button
                                ID="btnClearAll"
                                CssClass="btn col-xl-1 col-md-2 col-lg-2 col-sm-2"
                                runat="server"
                                Text="Clear"
                                Style="background-color: #fb9678; color: #fff; margin-right: 5px;"
                                OnClick="btnClearAll_Click" />
                                <div class="row mx-auto d-flex justify-content-center table-responsive">
                                    <div class=" col-xl-12 col-lg-12 col-md-12 col-s-12 col-xs-12 ">
                                        <asp:GridView ID="GridView5" runat="server"
                                           HeaderStyle-ForeColor="black" DataKeyNames="NewProgramID"
                                            ItemStyle-ForeColor="black" AutoGenerateColumns="False" CssClass="  table table-condensed table-bordered table-hover AnimalCard"
                                            DataSourceID="SqlDataSource1" BackColor="White" HorizontalAlign="Left" EnableSortingAndPagingCallbacks="true"
                                            AllowSorting="True" OnRowDataBound="GridView5_RowDataBound1" OnSelectedIndexChanged="GridView5_SelectedIndexChanged"
                                            SortedDescendingCellStyle-BackColor="#fddfd6" SortedAscendingCellStyle-BackColor="#fddfd6" >

                                            <Columns>

                                                <asp:BoundField DataField="ProgramName" HeaderText="Program Name" SortExpression="ProgramName" />
                                                <asp:BoundField DataField="LocationType" HeaderText="Location" SortExpression="LocationType" />
                                                <asp:BoundField DataField="OrganizationName" HeaderText="Organization Name" SortExpression="OrganizationName" />
                                                <asp:BoundField DataField="TotalPeople" HeaderText="Total People" SortExpression="TotalPeople" />
                                                <asp:BoundField DataField="DateCompleted" HeaderText="Date Completed" SortExpression="DateCompleted" DataFormatString="{0: MM/dd/yyyy}" HtmlEncode="false" />

                                                <asp:BoundField DataField="NewProgramID" HeaderText="NewProgramID" InsertVisible="False" ReadOnly="True" SortExpression="NewProgramID" Visible="false" />

                                            </Columns>
                                            <HeaderStyle ForeColor="#ffffff" BackColor="#00c292"></HeaderStyle>
                                        </asp:GridView>

                                        <asp:SqlDataSource
                                            ID="SqlDataSource1"
                                            runat="server"
                                            FilterExpression="ProgramName LIKE '%{0}%' OR LocationType LIKE '%{1}%' "
                                            ConflictDetection="CompareAllValues"
                                            ConnectionString="<%$ ConnectionStrings:connString %>"
                                            DeleteCommand="DELETE FROM [Program] WHERE [ProgramID] = @original_ProgramID AND [ProgramName] = @original_ProgramName AND [ProgramType] = @original_ProgramType AND [ProgramCost] = @original_ProgramCost AND [Capacity] = @orginial_Capacity AND [LastUpdated] = @original_LastUpdated AND [LastUpdatedBy] = @original_LastUpdatedBy"
                                            InsertCommand="INSERT INTO [Program] ([ProgramName], [ProgramType], [Capacity], [LastUpdated], [LastUpdatedBy]) VALUES (@AnimalName, @AnimalType, @Capacity, @LastUpdated, @LastUpdatedBy)"
                                            OldValuesParameterFormatString="original_{0}"
                                            SelectCommand="SELECT Program.ProgramName, np.LocationType,o.OrganizationName, np.TotalPeople, np.DateCompleted, np.NewProgramID 
FROM Program INNER JOIN NewProgram np ON Program.ProgramID = np.ProgramID 
inner join AssignInvoice ai on ai.NewProgramID = np.NewProgramID
inner join Invoice i on i.invoiceID = ai.InvoiceID
inner join Payment p on p.InvoiceID = i.InvoiceID
inner join Organization o on o.OrganizationID = p.OrganizationID
ORDER BY np.DateCompleted DESC"
                                            UpdateCommand="UPDATE [Program] SET [ProgramName] = @ProgramName1 AND [ProgramType] = @ProgramType1 AND [ProgramCost] = @ProgramCost1 AND [Capacity] = @Capacity1 AND [LastUpdated] = @LastUpdated1 AND [LastUpdatedBy] = @LastUpdatedBy1 WHERE [ProgramID] = @ProgramID2 AND [ProgramName] = @ProgramName2 AND [ProgramType] = @ProgramType2 AND [ProgramCost] = @ProgramCost2 AND [Capacity] = @Capacity2 AND [LastUpdated] = @LastUpdated2 AND [LastUpdatedBy] = @LastUpdatedBy2">
                                            <FilterParameters>
                                                <asp:ControlParameter Name="ProgramName" ControlID="txtSearchAll" PropertyName="Text" Type="String" ConvertEmptyStringToNull="false" />
                                                <asp:ControlParameter Name="LocationType" ControlID="txtSearchAll" PropertyName="Text" Type="String" ConvertEmptyStringToNull="false" />
                                                
                                                
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
                                <asp:TextBox ID="txtSearchOnline" Placeholder=" Program Name or Location" runat="server" type="text" Style="margin-right: 5px;" class="form-control col-xl-3 col-lg-3 col-md-4 col-sm-6" AutoPostBack="True"
                                OnTextChanged="txtSearchOnline_TextChanged"></asp:TextBox>
                            <br class="d-md-none" />
                            <asp:Button
                                ID="btnSearchOnline"
                                runat="server"
                                CssClass="btn btn-success col-xl-1 col-lg-2 col-md-2 col-sm-2"
                                Text="Search"
                                Style="margin-right: 5px;"
                                OnClick="btnSearchOnline_Click" />
                            <br class="d-md-none" />
                            <asp:Button
                                ID="btnClearOnline"
                                CssClass="btn col-xl-1 col-md-2 col-lg-2 col-sm-2"
                                runat="server"
                                Text="Clear"
                                Style="background-color: #fb9678; color: #fff; margin-right: 5px;"
                                OnClick="btnClearOnline_Click" />
                                <div class="row mx-auto d-flex justify-content-center ">
                                    <div class="col-xl-12 col-lg-12 col-md-12 col-s-12">
                                        <asp:GridView ID="GridView1" runat="server"
                                            HeaderStyle-ForeColor="black" DataKeyNames="NewProgramID"
                                            ItemStyle-ForeColor="black" AutoGenerateColumns="False" CssClass="  table table-condensed table-bordered table-hover AnimalCard"
                                            DataSourceID="ProgramSQL" BackColor="White" HorizontalAlign="Left" EnableSortingAndPagingCallbacks="true"
                                            AllowSorting="True" OnRowDataBound="GridView1_RowDataBound1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
                                            SortedDescendingCellStyle-BackColor="#fddfd6" SortedAscendingCellStyle-BackColor="#fddfd6">

                                            <Columns>

                                                <asp:BoundField DataField="ProgramName" HeaderText="Program Name" SortExpression="ProgramName" />
                                                <%--<asp:BoundField DataField="ProgramCost" HeaderText="Program Cost" SortExpression="ProgramCost" DataFormatString="${0:###,###,###.00}" />--%>
                                                <asp:BoundField DataField="LocationType" HeaderText="Location" SortExpression="LocationType" />
                                                <asp:BoundField DataField="OrganizationName" HeaderText="Organization Name" SortExpression="OrganizationName" />
                                                <asp:BoundField DataField="TotalPeople" HeaderText="Total People" SortExpression="TotalPeople" />
                                                <asp:BoundField DataField="DateCompleted" HeaderText="Date Completed" SortExpression="DateCompleted" dataformatstring="{0: MM/dd/yyyy}" htmlencode="false" />

                                                <asp:BoundField DataField="NewProgramID" HeaderText="NewProgramID" InsertVisible="False" ReadOnly="True" SortExpression="NewProgramID" Visible="false" />

                                            </Columns>
                                            <HeaderStyle ForeColor="#ffffff" BackColor="#00c292"></HeaderStyle>
                                        </asp:GridView>

                                        <asp:SqlDataSource
                                            ID="ProgramSQL"
                                            runat="server"
                                            FilterExpression="ProgramName LIKE '%{0}%' OR LocationType LIKE '%{1}%' "
                                            ConflictDetection="CompareAllValues"
                                            ConnectionString="<%$ ConnectionStrings:connString %>"
                                            DeleteCommand="DELETE FROM [Program] WHERE [ProgramID] = @original_ProgramID AND [ProgramName] = @original_ProgramName AND [ProgramType] = @original_ProgramType AND [ProgramCost] = @original_ProgramCost AND [Capacity] = @orginial_Capacity AND [LastUpdated] = @original_LastUpdated AND [LastUpdatedBy] = @original_LastUpdatedBy"
                                            InsertCommand="INSERT INTO [Program] ([ProgramName], [ProgramType], [Capacity], [LastUpdated], [LastUpdatedBy]) VALUES (@AnimalName, @AnimalType, @Capacity, @LastUpdated, @LastUpdatedBy)"
                                            OldValuesParameterFormatString="original_{0}"
                                            SelectCommand="SELECT Program.ProgramName, np.LocationType,o.OrganizationName, np.TotalPeople, np.DateCompleted, np.NewProgramID 
FROM Program INNER JOIN NewProgram np ON Program.ProgramID = np.ProgramID 
inner join AssignInvoice ai on ai.NewProgramID = np.NewProgramID
inner join Invoice i on i.invoiceID = ai.InvoiceID
inner join Payment p on p.InvoiceID = i.InvoiceID
inner join Organization o on o.OrganizationID = p.OrganizationID
WHERE upper(np.LocationType)='ONLINE'
ORDER BY np.DateCompleted DESC"
                                            UpdateCommand="UPDATE [Program] SET [ProgramName] = @ProgramName1 AND [ProgramType] = @ProgramType1 AND [ProgramCost] = @ProgramCost1 AND [Capacity] = @Capacity1 AND [LastUpdated] = @LastUpdated1 AND [LastUpdatedBy] = @LastUpdatedBy1 WHERE [ProgramID] = @ProgramID2 AND [ProgramName] = @ProgramName2 AND [ProgramType] = @ProgramType2 AND [ProgramCost] = @ProgramCost2 AND [Capacity] = @Capacity2 AND [LastUpdated] = @LastUpdated2 AND [LastUpdatedBy] = @LastUpdatedBy2">
                                            <FilterParameters>
                                                <asp:ControlParameter Name="ProgramName" ControlID="txtSearchOnline" PropertyName="Text" Type="String" ConvertEmptyStringToNull="false" />
                                                <asp:ControlParameter Name="LocationType" ControlID="txtSearchOnline" PropertyName="Text" Type="String" ConvertEmptyStringToNull="false" />
                                                
                                                
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
                        <div id="OnSite" class="tab-pane fade">
                            <div class="table-responsive">
                                <asp:TextBox ID="txtSearchOn" Placeholder=" Program Name or Location" runat="server" type="text" Style="margin-right: 5px;" class="form-control col-xl-3 col-lg-3 col-md-4 col-sm-6" AutoPostBack="True"
                                OnTextChanged="txtSearchOn_TextChanged"></asp:TextBox>
                            <br class="d-md-none" />
                            <asp:Button
                                ID="btnSearchOn"
                                runat="server"
                                CssClass="btn btn-success col-xl-1 col-lg-2 col-md-2 col-sm-2"
                                Text="Search"
                                Style="margin-right: 5px;"
                                OnClick="btnSearchOn_Click" />
                            <br class="d-md-none" />
                            <asp:Button
                                ID="btnClearOn"
                                CssClass="btn col-xl-1 col-md-2 col-lg-2 col-sm-2"
                                runat="server"
                                Text="Clear"
                                Style="background-color: #fb9678; color: #fff; margin-right: 5px;"
                                OnClick="btnClearOn_Click" />
                                <div class="row mx-auto d-flex justify-content-center">
                                    <div class="col-xl-12 col-lg-12 col-md-12 col-s-12">
                                        <asp:GridView ID="GridView3" runat="server"
                                            HeaderStyle-ForeColor="black" DataKeyNames="NewProgramID"
                                            ItemStyle-ForeColor="black" AutoGenerateColumns="False" CssClass="  table table-condensed table-bordered table-hover AnimalCard"
                                            DataSourceID="ProgramSQL1" BackColor="White" HorizontalAlign="Left" EnableSortingAndPagingCallbacks="true"
                                            AllowSorting="True" OnRowDataBound="GridView3_RowDataBound1" OnSelectedIndexChanged="GridView3_SelectedIndexChanged"
                                            SortedDescendingCellStyle-BackColor="#fddfd6" SortedAscendingCellStyle-BackColor="#fddfd6">

                                            <Columns>

                                                <asp:BoundField DataField="ProgramName" HeaderText="Program Name" SortExpression="ProgramName" />
                                                <%--<asp:BoundField DataField="ProgramCost" HeaderText="Program Cost" SortExpression="ProgramCost" DataFormatString="${0:###,###,###.00}" />--%>
                                                <asp:BoundField DataField="LocationType" HeaderText="Location" SortExpression="LocationType" />
                                                <asp:BoundField DataField="OrganizationName" HeaderText="Organization Name" SortExpression="OrganizationName" />
                                                <asp:BoundField DataField="TotalPeople" HeaderText="Total People" SortExpression="TotalPeople" />
                                                <asp:BoundField DataField="DateCompleted" HeaderText="Date Completed" SortExpression="DateCompleted" DataFormatString="{0: MM/dd/yyyy}" HtmlEncode="false" />

                                                <asp:BoundField DataField="NewProgramID" HeaderText="NewProgramID" InsertVisible="False" ReadOnly="True" SortExpression="NewProgramID" Visible="false" />

                                            </Columns>
                                            <HeaderStyle ForeColor="#ffffff" BackColor="#00c292"></HeaderStyle>
                                        </asp:GridView>

                                        <asp:SqlDataSource
                                            ID="ProgramSQL1"
                                            runat="server"
                                            FilterExpression="ProgramName LIKE '%{0}%' OR LocationType LIKE '%{1}%' "
                                            ConflictDetection="CompareAllValues"
                                            ConnectionString="<%$ ConnectionStrings:connString %>"
                                            DeleteCommand="DELETE FROM [Program] WHERE [ProgramID] = @original_ProgramID AND [ProgramName] = @original_ProgramName AND [ProgramType] = @original_ProgramType AND [ProgramCost] = @original_ProgramCost AND [Capacity] = @orginial_Capacity AND [LastUpdated] = @original_LastUpdated AND [LastUpdatedBy] = @original_LastUpdatedBy"
                                            InsertCommand="INSERT INTO [Program] ([ProgramName], [ProgramType], [Capacity], [LastUpdated], [LastUpdatedBy]) VALUES (@AnimalName, @AnimalType, @Capacity, @LastUpdated, @LastUpdatedBy)"
                                            OldValuesParameterFormatString="original_{0}"
                                            SelectCommand="SELECT Program.ProgramName, np.LocationType,o.OrganizationName, np.TotalPeople, np.DateCompleted, np.NewProgramID 
FROM Program INNER JOIN NewProgram np ON Program.ProgramID = np.ProgramID 
inner join AssignInvoice ai on ai.NewProgramID = np.NewProgramID
inner join Invoice i on i.invoiceID = ai.InvoiceID
inner join Payment p on p.InvoiceID = i.InvoiceID
inner join Organization o on o.OrganizationID = p.OrganizationID
WHERE upper(np.LocationType)='ONSITE'
ORDER BY np.DateCompleted DESC"
                                            UpdateCommand="UPDATE [Program] SET [ProgramName] = @ProgramName1 AND [ProgramType] = @ProgramType1 AND [ProgramCost] = @ProgramCost1 AND [Capacity] = @Capacity1 AND [LastUpdated] = @LastUpdated1 AND [LastUpdatedBy] = @LastUpdatedBy1 WHERE [ProgramID] = @ProgramID2 AND [ProgramName] = @ProgramName2 AND [ProgramType] = @ProgramType2 AND [ProgramCost] = @ProgramCost2 AND [Capacity] = @Capacity2 AND [LastUpdated] = @LastUpdated2 AND [LastUpdatedBy] = @LastUpdatedBy2">
                                            <FilterParameters>
                                                <asp:ControlParameter Name="ProgramName" ControlID="txtSearchOn" PropertyName="Text" Type="String" ConvertEmptyStringToNull="false" />
                                                <asp:ControlParameter Name="LocationType" ControlID="txtSearchOn" PropertyName="Text" Type="String" ConvertEmptyStringToNull="false" />
                                                
                                                
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
                        <div id="OffSite" class="tab-pane fade">
                            <div class="table-responsive">
                                <asp:TextBox ID="txtSearchOff" Placeholder=" Program Name or Location" runat="server" type="text" Style="margin-right: 5px;" class="form-control col-xl-3 col-lg-3 col-md-4 col-sm-6" AutoPostBack="True"
                                OnTextChanged="txtSearchOff_TextChanged"></asp:TextBox>
                            <br class="d-md-none" />
                            <asp:Button
                                ID="btnSearchOff"
                                runat="server"
                                CssClass="btn btn-success col-xl-1 col-lg-2 col-md-2 col-sm-2"
                                Text="Search"
                                Style="margin-right: 5px;"
                                OnClick="btnSearchOff_Click" />
                            <br class="d-md-none" />
                            <asp:Button
                                ID="btnClearOff"
                                CssClass="btn col-xl-1 col-md-2 col-lg-2 col-sm-2"
                                runat="server"
                                Text="Clear"
                                Style="background-color: #fb9678; color: #fff; margin-right: 5px;"
                                OnClick="btnClearOff_Click" />
                                <div class="row mx-auto d-flex justify-content-center">
                                    <div class="col-xl-12 col-lg-12 col-md-12 col-s-12">
                                        <asp:GridView ID="GridView4" runat="server"
                                            HeaderStyle-ForeColor="black" DataKeyNames="NewProgramID"
                                            ItemStyle-ForeColor="black" AutoGenerateColumns="False" CssClass="  table table-condensed table-bordered table-hover AnimalCard"
                                            DataSourceID="ProgramSQL2" BackColor="White" HorizontalAlign="Left" EnableSortingAndPagingCallbacks="true"
                                            AllowSorting="True" OnRowDataBound="GridView4_RowDataBound1" OnSelectedIndexChanged="GridView4_SelectedIndexChanged"
                                            SortedDescendingCellStyle-BackColor="#fddfd6" SortedAscendingCellStyle-BackColor="#fddfd6">

                                            <Columns>

                                                <asp:BoundField DataField="ProgramName" HeaderText="Program Name" SortExpression="ProgramName" />
                                                <%--<asp:BoundField DataField="ProgramCost" HeaderText="Program Cost" SortExpression="ProgramCost" DataFormatString="${0:###,###,###.00}" />--%>
                                                <asp:BoundField DataField="LocationType" HeaderText="Location" SortExpression="LocationType" />
                                                <asp:BoundField DataField="OrganizationName" HeaderText="Organization Name" SortExpression="OrganizationName" />
                                                <asp:BoundField DataField="TotalPeople" HeaderText="Total People" SortExpression="TotalPeople" />
                                                <asp:BoundField DataField="DateCompleted" HeaderText="Date Completed" SortExpression="DateCompleted" DataFormatString="{0: MM/dd/yyyy}" HtmlEncode="false" />

                                                <asp:BoundField DataField="NewProgramID" HeaderText="NewProgramID" InsertVisible="False" ReadOnly="True" SortExpression="NewProgramID" Visible="false" />

                                            </Columns>
                                            <HeaderStyle ForeColor="#ffffff" BackColor="#00c292"></HeaderStyle>
                                        </asp:GridView>

                                        <asp:SqlDataSource
                                            ID="ProgramSQL2"
                                            runat="server"
                                            FilterExpression="ProgramName LIKE '%{0}%' OR LocationType LIKE '%{1}%' "
                                            ConflictDetection="CompareAllValues"
                                            ConnectionString="<%$ ConnectionStrings:connString %>"
                                            DeleteCommand="DELETE FROM [Program] WHERE [ProgramID] = @original_ProgramID AND [ProgramName] = @original_ProgramName AND [ProgramType] = @original_ProgramType AND [ProgramCost] = @original_ProgramCost AND [Capacity] = @orginial_Capacity AND [LastUpdated] = @original_LastUpdated AND [LastUpdatedBy] = @original_LastUpdatedBy"
                                            InsertCommand="INSERT INTO [Program] ([ProgramName], [ProgramType], [Capacity], [LastUpdated], [LastUpdatedBy]) VALUES (@AnimalName, @AnimalType, @Capacity, @LastUpdated, @LastUpdatedBy)"
                                            OldValuesParameterFormatString="original_{0}"
                                            SelectCommand="SELECT Program.ProgramName, np.LocationType,o.OrganizationName, np.TotalPeople, np.DateCompleted, np.NewProgramID 
FROM Program INNER JOIN NewProgram np ON Program.ProgramID = np.ProgramID 
inner join AssignInvoice ai on ai.NewProgramID = np.NewProgramID
inner join Invoice i on i.invoiceID = ai.InvoiceID
inner join Payment p on p.InvoiceID = i.InvoiceID
inner join Organization o on o.OrganizationID = p.OrganizationID
WHERE upper(np.LocationType)='OFFSITE'
ORDER BY np.DateCompleted DESC"
                                            UpdateCommand="UPDATE [Program] SET [ProgramName] = @ProgramName1 AND [ProgramType] = @ProgramType1 AND [ProgramCost] = @ProgramCost1 AND [Capacity] = @Capacity1 AND [LastUpdated] = @LastUpdated1 AND [LastUpdatedBy] = @LastUpdatedBy1 WHERE [ProgramID] = @ProgramID2 AND [ProgramName] = @ProgramName2 AND [ProgramType] = @ProgramType2 AND [ProgramCost] = @ProgramCost2 AND [Capacity] = @Capacity2 AND [LastUpdated] = @LastUpdated2 AND [LastUpdatedBy] = @LastUpdatedBy2">
                                            <FilterParameters>
                                                <asp:ControlParameter Name="ProgramName" ControlID="txtSearchOff" PropertyName="Text" Type="String" ConvertEmptyStringToNull="false" />
                                                <asp:ControlParameter Name="LocationType" ControlID="txtSearchOff" PropertyName="Text" Type="String" ConvertEmptyStringToNull="false" />
                                                
                                                
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
    <%-- </div>
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
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                    <h3 class="modal-title" style="font-family: 'Open Sans',sans-serif">
                        <asp:Label runat="server" ID="pName"></asp:Label>

                    </h3>
                </div>
                <div class="modal-body p-4" id="resultPrograms" style="background-color: #ffffff">

                    <div class=" ">
                        <div class="row d-flex justify-content-center ">

                            <div class="col-xl-12 col-lg-12 col-md-12 col-s-12 Spacing mx-auto">
                                <label class=""><b>Animals Involved</b> </label>


                                <asp:UpdatePanel runat="server" ID="updateModal">
                                    <ContentTemplate>


                                  <div class="text-left">
                                <asp:GridView ID="GridView2" runat="server" Visible="True" Class="table table-condensed table-bordered table-hover"
                                    BackColor="White" AllowPaging="True" AllowSorting="true" OnSorting="GridView2_Sorting" 
                                    HeaderStyle-BackColor="#00c292" HeaderStyle-ForeColor="White" SortedDescendingCellStyle-BackColor="#fddfd6" 
                                    SortedAscendingCellStyle-BackColor="#fddfd6">

                                            <%--<HeaderStyle ForeColor="#ffffff" BackColor="#00c292"></HeaderStyle>--%>
                                </asp:GridView>

                                  </div>
                                          </ContentTemplate>

                                </asp:UpdatePanel>

                            </div>


                            <script type="text/javascript">
                                function openModal() {
                                    $('#ProgramDetailsModal').modal('show');
                                }
                            </script>

                            <div class="col-xl-12 col-lg-12  col-md-12 col-s-12 Spacing mr-2">
                                <div class=" ">
                                    <asp:Label ID="lblNotes" runat="server" Text="Notes "></asp:Label>
                                    <br />
                                    <asp:TextBox ID="txtNotes" runat="server" style="resize: inherit; max-height: 245px; min-width: 100%; border-color:lightgray" readonly="false" TextMode="multiline" Columns="50" Rows="5"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer" style="background-color: whitesmoke">
                    <asp:Button ID="btnSaveNotes" Text="Save" runat="server" class="btn btn-primary" OnClick="btnSaveNotes_Click" />
                    <button type="button" class="btn btn-success " data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>


    <%--<div class="modal" id="AddModal" tabindex="-1" role="dialog" aria-hidden="true">
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
                </div>
            </div>
        </div>
    </div>--%>

</asp:Content>
