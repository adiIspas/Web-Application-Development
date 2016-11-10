using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.IO;
using System.Data.SqlClient;
using System.Configuration;

public partial class Members : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //verificam daca sunt valide
        if (!CheckLogin())
            Response.Redirect("Default.aspx", true);
        Label2.Text = string.Format("Bun venit {0}", Session["user"].ToString());
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
}