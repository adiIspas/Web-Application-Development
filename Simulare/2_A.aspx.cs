using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;


public partial class _2_A : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ex2a_Click(object sender, EventArgs e)
    {
        SqlConnection m_connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        int units = Int32.Parse(unitati.Text);
        //conturi.Text = "" + (units + 1);

        string txt = "select * from Cont where sold > @sold";

        m_connection.Open();

        SqlCommand cmd = new SqlCommand(txt, m_connection);

        cmd.Parameters.Add(new SqlParameter("@sold", TypeCode.Int16));

        cmd.Parameters["@sold"].Value = units;
    
        cmd.ExecuteNonQuery();

        SqlDataReader rdr = cmd.ExecuteReader();

        while (rdr.Read())
        {
            conturi.Text = conturi.Text + "\n" + rdr["Id"].ToString() + " " + 
                rdr["Id_persoana"].ToString() + " " + rdr["Banca"].ToString() + " " + 
                rdr["Sold"].ToString() + " " + rdr["Unitate"].ToString() + " " + rdr["Data_deschidere"].ToString();
        }

        //SqlDataAdapter dataAdapter = new SqlDataAdapter(txt, m_connection); //c.con is the connection string

       // SqlCommandBuilder commandBuilder = new SqlCommandBuilder(dataAdapter);
        //DataSet ds = new DataSet();
        //dataAdapter.Fill(ds);
       // conturi_selectate.DataSource = ds.Tables[0];

        m_connection.Close();
    }



    protected void SqlDataSource1_Selecting(object sender, System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs e)
    {

    }
}