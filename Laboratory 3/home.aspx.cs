using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = IsPostBack.ToString();

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void CheckBox2_CheckedChanged(object sender, EventArgs e)
    {
        Label1.Text = "Checked pressed!";
    }

    protected void CheckBox2_CheckedChanged1(object sender, EventArgs e)
    {
        TextBox1.Text = "Am apasat";
        Label1.Text = "Checked pressed!";
    }
}