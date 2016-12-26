<%@ Page Language="C#" AutoEventWireup="true" CodeFile="2_A.aspx.cs" Inherits="_2_A" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    Hello to exercise 2 - a!
        <br />
        <br />
        Numar unitati:
        <asp:TextBox ID="unitati" runat="server" Width="107px"></asp:TextBox>
        </div>
        <asp:Button ID="ex2a" runat="server" Text="Rezolva primul exercitiu" OnClick="ex2a_Click" />
        <p>
        <asp:TextBox ID="conturi" runat="server" Height="204px" Width="200px"></asp:TextBox>
        </p>
       
        <asp:GridView ID="conturi_selectate" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="Id_persoana" HeaderText="Id_persoana" SortExpression="Id_persoana" />
                <asp:BoundField DataField="Banca" HeaderText="Banca" SortExpression="Banca" />
                <asp:BoundField DataField="Sold" HeaderText="Sold" SortExpression="Sold" />
                <asp:BoundField DataField="Unitate" HeaderText="Unitate" SortExpression="Unitate" />
                <asp:BoundField DataField="Data_deschidere" HeaderText="Data_deschidere" SortExpression="Data_deschidere" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" OnSelecting="SqlDataSource1_Selecting" SelectCommand="SELECT * FROM [Cont]"></asp:SqlDataSource>

    </form>


    
        
</body>
</html>
