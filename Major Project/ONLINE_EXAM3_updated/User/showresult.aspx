<%@ Page Language="C#" MasterPageFile="~/User/Student.master" Title="Untitled Page" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        // show exam result
        Examination exam = (Examination)Session["questions"];
       // lblSubject.Text = exam.sname;
      //  lblStime.Text = exam.StartTime.ToString();
        //TimeSpan ts = DateTime.Now.Subtract(exam.StartTime);
        //lblMin.Text = ts.Seconds.ToString();
       // lblNquestions.Text = exam.SIZE.ToString();
        // find how many correct answers
        int cnt = 0;
        foreach (Question q in exam.questions)
        {
            if (q.IsCorrect())
                cnt++;
        }

        lblNcans.Text = cnt.ToString();
        exam.ncans = cnt;
        Session.Add("questions", exam);

        if (cnt > 3)
            lblGrade.Text = "Excellent";
        else
            if (cnt > 1)
                lblGrade.Text = "Average";
            else
                lblGrade.Text = "Poor";
       //  add row to OE_EXAMS table
        connection con = new connection();
        //Examination exam = (Examination)Session["questions"];

        con.open_connection();
        SqlCommand cmd = new SqlCommand("select isnull( max(examid),0) + 1 from Final_Test", con.con_pass());
        int examid = (Int32)cmd.ExecuteScalar();
        cmd.CommandText = "insert into Final_Test values(@examid,@mid,@sname,@noq,@ncans,@stdate,getdate(),@username,@ttime)";
        cmd.Parameters.Add("@examid", SqlDbType.Int).Value = examid;
        cmd.Parameters.Add("@mid", SqlDbType.Int).Value = exam.mid;
        cmd.Parameters.Add("@sname", SqlDbType.VarChar).Value = Session["sname"].ToString();
        cmd.Parameters.Add("@noq", SqlDbType.Int).Value = exam.SIZE;
        cmd.Parameters.Add("@ncans", SqlDbType.Int).Value = exam.ncans;
        cmd.Parameters.Add("@stdate", SqlDbType.DateTime).Value = exam.StartTime;
        cmd.Parameters.Add("@username", SqlDbType.VarChar).Value = Session["emailID"].ToString();
        cmd.Parameters.Add("@ttime", SqlDbType.VarChar).Value = DateTime.Now.Second.ToString(); ;
        cmd.ExecuteNonQuery();
        con.close_connection();   
        
    }

    protected void lbRank_Click(object sender, EventArgs e)
    {

      Examination exam = (Examination)Session["questions"];
      double per =  (double) exam.ncans / exam.SIZE;
      connection con=new connection();
      con.open_connection();
      SqlCommand cmd = new SqlCommand("select count(*) from Final_Test where nocans * 1.0 / noq >= @per and  sid = @sid", con.con_pass());
      cmd.Parameters.Add("@per", SqlDbType.Decimal).Value = per;
      cmd.Parameters.Add("@sid", SqlDbType.Int).Value = exam.sid;
      int rank = (Int32)cmd.ExecuteScalar();

      cmd.CommandText = "select count(*) from exam where sid = @sid";
      int total = (Int32) cmd.ExecuteScalar();
         
      con.close_connection();

      lblRank.Text = "<h4>Your Rank : " + rank.ToString() + " out of " + total.ToString() + " </h4>"; 
   
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>






    <br />
    <h2>
    Examination Result</h2>
    &nbsp;
    <br />
    <table bgcolor="#eeeeee" border=1>
        <tr>
            <td>
                <asp:Label ID="Label6" runat="server" Text="Subject: " ForeColor="Black"></asp:Label> 
            </td>
            <td>
                <asp:Label ID="lblSubject" runat="server" Text="Label" ForeColor="Black"></asp:Label></td>
        </tr>
        <tr>
            <td>
               <asp:Label ID="Label5" runat="server" Text="Starting Time :" ForeColor="Black"></asp:Label>  
            </td>
            <td>
                <asp:Label ID="lblStime" runat="server" Text="Label" ForeColor="Black"></asp:Label></td>
        </tr>
        
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Time Taken In Seconds : " ForeColor="Black"></asp:Label> 
            </td>
            <td>
                <asp:Label ID="lblMin" runat="server" Text="Label" ForeColor="Black"></asp:Label></td>
        </tr>
        
                <tr>
            <td>
              <asp:Label ID="Label3" runat="server" Text="No. of Questions : " ForeColor="Black"></asp:Label>  
            </td>
            <td>
                <asp:Label ID="lblNquestions" runat="server" ForeColor="Black"></asp:Label></td>
        </tr>
        
                <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="No. of correct answers : " ForeColor="Black"></asp:Label> 
            </td>
            <td>
                <asp:Label ID="lblNcans" runat="server" Text="Label" ForeColor="Black"></asp:Label></td>
        </tr>

        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Grade : " ForeColor="Black"></asp:Label> 
            </td>
            <td>
                <asp:Label ID="lblGrade" runat="server" Text="Label" ForeColor="Black"></asp:Label></td>
        </tr>


    </table>
    <br />
    <a  href="reviewquestions.aspx">Review Questions</a>
    <asp:LinkButton ID="lbRank" runat="server" OnClick="lbRank_Click">Rank The Result</asp:LinkButton><br />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/graph.aspx">HyperLink</asp:HyperLink>
     <%--<asp:LinkButton ID="LinkButton1" runat="server" OnClick="graph.aspx" >View Graph</asp:LinkButton><br />--%>
    <br />
    <asp:Label ID="lblRank" runat="server"></asp:Label><br />
    </center>
</asp:Content>

