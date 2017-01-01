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
        //Session["stire"] = null;

        this.Title = title + " - News Website";
        LoadNews(title);
        titlu.Text = title;

        if (CheckLogin())
        {
            nume_user.Text = (string)Session["user"];
        }
    }

    private void LoadNews(string title)
    {
        if (title == null)
            title = "";
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

    private bool CheckLogin()
    {
        //daca nu avem user trebuie sa ne logam
        // poate a expirat sesiunea sau poate cineva vrea sa intre prin URL
        if (Session["user"] == null || string.IsNullOrEmpty(Session["user"].ToString()))
            return false;
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        string txt = "SELECT password FROM Utilizator WHERE (name=@Name)";
        // deschiderea conexiunii. Poate arunca Exceptie daca nu reuseste
        conn.Open();
        //crearea comenzi SQL
        SqlCommand cmd = new SqlCommand(txt, conn);
        //adaugarea parametrilor si definirea tipului lor
        cmd.Parameters.Add(new SqlParameter("@Name", TypeCode.String));
        cmd.Parameters["@Name"].Value = Session["user"].ToString();
        //scalar returneaza o singura valoare
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            string hashpass = (string)reader[0];
            hashpass = hashpass.Trim();
            if (Session["pass"].ToString() == hashpass)
            {
                conn.Close();
                return true;
            }
        }
        conn.Close();
        return false;
    }

    protected void adauga_comentariu_Click(object sender, EventArgs e)
    {
        string txt2 = "insert into Comentariu(comentariu, username, data, stire) values (@Comentariu, @Username, @Date, @Stire)";
        // deschiderea conexiunii. Poate arunca Exceptie daca nu reuseste
        SqlConnection conn2 = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        conn2.Open();
        //crearea comenzi SQL
        SqlCommand cmd2 = new SqlCommand(txt2, conn2);
        //adaugarea parametrilor si definirea tipului lor
        cmd2.Parameters.Add(new SqlParameter("@Comentariu", TypeCode.String));
        cmd2.Parameters["@Comentariu"].Value = comentariu.Text;
        cmd2.Parameters.Add(new SqlParameter("@Username", TypeCode.String));
        cmd2.Parameters["@Username"].Value = nume_user.Text;
        cmd2.Parameters.Add(new SqlParameter("@Date", TypeCode.String));
        cmd2.Parameters["@Date"].Value = DateTime.Now;
        cmd2.Parameters.Add(new SqlParameter("@Stire", TypeCode.String));
        cmd2.Parameters["@Stire"].Value = titlu.Text;
        // executia si inchiderea conexiunii
        cmd2.ExecuteNonQuery();
        conn2.Close();
        //redirectam catre pagina de log in
        Page.Response.Redirect(Page.Request.Url.ToString(), true);
    }
}