<%@ Page Title="" Language="C#" MasterPageFile="~/FirstPage.master" AutoEventWireup="true" CodeFile="LoginUser.aspx.cs" Inherits="LoginUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>asd</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
 <center><table>
         <tr>
            <td style="width: 114px">Nume utilizator</td>
           
            <td>
                <asp:TextBox ID="username" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ErrorMessage="Nume utilizator lipsa!" ControlToValidate="username"></asp:RequiredFieldValidator>
             </td>
        </tr>
         <tr>
            <td style="width: 114px">Parola</td>
            <td>
                <asp:TextBox ID="parola" runat="server" AutoCompleteType="Enabled" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="parola" ErrorMessage="Parola lipsa!"></asp:RequiredFieldValidator>
             </td>
        </tr>
        <tr>
           <td style="width: 114px">
               
               <asp:Button ID="submit" runat="server" Text="Logare" Width="102px" OnClick="submit_Click" />
            </td> 
            <td>
                <asp:Label ID="erori" runat="server" Text=""></asp:Label>
            </td>
        </tr>
    </table> 
     </center>
</asp:Content>

