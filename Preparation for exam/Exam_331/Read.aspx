<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Read.aspx.cs" Inherits="Read" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <h2>Evenimentele programate</h2>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="Titlu" HeaderText="Titlu" SortExpression="Titlu" />
            <asp:BoundField DataField="Descriere" HeaderText="Descriere" SortExpression="Descriere" />
            <asp:BoundField DataField="Data" HeaderText="Data" SortExpression="Data" />
            <asp:BoundField DataField="NrLocuri" HeaderText="NrLocuri" SortExpression="NrLocuri" />
            <asp:BoundField DataField="DenumireLoc" HeaderText="DenumireLoc" SortExpression="DenumireLoc" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT e.Titlu, e.Descriere, e.Data, e.NrLocuri, l.DenumireLoc FROM Eveniment AS e INNER JOIN Locatie AS l ON (e.IdLocatie = l.IdLocatie) ORDER BY e.Data ASC"></asp:SqlDataSource>
</asp:Content>

