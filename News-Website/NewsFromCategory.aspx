﻿<%@ Page Title="" Language="C#" MasterPageFile="~/FirstPage.master" AutoEventWireup="true" CodeFile="NewsFromCategory.aspx.cs" Inherits="NewsFromCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    In continuare puteti vizualiza stirile din categoria <asp:Label ID="categorie" runat="server" Text="Categorie" style="font-weight: 700"></asp:Label>.<br />
    <br />
    <table>
        <tr>
            <td> 

                
                <asp:GridView ID="categorii" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="Cateogrii_Stiri" ForeColor="#333333" GridLines="None" HorizontalAlign="Left" OnSelectedIndexChanged="categorii_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" ButtonType="Button" SelectText="Stiri din ..." />
                        <asp:BoundField DataField="denumire" HeaderText="Categorii" SortExpression="denumire" />
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
                <asp:GridView ID="stiri" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="Stiri_Categorie" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="Stiri_SelectedIndexChanged">
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

    <asp:SqlDataSource ID="Stiri_Categorie" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [titlu], [categorie], [descriere], [imagine], [continut], [data] FROM [Stire] WHERE ([categorie] = @categorie) ORDER BY [data] DESC">
        <SelectParameters>
            <asp:ControlParameter ControlID="categorie" DefaultValue="Tehnologie" Name="categorie" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
            </td>
            </tr>
        
    </table>
   
</asp:Content>

