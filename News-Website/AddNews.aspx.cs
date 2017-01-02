using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddNews : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "Adauga o stire - Admin/Editor page";

        string rang_1 = "adm";
        string rang_2 = "edt";
        if (!CheckLogin())
            Response.Redirect("LoginUser.aspx", true);
        else if (!rang_1.Equals((string)Session["rang"]) && !rang_2.Equals((string)Session["rang"]))
        {
            Response.Redirect("Index.aspx", true);
        }
    }

    private bool CheckLogin()
    {
        //daca nu avem user trebuie sa ne logam
        // poate a expirat sesiunea sau poate cineva vrea sa intre prin URL
        if (Session["user"] == null || string.IsNullOrEmpty(Session["user"].ToString()))
            return false;
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        string txt = "SELECT password FROM Utilizator WHERE (name=@Name)";
        // deschiderea conexiunii. Poate arunca Exceptie daca nu reuseste
        conn.Open();
        //crearea comenzi SQL
        SqlCommand cmd = new SqlCommand(txt, conn);
        //adaugarea parametrilor si definirea tipului lor
        cmd.Parameters.Add(new SqlParameter("@Name", TypeCode.String));
        cmd.Parameters["@Name"].Value = Session["user"].ToString();
        //scalar returneaza o singura valoare
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            string hashpass = (string)reader[0];
            hashpass = hashpass.Trim();
            if (Session["pass"].ToString() == hashpass)
            {
                conn.Close();
                return true;
            }
        }
        conn.Close();
        return false;
    }

    protected void publica_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        string txt = "insert into Stire(titlu,categorie,descriere,imagine,continut,data) values (@titlu,@categorie,@descriere,@imagine,@continut,@data)";
        // deschiderea conexiunii. Poate arunca Exceptie daca nu reuseste
        conn.Open();
        //crearea comenzi SQL
        SqlCommand cmd = new SqlCommand(txt, conn);
        //adaugarea parametrilor si definirea tipului lor
        cmd.Parameters.Add(new SqlParameter("@titlu", TypeCode.String));
        cmd.Parameters.Add(new SqlParameter("@categorie", TypeCode.String));
        cmd.Parameters.Add(new SqlParameter("@descriere", TypeCode.String));
        cmd.Parameters.Add(new SqlParameter("@imagine", TypeCode.String));
        cmd.Parameters.Add(new SqlParameter("@continut", TypeCode.String));
        cmd.Parameters.Add(new SqlParameter("@data", TypeCode.DateTime));
        cmd.Parameters["@titlu"].Value = titlu.Text;
        cmd.Parameters["@categorie"].Value = categorie.SelectedValue;
        cmd.Parameters["@descriere"].Value = descriere.Text;
        cmd.Parameters["@imagine"].Value = imagine.FileName;
        cmd.Parameters["@continut"].Value = continut.Text;
        cmd.Parameters["@data"].Value = DateTime.Now;

        // Before attempting to save the file, verify
        // that the FileUpload control contains a file.
        if (imagine.HasFile)
            // Call a helper method routine to save the file.
            SaveFile(imagine.PostedFile);

        // executia si inchiderea conexiunii
        cmd.ExecuteNonQuery();
        conn.Close();
        //redirectam catre pagina de log in
        Response.Redirect("Index.aspx", true);
    }

    void SaveFile(HttpPostedFile file)
    {
        // Specify the path to save the uploaded file to.
        string savePath = "E:\\Web-Application-Development\\News-Website\\images\\";

        // Get the name of the file to upload.
        string fileName = imagine.FileName;

        // Create the path and file name to check for duplicates.
        string pathToCheck = savePath + fileName;

        // Create a temporary file name to use for checking duplicates.
        string tempfileName = "";

        // Check to see if a file already exists with the
        // same name as the file to upload.        
        if (System.IO.File.Exists(pathToCheck))
        {
            int counter = 2;
            while (System.IO.File.Exists(pathToCheck))
            {
                // if a file with this name already exists,
                // prefix the filename with a number.
                tempfileName = counter.ToString() + fileName;
                pathToCheck = savePath + tempfileName;
                counter++;
            }

            fileName = tempfileName;

            // Notify the user that the file name was changed.
            //UploadStatusLabel.Text = "A file with the same name already exists." +
               // "<br />Your file was saved as " + fileName;
        }
        else
        {
            // Notify the user that the file was saved successfully.
           // UploadStatusLabel.Text = "Your file was uploaded successfully.";
        }

        // Append the name of the file to upload to the path.
        savePath += fileName;

        // Call the SaveAs method to save the uploaded
        // file to the specified directory.
        imagine.SaveAs(savePath);

    }
}