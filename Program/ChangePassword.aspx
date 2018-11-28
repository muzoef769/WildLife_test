<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <br />
    <br />
   
    <%--<div>
        <fieldset>
            <asp:Label ID="lblPass" runat="server" Text="New Password: "></asp:Label>
            <asp:TextBox ID="txtPass" runat="server" TextMode="Password"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="lblConfirmPass" runat="server" Text="Confirm Password: "></asp:Label>
            <asp:TextBox ID="txtConfirmPass" runat="server" TextMode="Password"></asp:TextBox>
            <br />
            <asp:Button ID="btnChangePassword" runat="server" Text="Change Password" OnClick="ChangeResetPassword" CausesValidation="true" UseSubmitBehavior="false" />
            <asp:Button ID="btnReturn" runat="server" Text="Login" OnClick="btnReturn_Click" CausesValidation="true" UseSubmitBehavior="false" />
            <br />

            <asp:Label ID="lblMessage1" runat="server" CssClass="text-white"></asp:Label>
        </fieldset>
    </div>--%>


    <div class="container-fluid LoginContainer">
        <div class="card mx-auto  LoginCard" style="width: 25rem;">
            <div class="card-body ">
                <h2 class=" CardTitle d-flex justify-content-center">New Password</h2>
                <br />
                <div class="form-group ">
                    <asp:TextBox ID="txtPass" placeholder="Enter New Password" required="required" TextMode="Password" CssClass="form-control text-center" runat="server" ></asp:TextBox>
                </div>
                <br />
                <div class="form-group ">
                    <asp:TextBox ID="txtConfirmPass" placeholder="Confirm Password" required="required" TextMode="Password"  CssClass="form-control text-center" runat="server"></asp:TextBox>
                </div>
               
                <div class="form-group">
                    <div class="text-center">
                        <asp:TextBox ID="txtMessage" runat="server" Visible="true" ForeColor="Transparent" TextMode="MultiLine"  Width="100%" 
                            BorderStyle="None" ReadOnly="true" CssClass="text-center status" ></asp:TextBox>
                    </div>
                </div>
                
                <br />
                <div class="row">

                    <div class="col col-4 col-md-4 col-sm-4 col-lg-4 col-xs-4 col-xl-4 mb-1 row">
<%--                        <asp:Button ID="btnReturn" runat="server" CssClass="btn btn-block " OnClick="btnReturn_Click" 
                            Text="Return" CausesValidation="true" UseSubmitBehavior="false" />--%>
                    </div>
                    <div class="col col-4 col-md-4 col-sm-4 col-lg-4 col-xs-4 col-xl-4 mb-1 justify-content-end row ">
                        <asp:Button ID="btnChangePassword" runat="server" CssClass="btn btn-success btn-block" OnClick="ChangeResetPassword" 
                            Text="Confirm" CausesValidation="true" UseSubmitBehavior="false" />
                    </div>

                </div>

            </div>
        </div>
    </div>



</asp:Content>

