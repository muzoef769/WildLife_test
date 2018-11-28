<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="PasswordReset.aspx.cs" Inherits="PasswordReset" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />

    <%--<div>
        <asp:Label ID="lblUserName" runat="server" Text="User Name"></asp:Label>
        <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="btnPass" runat="server" Text="Submit" OnClick="btnPass_Click" CausesValidation="true" UseSubmitBehavior="false" />
        <asp:Button ID="btnHome" runat="server" Text="Login" OnClick="btnHome_Click" CausesValidation="true" UseSubmitBehavior="false" />
        <asp:Label ID="lblMessage" runat="server" CssClass="text-white" Text=""></asp:Label>

    </div>--%>


    <div class="container-fluid LoginContainer">
        <div class="card mx-auto  LoginCard" style="width: 25rem;">
            <div class="card-body ">
                <h2 class=" CardTitle d-flex justify-content-center">Account Recovery</h2>
                <br />
                <div class="form-group ">
                    <asp:TextBox ID="txtUserName" placeholder="Enter Username" required="required" CssClass="form-control text-center " runat="server"></asp:TextBox>
                </div>
                <br />
               
                <div class="form-group">
                    <div class="text-center">
                        <asp:TextBox ID="txtMessage" runat="server" Visible="true" ForeColor="Transparent" TextMode="MultiLine"  Width="100%" 
                            BorderStyle="None" ReadOnly="true" CssClass="text-center status" ></asp:TextBox>
                    </div>
                </div>
                
                <br />
                <div class="row">

                    <div class="col col-4 col-md-4 col-sm-4 col-lg-4 col-xs-4 col-xl-4 mb-1 row">
                        <asp:Button ID="btnHome" runat="server" CssClass="btn btn-block " OnClick="btnHome_Click" Text="Cancel" CausesValidation="true" UseSubmitBehavior="false" />
                    </div>
                    <div class="col col-4 col-md-4 col-sm-4 col-lg-4 col-xs-4 col-xl-4 mb-1 justify-content-end row ">
                        <asp:Button ID="btnPass" runat="server" CssClass="btn btn-primary btn-block" OnClick="btnPass_Click" Text="Submit" CausesValidation="true" UseSubmitBehavior="false" />
                    </div>

                </div>

            </div>
        </div>
    </div>










</asp:Content>

