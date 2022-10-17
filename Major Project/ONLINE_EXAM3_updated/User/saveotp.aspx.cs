using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class User_saveotp : System.Web.UI.Page
{
    connection con = new connection();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        con.open_connection();
        string st = "select uname from getExam where otp='"+txtotp.Text+"'";
        SqlCommand cmd = new SqlCommand(st,con.con_pass());
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            Session["temail"] = dr["uname"].ToString();
        }
        con.close_connection();
        Response.Redirect("../User/viewProfile.aspx");
    }
}