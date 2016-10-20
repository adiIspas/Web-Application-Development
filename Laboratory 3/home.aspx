<%@ Page Language="C#" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="home" %>

<!DOCTYPE html>

 <html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
    
    <script runat="server">
        public void checkbox1_Change(object s, EventArgs e)
        {
            Response.Write("In checkbox1_Change, checkbox1.Checked = " + checkbox1.Checked + "");
        }
    </script>
<body>
    <form id="form1" runat="server">
    <div>
        <p>
            
            TextBox
            <input type="checkbox" id="checkbox1" onserverchange="checkbox1_Change" runat="server"/>
            
            <br />
            Current server time is <% =DateTime.Now.ToString()%>.
            <input type="submit" id="button1" value="Push Me" runat="server"/>
        </p>
    </div>
        <p>
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        </p>
        Text de input
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <p>
            Text box 2
            <asp:CheckBox ID="CheckBox2" runat="server" OnCheckedChanged="CheckBox2_CheckedChanged1" />
        </p>
    </form>
</body>
</html>
