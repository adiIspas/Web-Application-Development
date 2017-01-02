using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void last_news_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = last_news.SelectedRow;
        Session["stire"] = row.Cells[1].Text;
        Response.Redirect("NewsPage.aspx");
    }

    protected void categorii_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = categorii.SelectedRow;
        Session["categorie"] = row.Cells[1].Text;
        Response.Redirect("NewsFromCategory.aspx");
    }
}