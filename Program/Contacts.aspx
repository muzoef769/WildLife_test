<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Contacts.aspx.cs" Inherits="Contacts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="main">
      
            <div class="container-fluid  ContactContainer ">
               
                    <div class=" mx-auto">
                        <div class="card-mx-auto AnimalReportCard">
                            <div class="card-body">
                               <div class="col-md-6 text-center mx-auto">
                <h3 class="modal-title">Add Contact</h3>
                        <br />
                </div>

                                <div class="row">
                   <div class=" col-xl-4 col-lg-3 col-md-6  mx-auto">
             <asp:TextBox ID="txtFirstName" runat="server" placeholder=" First Name" Css="form-control"></asp:TextBox>
                         </div>
                                    <br />
                     <div class=" col-xl-4 col-lg-3 col-md-6  mx-auto">
              <asp:TextBox ID="txtLastName" runat="server" placeholder=" Last Name" Css="form-control"></asp:TextBox>
                </div>
                <br />
                   <div class=" col-xl-4 col-lg-3 col-md-6  mx-auto">
             <asp:TextBox ID="txtEmail" runat="server" placeholder=" Email" Css="form-control"></asp:TextBox>

                </div>
                                   
                    </div>
                                <br />
                                        <div class="row">
                       <div class=" col-lg-4 col-md-6  mx-auto">
             <asp:TextBox ID="txtPrimaryPhone" runat="server" placeholder=" Primary Phone" Css="form-control"></asp:TextBox> 
                         </div>
                                            <br />
                        <div class=" col-lg-4 col-md-6  mx-auto">
            <asp:TextBox ID="txtSecondaryPhone" runat="server" placeholder=" Secondary Phone" Css="form-control"></asp:TextBox>
                </div>
                <br />
                       <div class=" col-lg-4 col-md-6  mx-auto">

            <asp:DropDownList ID="drpOrganizationList" runat="server" placeholder=" Organization List" CssClass="form-control-sm"></asp:DropDownList> <br /><br />
                        <asp:Label ID="lbldrpOrganizationList" runat="server" Text="What organzation would you like to associate the contact with? "></asp:Label>
                                <br />
                              
                </div>
                    </div>

                                <div class="row">
                 
                        <div class=" col-lg-4 col-md-6  mx-auto">
          
                                <br />
                                <asp:Button ID="Button1"
                                    runat="server"
                                    CssClass="btn btn-success"
                                    UseSubmitBehavior="false"
                                    CauseValidation="true"
                                    Text="Submit Contact"
                                    OnClick="submitContact"
                                    data-toggle=""/>
                </div>
                    </div>

                               
                             
                               
                               
                            </div>
                        </div>
                    </div>
                </div>
            
        </div>

        <%--ADD POP UP MODAL--%>

    </div>
</asp:Content>


