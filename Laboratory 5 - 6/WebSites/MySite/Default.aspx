<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="js_Default" %>

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
             <td></td>
             <td>
                 <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Submit" />
             </td>
             <td>
                 <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
             </td>
       </tr>
       <tr>
             <td>&nbsp;</td>
             <td>
                 <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                     PostBackUrl="~/CreateUser.aspx">New user?</asp:LinkButton>
             </td>
             <td>
                 <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
             </td>
       </tr>
    </table>
</asp:Content>

