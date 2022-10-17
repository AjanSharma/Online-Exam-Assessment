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
    static string ans1 = null, ans2 = null, ans3 = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            int marks = 0;
            if (txt1.Text.Equals(ans1))
            {
                marks =marks+10;
            }
            if (txt2.Text.Equals(ans2))
            {
                marks = marks + 10;
            }
            if (txt3.Text.Equals(ans3))
            {
                marks = marks + 10;
            }
            con.open_connection();
                string s1 = "insert into sub_marks values('" + Session["emailid"].ToString() + "','" + Session["temail"].ToString() + "','" + marks + "','" + System.DateTime.Now.ToShortDateString() + "','" + DropDownList1.SelectedItem + "')";
                SqlCommand cmd = new SqlCommand(s1, con.con_pass());
                cmd.ExecuteNonQuery();
                con.close_connection();
                Response.Write("<script>alert('" + marks + "') </script>");
            
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message.ToString() + "') </script>");
        }

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            con.open_connection();
            string st = "select * from sub_ques where username='" + Session["temail"].ToString() + "' and qid='" + DropDownList1.SelectedItem + "'";
            SqlCommand cmd = new SqlCommand(st, con.con_pass());
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                txtQuestion.Text = dr["question"].ToString();
                txtdes.Text = dr["qdes"].ToString();
                ans1 = dr["o1"].ToString();
                ans2 = dr["o2"].ToString();
                ans3 = dr["o3"].ToString();
            }
            con.close_connection();
        }
        catch (Exception ex)
        {
            ex.Message.ToString();
        }
    }
}