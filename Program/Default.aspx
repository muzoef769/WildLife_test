<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">

    <div class="container-fluid LoginContainer">
        <div class="card mx-auto  LoginCard" style="width: 25rem;">
            <div class="card-body ">
                <h2 class=" CardTitle d-flex justify-content-center">Login</h2>
                <br />
                <div class="form-group ">
                    <asp:TextBox ID="txtUsername" placeholder="Username" required="required" CssClass="form-control text-center " runat="server"></asp:TextBox>
                </div>
                <br />
                <div class="form-group ">
                    <asp:TextBox ID="txtPassword" placeholder="Password" TextMode="Password" required="required" CssClass="form-control text-center " runat="server"></asp:TextBox>
                </div>
               
                <div class="form-group ">
                    <div class="text-center">
                        <asp:TextBox ID="txtStatus" runat="server" Visible="true" ForeColor="Transparent"  BorderStyle="None" ReadOnly="true" OnTextChanged="txtStatus_TextChanged" CssClass="text-center status"></asp:TextBox>
                    </div>
                </div>
                 <asp:LinkButton ID="btnPass" runat="server" OnClick="PasswordReset" CausesValidation="true" UseSubmitBehavior="false" CssClass="btn-link">Password Reset</asp:LinkButton>
                <br />
                <br />
                <div class="row">

                    <div class="col-md-4 col-sm-4 col-lg-4 col-xs-4 col-xl-4 offset-2">
                        <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-success btn-block" OnClick="btnLogin_Click" Text="Login" CausesValidation="true" UseSubmitBehavior="false" />
                    </div>
                    <div class="col-md-4 col-sm-4 col-lg-4 col-xs-4 col-xl-4 ">
                        <a class="btn  btn-block" data-toggle="modal" data-target="#RegisterModal"  Style="background-color: #fb9678; color: #fff; " href="index.html" role="button" runat="server">Register
                        </a>
                    </div>

                </div>

            </div>
        </div>
    </div>

    <div class="modal" id="RegisterModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-full" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="container">

                        <div class="modal-header ">Register an Account</div>
                        <div class="modal-body">

                            <div class="form-group">
                                <div class="form-row">
                                    <div class="col-md-6">
                                        <div class="form-label-group">
                                            <asp:TextBox ID="txtFirstName" class="form-control" placeholder="First name" required="required" runat="server" MaxLength="50"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-label-group">
                                            <asp:TextBox ID="txtLastName" class="form-control" placeholder="Last name" required="required" runat="server" MaxLength="50"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-label-group">
                                            <asp:TextBox ID="txtEmail" class="form-control" placeholder="Email" required="required" runat="server" MaxLength="50"></asp:TextBox>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-label-group">
                                    <asp:TextBox ID="txtNewUsername" class="form-control" placeholder="Username" required="required" runat="server" MaxLength="50"></asp:TextBox>

                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-row">
                                    <div class="col-md-6">
                                        <div class="form-label-group">
                                            <input id="txtNewPassword" type="password" class="form-control" placeholder="Password" autocomplete="off" runat="server" clientidmode="Static" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-label-group">
                                            <input id="txtConfirmPassword" type="password" class="form-control" placeholder="Confirm Password" autocomplete="off" runat="server" clientidmode="Static" required>
                                            <div id="errors" class="text-center well" style="font-size: inherit"></div>

                                            <asp:CompareValidator
                                                ID="cmpConfirmPw"
                                                runat="server"
                                                ControlToValidate="txtConfirmPassword"
                                                ControlToCompare="txtNewPassword"
                                                Operator="Equal"
                                                ErrorMessage="Passwords Do Not Match"
                                                Type="String">
                                            </asp:CompareValidator>
                                        </div>


                                    </div>
                                    <div class="col-12 text-center" id="JSPassword"></div>


                                </div>
                                <div class="row text-left">
                                    <div class="col-md-4 col-sm-6">
                                        <asp:RadioButtonList ID="rdoPosition" runat="server">
                                            <asp:ListItem>Volunteer</asp:ListItem>
                                            <asp:ListItem>Staff</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group col-md-4 mx-auto">
                                <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-success btn-block" OnClick="btnRegister_Click" UseSubmitBehavior="false" ValidationGroup="registerValidation" />

                                <div class="text-center">
                                    <a class="d-block small mt-3" data-dismiss="modal" href="#" runat="server">Login Page</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <br />
            <br />
        </div>
    </div>

    <asp:ScriptManager runat="server"></asp:ScriptManager>


    <script>
        $(document).ready(function () {
            $("#txtNewPassword").passwordValidation({ "confirmField": "#txtConfirmPassword" },

                function (element, valid, match, failedCases) {

                    $("#JSPassword").html("<pre>" + failedCases.join("\n") + "</pre>");

                    if (valid) $(element).css("border", "2px solid green");
                    if (!valid) $(element).css("border", "1px solid red");
                    if (valid && match) $("#txtConfirmPassword").css("border", "2px solid green");
                    if (!valid || !match) $("#txtConfirmPassword").css("border", "1px solid red");
                });
        });

    </script>

</asp:Content>


