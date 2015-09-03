using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Timers;

namespace college
{
    public partial class login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=c:\users\mohamed veron\documents\visual studio 2013\Projects\college\college\App_Data\Database1.mdf;Integrated Security=True");
        SqlCommand com ;
        SqlDataReader sdr;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            con.Open();
             string query = "select * from admin where Aemail ='"+TextBox3.Text +"' and Apassword = '"+ TextBox2.Text +"'";
             com = new SqlCommand(query, con);
             //com.ExecuteNonQuery();
             sdr = com.ExecuteReader();
             sdr.Read();
              if(sdr.HasRows)
              {
                  Response.Cookies["email"].Value = TextBox3.Text;
                  Response.Cookies["email"].Expires = DateTime.Now.AddHours(12);
                  Response.Redirect("Adminstration.aspx");
              }
              else
              {
                  Response.Write("<script language=javascript>alert('wrong login data');</script>");
              }
              con.Close();


        }
    }
}