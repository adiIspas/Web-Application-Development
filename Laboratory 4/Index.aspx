<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Index page</title>
</head>
 <body>
    <form id = "form1" runat="server">
        Username:&nbsp; <asp:TextBox runat = "server" id="NameField" />
        <asp:Button runat = "server" id="SubmitForm" onclick="SubmitForm_Click" text="Submit & set name" />
        <asp:Button runat = "server" id="RefreshPage" text="Just submit" />
        <br />Password:&nbsp;&nbsp;
        <asp:TextBox ID="TextBox1" runat="server" TextMode="Password"></asp:TextBox>
        <br />
        <br />
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="NameField" ErrorMessage="Introdu un username"></asp:RequiredFieldValidator>
&nbsp;<br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1" ErrorMessage="Introdu o parola!"></asp:RequiredFieldValidator>
        <br />
        Name retrieved from ViewState: <asp:Label runat = "server" id="NameLabel" />
    </form>
</body>
</html>
