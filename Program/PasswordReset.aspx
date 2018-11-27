<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="PasswordReset.aspx.cs" Inherits="PasswordReset" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />

    <div>
        <asp:Label ID="lblUserName" runat="server" Text="User Name"></asp:Label>
        <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="btnPass" runat="server" Text="Submit" OnClick="btnPass_Click" CausesValidation="true" UseSubmitBehavior="false" />
        <asp:Button ID="btnHome" runat="server" Text="Login" OnClick="btnHome_Click" CausesValidation="true" UseSubmitBehavior="false" />
        <asp:Label ID="lblMessage" runat="server" CssClass="text-white" Text=""></asp:Label>

    </div>
</asp:Content>

