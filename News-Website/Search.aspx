<%@ Page Title="" Language="C#" MasterPageFile="~/FirstPage.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <center>
    <asp:TextBox ID="cuvinte" runat="server"></asp:TextBox>
    <asp:Button ID="cauta" runat="server" Text="Cauta ..." />
    <br />
        <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." AllowPaging="True" AllowSorting="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
         <Columns>
                        <asp:CommandField ShowSelectButton="True" ButtonType="Button" SelectText="Vizualizeaza ..." />
                        <asp:BoundField DataField="titlu" HeaderText="Titlu Stire" SortExpression="titlu" />
                        <asp:BoundField DataField="categorie" HeaderText="Categorie" SortExpression="categorie" />
                        <asp:BoundField DataField="descriere" HeaderText="Scurta descriere" SortExpression="descriere" />
                        <asp:BoundField DataField="data" HeaderText="Data publicarii" SortExpression="data" />
                        <asp:ImageField AlternateText="Imaginea nu a fost gasita" dataimageurlformatstring="~\images\{0}" DataImageUrlField="imagine" ControlStyle-Width="100px" ControlStyle-Height="100px">
                        </asp:ImageField>
                    </Columns>
                    <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                    <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                    <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" ForeColor="#003399" />
                    <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <SortedAscendingCellStyle BackColor="#EDF6F6" />
                    <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                    <SortedDescendingCellStyle BackColor="#D6DFDF" />
                    <SortedDescendingHeaderStyle BackColor="#002876" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [titlu], [categorie], [descriere], [imagine], [continut], [data] FROM [Stire] WHERE (([titlu] LIKE '%' + @titlu + '%') OR ([continut] LIKE '%' + @continut + '%') OR ([descriere] LIKE '%' + @descriere + '%'))">
        <SelectParameters>
            <asp:ControlParameter ControlID="cuvinte" Name="titlu" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="cuvinte" Name="continut" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="cuvinte" Name="descriere" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
        </center>
</asp:Content>

