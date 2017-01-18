<%@ Page Title="" Language="C#" MasterPageFile="~/Head.master" AutoEventWireup="true" CodeFile="AfisareLungime.aspx.cs" Inherits="AfisareLungime" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <h2>Afisare lungime</h2>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="Column1" HeaderText="Lungime totala" ReadOnly="True" SortExpression="Column1" />
            <asp:BoundField DataField="Column2" HeaderText="An" ReadOnly="True" SortExpression="Column2" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT SUM(d.Lungimea), YEAR(p.Data) FROM Drumuri AS d INNER JOIN Planificari AS p ON d.Id = p.IdDrum GROUP BY YEAR(p.Data);"></asp:SqlDataSource>
</asp:Content>

