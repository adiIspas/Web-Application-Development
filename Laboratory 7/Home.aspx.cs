using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static string GetTimeOnServer()
    {
        return DateTime.Now.ToString();
    }

    [WebMethod]
    public static string GetCities(string judet) 
    {
        Dictionary<String, String[]> orase = new Dictionary<string, string[]>();

        orase.Add("bucuresti", );

        return judet;
    }
}