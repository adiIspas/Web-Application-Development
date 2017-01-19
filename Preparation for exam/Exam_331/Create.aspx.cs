using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Create : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void create_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        string txt = "insert into Eveniment(Titlu,Descriere,Data,NrLocuri,IdLocatie) values (@titlu,@descriere,@data,@nrlocuri,@idlocatie)";

        conn.Open();

        SqlCommand cmd = new SqlCommand(txt, conn);

        cmd.Parameters.Add(new SqlParameter("@titlu", TypeCode.String));
        cmd.Parameters.Add(new SqlParameter("@descriere", TypeCode.String));
        cmd.Parameters.Add(new SqlParameter("@data", TypeCode.DateTime));
        cmd.Parameters.Add(new SqlParameter("@nrlocuri", TypeCode.Int16));
        cmd.Parameters.Add(new SqlParameter("@idlocatie", TypeCode.Int16));

        cmd.Parameters["@titlu"].Value = titlu_eveniment.Text;
        cmd.Parameters["@descriere"].Value = descriere_eveniment.Text;
        cmd.Parameters["@data"].Value = Convert.ToDateTime(data_eveniment.Text);
        cmd.Parameters["@nrlocuri"].Value = nr_locuri.Text;
        cmd.Parameters["@idlocatie"].Value = id_locatie.SelectedValue;


        cmd.ExecuteNonQuery();
        conn.Close();

        Response.Redirect("Read.aspx");
    }
}