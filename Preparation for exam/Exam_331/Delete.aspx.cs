using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Delete : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void delete_Click(object sender, EventArgs e)
    {
        int id_eveniment_st = Convert.ToInt16(id_eveniment.SelectedValue);

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        conn.Open();


        string txt = "delete Eveniment where IdEveniment = @id";

        SqlCommand cmd = new SqlCommand(txt, conn);

        cmd.Parameters.Add(new SqlParameter("@id", TypeCode.Int16));
        cmd.Parameters["@id"].Value = id_eveniment_st;


        cmd.ExecuteNonQuery();

        conn.Close();

        Response.Redirect("Read.aspx");
    }
}