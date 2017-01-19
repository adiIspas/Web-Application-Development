<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Create.aspx.cs" Inherits="Create" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <h2>Adauga un nou eveniment</h2>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
        <tr>
            <td>

                Titlu eveniment</td>
            <td>

                <asp:TextBox ID="titlu_eveniment" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ErrorMessage="Titlu lipsa!" ControlToValidate="titlu_eveniment"></asp:RequiredFieldValidator>

            </td>
        </tr>
        <tr>
            <td>

                Descriere eveniment</td>
            <td>

                <asp:TextBox ID="descriere_eveniment" runat="server" TextMode="MultiLine"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="descriere_eveniment" Display="Dynamic" ErrorMessage="Descriere lipsa!"></asp:RequiredFieldValidator>

            </td>
        </tr>
        <tr>
            <td>

                Data eveniment</td>
            <td>

                <asp:TextBox ID="data_eveniment" runat="server" TextMode="Date"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="data_eveniment" Display="Dynamic" ErrorMessage="Data lipsa!"></asp:RequiredFieldValidator>

            </td>
        </tr>
        <tr>
            <td>

                Nr locuri</td>
            <td>

                <asp:TextBox ID="nr_locuri" runat="server" TextMode="Number"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="nr_locuri" Display="Dynamic" ErrorMessage="Nr locuri lipsa!"></asp:RequiredFieldValidator>

            </td>
        </tr>
        <tr>
            <td>

                Id locatie</td>
            <td>

                <asp:DropDownList ID="id_locatie" runat="server" DataSourceID="SqlDataSource1" DataTextField="IdLocatie" DataValueField="IdLocatie">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [IdLocatie] FROM [Locatie]"></asp:SqlDataSource>

            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="create" runat="server" OnClick="create_Click" Text="Adauga eveniment" Width="168px" />
            </td>
        </tr>
    </table>
</asp:Content>

