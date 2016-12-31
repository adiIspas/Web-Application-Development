﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Header : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
            
            
    }

    protected void login_Click(object sender, EventArgs e)
    {
        Response.Redirect("LoginUser.aspx");
    }

    protected void logout_Click(object sender, EventArgs e)
    {
        Response.Redirect("LogoutUser.aspx");
    }

    protected void register_Click(object sender, EventArgs e)
    {
        Response.Redirect("NewUser.aspx");
    }

    protected void my_account(object sender, EventArgs e)
    {
        Response.Redirect("UserPage.aspx");
    }
}
