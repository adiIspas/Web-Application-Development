<%@ Page Title="" Language="C#" MasterPageFile="~/FirstPage.master" AutoEventWireup="true" CodeFile="NewsPage.aspx.cs" Inherits="NewsPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">

    <table>
        <tr>
          
        <th colspan="3">  
            <h2><asp:Label ID="titlu" runat="server" Text="Titlu stire"></asp:Label></h2>
         </th>
      </tr>
      <tr>
       
        
          <td style="width: 65px">

              <asp:Label ID="categorie" runat="server" Text="Categorie" style="font-weight: 700"></asp:Label>

          </td>
          <td style="width: 56px"> 
            <asp:Label ID="data" runat="server" Text="Data" style="font-weight: 700"></asp:Label>
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
    </strong>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Nume lipsa!" ControlToValidate="nume_user"></asp:RequiredFieldValidator>
    <strong>
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

    </strong>

                </strong>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="comentariu" ErrorMessage="Comentariu lipsa!"></asp:RequiredFieldValidator>

            </td>
        </tr>
    </table>
    <strong>
    <strong>
    <br />
    Comentarii:

    <br />
    </strong>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="Comentarii" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="comentariu" HeaderText="Comentariu" SortExpression="comentariu" />
            <asp:BoundField DataField="username" HeaderText="Utilizator" SortExpression="username" />
            <asp:BoundField DataField="data" HeaderText="Adaugat la" SortExpression="data" />
        </Columns>
        <FooterStyle BackColor="#990000" ForeColor="White" Font-Bold="True" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <SortedAscendingCellStyle BackColor="#FDF5AC" />
        <SortedAscendingHeaderStyle BackColor="#4D0000" />
        <SortedDescendingCellStyle BackColor="#FCF6C0" />
        <SortedDescendingHeaderStyle BackColor="#820000" />
    </asp:GridView>
    <strong>
    <asp:SqlDataSource ID="Comentarii" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [comentariu], [username], [data] FROM [Comentariu] WHERE ([stire] = @stire)">
        <SelectParameters>
            <asp:ControlParameter ControlID="titlu" DefaultValue="" Name="stire" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    </strong>
    
</asp:Content>

