using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Text;
public partial class User_ViewMarksSubjective : System.Web.UI.Page
{
    connection con = new connection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindChart();
            gvData.Visible = true;
        }
    }
    private DataTable BindGvData()
    {
        string q = "SELECT  qid, sum(marks) as exp1 FROM sub_marks where semail='"+Session["emailid"].ToString()+"' group by qid";
        // string q = "SELECT        COUNT(userID) AS Expr1, gender FROM            registrationwhere emailid='" + Session["emailid"] GROUP BY gender, userID";
        //Console.WriteLine(q);
        DataTable dt = new DataTable();
        SqlDataAdapter dp = new SqlDataAdapter(q, con.con_pass());
        dp.Fill(dt);
        if (dt.Rows.Count > 0)
        {

            gvData.DataSource = dt;
            gvData.DataBind();

        }
        return dt;
        // gvData.DataSource = GetChartData();
        //gvData.DataBind();
    }
    private void BindChart()
    {
        DataTable dsChartData = new DataTable();
        StringBuilder strScript = new StringBuilder();

        try
        {
            dsChartData = BindGvData();

            strScript.Append(@"<script type='text/javascript'>
                    google.load('visualization', '1', {packages: ['corechart']});</script>

                    <script type='text/javascript'>
                    function drawChart() {       
                    var data = google.visualization.arrayToDataTable([
                    ['Yes', 'No'],");

            foreach (DataRow row in dsChartData.Rows)
            {
                strScript.Append("['" + row["qid"] + "'," + row["exp1"] + "],");
            }
            strScript.Remove(strScript.Length - 1, 1);
            strScript.Append("]);");

            strScript.Append(@" var options = {   
                                    title: 'Subject Wise Pie Chart',          
                                    is3D: true,        
                                    };   ");

            strScript.Append(@"var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));        
                                chart.draw(data, options);      
                                }  
                            google.setOnLoadCallback(drawChart);
                            ");
            strScript.Append(" </script>");

            ltScripts.Text = strScript.ToString();
        }
        catch
        {
            //piechart_3d corechart
        }
        finally
        {
            dsChartData.Dispose();
            strScript.Clear();
        }
    }
}