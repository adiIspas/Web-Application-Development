<%@ Page Title="" Language="C#" MasterPageFile="~/OtherPage.master" AutoEventWireup="true" CodeFile="LogoutUser.aspx.cs" Inherits="LogoutUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        Sunteți conectat cu userul
        <asp:Label ID="username" runat="server" Text="Label"></asp:Label>.</p>
    <p>
        Sigur doriți să vă deconectați?</p>
    <p>
        <asp:Button ID="Button1" runat="server" Text="Da" OnClick="Button1_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" Text="Nu" OnClick="Button2_Click" />
    </p>
</asp:Content>

