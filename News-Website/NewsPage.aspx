<%@ Page Title="" Language="C#" MasterPageFile="~/OtherPage.master" AutoEventWireup="true" CodeFile="NewsPage.aspx.cs" Inherits="NewsPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table>
        <tr>
          
        <th colspan="3">  
            <asp:Label ID="titlu" runat="server" Text="Titlu stire"></asp:Label>
         </th>
      </tr>
      <tr>
       
        
          <td style="width: 65px">

              <asp:Label ID="categorie" runat="server" Text="Categorie"></asp:Label>

          </td>
          <td style="width: 56px"> 
            <asp:Label ID="data" runat="server" Text="Data"></asp:Label>
          </td>
          
      </tr>
      <tr>
          <td style="width: 65px">

              <asp:Image ID="imagine" runat="server" Width="129px" />

          </td>
        <td colspan="3" style="height: 283px"> 
            <asp:Label ID="continut" runat="server" Text="Continutul complet al stirei prezentate"></asp:Label>
          </td>
      </tr>
    </table>

    <hr />
    <strong>Adauga comentariu:<br />
    Nume
    <asp:TextBox ID="nume_user" runat="server" Width="142px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Nume lipsa!" ControlToValidate="nume_user"></asp:RequiredFieldValidator>
    <br />
    <table>
        <tr>
            <td>

                <asp:TextBox ID="comentariu" runat="server" Height="142px" TextMode="MultiLine" Width="495px"></asp:TextBox>

            </td>
        </tr>
        <tr>
            <td>

                <asp:Button ID="adauga_comentariu" runat="server" Text="Adauga Comentariu" OnClick="adauga_comentariu_Click" />

                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="comentariu" ErrorMessage="Comentariu lipsa!"></asp:RequiredFieldValidator>

            </td>
        </tr>
    </table>
    <br />
    Comentarii:

    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="Comentarii" AllowPaging="True" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="comentariu" HeaderText="comentariu" SortExpression="comentariu" />
            <asp:BoundField DataField="username" HeaderText="username" SortExpression="username" />
            <asp:BoundField DataField="data" HeaderText="data" SortExpression="data" />
        </Columns>
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" />
        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#242121" />
    </asp:GridView>
    <asp:SqlDataSource ID="Comentarii" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [comentariu], [username], [data] FROM [Comentariu] WHERE ([stire] = @stire)">
        <SelectParameters>
            <asp:ControlParameter ControlID="titlu" DefaultValue="" Name="stire" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    </strong>

</asp:Content>

