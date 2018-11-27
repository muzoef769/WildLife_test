﻿<%@ Page Title="Simple Reports" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="SimpleReport.aspx.cs" Inherits="SimpleReport" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
     <script type="text/javascript">
         $(document).ready(function () {
             $("#simpleTab").hide();
             $(function () {
                 $("#tabCheckBox").change(function () {
                     if ($(this).is(":checked")) {
                         $("#simpleTab").show(10000);
                         $("#programTotals").hide(10000);
                         $("#programTitle").hide(10000);

                     } else {
                         $("#simpleTab").hide(10000);
                         $("#programTotals").show(10000);
                         $("#programTitle").show(10000);
                     }
                 });
             });
         });


         $(document).ready(function () {
             $("#report").addClass('active');


         });
         <div class="card-body">
             <h4 class="box-title">View Report Info</h4>
         </div>
             <div class="row">
                 <div class="col-md-12">
                     <div class="card">
                         <div class="card-body">

                             <div class="row"></div>
                             <div class=" " >
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
            <ul class="nav nav-tabs  col-xl-12 col-lg-12 col-md-12 col-s-12 " id="myTab" style=" padding-left:15px; border-bottom:none;"  role="tablist">
                <li class="nav-item ">
                    <a style=" margin-right:5px; color:black;"class="nav-link active " id="homee-tab" data-toggle="tab" href="#ProgramTotal" role="tab" aria-controls="homee" aria-selected="true">Program Totals</a>
                </li>
                <li class="nav-item ">
                    <a style=" margin-right:5px; color:black;"class="nav-link" id="home-tab" data-toggle="tab" href="#Annual" role="tab" aria-controls="home" aria-selected="false">Annual Animal View</a>
                </li>
                  
                
               
               
            </ul>
                                  
                           

        </div>
                    
                             <div class="tab-content ">
            <div id="ProgramTotal" class="tab-pane fade show active ">
                <div class="ml-auto d-flex justify-content-center row">
                    
                    <div id="tab-toggle" style="margin-top: 15px;">
                                    <label for="tabCheckBox">Interactive View</label>
                                    <input id="tabCheckBox" type="checkbox" data-toggle="toggle">
                                </div>
                                <%--<asp:TextBox ID="txtYear" runat="server" Style=" margin-right:5px;" class="form-control col-xl-3 col-lg-3 col-md-4 col-sm-6" placeholder="Filter By Year (e.g. '2018')"></asp:TextBox>
                                    <asp:Button ID="btnFilter" runat="server" Style=" margin-right:5px;" Class="btn btn-success col-xl-2 col-lg-2 col-md-2 col-sm-2" Text="Filter By Year" OnClick="btnFilter_Click" />
                                    <asp:Button runat="server"  Style="background-color: #fb9678; color: #fff;" Class="btn col-xl-2 col-lg-2 col-md-2 col-sm-2" id="dateClear" OnClick="dateClear_Click" Text="Clear Filter"/>
                                    <asp:RegularExpressionValidator ValidationExpression="^\d{4}$" ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter a valid year (e.g. '2018')" ControlToValidate="txtYear" />--%>

                            </div>
               
                <div id="simpleTab" class="row table-responsive" style="width: 85%;">
                     <div class='tableauPlaceholder' id='viz1543202166509' style='position: relative'><noscript><a href='#'><img alt=' ' src='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Pr&#47;ProgramTotals&#47;Dashboard1&#47;1_rss.png' style='border: none' /></a></noscript><object class='tableauViz'  style='display:none;'><param name='host_url' value='https%3A%2F%2Fpublic.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='site_root' value='' /><param name='name' value='ProgramTotals&#47;Dashboard1' /><param name='tabs' value='no' /><param name='toolbar' value='yes' /><param name='static_image' value='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Pr&#47;ProgramTotals&#47;Dashboard1&#47;1.png' /> <param name='animate_transition' value='yes' /><param name='display_static_image' value='yes' /><param name='display_spinner' value='yes' /><param name='display_overlay' value='yes' /><param name='display_count' value='yes' /><param name='filter' value='publish=yes' /></object></div>                <script type='text/javascript'>                    var divElement = document.getElementById('viz1543202166509'); var vizElement = divElement.getElementsByTagName('object')[0]; vizElement.style.width = '100%'; vizElement.style.height = (divElement.offsetWidth * 0.75) + 'px'; var scriptElement = document.createElement('script'); scriptElement.src = 'https://public.tableau.com/javascripts/api/viz_v1.js'; vizElement.parentNode.insertBefore(scriptElement, vizElement);                </script>
                    </div>
                
                <div class="">

                    <div class="row mx-auto d-flex justify-content-center table-responsive">
                        <div class=" col-xl-12 col-lg-12 col-md-12 col-s-12 col-xs-12 ">
                        <div id="programTotals" class="row table-responsive" overflow-x: hidden">


                             <a class="col-form-label">Year:</a>
                <asp:DropDownList ID="ddlYearFilter" CssClass="btn-sm" runat="server" OnSelectedIndexChanged="ddlYearFilter_SelectedIndexChanged" AutoPostBack="true">
                        <asp:ListItem Value="2015">2015</asp:ListItem>
                        <asp:ListItem Value="2016">2016</asp:ListItem>
                        <asp:ListItem Value="2017">2017</asp:ListItem>
                        <asp:ListItem Value="2018">2018</asp:ListItem>
                    </asp:DropDownList>
                <br />

                                        <div class="col-md-12  table  table-bordered table-hover AnimalCard " style="min-width: 113% !important;">
                                            <asp:gridview id="offsiteGrid" headerstyle-forecolor="black" runat="server" autogeneratecolumns="False" datasourceid="source6" gridlines="Both" width="1200px">
                                               <HeaderStyle ForeColor="#ffffff" BackColor="#00c292"></HeaderStyle>
                                                <Columns>
                                                    <asp:BoundField DataField="YEAR(DateCompleted)" Visible="false" />
                                                    <asp:BoundField HeaderStyle-Width="200px" DataField="LocationType" HeaderText="Program Totals" SortExpression="LocationType" />
                                                    <asp:BoundField DataField="January" ItemStyle-Width="75px" HeaderText="Jan" SortExpression="January" />
                                                    <asp:BoundField DataField="February" ItemStyle-Width="75px" HeaderText="Feb" SortExpression="February" />
                                                    <asp:BoundField DataField="March" ItemStyle-Width="75px" HeaderText="Mar" SortExpression="March" />
                                                    <asp:BoundField DataField="April" ItemStyle-Width="75px" HeaderText="Apr" SortExpression="April" />
                                                    <asp:BoundField DataField="May" ItemStyle-Width="75px" HeaderText="May" SortExpression="May" />
                                                    <asp:BoundField DataField="June" ItemStyle-Width="75px" HeaderText="Jun" SortExpression="June" />
                                                    <asp:BoundField DataField="July" ItemStyle-Width="75px" HeaderText="Jul" SortExpression="July" />
                                                    <asp:BoundField DataField="August" ItemStyle-Width="75px" HeaderText="Aug" SortExpression="August" />
                                                    <asp:BoundField DataField="September" ItemStyle-Width="75px" HeaderText="Sep" SortExpression="September" />
                                                    <asp:BoundField DataField="October" ItemStyle-Width="75px" HeaderText="Oct" SortExpression="October" />
                                                    <asp:BoundField DataField="November" ItemStyle-Width="75px" HeaderText="Nov" SortExpression="November" />
                                                    <asp:BoundField DataField="December" ItemStyle-Width="75px" HeaderText="Dec" SortExpression="December" />
                                                    <asp:BoundField ItemStyle-Font-Bold="true" ItemStyle-Width="100px" DataField="Total" HeaderText="Total" SortExpression="Total" />
                                                </Columns>
                                            </asp:gridview>
                                            <asp:sqldatasource id="source6" runat="server" connectionstring="<%$ ConnectionStrings:connString %>" selectcommand="SELECT DISTINCT YEAR(DateCompleted) as 'DateCompleted', LocationType,
                            (select count(LocationType) from NewProgram where Month(DateCompleted) = '1' and LocationType = 'Offsite' and YEAR(DateCompleted) = @year) January, 
                            (select count(LocationType) from NewProgram where Month(DateCompleted) = '2' and LocationType = 'Offsite' and YEAR(DateCompleted) = @year) February,
                            (select count(LocationType) from NewProgram where Month(DateCompleted) = '3' and LocationType = 'Offsite' and YEAR(DateCompleted) = @year) March,
                            (select count(LocationType) from NewProgram where Month(DateCompleted) = '4' and LocationType = 'Offsite' and YEAR(DateCompleted) = @year) April,
                            (select count(LocationType) from NewProgram where Month(DateCompleted) = '5' and LocationType = 'Offsite' and YEAR(DateCompleted) = @year) May,
                            (select count(LocationType) from NewProgram where Month(DateCompleted) = '6' and LocationType = 'Offsite' and YEAR(DateCompleted) = @year) June,
                            (select count(LocationType) from NewProgram where Month(DateCompleted) = '7' and LocationType = 'Offsite' and YEAR(DateCompleted) = @year) July,
                            (select count(LocationType) from NewProgram where Month(DateCompleted) = '8' and LocationType = 'Offsite' and YEAR(DateCompleted) = @year) August,
                            (select count(LocationType) from NewProgram where Month(DateCompleted) = '9' and LocationType = 'Offsite' and YEAR(DateCompleted) = @year) September,
                            (select count(LocationType) from NewProgram where Month(DateCompleted) = '10' and LocationType = 'Offsite' and YEAR(DateCompleted) = @year) October,
                            (select count(LocationType) from NewProgram where Month(DateCompleted) = '11' and LocationType = 'Offsite' and YEAR(DateCompleted) = @year) November,
                            (select count(LocationType) from NewProgram where Month(DateCompleted) = '12' and LocationType = 'Offsite' and YEAR(DateCompleted) = @year) December,
                            (select count(LocationType) from NewProgram where LocationType='Offsite' and YEAR(DateCompleted) = @year) 'Total'
                            from NewProgram where LocationType = 'Offsite' group by LocationType, DateCompleted"
                                                FilterExpression="Convert(DateCompleted, 'System.String') like '%{0}%'">
                                                <FilterParameters>
                                                    <asp:ControlParameter Name="DateCompleted" ControlID="ddlYearFilter" PropertyName="SelectedValue" />
                                                </FilterParameters>
                                                <SelectParameters>
                                                    <asp:ControlParameter Name="year" ControlID="ddlYearFilter" PropertyName="SelectedValue" />

                                                </SelectParameters>
                                            </asp:sqldatasource>
                                            <asp:gridview id="onlineGrid" runat="server" autogeneratecolumns="False" datasourceid="source5" gridlines="Both" width="1200px" showheader="False">
                                                <AlternatingRowStyle BackColor="White" BorderColor="Black" BorderStyle="None" />
                                                <Columns>
                                                    <asp:BoundField DataField="YEAR(DateCompleted)" Visible="false" />
                                                    <asp:BoundField ItemStyle-Width="200px" DataField="LocationType" HeaderText="Type" SortExpression="LocationType" />
                                                    <asp:BoundField DataField="January" ItemStyle-Width="75px" HeaderText="January" SortExpression="January" />
                                                    <asp:BoundField DataField="February" ItemStyle-Width="75px" HeaderText="February" SortExpression="February" />
                                                    <asp:BoundField DataField="March" ItemStyle-Width="75px" HeaderText="March" SortExpression="March" />
                                                    <asp:BoundField DataField="April" ItemStyle-Width="75px" HeaderText="April" SortExpression="April" />
                                                    <asp:BoundField DataField="May" ItemStyle-Width="75px" HeaderText="May" SortExpression="May" />
                                                    <asp:BoundField DataField="June" ItemStyle-Width="75px" HeaderText="June" SortExpression="June" />
                                                    <asp:BoundField DataField="July" ItemStyle-Width="75px" HeaderText="July" SortExpression="July" />
                                                    <asp:BoundField DataField="August" ItemStyle-Width="75px" HeaderText="August" SortExpression="August" />
                                                    <asp:BoundField DataField="September" ItemStyle-Width="75px" HeaderText="September" SortExpression="September" />
                                                    <asp:BoundField DataField="October" ItemStyle-Width="75px" HeaderText="October" SortExpression="October" />
                                                    <asp:BoundField DataField="November" ItemStyle-Width="75px" HeaderText="November" SortExpression="November" />
                                                    <asp:BoundField DataField="December" ItemStyle-Width="75px" HeaderText="December" SortExpression="December" />
                                                    <asp:BoundField ItemStyle-Font-Bold="true" ItemStyle-Width="100px" DataField="Total" HeaderText="Total" SortExpression="Total" />
                                                </Columns>
                                            </asp:gridview>
                                            <asp:sqldatasource id="source5" runat="server" connectionstring="<%$ ConnectionStrings:connString %>" selectcommand="SELECT DISTINCT YEAR(DateCompleted) as 'DateCompleted', LocationType,
                            (select count(LocationType) from NewProgram where Month(DateCompleted) = '1' and LocationType = 'Online' and YEAR(DateCompleted) = @year) January, 
                            (select count(LocationType) from NewProgram where Month(DateCompleted) = '2' and LocationType = 'Online' and YEAR(DateCompleted) = @year) February,
                            (select count(LocationType) from NewProgram where Month(DateCompleted) = '3' and LocationType = 'Online' and YEAR(DateCompleted) = @year) March,
                            (select count(LocationType) from NewProgram where Month(DateCompleted) = '4' and LocationType = 'Online' and YEAR(DateCompleted) = @year) April,
                            (select count(LocationType) from NewProgram where Month(DateCompleted) = '5' and LocationType = 'Online' and YEAR(DateCompleted) = @year) May,
                            (select count(LocationType) from NewProgram where Month(DateCompleted) = '6' and LocationType = 'Online' and YEAR(DateCompleted) = @year) June,
                            (select count(LocationType) from NewProgram where Month(DateCompleted) = '7' and LocationType = 'Online' and YEAR(DateCompleted) = @year) July,
                            (select count(LocationType) from NewProgram where Month(DateCompleted) = '8' and LocationType = 'Online' and YEAR(DateCompleted) = @year) August,
                            (select count(LocationType) from NewProgram where Month(DateCompleted) = '9' and LocationType = 'Online' and YEAR(DateCompleted) = @year) September,
                            (select count(LocationType) from NewProgram where Month(DateCompleted) = '10' and LocationType = 'Online' and YEAR(DateCompleted) = @year) October,
                            (select count(LocationType) from NewProgram where Month(DateCompleted) = '11' and LocationType = 'Online' and YEAR(DateCompleted) = @year) November,
                            (select count(LocationType) from NewProgram where Month(DateCompleted) = '12' and LocationType = 'Online' and YEAR(DateCompleted) = @year) December,
                            (select count(LocationType) from NewProgram where LocationType='Online' and YEAR(DateCompleted) = @year) 'Total'
                            from NewProgram where LocationType = 'Online' group by LocationType, DateCompleted"
                                                FilterExpression="Convert(DateCompleted, 'System.String') LIKE '%{0}%'">
                                                <FilterParameters>
                                                    <asp:ControlParameter Name="DateCompleted" ControlID="ddlYearFilter" PropertyName="SelectedValue" />
                                                </FilterParameters>
                                                <SelectParameters>
                                                    <asp:ControlParameter Name="year" ControlID="ddlYearFilter" PropertyName="SelectedValue" />

                                                </SelectParameters>
                                            </asp:sqldatasource>
                                            <asp:gridview id="onsiteGrid" runat="server" autogeneratecolumns="False" datasourceid="source4" width="1200px" gridlines="Both" showheader="False">
                                                <AlternatingRowStyle BackColor="White" BorderColor="Black" BorderStyle="None" />
                                                <Columns>
                                                    <asp:BoundField DataField="YEAR(DateCompleted)" Visible="false" />
                                                    <asp:BoundField ItemStyle-Width="200px" DataField="LocationType" HeaderText="Type" SortExpression="LocationType" />
                                                    <asp:BoundField DataField="January" ItemStyle-Width="75px" HeaderText="January" SortExpression="January" />
                                                    <asp:BoundField DataField="February" ItemStyle-Width="75px" HeaderText="February" SortExpression="February" />
                                                    <asp:BoundField DataField="March" ItemStyle-Width="75px" HeaderText="March" SortExpression="March" />
                                                    <asp:BoundField DataField="April" ItemStyle-Width="75px" HeaderText="April" SortExpression="April" />
                                                    <asp:BoundField DataField="May" ItemStyle-Width="75px" HeaderText="May" SortExpression="May" />
                                                    <asp:BoundField DataField="June" ItemStyle-Width="75px" HeaderText="June" SortExpression="June" />
                                                    <asp:BoundField DataField="July" ItemStyle-Width="75px" HeaderText="July" SortExpression="July" />
                                                    <asp:BoundField DataField="August" ItemStyle-Width="75px" HeaderText="August" SortExpression="August" />
                                                    <asp:BoundField DataField="September" ItemStyle-Width="75px" HeaderText="September" SortExpression="September" />
                                                    <asp:BoundField DataField="October" ItemStyle-Width="75px" HeaderText="October" SortExpression="October" />
                                                    <asp:BoundField DataField="November" ItemStyle-Width="75px" HeaderText="November" SortExpression="November" />
                                                    <asp:BoundField DataField="December" ItemStyle-Width="75px" HeaderText="December" SortExpression="December" />
                                                    <asp:BoundField ItemStyle-Font-Bold="true" ItemStyle-Width="100px" DataField="Total" HeaderText="Total" SortExpression="Total" />
                                                </Columns>
                                            </asp:gridview>
                                            <asp:sqldatasource id="source4" runat="server" connectionstring="<%$ ConnectionStrings:connString %>" selectcommand="SELECT DISTINCT YEAR(DateCompleted) as 'DateCompleted', LocationType,
                            (select count(LocationType) from NewProgram where Month(DateCompleted) = '1' and LocationType = 'Onsite' and YEAR(DateCompleted) = @year) January, 
                            (select count(LocationType) from NewProgram where Month(DateCompleted) = '2' and LocationType = 'Onsite' and YEAR(DateCompleted) = @year) February,
                            (select count(LocationType) from NewProgram where Month(DateCompleted) = '3' and LocationType = 'Onsite' and YEAR(DateCompleted) = @year) March,
                            (select count(LocationType) from NewProgram where Month(DateCompleted) = '4' and LocationType = 'Onsite' and YEAR(DateCompleted) = @year) April,
                            (select count(LocationType) from NewProgram where Month(DateCompleted) = '5' and LocationType = 'Onsite' and YEAR(DateCompleted) = @year) May,
                            (select count(LocationType) from NewProgram where Month(DateCompleted) = '6' and LocationType = 'Onsite' and YEAR(DateCompleted) = @year) June,
                            (select count(LocationType) from NewProgram where Month(DateCompleted) = '7' and LocationType = 'Onsite' and YEAR(DateCompleted) = @year) July,
                            (select count(LocationType) from NewProgram where Month(DateCompleted) = '8' and LocationType = 'Onsite' and YEAR(DateCompleted) = @year) August,
                            (select count(LocationType) from NewProgram where Month(DateCompleted) = '9' and LocationType = 'Onsite' and YEAR(DateCompleted) = @year) September,
                            (select count(LocationType) from NewProgram where Month(DateCompleted) = '10' and LocationType = 'Onsite' and YEAR(DateCompleted) = @year) October,
                            (select count(LocationType) from NewProgram where Month(DateCompleted) = '11' and LocationType = 'Onsite' and YEAR(DateCompleted) = @year) November,
                            (select count(LocationType) from NewProgram where Month(DateCompleted) = '12' and LocationType = 'Onsite' and YEAR(DateCompleted) = @year) December,
                            (select count(LocationType) from NewProgram where LocationType='Onsite' and YEAR(DateCompleted) = @year) 'Total'
                            from NewProgram where LocationType = 'Onsite' group by LocationType, DateCompleted"
                                                FilterExpression="Convert(DateCompleted, 'System.String') LIKE '%{0}%'">
                                                <FilterParameters>
                                                    <asp:ControlParameter Name="DateCompleted" ControlID="ddlYearFilter" PropertyName="SelectedValue" />
                                                </FilterParameters>
                                                <SelectParameters>
                                                    <asp:ControlParameter Name="year" ControlID="ddlYearFilter" PropertyName="SelectedValue" />

                                                </SelectParameters>
                                            </asp:sqldatasource>
                                            <asp:gridview id="totProgramsGrid" runat="server" autogeneratecolumns="False" datasourceid="source7" width="1200px" showheader="False">
                                                <AlternatingRowStyle BackColor="White" BorderColor="Black" BorderStyle="None" />
                                                <Columns>
                                                    <asp:BoundField DataField="YEAR(DateCompleted)" Visible="false" />
                                                    <asp:TemplateField ItemStyle-Font-Bold="true" ItemStyle-Width="200px">
                                                        <ItemTemplate>
                                                            Total Programs
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField ItemStyle-Font-Bold="true" ItemStyle-Width="75px" DataField="January" HeaderText="January" SortExpression="January" />
                                                    <asp:BoundField ItemStyle-Font-Bold="true" ItemStyle-Width="75px" DataField="February" HeaderText="February" SortExpression="February" />
                                                    <asp:BoundField ItemStyle-Font-Bold="true" ItemStyle-Width="75px" DataField="March" HeaderText="March" SortExpression="March" />
                                                    <asp:BoundField ItemStyle-Font-Bold="true" ItemStyle-Width="75px" DataField="April" HeaderText="April" SortExpression="April" />
                                                    <asp:BoundField ItemStyle-Font-Bold="true" ItemStyle-Width="75px" DataField="May" HeaderText="May" SortExpression="May" />
                                                    <asp:BoundField ItemStyle-Font-Bold="true" ItemStyle-Width="75px" DataField="June" HeaderText="June" SortExpression="June" />
                                                    <asp:BoundField ItemStyle-Font-Bold="true" ItemStyle-Width="75px" DataField="July" HeaderText="July" SortExpression="July" />
                                                    <asp:BoundField ItemStyle-Font-Bold="true" ItemStyle-Width="75px" DataField="August" HeaderText="August" SortExpression="August" />
                                                    <asp:BoundField ItemStyle-Font-Bold="true" ItemStyle-Width="75px" DataField="September" HeaderText="September" SortExpression="September" />
                                                    <asp:BoundField ItemStyle-Font-Bold="true" ItemStyle-Width="75px" DataField="October" HeaderText="October" SortExpression="October" />
                                                    <asp:BoundField ItemStyle-Font-Bold="true" ItemStyle-Width="75px" DataField="November" HeaderText="November" SortExpression="November" />
                                                    <asp:BoundField ItemStyle-Font-Bold="true" ItemStyle-Width="75px" DataField="December" HeaderText="December" SortExpression="December" />
                                                    <asp:BoundField ItemStyle-Font-Bold="true" ItemStyle-Width="100px" DataField="Total" HeaderText="Total" SortExpression="Total" />
                                                </Columns>
                                            </asp:gridview>
                                            <asp:sqldatasource id="source7" runat="server" connectionstring="<%$ ConnectionStrings:connString %>" selectcommand="SELECT DISTINCT YEAR(DateCompleted) as 'DateCompleted',
                                (select count(LocationType) from NewProgram where Month(DateCompleted) = '1' and YEAR(DateCompleted) = @year) January, 
                                (select count(LocationType) from NewProgram where Month(DateCompleted) = '2' and YEAR(DateCompleted) = @year) February,
                                (select count(LocationType) from NewProgram where Month(DateCompleted) = '3' and YEAR(DateCompleted) = @year) March,
                                (select count(LocationType) from NewProgram where Month(DateCompleted) = '4' and YEAR(DateCompleted) = @year) April,
                                (select count(LocationType) from NewProgram where Month(DateCompleted) = '5' and YEAR(DateCompleted) = @year) May,
                                (select count(LocationType) from NewProgram where Month(DateCompleted) = '6' and YEAR(DateCompleted) = @year) June,
                                (select count(LocationType) from NewProgram where Month(DateCompleted) = '7' and YEAR(DateCompleted) = @year) July,
                                (select count(LocationType) from NewProgram where Month(DateCompleted) = '8' and YEAR(DateCompleted) = @year) August,
                                (select count(LocationType) from NewProgram where Month(DateCompleted) = '9' and YEAR(DateCompleted) = @year) September,
                                (select count(LocationType) from NewProgram where Month(DateCompleted) = '10' and YEAR(DateCompleted) = @year) October,
                                (select count(LocationType) from NewProgram where Month(DateCompleted) = '11' and YEAR(DateCompleted) = @year) November,
                                (select count(LocationType) from NewProgram where Month(DateCompleted) = '12' and YEAR(DateCompleted) = @year) December,
                                (select count(LocationType) from NewProgram where YEAR(DateCompleted) = @year) 'Total'
                                from NewProgram group by LocationType, DateCompleted"
                                                FilterExpression="Convert(DateCompleted, 'System.String') LIKE '%{0}%'">
                                                <FilterParameters>
                                                    <asp:ControlParameter Name="DateCompleted" ControlID="ddlYearFilter" PropertyName="SelectedValue" />
                                                </FilterParameters>
                                                <SelectParameters>
                                                    <asp:ControlParameter Name="year" ControlID="ddlYearFilter" PropertyName="SelectedValue" />

                                                </SelectParameters>
                                            </asp:sqldatasource>
                                            <asp:gridview id="totKidsGrid" runat="server" autogeneratecolumns="False" datasourceid="source2" width="1200px" showheader="False">
                                                <AlternatingRowStyle BackColor="White" BorderColor="Black" BorderStyle="None" />
                                                <Columns>
                                                    <asp:BoundField DataField="YEAR(DateCompleted)" Visible="false" />
                                                    <asp:TemplateField ItemStyle-Width="200px">
                                                        <ItemTemplate>
                                                            Children
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField ItemStyle-Width="75px" DataField="January" HeaderText="January" SortExpression="January" ControlStyle-Width="75px" />
                                                    <asp:BoundField ItemStyle-Width="75px" DataField="February" HeaderText="February" SortExpression="February" ControlStyle-Width="75px" />
                                                    <asp:BoundField ItemStyle-Width="75px" DataField="March" HeaderText="March" SortExpression="March" ControlStyle-Width="75px" />
                                                    <asp:BoundField ItemStyle-Width="75px" DataField="April" HeaderText="April" SortExpression="April" ControlStyle-Width="75px" />
                                                    <asp:BoundField ItemStyle-Width="75px" DataField="May" HeaderText="May" SortExpression="May" ControlStyle-Width="75px" />
                                                    <asp:BoundField ItemStyle-Width="75px" DataField="June" HeaderText="June" SortExpression="June" ControlStyle-Width="75px" />
                                                    <asp:BoundField ItemStyle-Width="75px" DataField="July" HeaderText="July" SortExpression="July" ControlStyle-Width="75px" />
                                                    <asp:BoundField ItemStyle-Width="75px" DataField="August" HeaderText="August" SortExpression="August" ControlStyle-Width="75px" />
                                                    <asp:BoundField ItemStyle-Width="75px" DataField="September" HeaderText="September" SortExpression="September" ControlStyle-Width="75px" />
                                                    <asp:BoundField ItemStyle-Width="75px" DataField="October" HeaderText="October" SortExpression="October" ControlStyle-Width="75px" />
                                                    <asp:BoundField ItemStyle-Width="75px" DataField="November" HeaderText="November" SortExpression="November" ControlStyle-Width="75px" />
                                                    <asp:BoundField ItemStyle-Width="75px" DataField="December" HeaderText="December" SortExpression="December" ControlStyle-Width="75px" />
                                                    <asp:BoundField ItemStyle-Width="100px" ItemStyle-Font-Bold="true" DataField="Total" HeaderText="Total" SortExpression="Total" ControlStyle-Width="100px" />
                                                </Columns>
                                            </asp:gridview>
                                            <asp:sqldatasource id="source2" runat="server" connectionstring="<%$ ConnectionStrings:connString %>" selectcommand="SELECT DISTINCT YEAR(DateCompleted) as 'DateCompleted',
                            (select isnull(sum(TotalKids), 0) from NewProgram where Month(DateCompleted) = '1' and YEAR(DateCompleted) = @year) January, 
                            (select isnull(sum(TotalKids), 0) from NewProgram where Month(DateCompleted) = '2' and YEAR(DateCompleted) = @year) February,
                            (select isnull(sum(TotalKids), 0) from NewProgram where Month(DateCompleted) = '3' and YEAR(DateCompleted) = @year) March,
                            (select isnull(sum(TotalKids), 0) from NewProgram where Month(DateCompleted) = '4' and YEAR(DateCompleted) = @year) April,
                            (select isnull(sum(TotalKids), 0) from NewProgram where Month(DateCompleted) = '5' and YEAR(DateCompleted) = @year) May,
                            (select isnull(sum(TotalKids), 0) from NewProgram where Month(DateCompleted) = '6' and YEAR(DateCompleted) = @year) June,
                            (select isnull(sum(TotalKids), 0) from NewProgram where Month(DateCompleted) = '7' and YEAR(DateCompleted) = @year) July,
                            (select isnull(sum(TotalKids), 0) from NewProgram where Month(DateCompleted) = '8' and YEAR(DateCompleted) = @year) August,
                            (select isnull(sum(TotalKids), 0) from NewProgram where Month(DateCompleted) = '9' and YEAR(DateCompleted) = @year) September,
                            (select isnull(sum(TotalKids), 0) from NewProgram where Month(DateCompleted) = '10' and YEAR(DateCompleted) = @year) October,
                            (select isnull(sum(TotalKids), 0) from NewProgram where Month(DateCompleted) = '11' and YEAR(DateCompleted) = @year) November,
                            (select isnull(sum(TotalKids), 0) from NewProgram where Month(DateCompleted) = '12' and YEAR(DateCompleted) = @year) December,
                            (select isnull(sum(TotalKids), 0) from NewProgram where YEAR(DateCompleted) = @year) 'Total'
                            from NewProgram group by LocationType, DateCompleted"
                                                FilterExpression="Convert(DateCompleted, 'System.String') LIKE '%{0}%'">
                                                <FilterParameters>
                                                    <asp:ControlParameter Name="DateCompleted" ControlID="ddlYearFilter" PropertyName="SelectedValue" />
                                                </FilterParameters>
                                                <SelectParameters>
                                                    <asp:ControlParameter Name="year" ControlID="ddlYearFilter" PropertyName="SelectedValue" />

                                                </SelectParameters>

                                            </asp:sqldatasource>
                                            <asp:gridview id="totAdultsGrid" runat="server" autogeneratecolumns="False" datasourceid="source3" width="1200px" showheader="false">
                                                <AlternatingRowStyle BackColor="White" BorderColor="Black" BorderStyle="None" />
                                                <Columns>
                                                    <asp:BoundField DataField="YEAR(DateCompleted)" Visible="false" />
                                                    <asp:TemplateField ItemStyle-Width="200px">
                                                        <ItemTemplate>
                                                            Adults
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField ItemStyle-Width="75px" DataField="January" HeaderText="January" SortExpression="January" />
                                                    <asp:BoundField ItemStyle-Width="75px" DataField="February" HeaderText="February" SortExpression="February" />
                                                    <asp:BoundField ItemStyle-Width="75px" DataField="March" HeaderText="March" SortExpression="March" />
                                                    <asp:BoundField ItemStyle-Width="75px" DataField="April" HeaderText="April" SortExpression="April" />
                                                    <asp:BoundField ItemStyle-Width="75px" DataField="May" HeaderText="May" SortExpression="May" />
                                                    <asp:BoundField ItemStyle-Width="75px" DataField="June" HeaderText="June" SortExpression="June" />
                                                    <asp:BoundField ItemStyle-Width="75px" DataField="July" HeaderText="July" SortExpression="July" />
                                                    <asp:BoundField ItemStyle-Width="75px" DataField="August" HeaderText="August" SortExpression="August" />
                                                    <asp:BoundField ItemStyle-Width="75px" DataField="September" HeaderText="September" SortExpression="September" />
                                                    <asp:BoundField ItemStyle-Width="75px" DataField="October" HeaderText="October" SortExpression="October" />
                                                    <asp:BoundField ItemStyle-Width="75px" DataField="November" HeaderText="November" SortExpression="November" />
                                                    <asp:BoundField ItemStyle-Width="75px" DataField="December" HeaderText="December" SortExpression="December" />
                                                    <asp:BoundField ItemStyle-Width="100px" ItemStyle-Font-Bold="true" DataField="Total" HeaderText="Total" SortExpression="Total" />
                                                </Columns>
                                            </asp:gridview>
                                            <asp:sqldatasource id="source3" runat="server" connectionstring="<%$ ConnectionStrings:connString %>" selectcommand="SELECT DISTINCT YEAR(DateCompleted) as 'DateCompleted',
                            (select isnull(sum(TotalAdults), 0) from NewProgram where Month(DateCompleted) = '1' and YEAR(DateCompleted) = @year) January, 
                            (select isnull(sum(TotalAdults), 0) from NewProgram where Month(DateCompleted) = '2' and YEAR(DateCompleted) = @year) February,
                            (select isnull(sum(TotalAdults), 0) from NewProgram where Month(DateCompleted) = '3' and YEAR(DateCompleted) = @year) March,
                            (select isnull(sum(TotalAdults), 0) from NewProgram where Month(DateCompleted) = '4' and YEAR(DateCompleted) = @year) April,
                            (select isnull(sum(TotalAdults), 0) from NewProgram where Month(DateCompleted) = '5' and YEAR(DateCompleted) = @year) May,
                            (select isnull(sum(TotalAdults), 0) from NewProgram where Month(DateCompleted) = '6' and YEAR(DateCompleted) = @year) June,
                            (select isnull(sum(TotalAdults), 0) from NewProgram where Month(DateCompleted) = '7' and YEAR(DateCompleted) = @year) July,
                            (select isnull(sum(TotalAdults), 0) from NewProgram where Month(DateCompleted) = '8' and YEAR(DateCompleted) = @year) August,
                            (select isnull(sum(TotalAdults), 0) from NewProgram where Month(DateCompleted) = '9' and YEAR(DateCompleted) = @year) September,
                            (select isnull(sum(TotalAdults), 0) from NewProgram where Month(DateCompleted) = '10' and YEAR(DateCompleted) = @year) October,
                            (select isnull(sum(TotalAdults), 0) from NewProgram where Month(DateCompleted) = '11' and YEAR(DateCompleted) = @year) November,
                            (select isnull(sum(TotalAdults), 0) from NewProgram where Month(DateCompleted) = '12' and YEAR(DateCompleted) = @year) December,
                            (select isnull(sum(TotalAdults), 0) from NewProgram where YEAR(DateCompleted) = @year) 'Total'
                            from NewProgram group by LocationType, DateCompleted"
                                                FilterExpression="Convert(DateCompleted, 'System.String') LIKE '%{0}%'">
                                                <FilterParameters>
                                                    <asp:ControlParameter Name="DateCompleted" ControlID="ddlYearFilter" PropertyName="SelectedValue" />
                                                </FilterParameters>
                                                <SelectParameters>
                                                    <asp:ControlParameter Name="year" ControlID="ddlYearFilter" PropertyName="SelectedValue" />

                                                </SelectParameters>
                                            </asp:sqldatasource>
                                            <asp:gridview id="totPeopleGrid" runat="server" autogeneratecolumns="False" datasourceid="source1" width="1200px" showheader="false">
                                                <AlternatingRowStyle BackColor="White" BorderColor="Black" BorderStyle="None" />
                                                <Columns>
                                                    <asp:BoundField DataField="Year" Visible="false" />
                                                    <asp:TemplateField ItemStyle-Font-Bold="true" ItemStyle-Width="200px">
                                                        <ItemTemplate>
                                                            Total People
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField ItemStyle-Font-Bold="true" ItemStyle-Width="75px" DataField="January" HeaderText="January" SortExpression="January" />
                                                    <asp:BoundField ItemStyle-Font-Bold="true" ItemStyle-Width="75px" DataField="February" HeaderText="February" SortExpression="February" />
                                                    <asp:BoundField ItemStyle-Font-Bold="true" ItemStyle-Width="75px" DataField="March" HeaderText="March" SortExpression="March" />
                                                    <asp:BoundField ItemStyle-Font-Bold="true" ItemStyle-Width="75px" DataField="April" HeaderText="April" SortExpression="April" />
                                                    <asp:BoundField ItemStyle-Font-Bold="true" ItemStyle-Width="75px" DataField="May" HeaderText="May" SortExpression="May" />
                                                    <asp:BoundField ItemStyle-Font-Bold="true" ItemStyle-Width="75px" DataField="June" HeaderText="June" SortExpression="June" />
                                                    <asp:BoundField ItemStyle-Font-Bold="true" ItemStyle-Width="75px" DataField="July" HeaderText="July" SortExpression="July" />
                                                    <asp:BoundField ItemStyle-Font-Bold="true" ItemStyle-Width="75px" DataField="August" HeaderText="August" SortExpression="August" />
                                                    <asp:BoundField ItemStyle-Font-Bold="true" ItemStyle-Width="75px" DataField="September" HeaderText="September" SortExpression="September" />
                                                    <asp:BoundField ItemStyle-Font-Bold="true" ItemStyle-Width="75px" DataField="October" HeaderText="October" SortExpression="October" />
                                                    <asp:BoundField ItemStyle-Font-Bold="true" ItemStyle-Width="75px" DataField="November" HeaderText="November" SortExpression="November" />
                                                    <asp:BoundField ItemStyle-Font-Bold="true" ItemStyle-Width="75px" DataField="December" HeaderText="December" SortExpression="December" />
                                                    <asp:BoundField ItemStyle-Font-Bold="true" ItemStyle-Width="100px" DataField="Total" HeaderText="Total" SortExpression="Total" />
                                                </Columns>
                                            </asp:gridview>
                                            <asp:sqldatasource id="source1" runat="server" connectionstring="<%$ ConnectionStrings:connString %>" selectcommand="SELECT DISTINCT YEAR(DateCompleted) as 'DateCompleted',
                            (select isnull(sum(TotalPeople), 0) from NewProgram where Month(DateCompleted) = '1' and YEAR(DateCompleted) = @year) January, 
                            (select isnull(sum(TotalPeople), 0) from NewProgram where Month(DateCompleted) = '2' and YEAR(DateCompleted) = @year) February,
                            (select isnull(sum(TotalPeople), 0) from NewProgram where Month(DateCompleted) = '3' and YEAR(DateCompleted) = @year) March,
                            (select isnull(sum(TotalPeople), 0) from NewProgram where Month(DateCompleted) = '4' and YEAR(DateCompleted) = @year) April,
                            (select isnull(sum(TotalPeople), 0) from NewProgram where Month(DateCompleted) = '5' and YEAR(DateCompleted) = @year) May,
                            (select isnull(sum(TotalPeople), 0) from NewProgram where Month(DateCompleted) = '6' and YEAR(DateCompleted) = @year) June,
                            (select isnull(sum(TotalPeople), 0) from NewProgram where Month(DateCompleted) = '7' and YEAR(DateCompleted) = @year) July,
                            (select isnull(sum(TotalPeople), 0) from NewProgram where Month(DateCompleted) = '8' and YEAR(DateCompleted) = @year) August,
                            (select isnull(sum(TotalPeople), 0) from NewProgram where Month(DateCompleted) = '9' and YEAR(DateCompleted) = @year) September,
                            (select isnull(sum(TotalPeople), 0) from NewProgram where Month(DateCompleted) = '10' and YEAR(DateCompleted) = @year) October,
                            (select isnull(sum(TotalPeople), 0) from NewProgram where Month(DateCompleted) = '11' and YEAR(DateCompleted) = @year) November,
                            (select isnull(sum(TotalPeople), 0) from NewProgram where Month(DateCompleted) = '12' and YEAR(DateCompleted) = @year) December,
                            (select isnull(sum(TotalPeople), 0) from NewProgram where YEAR(DateCompleted) = @year) 'Total'
                            from NewProgram group by LocationType, DateCompleted"
                                                FilterExpression="Convert(DateCompleted, 'System.String') LIKE '%{0}%'">
                                                <FilterParameters>
                                                    <asp:ControlParameter Name="DateCompleted" ControlID="ddlYearFilter" PropertyName="SelectedValue" />
                                                </FilterParameters>
                                                <SelectParameters>
                                                    <asp:ControlParameter Name="year" ControlID="ddlYearFilter" PropertyName="SelectedValue" />

                                                </SelectParameters>
                                            </asp:sqldatasource>

                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <asp:button id="exportMonthly" class=" btn btn-success btn-block" text="Export To Excel" runat="server" onclick="exportMonthly_Click"></asp:button>
                                            </div>
                                           
                                        </div>
                                            <br />
                                        </div>
                             <br />
                                    </div>
                        </div>
                    </div>
                </div>
            <div id="Annual" class="tab-pane fade">

                 <div class="ml-auto d-flex justify-content-end row" Style=" margin-right:16px;">
