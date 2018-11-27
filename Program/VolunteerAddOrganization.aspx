<%@ Page Title="" Language="C#" MasterPageFile="~/VolunteerMasterPage.master" AutoEventWireup="true" CodeFile="VolunteerAddOrganization.aspx.cs" Inherits="VolunteerAddOrganization" %>

    


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

  <div class="container-fluid ContactContainer">

<div class="card mx-auto  ProgramCard">
    
    <div class="card-body">

         <br /> 
            <div class="accordion" id="accordionExample">
             <div class="row">
                    <div class="col-md-6 text-center mx-auto">
                <h3 class="modal-title">Add an Organization</h3>
                </div>
                    </div>
                <br />
                <div class="row">
                    <div class="col-md-6 text-center mx-auto">
                <h5 class="modal-title">Organization Name</h5>
                </div>
                    </div>
                <br />
             <div class="row">
                                            <div class="col-md-5">
                                                <label for="txtOrgName" class="label-style">Organization Name</label>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <asp:TextBox ID="txtOrgName" runat="server" placeholder=" Organization Name" ></asp:TextBox>
                                            </div>
                                        </div>

       
                <br />
                <div class="card">
                    <div class="card-header" id="headingTwo">
                       <div class="d-flex justify-content-lg-start">
                            <button class="btn collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                               Organization Address</button>
                         </div>
                    </div>
                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                        <div class="card-body">
                           
                            <div class="row">
                    <div class="col-md-6 text-center mx-auto">
                <h5 class="modal-title">Organization Address</h5>
                        <br />
                </div>
                    </div>

           <div class="row">
               <div class="col-md-5">
              <label for="txtStreet" class="label-style">Organization Address</label>
             </div>
             <div class="form-group col-md-6">
            <asp:TextBox ID="txtStreet" runat="server"  placeholder=" Organization Address"></asp:TextBox>
              </div>
             </div>


           <div class="row">
               <div class="col-md-5">
              <label for="dropCountry" class="label-style">Country</label>
             </div>
             <div class="form-group col-md-6">
           <asp:DropDownList ID="drpCountry" runat="server"  >
            <asp:ListItem>United States</asp:ListItem>
            <asp:ListItem>Canada</asp:ListItem>                                                                            
        </asp:DropDownList>
              </div>
             </div>



           <div class="row">
               <div class="col-md-5">
              <label for="txtState" class="label-style">State</label>
             </div>
             <div class="form-group col-md-6">
            <asp:DropDownList ID="drpState" runat="server"  >
          <asp:ListItem Value ="VA">Virginia</asp:ListItem>
