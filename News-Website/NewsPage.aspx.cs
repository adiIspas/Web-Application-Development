using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NewsPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string title = (string)Session["stire"];
        Session["stire"] = null;

        this.Title = title + " - News Website";
        LoadNews(title);
    }

    private void LoadNews(string title)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        string txt = "SELECT titlu, categorie, data, continut FROM Stire WHERE (titlu=@Title)";
        // deschiderea conexiunii. Poate arunca Exceptie daca nu reuseste
        conn.Open();
        //crearea comenzi SQL
        SqlCommand cmd = new SqlCommand(txt, conn);
        //adaugarea parametrilor si definirea tipului lor
        cmd.Parameters.Add(new SqlParameter("@Title", TypeCode.String));
        cmd.Parameters["@Title"].Value = title;
        //scalar returneaza o singura valoare
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            titlu.Text = (string)reader[0];
            categorie.Text = (string)reader[1];
            data.Text = (string)((DateTime)reader[2]).Date.ToString();
            continut.Text = (string)reader[3];
        }
        else
        {
            continut.Text = "Stirea nu a fost gasita ...";
        }
    }
}