<%--                       <a style=" margin-right:5px; color:black;" class="nav-link " id="profile-tab" data-toggle="tab" href="#ProgramView" role="tab" aria-controls="profile" aria-selected="false">Start Date</a>--%>

                      <input runat="server" Class="btn col-xl-3 col-lg-3 col-md-3 col-sm-4" Style="background-color: whitesmoke; margin-right:5px;" clientidmode="Static" width="100%" type="date" id="startDate" placeholder ="Start Date">
<%--                      <label>End Date </label>--%>

                       <input runat="server" Class="btn col-xl-3 col-lg-3 col-md-3 col-sm-4" Style="background-color: whitesmoke; margin-right:5px;" clientidmode="Static" width="100%" type="date" id="endDate" placeholder ="End Date">

                                <asp:Button runat="server" class="btn btn-success col-xl-1 col-lg-2 col-md-2 col-sm-2" Style="margin-right: 5px;" id="dateFilter" OnClick="dateFilter_Click" Text="Filter Dates"/>
                                <asp:Button runat="server" CssClass="btn col-xl-1 col-md-2 col-lg-2 col-sm-2" Style="background-color: #fb9678; color: #fff; margin-right: 5px;" id="dateClear" OnClick="dateClear_Click" Text ="Clear" />

                </div>
                <br />
                <div class="row mx-auto d-flex justify-content-center table-responsive">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-s-12">
                                            <asp:GridView ID="animalGrid" runat="server" EnableSortingAndPagingCallbacks="true" AutoGenerateColumns="False" Width="100%" DataSourceID="SqlDataSource48" AllowSorting="True">
                                            <HeaderStyle ForeColor="#ffffff" BackColor="#00c292"></HeaderStyle>
                                            <Columns>
                                                <%--<asp:BoundField DataField="DateCompleted" HeaderText="Date" SortExpression="DateCompleted" />--%>
                                                <asp:BoundField DataField="AnimalName" HeaderText="Animal Name" SortExpression="AnimalName" />
                                                <asp:BoundField DataField="Programs" HeaderText="Programs" ReadOnly="True" SortExpression="Programs" />
                                                <asp:BoundField DataField="TotalPeople" HeaderText="Total People" SortExpression="TotalPeople" />
                                            </Columns>
                                        </asp:gridview>
                                            <asp:sqldatasource id="SqlDataSource48" runat="server" connectionstring="<%$ ConnectionStrings:connString %>" selectcommand="Select distinct AnimalName, count(aa.NewProgramID) as 'Programs', sum(TotalPeople) as 'TotalPeople' from dbo.AssignAnimal aa left outer join dbo.Animal a on a.AnimalID=aa.AnimalID 
inner join dbo.NewProgram np on np.NewProgramID = aa.NewProgramID
group by AnimalName"></asp:sqldatasource>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <asp:button id="Button1" class=" btn btn-success" text="Export To Excel" runat="server" onclick="Button1_Click"></asp:button>
                                    </div>
                                </div>
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
            <%--<!-- .animated -->
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
                                    
                                    <HeaderStyle ForeColor="#ffffff" BackColor="#00c292"></HeaderStyle>
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



    

</asp:Content>

