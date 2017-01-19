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

    protected void inregistreaza_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        string txt = "insert into Vizita(IP,Pagina,Data,Browser,IDPagina,Tara) values (@ip,@pagina,@data,@browser,@id_pagina,@tara)";

        conn.Open();

        SqlCommand cmd = new SqlCommand(txt, conn);

        cmd.Parameters.Add(new SqlParameter("@ip", TypeCode.Int16));
        cmd.Parameters.Add(new SqlParameter("@pagina", TypeCode.String));
        cmd.Parameters.Add(new SqlParameter("@data", TypeCode.DateTime));
        cmd.Parameters.Add(new SqlParameter("@browser", TypeCode.String));
        cmd.Parameters.Add(new SqlParameter("@id_pagina", TypeCode.Int16));
        cmd.Parameters.Add(new SqlParameter("@tara", TypeCode.String));

        cmd.Parameters["@ip"].Value = ip_vizita.Text;
        cmd.Parameters["@pagina"].Value = "--";
        cmd.Parameters["@data"].Value = Convert.ToDateTime(data_vizita.Text);
        cmd.Parameters["@browser"].Value = browser_vizita.Text;
        cmd.Parameters["@id_pagina"].Value = id_pagina.Text;
        cmd.Parameters["@tara"].Value = tara_vizita.Text;

        cmd.ExecuteNonQuery();
        conn.Close();

        Response.Redirect("Read.aspx");
    }
}