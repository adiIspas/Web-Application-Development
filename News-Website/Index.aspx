﻿<%@ Page Title="" Language="C#" MasterPageFile="~/FirstPage.master" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    
    
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="Stiri">
        
    </asp:GridView>
    
    
    <asp:SqlDataSource ID="Stiri" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [titlu], [categorie], [descriere], [imagine], [continut], [data] FROM [Stire]"></asp:SqlDataSource>



</asp:Content>

