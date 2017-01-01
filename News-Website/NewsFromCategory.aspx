<%@ Page Title="" Language="C#" MasterPageFile="~/OtherPage.master" AutoEventWireup="true" CodeFile="NewsFromCategory.aspx.cs" Inherits="NewsFromCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    In continuare puteti vizualiza stirile din categoria <asp:Label ID="categorie" runat="server" Text="Categorie" style="font-weight: 700"></asp:Label>.<br />
    <br />
    <asp:GridView ID="stiri" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="Stiri_Categorie" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="Stiri_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="titlu" HeaderText="titlu" SortExpression="titlu" />
            <asp:BoundField DataField="categorie" HeaderText="categorie" SortExpression="categorie" />
            <asp:BoundField DataField="descriere" HeaderText="descriere" SortExpression="descriere" />
            <asp:BoundField DataField="imagine" HeaderText="imagine" SortExpression="imagine" />
            <asp:BoundField DataField="continut" HeaderText="continut" SortExpression="continut" />
            <asp:BoundField DataField="data" HeaderText="data" SortExpression="data" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <asp:SqlDataSource ID="Stiri_Categorie" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [titlu], [categorie], [descriere], [imagine], [continut], [data] FROM [Stire] WHERE ([categorie] = @categorie) ORDER BY [data] DESC">
        <SelectParameters>
            <asp:ControlParameter ControlID="categorie" DefaultValue="Tehnologie" Name="categorie" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
&nbsp;
</asp:Content>