<asp:ListItem Value="AL">Alabama</asp:ListItem>
	<asp:ListItem Value="AK">Alaska</asp:ListItem>
	<asp:ListItem Value="AZ">Arizona</asp:ListItem>
	<asp:ListItem Value="AR">Arkansas</asp:ListItem>
	<asp:ListItem Value="CA">California</asp:ListItem>
	<asp:ListItem Value="CO">Colorado</asp:ListItem>
	<asp:ListItem Value="CT">Connecticut</asp:ListItem>
	<asp:ListItem Value="DC">District of Columbia</asp:ListItem>
	<asp:ListItem Value="DE">Delaware</asp:ListItem>
	<asp:ListItem Value="FL">Florida</asp:ListItem>
	<asp:ListItem Value="GA">Georgia</asp:ListItem>
	<asp:ListItem Value="HI">Hawaii</asp:ListItem>
	<asp:ListItem Value="ID">Idaho</asp:ListItem>
	<asp:ListItem Value="IL">Illinois</asp:ListItem>
	<asp:ListItem Value="IN">Indiana</asp:ListItem>
	<asp:ListItem Value="IA">Iowa</asp:ListItem>
	<asp:ListItem Value="KS">Kansas</asp:ListItem>
	<asp:ListItem Value="KY">Kentucky</asp:ListItem>
	<asp:ListItem Value="LA">Louisiana</asp:ListItem>
	<asp:ListItem Value="ME">Maine</asp:ListItem>
	<asp:ListItem Value="MD">Maryland</asp:ListItem>
	<asp:ListItem Value="MA">Massachusetts</asp:ListItem>
	<asp:ListItem Value="MI">Michigan</asp:ListItem>
	<asp:ListItem Value="MN">Minnesota</asp:ListItem>
	<asp:ListItem Value="MS">Mississippi</asp:ListItem>
	<asp:ListItem Value="MO">Missouri</asp:ListItem>
	<asp:ListItem Value="MT">Montana</asp:ListItem>
	<asp:ListItem Value="NE">Nebraska</asp:ListItem>
	<asp:ListItem Value="NV">Nevada</asp:ListItem>
	<asp:ListItem Value="NH">New Hampshire</asp:ListItem>
	<asp:ListItem Value="NJ">New Jersey</asp:ListItem>
	<asp:ListItem Value="NM">New Mexico</asp:ListItem>
	<asp:ListItem Value="NY">New York</asp:ListItem>
	<asp:ListItem Value="NC">North Carolina</asp:ListItem>
	<asp:ListItem Value="ND">North Dakota</asp:ListItem>
	<asp:ListItem Value="OH">Ohio</asp:ListItem>
	<asp:ListItem Value="OK">Oklahoma</asp:ListItem>
	<asp:ListItem Value="OR">Oregon</asp:ListItem>
	<asp:ListItem Value="PA">Pennsylvania</asp:ListItem>
	<asp:ListItem Value="RI">Rhode Island</asp:ListItem>
	<asp:ListItem Value="SC">South Carolina</asp:ListItem>
	<asp:ListItem Value="SD">South Dakota</asp:ListItem>
	<asp:ListItem Value="TN">Tennessee</asp:ListItem>
	<asp:ListItem Value="TX">Texas</asp:ListItem>
	<asp:ListItem Value="UT">Utah</asp:ListItem>
	<asp:ListItem Value="VT">Vermont</asp:ListItem>
	<asp:ListItem Value="WA">Washington</asp:ListItem>
	<asp:ListItem Value="WV">West Virginia</asp:ListItem>
	<asp:ListItem Value="WI">Wisconsin</asp:ListItem>
	<asp:ListItem Value="WY">Wyoming</asp:ListItem>
    </asp:DropDownList>
              </div>
             </div>


             <div class="row">
               <div class="col-md-5">
              <label for="txtCity" class="label-style">City</label>
             </div>
             <div class="form-group col-md-6">
            <asp:TextBox ID="txtCity" placeholder=" City" runat="server"></asp:TextBox>
              </div>
             </div>

             <div class="row">
               <div class="col-md-5">
              <label for="txtCounty" class="label-style">County</label>
             </div>
             <div class="form-group col-md-6">
           <asp:Textbox ID="txtCounty" placeholder=" County" runat="server"></asp:Textbox>
              </div>
             </div>

             <div class="row">
               <div class="col-md-5">
              <label for="txtZipCode" class="label-style">Zip Code</label>
             </div>
             <div class="form-group col-md-6">
           <asp:TextBox ID="txtZipCode" placeholder=" Zip Code" runat="server"></asp:TextBox>
              </div>
             </div>

                        </div>
                    </div>
                </div>
            </div>
            <div class="card" id ="programLoc" runat ="server">
                <div class="card-header" id="headingThree">
                   <div class="d-flex justify-content-lg-start">
                        <button class="btn  collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                            Contact Information
                        </button>
                    </div> 
                </div>
                <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
                    <div class="card-body">
                        <div class="container-fluid" style="padding-top: 20px;">

                          <div class="row">
                    <div class="col-md-6 text-center mx-auto">
                <h5 class="modal-title">Contact information </h5>
                        <br />
                </div>
                    </div>

           <div class="row">
               <div class="col-md-5">
              <label for="txtFirstName" class="label-style">First Name</label>
             </div>
             <div class="form-group col-md-6">
            <asp:TextBox ID="txtFirstName" placeholder=" First Name" runat="server"></asp:TextBox>
              </div>
             </div>

           <div class="row">
               <div class="col-md-5">
              <label for="txtLastName" class="label-style">Last Name</label>
             </div>
             <div class="form-group col-md-6">
             <asp:Textbox ID="txtLastName" placeholder=" Last Name" runat="server"></asp:Textbox>
              </div>
             </div>

           <div class="row">
               <div class="col-md-5">
              <label for="txtEmail" class="label-style">Email</label>
             </div>
             <div class="form-group col-md-6">
            <asp:TextBox ID="txtEmail" placeholder=" Email" runat="server"></asp:TextBox>
              </div>
             </div>

           <div class="row">
               <div class="col-md-5">
              <label for="txtPrimaryPhone" class="label-style">Primary Phone</label>
             </div>
             <div class="form-group col-md-6">
           <asp:Textbox ID="txtPrimaryPhone"  placeholder=" Primary Phone" runat="server"></asp:Textbox>
              </div>
             </div>

           <div class="row">
               <div class="col-md-5">
              <label for="txtSecondaryPhone" class="label-style">Secondary Phone</label>
             </div>
             <div class="form-group col-md-6">
          <asp:TextBox ID="txtSecondaryPhone" placeholder=" Secondary Phone"  runat="server"></asp:TextBox>
              </div>
             </div>
                        </div>
                    </div>
                </div>
            </div>










       <div class="justify-content-center "> 
       
           
           
	  
       

    



      

            

   
          
   
     

              

       
    
   
    
           <br />
           <div class="row">
                   <div class="col-md-6 text-center mx-auto Spacing">
              <asp:Button ID="btnAddOrganization" runat="server" Text="Add Organization" Style="color:white;" Cssclass=" btn btn-success" OnClick="btnAddOrganization_Click" />
                       </div>
               <br />
                   <div class="col-md-6 text-center mx-auto Spacing">
             <button id="btnReturn" type="button" class="btn btn-success" Style="color:white;" onclick="javascript:history.go(-1)">Return</button>
                </div>
                
                  
                    </div>
        <%--<asp:Button ID="btnAddOrganization" runat="server" Text="Add Organization" Cssclass=" btn btn-login btn btn-success" OnClick="btnAddOrganization_Click" />
        <asp:Button ID="btnReturn" runat="server" Text="Return"  Cssclass=" btn btn-login btn btn-success" OnClick="btnReturn_Click" />--%>
       
</div>
</div>
</div>

</asp:Content>

