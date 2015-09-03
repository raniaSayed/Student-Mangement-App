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
    public partial class Change_password : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\USERS\MAN\DOCUMENTS\VISUAL STUDIO 2013\PROJECTS\COLLEGE\COLLEGE\APP_DATA\DATABASE1.MDF;Integrated Security=True");
        SqlCommand sc;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cook = Request.Cookies["email"].Value;
            //Response.Write(cook);

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            con.Open();
            if (Request.Cookies["email"] != null)
            {
                string cook = Request.Cookies["email"].Value;
                if (TextBox3.Text == TextBox1.Text)
                {

                    string str = "update admin set Apassword = '" + TextBox3.Text + "' where Aemail = '" + cook + "'";
                    sc = new SqlCommand(str, con);
                    sc.ExecuteNonQuery();
                    con.Close();
                }
            }
        }
    }
}