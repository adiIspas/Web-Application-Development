<%@ Page Title="" Language="C#" MasterPageFile="~/OtherPage.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:TextBox ID="cuvinte" runat="server"></asp:TextBox>
    <asp:Button ID="cauta" runat="server" Text="Cauta ..." />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." AllowPaging="True" AllowSorting="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="titlu" HeaderText="titlu" SortExpression="titlu" />
            <asp:BoundField DataField="categorie" HeaderText="categorie" SortExpression="categorie" />
            <asp:BoundField DataField="descriere" HeaderText="descriere" SortExpression="descriere" />
            <asp:BoundField DataField="imagine" HeaderText="imagine" SortExpression="imagine" />
            <asp:BoundField DataField="continut" HeaderText="continut" SortExpression="continut" />
            <asp:BoundField DataField="data" HeaderText="data" SortExpression="data" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [titlu], [categorie], [descriere], [imagine], [continut], [data] FROM [Stire] WHERE (([titlu] LIKE '%' + @titlu + '%') OR ([continut] LIKE '%' + @continut + '%') OR ([descriere] LIKE '%' + @descriere + '%'))">
        <SelectParameters>
            <asp:ControlParameter ControlID="cuvinte" Name="titlu" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="cuvinte" Name="continut" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="cuvinte" Name="descriere" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
</asp:Content>

