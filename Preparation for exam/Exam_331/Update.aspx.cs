using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Update : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void id_eveniment_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        string txt = "select Titlu, Descriere, Data, NrLocuri, IdLocatie from Eveniment where IdEveniment = @id";

        conn.Open();

        SqlCommand cmd = new SqlCommand(txt, conn);

        cmd.Parameters.Add(new SqlParameter("@id", TypeCode.Int16));


        cmd.Parameters["@id"].Value = id_eveniment.SelectedValue;

        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            titlu_eveniment.Text = (string)reader[0];
            descriere_eveniment.Text = (string)reader[1];
            data_eveniment.Text = ((DateTime)reader[2]).ToString();
            nr_locuri.Text = (reader[3]).ToString();
            id_locatie.SelectedValue = (reader[4]).ToString();
            
        }
        conn.Close();
    }

    protected void update_event_Click(object sender, EventArgs e)
    {
        int id_event = Convert.ToInt32(id_eveniment.SelectedValue);
        string titlu_event = titlu_eveniment.Text;
        string descriere_event = descriere_eveniment.Text;
        DateTime data_event = Convert.ToDateTime(data_eveniment.Text).Date;
        int nr_locuri_event = Convert.ToInt32(nr_locuri.Text);
        int id_locatie_event = Convert.ToInt32(id_locatie.SelectedValue);
     
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        conn.Open();

        string txt = "update Eveniment set Titlu = @titlu, Descriere = @descriere, Data = @data, NrLocuri = @nr_locuri, IdLocatie = @id_locatie where IdEveniment = @id";

        SqlCommand cmd = new SqlCommand(txt, conn);

        cmd.Parameters.Add(new SqlParameter("@id", TypeCode.Int16));
        cmd.Parameters.Add(new SqlParameter("@titlu", TypeCode.String));
        cmd.Parameters.Add(new SqlParameter("@descriere", TypeCode.String));
        cmd.Parameters.Add(new SqlParameter("@data", TypeCode.DateTime));
        cmd.Parameters.Add(new SqlParameter("@nr_locuri", TypeCode.Int16));
        cmd.Parameters.Add(new SqlParameter("@id_locatie", TypeCode.Int16));
        cmd.Parameters["@id"].Value = id_event;
        cmd.Parameters["@titlu"].Value = titlu_event;
        cmd.Parameters["@descriere"].Value = descriere_event;
        cmd.Parameters["@data"].Value = data_event;
        cmd.Parameters["@nr_locuri"].Value = nr_locuri_event;
        cmd.Parameters["@id_locatie"].Value = id_locatie_event;

        cmd.ExecuteNonQuery();

        conn.Close();
        Response.Redirect("Read.aspx");
    }
}