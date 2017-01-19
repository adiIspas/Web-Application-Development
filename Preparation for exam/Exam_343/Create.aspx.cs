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

        string txt = "insert into Factura(IdBeneficiar,Detalii,DataEmitere,Valoare) values (@id,@detalii,@dataemitere,@valoare)";

        conn.Open();

        SqlCommand cmd = new SqlCommand(txt, conn);

        cmd.Parameters.Add(new SqlParameter("@id", TypeCode.Int16));
        cmd.Parameters.Add(new SqlParameter("@detalii", TypeCode.String));
        cmd.Parameters.Add(new SqlParameter("@dataemitere", TypeCode.DateTime));
        cmd.Parameters.Add(new SqlParameter("@valoare", TypeCode.Int16));

        //cmd.Parameters["@id"].Value = id_beneficiar.SelectedValue;
        //cmd.Parameters["@detalii"].Value = detalii.Text;
        //cmd.Parameters["@dataemitere"].Value = Convert.ToDateTime(data_emitere.Text);
        //cmd.Parameters["@valoare"].Value = valoare.Text;


        cmd.ExecuteNonQuery();
        conn.Close();

        Response.Redirect("Create.aspx");
    }
}