<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
            DisplayQuestion();
      
    }
    int counter = 60;
    public void DisplayQuestion()
    {
        // get data from session object
        Examination e = (Examination)Session["questions"];
        // display data
    
        lblQno.Text = e.curpos + 1 + "/" + e.SIZE;
        lblCtime.Text = DateTime.Now.ToString();
        lblStime.Text = e.StartTime.ToString();

        Question q = e.questions[e.curpos];
        // display details of question
        question.InnerHtml = q.question;
        ans1.InnerHtml = q.ans1;
        ans2.InnerHtml = q.ans2;
        ans3.InnerHtml = q.ans3;
        ans4.InnerHtml = q.ans4;
        lblSubject.Text = q.sname;
     //   lblAns.Text = q.cans;
        Session["sname"] = q.sname;
        // reset all radio buttons
        rbAns1.Checked = false;
        rbAns2.Checked = false;
        rbAns3.Checked = false;
        rbAns4.Checked = false;

        // disable and enable buttons
        if (e.curpos == 0)
            btnPrev.Enabled = false;
        else
            btnPrev.Enabled = true;

        if (e.curpos == e.SIZE - 1)
            btnNext.Text = "Finish";
        else
            
            btnNext.Text = "Next";
       // addQuestion();
        
    }
    public void addQuestion()
    {
        connection con = new connection();
        Examination exam = (Examination)Session["questions"];
       
        con.open_connection();
        SqlCommand cmd = new SqlCommand("select isnull( max(examid),0) + 1 from exam1", con.con_pass());
        int examid = (Int32)cmd.ExecuteScalar();
        cmd.CommandText = "insert into exam1 values(@examid,@mid,@sname,@noq,@ncans,@stdate,getdate(),@username,@ttime)";
        cmd.Parameters.Add("@examid", SqlDbType.Int).Value = examid;
        cmd.Parameters.Add("@mid", SqlDbType.Int).Value = exam.mid;
        cmd.Parameters.Add("@sname", SqlDbType.VarChar).Value = Session["sname"].ToString();
        cmd.Parameters.Add("@noq", SqlDbType.Int).Value = exam.SIZE;
        cmd.Parameters.Add("@ncans", SqlDbType.Int).Value = exam.ncans;
        cmd.Parameters.Add("@stdate", SqlDbType.DateTime).Value = exam.StartTime;
        cmd.Parameters.Add("@username", SqlDbType.VarChar).Value = Session["emailID"].ToString();
        cmd.Parameters.Add("@ttime", SqlDbType.VarChar).Value =DateTime.Now.Second.ToString(); ;
        cmd.ExecuteNonQuery();
        con.close_connection();  
    }
    public void ProcessQuestion()
    {
        Examination exam = (Examination)Session["questions"];
        Question q = exam.questions[exam.curpos];
        String answer;
        // find out the answer and assign it to 
        if (rbAns1.Checked)
            answer = "1";
        else
            if (rbAns2.Checked)
                answer = "2";
            else
                if (rbAns3.Checked)
                    answer = "3";
                else
                    if (rbAns4.Checked)
                        answer = "4";
                    else
                        answer = "0";  // error
       // q.answer = answer;
        exam.questions[exam.curpos] = q;
        Session.Add("questions", exam);
    }

    protected void btnNext_Click(object sender, EventArgs e)
    {
        ProcessQuestion();
        Examination exam = (Examination)Session["questions"];
        if (exam.curpos == exam.SIZE - 1)
            Response.Redirect("showresult.aspx");
        else
        {
            exam.curpos++;
            Session.Add("questions", exam);
            DisplayQuestion();
        }
    }

    protected void btnPrev_Click(object sender, EventArgs e)
    {
        // ProcessQuestion();
        Examination exam = (Examination)Session["questions"];
        exam.curpos--;
        Session.Add("questions", exam);
        DisplayQuestion();
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        // Examination exam = (Examination)Session["questions"];
        Session.Remove("questions");
        //exam = null;
        Response.Redirect("default.aspx");
    }

    
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Examination</title>
</head>
<body>
    <form id="form1" runat="server">
    <h2>Examination</h2>
    <table width="100%" bgcolor="#dddddd">
    <tr>
    <td>
        Subject :
        <asp:Label ID="lblSubject" runat="server" Width="154px" Font-Bold="True" Font-Names="Verdana" ForeColor="Red"></asp:Label></td>
    <td>
        Question :
        <asp:Label ID="lblQno" runat="server" Font-Bold="True" Font-Names="Verdana" ForeColor="Red"></asp:Label></td>
    </tr>
    <tr>
    <td>
        Started At :
        <asp:Label ID="lblStime" runat="server" Font-Bold="True" Font-Names="Verdana" ForeColor="Red"></asp:Label></td>
    <td style="height: 22px">
        Current Time :<asp:Label ID="lblCtime" runat="server" Font-Bold="True" Font-Names="Verdana" ForeColor="Red"></asp:Label></td>
    </tr>
    </table>
    
    <p />
    <b>Question</b>
    <br />
    <b><pre runat=server id="question" style="background-color:#eeeeee">question</pre> </b>
    <p></p>
    <table>
    <tr>
    <td>
    1. <asp:RadioButton ID="rbAns1" runat="server" GroupName="answer" />
    </td>
    <td style="width: 3px">
    <pre runat=server id="ans1"></pre>
    </td>
    </tr>
    
    <tr>
    <td>
    2. <asp:RadioButton ID="rbAns2" runat="server" GroupName="answer" />
    </td>
    <td style="width: 3px">
    <pre runat=server id="ans2"></pre>
    </td>
    </tr>
    
    <tr>
    <td>
    3. <asp:RadioButton ID="rbAns3" runat="server" GroupName="answer" />
    </td>
    <td style="width: 3px">
    <pre runat=server id="ans3"></pre>
    </td>
    </tr>
    
    <tr>
    <td>
    4. <asp:RadioButton ID="rbAns4" runat="server" GroupName="answer" />
    </td>
    <td style="width: 3px">
    <pre runat=server id="ans4"></pre>
    </td>
    </tr>

   
    
    </table>

    <table>
    
    <%-- <tr>
    
    <td>
    <b> Correct Answer :&nbsp;&nbsp; </b>
        &nbsp;<asp:Label ID="lblAns" runat="server" Text="Label"></asp:Label>
    </td>
    <td style="width: 3px">
    <pre runat=server id="Pre1"></pre>
    </td>
    </tr>--%>
    
    </table>
        <br />
        <asp:Button ID="btnPrev" runat="server" Text="Previous" OnClick="btnPrev_Click" />&nbsp;<asp:Button ID="btnNext"
            runat="server" Text="Next" Width="75px" OnClick="btnNext_Click" />
        <asp:Button ID="btnCancel" runat="server" Text="Cancel Exam" Width="115px" OnClick="btnCancel_Click" />
        
    </form>
</body>
</html>
