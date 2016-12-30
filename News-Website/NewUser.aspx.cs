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

public partial class NewUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        //daca userul deja este logat el va ajunge pe pagina members
        if (CheckLogin())
            Response.Redirect("Index.aspx", true);

    }

    protected void submit_Click(object sender, EventArgs e)
    {
        // server side validation
        if (!string.IsNullOrEmpty(username.Text) && !string.IsNullOrEmpty(parola.Text) && !string.IsNullOrEmpty(email.Text))
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            string txt = "insert into Utilizator(name,password,email,rang) values (@Name,@Pass,@Email,@Rang)";
            // deschiderea conexiunii. Poate arunca Exceptie daca nu reuseste
            conn.Open();
            //crearea comenzi SQL
            SqlCommand cmd = new SqlCommand(txt, conn);
            //adaugarea parametrilor si definirea tipului lor
            cmd.Parameters.Add(new SqlParameter("@Name", TypeCode.String));
            cmd.Parameters.Add(new SqlParameter("@Pass", TypeCode.String));
            cmd.Parameters.Add(new SqlParameter("@Email", TypeCode.String));
            cmd.Parameters.Add(new SqlParameter("@Rang", TypeCode.String));
            cmd.Parameters["@Name"].Value = username.Text;
            cmd.Parameters["@Pass"].Value = HashPassword(parola.Text);
            cmd.Parameters["@Email"].Value = email.Text;
            cmd.Parameters["@Rang"].Value = "usr";
            // executia si inchiderea conexiunii
            cmd.ExecuteNonQuery();
            conn.Close();
            //redirectam catre pagina de log in
            Response.Redirect("Index.aspx", true);
        } 
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