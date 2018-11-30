<%@ Page Title="Home" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        
        <%--<!-- Content -->
        <div class="content">
            <!-- Animated -->
            <div class="animated fadeIn">
                <!-- Widgets  -->
                
                <!-- /Widgets -->--%>
                <!--  Traffic  -->
                <div class="card-body">
                                <h4 class="box-title">Pending Volunteers </h4>
                            </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                               
                                <div class=" ">

            <div class=" mx-auto  ">
                <div class="card-body align-content-center">
                    <div class="row align-content-center">
                       

                                </div>
                        <div class="mx-auto table-responsive">
                            <asp:GridView ID="statusGridView" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
                                HeaderStyle-ForeColor="black"
                                ItemStyle-ForeColor="black"
                                CssClass=" table-responsive-md table table-condensed table-bordered table-hover AnimalCard justify-content-center"
                                BackColor="White" 
                                HorizontalAlign="Center"
                                RowStyle-CssClass="data-row">
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
                                <HeaderStyle ForeColor="#ffffff" BackColor="#00c292"></HeaderStyle>
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
                    <div class="col-md-4 mx-auto">
                       
                    </div>


                     
                </div>
            </div>


        </div>
                                <asp:Button ID="btnStatusUpdate" class="btn btn-success btn-block" runat="server" Text="Update Status" OnClick="btnStatusUpdate_Click" />
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
