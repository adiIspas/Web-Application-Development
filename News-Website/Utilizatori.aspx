<%@ Page Title="" Language="C#" MasterPageFile="~/OtherPage.master" AutoEventWireup="true" CodeFile="Utilizatori.aspx.cs" Inherits="Utilizatori" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    Cauta anumiti utilizatori
    dupa rang
    &nbsp;<br />
    <asp:TextBox ID="rang" runat="server"></asp:TextBox>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="Utilizatori_Site_Rang">
        <Columns>
            <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
            <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
            <asp:BoundField DataField="rang" HeaderText="rang" SortExpression="rang" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="Utilizatori_Site_Rang" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [name], [email], [rang] FROM [Utilizator] WHERE ([rang] LIKE '%' + @rang + '%')">
        <SelectParameters>
            <asp:ControlParameter ControlID="rang" DefaultValue="adm" Name="rang" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

