﻿<%@ Page Title="Create User" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="NewUser.aspx.cs" Inherits="NewUser" %>

<asp:Content ID="ContentBody" ContentPlaceHolderID="MainContent" runat="Server">

    
        <%--<h2 class="display-3 text-center text-white mb-3">Create User</h2>--%>

        <div class="">
            <div class=" card mx-auto ProgramCard">
                <div class="card-body">
                <div class="text-left form-group row">
                    <label for="userType" class="col-4 ">Type:</label>
                    <div class="col-6">
                        <asp:DropDownList ID="userType" runat="server"  CssClass="btn btn-block  dropdown-toggle" Style="background-color: whitesmoke;">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem>Staff</asp:ListItem>
                            <asp:ListItem>Volunteer</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator 
                            ID="reqType" 
                            runat="server" 
                            visible="false">

                        </asp:RequiredFieldValidator>


                    </div>
                </div>
                <div class="text-left form-group row">
                    <label for="userName" class="col-4 col-form-label ">Username:</label>
                    <div class="col-6">
                        <asp:TextBox runat="server" Style="background-color: whitesmoke;"
                            ID="txtUsername"
                            name="userName"
                            type="text"
                            class="form-control"
                            AutoCompleteType="Disabled"
                            Required="required"
                            MaxLength="50">
                            
                        </asp:TextBox>
                        <div class="invalid-feedback">
                            Enter Username
                        </div>


                    </div>
                </div>
                <div class="text-left form-group row">
                    <label for="firstName" class="col-4 col-form-label ">First Name:</label>
                    <div class="col-6">
                        <asp:TextBox runat="server" Style="background-color: whitesmoke;"
                            ID="txtFirstName"
                            name="firstName"
                            type="text"
                            class="form-control here"
                            AutoCompleteType="Disabled"
                            Required="required"
                            MaxLength="50">
                        </asp:TextBox>
                        <div class="invalid-feedback">
                            Enter First Name
                        </div>

                    </div>
                </div>
                <div class="text-left form-group row">
                    <label for="lastName" class="col-4 col-form-label">Last Name:</label>
                    <div class="col-6">
                        <asp:TextBox runat="server" Style="background-color: whitesmoke;"
                            ID="txtLastName"
                            name="lastName"
                            type="text"
                            class="form-control here"
                            AutoCompleteType="Disabled"
                            Required="required"
                            MaxLength="50">
                        </asp:TextBox>
                        <div class="invalid-feedback">
                            Enter Last Name
                        </div>

                    </div>
                </div>
                <div class="text-left form-group row">
                    <label for="password" class="col-4 col-form-label ">Password:</label>
                    <div class="col-6">

                        <input id="txtPassword" Style="background-color: whitesmoke;" type="password" class="form-control" autocomplete="off" runat="server" clientidmode="Static" required>
                        <div class="invalid-feedback">Enter Password</div>

                    </div>
                </div>
                <div class="text-left form-group row">
                    <label for="confirmPW" class="col-4 col-form-label ">Confirm Password:</label>
                    <div class="col-6">

                        <input id="txtConfirmPw" Style="background-color: whitesmoke;" type="password" class="form-control mt-2" autocomplete="off" runat="server" clientidmode="Static" required>
                    </div>
                </div>
                    <br />
                          <div class="row">
                        <div class="col-md-9 mx-auto d-flex justify-content-center Spacing">
                            <asp:Button ID="btnCreate" runat="server" Text="Create" CssClass="btn btn-success btn-block" OnClick="btnCreate_Click" />


                        </div>
                        <div class="col-md-3 mx-auto d-flex justify-content-center Spacing">
                            <asp:Button  runat="server" Text="Back" CssClass="btn  btn-block" href="javascript:history.go(-1)" Style="background-color: #fb9678; color: #fff; "/>

                        </div>
                    </div>




            </div>

            <div id="errors" class="text-center well" style="font-size: inherit"></div>
            <div class="text-center pb-4">
                <asp:Label runat="server" ID="lblUserStatus" Text=" "></asp:Label>
                <br />
                <asp:CompareValidator
                    ID="cmpConfirmPw" Style="background-color: whitesmoke;"
                    runat="server"
                    ControlToValidate="txtConfirmPw"
                    ControlToCompare="txtPassword"
                    Operator="Equal"
                    ErrorMessage="Passwords Do Not Match"
                    Type="String">
                </asp:CompareValidator>
            </div>
            

            
             
            
                </div>

            <div class="modal fade" id="newModal" tabindex="-1" role="dialog" aria-labelledby="modalTitle" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="modalTitle">Success</h5>
                            <a role="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true" class="text-danger" >&times;</span>
                            </a>
                        </div>
                        <div class="modal-body">
                            <asp:Label runat="server" ID="lblStatus" CssClass="modal-dialog"></asp:Label>
                        </div>
                        <div class="modal-footer">
                            <a role="button" class="btn btn-primary" data-dismiss="modal">Close</a>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <asp:ScriptManager runat="server"></asp:ScriptManager>
    

    <script>
        $(document).ready(function () {
            $("#txtPassword").passwordValidation({ "confirmField": "#txtConfirmPw" }, function (element, valid, match, failedCases) {

                $("#errors").html("<pre>" + failedCases.join("\n") + "</pre>");

                if (valid) $(element).css("border", "2px solid green");
                if (!valid) $(element).css("border", "1px solid red");
                if (valid && match) $("#txtConfirmPw").css("border", "2px solid green");
                if (!valid || !match) $("#txtConfirmPw").css("border", "1px solid red");
            });
        });



    </script>


</asp:Content>

