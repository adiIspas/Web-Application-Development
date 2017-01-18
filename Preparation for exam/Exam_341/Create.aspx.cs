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
        this.Title = "Creaza o noua asflatare - Adrian Ispas";
    }

    protected void adauga_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        string txt = "insert into Planificari(IdDrum,Cost,Data) values (@id,@cost,@data)";
        
        conn.Open();
     
        SqlCommand cmd = new SqlCommand(txt, conn);
        
        cmd.Parameters.Add(new SqlParameter("@id", TypeCode.Int16));
        cmd.Parameters.Add(new SqlParameter("@cost", TypeCode.Int16));
        cmd.Parameters.Add(new SqlParameter("@data", TypeCode.DateTime));
        cmd.Parameters["@id"].Value = id_drum.SelectedValue;
        cmd.Parameters["@cost"].Value = cost_drum.Text;
        cmd.Parameters["@data"].Value = data_drum.SelectedDate.Date;

        cmd.ExecuteNonQuery();
        conn.Close();
       
        Response.Redirect("Read.aspx");
    }
}