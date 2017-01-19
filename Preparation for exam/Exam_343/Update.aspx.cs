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

    protected void id_vizita_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        string txt = "select IP, Data, Browser, IDPagina, Tara from Vizita where IdVizita = @id";

        conn.Open();

        SqlCommand cmd = new SqlCommand(txt, conn);

        cmd.Parameters.Add(new SqlParameter("@id", TypeCode.Int16));


        cmd.Parameters["@id"].Value = id_vizita.SelectedValue;

        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            ip_vizita.Text = (string)reader[0];
            data_vizita.Text = (string)(((DateTime)reader[1])).ToString("dd-MM-yyyy");
            browser_vizita.Text = (string)reader[2];
            id_pagina.SelectedValue = (reader[3]).ToString();
            tara_vizita.Text = (string)reader[4];
            conn.Close();
        }
    }

    protected void actualizeaza_vizita_Click(object sender, EventArgs e)
    {
        int id_vizita_pag = Convert.ToInt32(id_vizita.SelectedValue);
        int id_vizita_pagina = Convert.ToInt32(id_pagina.SelectedValue);
        string browser_pagina_vizita = browser_vizita.Text;
        DateTime data_pagina_vizita = Convert.ToDateTime(data_vizita.Text).Date;
        string ip_vizita_pagina = ip_vizita.Text;
        string tara_pagina_vizita = tara_vizita.Text;

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        conn.Open();

        string txt = "update Vizita set IP = @ip_vizita, Data = @data, Browser = @browser,  IDPagina = @id_pagina, Tara = @tara where IdVizita = @id";

        SqlCommand cmd = new SqlCommand(txt, conn);

        cmd.Parameters.Add(new SqlParameter("@id", TypeCode.Int16));
        cmd.Parameters.Add(new SqlParameter("@id_pagina", TypeCode.Int16));
        cmd.Parameters.Add(new SqlParameter("@tara", TypeCode.String));
        cmd.Parameters.Add(new SqlParameter("@data", TypeCode.DateTime));
        cmd.Parameters.Add(new SqlParameter("@ip_vizita", TypeCode.String));
        cmd.Parameters.Add(new SqlParameter("@browser", TypeCode.String));
        cmd.Parameters["@id"].Value = id_vizita_pag;
        cmd.Parameters["@id_pagina"].Value = id_vizita_pagina;
        cmd.Parameters["@tara"].Value = tara_pagina_vizita;
        cmd.Parameters["@data"].Value = data_pagina_vizita;
        cmd.Parameters["@ip_vizita"].Value = ip_vizita_pagina;
        cmd.Parameters["@browser"].Value = browser_pagina_vizita;

        cmd.ExecuteNonQuery();

        conn.Close();
        Response.Redirect("Read.aspx");
    }

    protected void ip_vizita_TextChanged(object sender, EventArgs e)
    {

    }
}