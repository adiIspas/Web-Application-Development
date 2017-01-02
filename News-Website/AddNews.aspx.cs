using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddNews : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "Adauga o stire - Admin/Editor page";

        string rang_1 = "adm";
        string rang_2 = "edt";
        if (!CheckLogin())
            Response.Redirect("LoginUser.aspx", true);
        else if (!rang_1.Equals((string)Session["rang"]) && !rang_2.Equals((string)Session["rang"]))
        {
            Response.Redirect("Index.aspx", true);
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

    protected void publica_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        string txt = "insert into Stire(titlu,categorie,descriere,imagine,continut,data) values (@titlu,@categorie,@descriere,@imagine,@continut,@data)";
        // deschiderea conexiunii. Poate arunca Exceptie daca nu reuseste
        conn.Open();
        //crearea comenzi SQL
        SqlCommand cmd = new SqlCommand(txt, conn);
        //adaugarea parametrilor si definirea tipului lor
        cmd.Parameters.Add(new SqlParameter("@titlu", TypeCode.String));
        cmd.Parameters.Add(new SqlParameter("@categorie", TypeCode.String));
        cmd.Parameters.Add(new SqlParameter("@descriere", TypeCode.String));
        cmd.Parameters.Add(new SqlParameter("@imagine", TypeCode.String));
        cmd.Parameters.Add(new SqlParameter("@continut", TypeCode.String));
        cmd.Parameters.Add(new SqlParameter("@data", TypeCode.DateTime));
        cmd.Parameters["@titlu"].Value = titlu.Text;
        cmd.Parameters["@categorie"].Value = categorie.SelectedValue;
        cmd.Parameters["@descriere"].Value = descriere.Text;
        cmd.Parameters["@imagine"].Value = imagine.FileName;
        cmd.Parameters["@continut"].Value = continut.Text;
        cmd.Parameters["@data"].Value = DateTime.Now;

        // executia si inchiderea conexiunii
        cmd.ExecuteNonQuery();
        conn.Close();
        //redirectam catre pagina de log in
        Response.Redirect("Index.aspx", true);
    }

    protected void stire_preluata_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chk = sender as CheckBox;
        if (chk.Checked)
            Response.Redirect("Index.aspx");
        else
            this.continut.Text = "UnChecked";

    }
}