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
    public partial class Insert : System.Web.UI.Page
    {
        public SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\USERS\MAN\DOCUMENTS\VISUAL STUDIO 2013\PROJECTS\COLLEGE\COLLEGE\APP_DATA\DATABASE1.MDF;Integrated Security=True");
        public SqlCommand sqc;
        public SqlDataReader sdr;
         
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
              showfaculty();
          // showdata();
        }
        private void showdata()
        {
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter();
            string query = "select * from student ";
            sqc = new SqlCommand(query, con);
            sqc.ExecuteNonQuery();
            DataSet ds = new DataSet();
            sda.SelectCommand = sqc;
            sda.Fill(ds," ");
            GridView1.DataSource = ds;
            GridView1.DataBind();
            con.Close();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            con.Open();
            /*string file = Path.GetFileName(FileUpload1.PostedFile.FileName);
            FileUpload1.PostedFile.SaveAs(Server.MapPath("~/images/" + file));
            Image1.ImageUrl = "~/images/" + file;*/
          //  string imgname = FileUpload1.FileName;
          //  string imgpath = "images/" + imgname;
            int imagelen = FileUpload1.PostedFile.ContentLength;
            byte[] pic = new byte[imagelen];
            FileUpload1.PostedFile.InputStream.Read(pic, 0, imagelen);
          //  FileUpload1.PostedFile.SaveAs(Server.MapPath(imgpath));
           // Image1.ImageUrl = "~/" + imgpath;
            string query = "select * from student where StuID ='"+TextBox2.Text+"'";
            sqc = new SqlCommand(query, con);
            sdr = sqc.ExecuteReader();

            if (sdr.HasRows)
            {
                Response.Write("<script language=javascript>alert('This ID is alerdy exist');</script>");
            }

            else
                try
                {
                    {
                        con.Close();
                        con.Open();
                        SqlCommand sqc1;
                       // string str = "insert into student values('" + TextBox2.Text + "' , '" + TextBox1.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "' , '" + TextBox5.Text + "' , '" + TextBox6.Text + "','"+pic+"')";
                        sqc1 = new SqlCommand("addstudent", con);
                        sqc1.CommandType = CommandType.StoredProcedure;
                        sqc1.Parameters.Add("@StuID", SqlDbType.Int).Value = TextBox2.Text;
                        sqc1.Parameters.Add("@Sname", SqlDbType.VarChar).Value = TextBox1.Text;
                        sqc1.Parameters.Add("@Gpa", SqlDbType.Float).Value = TextBox3.Text;
                        sqc1.Parameters.Add("@adress", SqlDbType.VarChar).Value = TextBox4.Text;
                        sqc1.Parameters.Add("@Semail", SqlDbType.VarChar).Value = TextBox5.Text;
                        sqc1.Parameters.Add("@fname", SqlDbType.VarChar).Value = Drop1.SelectedValue;
                        sqc1.Parameters.Add("@Did", SqlDbType.VarChar).Value = Drop2.SelectedValue;
                        sqc1.Parameters.Add("@Simage", SqlDbType.Image).Value = pic;
                        sqc1.ExecuteNonQuery();
                        try
                        {
                            FileInfo fi = new FileInfo(FileUpload2.FileName);
                            byte[] content = FileUpload2.FileBytes;
                            string name = fi.Name;
                            string extn = fi.Extension;
                            sqc = new SqlCommand("savefile", con);
                            sqc.CommandType = CommandType.StoredProcedure;
                            sqc.Parameters.Add("@name", SqlDbType.VarChar).Value = name;
                            sqc.Parameters.Add("@content", SqlDbType.VarBinary).Value = content;
                            sqc.Parameters.Add("@extn", SqlDbType.VarChar).Value = extn;
                            sqc.Parameters.Add("@StuID", SqlDbType.Int).Value = TextBox2.Text;
                            sqc.ExecuteNonQuery();
                            string filename = TextBox2.Text+".jpg";
                            FileUpload1.PostedFile.SaveAs(Server.MapPath(@"~\images\"+filename.Trim()));


                            con.Close();
                            Response.Redirect("Insert.aspx");
                            
                           // id2 = TextBox1.Text;
                           // filldata(TextBox1.Text);
                           // Button2.Visible = true;
                        }
                        catch (Exception)
                        {
                            Response.Write("<script language=javascript>alert(' no file uploaded ');</script>");
                        }

                      
                    }
                }
            catch (Exception){
                Response.Write("<script language=javascript>alert('wrong data');</script>");
            }
            showdata();

        }

        private void showfaculty()
        {
            con.Open();
            string query = "select fname from faculty";
            sqc = new SqlCommand(query, con);
            sdr = sqc.ExecuteReader();
            Drop1.DataSource = sdr;
            Drop1.Items.Clear();
            Drop1.Items.Add("....Enter your faculty....");
            Drop1.DataTextField = "fname";
            Drop1.DataValueField = "fname";
            Drop1.DataBind();
            con.Close();
        }

        private void showdepartment()
        {
            con.Open();
            string query = "select Did , dname from department where fname = '"+Drop1.SelectedValue+"'";
            sqc = new SqlCommand(query, con);
            sdr = sqc.ExecuteReader();
            Drop2.DataSource = sdr;
            Drop2.Items.Clear();
            Drop2.Items.Add(".... Enter your department ....");
            Drop2.DataTextField = "dname";
            Drop2.DataValueField = "Did";
            Drop2.DataBind();
            con.Close();
        }

        protected void Drop1_SelectedIndexChanged(object sender, EventArgs e)
        {
            showdepartment();
        }

       
    }
}