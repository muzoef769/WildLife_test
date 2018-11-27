<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Manage.aspx.cs" Inherits="Manage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <style>
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
    <br />
    <br />
    <br />

    <div class="row ">
        <div class="col-md-6 mx-auto text-center">

            <h1 class="CardTitle">Manage Users</h1>
        </div>
    </div>

    <div class="vertical-menu text-center" role="tablist" style="display: inline-block">
        <ul class="nav flex-column border border-dark rounded">
            <li class="nav-item border border-dark ">
                <a id="volunteer-tab" class="nav-link active rounded-top" data-toggle="tab" href="#Volunteer" role="tab" aria-controls="approve" aria-selected="True">Approve Volunteers</a>
            </li>

            <li class="nav-item border border-dark ">
                <a id="staff-tab" class="nav-link" data-toggle="tab" href="#Staff" role="tab" aria-controls="permission" aria-selected="false">Approve Staff</a>
            </li>

            <li class="nav-item border border-dark ">
                <a id="all-tab" class="nav-link rounded-bottom" data-toggle="tab" href="#All" role="tab" aria-controls="all" aria-selected="false">User Permissions</a>

            </li>


        </ul>


    </div>

    <div class="tab-content" style="display: inline-block; width: 100%;">
        <div id="Volunteer" class="tab-pane fade show active">
            <div class="table-responsive">

                <div class="row mx-auto d-flex justify-content-center">
                    <div class="col-xl-7 col-lg-12 col-md-12 col-s-12 ">


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
                            Width="900px">
                            <Columns>
                                <%--<asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" InsertVisible="False" Visible="false" ReadOnly="True" />--%>
                                <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                                <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
                                <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
                                <asp:TemplateField HeaderText="Approve Volunteer?">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkStatus" runat="server" Style="text-align: center" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle ForeColor="White" BackColor="#339933" Height="20px"></HeaderStyle>
                        </asp:GridView>

                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connString %>"
                            SelectCommand="SELECT [FirstName], [LastName], [Username] FROM [User] WHERE ([UserStatus] = @UserStatus) AND ([UserType] = @UserType)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="Not Approved" Name="UserStatus" Type="String" />
                                <asp:Parameter DefaultValue="Volunteer" Name="UserType" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>


                    </div>
                    <br />
                    <div class=" mx-auto">
                        <asp:Button ID="btnStatusUpdate" class="btn btn-success btn-block" runat="server" Text="Update Status" OnClick="btnStatusUpdate_Click" />
                    </div>
                </div>
            </div>
        </div>
        <div id="Staff" class="tab-pane fade">
            <div class="table-responsive">

                <div class="row mx-auto d-flex justify-content-center">
                    <div class="col-xl-7 col-lg-12 col-md-12 col-s-12 ">
                        <asp:GridView ID="staffGridView"
                            runat="server"
                            HeaderStyle-ForeColor="black"
                            ItemStyle-ForeColor="black"
                            AutoGenerateColumns="False"
                            DataSourceID="SqlDataSource2"
                            BackColor="White"
                            HorizontalAlign="Left"
                            AllowSorting="True"
                            Width="900px"
                            Class="table table-condensed table-bordered table-hover AnimalCard">


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


                            <HeaderStyle ForeColor="White" BackColor="#339933" Height="20px"></HeaderStyle>

                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:connString %>"
                            SelectCommand="SELECT [FirstName], [LastName], [Username] FROM [User] WHERE ([UserStatus] = @UserStatus) AND ([UserType] = @UserType)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="Not Approved" Name="UserStatus" Type="String" />
                                <asp:Parameter DefaultValue="Staff" Name="UserType" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                    </div>
                    <br />
                    <div class=" mx-auto">
                        <asp:Button ID="btnUpdateStaff" class="btn btn-success btn-block" runat="server" Text="Update Status" OnClick="btnStatusUpdate_Click" />
                    </div>
                </div>
            </div>
        </div>
        <div id="All" class="tab-pane fade">
            <div class="table-responsive">

                <div class="row mx-auto d-flex justify-content-center">
                    <div class="col-xl-7 col-lg-12 col-md-12 col-s-12 ">


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
                            Width="900px"
                            Class="table table-condensed table-bordered table-hover AnimalCard">


                            <Columns>
                                <asp:BoundField DataField="Username" HeaderText="Username" ReadOnly="True" SortExpression="Username" />
                                <asp:BoundField DataField="FirstName" HeaderText="First Name" ReadOnly="True" SortExpression="FirstName" />
                                <asp:BoundField DataField="LastName" HeaderText="Last Name" ReadOnly="True" SortExpression="LastName" />
                                <asp:BoundField DataField="UserType" HeaderText="User Type" SortExpression="UserType" />
                                <asp:BoundField DataField="UserStatus" HeaderText="User Status" SortExpression="UserStatus" />

                                <asp:TemplateField HeaderText="Status">
                                    <ItemTemplate>
                                        <asp:UpdatePanel runat="server" ID="updateAll" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:DropDownList runat="server" ID="ddlStatus" OnSelectedIndexChanged="Unnamed_SelectedIndexChanged"
                                                    CssClass=" btn-sm text-center" AutoPostBack="true">
                                                    <asp:ListItem Value = ""></asp:ListItem>
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


                            <HeaderStyle ForeColor="White" BackColor="#339933" Height="20px"></HeaderStyle>

                        </asp:GridView>


                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:connString %>" SelectCommand="SELECT [User].Username, [User].FirstName, [User].LastName, [User].UserType, [User].UserStatus, [User].UserID  FROM [User] INNER JOIN Password ON [User].UserID = Password.UserID "></asp:SqlDataSource>
                    </div>
                </div>
            </div>
        </div>


    </div>
</asp:Content>

