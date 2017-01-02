
<%@ Page Title="" Language="C#" MasterPageFile="~/FirstPage.master" AutoEventWireup="true" CodeFile="NewUser.aspx.cs" Inherits="NewUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
   <center>
    <table>
         <tr>
            <td style="width: 99px">Nume utilizator</td>
           
            <td>
                <asp:TextBox ID="username" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ErrorMessage="Nume utilizator lipsa!" ControlToValidate="username"></asp:RequiredFieldValidator>
                <asp:Label ID="eroare" runat="server" Text=""></asp:Label>
             </td>
        </tr>
         <tr>
            <td style="width: 99px">Parola</td>
            <td>
                <asp:TextBox ID="parola" runat="server" AutoCompleteType="Enabled" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="parola" ErrorMessage="Parola lipsa!"></asp:RequiredFieldValidator>
             </td>
        </tr>
        <tr>
            <td style="width: 99px">Email</td>
            <td>
                <asp:TextBox ID="email" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="email" ErrorMessage="Adresa de email invalida!" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="email" Display="Dynamic" ErrorMessage="Adresa de email lipsa!"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
           <td style="width: 99px">
               <asp:Button ID="submit" runat="server" Text="Creaza cont" Width="102px" OnClick="submit_Click" />
            </td> 
        </tr>
    </table> 
       </center>
</asp:Content>

