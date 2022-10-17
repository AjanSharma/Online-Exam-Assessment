using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class viewProfile : System.Web.UI.Page
{
    connection con = new connection();
    protected void Page_Load(object sender, EventArgs e)
    {
        con.open_connection();
        string str = "select image  from registration where emailID='"+Session["emailID"]+"'";
        SqlCommand cmd = new SqlCommand(str, con.con_pass());
        SqlDataReader dr = cmd.ExecuteReader();
        int i = 0;
        while (dr.Read())
        {
            Image1.ImageUrl = dr["image"].ToString();
        }
        con.close_connection();

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("../User/changeImage.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("../User/manageProfile.aspx");
    }
}