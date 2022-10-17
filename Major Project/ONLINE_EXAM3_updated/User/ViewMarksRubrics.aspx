<%@ Page Title="" Language="C#" MasterPageFile="~/User/Student.master" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>

<script runat="server">
    String txtEmail;
    protected void Page_Load(object sender, EventArgs e)
    {
        txtEmail = Session["emailID"].ToString();
        doWorkHere();
    }

    public void doWorkHere()
    {
        //test.InnerHtml = "fgdgff";
        connection con = new connection();
        con.open_connection();
        String str = "select * from rubrics_result_table where user_email='" + txtEmail + "'";
        SqlCommand cmd = new SqlCommand(str, con.con_pass());
        SqlDataReader dr = cmd.ExecuteReader();
        test.InnerHtml += "<pre><p>QuesID     Marks     Remarks</p></pre><br>";
        while (dr.Read())
        {
            
                //if (dr["user_email"].ToString() == txtEmail)
                //{
            test.InnerHtml += "<pre><p>" + dr["id"].ToString() + "   -       " + dr["result_num"].ToString() + "   -   " + dr["remarks"].ToString() + "</p></pre><br>";
               // }

            

        }
        con.close_connection();
    }
</script>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
    .testClass
    {
        color: Black;
        }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
        <div id="test" class="testClass" runat="server">
    
        </div>
    </center>
</asp:Content>

