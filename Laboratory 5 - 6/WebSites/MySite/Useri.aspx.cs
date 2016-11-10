using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Useri : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string txt = string.Format("select Name,Email from Users");
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        conn.Open();
        SqlCommand cmd = new SqlCommand(txt, conn);
        //diferenta este ca folosim ExecuteReader()
        SqlDataReader reader = cmd.ExecuteReader();
        //si acum trebuie sa facem ceva cu datele obtinute. Trebuie sa generam cod HTML
        FillTable(reader);
        conn.Close();
    }


    private void FillTable(SqlDataReader reader)
    {
        // clear but keep the header . Am folosit un ASP table cu numele Table1.
        TableRow th = Table1.Rows[0];
        Table1.Rows.Clear();
        Table1.Rows.Add(th);
        //adaugam liniile pe rand
        while (reader.Read())
        {
            TableRow row = new TableRow();

            TableCell nume = new TableCell();
            //luam valoarea din reader
            nume.Text = reader.GetValue(0).ToString();
            row.Cells.Add(nume);

            TableCell email = new TableCell();
            email.Text = reader.GetValue(1).ToString();
            row.Cells.Add(email);

            Table1.Rows.Add(row);
        }
    }
}