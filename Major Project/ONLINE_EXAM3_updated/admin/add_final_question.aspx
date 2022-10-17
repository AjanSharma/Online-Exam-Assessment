<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="add_final_question.aspx.cs" Inherits="add_practise_question" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
<center>
<h1><u>Admin Add Final Question</u> </h1>


<table>
<tr>
<td>
    <asp:Label ID="Label9" runat="server" ForeColor="Black" Text=" Select Level : "></asp:Label></td>
    <td>
    
        <asp:DropDownList ID="cmb_level" runat="server">
        <asp:ListItem Text="Level 1" Value="1" ></asp:ListItem>
        <asp:ListItem Text="Level 2" Value="2" ></asp:ListItem>
        <asp:ListItem Text="Level 3" Value="3" ></asp:ListItem>
        <asp:ListItem Text="Level 4" Value="4" ></asp:ListItem>
        <asp:ListItem Text="Level 5" Value="5" ></asp:ListItem>
        </asp:DropDownList>
    
    </td>

</tr>

<tr>
<td align="right">
    <asp:Label ID="Label1" runat="server" Text="Question ID :" ForeColor="Black"></asp:Label></td>
<td class="style1">
    <asp:TextBox ID="txtQID" runat="server"></asp:TextBox></td>

</tr>
<tr>
<td align="right"> <asp:Label ID="Label2" runat="server" Text="Question :" ForeColor="Black"></asp:Label></td>
<td class="style1">
    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>

</tr>
<tr>
<td align="right"> <asp:Label ID="Label3" runat="server" Text="Option 1  :" ForeColor="Black" ></asp:Label></td>
<td class="style1">
    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></td>

</tr>
<tr>
<td align="right"> <asp:Label ID="Label4" runat="server" Text="Option 2 :" ForeColor="Black"> </asp:Label></td>
<td class="style1">
    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox></td>

</tr>
<tr>
<td align="right"> <asp:Label ID="Label5" runat="server" Text="Option 3 :" ForeColor="Black"></asp:Label></td>
<td class="style1">
    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox></td>

</tr>
<tr>
<td align="right"> <asp:Label ID="Label6" runat="server" Text="Option 4 :" ForeColor="Black"></asp:Label></td>
<td class="style1">
    <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox></td>

</tr>

<tr>
<td align="right"> <asp:Label ID="Label7" runat="server" Text="Answer :" ForeColor="Black"></asp:Label></td>
<td class="style1">
    <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox></td>

</tr>

<tr>
<td align="right"> <asp:Label ID="Label8" runat="server" Text="Subject Name:" ForeColor="Black"></asp:Label></td>
<td class="style1">

    <asp:TextBox ID="txtSubject" runat="server"></asp:TextBox></td>

</tr>
<tr>
<td colspan="2" align="center">
    <asp:Button ID="Button1" runat="server" Text="Register Question" 
        onclick="Button1_Click1" Height="30px" Width="220px" 
       /></td>


</tr></table></center>
</asp:Content>

