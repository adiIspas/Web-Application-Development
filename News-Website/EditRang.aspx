<%@ Page Title="" Language="C#" MasterPageFile="~/FirstPage.master" AutoEventWireup="true" CodeFile="EditRang.aspx.cs" Inherits="EditRang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <center>

    <table>
        <tr>
            <td>

                <asp:Label ID="nume" runat="server" Text="Nume utilizator"></asp:Label>

            </td>
            <td>

                <asp:TextBox ID="username" runat="server"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="username" ErrorMessage="Nume utilizator lipsa!"></asp:RequiredFieldValidator>

            </td>
        </tr>
        <tr>
            <td>

                <asp:Label ID="rang" runat="server" Text="Noul rang"></asp:Label>

            </td>
            <td>

                <asp:TextBox ID="new_rang" runat="server"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="new_rang" ErrorMessage="Rang nou lipsa!"></asp:RequiredFieldValidator>

            </td>
        </tr>
        <tr>
            <td>

                <asp:Button ID="modifica" runat="server" Text="Modifica rang" OnClick="modifica_Click" />

            </td>
        </tr>
    </table>
        </center>
    </asp:Content>

