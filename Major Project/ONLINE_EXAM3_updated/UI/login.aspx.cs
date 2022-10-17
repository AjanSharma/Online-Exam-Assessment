using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class login : System.Web.UI.Page
{
    connection con = new connection();
    protected void Page_Load(object sender, EventArgs e)
    {
        Session.RemoveAll();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {


        string st1 = txt_id.Text;
        string st2 = txt_pwd.Text;
        string st3 = DropDownList1.SelectedValue;
        con.open_connection();
        string str = "select * from registration where emailID='" + txt_id.Text + "'";
        SqlCommand cmd = new SqlCommand(str, con.con_pass());
        SqlDataReader dr = cmd.ExecuteReader();

        while (dr.Read())
        {
            if (DropDownList1.SelectedItem.Text.Equals("Student"))
            {
                if (dr["emailID"].ToString() == st1 && dr["password"].ToString() == st2)
                {
                    Session["emailID"] = st1;
                    Session.Add("mid", dr["userID"]);
                    Response.Redirect("../User/saveotp.aspx");
                }

            }
            else if (DropDownList1.SelectedItem.Text.Equals("Teacher"))
            {
                if (dr["emailID"].ToString() == st1 && dr["password"].ToString() == st2)
                {
                    String sub = dr["subject"].ToString();
                    Session["subject"] = dr["subject"].ToString();
                    Session["emailID"] = st1;

                    Response.Redirect("../admin/userlist.aspx");
                }
            }

        } 
       
       
       
    }

}