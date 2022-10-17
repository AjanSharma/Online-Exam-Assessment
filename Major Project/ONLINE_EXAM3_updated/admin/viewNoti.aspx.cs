using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class viewNoti : System.Web.UI.Page
{
    connection con = new connection();
    RadioButtonList pqan;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            showBlog();

        }

    }
    private void showBlog()
    {
       
        string q = "select * from user_notification";
        DataTable dt = new DataTable();
        SqlDataAdapter dp = new SqlDataAdapter(q, con.con_pass());
        dp.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();

        }

    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        showBlog();
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        showBlog();

    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string name = GridView1.DataKeys[e.RowIndex].Value.ToString();
        deleteData(name);
        showBlog();

    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        pqan = (RadioButtonList)GridView1.Rows[e.RowIndex].FindControl("RadioButtonList1");

        string name = GridView1.DataKeys[e.RowIndex].Value.ToString();

        updateData(name, pqan.Text);

        GridView1.EditIndex = -1;
        showBlog();

    }
    private void updateData(string id, string desc)
    {
        string query = "update user_notification set estatus='" + desc + "' where nid='" + id + "'";
        SqlCommand cmd = new SqlCommand(query, con.con_pass());
        con.open_connection();
        cmd.ExecuteNonQuery();
        con.close_connection();
        showBlog();
    }
    private void deleteData(string id)
    {
        string str = "delete from user_notification where nid='" + id + "'";
        SqlCommand cmd = new SqlCommand(str, con.con_pass());
        con.open_connection();
        cmd.ExecuteNonQuery();
        con.close_connection();
        showBlog();


    }
}