<%@ Page Title="" Language="C#" MasterPageFile="~/VolunteerMasterPage.master" AutoEventWireup="true" CodeFile="VolunteerProgram.aspx.cs" Inherits="VolunteerProgram" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <br />
    <br />
    <br />
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




    <div class="row">
        <div class="col-md-6 mx-auto text-center">
            <h1 class="CardTitle">View Program Info</h1>
        </div>
    </div>


    <div class="row">
        <br />
        <div id="AddAnimalButton" class="col-lg-2 col-md-4 col-s-4  d-flex  mx-auto justify-content-center">
            <asp:Button ID="btnAddProgram"
                runat="server"
                CssClass="btn btn-success"
                UseSubmitBehavior="false"
                CauseValidation="true"
                Text="Add Program"
                OnClick="redirectProgram" />
        </div>
    </div>
    <br />
    <div class="" >
        <div class="row mx-auto d-flex justify-content-center  " >
            <ul class="nav nav-tabs  col-xl-7 col-lg-12 col-md-12 col-s-12 " style=" padding-left:15px; border-bottom:none;" id="myTab" role="tablist">
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
                <li class="nav-item ml-auto">
                    <asp:TextBox ID="txtSearchAll" Placeholder="Search by Program Name" runat="server" AutoPostBack="True"
                                    OnTextChanged="txtSearchAll_TextChanged"></asp:TextBox>
                    <asp:Button
                        ID="btnSearchAll"
                        runat="server" 
                        CssClass="btn btn-success"
                        Text="Search"
                        OnClick="btnSearchAll_Click"/>
                    <asp:Button
                        ID="btnClearAll"
                        CssClass="btn btn-warning"
                        runat="server"
                        Text="Clear"
                        OnClick="btnClearAll_Click" />

                </li>
            </ul>

        </div>
        <div class="tab-content">
            <div id="All" class="tab-pane fade show active">
                <div class="table-responsive">

                    <div class="row mx-auto d-flex justify-content-center ">
                        <div class="col-xl-7 col-lg-12 col-md-12 col-s-12 ">
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
                               <HeaderStyle ForeColor="Black" BackColor="#339933"></HeaderStyle>
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
                        <div class="col-xl-7 col-lg-12 col-md-12 col-s-12 ">
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
                                <HeaderStyle ForeColor="Black" BackColor="#339933"></HeaderStyle>
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
                        <div class="col-xl-7 col-lg-12 col-md-12 col-s-12">
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
                              <HeaderStyle ForeColor="Black" BackColor="#339933"></HeaderStyle>
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
                        <div class="col-xl-7 col-lg-12 col-md-12 col-s-12">
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
                               <HeaderStyle ForeColor="Black" BackColor="#339933"></HeaderStyle>
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

</asp:Content>
