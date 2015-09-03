using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;

namespace college
{
    public partial class upload : System.Web.UI.Page
    {
        public SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\USERS\MAN\DOCUMENTS\VISUAL STUDIO 2013\PROJECTS\COLLEGE\COLLEGE\APP_DATA\DATABASE1.MDF;Integrated Security=True");
        public SqlCommand sqc;
        public SqlDataReader sdr;
        public string id2 = "";
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void open(object sender, EventArgs e)
        {
            LinkButton lnk = (LinkButton)sender;
            GridViewRow gr = (GridViewRow)lnk.NamingContainer;
            int id = int.Parse(GridView1.DataKeys[gr.RowIndex].Value.ToString());
            download(id);
        }
        private void download(int id)
        {
            DataTable dt = new DataTable();
            sqc = new SqlCommand("getfile", con);
            con.Open();
            sqc.CommandType = CommandType.StoredProcedure;
            sqc.Parameters.Add("@ID", SqlDbType.Int).Value = id;
            sdr = sqc.ExecuteReader();
            dt.Load(sdr);
            string name = dt.Rows[0]["name"].ToString();
            byte [] doc =(byte[])dt.Rows[0]["content"];
            Response.ClearContent();
            Response.ContentType = "application/octetstream";
            Response.AddHeader("Content-Disposition", string.Format("attachment; filename={0}", name));
            Response.AddHeader("Content-Length", doc.Length.ToString());
            Response.BinaryWrite(doc);
            Response.Flush();
            Response.Close();
            con.Close();
           
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            
            
                try
                {
                    FileInfo fi = new FileInfo(FileUpload1.FileName);
                    byte[] content = FileUpload1.FileBytes;
                    string name = fi.Name;
                    string extn = fi.Extension;
                    sqc = new SqlCommand("savefile", con);
                    sqc.CommandType = CommandType.StoredProcedure;
                    sqc.Parameters.Add("@name", SqlDbType.VarChar).Value = name;
                    sqc.Parameters.Add("@content", SqlDbType.VarBinary).Value = content;
                    sqc.Parameters.Add("@extn", SqlDbType.VarChar).Value = extn;
                    sqc.Parameters.Add("@StuID", SqlDbType.Int).Value = TextBox1.Text;
                    con.Open();
                    sqc.ExecuteNonQuery();
                    con.Close();
                    id2 = TextBox1.Text;
                    filldata(TextBox1.Text);
                    Button2.Visible = true;
                }
                catch (Exception)
                {
                    Response.Write("<script language=javascript>alert(' no file uploaded ');</script>");
                }

        }

        private void filldata(string id)
        {
            DataTable dt = new DataTable();
            sqc = new SqlCommand("getfiles", con);
            con.Open();
            sqc.CommandType = CommandType.StoredProcedure;
            sqc.Parameters.Add("@StuID", SqlDbType.Int).Value = id;
            sdr = sqc.ExecuteReader();
            dt.Load(sdr);
            if(dt.Rows.Count>0)
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            con.Close();
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView1.Rows)
            {
                var chk = row.FindControl("checked1") as CheckBox;
                if (chk.Checked)
                {
                    var id = row.FindControl("Label1") as Label;
                    string query = "delete from files where ID = @id";
                    sqc = new SqlCommand(query, con);
                    sqc.Parameters.AddWithValue("@id", id.Text);
                    con.Open();
                    sqc.ExecuteNonQuery();
                    con.Close();
                  //  filldata(id2);
                }
            }
           // Button1_Click(sender, e);
        }
       
    }
}