<%@ Page Title="Animals" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Animal.aspx.cs" Inherits="Animal" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">


    <!--  Traffic  -->
    <div class="card-body">
        <h4 class="box-title">View Animal Info</h4>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">

                    <div class=" ">

                        <div class=" ml-auto d-flex justify-content-end row" style="margin-right: 16px;">
                            <asp:TextBox ID="txtSearchAnimal" Placeholder="Search by Name, Type, or Status" Style="margin-right: 5px;" class="form-control col-xl-3 col-lg-3 col-md-4 col-sm-6" 
                                runat="server" AutoPostBack="True" OnTextChanged="txtSearchAnimal_TextChanged"></asp:TextBox>
                            <br class="d-md-none" />
                            <asp:Button
                                ID="btnSearchAll"
                                runat="server"
                                CssClass="btn btn-success col-xl-1 col-lg-2 col-md-2 col-sm-2"
                                Text="Search"
                                Style="margin-right: 5px;"
                                OnClick="btnSearchAll_Click" />

                            <asp:Button
                                ID="btnClearAll"
                                CssClass="btn col-xl-1 col-lg-2 col-md-2 col-sm-2"
                                runat="server"
                                Text="Clear"
                                Style="background-color: #fb9678; color: #fff; margin-right: 16px;"
                                OnClick="btnClearAll_Click" />


                        </div>

                    </div>
                    <br />
                    <div class="tab-content ">
                        <div class="">
                            <div class="">

                                <div class="row mx-auto d-flex justify-content-center table-responsive">
                                    <div class=" col-xl-12 col-lg-12 col-md-12 col-s-12 col-xs-12 ">


                                        <div class="row mx-auto ">
                                            <div class="col-xl-12 col-lg-12 col-md-12 col-s-12" style="cursor:pointer;">
                                                <asp:GridView ID="GridView1" runat="server" HeaderStyle-ForeColor="black" ItemStyle-ForeColor="black" AutoGenerateColumns="False" DataKeyNames="AnimalID"
                                                    Class="  table table-condensed table-bordered table-hover AnimalCard" DataSourceID="AnimalSQL" BackColor="White" HorizontalAlign="Left"
                                                    OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowSorting="True" OnRowDataBound="GridView1_RowDataBound1" 
                                                    EmptyDataText="No Animals Found" EmptyDataRowStyle-HorizontalAlign="Center" SortedDescendingCellStyle-BackColor="#fddfd6" 
                                                    SortedAscendingCellStyle-BackColor="#fddfd6" RowStyle-CssClass="data-row">



                                                    <Columns>
                                                        <asp:BoundField DataField="AnimalID" HeaderText="Animal ID" InsertVisible="False" ReadOnly="True" SortExpression="AnimalID" Visible="False" />
                                                        <asp:BoundField DataField="AnimalName" HeaderText="Animal Name" SortExpression="AnimalName" />
                                                        <asp:BoundField DataField="AnimalType" HeaderText="Animal Type" SortExpression="AnimalType" />
                                                        <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                                                        <asp:BoundField DataField="Image" HeaderText="Image" SortExpression="Image" InsertVisible="False" Visible="False" />
                                                        <asp:BoundField DataField="TotalKids" HeaderText="Total Kids" ReadOnly="True" SortExpression="TotalKids" />
                                                        <asp:BoundField DataField="TotalAdults" HeaderText="Total Adults" ReadOnly="True" SortExpression="TotalAdults" />
                                                        <asp:BoundField DataField="TotalPeople" HeaderText="Total People" ReadOnly="True" SortExpression="TotalPeople" />
                                                        <asp:BoundField DataField="TotalPrograms" HeaderText="Total Programs" SortExpression="TotalPrograms" ReadOnly="True" />
                                                        <asp:ImageField DataImageUrlField="Image">
                                                            <ControlStyle Height="50px" Width="50px"></ControlStyle>
                                                        </asp:ImageField>
                                                    </Columns>

                                                    <HeaderStyle ForeColor="#ffffff" BackColor="#00c292"></HeaderStyle>
                                                </asp:GridView>
                                            </div>




                                        </div>

                                        <asp:SqlDataSource
                                            ID="AnimalSQL"
                                            runat="server"
                                            ConflictDetection="CompareAllValues"
                                            ConnectionString="<%$ ConnectionStrings:WildlifeCenterConnectionString %>"
                                            FilterExpression="AnimalName LIKE '%{0}%' OR AnimalType LIKE '{1}%' OR Status LIKE '%{2}%' "
                                            DeleteCommand="DELETE FROM [Animal] WHERE [AnimalID] = @original_AnimalID AND [AnimalName] = @original_AnimalName AND [AnimalType] = @original_AnimalType AND [Status] = @original_Status AND [LastUpdated] = @original_LastUpdated AND [LastUpdatedBy] = @original_LastUpdatedBy"
                                            InsertCommand="INSERT INTO [Animal] ([AnimalName], [AnimalType], [Status], [LastUpdated], [LastUpdatedBy]) VALUES (@AnimalName, @AnimalType, @Status, @LastUpdated, @LastUpdatedBy)"
                                            OldValuesParameterFormatString="original_{0}"
                                            SelectCommand="SELECT Animal.AnimalID, Animal.AnimalName, Animal.AnimalType, Animal.Status, Animal.Image, SUM(ISNULL(NewProgram.TotalKids, '0')) AS TotalKids, SUM(ISNULL(NewProgram.TotalAdults, '0')) AS TotalAdults, SUM(ISNULL(NewProgram.TotalPeople, '0')) AS TotalPeople, COUNT(AssignAnimal.AssignAnimalID) AS TotalPrograms FROM Animal LEFT OUTER JOIN AssignAnimal ON Animal.AnimalID = AssignAnimal.AnimalID LEFT OUTER JOIN NewProgram ON AssignAnimal.NewProgramID = NewProgram.NewProgramID GROUP BY Animal.AnimalID, Animal.AnimalName, Animal.AnimalType, Animal.Status, Animal.LastUpdatedBy, Animal.Image"
                                            UpdateCommand="UPDATE [Animal] SET [AnimalName] = @AnimalName, [AnimalType] = @AnimalType, [Status] = @Status, [LastUpdated] = @LastUpdated, [LastUpdatedBy] = @LastUpdatedBy WHERE [AnimalID] = @original_AnimalID AND [AnimalName] = @original_AnimalName AND [AnimalType] = @original_AnimalType AND [Status] = @original_Status AND [LastUpdated] = @original_LastUpdated AND [LastUpdatedBy] = @original_LastUpdatedBy">
                                            <FilterParameters>
                                                <asp:ControlParameter Name="AnimalName" ControlID="txtSearchAnimal" PropertyName="Text" Type="String" ConvertEmptyStringToNull="false" />
                                                <asp:ControlParameter Name="AnimalType" ControlID="txtSearchAnimal" PropertyName="Text" Type="String" ConvertEmptyStringToNull="false" />
                                                <asp:ControlParameter Name="Status" ControlID="txtSearchAnimal" PropertyName="Text" Type="String" ConvertEmptyStringToNull="false" />
                                            </FilterParameters>
                                            <DeleteParameters>
                                                <asp:Parameter Name="original_AnimalID" Type="Int32" />
                                                <asp:Parameter Name="original_AnimalName" Type="String" />
                                                <asp:Parameter Name="original_AnimalType" Type="String" />
                                                <asp:Parameter Name="original_Status" Type="String" />
                                                <asp:Parameter DbType="Date" Name="original_LastUpdated" />
                                                <asp:Parameter Name="original_LastUpdatedBy" Type="String" />
                                            </DeleteParameters>
                                            <InsertParameters>
                                                <asp:Parameter Name="AnimalName" Type="String" />
                                                <asp:Parameter Name="AnimalType" Type="String" />
                                                <asp:Parameter Name="Status" Type="String" />
                                                <asp:Parameter DbType="Date" Name="LastUpdated" />
                                                <asp:Parameter Name="LastUpdatedBy" Type="String" />
                                            </InsertParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="AnimalName" Type="String" />
                                                <asp:Parameter Name="AnimalType" Type="String" />
                                                <asp:Parameter Name="Status" Type="String" />
                                                <asp:Parameter DbType="Date" Name="LastUpdated" />
                                                <asp:Parameter Name="LastUpdatedBy" Type="String" />
                                                <asp:Parameter Name="original_AnimalID" Type="Int32" />
                                                <asp:Parameter Name="original_AnimalName" Type="String" />
                                                <asp:Parameter Name="original_AnimalType" Type="String" />
                                                <asp:Parameter Name="original_Status" Type="String" />
                                                <asp:Parameter DbType="Date" Name="original_LastUpdated" />
                                                <asp:Parameter Name="original_LastUpdatedBy" Type="String" />
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
   







    <div class="modal" id="EditModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header" style="background-color: whitesmoke">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                    <h3 class="modal-title" style="font-family: 'Open Sans',sans-serif">Edit Animal</h3>

                </div>
                <div class="modal-body p-4 ml-4" id="resultedit" >

                    <div class="row">
                        <div class="col-md-5">
                            <label for="txtEditStatus" class="label-style">Animal Status: </label>
                        </div>
                        <div class="form-group col-md-6">
                            <asp:DropDownList ID="ddlEditStatus" runat="server" CssClass="btn btn-block border-secondary"  Style="background-color: whitesmoke;"
                                BorderStyle="solid" AutoCompleteType="Disabled">
                                <asp:ListItem>Active</asp:ListItem>
                                <asp:ListItem>Inactive</asp:ListItem>
                                <asp:ListItem>Temporarily Inactive</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        

                        <div class="col-md-5">
                            <label for="txtEditType" class="label-style">Animal Type: </label>
                        </div>
                        <div class="form-group col-md-6">
                            <asp:DropDownList ID="ddlEditType" runat="server" CssClass="btn btn-block border-secondary"  Style="background-color: whitesmoke;"
                                BorderStyle="solid" AutoCompleteType="Disabled">
                                <asp:ListItem>Bird</asp:ListItem>
                                <asp:ListItem>Mammal</asp:ListItem>
                                <asp:ListItem>Reptile</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlEditType" ErrorMessage="*" ForeColor="Red" ValidationGroup="addProg"></asp:RequiredFieldValidator>--%>

                        <div class="col-md-5">
                            <label for="txtEditName" class="label-style">Animal Name: </label>
                        </div>
                        <div class="form-group col-md-6">
                            <asp:TextBox ID="txtEditName" runat="server" CssClass="form-control border-secondary" Style="background-color: whitesmoke;" AutoCompleteType="Disabled" ReadOnly="False"></asp:TextBox>
                        </div>
                       

                    </div>


                    <div class="row">
                        <br>
                    </div>
                     <div class="row">

                            

                        </div>
                </div>
                <div class="modal-footer" style="background-color: whitesmoke">
                    <div class="row">
                        <div class="col text-right">
                            <asp:Button ID="btnUpdate" runat="server" Text="Update" Class="btn btn-success FormButton" UseSubmitBehavior="false" OnClick="btnUpdate_Click"></asp:Button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal" id="AnimalModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header" style="background-color:whitesmoke">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                    <h3 class="modal-title" style="font-family: 'Open Sans',sans-serif">Animal Options</h3>

                </div>
                <div class="modal-body p-4 " id="resultOptions">



                    <div class="row  ">

                        <div class=" col-md-8">
                        </div>
                        <!-- End  Description -->


                    </div>
                    <div class="row">
                        <br>
                        <div class="col-md-2">
                            <button data-toggle="modal" data-target="#ProgramModal" data-dismiss="modal" class="btn btn-success" type="submit">View Animal Program Details</button>
                        </div>

                    </div>
                    <br />
                    <br />


                    <div class="row">

                        <div class="col-md-2">
                            <button data-toggle="modal" data-target="#EditModal" data-dismiss="modal" class="btn btn-success" type="submit">Edit Animal</button>
                        </div>
                        <script type="text/javascript">
                                function openModal() {
                                    $('#AnimalModal').modal('show');
                                }
                        </script>

                    </div>

                </div>

            </div>
        </div>
    </div>

    <div class="modal" id="ProgramModal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header" style="background-color:whitesmoke">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                    <h3 class="modal-title" style="font-family: 'Open Sans',sans-serif">Program Details</h3>

                </div>
                <div class="modal-body p-4" id="resultPrograms">




                    <div class="table-responsive ">
                        <div class="row mx-auto d-flex">

                            <div class="col-xl-6 col-lg-12  col-md-12 col-s-12 ">
                                <asp:GridView ID="GridView3" runat="server" Visible="True" HorizontalAlign="Center" Class=" AnimalCard table table-bordered table-hover" BackColor="White">
                                </asp:GridView>
                            </div>



                        </div>



                    </div>

                </div>
                <%--<div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <div class="col-md-3">
                        <button data-toggle="modal" data-target="#AnimalModal" data-dismiss="modal" class="btn btn-secondary" type="submit">Return</button>
                    </div>



                </div>--%>
            </div>
        </div>
    </div>






</asp:Content>
