using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class admin_addSubjective : System.Web.UI.Page
{
    connection con = new connection();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            con.open_connection();
            string st = "insert into sub_ques(question,qdes,o1,o2,o3,username) values('"+txtQuestion.Text+"','"+txtdes.Text+"','"+txt1.Text+"','"+txt2.Text+"','"+txt3.Text+"','"+Session["emailID"].ToString()+"')";
            SqlCommand cmd = new SqlCommand(st,con.con_pass());
            cmd.ExecuteNonQuery();
            con.close_connection();
            Response.Write("<script>alert('Question Added SUccessfully!!!!!') </script>");
        }
        catch (Exception ex)
        {
            ex.Message.ToString();
        }

    }
}