using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class add_practise_question : System.Web.UI.Page
{
    connection con = new connection();
    string st = "false";
    protected void Page_Load(object sender, EventArgs e)
    {
        fillid();
        txtSubject.Text = Session["subject"].ToString();
        txtEmail.Text = Session["emailID"].ToString();
    }
    public void fillid()
    {
        con.open_connection();
        string str = "select * from "+Request.QueryString["DB_Name"]+"  order by qid";
        SqlCommand cmd = new SqlCommand(str, con.con_pass());
        SqlDataReader dr = cmd.ExecuteReader();
        int i = 0;
        while (dr.Read())
        {
            int a = 0;
            a = Convert.ToInt32(dr["qid"].ToString());
            ViewState["sid"] = a.ToString();
            i = i + 1;
        }
        if (i > 0)
        {
            int a = Convert.ToInt32(ViewState["sid"].ToString());
            a = a + 1;
            txtQID.Text = a.ToString();
        }
        else
            txtQID.Text = "1";
        con.close_connection();
    }
   
    protected void Button1_Click1(object sender, EventArgs e)
    {
        try
        {

            if (TextBox2.Text.Equals(string.Empty) || TextBox3.Text.Equals(string.Empty) || TextBox4.Text.Equals(string.Empty) || TextBox5.Text.Equals(string.Empty) || TextBox6.Text.Equals(string.Empty) || TextBox7.Text.Equals(string.Empty))
            {
                Response.Write("<script>alert('All Feilds Must be Filled')</script>");
            }else{
                if (Request.QueryString["DB_Name"].Equals("Hard"))
                {
                    con.open_connection();
                    string str = "insert into Hard values('" + txtQID.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "','" + TextBox7.Text + "','" + txtSubject.Text + "','" + st + "','"+txtEmail.Text+"')";
                    SqlCommand cmd = new SqlCommand(str, con.con_pass());
                    cmd.ExecuteNonQuery();
                    con.close_connection();
                    Response.Write("<script>alert('Question Added Successfully')</script>");
                }
                else if (Request.QueryString["DB_Name"].Equals("Medium"))
                {
                    con.open_connection();
                    string str = "insert into Medium values('" + txtQID.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "','" + TextBox7.Text + "','" + txtSubject.Text + "','" + st + "','" + txtEmail.Text + "')";
                    SqlCommand cmd = new SqlCommand(str, con.con_pass());
                    cmd.ExecuteNonQuery();
                    con.close_connection();
                    Response.Write("<script>alert('Question Added Successfully')</script>");
                }
                else if (Request.QueryString["DB_Name"].Equals("Eassy"))
                {
                    con.open_connection();
                    string str = "insert into Eassy values('" + txtQID.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "','" + TextBox7.Text + "','" + txtSubject.Text + "','" + st + "','" + txtEmail.Text + "')";
                    SqlCommand cmd = new SqlCommand(str, con.con_pass());
                    cmd.ExecuteNonQuery();
                    con.close_connection();
                    Response.Write("<script>alert('Question Added Successfully')</script>");
                }
            }
           
        }
        catch (Exception ex)
        {
            ex.Message.ToString();
        }
    }
    
}