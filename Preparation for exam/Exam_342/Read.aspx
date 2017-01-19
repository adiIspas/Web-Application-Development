<%@ Page Title="" Language="C#" MasterPageFile="~/MP.master" AutoEventWireup="true" CodeFile="Read.aspx.cs" Inherits="Read" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <h2>Listeaza facturile din baza de date</h2>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="Nume" HeaderText="Nume" SortExpression="Nume" />
            <asp:BoundField DataField="Tip" HeaderText="Tip" SortExpression="Tip" />
            <asp:BoundField DataField="Detalii" HeaderText="Detalii" SortExpression="Detalii" />
            <asp:BoundField DataField="DataEmitere" HeaderText="DataEmitere" SortExpression="DataEmitere" />
            <asp:BoundField DataField="Valoare" HeaderText="Valoare" SortExpression="Valoare" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT b.Nume, b.Tip, f.Detalii, f.DataEmitere, f.Valoare FROM Beneficiar AS b INNER JOIN Factura AS f ON b.IdBeneficiar = f.IdBeneficiar ORDER BY f.Valoare"></asp:SqlDataSource>
</asp:Content>

