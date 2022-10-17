using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class graph : System.Web.UI.Page
{
    connection con = new connection();
    protected void Page_Load(object sender, EventArgs e)
    {
        con.open_connection();
        string str = "select distinct sname from exam1";
        SqlCommand cmd = new SqlCommand(str,con.con_pass());
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            lblSub.Text = dr["sname"].ToString();
        }
        con.close_connection();

    }
}