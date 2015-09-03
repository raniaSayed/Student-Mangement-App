
using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Configuration;
using System.Drawing;
using System.Drawing.Imaging;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace college
{
    /// <summary>
    /// Summary description for Handler1
    /// </summary>
    public class Handler1 : IHttpHandler
    {
        Insert ins = new Insert();
        public void ProcessRequest(HttpContext context)
        {
            // context.Response.ContentType = "image/jpeg";
            string id = context.Request.QueryString["id"];
            if (id != null)
            {
                MemoryStream ms = new MemoryStream();
                ins.con.Open();

                string query = "select * from student where StuID = @id ";
                SqlCommand sqc = new SqlCommand(query, ins.con);
                sqc.Parameters.AddWithValue("@id",id);
                SqlDataReader sdr = sqc.ExecuteReader();
                sdr.Read();
                byte[] file = ((byte[])sdr["Simage"]);
                ms.Write(file, 0, file.Length);
                context.Response.Buffer = true;
                context.Response.BinaryWrite(file);
                ms.Dispose();
                context.Response.End();
                ins.con.Close();
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}