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
    String qlebel = "";
    string uans=null, dbans=null;
    int rans = 0;
    static int hh, mm, ss;

    static double TimeAllSecondes = 120;
    protected void Page_Load(object sender, EventArgs e)
        
    {
        if (!Page.IsPostBack)
            DisplayQuestion();
           
    }
    int counter = 60;
    public void DisplayQuestion()
    {
        try {
            qlebel = Session["qlebel"].ToString();
        }catch(Exception ex){
            qlebel = "examlabel1";
        }
      
        
        // get data from session object
        Final_Examination e = (Final_Examination)Session[qlebel];
        // display data
    
        lblQno.Text = e.curpos + 1 + "/" + e.SIZE;
      //  lblCtime.Text = DateTime.Now.ToString();
      //  lblStime.Text = e.StartTime.ToString();

        Final_Question q = e.questions[e.curpos];
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
            DisplayQuestion();

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
    public void addQuestionInDb()
    {
        connection con = new connection();
        Final_Examination exam = (Final_Examination)Session[qlebel];
       
        con.open_connection();
        SqlCommand cmd = new SqlCommand("select isnull( max(examid),0) + 1 from exam1", con.con_pass());
        int examid = (Int32)cmd.ExecuteScalar();
        cmd.CommandText = "insert into Final_Test_Answer values(@examid,@mid,@sname,@uans,@dbans,@stdate,getdate(),@username,@ttime,@rans)";
        cmd.Parameters.Add("@examid", SqlDbType.Int).Value = examid;
        cmd.Parameters.Add("@mid", SqlDbType.Int).Value = exam.mid;
        cmd.Parameters.Add("@sname", SqlDbType.VarChar).Value = Session["sname"].ToString();
        cmd.Parameters.Add("@uans", SqlDbType.VarChar).Value = uans;
        cmd.Parameters.Add("@dbans", SqlDbType.VarChar).Value = dbans;
        cmd.Parameters.Add("@stdate", SqlDbType.DateTime).Value = exam.StartTime;
        cmd.Parameters.Add("@username", SqlDbType.VarChar).Value = Session["emailID"].ToString();
        cmd.Parameters.Add("@ttime", SqlDbType.VarChar).Value =DateTime.Now.Second.ToString();
        cmd.Parameters.Add("@rans", SqlDbType.Int).Value = rans;
        cmd.ExecuteNonQuery();
        con.close_connection();  
    }
    public void ProcessQuestion()
    {
        Final_Examination exam = (Final_Examination)Session[qlebel];
        Final_Question q = exam.questions[exam.curpos];
       //q.
        String answer;
        // find out the answer and assign it to 
     // rbAns1.Text
        if (rbAns1.Checked)
                 answer = "1";
        else if (rbAns2.Checked)
                answer = "2";
        else if (rbAns3.Checked)
                    answer = "3";
        else if (rbAns4.Checked)
                  answer = "4";
                else
                   answer = "0";  // error
      //  q.answer = answer;
         uans = answer;
         dbans = q.cans;
        String value = "0";
        //addQuestionInDb();
        if (uans.Equals(dbans))
        {
            // Session["total_correct"] = 0;
            rans = 1;
            addQuestionInDb();
            try
            {
                value = Session["total_correct"].ToString();
                if (value == null)
                {
                    value = "0";
                }
            }
            catch (Exception ex)
            {


            }

            Session["total_correct"] = Convert.ToInt32(value) + 1;

            Response.Write("Total Marks " + Session["total_correct"]);
        }
        else {
            try
            {
                addQuestionInDb();
                value = Session["total_correct"].ToString();
                if (value == null)
                {
                    value = "0";
                }
            }
            catch (Exception ex)
            {


            }

          
            try
            {
                Session["total_correct"] = Convert.ToInt32(value) - 1;
                Response.Write("Total Marks " + Session["total_correct"]);
            }
            catch(Exception ex)
            {
                Session["total_correct"] ="0";
                Response.Write("Total Marks " + Session["total_correct"] );
            
            }
        }
        exam.questions[exam.curpos] = q;
        
        

        //Response.Write("Answer= " + q.answer);
        
        Session.Add(qlebel, exam);
    }

    protected void btnNext_Click(object sender, EventArgs e)
    {
        try
        {
            qlebel = Session["qlebel"].ToString();
        }
        catch (Exception ex)
        {
            qlebel = "examlabel1";
            Session.Add("qlebel", qlebel);
        }
       
        Final_Examination exam = (Final_Examination)Session[qlebel];
        if (exam.curpos == exam.SIZE - 1)
        {
            Response.Write("<script> alert('Examination Completed Click Tab to view Marks')</scrit>");
            Response.Redirect("ExamMenu.aspx");
            //Response.Redirect("FinalResult.aspx");
        }
        else
        {
            
           // if (exam.curpos !=0)

                
            ProcessQuestion();
            String value = "0";
            try
            {
                value = Session["total_correct"].ToString();
                if (value == null)
                {
                    value = "0";
                }
            }
            catch (Exception exc)
            {


            }
            int total_correct = Convert.ToInt32(value);
            if (total_correct ==1) 
            {
                qlebel = "examlabel2";
               // qtype = "questionsEasy";
                Session.Add("qlebel", qlebel);
                Response.Write("Now switching qtype 2");
                exam = (Final_Examination)Session[qlebel];
            }
            else if (total_correct == 2)
            {
                qlebel = "examlabel3";
                Session.Add("qlebel", qlebel);
                // Session["total_correct" + qtype] = Convert.ToInt32(value);
                Response.Write("Now switching qtype 3");
                exam = (Final_Examination)Session[qlebel];
            }
            else if (total_correct == 3)
            {
                qlebel = "examlabel4";
                Session.Add("qlebel", qlebel);
                // Session["total_correct" + qtype] = Convert.ToInt32(value);
                Response.Write("Now switching qtype 4");
                exam = (Final_Examination)Session[qlebel];
            }
            else if (total_correct == 4)
            {
                qlebel = "examlabel5";
                Session.Add("qlebel", qlebel);
                // Session["total_correct" + qtype] = Convert.ToInt32(value);
                Response.Write("Now switching qtype 5");
                exam = (Final_Examination)Session[qlebel];
            }
            else 
            {
                qlebel = "examlabel1";
                Session.Add("qlebel", qlebel);
                // Session["total_correct" + qtype] = Convert.ToInt32(value);
                Response.Write("Level 1");
                
                exam = (Final_Examination)Session[qlebel];
            }
            Session.Add(qlebel, exam);
            try
            {
                exam.curpos++;
            }
            catch (Exception ex)
            {
                exam.curpos=0;
            }
            DisplayQuestion();

        }
    }

    //protected void btnPrev_Click(object sender, EventArgs e)
    //{
    //    // ProcessQuestion();
    //    Examination exam = (Examination)Session["questions"];
    //    exam.curpos--;
    //    Session.Add("questions", exam);
    //    DisplayQuestion();
    //}

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        // Examination exam = (Examination)Session["questions"];
        Session.Remove("questions");
        //exam = null;
        Response.Redirect("../UI/Default.aspx");
    }


    protected void btnPrev_Click(object sender, EventArgs e)
    {
        Final_Examination exam = (Final_Examination)Session[qlebel];
        exam.curpos--;
        Session.Add("questions", exam);
        DisplayQuestion();

    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Examination</title>
</head>
<body onload="f1()">
    <form id="form1" runat="server">
    <h2>Examination</h2>
    <table width="100%" bgcolor="#dddddd">
    <tr>
    <td>
        Subject :
        <asp:Label ID="lblSubject" runat="server" Width="154px" Font-Bold="True" Font-Names="Verdana" ForeColor="Red"></asp:Label></td>
    <td>
        Level :
        <asp:Label ID="lblQno" runat="server" Font-Bold="True" Font-Names="Verdana" ForeColor="Red"></asp:Label></td>
    </tr>
    <tr>
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
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
   3.  <asp:RadioButton ID="rbAns3" runat="server" GroupName="answer" />
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
        <br />
        <asp:Button ID="btnPrev" runat="server" Text="Previous" OnClick="btnPrev_Click" /><asp:Button ID="btnNext"
            runat="server" Text="Next" Width="75px" OnClick="btnNext_Click" />
        <asp:Button ID="btnCancel" runat="server" Text="Cancel Exam" Width="115px" OnClick="btnCancel_Click" />
        
    </form>
</body>
</html>
