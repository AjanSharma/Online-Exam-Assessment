<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script type = "text/javascript" >
    function preventBack() { window.history.forward(); }
    setTimeout("preventBack()", 0);
    window.onunload = function () { null };
</script>
<script language ="javascript" type="text/javascript" >
    var tim;

    var min = 1;
    var sec = 60;
    var f = new Date();
    function f1() {
        f2();
        document.getElementById("starttime").innerHTML = "Your started your Exam at " + f.getHours() + ":" + f.getMinutes();

        document.getElementById("endtime").innerHTML = "Your  time is :" + f.toLocaleTimeString();
    }
    function f2() {
        if (parseInt(sec) > 0) {
            sec = parseInt(sec) - 1;
            document.getElementById("showtime").innerHTML = "Your Left Time  is :" + min + " Minutes ," + sec + " Seconds";
            tim = setTimeout("f2()", 1000);
        }
        else {
            if (parseInt(sec) == 0) {
                min = parseInt(min) - 1;
                if (parseInt(min) == 0) {
                    clearTimeout(tim);
                    location.href = "../UI/login.aspx";
                }
                else {
                    sec = 60;
                    document.getElementById("showtime").innerHTML = "Your Left Time  is :" + min + " Minutes ," + sec + " Seconds";
                    tim = setTimeout("f2()", 1000);
                }
            }

        }
    }
    </script>

