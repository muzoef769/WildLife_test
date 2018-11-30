<%@ Page Title="Error" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Error.aspx.cs" Inherits="Error" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">

    <div class="text-center mt-5 mb-5">
        <h2 class="display-2 text-white">Error!</h2>
        <div class="jumbotron bg-transparent">
            <div>
                <h5 class="text-white">You are encountering an error. Your account most likely hasn't been approved by the system administrator. Please contact your local administrator!</h5>
                <a class="nav-link  display-4" href="Default.aspx" role="button">Back To Login</a>
            </div>
            

        </div>
    </div>

</asp:Content>


