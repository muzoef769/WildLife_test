<%@ Page Title="Manage Users" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Manage.aspx.cs" Inherits="Manage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <style>
        /*input this input extra.css*/
        .vertical-menu {
            width: 200px;
            padding-top: 93px;
            padding-left: 20px;
            margin-left: 60px;
            position: absolute;
            z-index: 100;
        }

            .vertical-menu a {
                background-color: #eee;
                color: black;
                display: block;
                padding: 18px;
                text-decoration: none;
                font-size: 16px;
            }

                .vertical-menu a:hover {
                    background-color: #ccc;
                }

                .vertical-menu a.active {
                    /*background-color: #4CAF50;*/
                    background-color: #E2991F;
                    color: white;
                }
    </style>

    <asp:ScriptManager runat="server"></asp:ScriptManager>



    <div class="card-body">
        <h4 class="box-title">Manage Users</h4>
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
                                <a style="margin-right: 5px; color: black;" class="nav-link active" id="all-tab" data-toggle="tab" href="#All" role="tab" aria-controls="all" aria-selected="true">User Permissions</a>
                            </li>
                            <li class="nav-item ">
                                <a style="margin-right: 5px; color: black;" class="nav-link  " id="staff-tab" data-toggle="tab" href="#Staff" role="tab" aria-controls="staff" aria-selected="false">Approve Staff</a>
                            </li>
                            <li class="nav-item ">
                                <a style="margin-right: 5px; color: black;" class="nav-link" id="volunteer-tab" data-toggle="tab" href="#Volunteer" role="tab" aria-controls="volunteer" aria-selected="false">Approve Volunteers</a>
                            </li>



                        </ul>
                        <br />


                    </div>
                    <br />
                    <div class="tab-content ">

                        <div id="All" class="tab-pane fade show active">
                            <div class="table-responsive">

                                <div class="row mx-auto d-flex justify-content-center">
                                    <div class="col-xl-12 col-lg-12 col-md-12 col-s-12 ">

                                        <asp:UpdatePanel runat="server" ID="updateAll" UpdateMode="Conditional">
                                            <ContentTemplate>

                                                <asp:GridView ID="allGridView"
                                                    runat="server"
                                                    HeaderStyle-ForeColor="black"
                                                    ItemStyle-ForeColor="black"
                                                    AutoGenerateColumns="False"
                                                    DataKeyNames="UserID"
                                                    DataSourceID="SqlDataSource3"
                                                    BackColor="White"
                                                    HorizontalAlign="Left"
                                                    AllowSorting="True"
                                                    Class="table table-condensed table-bordered table-hover AnimalCard"
                                                    OnRowDataBound="OnRowDataBound"
                                                    EmptyDataText="No Records Found"
                                                    EmptyDataRowStyle-HorizontalAlign="Center"
                                                    SortedDescendingCellStyle-BackColor="#fddfd6" 
                                                    SortedAscendingCellStyle-BackColor="#fddfd6"
                                                    RowStyle-CssClass="data-row">


                                                    <Columns>
                                                        <asp:BoundField DataField="Username" HeaderText="Username" ReadOnly="True" SortExpression="Username" />
                                                        <asp:BoundField DataField="FirstName" HeaderText="First Name" ReadOnly="True" SortExpression="FirstName" />
                                                        <asp:BoundField DataField="LastName" HeaderText="Last Name" ReadOnly="True" SortExpression="LastName" />
                                                        <asp:BoundField DataField="UserType" HeaderText="User Type" SortExpression="UserType" />
                                                        <%--<asp:BoundField DataField="UserStatus" HeaderText="User Status" SortExpression="UserStatus" />--%>

                                                        <asp:TemplateField HeaderText="Status" HeaderStyle-Width="15%"  SortExpression="UserStatus">
                                                            <ItemTemplate>
                                                                <asp:UpdatePanel runat="server" ID="updateDropDown" UpdateMode="Conditional">
                                                                    <ContentTemplate>
                                                                        <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("UserStatus") %>' Visible="false" />
                                                                        <asp:DropDownList runat="server" ID="ddlStatus" class="btn" Style="background-color: whitesmoke;" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged"
                                                                            CssClass="form-control-plaintext btn-sm " AutoPostBack="true">
                                                                            <asp:ListItem Value="Active">Active</asp:ListItem>
                                                                            <asp:ListItem Value="Inactive">Inactive</asp:ListItem>
                                                                            <asp:ListItem Value="Temporarily Inactive">Temporarily Inactive</asp:ListItem>
                                                                            <asp:ListItem Value="Not Approved">Not Approved</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </ContentTemplate>
                                                                    <Triggers>
                                                                        <asp:AsyncPostBackTrigger ControlID="ddlStatus" EventName="SelectedIndexChanged" />

                                                                    </Triggers>
                                                                </asp:UpdatePanel>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="UserID" HeaderText="UserID" InsertVisible="False" ReadOnly="True" SortExpression="UserID"
                                                            Visible="false" />
                                                    </Columns>


                                                    <HeaderStyle ForeColor="#ffffff" BackColor="#00c292"></HeaderStyle>

                                                </asp:GridView>

                                            </ContentTemplate>
                                            <Triggers>
                                            </Triggers>
                                        </asp:UpdatePanel>

                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:connString %>" SelectCommand="SELECT [User].Username, [User].FirstName, [User].LastName, [User].UserType, [User].UserStatus, [User].UserID  FROM [User] INNER JOIN Password ON [User].UserID = Password.UserID "></asp:SqlDataSource>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div id="Volunteer" class="tab-pane fade ">
                            <div class="table-responsive">

                                <div class="row mx-auto d-flex justify-content-center">
                                    <div class="col-xl-12 col-lg-12 col-md-12 col-s-12 ">

                                        <asp:UpdatePanel runat="server" ID="updateVolunteer">
                                            <ContentTemplate>

                                                <%--<div class="mx-auto table-responsive">--%>
                                                <asp:GridView
                                                    ID="volGridView"
                                                    runat="server"
                                                    AllowSorting="True"
                                                    AutoGenerateColumns="False"
                                                    DataSourceID="SqlDataSource1"
                                                    HeaderStyle-ForeColor="black"
                                                    ItemStyle-ForeColor="black"
                                                    CssClass="table table-condensed table-bordered table-hover AnimalCard"
                                                    BackColor="White"
                                                    HorizontalAlign="Left"
                                                    EmptyDataText="No Volunteers Need to Be Approve"
                                                    EmptyDataRowStyle-HorizontalAlign="Center"
                                                    SortedDescendingCellStyle-BackColor="#fddfd6" 
                                                    SortedAscendingCellStyle-BackColor="#fddfd6"
                                                    RowStyle-CssClass="data-row">
                                                    <Columns>
                                                        <%--<asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" InsertVisible="False" Visible="false" ReadOnly="True" />--%>
                                                        <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
                                                        <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                                                        <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
                                                        <asp:TemplateField HeaderText="Approve Volunteer?">
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="chkStatus" runat="server" Style="text-align: center" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <HeaderStyle ForeColor="#ffffff" BackColor="#00c292"></HeaderStyle>
                                                </asp:GridView>

                                            </ContentTemplate>
                                            <Triggers>
                                            </Triggers>
                                        </asp:UpdatePanel>

                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connString %>"
                                            SelectCommand="SELECT [FirstName], [LastName], [Username] FROM [User] WHERE ([UserStatus] = @UserStatus) AND ([UserType] = @UserType)">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="Not Approved" Name="UserStatus" Type="String" />
                                                <asp:Parameter DefaultValue="Volunteer" Name="UserType" Type="String" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>

                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col col-3 col-xl-2 col-lg-2 col-md-2 col-s-2 mx-auto p-1">
                                        <asp:Button ID="btnStatusUpdate" class="btn btn-success btn-block" runat="server" Text="Update Status" OnClick="btnStatusUpdate_Click" />
                                    </div>
                                </div>
                                <br />
                            </div>

                        </div>



                        <div id="Staff" class="tab-pane fade ">
                            <div class="table-responsive">

                                <div class="row mx-auto d-flex justify-content-center">
                                    <div class="col-xl-12 col-lg-12 col-md-12 col-s-12 ">

                                        <asp:UpdatePanel runat="server" ID="updateStaff">
                                            <ContentTemplate>

                                                <asp:GridView ID="staffGridView"
                                                    runat="server"
                                                    HeaderStyle-ForeColor="black"
                                                    ItemStyle-ForeColor="black"
                                                    AutoGenerateColumns="False"
                                                    DataSourceID="SqlDataSource2"
                                                    BackColor="White"
                                                    HorizontalAlign="Left"
                                                    AllowSorting="True"
                                                    Class="table table-condensed table-bordered table-hover AnimalCard"
                                                    EmptyDataText="No Staff Members Need to Be Approved"
                                                    EmptyDataRowStyle-HorizontalAlign="Center"
                                                    SortedDescendingCellStyle-BackColor="#fddfd6" 
                                                    SortedAscendingCellStyle-BackColor="#fddfd6"
                                                    RowStyle-CssClass="data-row">

                                                    <Columns>
                                                        <asp:BoundField DataField="Username" HeaderText="Username" ReadOnly="True" SortExpression="Username" />
                                                        <asp:BoundField DataField="FirstName" HeaderText="First Name" ReadOnly="True" SortExpression="FirstName" />
                                                        <asp:BoundField DataField="LastName" HeaderText="Last Name" ReadOnly="True" SortExpression="LastName" />
                                                        <asp:TemplateField HeaderText="Approve Staff?">
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="chkStatus" runat="server" Style="text-align: center" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:BoundField DataField="UserStatus" HeaderText="User Status" SortExpression="UserStatus" Visible="false" />

                                                    </Columns>


                                                    <HeaderStyle ForeColor="#ffffff" BackColor="#00c292"></HeaderStyle>

                                                </asp:GridView>

                                            </ContentTemplate>
                                            <Triggers>
                                            </Triggers>
                                        </asp:UpdatePanel>

                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:connString %>"
                                            SelectCommand="SELECT [FirstName], [LastName], [Username] FROM [User] WHERE ([UserStatus] = @UserStatus) AND ([UserType] = @UserType)">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="Not Approved" Name="UserStatus" Type="String" />
                                                <asp:Parameter DefaultValue="Staff" Name="UserType" Type="String" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>

                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col col-3 col-xl-2 col-lg-2 col-md-2 col-s-2 mx-auto p-1">
                                        <asp:Button ID="btnUpdateStaff" class="btn btn-success btn-block" runat="server" Text="Update" OnClick="btnStatusUpdate2_Click" />
                                    </div>
                                </div>
                                <br />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>


