<%@ Page Title="" Language="C#" MasterPageFile="~/FirstPage.master" AutoEventWireup="true" CodeFile="UserPage.aspx.cs" Inherits="UserPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <center>Sunteti logat cu userul
    <asp:Label ID="username" runat="server" Text="Label" style="font-weight: 700"></asp:Label>
&nbsp;avand rangul de
    <asp:Label ID="rang" runat="server" Text="Label" style="font-weight: 700"></asp:Label>.
    <asp:Button ID="logout" runat="server" Text="Delogare" OnClick="logout_Click" />
    <br />
    <br />
    Rangul tau de utilizator nu pune la dispozitie nicio facilitate.<br />
        </center>
</asp:Content>

