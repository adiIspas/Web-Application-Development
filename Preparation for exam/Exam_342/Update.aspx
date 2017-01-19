<%@ Page Title="" Language="C#" MasterPageFile="~/MP.master" AutoEventWireup="true" CodeFile="Update.aspx.cs" Inherits="Update" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <h2>Actualizeaza detalii factura</h2>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
        <tr>
            <td>
                Selecteaza Id factura
            </td>
            <td>
                <asp:DropDownList ID="id_factura" runat="server" DataSourceID="SqlDataSource1" DataTextField="IdFactura" DataValueField="IdFactura" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
    </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>

                Selecteaza Id beneficiar</td>
            <td>

                <asp:DropDownList ID="id_beneficiar" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="IdBeneficiar" DataValueField="IdBeneficiar">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [IdBeneficiar] FROM [Beneficiar]"></asp:SqlDataSource>

            </td>
        </tr>
        <tr>
            <td>

                Detalii</td>
            <td>

                <asp:TextBox ID="detalii" runat="server" TextMode="MultiLine"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="detalii" Display="Dynamic" ErrorMessage="Detaliile lipsesc!"></asp:RequiredFieldValidator>
</td>
        </tr>
        <tr>
            <td>

                Data emitere</td>
            <td>
                <asp:TextBox ID="data_emitere" runat="server"></asp:TextBox>

                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="data_emitere" Display="Dynamic" ErrorMessage="Data incorecta!" Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="data_emitere" Display="Dynamic" ErrorMessage="Data lipseste!"></asp:RequiredFieldValidator>

            </td>
        </tr>
        <tr>
            <td>

                Valoare</td>
            <td>
                 <asp:TextBox ID="valoare" runat="server"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="valoare" Display="Dynamic" ErrorMessage="Valoarea lipseste!"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="valoare" Display="Dynamic" ErrorMessage="Valoarea trebuie sa fie un numar natural!" ValidationExpression="^[+]?\d+([.]\d+)?$"></asp:RegularExpressionValidator>

            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="actualizeaza" runat="server" Text="Actualizeaza informatii" Width="133px" OnClick="actualizeaza_Click" />
            </td>
        </tr>
    </table>
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [IdFactura] FROM [Factura]"></asp:SqlDataSource>
</asp:Content>

