<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Useri.aspx.cs" Inherits="Useri" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
         <asp:Table ID="Table1" runat="server">
                <asp:TableHeaderRow BackColor=Aqua>
                    <asp:TableHeaderCell> Nume </asp:TableHeaderCell> 
                    <asp:TableHeaderCell> Email </asp:TableHeaderCell>  
                </asp:TableHeaderRow>
            </asp:Table>
         <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1">
             <Columns>
                 <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                 <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                 <asp:BoundField DataField="Pass" HeaderText="Pass" SortExpression="Pass" />
                 <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
             </Columns>
         </asp:GridView>
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Users]"></asp:SqlDataSource>
</asp:Content>

