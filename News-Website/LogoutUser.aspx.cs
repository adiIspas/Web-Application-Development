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

public partial class LogoutUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "Deconectare - CNN & BBC FMI";

        if (!CheckLogin())
            Response.Redirect("LoginUser.aspx", true);
        else
        {
            username.Text = (string)Session["user"];
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Index.aspx");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["user"] = null;
        Session["pass"] = null;
        Response.Redirect("Index.aspx");
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