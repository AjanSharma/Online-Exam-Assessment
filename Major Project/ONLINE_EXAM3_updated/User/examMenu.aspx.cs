using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

public partial class examMenu : System.Web.UI.Page
{
    connection con = new connection();
    string tvar = null;
    string var = "Solved";
    string var2 = "Random";
    string tmarks = null, esub = null;
    string status = "True";
    protected void Page_Load(object sender, EventArgs e)
    {
        
       
    }
    protected void btnTest_Click1(object sender, EventArgs e)
    {
        string dbnameEasy = "Eassy";
        
        Session["qtype"] = "questionsEasy";
        Examination examEasy = new Examination(Int32.Parse(Session["mid"].ToString()));
        examEasy.GetQuestions(dbnameEasy, Session["temail"].ToString(), status);
        Session.Add("questionsEasy", examEasy);
        Response.Redirect("examination.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Session["qtype"] = "questionsMedium";
        string dbnameMedium = "medium";
        Examination examMedium = new Examination(Int32.Parse(Session["mid"].ToString()));
        examMedium.GetQuestions(dbnameMedium, Session["temail"].ToString(), status);
        Session.Add("questionsMedium", examMedium);
        Response.Redirect("examination.aspx");
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        string dbnameHard = "hard";

       // btnTest.Visible = true;
        Session["qtype"] = "questionsHard";

        Examination examHard = new Examination(Int32.Parse(Session["mid"].ToString()));
        examHard.GetQuestions(dbnameHard, Session["temail"].ToString(), status);
        Session.Add("questionsHard", examHard);
        Response.Redirect("examination.aspx");
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        string dbnameEasy = "Eassy";

        Session["qtype"] = "questionsEasy";
        Examination examEasy = new Examination(Int32.Parse(Session["mid"].ToString()));
        examEasy.GetQuestions(dbnameEasy, Session["temail"].ToString(), status);
        Session.Add("questionsEasy", examEasy);
        Response.Redirect("checkBoxExamination.aspx");
    }
}