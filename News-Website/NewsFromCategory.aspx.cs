using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NewsFromCategory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        categorie.Text = (string)Session["categorie"];
    }

    protected void Stiri_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = stiri.SelectedRow;
        Session["stire"] = row.Cells[1].Text;
        Response.Redirect("NewsPage.aspx");
    }
}