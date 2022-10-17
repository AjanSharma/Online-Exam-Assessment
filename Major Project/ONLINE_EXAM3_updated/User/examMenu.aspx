<%@ Page Title="" Language="C#" MasterPageFile="~/User/Student.master" AutoEventWireup="true" CodeFile="examMenu.aspx.cs" Inherits="examMenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <center>
  <marquee onmouseover="stop();" onmouseout="start();" ><center><h1 style="color:red;margin-top:auto;">Reload To Start Test</h1></center></marquee>
      <fieldset>
      <legend style="color:Black;">User Select Exam</legend>
      
      
     
       <table>
       
       <tr>
      
       <td> 
           <asp:Button ID="btnTest" runat="server" Text="Eassy Start Exam" Height="41px" 
            Width="150px"  Visible="true" onclick="btnTest_Click1" /></td>
      
       
       </tr>
     <%--   <tr>
       
       <td> 
           <asp:Button ID="Button2" runat="server" Text=" Medium Start Exam" Height="41px" 
            Width="150px" onclick="Button2_Click" /></td>
      
       
       </tr>
       <tr>
       
       <td> 
           <asp:Button ID="Button4" runat="server" Text="Hard Start Exam" Height="41px" 
            Width="150px" onclick="Button4_Click" /></td>
      
       
       </tr> --%>
       <tr>
       
       <td> 
           <asp:Button ID="Button5" runat="server" Text="CheckBox Exam" Height="41px" 
            Width="150px" onclick="Button5_Click" /></td>
      
       
       </tr>
       
       
       
        </fieldset> 
       </table>
       
       
       
       
       
       </center>

</asp:Content>