<script runat="server">
    int cnt = 0;
    String qtype = "";
    string uans=null, dbans=null;
    int rans = 0;
    static int hh, mm, ss;
    String txtSubject, txtEmail;
    String answer = "";

    static double TimeAllSecondes = 60;
    protected void Page_Load(object sender, EventArgs e)     
    {
        txtEmail = Session["emailID"].ToString();
        if (!ScriptManager1.IsInAsyncPostBack)
            Session["timeout"] = DateTime.Now.AddSeconds(10).ToString();
        if (!Page.IsPostBack)
            DisplayQuestion();
        
            //Session["timeout"] = DateTime.Now.AddSeconds(10).ToString();
            //Session["stime"] = System.DateTime.Now.ToShortTimeString();
            //Session["etime"] = DateTime.Now.AddMinutes(10).ToString();
    }
    int counter = 60;
   
    public void DisplayQuestion()
    {
       
        qtype = Session["qtype"].ToString();
       
        // get data from session object
        Examination e = (Examination)Session[qtype];
        // display data
    
        lblQno.Text = e.curpos + 1 + "/" + e.SIZE;
       // lblCtime.Text = DateTime.Now.ToString();
       // lblStime.Text = e.StartTime.ToString();
       // if (0 > DateTime.Compare(DateTime.Now,
        Question q = e.questions[e.curpos];
        // display details of question
        question.InnerHtml = q.question;
        ans1.InnerHtml = q.ans1;
        ans2.InnerHtml = q.ans2;
        ans3.InnerHtml = q.ans3;
        ans4.InnerHtml = q.ans4;
        lblSubject.Text = q.sname;
        Session["sname"] = q.sname;
        // reset all radio buttons
        rbAns1.Checked = false;
        rbAns2.Checked = false;
        rbAns3.Checked = false;
        rbAns4.Checked = false;

        // disable and enable buttons
        if (e.curpos == 0)
        {
             btnPrev.Enabled = false;
        }
        else
            btnPrev.Enabled = true;

        if (e.curpos == e.SIZE - 1)
        {
            //DisplayQuestion();

            btnNext.Text = "Finish";
        }

        else
            //int cnt = 0;

            btnNext.Text = "Next";
       
       // addQuestionInDb();

    }
    protected void Timer1_Tick(object sender, EventArgs e)
    {
        if (TimeAllSecondes > 0)
        {
            TimeAllSecondes = TimeAllSecondes - 1;
        }

        TimeSpan time_Span = TimeSpan.FromSeconds(TimeAllSecondes);
        hh = time_Span.Hours;
        mm = time_Span.Minutes;
        ss = time_Span.Seconds;

        Label2.Text = "  " + hh + ":" + mm + ":" + ss;
    }
    public void addQuestionInDb(String result, String resultNum, String remarks)
    {
        connection con = new connection();
        Examination exam = (Examination)Session[qtype];
       
        con.open_connection();
        string str = "insert into rubrics_result_table values('" + txtEmail + "','" + resultNum + "','" + remarks + "')";
        SqlCommand cmd = new SqlCommand(str, con.con_pass());
        cmd.ExecuteNonQuery();
        //int examid = (Int32)cmd.ExecuteScalar();
        //cmd.CommandText = "insert into exam1 values(@examid,@mid,@sname,@uans,@dbans,@stdate,getdate(),@username,@ttime,@rans)";
        //cmd.Parameters.Add("@examid", SqlDbType.Int).Value = examid;
        //cmd.Parameters.Add("@mid", SqlDbType.Int).Value = exam.mid;
        //cmd.Parameters.Add("@sname", SqlDbType.VarChar).Value = Session["sname"].ToString();
        //cmd.Parameters.Add("@uans", SqlDbType.VarChar).Value = uans;
        //cmd.Parameters.Add("@dbans", SqlDbType.VarChar).Value = dbans;
        //cmd.Parameters.Add("@stdate", SqlDbType.DateTime).Value = exam.StartTime;
        //cmd.Parameters.Add("@username", SqlDbType.VarChar).Value = Session["emailID"].ToString();
        //cmd.Parameters.Add("@ttime", SqlDbType.VarChar).Value =DateTime.Now.Second.ToString();
        //cmd.Parameters.Add("@rans", SqlDbType.Int).Value =rans;
        //cmd.ExecuteNonQuery();
        con.close_connection();  
    }
    public void ProcessQuestion()
    {
        //Response.Write("<p>" + answer + "</p>");
        qtype = Session["qtype"].ToString();
        Examination e = (Examination)Session[qtype];
        Question q = e.questions[e.curpos];
        Response.Write("<p>" + answer+"=====" + q.question + "#######"+ q.cans + "</p>");
        //connection con = new connection();
        //con.open_connection();
        //String strstr = "select * from Eassy order by qid";
        //SqlCommand cmd = new SqlCommand();
        String dans = answer;
        String uans = q.cans;
        //String dans = "Hyperlink";
        //String uans = "break";
        String result="";
        String resultNum = "";
        String remarks = "";
        int count=0;
        
        //if(dans.Length==4)
        //{
            //if(dans[0]==uans){
            
          //  }
        //}
        //else if(dans.Length==3)
        //{
           
        //}
        //else if (dans.Length == 2)
        //{

        //}
        //else if (dans.Length == 1)
        //{

        //}
        //else 
        //{
         //   result = "You got no marks";
       // }
        for (int i = 0; i < uans.Length;  i++)
        {
            for (int j = 0; j < dans.Length; j++ )
            {
                if (string.Equals(uans[i],dans[j]))
                {
                    count = count + 1;
                }
            }
        }
        
        
        if(uans.Length == 4)
        {
            //for (int k = uans.Length - 1; k >= 0; k--)
            //{
                //if (k+1 == count)
                //{
                    //if (k == 4)
                  //  {

                //    }
              //  }
            //}
            if(count == 4){
                result = "Fully Understood";
                resultNum = "40";
                remarks = "You got 4/4";
            }else if(count == 3){
                result = "Fully-1 Understood";
                resultNum = "30";
                remarks = "You got 3/4";
            }else if(count == 2){
                result = "Fully-2 Understood";
                resultNum = "20";
                remarks = "You got 2/4";
            }
            else if (count == 1)
            {
                result = "Fully-3 Understood";
                resultNum = "10";
                remarks = "You got 1/4";
            }
            else {
                result = "Didn't Understood";
                resultNum = "0";
                remarks = "You got 0/4";
            }
        }
        else if (uans.Length == 3)
        {
            if(count == 3){
                result = "Fully Understood";
                resultNum = "30";
                remarks = "You got 3/3";
            }else if(count == 2){
                result = "Fully-1 Understood";
                resultNum = "20";
                remarks = "You got 2/3";
            }
            else if (count == 1)
            {
                result = "Fully-2 Understood";
                resultNum = "10";
                remarks = "You got 1/3";
            }
            else {
                result = "Didn't Understood";
                resultNum = "0";
                remarks = "You got 0/3";
            }
        }
        else if (uans.Length == 2)
        {
            if(count == 2){
                result = "Fully Understood";
                resultNum = "20";
                remarks = "You got 2/2";
            }
            else if (count == 1)
            {
                result = "Fully-1 Understood";
                resultNum = "10";
                remarks = "You got 1/2";
            }
            else {
                result = "Didn't Understood";
                resultNum = "0";
                remarks = "You got 0/2";
            }
        }
        else if (uans.Length == 1)
        {
            if (count == 1)
            {
                result = "Fully Understood";
                resultNum = "10";
                remarks = "You got 1/1";
            }
            else
            {
                result = "Didn't Understood";
                resultNum = "0";
                remarks = "You got 0/1";
            }
        }
        

        
        
        //if(count == 0){
          //  result = "You got no write anser";
        //}
        //else if(uans.Length == count){
        
        //}else if(uans.Length > count){
        
       // }
        
       // if (string.Equals(dans, uans))
            //uans.Equals(dbans)
            
        //{
         //   result = "result is there"; // Flow is not going in here
        //}
        //else {
         //   result = "not result is there";
       // }
        Response.Write("<p>" + "RESULT = " + result + ", RESULT NUM = " + resultNum + ", REMARKS = " + remarks + "</p>");
        dispRes.InnerHtml = "<p>" + "RESULT : " + remarks + "</p>";
        addQuestionInDb(result,resultNum,remarks);
    }

    protected void btnNext_Click(object sender, EventArgs e)
    {
        try
        {


            //if (Session["etime"].Equals(Session["stime"]))
            //{
            //    Response.Redirect("ViewResult.aspx");
            //}
            qtype = Session["qtype"].ToString();
        }
        catch (Exception ex)
        {
            qtype = "questionsEasy";
            Session.Add("qtype", qtype);
            //  Session.Add("mytimer",);
        }
        Examination exam = (Examination)Session[qtype];
        if (exam.curpos == exam.SIZE - 1)
        {
            Response.Write("<script> alert('Examination Completed Click Tab to view Marks')</scrit>");
            Response.Redirect("ExamMenu.aspx");
        }
        if (rbAns1.Checked)
        {
            answer = answer + "1";
        }
        if (rbAns2.Checked)
        {
            answer = answer + "2";
        }
        if (rbAns3.Checked)
        {
            answer = answer + "3";
        }
        if (rbAns4.Checked)
        {
            answer = answer + "4";
        }
        
        ProcessQuestion();
        Session.Add(qtype, exam);
        try
        {
            exam.curpos++;
        }
        catch (Exception ex)
        {
            exam.curpos = 0;
        }
        DisplayQuestion();
    }

    

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        // Examination exam = (Examination)Session["questions"];
        Session.Remove("questions");
        //exam = null;
        Response.Redirect("../UI/login.aspx");
    }
    protected void GetTime(object sender, EventArgs e)
    {
        //lblTime.Text = DateTime.Now.ToString("mm:ss tt");
    }


    protected void btnPrev_Click(object sender, EventArgs e)
    {
        qtype = Session["qtype"].ToString();
        Examination exam = (Examination)Session[qtype];
        exam.curpos--;
            Session.Add("questions", exam);
            DisplayQuestion();

    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CheckBox Examination</title>
</head>
<body onload="f1()">
   
    <form id="form1" runat="server">
     <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js">
</script>
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
    <div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Label ID="Label1" runat="server" Text="TimeLeft:"></asp:Label>
                <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="Timer1"  />
            </Triggers>
        </asp:UpdatePanel>
        <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick"></asp:Timer>
    </div>
</td>
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
   1. <asp:CheckBox  ID="rbAns1" runat="server" />
    </td>
    <td style="width: 3px">
    <pre runat=server id="ans1"></pre>
    </td>
    </tr>
    
    <tr>
    <td>
    2. <asp:CheckBox  ID="rbAns2" runat="server" />
    </td>
    <td style="width: 3px">
    <pre runat=server id="ans2"></pre>
    </td>
    </tr>
    
    <tr>
    <td>
   3.  <asp:CheckBox  ID="rbAns3" runat="server" />
    </td>
    <td style="width: 3px">
    <pre runat=server id="ans3"></pre>
    </td>
    </tr>
    
    <tr>
    <td>
   4. <asp:CheckBox  ID="rbAns4" runat="server" />
    </td>
    <td style="width: 3px">
    <pre runat=server id="ans4"></pre>
    </td>
    </tr>
    
    </table>
        <br />
        <asp:Button ID="btnPrev" runat="server" Text="Previous" OnClick="btnPrev_Click" /><asp:Button ID="btnNext"
            runat="server" Text="Next" Width="75px" OnClick="btnNext_Click" />
        <asp:Button ID="btnCancel" runat="server" Text="Cancel Exam" Width="115px" OnClick="btnCancel_Click" />
        
    </form>
    <div id="dispRes" runat="server">
    </div>
</body>
</html>
