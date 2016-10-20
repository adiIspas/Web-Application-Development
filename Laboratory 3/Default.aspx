<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



   
     <asp:Label ID="Label1" runat="server" Text="Username"></asp:Label>
    <asp:TextBox ID="TextBox2" runat="server" OnTextChanged="TextBox2_TextChanged"></asp:TextBox>
    <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
    <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged" TextMode="Password"></asp:TextBox>



    <asp:Button ID="Button1" runat="server" Text="Button" />


     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox2" ErrorMessage="Username?"></asp:RequiredFieldValidator>


</asp:Content>

