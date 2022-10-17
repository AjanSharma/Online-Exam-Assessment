<%@ Page Title="" Language="C#" MasterPageFile="~/User/Student.master" AutoEventWireup="true" CodeFile="saveotp.aspx.cs" Inherits="User_saveotp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
<h1>Enter OTP to Navigate Your Exam</h1>
<table>
<tr>
<td>
    <asp:Label ID="Label1" runat="server" Text="Enter OTP :" ForeColor="Black"></asp:Label></td>

    <td>
        <asp:TextBox ID="txtotp" runat="server" Height="30" Width=""></asp:TextBox></td>
<td>
    <asp:Button ID="Button1" runat="server" Text="Go to Profile" 
        onclick="Button1_Click" />
</td>
</tr>




</table>



</center>



</asp:Content>

