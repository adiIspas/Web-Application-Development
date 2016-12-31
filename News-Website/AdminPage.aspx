<%@ Page Title="" Language="C#" MasterPageFile="~/OtherPage.master" AutoEventWireup="true" CodeFile="AdminPage.aspx.cs" Inherits="AdminPage" %>

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

                <asp:Button ID="vizualizeaza" runat="server" Text="Vizualizeaza" OnClick="vizualizeaza_Click" Width="156px" />

            </td>
            <td>

                Vizualizeaza utilizatori. Poti cauta utilizatori inregistrati dupa rang.</td>
            
        </tr>
        <tr>
            <td style="height: 30px">

                <asp:Button ID="modifica" runat="server" Text="Modifica" OnClick="modifica_Click" Width="156px" />

            </td>
            <td style="height: 30px">

                Modifica rand utilizator. Poti modifica privilegiile utilizatorilor inregistrati.</td>
            
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

