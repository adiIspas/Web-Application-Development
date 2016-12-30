<%@ Page Title="" Language="C#" MasterPageFile="~/OtherPage.master" AutoEventWireup="true" CodeFile="AddNews.aspx.cs" Inherits="AddNews" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
        <tr>
            <td>

                Titlu</td>
            <td>

                <asp:TextBox ID="titlu" runat="server" Width="307px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Titlu lipsa!" ControlToValidate="titlu"></asp:RequiredFieldValidator>

            </td>
        </tr>
        <tr>
            <td>

                Categorie</td>
            <td>

                <asp:DropDownList ID="categorie" runat="server" DataSourceID="Categorii" DataTextField="denumire" DataValueField="denumire" Height="16px" Width="105px">
                </asp:DropDownList>
                <asp:SqlDataSource ID="Categorii" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [denumire] FROM [Categorie]"></asp:SqlDataSource>

            </td>
        </tr>
        <tr>
            <td>

                Descriere</td>
            <td>

                <asp:TextBox ID="descriere" runat="server" Height="34px" TextMode="MultiLine" Width="308px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Descriere lipsa!" ControlToValidate="descriere"></asp:RequiredFieldValidator>

            </td>
        </tr>
        <tr>
            <td>

                Imagine</td>
            <td>

                <asp:FileUpload ID="imagine" runat="server" Width="309px" />

            </td>
        </tr>
        <tr>
            <td>

                Continut</td>
            <td>

                <asp:TextBox ID="continut" runat="server" Height="210px" TextMode="MultiLine" Width="313px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Continut lipsa!" ControlToValidate="continut"></asp:RequiredFieldValidator>

            </td>
        </tr>
        <tr>
            <td>

                <asp:Button ID="publica" runat="server" Text="Publica stirea" />

            </td>
        </tr>
    </table>
</asp:Content>

