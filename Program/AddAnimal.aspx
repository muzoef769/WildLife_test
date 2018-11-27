<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="AddAnimal.aspx.cs" Inherits="AddAnimal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:ScriptManager runat="server"></asp:ScriptManager>

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
                                        <a style="margin-right: 5px; color: black;" class="nav-link active " id="homee-tab" data-toggle="tab" href="#Animal Info" role="tab" aria-controls="homee" aria-selected="true">Animal Info</a>
                                    </li>
                                    <li class="nav-item ">
                                        <a style="margin-right: 5px; color: black;" class="nav-link " id="profile-tab" data-toggle="tab" href="#Additional Info" role="tab" aria-controls="profile" aria-selected="false">Additional Info</a>
                                    </li>
                                </ul>
                                <br />

                            </div>

                            <br />

                            <div class="row" style="margin-left: 5px;">
                                <div class="col-md-5">
                                    <label class="label-style font-weight-bold"></label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

