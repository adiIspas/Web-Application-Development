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
       
        
          <td>

              <asp:Label ID="categorie" runat="server" Text="Categorie"></asp:Label>

          </td>
          <td style="width: 56px"> 
            <asp:Label ID="data" runat="server" Text="Data"></asp:Label>
          </td>
          
      </tr>
      <tr>
        <td colspan="3" style="height: 283px"> 
            <asp:Label ID="continut" runat="server" Text="Continutul complet al stirei prezentate"></asp:Label>
          </td>
      </tr>
    </table>

</asp:Content>

