<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CreateUser.aspx.cs" Inherits="CreateUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
       <tr>
             <td>Username</td>
             <td>
                 <asp:TextBox ID="User" runat="server"></asp:TextBox>
             </td>
             <td>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                     ControlToValidate="User" ErrorMessage="Numele utilizator nu a fost introdus"></asp:RequiredFieldValidator>
             </td>
       </tr>
       <tr>
             <td>Password</td>
             <td>
                 <asp:TextBox ID="Pass" runat="server" TextMode="Password"></asp:TextBox>
             </td>
             <td>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                     ControlToValidate="Pass" ErrorMessage="Parola nu a fost introdusa"></asp:RequiredFieldValidator>
             </td>
       </tr>
       <tr>
             <td>Retype password</td>
             <td>
                 <asp:TextBox ID="PassSecond" runat="server" TextMode="Password"></asp:TextBox>
             </td>
             <td>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                     ControlToValidate="PassSecond" ErrorMessage="Parola nu a fost introdusa"></asp:RequiredFieldValidator>
                 <asp:CompareValidator ID="CompareValidator1" runat="server" 
                     ControlToCompare="Pass" ControlToValidate="PassSecond" 
                     ErrorMessage="Parola nu corespunde!"></asp:CompareValidator>
             </td>
       </tr>
       <tr>
             <td>Email address</td>
             <td>
                 <asp:TextBox ID="Email" runat="server"></asp:TextBox>
             </td>
             <td>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                     ControlToValidate="Email" ErrorMessage="Campul email nu a fost completat"></asp:RequiredFieldValidator>
                 <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                     ControlToValidate="Email" ErrorMessage="RegularExpressionValidator" 
                     ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Adresa email invalida</asp:RegularExpressionValidator>
             </td>
       </tr>
       <tr>
             <td></td>
             <td>
                 <asp:Button ID="Button1" runat="server" Text="Submit" onclick="Button1_Click" />
             </td>
             <td>
                 <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
             </td>
       </tr>
       <tr>
             <td></td>
             <td>

                 <asp:Label ID="PageMessage" runat="server"></asp:Label>

             </td>
             <td>
                 &nbsp;</td>
       </tr>
    </table>
</asp:Content>

