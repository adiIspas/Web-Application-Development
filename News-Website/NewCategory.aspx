<%@ Page Title="" Language="C#" MasterPageFile="~/OtherPage.master" AutoEventWireup="true" CodeFile="NewCategory.aspx.cs" Inherits="NewCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <table>
        <tr>
            <td>

                <asp:Label ID="categorie" runat="server" Text="Nume categorie"></asp:Label>

            </td>
            <td>

                <asp:TextBox ID="nume_categorie" runat="server"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="nume_categorie" ErrorMessage="Nume categorie lipsa!"></asp:RequiredFieldValidator>

            </td>
        </tr>
        <tr>
            <td>

                <asp:Button ID="creaza_categorie" runat="server" OnClick="creaza_categorie_Click" Text="Creaza categorie" />

            </td>
            <td>

                <asp:Label ID="erori" runat="server" Text=""></asp:Label>

            </td>
        </tr>
        </table>

    Categorii actuale
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="Categorii">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="denumire" HeaderText="denumire" SortExpression="denumire" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="Categorii" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Categorie]"></asp:SqlDataSource>
</asp:Content>

