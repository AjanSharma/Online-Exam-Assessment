using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Data;

public partial class final_test : System.Web.UI.Page
{
    connection con = new connection();
   // string dbname = "Final_Question";
    protected void Page_Load(object sender, EventArgs e)
    {
       // btnFinal.Visible = false;
        string stu = null;
        if (Session["emailID"] == "")
        {
            Response.Redirect("../UI/login.aspx");
        }
        else
        {
           
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string dbnamelabel1 = "label1";
        string dbnamelabel2 = "label2";
        string dbnamelabel3 = "label3";
        string dbnamelabel4 = "label4";
        string dbnamelabel5 = "label5";
        Final_Examination examlabel1 = new Final_Examination(Int32.Parse(Session["mid"].ToString()));
        examlabel1.GetQuestions(dbnamelabel1);
        Session.Add("examlabel1", examlabel1);
        Final_Examination examlabel2 = new Final_Examination(Int32.Parse(Session["mid"].ToString()));
        examlabel2.GetQuestions(dbnamelabel2);
        Session.Add("examlabel2", examlabel2);
        Final_Examination examlabel3 = new Final_Examination(Int32.Parse(Session["mid"].ToString()));
        examlabel3.GetQuestions(dbnamelabel3);
        Session.Add("examlabel3", examlabel3);
        Final_Examination examlabel4 = new Final_Examination(Int32.Parse(Session["mid"].ToString()));
        examlabel4.GetQuestions(dbnamelabel4);
        Session.Add("examlabel4", examlabel4);
        Final_Examination examlabel5 = new Final_Examination(Int32.Parse(Session["mid"].ToString()));
        examlabel5.GetQuestions(dbnamelabel5);
        Session.Add("examlabel5", examlabel5);
        Response.Redirect("final_examination.aspx");
            
        
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        con.open_connection();
        int pid = 0;
        int count = 1;
        string user = "",udate="";
        
        string id = null;
        con.open_connection();
        string query = "select * from Final_Noti order BY eid ASC ";
        SqlCommand cmd2 = new SqlCommand(query, con.con_pass());
        SqlDataReader dr2 = cmd2.ExecuteReader();


        while (dr2.Read())

            count = count + 1;
        

        dr2.Close();
        pid = count;
        con.close_connection();
        id = pid.ToString();
        con.close_connection();
        con.open_connection();
        string query1 = "select * from Final_Noti where username='"+Session["emailID"]+"' ";
        SqlCommand cmd21 = new SqlCommand(query1, con.con_pass());
        SqlDataReader dr21 = cmd21.ExecuteReader();


        if (dr21.Read())
        {
            user = dr21["username"].ToString();
            udate = dr21["sdate"].ToString();

        }
        con.close_connection();
      
        try
        {
            string cdate = System.DateTime.Now.ToShortDateString();
          //  Response.Write("cdate" + cdate + Session["emailID"].ToString());
            if (user.Equals(Session["emailID"]) && System.DateTime.Now.ToShortDateString().Equals(udate))
            {
                Response.Write("<script>alert('You Cannot give the exam again')</script>");
            }
            else
            {
                con.open_connection();
                DateTime dt = DateTime.Now;
                dt.AddMinutes(15);
            string test = "Final";
            string est = "False";
            string str = "insert into Final_Noti values ('" + id + "','" + Session["emailID"].ToString() + "','" + test + "','" + System.DateTime.Now.ToShortDateString() + "','" + est + "','"+dt+"') ";
            SqlCommand cmd = new SqlCommand(str, con.con_pass());
            cmd.ExecuteNonQuery();
            con.close_connection();
            Response.Write("<script>alert('Your Exam Will Start After 15 Minutes')</script>");
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('"+ ex.Message.ToString()+"')</script>");
           
        }
        //DateTime dt = new DateTime;
       // lblTime.Text="Your Test Will Start After  15 Min";

    }
}