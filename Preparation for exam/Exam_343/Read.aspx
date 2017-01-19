<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Read.aspx.cs" Inherits="Read" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <H2>Listeaza vizitele</H2>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    </table>
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="IDVizita" DataSourceID="SqlDataSource1">
    <Columns>
        <asp:BoundField DataField="IDVizita" HeaderText="IDVizita" InsertVisible="False" ReadOnly="True" SortExpression="IDVizita" />
        <asp:BoundField DataField="IDPagina" HeaderText="IDPagina" SortExpression="IDPagina" />
        <asp:BoundField DataField="IP" HeaderText="IP" SortExpression="IP" />
        <asp:BoundField DataField="Data" HeaderText="Data" SortExpression="Data" DataFormatString="{0:MM/dd/yyyy}"/>
        <asp:BoundField DataField="Browser" HeaderText="Browser" SortExpression="Browser" />
        <asp:BoundField DataField="Tara" HeaderText="Tara" SortExpression="Tara" />
        <asp:BoundField DataField="URL" HeaderText="URL" SortExpression="URL" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT v.IDVizita, v.IDPagina, v.IP, v.Data, v.Browser, v.Tara, p.URL FROM Vizita AS v INNER JOIN Pagina AS p ON (v.IDPagina = p.ID) ORDER BY v.Data ASC"></asp:SqlDataSource>
</asp:Content>

