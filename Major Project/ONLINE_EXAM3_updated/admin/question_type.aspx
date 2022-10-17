<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="question_type.aspx.cs" Inherits="question_type" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
<center>
<h1>Select Question Type</h1>

<table>
<tr>
<td>
    <asp:Label ID="Label9" runat="server" ForeColor="Black" Text="Select Question Type :"></asp:Label>

</td>
<td>
<asp:UpdatePanel ID="qmas" runat="server">
<ContentTemplate>
<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
        onselectedindexchanged="DropDownList1_SelectedIndexChanged">
         <asp:ListItem Text="Select Type" Value="Select Type"></asp:ListItem>
    <asp:ListItem Text="Eassy" Value="Eassy"></asp:ListItem>
    </asp:DropDownList>
</ContentTemplate>

</asp:UpdatePanel>
    


</td>
</tr>
</table>
</center>

</asp:Content>

