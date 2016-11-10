using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.IO;
using System.Security.Cryptography;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;

public partial class js_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //daca userul deja este logat el va ajunge pe pagina members
        if (CheckLogin())
            Response.Redirect("Members.aspx", true);
        Label2.Text = string.Empty;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        string txt = "SELECT Pass FROM Users WHERE (Name=@Name)";
        // deschiderea conexiunii. Poate arunca Exceptie daca nu reuseste
        conn.Open();
        //crearea comenzi SQL
        SqlCommand cmd = new SqlCommand(txt, conn);
        //adaugarea parametrilor si definirea tipului lor
        cmd.Parameters.Add(new SqlParameter("@Name", TypeCode.String));
        cmd.Parameters["@Name"].Value = User.Text;
        //scalar returneaza o singura valoare
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            if (reader[0] as string == HashPassword(Pass.Text))
            {
                Session["user"] = User.Text;
                Session["pass"] = HashPassword(Pass.Text);
                conn.Close();
                Response.Redirect("Members.aspx");
            }
            else
            {
                //parola invalida
                Label2.Text = "Parola nu este valida!";
                conn.Close();
                return;
            }
        }
        conn.Close();
        Response.Redirect("CreateUser.aspx", false);
        //user inexistent
    }
   
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
        string txt = "SELECT Pass FROM Users WHERE (Name=@Name)";
        // deschiderea conexiunii. Poate arunca Exceptie daca nu reuseste
        conn.Open();
        //crearea comenzi SQL
        SqlCommand cmd = new SqlCommand(txt, conn);
        //adaugarea parametrilor si definirea tipului lor
        cmd.Parameters.Add(new SqlParameter("@Name", TypeCode.String));
        cmd.Parameters["@Name"].Value = Session["user"].ToString();
        //scalar returneaza o singura valoare
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read() && Session["pass"].ToString() == (string)reader[0])
        {
            conn.Close();
            return true;
        }
        conn.Close();
        return false;
    }

    protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }
}