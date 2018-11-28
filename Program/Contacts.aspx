<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Contacts.aspx.cs" Inherits="Contacts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    
      
           
               
                    
                        <div class="card-mx-auto AnimalReportCard">
                           
                             <div class="card-body">
                    <h4 class="box-title">Add Contact</h4>
                </div>
<div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                   <div class=" col-xl-4 col-lg-3 col-md-6  mx-auto">
             <asp:TextBox ID="txtFirstName" runat="server" placeholder=" First Name" class="form-control" Style="background-color: whitesmoke;"></asp:TextBox>
                         </div>
                                    <br />
                     <div class=" col-xl-4 col-lg-3 col-md-6  mx-auto">
              <asp:TextBox ID="txtLastName" runat="server" placeholder=" Last Name" class="form-control" Style="background-color: whitesmoke;"></asp:TextBox>
                </div>
                <br />
                   <div class=" col-xl-4 col-lg-3 col-md-6  mx-auto">
             <asp:TextBox ID="txtEmail" runat="server" placeholder=" Email" class="form-control" Style="background-color: whitesmoke;"></asp:TextBox>

                </div>
                                   
                    </div>
                                <br />
                                        <div class="row">
                       <div class=" col-lg-4 col-md-6 ">
             <asp:TextBox ID="txtPrimaryPhone" runat="server" placeholder=" Primary Phone" class="form-control" Style="background-color: whitesmoke;"></asp:TextBox> 
                         </div>
                                            <br />
                        <div class=" col-lg-4 col-md-6  ">
            <asp:TextBox ID="txtSecondaryPhone" runat="server" placeholder=" Secondary Phone" class="form-control" Style="background-color: whitesmoke;"></asp:TextBox>
                </div>
                <br />
                      
                    </div>
                              <br />    <div class="row">
                                 <div class=" col-lg-8 col-md-8 ">
<asp:Label ID="lbldrpOrganizationList" runat="server" Text="What organzation would you like to associate the contact with? "></asp:Label>
                         
            <asp:DropDownList ID="drpOrganizationList" runat="server" placeholder=" Organization List" class="btn btn-block" Style="background-color: whitesmoke;"></asp:DropDownList> <br /><br />
                               
                              
                </div> </div>

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

                               
                             
                              </div>  </div>  </div>  </div>   
                               
                            </div>
                        
                 
              
            
        

        <%--ADD POP UP MODAL--%>

    
</asp:Content>


