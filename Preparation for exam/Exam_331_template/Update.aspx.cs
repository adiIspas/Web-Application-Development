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

    protected void selecteaza_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        string txt = "select Detalii, DataEmitere, Valoare, IdBeneficiar from Factura where IdFactura = @id";

        conn.Open();

        SqlCommand cmd = new SqlCommand(txt, conn);

        cmd.Parameters.Add(new SqlParameter("@id", TypeCode.Int16));


        //cmd.Parameters["@id"].Value = id_factura.SelectedValue;

        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            //detalii.Text = (string)reader[0];
            //data_emitere.Text = (string)((DateTime)reader[1]).ToString();
            //valoare.Text = (reader[2]).ToString();
            //id_beneficiar.SelectedValue = (reader[3]).ToString();
            conn.Close();
        }
    }

    protected void update_Click(object sender, EventArgs e)
    {
        //int id_fact = Convert.ToInt32(id_factura.SelectedValue);
        //int id_beneficiar_fact = Convert.ToInt32(id_beneficiar.SelectedValue);
        //string detalii_fact = detalii.Text;
        //DateTime data_fact = Convert.ToDateTime(data_emitere.Text).Date;
        //int valoare_fact = Convert.ToInt32(valoare.Text);

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        conn.Open();

        string txt = "update Factura set IdBeneficiar = @id_beneficiar, Detalii = @detalii, DataEmitere = @data, Valoare = @valoare where IdFactura = @id";

        SqlCommand cmd = new SqlCommand(txt, conn);

        cmd.Parameters.Add(new SqlParameter("@id", TypeCode.Int16));
        cmd.Parameters.Add(new SqlParameter("@id_beneficiar", TypeCode.Int16));
        cmd.Parameters.Add(new SqlParameter("@detalii", TypeCode.String));
        cmd.Parameters.Add(new SqlParameter("@data", TypeCode.DateTime));
        cmd.Parameters.Add(new SqlParameter("@valoare", TypeCode.Int16));
        //cmd.Parameters["@id"].Value = id_fact;
        //cmd.Parameters["@id_beneficiar"].Value = id_beneficiar_fact;
        //cmd.Parameters["@detalii"].Value = detalii_fact;
        //cmd.Parameters["@data"].Value = data_fact;
        //cmd.Parameters["@valoare"].Value = valoare_fact;

        cmd.ExecuteNonQuery();

        conn.Close();
        Response.Redirect("Read.aspx");
    }
}