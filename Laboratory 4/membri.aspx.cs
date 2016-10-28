using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class membri : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String username = Request.QueryString["username"];
        Label1.Text = username;
        Label2.Text = Application["utilizatoriConnectati"].ToString();
    }
}