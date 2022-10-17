<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
    int cnt = 0;
    String qtype = "";
    string uans=null, dbans=null;
    int rans = 0;
    protected void Page_Load(object sender, EventArgs e)
        
    {
        if (!Page.IsPostBack)
            DisplayQuestion();
           
    }
    int counter = 60;
    public void DisplayQuestion()
    {
       
            qtype = Session["qtype"].ToString();
       
        // get data from session object
        Examination e = (Examination)Session[qtype];
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
        Session["sname"] = q.sname;
        // reset all radio buttons
        rbAns1.Checked = false;
        rbAns2.Checked = false;
        rbAns3.Checked = false;
        rbAns4.Checked = false;

        // disable and enable buttons
        //if (e.curpos == 0)
        //{
        //     btnPrev.Enabled = false;
        //}
        //else
        //    btnPrev.Enabled = true;

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
    public void addQuestionInDb()
    {
        connection con = new connection();
        Examination exam = (Examination)Session[qtype];
       
        con.open_connection();
        SqlCommand cmd = new SqlCommand("select isnull( max(examid),0) + 1 from exam1", con.con_pass());
        int examid = (Int32)cmd.ExecuteScalar();
        cmd.CommandText = "insert into exam1 values(@examid,@mid,@sname,@uans,@dbans,@stdate,getdate(),@username,@ttime,@rans)";
        cmd.Parameters.Add("@examid", SqlDbType.Int).Value = examid;
        cmd.Parameters.Add("@mid", SqlDbType.Int).Value = exam.mid;
        cmd.Parameters.Add("@sname", SqlDbType.VarChar).Value = Session["sname"].ToString();
        cmd.Parameters.Add("@uans", SqlDbType.VarChar).Value = uans;
        cmd.Parameters.Add("@dbans", SqlDbType.VarChar).Value = dbans;
        cmd.Parameters.Add("@stdate", SqlDbType.DateTime).Value = exam.StartTime;
        cmd.Parameters.Add("@username", SqlDbType.VarChar).Value = Session["emailID"].ToString();
        cmd.Parameters.Add("@ttime", SqlDbType.VarChar).Value =DateTime.Now.Second.ToString();
        cmd.Parameters.Add("@rans", SqlDbType.Int).Value =rans;
        cmd.ExecuteNonQuery();
        con.close_connection();  
    }
    public void ProcessQuestion()
    {
        Examination exam = (Examination)Session[qtype];
        Question q = exam.questions[exam.curpos];
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
        
        Session.Add(qtype, exam);
    }

    protected void btnNext_Click(object sender, EventArgs e)
    {
        try
        {
            qtype = Session["qtype"].ToString();
        }
        catch (Exception ex)
        {
            qtype = "questionsEasy";
            Session.Add("qtype", qtype);
        }
       
        Examination exam = (Examination)Session[qtype];
        if (exam.curpos == exam.SIZE - 1)
        {
            Response.Redirect("examMenu.aspx");
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
            
            
            Session.Add(qtype, exam);
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
        Response.Redirect("../UI/default.aspx");
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
