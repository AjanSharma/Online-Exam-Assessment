<%@ Page Language="C#" MasterPageFile="~/User/Student.master" Title="Untitled Page" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>

<script runat="server">

    protected void btnStart_Click(object sender, EventArgs e)
    {
        connection con = new connection();
        // 
        String sid,sname;

         
        
        Examination exam = new Examination(Int32.Parse(Session["mid"].ToString()));
       // Examination exam = new Examination();
        exam.GetQuestions("","","");
        Session.Add("questions", exam);
        
        //Session["sid"] = ddlSubjects.Text;

       
        Response.Redirect("examination.aspx");
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <center> <h2>
        Take Examination</h2>
    Select Subject :
    <%--<asp:DropDownList ID="ddlSubjects" runat="server" DataSourceID="SqlDataSource1" DataTextField="sname"
        DataValueField="sid" Width="163px">
    </asp:DropDownList>--%><br />
    <br />
    <asp:Button ID="btnStart" runat="server" Text="Start Exam" OnClick="btnStart_Click" /><br />
    <p/>
   <%-- <b>Note</b>--%>
    <%--<ul>
    <li>Each exam contains 5 question.</li><li>Use Next and Previous buttons to navigate between questions</li><li>Result is displayed after the last questions is answered</li><li>CANCEL button can be used to cancel the exam</li><li>No time limitation. However the time taken is stored in database</li></ul>
    --%>
    <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:APIIT %>"
        SelectCommand="SELECT [sid], [sname] FROM [subjects]"></asp:SqlDataSource>--%></center>
</asp:Content>

