<%@ Page Title="" Language="C#" MasterPageFile="~/User/Student.master" AutoEventWireup="true" CodeFile="final_test.aspx.cs" Inherits="final_test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<center>
<fieldset>
<legend style="color:Black;"> Final Exam</legend>


    <%--<asp:Button ID="btnNoti" runat="server" Text="Send Notification" Height="50px" 
        Width="229px" onclick="Button2_Click" /><br />--%>
    
<asp:Button ID="btnFinal" runat="server" Text="Start Exam" Height="50px" 
    onclick="Button1_Click" Width="229px" />

</fieldset>



</center>
    
</asp:Content>

