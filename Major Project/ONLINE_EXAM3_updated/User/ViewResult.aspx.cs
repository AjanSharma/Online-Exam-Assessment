using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
public partial class ViewResult : System.Web.UI.Page
{
    connection con = new connection();
    protected void Page_Load(object sender, EventArgs e)
    {

        string ob_marks = null, sname = null;
        int marks = 10;
        ArrayList smarks = new ArrayList();
        ArrayList sub = new ArrayList();
        con.open_connection();
        string str = "SELECT SUM(rans) AS Expr2, sname AS Expr1 FROM Exam1 GROUP BY sname";
        SqlCommand cmd = new SqlCommand(str, con.con_pass());
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            ob_marks = dr[0].ToString();
            sname = dr[1].ToString();
            smarks.Add(ob_marks);
            sub.Add(sname);

        }

        con.close_connection();
        con.open_connection();
        for (int k = 0; k < sub.Count; k++)
        {
            for (int j = 0; j <= 1; j++)
            {

                con.open_connection();
                cmd = new SqlCommand("insert into viewGraph values('" + sub[k] + "','" + smarks[j] + "')", con.con_pass());
                cmd.ExecuteNonQuery();


                con.close_connection();
            }
        }


        con.close_connection();
        
    }
}