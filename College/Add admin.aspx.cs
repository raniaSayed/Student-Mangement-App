using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace college
{
    public partial class Add_admin : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\USERS\MAN\DOCUMENTS\VISUAL STUDIO 2013\PROJECTS\COLLEGE\COLLEGE\APP_DATA\DATABASE1.MDF;Integrated Security=True");
        SqlCommand sqc;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            con.Open();
            string query = "select * from admin where Aemail ='" + TextBox5.Text + "'";
            sqc = new SqlCommand(query, con);
            SqlDataReader sdr;
            sdr = sqc.ExecuteReader();

            if (sdr.HasRows)
            {
                //Response.Write("wrong data");
                Response.Write("<script language=javascript>alert('This email is alerdy exist');</script>");
            }

            else
                try
                {
                    {
                        con.Close();
                        con.Open();
                        SqlCommand sqc1;
                        string str = "insert into admin values('" + TextBox5.Text + "' , '" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "' , '" + TextBox4.Text + "')";
                        sqc1 = new SqlCommand(str, con);
                        sqc1.ExecuteNonQuery();
                        // showdata();
                        Response.Redirect("Add admin.aspx");
                        con.Close();

                    }
                }
                catch (Exception)
                {
                    Response.Write("<script language=javascript>alert('wrong data');</script>");
                }

        }
    }
}