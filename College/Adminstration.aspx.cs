using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace college
{
    public partial class Adminstration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.Cookies["email"]!=null)
            {
                string cook = Request.Cookies["email"].Value;
                Response.Cookies["email"].Value = cook;
            }
            
        }

     /*   protected void Button1_Click1(object sender, EventArgs e)
        {
            if(FileUpload1.HasFile)
            {
                FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Data/") + FileUpload1.FileName);
            }
            DataTable dt = new DataTable();
            dt.Columns.Add("File", typeof(string));
            dt.Columns.Add("Size", typeof(string));
            dt.Columns.Add("Type", typeof(string));
            foreach (string file in Directory.GetFiles(Server.MapPath("~/Data/")))
            {
                FileInfo fio = new FileInfo(file);
                dt.Rows.Add(fio.Name,fio.Length,getfile(fio.Extension));
            }

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        private string getfile(string extention){
            switch (extention.ToLower())
            {
                case ".doc":
                case ".docx":
                    return "word file";
                case ".txt":
                     return "text file";
                case ".xlsx":
                case ".xls":
                    return "excl file";
                case ".jpg":
                case ".png":
                    return "Image";
                default:
                    return "Format unknown";
 
           
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName == "Download")
            {
                Response.Clear();
                Response.ContentType = "application/octect-stream";
                Response.AppendHeader("content-disposition", "filename= " + e.CommandArgument);
                Response.TransmitFile(Server.MapPath("~/Data/") + e.CommandArgument);
                Response.End();
            }
        }
        */
        }
    }