<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Update.aspx.cs" Inherits="Update" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <h2>Actualizeaza un eveniment</h2>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
        <tr>
            <td>

                Selecteaza id eveniment</td>
            <td>

                <asp:DropDownList ID="id_eveniment" runat="server" DataSourceID="SqlDataSource1" DataTextField="IdEveniment" DataValueField="IdEveniment" AutoPostBack="True" OnSelectedIndexChanged="id_eveniment_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [IdEveniment] FROM [Eveniment]"></asp:SqlDataSource>

            </td>
        </tr>
        <tr>
            <td>

                Titlu eveniment</td>
            <td>

                <asp:TextBox ID="titlu_eveniment" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Titlu eveniment lipsa!" ControlToValidate="titlu_eveniment"></asp:RequiredFieldValidator>

            </td>
        </tr>
        <tr>
            <td>

                Descriere eveniment</td>
            <td>

                <asp:TextBox ID="descriere_eveniment" runat="server" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Descriere lipsa!" ControlToValidate="descriere_eveniment"></asp:RequiredFieldValidator>

            </td>
        </tr>
        <tr>
            <td style="height: 30px">

                Data</td>
            <td style="height: 30px">

                <asp:TextBox ID="data_eveniment" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Data lipsa!" ControlToValidate="data_eveniment"></asp:RequiredFieldValidator>

                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="data_eveniment" ErrorMessage="Format data incorect!" Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>

            </td>
        </tr>
        <tr>
            <td>

                Nr locuri</td>
            <td>

                <asp:TextBox ID="nr_locuri" runat="server" TextMode="Number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Nr locuri lipsa!" ControlToValidate="nr_locuri"></asp:RequiredFieldValidator>

            </td>
        </tr>
        <tr>
            <td>

                Id Locatie</td>
            <td>

                <asp:DropDownList ID="id_locatie" runat="server" DataSourceID="SqlDataSource2" DataTextField="IdLocatie" DataValueField="IdLocatie">
                </asp:DropDownList>

                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [IdLocatie] FROM [Eveniment]">
                </asp:SqlDataSource>

            </td>
        </tr>
        <tr>
            <td colspan="2">

                <asp:Button ID="update_event" runat="server" OnClick="update_event_Click" Text="Actualizeaza eveniment" Width="194px" />

            </td>
        </tr>
    </table>
</asp:Content>

