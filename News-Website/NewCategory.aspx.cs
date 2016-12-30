using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NewCategory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "Adauga categorie noua - Admin/Editor page";

        string rang_1 = "adm";
        string rang_2 = "edt";
        if (!CheckLogin())
            Response.Redirect("LoginUser.aspx", true);
        else if (!rang_1.Equals((string)Session["rang"]) && !rang_2.Equals((string)Session["rang"]))
        {
            Response.Redirect("Index.aspx", true);
        }
    }

    protected void creaza_categorie_Click(object sender, EventArgs e)
    {
        // Testam daca exista categoria ceruta

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        string txt = "SELECT denumire FROM Categorie WHERE (denumire=@Name)";
        // deschiderea conexiunii. Poate arunca Exceptie daca nu reuseste
        conn.Open();
        //crearea comenzi SQL
        SqlCommand cmd = new SqlCommand(txt, conn);
        //adaugarea parametrilor si definirea tipului lor
        cmd.Parameters.Add(new SqlParameter("@Name", TypeCode.String));
        cmd.Parameters["@Name"].Value = nume_categorie.Text;
        //scalar returneaza o singura valoare
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            erori.Text = "Categoria " + nume_categorie.Text + " exista deja";
        }
        else
        {
            conn.Close();
            string txt2 = "insert into Categorie(denumire) values (@Name)";
            // deschiderea conexiunii. Poate arunca Exceptie daca nu reuseste
            SqlConnection conn2 = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn2.Open();
            //crearea comenzi SQL
            SqlCommand cmd2 = new SqlCommand(txt2, conn2);
            //adaugarea parametrilor si definirea tipului lor
            cmd2.Parameters.Add(new SqlParameter("@Name", TypeCode.String));
            cmd2.Parameters["@Name"].Value = nume_categorie.Text;
            // executia si inchiderea conexiunii
            cmd2.ExecuteNonQuery();
            conn2.Close();
            //redirectam catre pagina de log in
            Response.Redirect("NewCategory.aspx", true);
        }

        // Adaugare categorie
        //SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
       
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