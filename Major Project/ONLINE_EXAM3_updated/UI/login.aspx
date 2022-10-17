<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Home.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<center>
<h3><u>Login To Your Account</u></h3>
    

<table style="width:300px">
     <tr><td height="20" align="center" colspan="2"><asp:Label ID="Label1" ForeColor ="red" runat="server" Text="" Visible ="false"></asp:Label></td></tr> 
     <tr>
     <td align="right" >
         <asp:Label ID="Label2" runat="server" Text="User Name :" ForeColor="Black"></asp:Label></td>
     <td height="25" style="width: 192px">&nbsp;<asp:TextBox 
             ID="txt_id" runat="server" Style="position: static" TabIndex="1" Width="175px" 
             Height="30px" placeholder="Email ID"/>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_id" ErrorMessage="*"></asp:RequiredFieldValidator></td></tr>    
    <tr>
    <td align="right">
        <asp:Label ID="Label3" runat="server" Text="Password :" ForeColor="Black"></asp:Label></td>
    
    <td height="25" style="width: 192px"> &nbsp;<asp:TextBox 
            ID="txt_pwd" runat="server" TextMode="Password" TabIndex="2" Width="175px" 
            Height="30px" placeholder="Password"/>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_pwd" ErrorMessage="*"></asp:RequiredFieldValidator></td></tr>
       <tr>
      <td align="right">
           <asp:Label ID="Label4" runat="server" Text="User Type :" ForeColor="Black"></asp:Label>
      </td>
       <td align="justify">
           &nbsp;<asp:DropDownList ID="DropDownList1" runat="server" Height="30px" Width="181px">
           <asp:ListItem Text="Teacher" Value="Teacher"></asp:ListItem>
            
             <asp:ListItem Text="Student" Value="Student"></asp:ListItem>

           </asp:DropDownList>
        
        </td>
       
       </tr> 
    <tr><td align="center" height="25" colspan="2">
        <asp:Button ID="Button2" 
            runat="server" 
            Style="position: relative; top: 0px; left: -20px; width: 175px; height: 40px;" 
            Text="Log In"  TabIndex="5" 
            CssClass="bttn" onclick="Button2_Click" /></td></tr>
            <tr><td><asp:HyperLink ID="HyperLink10" runat="server" NavigateUrl ="~/UI/register.aspx">Register</asp:HyperLink></td>
            <td><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl ="~/UI/teacher_register.aspx">Teacher Register</asp:HyperLink></td>
            
            
            </tr>
    </table>
    
 
    </center>
</asp:Content>

