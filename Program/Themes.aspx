﻿<%@ Page Title="Themes" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Themes.aspx.cs" Inherits="Themes" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">


    <div class="card-body">
        <h4 class="box-title">Program Themes</h4>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <br />
                        <div id="btnAddTheme" class="col-12">
                            <a class="  btn-block  btn btn-success" href="#" data-toggle="modal" data-target="#ThemeModal" role="button">Add Theme</a>
                        </div>




                    </div>
                    <br />
                    <div class="row mx-auto">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-s-12 " style="cursor:pointer;">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ProgramID" DataSourceID="themeDatasource" BackColor="White" 
                                HorizontalAlign="Left" Class="  table table-condensed table-bordered table-hover AnimalCard" OnRowDataBound="GridView1_RowDataBound1" 
                                OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowSorting="true" SortedDescendingCellStyle-BackColor="#fddfd6" RowStyle-CssClass="data-row"
                                    SortedAscendingCellStyle-BackColor="#fddfd6">
                                <Columns>
                                    <asp:BoundField DataField="ProgramID" HeaderText="ProgramID" InsertVisible="False" SortExpression="ProgramID" Visible="false" />
                                    <asp:BoundField DataField="ProgramName" HeaderText="Theme Name" SortExpression="ProgramName" />
                                    <asp:BoundField DataField="ProgramType" HeaderText="Theme Type" SortExpression="ProgramType" />
                                    <asp:BoundField DataField="Capacity" HeaderText="Capacity" SortExpression="Capacity" />
                                    <asp:BoundField DataField="ProgramCost" HeaderText="Cost" SortExpression="ProgramCost" DataFormatString="{0:C}" />
                                </Columns>
                                <HeaderStyle ForeColor="#ffffff" BackColor="#00c292"></HeaderStyle>
                            </asp:GridView>


                            <asp:SqlDataSource ID="themeDatasource" runat="server" ConnectionString="<%$ ConnectionStrings:connString %>" SelectCommand="SELECT [ProgramID], [ProgramName], [ProgramType], [Capacity], [ProgramCost] FROM [Program]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Program] WHERE [ProgramID] = @original_ProgramID AND [ProgramName] = @original_ProgramName AND (([ProgramType] = @original_ProgramType) OR ([ProgramType] IS NULL AND @original_ProgramType IS NULL)) AND (([Capacity] = @original_Capacity) OR ([Capacity] IS NULL AND @original_Capacity IS NULL)) AND (([ProgramCost] = @original_ProgramCost) OR ([ProgramCost] IS NULL AND @original_ProgramCost IS NULL))" InsertCommand="INSERT INTO [Program] ([ProgramName], [ProgramType], [Capacity], [ProgramCost]) VALUES (@ProgramName, @ProgramType, @Capacity, @ProgramCost)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Program] SET [ProgramName] = @ProgramName, [ProgramType] = @ProgramType, [Capacity] = @Capacity, [ProgramCost] = @ProgramCost WHERE [ProgramID] = @original_ProgramID AND [ProgramName] = @original_ProgramName AND (([ProgramType] = @original_ProgramType) OR ([ProgramType] IS NULL AND @original_ProgramType IS NULL)) AND (([Capacity] = @original_Capacity) OR ([Capacity] IS NULL AND @original_Capacity IS NULL)) AND (([ProgramCost] = @original_ProgramCost) OR ([ProgramCost] IS NULL AND @original_ProgramCost IS NULL))">
                                <DeleteParameters>
                                    <asp:Parameter Name="original_ProgramID" Type="Int32" />
                                    <asp:Parameter Name="original_ProgramName" Type="String" />
                                    <asp:Parameter Name="original_ProgramType" Type="String" />
                                    <asp:Parameter Name="original_Capacity" Type="Int32" />
                                    <asp:Parameter Name="original_ProgramCost" Type="Decimal" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="ProgramName" Type="String" />
                                    <asp:Parameter Name="ProgramType" Type="String" />
                                    <asp:Parameter Name="Capacity" Type="Int32" />
                                    <asp:Parameter Name="ProgramCost" Type="Decimal" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="ProgramName" Type="String" />
                                    <asp:Parameter Name="ProgramType" Type="String" />
                                    <asp:Parameter Name="Capacity" Type="Int32" />
                                    <asp:Parameter Name="ProgramCost" Type="Decimal" />
                                    <asp:Parameter Name="original_ProgramID" Type="Int32" />
                                    <asp:Parameter Name="original_ProgramName" Type="String" />
                                    <asp:Parameter Name="original_ProgramType" Type="String" />
                                    <asp:Parameter Name="original_Capacity" Type="Int32" />
                                    <asp:Parameter Name="original_ProgramCost" Type="Decimal" />
                                </UpdateParameters>
                            </asp:SqlDataSource>

                            <div class="modal" id="ThemeModal" tabindex="-1" role="dialog">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header" style="background-color:whitesmoke">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">×</span>
                                            </button>
                                            <h3 class="modal-title" style="font-family: 'Open Sans',sans-serif">Add Theme</h3>

                                        </div>
                                        <div class="modal-body p-4 ml-4" id="resultAdd">

                                            <div class="row">
                                                <div class="col-md-5">
                                                    <label for="txtProgName" class="label-style">Theme Name: </label>
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <asp:TextBox ID="txtAddProgramName" runat="server" CssClass="form-control border-secondary" Style="background-color: whitesmoke;" AutoCompleteType="Disabled" ReadOnly="False"></asp:TextBox>
                                                </div>
                                                <asp:RequiredFieldValidator ID="OrgCityValidator" runat="server" ControlToValidate="txtAddProgramName" ErrorMessage="*" ForeColor="Red" ValidationGroup="addProg"></asp:RequiredFieldValidator>

                                                <div class="col-md-5">
                                                    <label for="txtProgType" class="label-style">Theme Type: </label>
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <asp:DropDownList ID="ddlAddProgramType" runat="server" CssClass="btn btn-block border-secondary" Style="background-color: whitesmoke;"
                                                        BorderStyle="solid" AutoCompleteType="Disabled">
                                                        <asp:ListItem>Live</asp:ListItem>
                                                        <asp:ListItem>Online</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                               <%-- <asp:RequiredFieldValidator ID="TypeValidator" runat="server" ControlToValidate="ddlAddProgramType" ErrorMessage="*" ForeColor="Red" ValidationGroup="addProg"></asp:RequiredFieldValidator>--%>

                                                <div class="col-md-5">
                                                    <label for="txtProgCap" class="label-style">Theme Capacity: </label>
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <asp:TextBox ID="txtAddProgramCapacity" runat="server" CssClass="form-control border-secondary" Style="background-color: whitesmoke;" AutoCompleteType="Disabled" ReadOnly="False"></asp:TextBox>
                                                </div>
                                                <asp:RequiredFieldValidator ID="CapacityValidator" runat="server" ControlToValidate="txtAddProgramCapacity" ErrorMessage="*" ForeColor="Red" ValidationGroup="addProg"></asp:RequiredFieldValidator>

                                            </div>



                                            <%--           <div class="row  ">

                                                <div class=" col-md-8">
                                                    <h4>Program Name: </h4>
                                                    <asp:TextBox ID="txtAddProgramName" runat="server" CssClass="form-control" AutoCompleteType="Disabled" ReadOnly="False"></asp:TextBox>
                                                    <h4>Program Type: </h4>
                                                    <asp:DropDownList ID="ddlAddProgramType" runat="server" CssClass="form-control-plaintext attributeDropDown" BorderStyle="solid" AutoCompleteType="Disabled">
                                                        <asp:ListItem>Live</asp:ListItem>
                                                        <asp:ListItem>Online</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <h4>Program Capacity: </h4>
                                                    <asp:TextBox ID="txtAddProgramCapacity" runat="server" CssClass="form-control" AutoCompleteType="Disabled" ReadOnly="False"></asp:TextBox>
                                                    <br>
                                                </div>
                                                <!-- End  Description -->


                                            </div>--%>
                                            <div class="row">
                                                <br>
                                            </div>


                                        </div>
                                        <div class="modal-footer" style="background-color:whitesmoke">
                                            <div class="row">

                                                <div class="col text-right">
                                                    <asp:Button ID="btnAddProgram" runat="server" Text="Add" Class="btn btn-success FormButton" UseSubmitBehavior="false" OnClick="btnAddProgram_Click"></asp:Button>
                                                </div>



                                            </div>
                                            <%--                    <button type="button" data-toggle="modal" data-target="#EditModal" class="btn btn-secondary" data-dismiss="modal">Edit</button>--%>
                                        </div>
                                    </div>
                                </div>
                            </div>












                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal" id="ProgramModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header" style="background-color:whitesmoke">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                    <h3 class="modal-title" style="font-family: 'Open Sans',sans-serif">Edit Theme</h3>

                </div>
                <div class="modal-body p-4 ml-4" id="resultprogram" >



                    <div class="row">
                        <div class="col-md-5">
                            <label for="txtProgName" class="label-style">Theme Name: </label>
                        </div>
                        <div class="form-group col-md-6">
                            <asp:TextBox ID="txtEditName" runat="server" CssClass="form-control border-secondary" Style="background-color: whitesmoke;" AutoCompleteType="Disabled" ReadOnly="False"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEditName" ErrorMessage="*" ForeColor="Red" ValidationGroup="addProg"></asp:RequiredFieldValidator>

                        <div class="col-md-5">
                            <label for="txtProgType" class="label-style">Theme Type: </label>
                        </div>
                        <div class="form-group col-md-6">
                            <asp:DropDownList ID="ddlEditType" runat="server" CssClass="btn btn-block border-secondary" Style="background-color: whitesmoke;"
                                BorderStyle="solid" AutoCompleteType="Disabled">
                                <asp:ListItem>Live</asp:ListItem>
                                <asp:ListItem>Online</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlEditType" ErrorMessage="*" ForeColor="Red" ValidationGroup="addProg"></asp:RequiredFieldValidator>--%>

                        <div class="col-md-5">
                            <label for="txtProgCap" class="label-style">Theme Capacity: </label>
                        </div>
                        <div class="form-group col-md-6">
                            <asp:TextBox ID="txtEditCapacity" runat="server" CssClass="form-control border-secondary" Style="background-color: whitesmoke;" AutoCompleteType="Disabled" ReadOnly="False"></asp:TextBox>
                        </div>
                       

                    </div>




                    <div class="row  ">

                        <%-- <div class=" col-md-8">
                            <h4>Program Name: </h4>
                            <asp:TextBox ID="txtEditName" runat="server" CssClass="form-control" AutoCompleteType="Disabled" ReadOnly="False"></asp:TextBox>
                            <h4>Program Type: </h4>
                            <asp:DropDownList ID="ddlEditType" runat="server" CssClass="form-control-plaintext attributeDropDown" BorderStyle="solid" AutoCompleteType="Disabled">
                                <asp:ListItem>Live</asp:ListItem>
                                <asp:ListItem>Online</asp:ListItem>
                            </asp:DropDownList>
                            <h4>Program Capacity: </h4>
                            <asp:TextBox ID="txtEditCapacity" runat="server" CssClass="form-control" AutoCompleteType="Disabled" ReadOnly="False"></asp:TextBox>
                            <br>
                        </div>
                        <!-- End  Description -->--%>
                    </div>
                    <div class="row">
                        <br>
                    </div>
                   <%-- <div class="row">

                        <div class="col-md-2">
                            <asp:Button ID="btnEditProgram" runat="server" Text="Update" Class="btn btn-success FormButton" UseSubmitBehavior="false" OnClick="btnEditProgram_Click"></asp:Button>
                        </div>



                    </div>--%>

                </div>
                <div class="modal-footer" style="background-color:whitesmoke">
                    <div class="row">

                        <div class="col text-right">
                            <asp:Button ID="Button1" runat="server" Text="Update" Class="btn btn-success FormButton" UseSubmitBehavior="false" OnClick="btnEditProgram_Click"></asp:Button>
                        </div>



                    </div>
                
                </div>




                <script type="text/javascript">
                    function openModal() {
                        $('#ProgramModal').modal('show');
                    }
                </script>
            </div>
        </div>
    </div>





</asp:Content>

