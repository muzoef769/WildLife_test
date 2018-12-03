<%@ Page Title="Add Animal" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="AddAnimal.aspx.cs" Inherits="AddAnimal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ScriptManager runat="server"></asp:ScriptManager>
    <script>
        $(document).ready(function () {
            $("#home").removeClass('active');
            $("#animal").addClass('active');

        });
    </script>


    <div class="card-body">
        <h3 class="box-title">Add Animal</h3>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">
                    <div class=" ">
                        
                    </div>

                    <br />

                    <div class="tab-content">
                        <div id="AnimalInfo" class="tab-pane fade show active">
                            <div class=" ">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-5">
                                            <label for="txtName" class="label-style">Animal Name</label>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <asp:TextBox ID="txtName" runat="server" class="form-control border" Style="background-color: whitesmoke;"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-5">
                                            <label for="drpAnimalType" class="label-style">Animal Type</label>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <asp:DropDownList ID="drpAnimalType" runat="server" CssClass="btn btn-block dropdown-toggle border" Style="background-color: whitesmoke;">
                                                <asp:ListItem Value="0" Text=" "> </asp:ListItem>
                                                <asp:ListItem>Bird</asp:ListItem>
                                                <asp:ListItem>Mammal</asp:ListItem>
                                                <asp:ListItem>Repitle</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-5">
                                            <label for="drpStatus" class="label-style">Animal Status</label>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <asp:DropDownList ID="drpStatus" runat="server" CssClass="btn btn-block dropdown-toggle border" Style="background-color: whitesmoke;">
                                                <asp:ListItem Value="0" Text=" "> </asp:ListItem>
                                                <asp:ListItem>Active</asp:ListItem>
                                                <asp:ListItem>Inactive</asp:ListItem>
                                                <asp:ListItem>Temporarily Inactive</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-5">
                                            <label for="FileUpload1" class="label-style">Upload Image</label>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <asp:FileUpload ID="FileUpload1" runat="server" />
                                            <asp:RequiredFieldValidator runat="server" ID="uploadVal" ControlToValidate="FileUpload1" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="row">
                                        <div class="col col-3 col-xl-2 col-lg-2 col-md-2 col-s-2 mx-auto p-1">
                                            <asp:Button ID="btnReturn" runat="server" CssClass="btn btn-success btn-block" Style="color: white;" OnClick="BtnAddAnimal" Text="Submit" UseSubmitBehavior="false" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>



                </div>
            </div>
        </div>
    </div>
</asp:Content>

