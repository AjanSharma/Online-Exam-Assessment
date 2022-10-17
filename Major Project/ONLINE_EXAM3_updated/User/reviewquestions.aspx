<%@ Page Language="C#" MasterPageFile="~/User/Student.master" Title="Untitled Page" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        Examination exam = (Examination)Session["questions"];
        DataList1.DataSource = exam.questions;
        DataList1.DataBind();
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DataList ID="DataList1" runat="server" Width="100%">
    <HeaderTemplate>
     <a href="showresult.aspx">Show Result</a>
     <h2>Review Questions</h2>
     <hr size=5 style="color:red" />
    </HeaderTemplate>
    
    <ItemTemplate>
    <pre style="color:Red;background-color:#eeeeee"><%# DataBinder.Eval( Container.DataItem,"QuestionText")%></pre>
    <pre style="color:Black;background-color:White">1.<%# DataBinder.Eval( Container.DataItem,"Answer1") %></pre>
    <pre style="color:Black;background-color:White">2.<%# DataBinder.Eval( Container.DataItem,"Answer2") %></pre>
    <pre style="color:Black;background-color:White">3.<%# DataBinder.Eval( Container.DataItem,"Answer3") %></pre>
    <pre style="color:Black;background-color:White">4.<%# DataBinder.Eval( Container.DataItem,"Answer4") %></pre>
    <pre style="color:Red;background-color:White">Correct Answer :<%# DataBinder.Eval( Container.DataItem,"CorrectAnswer") %></pre>
    <pre style="color:Red;background-color:White">Your Answer    :<%# DataBinder.Eval( Container.DataItem,"YourAnswer") %></pre>
    </ItemTemplate>
    
     <SeparatorTemplate>
     <hr size="2" style="color:Red" />
    </SeparatorTemplate>
    
    
    
    <FooterTemplate>
      <hr size=5 style="color:red" />
      <a href="showresult.aspx">Show Result</a>
    </FooterTemplate>
    </asp:DataList>
</asp:Content>

