<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Update.aspx.cs" Inherits="Update" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <h2>Actualizeaza o vizita</h2>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
        <tr>
            <td>

                Selecteaza ID Vizita</td>
            <td>

                <asp:DropDownList ID="id_vizita" runat="server" DataSourceID="SqlDataSource1" DataTextField="IdVizita" DataValueField="IdVizita" AutoPostBack="True" OnSelectedIndexChanged="id_vizita_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [IdVizita] FROM [Vizita]"></asp:SqlDataSource>

            </td>
        </tr>
         <tr>
            <td>

                Selecteaza ID Pagina</td>
            <td>

                <asp:DropDownList ID="id_pagina" runat="server" DataSourceID="SqlDataSource2" DataTextField="Id" DataValueField="Id">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id] FROM [Pagina]"></asp:SqlDataSource>

            </td>
        </tr>
         <tr>
            <td>

                IP</td>
            <td>
                 <asp:TextBox ID="ip_vizita" runat="server" OnTextChanged="ip_vizita_TextChanged"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="IP lipsa" ControlToValidate="ip_vizita"></asp:RequiredFieldValidator>

                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="ip_vizita" ErrorMessage="IP incorect" ValidationExpression="\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b"></asp:RegularExpressionValidator>

            </td>
        </tr>
         <tr>
            <td>

                Data</td>
            <td>

                <asp:TextBox ID="data_vizita" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Data lipsa" ControlToValidate="data_vizita"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Data incorecta" ControlToValidate="data_vizita" Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>

            </td>
        </tr>
         <tr>
            <td>

                Browser</td>
            <td>
                <asp:TextBox ID="browser_vizita" runat="server"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Browser lipsa" ControlToValidate="browser_vizita"></asp:RequiredFieldValidator>

            </td>
        </tr>
         <tr>
            <td>

                Tara</td>
            <td>
                 <asp:TextBox ID="tara_vizita" runat="server"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Tara lipsa" ControlToValidate="tara_vizita"></asp:RequiredFieldValidator>

            </td>
        </tr>
         <tr>
            <td colspan ="2">

                <asp:Button ID="actualizeaza_vizita" runat="server" Text="Actualizeaza vizita" Width="140px" OnClick="actualizeaza_vizita_Click" />

            </td>
        </tr>
    </table>
</asp:Content>

