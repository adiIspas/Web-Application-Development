using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LoginUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "Logare - News Website";

        if (CheckLogin())
            Response.Redirect("Index.aspx", true);

    }

    protected void submit_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        string txt = "SELECT password, rang FROM Utilizator WHERE (name=@Name)";
        // deschiderea conexiunii. Poate arunca Exceptie daca nu reuseste
        conn.Open();
        //crearea comenzi SQL
        SqlCommand cmd = new SqlCommand(txt, conn);
        //adaugarea parametrilor si definirea tipului lor
        cmd.Parameters.Add(new SqlParameter("@Name", TypeCode.String));
        cmd.Parameters["@Name"].Value = username.Text;
        //scalar returneaza o singura valoare
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            string hashpass = (string)reader[0];
            string rang = (string)reader[1];
            hashpass = hashpass.Trim();
            if (hashpass.Equals(HashPassword(parola.Text)))
            {
                Session["user"] = username.Text;
                Session["pass"] = HashPassword(parola.Text);
                Session["rang"] = rang;
                conn.Close();
                Response.Redirect("Index.aspx");
            }
            else
            {
                //parola invalida
                
                erori.Text = "Parola nu este valida!";
                conn.Close();
                return;
            }
        }
        conn.Close();
        Response.Redirect("NewUser.aspx", false);
        //user inexistent

    }

    // Nu putem pune parola in clar in fisierul xml. Daca cineva va sparge serverul si va copia fisierele , va putea
    // vedea parolele tuturor userilor.
    // Functia de Hashing nu este inversabila. Nu putem scoate parola dintr-un hash. 
    // Ne vom folosi de propritatea ca f(x) = f(y) => x = y. 
    // Astfel pentru fiecare string vom calcula functia hash si vom compara cu hash-ul din xml.
    public static string HashPassword(string password)
    {
        var provider = new SHA1CryptoServiceProvider();
        var encoding = new UnicodeEncoding();
        return Convert.ToBase64String(provider.ComputeHash(encoding.GetBytes(password)));
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
}