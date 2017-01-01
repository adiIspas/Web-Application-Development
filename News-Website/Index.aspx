<%@ Page Title="" Language="C#" MasterPageFile="~/FirstPage.master" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    
    <table>
        <tr>
            <td> 

                
                <asp:GridView ID="categorii" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="Cateogrii_Stiri" ForeColor="#333333" GridLines="None" HorizontalAlign="Left" OnSelectedIndexChanged="categorii_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="denumire" HeaderText="denumire" SortExpression="denumire" />
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                    <SortedDescendingHeaderStyle BackColor="#820000" />
                </asp:GridView>
                <asp:SqlDataSource ID="Cateogrii_Stiri" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [denumire] FROM [Categorie]"></asp:SqlDataSource>


            </td>

            <td>
                <asp:GridView ID="last_news" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="Stiri" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" OnSelectedIndexChanged="last_news_SelectedIndexChanged" HorizontalAlign="Right" AutoGenerateColumns="False">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="titlu" HeaderText="titlu" SortExpression="titlu" />
                        <asp:BoundField DataField="categorie" HeaderText="categorie" SortExpression="categorie" />
                        <asp:BoundField DataField="descriere" HeaderText="descriere" SortExpression="descriere" />
                        <asp:BoundField DataField="imagine" HeaderText="imagine" SortExpression="imagine" />
                        <asp:BoundField DataField="continut" HeaderText="continut" SortExpression="continut" />
                        <asp:BoundField DataField="data" HeaderText="data" SortExpression="data" />
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
            </td>
            
        </tr>
    </table>
    
    
    
    <asp:SqlDataSource ID="Stiri" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [titlu], [categorie], [descriere], [imagine], [continut], [data] FROM [Stire] ORDER BY [data] DESC"></asp:SqlDataSource>

   

    

   

    <hr />
    <center><asp:Label ID="copyright" runat="server" Text="Site realizat de Adrian Ispas © 2017"></asp:Label></center>

     </asp:Content>

