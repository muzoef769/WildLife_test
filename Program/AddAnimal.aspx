<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="AddAnimal.aspx.cs" Inherits="AddAnimal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ScriptManager runat="server"></asp:ScriptManager>
        <script>
        $(document).ready(function () {
           $("#home").removeClass('active');
                    $("#animal").addClass('active');

        });
    </script>


    <div class="content">
        <div class="animated fadeIn">
            <div class="card-body">
                <h4 class="box-title">Add Animal</h4>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <div class=" ">
                                <script type="text/javascript">
                                    $(document).ready(function () {
                                        $('a[data-toggle="tab"]').on('show.bs.tab', function (e) {
                                            localStorage.setItem('activeTab', $(e.target).attr('href'));
                                        });
                                        var activeTab = localStorage.getItem('activeTab');
                                        if (activeTab) {
                                            $('#myTab a[href="' + activeTab + '"]').tab('show');
                                        }
                                    });
                                </script>
                                <ul class="nav nav-tabs  col-xl-12 col-lg-12 col-md-12 col-s-12 " id="myTab" style="padding-left: 15px; border-bottom: none;" role="tablist">
                                    <li class="nav-item ">
                                        <a style="margin-right: 5px; color: black;" class="nav-link active " id="homee-tab" data-toggle="tab" href="#AnimalInfo" role="tab" aria-controls="homee" aria-selected="true">Animal Info</a>
                                    </li>
                                    <li class="nav-item ">
                                        <a style="margin-right: 5px; color: black;" class="nav-link " id="profile-tab" data-toggle="tab" href="#UploadImage" role="tab" aria-controls="profile" aria-selected="false">Upload Image</a>
                                    </li>
                                </ul>
                                <br />

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
                                                    <asp:TextBox ID="txtName" runat="server" class="form-control" Style="background-color: whitesmoke;"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-5">
                                                    <label for="drpAnimalType" class="label-style">Animal Type</label>
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <asp:DropDownList ID="drpAnimalType" runat="server" CssClass="btn dropdown-toggle" Style="background-color: whitesmoke;">
                                                        <asp:ListItem></asp:ListItem>
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
                                                    <asp:DropDownList ID="drpStatus" runat="server" CssClass="btn dropdown-toggle" Style="background-color: whitesmoke;">
                                                        <asp:ListItem></asp:ListItem>
                                                        <asp:ListItem>Active</asp:ListItem>
                                                        <asp:ListItem>Inactive</asp:ListItem>
                                                        <asp:ListItem>Temporarily Inactive</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="UploadImage" class="tab-pane fade">
                                    <div class=" ">
                                        <div class="card-body">
                                            <div class="row">
                                                <label for="FileUpload1" class="label-style">Upload Image</label>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <asp:FileUpload ID="FileUpload1" runat="server" />
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
    </div>
</asp:Content>

