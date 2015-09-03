using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace college
{
    public partial class Search : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\USERS\MAN\DOCUMENTS\VISUAL STUDIO 2013\PROJECTS\COLLEGE\COLLEGE\APP_DATA\DATABASE1.MDF;Integrated Security=True");
        SqlCommand sc;
        public SqlDataReader sdr;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string query = "";
            con.Close();
            con.Open();
            try
            {
                if (ByID.Checked == true)
                    query = "select * from student where StuID = '" + TextBox1.Text + "'";
                if (ByName.Checked == true)
                    query = "select * from student where Sname like '" + TextBox1.Text + "' ";
                if (ByGpa.Checked == true)
                    query = "select * from student where Gpa = '" + TextBox1.Text + "'";
                sc = new SqlCommand(query, con);
                sc.ExecuteNonQuery();
                con.Close();
                SqlDataAdapter sda = new SqlDataAdapter();
                sda.SelectCommand = sc;
                DataSet ds = new DataSet();
                sda.Fill(ds, "student");
                GridView1.DataSource = ds;
                GridView1.DataBind();
                Button4.Visible = true;
                Button5.Visible = true;
                
            }
            catch (Exception)
            {
                Response.Write("<script language=javascript>alert('wrong search');</script>");
            }

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

            /*TextBox2.Text = GridView1.Rows[e.NewSelectedIndex].Cells[1].Text;
            TextBox3.Text = GridView1.Rows[e.NewSelectedIndex].Cells[2].Text;
            TextBox4.Text = GridView1.Rows[e.NewSelectedIndex].Cells[3].Text;
            TextBox5.Text = GridView1.Rows[e.NewSelectedIndex].Cells[4].Text;*/
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView1.Rows)
            {
                table1.Visible = false;
                Button6.Visible = false;
                var chk = row.FindControl("checked1") as CheckBox;

                if (chk.Checked)
                {
                   
                        var id = row.FindControl("Label1") as Label;
                        //Response.Write(id.Text);
                        con.Open();
                        //string str = " delete from files  where  StuID = @id; delete from student where StuID = @id ";
                        sc = new SqlCommand("deleterecord", con);
                        sc.CommandType = CommandType.StoredProcedure;
                        sc.Parameters.AddWithValue("@id", id.Text);
                        sc.ExecuteNonQuery();
                        con.Close();
                }
            }
            Button1_Click(sender, e);


        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView1.Rows)
            {
                var chk = row.FindControl("checked1") as CheckBox;
                try
                {
                    if (chk.Checked)
                    {
                        table1.Visible = true;
                        Button6.Visible = true;
                        var id = row.FindControl("Label1") as Label;
                        var name = row.FindControl("Label2") as Label;
                        var gpa = row.FindControl("Label3") as Label;
                        var address = row.FindControl("Label4") as Label;
                        var email = row.FindControl("Label5") as Label;
                        var department = row.FindControl("Label6") as Label;
                        // Response.Write(id.Text);
                        con.Open();
                        string str = "select * from student where StuID = @id";

                        sc = new SqlCommand(str, con);
                        sc.Parameters.AddWithValue("@id", id.Text);
                        sc.ExecuteNonQuery();
                        TextBox2.Text = id.Text;
                        TextBox3.Text = name.Text;
                        TextBox4.Text = gpa.Text;
                        TextBox5.Text = address.Text;
                        TextBox6.Text = email.Text;
                        TextBox7.Text = department.Text;
                        con.Close();
                        filldata(id.Text);
                    }
                }
                catch (Exception)
                {
                    Response.Write("<script language=javascript>alert('No selected items to update');</script>");
                }
            }
           // Button1_Click(sender, e);

        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView1.Rows)
            {
                var chk = row.FindControl("checked1") as CheckBox;
                try
                {
                    int imagelen = FileUpload1.PostedFile.ContentLength;
                    byte[] len = new byte[imagelen];
                    FileUpload1.PostedFile.InputStream.Read(len,0,imagelen);
                    if (chk.Checked)
                    {
                        var id = row.FindControl("Label1") as Label;

                        con.Open();
                        //Response.Write(id.Text);
                        string str = "update student set StuID = '" + TextBox2.Text + "' , Sname = '" + TextBox3.Text + "', Gpa = '" + TextBox4.Text + "', adress = '" + TextBox5.Text + "' , Semail = '" + TextBox6.Text + "' , department = '" + TextBox7.Text + "' ,Simage = @Simage where StuID = '" + id.Text + "'";
                        sc = new SqlCommand(str, con);
                        sc.Parameters.AddWithValue("@Simage", len);
                        sc.ExecuteNonQuery();
                        con.Close();
                        table1.Visible = false;
                        Button6.Visible = false;
                        
                    }
                }
                catch (Exception)
                {
                    Response.Write("<script language=javascript>alert('Wrong data please Rewrite correct data');</script>");
                }
            }
            Button1_Click(sender, e);
            
           
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void filldata(string id)
        {
            DataTable dt = new DataTable();
            sc = new SqlCommand("getfiles", con);
            con.Open();
            sc.CommandType = CommandType.StoredProcedure;
            sc.Parameters.Add("@StuID", SqlDbType.Int).Value = id;
            sdr = sc.ExecuteReader();
            dt.Load(sdr);
            if (dt.Rows.Count > 0)
            {
                GridView2.DataSource = dt;
                GridView2.DataBind();
            }
            con.Close();
        }
        protected void open(object sender, EventArgs e)
        {
            LinkButton lnk = (LinkButton)sender;
            GridViewRow gr = (GridViewRow)lnk.NamingContainer;
            int id = int.Parse(GridView2.DataKeys[gr.RowIndex].Value.ToString());
            download(id);
        }
        private void download(int id)
        {
            DataTable dt = new DataTable();
            sc = new SqlCommand("getfile", con);
            con.Open();
            sc.CommandType = CommandType.StoredProcedure;
            sc.Parameters.Add("@ID", SqlDbType.Int).Value = id;
            sdr = sc.ExecuteReader();
            dt.Load(sdr);
            string name = dt.Rows[0]["name"].ToString();
            byte[] doc = (byte[])dt.Rows[0]["content"];
            Response.ClearContent();
            Response.ContentType = "application/octetstream";
            Response.AddHeader("Content-Disposition", string.Format("attachment; filename={0}", name));
            Response.AddHeader("Content-Length", doc.Length.ToString());
            Response.BinaryWrite(doc);
            Response.Flush();
            Response.Close();
            con.Close();

        }
        
    }
}