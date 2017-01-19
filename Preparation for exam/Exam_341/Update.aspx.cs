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

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void SqlDataSource2_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        int id_plan = Convert.ToInt16(id_planificare.SelectedValue);
        int cost_nou = Convert.ToInt16(noul_cost.Text);
        DateTime data_noua = noua_data.SelectedDate.Date;

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        conn.Open();

        string txt = "update Planificari set Cost = @cost,Data = @data where id = @id";

        SqlCommand cmd = new SqlCommand(txt, conn);

        cmd.Parameters.Add(new SqlParameter("@id", TypeCode.Int16));
        cmd.Parameters.Add(new SqlParameter("@cost", TypeCode.Int16));
        cmd.Parameters.Add(new SqlParameter("@data", TypeCode.DateTime));
        cmd.Parameters["@id"].Value = id_plan;
        cmd.Parameters["@cost"].Value = cost_nou;
        cmd.Parameters["@data"].Value = data_noua;

        cmd.ExecuteNonQuery();
        
        conn.Close();
        Response.Redirect("Read.aspx");
    }
}