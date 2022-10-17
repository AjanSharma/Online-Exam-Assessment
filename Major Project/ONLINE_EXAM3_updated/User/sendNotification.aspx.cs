using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class sendNotification : System.Web.UI.Page
{
    connection con = new connection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["emailID"] == null)
        {
            Response.Redirect("../UI/login.aspx");
        }
        else
        {
            string id = null;
            con.open_connection();
            int pid = 0;
            int count = 1;
            con.open_connection();
            string query = "select * from user_notification order BY nid ASC ";
            SqlCommand cmd2 = new SqlCommand(query, con.con_pass());
            SqlDataReader dr2 = cmd2.ExecuteReader();


            while (dr2.Read())

                count = count + 1;

            dr2.Close();
            pid = count;
            con.close_connection();
            id = pid.ToString();
            con.close_connection();
            try
            {
                con.open_connection();
                string sta = "Pending";
                string desc = "I want to give the practice Test";
                string st = "insert into user_notification values('" + id + "','" + Session["emailID"].ToString() + "','" + desc + "','" + System.DateTime.Now.ToString() + "','" + sta + "')";
                SqlCommand cmd1 = new SqlCommand(st, con.con_pass());
                cmd1.ExecuteNonQuery();

                con.close_connection();
                Session["tid"] = id;
                Response.Redirect("examMenu.aspx");
            }
            catch (Exception e2)
            {
                e2.Message.ToString();
            }
        }
    }
}