<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <br />
    <br />
    <br />
    <br />
    <br />
    <div>
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
    </div>
</asp:Content>

