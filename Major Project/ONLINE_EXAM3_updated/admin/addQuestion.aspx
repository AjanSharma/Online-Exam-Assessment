<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="addQuestion.aspx.cs" Inherits="addQuestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 263px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <center>
    <h1>Admin Add Question Details</h1>
<table>


<tr>
<td>

    <asp:Label ID="Label9" runat="server" ForeColor="Black" Text="Select Exam Type :"></asp:Label>
</td>
<td style="color:Black; text-align:center;">
<asp:UpdatePanel ID="examType" runat="server">
<ContentTemplate>
 <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
        onselectedindexchanged="DropDownList1_SelectedIndexChanged1">
     <asp:ListItem Text="Select Exam Type" Value="Select Exam Type"></asp:ListItem>
    <asp:ListItem Text=" Practise Test" Value="Practise"></asp:ListItem>
    
    </asp:DropDownList>

</ContentTemplate>

</asp:UpdatePanel>
   

</td>

</tr>







</table>




</center>
</asp:Content>

