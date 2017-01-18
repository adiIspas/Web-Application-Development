<%@ Page Title="" Language="C#" MasterPageFile="~/Head.master" AutoEventWireup="true" CodeFile="Create.aspx.cs" Inherits="Create" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <h2>Adauga o noua planificare pentru asfaltare</h2>
    <style type="text/css">
        .auto-style1 {
            height: 30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
        <tr>
            <td>

                Id drum</td>
            <td>

                <asp:DropDownList ID="id_drum" runat="server" DataSourceID="IdDrum" DataTextField="Id" DataValueField="Id">
                </asp:DropDownList>
                <asp:SqlDataSource ID="IdDrum" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id] FROM [Drumuri]"></asp:SqlDataSource>

            </td>
        </tr>
        <tr>
            <td>
                Cost
            </td>
            <td>

                <asp:TextBox ID="cost_drum" runat="server" Width="135px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ErrorMessage="Costul lipseste" ControlToValidate="cost_drum"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="Dynamic" ErrorMessage="Costul trebuie sa fie intreg." ControlToValidate="cost_drum" ValidationExpression="^[+]?\d+([.]\d+)?$"></asp:RegularExpressionValidator>

            </td>
        </tr>
        <tr>
            <td>
                Data
            </td>
            <td>

                <asp:Calendar ID="data_drum" runat="server"></asp:Calendar>

            </td>
        </tr>
        <tr>
            <td colspan="2" class="auto-style1">

                <asp:Button ID="adauga" runat="server" Text="Adauga planificare" OnClick="adauga_Click" Width="138px" />

            </td>
        </tr>
    </table>
</asp:Content>

