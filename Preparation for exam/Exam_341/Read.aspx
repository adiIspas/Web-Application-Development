<%@ Page Title="" Language="C#" MasterPageFile="~/Head.master" AutoEventWireup="true" CodeFile="Read.aspx.cs" Inherits="Read" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <h2>Viitoarele planificari</h2>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="Numele" HeaderText="Numele" SortExpression="Numele" />
            <asp:BoundField DataField="Lungimea" HeaderText="Lungimea" SortExpression="Lungimea" />
            <asp:BoundField DataField="Latime" HeaderText="Latime" SortExpression="Latime" />
            <asp:BoundField DataField="Cost" HeaderText="Cost" SortExpression="Cost" />
            <asp:BoundField DataField="Data" HeaderText="Data" SortExpression="Data" DataFormatString="{0:MM/dd/yyyy}"/>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT d.Numele, d.Lungimea, d.Latime, p.Cost, p.Data FROM Planificari AS p INNER JOIN Drumuri AS d ON p.IdDrum = d.Id  WHERE p.Data >= cast(getdate() as date) ORDER BY d.Lungimea DESC"></asp:SqlDataSource>
</asp:Content>

