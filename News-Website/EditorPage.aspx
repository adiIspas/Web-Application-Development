<%@ Page Title="" Language="C#" MasterPageFile="~/OtherPage.master" AutoEventWireup="true" CodeFile="EditorPage.aspx.cs" Inherits="EditorPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    Sunteti logat cu userul
    <asp:Label ID="username" runat="server" Text="Label" style="font-weight: 700"></asp:Label>
&nbsp;avand rangul de
    <asp:Label ID="rang" runat="server" Text="Label" style="font-weight: 700"></asp:Label>.
    <asp:Button ID="logout" runat="server" Text="Delogare" OnClick="logout_Click" />
    <br />
    <br />
    Astfel, aveti la dispozitie urmatoarele facilitati:<br />
    <table>
        <tr>
            <td>

                <asp:Button ID="add_category" runat="server" Text="Adauga Categorie" OnClick="add_category_Click" Width="156px" />

            </td>
            <td>

                Adauga categorie noua de stiri. Categoria nu trebuie sa existe deja.</td>
            
        </tr>
        <tr>
            <td>

                <asp:Button ID="Button1" runat="server" Text="Adauga Stire" OnClick="add_news_Click" Width="157px" />

            </td>
            <td>

                Adauga stire noua intr-o categorie anume.</td>
            
        </tr>
    </table>
</asp:Content>

