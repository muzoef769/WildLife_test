<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="AnimalFirstPage.aspx.cs" Inherits="AnimalFirstPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <%--<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">--%>
<style>
* {
    box-sizing: border-box;
}

/* Create three equal columns that floats next to each other */
.column {
    float: left;
    text-align:center;
    width: 33.33%;
    padding: 10px;
    height: 300px; /* Should be removed. Only for demonstration */
}

/* Clear floats after the columns */
.row:after {
    content: "";
    display: table;
    clear: both;
}
</style>
<%--</head>
<body>--%>

<h2>Education Animals</h2>

<div class="row">
  <div class="column" style="background-color:#aaa;">
    <h2>Birds</h2>
    <a href="Birds.aspx">
  <img src="Images/storyblocks-bald-eagle-haliaeetus-leucocephalus-portrait-of-brown-bird-of-prey-with-white-head-yellow-bill-symbol-of-freedom-of-the-united-states-of-america-alaska-usa_ScUQXlQ7-G.jpg" /> 
</a>
    <br /> 
     <br /> 
    
      
  </div>
  <div class="column" style="background-color:#bbb;">
    <h2>Mammals</h2>
    <a href="Mammals.aspx">
        <img src="Images/149_2101619.jpg" />
        
</a>
    <br /> 
     <br /> 
      




  </div>
  <div class="column" style="background-color:#ccc;">
<h2>Reptiles</h2>
    <a href="Reptiles.aspx">
        <img src="Images/138_1079348.jpg" />
        
</a>
    <br /> 
     <br /> 
    




  </div>
</div>


    <br /> 
     <br /> 
    <br /> 
     <br /> 
    <br /> 
     <br /> 

    <a href="AddAnimal.aspx?field1=0" style="font-size: 40px">Create New Animal</a>


</asp:Content>

